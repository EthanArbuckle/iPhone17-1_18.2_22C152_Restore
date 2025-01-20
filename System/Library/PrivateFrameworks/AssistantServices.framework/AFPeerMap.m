@interface AFPeerMap
- (AFPeerMap)init;
- (id)_getUUIDAndUpdateIDMapsForPeerInfo:(id)a3;
- (id)objectForPeerInfo:(id)a3;
- (void)_cleanUpUUIDMapsForPeerInfo:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)removeObjectForPeerInfo:(id)a3;
- (void)setObject:(id)a3 forPeerInfo:(id)a4;
@end

@implementation AFPeerMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidsByHomeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_uuidsByIdsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_uuidsByRapportIdentifier, 0);
  objc_storeStrong((id *)&self->_uuidsByAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_objectsByUUID, 0);
}

- (void)_cleanUpUUIDMapsForPeerInfo:(id)a3
{
  id v8 = a3;
  v4 = [v8 assistantIdentifier];
  if (v4) {
    [(NSMutableDictionary *)self->_uuidsByAssistantIdentifier removeObjectForKey:v4];
  }
  v5 = [v8 rapportEffectiveIdentifier];
  if (v5) {
    [(NSMutableDictionary *)self->_uuidsByRapportIdentifier removeObjectForKey:v5];
  }
  v6 = [v8 idsDeviceUniqueIdentifier];
  if (v6) {
    [(NSMutableDictionary *)self->_uuidsByIdsDeviceIdentifier removeObjectForKey:v6];
  }
  v7 = [v8 homeKitAccessoryIdentifier];
  if (v7) {
    [(NSMutableDictionary *)self->_uuidsByHomeKitIdentifier removeObjectForKey:v7];
  }
}

- (id)_getUUIDAndUpdateIDMapsForPeerInfo:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__48104;
  v56 = __Block_byref_object_dispose__48105;
  id v57 = 0;
  v5 = [v4 assistantIdentifier];
  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_uuidsByAssistantIdentifier objectForKey:v5];
    v7 = (void *)v53[5];
    v53[5] = v6;
  }
  else
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[AFPeerMap _getUUIDAndUpdateIDMapsForPeerInfo:]";
      __int16 v60 = 2112;
      id v61 = v4;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s Missing assistantId in %@", buf, 0x16u);
    }
  }
  v9 = (void *)v53[5];
  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke;
    v51[3] = &unk_1E592C570;
    v51[4] = &v52;
    v11 = (void *)MEMORY[0x19F3A50D0](v51);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_2;
    v49[3] = &unk_1E592C678;
    id v13 = v12;
    id v50 = v13;
    v14 = (void (**)(void))MEMORY[0x19F3A50D0](v49);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_3;
    v46[3] = &unk_1E592C598;
    id v15 = v11;
    id v48 = v15;
    v46[4] = self;
    id v47 = v5;
    v16 = (void *)MEMORY[0x19F3A50D0](v46);
    [v13 addObject:v16];

    v17 = [v4 rapportEffectiveIdentifier];
    if (v17)
    {
      uint64_t v18 = [(NSMutableDictionary *)self->_uuidsByRapportIdentifier objectForKey:v17];
      v19 = (void *)v53[5];
      v53[5] = v18;
    }
    else
    {
      v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "-[AFPeerMap _getUUIDAndUpdateIDMapsForPeerInfo:]";
        __int16 v60 = 2112;
        id v61 = v4;
        _os_log_error_impl(&dword_19CF1D000, v20, OS_LOG_TYPE_ERROR, "%s Missing rapportId in %@", buf, 0x16u);
      }
    }
    if (v53[5])
    {
      v14[2](v14);
      id v10 = (id)v53[5];
    }
    else
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_3;
      v43[3] = &unk_1E592C598;
      id v21 = v15;
      id v45 = v21;
      v43[4] = self;
      id v44 = v17;
      v22 = (void *)MEMORY[0x19F3A50D0](v43);
      [v13 addObject:v22];

      v23 = [v4 idsDeviceUniqueIdentifier];
      if (v23)
      {
        uint64_t v24 = [(NSMutableDictionary *)self->_uuidsByIdsDeviceIdentifier objectForKey:v23];
        v25 = (void *)v53[5];
        v53[5] = v24;
      }
      if (v53[5])
      {
        v14[2](v14);
        id v10 = (id)v53[5];
      }
      else
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_2_4;
        v40[3] = &unk_1E592C598;
        id v36 = v21;
        id v42 = v36;
        v40[4] = self;
        id v35 = v23;
        id v41 = v35;
        v26 = (void *)MEMORY[0x19F3A50D0](v40);
        [v13 addObject:v26];

        v27 = [v4 homeKitAccessoryIdentifier];
        if (v27)
        {
          uint64_t v28 = [(NSMutableDictionary *)self->_uuidsByHomeKitIdentifier objectForKey:v27];
          v29 = (void *)v53[5];
          v53[5] = v28;
        }
        if (!v53[5])
        {
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_3_5;
          v37[3] = &unk_1E592C598;
          id v39 = v36;
          v37[4] = self;
          id v38 = v35;
          v30 = (void *)MEMORY[0x19F3A50D0](v37);
          [v13 addObject:v30];

          v31 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v32 = [v31 UUIDString];
          v33 = (void *)v53[5];
          v53[5] = v32;
        }
        v14[2](v14);
        id v10 = (id)v53[5];
      }
    }
  }
  _Block_object_dispose(&v52, 8);

  return v10;
}

