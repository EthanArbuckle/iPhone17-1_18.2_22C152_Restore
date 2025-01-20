@interface DMTCertificatePayload
+ (NSSet)supportedPayloadTypes;
- (DMTCertificatePayload)initWithDictionary:(id)a3 error:(id *)a4;
- (NSData)content;
- (NSString)certificateFileName;
- (NSString)password;
@end

@implementation DMTCertificatePayload

+ (NSSet)supportedPayloadTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.security.pem", @"com.apple.security.pkcs1", @"com.apple.security.pkcs12", @"com.apple.security.root", 0);
}

- (DMTCertificatePayload)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMTCertificatePayload;
  v7 = [(DMTConfigurationPrimitive *)&v18 initWithDictionary:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = DMTValidateProfileString(v6, @"PayloadCertificateFileName", 1, a4);
    certificateFileName = v7->_certificateFileName;
    v7->_certificateFileName = (NSString *)v8;

    uint64_t v10 = DMTValidateProfileData(v6, @"PayloadContent", 0, a4);
    content = v7->_content;
    v7->_content = (NSData *)v10;

    v12 = 0;
    if (!*a4)
    {
      v13 = [(DMTConfigurationPrimitive *)v7 type];
      int v14 = [v13 isEqualToString:@"com.apple.security.pkcs12"];

      if (!v14
        || (DMTValidateProfileString(v6, @"Password", 0, a4),
            uint64_t v15 = objc_claimAutoreleasedReturnValue(),
            password = v7->_password,
            v7->_password = (NSString *)v15,
            password,
            v12 = 0,
            !*a4))
      {
        v12 = v7;
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)certificateFileName
{
  return self->_certificateFileName;
}

- (NSData)content
{
  return self->_content;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_certificateFileName, 0);
}

@end