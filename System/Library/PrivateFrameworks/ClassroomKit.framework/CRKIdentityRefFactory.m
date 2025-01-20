@interface CRKIdentityRefFactory
- (CRKIdentityConfiguration)configuration;
- (CRKIdentityRefFactory)init;
- (CRKIdentityRefFactory)initWithConfiguration:(id)a3;
- (__SecIdentity)makeIdentityRefWithError:(id *)a3;
- (const)CMSHashingAlgorithmForSecAlgorithm:(unsigned int)a3;
- (id)certificateParametersWithCMSAlgorithm:(const void *)a3;
- (id)keyParameters;
- (id)subject;
- (void)addClientAndServerAuthEKUsToParameters:(id)a3;
- (void)safeRelease:(void *)a3;
@end

@implementation CRKIdentityRefFactory

- (CRKIdentityRefFactory)init
{
  v3 = objc_opt_new();
  v4 = [(CRKIdentityRefFactory *)self initWithConfiguration:v3];

  return v4;
}

- (CRKIdentityRefFactory)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKIdentityRefFactory;
  v5 = [(CRKIdentityRefFactory *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (CRKIdentityConfiguration *)v6;
  }
  return v5;
}

- (__SecIdentity)makeIdentityRefWithError:(id *)a3
{
  v5 = [(CRKIdentityRefFactory *)self configuration];
  uint64_t v6 = -[CRKIdentityRefFactory CMSHashingAlgorithmForSecAlgorithm:](self, "CMSHashingAlgorithmForSecAlgorithm:", [v5 hashingAlgorithm]);

  if (v6)
  {
    SecKeyRef v15 = 0;
    SecKeyRef publicKey = 0;
    CFDictionaryRef v7 = [(CRKIdentityRefFactory *)self keyParameters];
    uint64_t v8 = SecKeyGeneratePair(v7, &publicKey, &v15);

    objc_super v9 = objc_msgSend(MEMORY[0x263F087E8], "crk_errorForSecurityOSStatus:", v8);
    v10 = v9;
    if (v9)
    {
      if (a3)
      {
        uint64_t SelfSignedCertificate = 0;
        v12 = 0;
        *a3 = v9;
LABEL_11:

        [(CRKIdentityRefFactory *)self safeRelease:publicKey];
        [(CRKIdentityRefFactory *)self safeRelease:v15];
        [(CRKIdentityRefFactory *)self safeRelease:SelfSignedCertificate];
        return v12;
      }
      uint64_t SelfSignedCertificate = 0;
    }
    else
    {
      v13 = [(CRKIdentityRefFactory *)self subject];
      [(CRKIdentityRefFactory *)self certificateParametersWithCMSAlgorithm:v6];
      uint64_t SelfSignedCertificate = SecGenerateSelfSignedCertificate();

      if (SelfSignedCertificate)
      {
        v12 = (__SecIdentity *)SecIdentityCreate();
        goto LABEL_11;
      }
    }
    v12 = 0;
    goto LABEL_11;
  }
  if (!a3) {
    return 0;
  }
  CRKErrorWithCodeAndUserInfo(2, &unk_26D819E48);
  v12 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (void)safeRelease:(void *)a3
{
  if (a3) {
    CFRelease(a3);
  }
}

- (id)subject
{
  v17[2] = *MEMORY[0x263EF8340];
  v15[0] = *MEMORY[0x263F17430];
  v3 = [(CRKIdentityRefFactory *)self configuration];
  id v4 = [v3 commonName];
  v15[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v16 = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  v17[0] = v6;
  v13[0] = *MEMORY[0x263F17420];
  CFDictionaryRef v7 = [(CRKIdentityRefFactory *)self configuration];
  uint64_t v8 = [v7 commonName];
  v13[1] = v8;
  objc_super v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v14 = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v17[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];

  return v11;
}

- (id)keyParameters
{
  v14[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F16FA8];
  v14[0] = *MEMORY[0x263F16FE0];
  uint64_t v4 = *MEMORY[0x263F16F98];
  v13[0] = v3;
  v13[1] = v4;
  v5 = NSNumber;
  uint64_t v6 = [(CRKIdentityRefFactory *)self configuration];
  CFDictionaryRef v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "keySizeInBits"));
  uint64_t v8 = [v7 stringValue];
  v14[1] = v8;
  void v13[2] = *MEMORY[0x263F17000];
  objc_super v9 = [(CRKIdentityRefFactory *)self configuration];
  v10 = [v9 commonName];
  v14[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  return v11;
}

- (id)certificateParametersWithCMSAlgorithm:(const void *)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  v5 = objc_opt_new();
  [v5 setObject:&unk_26D81A120 forKeyedSubscript:*MEMORY[0x263F171B0]];
  v14 = @"rfc822name";
  uint64_t v6 = [(CRKIdentityRefFactory *)self configuration];
  CFDictionaryRef v7 = [v6 emailAddress];
  v15[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F17538]];

  [v5 setObject:a3 forKeyedSubscript:*MEMORY[0x263F17180]];
  objc_super v9 = [(CRKIdentityRefFactory *)self configuration];
  LODWORD(v6) = [v9 createsCertificateAuthority];

  if (v6) {
    [v5 setObject:&unk_26D81A138 forKeyedSubscript:*MEMORY[0x263F17190]];
  }
  v10 = [(CRKIdentityRefFactory *)self configuration];
  int v11 = [v10 addsClientAuthAndServerAuthEKUs];

  if (v11) {
    [(CRKIdentityRefFactory *)self addClientAndServerAuthEKUsToParameters:v5];
  }
  v12 = (void *)[v5 copy];

  return v12;
}

- (void)addClientAndServerAuthEKUsToParameters:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(_OWORD *)objc_super v9 = xmmword_224CC0D40;
  *(void *)&v9[14] = 0x10307050501062BLL;
  uint64_t v3 = (void *)MEMORY[0x263EFF8F8];
  id v4 = a3;
  v5 = [v3 dataWithBytes:v9 length:22];
  CFDictionaryRef v7 = @"2.5.29.37";
  uint64_t v8 = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F171A8]];
}

- (const)CMSHashingAlgorithmForSecAlgorithm:(unsigned int)a3
{
  result = 0;
  switch(a3)
  {
    case 3u:
      id v4 = (const void **)MEMORY[0x263F17150];
      goto LABEL_7;
    case 4u:
      id v4 = (const void **)MEMORY[0x263F17158];
      goto LABEL_7;
    case 6u:
      id v4 = (const void **)MEMORY[0x263F17160];
      goto LABEL_7;
    case 7u:
      id v4 = (const void **)MEMORY[0x263F17168];
      goto LABEL_7;
    case 8u:
      id v4 = (const void **)MEMORY[0x263F17170];
LABEL_7:
      result = *v4;
      break;
    default:
      return result;
  }
  return result;
}

- (CRKIdentityConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end