@interface FBACustomBehavior
- (BOOL)isCaptive;
- (BOOL)launchNewDraft;
- (BOOL)makeVisible;
- (BOOL)notifyOnUpload;
- (NSDictionary)answers;
- (NSNumber)formId;
- (NSString)description;
- (_TtC18Feedback_Assistant17FBACustomBehavior)init;
- (_TtC18Feedback_Assistant17FBACustomBehavior)initWithDictionary:(id)a3;
- (void)setAnswers:(id)a3;
- (void)setFormId:(id)a3;
- (void)setIsCaptive:(BOOL)a3;
- (void)setLaunchNewDraft:(BOOL)a3;
- (void)setMakeVisible:(BOOL)a3;
- (void)setNotifyOnUpload:(BOOL)a3;
@end

@implementation FBACustomBehavior

- (BOOL)makeVisible
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_makeVisible);
}

- (void)setMakeVisible:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_makeVisible) = a3;
}

- (BOOL)notifyOnUpload
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_notifyOnUpload);
}

- (void)setNotifyOnUpload:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_notifyOnUpload) = a3;
}

- (NSNumber)formId
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_formId));
}

- (void)setFormId:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_formId);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_formId) = (Class)a3;
  id v3 = a3;
}

- (NSDictionary)answers
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_answers))
  {
    swift_bridgeObjectRetain();
    v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSDictionary *)v2.super.isa;
}

- (void)setAnswers:(id)a3
{
  if (a3) {
    id v4 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    id v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_answers) = v4;

  swift_bridgeObjectRelease();
}

- (BOOL)launchNewDraft
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_launchNewDraft);
}

- (void)setLaunchNewDraft:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_launchNewDraft) = a3;
}

- (BOOL)isCaptive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_isCaptive);
}

- (void)setIsCaptive:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBACustomBehavior_isCaptive) = a3;
}

- (_TtC18Feedback_Assistant17FBACustomBehavior)initWithDictionary:(id)a3
{
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC18Feedback_Assistant17FBACustomBehavior *)FBACustomBehavior.init(dictionary:)(v3);
}

- (NSString)description
{
  NSDictionary v2 = self;
  FBACustomBehavior.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC18Feedback_Assistant17FBACustomBehavior)init
{
  result = (_TtC18Feedback_Assistant17FBACustomBehavior *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end