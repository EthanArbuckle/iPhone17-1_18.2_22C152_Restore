@interface LCFModelStoreModelMetadataProvider
- (BOOL)removeModelMetadata:(id)a3;
- (BOOL)setModelMetadata:(id)a3 metadata:(id)a4;
- (NSURL)metadataPlistFileURL;
- (NSURL)modelStoreRootWithKeyURL;
- (id)getMetadata;
- (id)getModelMetadata:(id)a3;
- (id)init:(id)a3;
@end

@implementation LCFModelStoreModelMetadataProvider

- (id)init:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LCFModelStoreModelMetadataProvider;
  v6 = [(LCFModelStoreModelMetadataProvider *)&v10 init];
  if (v6)
  {
    LCFModelStoreLoggingUtilsInit();
    objc_storeStrong((id *)&v6->_modelStoreRootWithKeyURL, a3);
    uint64_t v7 = [(NSURL *)v6->_modelStoreRootWithKeyURL URLByAppendingPathComponent:@"metadata.plist"];
    metadataPlistFileURL = v6->_metadataPlistFileURL;
    v6->_metadataPlistFileURL = (NSURL *)v7;
  }
  return v6;
}

- (id)getMetadata
{
  v2 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:self->_metadataPlistFileURL];
  return v2;
}

- (id)getModelMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(LCFModelStoreModelMetadataProvider *)self getMetadata];
  if (v5)
  {
    v6 = [LCFModelMetadata alloc];
    uint64_t v7 = [v5 valueForKey:v4];
    v8 = [(LCFModelMetadata *)v6 init:v7];
  }
  else
  {
    v8 = objc_alloc_init(LCFModelMetadata);
  }

  return v8;
}

- (BOOL)setModelMetadata:(id)a3 metadata:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [a4 toDictionary];
  id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
  v9 = [(LCFModelStoreModelMetadataProvider *)self getMetadata];
  objc_super v10 = (void *)[v8 initWithDictionary:v9];

  [v10 setValue:v7 forKey:v6];
  metadataPlistFileURL = self->_metadataPlistFileURL;
  p_metadataPlistFileURL = (uint64_t *)&self->_metadataPlistFileURL;
  id v18 = 0;
  char v13 = [v10 writeToURL:metadataPlistFileURL error:&v18];
  id v14 = v18;
  v15 = LCFLogModelStoreModelMetadata;
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)LCFLogModelStoreModelMetadata, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *p_metadataPlistFileURL;
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v16;
      _os_log_impl(&dword_2545B3000, v15, OS_LOG_TYPE_INFO, "succeeded to write metadata %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)LCFLogModelStoreModelMetadata, OS_LOG_TYPE_ERROR))
  {
    -[LCFModelStoreModelMetadataProvider setModelMetadata:metadata:](p_metadataPlistFileURL, v15);
  }

  return v13;
}

- (BOOL)removeModelMetadata:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(LCFModelStoreModelMetadataProvider *)self getMetadata];
  id v8 = (void *)[v6 initWithDictionary:v7];

  [v8 setValue:0 forKey:v5];
  metadataPlistFileURL = self->_metadataPlistFileURL;
  p_metadataPlistFileURL = (uint64_t *)&self->_metadataPlistFileURL;
  id v16 = 0;
  char v11 = [v8 writeToURL:metadataPlistFileURL error:&v16];
  id v12 = v16;
  char v13 = LCFLogModelStoreModelMetadata;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)LCFLogModelStoreModelMetadata, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *p_metadataPlistFileURL;
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v14;
      _os_log_impl(&dword_2545B3000, v13, OS_LOG_TYPE_INFO, "succeeded to write metadata %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)LCFLogModelStoreModelMetadata, OS_LOG_TYPE_ERROR))
  {
    -[LCFModelStoreModelMetadataProvider setModelMetadata:metadata:](p_metadataPlistFileURL, v13);
  }

  return v11;
}

- (NSURL)modelStoreRootWithKeyURL
{
  return self->_modelStoreRootWithKeyURL;
}

- (NSURL)metadataPlistFileURL
{
  return self->_metadataPlistFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataPlistFileURL, 0);
  objc_storeStrong((id *)&self->_modelStoreRootWithKeyURL, 0);
}

- (void)setModelMetadata:(uint64_t *)a1 metadata:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2545B3000, a2, OS_LOG_TYPE_ERROR, "failed to write metadata %@", (uint8_t *)&v3, 0xCu);
}

@end