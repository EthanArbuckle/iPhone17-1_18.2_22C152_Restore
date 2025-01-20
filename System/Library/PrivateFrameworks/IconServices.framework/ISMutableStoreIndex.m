@interface ISMutableStoreIndex
- (BOOL)addValue:(id *)a3;
- (BOOL)removeValueForUUID:(unsigned __int8)a3[16] passingTest:(id)a4;
- (BOOL)removeValuePassingTest:(id)a3;
- (ISMutableStoreIndex)initWithStoreFileURL:(id)a3 capacity:(unint64_t)a4;
- (OS_dispatch_queue)serialQueue;
- (id)data;
- (unint64_t)initialCapacity;
- (void)_extend;
- (void)_extendData;
- (void)performBlock:(id)a3;
- (void)removeAll;
@end

@implementation ISMutableStoreIndex

- (ISMutableStoreIndex)initWithStoreFileURL:(id)a3 capacity:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ISMutableStoreIndex;
  v7 = [(ISStoreIndex *)&v13 initWithStoreFileURL:v6];
  v8 = v7;
  if (v7)
  {
    v7->_initialCapacity = a4;
    id v9 = [v6 path];
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v10;
  }
  return v8;
}

- (id)data
{
  os_unfair_lock_lock([(ISStoreIndex *)self dataLock]);
  v3 = [(ISStoreIndex *)self _internalData];
  char v4 = objc_msgSend(v3, "_ISStoreIndex_isValid");

  if (v4)
  {
    v5 = [(ISStoreIndex *)self _internalData];
  }
  else
  {
    id v6 = [(ISStoreIndex *)self indexFileURL];
    v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_ISMutableStoreIndex_mappedDataWithURL:", v6);
    if ((objc_msgSend(v5, "_ISStoreIndex_isValid") & 1) == 0)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", self->_initialCapacity, 116 * self->_initialCapacity);

      objc_msgSend(v7, "_ISMutableStoreIndex_makeBackedByFileAtURL:", v6);
      v5 = v7;
    }
    [(ISStoreIndex *)self _internalSetData:v5];
  }
  os_unfair_lock_unlock([(ISStoreIndex *)self dataLock]);
  return v5;
}

- (void)performBlock:(id)a3
{
}

- (BOOL)addValue:(id *)a3
{
  v5 = [(ISMutableStoreIndex *)self data];
  uint64_t v6 = objc_msgSend(v5, "_ISStoreIndex_hashTableHeader");
  if (v6 && *(_DWORD *)(v6 + 12) <= *(_DWORD *)(v6 + 8))
  {
    [(ISMutableStoreIndex *)self _extend];
    uint64_t v7 = [(ISMutableStoreIndex *)self data];

    v5 = (void *)v7;
  }
  unint64_t v8 = objc_msgSend(v5, "_ISStoreIndex_nodesOffset") + 152;
  if (v8 > [v5 length])
  {
    [(ISMutableStoreIndex *)self _extendData];
    uint64_t v9 = [(ISMutableStoreIndex *)self data];

    v5 = (void *)v9;
  }
  if (objc_msgSend(v5, "_ISMutableStoreIndex_addValue:", a3))
  {
    BOOL v10 = 1;
    v11 = v5;
  }
  else
  {
    [(ISMutableStoreIndex *)self removeAll];
    v11 = [(ISMutableStoreIndex *)self data];

    if (objc_msgSend(v11, "_ISMutableStoreIndex_addValue:", a3))
    {
      BOOL v10 = 1;
    }
    else
    {
      v12 = _ISDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[ISStoreMapTable setBytes:size:forUUID:](v12);
      }

      BOOL v10 = 0;
    }
  }

  return v10;
}

- (BOOL)removeValuePassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [(ISMutableStoreIndex *)self data];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__ISMutableStoreIndex_removeValuePassingTest___block_invoke;
  v9[3] = &unk_1E5F09108;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "_ISStoreIndex_enumerateValuesWithBock:", v9);
  char v7 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __46__ISMutableStoreIndex_removeValuePassingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = NodeStructGetDataSize(a2);
  if (result == 116)
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    if (result)
    {
      *(unsigned char *)(a2 + 32) = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (BOOL)removeValueForUUID:(unsigned __int8)a3[16] passingTest:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  char v7 = [(ISMutableStoreIndex *)self data];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__ISMutableStoreIndex_removeValueForUUID_passingTest___block_invoke;
  v10[3] = &unk_1E5F09108;
  id v8 = v6;
  id v11 = v8;
  uint64_t v12 = &v13;
  objc_msgSend(v7, "_ISStoreIndex_enumerateValuesForUUID:bock:", a3, v10);
  LOBYTE(a3) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)a3;
}

