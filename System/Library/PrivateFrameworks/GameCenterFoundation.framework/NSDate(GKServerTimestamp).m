@interface NSDate(GKServerTimestamp)
+ (id)_gkDateFromScalarServerTimestamp:()GKServerTimestamp;
+ (id)_gkDateFromServerTimestamp:()GKServerTimestamp;
+ (id)_gkServerTimestamp;
- (uint64_t)_gkServerTimestamp;
@end

@implementation NSDate(GKServerTimestamp)

+ (id)_gkDateFromScalarServerTimestamp:()GKServerTimestamp
{
  if ((double)a3 / 1000.0 <= 0.0)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  }

  return v3;
}

+ (id)_gkDateFromServerTimestamp:()GKServerTimestamp
{
  [a3 doubleValue];
  if (v3 / 1000.0 <= 0.0)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  }

  return v4;
}

+ (id)_gkServerTimestamp
{
  v1 = [a1 date];
  v2 = [v1 _gkServerTimestamp];

  return v2;
}

- (uint64_t)_gkServerTimestamp
{
  v1 = NSNumber;
  [a1 timeIntervalSince1970];

  return objc_msgSend(v1, "_gkServerTimeInterval:");
}

@end