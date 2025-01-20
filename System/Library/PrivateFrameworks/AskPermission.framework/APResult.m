@interface APResult
- (APResult)initWithBundleIdentifier:(id)a3 buyParams:(id)a4 itemIdentifier:(id)a5 productType:(id)a6;
- (APResult)initWithDictionary:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)buyParams;
- (NSString)itemIdentifier;
- (NSString)productType;
- (id)compile;
- (id)description;
@end

@implementation APResult

- (APResult)initWithBundleIdentifier:(id)a3 buyParams:(id)a4 itemIdentifier:(id)a5 productType:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)APResult;
  v15 = [(APResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v16->_buyParams, a4);
    objc_storeStrong((id *)&v16->_itemIdentifier, a5);
    objc_storeStrong((id *)&v16->_productType, a6);
  }

  return v16;
}

- (APResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  v7 = [v4 objectForKeyedSubscript:@"buyParams"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  v9 = [v4 objectForKeyedSubscript:@"itemIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  id v11 = [v4 objectForKeyedSubscript:@"productType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  id v13 = 0;
  if (v8 && v10 && v12)
  {
    self = [(APResult *)self initWithBundleIdentifier:v6 buyParams:v8 itemIdentifier:v10 productType:v12];
    id v13 = self;
  }

  return v13;
}

- (id)compile
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(APResult *)self bundleIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v4, @"bundleIdentifier");

  v5 = [(APResult *)self buyParams];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v5, @"buyParams");

  id v6 = [(APResult *)self itemIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v6, @"itemIdentifier");

  v7 = [(APResult *)self productType];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v7, @"productType");

  return v3;
}

- (id)description
{
  id v3 = [(APResult *)self compile];
  id v4 = [self ap_generateDescriptionWithSubObjects:v3];

  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)productType
{
  return self->_productType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end