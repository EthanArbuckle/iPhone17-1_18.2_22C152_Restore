@interface DDSMAAsset
- (BOOL)isEqual:(id)a3;
- (DDSMAAsset)initWithMAAsset:(id)a3;
- (MAAsset)maAsset;
@end

@implementation DDSMAAsset

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (v11.receiver = self,
        v11.super_class = (Class)DDSMAAsset,
        [(DDSAsset *)&v11 isEqual:v4]))
  {
    v7 = [(DDSMAAsset *)self maAsset];
    v8 = [v6 maAsset];
    char v9 = DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (MAAsset)maAsset
{
  return self->_maAsset;
}

- (DDSMAAsset)initWithMAAsset:(id)a3
{
  id v5 = a3;
  id v6 = [v5 attributes];
  v7 = (void *)[v6 mutableCopy];

  v8 = [v7 objectForKey:@"AssetType"];
  if (!v8)
  {
    char v9 = [v5 assetType];

    if (!v9) {
      goto LABEL_5;
    }
    v8 = [v5 assetType];
    [v7 setObject:v8 forKey:@"AssetType"];
  }

LABEL_5:
  v10 = [v5 getLocalUrl];
  v13.receiver = self;
  v13.super_class = (Class)DDSMAAsset;
  objc_super v11 = [(DDSAsset *)&v13 initWithAttributes:v7 localURL:v10];

  if (v11) {
    objc_storeStrong((id *)&v11->_maAsset, a3);
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end