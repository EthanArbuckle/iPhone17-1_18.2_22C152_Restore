@interface MADEmbeddingSearchOptions
+ (BOOL)supportsSecureCoding;
+ (id)defaultOptions;
- (BOOL)fullScan;
- (BOOL)includePayload;
- (MADEmbeddingSearchOptions)init;
- (MADEmbeddingSearchOptions)initWithCoder:(id)a3;
- (NSArray)assetUUIDs;
- (NSNumber)batchSize;
- (NSNumber)numConcurrentReaders;
- (NSNumber)numberOfProbes;
- (id)description;
- (int)resultLimit;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetUUIDs:(id)a3;
- (void)setBatchSize:(id)a3;
- (void)setFullScan:(BOOL)a3;
- (void)setIncludePayload:(BOOL)a3;
- (void)setNumConcurrentReaders:(id)a3;
- (void)setNumberOfProbes:(id)a3;
- (void)setResultLimit:(int)a3;
@end

@implementation MADEmbeddingSearchOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADEmbeddingSearchOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)MADEmbeddingSearchOptions;
  result = [(MADEmbeddingSearchOptions *)&v3 init];
  if (result)
  {
    result->_resultLimit = 10;
    *(_WORD *)&result->_fullScan = 0;
  }
  return result;
}

+ (id)defaultOptions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (MADEmbeddingSearchOptions)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MADEmbeddingSearchOptions;
  v5 = [(MADEmbeddingSearchOptions *)&v18 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AssetUUIDs"];
    assetUUIDs = v5->_assetUUIDs;
    v5->_assetUUIDs = (NSArray *)v9;

    v5->_resultLimit = [v4 decodeIntForKey:@"ResultLimit"];
    v5->_fullScan = [v4 decodeBoolForKey:@"FullScan"];
    v5->_includePayload = [v4 decodeBoolForKey:@"IncludePayload"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NumberOfProbes"];
    numberOfProbes = v5->_numberOfProbes;
    v5->_numberOfProbes = (NSNumber *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BatchSize"];
    batchSize = v5->_batchSize;
    v5->_batchSize = (NSNumber *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NumConcurrentReaders"];
    numConcurrentReaders = v5->_numConcurrentReaders;
    v5->_numConcurrentReaders = (NSNumber *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  assetUUIDs = self->_assetUUIDs;
  id v5 = a3;
  [v5 encodeObject:assetUUIDs forKey:@"AssetUUIDs"];
  [v5 encodeInt:self->_resultLimit forKey:@"ResultLimit"];
  [v5 encodeBool:self->_fullScan forKey:@"FullScan"];
  [v5 encodeBool:self->_includePayload forKey:@"IncludePayload"];
  [v5 encodeObject:self->_numberOfProbes forKey:@"NumberOfProbes"];
  [v5 encodeObject:self->_batchSize forKey:@"BatchSize"];
  [v5 encodeObject:self->_numConcurrentReaders forKey:@"NumConcurrentReaders"];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"%@: %@, ", @"AssetUUIDs", self->_assetUUIDs];
  [v3 appendFormat:@"%@: %d, ", @"ResultLimit", self->_resultLimit];
  if (self->_fullScan) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendFormat:@"%@: %@, ", @"FullScan", v6];
  if (self->_includePayload) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"%@: %@, ", @"IncludePayload", v7];
  [v3 appendFormat:@"%@: %@, ", @"NumberOfProbes", self->_numberOfProbes];
  [v3 appendFormat:@"%@: %@, ", @"BatchSize", self->_batchSize];
  [v3 appendFormat:@"%@: %@>", @"NumConcurrentReaders", self->_numConcurrentReaders];
  return v3;
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (void)setAssetUUIDs:(id)a3
{
}

- (int)resultLimit
{
  return self->_resultLimit;
}

- (void)setResultLimit:(int)a3
{
  self->_resultLimit = a3;
}

- (BOOL)fullScan
{
  return self->_fullScan;
}

- (void)setFullScan:(BOOL)a3
{
  self->_fullScan = a3;
}

- (BOOL)includePayload
{
  return self->_includePayload;
}

- (void)setIncludePayload:(BOOL)a3
{
  self->_includePayload = a3;
}

- (NSNumber)numberOfProbes
{
  return self->_numberOfProbes;
}

- (void)setNumberOfProbes:(id)a3
{
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(id)a3
{
}

- (NSNumber)numConcurrentReaders
{
  return self->_numConcurrentReaders;
}

- (void)setNumConcurrentReaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numConcurrentReaders, 0);
  objc_storeStrong((id *)&self->_batchSize, 0);
  objc_storeStrong((id *)&self->_numberOfProbes, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

@end