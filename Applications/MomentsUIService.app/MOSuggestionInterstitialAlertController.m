@interface MOSuggestionInterstitialAlertController
- (_TtC16MomentsUIService39MOSuggestionInterstitialAlertController)initWithCoder:(id)a3;
- (_TtC16MomentsUIService39MOSuggestionInterstitialAlertController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation MOSuggestionInterstitialAlertController

- (_TtC16MomentsUIService39MOSuggestionInterstitialAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = OBJC_IVAR____TtC16MomentsUIService39MOSuggestionInterstitialAlertController_textViewContentController;
  id v9 = objc_allocWithZone((Class)type metadata accessor for MOSuggestionInterstitialAlertContentViewController());
  v10 = self;
  id v11 = a4;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)[v9 init];

  if (v7)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for MOSuggestionInterstitialAlertController();
  v13 = [(MOSuggestionInterstitialAlertController *)&v15 initWithNibName:v12 bundle:v11];

  return v13;
}

- (_TtC16MomentsUIService39MOSuggestionInterstitialAlertController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MomentsUIService39MOSuggestionInterstitialAlertController_textViewContentController;
  id v6 = objc_allocWithZone((Class)type metadata accessor for MOSuggestionInterstitialAlertContentViewController());
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for MOSuggestionInterstitialAlertController();
  id v9 = [(MOSuggestionInterstitialAlertController *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService39MOSuggestionInterstitialAlertController_textViewContentController));
}

@end