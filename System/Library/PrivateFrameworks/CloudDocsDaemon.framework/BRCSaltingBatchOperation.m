@interface BRCSaltingBatchOperation
- (BRCSaltingBatchOperation)initWithParentItem:(id)a3 sessionContext:(id)a4;
- (id)_createStructureRecordForParentItem;
- (id)_createStructureRecordForServerItem:(id)a3 salt:(id)a4;
- (id)_createStructureRecordWithRecordID:(id)a3 serverItem:(id)a4;
- (id)_getWorkloop;
- (id)getOrGenerateChildBasehashSaltingKey;
- (id)metadataCompletionBlock;
- (void)_buildRecordsWithCompletion:(id)a3;
- (void)_createCKOperationForRecords:(id)a3 completion:(id)a4;
- (void)_createStructureRecordForParentItem;
- (void)_saltChildRecordFields:(id)a3 serverItem:(id)a4 basehashSalt:(id)a5;
- (void)_sendRecordBatch:(id)a3 completion:(id)a4;
- (void)_updateRootItemInClientDB;
- (void)_updateRootItemInServerDB;
- (void)_updateSaltingInfoInClientDBWithRecords:(id)a3;
- (void)_updateSaltingInfoInServerDBWithRecords:(id)a3;
- (void)_updateServerTruthForItemID:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setMetadataCompletionBlock:(id)a3;
@end

@implementation BRCSaltingBatchOperation

- (id)getOrGenerateChildBasehashSaltingKey
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [(BRCClientZone *)self->_parentClientZone childBaseSaltForItemID:self->_parentItemID];
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "brc_generateBogusKey");
    int v5 = [v3 isEqualToData:v4];

    if (v5)
    {
      v11 = @"br_bougusSaltingKey";
      v12[0] = MEMORY[0x1E4F1CC38];
      v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      parentPluginFields = self->_parentPluginFields;
      self->_parentPluginFields = v6;
    }
    id v8 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C9B8], "brc_generateSaltingKey");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (BRCSaltingBatchOperation)initWithParentItem:(id)a3 sessionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if ([v6 isDirectory])
    {
      id v8 = [v6 itemID];
      v9 = [v8 debugItemIDStringWithVerbose:1];
      v10 = [@"metadata-salting/" stringByAppendingString:v9];

      v11 = [v6 serverZone];
      v12 = [v11 metadataSyncContext];
      v28.receiver = self;
      v28.super_class = (Class)BRCSaltingBatchOperation;
      v13 = [(_BRCOperation *)&v28 initWithName:v10 syncContext:v12 sessionContext:v7];

      if (v13)
      {
        uint64_t v14 = [v6 itemID];
        parentItemID = v13->_parentItemID;
        v13->_parentItemID = (BRCItemID *)v14;

        if ([(BRCItemID *)v13->_parentItemID isNonDesktopRoot])
        {
          uint64_t v16 = [v6 folderAppLibraryRootRecord];
          appLibraryRootRecord = v13->_appLibraryRootRecord;
          v13->_appLibraryRootRecord = (CKRecord *)v16;
        }
        uint64_t v18 = [v6 structureRecordID];
        parentRecordID = v13->_parentRecordID;
        v13->_parentRecordID = (CKRecordID *)v18;

        uint64_t v20 = [v6 clientZone];
        parentClientZone = v13->_parentClientZone;
        v13->_parentClientZone = (BRCClientZone *)v20;

        v22 = +[BRCUserDefaults defaultsForMangledID:0];
        v13->_batchSize = [v22 enhancedDrivePrivacyBasehashSaltingBatchSize];
      }
      self = v13;
      v23 = self;
      goto LABEL_14;
    }
  }
  else
  {
    v24 = brc_bread_crumbs();
    v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress didDeleteDocument:]();
    }
  }
  v10 = brc_bread_crumbs();
  v26 = brc_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[BRCSaltingBatchOperation initWithParentItem:sessionContext:]();
  }

  v23 = 0;
LABEL_14:

  return v23;
}

- (void)_createCKOperationForRecords:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F1A198];
  id v8 = a3;
  v9 = (void *)[[v7 alloc] initWithRecordsToSave:v8 recordIDsToDelete:0];

  [v9 setSavePolicy:0];
  [v9 setAtomic:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__BRCSaltingBatchOperation__createCKOperationForRecords_completion___block_invoke;
  v16[3] = &unk_1E699B4C8;
  v16[4] = self;
  [v9 setPerRecordCompletionBlock:v16];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __68__BRCSaltingBatchOperation__createCKOperationForRecords_completion___block_invoke_5;
  uint64_t v14 = &unk_1E69972C0;
  id v15 = v6;
  id v10 = v6;
  [v9 setModifyRecordsCompletionBlock:&v11];
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v9, v11, v12, v13, v14);
}

