@interface ConnectionAssistantConnectionViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController)init;
- (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController)initWithCoder:(id)a3;
- (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ConnectionAssistantConnectionViewController

- (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController)init
{
  return (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController *)sub_1000505A4();
}

- (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000521E4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000507B4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100050968();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8SOSBuddy43ConnectionAssistantConnectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100049A78(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_connectionGuidance), *(void *)&self->state[OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_connectionGuidance]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_exclusionPath));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_guidanceTitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8SOSBuddy43ConnectionAssistantConnectionViewController_guidanceSubtitleLabel);
}

@end