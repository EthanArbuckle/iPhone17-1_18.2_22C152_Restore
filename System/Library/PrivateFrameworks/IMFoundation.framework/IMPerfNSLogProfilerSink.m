@interface IMPerfNSLogProfilerSink
+ (id)instance;
- (void)perfProfiler:(id)a3 measurementDidFinish:(IMPerfMeasurement_t *)a4;
@end

@implementation IMPerfNSLogProfilerSink

- (void)perfProfiler:(id)a3 measurementDidFinish:(IMPerfMeasurement_t *)a4
{
  if (a4)
  {
    unint64_t var1 = a4->var1;
    double var6 = a4->var6;
    v7 = IMFileLocationTrimFileName(a4);
    NSLog(&cfstr_PerfIdLldEFFil.isa, var1, *(void *)&var6, v7, a4->var0.var4, a4->var0.var2, a4->var3);
  }
}

+ (id)instance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1918DA290;
  block[3] = &unk_1E5723248;
  block[4] = a1;
  if (qword_1E92DB918 != -1) {
    dispatch_once(&qword_1E92DB918, block);
  }
  v2 = (void *)qword_1E92DB910;
  return v2;
}

@end