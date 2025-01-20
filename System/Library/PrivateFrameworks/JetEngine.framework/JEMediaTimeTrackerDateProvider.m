@interface JEMediaTimeTrackerDateProvider
- (id)date;
@end

@implementation JEMediaTimeTrackerDateProvider

- (id)date
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

@end