@interface ISStoreMapTable
- (ISStoreMapTable)initWithURL:(id)a3 capacity:(unint64_t)a4;
- (NSData)data;
- (NSURL)url;
- (id)dataForUUID:(id)a3;
- (os_unfair_lock_s)dataLock;
- (unint64_t)initialCapacity;
- (void)_extend;
- (void)_extendData;
- (void)_extendWithMultiplyer:(float)a3;
- (void)addData:(id)a3 forUUID:(id)a4;
- (void)compact;
- (void)enumerateWithBlock:(id)a3;
- (void)enumerateWithUUID:(unsigned __int8)a3[16] block:(id)a4;
- (void)removeAll;
- (void)removeDataForUUID:(id)a3;
- (void)removeDataForUUID:(id)a3 passingTest:(id)a4;
- (void)setBytes:(const void *)a3 size:(unint64_t)a4 forUUID:(unsigned __int8)a5[16];
- (void)setDataLock:(os_unfair_lock_s)a3;
- (void)setUrl:(id)a3;
@end

@implementation ISStoreMapTable

- (ISStoreMapTable)initWithURL:(id)a3 capacity:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ISStoreMapTable;
  v8 = [(ISStoreMapTable *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    v9->_dataLock._os_unfair_lock_opaque = 0;
    v9->_initialCapacity = a4;
  }

  return v9;
}

- (void)addData:(id)a3 forUUID:(id)a4
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    v8[0] = 0;
    v8[1] = 0;
    [a4 getUUIDBytes:v8];
    id v7 = v6;
    -[ISStoreMapTable setBytes:size:forUUID:](self, "setBytes:size:forUUID:", [v7 bytes], objc_msgSend(v7, "length"), v8);
  }
  else
  {
    [(ISStoreMapTable *)self removeDataForUUID:a4];
  }
}

- (id)dataForUUID:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(ISStoreMapTable *)self data];
  v15[0] = 0;
  v15[1] = 0;
  [v4 getUUIDBytes:v15];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __31__ISStoreMapTable_dataForUUID___block_invoke;
  v13 = &unk_1E5F09008;
  id v14 = v5;
  id v7 = v5;
  objc_msgSend(v6, "_ISStoreIndex_enumerateValuesForUUID:bock:", v15, &v10);
  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

void __31__ISStoreMapTable_dataForUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a2 + 36 length:NodeStructGetDataSize(a2) freeWhenDone:0];
  [*(id *)(a1 + 32) addObject:v3];
}

- (void)removeDataForUUID:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ISStoreMapTable *)self data];
  v6[0] = 0;
  v6[1] = 0;
  [v4 getUUIDBytes:v6];

  objc_msgSend(v5, "_ISStoreIndex_enumerateValuesForUUID:bock:", v6, &__block_literal_global_5);
}

void __37__ISStoreMapTable_removeDataForUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 32) = 0;
}

- (void)removeDataForUUID:(id)a3 passingTest:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(ISStoreMapTable *)self data];
  v12[0] = 0;
  v12[1] = 0;
  [v7 getUUIDBytes:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__ISStoreMapTable_removeDataForUUID_passingTest___block_invoke;
  v10[3] = &unk_1E5F09050;
  id v11 = v6;
  id v9 = v6;
  objc_msgSend(v8, "_ISStoreIndex_enumerateValuesForUUID:bock:", v12, v10);
}

void __49__ISStoreMapTable_removeDataForUUID_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a2 + 36 length:NodeStructGetDataSize(a2) freeWhenDone:0];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    *(unsigned char *)(a2 + 32) = 0;
  }
}

- (void)enumerateWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(ISStoreMapTable *)self data];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ISStoreMapTable_enumerateWithBlock___block_invoke;
  v7[3] = &unk_1E5F09050;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "_ISStoreIndex_enumerateValuesWithBock:", v7);
}

void __38__ISStoreMapTable_enumerateWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2 + 8];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a2 + 36 length:NodeStructGetDataSize(a2) freeWhenDone:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAll
{
  id v9 = self->_data;
  uint64_t v3 = [(NSData *)v9 _ISStoreIndex_hashTableHeader];
  uint64_t v4 = v3;
  if (!v3 || (unsigned int v5 = *(_DWORD *)(v3 + 12)) == 0) {
    unsigned int v5 = 10000;
  }
  objc_msgSend(MEMORY[0x1E4F1C9B8], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", v5, v5 << 8);
  id v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  id v7 = [(ISStoreMapTable *)self url];
  [(NSData *)v6 _ISMutableStoreIndex_makeBackedByFileAtURL:v7];

  os_unfair_lock_lock(&self->_dataLock);
  data = self->_data;
  self->_data = v6;

  os_unfair_lock_unlock(&self->_dataLock);
  if (v4) {
    *(unsigned char *)(v4 + 4) = 0;
  }
}

- (void)compact
{
  LODWORD(v2) = 1.0;
  [(ISStoreMapTable *)self _extendWithMultiplyer:v2];
}

- (void)enumerateWithUUID:(unsigned __int8)a3[16] block:(id)a4
{
  id v6 = a4;
  id v7 = [(ISStoreMapTable *)self data];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__ISStoreMapTable_enumerateWithUUID_block___block_invoke;
  v9[3] = &unk_1E5F09050;
  id v10 = v6;
  id v8 = v6;
  objc_msgSend(v7, "_ISStoreIndex_enumerateValuesForUUID:bock:", a3, v9);
}

uint64_t __43__ISStoreMapTable_enumerateWithUUID_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2 + 36;
  uint64_t DataSize = NodeStructGetDataSize(a2);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v7(v4, v5, DataSize, a3);
}