void __68__BRCSaltingBatchOperation__createCKOperationForRecords_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6 && (objc_msgSend(v6, "brc_isCloudKitAtomicFailure") & 1) == 0)
  {
    id v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      int v10 = 138412802;
      id v11 = v5;
      __int16 v12 = 2112;
      v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_error_impl(&dword_1D353B000, v9, (os_log_type_t)0x90u, "[ERROR] Salting operation for recordID %@ with error %@%@", (uint8_t *)&v10, 0x20u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 512) handleSaltingErrorIfNeeded:v7 record:v5];
}

uint64_t __68__BRCSaltingBatchOperation__createCKOperationForRecords_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_sendRecordBatch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    [(BRCSaltingBatchOperation *)self _createCKOperationForRecords:v6 completion:v7];
  }
  else
  {
    id v8 = [(_BRCOperation *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__BRCSaltingBatchOperation__sendRecordBatch_completion___block_invoke;
    block[3] = &unk_1E6995800;
    id v10 = v7;
    dispatch_async(v8, block);
  }
}

uint64_t __56__BRCSaltingBatchOperation__sendRecordBatch_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_createStructureRecordWithRecordID:(id)a3 serverItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isBRAlias])
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCSaltingBatchOperation _createStructureRecordWithRecordID:serverItem:]();
    }

    v9 = 0;
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"structure" recordID:v5];
    id v10 = [v6 st];
    id v11 = [v10 ckInfo];
    [v9 serializeSystemFields:v11];
  }
  return v9;
}

- (void)_saltChildRecordFields:(id)a3 serverItem:(id)a4 basehashSalt:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    objc_super v28 = brc_bread_crumbs();
    v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[BRCSaltingBatchOperation _saltChildRecordFields:serverItem:basehashSalt:]();
    }
  }
  if ([(BRCItemID *)self->_parentItemID isNonDesktopRoot])
  {
    id v11 = [(BRCSyncContext *)self->super._syncContext session];
    __int16 v12 = [(BRCItemID *)self->_parentItemID appLibraryRowID];
    v13 = [v11 appLibraryByRowID:v12];
    uint64_t v14 = [v13 isCloudDocsAppLibrary];
  }
  else
  {
    uint64_t v14 = 0;
  }
  BOOL v15 = [(BRCItemID *)self->_parentItemID isDocumentsFolder];
  uint64_t v16 = [v9 st];
  v17 = [v16 logicalName];

  [v8 serializeFilename:v17 forCreation:0 basehashSalt:v10 parentIDIsCloudDocsRoot:v14 parentIDIsDocumentsFolder:v15];
  id v30 = 0;
  uint64_t v18 = objc_msgSend(v17, "br_stringByDeletingPathBounceNo:andPathExtension:", 0, &v30);
  id v19 = v30;
  v31 = @"br_saltingUpdate";
  uint64_t v20 = objc_msgSend(v18, "brc_SHA256");
  v32[0] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  [v8 setPluginFields:v21];

  v22 = [v9 st];
  objc_msgSend(v8, "seralizeBirthtime:", objc_msgSend(v22, "birthtime"));

  v23 = [v9 st];
  v24 = [v23 logicalName];
  [v8 serializeSpecialIdentityForFilename:v24 parentIDIsCloudDocsRoot:v14 parentIDisDocumentsFolder:v15];

  v25 = [v9 parentItemIDOnServer];
  v26 = [v9 serverZone];
  v27 = [v25 validatingDirectoryReferenceInZone:v26];
  [v8 setObject:v27 forKeyedSubscript:@"parent"];
}

- (id)_createStructureRecordForServerItem:(id)a3 salt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    BOOL v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCSaltingBatchOperation _createStructureRecordForServerItem:salt:]();
    }
  }
  id v8 = [v6 itemID];
  id v9 = [v6 st];
  uint64_t v10 = [v9 type];
  id v11 = [(BRCClientZone *)self->_parentClientZone serverZone];
  __int16 v12 = objc_msgSend(v8, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v10, v11, objc_msgSend(v6, "aliasTargetIsShared"));

  v13 = [(BRCSaltingBatchOperation *)self _createStructureRecordWithRecordID:v12 serverItem:v6];
  [(BRCSaltingBatchOperation *)self _saltChildRecordFields:v13 serverItem:v6 basehashSalt:v7];

  return v13;
}

