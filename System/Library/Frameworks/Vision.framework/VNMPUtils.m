@interface VNMPUtils
+ (double)getHostTime;
+ (id)createErrorWithCode:(int64_t)a3 andMessage:(id)a4;
+ (int64_t)parseExifTimestamp:(id)a3;
+ (unint64_t)getHostTimeInNanos;
+ (void)freeVImageBuffer:(vImage_Buffer *)a3;
@end

@implementation VNMPUtils

+ (int64_t)parseExifTimestamp:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
  v6 = [v5 dateFromString:v4];

  if (v6)
  {
    [v6 timeIntervalSince1970];
    int64_t v8 = (uint64_t)v7;
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

+ (void)freeVImageBuffer:(vImage_Buffer *)a3
{
  if (a3)
  {
    if (a3->data) {
      free(a3->data);
    }
    free(a3);
  }
}

+ (id)createErrorWithCode:(int64_t)a3 andMessage:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  double v7 = [v5 dictionary];
  [v7 setValue:v6 forKey:*MEMORY[0x1E4F28588]];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MomentProcessor" code:a3 userInfo:v7];

  return v8;
}

+ (unint64_t)getHostTimeInNanos
{
  if (mach_timebase_info((mach_timebase_info_t)&getHostTimeInNanos_info)) {
    return 0;
  }
  else {
    return mach_absolute_time() * getHostTimeInNanos_info / *(unsigned int *)algn_1E9640124;
  }
}

+ (double)getHostTime
{
  mach_timebase_info info = 0;
  if (*(double *)&getHostTime_timeBaseFactor == 0.0 && !mach_timebase_info(&info))
  {
    LODWORD(v2) = info.numer;
    LODWORD(v3) = info.denom;
    *(double *)&getHostTime_timeBaseFactor = (double)v2 / (double)v3 * 0.000000001;
  }
  return *(double *)&getHostTime_timeBaseFactor * (double)mach_absolute_time();
}

@end