- (void)setBytes:(const void *)a3 size:(unint64_t)a4 forUUID:(unsigned __int8)a5[16]
{
  id v9 = [(ISStoreMapTable *)self data];
  uint64_t v10 = objc_msgSend(v9, "_ISStoreIndex_hashTableHeader");
  if (v10 && *(_DWORD *)(v10 + 12) <= *(_DWORD *)(v10 + 8)) {
    [(ISStoreMapTable *)self _extend];
  }
  if ((objc_msgSend(v9, "_ISMutableStoreIndex_addValue:size:forUUID:", a3, a4, a5) & 1) == 0)
  {
    id v11 = _ISDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ISStoreMapTable setBytes:size:forUUID:](v11);
    }
  }
}

- (NSData)data
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  p_data = &self->_data;
  if ([(NSData *)self->_data _ISStoreIndex_isValid])
  {
    uint64_t v5 = *p_data;
  }
  else
  {
    id v6 = [(ISStoreMapTable *)self url];
    objc_msgSend(MEMORY[0x1E4F1C9B8], "_ISMutableStoreIndex_mappedDataWithURL:", v6);
    uint64_t v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (![(NSData *)v5 _ISStoreIndex_isValid])
    {
      objc_msgSend(MEMORY[0x1E4F1C9B8], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", self->_initialCapacity, self->_initialCapacity << 8);
      id v7 = (NSData *)objc_claimAutoreleasedReturnValue();

      [(NSData *)v7 _ISMutableStoreIndex_makeBackedByFileAtURL:v6];
      uint64_t v5 = v7;
    }
    objc_storeStrong((id *)p_data, v5);
  }
  os_unfair_lock_unlock(p_dataLock);
  return v5;
}

- (void)_extend
{
  LODWORD(v2) = 1.5;
  [(ISStoreMapTable *)self _extendWithMultiplyer:v2];
}

- (void)_extendWithMultiplyer:(float)a3
{
  uint64_t v5 = self->_data;
  uint64_t v6 = [(NSData *)v5 _ISStoreIndex_hashTableHeader];
  uint64_t v7 = v6;
  if (!v6 || (unsigned int v8 = *(_DWORD *)(v6 + 12)) == 0) {
    unsigned int v8 = 10000;
  }
  uint64_t v9 = (float)((float)v8 * a3);
  uint64_t v10 = [(NSData *)v5 length];
  uint64_t v11 = [(NSData *)v5 _ISStoreIndex_nodesOffset];
  v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", v9, (unint64_t)(float)((float)(unint64_t)(v10 - v11) * a3));
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__ISStoreMapTable__extendWithMultiplyer___block_invoke;
  v18[3] = &unk_1E5F09008;
  v13 = v12;
  v19 = v13;
  [(NSData *)v5 _ISStoreIndex_enumerateValuesWithBock:v18];
  id v14 = [(ISStoreMapTable *)self url];
  [(NSData *)v13 _ISMutableStoreIndex_makeBackedByFileAtURL:v14];

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  data = self->_data;
  self->_data = v13;
  v17 = v13;

  os_unfair_lock_unlock(p_dataLock);
  if (v7) {
    *(unsigned char *)(v7 + 4) = 0;
  }
}

uint64_t __41__ISStoreMapTable__extendWithMultiplyer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2 + 36;
  uint64_t DataSize = NodeStructGetDataSize(a2);
  return objc_msgSend(v3, "_ISMutableStoreIndex_addValue:size:forUUID:", v4, DataSize, a2 + 8);
}

- (void)_extendData
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "Failed to extend the store index size.", v1, 2u);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUrl:(id)a3
{
}

- (os_unfair_lock_s)dataLock
{
  return self->_dataLock;
}

- (void)setDataLock:(os_unfair_lock_s)a3
{
  self->_dataLock = a3;
}

- (unint64_t)initialCapacity
{
  return self->_initialCapacity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setBytes:(os_log_t)log size:forUUID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AE771000, log, OS_LOG_TYPE_DEBUG, "Error: Rcovery from addValue to corrupt index failed.", v1, 2u);
}

@end