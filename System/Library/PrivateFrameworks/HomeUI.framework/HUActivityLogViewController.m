@interface HUActivityLogViewController
- (HUActivityLogViewController)initWithCoder:(id)a3;
- (HUActivityLogViewController)initWithHome:(id)a3 activityLogCoordinator:(id)a4;
- (HUActivityLogViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation HUActivityLogViewController

- (HUActivityLogViewController)initWithHome:(id)a3 activityLogCoordinator:(id)a4
{
  id v5 = a3;
  swift_retain();
  return (HUActivityLogViewController *)ActivityLogViewController.init(home:activityLogCoordinator:)(v5, (uint64_t)a4);
}

- (HUActivityLogViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BE9C5848();
  swift_bridgeObjectRelease();
  result = (HUActivityLogViewController *)sub_1BE9C5A78();
  __break(1u);
  return result;
}

- (HUActivityLogViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  sub_1BE9C5848();
  swift_bridgeObjectRelease();
  result = (HUActivityLogViewController *)sub_1BE9C5A78();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE3B28A0();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUActivityLogViewController_hostingController);
}

@end