@interface BRCSyncUpOperationBuilder
- (BOOL)_checkIfShouldDedicateOpToPCSChainingItem:(id)a3;
- (BOOL)_checkIfShouldDedicateOpToSaltingBasehashItem:(id)a3;
- (BOOL)_recoverItemIDChangedWhileUploadingIfNecessary:(id)a3;
- (BOOL)_validateSharedDocumentFieldsForRecord:(id)a3 item:(id)a4;
- (BOOL)checkIfSyncAllowedInSharedZoneForItem:(id)a3;
- (BRCAccountSession)session;
- (BRCDirectoryItem)itemNeedingBasehashSalting;
- (BRCLocalItem)itemNeedingPCSChaining;
- (BRCSyncUpOperation)op;
- (BRCSyncUpOperationBuilder)init;
- (BRCUserDefaults)defaults;
- (NSData)rootChildBasehashSalt;
- (float)addDeletionOfAlias:(id)a3;
- (float)addDeletionOfDirectory:(id)a3;
- (float)addDeletionOfDocument:(id)a3;
- (float)addDeletionOfFinderBookmark:(id)a3;
- (float)addDeletionOfItem:(id)a3;
- (float)addDeletionOfRecordID:(id)a3 ckInfo:(id)a4;
- (float)addDeletionOfSharedTopLevelItem:(id)a3;
- (float)addEditOfDirectory:(id)a3;
- (float)addEditOfDocument:(id)a3;
- (float)addEditOfFinderBookmark:(id)a3;
- (float)addEditOfSharedTopLevelItem:(id)a3;
- (float)addEditOfSymlink:(id)a3;
- (float)addItem:(id)a3;
- (float)fakeSyncForItem:(id)a3 serverItem:(id)a4 inZone:(id)a5;
- (id)_generateChildBasehashSaltGetterBlock;
- (id)_generateSaltGetterBlock;
- (id)_getChildBasehashSaltForItem:(id)a3;
- (id)_getChildBasehashSaltForItemID:(id)a3;
- (id)_getSaltForItem:(id)a3;
- (unsigned)shouldPCSChainStatusForItem:(id)a3;
- (void)handleDeletionOfSharedItem:(id)a3;
- (void)handleEditOfSharedItem:(id)a3;
- (void)prepareAppLibraryRootSyncUpForItem:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setOp:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation BRCSyncUpOperationBuilder

- (BRCSyncUpOperationBuilder)init
{
  v10.receiver = self;
  v10.super_class = (Class)BRCSyncUpOperationBuilder;
  v2 = [(BRCSyncUpOperationBuilder *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    fullyChainedParentIDWhitelist = v2->_fullyChainedParentIDWhitelist;
    v2->_fullyChainedParentIDWhitelist = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    halfChainedParentIDWhitelist = v2->_halfChainedParentIDWhitelist;
    v2->_halfChainedParentIDWhitelist = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    parentItemIDToChildBasehashSalt = v2->_parentItemIDToChildBasehashSalt;
    v2->_parentItemIDToChildBasehashSalt = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (unsigned)shouldPCSChainStatusForItem:(id)a3
{
  id v4 = a3;
  if (![v4 isSharedToMeChildItem])
  {
    char v32 = 0;
    int v6 = [v4 isNewToServer:&v32];
    if ([v4 isSharedToMeTopLevelItem])
    {
      uint64_t v7 = [v4 asSharedToMeTopLevelItem];
      v8 = [v7 sharedAliasItemID];
    }
    else
    {
      v8 = [v4 itemID];
    }
    v9 = [v4 st];
    objc_super v10 = [v9 parentID];

    v11 = [v4 appLibrary];
    v12 = [v11 mangledID];
    v13 = +[BRCUserDefaults defaultsForMangledID:v12];

    v14 = [(BRCSyncUpOperationBuilder *)self op];
    v15 = [v14 serverZone];
    v16 = [v15 clientZone];

    if (![v16 isPrivateZone]
      || ([v8 isDocumentsFolder] & 1) != 0
      || ([v4 parentClientZone],
          v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v17 isEqualToClientZone:v16],
          v17,
          !v18))
    {
      unsigned __int8 v5 = 1;
LABEL_16:

      goto LABEL_17;
    }
    v19 = [v16 asPrivateClientZone];
    if ([v13 optimisticallyPCSChainWithSession:self->_session])
    {
      int v20 = [v13 optimisticallyPCSChainDuringResetWithSession:self->_session];
      if (v32) {
        int v21 = v20;
      }
      else {
        int v21 = 1;
      }
    }
    else
    {
      int v21 = 0;
    }
    int v31 = [v13 should2PhasePCSChain];
    unsigned int v23 = [v19 pcsChainStateForItem:v8];
    if ((v23 & 0xFFFFFFFE) == 2)
    {
      if ([v4 isDirectory]) {
        [(NSMutableSet *)self->_fullyChainedParentIDWhitelist addObject:v8];
      }
      if (v6) {
        unsigned __int8 v5 = 8;
      }
      else {
        unsigned __int8 v5 = 16;
      }
      goto LABEL_56;
    }
    unsigned int v24 = v23;
    if ([(NSMutableSet *)self->_fullyChainedParentIDWhitelist containsObject:v10])
    {
LABEL_26:
      [(NSMutableSet *)self->_fullyChainedParentIDWhitelist addObject:v10];
      if ([v4 isDirectory]) {
        [(NSMutableSet *)self->_fullyChainedParentIDWhitelist addObject:v8];
      }
      unsigned __int8 v5 = 8;
      goto LABEL_56;
    }
    if ([(NSMutableSet *)self->_halfChainedParentIDWhitelist containsObject:v10])
    {
      int v25 = 4;
    }
    else
    {
      int v25 = [v19 pcsChainStateForItem:v10];
      if ((v25 & 0xFFFFFFFE) == 2) {
        goto LABEL_26;
      }
    }
    unsigned int v30 = v25;
    if (v21 && [v4 isInDocumentOrTrashScope])
    {
      if ([v4 isDirectory])
      {
        if (v30 < 2 || ([v19 parentIDHasLiveUnchainedChildren:v8] & 1) != 0)
        {
          if (v24 < 2) {
            int v26 = 1;
          }
          else {
            int v26 = v6;
          }
          if (v26 != 1) {
            goto LABEL_55;
          }
          goto LABEL_46;
        }
        [(NSMutableSet *)self->_fullyChainedParentIDWhitelist addObject:v8];
LABEL_58:
        unsigned __int8 v5 = 4;
        goto LABEL_56;
      }
      if (v24 < 2) {
        int v28 = v31;
      }
      else {
        int v28 = 0;
      }
      if (v30 >= 2 && !v28) {
        goto LABEL_58;
      }
      char v29 = [v4 isDocument];
      if (v24 > 1 || (v29 & 1) == 0)
      {
LABEL_55:
        unsigned __int8 v5 = 1;
        goto LABEL_56;
      }
    }
    else
    {
      char v27 = v6 ^ 1;
      if (v24 < 2) {
        char v27 = 1;
      }
      if (v27) {
        goto LABEL_55;
      }
      if ([v4 isDirectory]) {
LABEL_46:
      }
        [(NSMutableSet *)self->_halfChainedParentIDWhitelist addObject:v8];
    }
    unsigned __int8 v5 = 2;
LABEL_56:

    goto LABEL_16;
  }
  if ([v4 isKnownByServer]) {
    unsigned __int8 v5 = 32;
  }
  else {
    unsigned __int8 v5 = 8;
  }
LABEL_17:

  return v5;
}

- (BOOL)_checkIfShouldDedicateOpToSaltingBasehashItem:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isDead] & 1) == 0)
  {
    BOOL v5 = 0;
    if (![v4 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:0]) {
      goto LABEL_27;
    }
    int v6 = [v4 st];
    uint64_t v7 = [v6 parentID];

    v8 = [v4 parentClientZone];
    unsigned int v9 = [v8 saltingStateForItemID:v7];
    if (v9 > 2)
    {
      if (v9 == -1 && !self->_rootChildBasehashSalt && [v7 isNonDesktopRoot])
      {
        v15 = [(NSMutableDictionary *)self->_parentItemIDToChildBasehashSalt objectForKeyedSubscript:v7];

        if (v15)
        {
          v41 = brc_bread_crumbs();
          v42 = brc_default_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
            -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:]();
          }
        }
        v16 = [v4 parentClientZone];
        v17 = [v16 asPrivateClientZone];
        int v18 = [v17 childBaseSaltForItemID:v7];
        rootChildBasehashSalt = self->_rootChildBasehashSalt;
        self->_rootChildBasehashSalt = v18;

        int v20 = self->_rootChildBasehashSalt;
        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E4F1C9B8], "brc_generateSaltingKey");
          int v21 = (NSData *)objc_claimAutoreleasedReturnValue();
          v22 = self->_rootChildBasehashSalt;
          self->_rootChildBasehashSalt = v21;

          unsigned int v23 = brc_bread_crumbs();
          unsigned int v24 = brc_default_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            v36 = [(NSData *)self->_rootChildBasehashSalt brc_truncatedSHA256];
            v37 = objc_msgSend(v36, "brc_hexadecimalString");
            v38 = [v7 debugDescription];
            int v43 = 138412802;
            v44 = v37;
            __int16 v45 = 2112;
            v46 = v38;
            __int16 v47 = 2112;
            v48 = v23;
            _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated root child basehash salt %@ for %@%@", (uint8_t *)&v43, 0x20u);
          }
          int v20 = self->_rootChildBasehashSalt;
        }
        [(NSMutableDictionary *)self->_parentItemIDToChildBasehashSalt setObject:v20 forKeyedSubscript:v7];
      }
    }
    else if (([v4 localDiffs] & 0x1000000060) != 0)
    {
      objc_super v10 = [v8 itemByItemID:v7];
      v11 = [v10 asDirectory];
      itemNeedingBasehashSalting = self->_itemNeedingBasehashSalting;
      self->_itemNeedingBasehashSalting = v11;

      v13 = brc_bread_crumbs();
      BOOL v5 = 1;
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:](v7);
      }
      goto LABEL_24;
    }
    if (![v4 isDirectory])
    {
      BOOL v5 = 0;
      goto LABEL_26;
    }
    int v25 = [v4 clientZone];
    int v26 = [v4 itemID];
    v13 = [v25 childBaseSaltForItemID:v26];

    if (!v13)
    {
      parentItemIDToChildBasehashSalt = self->_parentItemIDToChildBasehashSalt;
      int v28 = [v4 itemID];
      char v29 = [(NSMutableDictionary *)parentItemIDToChildBasehashSalt objectForKeyedSubscript:v28];

      if (v29)
      {
        v39 = brc_bread_crumbs();
        v40 = brc_default_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
          -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:]();
        }
      }
      v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "brc_generateSaltingKey");
      unsigned int v30 = brc_bread_crumbs();
      int v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v34 = [v4 itemID];
        v35 = [v34 debugDescription];
        int v43 = 138412802;
        v44 = v13;
        __int16 v45 = 2112;
        v46 = v35;
        __int16 v47 = 2112;
        v48 = v30;
        _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated child basehash salt %@ for %@%@", (uint8_t *)&v43, 0x20u);
      }
    }
    char v32 = self->_parentItemIDToChildBasehashSalt;
    v14 = [v4 itemID];
    [(NSMutableDictionary *)v32 setObject:v13 forKeyedSubscript:v14];
    BOOL v5 = 0;
