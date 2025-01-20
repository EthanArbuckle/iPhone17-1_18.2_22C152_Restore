@interface PHImportAssetDataRequest
- (BOOL)isCanceled;
- (PHImportAsset)asset;
- (PHImportAsset)requestAsset;
- (PHImportAssetDataRequest)initWithAsset:(id)a3;
- (id)cancelBlock;
- (void)cancel;
- (void)setAsset:(id)a3;
- (void)setCancelBlock:(id)a3;
@end

@implementation PHImportAssetDataRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->_cancelBlock, 0);

  objc_storeStrong((id *)&self->_canceler, 0);
}

- (void)setAsset:(id)a3
{
}

- (PHImportAsset)asset
{
  return self->_asset;
}

- (void)setCancelBlock:(id)a3
{
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (BOOL)isCanceled
{
  canceler = self->_canceler;
  return canceler && canceler->_isCanceled;
}

- (void)cancel
{
  canceler = self->_canceler;
  if (canceler) {
    canceler->_isCanceled = 1;
  }
  v4 = [(PHImportAssetDataRequest *)self cancelBlock];

  if (v4)
  {
    v5 = [(PHImportAssetDataRequest *)self cancelBlock];
    v5[2]();
  }
}

- (PHImportAsset)requestAsset
{
  v3 = [(PHImportAsset *)self->_asset largeRender];
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = [(PHImportAsset *)self->_asset largeMovieRender];
    asset = v6;
    if (!v6) {
      asset = self->_asset;
    }
    v5 = asset;
  }

  return v5;
}

- (PHImportAssetDataRequest)initWithAsset:(id)a3
{
  id v5 = a3;
  v6 = [(PHImportAssetDataRequest *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    uint64_t v8 = objc_opt_new();
    canceler = v7->_canceler;
    v7->_canceler = (PHImportCanceler *)v8;
  }
  return v7;
}

@end