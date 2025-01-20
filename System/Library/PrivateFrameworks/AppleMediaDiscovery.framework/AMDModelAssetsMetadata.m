@interface AMDModelAssetsMetadata
- (AMDModelAssetsMetadata)initWithDictionary:(id)a3;
- (BOOL)isValid;
- (NSArray)dictionaryIds;
- (id)getDictionaryIds;
- (void)setDictionaryIds:(id)a3;
@end

@implementation AMDModelAssetsMetadata

- (AMDModelAssetsMetadata)initWithDictionary:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)AMDModelAssetsMetadata;
  v9 = [(AMDModelAssetsMetadata *)&v7 init];
  objc_storeStrong((id *)&v9, v9);
  id v5 = (id)[location[0] objectForKey:@"dictionaries"];
  -[AMDModelAssetsMetadata setDictionaryIds:](v9, "setDictionaryIds:");

  v6 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

- (id)getDictionaryIds
{
  return [(AMDModelAssetsMetadata *)self dictionaryIds];
}

- (BOOL)isValid
{
  return 1;
}

- (NSArray)dictionaryIds
{
  return self->_dictionaryIds;
}

- (void)setDictionaryIds:(id)a3
{
}

- (void).cxx_destruct
{
}

@end