LABEL_24:

LABEL_26:
    goto LABEL_27;
  }
  BOOL v5 = 0;
LABEL_27:

  return v5;
}

- (BOOL)_checkIfShouldDedicateOpToPCSChainingItem:(id)a3
{
  id v5 = a3;
  if ([v5 isDead]) {
    goto LABEL_11;
  }
  int v6 = [v5 appLibrary];
  uint64_t v7 = [v6 mangledID];
  v8 = +[BRCUserDefaults defaultsForMangledID:v7];
  int v9 = [v8 should2PhasePCSChain];

  if (([v5 isDeadOrMissingInServerTruth] & 1) != 0
    || ([v5 localDiffs] & 0x20) == 0
    || ([v5 isDirectory] & 1) == 0 && (objc_msgSend(v5, "isDocument") & v9) != 1)
  {
    goto LABEL_11;
  }
  objc_super v10 = [v5 itemID];
  if ([v10 isDocumentsFolder]) {
    goto LABEL_7;
  }
  v11 = [v5 clientZone];
  int v12 = [v11 isPrivateZone];

  if (!v12) {
    goto LABEL_11;
  }
  v13 = [v5 clientZone];
  objc_super v10 = [v13 asPrivateClientZone];

  fullyChainedParentIDWhitelist = self->_fullyChainedParentIDWhitelist;
  v15 = [v5 st];
  v16 = [v15 parentID];
  if ([(NSMutableSet *)fullyChainedParentIDWhitelist containsObject:v16])
  {
  }
  else
  {
    v19 = [v5 st];
    int v20 = [v19 parentID];
    int v21 = [v10 pcsChainStateForItem:v20] & 0xFFFFFFFE;

    if (v21 != 2)
    {
LABEL_7:

LABEL_11:
      BOOL v17 = 0;
      goto LABEL_12;
    }
  }
  v22 = [v5 itemID];
  unsigned int v23 = [v10 pcsChainStateForItem:v22];

  if (v23 < 2) {
    char v24 = v9;
  }
  else {
    char v24 = 0;
  }
  if ((v24 & 1) == 0)
  {
    if ((v23 & 0xFFFFFFFE) == 2) {
      goto LABEL_7;
    }
    int v25 = [v5 itemID];
    int v26 = [v10 parentIDHasLiveUnchainedChildren:v25];

    if (!v26) {
      goto LABEL_7;
    }
  }
  char v27 = brc_bread_crumbs();
  int v28 = brc_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToPCSChainingItem:](v5);
  }

  objc_storeStrong((id *)&self->_itemNeedingPCSChaining, a3);
  BOOL v17 = 1;
LABEL_12:

  return v17;
}

- (BOOL)checkIfSyncAllowedInSharedZoneForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCSyncUpOperationBuilder *)self op];
  int v6 = [v5 serverZone];

  if (![v6 isSharedZone]
    || [v4 isSharedToMeTopLevelItem] && (objc_msgSend(v4, "isDead") & 1) != 0)
  {
    BOOL v7 = 1;
    goto LABEL_25;
  }
  if ([v4 isDeadOrMissingInServerTruth]
    && [v4 isSharedToMeTopLevelItem])
  {
    v8 = [v4 serverZone];
    if (([v8 state] & 4) != 0)
    {
    }
    else
    {
      uint64_t v9 = [v4 localDiffs];

      if ((v9 & 0x400000000000000) != 0)
      {
        objc_super v10 = brc_bread_crumbs();
        v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:]();
        }

LABEL_24:
        BOOL v7 = 0;
        goto LABEL_25;
      }
    }
    v19 = brc_bread_crumbs();
    int v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:]();
    }

    [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v6];
    goto LABEL_24;
  }
  int v12 = [v4 clientZone];
  v13 = [v4 itemID];
  v14 = [v12 serverItemByItemID:v13];

  if (v14) {
    v15 = v14;
  }
  else {
    v15 = v4;
  }
  char v16 = [v15 sharingOptions];
  BOOL v7 = (v16 & 0x20) == 0;
  if ((v16 & 0x20) != 0)
  {
    BOOL v17 = brc_bread_crumbs();
    int v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:]();
    }

    [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:v14 inZone:v6];
  }

LABEL_25:
  return v7;
}

- (float)addDeletionOfItem:(id)a3
{
  id v4 = a3;
  if ([v4 isSharedToMeTopLevelItem])
  {
    v11 = brc_bread_crumbs();
    int v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperationBuilder addDeletionOfItem:]();
    }
  }
  id v5 = [v4 structureRecordID];
  int v6 = [v4 st];

  BOOL v7 = [v6 ckInfo];

  [(BRCSyncUpOperationBuilder *)self addDeletionOfRecordID:v5 ckInfo:v7];
  float v9 = v8;

  return v9;
}

- (float)addDeletionOfRecordID:(id)a3 ckInfo:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v6 = (__CFString *)a3;
  id v7 = a4;
  float v8 = [(BRCSyncUpOperationBuilder *)self op];
  float v9 = [v8 deletedRecordIDs];
  [v9 addObject:v6];

  if ([v7 hasEtag])
  {
    objc_super v10 = [v7 etag];
    v11 = [v8 recordIDsToDeleteToEtags];
    int v12 = v11;
    v13 = v10;
    v14 = v6;
LABEL_7:
    [v11 setObject:v13 forKeyedSubscript:v14];
    goto LABEL_8;
  }
  if ([v7 hasEtagBeforeCrossZoneMove])
  {
    v15 = [v8 pluginFieldsForRecordDeletesByID];
    objc_super v10 = [v15 objectForKeyedSubscript:v6];

    if (!v10)
    {
      objc_super v10 = objc_opt_new();
      char v16 = [v8 pluginFieldsForRecordDeletesByID];
      [v16 setObject:v10 forKeyedSubscript:v6];
    }
    int v12 = [v7 etagBeforeCrossZoneMove];
    v14 = @"br_etagInPreviousZone";
    v11 = v10;
    v13 = v12;
    goto LABEL_7;
  }
  objc_super v10 = brc_bread_crumbs();
  int v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    int v28 = v10;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] item should really have an etag%@", (uint8_t *)&v27, 0xCu);
  }
LABEL_8:

  if ([v7 hasDeletionChangeToken])
  {
    BOOL v17 = [(__CFString *)v6 recordName];
    char v18 = [v17 hasPrefix:@"shareAlias/"];

    if ((v18 & 1) == 0)
    {
      v19 = [v8 pluginFieldsForRecordDeletesByID];
      int v20 = [v19 objectForKeyedSubscript:v6];

      if (!v20)
      {
        int v20 = objc_opt_new();
        int v21 = [v8 pluginFieldsForRecordDeletesByID];
        [v21 setObject:v20 forKeyedSubscript:v6];
      }
      v22 = [v7 deletionChangeToken];
      [v20 setObject:v22 forKeyedSubscript:@"br_deleteChangeToken"];
    }
  }
  unsigned int v23 = [(BRCSyncUpOperationBuilder *)self defaults];
  [v23 syncUpStructureDeleteCost];
  float v25 = v24;

  return v25;
}

- (id)_getChildBasehashSaltForItemID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_parentItemIDToChildBasehashSalt objectForKeyedSubscript:v4];
  if (v5)
  {
    int v6 = (void *)v5;
    id v7 = [MEMORY[0x1E4F1CA98] null];

    if (v6 == v7)
    {
      id v8 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  float v9 = [(BRCSyncUpOperation *)self->_op serverZone];
  objc_super v10 = [v9 clientZone];
  int v6 = [v10 childBaseSaltForItemID:v4];

  if (v6)
  {
    [(NSMutableDictionary *)self->_parentItemIDToChildBasehashSalt setObject:v6 forKeyedSubscript:v4];
LABEL_6:
    id v8 = v6;
    int v6 = v8;
    goto LABEL_7;
  }
  int v12 = [MEMORY[0x1E4F1CA98] null];
  [(NSMutableDictionary *)self->_parentItemIDToChildBasehashSalt setObject:v12 forKeyedSubscript:v4];

  id v8 = 0;
  int v6 = 0;
LABEL_7:

  return v8;
}

- (id)_getChildBasehashSaltForItem:(id)a3
{
  id v4 = a3;
  if ([v4 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:1]
    && [v4 isDirectory])
  {
    uint64_t v5 = [v4 itemID];
    int v6 = [(BRCSyncUpOperationBuilder *)self _getChildBasehashSaltForItemID:v5];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)_getSaltForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[BRCUserDefaults defaultsForMangledID:0];
  int v6 = [v5 supportsEnhancedDrivePrivacy];

  id v7 = 0;
  if (v6)
  {
    if ([v4 isSharedToMeTopLevelItem])
    {
      id v7 = 0;
    }
    else
    {
      id v8 = [v4 st];
      float v9 = [v8 parentID];

      if (!v9)
      {
        v11 = brc_bread_crumbs();
        int v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[BRCSyncUpOperationBuilder _getSaltForItem:]();
        }
      }
      id v7 = [(BRCSyncUpOperationBuilder *)self _getChildBasehashSaltForItemID:v9];
    }
  }

  return v7;
}

- (id)_generateSaltGetterBlock
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__BRCSyncUpOperationBuilder__generateSaltGetterBlock__block_invoke;
  v5[3] = &unk_1E6997E08;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1D94389C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1D94389C0]();

  return v3;
}

