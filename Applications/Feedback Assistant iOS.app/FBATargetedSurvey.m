@interface FBATargetedSurvey
+ (void)reportFailureToLaunchFormWithFormIdentifier:(id)a3;
- (_TtC18Feedback_Assistant17FBATargetedSurvey)init;
@end

@implementation FBATargetedSurvey

+ (void)reportFailureToLaunchFormWithFormIdentifier:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static FBKSAdmin.reportFailureToLaunchForm(formIdentifier:completion:)();

  swift_bridgeObjectRelease();
}

- (_TtC18Feedback_Assistant17FBATargetedSurvey)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBATargetedSurvey();
  return [(FBATargetedSurvey *)&v3 init];
}

@end