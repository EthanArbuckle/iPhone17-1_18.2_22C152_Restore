@interface CEMPredicateCompositeBudget_Monitors
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithApps:(id)a3 withWebSites:(id)a4 withCategories:(id)a5;
+ (id)buildWithApps:(id)a3 withWebSites:(id)a4 withCategories:(id)a5 withCategoriesVersion2:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadApps;
- (NSArray)payloadCategories;
- (NSArray)payloadCategoriesVersion2;
- (NSArray)payloadWebSites;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadApps:(id)a3;
- (void)setPayloadCategories:(id)a3;
- (void)setPayloadCategoriesVersion2:(id)a3;
- (void)setPayloadWebSites:(id)a3;
@end

@implementation CEMPredicateCompositeBudget_Monitors

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Apps";
  v6[1] = @"WebSites";
  v6[2] = @"Categories";
  v6[3] = @"CategoriesVersion2";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithApps:(id)a3 withWebSites:(id)a4 withCategories:(id)a5 withCategoriesVersion2:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadApps:v12];

  [v13 setPayloadWebSites:v11];
  [v13 setPayloadCategories:v10];

  [v13 setPayloadCategoriesVersion2:v9];

  return v13;
}

+ (id)buildWithApps:(id)a3 withWebSites:(id)a4 withCategories:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_opt_new();
  [v10 setPayloadApps:v9];

  [v10 setPayloadWebSites:v8];
  [v10 setPayloadCategories:v7];

  return v10;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMPredicateCompositeBudget_Monitors allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Apps" validator:&__block_literal_global_178 isRequired:0 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadApps = self->_payloadApps;
  self->_payloadApps = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"WebSites" validator:&__block_literal_global_181 isRequired:0 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadWebSites = self->_payloadWebSites;
    self->_payloadWebSites = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Categories" validator:&__block_literal_global_183 isRequired:0 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadCategories = self->_payloadCategories;
      self->_payloadCategories = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"CategoriesVersion2" validator:&__block_literal_global_185 isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadCategoriesVersion2 = self->_payloadCategoriesVersion2;
        self->_payloadCategoriesVersion2 = v20;
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
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"Apps" withValue:self->_payloadApps itemSerializer:&__block_literal_global_187_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"WebSites" withValue:self->_payloadWebSites itemSerializer:&__block_literal_global_189 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"Categories" withValue:self->_payloadCategories itemSerializer:&__block_literal_global_191 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"CategoriesVersion2" withValue:self->_payloadCategoriesVersion2 itemSerializer:&__block_literal_global_193 isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMPredicateCompositeBudget_Monitors;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadApps copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadWebSites copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadCategories copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadCategoriesVersion2 copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSArray)payloadApps
{
  return self->_payloadApps;
}

- (void)setPayloadApps:(id)a3
{
}

- (NSArray)payloadWebSites
{
  return self->_payloadWebSites;
}

- (void)setPayloadWebSites:(id)a3
{
}

- (NSArray)payloadCategories
{
  return self->_payloadCategories;
}

- (void)setPayloadCategories:(id)a3
{
}

- (NSArray)payloadCategoriesVersion2
{
  return self->_payloadCategoriesVersion2;
}

- (void)setPayloadCategoriesVersion2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCategoriesVersion2, 0);
  objc_storeStrong((id *)&self->_payloadCategories, 0);
  objc_storeStrong((id *)&self->_payloadWebSites, 0);

  objc_storeStrong((id *)&self->_payloadApps, 0);
}

@end