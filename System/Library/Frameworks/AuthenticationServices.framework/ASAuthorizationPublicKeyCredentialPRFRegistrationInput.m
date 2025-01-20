@interface ASAuthorizationPublicKeyCredentialPRFRegistrationInput
+ (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)checkForSupport;
- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)inputValues;
- (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)init;
- (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)initWithInputValues:(id)a3;
- (BOOL)shouldCheckForSupport;
@end

@implementation ASAuthorizationPublicKeyCredentialPRFRegistrationInput

+ (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)checkForSupport
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialPRFRegistrationInput), sel_initWithInputValues_, 0);

  return (ASAuthorizationPublicKeyCredentialPRFRegistrationInput *)v2;
}

- (BOOL)shouldCheckForSupport
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_shouldCheckForSupport);
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)inputValues
{
  return (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues *)*(id *)((char *)&self->super.isa + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_inputValues);
}

- (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)initWithInputValues:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_shouldCheckForSupport) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_inputValues) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)ASAuthorizationPublicKeyCredentialPRFRegistrationInput;
  id v3 = a3;
  return [(ASAuthorizationPublicKeyCredentialPRFRegistrationInput *)&v5 init];
}

- (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)init
{
  result = (ASAuthorizationPublicKeyCredentialPRFRegistrationInput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_inputValues));
}

@end