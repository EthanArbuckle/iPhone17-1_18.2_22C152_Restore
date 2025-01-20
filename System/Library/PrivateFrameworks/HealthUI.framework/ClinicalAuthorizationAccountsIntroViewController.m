@interface ClinicalAuthorizationAccountsIntroViewController
- (_TtC8HealthUI48ClinicalAuthorizationAccountsIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC8HealthUI48ClinicalAuthorizationAccountsIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)cancelButtonPressed:(id)a3;
- (void)nextButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation ClinicalAuthorizationAccountsIntroViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClinicalAuthorizationAccountsIntroViewController();
  id v2 = v3.receiver;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  sub_1E0E490D8();
  sub_1E0E492C0();
}

- (void)nextButtonPressed:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1E0ECD760();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1E0E496F4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8HealthUI48ClinicalAuthorizationAccountsIntroViewController_viewControllerToPush), 1);

  sub_1E0B32EE4((uint64_t)v6);
}

- (void)cancelButtonPressed:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1E0ECD760();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1E0E495BC();

  sub_1E0B32EE4((uint64_t)v6);
}

- (_TtC8HealthUI48ClinicalAuthorizationAccountsIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC8HealthUI48ClinicalAuthorizationAccountsIntroViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8HealthUI48ClinicalAuthorizationAccountsIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC8HealthUI48ClinicalAuthorizationAccountsIntroViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8HealthUI48ClinicalAuthorizationAccountsIntroViewController_viewControllerToPush);
}

@end