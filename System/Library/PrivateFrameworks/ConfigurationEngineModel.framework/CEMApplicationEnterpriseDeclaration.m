@interface CEMApplicationEnterpriseDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withAppPackage:(id)a6 withAppPackageHashMD5:(id)a7;
+ (id)buildWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withAppPackage:(id)a6 withAppPackageHashMD5:(id)a7 withDisplayImage:(id)a8 withDisplayImageHashMD5:(id)a9 withFullSizeImage:(id)a10 withFullSizeImageHashMD5:(id)a11;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMApplicationEnterpriseDeclaration_AppPackage)payloadAppPackage;
- (CEMAssetBaseDescriptor)payloadDescriptor;
- (NSString)payloadAppPackageHashMD5;
- (NSString)payloadBundleIdentifier;
- (NSString)payloadDisplayImage;
- (NSString)payloadDisplayImageHashMD5;
- (NSString)payloadFullSizeImage;
- (NSString)payloadFullSizeImageHashMD5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAppPackage:(id)a3;
- (void)setPayloadAppPackageHashMD5:(id)a3;
- (void)setPayloadBundleIdentifier:(id)a3;
- (void)setPayloadDescriptor:(id)a3;
- (void)setPayloadDisplayImage:(id)a3;
- (void)setPayloadDisplayImageHashMD5:(id)a3;
- (void)setPayloadFullSizeImage:(id)a3;
- (void)setPayloadFullSizeImageHashMD5:(id)a3;
@end

@implementation CEMApplicationEnterpriseDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.asset.application.enterprise";
}

+ (NSSet)allowedPayloadKeys
{
  v6[8] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Descriptor";
  v6[1] = @"BundleIdentifier";
  v6[2] = @"AppPackage";
  v6[3] = @"AppPackage-Hash-MD5";
  v6[4] = @"DisplayImage";
  v6[5] = @"DisplayImage-Hash-MD5";
  v6[6] = @"FullSizeImage";
  v6[7] = @"FullSizeImage-Hash-MD5";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withAppPackage:(id)a6 withAppPackageHashMD5:(id)a7 withDisplayImage:(id)a8 withDisplayImageHashMD5:(id)a9 withFullSizeImage:(id)a10 withFullSizeImageHashMD5:(id)a11
{
  id v16 = a3;
  id v29 = a11;
  id v27 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  v23 = objc_opt_new();
  [v23 setDeclarationType:@"com.apple.asset.application.enterprise"];
  if (v16)
  {
    [v23 setDeclarationIdentifier:v16];
  }
  else
  {
    v24 = [MEMORY[0x263F08C38] UUID];
    v25 = [v24 UUIDString];
    [v23 setDeclarationIdentifier:v25];
  }
  objc_msgSend(v23, "setPayloadDescriptor:", v22, v27);

  [v23 setPayloadBundleIdentifier:v21];
  [v23 setPayloadAppPackage:v20];

  [v23 setPayloadAppPackageHashMD5:v19];
  [v23 setPayloadDisplayImage:v18];

  [v23 setPayloadDisplayImageHashMD5:v17];
  [v23 setPayloadFullSizeImage:v28];

  [v23 setPayloadFullSizeImageHashMD5:v29];
  [v23 updateServerHash];

  return v23;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withAppPackage:(id)a6 withAppPackageHashMD5:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.asset.application.enterprise"];
  if (v11)
  {
    [v16 setDeclarationIdentifier:v11];
  }
  else
  {
    id v17 = [MEMORY[0x263F08C38] UUID];
    id v18 = [v17 UUIDString];
    [v16 setDeclarationIdentifier:v18];
  }
  [v16 setPayloadDescriptor:v15];

  [v16 setPayloadBundleIdentifier:v14];
  [v16 setPayloadAppPackage:v13];

  [v16 setPayloadAppPackageHashMD5:v12];
  [v16 updateServerHash];

  return v16;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationEnterpriseDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v38 = 0;
  id v13 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"Descriptor" classType:objc_opt_class() isRequired:1 defaultValue:0 error:&v38];
  id v14 = v38;
  payloadDescriptor = self->_payloadDescriptor;
  self->_payloadDescriptor = v13;

  if (!v14)
  {
    id v37 = 0;
    id v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleIdentifier" isRequired:1 defaultValue:0 error:&v37];
    id v14 = v37;
    payloadBundleIdentifier = self->_payloadBundleIdentifier;
    self->_payloadBundleIdentifier = v16;

    if (!v14)
    {
      id v36 = 0;
      id v18 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"AppPackage" classType:objc_opt_class() isRequired:1 defaultValue:0 error:&v36];
      id v14 = v36;
      payloadAppPackage = self->_payloadAppPackage;
      self->_payloadAppPackage = v18;

      if (!v14)
      {
        id v35 = 0;
        id v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AppPackage-Hash-MD5" isRequired:1 defaultValue:0 error:&v35];
        id v14 = v35;
        payloadAppPackageHashMD5 = self->_payloadAppPackageHashMD5;
        self->_payloadAppPackageHashMD5 = v20;

        if (!v14)
        {
          id v34 = 0;
          id v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DisplayImage" isRequired:0 defaultValue:0 error:&v34];
          id v14 = v34;
          payloadDisplayImage = self->_payloadDisplayImage;
          self->_payloadDisplayImage = v22;

          if (!v14)
          {
            id v33 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DisplayImage-Hash-MD5" isRequired:0 defaultValue:0 error:&v33];
            id v14 = v33;
            payloadDisplayImageHashMD5 = self->_payloadDisplayImageHashMD5;
            self->_payloadDisplayImageHashMD5 = v24;

            if (!v14)
            {
              id v32 = 0;
              v26 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"FullSizeImage" isRequired:0 defaultValue:0 error:&v32];
              id v14 = v32;
              payloadFullSizeImage = self->_payloadFullSizeImage;
              self->_payloadFullSizeImage = v26;

              if (!v14)
              {
                id v31 = 0;
                v28 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"FullSizeImage-Hash-MD5" isRequired:0 defaultValue:0 error:&v31];
                id v14 = v31;
                payloadFullSizeImageHashMD5 = self->_payloadFullSizeImageHashMD5;
                self->_payloadFullSizeImageHashMD5 = v28;
              }
            }
          }
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
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  payloadDescriptor = self->_payloadDescriptor;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__CEMApplicationEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_2642C87E8;
  id v7 = v4;
  id v19 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"Descriptor" withValue:payloadDescriptor dictSerializer:v18 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"BundleIdentifier" withValue:self->_payloadBundleIdentifier isRequired:1 defaultValue:0];
  payloadAppPackage = self->_payloadAppPackage;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__CEMApplicationEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v16[3] = &unk_2642C87E8;
  id v9 = v7;
  id v17 = v9;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"AppPackage" withValue:payloadAppPackage dictSerializer:v16 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AppPackage-Hash-MD5" withValue:self->_payloadAppPackageHashMD5 isRequired:1 defaultValue:0];
  payloadDisplayImage = self->_payloadDisplayImage;
  if (payloadDisplayImage)
  {
    id v11 = [v9 objectForKeyedSubscript:self->_payloadDisplayImage];
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"DisplayImage" withValue:payloadDisplayImage assetProvider:v11 transformType:@"<url>" isRequired:0 defaultValue:&stru_26C838878];
  }
  else
  {
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"DisplayImage" withValue:0 assetProvider:0 transformType:@"<url>" isRequired:0 defaultValue:&stru_26C838878];
  }
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"DisplayImage-Hash-MD5" withValue:self->_payloadDisplayImageHashMD5 isRequired:0 defaultValue:0];
  payloadFullSizeImage = self->_payloadFullSizeImage;
  if (payloadFullSizeImage)
  {
    id v13 = [v9 objectForKeyedSubscript:self->_payloadFullSizeImage];
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"FullSizeImage" withValue:payloadFullSizeImage assetProvider:v13 transformType:@"<url>" isRequired:0 defaultValue:&stru_26C838878];
  }
  else
  {
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"FullSizeImage" withValue:0 assetProvider:0 transformType:@"<url>" isRequired:0 defaultValue:&stru_26C838878];
  }
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"FullSizeImage-Hash-MD5" withValue:self->_payloadFullSizeImageHashMD5 isRequired:0 defaultValue:0];
  id v14 = (void *)[v5 copy];

  return v14;
}

