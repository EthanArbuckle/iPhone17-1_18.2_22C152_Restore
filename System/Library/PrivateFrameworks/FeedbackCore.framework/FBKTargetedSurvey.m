@interface FBKTargetedSurvey
+ (id)inboxTargetedSurveysWithTeamType:(unint64_t)a3;
+ (void)didFinishSubmissionWithFormIdentifier:(id)a3 feedbackId:(id)a4 isSurvey:(BOOL)a5 error:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (_TtC12FeedbackCore17FBKTargetedSurvey)init;
- (int64_t)teamId;
- (void)setIdentifier:(id)a3;
- (void)setTeamId:(int64_t)a3;
@end

@implementation FBKTargetedSurvey

- (NSString)identifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = sub_22A4B3458();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore17FBKTargetedSurvey_identifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)teamId
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore17FBKTargetedSurvey_teamId);
  swift_beginAccess();
  return *v2;
}

- (void)setTeamId:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore17FBKTargetedSurvey_teamId);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_22A4B3968();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_22A40A7AC((uint64_t)v8);

  sub_22A40A904((uint64_t)v8);
  return v6 & 1;
}

- (_TtC12FeedbackCore17FBKTargetedSurvey)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore17FBKTargetedSurvey_teamId) = 0;

  result = (_TtC12FeedbackCore17FBKTargetedSurvey *)sub_22A4B3BF8();
  __break(1u);
  return result;
}

+ (id)inboxTargetedSurveysWithTeamType:(unint64_t)a3
{
  if (_s12FeedbackCore17FBKTargetedSurveyC20inboxTargetedSurveys8teamTypeShyACGSgSo07FBKTeamI0V_tFZ_0(a3))
  {
    type metadata accessor for FBKTargetedSurvey();
    sub_22A40B348();
    v3 = (void *)sub_22A4B36A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (void)didFinishSubmissionWithFormIdentifier:(id)a3 feedbackId:(id)a4 isSurvey:(BOOL)a5 error:(id)a6
{
  uint64_t v9 = sub_22A4B3458();
  uint64_t v11 = v10;
  id v12 = a4;
  id v13 = a6;
  _s12FeedbackCore17FBKTargetedSurveyC19didFinishSubmission14formIdentifier10feedbackId02isD05errorySS_So8NSNumberCSgSbSo7NSErrorCSgtFZ_0(v9, v11, (uint64_t)a4, a5);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end