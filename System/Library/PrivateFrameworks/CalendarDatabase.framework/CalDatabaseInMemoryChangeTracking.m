@interface CalDatabaseInMemoryChangeTracking
+ (id)canonicalizePath:(id)a3;
+ (id)changeTrackingForDatabase:(CalDatabase *)a3;
+ (id)changeTrackingForDatabaseWithPath:(id)a3;
+ (id)pathForDatabase:(CalDatabase *)a3;
+ (void)_setInterestedDatabasePaths:(id)a3 forContext:(id)a4;
+ (void)cleanupDeallocatedClients;
+ (void)setInterestedDatabasePaths:(id)a3 forContext:(id)a4;
+ (void)setInterestedDatabases:(id)a3 forContext:(id)a4;
- (CalDatabaseInMemoryChangeTracking)init;
- (id)changedEntityIDsBetweenMinExternalTimestamp:(unint64_t)a3 minSelfTimestamp:(unint64_t)a4 maxExternalTimestamp:(unint64_t)a5 allowIntegrationChanges:(BOOL)a6 latestSelfTimestamp:(unint64_t *)a7 client:(int)a8 changeType:(unint64_t *)a9 deleteOffset:(unint64_t *)a10;
- (id)changedEntityIDsBetweenTimestamp:(id)a3 andTimestamp:(unint64_t)a4 allowIntegrationChanges:(BOOL)a5 latestTimestamp:(id *)a6 client:(unsigned int)a7 changeType:(unint64_t *)a8 deleteOffset:(unint64_t *)a9;
- (id)changedEntityIDsForDatabase:(CalDatabase *)a3 sinceTimestamp:(id)a4 allowIntegrationChanges:(BOOL)a5 latestTimestamp:(id *)a6 changeType:(unint64_t *)a7 deleteOffset:(unint64_t *)a8;
- (int)_writeChanges:(id)a3 withTimestamp:(unint64_t)a4 flags:(int)a5 clientID:(unsigned int)a6 atIndex:(int)a7;
- (void)addChangeset:(__CFArray *)a3 deletes:(__CFArray *)a4 clientID:(unsigned int)a5 changeType:(unint64_t)a6;
- (void)clearAllChangesets;
@end

@implementation CalDatabaseInMemoryChangeTracking

