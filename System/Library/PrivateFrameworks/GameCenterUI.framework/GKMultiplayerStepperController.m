@interface GKMultiplayerStepperController
- (_TtC12GameCenterUI30GKMultiplayerStepperController)init;
- (_TtC12GameCenterUI30GKMultiplayerStepperController)initWithMinimumValue:(int64_t)a3 maximumValue:(int64_t)a4 initialValue:(int64_t)a5 valueChangedHandler:(id)a6;
@end

@implementation GKMultiplayerStepperController

- (_TtC12GameCenterUI30GKMultiplayerStepperController)initWithMinimumValue:(int64_t)a3 maximumValue:(int64_t)a4 initialValue:(int64_t)a5 valueChangedHandler:(id)a6
{
  v9 = _Block_copy(a6);
  if (v9)
  {
    *(void *)(swift_allocObject() + 16) = v9;
    v10 = sub_1AF407F68;
  }
  else
  {
    v10 = 0;
  }
  return (_TtC12GameCenterUI30GKMultiplayerStepperController *)sub_1AF407C68(a3, a4, a5, (uint64_t)v10);
}

- (_TtC12GameCenterUI30GKMultiplayerStepperController)init
{
}

- (void).cxx_destruct
{
  sub_1AF368930(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12GameCenterUI30GKMultiplayerStepperController_valueChangedHandler));
}

@end