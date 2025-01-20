@interface ImpressionsCalculator
- (void)applicationDidEnterBackgroundWithNote:(id)a3;
- (void)applicationWillEnterForegroundWithNote:(id)a3;
@end

@implementation ImpressionsCalculator

- (void)applicationDidEnterBackgroundWithNote:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1E1AD2FD8();

  swift_release();
}

- (void)applicationWillEnterForegroundWithNote:(id)a3
{
  if (*((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC19AppStoreKitInternal21ImpressionsCalculator_wasVisibleBeforeGoingIntoBackground) != 2)
  {
    id v3 = a3;
    swift_retain();
    ImpressionsCalculator.isVisible.setter();

    swift_release();
  }
}

@end