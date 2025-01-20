@interface SGKeyValueCacheFile
+ (BOOL)supportsSecureCoding;
+ (id)encodedStringForFullName:(id)a3;
+ (id)fullNameForEncodedContact:(id)a3;
+ (id)keyValueCacheForPath:(id)a3;
+ (id)pathToCache;
+ (void)clearCacheAtPath:(id)a3;
- (SGKeyValueCacheFile)initWithCoder:(id)a3;
- (SGKeyValueCacheFile)initWithFileDescriptor:(int)a3;
- (SGKeyValueCacheFile)initWithPath:(id)a3;
- (id)_map;
- (id)description;
- (id)initBlank;
- (id)initInMemory;
- (id)initTemporaryForOverwritingCache:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKey:(id)a3 found:(BOOL *)a4;
- (void)commitTemporaryFile;
- (void)dealloc;
- (void)deleteValueByRecordId:(id)a3;
- (void)deleteValueByRecordIdSet:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateRowsWithBlock:(void *)a1;
- (void)setValue:(id)a3 forKey:(id)a4 fromRecordId:(id)a5;
- (void)setValueIfNotPresent:(id)a3 forKey:(id)a4 fromRecordId:(id)a5;
- (void)setValueIfNotPresentWithDict:(id)a3 fromRecordId:(id)a4;
@end

@implementation SGKeyValueCacheFile

- (SGKeyValueCacheFile)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SGKeyValueCacheFile *)self initBlank];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;
  }
  return v5;
}

- (id)initBlank
{
  v5.receiver = self;
  v5.super_class = (Class)SGKeyValueCacheFile;
  v2 = [(SGKeyValueCacheFile *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_fd = -1;
    pthread_mutex_init(&v2->_lock, 0);
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SGKeyValueCacheFile *)self _map];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (id)valueForKey:(id)a3 found:(BOOL *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGKeyValueCacheFile.m", 341, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if ([v7 length])
  {
    v8 = (const char *)[v7 UTF8String];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x5012000000;
    v24 = __Block_byref_object_copy__17;
    v25 = __Block_byref_object_dispose__18;
    v26 = "\"0";
    long long v27 = xmmword_1A4E198C8;
    long long v28 = unk_1A4E198D8;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x5012000000;
    v18[3] = __Block_byref_object_copy__17;
    v18[4] = __Block_byref_object_dispose__18;
    v18[5] = "\"0";
    long long v19 = xmmword_1A4E198C8;
    long long v20 = unk_1A4E198D8;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41__SGKeyValueCacheFile_valueForKey_found___block_invoke;
    v16[3] = &unk_1E5B8E7F0;
    v16[4] = v18;
    v16[5] = &v21;
    v16[6] = v8;
    __int16 v17 = strlen(v8);
    -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v16);
    v9 = v22;
    if (a4) {
      *a4 = v22[8] != 0;
    }
    uint64_t v10 = v9[8];
    if (v10)
    {
      uint64_t v11 = *((unsigned __int16 *)v9 + 28);
      uint64_t v12 = *((unsigned __int16 *)v9 + 29);
      id v13 = (id)v9[9];
      if (v12) {
        uint64_t v12 = [[NSString alloc] initWithBytes:v10 + v11 + 16 length:v12 encoding:4];
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    _Block_object_dispose(v18, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return (id)v12;
}

- (void)enumerateRowsWithBlock:(void *)a1
{
  v3 = a2;
  if (a1)
  {
    id v4 = [a1 _map];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
      uint64_t v7 = [v6 bytes];
      id v8 = v6;
      uint64_t v9 = [v8 bytes];
      uint64_t v10 = v9 + [v8 length];
      char v21 = 0;
      while ((unint64_t)(v10 - v7) >= 0x10)
      {
        id v11 = v8;
        uint64_t v12 = *(unsigned __int16 *)(v7 + 8);
        uint64_t v13 = *(unsigned __int16 *)(v7 + 10);
        uint64_t v14 = v13 + v12;
        if (v10 - (v7 + 16) < v13 + v12)
        {

          break;
        }
        uint64_t v15 = *(void *)v7;
        __int16 v16 = v12;
        __int16 v17 = v13;
        int v18 = 0;
        uint64_t v19 = v7;
        id v20 = v11;
        v3[2](v3, &v15, &v21);
        v7 += 16 + v14;
        if (v21) {
          break;
        }
      }
    }
  }
}

void __41__SGKeyValueCacheFile_valueForKey_found___block_invoke(uint64_t a1, uint64_t *a2)
{
  if (!(*((unsigned __int16 *)a2 + 4) | *((unsigned __int16 *)a2 + 5)))
  {
    uint64_t v4 = *a2;
    id v5 = *(void **)(*(void *)(a1 + 32) + 8);
    if (*a2 == v5[6])
    {
      v5[6] = -1;
      v5[7] = 0;
      id v6 = (void *)v5[9];
      v5[8] = 0;
      v5[9] = 0;

      uint64_t v4 = *a2;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v4 == *(void *)(v7 + 48))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      long long v9 = *(_OWORD *)(v8 + 48);
      *(void *)(v7 + 64) = *(void *)(v8 + 64);
      *(_OWORD *)(v7 + 48) = v9;
      objc_storeStrong((id *)(v7 + 72), *(id *)(v8 + 72));
      uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 8);
      v10[6] = -1;
      v10[7] = 0;
      id v11 = (void *)v10[9];
      v10[8] = 0;
      v10[9] = 0;
    }
  }
  size_t v12 = *((unsigned __int16 *)a2 + 4);
  if (v12 == *(unsigned __int16 *)(a1 + 56)
    && !memcmp((const void *)(a2[2] + 16), *(const void **)(a1 + 48), v12))
  {
    if (*a2 == -1)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(void *)(v13 + 48) != -1)
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
        long long v15 = *(_OWORD *)(v13 + 48);
        *(void *)(v14 + 64) = *(void *)(v13 + 64);
        *(_OWORD *)(v14 + 48) = v15;
        objc_storeStrong((id *)(v14 + 72), *(id *)(v13 + 72));
      }
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v17 = *(_OWORD *)a2;
    *(void *)(v16 + 64) = a2[2];
    *(_OWORD *)(v16 + 48) = v17;
    objc_storeStrong((id *)(v16 + 72), (id)a2[3]);
  }
  int v18 = (void *)a2[3];
}

