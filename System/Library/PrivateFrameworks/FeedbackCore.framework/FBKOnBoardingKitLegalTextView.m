@interface FBKOnBoardingKitLegalTextView
- (OBPrivacyLinkController)onBoardingKitViewController;
- (_TtC12FeedbackCore29FBKOnBoardingKitLegalTextView)initWithCoder:(id)a3;
- (_TtC12FeedbackCore29FBKOnBoardingKitLegalTextView)initWithFrame:(CGRect)a3;
- (id)initOnBoardingKitIdentifier:(id)a3;
@end

@implementation FBKOnBoardingKitLegalTextView

- (OBPrivacyLinkController)onBoardingKitViewController
{
  return (OBPrivacyLinkController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                            + OBJC_IVAR____TtC12FeedbackCore29FBKOnBoardingKitLegalTextView_onBoardingKitViewController));
}

- (id)initOnBoardingKitIdentifier:(id)a3
{
  uint64_t v3 = sub_22A4B3458();
  return FBKOnBoardingKitLegalTextView.init(onBoardingKitIdentifier:)(v3, v4);
}

- (_TtC12FeedbackCore29FBKOnBoardingKitLegalTextView)initWithCoder:(id)a3
{
  result = (_TtC12FeedbackCore29FBKOnBoardingKitLegalTextView *)sub_22A4B3BF8();
  __break(1u);
  return result;
}

- (_TtC12FeedbackCore29FBKOnBoardingKitLegalTextView)initWithFrame:(CGRect)a3
{
  result = (_TtC12FeedbackCore29FBKOnBoardingKitLegalTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore29FBKOnBoardingKitLegalTextView_onBoardingKitViewController));
}

@end