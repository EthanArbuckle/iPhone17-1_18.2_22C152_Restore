@interface BuddySinglePressUpButtonConsumer
- (void)consumeSinglePressUpForButtonKind:(int64_t)a3;
@end

@implementation BuddySinglePressUpButtonConsumer

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
  id v3 = [(BuddyButtonConsumer *)self menuHandler];

  if (v3)
  {
    v4 = (void (**)(void))[(BuddyButtonConsumer *)self menuHandler];
    v4[2](v4);
  }
}

@end