- (id)_createStructureRecordForParentItem
{
  if ([(BRCItemID *)self->_parentItemID isNonDesktopRoot])
  {
    appLibraryRootRecord = self->_appLibraryRootRecord;
    if (!appLibraryRootRecord)
    {
      v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCSaltingBatchOperation _createStructureRecordForParentItem]();
      }

      appLibraryRootRecord = self->_appLibraryRootRecord;
    }
    v4 = appLibraryRootRecord;
  }
  else
  {
    id v5 = [(BRCClientZone *)self->_parentClientZone serverItemByItemID:self->_parentItemID];
    if (!v5)
    {
      BOOL v15 = brc_bread_crumbs();
      uint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BRCSaltingBatchOperation _createStructureRecordForServerItem:salt:]();
      }
    }
    v4 = [(BRCSaltingBatchOperation *)self _createStructureRecordWithRecordID:self->_parentRecordID serverItem:v5];
  }
  if (!v4)
  {
    id v11 = brc_bread_crumbs();
    __int16 v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCSaltingBatchOperation _createStructureRecordForParentItem]();
    }
  }
  [(CKRecord *)v4 brc_fillWithChildBasehashSalt:self->_childBaseSalt];
  id v6 = [NSNumber numberWithUnsignedInt:self->_parentSaltingState];
  [(CKRecord *)v4 setObject:v6 forKeyedSubscript:@"saltingState"];

  if (self->_parentPluginFields)
  {
    id v7 = [(CKRecord *)v4 pluginFields];
    if (v7)
    {
      id v8 = [(CKRecord *)v4 pluginFields];
      id v9 = (void *)[v8 mutableCopy];
    }
    else
    {
      id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_parentPluginFields, "count"));
    }

    [v9 addEntriesFromDictionary:self->_parentPluginFields];
    [(CKRecord *)v4 setPluginFields:v9];
  }
  return v4;
}

- (void)_updateRootItemInServerDB
{
  if (![(BRCItemID *)self->_parentItemID isNonDesktopRoot])
  {
    id v8 = [(BRCClientZone *)self->_parentClientZone serverZone];
    v3 = [v8 db];
    childBaseSalt = self->_childBaseSalt;
    id v5 = [NSNumber numberWithUnsignedInt:self->_parentSaltingState];
    parentItemID = self->_parentItemID;
    id v7 = [(BRCClientZone *)self->_parentClientZone dbRowID];
    [v3 execute:@"UPDATE server_items SET child_basehash_salt = %@, salting_state = %@ WHERE item_id = %@ AND zone_rowid = %@ ", childBaseSalt, v5, parentItemID, v7];
  }
}

- (void)_updateRootItemInClientDB
{
  if ([(BRCItemID *)self->_parentItemID isNonDesktopRoot]
    && !self->_parentItemEncounteredValidationError)
  {
    id v6 = [(BRCClientZone *)self->_parentClientZone db];
    childBaseSalt = self->_childBaseSalt;
    v4 = [NSNumber numberWithUnsignedInt:self->_parentSaltingState];
    id v5 = [(BRCItemID *)self->_parentItemID appLibraryRowID];
    [v6 execute:@"UPDATE app_libraries SET child_basehash_salt = %@, salting_state = %@ WHERE rowid = %@ ", childBaseSalt, v4, v5];
  }
}

- (id)_getWorkloop
{
  v2 = [(BRCClientZone *)self->_parentClientZone session];
  v3 = [v2 clientTruthWorkloop];

  return v3;
}

- (void)_updateServerTruthForItemID:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToItemID:self->_parentItemID])
  {
    [(BRCSaltingBatchOperation *)self _updateRootItemInServerDB];
  }
  else
  {
    v4 = [(BRCClientZone *)self->_parentClientZone serverZone];
    id v5 = [v4 db];
    [v5 execute:@"UPDATE server_items SET basehash_salt_validation_key = %@  WHERE item_id = %@", self->_baseHashSaltValidationKey, v6];
  }
}

