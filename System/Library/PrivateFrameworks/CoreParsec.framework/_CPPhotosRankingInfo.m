@interface _CPPhotosRankingInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPPhotosRankingInfo)initWithFacade:(id)a3;
- (int)assetEstimationOffAmount;
- (int)totalNumberOfAssetsInLibrary;
- (int)totalNumberOfAssetsIndexed;
- (int)totalNumberOfEmbeddingMatchedAssets;
- (int)totalNumberOfMetadataMatchedAssets;
- (unint64_t)hash;
- (void)setAssetEstimationOffAmount:(int)a3;
- (void)setTotalNumberOfAssetsInLibrary:(int)a3;
- (void)setTotalNumberOfAssetsIndexed:(int)a3;
- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3;
- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPPhotosRankingInfo

- (void)setAssetEstimationOffAmount:(int)a3
{
  self->_assetEstimationOffAmount = a3;
}

- (int)assetEstimationOffAmount
{
  return self->_assetEstimationOffAmount;
}

- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3
{
  self->_totalNumberOfMetadataMatchedAssets = a3;
}

- (int)totalNumberOfMetadataMatchedAssets
{
  return self->_totalNumberOfMetadataMatchedAssets;
}

- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3
{
  self->_totalNumberOfEmbeddingMatchedAssets = a3;
}

- (int)totalNumberOfEmbeddingMatchedAssets
{
  return self->_totalNumberOfEmbeddingMatchedAssets;
}

- (void)setTotalNumberOfAssetsInLibrary:(int)a3
{
  self->_totalNumberOfAssetsInLibrary = a3;
}

- (int)totalNumberOfAssetsInLibrary
{
  return self->_totalNumberOfAssetsInLibrary;
}

- (void)setTotalNumberOfAssetsIndexed:(int)a3
{
  self->_totalNumberOfAssetsIndexed = a3;
}

- (int)totalNumberOfAssetsIndexed
{
  return self->_totalNumberOfAssetsIndexed;
}

- (unint64_t)hash
{
  return (2654435761 * self->_totalNumberOfAssetsInLibrary) ^ (2654435761 * self->_totalNumberOfAssetsIndexed) ^ (2654435761 * self->_totalNumberOfEmbeddingMatchedAssets) ^ (2654435761 * self->_totalNumberOfMetadataMatchedAssets) ^ (2654435761 * self->_assetEstimationOffAmount);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int totalNumberOfAssetsIndexed = self->_totalNumberOfAssetsIndexed,
        totalNumberOfAssetsIndexed == [v4 totalNumberOfAssetsIndexed])
    && (int totalNumberOfAssetsInLibrary = self->_totalNumberOfAssetsInLibrary,
        totalNumberOfAssetsInLibrary == [v4 totalNumberOfAssetsInLibrary])
    && (int totalNumberOfEmbeddingMatchedAssets = self->_totalNumberOfEmbeddingMatchedAssets,
        totalNumberOfEmbeddingMatchedAssets == [v4 totalNumberOfEmbeddingMatchedAssets])
    && (int totalNumberOfMetadataMatchedAssets = self->_totalNumberOfMetadataMatchedAssets,
        totalNumberOfMetadataMatchedAssets == [v4 totalNumberOfMetadataMatchedAssets]))
  {
    int assetEstimationOffAmount = self->_assetEstimationOffAmount;
    BOOL v10 = assetEstimationOffAmount == [v4 assetEstimationOffAmount];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPPhotosRankingInfo *)self totalNumberOfAssetsIndexed]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPPhotosRankingInfo *)self totalNumberOfAssetsInLibrary]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPPhotosRankingInfo *)self totalNumberOfEmbeddingMatchedAssets]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPPhotosRankingInfo *)self totalNumberOfMetadataMatchedAssets]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPPhotosRankingInfo *)self assetEstimationOffAmount]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPPhotosRankingInfoReadFrom(self, (uint64_t)a3);
}

- (_CPPhotosRankingInfo)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_CPPhotosRankingInfo *)self init];
  if (v5)
  {
    -[_CPPhotosRankingInfo setTotalNumberOfAssetsIndexed:](v5, "setTotalNumberOfAssetsIndexed:", [v4 totalNumberOfAssetsIndexed]);
    -[_CPPhotosRankingInfo setTotalNumberOfAssetsInLibrary:](v5, "setTotalNumberOfAssetsInLibrary:", [v4 totalNumberOfAssetsInLibrary]);
    v6 = v5;
  }

  return v5;
}

@end