- (id)_map
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  memStore = self->_memStore;
  if (memStore && !self->_data)
  {
    id v5 = (NSData *)[(NSMutableData *)memStore copy];
    data = self->_data;
    self->_data = v5;
  }
  p_data = &self->_data;
  uint64_t v7 = self->_data;
  if (v7)
  {
    dispatch_data_t v9 = v7;
    goto LABEL_17;
  }
  int fd = self->_fd;
  if (fd < 0) {
    goto LABEL_16;
  }
  memset(&v24, 0, sizeof(v24));
  if (fstat(fd, &v24) == -1)
  {
    uint64_t v13 = sgLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      goto LABEL_16;
    }
    int v14 = *__error();
    long long v15 = __error();
    uint64_t v16 = strerror(*v15);
    *(_DWORD *)buf = 67109378;
    int v26 = v14;
    __int16 v27 = 2080;
    long long v28 = v16;
    long long v17 = "Could not stat fd: [%i] %s";
LABEL_21:
    _os_log_error_impl(&dword_1A4D8C000, v13, OS_LOG_TYPE_ERROR, v17, buf, 0x12u);
    goto LABEL_15;
  }
  size_t st_size = v24.st_size;
  if (v24.st_size)
  {
    size_t v12 = mmap(0, v24.st_size, 1, 2, self->_fd, 0);
    if (v12 != (void *)-1)
    {
      dispatch_data_t v9 = dispatch_data_create(v12, st_size, 0, (dispatch_block_t)*MEMORY[0x1E4F143F8]);
      objc_storeStrong((id *)p_data, v9);
      goto LABEL_17;
    }
    uint64_t v13 = sgLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v21 = *__error();
    v22 = __error();
    uint64_t v23 = strerror(*v22);
    *(_DWORD *)buf = 67109378;
    int v26 = v21;
    __int16 v27 = 2080;
    long long v28 = v23;
    long long v17 = "Could not mmap fd: [%i] %s";
    goto LABEL_21;
  }
  uint64_t v18 = objc_opt_new();
  uint64_t v19 = *p_data;
  *p_data = (NSData *)v18;