- (void)_buildRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCSaltingBatchOperation *)self _getWorkloop];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__BRCSaltingBatchOperation__buildRecordsWithCompletion___block_invoke;
  v7[3] = &unk_1E6994600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__BRCSaltingBatchOperation__buildRecordsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = +[BRCFlatLevelSaltingEnumerator newEnumeratorForItemID:*(void *)(*(void *)(a1 + 32) + 520) clientZone:*(void *)(*(void *)(a1 + 32) + 512)];
  uint64_t v3 = [*(id *)(a1 + 32) getOrGenerateChildBasehashSaltingKey];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 568);
  *(void *)(v4 + 568) = v3;

  uint64_t v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 568), "brc_truncatedSHA256");
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 560);
  *(void *)(v7 + 560) = v6;

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 512) saltingStateForItemID:*(void *)(*(void *)(a1 + 32) + 520)];
  if (v9 >= 3)
  {
    uint64_t v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v29 = [*(id *)(a1 + 32) operationID];
      id v30 = (void *)v29;
      v31 = *(__CFString **)(*(void *)(a1 + 32) + 528);
      v32 = @"fully salted";
      if (v9 == -1) {
        v32 = @"no server item";
      }
      *(_DWORD *)buf = 138413058;
      uint64_t v43 = v29;
      __int16 v44 = 2112;
      v45 = v31;
      __int16 v46 = 2112;
      v47 = v32;
      __int16 v48 = 2112;
      v49 = v10;
      _os_log_fault_impl(&dword_1D353B000, v11, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: operation %@ is trying to salt record %@ while it is in %@ state%@", buf, 0x2Au);
    }
    __int16 v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 528) debugDescription];
    BOOL v15 = [NSNumber numberWithUnsignedInt:v9];
    uint64_t v16 = objc_msgSend(v12, "brc_errorInvalidParameter:value:", v14, v15);
    (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0, 0, v16);
  }
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(*(void *)(a1 + 32) + 504)];
  uint64_t v18 = [v2 nextObject];
  if (v18)
  {
    int v41 = v9;
    uint64_t v19 = 0;
    while (1)
    {
      uint64_t v20 = *(void **)(a1 + 32);
      uint64_t v21 = v20[63];
      if (v21 <= ++v19) {
        break;
      }
      v22 = [v20 _createStructureRecordForServerItem:v18 salt:v20[71]];
      if (v22) {
        [v17 addObject:v22];
      }

      uint64_t v23 = [v2 nextObject];

      uint64_t v18 = (void *)v23;
      if (!v23)
      {
        int v24 = 3;
        goto LABEL_14;
      }
    }
    int v24 = 2;
LABEL_14:
    *(_DWORD *)(*(void *)(a1 + 32) + 536) = v24;
    uint64_t v25 = *(void *)(a1 + 32);
    if (*(_DWORD *)(v25 + 536) == v41)
    {
      if (v21 > v19) {
        goto LABEL_24;
      }
      objc_super v28 = [(id)v25 _createStructureRecordForServerItem:v18 salt:*(void *)(v25 + 568)];
      if (!v28)
      {
        v39 = brc_bread_crumbs();
        v40 = brc_default_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
          -[BRCSaltingBatchOperation _createStructureRecordForParentItem]();
        }
      }
      [v17 addObject:v28];
      goto LABEL_23;
    }
    LODWORD(v9) = v41;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 536) = 3;
    if (*(_DWORD *)(*(void *)(a1 + 32) + 536) == v9) {
      goto LABEL_24;
    }
  }
  v26 = brc_bread_crumbs();
  v27 = brc_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    if (v9 > 3) {
      v33 = @"no server item";
    }
    else {
      v33 = off_1E699B538[(int)v9];
    }
    uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 528);
    uint64_t v35 = *(int *)(*(void *)(a1 + 32) + 536);
    if (v35 > 3) {
      v36 = @"no server item";
    }
    else {
      v36 = off_1E699B538[v35];
    }
    *(_DWORD *)buf = 138413058;
    uint64_t v43 = v34;
    __int16 v44 = 2112;
    v45 = v33;
    __int16 v46 = 2112;
    v47 = v36;
    __int16 v48 = 2112;
    v49 = v26;
    _os_log_debug_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Moving salting parent record ID %@ from %@ to %@%@", buf, 0x2Au);
  }

  objc_super v28 = [*(id *)(a1 + 32) _createStructureRecordForParentItem];
  if (!v28)
  {
    v37 = brc_bread_crumbs();
    v38 = brc_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      -[BRCSaltingBatchOperation _createStructureRecordForParentItem]();
    }
  }
  [v17 insertObject:v28 atIndex:0];
LABEL_23:

LABEL_24:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  metadataCompletionBlock = (void (**)(id, uint64_t, BOOL, id))self->_metadataCompletionBlock;
  if (metadataCompletionBlock)
  {
    metadataCompletionBlock[2](metadataCompletionBlock, [v6 BOOLValue], self->_parentItemEncounteredValidationError, v7);
    id v9 = self->_metadataCompletionBlock;
    self->_metadataCompletionBlock = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)BRCSaltingBatchOperation;
  [(_BRCOperation *)&v10 finishWithResult:v6 error:v7];
}

