@interface MSTouchTracker
- (MSTouchTracker)init;
- (void)checkForTouchWithCompletion:(id)a3;
- (void)touchReceived;
@end

@implementation MSTouchTracker

- (MSTouchTracker)init
{
  return (MSTouchTracker *)TouchTracker.init()();
}

- (void)touchReceived
{
  v2 = self;
  TouchTracker.touchReceived()();
}

- (void)checkForTouchWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_242E4((char *)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MSTouchTracker_propertyQueue);
}

@end