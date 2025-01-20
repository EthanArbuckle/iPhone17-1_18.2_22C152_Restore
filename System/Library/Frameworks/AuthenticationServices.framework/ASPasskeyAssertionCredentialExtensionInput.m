@interface ASPasskeyAssertionCredentialExtensionInput
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)largeBlob;
- (ASPasskeyAssertionCredentialExtensionInput)init;
- (ASPasskeyAssertionCredentialExtensionInput)initWithCoder:(id)a3;
- (ASPasskeyAssertionCredentialExtensionInput)initWithCoreExtensions:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASPasskeyAssertionCredentialExtensionInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)largeBlob
{
  v2 = self;
  id v3 = sub_2191E3C3C();

  return (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *)v3;
}

- (ASPasskeyAssertionCredentialExtensionInput)initWithCoreExtensions:(id)a3
{
  v4 = (objc_class *)a3;
  v5 = [(ASPasskeyAssertionCredentialExtensionInput *)self init];
  v6 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions) = v4;

  return v5;
}

- (ASPasskeyAssertionCredentialExtensionInput)initWithCoder:(id)a3
{
  sub_21922B138();
  id v5 = a3;
  uint64_t v6 = sub_21922B5D8();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(ASPasskeyAssertionCredentialExtensionInput *)self initWithCoreExtensions:v6];

    return v8;
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions);
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = v4;
  id v8 = (id)sub_21922B458();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions);
  id v4 = objc_allocWithZone((Class)ASPasskeyAssertionCredentialExtensionInput);

  return objc_msgSend(v4, sel_initWithCoreExtensions_, v3);
}

- (ASPasskeyAssertionCredentialExtensionInput)init
{
  uint64_t v3 = OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions;
  id v4 = objc_allocWithZone((Class)sub_21922B138());
  id v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)ASPasskeyAssertionCredentialExtensionInput;
  return [(ASPasskeyAssertionCredentialExtensionInput *)&v7 init];
}

- (void).cxx_destruct
{
}

@end