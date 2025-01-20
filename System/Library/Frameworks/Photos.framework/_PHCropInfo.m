@interface _PHCropInfo
- (PHAsset)asset;
- (_PHCropInfo)initWithAsset:(id)a3 cropScore:(double)a4;
- (double)cropScore;
@end

@implementation _PHCropInfo

- (void).cxx_destruct
{
}

- (double)cropScore
{
  return self->_cropScore;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (_PHCropInfo)initWithAsset:(id)a3 cropScore:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PHCropInfo;
  v8 = [(_PHCropInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_asset, a3);
    v9->_cropScore = a4;
  }

  return v9;
}

@end