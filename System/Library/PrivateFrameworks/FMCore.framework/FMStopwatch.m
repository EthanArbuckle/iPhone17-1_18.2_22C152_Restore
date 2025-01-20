@interface FMStopwatch
+ (id)illegalLabelCharacterSet;
+ (id)stopwatchWithLabel:(id)a3;
+ (void)dumpBuffer:(id)a3;
+ (void)eventWithLabel:(id)a3;
+ (void)eventWithLabel:(id)a3 comment:(id)a4;
+ (void)initialize;
- (FMStopwatch)initWithLabel:(id)a3;
- (NSString)comment;
- (NSString)label;
- (id)description;
- (id)descriptionAsData;
- (unint64_t)endTime;
- (unint64_t)startTime;
- (void)setComment:(id)a3;
- (void)setEndTime:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)stop;
- (void)stopWithComment:(id)a3;
@end

@implementation FMStopwatch

+ (void)initialize
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_DEBUG, "Creating PerfMon buffer", v1, 2u);
}

+ (id)stopwatchWithLabel:(id)a3
{
  if (_stopwatchEnabled)
  {
    id v3 = a3;
    v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLabel:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (void)eventWithLabel:(id)a3 comment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_stopwatchEnabled)
  {
    v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLabel:v5];
    objc_msgSend(v7, "setEndTime:", objc_msgSend(v7, "startTime"));
    if ([v6 length])
    {
      v8 = (void *)[[NSString alloc] initWithFormat:v6 arguments:&v10];
      [v7 setComment:v8];
    }
    id v9 = (id)buffer;
    objc_sync_enter(v9);
    [(id)buffer addObject:v7];
    objc_sync_exit(v9);
  }
}

+ (void)eventWithLabel:(id)a3
{
}

+ (void)dumpBuffer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)buffer, "count", a3))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v5 setDateFormat:@"yyyyMMddHHmmss"];
    id v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
    [v5 setTimeZone:v6];

    v7 = NSString;
    uint64_t v8 = dumpDirectory;
    id v9 = [v5 stringFromDate:v4];
    uint64_t v10 = [v7 stringWithFormat:@"%@/.%@.perftemp", v8, v9];

    v11 = NSString;
    uint64_t v12 = dumpDirectory;
    v22 = (void *)v4;
    v13 = [v5 stringFromDate:v4];
    v14 = [v11 stringWithFormat:@"%@/%@.perf", v12, v13];

    [v3 createDirectoryAtPath:dumpDirectory withIntermediateDirectories:1 attributes:0 error:0];
    [v3 createFileAtPath:v10 contents:0 attributes:0];
    v15 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v10];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = (id)buffer;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v23 + 1) + 8 * v20) descriptionAsData];
          [v15 writeData:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v18);
    }

    [v15 closeFile];
    [v3 linkItemAtPath:v10 toPath:v14 error:0];
    [v3 removeItemAtPath:v10 error:0];
    [(id)buffer removeAllObjects];
  }
}

+ (id)illegalLabelCharacterSet
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!illegalLabelCharacterSet_illegalLabelCharacterSet)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@", "];
    uint64_t v4 = (void *)illegalLabelCharacterSet_illegalLabelCharacterSet;
    illegalLabelCharacterSet_illegalLabelCharacterSet = v3;
  }
  objc_sync_exit(v2);

  id v5 = (void *)illegalLabelCharacterSet_illegalLabelCharacterSet;
  return v5;
}

- (FMStopwatch)initWithLabel:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMStopwatch;
  id v6 = [(FMStopwatch *)&v11 init];
  if (v6)
  {
    v7 = +[FMStopwatch illegalLabelCharacterSet];
    [v5 rangeOfCharacterFromSet:v7];
    uint64_t v9 = v8;

    if (v9)
    {

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Illegal character in label: [%@]", v5 format];
      id v6 = 0;
    }
    [(FMStopwatch *)v6 setLabel:v5];
    objc_storeStrong((id *)&v6->_label, a3);
    v6->_startTime = nanosecondTimestamp();
    v6->_endTime = 0;
  }

  return v6;
}

- (void)stopWithComment:(id)a3
{
  id v4 = a3;
  [(FMStopwatch *)self setEndTime:nanosecondTimestamp()];
  if ([v4 length])
  {
    id v5 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v7];
    [(FMStopwatch *)self setComment:v5];
  }
  id v6 = (id)buffer;
  objc_sync_enter(v6);
  [(id)buffer addObject:self];
  objc_sync_exit(v6);
}

- (void)stop
{
}

- (id)description
{
  unint64_t v3 = [(FMStopwatch *)self endTime];
  unint64_t v4 = [(FMStopwatch *)self startTime];
  double v5 = (double)[(FMStopwatch *)self endTime];
  id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  if (v8 == v5)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v10 = [(FMStopwatch *)self label];
    [v9 stringWithFormat:@"%@,%llu # STILL RUNNING", v10, -[FMStopwatch startTime](self, "startTime")];
    v15 = LABEL_5:;
    int v16 = 0;
    goto LABEL_7;
  }
  unint64_t v11 = [(FMStopwatch *)self startTime];
  unint64_t v12 = [(FMStopwatch *)self endTime];
  v13 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v10 = [(FMStopwatch *)self label];
  unint64_t v14 = [(FMStopwatch *)self startTime];
  if (v11 == v12)
  {
    [v13 stringWithFormat:@"%@,%llu", v10, v14];
    goto LABEL_5;
  }
  v15 = [v13 stringWithFormat:@"%@,%llu,%llu", v10, v14, -[FMStopwatch endTime](self, "endTime")];
  int v16 = 1;
LABEL_7:

  uint64_t v17 = [(FMStopwatch *)self comment];

  if (v17)
  {
    uint64_t v18 = [(FMStopwatch *)self comment];
    [v15 appendFormat:@" # %@", v18];
  }
  if (v16)
  {
    unint64_t v19 = v3 - v4;
    uint64_t v20 = [(FMStopwatch *)self comment];

    if (v20) {
      v21 = @" [Δ=%lu ns]";
    }
    else {
      v21 = @" # [Δ=%lu ns]";
    }
    objc_msgSend(v15, "appendFormat:", v21, v19);
  }
  return v15;
}

- (id)descriptionAsData
{
  id v2 = NSString;
  unint64_t v3 = [(FMStopwatch *)self description];
  unint64_t v4 = [v2 stringWithFormat:@"%@\n", v3];

  double v5 = [v4 dataUsingEncoding:4];

  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(unint64_t)a3
{
  self->_endTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end