uint64_t __54__ISMutableStoreIndex_removeValueForUUID_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = NodeStructGetDataSize(a2);
  if (result == 116)
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    if (result)
    {
      *(unsigned char *)(a2 + 32) = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)removeAll
{
  id v8 = [(ISStoreIndex *)self _internalData];
  uint64_t v3 = objc_msgSend(v8, "_ISStoreIndex_hashTableHeader");
  uint64_t v4 = v3;
  if (!v3 || (unsigned int v5 = *(_DWORD *)(v3 + 12)) == 0) {
    unsigned int v5 = 10000;
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", v5, 116 * v5);
  char v7 = [(ISStoreIndex *)self indexFileURL];
  objc_msgSend(v6, "_ISMutableStoreIndex_makeBackedByFileAtURL:", v7);

  os_unfair_lock_lock([(ISStoreIndex *)self dataLock]);
  [(ISStoreIndex *)self _internalSetData:v6];
  os_unfair_lock_unlock([(ISStoreIndex *)self dataLock]);
  if (v4) {
    *(unsigned char *)(v4 + 4) = 0;
  }
}

- (void)_extend
{
  uint64_t v3 = [(ISStoreIndex *)self _internalData];
  uint64_t v4 = objc_msgSend(v3, "_ISStoreIndex_hashTableHeader");
  uint64_t v5 = v4;
  if (!v4 || (unsigned int v6 = *(_DWORD *)(v4 + 12)) == 0) {
    unsigned int v6 = 10000;
  }
  uint64_t v7 = ((double)v6 * 1.5);
  uint64_t v8 = [v3 length];
  uint64_t v9 = objc_msgSend(v3, "_ISStoreIndex_nodesOffset");
  id v10 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", v7, (unint64_t)((double)(unint64_t)(v8 - v9) * 1.5));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __30__ISMutableStoreIndex__extend__block_invoke;
  v13[3] = &unk_1E5F09008;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend(v3, "_ISStoreIndex_enumerateValuesWithBock:", v13);
  uint64_t v12 = [(ISStoreIndex *)self indexFileURL];
  objc_msgSend(v11, "_ISMutableStoreIndex_makeBackedByFileAtURL:", v12);

  os_unfair_lock_lock([(ISStoreIndex *)self dataLock]);
  [(ISStoreIndex *)self _internalSetData:v11];
  os_unfair_lock_unlock([(ISStoreIndex *)self dataLock]);
  if (v5) {
    *(unsigned char *)(v5 + 4) = 0;
  }
}

uint64_t __30__ISMutableStoreIndex__extend__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = NodeStructGetDataSize(a2);
  if (result == 116)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    return objc_msgSend(v5, "_ISMutableStoreIndex_addValue:", a2 + 36);
  }
  return result;
}

- (void)_extendData
{
  uint64_t v3 = [(ISStoreIndex *)self _internalData];
  uint64_t v4 = objc_msgSend(v3, "_ISStoreIndex_hashTableHeader");
  uint64_t v5 = v4;
  if (!v4 || (unsigned int v6 = *(_DWORD *)(v4 + 12)) == 0) {
    unsigned int v6 = 10000;
  }
  uint64_t v7 = [v3 length];
  uint64_t v8 = objc_msgSend(v3, "_ISStoreIndex_nodesOffset");
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", v6, (unint64_t)((double)(unint64_t)(v7 - v8) * 1.5));
  vm_map_t v10 = *MEMORY[0x1E4F14960];
  id v11 = v3;
  vm_address_t v12 = [v11 bytes];
  vm_size_t v13 = [v11 length];
  id v14 = v9;
  if (vm_copy(v10, v12, v13, [v14 bytes]))
  {
    uint64_t v15 = _ISDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ISStoreMapTable _extendData](v15);
    }
  }
  else
  {
    char v16 = [(ISStoreIndex *)self indexFileURL];
    objc_msgSend(v14, "_ISMutableStoreIndex_makeBackedByFileAtURL:", v16);

    os_unfair_lock_lock([(ISStoreIndex *)self dataLock]);
    [(ISStoreIndex *)self _internalSetData:v14];
    os_unfair_lock_unlock([(ISStoreIndex *)self dataLock]);
    if (v5) {
      *(unsigned char *)(v5 + 4) = 0;
    }
  }
}

- (unint64_t)initialCapacity
{
  return self->_initialCapacity;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
}

@end