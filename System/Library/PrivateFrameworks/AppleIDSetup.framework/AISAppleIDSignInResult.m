@interface AISAppleIDSignInResult
- (AISAppleIDSignInResult)init;
- (NSDictionary)authResults;
- (void)setAuthResults:(id)a3;
@end

@implementation AISAppleIDSignInResult

- (NSDictionary)authResults
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(qword_2692D98F0);
  v2 = (void *)sub_248174FF0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setAuthResults:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(qword_2692D98F0);
  uint64_t v4 = sub_248175010();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInResult_authResults);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (AISAppleIDSignInResult)init
{
  result = (AISAppleIDSignInResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end