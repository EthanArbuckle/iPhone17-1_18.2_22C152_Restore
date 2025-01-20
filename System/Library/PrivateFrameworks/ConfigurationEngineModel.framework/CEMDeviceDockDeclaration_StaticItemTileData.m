@interface CEMDeviceDockDeclaration_StaticItemTileData
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithLabel:(id)a3 withFileType:(id)a4;
+ (id)buildWithLabel:(id)a3 withUrl:(id)a4 withFileType:(id)a5 withFileData:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMAnyPayload)payloadFileData;
- (NSNumber)payloadFileType;
- (NSString)payloadLabel;
- (NSString)payloadUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadFileData:(id)a3;
- (void)setPayloadFileType:(id)a3;
- (void)setPayloadLabel:(id)a3;
- (void)setPayloadUrl:(id)a3;
@end

@implementation CEMDeviceDockDeclaration_StaticItemTileData

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"label";
  v6[1] = @"url";
  v6[2] = @"file-type";
  v6[3] = @"file-data";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithLabel:(id)a3 withUrl:(id)a4 withFileType:(id)a5 withFileData:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadLabel:v12];

  [v13 setPayloadUrl:v11];
  [v13 setPayloadFileType:v10];

  [v13 setPayloadFileData:v9];

  return v13;
}

+ (id)buildRequiredOnlyWithLabel:(id)a3 withFileType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadLabel:v6];

  [v7 setPayloadFileType:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMDeviceDockDeclaration_StaticItemTileData allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"label" isRequired:1 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadLabel = self->_payloadLabel;
  self->_payloadLabel = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"url" isRequired:0 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadUrl = self->_payloadUrl;
    self->_payloadUrl = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"file-type" isRequired:1 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadFileType = self->_payloadFileType;
      self->_payloadFileType = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"file-data" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadFileData = self->_payloadFileData;
        self->_payloadFileData = v20;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"label" withValue:self->_payloadLabel isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"url" withValue:self->_payloadUrl isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"file-type" withValue:self->_payloadFileType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v4 withKey:@"file-data" withValue:self->_payloadFileData dictSerializer:&__block_literal_global_370 isRequired:0 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMDeviceDockDeclaration_StaticItemTileData;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadLabel copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadUrl copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadFileType copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(CEMAnyPayload *)self->_payloadFileData copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadLabel
{
  return self->_payloadLabel;
}

- (void)setPayloadLabel:(id)a3
{
}

- (NSString)payloadUrl
{
  return self->_payloadUrl;
}

- (void)setPayloadUrl:(id)a3
{
}

- (NSNumber)payloadFileType
{
  return self->_payloadFileType;
}

- (void)setPayloadFileType:(id)a3
{
}

- (CEMAnyPayload)payloadFileData
{
  return self->_payloadFileData;
}

- (void)setPayloadFileData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFileData, 0);
  objc_storeStrong((id *)&self->_payloadFileType, 0);
  objc_storeStrong((id *)&self->_payloadUrl, 0);

  objc_storeStrong((id *)&self->_payloadLabel, 0);
}

@end