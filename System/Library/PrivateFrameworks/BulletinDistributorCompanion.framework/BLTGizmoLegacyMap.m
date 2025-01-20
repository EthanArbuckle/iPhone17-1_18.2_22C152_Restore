@interface BLTGizmoLegacyMap
- (BLTGizmoLegacyMap)init;
- (id)categoryIDForBulletinKey:(id)a3;
- (id)gizmoPublisherBulletinIDForPhoneKey:(id)a3;
- (id)gizmoSectionInfoForPhoneKey:(id)a3;
- (id)phonePublisherBulletinIDForGizmoKey:(id)a3;
- (id)phoneSectionIDForGizmoKey:(id)a3;
- (id)sectionSubtypeForBulletinKey:(id)a3;
- (void)_addMapKey:(id)a3 value:(id)a4 bulletinKey:(id)a5 version:(unint64_t)a6 versionDictionary:(id)a7;
- (void)mapNotification:(id)a3 sectionID:(id)a4;
- (void)unmapNotification:(id)a3 sectionID:(id)a4;
@end

@implementation BLTGizmoLegacyMap

- (BLTGizmoLegacyMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLTGizmoLegacyMap;
  v2 = [(BLTGizmoLegacyMap *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("BLTGizmoLegacyMap", MEMORY[0x263EF83A8]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)_addMapKey:(id)a3 value:(id)a4 bulletinKey:(id)a5 version:(unint64_t)a6 versionDictionary:(id)a7
{
  id v22 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = [v14 objectForKeyedSubscript:v22];
  v16 = v15;
  if ((!v15 || (int)[v15 intValue] > a6)
    && ([MEMORY[0x263F57700] activePairedDeviceSupportIsGreaterEqualVersion:a6] & 1) == 0)
  {
    phoneBulletinKeyMap = self->_phoneBulletinKeyMap;
    if (!phoneBulletinKeyMap)
    {
      v18 = [MEMORY[0x263EFF9A0] dictionary];
      v19 = self->_phoneBulletinKeyMap;
      self->_phoneBulletinKeyMap = v18;

      phoneBulletinKeyMap = self->_phoneBulletinKeyMap;
    }
    v20 = [(NSMutableDictionary *)phoneBulletinKeyMap objectForKeyedSubscript:v13];
    if (!v20)
    {
      v20 = [MEMORY[0x263EFF9A0] dictionary];
      [(NSMutableDictionary *)self->_phoneBulletinKeyMap setObject:v20 forKeyedSubscript:v13];
    }
    [v20 setObject:v12 forKeyedSubscript:v22];
    v21 = [NSNumber numberWithUnsignedInteger:a6];
    [v14 setObject:v21 forKeyedSubscript:v22];
  }
}

- (void)mapNotification:(id)a3 sectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke;
  block[3] = &unk_264683E78;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(queue, block);
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) request];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [v2 identifier];
  v5 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v3 publisherMatchID:v4];

  id v6 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKeyedSubscript:v5];

  if (!v6)
  {
    v8 = [v2 content];
    id v9 = [v8 userInfo];
    id v7 = [v9 objectForKeyedSubscript:@"BLTWatchLegacyMap"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v7) {
        goto LABEL_25;
      }
      id v10 = blt_general_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_cold_1((uint64_t)v7, v10);
      }
LABEL_24:

      goto LABEL_25;
    }
    id v10 = v7;
    v11 = [MEMORY[0x263EFF9A0] dictionary];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5;
    v33[3] = &unk_264684C78;
    v33[4] = *(void *)(a1 + 48);
    id v12 = v5;
    id v34 = v12;
    id v32 = v11;
    id v35 = v32;
    [v10 enumerateKeysAndObjectsUsingBlock:v33];
    id v13 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKeyedSubscript:v12];
    uint64_t v14 = objc_msgSend(v13, "objectForKeyedSubscript:");

    v31 = v12;
    v15 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKeyedSubscript:v12];
    v16 = [v15 objectForKeyedSubscript:@"sectionInfo"];
    uint64_t v17 = objc_msgSend(v16, "objectForKeyedSubscript:");

    if (!(v14 | v17))
    {
LABEL_20:

      goto LABEL_24;
    }
    if (!*(void *)(*(void *)(a1 + 48) + 8))
    {
      uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v19 = *(void *)(a1 + 48);
      v20 = *(void **)(v19 + 8);
      *(void *)(v19 + 8) = v18;
    }
    v21 = (void *)v17;
    if (!v17)
    {
      v21 = [v31 sectionID];
    }
    id v22 = v10;
    if (v14)
    {
      v23 = +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v21);
      if (v17)
      {
LABEL_13:
        v24 = [*(id *)(*(void *)(a1 + 48) + 8) objectForKeyedSubscript:v23];

        if (!v24)
        {
          v25 = [MEMORY[0x263EFF9A0] dictionary];
          [*(id *)(*(void *)(a1 + 48) + 8) setObject:v25 forKeyedSubscript:v23];
        }
        if (v14)
        {
          v26 = [v31 publisherMatchID];
          v27 = [*(id *)(*(void *)(a1 + 48) + 8) objectForKeyedSubscript:v23];
          [v27 setObject:v26 forKeyedSubscript:@"publisherBulletinID"];
        }
        if (v17)
        {
          v28 = [v31 sectionID];
          v29 = [*(id *)(*(void *)(a1 + 48) + 8) objectForKeyedSubscript:v23];
          [v29 setObject:v28 forKeyedSubscript:@"sectionID"];
        }
        id v10 = v22;
        goto LABEL_20;
      }
    }
    else
    {
      v30 = [v31 publisherMatchID];
      v23 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v21 publisherMatchID:v30];

      if (v17) {
        goto LABEL_13;
      }
    }

    goto LABEL_13;
  }
  id v7 = blt_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v5;
    _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_INFO, "Bulletin already mapped: %@", buf, 0xCu);
  }
