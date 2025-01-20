@interface LightContentStatusBarEXHostViewController
- (_TtC25AutomatedDeviceEnrollment41LightContentStatusBarEXHostViewController)initWithCoder:(id)a3;
- (_TtC25AutomatedDeviceEnrollment41LightContentStatusBarEXHostViewController)initWithConfiguration:(id)a3;
- (_TtC25AutomatedDeviceEnrollment41LightContentStatusBarEXHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)viewDidLoad;
@end

@implementation LightContentStatusBarEXHostViewController

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LightContentStatusBarEXHostViewController();
  id v2 = v6.receiver;
  [(_EXHostViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(self, sel_blackColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC25AutomatedDeviceEnrollment41LightContentStatusBarEXHostViewController)initWithConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LightContentStatusBarEXHostViewController();
  return [(_EXHostViewController *)&v5 initWithConfiguration:a3];
}

- (_TtC25AutomatedDeviceEnrollment41LightContentStatusBarEXHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_243232750();
    id v6 = a4;
    v7 = (void *)sub_243232740();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for LightContentStatusBarEXHostViewController();
  v9 = [(LightContentStatusBarEXHostViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC25AutomatedDeviceEnrollment41LightContentStatusBarEXHostViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LightContentStatusBarEXHostViewController();
  return [(LightContentStatusBarEXHostViewController *)&v5 initWithCoder:a3];
}

@end