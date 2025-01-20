@interface VCPDatabaseBatchIterator
+ (id)iteratorForAssets:(id)a3 withDatabaseReader:(id)a4 resultTypes:(id)a5 batchSize:(int)a6;
- (BOOL)next;
- (NSDictionary)analysis;
- (PHAsset)asset;
- (VCPDatabaseBatchIterator)initWithDatabaseReader:(id)a3 forAssets:(id)a4 resultsTypes:(id)a5 batchSize:(int)a6;
- (void)nextBatch;
@end

@implementation VCPDatabaseBatchIterator

+ (id)iteratorForAssets:(id)a3 withDatabaseReader:(id)a4 resultTypes:(id)a5 batchSize:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [[VCPDatabaseBatchIterator alloc] initWithDatabaseReader:v10 forAssets:v9 resultsTypes:v11 batchSize:v6];

  return v12;
}

- (VCPDatabaseBatchIterator)initWithDatabaseReader:(id)a3 forAssets:(id)a4 resultsTypes:(id)a5 batchSize:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)VCPDatabaseBatchIterator;
  v14 = [(VCPDatabaseBatchIterator *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_reader, a3);
    objc_storeStrong((id *)&v15->_assets, a4);
    objc_storeStrong((id *)&v15->_resultsTypes, a5);
    v15->_idxLast = 0;
    v15->_idxCurrent = 0;
    if (a6 <= 1) {
      int v16 = 1;
    }
    else {
      int v16 = a6;
    }
    v15->_batchSize = v16;
  }
  if (v15->_reader) {
    v17 = v15;
  }
  else {
    v17 = 0;
  }
  v18 = v17;

  return v18;
}

- (BOOL)next
{
  asset = self->_asset;
  self->_asset = 0;

  analysis = self->_analysis;
  self->_analysis = 0;

  NSUInteger idxCurrent = self->_idxCurrent;
  NSUInteger v6 = [(NSArray *)self->_assets count];
  if (v6 > idxCurrent)
  {
    int v7 = self->_idxCurrent;
    if (v7 >= self->_idxLast)
    {
      [(VCPDatabaseBatchIterator *)self nextBatch];
      int v7 = self->_idxCurrent;
    }
    v8 = [(NSArray *)self->_assets objectAtIndexedSubscript:v7];
    id v9 = self->_asset;
    self->_asset = v8;

    id v10 = [(PHAsset *)self->_asset localIdentifier];

    if (v10)
    {
      batchAnalyses = self->_batchAnalyses;
      id v12 = [(PHAsset *)self->_asset localIdentifier];
      id v13 = [(NSDictionary *)batchAnalyses objectForKeyedSubscript:v12];
      v14 = self->_analysis;
      self->_analysis = v13;
    }
    ++self->_idxCurrent;
  }
  return v6 > idxCurrent;
}

- (void)nextBatch
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1C186D320](self, a2);
  int v4 = [(NSArray *)self->_assets count];
  if (v4 - self->_idxLast >= self->_batchSize) {
    int batchSize = self->_batchSize;
  }
  else {
    int batchSize = v4 - self->_idxLast;
  }
  v17 = -[NSArray subarrayWithRange:](self->_assets, "subarrayWithRange:");
  NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v17;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = [v11 localIdentifier];
        BOOL v13 = v12 == 0;

        if (!v13)
        {
          v14 = [v11 localIdentifier];
          [v6 addObject:v14];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v15 = [(VCPDatabaseReader *)self->_reader queryAnalysesForAssets:v6 withTypes:self->_resultsTypes];
  batchAnalyses = self->_batchAnalyses;
  self->_batchAnalyses = v15;

  self->_idxLast += batchSize;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (NSDictionary)analysis
{
  return self->_analysis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_batchAnalyses, 0);
  objc_storeStrong((id *)&self->_resultsTypes, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end