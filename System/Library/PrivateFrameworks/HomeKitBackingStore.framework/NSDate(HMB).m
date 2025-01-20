@interface NSDate(HMB)
+ (id)hmbDescriptionForEncodedQueryableVariable:()HMB;
+ (id)hmbEncodeQueryableParameter:()HMB;
+ (uint64_t)hmbDecodeQueryableParameter:()HMB;
@end

@implementation NSDate(HMB)

+ (id)hmbDescriptionForEncodedQueryableVariable:()HMB
{
  id v3 = a3;
  if ([v3 length] == 8)
  {
    id v4 = v3;
    v5 = (unint64_t *)[v4 bytes];

    v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)bswap64(*v5)];
    [v6 description];
  }
  else
  {
    v7 = NSString;
    v6 = [v3 hmbDescription];

    [v7 stringWithFormat:@"<MALFORMED INTERVAL: %@>", v6];
  v8 = };

  return v8;
}

+ (uint64_t)hmbDecodeQueryableParameter:()HMB
{
  v0 = objc_msgSend(MEMORY[0x1E4F28ED0], "hmbDecodeQueryableParameter:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v1 = v0;
  }
  else {
    v1 = 0;
  }
  id v2 = v1;

  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  [v2 doubleValue];
  double v5 = v4;

  return [v3 dateWithTimeIntervalSinceReferenceDate:v5];
}

+ (id)hmbEncodeQueryableParameter:()HMB
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  [a3 timeIntervalSinceReferenceDate];
  double v4 = objc_msgSend(v3, "numberWithDouble:");
  double v5 = [v3 hmbEncodeQueryableParameter:v4];

  return v5;
}

@end