@interface CEMApplicationEnterpriseDeclaration_AppPackage
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithDataURL:(id)a3 withContentType:(id)a4 withSize:(id)a5 withHashSHA256:(id)a6;
+ (id)buildWithDataURL:(id)a3 withContentType:(id)a4 withSize:(id)a5 withHashSHA256:(id)a6 withCertificatePinningIdentifiers:(id)a7;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadCertificatePinningIdentifiers;
- (NSNumber)payloadSize;
- (NSString)payloadContentType;
- (NSString)payloadDataURL;
- (NSString)payloadHashSHA256;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadCertificatePinningIdentifiers:(id)a3;
- (void)setPayloadContentType:(id)a3;
- (void)setPayloadDataURL:(id)a3;
- (void)setPayloadHashSHA256:(id)a3;
- (void)setPayloadSize:(id)a3;
@end

@implementation CEMApplicationEnterpriseDeclaration_AppPackage

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"DataURL";
  v6[1] = @"ContentType";
  v6[2] = @"Size";
  v6[3] = @"Hash-SHA-256";
  v6[4] = @"CertificatePinningIdentifiers";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDataURL:(id)a3 withContentType:(id)a4 withSize:(id)a5 withHashSHA256:(id)a6 withCertificatePinningIdentifiers:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setPayloadDataURL:v15];

  [v16 setPayloadContentType:v14];
  [v16 setPayloadSize:v13];

  [v16 setPayloadHashSHA256:v12];
  [v16 setPayloadCertificatePinningIdentifiers:v11];

  return v16;
}

+ (id)buildRequiredOnlyWithDataURL:(id)a3 withContentType:(id)a4 withSize:(id)a5 withHashSHA256:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_opt_new();
  [v13 setPayloadDataURL:v12];

  [v13 setPayloadContentType:v11];
  [v13 setPayloadSize:v10];

  [v13 setPayloadHashSHA256:v9];

  return v13;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMApplicationEnterpriseDeclaration_AppPackage allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DataURL" isRequired:1 defaultValue:0 error:&v29];
  id v14 = v29;
  payloadDataURL = self->_payloadDataURL;
  self->_payloadDataURL = v13;

  if (!v14)
  {
    id v28 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ContentType" isRequired:1 defaultValue:0 error:&v28];
    id v14 = v28;
    payloadContentType = self->_payloadContentType;
    self->_payloadContentType = v16;

    if (!v14)
    {
      id v27 = 0;
      v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Size" isRequired:1 defaultValue:0 error:&v27];
      id v14 = v27;
      payloadSize = self->_payloadSize;
      self->_payloadSize = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Hash-SHA-256" isRequired:1 defaultValue:0 error:&v26];
        id v14 = v26;
        payloadHashSHA256 = self->_payloadHashSHA256;
        self->_payloadHashSHA256 = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"CertificatePinningIdentifiers" validator:&__block_literal_global_2 isRequired:0 defaultValue:0 error:&v25];
          id v14 = v25;
          payloadCertificatePinningIdentifiers = self->_payloadCertificatePinningIdentifiers;
          self->_payloadCertificatePinningIdentifiers = v22;
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"DataURL" withValue:self->_payloadDataURL isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ContentType" withValue:self->_payloadContentType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Size" withValue:self->_payloadSize isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Hash-SHA-256" withValue:self->_payloadHashSHA256 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"CertificatePinningIdentifiers" withValue:self->_payloadCertificatePinningIdentifiers itemSerializer:&__block_literal_global_166 isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMApplicationEnterpriseDeclaration_AppPackage;
  v4 = [(CEMPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadDataURL copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadContentType copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadSize copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadHashSHA256 copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSArray *)self->_payloadCertificatePinningIdentifiers copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)payloadDataURL
{
  return self->_payloadDataURL;
}

- (void)setPayloadDataURL:(id)a3
{
}

- (NSString)payloadContentType
{
  return self->_payloadContentType;
}

- (void)setPayloadContentType:(id)a3
{
}

- (NSNumber)payloadSize
{
  return self->_payloadSize;
}

- (void)setPayloadSize:(id)a3
{
}

- (NSString)payloadHashSHA256
{
  return self->_payloadHashSHA256;
}

- (void)setPayloadHashSHA256:(id)a3
{
}

- (NSArray)payloadCertificatePinningIdentifiers
{
  return self->_payloadCertificatePinningIdentifiers;
}

- (void)setPayloadCertificatePinningIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCertificatePinningIdentifiers, 0);
  objc_storeStrong((id *)&self->_payloadHashSHA256, 0);
  objc_storeStrong((id *)&self->_payloadSize, 0);
  objc_storeStrong((id *)&self->_payloadContentType, 0);

  objc_storeStrong((id *)&self->_payloadDataURL, 0);
}

@end