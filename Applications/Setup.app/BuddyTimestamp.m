@interface BuddyTimestamp
+ (double)intervalFromStart:(unint64_t)a3 toEnd:(unint64_t)a4;
+ (double)intervalSinceTimestamp:(unint64_t)a3;
+ (unint64_t)currentTimestamp;
@end

@implementation BuddyTimestamp

+ (unint64_t)currentTimestamp
{
  return mach_continuous_time();
}

+ (double)intervalFromStart:(unint64_t)a3 toEnd:(unint64_t)a4
{
  v8 = (dispatch_once_t *)&unk_100321B80;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B1F40);
  if (*v8 != -1) {
    dispatch_once(v8, location);
  }
  objc_storeStrong(&location, 0);
  return ((double)a4 - (double)a3)
       * (double)dword_100321B78
       / (double)dword_100321B7C
       / 1000000000.0;
}

+ (double)intervalSinceTimestamp:(unint64_t)a3
{
  [a1 intervalFromStart:a3 toEnd:[a1 currentTimestamp]];
  return result;
}

@end