LABEL_16:
  dispatch_data_t v9 = 0;
LABEL_17:
  pthread_mutex_unlock(p_lock);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_other, 0);
  objc_storeStrong((id *)&self->_memStore, 0);
  objc_storeStrong((id *)&self->_tmpDir, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v4 = [(SGKeyValueCacheFile *)self _map];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 appendFormat:@"%@ (size: %lu bytes)\n", v6, objc_msgSend(v4, "length")];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__SGKeyValueCacheFile_description__block_invoke;
  v9[3] = &unk_1E5B8E8E0;
  id v7 = v3;
  id v10 = v7;
  -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v9);

  return v7;
}

void __34__SGKeyValueCacheFile_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (*(unsigned __int16 *)(a2 + 8) | *(unsigned __int16 *)(a2 + 10))
  {
    [v4 appendString:@"  "];
    if (*(void *)a2 != -1) {
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"[%llu] ", *(void *)a2);
    }
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(unsigned __int16 *)(a2 + 8);
    uint64_t v7 = *(void *)(a2 + 16);
    id v8 = *(id *)(a2 + 24);
    dispatch_data_t v9 = 0;
    if (v6 && v7) {
      dispatch_data_t v9 = (void *)[[NSString alloc] initWithBytes:v7 + 16 length:v6 encoding:4];
    }

    uint64_t v10 = *(unsigned __int16 *)(a2 + 8);
    uint64_t v11 = *(unsigned __int16 *)(a2 + 10);
    uint64_t v12 = *(void *)(a2 + 16);
    id v13 = *(id *)(a2 + 24);
    int v14 = 0;
    if (v11 && v12) {
      int v14 = (void *)[[NSString alloc] initWithBytes:v12 + v10 + 16 length:v11 encoding:4];
    }

    [v5 appendFormat:@"'%@' => '%@'\n", v9, v14];
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", @"  [%llu] DELETE\n", *(void *)a2);
  }
  long long v15 = *(void **)(a2 + 24);
}

- (void)deleteValueByRecordIdSet:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_fd < 0 && !self->_memStore)
  {
    int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"SGKeyValueCacheFile.m" lineNumber:511 description:@"Cache is read-only"];
  }
  uint64_t v6 = objc_opt_new();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __48__SGKeyValueCacheFile_deleteValueByRecordIdSet___block_invoke;
  v27[3] = &unk_1E5B8E8B8;
  id v7 = v5;
  id v28 = v7;
  id v8 = v6;
  id v29 = v8;
  -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v27);
  if ([v8 count])
  {
    dispatch_data_t v9 = (uint64_t *)malloc_type_calloc([v8 count], 0x10uLL, 0x1000040D9A13B51uLL);
    if (!v9)
    {
      id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v22);
    }
    uint64_t v10 = v9;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      long long v15 = v10;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v16), "longLongValue", (void)v23);
          uint64_t v18 = v15 + 2;
          ++v16;
          uint64_t *v15 = v17;
          v15[1] = 0;
          v15 += 2;
        }
        while (v13 != v16);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v30 count:16];
        long long v15 = v18;
      }
      while (v13);
    }

    pthread_mutex_lock(&self->_lock);
    memStore = self->_memStore;
    if (memStore) {
      -[NSMutableData appendBytes:length:](memStore, "appendBytes:length:", v10, 16 * [v11 count]);
    }
    else {
      write(self->_fd, v10, 16 * [v11 count]);
    }
    data = self->_data;
    self->_data = 0;

    pthread_mutex_unlock(&self->_lock);
    free(v10);
  }
}

