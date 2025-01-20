@interface TermsAndConditionsCardViewController
- (_TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController)initWithContentView:(id)a3;
- (void)agreeButtonAction;
- (void)disagreeButtonAction;
- (void)viewDidLoad;
@end

@implementation TermsAndConditionsCardViewController

- (_TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  v5 = (_TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController *)sub_10000AF8C((uint64_t)a3);

  return v5;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TermsAndConditionsCardViewController();
  id v2 = v3.receiver;
  [(TermsAndConditionsCardViewController *)&v3 viewDidLoad];
  sub_100009A14();
  sub_10000A218();
  sub_10000A310();
}

- (void)agreeButtonAction
{
  id v2 = self;
  sub_10000AAD4();
}

- (void)disagreeButtonAction
{
}

- (void).cxx_destruct
{
  objc_super v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsTextView];
}

@end