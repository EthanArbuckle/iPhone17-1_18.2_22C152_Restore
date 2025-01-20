@interface NSData(ISMutableStoreIndex_HashTable)
+ (id)_ISMutableStoreIndex_mappedDataWithCapacity:()ISMutableStoreIndex_HashTable additionalSize:;
- (uint64_t)_ISMutableStoreIndex_addValue:()ISMutableStoreIndex_HashTable;
- (uint64_t)_ISMutableStoreIndex_addValue:()ISMutableStoreIndex_HashTable size:forUUID:;
- (uint64_t)_ISStoreIndex_addNodeWithSize:()ISMutableStoreIndex_HashTable;
@end

@implementation NSData(ISMutableStoreIndex_HashTable)

+ (id)_ISMutableStoreIndex_mappedDataWithCapacity:()ISMutableStoreIndex_HashTable additionalSize:
{
  int v4 = a3;
  size_t v5 = (a4 + 40 * a3 + *MEMORY[0x1E4F14B00] + 19) & -*MEMORY[0x1E4F14B00];
  v6 = mmap(0, v5, 3, 4097, 0, 0);
  v7 = 0;
  if (v6 == (void *)-1) {
    v8 = 0;
  }
  else {
    v8 = v6;
  }
  if (v5) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v7 = (void *)[v10 initWithBytesNoCopy:v8 length:v5 deallocator:*MEMORY[0x1E4F28210]];
  }
  uint64_t v11 = objc_msgSend(v7, "_ISStoreIndex_hashTableHeader");
  if (v11)
  {
    *(_DWORD *)uint64_t v11 = 11;
    *(unsigned char *)(v11 + 4) = 1;
    *(_DWORD *)(v11 + 12) = v4;
  }
  return v7;
}

- (uint64_t)_ISStoreIndex_addNodeWithSize:()ISMutableStoreIndex_HashTable
{
  uint64_t result = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  if (result)
  {
    uint64_t v6 = a3 + 36;
    uint64_t v7 = *(unsigned int *)(result + 16);
    *(_DWORD *)(result + 16) = v7 + a3 + 36;
    unint64_t v8 = [a1 length];
    id v9 = a1;
    uint64_t v10 = [v9 bytes];
    uint64_t v11 = objc_msgSend(v9, "_ISStoreIndex_nodesOffset");
    v12 = (unint64_t *)(v11 + v7 + v10);
    if (v11 + v7 + (unint64_t)v6 < v8 && v12 != 0) {
      unint64_t *v12 = v7 | ((unint64_t)v6 << 32);
    }
    return v7 | (v6 << 32);
  }
  return result;
}

- (uint64_t)_ISMutableStoreIndex_addValue:()ISMutableStoreIndex_HashTable
{
  return objc_msgSend(a1, "_ISMutableStoreIndex_addValue:size:forUUID:", a3, 116, a3);
}

- (uint64_t)_ISMutableStoreIndex_addValue:()ISMutableStoreIndex_HashTable size:forUUID:
{
  uint64_t result = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = objc_msgSend(a1, "_ISStoreIndex_addNodeWithSize:", a4);
    uint64_t result = objc_msgSend(a1, "_ISStoreIndex_nodeForRef:", v11);
    if (result)
    {
      uint64_t v12 = result;
      *(void *)uint64_t result = v11;
      uuid_copy((unsigned __int8 *)(result + 8), (const unsigned __int8 *)a5);
      *(unsigned char *)(v12 + 32) = 0;
      *(void *)(v12 + 24) = 0;
      memcpy((void *)(v12 + 36), a3, a4);
      uint64_t v13 = *(void *)(a5 + 8) ^ *(void *)a5;
      uint64_t v14 = objc_msgSend(a1, "_ISStoreIndex_nodeRefForKey:", v13);
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t result = objc_msgSend(a1, "_ISStoreIndex_nodeForRef:", v14);
        if (!result) {
          return result;
        }
        unsigned int v16 = v15;
        while (1)
        {
          uint64_t v17 = *(void *)(result + 24);
          if (!v17)
          {
            v18 = (uint64_t *)(result + 24);
            goto LABEL_17;
          }
          if (v16 >= v17) {
            break;
          }
          uint64_t result = objc_msgSend(a1, "_ISStoreIndex_nodeForRef:", v17);
          HIDWORD(v15) = HIDWORD(v17);
          unsigned int v16 = v17;
          if (!result) {
            return result;
          }
        }
        v18 = (uint64_t *)(result + 24);
        if (v17)
        {
          v19 = _ISDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
            -[NSData(ISMutableStoreIndex_HashTable) _ISMutableStoreIndex_addValue:size:forUUID:](v16, SHIDWORD(v15), v19);
          }
        }
LABEL_17:
        uint64_t *v18 = v11;
      }
      else if ((objc_msgSend(a1, "_ISStoreIndex_setNodeRef:forKey:", v11, v13) & 1) == 0)
      {
        return 0;
      }
      uint64_t result = 1;
      *(unsigned char *)(v12 + 32) = 1;
      ++*(_DWORD *)(v10 + 8);
    }
  }
  return result;
}

- (void)_ISMutableStoreIndex_addValue:()ISMutableStoreIndex_HashTable size:forUUID:.cold.1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_fault_impl(&dword_1AE771000, log, OS_LOG_TYPE_FAULT, "Cyclic node detected: (offset: %u, size: %u) ", (uint8_t *)v3, 0xEu);
}

@end