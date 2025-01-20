@interface HMDDate
- (NSDate)now;
- (double)timeIntervalSince1970;
@end

@implementation HMDDate

- (NSDate)now
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] now];
}

- (double)timeIntervalSince1970
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return v2 + 978307200.0;
}

@end