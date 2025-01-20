@interface CEMDeviceHomeScreenLayoutDeclaration_IconItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithType:(id)a3;
+ (id)buildWithType:(id)a3 withDisplayName:(id)a4 withBundleID:(id)a5 withPages:(id)a6 withURL:(id)a7;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadPages;
- (NSString)payloadBundleID;
- (NSString)payloadDisplayName;
- (NSString)payloadType;
- (NSString)payloadURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadBundleID:(id)a3;
- (void)setPayloadDisplayName:(id)a3;
- (void)setPayloadPages:(id)a3;
- (void)setPayloadType:(id)a3;
- (void)setPayloadURL:(id)a3;
@end

@implementation CEMDeviceHomeScreenLayoutDeclaration_IconItem

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v6[1] = @"DisplayName";
  v6[2] = @"BundleID";
  v6[3] = @"Pages";
  v6[4] = @"URL";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithType:(id)a3 withDisplayName:(id)a4 withBundleID:(id)a5 withPages:(id)a6 withURL:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setPayloadType:v15];

  [v16 setPayloadDisplayName:v14];
  [v16 setPayloadBundleID:v13];

  [v16 setPayloadPages:v12];
  [v16 setPayloadURL:v11];

  return v16;
}

+ (id)buildRequiredOnlyWithType:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadType:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceHomeScreenLayoutDeclaration_IconItem allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Type" isRequired:1 defaultValue:0 error:&v29];
  id v14 = v29;
  payloadType = self->_payloadType;
  self->_payloadType = v13;

  if (!v14)
  {
    id v28 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DisplayName" isRequired:0 defaultValue:0 error:&v28];
    id v14 = v28;
    payloadDisplayName = self->_payloadDisplayName;
    self->_payloadDisplayName = v16;

    if (!v14)
    {
      id v27 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleID" isRequired:0 defaultValue:0 error:&v27];
      id v14 = v27;
      payloadBundleID = self->_payloadBundleID;
      self->_payloadBundleID = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Pages" classType:objc_opt_class() nested:1 isRequired:0 defaultValue:0 error:&v26];
        id v14 = v26;
        payloadPages = self->_payloadPages;
        self->_payloadPages = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"URL" isRequired:0 defaultValue:0 error:&v25];
          id v14 = v25;
          payloadURL = self->_payloadURL;
          self->_payloadURL = v22;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Type" withValue:self->_payloadType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"DisplayName" withValue:self->_payloadDisplayName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"BundleID" withValue:self->_payloadBundleID isRequired:0 defaultValue:0];
  payloadPages = self->_payloadPages;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__CEMDeviceHomeScreenLayoutDeclaration_IconItem_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_2642C8C58;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"Pages" withValue:payloadPages itemSerializer:v10 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"URL" withValue:self->_payloadURL isRequired:0 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMDeviceHomeScreenLayoutDeclaration_IconItem;
  id v4 = [(CEMPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadDisplayName copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadBundleID copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadPages copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_payloadURL copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
}

- (NSString)payloadDisplayName
{
  return self->_payloadDisplayName;
}

- (void)setPayloadDisplayName:(id)a3
{
}

- (NSString)payloadBundleID
{
  return self->_payloadBundleID;
}

- (void)setPayloadBundleID:(id)a3
{
}

- (NSArray)payloadPages
{
  return self->_payloadPages;
}

- (void)setPayloadPages:(id)a3
{
}

- (NSString)payloadURL
{
  return self->_payloadURL;
}

- (void)setPayloadURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadURL, 0);
  objc_storeStrong((id *)&self->_payloadPages, 0);
  objc_storeStrong((id *)&self->_payloadBundleID, 0);
  objc_storeStrong((id *)&self->_payloadDisplayName, 0);

  objc_storeStrong((id *)&self->_payloadType, 0);
}

@end