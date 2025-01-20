@interface PHFetchResult(HMDPhotoLibrary)
- (id)faceCropDataByUUID;
- (id)objects;
@end

@implementation PHFetchResult(HMDPhotoLibrary)

- (id)objects
{
  v1 = [a1 fetchedObjects];
  v2 = v1;
  if (!v1) {
    v1 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v3 = v1;

  return v3;
}

- (id)faceCropDataByUUID
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B8AC1970-2A44-4E05-A0DB-ED720A1D910C"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E4F29128];
        v11 = objc_msgSend(v9, "localIdentifier", (void)v17);
        v12 = [v11 dataUsingEncoding:4];
        v13 = objc_msgSend(v10, "hmf_UUIDWithNamespace:data:", v3, v12);

        v14 = [v9 resourceData];
        [v2 setObject:v14 forKeyedSubscript:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  v15 = (void *)[v2 copy];
  return v15;
}

@end