uint64_t __53__BRCSyncUpOperationBuilder__generateSaltGetterBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getSaltForItem:a2];
}

- (id)_generateChildBasehashSaltGetterBlock
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__BRCSyncUpOperationBuilder__generateChildBasehashSaltGetterBlock__block_invoke;
  v5[3] = &unk_1E6997E08;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1D94389C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1D94389C0]();

  return v3;
}

uint64_t __66__BRCSyncUpOperationBuilder__generateChildBasehashSaltGetterBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getChildBasehashSaltForItem:a2];
}

- (float)addEditOfSharedTopLevelItem:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(BRCSyncUpOperationBuilder *)self op];
  int v6 = [v5 serverZone];
  int v7 = [v6 isSharedZone];

  if (!v7)
  {
    __int16 v10 = [v4 localDiffs];
    v11 = [v4 parentClientZone];
    int v12 = [v5 serverZone];
    v13 = [v12 clientZone];
    char v14 = [v11 isEqualToClientZone:v13];

    if ((v14 & 1) == 0)
    {
      float v25 = brc_bread_crumbs();
      int v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 138412546;
        v36 = (const char *)v4;
        __int16 v37 = 2112;
        v38 = v25;
        _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] Fake syncing up share alias in the wrong zone! %@%@", (uint8_t *)&v35, 0x16u);
      }
      goto LABEL_15;
    }
    if ((v10 & 0x1A69) == 0)
    {
LABEL_16:
      id v8 = [v5 serverZone];
      [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v8];
      goto LABEL_17;
    }
    v15 = [v4 session];
    char v16 = [v5 serverZone];
    BOOL v17 = [v15 serverAliasItemForSharedItem:v4 inZone:v16];

    uint64_t v18 = [(BRCSyncUpOperationBuilder *)self shouldPCSChainStatusForItem:v4];
    v19 = [v5 serverZone];
    id v8 = [v4 structureRecordBeingDeadInServerTruth:v17 == 0 shouldPCSChainStatus:v18 inZone:v19];

    int v20 = brc_bread_crumbs();
    int v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      if ((v18 & 0x2C) != 0) {
        v33 = "pcs chained ";
      }
      else {
        v33 = "";
      }
      v34 = [v8 description];
      int v35 = 136315650;
      v36 = v33;
      __int16 v37 = 2112;
      v38 = v34;
      __int16 v39 = 2112;
      v40 = v20;
      _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sshared document alias record %@%@", (uint8_t *)&v35, 0x20u);
    }
    if (v8)
    {
      v22 = [v5 recordsToSave];
      [v22 addObject:v8];

      if ([v4 isFromInitialScan])
      {
        unsigned int v23 = [(BRCSyncUpOperationBuilder *)self defaults];
        [v23 syncUpInitialItemCost];
      }
      else
      {
        int v31 = [v4 isKnownByServer];
        char v32 = [(BRCSyncUpOperationBuilder *)self defaults];
        unsigned int v23 = v32;
        if (v31) {
          [v32 syncUpStructureEditCost];
        }
        else {
          [v32 syncUpStructureCreateCost];
        }
      }
      float v27 = v24;

      goto LABEL_18;
    }
LABEL_23:
    float v27 = -1.0;
    goto LABEL_19;
  }
  if (![v4 isDocument])
  {
    if ([v4 isDirectory])
    {
      float v25 = brc_bread_crumbs();
      int v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncUpOperationBuilder addEditOfSharedTopLevelItem:]();
      }
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v29 = brc_bread_crumbs();
    unsigned int v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperationBuilder addEditOfSharedTopLevelItem:]();
    }

    goto LABEL_23;
  }
  id v8 = [v4 asDocument];
  [(BRCSyncUpOperationBuilder *)self addEditOfDocument:v8];
LABEL_17:
  float v27 = v9;
LABEL_18:

LABEL_19:
  return v27;
}

- (float)addDeletionOfSharedTopLevelItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(BRCSyncUpOperationBuilder *)self op];
  int v6 = [v5 serverZone];
  int v7 = [v6 isSharedZone];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    float v9 = [v4 asShareableItem];
    __int16 v10 = (void *)[v8 initShareIDWithShareableItem:v9];

    v11 = [(BRCSyncUpOperationBuilder *)self op];
    int v12 = [v11 deletedRecordIDs];
    [v12 addObject:v10];

    v13 = [(BRCSyncUpOperationBuilder *)self defaults];
    [v13 syncUpDocumentDeleteCost];
    float v15 = v14;
  }
  else
  {
    char v16 = [(BRCSyncUpOperationBuilder *)self op];
    BOOL v17 = [v16 serverZone];
    __int16 v10 = [v4 structureRecordIDInZone:v17];

    if (v10)
    {
      uint64_t v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncUpOperationBuilder addDeletionOfSharedTopLevelItem:]();
      }

      int v20 = [v4 st];
      int v21 = [v20 ckInfo];
      [(BRCSyncUpOperationBuilder *)self addDeletionOfRecordID:v10 ckInfo:v21];
    }
    else
    {
      unsigned int v23 = brc_bread_crumbs();
      float v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138412290;
        float v27 = v23;
        _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] syncing the structure of an item without an alias item%@", (uint8_t *)&v26, 0xCu);
      }

      int v20 = [(BRCSyncUpOperationBuilder *)self op];
      int v21 = [v20 serverZone];
      [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v21];
    }
    float v15 = v22;
  }
  return v15;
}

- (void)prepareAppLibraryRootSyncUpForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 appLibrary];
  int v6 = [v5 mangledID];

  if (v6)
  {
    int v7 = [v4 clientZone];
    if (([v7 isPrivateZone] & 1) == 0)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v8 = [v4 appLibrary];
    if (([v8 state] & 0x300002) != 0x200000)
    {
LABEL_9:

      goto LABEL_10;
    }
    float v9 = [(BRCSyncUpOperationBuilder *)self op];
    __int16 v10 = [v9 createdAppLibraryNames];
    v11 = [v6 appLibraryOrZoneName];
    if ([v10 containsObject:v11])
    {
LABEL_8:

      goto LABEL_9;
    }
    int v12 = [v4 clientZone];
    v13 = [v12 zoneName];
    if (![v13 isEqualToString:*MEMORY[0x1E4F59418]]
      || ([v6 isCloudDocsMangledID] & 1) != 0)
    {

      goto LABEL_8;
    }
    __int16 v39 = [v4 appLibrary];
    char v40 = [v39 isiCloudDesktopAppLibrary];

    if ((v40 & 1) == 0)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F1A320]);
      float v15 = [v4 clientZone];
      char v16 = [v15 zoneName];
      BOOL v17 = (void *)[v14 initWithZoneName:v16 ownerName:*MEMORY[0x1E4F19C08]];

      uint64_t v18 = [v4 appLibrary];
      v19 = [v18 childBasehashSalt];

      int v20 = [MEMORY[0x1E4F1A2D8] rootAppLibraryRecordForAppLibraryID:v6 zoneID:v17];
      int v21 = v20;
      if (v19)
      {
        objc_msgSend(v20, "brc_fillWithChildBasehashSalt:", v19);
        float v22 = [v4 appLibrary];
        unsigned int v23 = [v22 saltingState];

        if (v23 <= 1) {
          uint64_t v24 = 3;
        }
        else {
          uint64_t v24 = v23;
        }
        float v25 = [NSNumber numberWithUnsignedInt:v24];
        [v21 setObject:v25 forKeyedSubscript:@"saltingState"];
      }
      int v26 = [v4 appLibrary];
      if ([v26 includesDataScope])
      {
      }
      else
      {
        [v4 appLibrary];
        uint64_t v41 = v19;
        v28 = float v27 = v17;
        uint64_t v29 = [v28 mangledID];
        unsigned int v30 = +[BRCUserDefaults defaultsForMangledID:v29];
        int v31 = [v30 optimisticallyPCSChainWithSession:self->_session];

        BOOL v17 = v27;
        v19 = v41;

        if (v31) {
          [v21 setWantsChainPCS:1];
        }
      }
      if (v21)
      {
        char v32 = brc_bread_crumbs();
        v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          -[BRCSyncUpOperationBuilder prepareAppLibraryRootSyncUpForItem:]();
        }

        v34 = [(BRCSyncUpOperationBuilder *)self op];
        int v35 = [v34 recordsToSave];
        [v35 addObject:v21];

        v36 = [(BRCSyncUpOperationBuilder *)self op];
        __int16 v37 = [v36 createdAppLibraryNames];
        v38 = [v6 appLibraryOrZoneName];
        [v37 addObject:v38];
      }
    }
  }
LABEL_11:
}

- (float)fakeSyncForItem:(id)a3 serverItem:(id)a4 inZone:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v68 = a4;
  id v8 = a5;
  float v9 = [v7 st];
  __int16 v10 = [v9 ckInfo];
  v11 = [v10 etag];
  if (v11 || ![v7 isSharedToMeChildItem])
  {
  }
  else
  {
    int v12 = [v8 isSharedZone];

    if (v12)
    {
      v13 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:]();
      }

      [v7 prepareForSyncUpSideCarZone];
      [v7 markLatestSyncRequestAcknowledgedInZone:&unk_1F2B26F88];
    }
  }
  uint64_t v15 = [v7 localDiffs];
  char v16 = [(BRCSyncUpOperationBuilder *)self session];
  BOOL v17 = [v16 syncUpScheduler];
  uint64_t v18 = [v8 dbRowID];
  uint64_t v19 = [v17 inFlightDiffsForItem:v7 zoneRowID:v18];

  if ([v7 isSharedToMeChildItem])
  {
    int v20 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v7);
    int v21 = objc_msgSend(v20, "brc_shareItemID");
    float v22 = [v7 clientZone];
    unsigned int v23 = [v22 serverItemByItemID:v21];
    int v24 = [v23 isLive];

    int v25 = v24 ^ 1;
    if ((v24 & 1) == 0)
    {
      int v26 = brc_bread_crumbs();
      float v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v71 = (uint64_t)v7;
        __int16 v72 = 2112;
        id v73 = v26;
        _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as rejected because the root share is dead%@", buf, 0x16u);
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  if ([v7 isSharedToMeTopLevelItem])
  {
    uint64_t v28 = [v7 clientZone];
    uint64_t v29 = [v7 itemID];
    unsigned int v30 = [v28 serverItemByItemID:v29];
    char v31 = [v30 isLive];

    if ((v31 & 1) == 0)
    {
      int v20 = brc_bread_crumbs();
      int v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v71 = (uint64_t)v7;
        __int16 v72 = 2112;
        id v73 = v20;
        _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as rejected because the server item is dead%@", buf, 0x16u);
      }
      int v25 = 1;
      goto LABEL_19;
    }
  }
  int v25 = 0;
