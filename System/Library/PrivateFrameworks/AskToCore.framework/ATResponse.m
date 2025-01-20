@interface ATResponse
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (NSString)responderHandle;
- (_TtC5AskTo10ATQuestion)originalQuestion;
- (_TtC5AskTo14ATAnswerChoice)chosenAnswer;
- (_TtC9AskToCore10ATResponse)init;
- (_TtC9AskToCore10ATResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOriginalQuestion:(id)a3;
- (void)setResponderHandle:(id)a3;
@end

@implementation ATResponse

- (_TtC5AskTo10ATQuestion)originalQuestion
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  return (_TtC5AskTo10ATQuestion *)*v2;
}

- (void)setOriginalQuestion:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (NSString)responderHandle
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_248766008();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setResponderHandle:(id)a3
{
  uint64_t v4 = sub_248766018();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC5AskTo14ATAnswerChoice)chosenAnswer
{
  return (_TtC5AskTo14ATAnswerChoice *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9AskToCore10ATResponse)initWithCoder:(id)a3
{
  return (_TtC9AskToCore10ATResponse *)ATResponse.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ATResponse.encode(with:)((NSCoder)v4);
}

- (id)copyWithZone:(void *)a3
{
  id v4 = objc_allocWithZone((Class)swift_getObjectType());
  uint64_t v5 = self;
  id v6 = sub_2487651FC((uint64_t)v5);

  v7 = (void *)sub_248766488();
  return v7;
}

- (NSString)description
{
  v2 = self;
  ATResponse.description.getter();

  v3 = (void *)sub_248766008();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC9AskToCore10ATResponse)init
{
  result = (_TtC9AskToCore10ATResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer);
}

@end