@interface ASAuthorizationPublicKeyCredentialPRFAssertionInputValues
- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)init;
- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)initWithSaltInput1:(id)a3 saltInput2:(id)a4;
- (NSData)saltInput1;
- (NSData)saltInput2;
@end

@implementation ASAuthorizationPublicKeyCredentialPRFAssertionInputValues

- (NSData)saltInput1
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput1);
  unint64_t v3 = *(void *)&self->saltInput1[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput1];
  sub_2191E4E14(v2, v3);
  v4 = (void *)sub_21922ADF8();
  sub_2191E4AAC(v2, v3);

  return (NSData *)v4;
}

- (NSData)saltInput2
{
  uint64_t v2 = (uint64_t *)((char *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput2);
  unint64_t v3 = *(void *)&self->saltInput1[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput2];
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    uint64_t v5 = *v2;
    sub_2191E4E14(*v2, v3);
    v4 = (void *)sub_21922ADF8();
    sub_2191E4B04(v5, v3);
  }

  return (NSData *)v4;
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)initWithSaltInput1:(id)a3 saltInput2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_21922AE08();
  uint64_t v10 = v9;

  if (v7)
  {
    uint64_t v11 = sub_21922AE08();
    unint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v13 = 0xF000000000000000;
  }
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput1);
  uint64_t *v14 = v8;
  v14[1] = v10;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput2);
  uint64_t *v15 = v11;
  v15[1] = v13;
  v17.receiver = self;
  v17.super_class = (Class)ASAuthorizationPublicKeyCredentialPRFAssertionInputValues;
  return [(ASAuthorizationPublicKeyCredentialPRFAssertionInputValues *)&v17 init];
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)init
{
  result = (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end