void __48__SGKeyValueCacheFile_deleteValueByRecordIdSet___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = +[SGRecordId recordIdWithInternalEntityId:*a2];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = *a2;
    if (*((unsigned __int16 *)a2 + 4) | *((unsigned __int16 *)a2 + 5))
    {
      id v8 = [NSNumber numberWithLongLong:v7];
      [v6 addObject:v8];
    }
    else
    {
      id v8 = [NSNumber numberWithLongLong:v7];
      [v6 removeObject:v8];
    }
  }
  dispatch_data_t v9 = (void *)a2[3];
}

- (void)deleteValueByRecordId:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (self->_fd < 0 && !self->_memStore)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SGKeyValueCacheFile.m" lineNumber:486 description:@"Cache is read-only"];

    if (v6) {
      goto LABEL_4;
    }
  }
  else if (v5)
  {
LABEL_4:
    uint64_t v7 = [v6 internalEntityId];
    goto LABEL_7;
  }
  uint64_t v7 = -1;
LABEL_7:
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__SGKeyValueCacheFile_deleteValueByRecordId___block_invoke;
  v12[3] = &unk_1E5B8E890;
  v12[4] = &v13;
  v12[5] = v7;
  -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v12);
  if (*((unsigned char *)v14 + 24))
  {
    v11[0] = v7;
    v11[1] = 0;
    pthread_mutex_lock(&self->_lock);
    memStore = self->_memStore;
    if (memStore) {
      [(NSMutableData *)memStore appendBytes:v11 length:16];
    }
    else {
      write(self->_fd, v11, 0x10uLL);
    }
    data = self->_data;
    self->_data = 0;

    pthread_mutex_unlock(&self->_lock);
  }
  _Block_object_dispose(&v13, 8);
}

void __45__SGKeyValueCacheFile_deleteValueByRecordId___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 == *(void *)(a1 + 40)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (*(unsigned __int16 *)(a2 + 8) | *(unsigned __int16 *)(a2 + 10)) != 0;
  }
}

- (void)setValueIfNotPresentWithDict:(id)a3 fromRecordId:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self->_fd < 0 && !self->_memStore)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"SGKeyValueCacheFile.m" lineNumber:434 description:@"Cache is read-only"];
  }
  dispatch_data_t v9 = objc_opt_new();
  uint64_t v10 = [v8 numericValue];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __65__SGKeyValueCacheFile_setValueIfNotPresentWithDict_fromRecordId___block_invoke;
  v44[3] = &unk_1E5B8E840;
  uint64_t v46 = v10;
  id v11 = v9;
  id v45 = v11;
  v33 = self;
  -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v44);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    char v15 = 0;
    uint64_t v16 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        BOOL v19 = v18 == 0;

        v15 |= v19;
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v14);

    if (v15)
    {
      id v20 = v7;
      int v21 = v33;
      [(SGKeyValueCacheFile *)v33 deleteValueByRecordId:v8];
LABEL_25:
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __65__SGKeyValueCacheFile_setValueIfNotPresentWithDict_fromRecordId___block_invoke_2;
      v34[3] = &unk_1E5B8E868;
      v34[4] = v21;
      id v35 = v8;
      [v20 enumerateKeysAndObjectsUsingBlock:v34];

      goto LABEL_26;
    }
  }
  else
  {
  }
  id v32 = v8;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v22 = v7;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        id v28 = objc_msgSend(v12, "objectForKeyedSubscript:", v27, v32);
        id v29 = [v22 objectForKeyedSubscript:v27];
        if ([v28 isEqual:v29])
        {
          [v12 setObject:0 forKeyedSubscript:v27];
        }
        else
        {
          v30 = [v22 objectForKeyedSubscript:v27];
          [v12 setObject:v30 forKeyedSubscript:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v24);
  }

  id v20 = v12;
  id v8 = v32;
  int v21 = v33;
  if ([v20 count]) {
    goto LABEL_25;
  }
