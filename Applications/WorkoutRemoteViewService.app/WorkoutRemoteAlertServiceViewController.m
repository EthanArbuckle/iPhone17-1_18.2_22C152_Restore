@interface WorkoutRemoteAlertServiceViewController
- (WorkoutRemoteAlertServiceViewController)initWithCoder:(id)a3;
- (WorkoutRemoteAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismissView;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
@end

@implementation WorkoutRemoteAlertServiceViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(uint64_t))sub_100007C94;
  }
  id v7 = a3;
  v8 = self;
  sub_1000059B4(a3, v6);
  sub_100007C4C((uint64_t)v6);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (**)(const void *))_Block_copy(a4);
  if (v6)
  {
    id v7 = v6;
    v8 = v6[2];
    id v9 = a3;
    v10 = self;
    v8(v7);
    _Block_release(v7);
  }
}

- (void)dismissView
{
  v2 = self;
  sub_100006834();
}

- (WorkoutRemoteAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for WorkoutRemoteAlertServiceViewController();
  id v9 = [(WorkoutRemoteAlertServiceViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (WorkoutRemoteAlertServiceViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutRemoteAlertServiceViewController();
  return [(WorkoutRemoteAlertServiceViewController *)&v5 initWithCoder:a3];
}

@end