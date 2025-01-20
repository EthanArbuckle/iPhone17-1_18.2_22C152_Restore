@interface LACPreboardErrorBuilder
+ (BOOL)hasCode:(id)a3 code:(int64_t)a4;
+ (id)genericErrorWithMessage:(id)a3;
+ (id)genericErrorWithUnderlyingError:(id)a3;
+ (id)notSupportedError;
+ (id)passcodeVerificationErrorWith:(id)a3;
+ (id)profileInstallErrorWith:(id)a3;
+ (id)variableSetErrorWith:(id)a3;
- (_TtC23LocalAuthenticationCore23LACPreboardErrorBuilder)init;
@end

@implementation LACPreboardErrorBuilder

+ (BOOL)hasCode:(id)a3 code:(int64_t)a4
{
  id v5 = a3;
  LOBYTE(a4) = specialized static LACPreboardErrorBuilder.hasCode(_:code:)((uint64_t)v5, (id)a4);

  return a4 & 1;
}

+ (id)passcodeVerificationErrorWith:(id)a3
{
  return @objc static LACPreboardErrorBuilder.passcodeVerificationError(with:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &LACPreboardErrorCodePasscodeVerificationFailure);
}

+ (id)profileInstallErrorWith:(id)a3
{
  return @objc static LACPreboardErrorBuilder.passcodeVerificationError(with:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &LACPreboardErrorCodeUPPFailure);
}

+ (id)variableSetErrorWith:(id)a3
{
  return @objc static LACPreboardErrorBuilder.passcodeVerificationError(with:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &LACPreboardErrorCodeVariableSetFailure);
}

+ (id)notSupportedError
{
  id v2 = specialized static LACPreboardErrorBuilder.error(code:message:)(2, 0xD000000000000015, 0x8000000254FD9390);
  v3 = (void *)_convertErrorToNSError(_:)();

  return v3;
}

+ (id)genericErrorWithUnderlyingError:(id)a3
{
  id v4 = a3;
  id v5 = specialized static LACPreboardErrorBuilder.error(code:underlyingError:)(2, (unint64_t)a3);

  v6 = (void *)_convertErrorToNSError(_:)();
  return v6;
}

+ (id)genericErrorWithMessage:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = specialized static LACPreboardErrorBuilder.error(code:message:)(2, v3, v4);
  swift_bridgeObjectRelease();
  v6 = (void *)_convertErrorToNSError(_:)();

  return v6;
}

- (_TtC23LocalAuthenticationCore23LACPreboardErrorBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(LACPreboardErrorBuilder *)&v3 init];
}

@end