@interface NSData(ISStoreIndex_HashTable)
- (uint64_t)_ISStoreIndex_checkNodeBounds:()ISStoreIndex_HashTable;
- (uint64_t)_ISStoreIndex_enumerateValuesForUUID:()ISStoreIndex_HashTable bock:;
- (uint64_t)_ISStoreIndex_hashTable;
- (uint64_t)_ISStoreIndex_hashTableHeader;
- (uint64_t)_ISStoreIndex_isValid;
- (uint64_t)_ISStoreIndex_nodeForRef:()ISStoreIndex_HashTable;
- (uint64_t)_ISStoreIndex_nodeRefForKey:()ISStoreIndex_HashTable;
- (uint64_t)_ISStoreIndex_nodesOffset;
- (void)_ISStoreIndex_enumerateValuesWithBock:()ISStoreIndex_HashTable;
@end

@implementation NSData(ISStoreIndex_HashTable)

- (uint64_t)_ISStoreIndex_enumerateValuesForUUID:()ISStoreIndex_HashTable bock:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v6 = a4;
  char v15 = 0;
  v7 = (void *)MEMORY[0x1B3E70EF0]();
  unint64_t v8 = objc_msgSend(a1, "_ISStoreIndex_nodeRefForKey:", *(void *)(a3 + 8) ^ *(void *)a3);
  uint64_t v9 = objc_msgSend(a1, "_ISStoreIndex_nodeForRef:", v8);
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = HIDWORD(v8);
    while (objc_msgSend(a1, "_ISStoreIndex_checkNodeBounds:", v10))
    {
      if (*(unsigned char *)(v10 + 32) && !uuid_compare((const unsigned __int8 *)(v10 + 8), (const unsigned __int8 *)a3)) {
        v6[2](v6, v10, &v15);
      }
      if (!v15)
      {
        uint64_t v12 = *(unsigned int *)(v10 + 24);
        if (v12 <= v8)
        {
          if (v12)
          {
            v13 = _ISDefaultLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109376;
              int v17 = v8;
              __int16 v18 = 1024;
              int v19 = v11;
              _os_log_fault_impl(&dword_1AE771000, v13, OS_LOG_TYPE_FAULT, "Cyclic node detected: (offset: %u, size: %u) ", buf, 0xEu);
            }
          }
          break;
        }
        unint64_t v11 = *(unsigned int *)(v10 + 28);
        uint64_t v10 = objc_msgSend(a1, "_ISStoreIndex_nodeForRef:", v12 | (v11 << 32));
        LODWORD(v8) = v12;
      }
      if (!v10 || v15) {
        break;
      }
    }
  }

  return 1;
}

- (uint64_t)_ISStoreIndex_nodeForRef:()ISStoreIndex_HashTable
{
  if (!a3) {
    return 0;
  }
  unint64_t v5 = [a1 length];
  id v6 = a1;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = objc_msgSend(v6, "_ISStoreIndex_nodesOffset") + a3;
  uint64_t v9 = (uint64_t *)(v8 + v7);
  if (v8 + HIDWORD(a3) >= v5 || v9 == 0) {
    return 0;
  }
  if (*v9 != a3)
  {
    unint64_t v11 = _ISDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(NSData(ISStoreIndex_HashTable) *)v9 _ISStoreIndex_nodeForRef:v11];
    }

    return 0;
  }
  return v9;
}

- (uint64_t)_ISStoreIndex_nodesOffset
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  uint64_t result = objc_msgSend(v1, "_ISStoreIndex_hashTableHeader");
  if (result)
  {
    uint64_t v4 = *(unsigned int *)(result + 12);
    if (v4) {
      BOOL v5 = v2 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5) {
      return 0;
    }
    else {
      return 8 * v4 + 20;
    }
  }
  return result;
}

- (uint64_t)_ISStoreIndex_hashTableHeader
{
  if ((unint64_t)[a1 length] < 0x15) {
    return 0;
  }
  id v2 = a1;
  return [v2 bytes];
}

