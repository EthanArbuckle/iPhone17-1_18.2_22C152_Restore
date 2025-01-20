@interface DisplayMainViewController.DarkAlert
- (BOOL)_canShowWhileLocked;
- (_TtCC17ContinuityDisplay25DisplayMainViewController9DarkAlert)initWithCoder:(id)a3;
- (_TtCC17ContinuityDisplay25DisplayMainViewController9DarkAlert)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredUserInterfaceStyle;
@end

@implementation DisplayMainViewController.DarkAlert

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (_TtCC17ContinuityDisplay25DisplayMainViewController9DarkAlert)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtCC17ContinuityDisplay25DisplayMainViewController9DarkAlert *)sub_10003B6B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_10003AC54);
}

- (_TtCC17ContinuityDisplay25DisplayMainViewController9DarkAlert)initWithCoder:(id)a3
{
  return (_TtCC17ContinuityDisplay25DisplayMainViewController9DarkAlert *)sub_10003ACEC(a3);
}

@end