LABEL_26:
}

void __65__SGKeyValueCacheFile_setValueIfNotPresentWithDict_fromRecordId___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 != *(void *)(a1 + 40)) {
    goto LABEL_16;
  }
  uint64_t v4 = *(unsigned __int16 *)(a2 + 8);
  uint64_t v5 = *(unsigned __int16 *)(a2 + 10);
  if (!(v4 | v5))
  {
    [*(id *)(a1 + 32) removeAllObjects];
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)(a2 + 16);
  id v7 = *(id *)(a2 + 24);
  id v8 = v7;
  if (v5 && v6)
  {
    dispatch_data_t v9 = (void *)[[NSString alloc] initWithBytes:v6 + v4 + 16 length:v5 encoding:4];

    if (v9)
    {
      int v10 = 0;
      id v11 = v9;
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v11 = [MEMORY[0x1E4F1CA98] null];
  dispatch_data_t v9 = 0;
  int v10 = 1;
LABEL_10:
  id v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(unsigned __int16 *)(a2 + 8);
  uint64_t v14 = *(void *)(a2 + 16);
  id v15 = *(id *)(a2 + 24);
  uint64_t v16 = 0;
  if (v13 && v14) {
    uint64_t v16 = (void *)[[NSString alloc] initWithBytes:v14 + 16 length:v13 encoding:4];
  }

  [v12 setObject:v11 forKeyedSubscript:v16];
  if (v10) {

  }
LABEL_16:
  uint64_t v17 = *(void **)(a2 + 24);
}

void __65__SGKeyValueCacheFile_setValueIfNotPresentWithDict_fromRecordId___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA98];
  id v6 = a2;
  id v7 = [v5 null];

  if (v7 == v9) {
    id v8 = 0;
  }
  else {
    id v8 = v9;
  }
  [*(id *)(a1 + 32) setValue:v8 forKey:v6 fromRecordId:*(void *)(a1 + 40)];
}

- (void)setValueIfNotPresent:(id)a3 forKey:(id)a4 fromRecordId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  id v12 = (const char *)[v11 UTF8String];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x5012000000;
  uint64_t v17 = __Block_byref_object_copy__17;
  uint64_t v18 = __Block_byref_object_dispose__18;
  BOOL v19 = "\"0";
  long long v20 = xmmword_1A4E198C8;
  long long v21 = unk_1A4E198D8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__SGKeyValueCacheFile_setValueIfNotPresent_forKey_fromRecordId___block_invoke;
  v13[3] = &unk_1E5B8E818;
  v13[4] = &v14;
  v13[5] = v12;
  v13[6] = strlen(v12);
  -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v13);
  if (!v15[8]) {
    [(SGKeyValueCacheFile *)self setValue:v8 forKey:v11 fromRecordId:v10];
  }
  _Block_object_dispose(&v14, 8);
}

void __64__SGKeyValueCacheFile_setValueIfNotPresent_forKey_fromRecordId___block_invoke(uint64_t a1, long long *a2)
{
  int v4 = *((unsigned __int16 *)a2 + 4);
  if (!*((_DWORD *)a2 + 2))
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    if (*(void *)a2 == v5[6])
    {
      v5[6] = -1;
      v5[7] = 0;
      id v6 = (void *)v5[9];
      v5[8] = 0;
      v5[9] = 0;

      int v4 = *((unsigned __int16 *)a2 + 4);
    }
    else
    {
      int v4 = 0;
    }
  }
  size_t v7 = *(void *)(a1 + 48);
  if (v7 == v4 && !memcmp((const void *)(*((void *)a2 + 2) + 16), *(const void **)(a1 + 40), v7))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v9 = *a2;
    *(void *)(v8 + 64) = *((void *)a2 + 2);
    *(_OWORD *)(v8 + 48) = v9;
    objc_storeStrong((id *)(v8 + 72), *((id *)a2 + 3));
  }
  id v10 = (void *)*((void *)a2 + 3);
}

