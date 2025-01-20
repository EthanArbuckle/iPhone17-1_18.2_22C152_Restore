@interface AnswerETAIntentResponse
- (AnswerETAIntentResponse)init;
- (AnswerETAIntentResponse)initWithBackingStore:(id)a3;
- (AnswerETAIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (AnswerETAIntentResponse)initWithCoder:(id)a3;
- (AnswerETAIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation AnswerETAIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___AnswerETAIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___AnswerETAIntentResponse_code);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (AnswerETAIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = [(AnswerETAIntentResponse *)self init];
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___AnswerETAIntentResponse_code);
  swift_beginAccess();
  int64_t *v8 = a3;
  v9 = v7;
  [(AnswerETAIntentResponse *)v9 setUserActivity:v6];

  return v9;
}

- (AnswerETAIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___AnswerETAIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnswerETAIntentResponse();
  return [(AnswerETAIntentResponse *)&v3 init];
}

- (AnswerETAIntentResponse)initWithCoder:(id)a3
{
  return (AnswerETAIntentResponse *)@objc AnswerETAIntentResponse.init(coder:)((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (AnswerETAIntentResponse)initWithBackingStore:(id)a3
{
  return (AnswerETAIntentResponse *)@objc AnswerETAIntentResponse.init(coder:)((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (AnswerETAIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return (AnswerETAIntentResponse *)AnswerETAIntentResponse.init(propertiesByName:)(v3);
}

@end