@interface MADEmbedding
+ (BOOL)supportsSecureCoding;
+ (id)fetchEmbeddingWithAssetUUID:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)madEmbeddingFromCSEmbedding:(id)a3;
+ (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5;
- (MADEmbedding)initWithCoder:(id)a3;
- (MADEmbedding)initWithFormat:(int64_t)a3 dimension:(int64_t)a4 version:(int64_t)a5 vectors:(id)a6;
- (NSArray)vectors;
- (_CSEmbedding)csEmbedding;
- (id)description;
- (int64_t)dimension;
- (int64_t)format;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADEmbedding

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADEmbedding)initWithFormat:(int64_t)a3 dimension:(int64_t)a4 version:(int64_t)a5 vectors:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MADEmbedding;
  v12 = [(MADEmbedding *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_format = a3;
    v12->_dimension = a4;
    v12->_version = a5;
    objc_storeStrong((id *)&v12->_vectors, a6);
  }

  return v13;
}

- (MADEmbedding)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADEmbedding;
  v5 = [(MADEmbedding *)&v12 init];
  if (v5)
  {
    v5->_format = [v4 decodeIntegerForKey:@"Format"];
    v5->_dimension = [v4 decodeIntegerForKey:@"Dimension"];
    v5->_version = [v4 decodeIntegerForKey:@"Version"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Vectors"];
    vectors = v5->_vectors;
    v5->_vectors = (NSArray *)v9;
  }
  return v5;
}

+ (id)madEmbeddingFromCSEmbedding:(id)a3
{
  id v3 = a3;
  id v4 = [MADEmbedding alloc];
  uint64_t v5 = [v3 format];
  uint64_t v6 = [v3 dimension];
  uint64_t v7 = [v3 version];
  v8 = [v3 vectors];

  uint64_t v9 = [(MADEmbedding *)v4 initWithFormat:v5 dimension:v6 version:v7 vectors:v8];
  return v9;
}

- (_CSEmbedding)csEmbedding
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F238A0]) initWithFormat:LODWORD(self->_format) dimension:LODWORD(self->_dimension) version:LOWORD(self->_version) vectors:self->_vectors];
  return (_CSEmbedding *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t format = self->_format;
  id v5 = a3;
  [v5 encodeInteger:format forKey:@"Format"];
  [v5 encodeInteger:self->_dimension forKey:@"Dimension"];
  [v5 encodeInteger:self->_version forKey:@"Version"];
  [v5 encodeObject:self->_vectors forKey:@"Vectors"];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"%@: %d, ", @"Format", self->_format];
  [v3 appendFormat:@"%@: %d, ", @"Dimension", self->_dimension];
  [v3 appendFormat:@"%@: %d, ", @"Version", self->_version];
  [v3 appendFormat:@"%@: %@>", @"Vectors", self->_vectors];
  return v3;
}

+ (id)fetchEmbeddingWithAssetUUID:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    objc_super v12 = +[MADEmbeddingStoreService sharedService];
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    id v23 = v9;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    objc_super v15 = [v13 setWithArray:v14];
    v16 = [v12 fetchEmbeddingsWithAssetUUIDs:v15 photoLibraryURL:v10 options:v11 error:a6];

    a6 = [v16 objectForKeyedSubscript:v9];
LABEL_9:

    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v17 = VCPLogInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "[MADEmbedding] Failed to fetch embedding due to nil asset requested", v22, 2u);
    }
  }
  if (a6)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28760];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v16 = [NSString stringWithFormat:@"[MADEmbedding] nil asset requested"];
    v25[0] = v16;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    *a6 = [v18 errorWithDomain:v19 code:-50 userInfo:v20];

    a6 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return a6;
}

+ (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 count])
  {
    objc_super v12 = +[MADEmbeddingStoreService sharedService];
    a6 = [v12 fetchEmbeddingsWithAssetUUIDs:v9 photoLibraryURL:v10 options:v11 error:a6];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[MADEmbedding] Failed to fetch embedding due to 0 asset requested", v19, 2u);
      }
    }
    if (a6)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28760];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v16 = [NSString stringWithFormat:@"[MADEmbedding] 0 asset requested"];
      v21[0] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *a6 = [v14 errorWithDomain:v15 code:-50 userInfo:v17];

      a6 = 0;
    }
  }

  return a6;
}

+ (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && [v9 count])
  {
    objc_super v12 = +[MADEmbeddingStoreService sharedService];
    a6 = [v12 searchWithEmbeddings:v9 photoLibraryURL:v10 options:v11 error:a6];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v9;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[MADEmbedding] Invalid incoming embeddings %@", buf, 0xCu);
      }
    }
    if (a6)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28760];
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"[MADEmbedding] Invalid incoming embeddings", *MEMORY[0x1E4F28568]);
      uint64_t v20 = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      *a6 = [v14 errorWithDomain:v15 code:-50 userInfo:v17];

      a6 = 0;
    }
  }

  return a6;
}

+ (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = +[MADEmbeddingStoreService sharedService];
  [v8 prewarmSearchWithConcurrencyLimit:a3 photoLibraryURL:v7 error:a5];
}

- (int64_t)format
{
  return self->_format;
}

- (int64_t)dimension
{
  return self->_dimension;
}

- (int64_t)version
{
  return self->_version;
}

- (NSArray)vectors
{
  return self->_vectors;
}

- (void).cxx_destruct
{
}

@end