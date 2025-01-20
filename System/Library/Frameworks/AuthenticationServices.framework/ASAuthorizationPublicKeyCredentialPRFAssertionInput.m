@interface ASAuthorizationPublicKeyCredentialPRFAssertionInput
- (ASAuthorizationPublicKeyCredentialPRFAssertionInput)init;
- (ASAuthorizationPublicKeyCredentialPRFAssertionInput)initWithInputValues:(id)a3 perCredentialInputValues:(id)a4;
- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)inputValues;
- (NSDictionary)perCredentialInputValues;
@end

@implementation ASAuthorizationPublicKeyCredentialPRFAssertionInput

- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)inputValues
{
  return (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues *)*(id *)((char *)&self->super.isa + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_inputValues);
}

- (NSDictionary)perCredentialInputValues
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_perCredentialInputValues))
  {
    type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionInputValues((uint64_t)self);
    sub_2191F4688();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_21922B418();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSDictionary *)v2;
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInput)initWithInputValues:(id)a3 perCredentialInputValues:(id)a4
{
  if (a4)
  {
    type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionInputValues((uint64_t)self);
    sub_2191F4688();
    v6 = (objc_class *)sub_21922B428();
  }
  else
  {
    v6 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_inputValues) = (Class)a3;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_perCredentialInputValues) = v6;
  v9.receiver = self;
  v9.super_class = (Class)ASAuthorizationPublicKeyCredentialPRFAssertionInput;
  id v7 = a3;
  return [(ASAuthorizationPublicKeyCredentialPRFAssertionInput *)&v9 init];
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInput)init
{
  result = (ASAuthorizationPublicKeyCredentialPRFAssertionInput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_inputValues));

  swift_bridgeObjectRelease();
}

@end