- (void)setValue:(id)a3 forKey:(id)a4 fromRecordId:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_fd < 0 && !self->_memStore)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SGKeyValueCacheFile.m" lineNumber:377 description:@"Cache is read-only"];

    if (v10) {
      goto LABEL_4;
    }
  }
  else if (v10)
  {
    goto LABEL_4;
  }
  uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"SGKeyValueCacheFile.m", 378, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

LABEL_4:
  if (![v10 length]) {
    goto LABEL_24;
  }
  id v12 = (const char *)[v10 UTF8String];
  uint64_t v13 = (const char *)[v9 UTF8String];
  size_t v14 = strlen(v12);
  if (!v13)
  {
    size_t v15 = 0;
    if (v12) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGKeyValueCacheFile.m", 386, @"Invalid parameter not satisfying: %@", @"keyUtf8" object file lineNumber description];

    goto LABEL_7;
  }
  size_t v15 = strlen(v13);
  if (!v12) {
    goto LABEL_14;
  }
LABEL_7:
  if (v14 >= 0xFFFF)
  {
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SGKeyValueCacheFile.m", 387, @"Invalid parameter not satisfying: %@", @"keyLen < UINT16_MAX" object file lineNumber description];
  }
  if (v15 >= 0xFFFF)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SGKeyValueCacheFile.m", 388, @"Invalid parameter not satisfying: %@", @"valLen < UINT16_MAX" object file lineNumber description];
  }
  uint64_t v26 = 0;
  if (v11) {
    uint64_t v16 = [v11 internalEntityId];
  }
  else {
    uint64_t v16 = -1;
  }
  uint64_t v25 = v16;
  LOWORD(v26) = v14;
  WORD1(v26) = v15;
  memStore = self->_memStore;
  if (memStore)
  {
    [(NSMutableData *)memStore appendBytes:&v25 length:16];
    [(NSMutableData *)self->_memStore appendBytes:v12 length:v14];
    if (v15) {
      [(NSMutableData *)self->_memStore appendBytes:v13 length:v15];
    }
  }
  else
  {
    v27.iov_base = &v25;
    v27.iov_len = 16;
    id v28 = v12;
    size_t v29 = v14;
    v30 = v13;
    size_t v31 = v15;
    pthread_mutex_lock(&self->_lock);
    if (v15) {
      int v19 = 3;
    }
    else {
      int v19 = 2;
    }
    writev(self->_fd, &v27, v19);
  }
  data = self->_data;
  self->_data = 0;

  pthread_mutex_unlock(&self->_lock);
LABEL_24:
}

- (id)valueForKey:(id)a3
{
  return [(SGKeyValueCacheFile *)self valueForKey:a3 found:0];
}

- (void)commitTemporaryFile
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = self->_other;
  int v4 = v3;
  if (!v3)
  {
    size_t v7 = sgLogHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    LOWORD(v28) = 0;
    uint64_t v8 = "Could not commit cache file as it is not temporary";
LABEL_25:
    uint64_t v26 = v7;
    uint32_t v27 = 2;
    goto LABEL_26;
  }
  pthread_mutex_lock(&v3->_lock);
  memStore = self->_memStore;
  if (memStore)
  {
    objc_storeStrong((id *)&v4->_memStore, memStore);
LABEL_4:
    data = v4->_data;
    v4->_data = 0;

    goto LABEL_15;
  }
  if (!self->_tmpDir || (path = self->_path) == 0)
  {
    size_t v7 = sgLogHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    LOWORD(v28) = 0;
    uint64_t v8 = "Could not commit cache file as it is not temporary";
    goto LABEL_25;
  }
  id v10 = [(NSString *)path UTF8String];
  id v11 = [(NSString *)v4->_path UTF8String];
  rename(v10, v11, v12);
  if (v13 != -1)
  {
    int fd = v4->_fd;
    if (fd >= 1) {
      close(fd);
    }
    v4->_int fd = self->_fd;
    self->_int fd = -1;
    goto LABEL_4;
  }
  size_t v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v22 = v4->_path;
    int v23 = *__error();
    uint64_t v24 = __error();
    uint64_t v25 = strerror(*v24);
    int v28 = 138412802;
    size_t v29 = v22;
    __int16 v30 = 1024;
    int v31 = v23;
    __int16 v32 = 2080;
    v33 = v25;
    uint64_t v8 = "Could not overwrite %@: [%i] %s";
    uint64_t v26 = v7;
    uint32_t v27 = 28;
