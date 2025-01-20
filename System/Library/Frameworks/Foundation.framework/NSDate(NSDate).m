@interface NSDate(NSDate)
+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded;
- (uint64_t)classForCoder;
- (uint64_t)encodeWithCoder:()NSDate;
- (uint64_t)initWithCoder:()NSDate;
@end

@implementation NSDate(NSDate)

- (uint64_t)encodeWithCoder:()NSDate
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    [a1 timeIntervalSinceReferenceDate];
    return objc_msgSend(a3, "encodeDouble:forKey:", @"NS.time");
  }
  else
  {
    [a1 timeIntervalSinceReferenceDate];
    v7[0] = v6;
    return [a3 encodeValueOfObjCType:"d" at:v7];
  }
}

- (uint64_t)initWithCoder:()NSDate
{
  v6[1] = *(double *)MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    [a3 decodeDoubleForKey:@"NS.time"];
    return objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v6[0] = 0.0;
    [a3 decodeValueOfObjCType:"d" at:v6 size:8];
    return [a1 initWithTimeIntervalSinceReferenceDate:v6[0]];
  }
}

- (uint64_t)classForCoder
{
  return self;
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

@end