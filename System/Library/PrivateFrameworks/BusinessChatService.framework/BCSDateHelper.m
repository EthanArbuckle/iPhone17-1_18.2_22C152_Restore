@interface BCSDateHelper
- (NSDate)currentDate;
@end

@implementation BCSDateHelper

- (NSDate)currentDate
{
  return (NSDate *)[MEMORY[0x263EFF910] date];
}

@end