uint64_t __74__CEMApplicationEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __74__CEMApplicationEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CEMApplicationEnterpriseDeclaration;
  id v4 = [(CEMDeclarationBase *)&v22 copyWithZone:a3];
  uint64_t v5 = [(CEMAssetBaseDescriptor *)self->_payloadDescriptor copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadBundleIdentifier copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(CEMApplicationEnterpriseDeclaration_AppPackage *)self->_payloadAppPackage copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadAppPackageHashMD5 copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_payloadDisplayImage copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadDisplayImageHashMD5 copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSString *)self->_payloadFullSizeImage copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSString *)self->_payloadFullSizeImageHashMD5 copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  return v4;
}

- (CEMAssetBaseDescriptor)payloadDescriptor
{
  return self->_payloadDescriptor;
}

- (void)setPayloadDescriptor:(id)a3
{
}

- (NSString)payloadBundleIdentifier
{
  return self->_payloadBundleIdentifier;
}

- (void)setPayloadBundleIdentifier:(id)a3
{
}

- (CEMApplicationEnterpriseDeclaration_AppPackage)payloadAppPackage
{
  return self->_payloadAppPackage;
}

- (void)setPayloadAppPackage:(id)a3
{
}

- (NSString)payloadAppPackageHashMD5
{
  return self->_payloadAppPackageHashMD5;
}

- (void)setPayloadAppPackageHashMD5:(id)a3
{
}

- (NSString)payloadDisplayImage
{
  return self->_payloadDisplayImage;
}

- (void)setPayloadDisplayImage:(id)a3
{
}

- (NSString)payloadDisplayImageHashMD5
{
  return self->_payloadDisplayImageHashMD5;
}

- (void)setPayloadDisplayImageHashMD5:(id)a3
{
}

- (NSString)payloadFullSizeImage
{
  return self->_payloadFullSizeImage;
}

- (void)setPayloadFullSizeImage:(id)a3
{
}

- (NSString)payloadFullSizeImageHashMD5
{
  return self->_payloadFullSizeImageHashMD5;
}

- (void)setPayloadFullSizeImageHashMD5:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFullSizeImageHashMD5, 0);
  objc_storeStrong((id *)&self->_payloadFullSizeImage, 0);
  objc_storeStrong((id *)&self->_payloadDisplayImageHashMD5, 0);
  objc_storeStrong((id *)&self->_payloadDisplayImage, 0);
  objc_storeStrong((id *)&self->_payloadAppPackageHashMD5, 0);
  objc_storeStrong((id *)&self->_payloadAppPackage, 0);
  objc_storeStrong((id *)&self->_payloadBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_payloadDescriptor, 0);
}

uint64_t __68__CEMApplicationEnterpriseDeclaration_AppPackage_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __85__CEMApplicationEnterpriseDeclaration_AppPackage_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

@end