@interface IMPerfProfilerDefaultBehavior
+ (id)instance;
- (void)perfProfiler:(id)a3 measurementDidFinish:(IMPerfMeasurement_t *)a4 withSink:(id)a5;
@end

@implementation IMPerfProfilerDefaultBehavior

- (void)perfProfiler:(id)a3 measurementDidFinish:(IMPerfMeasurement_t *)a4 withSink:(id)a5
{
  id v10 = a3;
  id v7 = a5;
  v9 = v7;
  if (a4 && a4->var6 > 0.001) {
    objc_msgSend_perfProfiler_measurementDidFinish_(v7, v8, (uint64_t)v10, (uint64_t)a4);
  }
}

+ (id)instance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1918B7058;
  block[3] = &unk_1E5723248;
  block[4] = a1;
  if (qword_1E92DB568 != -1) {
    dispatch_once(&qword_1E92DB568, block);
  }
  v2 = (void *)qword_1E92DB560;
  return v2;
}

@end