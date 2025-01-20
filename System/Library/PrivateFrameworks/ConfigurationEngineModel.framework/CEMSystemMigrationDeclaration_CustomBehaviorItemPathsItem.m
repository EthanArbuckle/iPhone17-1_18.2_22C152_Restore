@interface CEMSystemMigrationDeclaration_CustomBehaviorItemPathsItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithSourcePath:(id)a3 withSourcePathInUserHome:(id)a4 withTargetPath:(id)a5 withTargetPathInUserHome:(id)a6;
+ (id)buildWithSourcePath:(id)a3 withSourcePathInUserHome:(id)a4 withTargetPath:(id)a5 withTargetPathInUserHome:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadSourcePathInUserHome;
- (NSNumber)payloadTargetPathInUserHome;
- (NSString)payloadSourcePath;
- (NSString)payloadTargetPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadSourcePath:(id)a3;
- (void)setPayloadSourcePathInUserHome:(id)a3;
- (void)setPayloadTargetPath:(id)a3;
- (void)setPayloadTargetPathInUserHome:(id)a3;
@end

@implementation CEMSystemMigrationDeclaration_CustomBehaviorItemPathsItem

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"SourcePath";
  v6[1] = @"SourcePathInUserHome";
  v6[2] = @"TargetPath";
  v6[3] = @"TargetPathInUserHome";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithSourcePath:(id)a3 withSourcePathInUserHome:(id)a4 withTargetPath:(id)a5 withTargetPathInUserHome:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadSourcePath:v12];

  [v13 setPayloadSourcePathInUserHome:v11];
  [v13 setPayloadTargetPath:v10];

  [v13 setPayloadTargetPathInUserHome:v9];

  return v13;
}

+ (id)buildRequiredOnlyWithSourcePath:(id)a3 withSourcePathInUserHome:(id)a4 withTargetPath:(id)a5 withTargetPathInUserHome:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadSourcePath:v12];

  [v13 setPayloadSourcePathInUserHome:v11];
  [v13 setPayloadTargetPath:v10];

  [v13 setPayloadTargetPathInUserHome:v9];

  return v13;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMSystemMigrationDeclaration_CustomBehaviorItemPathsItem allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SourcePath" isRequired:1 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadSourcePath = self->_payloadSourcePath;
  self->_payloadSourcePath = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SourcePathInUserHome" isRequired:1 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadSourcePathInUserHome = self->_payloadSourcePathInUserHome;
    self->_payloadSourcePathInUserHome = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"TargetPath" isRequired:1 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadTargetPath = self->_payloadTargetPath;
      self->_payloadTargetPath = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"TargetPathInUserHome" isRequired:1 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadTargetPathInUserHome = self->_payloadTargetPathInUserHome;
        self->_payloadTargetPathInUserHome = v20;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"SourcePath" withValue:self->_payloadSourcePath isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"SourcePathInUserHome" withValue:self->_payloadSourcePathInUserHome isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"TargetPath" withValue:self->_payloadTargetPath isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"TargetPathInUserHome" withValue:self->_payloadTargetPathInUserHome isRequired:1 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMSystemMigrationDeclaration_CustomBehaviorItemPathsItem;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadSourcePath copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadSourcePathInUserHome copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadTargetPath copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadTargetPathInUserHome copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadSourcePath
{
  return self->_payloadSourcePath;
}

- (void)setPayloadSourcePath:(id)a3
{
}

- (NSNumber)payloadSourcePathInUserHome
{
  return self->_payloadSourcePathInUserHome;
}

- (void)setPayloadSourcePathInUserHome:(id)a3
{
}

- (NSString)payloadTargetPath
{
  return self->_payloadTargetPath;
}

- (void)setPayloadTargetPath:(id)a3
{
}

- (NSNumber)payloadTargetPathInUserHome
{
  return self->_payloadTargetPathInUserHome;
}

- (void)setPayloadTargetPathInUserHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTargetPathInUserHome, 0);
  objc_storeStrong((id *)&self->_payloadTargetPath, 0);
  objc_storeStrong((id *)&self->_payloadSourcePathInUserHome, 0);

  objc_storeStrong((id *)&self->_payloadSourcePath, 0);
}

@end