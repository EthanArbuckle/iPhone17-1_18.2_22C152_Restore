@interface ASPasskeyAssertionCredentialExtensionOutput
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput)largeBlobAssertionOutput;
- (ASPasskeyAssertionCredentialExtensionOutput)initWithCoder:(id)a3;
- (ASPasskeyAssertionCredentialExtensionOutput)initWithLargeBlobOutput:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASPasskeyAssertionCredentialExtensionOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASPasskeyAssertionCredentialExtensionOutput)initWithLargeBlobOutput:(id)a3
{
  id v4 = a3;
  return (ASPasskeyAssertionCredentialExtensionOutput *)sub_2191E5AE8(a3);
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput)largeBlobAssertionOutput
{
  v2 = self;
  id v3 = sub_2191E5E78();

  return (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput *)v3;
}

- (ASPasskeyAssertionCredentialExtensionOutput)initWithCoder:(id)a3
{
  return (ASPasskeyAssertionCredentialExtensionOutput *)ASPasskeyAssertionCredentialExtensionOutput.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions);
  id v5 = a3;
  v6 = self;
  id v7 = v4;
  id v8 = (id)sub_21922B458();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);
}

- (id)copyWithZone:(void *)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions);
  id v5 = objc_allocWithZone((Class)ASPasskeyAssertionCredentialExtensionOutput);
  v6 = self;
  id v7 = v4;
  id v8 = (char *)objc_msgSend(v5, sel_init);
  v9 = *(void **)&v8[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions];
  *(void *)&v8[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions] = v7;

  return v8;
}

- (void).cxx_destruct
{
}

@end