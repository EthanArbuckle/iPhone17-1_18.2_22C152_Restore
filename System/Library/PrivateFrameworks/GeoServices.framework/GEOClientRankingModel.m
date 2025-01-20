@interface GEOClientRankingModel
- (GEOClientRankingModel)init;
- (GEOClientRankingModel)initWithFeatures:(id)a3;
- (GEOClientRankingModel)initWithGEOPDClientRankingFeatureMetadata:(id)a3;
- (NSArray)features;
@end

@implementation GEOClientRankingModel

- (GEOClientRankingModel)init
{
  result = (GEOClientRankingModel *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOClientRankingModel)initWithFeatures:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOClientRankingModel;
  v5 = [(GEOClientRankingModel *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    features = v5->_features;
    v5->_features = (NSArray *)v6;
  }
  return v5;
}

- (GEOClientRankingModel)initWithGEOPDClientRankingFeatureMetadata:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        v12 = [GEOClientRankingModelFeature alloc];
        v13 = -[GEOClientRankingModelFeature initWithGEOPDClientRankingFeatureMetadata:](v12, "initWithGEOPDClientRankingFeatureMetadata:", v11, (void)v16);
        if (v13) {
          [v5 addObject:v13];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = [(GEOClientRankingModel *)self initWithFeatures:v5];
  return v14;
}

- (NSArray)features
{
  return self->_features;
}

- (void).cxx_destruct
{
}

@end