LABEL_20:
  uint64_t v32 = v19 | v15;
  if ([v7 isDocumentBeingCopiedToNewZone])
  {
    v33 = [v7 asDocument];
    int v34 = [v33 isFault];

    if (v34)
    {
      int v35 = brc_bread_crumbs();
      v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v71 = (uint64_t)v7;
        __int16 v72 = 2112;
        id v73 = v35;
        _os_log_impl(&dword_1D353B000, v36, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as rejected because it's being copied to a new zone%@", buf, 0x16u);
      }

LABEL_30:
      [v7 markForceRejected];
      goto LABEL_31;
    }
  }
  if ([v7 isDocumentBeingCopiedToNewZone])
  {
    __int16 v37 = brc_bread_crumbs();
    v38 = brc_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:]();
    }
  }
  if (v25) {
    goto LABEL_30;
  }
  if (([v7 isKnownByServer] & 1) != 0 || !objc_msgSend(v7, "isSharedToMeChildItem"))
  {
    [v7 prepareForSyncUpInZone:v8];
    v57 = [v8 dbRowID];
    [v7 markLatestSyncRequestAcknowledgedInZone:v57];

    if (([v68 sharingOptions] & 0x20) != 0 && objc_msgSend(v7, "isDocument"))
    {
      v58 = [v7 asDocument];
      v59 = [v58 currentVersion];
      v60 = [v59 ckInfo];
      if (v60)
      {

        if ((v32 & 0x180000) != 0)
        {
          v61 = [v7 asDocument];
          v62 = [v61 currentVersion];
          v63 = (void *)MEMORY[0x1E4F28C58];
          v64 = [v7 asDocument];
          v65 = [v64 fileIDForUpload];
          v66 = objc_msgSend(v63, "brc_errorItemIneligibleFromSyncForInode:", v65);
          [v62 setUploadError:v66];
        }
      }
      else
      {
      }
    }
LABEL_31:
    int v39 = 0;
    if ((v32 & 0x1000000000000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_32;
  }
  if ([v7 isDocument])
  {
    v54 = [v7 asDocument];
    v55 = [v54 currentVersion];
    v56 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemIneligibleFromSyncForInode:", 0);
    [v55 setUploadError:v56];
  }
  int v39 = 1;
  if ((v32 & 0x1000000000000000) == 0)
  {
LABEL_32:
    if (v68) {
      goto LABEL_34;
    }
    char v40 = [v8 clientZone];
    uint64_t v41 = [v7 itemID];
    id v68 = [v40 serverItemByItemID:v41];

    if (v68)
    {
LABEL_34:
      memset(v69, 0, sizeof(v69));
      __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:]", 555, v69);
      v42 = brc_bread_crumbs();
      int v43 = brc_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v71 = v69[0];
        __int16 v72 = 2112;
        id v73 = v68;
        __int16 v74 = 2112;
        v75 = v42;
        _os_log_debug_impl(&dword_1D353B000, v43, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx re-scheduling apply jobs for %@ because it finished sync-up%@", buf, 0x20u);
      }

      int v44 = [v7 isDead];
      if (v44) {
        __int16 v45 = 0;
      }
      else {
        __int16 v45 = v7;
      }
      id v46 = v45;
      __int16 v47 = [(BRCAccountSession *)self->_session applyScheduler];
      v48 = v47;
      if (v44) {
        uint64_t v49 = 1;
      }
      else {
        uint64_t v49 = 2;
      }
      [v47 createApplyJobFromServerItem:v68 localItem:v46 state:1 kind:v49];

      __brc_leave_section(v69);
    }
    else
    {
      id v68 = 0;
    }
  }
LABEL_43:
  [v7 saveToDB];
  if (v39)
  {
    v50 = [v8 session];
    v51 = [v50 syncUpScheduler];
    v52 = [v8 dbRowID];
    [v51 setState:52 forItem:v7 zone:v52];
  }
  return -1.0;
}

- (void)handleDeletionOfSharedItem:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v5 = a3;
  id v8 = (id)[[v4 alloc] initShareIDWithShareableItem:v5];

  int v6 = [(BRCSyncUpOperationBuilder *)self op];
  id v7 = [v6 deletedRecordIDs];
  [v7 addObject:v8];
}

- (void)handleEditOfSharedItem:(id)a3
{
  id v4 = a3;
  if ([v4 itemScope] == 3)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initShareIDWithShareableItem:v4];
    int v6 = [v4 st];
    int v7 = [v6 iWorkShareable];

    id v8 = [(BRCSyncUpOperationBuilder *)self op];
    float v9 = v8;
    if (v7) {
      [v8 iworkUnsharedShareIDs];
    }
    else {
    char v16 = [v8 deletedRecordIDs];
    }
    [v16 addObject:v5];

    id v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder handleEditOfSharedItem:]();
    }
LABEL_10:

    goto LABEL_11;
  }
  if (([v4 localDiffs] & 0x40) != 0)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initShareIDWithShareableItem:v4];
    __int16 v10 = [v4 st];
    v11 = [v10 logicalName];
    int v12 = [(BRCSyncUpOperationBuilder *)self op];
    v13 = [v12 renamedShareIDsToNames];
    [v13 setObject:v11 forKeyedSubscript:v5];

    id v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder handleEditOfSharedItem:]();
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (float)addEditOfDirectory:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 isDeadOrMissingInServerTruth];
  BOOL v6 = (v5 & 1) != 0 || ([v4 localDiffs] & 0x3FFE) != 0;
  int v7 = [v4 isKnownByServer];
  id v8 = [v4 itemID];
  if (([v8 isDocumentsFolder] & 1) == 0)
  {

LABEL_10:
    if ([v4 hasShareIDAndIsOwnedByMe])
    {
      v11 = [v4 asShareableItem];
      [(BRCSyncUpOperationBuilder *)self handleEditOfSharedItem:v11];
    }
    if (v6)
    {
      uint64_t v12 = [(BRCSyncUpOperationBuilder *)self shouldPCSChainStatusForItem:v4];
      v13 = [(BRCSyncUpOperationBuilder *)self op];
      id v14 = [v13 stageID];
      uint64_t v15 = [(BRCSyncUpOperationBuilder *)self _generateSaltGetterBlock];
      char v16 = [(BRCSyncUpOperationBuilder *)self _generateChildBasehashSaltGetterBlock];
      BOOL v17 = [v4 structureRecordBeingDeadInServerTruth:v5 stageID:v14 shouldPCSChainStatus:v12 saltGetter:v15 childBasehashSaltGetter:v16];

      if (v17)
      {
        if ([v4 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:0]
          && [v4 isNewToServer:0])
        {
          uint64_t v18 = [v17 encryptedValues];
          uint64_t v19 = [v18 objectForKeyedSubscript:@"childBasehashSalt"];

          if (!v19)
          {
            __int16 v37 = brc_bread_crumbs();
            v38 = brc_default_log();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
              -[BRCSyncUpOperationBuilder addEditOfDirectory:]();
            }
          }
          [v17 setObject:&unk_1F2B26FA0 forKeyedSubscript:@"saltingState"];
        }
        int v20 = brc_bread_crumbs();
        int v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v32 = "half chained ";
          if (v12 != 2) {
            uint64_t v32 = "";
          }
          if ((v12 & 0x2C) != 0) {
            v33 = "pcs chained ";
          }
          else {
            v33 = v32;
          }
          uint64_t v34 = [v17 description];
          int v35 = (void *)v34;
          v36 = "\n(dead in server truth)";
          int v39 = 136315906;
          char v40 = v33;
          if (!v5) {
            v36 = "";
          }
          __int16 v41 = 2112;
          uint64_t v42 = v34;
          __int16 v43 = 2080;
          int v44 = v36;
          __int16 v45 = 2112;
          id v46 = v20;
          _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sdirectory record %@%s%@", (uint8_t *)&v39, 0x2Au);
        }
        float v22 = [(BRCSyncUpOperationBuilder *)self op];
        unsigned int v23 = [v22 recordsToSave];
        [v23 addObject:v17];

        if ([v4 isFromInitialScan])
        {
          int v24 = [(BRCSyncUpOperationBuilder *)self defaults];
          [v24 syncUpInitialItemCost];
        }
        else
        {
          int v29 = [v4 isKnownByServer];
          unsigned int v30 = [(BRCSyncUpOperationBuilder *)self defaults];
          int v24 = v30;
          if (v29) {
            [v30 syncUpStructureEditCost];
          }
          else {
            [v30 syncUpStructureCreateCost];
          }
        }
        float v10 = v25;
      }
      else
      {
        float v10 = -1.0;
      }
    }
    else
    {
      int v26 = [(BRCSyncUpOperationBuilder *)self op];
      float v27 = [v26 serverZone];
      [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v27];
      float v10 = v28;
    }
    goto LABEL_28;
  }
  float v9 = [v4 appLibrary];
  if (([v9 state] & 0x40000) == 0) {
    int v7 = 1;
  }

  float v10 = -1.0;
  if (v7 == 1) {
    goto LABEL_10;
  }
LABEL_28:

  return v10;
}

- (float)addDeletionOfDirectory:(id)a3
{
  id v4 = a3;
  if ([v4 hasShareIDAndIsOwnedByMe])
  {
    uint64_t v5 = [v4 asShareableItem];
    [(BRCSyncUpOperationBuilder *)self handleDeletionOfSharedItem:v5];
  }
  if ([v4 isSharedToMeTopLevelItem])
  {
    float v9 = brc_bread_crumbs();
    float v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperationBuilder addDeletionOfItem:]();
    }
  }
  [(BRCSyncUpOperationBuilder *)self addDeletionOfItem:v4];
  float v7 = v6;

  return v7;
}

