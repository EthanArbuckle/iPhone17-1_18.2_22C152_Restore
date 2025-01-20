@interface IDSUTunTimingLogger
+ (id)incomingEventWithTimestamp:(double)a3 duration:(double)a4 processTime:(double)a5 compressionTime:(double)a6 kernelTime:(double)a7 bytes:(int64_t)a8;
+ (id)kernelTestEventWithTimestamp:(double)a3 kernelTime:(double)a4 bytes:(int64_t)a5;
+ (id)outgoingEventWithTimestamp:(double)a3 duration:(double)a4 processTime:(double)a5 compressionTime:(double)a6 sendTime:(double)a7 bytes:(int64_t)a8;
- (IDSUTunTimingLogger)init;
- (void)addEvent:(id)a3;
- (void)printCurrent;
@end

@implementation IDSUTunTimingLogger

- (IDSUTunTimingLogger)init
{
  v9.receiver = self;
  v9.super_class = (Class)IDSUTunTimingLogger;
  v2 = [(IDSUTunTimingLogger *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ids.utuntiminglogger", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    timingEvents = v2->_timingEvents;
    v2->_timingEvents = v6;
  }
  return v2;
}

+ (id)outgoingEventWithTimestamp:(double)a3 duration:(double)a4 processTime:(double)a5 compressionTime:(double)a6 sendTime:(double)a7 bytes:(int64_t)a8
{
  v8 = [[IDSUTunTimingEventOutgoing alloc] initWithTimestamp:a8 duration:a3 processTime:a4 compressionTime:a5 sendTime:a6 bytes:a7];

  return v8;
}

+ (id)incomingEventWithTimestamp:(double)a3 duration:(double)a4 processTime:(double)a5 compressionTime:(double)a6 kernelTime:(double)a7 bytes:(int64_t)a8
{
  v8 = [[IDSUTunTimingEventIncoming alloc] initWithTimestamp:a8 duration:a3 processTime:a4 compressionTime:a5 kernelTime:a6 bytes:a7];

  return v8;
}

+ (id)kernelTestEventWithTimestamp:(double)a3 kernelTime:(double)a4 bytes:(int64_t)a5
{
  v5 = [[IDSUTunTimingEventKernelTest alloc] initWithTimestamp:a5 kernelTime:a3 bytes:a4];

  return v5;
}

- (void)addEvent:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (![(NSMutableArray *)self->_timingEvents count])
    {
      if (qword_100A4C8A8 != -1) {
        dispatch_once(&qword_100A4C8A8, &stru_10098A438);
      }
      self->_lastPrintTime = *(double *)&qword_100A4C830 * (double)mach_continuous_time();
    }
    [(NSMutableArray *)self->_timingEvents addObject:v5];
    if (qword_100A4C8A8 != -1) {
      dispatch_once(&qword_100A4C8A8, &stru_10098A438);
    }
    double v4 = *(double *)&qword_100A4C830 * (double)mach_continuous_time();
    if (v4 - self->_lastPrintTime > 1.0)
    {
      self->_lastPrintTime = v4;
      [(IDSUTunTimingLogger *)self printCurrent];
    }
  }
}

- (void)printCurrent
{
  v3 = self->_timingEvents;
  double v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  timingEvents = self->_timingEvents;
  self->_timingEvents = v4;

  uint64_t v6 = mach_continuous_time();
  id v7 = [objc_alloc((Class)NSMutableString) initWithCapacity:5000];
  [v7 appendFormat:@"                [  timestamp  ]        total-time   processing-time  compression-only            kernel             bytes \n"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = v3;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "appendToString:", v7, (void)v15);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v10);
  }

  v13 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = mach_continuous_time();
    *(_DWORD *)buf = 134218242;
    double v20 = *(double *)&qword_100A4C830 * (double)(v14 - v6);
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Timing events: (%0.9f to generate)\n%@", buf, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingEvents, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end