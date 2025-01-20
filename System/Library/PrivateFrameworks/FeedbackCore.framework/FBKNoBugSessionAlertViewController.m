@interface FBKNoBugSessionAlertViewController
+ (void)showInController:(id)a3 forDevice:(id)a4;
- (_TtC12FeedbackCore34FBKNoBugSessionAlertViewController)initWithCoder:(id)a3;
- (_TtC12FeedbackCore34FBKNoBugSessionAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation FBKNoBugSessionAlertViewController

+ (void)showInController:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  _s12FeedbackCore34FBKNoBugSessionAlertViewControllerC06showInH0_9forDeviceySo06UIViewH0C_So010FBKGroupedL0CtFZ_0(v5);
}

- (_TtC12FeedbackCore34FBKNoBugSessionAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_22A4B3458();
    id v6 = a4;
    v7 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKNoBugSessionAlertViewController();
  v9 = [(FBKNoBugSessionAlertViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC12FeedbackCore34FBKNoBugSessionAlertViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBKNoBugSessionAlertViewController();
  return [(FBKNoBugSessionAlertViewController *)&v5 initWithCoder:a3];
}

@end