- (float)addDeletionOfAlias:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 targetClientZone];
  if ([v5 isSharedZone])
  {
    float v6 = [v4 targetItemID];
    float v7 = [v5 itemByItemID:v6];
    id v8 = [v7 asSharedToMeTopLevelItem];

    float v9 = [v8 parentClientZone];
    float v10 = [v4 clientZone];
    int v11 = [v9 isEqualToClientZone:v10];

    if (v11)
    {
      uint64_t v12 = brc_bread_crumbs();
      v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412546;
        id v22 = v4;
        __int16 v23 = 2112;
        int v24 = v12;
        _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Faking sync for alias item alive in the same zone as the target %@%@", (uint8_t *)&v21, 0x16u);
      }

      id v14 = [v4 serverZone];
      [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v14];
      float v16 = v15;

      goto LABEL_9;
    }
  }
  if ([v4 isSharedToMeTopLevelItem])
  {
    uint64_t v19 = brc_bread_crumbs();
    int v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCSyncUpOperationBuilder addDeletionOfItem:]();
    }
  }
  [(BRCSyncUpOperationBuilder *)self addDeletionOfItem:v4];
  float v16 = v17;
LABEL_9:

  return v16;
}

- (float)addDeletionOfDocument:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(BRCSyncUpOperationBuilder *)self op];
  if ([v4 hasShareIDAndIsOwnedByMe])
  {
    float v6 = [v4 asShareableItem];
    [(BRCSyncUpOperationBuilder *)self handleDeletionOfSharedItem:v6];
  }
  float v7 = [v4 currentVersion];
  id v8 = [v7 ckInfo];

  if (([v8 hasEtag] & 1) != 0 || objc_msgSend(v8, "hasEtagBeforeCrossZoneMove"))
  {
    float v9 = [v4 documentRecordID];
    [(BRCSyncUpOperationBuilder *)self addDeletionOfRecordID:v9 ckInfo:v8];
    [(BRCSyncUpOperationBuilder *)self addDeletionOfItem:v4];
    int v10 = [v4 isInDocumentScope];
    int v11 = [(BRCSyncUpOperationBuilder *)self defaults];
    uint64_t v12 = v11;
    if (v10) {
      [v11 syncUpDocumentDeleteCost];
    }
    else {
      [v11 syncUpDataDeleteCost];
    }
    float v14 = v13;
  }
  else
  {
    float v15 = brc_bread_crumbs();
    float v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      float v27 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Not syncing deletion of ETag-less version: %@%@", (uint8_t *)&v24, 0x16u);
    }

    float v17 = [v4 clientZone];
    uint64_t v18 = [v4 itemID];
    float v9 = [v17 serverItemByItemID:v18];

    if ([v9 isLive])
    {
      uint64_t v19 = [v4 session];
      int v20 = [v19 applyScheduler];
      [v20 createApplyJobFromServerItem:v9 localItem:0 state:1 kind:1];
    }
    int v21 = [v5 serverZone];
    [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:v9 inZone:v21];
    float v14 = v22;
  }
  return v14;
}

- (BOOL)_recoverItemIDChangedWhileUploadingIfNecessary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 currentVersion];
  float v6 = [v5 uploadedAssets];

  if (v6)
  {
    float v7 = [v6 recordID];
    id v8 = objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);

    if (v8
      && ([v4 itemID],
          float v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v8 isEqualToItemID:v9],
          v9,
          (v10 & 1) == 0))
    {
      uint64_t v12 = brc_bread_crumbs();
      float v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        float v16 = [v4 itemID];
        int v17 = 138412802;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        int v20 = v16;
        __int16 v21 = 2112;
        float v22 = v12;
        _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ItemID changed while uploading (%@ -> %@), starting over%@", (uint8_t *)&v17, 0x20u);
      }
      float v14 = [v4 currentVersion];
      [v14 clearUploadedAssets];

      [v4 markNeedsUploadOrSyncingUp];
      [v4 saveToDB];
      BOOL v11 = 1;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_validateSharedDocumentFieldsForRecord:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BRCSyncUpOperationBuilder *)self _recoverItemIDChangedWhileUploadingIfNecessary:v7])
  {
    goto LABEL_5;
  }
  id v8 = [v7 session];
  char v9 = [v6 validateEnhancedDrivePrivacyFieldsWithSession:v8 error:0];

  if ((v9 & 1) == 0)
  {
    BOOL v11 = [v7 currentVersion];
    [v11 clearUploadedAssets];

    [v7 markNeedsUploadOrSyncingUp];
    [v7 saveToDB];
LABEL_5:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (float)addEditOfDocument:(id)a3
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(BRCSyncUpOperationBuilder *)self op];
  if ([v4 isPausedFromSync]) {
    uint64_t v6 = 0x40000;
  }
  else {
    uint64_t v6 = 33423360;
  }
  uint64_t v7 = [v4 isDeadOrMissingInServerTruth];
  uint64_t v8 = [v4 localDiffs];
  char v9 = [v4 st];
  BOOL v10 = [v9 ckInfo];
  BOOL v11 = v10;
  if (!v10 || (v7 & 1) != 0)
  {
    uint64_t v12 = [v4 st];
    int v13 = [v12 iWorkShareable];

    if ((v13 & v7) == 1)
    {
      char v14 = [v4 sharingOptions];
      BOOL v15 = (v14 & 4) == 0;
      unint64_t v163 = (unint64_t)(v14 & 4) >> 2;
      goto LABEL_11;
    }
    LOBYTE(v163) = v13;
  }
  else
  {

    LOBYTE(v163) = 0;
  }
  BOOL v15 = 0;
LABEL_11:
  uint64_t v16 = v8 & 0x3FFE;
  uint64_t v17 = v8 & v6;
  if (![v4 sharingOptions]) {
    goto LABEL_20;
  }
  uint64_t v18 = [v4 currentVersion];
  __int16 v19 = [v18 ckInfo];
  if (v19)
  {

    goto LABEL_20;
  }
  int v20 = [v4 clientZone];
  if ([v20 isPrivateZone])
  {
  }
  else
  {
    int v21 = [v4 isSharedToMeTopLevelItem];

    if (!v21) {
      goto LABEL_20;
    }
  }
  float v22 = brc_bread_crumbs();
  uint64_t v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.9();
  }

  LOBYTE(v163) = 1;
LABEL_20:
  v164 = (void *)v5;
  unint64_t v24 = [v4 localDiffs];
  BOOL v25 = v17 == 0;
  uint64_t v26 = (v24 >> 59) & 1;
  if (v25) {
    int v27 = v26 | v7;
  }
  else {
    int v27 = 1;
  }
  if (v16) {
    int v28 = 1;
  }
  else {
    int v28 = v26 | v7;
  }
  int v29 = [v4 serverZone];
  int v30 = [v29 isSharedZone];

  if (v30)
  {
    int v28 = [v4 isSharedToMeChildItem];
    char v31 = [v4 clientZone];
    uint64_t v32 = [v4 itemID];
    v33 = [v31 serverItemByItemID:v32];

    if (v7 && ([v4 isSharedToMeTopLevelItem] & 1) != 0
      || (v33 ? (uint64_t v34 = v33) : (uint64_t v34 = v4), ([v34 sharingOptions] & 0x20) != 0))
    {
      int v35 = brc_bread_crumbs();
      v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.8();
      }

      int v27 = 0;
    }
  }
  int v37 = v26 | v15;
  int v38 = [(BRCSyncUpOperationBuilder *)self shouldPCSChainStatusForItem:v4];
  if ((v38 & 6) != 0) {
    int v39 = v28;
  }
  else {
    int v39 = 1;
  }
  if ((v38 & 4) != 0) {
    int v40 = v27;
  }
  else {
    int v40 = 1;
  }
  if (v40) {
    int v41 = v38;
  }
  else {
    int v41 = 2;
  }
  if (v39) {
    int v42 = v41;
  }
  else {
    int v42 = 1;
  }
  unsigned int v162 = v42;
  if ((v42 & 0xC) != 0)
  {
    __int16 v43 = brc_bread_crumbs();
    int v44 = brc_default_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.7();
    }

    int v28 = 1;
  }
  else if (!v27)
  {
    int v158 = v37;
    id v159 = 0;
    uint64_t v47 = 0;
    BOOL v55 = 0;
    __int16 v45 = v164;
    goto LABEL_65;
  }
  __int16 v45 = v164;
  id v46 = [v4 currentVersion];
  uint64_t v47 = [v46 uploadedAssets];

  if (objc_msgSend(v47, "brc_isfakeRecordWithErrorMarkerFor20716676"))
  {
    v48 = brc_bread_crumbs();
    uint64_t v49 = brc_default_log();
    if (os_log_type_enabled(v49, (os_log_type_t)0x90u)) {
      -[BRCSyncUpOperationBuilder addEditOfDocument:]();
    }

    [v4 markForceUpload];
    [v4 saveToDB];
    v50 = 0;
LABEL_58:
    float v51 = -1.0;
    goto LABEL_190;
  }
  if (v47)
  {
    float v51 = -1.0;
    if (![(BRCSyncUpOperationBuilder *)self _validateSharedDocumentFieldsForRecord:v47 item:v4])
    {
      v50 = 0;
      goto LABEL_190;
    }
    v52 = [v47 objectForKeyedSubscript:@"thumb1024"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    int v158 = v37;
    if (isKindOfClass)
    {
      v54 = [v47 objectForKeyedSubscript:@"thumb1024"];
      if ([v54 isRereferencedAssetUpload])
      {
        v50 = 0;
      }
      else
      {
        v77 = [v54 fileURL];
        id v166 = 0;
        char v78 = [v77 checkResourceIsReachableAndReturnError:&v166];
        id v159 = v166;

        if ((v78 & 1) == 0)
        {
          v115 = brc_bread_crumbs();
          v116 = brc_default_log();
          if (os_log_type_enabled(v116, (os_log_type_t)0x90u)) {
            -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.6();
          }

          [v4 markForceUpload];
          [v4 saveToDB];
LABEL_130:

          goto LABEL_174;
        }
        v50 = v159;
      }
    }
    else
    {
      v50 = 0;
    }
    v79 = [v4 currentVersion];
    int v80 = [v79 isPackage];

    if (v80)
    {
      uint64_t v81 = [v47 objectForKeyedSubscript:@"pkgContent"];
      if (v81)
      {
        v82 = (void *)v81;
        v160 = v50;
        v83 = @"pkgManifest";
        uint64_t v84 = [v47 objectForKeyedSubscript:@"pkgManifest"];
        if (v84)
        {
          v85 = (void *)v84;
          v86 = [v47 objectForKeyedSubscript:@"pkgSignature"];

          v50 = v160;
          if (v86)
          {
            v87 = [v47 objectForKeyedSubscript:@"pkgContent"];
            v88 = [v47 objectForKeyedSubscript:@"pkgManifest"];
            v89 = [v47 objectForKeyedSubscript:@"thumb1024"];
            v155 = v87;
            [v87 earliestUploadReceiptExpiration];
            double v91 = v90;
            double Current = CFAbsoluteTimeGetCurrent();
            double v93 = Current;
            v156 = v89;
            if (v91 == 0.0) {
              goto LABEL_146;
            }
            if (v91 >= Current)
            {
              v87 = [v88 deviceID];
              uint64_t v94 = [v87 longLongValue];
              v83 = [(BRCAccountSession *)self->_session volume];
              if (v94 == (int)[(__CFString *)v83 deviceID])
              {
                v89 = v156;
LABEL_146:
                if ([v88 size] && (objc_msgSend(v88, "uploadReceiptExpiration"), v121 < v93))
                {
                  BOOL v122 = 1;
                }
                else if ([v89 size])
                {
                  [v89 uploadReceiptExpiration];
                  BOOL v122 = v123 < v93;
                }
                else
                {
                  BOOL v122 = 0;
                }
                if (v91 == 0.0)
                {
                  if (v122) {
                    goto LABEL_186;
                  }
                }
                else
                {

                  if (v122) {
                    goto LABEL_186;
                  }
                }

                goto LABEL_162;
              }
            }
LABEL_186:
            brc_bread_crumbs();
            v149 = (char *)objc_claimAutoreleasedReturnValue();
            v150 = brc_default_log();
            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v168 = (const char *)v4;
              __int16 v169 = 2112;
              v170 = v149;
              _os_log_impl(&dword_1D353B000, v150, OS_LOG_TYPE_DEFAULT, "[WARNING] Forcing re-upload of an item which has an expired put receipt - %@%@", buf, 0x16u);
            }

            [v4 markForceUpload];
            [v4 saveToDB];

            goto LABEL_189;
          }
        }
        else
        {
        }
      }
      v117 = brc_bread_crumbs();
      v118 = brc_default_log();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_FAULT)) {
        -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.4();
      }