LABEL_26:
    _os_log_error_impl(&dword_1A4D8C000, v26, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v28, v27);
  }
LABEL_14:

LABEL_15:
  tmpDir = self->_tmpDir;
  if (tmpDir)
  {
    uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v16 removeItemAtPath:self->_tmpDir error:0];

    tmpDir = self->_tmpDir;
  }
  self->_tmpDir = 0;

  int v17 = self->_fd;
  if (v17 >= 1) {
    close(v17);
  }
  self->_int fd = -1;
  uint64_t v18 = self->_path;
  self->_path = 0;

  other = self->_other;
  self->_other = 0;

  long long v20 = self->_data;
  self->_data = 0;

  long long v21 = self->_memStore;
  self->_memStore = 0;

  if (v4) {
    pthread_mutex_unlock(&v4->_lock);
  }
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    close(fd);
  }
  if (self->_tmpDir)
  {
    int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v4 removeItemAtPath:self->_tmpDir error:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)SGKeyValueCacheFile;
  [(SGKeyValueCacheFile *)&v5 dealloc];
}

- (id)initInMemory
{
  v2 = [(SGKeyValueCacheFile *)self initBlank];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    int v4 = (void *)v2[13];
    v2[13] = v3;
  }
  return v2;
}

- (id)initTemporaryForOverwritingCache:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (id *)a3;
  id v6 = v5;
  if (v5[13])
  {
    size_t v7 = [(SGKeyValueCacheFile *)self initInMemory];
    uint64_t v8 = v7;
    if (v7) {
      objc_storeStrong(v7 + 14, a3);
    }
    id v9 = v8;
    id v10 = v9;
  }
  else if (v5[11] && *((int *)v5 + 20) > 0)
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:");
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v30 = 0;
    int v13 = [v12 URLForDirectory:99 inDomain:1 appropriateForURL:v11 create:1 error:&v30];
    size_t v14 = (id *)v30;
    size_t v15 = [v13 path];

    if (v15)
    {
      uint64_t v16 = [v6[11] lastPathComponent];
      int v17 = [v15 stringByAppendingPathComponent:v16];

      id v18 = v17;
      uint64_t v19 = open_dprotected_np((const char *)[v18 UTF8String], 2562, 3, 0, 384);
      if ((v19 & 0x80000000) != 0)
      {
        uint64_t v24 = sgLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int v27 = *__error();
          int v28 = __error();
          size_t v29 = strerror(*v28);
          *(_DWORD *)buf = 138412802;
          __int16 v32 = (id *)v18;
          __int16 v33 = 1024;
          int v34 = v27;
          __int16 v35 = 2080;
          long long v36 = v29;
          _os_log_error_impl(&dword_1A4D8C000, v24, OS_LOG_TYPE_ERROR, "Could not open temporary cache file %@: [%i] %s", buf, 0x1Cu);
        }

        uint64_t v25 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v25 removeItemAtPath:v15 error:0];

        id v9 = [(SGKeyValueCacheFile *)self initBlank];
        id v10 = 0;
      }
      else
      {
        long long v20 = [(SGKeyValueCacheFile *)self initWithFileDescriptor:v19];
        p_isa = (id *)&v20->super.isa;
        if (v20)
        {
          objc_storeStrong((id *)&v20->_tmpDir, v15);
          objc_storeStrong(p_isa + 11, v18);
          objc_storeStrong(p_isa + 14, a3);
        }
        id v9 = p_isa;
        id v10 = v9;
      }
    }
    else
    {
      int v23 = sgLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v32 = v14;
        _os_log_error_impl(&dword_1A4D8C000, v23, OS_LOG_TYPE_ERROR, "Could not create temporary directory: %@", buf, 0xCu);
      }

      id v9 = [(SGKeyValueCacheFile *)self initBlank];
      id v10 = 0;
    }
  }
  else
  {
    id v22 = sgLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v32 = v6;
      _os_log_error_impl(&dword_1A4D8C000, v22, OS_LOG_TYPE_ERROR, "Could not create temporary directory for readonly target: %@", buf, 0xCu);
    }

    id v9 = [(SGKeyValueCacheFile *)self initBlank];
    id v10 = 0;
  }

  return v10;
}

