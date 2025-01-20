@interface MPServerObjectDatabaseSINFImportRequest
- (BOOL)performWithDatabaseOperations:(id)a3 error:(id *)a4;
- (MPServerObjectDatabaseSINFImportRequest)initWithPayload:(id)a3 requestPayload:(id)a4 hashedPersonID:(id)a5;
@end

@implementation MPServerObjectDatabaseSINFImportRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashedPersonID, 0);

  objc_storeStrong(&self->_requestPayload, 0);
}

- (BOOL)performWithDatabaseOperations:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  v24 = [(MPServerObjectDatabaseImportRequest *)self payload];
  v29 = [&stru_1EE6890E0 dataUsingEncoding:4];
  v5 = [self->_requestPayload objectForKeyedSubscript:@"adamIds"];
  v28 = self;
  v23 = [self->_requestPayload objectForKeyedSubscript:@"flavors"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v25)
  {
    int v6 = 1;
    uint64_t v22 = *(void *)v36;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v7;
        uint64_t v8 = *(void *)(*((void *)&v35 + 1) + 8 * v7);
        v9 = [v24 objectForKeyedSubscript:v8];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v27 = v23;
        uint64_t v10 = [v27 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v32 != v12) {
                objc_enumerationMutation(v27);
              }
              v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              id v15 = v29;
              v16 = [v9 objectForKeyedSubscript:v14];
              if ([v16 length])
              {
                uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:0];

                id v15 = (id)v17;
              }
              id v18 = v14;
              if ([&unk_1EE6ED6B8 containsObject:v18])
              {
                uint64_t v19 = 1;
              }
              else if ([&unk_1EE6ED6D0 containsObject:v18])
              {
                uint64_t v19 = 2;
              }
              else if ([&unk_1EE6ED6E8 containsObject:v18])
              {
                uint64_t v19 = 3;
              }
              else if ([&unk_1EE6ED700 containsObject:v18])
              {
                uint64_t v19 = 4;
              }
              else
              {
                uint64_t v19 = 0;
              }

              v6 &= [v30 importAssetSinf:v15 type:2 forIdentifier:v8 hashedPersonID:v28->_hashedPersonID flavor:v19 sinfPayload:0];
            }
            uint64_t v11 = [v27 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v25);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6 & 1;
}

- (MPServerObjectDatabaseSINFImportRequest)initWithPayload:(id)a3 requestPayload:(id)a4 hashedPersonID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPServerObjectDatabaseSINFImportRequest;
  uint64_t v11 = [(MPServerObjectDatabaseImportRequest *)&v14 _initWithPayload:a3];
  uint64_t v12 = (MPServerObjectDatabaseSINFImportRequest *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 5, a4);
    objc_storeStrong((id *)&v12->_hashedPersonID, a5);
  }

  return v12;
}

@end