LABEL_134:

      [v4 markForceUpload];
      [v4 saveToDB];
LABEL_189:
      __int16 v45 = v164;
      goto LABEL_190;
    }
    v95 = [v47 objectForKeyedSubscript:@"fileContent"];
    if (v95)
    {
    }
    else
    {
      v96 = [v47 objectForKeyedSubscript:@"bookmarkContent"];

      if (!v96)
      {
        v117 = brc_bread_crumbs();
        v118 = brc_default_log();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_FAULT)) {
          -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.5();
        }
        goto LABEL_134;
      }
    }
    v97 = [v47 objectForKeyedSubscript:@"fileContent"];
    v98 = [v47 objectForKeyedSubscript:@"thumb1024"];
    double v99 = CFAbsoluteTimeGetCurrent();
    if ([v97 size])
    {
      [v97 uploadReceiptExpiration];
      if (v100 >= v99)
      {
        v161 = v50;
        v101 = [v97 deviceID];
        uint64_t v102 = [v101 longLongValue];
        v103 = [(BRCAccountSession *)self->_session volume];
        if (v102 == (int)[v103 deviceID])
        {
          if (![v98 size])
          {

            v50 = v161;
LABEL_161:

LABEL_162:
            __int16 v45 = v164;
            goto LABEL_163;
          }
          [v98 uploadReceiptExpiration];
          double v105 = v104;

          v50 = v161;
          if (v105 >= v99) {
            goto LABEL_161;
          }
        }
        else
        {

          v50 = v161;
        }
      }
    }
    else
    {
      if (![v98 size]) {
        goto LABEL_161;
      }
      [v98 uploadReceiptExpiration];
      if (v110 >= v99) {
        goto LABEL_161;
      }
    }
    brc_bread_crumbs();
    v119 = (char *)objc_claimAutoreleasedReturnValue();
    v120 = brc_default_log();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v168 = (const char *)v4;
      __int16 v169 = 2112;
      v170 = v119;
      _os_log_impl(&dword_1D353B000, v120, OS_LOG_TYPE_DEFAULT, "[WARNING] Forcing re-upload of an item which has an expired put receipt - %@%@", buf, 0x16u);
    }

    [v4 markForceUpload];
    [v4 saveToDB];

    goto LABEL_189;
  }
  if ([v4 contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:v7])
  {
    if (![v4 isFault] || (objc_msgSend(v4, "isDocumentBeingCopiedToNewZone") & 1) != 0)
    {
      v66 = brc_bread_crumbs();
      v67 = brc_default_log();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
        -[BRCSyncUpOperationBuilder addEditOfDocument:]();
      }

      [v4 markForceUpload];
      [v4 saveToDB];
      v50 = 0;
      uint64_t v47 = 0;
      goto LABEL_58;
    }
    v106 = brc_bread_crumbs();
    v107 = brc_default_log();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG)) {
      -[BRCSyncUpOperationBuilder addEditOfDocument:]();
    }

    v108 = [v164 serverZone];
    [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v108];
    float v51 = v109;

    v50 = 0;
    uint64_t v47 = 0;
    goto LABEL_190;
  }
  int v158 = v37;
  uint64_t v47 = [v4 baseRecord];
  v50 = 0;
