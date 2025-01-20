@interface CLBOpenApplicationVerifierResultError
- (CLBOpenApplicationVerifierResultError)init;
- (NSString)errorDescription;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
- (void)setErrorDescription:(id)a3;
@end

@implementation CLBOpenApplicationVerifierResultError

- (int64_t)code
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___CLBOpenApplicationVerifierResultError_code);
}

- (void)setCode:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBOpenApplicationVerifierResultError_code) = (Class)a3;
}

- (NSString)errorDescription
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setErrorDescription:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CLBOpenApplicationVerifierResultError_errorDescription);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (CLBOpenApplicationVerifierResultError)init
{
  result = (CLBOpenApplicationVerifierResultError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end