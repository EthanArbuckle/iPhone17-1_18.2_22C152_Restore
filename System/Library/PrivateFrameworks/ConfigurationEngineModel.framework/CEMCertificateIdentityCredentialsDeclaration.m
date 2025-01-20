@interface CEMCertificateIdentityCredentialsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithCertificate:(id)a3;
+ (id)buildWithCertificate:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSData)payloadCertificate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setPayloadCertificate:(id)a3;
@end

@implementation CEMCertificateIdentityCredentialsDeclaration

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Certificate";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithCertificate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadCertificate:v3];

  return v4;
}

+ (id)buildRequiredOnlyWithCertificate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadCertificate:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  v8 = [v7 allKeys];
  v9 = [v6 setWithArray:v8];

  v10 = +[CEMCertificateIdentityCredentialsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v17 = 0;
  v13 = [(CEMPayloadBase *)self loadDataFromDictionary:v7 withKey:@"Certificate" isRequired:1 defaultValue:0 error:&v17];

  id v14 = v17;
  payloadCertificate = self->_payloadCertificate;
  self->_payloadCertificate = v13;

  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayload
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeDataIntoDictionary:v3 withKey:@"Certificate" withValue:self->_payloadCertificate isRequired:1 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMCertificateIdentityCredentialsDeclaration;
  v4 = [(CEMPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSData *)self->_payloadCertificate copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSData)payloadCertificate
{
  return self->_payloadCertificate;
}

- (void)setPayloadCertificate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end