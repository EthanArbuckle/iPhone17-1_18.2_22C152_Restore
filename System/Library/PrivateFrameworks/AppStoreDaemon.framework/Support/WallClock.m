@interface WallClock
- (NSDate)now;
@end

@implementation WallClock

- (NSDate)now
{
  return +[NSDate date];
}

@end