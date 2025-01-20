@interface _CPPhotosAggregatedInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPPhotosAggregatedInfo)initWithFacade:(id)a3;
- (int)totalNumberOfAssets;
- (int)totalNumberOfEmbeddingMatchedAssets;
- (int)totalNumberOfMetadataMatchedAssets;
- (unint64_t)hash;
- (void)setTotalNumberOfAssets:(int)a3;
- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3;
- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPPhotosAggregatedInfo

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

- (void)setTotalNumberOfAssets:(int)a3
{
  self->_totalNumberOfAssets = a3;
}

- (int)totalNumberOfAssets
{
  return self->_totalNumberOfAssets;
}

- (unint64_t)hash
{
  return (2654435761 * self->_totalNumberOfEmbeddingMatchedAssets) ^ (2654435761 * self->_totalNumberOfAssets) ^ (2654435761 * self->_totalNumberOfMetadataMatchedAssets);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int totalNumberOfAssets = self->_totalNumberOfAssets,
        totalNumberOfAssets == [v4 totalNumberOfAssets])
    && (int totalNumberOfEmbeddingMatchedAssets = self->_totalNumberOfEmbeddingMatchedAssets,
        totalNumberOfEmbeddingMatchedAssets == [v4 totalNumberOfEmbeddingMatchedAssets]))
  {
    int totalNumberOfMetadataMatchedAssets = self->_totalNumberOfMetadataMatchedAssets;
    BOOL v8 = totalNumberOfMetadataMatchedAssets == [v4 totalNumberOfMetadataMatchedAssets];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPPhotosAggregatedInfo *)self totalNumberOfAssets]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPPhotosAggregatedInfo *)self totalNumberOfEmbeddingMatchedAssets]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPPhotosAggregatedInfo *)self totalNumberOfMetadataMatchedAssets]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPPhotosAggregatedInfoReadFrom(self, (uint64_t)a3);
}

- (_CPPhotosAggregatedInfo)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_CPPhotosAggregatedInfo *)self init];
  if (v5)
  {
    -[_CPPhotosAggregatedInfo setTotalNumberOfAssets:](v5, "setTotalNumberOfAssets:", [v4 totalNumberOfAssets]);
    -[_CPPhotosAggregatedInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", [v4 totalNumberOfEmbeddingMatchedAssets]);
    -[_CPPhotosAggregatedInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", [v4 totalNumberOfMetadataMatchedAssets]);
    v6 = v5;
  }

  return v5;
}

@end