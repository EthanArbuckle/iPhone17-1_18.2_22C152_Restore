@interface CDMEmbeddingConfigItem
+ (BOOL)supportsSecureCoding;
+ (int64_t)getEmbeddingDimensionFromEmbeddingModelMetadata:(id)a3;
- (BOOL)isStableEmbeddingModel;
- (CDMEmbeddingConfigItem)initWithCoder:(id)a3;
- (CDMEmbeddingConfigItem)initWithEmbeddingModelPath:(id)a3 isStableEmbeddingModel:(BOOL)a4;
- (NSDictionary)embeddingModelMetadata;
- (NSNumber)embeddingModelDimension;
- (NSString)embeddingModelPath;
- (NSString)embeddingModelVersion;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDMEmbeddingConfigItem

- (CDMEmbeddingConfigItem)initWithEmbeddingModelPath:(id)a3 isStableEmbeddingModel:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CDMEmbeddingConfigItem;
  v8 = [(CDMEmbeddingConfigItem *)&v17 init];
  if (v8)
  {
    v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[CDMEmbeddingConfigItem initWithEmbeddingModelPath:isStableEmbeddingModel:]";
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 1024;
      BOOL v23 = v4;
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s Init with embedding model path: %@, stable embedding model flag: %d.", buf, 0x1Cu);
    }

    objc_storeStrong((id *)&v8->_embeddingModelPath, a3);
    uint64_t v10 = +[CDMAssetsUtils loadAssetMetadataFromAsset:v7];
    embeddingModelMetadata = v8->_embeddingModelMetadata;
    v8->_embeddingModelMetadata = (NSDictionary *)v10;

    v8->_isStableEmbeddingModel = v4;
    uint64_t v12 = +[CDMAssetsUtils getAssetVersionFromAssetMetadata:v8->_embeddingModelMetadata];
    embeddingModelVersion = v8->_embeddingModelVersion;
    v8->_embeddingModelVersion = (NSString *)v12;

    uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", +[CDMEmbeddingConfigItem getEmbeddingDimensionFromEmbeddingModelMetadata:](CDMEmbeddingConfigItem, "getEmbeddingDimensionFromEmbeddingModelMetadata:", v8->_embeddingModelMetadata));
    embeddingModelDimension = v8->_embeddingModelDimension;
    v8->_embeddingModelDimension = (NSNumber *)v14;
  }
  return v8;
}

+ (int64_t)getEmbeddingDimensionFromEmbeddingModelMetadata:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = (__CFString *)a3;
  BOOL v4 = v3;
  if (!v3)
  {
    v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      v11 = "+[CDMEmbeddingConfigItem getEmbeddingDimensionFromEmbeddingModelMetadata:]";
      _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Input model metadata is nil. Return default embedding model dimension.", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_11;
  }
  v5 = [(__CFString *)v3 objectForKey:@"EmbeddingDimension"];
  v6 = CDMOSLoggerForCategory(0);
  id v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315650;
      v11 = "+[CDMEmbeddingConfigItem getEmbeddingDimensionFromEmbeddingModelMetadata:]";
      __int16 v12 = 2112;
      v13 = v4;
      __int16 v14 = 2112;
      v15 = @"EmbeddingDimension";
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Model metadata: %@ doesn't have key: %@. Return default embedding model dimension.", (uint8_t *)&v10, 0x20u);
    }

    v5 = 0;
LABEL_11:
    int64_t v8 = 192;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    v11 = "+[CDMEmbeddingConfigItem getEmbeddingDimensionFromEmbeddingModelMetadata:]";
    __int16 v12 = 2112;
    v13 = v5;
    __int16 v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s Found embedding model dimension config: %@ in embedding model metadata: %@.", (uint8_t *)&v10, 0x20u);
  }

  int64_t v8 = [v5 integerValue];
LABEL_12:

  return v8;
}

- (BOOL)isStableEmbeddingModel
{
  return self->_isStableEmbeddingModel;
}

- (NSString)embeddingModelVersion
{
  return self->_embeddingModelVersion;
}

- (NSString)embeddingModelPath
{
  return self->_embeddingModelPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingModelVersion, 0);
  objc_storeStrong((id *)&self->_embeddingModelDimension, 0);
  objc_storeStrong((id *)&self->_embeddingModelMetadata, 0);
  objc_storeStrong((id *)&self->_embeddingModelPath, 0);
}

- (NSNumber)embeddingModelDimension
{
  return self->_embeddingModelDimension;
}

- (NSDictionary)embeddingModelMetadata
{
  return self->_embeddingModelMetadata;
}

- (void)encodeWithCoder:(id)a3
{
  embeddingModelPath = self->_embeddingModelPath;
  id v5 = a3;
  [v5 encodeObject:embeddingModelPath forKey:@"embeddingModelPath"];
  [v5 encodeObject:self->_embeddingModelMetadata forKey:@"embeddingModelMetadata"];
  [v5 encodeObject:self->_embeddingModelDimension forKey:@"embeddingModelDimension"];
  [v5 encodeObject:self->_embeddingModelVersion forKey:@"embeddingModelVersion"];
  [v5 encodeBool:self->_isStableEmbeddingModel forKey:@"isStableEmbeddingModel"];
}

- (CDMEmbeddingConfigItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CDMEmbeddingConfigItem;
  id v5 = [(CDMEmbeddingConfigItem *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embeddingModelPath"];
    embeddingModelPath = v5->_embeddingModelPath;
    v5->_embeddingModelPath = (NSString *)v6;

    int64_t v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    int v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"embeddingModelMetadata"];
    embeddingModelMetadata = v5->_embeddingModelMetadata;
    v5->_embeddingModelMetadata = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embeddingModelDimension"];
    embeddingModelDimension = v5->_embeddingModelDimension;
    v5->_embeddingModelDimension = (NSNumber *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embeddingModelVersion"];
    embeddingModelVersion = v5->_embeddingModelVersion;
    v5->_embeddingModelVersion = (NSString *)v15;

    v5->_isStableEmbeddingModel = [v4 decodeBoolForKey:@"isStableEmbeddingModel"];
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[CDMEmbeddingConfigItem] - Embedding Model Path: %@,\n Embedding Model Version: %@,\n Embedding Model Dimension: %@,\n Embedding Model Metadata: %@,\n Stable Embedding Model Flag: %d.", self->_embeddingModelPath, self->_embeddingModelVersion, self->_embeddingModelDimension, self->_embeddingModelMetadata, self->_isStableEmbeddingModel];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end