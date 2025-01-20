@interface SOSCrashDetectionFeedbackController
- (_TtC11SOSSettings35SOSCrashDetectionFeedbackController)initWithDelegate:(id)a3 legalText:(id)a4;
- (_TtC11SOSSettings35SOSCrashDetectionFeedbackController)initWithDelegate:(id)a3 legalText:(id)a4 uuid:(id)a5;
@end

@implementation SOSCrashDetectionFeedbackController

- (_TtC11SOSSettings35SOSCrashDetectionFeedbackController)initWithDelegate:(id)a3 legalText:(id)a4 uuid:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (!a4)
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = sub_F760();
  uint64_t v8 = v7;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = sub_F760();
  uint64_t v10 = v9;
LABEL_6:
  uint64_t v11 = swift_unknownObjectRetain();
  v12 = (_TtC11SOSSettings35SOSCrashDetectionFeedbackController *)sub_F254(v11, v6, v8, v5, v10);
  swift_unknownObjectRelease();
  return v12;
}

- (_TtC11SOSSettings35SOSCrashDetectionFeedbackController)initWithDelegate:(id)a3 legalText:(id)a4
{
  swift_unknownObjectRetain();
  result = (_TtC11SOSSettings35SOSCrashDetectionFeedbackController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end