LABEL_25:
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 unsignedIntegerValue];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([MEMORY[0x263F57700] versionForString:v5],
          (v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v10 = blt_general_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5_cold_2();
      }
      goto LABEL_14;
    }
    id v9 = v8;
    uint64_t v7 = [v8 unsignedIntegerValue];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2;
      v12[3] = &unk_264684C50;
      v11 = *(void **)(a1 + 40);
      v12[4] = *(void *)(a1 + 32);
      id v13 = v11;
      uint64_t v15 = v7;
      id v14 = *(id *)(a1 + 48);
      [v6 enumerateKeysAndObjectsUsingBlock:v12];

      goto LABEL_15;
    }
    id v10 = blt_general_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5_cold_1((uint64_t)v5, (uint64_t)v6, v10);
    }
LABEL_14:

    goto LABEL_15;
  }
  [*(id *)(a1 + 32) _addMapKey:@"publisherBulletinID" value:v6 bulletinKey:*(void *)(a1 + 40) version:v7 versionDictionary:*(void *)(a1 + 48)];
LABEL_15:
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
    id v7 = [MEMORY[0x263EFF9D0] null];
    if (v7 == v6
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {

      goto LABEL_7;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
LABEL_7:
      v8 = v5;
      if (BLTGizmoLegacyMapKeySet_onceToken != -1) {
        dispatch_once(&BLTGizmoLegacyMapKeySet_onceToken, &__block_literal_global_14);
      }
      if (![(id)BLTGizmoLegacyMapKeySet___BLTGizmoLegacyMapKeySet containsObject:v8])
      {
        id v9 = blt_general_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_2();
        }
        goto LABEL_22;
      }
      id v9 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        if ([v10 count]) {
          [v10 objectAtIndexedSubscript:0];
        }
        else {
        id v9 = [MEMORY[0x263EFF9D0] null];
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = [MEMORY[0x263EFF9D0] null];
        if (v9 == v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
        }
        else
        {
          objc_opt_class();
          char v13 = objc_opt_isKindOfClass();

          if ((v13 & 1) == 0)
          {
            id v14 = blt_general_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_1();
            }

            goto LABEL_22;
          }
        }
      }
      [*(id *)(a1 + 32) _addMapKey:v8 value:v9 bulletinKey:*(void *)(a1 + 40) version:*(void *)(a1 + 56) versionDictionary:*(void *)(a1 + 48)];
LABEL_22:

      goto LABEL_26;
    }
  }
  v8 = blt_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_3();
  }
LABEL_26:
}

- (void)unmapNotification:(id)a3 sectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BLTGizmoLegacyMap_unmapNotification_sectionID___block_invoke;
  block[3] = &unk_264683E78;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_barrier_async(queue, block);
}

void __49__BLTGizmoLegacyMap_unmapNotification_sectionID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) request];
  v4 = [v3 identifier];
  id v12 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v2 publisherMatchID:v4];

  id v5 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKeyedSubscript:v12];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"publisherBulletinID"];
  id v7 = [v5 objectForKeyedSubscript:@"sectionInfo"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"sectionID"];

  if (v6 | v8)
  {
    id v9 = (void *)v8;
    if (v8)
    {
      if (v6) {
        goto LABEL_4;
      }
    }
    else
    {
      id v9 = [v12 sectionID];
      if (v6)
      {
LABEL_4:
        id v10 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v9 publisherMatchID:v6];
        if (v8)
        {
LABEL_6:
          [*(id *)(*(void *)(a1 + 48) + 8) removeObjectForKey:v10];

          goto LABEL_7;
        }
LABEL_5:

        goto LABEL_6;
      }
    }
    v11 = [v12 publisherMatchID];
    id v10 = +[BLTBBBulletinKey bulletinKeyWithSectionID:v9 publisherMatchID:v11];

    if (v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_7:
  [*(id *)(*(void *)(a1 + 48) + 16) removeObjectForKey:v12];
}

