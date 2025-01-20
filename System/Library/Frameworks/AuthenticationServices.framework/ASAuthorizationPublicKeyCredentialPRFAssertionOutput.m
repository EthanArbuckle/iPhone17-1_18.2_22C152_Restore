@interface ASAuthorizationPublicKeyCredentialPRFAssertionOutput
- (ASAuthorizationPublicKeyCredentialPRFAssertionOutput)init;
- (NSData)first;
- (NSData)second;
- (void)setFirst:(id)a3;
- (void)setSecond:(id)a3;
@end

@implementation ASAuthorizationPublicKeyCredentialPRFAssertionOutput

- (NSData)first
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_first);
  swift_beginAccess();
  uint64_t v4 = *v2;
  unint64_t v3 = v2[1];
  sub_2191E4E14(v4, v3);
  v5 = (void *)sub_21922ADF8();
  sub_2191E4AAC(v4, v3);

  return (NSData *)v5;
}

- (void)setFirst:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_21922AE08();
  uint64_t v8 = v7;

  v9 = (uint64_t *)((char *)v5 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_first);
  swift_beginAccess();
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  uint64_t *v9 = v6;
  v9[1] = v8;
  sub_2191E4AAC(v10, v11);
}

- (NSData)second
{
  return (NSData *)sub_2191F3D1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_second);
}

- (void)setSecond:(id)a3
{
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionOutput)init
{
  result = (ASAuthorizationPublicKeyCredentialPRFAssertionOutput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end