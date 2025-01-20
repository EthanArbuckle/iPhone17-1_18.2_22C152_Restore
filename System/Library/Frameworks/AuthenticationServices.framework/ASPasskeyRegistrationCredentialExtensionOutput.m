@interface ASPasskeyRegistrationCredentialExtensionOutput
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput)largeBlobRegistrationOutput;
- (ASPasskeyRegistrationCredentialExtensionOutput)initWithCoder:(id)a3;
- (ASPasskeyRegistrationCredentialExtensionOutput)initWithLargeBlobOutput:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASPasskeyRegistrationCredentialExtensionOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASPasskeyRegistrationCredentialExtensionOutput)initWithLargeBlobOutput:(id)a3
{
  id v4 = a3;
  return (ASPasskeyRegistrationCredentialExtensionOutput *)sub_2191E6EC8(a3);
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput)largeBlobRegistrationOutput
{
  v2 = self;
  id v3 = sub_2191E70AC();

  return (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *)v3;
}

- (ASPasskeyRegistrationCredentialExtensionOutput)initWithCoder:(id)a3
{
  return (ASPasskeyRegistrationCredentialExtensionOutput *)ASPasskeyRegistrationCredentialExtensionOutput.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions);
  id v5 = a3;
  v6 = self;
  id v7 = v4;
  id v8 = (id)sub_21922B458();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);
}

- (id)copyWithZone:(void *)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions);
  id v5 = objc_allocWithZone((Class)ASPasskeyRegistrationCredentialExtensionOutput);
  v6 = self;
  id v7 = v4;
  id v8 = (char *)objc_msgSend(v5, sel_init);
  v9 = *(void **)&v8[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions];
  *(void *)&v8[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions] = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions));
}

@end