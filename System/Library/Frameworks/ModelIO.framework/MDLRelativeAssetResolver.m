@interface MDLRelativeAssetResolver
- (BOOL)canResolveAssetNamed:(id)a3;
- (MDLAsset)asset;
- (MDLRelativeAssetResolver)initWithAsset:(MDLAsset *)asset;
- (id)resolveAssetNamed:(id)a3;
- (void)setAsset:(MDLAsset *)asset;
@end

@implementation MDLRelativeAssetResolver

- (MDLRelativeAssetResolver)initWithAsset:(MDLAsset *)asset
{
  v4 = asset;
  v9.receiver = self;
  v9.super_class = (Class)MDLRelativeAssetResolver;
  v5 = [(MDLRelativeAssetResolver *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_asset, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)canResolveAssetNamed:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_asset);
    if (WeakRetained)
    {
      v7 = objc_msgSend_resolveAssetNamed_(self, v5, (uint64_t)v4);
      BOOL v8 = v7 != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)resolveAssetNamed:(id)a3
{
  id v4 = a3;
  v7 = v4;
  if (v4)
  {
    if (objc_msgSend_isAbsolutePath(v4, v5, v6))
    {
      objc_super v9 = objc_msgSend_fileURLWithPath_(NSURL, v8, (uint64_t)v7);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_asset);
      v13 = objc_msgSend_URL(WeakRetained, v11, v12);
      v16 = objc_msgSend_URLByDeletingLastPathComponent(v13, v14, v15);

      objc_super v9 = objc_msgSend_URLByAppendingPathComponent_(v16, v17, (uint64_t)v7);
    }
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (MDLAsset)asset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_asset);

  return (MDLAsset *)WeakRetained;
}

- (void)setAsset:(MDLAsset *)asset
{
}

- (void).cxx_destruct
{
}

@end