@interface CEMAssetReference
+ (id)referenceForIdentifier:(id)a3 assetschematype:(id)a4;
+ (id)referenceForIdentifier:(id)a3 assettype:(int)a4;
- (CEMAssetReference)initWithIdentifier:(id)a3 assettype:(int)a4;
- (NSString)identifier;
- (int)assettype;
@end

@implementation CEMAssetReference

+ (id)referenceForIdentifier:(id)a3 assettype:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = [[CEMAssetReference alloc] initWithIdentifier:v5 assettype:v4];

  return v6;
}

+ (id)referenceForIdentifier:(id)a3 assetschematype:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v5 isEqualToString:@"application"])
  {
    uint64_t v7 = 0;
  }
  else if ([v5 isEqualToString:@"applicationID"])
  {
    uint64_t v7 = 1;
  }
  else if ([v5 isEqualToString:@"book"])
  {
    uint64_t v7 = 2;
  }
  else if ([v5 isEqualToString:@"certificate"])
  {
    uint64_t v7 = 3;
  }
  else if ([v5 isEqualToString:@"credential"])
  {
    uint64_t v7 = 4;
  }
  else if ([v5 isEqualToString:@"font"])
  {
    uint64_t v7 = 5;
  }
  else if ([v5 isEqualToString:@"image"])
  {
    uint64_t v7 = 6;
  }
  else
  {
    [v5 isEqualToString:@"string"];
    uint64_t v7 = 7;
  }
  v8 = [[CEMAssetReference alloc] initWithIdentifier:v6 assettype:v7];

  return v8;
}

- (CEMAssetReference)initWithIdentifier:(id)a3 assettype:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CEMAssetReference;
  v8 = [(CEMAssetReference *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_assettype = a4;
  }

  return v9;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int)assettype
{
  return self->_assettype;
}

- (void).cxx_destruct
{
}

@end