LABEL_163:
  uint64_t v128 = [v4 localDiffs];
  v129 = [(BRCSyncUpOperationBuilder *)self _getSaltForItem:v4];
  id v165 = v50;
  LOBYTE(v128) = [v47 serializeVersion:v4 diffs:v128 deadInServerTruth:v7 basehashSalt:v129 error:&v165];
  id v159 = v165;

  if ((v128 & 1) == 0)
  {
    v146 = brc_bread_crumbs();
    v147 = brc_default_log();
    v50 = v159;
    if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v168 = (const char *)v159;
      __int16 v169 = 2112;
      v170 = (const char *)v4;
      __int16 v171 = 2112;
      v172 = v146;
      _os_log_debug_impl(&dword_1D353B000, v147, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
    }

    goto LABEL_58;
  }
  v130 = [v4 session];
  int v131 = [v47 validateEnhancedDrivePrivacyFieldsWithSession:v130 error:0];

  float v51 = -1.0;
  if (!v131)
  {
LABEL_174:
    v50 = v159;
    goto LABEL_190;
  }
  v132 = [v4 resolvedConflictLoserEtags];
  v157 = v132;
  if ([v132 count])
  {
    v133 = [v132 allObjects];
    v134 = [v45 conflictLosersToResolveByRecordID];
    v135 = [v47 recordID];
    [v134 setObject:v133 forKeyedSubscript:v135];

    v132 = v157;
  }
  BOOL v55 = v47 != 0;
  if (!v47) {
    goto LABEL_181;
  }
  if ((v162 & 0x2C) != 0)
  {
    v136 = [v4 itemID];
    v137 = [v4 serverZone];
    v138 = [v137 zoneID];
    v139 = [v136 pcsChainDocumentStructureReferenceInZoneID:v138];
    [v47 setParent:v139];

    v132 = v157;
  }
  v140 = brc_bread_crumbs();
  v141 = brc_default_log();
  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
  {
    if ((v162 & 0x2C) != 0) {
      v152 = "pcs chained ";
    }
    else {
      v152 = "";
    }
    v153 = [v47 description];
    *(_DWORD *)buf = 136315650;
    v168 = v152;
    __int16 v169 = 2112;
    v170 = v153;
    __int16 v171 = 2112;
    v172 = v140;
    _os_log_debug_impl(&dword_1D353B000, v141, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sversion record %@%@", buf, 0x20u);

    v132 = v157;
  }

  v142 = brc_bread_crumbs();
  v143 = brc_default_log();
  if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
  {
    v154 = "";
    *(_DWORD *)buf = 138412802;
    v168 = (const char *)v4;
    if (v7) {
      v154 = "\n(dead in server truth)";
    }
    __int16 v169 = 2080;
    v170 = v154;
    __int16 v171 = 2112;
    v172 = v142;
    _os_log_debug_impl(&dword_1D353B000, v143, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
  }

  __int16 v45 = v164;
  v144 = [v164 recordsToSave];
  [v144 addObject:v47];

  if (v163)
  {
    v145 = [v164 recordsNeedingUpdatedSharingProtectionInfo];
LABEL_180:
    v148 = v145;
    [v145 addObject:v47];

    goto LABEL_181;
  }
  if (v158)
  {
    v145 = [v164 recordsNeedingNewSharingProtectionInfo];
    goto LABEL_180;
  }
LABEL_181:

LABEL_65:
  if ([v4 hasShareIDAndIsOwnedByMe])
  {
    v56 = [v4 asShareableItem];
    [(BRCSyncUpOperationBuilder *)self handleEditOfSharedItem:v56];
  }
  if (!v28)
  {
    if (v55)
    {
LABEL_90:
      char v70 = [v4 isInDocumentScope];
      v50 = v159;
      if ([v4 isFromInitialScan])
      {
        uint64_t v71 = [(BRCSyncUpOperationBuilder *)self defaults];
        [v71 syncUpInitialItemCost];
      }
      else
      {
        int v73 = [v4 isKnownByServer];
        __int16 v74 = [(BRCSyncUpOperationBuilder *)self defaults];
        uint64_t v71 = v74;
        if (v73)
        {
          if (v70) {
            [v74 syncUpDocumentEditCost];
          }
          else {
            [v74 syncUpDataEditCost];
          }
        }
        else if (v70)
        {
          [v74 syncUpDocumentCreateCost];
        }
        else
        {
          [v74 syncUpDataCreateCost];
        }
      }
      float v51 = v72;

      goto LABEL_190;
    }
    v54 = [v45 serverZone];
    [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v54];
    float v51 = v68;
    goto LABEL_130;
  }
  v57 = [v45 stageID];
  v58 = [(BRCSyncUpOperationBuilder *)self _generateSaltGetterBlock];
  v59 = [v4 structureRecordBeingDeadInServerTruth:v7 stageID:v57 shouldPCSChainStatus:v162 saltGetter:v58 childBasehashSaltGetter:0];

  if (!v59)
  {
    uint64_t v47 = 0;
    float v51 = -1.0;
    goto LABEL_174;
  }
  v60 = brc_bread_crumbs();
  v61 = brc_default_log();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    v124 = "";
    if (v162 == 2) {
      v124 = "half chained ";
    }
    if ((v162 & 0x2C) != 0) {
      v125 = "pcs chained ";
    }
    else {
      v125 = v124;
    }
    v126 = [v59 description];
    *(_DWORD *)buf = 136315650;
    v168 = v125;
    __int16 v169 = 2112;
    v170 = v126;
    __int16 v171 = 2112;
    v172 = v60;
    _os_log_debug_impl(&dword_1D353B000, v61, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sdocument structure record %@%@", buf, 0x20u);
  }
  v62 = brc_bread_crumbs();
  v63 = brc_default_log();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    v127 = "";
    *(_DWORD *)buf = 138412802;
    v168 = (const char *)v4;
    if (v7) {
      v127 = "\n(dead in server truth)";
    }
    __int16 v169 = 2080;
    v170 = v127;
    __int16 v171 = 2112;
    v172 = v62;
    _os_log_debug_impl(&dword_1D353B000, v63, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
  }

  v64 = [v45 recordsToSave];
  [v64 addObject:v59];

  if (v163)
  {
    v65 = [v45 recordsNeedingUpdatedSharingProtectionInfo];
LABEL_87:
    v69 = v65;
    [v65 addObject:v59];

    goto LABEL_88;
  }
  if (v158)
  {
    v65 = [v45 recordsNeedingNewSharingProtectionInfo];
    goto LABEL_87;
  }
LABEL_88:
  if (v55)
  {
    uint64_t v47 = v59;
    goto LABEL_90;
  }
  if ([v4 isFromInitialScan])
  {
    v75 = [(BRCSyncUpOperationBuilder *)self defaults];
    [v75 syncUpInitialItemCost];
    float v51 = v76;

    uint64_t v47 = v59;
    goto LABEL_174;
  }
  int v111 = [v4 isKnownByServer];
  v112 = [(BRCSyncUpOperationBuilder *)self defaults];
  v113 = v112;
  v50 = v159;
  if (v111) {
    [v112 syncUpStructureEditCost];
  }
  else {
    [v112 syncUpStructureCreateCost];
  }
  float v51 = v114;

  uint64_t v47 = v59;
LABEL_190:

  return v51;
}

- (float)addEditOfFinderBookmark:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 isDeadOrMissingInServerTruth];
  if (v5)
  {
    BOOL v6 = 1;
    BOOL v7 = 1;
  }
  else
  {
    BOOL v6 = ([v4 localDiffs] & 0x3FFE) != 0;
    BOOL v7 = ([v4 localDiffs] & 0x1FE0000) != 0;
  }
  uint64_t v8 = [(BRCSyncUpOperationBuilder *)self shouldPCSChainStatusForItem:v4];
  char v9 = v8 & 0x2C;
  int v10 = (v8 & 0x2C) != 0 || v6;
  BOOL v11 = [v4 currentVersion];
  uint64_t v12 = [v11 uploadedAssets];

  if (v12)
  {
LABEL_13:
    if (((v7 | v10) & 1) == 0)
    {
      int v21 = [(BRCSyncUpOperationBuilder *)self op];
      float v22 = [v21 serverZone];
      [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:0 inZone:v22];
      float v15 = v23;

LABEL_38:
      goto LABEL_39;
    }
    uint64_t v16 = [(BRCSyncUpOperationBuilder *)self _getSaltForItem:v4];
    if (v7)
    {
      id v46 = 0;
      char v17 = objc_msgSend(v12, "serializeVersion:diffs:deadInServerTruth:basehashSalt:error:", v4, objc_msgSend(v4, "localDiffs"), v5, v16, &v46);
      uint64_t v18 = (char *)v46;
      if ((v17 & 1) == 0)
      {
        brc_bread_crumbs();
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        int v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v48 = v18;
          __int16 v49 = 2112;
          v50 = (const char *)v4;
          __int16 v51 = 2112;
          id v52 = v19;
          _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
        }

        float v15 = -1.0;
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    if (v10)
    {
      char v43 = v8 & 0x2C;
      int v44 = v18;
      uint64_t v24 = [v4 localDiffs];
      BOOL v25 = [(BRCSyncUpOperationBuilder *)self op];
      uint64_t v26 = [v25 stageID];
      int v27 = [(BRCSyncUpOperationBuilder *)self _generateSaltGetterBlock];
      id v45 = 0;
      LOBYTE(v24) = [v12 serializeStatInfo:v4 diffs:v24 stageID:v26 deadInServerTruth:v5 shouldPCSChainStatus:v8 basehashSaltGetter:v27 childBasehashSaltGetter:0 error:&v45];
      id v19 = v45;

      if ((v24 & 1) == 0)
      {
        int v35 = brc_bread_crumbs();
        v36 = brc_default_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v48 = (const char *)v19;
          __int16 v49 = 2112;
          v50 = (const char *)v4;
          __int16 v51 = 2112;
          id v52 = v35;
          _os_log_debug_impl(&dword_1D353B000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
        }

        float v15 = -1.0;
        uint64_t v18 = v44;
        goto LABEL_36;
      }

      uint64_t v18 = v44;
      char v9 = v43;
    }
    float v15 = -1.0;
    if (![(BRCSyncUpOperationBuilder *)self _validateSharedDocumentFieldsForRecord:v12 item:v4])
    {
LABEL_37:

      goto LABEL_38;
    }
    int v28 = brc_bread_crumbs();
    int v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      if (v9) {
        int v40 = "pcs chained ";
      }
      else {
        int v40 = "";
      }
      int v41 = [v12 description];
      *(_DWORD *)buf = 136315650;
      v48 = v40;
      __int16 v49 = 2112;
      v50 = v41;
      __int16 v51 = 2112;
      id v52 = v28;
      _os_log_debug_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sfinder alias record %@%@", buf, 0x20u);
    }
    int v30 = brc_bread_crumbs();
    char v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      int v42 = "";
      *(_DWORD *)buf = 138412802;
      v48 = (const char *)v4;
      if (v5) {
        int v42 = "\n(dead in server truth)";
      }
      __int16 v49 = 2080;
      v50 = v42;
      __int16 v51 = 2112;
      id v52 = v30;
      _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
    }

    uint64_t v32 = [(BRCSyncUpOperationBuilder *)self op];
    v33 = [v32 recordsToSave];
    [v33 addObject:v12];

    if ([v4 isFromInitialScan])
    {
      id v19 = [(BRCSyncUpOperationBuilder *)self defaults];
      [v19 syncUpInitialItemCost];
    }
    else
    {
      int v37 = [v4 isKnownByServer];
      int v38 = [(BRCSyncUpOperationBuilder *)self defaults];
      id v19 = v38;
      if (v37) {
        [v38 syncUpStructureEditCost];
      }
      else {
        [v38 syncUpStructureCreateCost];
      }
    }
    float v15 = v34;
LABEL_36:

    goto LABEL_37;
  }
  if (![v4 contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:v5])
  {
    uint64_t v12 = [v4 baseRecord];
    goto LABEL_13;
  }
  int v13 = brc_bread_crumbs();
  char v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[BRCSyncUpOperationBuilder addEditOfDocument:]();
  }

  [v4 markForceUpload];
  [v4 saveToDB];
  float v15 = -1.0;
LABEL_39:

  return v15;
}

- (float)addDeletionOfFinderBookmark:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCSyncUpOperationBuilder *)self op];
  BOOL v6 = [v5 deletedRecordIDs];
  BOOL v7 = [v4 documentRecordID];

  [v6 addObject:v7];
  uint64_t v8 = [(BRCSyncUpOperationBuilder *)self defaults];
  [v8 syncUpDocumentDeleteCost];
  float v10 = v9;

  return v10;
}

- (float)addEditOfSymlink:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 isDeadOrMissingInServerTruth];
  uint64_t v6 = [(BRCSyncUpOperationBuilder *)self shouldPCSChainStatusForItem:v4];
  BOOL v7 = [(BRCSyncUpOperationBuilder *)self op];
  uint64_t v8 = [v7 stageID];
  float v9 = [(BRCSyncUpOperationBuilder *)self _generateSaltGetterBlock];
  float v10 = [v4 structureRecordBeingDeadInServerTruth:v5 stageID:v8 shouldPCSChainStatus:v6 saltGetter:v9 childBasehashSaltGetter:0];

  if (v10)
  {
    BOOL v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if ((v6 & 0x2C) != 0) {
        int v21 = "pcs chained ";
      }
      else {
        int v21 = "";
      }
      uint64_t v22 = [v10 description];
      float v23 = (void *)v22;
      uint64_t v24 = "\n(dead in server truth)";
      int v25 = 136315906;
      uint64_t v26 = v21;
      if (!v5) {
        uint64_t v24 = "";
      }
      __int16 v27 = 2112;
      uint64_t v28 = v22;
      __int16 v29 = 2080;
      int v30 = v24;
      __int16 v31 = 2112;
      uint64_t v32 = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %ssymlink record %@%s%@", (uint8_t *)&v25, 0x2Au);
    }
    int v13 = [(BRCSyncUpOperationBuilder *)self op];
    char v14 = [v13 recordsToSave];
    [v14 addObject:v10];

    if ([v4 isFromInitialScan])
    {
      float v15 = [(BRCSyncUpOperationBuilder *)self defaults];
      [v15 syncUpInitialItemCost];
    }
    else
    {
      int v18 = [v4 isKnownByServer];
      id v19 = [(BRCSyncUpOperationBuilder *)self defaults];
      float v15 = v19;
      if (v18) {
        [v19 syncUpStructureEditCost];
      }
      else {
        [v19 syncUpStructureCreateCost];
      }
    }
    float v17 = v16;
  }
  else
  {
    float v17 = -1.0;
  }

  return v17;
}

