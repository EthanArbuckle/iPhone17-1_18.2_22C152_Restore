@interface AVAssetTrackGroup
- (AVAssetTrackGroup)init;
- (AVAssetTrackGroup)initWithAsset:(id)a3 trackIDs:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)trackIDs;
- (id)_assetComparisonToken;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVAssetTrackGroup

- (AVAssetTrackGroup)initWithAsset:(id)a3 trackIDs:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVAssetTrackGroup;
  v6 = [(AVAssetTrackGroup *)&v9 init];
  if (v6)
  {
    v7 = objc_alloc_init(AVAssetTrackGroupInternal);
    v6->_assetTrackGroup = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_assetTrackGroup->assetComparisonToken = (id)[a3 _comparisonToken];
      v6->_assetTrackGroup->trackIDs = (NSArray *)[a4 copy];
      if (!v6->_assetTrackGroup->trackIDs) {
        v6->_assetTrackGroup->trackIDs = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVAssetTrackGroup)init
{
  return [(AVAssetTrackGroup *)self initWithAsset:0 trackIDs:0];
}

- (void)dealloc
{
  assetTrackGroup = self->_assetTrackGroup;
  if (assetTrackGroup)
  {

    CFRelease(self->_assetTrackGroup);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetTrackGroup;
  [(AVAssetTrackGroup *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  int v5 = objc_msgSend(-[AVAssetTrackGroup _assetComparisonToken](self, "_assetComparisonToken"), "isEqual:", objc_msgSend(a3, "_assetComparisonToken"));
  if (v5)
  {
    v6 = [(AVAssetTrackGroup *)self trackIDs];
    uint64_t v7 = [a3 trackIDs];
    if (v6 != (NSArray *)v7)
    {
      LOBYTE(v5) = [(NSArray *)v6 isEqual:v7];
      return v5;
    }
LABEL_8:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)[(AVAssetTrackGroup *)self trackIDs] hash];
  return objc_msgSend(-[AVAssetTrackGroup _assetComparisonToken](self, "_assetComparisonToken"), "hash") ^ v3;
}

- (NSArray)trackIDs
{
  return self->_assetTrackGroup->trackIDs;
}

- (id)_assetComparisonToken
{
  return self->_assetTrackGroup->assetComparisonToken;
}

@end