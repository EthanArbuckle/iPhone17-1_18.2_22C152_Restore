@interface TermsAndConditionsViewController
- (_TtC11Diagnostics32TermsAndConditionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC11Diagnostics32TermsAndConditionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TermsAndConditionsViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TermsAndConditionsViewController();
  id v2 = v3.receiver;
  [(TermsAndConditionsViewController *)&v3 viewDidLoad];
  sub_1000CC454();
  sub_1000CD19C();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TermsAndConditionsViewController();
  id v2 = v3.receiver;
  [(TermsAndConditionsViewController *)&v3 viewDidLayoutSubviews];
  sub_1000CD280();
}

- (_TtC11Diagnostics32TermsAndConditionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC11Diagnostics32TermsAndConditionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11Diagnostics32TermsAndConditionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC11Diagnostics32TermsAndConditionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100056FB4((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_delegate]);

  objc_super v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics32TermsAndConditionsViewController_buttonFont];
}

@end