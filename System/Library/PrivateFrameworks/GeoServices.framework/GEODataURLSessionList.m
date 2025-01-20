@interface GEODataURLSessionList
- (GEODataURLSessionList)init;
- (id)urlSessionForIdentifier:(id)a3;
- (id)urlSessionForRequest:(id)a3;
- (unint64_t)count;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)addSession:(id)a3;
- (void)finishTasksAndInvalidateSessionsMatching:(id)a3 group:(id)a4;
- (void)pruneSessionsNotInIdentifierArray:(id)a3 agressive:(BOOL)a4;
@end

@implementation GEODataURLSessionList

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = (void *)MEMORY[0x18C1203C0]();
    v8 = [(NSMapTable *)self->_pendingInvalidationGroups objectForKey:v9];
    if (v8)
    {
      [(NSMapTable *)self->_pendingInvalidationGroups removeObjectForKey:v9];
      dispatch_group_leave(v8);
    }
  }
}

- (id)urlSessionForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__35;
  v17 = __Block_byref_object_dispose__35;
  id v18 = 0;
  urlSessions = self->_urlSessions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__GEODataURLSessionList_urlSessionForRequest___block_invoke;
  v9[3] = &unk_1E53E12D8;
  id v6 = v4;
  v11 = self;
  v12 = &v13;
  id v10 = v6;
  [(NSMutableArray *)urlSessions enumerateObjectsUsingBlock:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)pruneSessionsNotInIdentifierArray:(id)a3 agressive:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x18C1203C0]();
  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-900.0];
  id v9 = [MEMORY[0x1E4F28E60] indexSet];
  urlSessions = self->_urlSessions;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__GEODataURLSessionList_pruneSessionsNotInIdentifierArray_agressive___block_invoke;
  v16[3] = &unk_1E53E1300;
  BOOL v19 = a4;
  v16[4] = self;
  v16[5] = v8;
  id v11 = v6;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  [(NSMutableArray *)urlSessions enumerateObjectsUsingBlock:v16];
  uint64_t v13 = [(NSMutableArray *)self->_urlSessions objectsAtIndexes:v12];
  [(NSMutableArray *)self->_urlSessions removeObjectsAtIndexes:v12];
  [(NSMutableArray *)self->_lastUsedDates removeObjectsAtIndexes:v12];
  [v13 makeObjectsPerformSelector:sel_invalidateAndCancel];
  if ([v12 count])
  {
    v14 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [v12 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v15;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "Pruned %zu underlying sessions", buf, 0xCu);
    }
  }
}

- (void)addSession:(id)a3
{
  [(NSMutableArray *)self->_urlSessions addObject:a3];
  lastUsedDates = self->_lastUsedDates;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [(NSMutableArray *)lastUsedDates addObject:v5];
}

void __46__GEODataURLSessionList_urlSessionForRequest___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  id v6 = [v10 configuration];
  int v7 = objc_msgSend(v6, "geo_isCompatibleWithRequest:", a1[4]);

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    v8 = *(void **)(a1[5] + 16);
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v8 replaceObjectAtIndex:a3 withObject:v9];
  }
}

void __69__GEODataURLSessionList_pruneSessionsNotInIdentifierArray_agressive___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:a3];
  id v6 = v5;
  if (*(unsigned char *)(a1 + 64)) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = [v5 compare:*(void *)(a1 + 40)] != -1;
  }
  uint64_t IdentifierFromSession = GEODataURLSessionGetIdentifierFromSession(v11);
  if (IdentifierFromSession)
  {
    id v9 = *(void **)(a1 + 48);
    id v10 = [NSNumber numberWithUnsignedInt:IdentifierFromSession];
    LODWORD(v9) = [v9 containsObject:v10];

    if (((v7 | v9) & 1) == 0) {
      [*(id *)(a1 + 56) addIndex:a3];
    }
  }
}

- (GEODataURLSessionList)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEODataURLSessionList;
  v2 = [(GEODataURLSessionList *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
    urlSessions = v2->_urlSessions;
    v2->_urlSessions = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
    lastUsedDates = v2->_lastUsedDates;
    v2->_lastUsedDates = (NSMutableArray *)v5;
  }
  return v2;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_urlSessions count];
}

- (id)urlSessionForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__35;
  id v17 = __Block_byref_object_dispose__35;
  id v18 = 0;
  urlSessions = self->_urlSessions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__GEODataURLSessionList_urlSessionForIdentifier___block_invoke;
  v9[3] = &unk_1E53E12D8;
  id v6 = v4;
  id v11 = self;
  id v12 = &v13;
  id v10 = v6;
  [(NSMutableArray *)urlSessions enumerateObjectsUsingBlock:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __49__GEODataURLSessionList_urlSessionForIdentifier___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  id v6 = [v11 configuration];
  id v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:a1[4]];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    id v9 = *(void **)(a1[5] + 16);
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    [v9 replaceObjectAtIndex:a3 withObject:v10];
  }
}

- (void)finishTasksAndInvalidateSessionsMatching:(id)a3 group:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x18C1203C0]();
  int v8 = [MEMORY[0x1E4F28E60] indexSet];
  urlSessions = self->_urlSessions;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __72__GEODataURLSessionList_finishTasksAndInvalidateSessionsMatching_group___block_invoke;
  v29[3] = &unk_1E53E1328;
  id v23 = v6;
  id v31 = v23;
  id v10 = v8;
  id v30 = v10;
  [(NSMutableArray *)urlSessions enumerateObjectsUsingBlock:v29];
  id v11 = [(NSMutableArray *)self->_urlSessions objectsAtIndexes:v10];
  [(NSMutableArray *)self->_urlSessions removeObjectsAtIndexes:v10];
  [(NSMutableArray *)self->_lastUsedDates removeObjectsAtIndexes:v10];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
        if (v7)
        {
          dispatch_group_enter(v7);
          pendingInvalidationGroups = self->_pendingInvalidationGroups;
          if (!pendingInvalidationGroups)
          {
            BOOL v19 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v12, "count", v23));
            v20 = self->_pendingInvalidationGroups;
            self->_pendingInvalidationGroups = v19;

            pendingInvalidationGroups = self->_pendingInvalidationGroups;
          }
          -[NSMapTable setObject:forKey:](pendingInvalidationGroups, "setObject:forKey:", v7, v17, v23);
        }
        objc_msgSend(v17, "finishTasksAndInvalidate", v23);
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v14);
  }

  if ([v10 count])
  {
    uint64_t v21 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = [v10 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v22;
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_INFO, "Pruned %zu underlying sessions", buf, 0xCu);
    }
  }
}

uint64_t __72__GEODataURLSessionList_finishTasksAndInvalidateSessionsMatching_group___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 addIndex:a3];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInvalidationGroups, 0);
  objc_storeStrong((id *)&self->_lastUsedDates, 0);

  objc_storeStrong((id *)&self->_urlSessions, 0);
}

@end