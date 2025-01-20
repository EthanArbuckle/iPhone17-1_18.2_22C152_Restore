@interface HMDDate
- (NSDate)now;
- (double)timeIntervalSince1970;
@end

@implementation HMDDate

- (NSDate)now
{
  return (NSDate *)[MEMORY[0x263EFF910] now];
}

- (double)timeIntervalSince1970
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  return v2 + 978307200.0;
}

@end