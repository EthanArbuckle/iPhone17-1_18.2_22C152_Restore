@interface APSystemClock
- (id)now;
@end

@implementation APSystemClock

- (id)now
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

@end