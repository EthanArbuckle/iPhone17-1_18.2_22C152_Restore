@interface JFXMediaReaderCreationAVAssetTrackAttributes
- (AVAsset)asset;
- (AVAssetTrack)assetTrack;
- (JFXMediaReaderCreationAVAssetTrackAttributes)initWithAssetTrack:(id)a3;
@end

@implementation JFXMediaReaderCreationAVAssetTrackAttributes

- (JFXMediaReaderCreationAVAssetTrackAttributes)initWithAssetTrack:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)JFXMediaReaderCreationAVAssetTrackAttributes;
  v6 = [(JFXMediaReaderCreationAVAssetTrackAttributes *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 asset];
    asset = v6->_asset;
    v6->_asset = (AVAsset *)v7;

    objc_storeStrong((id *)&v6->_assetTrack, a3);
  }

  return v6;
}

- (AVAssetTrack)assetTrack
{
  return self->_assetTrack;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetTrack, 0);
}

@end