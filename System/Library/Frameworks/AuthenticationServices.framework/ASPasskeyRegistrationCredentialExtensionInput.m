@interface ASPasskeyRegistrationCredentialExtensionInput
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)largeBlob;
- (ASPasskeyRegistrationCredentialExtensionInput)init;
- (ASPasskeyRegistrationCredentialExtensionInput)initWithCoder:(id)a3;
- (ASPasskeyRegistrationCredentialExtensionInput)initWithCoreExtensions:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASPasskeyRegistrationCredentialExtensionInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)largeBlob
{
  v2 = self;
  id v3 = sub_2192040E8();

  return (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput *)v3;
}

- (ASPasskeyRegistrationCredentialExtensionInput)initWithCoreExtensions:(id)a3
{
  v4 = (objc_class *)a3;
  v5 = [(ASPasskeyRegistrationCredentialExtensionInput *)self init];
  v6 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions) = v4;

  return v5;
}

- (ASPasskeyRegistrationCredentialExtensionInput)initWithCoder:(id)a3
{
  return (ASPasskeyRegistrationCredentialExtensionInput *)ASPasskeyRegistrationCredentialExtensionInput.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions);
  id v5 = a3;
  v6 = self;
  id v7 = v4;
  id v8 = (id)sub_21922B458();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_21922B878();
}

- (ASPasskeyRegistrationCredentialExtensionInput)init
{
  uint64_t v3 = OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions;
  id v4 = objc_allocWithZone((Class)sub_21922B2D8());
  id v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)ASPasskeyRegistrationCredentialExtensionInput;
  return [(ASPasskeyRegistrationCredentialExtensionInput *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions));
}

@end