- (SGKeyValueCacheFile)initWithPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = open_dprotected_np((const char *)[v4 UTF8String], 522, 3, 0, 384);
  if ((v5 & 0x80000000) != 0)
  {
    id v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = *__error();
      int v13 = __error();
      size_t v14 = strerror(*v13);
      *(_DWORD *)buf = 138412802;
      id v16 = v4;
      __int16 v17 = 1024;
      int v18 = v12;
      __int16 v19 = 2080;
      long long v20 = v14;
      _os_log_error_impl(&dword_1A4D8C000, v10, OS_LOG_TYPE_ERROR, "Could not open cache file %@: [%i] %s", buf, 0x1Cu);
    }

    uint64_t v8 = [(SGKeyValueCacheFile *)self initBlank];
    id v9 = 0;
  }
  else
  {
    id v6 = [(SGKeyValueCacheFile *)self initWithFileDescriptor:v5];
    size_t v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_path, v4);
    }
    uint64_t v8 = v7;
    id v9 = v8;
  }

  return v9;
}

- (SGKeyValueCacheFile)initWithFileDescriptor:(int)a3
{
  result = [(SGKeyValueCacheFile *)self initBlank];
  if (result) {
    result->_int fd = a3;
  }
  return result;
}

+ (id)fullNameForEncodedContact:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1A6265250]();
  uint64_t v5 = [v3 substringFromIndex:1];

  return v5;
}

+ (id)encodedStringForFullName:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1A6265250]();
  uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@" %@", v3];

  return v5;
}

+ (void)clearCacheAtPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 pathToCache];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SGKeyValueCacheFile_clearCacheAtPath___block_invoke;
  v7[3] = &unk_1E5B8FC58;
  id v8 = v4;
  id v6 = v4;
  [v5 runWithLockAcquired:v7];
}

uint64_t __40__SGKeyValueCacheFile_clearCacheAtPath___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
}

+ (id)keyValueCacheForPath:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  size_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1926;
  __int16 v17 = __Block_byref_object_dispose__1927;
  id v18 = 0;
  uint64_t v5 = [a1 pathToCache];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__SGKeyValueCacheFile_keyValueCacheForPath___block_invoke;
  v9[3] = &unk_1E5B8E7C8;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v13;
  id v12 = a1;
  [v5 runWithLockAcquired:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __44__SGKeyValueCacheFile_keyValueCacheForPath___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = (void *)[*(id *)(a1 + 32) copy];
  uint64_t v4 = [v10 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v7 = [objc_alloc(*(Class *)(a1 + 48)) initWithPath:v3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [v10 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:v3];
  }
}

+ (id)pathToCache
{
  if (pathToCache__pasOnceToken2 != -1) {
    dispatch_once(&pathToCache__pasOnceToken2, &__block_literal_global_1928);
  }
  v2 = (void *)pathToCache__pasExprOnceResult;

  return v2;
}

void __34__SGKeyValueCacheFile_pathToCache__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6265250]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  uint64_t v4 = (void *)pathToCache__pasExprOnceResult;
  pathToCache__pasExprOnceResult = v3;
}

@end