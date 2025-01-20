@interface MOSuggestionInterstitialAlertContentViewController
- (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController)init;
- (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController)initWithCoder:(id)a3;
- (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleTraitChange;
@end

@implementation MOSuggestionInterstitialAlertContentViewController

- (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController)init
{
  return (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController *)MOSuggestionInterstitialAlertContentViewController.init()();
}

- (void)handleTraitChange
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController_textView);
  v3 = self;
  id v4 = [v2 layer];
  id v5 = [self separatorColor];
  id v6 = [v5 CGColor];

  [v4 setBorderColor:v6];
}

- (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController_textView;
  id v6 = objc_allocWithZone((Class)UITextView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController_textView));
}

@end