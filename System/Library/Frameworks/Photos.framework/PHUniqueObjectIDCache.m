@interface PHUniqueObjectIDCache
- (id)uniquedOIDs:(id)a1;
- (id)uniquedOIDsFromObjects:(void *)a1;
- (void)_verifyObjectIDIsTagged:(id)a3;
@end

@implementation PHUniqueObjectIDCache

- (id)uniquedOIDs:(id)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [a1 _verifyObjectIDIsTagged:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
    a1 = v4;
  }

  return a1;
}

- (void)_verifyObjectIDIsTagged:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (uint64_t)a3;
  if (v3 >= 1)
  {
    v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_FAULT, "Unexpected non-tagged NSManagedObjectID: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)uniquedOIDsFromObjects:(void *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  int v5 = 0;
  if (!a1 || !v3) {
    goto LABEL_26;
  }
  unint64_t v6 = [v3 count];
  unint64_t v7 = v6;
  if ((v6 & 0x8000000000000000) != 0)
  {
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
    v25 = (void *)MEMORY[0x1E4F1CA00];
    v26 = (void *)MEMORY[0x1E4F1C3A8];
    goto LABEL_31;
  }
  if (v6 <= 1) {
    size_t v8 = 1;
  }
  else {
    size_t v8 = v6;
  }
  if (v6 >= 0x101) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  size_t v10 = 8 * v9;
  MEMORY[0x1F4188790]();
  long long v12 = (char *)&v29 - v11;
  bzero((char *)&v29 - v11, v10);
  v31 = &v29;
  if (v7 >= 0x101)
  {
    uint64_t v15 = (char *)malloc_type_calloc(8uLL, v8, 0xA178B581uLL);
    if (v15)
    {
      long long v12 = v15;
      MEMORY[0x1F4188790]();
      long long v13 = (char *)v28;
      bzero(v28, v10);
      v16 = malloc_type_calloc(8uLL, v8, 0x66C49042uLL);
      if (v16)
      {
        v14 = v16;
        objc_msgSend(v4, "getObjects:range:", v12, 0, v7);
LABEL_16:
        v30 = v4;
        for (uint64_t i = 0; i != v7; ++i)
        {
          id v18 = *(id *)&v12[8 * i];
          uint64_t v19 = [v18 objectID];
          [a1 _verifyObjectIDIsTagged:v19];
          v20 = (void *)v14[i];
          v14[i] = v19;
        }
        v4 = v30;
        goto LABEL_19;
      }
    }
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"*** attempt to create a temporary id buffer of length (%lu) failed", v8);
    v25 = (void *)MEMORY[0x1E4F1CA00];
    v26 = (void *)MEMORY[0x1E4F1C4A0];
LABEL_31:
    id v27 = [v25 exceptionWithName:*v26 reason:v24 userInfo:0];
    objc_exception_throw(v27);
  }
  bzero(v12, 8 * v8);
  MEMORY[0x1F4188790]();
  long long v13 = (char *)&v29 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v13, v10);
  bzero(v13, 8 * v8);
  objc_msgSend(v4, "getObjects:range:", v12, 0, v7);
  v14 = v13;
  if (v7) {
    goto LABEL_16;
  }
LABEL_19:
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithObjects:v14 count:v7];
  if (v7 >= 0x101) {
    free(v12);
  }
  for (uint64_t j = 0; j != v8; ++j)
  {
    v22 = (void *)v14[j];
    v14[j] = 0;
  }
  if (v7 >= 0x101) {
    free(v14);
  }
  do
  {

    v10 -= 8;
  }
  while (v10);
LABEL_26:

  return v5;
}

@end