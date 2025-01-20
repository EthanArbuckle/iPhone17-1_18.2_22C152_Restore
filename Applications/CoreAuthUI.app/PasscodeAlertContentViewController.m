@interface PasscodeAlertContentViewController
- (_TtC10CoreAuthUI34PasscodeAlertContentViewController)initWithCoder:(id)a3;
- (_TtC10CoreAuthUI34PasscodeAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)verifyPasscode:(id)a3 reply:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PasscodeAlertContentViewController

- (_TtC10CoreAuthUI34PasscodeAlertContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10002EE78();
}

- (void)loadView
{
  v2 = self;
  sub_10002CE28();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10002D35C(a3);
}

- (void)verifyPasscode:(id)a3 reply:(id)a4
{
  uint64_t ObjectType = swift_getObjectType();
  v7 = _Block_copy(a4);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  uint64_t v12 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext);
  unint64_t v13 = *(void *)&self->passcodeController[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext];
  v14 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_userId);
  uint64_t v15 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_policy);
  uint64_t v16 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_options);
  v17 = self;
  sub_10002F490(v8, v10, v12, v13, v14, v15, v16, (void (*)(void))sub_10002F2D8, v11, ObjectType, (uint64_t)&off_100087018);

  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC10CoreAuthUI34PasscodeAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10CoreAuthUI34PasscodeAlertContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_log;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController));
  sub_10002ADFC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext), *(void *)&self->passcodeController[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_userId));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;

  sub_10002F0E8((uint64_t)v5);
}

@end