- (CalDatabaseInMemoryChangeTracking)init
{
  v3.receiver = self;
  v3.super_class = (Class)CalDatabaseInMemoryChangeTracking;
  result = [(CalDatabaseInMemoryChangeTracking *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)canonicalizePath:(id)a3
{
  id v3 = a3;
  if (([v3 hasSuffix:@"/"] & 1) == 0)
  {
    uint64_t v4 = [v3 stringByAppendingString:@"/"];

    id v3 = (id)v4;
  }
  return v3;
}

+ (id)pathForDatabase:(CalDatabase *)a3
{
  uint64_t v4 = CalDatabaseCopyDirectoryPathForDatabase((uint64_t)a3);
  v5 = [a1 canonicalizePath:v4];

  return v5;
}

+ (void)_setInterestedDatabasePaths:(id)a3 forContext:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_trackedDatabasesLock);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [(id)_trackedDatabases allKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v12 = [(id)_trackedDatabases objectForKeyedSubscript:v11];
        int v13 = [v5 containsObject:v11];
        v14 = [v12 clients];
        v15 = v14;
        if (v13)
        {
          [v14 addObject:v6];

          [v5 removeObject:v11];
        }
        else
        {
          [v14 removeObject:v6];

          if (([v12 hasClients] & 1) == 0) {
            [(id)_trackedDatabases removeObjectForKey:v11];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }

  if (!_trackedDatabases)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v17 = (void *)_trackedDatabases;
    _trackedDatabases = (uint64_t)v16;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        v24 = objc_alloc_init(CalInMemoryTrackedDatabase);
        v25 = [(CalInMemoryTrackedDatabase *)v24 clients];
        [v25 addObject:v6];

        [(id)_trackedDatabases setObject:v24 forKeyedSubscript:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_trackedDatabasesLock);
}

+ (void)setInterestedDatabases:(id)a3 forContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(a1, "pathForDatabase:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }
  objc_msgSend(a1, "_setInterestedDatabasePaths:forContext:", v8, v7, (void)v15);
}

+ (void)setInterestedDatabasePaths:(id)a3 forContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(a1, "canonicalizePath:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }
  objc_msgSend(a1, "_setInterestedDatabasePaths:forContext:", v8, v7, (void)v15);
}

+ (void)cleanupDeallocatedClients
{
}

+ (id)changeTrackingForDatabase:(CalDatabase *)a3
{
  uint64_t v4 = [a1 pathForDatabase:a3];
  id v5 = [a1 changeTrackingForDatabaseWithPath:v4];

  return v5;
}

+ (id)changeTrackingForDatabaseWithPath:(id)a3
{
  id v3 = [a1 canonicalizePath:a3];
  os_unfair_lock_lock((os_unfair_lock_t)&_trackedDatabasesLock);
  uint64_t v4 = [(id)_trackedDatabases objectForKeyedSubscript:v3];
  id v5 = [v4 database];

  os_unfair_lock_unlock((os_unfair_lock_t)&_trackedDatabasesLock);
  return v5;
}

- (void)clearAllChangesets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_nextIndex = 0;
  self->_changeCount = 0;
  self->_lastPrunedTimestamp = CalMonotonicTime();
  os_unfair_lock_unlock(p_lock);
}

- (void)addChangeset:(__CFArray *)a3 deletes:(__CFArray *)a4 clientID:(unsigned int)a5 changeType:(unint64_t)a6
{
  char v6 = a6;
  uint64_t v7 = *(void *)&a5;
  int Count = CFArrayGetCount(a3);
  int v12 = CFArrayGetCount(a4) + Count;
  if (v12 >= 513)
  {
    [(CalDatabaseInMemoryChangeTracking *)self clearAllChangesets];
    return;
  }
  os_unfair_lock_lock(&self->_lock);
  int v13 = self->_changeCount + v12;
  if (v13 >= 513)
  {
    if (1 - (v12 + self->_nextIndex) >= 0) {
      int v14 = -((1 - (v12 + self->_nextIndex)) & 0x1FF);
    }
    else {
      int v14 = (v12 + self->_nextIndex - 1) & 0x1FF;
    }
    self->_unint64_t lastPrunedTimestamp = self->_changes[v14].timestamp;
  }
  uint64_t v15 = CalMonotonicTime();
  int v16 = [(CalDatabaseInMemoryChangeTracking *)self _writeChanges:a4 withTimestamp:v15 flags:v6 & 3 | 4u clientID:v7 atIndex:[(CalDatabaseInMemoryChangeTracking *)self _writeChanges:a3 withTimestamp:v15 flags:v6 & 3 clientID:v7 atIndex:self->_nextIndex]];
  self->_nextIndex = v16;
  if (v13 <= 512)
  {
    int v18 = self->_changeCount + v12;
LABEL_19:
    self->_changeint Count = v18;
    goto LABEL_20;
  }
  self->_changeint Count = 512;
  unint64_t lastPrunedTimestamp = self->_lastPrunedTimestamp;
  if (self->_changes[v16].timestamp == lastPrunedTimestamp)
  {
    int v18 = 512;
    do
    {
      --v18;
      if (v16 == 511) {
        int v16 = 0;
      }
      else {
        ++v16;
      }
    }
    while (self->_changes[v16].timestamp == lastPrunedTimestamp);
    goto LABEL_19;
  }
LABEL_20:
  os_unfair_lock_unlock(&self->_lock);
}

- (int)_writeChanges:(id)a3 withTimestamp:(unint64_t)a4 flags:(int)a5 clientID:(unsigned int)a6 atIndex:(int)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    changes = self->_changes;
    unsigned int v17 = ((a6 & 0x1FFFFF) << 8) | (a5 << 29);
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v20 = &changes[a7];
        v20->timestamp = a4;
        uint64_t v21 = CalRecordIDGetEntityType(v19);
        *((_DWORD *)v20 + 3) = *((_DWORD *)v20 + 3) & 0xFFFFFF00 | internalEntityTypeFromExternalType(v21);
        unsigned int v22 = CalRecordIDGetRowID(v19);
        int v23 = v17 | *((unsigned __int8 *)v20 + 12);
        v20->rowID = v22;
        *((_DWORD *)v20 + 3) = v23;
        if (a7 == 511) {
          a7 = 0;
        }
        else {
          ++a7;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  return a7;
}

- (id)changedEntityIDsBetweenMinExternalTimestamp:(unint64_t)a3 minSelfTimestamp:(unint64_t)a4 maxExternalTimestamp:(unint64_t)a5 allowIntegrationChanges:(BOOL)a6 latestSelfTimestamp:(unint64_t *)a7 client:(int)a8 changeType:(unint64_t *)a9 deleteOffset:(unint64_t *)a10
{
  uint64_t v11 = a10;
  changeCFIndex Count = self->_changeCount;
  if (changeCount < 1)
  {
    p_unint64_t lastPrunedTimestamp = ($1A553942FAFCA5BD6C66782B992E980F *)&self->_lastPrunedTimestamp;
  }
  else
  {
    int nextIndex = self->_nextIndex;
    if (nextIndex) {
      int v14 = nextIndex - 1;
    }
    else {
      int v14 = 511;
    }
    p_unint64_t lastPrunedTimestamp = &self->_changes[v14];
  }
  int v16 = a9;
  *a7 = p_lastPrunedTimestamp->timestamp;
  if (a10) {
    *a10 = 0;
  }
  if (a3 >= a4) {
    unint64_t v17 = a4;
  }
  else {
    unint64_t v17 = a3;
  }
  if (v17 < self->_lastPrunedTimestamp)
  {
    id v18 = 0;
    goto LABEL_88;
  }
  if (changeCount)
  {
    int v19 = self->_nextIndex;
    BOOL v20 = __OFSUB__(v19, changeCount);
    int v21 = v19 - changeCount;
    if (v21 < 0 != v20) {
      int v22 = v21 + 512;
    }
    else {
      int v22 = v21;
    }
    int v23 = changeCount - 1;
    BOOL v74 = a6;
    int v24 = 0;
    if (changeCount > 1)
    {
      do
      {
        int v25 = v23 + v24;
        if (v23 + v24 < 0 != __OFADD__(v23, v24)) {
          ++v25;
        }
        int v26 = v25 >> 1;
        int v27 = v22 + (v25 >> 1);
        int v28 = v27 & 0x1FF;
        int v30 = -v27;
        BOOL v29 = v30 < 0;
        int v31 = v30 & 0x1FF;
        if (v29) {
          int v32 = v28;
        }
        else {
          int v32 = -v31;
        }
        if (self->_changes[v32].timestamp > v17) {
          int v23 = v26;
        }
        else {
          int v24 = v26 + 1;
        }
      }
      while (v24 < v23);
    }
    int v33 = changeCount - v24;
    Mutable = CFDictionaryCreateMutable(0, changeCount - v24, 0, 0);
    v84 = Mutable;
    CFArrayRef v85 = 0;
    if (v33 >= 1)
    {
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      unint64_t v38 = 0;
      uint64_t v70 = 0;
      if (v24 + v22 <= 0) {
        int v39 = -(-(v24 + v22) & 0x1FF);
      }
      else {
        int v39 = (v24 + v22) & 0x1FF;
      }
      changes = self->_changes;
      uint64_t v41 = 1;
      BOOL v43 = v74;
      int v42 = a8;
      unint64_t v45 = a4;
      unint64_t v44 = a5;
      unint64_t v46 = a3;
      while (1)
      {
        v47 = &changes[v39];
        unint64_t timestamp = v47->timestamp;
        unint64_t v49 = *((unsigned int *)v47 + 3);
        if (((v49 >> 8) & 0x1FFFFF) != v42) {
          break;
        }
        if (timestamp > v45) {
          goto LABEL_40;
        }
LABEL_69:
        if (v39 == 511) {
          int v39 = 0;
        }
        else {
          ++v39;
        }
LABEL_72:
        if (++v35 == v33)
        {
          CFDictionaryRef v61 = v84;
          int v16 = a9;
          uint64_t v11 = a10;
          uint64_t v62 = v70;
          goto LABEL_78;
        }
      }
      BOOL v50 = timestamp <= v46 || timestamp > v44;
      if (v50) {
        goto LABEL_69;
      }
LABEL_40:
      if ((v49 & 0x60000000) == 0x40000000 && !v43) {
        goto LABEL_72;
      }
      int v52 = *((_DWORD *)v47 + 3);
      int rowID = changes[v39].rowID;
      BOOL v76 = v41 != ((v49 >> 29) & 3);
      int v77 = v37;
      if ((v37 & 1) == 0) {
        uint64_t v41 = (v49 >> 29) & 3;
      }
      unint64_t v80 = 0;
      v81 = 0;
      uint64_t v82 = 0;
      unsigned int Value = CFDictionaryGetValue(v84, (const void *)rowID);
      LODWORD(v80) = Value;
      if (Value)
      {
        if ((Value & 0x80000000) == 0)
        {
          int v55 = 0;
          while ((Value & 0x1F) != v52)
          {
            ++v55;
            BOOL v50 = Value > 0x3F;
            Value >>= 6;
            if (!v50)
            {
              LODWORD(v82) = v55;
              HIDWORD(v80) = -1;
              goto LABEL_58;
            }
          }
          HIDWORD(v80) = v55;
          if ((Value & 0x20) == 0)
          {
LABEL_63:
            if ((v49 & 0x80000000) != 0)
            {
              EntityDict_set(&v84, v49, rowID, (uint64_t)&v80, 1);
              ++v70;
              --v38;
            }
            goto LABEL_68;
          }
          goto LABEL_66;
        }
        uint64_t v67 = v41;
        int v68 = v36;
        unint64_t v69 = v38;
        CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v85, Value & 0x7FFFFFFF);
        v81 = (unint64_t *)ValueAtIndex;
        CFIndex Count = CFArrayGetCount(ValueAtIndex);
        if (Count >= 1)
        {
          CFIndex v58 = Count;
          CFIndex v59 = 0;
          while (1)
          {
            unsigned __int8 v60 = CFArrayGetValueAtIndex(ValueAtIndex, v59);
            if ((v60 & 0x1F) == v52) {
              break;
            }
            if (v58 == ++v59) {
              goto LABEL_57;
            }
          }
          HIDWORD(v80) = v59;
          unint64_t v38 = v69;
          int v36 = v68;
          uint64_t v41 = v67;
          if ((v60 & 0x20) == 0) {
            goto LABEL_63;
          }
LABEL_66:
          if ((v49 & 0x80000000) != 0) {
            goto LABEL_68;
          }
          EntityDict_set(&v84, v49, rowID, (uint64_t)&v80, 0);
          --v70;
          goto LABEL_60;
        }
LABEL_57:
        HIDWORD(v80) = -1;
        unint64_t v38 = v69;
        int v36 = v68;
        uint64_t v41 = v67;
      }
      else
      {
        unint64_t v80 = 0xFFFFFFFF00000000;
        LODWORD(v82) = 0;
      }
LABEL_58:
      if ((v49 & 0x80000000) != 0)
      {
        EntityDict_set(&v84, v49, rowID, (uint64_t)&v80, 1);
        ++v70;
        goto LABEL_68;
      }
      EntityDict_set(&v84, v49, rowID, (uint64_t)&v80, 0);
LABEL_60:
      ++v38;
LABEL_68:
      v36 |= v77 & v76;
      int v37 = 1;
      BOOL v43 = v74;
      int v42 = a8;
      unint64_t v45 = a4;
      unint64_t v44 = a5;
      unint64_t v46 = a3;
      goto LABEL_69;
    }
    CFDictionaryRef v61 = Mutable;
    uint64_t v62 = 0;
    unint64_t v38 = 0;
    LOBYTE(v36) = 0;
    uint64_t v41 = 1;
LABEL_78:
    size_t v63 = 8 * (v38 + v62);
    v64 = malloc_type_malloc(v63, 0x100004000313F17uLL);
    unint64_t v80 = 0;
    v81 = &v80;
    uint64_t v82 = 0x2020000000;
    uint64_t v83 = 0;
    v79[0] = 0;
    v79[1] = v79;
    v79[2] = 0x2020000000;
    v79[3] = v38;
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __194__CalDatabaseInMemoryChangeTracking_changedEntityIDsBetweenMinExternalTimestamp_minSelfTimestamp_maxExternalTimestamp_allowIntegrationChanges_latestSelfTimestamp_client_changeType_deleteOffset___block_invoke;
    v78[3] = &unk_1E5D6CE10;
    v78[5] = &v80;
    v78[6] = v64;
    v78[4] = v79;
    context[0] = &v84;
    context[1] = v78;
    CFDictionaryApplyFunction(v61, (CFDictionaryApplierFunction)_EntityDict_enumerate, context);
    CFRelease(v84);
    if (v85) {
      CFRelease(v85);
    }
    id v18 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v64 length:v63 freeWhenDone:1];
    if (v16)
    {
      if (v36) {
        unint64_t v65 = 0;
      }
      else {
        unint64_t v65 = v41;
      }
      *int v16 = v65;
    }
    if (v11) {
      *uint64_t v11 = v38;
    }
    _Block_object_dispose(v79, 8);
    _Block_object_dispose(&v80, 8);
  }
  else
  {
    if (a9) {
      *a9 = 1;
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  }
LABEL_88:
  return v18;
}