- (id)categoryIDForBulletinKey:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__BLTGizmoLegacyMap_categoryIDForBulletinKey___block_invoke;
    block[3] = &unk_264683B88;
    id v12 = &v13;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(queue, block);

    id v7 = (void *)v14[5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __46__BLTGizmoLegacyMap_categoryIDForBulletinKey___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 objectForKeyedSubscript:@"categoryID"];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)sectionSubtypeForBulletinKey:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__BLTGizmoLegacyMap_sectionSubtypeForBulletinKey___block_invoke;
    block[3] = &unk_264683B88;
    uint64_t v15 = &v16;
    void block[4] = self;
    id v14 = v4;
    dispatch_sync(queue, block);
    if (v17[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)v17[5], "integerValue"));
          id v8 = (void *)v17[5];
          v17[5] = v7;
        }
        else
        {
          id v10 = blt_general_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[BLTGizmoLegacyMap sectionSubtypeForBulletinKey:]();
          }

          id v8 = (void *)v17[5];
          v17[5] = 0;
        }
      }
    }

    id v9 = (void *)v17[5];
  }
  else
  {
    id v9 = 0;
  }
  id v11 = v9;
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __50__BLTGizmoLegacyMap_sectionSubtypeForBulletinKey___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 objectForKeyedSubscript:@"sectionSubtype"];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)phonePublisherBulletinIDForGizmoKey:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__BLTGizmoLegacyMap_phonePublisherBulletinIDForGizmoKey___block_invoke;
    block[3] = &unk_264683B88;
    id v12 = &v13;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(queue, block);

    uint64_t v7 = (void *)v14[5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __57__BLTGizmoLegacyMap_phonePublisherBulletinIDForGizmoKey___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = [v4 objectForKeyedSubscript:@"publisherBulletinID"];
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) publisherMatchID];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
  if (!v2) {
}
  }

- (id)gizmoPublisherBulletinIDForPhoneKey:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__BLTGizmoLegacyMap_gizmoPublisherBulletinIDForPhoneKey___block_invoke;
    block[3] = &unk_264683B88;
    id v12 = &v13;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(queue, block);

    uint64_t v7 = (void *)v14[5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __57__BLTGizmoLegacyMap_gizmoPublisherBulletinIDForPhoneKey___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = [v4 objectForKeyedSubscript:@"publisherBulletinID"];
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) publisherMatchID];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
  if (!v2) {
}
  }

- (id)phoneSectionIDForGizmoKey:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__BLTGizmoLegacyMap_phoneSectionIDForGizmoKey___block_invoke;
    block[3] = &unk_264683B88;
    id v12 = &v13;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(queue, block);

    uint64_t v7 = (void *)v14[5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __47__BLTGizmoLegacyMap_phoneSectionIDForGizmoKey___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = [v4 objectForKeyedSubscript:@"sectionID"];
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) sectionID];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
  if (!v2) {
}
  }

- (id)gizmoSectionInfoForPhoneKey:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__BLTGizmoLegacyMap_gizmoSectionInfoForPhoneKey___block_invoke;
    block[3] = &unk_264683B88;
    id v12 = &v13;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(queue, block);

    uint64_t v7 = (void *)v14[5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __49__BLTGizmoLegacyMap_gizmoSectionInfoForPhoneKey___block_invoke(void *a1)
{
  uint64_t v2 = [BLTGizmoLegacyMapSectionInfo alloc];
  id v7 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = [v7 objectForKeyedSubscript:@"sectionInfo"];
  uint64_t v4 = [(BLTGizmoLegacyMapSectionInfo *)v2 initWithNotificationMap:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_phoneBulletinKeyMap, 0);
  objc_storeStrong((id *)&self->_gizmoBulletinKeyMap, 0);
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_1_1();
  id v4 = v3;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Expecting dictionary type for legacy map, got legacy map type %@", v5, 0xCu);
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  id v8 = (id)objc_opt_class();
  id v4 = v8;
  _os_log_error_impl(&dword_222F4C000, a3, OS_LOG_TYPE_ERROR, "Unexpected value type in legacy map for version key %@, value type %@", (uint8_t *)&v5, 0x16u);
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "Expecting string or number type for version key in legacy map, got key %@", v2, v3, v4, v5, v6);
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_222F4C000, v0, v1, "Expecting string, number, or dictionary type values for value in legacy map dictionary, got key %@ value %@");
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "Unknown legacy map key %@", v2, v3, v4, v5, v6);
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_222F4C000, v0, v1, "Expecting string type values for key and string, array, number, or dictionary type for value in legacy map dictionary, got key %@ value %@");
}

- (void)sectionSubtypeForBulletinKey:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "Expecting number or string type for sectionSubtype in legacy map for %@", v2, v3, v4, v5, v6);
}

@end