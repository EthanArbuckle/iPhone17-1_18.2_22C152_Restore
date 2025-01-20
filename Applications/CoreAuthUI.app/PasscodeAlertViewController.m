@interface PasscodeAlertViewController
- (BOOL)_canShowWhileLocked;
- (_TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController)initWithCoder:(id)a3;
- (_TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation PasscodeAlertViewController

- (_TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController)initWithCoder:(id)a3
{
  *(void *)&self->externalizedContext[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100056104();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10002ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext), *(void *)&self->externalizedContext[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_userId));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_delegate;

  sub_10002F0E8((uint64_t)v3);
}

@end