void *__194__CalDatabaseInMemoryChangeTracking_changedEntityIDsBetweenMinExternalTimestamp_minSelfTimestamp_maxExternalTimestamp_allowIntegrationChanges_latestSelfTimestamp_client_changeType_deleteOffset___block_invoke(void *result, int a2, int a3, int a4)
{
  if ((a2 - 1) > 0x13) {
    int v4 = -1;
  }
  else {
    int v4 = dword_1A8F7E734[a2 - 1];
  }
  uint64_t v5 = result[6];
  if (a4)
  {
    *(_DWORD *)(v5 + 8 * *(void *)(*(void *)(result[4] + 8) + 24)) = v4;
    *(_DWORD *)(v5 + 8 * *(void *)(*(void *)(result[4] + 8) + 24) + 4) = a3;
    uint64_t v6 = result[4];
  }
  else
  {
    *(_DWORD *)(v5 + 8 * *(void *)(*(void *)(result[5] + 8) + 24)) = v4;
    *(_DWORD *)(v5 + 8 * *(void *)(*(void *)(result[5] + 8) + 24) + 4) = a3;
    uint64_t v6 = result[5];
  }
  ++*(void *)(*(void *)(v6 + 8) + 24);
  return result;
}

- (id)changedEntityIDsBetweenTimestamp:(id)a3 andTimestamp:(unint64_t)a4 allowIntegrationChanges:(BOOL)a5 latestTimestamp:(id *)a6 client:(unsigned int)a7 changeType:(unint64_t *)a8 deleteOffset:(unint64_t *)a9
{
  BOOL v11 = a5;
  p_lock = &self->_lock;
  id v15 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v22 = 0;
  uint64_t v16 = [v15 others];
  uint64_t v17 = [v15 myself];

  id v18 = [(CalDatabaseInMemoryChangeTracking *)self changedEntityIDsBetweenMinExternalTimestamp:v16 minSelfTimestamp:v17 maxExternalTimestamp:a4 allowIntegrationChanges:v11 latestSelfTimestamp:&v22 client:a7 changeType:a8 deleteOffset:a9];
  if (a6)
  {
    int v19 = [CalSingleDatabaseInMemoryChangeTimestamp alloc];
    *a6 = [(CalSingleDatabaseInMemoryChangeTimestamp *)v19 initWithTimestampForMyself:v22 others:a4];
  }
  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (id)changedEntityIDsForDatabase:(CalDatabase *)a3 sinceTimestamp:(id)a4 allowIntegrationChanges:(BOOL)a5 latestTimestamp:(id *)a6 changeType:(unint64_t *)a7 deleteOffset:(unint64_t *)a8
{
  BOOL v11 = a5;
  p_var9 = &a3->var9;
  id v15 = a4;
  os_unfair_lock_lock(p_var9);
  unint64_t var21 = a3->var21;
  uint64_t var22 = a3->var22;
  if (CDBLockingAssertionsEnabled) {
    os_unfair_lock_assert_owner(p_var9);
  }
  os_unfair_lock_unlock(p_var9);
  id v18 = [(CalDatabaseInMemoryChangeTracking *)self changedEntityIDsBetweenTimestamp:v15 andTimestamp:var21 allowIntegrationChanges:v11 latestTimestamp:a6 client:var22 changeType:a7 deleteOffset:a8];

  return v18;
}

@end