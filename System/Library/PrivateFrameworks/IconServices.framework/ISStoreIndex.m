@interface ISStoreIndex
- (BOOL)validate;
- (ISStoreIndex)initWithStoreFileURL:(id)a3;
- (NSData)data;
- (NSURL)indexFileURL;
- (id)_internalData;
- (id)description;
- (os_unfair_lock_s)dataLock;
- (void)_internalSetData:(id)a3;
- (void)data;
- (void)enumerateValuesForUUID:(unsigned __int8)a3[16] bock:(id)a4;
- (void)enumerateValuesWithBock:(id)a3;
- (void)invalidate;
@end

@implementation ISStoreIndex

uint64_t __44__ISStoreIndex_enumerateValuesForUUID_bock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = NodeStructGetDataSize(a2);
  if (result == 116)
  {
    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  return result;
}

- (void)enumerateValuesForUUID:(unsigned __int8)a3[16] bock:(id)a4
{
  id v6 = a4;
  char v7 = 1;
  do
  {
    v8 = (void *)MEMORY[0x1B3E70EF0]();
    v9 = [(ISStoreIndex *)self data];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__ISStoreIndex_enumerateValuesForUUID_bock___block_invoke;
    v14[3] = &unk_1E5F09050;
    id v10 = v6;
    id v15 = v10;
    char v11 = objc_msgSend(v9, "_ISStoreIndex_enumerateValuesForUUID:bock:", a3, v14);
    if ((v11 & 1) == 0)
    {
      os_unfair_lock_lock([(ISStoreIndex *)self dataLock]);
      data = self->_data;
      self->_data = 0;

      os_unfair_lock_unlock([(ISStoreIndex *)self dataLock]);
    }

    char v13 = v7 & (v11 ^ 1);
    char v7 = 0;
  }
  while ((v13 & 1) != 0);
}

- (NSData)data
{
  os_unfair_lock_lock([(ISStoreIndex *)self dataLock]);
  if (![(NSData *)self->_data _ISStoreIndex_isValid])
  {
    v3 = (void *)MEMORY[0x1E4F1C9B8];
    v4 = [(ISStoreIndex *)self indexFileURL];
    objc_msgSend(v3, "_ISStoreIndex_mappedDataWithURL:", v4);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    data = self->_data;
    self->_data = v5;

    char v7 = self->_data;
    if (v7)
    {
      if (![(NSData *)v7 _ISStoreIndex_isValid])
      {
        v8 = self->_data;
        self->_data = 0;

        v9 = _ISDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          [(ISStoreIndex *)self data];
        }
      }
    }
  }
  id v10 = self->_data;
  os_unfair_lock_unlock([(ISStoreIndex *)self dataLock]);
  return v10;
}

- (os_unfair_lock_s)dataLock
{
  return &self->_dataLock;
}

- (NSURL)indexFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (ISStoreIndex)initWithStoreFileURL:(id)a3
{
  id v5 = a3;
  if (self)
  {
    objc_storeStrong((id *)&self->_indexFileURL, a3);
    self->_dataLock._os_unfair_lock_opaque = 0;
  }

  return self;
}

- (void)invalidate
{
  os_unfair_lock_lock([(ISStoreIndex *)self dataLock]);
  data = self->_data;
  self->_data = 0;

  v4 = [(ISStoreIndex *)self dataLock];
  os_unfair_lock_unlock(v4);
}

- (id)_internalData
{
  return self->_data;
}

- (void)_internalSetData:(id)a3
{
}

- (void)enumerateValuesWithBock:(id)a3
{
  id v4 = a3;
  id v5 = [(ISStoreIndex *)self data];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__ISStoreIndex_enumerateValuesWithBock___block_invoke;
  v7[3] = &unk_1E5F09050;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "_ISStoreIndex_enumerateValuesWithBock:", v7);
}

uint64_t __40__ISStoreIndex_enumerateValuesWithBock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = NodeStructGetDataSize(a2);
  if (result == 116)
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 0;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __27__ISStoreIndex_description__block_invoke;
  id v10 = &unk_1E5F09098;
  id v4 = v3;
  id v11 = v4;
  v12 = v13;
  [(ISStoreIndex *)self enumerateValuesWithBock:&v7];
  id v5 = objc_msgSend(NSString, "stringWithString:", v4, v7, v8, v9, v10);

  _Block_object_dispose(v13, 8);
  return v5;
}

void __27__ISStoreIndex_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1B3E70EF0]();
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)a2, out);
  memset(v8, 0, 37);
  uuid_unparse((const unsigned __int8 *)(a2 + 60), v8);
  memset(v7, 0, 37);
  uuid_unparse((const unsigned __int8 *)(a2 + 76), v7);
  memset(v6, 0, 37);
  uuid_unparse((const unsigned __int8 *)(a2 + 100), v6);
  memset(v5, 0, 37);
  uuid_unparse((const unsigned __int8 *)(a2 + 44), v5);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"Item [%u]\n\tUUID: %s\n\tSize: %upt @%ux\n\tValid from: %upt to %upt\n\tBitmap filename: %s.isdata\n\tValidation Token:- DB UUID: %s seq: %llu RSC UUID: %s\n\tDescriptor UUID: %s\n-------------------------------------------------\n", (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++, out, *(double *)(a2 + 32), *(unsigned int *)(a2 + 40), *(double *)(a2 + 16), *(double *)(a2 + 24), v8, v7, *(void *)(a2 + 92), v6, v5);
}

- (BOOL)validate
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v2 = [(ISStoreIndex *)self data];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__ISStoreIndex_validate__block_invoke_7;
  v6[3] = &unk_1E5F090E0;
  id v8 = &__block_literal_global_7;
  id v3 = v2;
  id v7 = v3;
  v9 = &v10;
  objc_msgSend(v3, "_ISStoreIndex_enumerateValuesWithBock:", v6);
  char v4 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

uint64_t __24__ISStoreIndex_validate__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = objc_msgSend(v4, "_ISStoreIndex_nodeForRef:", a3);
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = v5;
  unint64_t v7 = *(unsigned int *)(v5 + 24);
  if (v7 > a3)
  {
    while (1)
    {
      unint64_t v8 = v7;
      unint64_t v9 = *(unsigned int *)(v6 + 28);
      uint64_t v10 = objc_msgSend(v4, "_ISStoreIndex_nodeForRef:", v7 | (v9 << 32));
      if (!v10) {
        goto LABEL_6;
      }
      uint64_t v6 = v10;
      unint64_t v7 = *(unsigned int *)(v10 + 24);
      if (v7 <= v8)
      {
        if (*(_DWORD *)(v10 + 24)) {
          goto LABEL_8;
        }
        goto LABEL_6;
      }
    }
  }
  unint64_t v9 = HIDWORD(a3);
  LODWORD(v8) = a3;
  if (!*(_DWORD *)(v5 + 24))
  {
LABEL_6:
    uint64_t v11 = 1;
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v6 + 8];
  char v13 = _ISDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    int v15 = 138412802;
    v16 = v12;
    __int16 v17 = 1024;
    int v18 = v8;
    __int16 v19 = 1024;
    int v20 = v9;
    _os_log_fault_impl(&dword_1AE771000, v13, OS_LOG_TYPE_FAULT, "Cyclic node detected: %@ (offset: %u, size: %u) ", (uint8_t *)&v15, 0x18u);
  }

  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

uint64_t __24__ISStoreIndex_validate__block_invoke_7(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryData, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_indexFileURL, 0);
}

- (void)data
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 indexFileURL];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Store index at URL: %@ is not valid.", (uint8_t *)&v4, 0xCu);
}

@end