void __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 length]) {
    [v6 setObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) forKey:v5];
  }
}

void __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], *(void *)(a1[4] + 16), a1[5]);
}

{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], *(void *)(a1[4] + 24), a1[5]);
}

uint64_t __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_2_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], *(void *)(a1[4] + 32), a1[5]);
}

uint64_t __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_3_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], *(void *)(a1[4] + 40), a1[5]);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_objectsByUUID allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)removeObjectForPeerInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(AFPeerMap *)self _getUUIDAndUpdateIDMapsForPeerInfo:v4];
  [(NSMutableDictionary *)self->_objectsByUUID removeObjectForKey:v5];
  [(AFPeerMap *)self _cleanUpUUIDMapsForPeerInfo:v4];
}

- (void)setObject:(id)a3 forPeerInfo:(id)a4
{
  id v6 = a3;
  id v7 = [(AFPeerMap *)self _getUUIDAndUpdateIDMapsForPeerInfo:a4];
  [(NSMutableDictionary *)self->_objectsByUUID setObject:v6 forKey:v7];
}

- (id)objectForPeerInfo:(id)a3
{
  id v4 = [(AFPeerMap *)self _getUUIDAndUpdateIDMapsForPeerInfo:a3];
  id v5 = [(NSMutableDictionary *)self->_objectsByUUID objectForKey:v4];

  return v5;
}

- (AFPeerMap)init
{
  v14.receiver = self;
  v14.super_class = (Class)AFPeerMap;
  uint64_t v2 = [(AFPeerMap *)&v14 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objectsByUUID = v2->_objectsByUUID;
    v2->_objectsByUUID = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uuidsByAssistantIdentifier = v2->_uuidsByAssistantIdentifier;
    v2->_uuidsByAssistantIdentifier = v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uuidsByRapportIdentifier = v2->_uuidsByRapportIdentifier;
    v2->_uuidsByRapportIdentifier = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uuidsByIdsDeviceIdentifier = v2->_uuidsByIdsDeviceIdentifier;
    v2->_uuidsByIdsDeviceIdentifier = v9;

    long long v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uuidsByHomeKitIdentifier = v2->_uuidsByHomeKitIdentifier;
    v2->_uuidsByHomeKitIdentifier = v11;
  }
  return v2;
}

@end