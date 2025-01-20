@interface SHJSONLCustomCatalogContainer
+ (id)customCatalogURLFromURL:(id)a3 error:(id *)a4;
- (BOOL)loadFromData:(id)a3 error:(id *)a4;
- (BOOL)loadFromURL:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (NSArray)referenceSignatures;
- (NSData)dataRepresentation;
- (SHCustomCatalogStorage)container;
- (SHJSONLCustomCatalogContainer)init;
- (SHJSONLCustomCatalogTransformer)transformer;
- (id)jsonObjectRepresentationWithError:(id *)a3;
- (id)mediaItemsForReferenceSignature:(id)a3;
- (id)referenceSignatureForTrackID:(unint64_t)a3;
- (void)addSignature:(id)a3 representingMediaItems:(id)a4;
@end

@implementation SHJSONLCustomCatalogContainer

- (SHJSONLCustomCatalogContainer)init
{
  v8.receiver = self;
  v8.super_class = (Class)SHJSONLCustomCatalogContainer;
  v2 = [(SHJSONLCustomCatalogContainer *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SHJSONLCustomCatalogTransformer);
    transformer = v2->_transformer;
    v2->_transformer = v3;

    v5 = objc_alloc_init(SHCustomCatalogMemoryStorage);
    container = v2->_container;
    v2->_container = (SHCustomCatalogStorage *)v5;
  }
  return v2;
}

- (BOOL)loadFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = objc_alloc_init(MEMORY[0x263F6C4A8]);
    objc_super v8 = [(SHJSONLCustomCatalogContainer *)self transformer];
    [v7 setDelegate:v8];

    v9 = [(SHJSONLCustomCatalogContainer *)self container];
    v10 = [(SHJSONLCustomCatalogContainer *)self transformer];
    [v10 setDelegate:v9];

    char v11 = [v7 loadData:v6 withCompression:517 error:a4];
    v12 = [(SHJSONLCustomCatalogContainer *)self transformer];
    [v12 reset];
  }
  else
  {
    +[SHError annotateClientError:a4 code:300 underlyingError:0];
    char v11 = 0;
  }

  return v11;
}

- (BOOL)loadFromURL:(id)a3 error:(id *)a4
{
  id v6 = +[SHJSONLCustomCatalogContainer customCatalogURLFromURL:error:](SHJSONLCustomCatalogContainer, "customCatalogURLFromURL:error:", a3);
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F6C4A8]);
    objc_super v8 = [(SHJSONLCustomCatalogContainer *)self transformer];
    [v7 setDelegate:v8];

    v9 = [(SHJSONLCustomCatalogContainer *)self container];
    v10 = [(SHJSONLCustomCatalogContainer *)self transformer];
    [v10 setDelegate:v9];

    char v11 = [v7 loadDataFromURL:v6 withCompression:517 error:a4];
    v12 = [(SHJSONLCustomCatalogContainer *)self transformer];
    [v12 reset];
  }
  else
  {
    +[SHError annotateClientError:a4 code:301 underlyingError:0];
    char v11 = 0;
  }

  return v11;
}

- (NSData)dataRepresentation
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v9 = 0;
  v2 = [(SHJSONLCustomCatalogContainer *)self jsonObjectRepresentationWithError:&v9];
  id v3 = v9;
  if (v2)
  {
    id v8 = v3;
    v4 = [MEMORY[0x263F6C4B0] dataForJSONObjects:v2 compression:517 error:&v8];
    id v5 = v8;

    if (v4) {
      goto LABEL_10;
    }
    id v6 = sh_log_object();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_224B4B000, v6, OS_LOG_TYPE_ERROR, "Failed to compress contents: %@", buf, 0xCu);
    }
    id v3 = v5;
  }
  else
  {
    id v6 = sh_log_object();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_224B4B000, v6, OS_LOG_TYPE_ERROR, "Failed to convert catalog contents to json representation: %@", buf, 0xCu);
    }
    v4 = 0;
  }

  id v5 = v3;
LABEL_10:

  return (NSData *)v4;
}

- (id)jsonObjectRepresentationWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFF980];
  id v5 = +[SHJSONLCustomCatalogTransformer outputFileHeader];
  id v6 = [v4 arrayWithObject:v5];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [(SHJSONLCustomCatalogContainer *)self container];
  id v8 = [v7 referenceSignatures];

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 signature];
        v15 = [v13 ID];
        v16 = +[SHJSONLCustomCatalogTransformer catalogFileRepresentationOfSignature:v14 withID:v15];
        [v6 addObject:v16];

        v17 = [(SHJSONLCustomCatalogContainer *)self mediaItemsForReferenceSignature:v13];
        v18 = [v13 ID];
        v19 = +[SHJSONLCustomCatalogTransformer catalogFileRepresentationOfMediaItems:v17 withID:v18 error:a3];

        if (!v19)
        {

          id v20 = 0;
          goto LABEL_11;
        }
        [v6 addObjectsFromArray:v19];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v20 = v6;
LABEL_11:

  return v20;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = +[SHJSONLCustomCatalogContainer customCatalogURLFromURL:error:](SHJSONLCustomCatalogContainer, "customCatalogURLFromURL:error:", a3);
  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F6C4B0]) initWithDestination:v6 compression:517];
    id v8 = [(SHJSONLCustomCatalogContainer *)self jsonObjectRepresentationWithError:a4];
    uint64_t v9 = v8;
    if (v8)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            if (!objc_msgSend(v7, "writeObject:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), a4, (void)v17))
            {

              goto LABEL_14;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      char v15 = [v7 closeWithError:a4];
    }
    else
    {
LABEL_14:
      char v15 = 0;
    }
  }
  else
  {
    +[SHError annotateClientError:a4 code:301 underlyingError:0];
    char v15 = 0;
  }

  return v15;
}

+ (id)customCatalogURLFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 isFileURL])
  {
    char v13 = 0;
    id v6 = [MEMORY[0x263F08850] defaultManager];
    id v7 = [v5 path];
    [v6 fileExistsAtPath:v7 isDirectory:&v13];

    if (v13)
    {
      id v8 = [v5 URLByAppendingPathComponent:@"Signatures"];

      uint64_t v9 = [MEMORY[0x263F1D920] SHCustomCatalogContentType];
      id v10 = [v9 preferredFilenameExtension];
      id v5 = [v8 URLByAppendingPathExtension:v10];
    }
    id v5 = v5;
    uint64_t v11 = v5;
  }
  else
  {
    +[SHError annotateClientError:a4 code:301 underlyingError:0];
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)mediaItemsForReferenceSignature:(id)a3
{
  id v4 = a3;
  id v5 = [(SHJSONLCustomCatalogContainer *)self container];
  id v6 = [v5 mediaItemsForReferenceSignature:v4];

  return v6;
}

- (id)referenceSignatureForTrackID:(unint64_t)a3
{
  id v4 = [(SHJSONLCustomCatalogContainer *)self container];
  id v5 = [v4 referenceSignatureForTrackID:a3];

  return v5;
}

- (void)addSignature:(id)a3 representingMediaItems:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHJSONLCustomCatalogContainer *)self container];
  [v8 addSignature:v7 representingMediaItems:v6];
}

- (NSArray)referenceSignatures
{
  v2 = [(SHJSONLCustomCatalogContainer *)self container];
  id v3 = [v2 referenceSignatures];

  return (NSArray *)v3;
}

- (SHCustomCatalogStorage)container
{
  return self->_container;
}

- (SHJSONLCustomCatalogTransformer)transformer
{
  return self->_transformer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end