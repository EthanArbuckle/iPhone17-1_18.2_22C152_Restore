@interface BuddyLongPressButtonConsumer
- (void)consumeLongPressForButtonKind:(int64_t)a3;
@end

@implementation BuddyLongPressButtonConsumer

- (void)consumeLongPressForButtonKind:(int64_t)a3
{
  id v3 = [(BuddyButtonConsumer *)self menuHandler];

  if (v3)
  {
    v4 = (void (**)(void))[(BuddyButtonConsumer *)self menuHandler];
    v4[2](v4);
  }
}

@end