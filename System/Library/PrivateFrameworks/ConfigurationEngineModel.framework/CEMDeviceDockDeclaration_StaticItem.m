@interface CEMDeviceDockDeclaration_StaticItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithTileData:(id)a3 withTileType:(id)a4;
+ (id)buildWithTileData:(id)a3 withTileType:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMDeviceDockDeclaration_StaticItemTileData)payloadTileData;
- (NSString)payloadTileType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadTileData:(id)a3;
- (void)setPayloadTileType:(id)a3;
@end

@implementation CEMDeviceDockDeclaration_StaticItem

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"tile-data";
  v6[1] = @"tile-type";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithTileData:(id)a3 withTileType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadTileData:v6];

  [v7 setPayloadTileType:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithTileData:(id)a3 withTileType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadTileData:v6];

  [v7 setPayloadTileType:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceDockDeclaration_StaticItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"tile-data" classType:objc_opt_class() isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadTileData = self->_payloadTileData;
  self->_payloadTileData = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"tile-type" isRequired:1 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadTileType = self->_payloadTileType;
    self->_payloadTileType = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  payloadTileData = self->_payloadTileData;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__CEMDeviceDockDeclaration_StaticItem_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_2642C87E8;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"tile-data" withValue:payloadTileData dictSerializer:v10 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"tile-type" withValue:self->_payloadTileType isRequired:1 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMDeviceDockDeclaration_StaticItem;
  id v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(CEMDeviceDockDeclaration_StaticItemTileData *)self->_payloadTileData copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadTileType copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (CEMDeviceDockDeclaration_StaticItemTileData)payloadTileData
{
  return self->_payloadTileData;
}

- (void)setPayloadTileData:(id)a3
{
}

- (NSString)payloadTileType
{
  return self->_payloadTileType;
}

- (void)setPayloadTileType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTileType, 0);

  objc_storeStrong((id *)&self->_payloadTileData, 0);
}

@end