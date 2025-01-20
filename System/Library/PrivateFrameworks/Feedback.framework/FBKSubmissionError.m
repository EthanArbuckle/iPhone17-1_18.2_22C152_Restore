@interface FBKSubmissionError
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSDictionary)serverErrorDetails;
- (NSError)underlyingError;
- (NSString)description;
- (_TtC8Feedback18FBKSubmissionError)init;
- (_TtC8Feedback18FBKSubmissionError)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setServerErrorDetails:(id)a3;
- (void)setUnderlyingError:(id)a3;
@end

@implementation FBKSubmissionError

- (NSDictionary)serverErrorDetails
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Feedback18FBKSubmissionError_serverErrorDetails);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_23D0058A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (void)setServerErrorDetails:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_23D0058B8();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Feedback18FBKSubmissionError_serverErrorDetails);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSError)underlyingError
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Feedback18FBKSubmissionError_underlyingError);
  swift_beginAccess();
  return (NSError *)*v2;
}

- (void)setUnderlyingError:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Feedback18FBKSubmissionError_underlyingError);
  swift_beginAccess();
  v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (NSString)description
{
  v3 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Feedback18FBKSubmissionError_underlyingError);
  swift_beginAccess();
  uint64_t v4 = *v3;
  v5 = self;
  id v6 = v4;
  id v7 = objc_msgSend(v6, sel_description);
  sub_23D005948();

  v8 = (void *)sub_23D005918();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return byte_268BCF150;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_268BCF150 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23CFA9CA4(v4);
}

- (_TtC8Feedback18FBKSubmissionError)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC8Feedback18FBKSubmissionError *)sub_23CFAA1C0();

  return v4;
}

- (_TtC8Feedback18FBKSubmissionError)init
{
  result = (_TtC8Feedback18FBKSubmissionError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Feedback18FBKSubmissionError_underlyingError);
}

@end