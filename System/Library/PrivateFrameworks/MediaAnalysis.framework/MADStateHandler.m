@interface MADStateHandler
+ (id)sharedStateHandler;
- (MADStateHandler)init;
- (unint64_t)currentTimeoutRiskAndStartTime:(id *)a3;
- (void)addBreadcrumb:(id)a3;
- (void)dumpBreadcrumps;
- (void)enterKnownTimeoutRisk:(unint64_t)a3;
- (void)exitKnownTimeoutRisk;
@end

@implementation MADStateHandler

- (MADStateHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)MADStateHandler;
  v2 = [(MADStateHandler *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysis.MADStateHandler", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    breadcrumbs = v2->_breadcrumbs;
    v2->_breadcrumbs = v5;

    timeoutRiskEntryTime = v2->_timeoutRiskEntryTime;
    v2->_knownRiskState = 0;
    v2->_timeoutRiskEntryTime = 0;
  }
  return v2;
}

+ (id)sharedStateHandler
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016414C;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_1002528E8 != -1) {
    dispatch_once(&qword_1002528E8, block);
  }
  v2 = (void *)qword_1002528E0;
  return v2;
}

- (void)addBreadcrumb:(id)a3
{
  v16[1] = (__uint64_t)&v17;
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v17];

  v16[0] = 0;
  pthread_threadid_np(0, v16);
  v6 = +[NSDate now];
  if (qword_1002528F0 != -1) {
    dispatch_once(&qword_1002528F0, &stru_10021F0D0);
  }
  v7 = [(id)qword_1002528F8 stringFromDate:v6];
  __uint64_t v8 = v16[0];
  qos_class_t v9 = qos_class_self();
  v10 = VCPMAQoSDescription(v9);
  v11 = +[NSString stringWithFormat:@"%@: Thread 0x%-8llx QoS %@ %@", v7, v8, v10, v5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100164314;
  block[3] = &unk_100219D00;
  block[4] = self;
  id v15 = v11;
  id v13 = v11;
  dispatch_sync(queue, block);
}

- (void)dumpBreadcrumps
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001643E4;
  block[3] = &unk_10021C738;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)enterKnownTimeoutRisk:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10016463C;
  v4[3] = &unk_10021EC80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)exitKnownTimeoutRisk
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100164704;
  block[3] = &unk_10021C738;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (unint64_t)currentTimeoutRiskAndStartTime:(id *)a3
{
  uint64_t v7 = 0;
  __uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001647CC;
  block[3] = &unk_10021F0B0;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutRiskEntryTime, 0);
  objc_storeStrong((id *)&self->_breadcrumbs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end