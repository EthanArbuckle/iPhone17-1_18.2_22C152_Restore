@interface ATXRootOfAppDataWithHashes
- (ATXRootOfAppDataWithHashes)init;
- (ATXRootOfAppDataWithHashes)initWithSerialized:(id)a3;
- (id)description;
- (id)serialize;
- (unint64_t)sessionCountForBundleId:(id)a3;
- (unint64_t)sessionCountForBundleId:(id)a3 firstAction:(id)a4;
- (void)recordSessionWithBundleId:(id)a3 firstAction:(id)a4;
@end

@implementation ATXRootOfAppDataWithHashes

- (ATXRootOfAppDataWithHashes)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXRootOfAppDataWithHashes;
  v2 = [(ATXRootOfAppData *)&v6 initInternal];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dataForBundleId = v2->_dataForBundleId;
    v2->_dataForBundleId = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (ATXRootOfAppDataWithHashes)initWithSerialized:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXRootOfAppDataWithHashes;
  v5 = [(ATXRootOfAppData *)&v14 initInternal];
  if (!v5) {
    goto LABEL_4;
  }
  objc_super v6 = (void *)MEMORY[0x1D25F6CC0]();
  id v13 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:2 format:0 error:&v13];
  id v8 = v13;
  v9 = (void *)v5[1];
  v5[1] = v7;

  if (v5[1])
  {

LABEL_4:
    v10 = v5;
    goto LABEL_8;
  }
  v11 = __atxlog_handle_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[ATXRootOfAppDataWithHashes initWithSerialized:]((uint64_t)v8, v11);
  }

  v10 = 0;
LABEL_8:

  return v10;
}

- (unint64_t)sessionCountForBundleId:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_dataForBundleId objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = *(unsigned int *)[v3 bytes];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)sessionCountForBundleId:(id)a3 firstAction:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_dataForBundleId objectForKeyedSubscript:a3];
  id v8 = v7;
  if (v7
    && (id v9 = v7,
        uint64_t v10 = [v9 mutableBytes],
        __key[0] = hash32(v6),
        __key[1] = 0,
        (v11 = (unsigned int *)bsearch(__key, (const void *)(v10 + 4), (unint64_t)([v9 length] - 4) >> 3, 8uLL, (int (__cdecl *)(const void *, const void *))compareEntries)) != 0))
  {
    unint64_t v12 = v11[1];
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

- (void)recordSessionWithBundleId:(id)a3 firstAction:(id)a4
{
  id v6 = a3;
  int v7 = hash32(a4);
  id v8 = [(NSMutableDictionary *)self->_dataForBundleId objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = (_DWORD *)[v9 mutableBytes];
    ++*v10;
    __key[0] = v7;
    __key[1] = 1;
    v11 = bsearch(__key, v10 + 1, (unint64_t)([v9 length] - 4) >> 3, 8uLL, (int (__cdecl *)(const void *, const void *))compareEntries);
    if (v11)
    {
      ++v11[1];
    }
    else
    {
      [v9 appendBytes:__key length:8];
      id v14 = v9;
      v15 = (void *)([v14 mutableBytes] + 4);
      uint64_t v16 = [v14 length];

      qsort(v15, (unint64_t)(v16 - 4) >> 3, 8uLL, (int (__cdecl *)(const void *, const void *))compareEntries);
    }
  }
  else
  {
    unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:12];
    [(NSMutableDictionary *)self->_dataForBundleId setObject:v12 forKeyedSubscript:v6];
    id v9 = v12;
    id v13 = (_DWORD *)[v9 mutableBytes];
    *id v13 = 1;
    v13[1] = v7;
    v13[2] = 1;
  }
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@", v5];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_dataForBundleId;
  uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [(NSMutableDictionary *)self->_dataForBundleId objectForKeyedSubscript:v11];
        id v13 = (unsigned int *)[v12 bytes];
        [v6 appendFormat:@"\n  %@ (%u): ", v11, *v13];
        uint64_t v14 = [v12 length];
        if ((unint64_t)(v14 - 4) >= 8)
        {
          unint64_t v15 = (unint64_t)(v14 - 4) >> 3;
          uint64_t v16 = v13 + 2;
          do
          {
            objc_msgSend(v6, "appendFormat:", @"%x(%u) ", *(v16 - 1), *v16);
            v16 += 2;
            --v15;
          }
          while (v15);
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  [v6 appendString:@"\n>"];
  return v6;
}

- (id)serialize
{
  dataForBundleId = self->_dataForBundleId;
  id v10 = 0;
  unint64_t v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:dataForBundleId format:200 options:0 error:&v10];
  if (!v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28B00];
    id v8 = v10;
    uint64_t v9 = [v7 currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ATXRootOfAppData.m", 226, @"Archiver error: %@", v8 object file lineNumber description];
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)initWithSerialized:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Could not load root of app data: %@", (uint8_t *)&v2, 0xCu);
}

@end