- (void)_updateSaltingInfoInServerDBWithRecords:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCClientZone *)self->_parentClientZone serverZone];
  id v6 = [v5 db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__BRCSaltingBatchOperation__updateSaltingInfoInServerDBWithRecords___block_invoke;
  v9[3] = &unk_1E6997478;
  id v10 = v4;
  id v11 = v5;
  __int16 v12 = self;
  id v7 = v5;
  id v8 = v4;
  [v6 performWithFlags:25 action:v9];
}

uint64_t __68__BRCSaltingBatchOperation__updateSaltingInfoInServerDBWithRecords___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        id v8 = objc_msgSend(v7, "recordID", (void)v15);
        id v9 = [a1[5] session];
        id v10 = objc_msgSend(v8, "brc_itemIDWithSession:", v9);

        id v11 = objc_msgSend(v7, "brc_oplockMergeEtag");
        if (v11)
        {
        }
        else
        {
          __int16 v12 = objc_msgSend(v7, "brc_updateDroppedReason");

          if (!v12)
          {
            [a1[6] _updateServerTruthForItemID:v10];
            goto LABEL_12;
          }
        }
        if ([v10 isEqualToItemID:*((void *)a1[6] + 65)]) {
          *((unsigned char *)a1[6] + 576) = 1;
        }
        *((_DWORD *)a1[6] + 134) = 2;
LABEL_12:

        ++v6;
      }
      while (v4 != v6);
      uint64_t v13 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v4 = v13;
    }
    while (v13);
  }

  return 1;
}

- (void)_updateSaltingInfoInClientDBWithRecords:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCClientZone *)self->_parentClientZone db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__BRCSaltingBatchOperation__updateSaltingInfoInClientDBWithRecords___block_invoke;
  v7[3] = &unk_1E6993A88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithFlags:25 action:v7];
}

uint64_t __68__BRCSaltingBatchOperation__updateSaltingInfoInClientDBWithRecords___block_invoke(uint64_t a1)
{
  return 1;
}

- (void)main
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __32__BRCSaltingBatchOperation_main__block_invoke;
  v2[3] = &unk_1E699B518;
  v2[4] = self;
  [(BRCSaltingBatchOperation *)self _buildRecordsWithCompletion:v2];
}

uint64_t __32__BRCSaltingBatchOperation_main__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__BRCSaltingBatchOperation_main__block_invoke_2;
  v5[3] = &unk_1E699B4F0;
  v5[4] = v3;
  char v6 = a3;
  return [v3 _sendRecordBatch:a2 completion:v5];
}

void __32__BRCSaltingBatchOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __32__BRCSaltingBatchOperation_main__block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:v6];
  }
  else
  {
    [*(id *)(a1 + 32) _updateSaltingInfoInServerDBWithRecords:v5];
    [*(id *)(a1 + 32) _updateSaltingInfoInClientDBWithRecords:v5];
    id v9 = *(void **)(a1 + 32);
    id v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    [v9 completedWithResult:v10 error:0];
  }
}

- (id)metadataCompletionBlock
{
  return self->_metadataCompletionBlock;
}

- (void)setMetadataCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_metadataCompletionBlock, 0);
  objc_storeStrong((id *)&self->_childBaseSalt, 0);
  objc_storeStrong((id *)&self->_baseHashSaltValidationKey, 0);
  objc_storeStrong((id *)&self->_appLibraryRootRecord, 0);
  objc_storeStrong((id *)&self->_parentPluginFields, 0);
  objc_storeStrong((id *)&self->_parentRecordID, 0);
  objc_storeStrong((id *)&self->_parentItemID, 0);
  objc_storeStrong((id *)&self->_parentClientZone, 0);
}

- (void)initWithParentItem:sessionContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Salting batch operation is not allowed on %@%@", v1, 0x16u);
}

- (void)_createStructureRecordWithRecordID:serverItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We can't salt alias items %@%@", v1, 0x16u);
}

- (void)_saltChildRecordFields:serverItem:basehashSalt:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: basehashSalt%@", v2, v3, v4, v5, v6);
}

- (void)_createStructureRecordForServerItem:salt:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: si != nil%@", v2, v3, v4, v5, v6);
}

- (void)_createStructureRecordForParentItem
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _appLibraryRootRecord != nil%@", v2, v3, v4, v5, v6);
}

void __32__BRCSaltingBatchOperation_main__block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] failed sending salted records - %@%@", v1, 0x16u);
}

@end