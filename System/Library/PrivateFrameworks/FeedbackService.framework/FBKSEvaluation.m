@interface FBKSEvaluation
- (NSString)description;
- (_TtC15FeedbackService14FBKSEvaluation)init;
@end

@implementation FBKSEvaluation

- (NSString)description
{
  v2 = self;
  sub_24DF93688();

  v3 = (void *)sub_24E001E20();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15FeedbackService14FBKSEvaluation)init
{
  result = (_TtC15FeedbackService14FBKSEvaluation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24DF9B9F4((uint64_t)self + OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_subject);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse);
  uint64_t v4 = *(void *)&self->_anon_0[OBJC_IVAR____TtC15FeedbackService14FBKSEvaluation_formResponse];
  sub_24DF9ECE8(v3, v4);
}

@end