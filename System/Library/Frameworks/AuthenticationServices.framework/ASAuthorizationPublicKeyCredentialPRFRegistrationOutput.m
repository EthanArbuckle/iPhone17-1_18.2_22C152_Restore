@interface ASAuthorizationPublicKeyCredentialPRFRegistrationOutput
- (ASAuthorizationPublicKeyCredentialPRFRegistrationOutput)init;
- (BOOL)isSupported;
- (NSData)first;
- (NSData)second;
- (void)setFirst:(id)a3;
- (void)setIsSupported:(BOOL)a3;
- (void)setSecond:(id)a3;
@end

@implementation ASAuthorizationPublicKeyCredentialPRFRegistrationOutput

- (BOOL)isSupported
{
  v2 = (BOOL *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_isSupported;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSupported:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_isSupported;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSData)first
{
  return (NSData *)sub_2191F3D1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_first);
}

- (void)setFirst:(id)a3
{
}

- (NSData)second
{
  return (NSData *)sub_2191F3D1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_second);
}

- (void)setSecond:(id)a3
{
}

- (ASAuthorizationPublicKeyCredentialPRFRegistrationOutput)init
{
  result = (ASAuthorizationPublicKeyCredentialPRFRegistrationOutput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end