- (float)addItem:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 appLibrary];

  if (!v5)
  {
    id v19 = +[BRCAutoBugCaptureReporter sharedABCReporter];
    [v19 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"SyncUp" withContext:@"AppLibrary is nil"];

    int v20 = [(BRCSyncUpOperationBuilder *)self session];
    int v21 = [v20 analyticsReporter];
    [v21 aggregateReportForAppTelemetryIdentifier:216 error:0];

    float v6 = -1.0;
    goto LABEL_18;
  }
  [(BRCSyncUpOperationBuilder *)self prepareAppLibraryRootSyncUpForItem:v4];
  float v6 = -1.0;
  if ([(BRCSyncUpOperationBuilder *)self checkIfSyncAllowedInSharedZoneForItem:v4]&& ![(BRCSyncUpOperationBuilder *)self _checkIfShouldDedicateOpToSaltingBasehashItem:v4]&& ![(BRCSyncUpOperationBuilder *)self _checkIfShouldDedicateOpToPCSChainingItem:v4])
  {
    BOOL v7 = [(BRCSyncUpOperationBuilder *)self op];
    uint64_t v8 = [v7 serverZone];
    float v9 = [v8 mangledID];
    float v10 = +[BRCUserDefaults defaultsForMangledID:v9];
    int v11 = [v10 preventRecordSyncWithoutDiffs];

    if (!v11) {
      goto LABEL_10;
    }
    uint64_t v12 = [v4 clientZone];
    int v13 = [v4 itemID];
    char v14 = [v12 serverItemByItemID:v13];

    if (!v14
      || (uint64_t v15 = [v4 diffAgainstServerItem:v14],
          ([v4 metadataSyncUpMask:1] & v15) != 0)
      || ([v4 forceNeedsSyncUpWithoutDiffs] & 1) != 0)
    {

LABEL_10:
      if ([v4 isDead])
      {
        if ([v4 isDeadOrMissingInServerTruth])
        {
          if ([v4 isSharedToMeTopLevelItem])
          {
            float v16 = [v4 asSharedToMeTopLevelItem];
            [v16 insertTombstoneAliasRecordInZone:0];
          }
          float v17 = brc_bread_crumbs();
          int v18 = brc_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[BRCSyncUpOperationBuilder addItem:]();
          }

          [v4 markNeedsDeleteWhenAlreadyDeadInServerTruth];
          [v4 saveToDB];
          goto LABEL_18;
        }
        uint64_t v46 = 0;
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder addItem:]", 1156, &v46);
        __int16 v27 = brc_bread_crumbs();
        uint64_t v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v42 = v46;
          char v43 = [v4 st];
          int v44 = BRCPrettyPrintEnumWithContext((int)[v43 type], (uint64_t)&brc_item_type_pretty_entries, 0);
          *(_DWORD *)buf = 134218754;
          uint64_t v50 = v42;
          __int16 v51 = 2112;
          id v52 = v44;
          __int16 v53 = 2112;
          id v54 = v4;
          __int16 v55 = 2112;
          v56 = v27;
          _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Deleting %@ record for %@%@", buf, 0x2Au);
        }
        if ([v4 isSharedToMeTopLevelItem])
        {
          __int16 v29 = [v4 asSharedToMeTopLevelItem];
          [(BRCSyncUpOperationBuilder *)self addDeletionOfSharedTopLevelItem:v29];
        }
        else if ([v4 isFinderBookmark])
        {
          __int16 v29 = [v4 asFinderBookmark];
          [(BRCSyncUpOperationBuilder *)self addDeletionOfFinderBookmark:v29];
        }
        else if ([v4 isDocument])
        {
          __int16 v29 = [v4 asDocument];
          [(BRCSyncUpOperationBuilder *)self addDeletionOfDocument:v29];
        }
        else if ([v4 isDirectory])
        {
          __int16 v29 = [v4 asDirectory];
          [(BRCSyncUpOperationBuilder *)self addDeletionOfDirectory:v29];
        }
        else
        {
          if (![v4 isBRAlias])
          {
            [(BRCSyncUpOperationBuilder *)self addDeletionOfItem:v4];
            float v6 = v45;
            goto LABEL_49;
          }
          __int16 v29 = [v4 asBRAlias];
          [(BRCSyncUpOperationBuilder *)self addDeletionOfAlias:v29];
        }
        float v6 = v30;

LABEL_49:
        __brc_leave_section(&v46);
LABEL_50:
        if (v6 >= 0.0)
        {
          int v39 = [(BRCSyncUpOperationBuilder *)self op];
          int v40 = [v39 serverZone];
          [v4 prepareForSyncUpInZone:v40];
        }
        goto LABEL_18;
      }
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder addItem:]", 1172, &v46);
      float v23 = brc_bread_crumbs();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v36 = v46;
        int v37 = [v4 itemID];
        int v38 = [v37 debugItemIDString];
        *(_DWORD *)buf = 134218498;
        uint64_t v50 = v36;
        __int16 v51 = 2112;
        id v52 = v38;
        __int16 v53 = 2112;
        id v54 = v23;
        _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx preparing sync-up of %@%@", buf, 0x20u);
      }
      if ([v4 isSharedToMeTopLevelItem])
      {
        int v25 = [v4 asSharedToMeTopLevelItem];
        [(BRCSyncUpOperationBuilder *)self addEditOfSharedTopLevelItem:v25];
      }
      else if ([v4 isFinderBookmark])
      {
        int v25 = [v4 asFinderBookmark];
        [(BRCSyncUpOperationBuilder *)self addEditOfFinderBookmark:v25];
      }
      else if ([v4 isSymLink])
      {
        int v25 = [v4 asSymlink];
        [(BRCSyncUpOperationBuilder *)self addEditOfSymlink:v25];
      }
      else if ([v4 isDocument])
      {
        int v25 = [v4 asDocument];
        [(BRCSyncUpOperationBuilder *)self addEditOfDocument:v25];
      }
      else
      {
        if (![v4 isDirectory])
        {
          int v25 = brc_bread_crumbs();
          int v41 = brc_default_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
            -[BRCSyncUpOperationBuilder addItem:]();
          }

          float v6 = 0.0;
          goto LABEL_45;
        }
        int v25 = [v4 asDirectory];
        [(BRCSyncUpOperationBuilder *)self addEditOfDirectory:v25];
      }
      float v6 = v26;
LABEL_45:

      __brc_leave_section(&v46);
      goto LABEL_50;
    }
    __int16 v31 = brc_bread_crumbs();
    uint64_t v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v50 = (uint64_t)v4;
      __int16 v51 = 2112;
      id v52 = v14;
      __int16 v53 = 2112;
      id v54 = v31;
      _os_log_impl(&dword_1D353B000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Faking sync for item because it doesn't have field differences with the server item %@ vs %@%@", buf, 0x20u);
    }

    uint64_t v33 = [(BRCSyncUpOperationBuilder *)self op];
    float v34 = [v33 serverZone];
    [(BRCSyncUpOperationBuilder *)self fakeSyncForItem:v4 serverItem:v14 inZone:v34];
    float v6 = v35;
  }
LABEL_18:

  return v6;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BRCSyncUpOperation)op
{
  return self->_op;
}

- (void)setOp:(id)a3
{
}

- (BRCUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (BRCLocalItem)itemNeedingPCSChaining
{
  return self->_itemNeedingPCSChaining;
}

- (BRCDirectoryItem)itemNeedingBasehashSalting
{
  return self->_itemNeedingBasehashSalting;
}

- (NSData)rootChildBasehashSalt
{
  return self->_rootChildBasehashSalt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemNeedingBasehashSalting, 0);
  objc_storeStrong((id *)&self->_itemNeedingPCSChaining, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_op, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_rootChildBasehashSalt, 0);
  objc_storeStrong((id *)&self->_parentItemIDToChildBasehashSalt, 0);
  objc_storeStrong((id *)&self->_halfChainedParentIDWhitelist, 0);
  objc_storeStrong((id *)&self->_fullyChainedParentIDWhitelist, 0);
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _parentItemIDToChildBasehashSalt[item.itemID] == nil%@", v2, v3, v4, v5, v6);
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 debugItemIDString];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] Sync: Dedicating sync op to metadata salting %@%@", v4, v5, v6, v7, v8);
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _parentItemIDToChildBasehashSalt[parentItemID] == nil%@", v2, v3, v4, v5, v6);
}

- (void)_checkIfShouldDedicateOpToPCSChainingItem:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 itemID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] Sync: Dedicating sync op to pcs chaining %@%@", v4, v5, v6, v7, v8);
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Not allowing re-creation of shared to me top level item when the item is dead in the server truth%@", v2, v3, v4, v5, v6);
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Waiting on server full sync before we fake sync shared to me top level item which is missing in the server truth%@", v2, v3, v4, v5, v6);
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] shared document is read-only, do not sync%@", v2, v3, v4, v5, v6);
}

- (void)addDeletionOfItem:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !item.isSharedToMeTopLevelItem%@", v2, v3, v4, v5, v6);
}

- (void)_getSaltForItem:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: parentItemID != nil%@", v2, v3, v4, v5, v6);
}

- (void)addEditOfSharedTopLevelItem:.cold.1()
{
  v0 = [0 description];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Fake syncing up shared folder record %@%@", v3, v4, v5, v6, v7);
}

- (void)addEditOfSharedTopLevelItem:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: unsupported top level item kind%@", v2, v3, v4, v5, v6);
}

- (void)addDeletionOfSharedTopLevelItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Deleting alias in private zone %@%@");
}

- (void)prepareAppLibraryRootSyncUpForItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Syncing up root app library record %@%@");
}

- (void)fakeSyncForItem:serverItem:inZone:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: We should never fake sync for an item being copied to a new zone that isn't a fault: %@%@");
}

- (void)fakeSyncForItem:serverItem:inZone:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Also faking sync in side car for child item not known to the server %@%@");
}

- (void)handleEditOfSharedItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Unsharing %@%@");
}

- (void)handleEditOfSharedItem:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Editing name on shareID %@%@");
}

- (void)addEditOfDirectory:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: record.encryptedValues[kBRRecordKeyChildBasehashSalt]%@", v2, v3, v4, v5, v6);
}

- (void)addEditOfDocument:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] re-uploading uploaded record: %@%@", v1, 0x16u);
}

- (void)addEditOfDocument:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] forcing upload of %@\n(dead in server truth)%@");
}

- (void)addEditOfDocument:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] reverting to server item because we can't reupload a fault for %@%@");
}

- (void)addEditOfDocument:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: package with no uploaded content - %@%@");
}

- (void)addEditOfDocument:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: File with no content signature - %@%@");
}

- (void)addEditOfDocument:.cold.6()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] thumbnail not found.  Force upload again%@", v1, 0xCu);
}

- (void)addEditOfDocument:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] will pcs chain records%@", v2, v3, v4, v5, v6);
}

- (void)addEditOfDocument:.cold.8()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] shared document is read-only, do not sync its version%@", v2, v3, v4, v5, v6);
}

- (void)addEditOfDocument:.cold.9()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] We need to update sharing info for this reset item%@", v2, v3, v4, v5, v6);
}

- (void)addItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Deleting dead record already dead in the server truth %@%@");
}

- (void)addItem:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: asked to syncup an unkown item type: %@%@");
}

@end