- (uint64_t)_ISStoreIndex_checkNodeBounds:()ISStoreIndex_HashTable
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a1;
    if ([v4 bytes] <= a3)
    {
      id v6 = v4;
      uint64_t v7 = [v6 bytes];
      if ([v6 length] + v7 <= a3)
      {
        BOOL v5 = _ISDefaultLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          -[NSData(ISStoreIndex_HashTable) _ISStoreIndex_checkNodeBounds:].cold.4();
        }
      }
      else
      {
        id v8 = v6;
        uint64_t v9 = [v8 bytes];
        if (a3 + 36 >= [v8 length] + v9)
        {
          BOOL v5 = _ISDefaultLog();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
            -[NSData(ISStoreIndex_HashTable) _ISStoreIndex_checkNodeBounds:]();
          }
        }
        else
        {
          unint64_t v10 = *(unsigned int *)(a3 + 4) + a3;
          id v11 = v8;
          uint64_t v12 = [v11 bytes];
          if (v10 < [v11 length] + v12) {
            return 1;
          }
          BOOL v5 = _ISDefaultLog();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          {
            id v14 = v11;
            uint64_t v15 = [v14 bytes];
            uint64_t v16 = [v14 length];
            int v17 = *(_DWORD *)(a3 + 4);
            int v18 = 134218496;
            unint64_t v19 = a3;
            __int16 v20 = 2048;
            uint64_t v21 = v15 + v16;
            __int16 v22 = 1024;
            int v23 = v17;
            _os_log_fault_impl(&dword_1AE771000, v5, OS_LOG_TYPE_FAULT, "Node exceeds expected bounds, %p vs %p node expected size=%d", (uint8_t *)&v18, 0x1Cu);
          }
        }
      }
    }
    else
    {
      BOOL v5 = _ISDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[NSData(ISStoreIndex_HashTable) _ISStoreIndex_checkNodeBounds:]();
      }
    }
  }
  else
  {
    BOOL v5 = _ISDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[NSData(ISStoreIndex_HashTable) _ISStoreIndex_checkNodeBounds:](v5);
    }
  }

  return 0;
}

- (uint64_t)_ISStoreIndex_nodeRefForKey:()ISStoreIndex_HashTable
{
  uint64_t v5 = objc_msgSend(a1, "_ISStoreIndex_hashTable");
  uint64_t result = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  if (result)
  {
    uint64_t v7 = result;
    uint64_t result = 0;
    if (v5)
    {
      unint64_t v8 = *(unsigned int *)(v7 + 12);
      if (v8) {
        return *(void *)(v5 + 8 * (a3 % v8));
      }
    }
  }
  return result;
}

- (uint64_t)_ISStoreIndex_hashTable
{
  [a1 length];
  id v2 = a1;
  uint64_t v3 = [v2 bytes];
  uint64_t v4 = objc_msgSend(v2, "_ISStoreIndex_hashTableHeader");
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  else {
    return v3 + 20;
  }
}

- (uint64_t)_ISStoreIndex_isValid
{
  uint64_t result = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  if (result) {
    return *(unsigned char *)(result + 4) && *(_DWORD *)result == 11;
  }
  return result;
}

- (void)_ISStoreIndex_enumerateValuesWithBock:()ISStoreIndex_HashTable
{
  uint64_t v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  id v6 = a1;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = objc_msgSend(v6, "_ISStoreIndex_nodesOffset");
  if (v5)
  {
    int v9 = *(_DWORD *)(v5 + 8);
    char v13 = 0;
    if ((v9 & 0x80000000) == 0)
    {
      uint64_t v10 = v8 + v7;
      while (1)
      {
        id v11 = (void *)MEMORY[0x1B3E70EF0]();
        if ((objc_msgSend(v6, "_ISStoreIndex_checkNodeBounds:", v10) & 1) == 0) {
          break;
        }
        if (*(unsigned char *)(v10 + 32)) {
          v4[2](v4, v10, &v13);
        }
        if (!v13) {
          v10 += *(unsigned int *)(v10 + 4);
        }
        BOOL v12 = __OFSUB__(v9--, 1);
        if (v9 < 0 != v12 || v13) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_13:
}

- (void)_ISStoreIndex_nodeForRef:()ISStoreIndex_HashTable .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1AE771000, log, OS_LOG_TYPE_DEBUG, "StoreIndex node ref missmatch ref: %llx node: %llx.", (uint8_t *)&v4, 0x16u);
}

- (void)_ISStoreIndex_checkNodeBounds:()ISStoreIndex_HashTable .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1AE771000, log, OS_LOG_TYPE_FAULT, "Null nodePtr", v1, 2u);
}

- (void)_ISStoreIndex_checkNodeBounds:()ISStoreIndex_HashTable .cold.2()
{
  OUTLINED_FUNCTION_2();
  [v0 bytes];
  OUTLINED_FUNCTION_3(&dword_1AE771000, v1, v2, "nodePtr preceeds bytes, %p vs %p", v3, v4, v5, v6, 0);
}

- (void)_ISStoreIndex_checkNodeBounds:()ISStoreIndex_HashTable .cold.3()
{
  OUTLINED_FUNCTION_2();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = v1;
  [v2 bytes];
  [v2 length];
  OUTLINED_FUNCTION_0_1();
  __int16 v5 = v3;
  uint64_t v6 = 36;
  _os_log_fault_impl(&dword_1AE771000, v0, OS_LOG_TYPE_FAULT, "Node exceeds minimal bounds. %p vs %p struct size=%lu", v4, 0x20u);
}

- (void)_ISStoreIndex_checkNodeBounds:()ISStoreIndex_HashTable .cold.4()
{
  OUTLINED_FUNCTION_2();
  id v1 = v0;
  [v1 bytes];
  [v1 length];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1AE771000, v2, v3, "nodePtr exceeds bounds, %p vs %p", v4, v5, v6, v7, v8);
}

@end