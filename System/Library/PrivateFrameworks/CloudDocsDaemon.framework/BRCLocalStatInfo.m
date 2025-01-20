@interface BRCLocalStatInfo
+ (char)_modeFromRelativePath:(id)a3 isPackageFault:(BOOL)a4;
+ (id)_finderTagsFromRelativePath:(id)a3;
- (BOOL)checkStateWithItemID:(id)a3 logToFile:(__sFILE *)a4;
- (BRCGenerationID)generationID;
- (BRCLocalStatInfo)initWithLocalStatInfo:(id)a3;
- (BRCLocalStatInfo)initWithRelativePath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5;
- (NSNumber)documentID;
- (NSNumber)fileID;
- (NSNumber)lostStamp;
- (NSNumber)processingStamp;
- (NSNumber)stagedFileID;
- (NSNumber)stagedFileIDForDB;
- (NSNumber)tmpBouncedNo;
- (NSString)filename;
- (NSString)logicalNameWithoutLocalBounce;
- (NSString)physicalName;
- (NSString)rawBouncedLogicalName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithContext:(id)a3 origName:(id)a4;
- (id)initAsShareAcceptFaultWithName:(id)a3 mode:(char)a4 isDirectory:(BOOL)a5;
- (id)initFromResultSet:(id)a3 pos:(int)a4;
- (id)logicalName;
- (unint64_t)diffAgainstLocalInfo:(id)a3;
- (unsigned)itemScope;
- (unsigned)stagedGenerationID;
- (void)_bouncePhysicalNameToRepresentableName;
- (void)_clearFileID;
- (void)_clearGenerationID;
- (void)_clearTmpBouncedNumber;
- (void)_generatedBouncedLogicalFilenameWithBounceNumber:(unint64_t)a3;
- (void)_markAlmostDead;
- (void)_markClearedFromStage;
- (void)_markDead;
- (void)_markDeadAsSharedTopLevelItemWithDocumentsItemID:(id)a3;
- (void)_markFound;
- (void)_markLiveFromStageAsFault:(BOOL)a3;
- (void)_markLiveFromStageAsType:(char)a3;
- (void)_markLostAddingBackoffWithMode:(unsigned __int8)a3 appLibrary:(id)a4;
- (void)_markReserved;
- (void)_markStagedWithFileID:(id)a3 generationID:(unsigned int)a4 documentID:(id)a5;
- (void)_migrateTmpBouncedNameToLocalName;
- (void)_moveItemAsideWithUUIDString;
- (void)_setCKInfo:(id)a3;
- (void)_setItemScope:(unsigned __int8)a3;
- (void)_setParentID:(id)a3;
- (void)_updateMetadataFromFSAtPath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5 isPackageFault:(BOOL)a6 readonlyShareChild:(BOOL)a7;
- (void)_updateStatMeta:(id)a3;
- (void)itemScope;
- (void)setFilename:(id)a3;
- (void)setFilename:(id)a3 forcePhysicalName:(id)a4 forceBouncedLogicalName:(id)a5 serverName:(id)a6;
- (void)setItemScope:(unsigned __int8)a3;
- (void)setRawBouncedLogicalName:(id)a3;
- (void)updateFilenameFromPath:(id)a3;
- (void)updateFromFSAtPath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5 isPackageFault:(BOOL)a6 readonlyShareChild:(BOOL)a7;
- (void)updateLocationAndMetaFromFSAtPath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5 isPackageFault:(BOOL)a6 readonlyShareChild:(BOOL)a7;
@end

@implementation BRCLocalStatInfo

- (void)_clearFileID
{
  fileID = self->_fileID;
  self->_fileID = 0;

  generationID = self->_generationID;
  self->_generationID = 0;
}

- (void)_clearGenerationID
{
  generationID = self->_generationID;
  self->_generationID = 0;
}

- (void)_markAlmostDead
{
  if ((~self->super._state & 0xFD) != 0)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo(LegacyAdditions) _markAlmostDead]();
    }
  }
  self->super._state = -3;
  fileID = self->_fileID;
  self->_fileID = 0;

  generationID = self->_generationID;
  self->_generationID = 0;
}

- (void)_markFound
{
  unsigned int type = self->super._type;
  BOOL v4 = type > 0xA;
  int v5 = (1 << type) & 0x611;
  if (v4 || v5 == 0)
  {
    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo(LegacyAdditions) _markFound]();
    }
  }
  if (self->super._state != 255)
  {
    v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo(LegacyAdditions) _markFound]();
    }
  }
  self->super._state = 0;
}

- (NSNumber)lostStamp
{
  if ((self->super._state | 2) == 0xFF) {
    v2 = self->_processingStamp;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)_markLostAddingBackoffWithMode:(unsigned __int8)a3 appLibrary:(id)a4
{
  int v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int state = self->super._state;
  if (self->super._state && state != 253 && state != 255)
  {
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v15 = BRCPrettyPrintEnumWithContext(self->super._state, (uint64_t)&brc_item_state_pretty_entries, 0);
      int v18 = 138412802;
      v19 = v15;
      __int16 v20 = 2112;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v8;
      _os_log_fault_impl(&dword_1D353B000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unexpected state %@ for item %@%@", (uint8_t *)&v18, 0x20u);
    }
  }
  if (v4 == 1) {
    BOOL v10 = self->super._state == 0;
  }
  else {
    BOOL v10 = v4 == 2;
  }
  uint64_t v11 = v10;
  uint64_t v12 = [v6 allocateLostStampAddingBackoff:v11];
  if (!v12)
  {
    v16 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo(LegacyAdditions) _markLostAddingBackoffWithMode:appLibrary:]();
    }
  }
  if (self->super._state != 253) {
    self->super._int state = -1;
  }
  v13 = [NSNumber numberWithUnsignedLongLong:v12];
  processingStamp = self->_processingStamp;
  self->_processingStamp = v13;
}

+ (id)_finderTagsFromRelativePath:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 hasFinderTags])
  {
    id v7 = 0;
    id v6 = 0;
    goto LABEL_15;
  }
  int v4 = [v3 physicalURL];
  id v23 = 0;
  id v24 = 0;
  char v5 = objc_msgSend(v4, "br_getTagNames:error:", &v24, &v23);
  id v6 = v24;
  id v7 = v23;

  if ((v5 & 1) == 0)
  {
    brc_bread_crumbs();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
      +[BRCLocalStatInfo(LegacyAdditions) _finderTagsFromRelativePath:]();
    }

    BOOL v10 = 0;
    goto LABEL_19;
  }
  if (![v6 count])
  {
LABEL_15:
    BOOL v10 = 0;
    goto LABEL_20;
  }
  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[BRCLocalStatInfo(LegacyAdditions) _finderTagsFromRelativePath:]();
  }

  BOOL v10 = objc_alloc_init(BRFieldFinderTags);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        -[BRFieldFinderTags addTags:](v10, "addTags:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v13);
  }
LABEL_19:

LABEL_20:
  v17 = [(BRFieldFinderTags *)v10 data];

  return v17;
}

+ (char)_modeFromRelativePath:(id)a3 isPackageFault:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  char v6 = [v5 isWritable];
  if ([v5 isExecutable]
    && [v5 isFile]
    && ([v5 isFault] & v4) == 0)
  {
    v6 |= 2u;
  }

  return v6;
}

- (void)_updateMetadataFromFSAtPath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5 isPackageFault:(BOOL)a6 readonlyShareChild:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a5;
  unsigned int type = self->super._type;
  BOOL v14 = type > 0xA;
  int v15 = (1 << type) & 0x611;
  if (v14 || v15 == 0)
  {
    p_int state = &self->super._state;
    goto LABEL_8;
  }
  p_int state = &self->super._state;
  if (self->super._state != 255) {
LABEL_8:
  }
    *p_int state = 0;
  processingStamp = self->_processingStamp;
  self->_processingStamp = 0;

  if (v12)
  {
    long long v19 = [v12 itemID];
    parentID = self->super._parentID;
    self->super._parentID = v19;
  }
  if (!self->super._birthtime || ([v11 isFault] & 1) == 0) {
    self->super._birthtime = [v11 birthTime];
  }
  self->_itemScope = [v11 itemScope];
  unsigned int v21 = self->super._type;
  if (v21 > 8 || ((1 << v21) & 0x184) == 0)
  {
    id v23 = [v11 filename];
    [(BRCLocalStatInfo *)self setFilename:v23];

    self->super._hiddenExt = [v11 isHiddenExtension];
    unsigned int v21 = self->super._type;
  }
  if (v21 == 3)
  {
    if (!self->super._aliasTarget)
    {
      id v24 = [v11 bookmark];
      v25 = [v24 target];

      uint64_t v26 = [v25 clientZone];
      v27 = [v26 mangledID];
      v28 = [v27 aliasTargetContainerString];

      v29 = [v25 itemID];
      v30 = [v29 itemIDString];

      v31 = [v28 stringByAppendingPathComponent:v30];
      aliasTarget = self->super._aliasTarget;
      self->super._aliasTarget = v31;
    }
  }
  else
  {
    uint64_t v33 = +[BRCLocalStatInfo _finderTagsFromRelativePath:v11];
    v34 = (NSData *)v33;
    if (self->super._finderTags) {
      BOOL v35 = v33 == 0;
    }
    else {
      BOOL v35 = 0;
    }
    if (v35)
    {
      v36 = brc_bread_crumbs();
      v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalStatInfo(LegacyAdditions) _updateMetadataFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:]();
      }
    }
    finderTags = self->super._finderTags;
    self->super._finderTags = v34;
    v39 = v34;

    char v40 = +[BRCLocalStatInfo _modeFromRelativePath:v11 isPackageFault:v8];
    if (v7) {
      v40 |= self->super._mode & 1;
    }
    self->super._mode = v40;
    v41 = [(BRFieldCKInfo *)self->super._ckInfo etag];

    if (!v41)
    {
      v42 = [(BRCStatInfo *)self creatorRowID];

      if (!v42) {
        [(BRCStatInfo *)self setCreatorRowID:&unk_1F2B26D48];
      }
    }
  }
}

- (void)updateFromFSAtPath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5 isPackageFault:(BOOL)a6 readonlyShareChild:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([v12 isUnixDir] && (objc_msgSend(v12, "isExecutable") & 1) == 0)
  {
    int v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412546;
      id v30 = v12;
      __int16 v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Inaccessible folder %@%@", (uint8_t *)&v29, 0x16u);
    }
  }
  [(BRCLocalStatInfo *)self _updateMetadataFromFSAtPath:v12 itemID:v13 parentGlobalID:v14 isPackageFault:v8 readonlyShareChild:v7];
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "fileID"));
  v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fileID = self->_fileID;
  self->_fileID = v17;

  long long v19 = [v12 generationID];
  generationID = self->_generationID;
  self->_generationID = v19;

  unsigned int type = self->super._type;
  BOOL v22 = type > 8;
  int v23 = (1 << type) & 0x1C6;
  if (v22 || v23 == 0)
  {
    documentID = self->_documentID;
    self->_documentID = 0;
  }
  else
  {
    if (([v12 isDocument] & 1) == 0)
    {
      v27 = brc_bread_crumbs();
      v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalStatInfo(LegacyAdditions) updateFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:]();
      }
    }
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v12, "documentID"));
    v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    documentID = self->_documentID;
    self->_documentID = v25;
  }
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BRCLocalStatInfo;
  id v7 = [(BRCStatInfo *)&v26 initFromResultSet:v6 pos:v4];
  if (v7)
  {
    uint64_t v8 = [v6 numberAtIndex:(v4 + 16)];
    v9 = (void *)*((void *)v7 + 18);
    *((void *)v7 + 18) = v8;

    uint64_t v10 = [v6 numberAtIndex:(v4 + 17)];
    id v11 = (void *)*((void *)v7 + 16);
    *((void *)v7 + 16) = v10;

    uint64_t v12 = [v6 objectOfClass:objc_opt_class() atIndex:(v4 + 18)];
    id v13 = (void *)*((void *)v7 + 17);
    *((void *)v7 + 17) = v12;

    uint64_t v14 = [v6 stringAtIndex:(v4 + 19)];
    int v15 = (void *)*((void *)v7 + 20);
    *((void *)v7 + 20) = v14;

    uint64_t v16 = [v6 numberAtIndex:(v4 + 20)];
    v17 = (void *)*((void *)v7 + 25);
    *((void *)v7 + 25) = v16;

    uint64_t v18 = [v6 numberAtIndex:(v4 + 21)];
    long long v19 = (void *)*((void *)v7 + 21);
    *((void *)v7 + 21) = v18;

    if (*((void *)v7 + 16) && objc_msgSend(*((id *)v7 + 21), "br_isEqualToNumber:"))
    {
      long long v20 = (void *)*((void *)v7 + 21);
      *((void *)v7 + 21) = &unk_1F2B26D48;
    }
    *((_DWORD *)v7 + 44) = [v6 unsignedIntAtIndex:(v4 + 22)];
    uint64_t v21 = [v6 stringAtIndex:(v4 + 23)];
    BOOL v22 = (void *)*((void *)v7 + 23);
    *((void *)v7 + 23) = v21;

    *((unsigned char *)v7 + 192) = [v6 intAtIndex:(v4 + 24)];
    uint64_t v23 = [v6 numberAtIndex:(v4 + 25)];
    id v24 = (void *)*((void *)v7 + 19);
    *((void *)v7 + 19) = v23;
  }
  return v7;
}

- (BRCLocalStatInfo)initWithLocalStatInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCLocalStatInfo;
  id v5 = [(BRCStatInfo *)&v8 initWithStatInfo:v4];
  id v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_documentID, *((id *)v4 + 18));
    objc_storeStrong((id *)&v6->_fileID, *((id *)v4 + 16));
    objc_storeStrong((id *)&v6->_generationID, *((id *)v4 + 17));
    objc_storeStrong((id *)&v6->_stagedFileID, *((id *)v4 + 21));
    v6->_stagedGenerationID = *((_DWORD *)v4 + 44);
    objc_storeStrong((id *)&v6->_physicalName, *((id *)v4 + 20));
    objc_storeStrong((id *)&v6->_processingStamp, *((id *)v4 + 25));
    objc_storeStrong((id *)&v6->_tmpBouncedNo, *((id *)v4 + 19));
    v6->_itemScope = *((unsigned char *)v4 + 192);
    objc_storeStrong((id *)&v6->_bouncedLogicalName, *((id *)v4 + 23));
  }

  return v6;
}

- (BRCLocalStatInfo)initWithRelativePath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BRCLocalStatInfo;
  id v11 = [(BRCLocalStatInfo *)&v18 init];
  uint64_t v12 = v11;
  if (!v11) {
    goto LABEL_18;
  }
  v11->super._int state = 0;
  if (![v8 isFault])
  {
    if ([v8 isSymLink])
    {
      char v16 = 5;
    }
    else if ([v8 isBRAlias])
    {
      char v16 = 3;
    }
    else if ([v8 isFinderAlias])
    {
      char v16 = 6;
    }
    else if ([v8 isDocument])
    {
      char v16 = 1;
    }
    else
    {
      if ([v8 type] != 3)
      {
LABEL_17:
        [(BRCLocalStatInfo *)v12 updateFromFSAtPath:v8 itemID:v9 parentGlobalID:v10 isPackageFault:0 readonlyShareChild:0];
LABEL_18:
        int v15 = v12;
        goto LABEL_19;
      }
      char v16 = 4;
    }
    v12->super._unsigned int type = v16;
    goto LABEL_17;
  }
  id v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalStatInfo(LegacyAdditions) initWithRelativePath:itemID:parentGlobalID:]();
  }

  int v15 = 0;
LABEL_19:

  return v15;
}

- (void)updateLocationAndMetaFromFSAtPath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5 isPackageFault:(BOOL)a6 readonlyShareChild:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  documentID = self->_documentID;
  if (documentID)
  {
    uint64_t v16 = [(NSNumber *)documentID unsignedLongLongValue];
    if (v16 != [v12 documentID])
    {
      v51 = brc_bread_crumbs();
      v52 = brc_default_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.7();
      }
    }
  }
  [(BRCLocalStatInfo *)self _updateMetadataFromFSAtPath:v12 itemID:v13 parentGlobalID:v14 isPackageFault:v8 readonlyShareChild:v7];
  int v17 = [v12 isFault];
  unsigned int type = self->super._type;
  BOOL v19 = type > 8;
  int v20 = (1 << type) & 0x184;
  BOOL v21 = v19 || v20 == 0;
  if (v17)
  {
    if (v21)
    {
      BOOL v35 = brc_bread_crumbs();
      v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:]();
      }
    }
    v37 = [v12 filename];
    physicalName = self->_physicalName;
    self->_physicalName = v37;

    unint64_t v39 = [(NSNumber *)self->_fileID unsignedLongLongValue];
    if (v39 != [v12 fileID])
    {
      char v40 = [v12 logicalName];
      objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "fileID"));
      v41 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      fileID = self->_fileID;
      self->_fileID = v41;

      if (v40)
      {
        v43 = [(BRCLocalStatInfo *)self logicalName];
        char v44 = [v40 isEqualToString:v43];

        if ((v44 & 1) == 0)
        {
          v45 = brc_bread_crumbs();
          v46 = brc_default_log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            logicalName = self->super._logicalName;
            int v60 = 138412802;
            v61 = (BRCLocalStatInfo *)logicalName;
            __int16 v62 = 2112;
            id v63 = v40;
            __int16 v64 = 2112;
            v65 = v45;
            _os_log_debug_impl(&dword_1D353B000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Fault was renamed from %@ to %@%@", (uint8_t *)&v60, 0x20u);
          }

          objc_storeStrong((id *)&self->super._logicalName, v40);
          bouncedLogicalName = self->_bouncedLogicalName;
          self->_bouncedLogicalName = 0;

          tmpBouncedNo = self->_tmpBouncedNo;
          self->_tmpBouncedNo = 0;
        }
      }
    }
    v49 = [v12 generationID];
    generationID = self->_generationID;
    self->_generationID = v49;
  }
  else if (!v21)
  {
    if (([v12 isDocument] & 1) == 0 && (objc_msgSend(v12, "isFinderAlias") & 1) == 0)
    {
      v53 = brc_bread_crumbs();
      v54 = brc_default_log();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.6();
      }
    }
    uint64_t v22 = [v12 fileID];
    if (v22 == [(NSNumber *)self->_fileID unsignedLongLongValue])
    {
      uint64_t v23 = brc_bread_crumbs();
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        int v60 = 138412802;
        v61 = self;
        __int16 v62 = 2112;
        id v63 = v12;
        __int16 v64 = 2112;
        v65 = v23;
        _os_log_fault_impl(&dword_1D353B000, v24, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We think we are no longer a fault, but we have the same fileID for\n%@\n%@%@", (uint8_t *)&v60, 0x20u);
      }
    }
    else
    {
      int v25 = [v12 isFinderAlias];
      int v26 = self->super._type;
      if (v25)
      {
        if (v26 != 7)
        {
          v55 = brc_bread_crumbs();
          v56 = brc_default_log();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
            -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:]();
          }
        }
        v27 = brc_bread_crumbs();
        v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:]();
        }

        self->super._unsigned int type = 6;
      }
      else
      {
        if (v26 != 2)
        {
          v57 = brc_bread_crumbs();
          v58 = brc_default_log();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
            -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.5();
          }
        }
        int v29 = brc_bread_crumbs();
        id v30 = brc_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.4();
        }

        self->super._unsigned int type = 1;
      }
    }
  }
  unint64_t v31 = [(NSNumber *)self->_fileID unsignedLongLongValue];
  if (v31 != [v12 fileID])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "fileID"));
    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = self->_fileID;
    self->_fileID = v32;

    v34 = self->_generationID;
    self->_generationID = 0;
  }
}

- (void)updateFilenameFromPath:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isFault]) {
    [v4 logicalName];
  }
  else {
  id v5 = [v4 filename];
  }
  if (!v5)
  {
    generationID = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412546;
      id v24 = v4;
      __int16 v25 = 2112;
      int v26 = generationID;
      _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] No logical name for %@%@", (uint8_t *)&v23, 0x16u);
    }

    goto LABEL_17;
  }
  id v6 = [(BRCLocalStatInfo *)self logicalName];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    BOOL v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412546;
      id v24 = v5;
      __int16 v25 = 2112;
      int v26 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Updating filename during CZM processing to %@%@", (uint8_t *)&v23, 0x16u);
    }

    bouncedLogicalName = self->_bouncedLogicalName;
    self->_bouncedLogicalName = 0;

    tmpBouncedNo = self->_tmpBouncedNo;
    self->_tmpBouncedNo = 0;

    objc_storeStrong((id *)&self->super._logicalName, v5);
    if ([v4 isFault])
    {
      unsigned int type = self->super._type;
      BOOL v13 = type > 8;
      int v14 = (1 << type) & 0x184;
      if (!v13 && v14 != 0)
      {
        uint64_t v16 = [v4 filename];
        physicalName = self->_physicalName;
        self->_physicalName = v16;

        objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "fileID"));
        objc_super v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        fileID = self->_fileID;
        self->_fileID = v18;

        int v20 = [v4 generationID];
        generationID = self->_generationID;
        self->_generationID = v20;
LABEL_17:
      }
    }
  }
}

- (void)_markReserved
{
  fileID = self->_fileID;
  self->_fileID = 0;

  generationID = self->_generationID;
  self->_generationID = 0;

  objc_storeStrong((id *)&self->_physicalName, self->_bouncedLogicalName);
  if (!self->_stagedFileID)
  {
    documentID = self->_documentID;
    self->_documentID = 0;
  }
  self->super._int state = -2;
}

- (void)_markLiveFromStageAsType:(char)a3
{
  unsigned int v3 = a3;
  if (!self->_stagedFileID)
  {
    BOOL v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:].cold.6();
    }
  }
  if (self->super._type != 5 && !self->_stagedGenerationID)
  {
    int v23 = brc_bread_crumbs();
    id v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:].cold.5();
    }
  }
  unsigned int state = self->super._state;
  if (state > 0xFD)
  {
    if (state != 255)
    {
      if (state == 254 && !self->_fileID && !self->_generationID) {
        goto LABEL_18;
      }
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (!self->super._state || state == 253)
  {
LABEL_13:
    if (self->_fileID && self->_generationID) {
      goto LABEL_18;
    }
  }
LABEL_15:
  id v6 = brc_bread_crumbs();
  char v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:].cold.4();
  }

LABEL_18:
  objc_storeStrong((id *)&self->_fileID, self->_stagedFileID);
  BOOL v8 = [[BRCGenerationID alloc] initWithFSGenerationID:self->_stagedGenerationID];
  generationID = self->_generationID;
  self->_generationID = v8;

  stagedFileID = self->_stagedFileID;
  self->_stagedFileID = 0;

  self->_stagedGenerationID = 0;
  self->super._unsigned int state = 0;
  processingStamp = self->_processingStamp;
  self->_processingStamp = 0;

  if (v3 <= 8 && ((1 << v3) & 0x184) != 0)
  {
    unsigned int type = self->super._type;
    if (type <= 0xA && ((1 << type) & 0x611) != 0)
    {
      BOOL v13 = brc_bread_crumbs();
      int v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:]();
      }

      unsigned int type = self->super._type;
    }
    if (type > 8 || ((1 << type) & 0x184) == 0)
    {
      int v15 = [(BRCLocalStatInfo *)self logicalName];
      objc_msgSend(v15, "br_sideFaultName");
      uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      physicalName = self->_physicalName;
      self->_physicalName = v16;
    }
    if (([(NSString *)self->_physicalName br_isSideFaultName] & 1) == 0)
    {
      objc_super v18 = brc_bread_crumbs();
      BOOL v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:]();
      }
LABEL_44:
    }
  }
  else
  {
    unsigned int v20 = self->super._type;
    if (v20 <= 8 && ((1 << v20) & 0x184) != 0) {
      objc_storeStrong((id *)&self->_physicalName, self->_bouncedLogicalName);
    }
    if ([(NSString *)self->_physicalName br_isSideFaultName])
    {
      objc_super v18 = brc_bread_crumbs();
      BOOL v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:]();
      }
      goto LABEL_44;
    }
  }
  self->super._unsigned int type = v3;
}

- (void)_markLiveFromStageAsFault:(BOOL)a3
{
  LODWORD(v4) = self->super._type;
  if (!a3)
  {
    char v7 = v4 - 2;
    if ((v4 - 2) >= 9 || ((0x161u >> v7) & 1) == 0) {
      goto LABEL_12;
    }
    uint64_t v4 = v7;
    BOOL v8 = &unk_1D38874DA;
LABEL_11:
    LOBYTE(v4) = v8[v4];
    goto LABEL_12;
  }
  LODWORD(v4) = v4 - 1;
  if v4 < 0xA && ((0x2E3u >> v4))
  {
    uint64_t v4 = (char)v4;
    BOOL v8 = &unk_1D38874D0;
    goto LABEL_11;
  }
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsFault:]();
  }

  LOBYTE(v4) = 2;
LABEL_12:
  [(BRCLocalStatInfo *)self _markLiveFromStageAsType:(char)v4];
}

- (void)_setParentID:(id)a3
{
}

- (void)_generatedBouncedLogicalFilenameWithBounceNumber:(unint64_t)a3
{
  if (self->super._type == 3)
  {
    char v7 = brc_bread_crumbs();
    BOOL v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo(LegacyAdditions) _generatedBouncedLogicalFilenameWithBounceNumber:]();
    }
  }
  if (a3 <= 1)
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo(LegacyAdditions) _generatedBouncedLogicalFilenameWithBounceNumber:]();
    }
  }
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  tmpBouncedNo = self->_tmpBouncedNo;
  self->_tmpBouncedNo = v5;
}

- (void)_migrateTmpBouncedNameToLocalName
{
  unsigned int v3 = [(BRCStatInfo *)self representableName];
  bouncedLogicalName = self->_bouncedLogicalName;
  self->_bouncedLogicalName = v3;

  unsigned int type = self->super._type;
  BOOL v6 = type > 8;
  int v7 = (1 << type) & 0x184;
  if (v6 || v7 == 0)
  {
    int v10 = 0;
    id v9 = self->_bouncedLogicalName;
  }
  else
  {
    id v9 = [(NSString *)self->_bouncedLogicalName br_sideFaultName];
    int v10 = 1;
  }
  objc_storeStrong((id *)&self->_physicalName, v9);
  if (v10) {

  }
  tmpBouncedNo = self->_tmpBouncedNo;
  self->_tmpBouncedNo = 0;
}

- (void)_bouncePhysicalNameToRepresentableName
{
  unsigned int v3 = [(BRCStatInfo *)self representableName];
  bouncedLogicalName = self->_bouncedLogicalName;
  self->_bouncedLogicalName = v3;

  unsigned int type = self->super._type;
  BOOL v6 = type > 8;
  int v7 = (1 << type) & 0x184;
  if (v6 || v7 == 0)
  {
    int v10 = 0;
    id v9 = self->_bouncedLogicalName;
  }
  else
  {
    id v9 = [(NSString *)self->_bouncedLogicalName br_sideFaultName];
    int v10 = 1;
  }
  id v11 = v9;
  objc_storeStrong((id *)&self->_physicalName, v9);
  if (v10)
  {
  }
}

- (void)_clearTmpBouncedNumber
{
  tmpBouncedNo = self->_tmpBouncedNo;
  self->_tmpBouncedNo = 0;
}

- (void)_markClearedFromStage
{
  stagedFileID = self->_stagedFileID;
  self->_stagedFileID = 0;

  self->_stagedGenerationID = 0;
}

- (void)_markStagedWithFileID:(id)a3 generationID:(unsigned int)a4 documentID:(id)a5
{
  id v10 = a3;
  id v9 = a5;
  objc_storeStrong((id *)&self->_stagedFileID, a3);
  self->_stagedGenerationID = a4;
  if (self->super._state == 254) {
    objc_storeStrong((id *)&self->_documentID, a5);
  }
}

- (id)logicalName
{
  tmpBouncedNo = self->_tmpBouncedNo;
  bouncedLogicalName = self->_bouncedLogicalName;
  if (tmpBouncedNo)
  {
    if (!bouncedLogicalName) {
      bouncedLogicalName = self->super._logicalName;
    }
    id v11 = 0;
    id v5 = [(NSString *)bouncedLogicalName br_stringByDeletingPathBounceNo:0 andPathExtension:&v11];
    id v6 = v11;
    int v7 = NSString;
    BOOL v8 = [(NSNumber *)self->_tmpBouncedNo stringValue];
    objc_msgSend(v7, "br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v5, v8, v6, 0);
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!bouncedLogicalName) {
      bouncedLogicalName = self->super._logicalName;
    }
    id v9 = bouncedLogicalName;
  }
  return v9;
}

- (NSString)logicalNameWithoutLocalBounce
{
  return self->super._logicalName;
}

- (NSNumber)stagedFileIDForDB
{
  p_stagedFileID = &self->_stagedFileID;
  if ([(NSNumber *)self->_stagedFileID br_isEqualToNumber:&unk_1F2B26E98]) {
    p_stagedFileID = &self->_fileID;
  }
  uint64_t v4 = *p_stagedFileID;
  return v4;
}

- (unsigned)itemScope
{
  int itemScope = self->_itemScope;
  if (!itemScope)
  {
    int state = self->super._state;
    if (state != 1 && state != 254)
    {
      id v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalStatInfo itemScope]();
      }

      LOBYTE(itemScope) = self->_itemScope;
    }
  }
  return itemScope;
}

- (id)descriptionWithContext:(id)a3 origName:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCLocalStatInfo;
  int v7 = [(BRCStatInfo *)&v21 descriptionWithContext:v6 origName:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v19 = brc_bread_crumbs();
    unsigned int v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo descriptionWithContext:origName:]();
    }
  }
  if (self->_documentID) {
    [v7 appendFormat:@" doc:%@", self->_documentID];
  }
  BOOL v8 = [(BRCLocalStatInfo *)self lostStamp];
  if (v8)
  {
    brc_current_date_nsec();
    [v8 unsignedLongLongValue];
    brc_interval_from_nsec();
    id v9 = +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v6);
    [v7 appendFormat:@" lost-stamp:%@ ago", v9];
  }
  if (self->_fileID) {
    [v7 appendFormat:@" ino:%@", self->_fileID];
  }
  if (self->_generationID) {
    [v7 appendFormat:@" gen:%@", self->_generationID];
  }
  if (self->_stagedFileID) {
    [v7 appendFormat:@" s_ino:%@", self->_stagedFileID];
  }
  if (self->_stagedGenerationID) {
    objc_msgSend(v7, "appendFormat:", @" s_gen:%u", self->_stagedGenerationID);
  }
  physicalName = self->_physicalName;
  if (physicalName)
  {
    id v11 = [(NSString *)physicalName fp_obfuscatedFilename];
    [v7 appendFormat:@" pn:\"%@\"", v11];
  }
  if (self->_tmpBouncedNo) {
    [v7 appendFormat:@" tbn:\"%@\"", self->_tmpBouncedNo];
  }
  bouncedLogicalName = self->_bouncedLogicalName;
  if (bouncedLogicalName)
  {
    BOOL v13 = [(NSString *)bouncedLogicalName fp_obfuscatedFilename];
    [v7 appendFormat:@" bln:\"%@\"", v13];
  }
  if (self->super._state != 254)
  {
    int itemScope = self->_itemScope;
    int v15 = @"docs";
    uint64_t v16 = @"unknown";
    if (itemScope == 3) {
      uint64_t v16 = @"trash";
    }
    if (itemScope != 2) {
      int v15 = v16;
    }
    if (itemScope == 1) {
      int v17 = @"data";
    }
    else {
      int v17 = v15;
    }
    [v7 appendFormat:@" sc:%@", v17];
  }

  return v7;
}

- (id)description
{
  return [(BRCLocalStatInfo *)self descriptionWithContext:0 origName:0];
}

- (id)initAsShareAcceptFaultWithName:(id)a3 mode:(char)a4 isDirectory:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCLocalStatInfo;
  id v9 = [(BRCLocalStatInfo *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    v9->super._int state = 0;
    if (v5) {
      char v11 = 10;
    }
    else {
      char v11 = 8;
    }
    v9->super._unsigned int type = v11;
    v9->super._mode = a4;
    [(BRCLocalStatInfo *)v9 setFilename:v8];
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithLocalStatInfo:self];
}

- (NSString)filename
{
  if (self->_tmpBouncedNo)
  {
    unsigned int v3 = [(BRCLocalStatInfo *)self logicalName];
    uint64_t v4 = v3;
    unsigned int type = self->super._type;
    BOOL v6 = type > 8;
    int v7 = (1 << type) & 0x184;
    if (v6 || v7 == 0)
    {
      id v9 = v3;
    }
    else
    {
      objc_msgSend(v3, "br_sideFaultName");
      id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    char v11 = v9;
  }
  else
  {
    physicalName = self->_physicalName;
    if (!physicalName) {
      physicalName = self->super._logicalName;
    }
    char v11 = physicalName;
  }
  return v11;
}

- (void)setFilename:(id)a3
{
}

- (void)setFilename:(id)a3 forcePhysicalName:(id)a4 forceBouncedLogicalName:(id)a5 serverName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (self->_tmpBouncedNo)
  {
    int v15 = [(BRCLocalStatInfo *)self logicalName];
    int v16 = [v15 isEqualToString:v11];

    if (v16)
    {
      int v17 = brc_bread_crumbs();
      objc_super v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalStatInfo setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:]();
      }
    }
  }
  if ((objc_msgSend(v11, "br_isSideFaultName") & 1) != 0 || objc_msgSend(v13, "br_isSideFaultName"))
  {
    physicalName = brc_bread_crumbs();
    unsigned int v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalStatInfo setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:]();
    }
LABEL_10:

    goto LABEL_11;
  }
  p_bouncedLogicalName = &self->_bouncedLogicalName;
  if ([(NSString *)self->_bouncedLogicalName isEqualToString:v11]
    && ([v14 isEqualToString:*p_bouncedLogicalName] & 1) == 0)
  {
    physicalName = brc_bread_crumbs();
    unsigned int v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalStatInfo setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:](p_bouncedLogicalName);
    }
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_bouncedLogicalName, a5);
  int type = self->super._type;
  if ((type - 7) < 2 || type == 2)
  {
    objc_storeStrong((id *)&self->super._logicalName, a3);
    objc_msgSend(v11, "br_sideFaultName");
    id v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    physicalName = self->_physicalName;
    self->_physicalName = v24;
    goto LABEL_11;
  }
  if (type == 3)
  {
    uint64_t v25 = 160;
LABEL_30:
    uint64_t v27 = (objc_class *)v11;
    physicalName = *(Class *)((char *)&self->super.super.isa + v25);
    *(Class *)((char *)&self->super.super.isa + v25) = v27;
    goto LABEL_11;
  }
  if (v12)
  {
    if ([v12 isEqualToString:v11]) {
      int v26 = 0;
    }
    else {
      int v26 = v12;
    }
    objc_storeStrong((id *)&self->_physicalName, v26);
    uint64_t v25 = 56;
    goto LABEL_30;
  }
  if ([(NSString *)self->_physicalName isEqualToString:v11]) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&self->super._logicalName, a3);
  physicalName = self->_physicalName;
  self->_physicalName = 0;
LABEL_11:

LABEL_12:
}

- (void)_setItemScope:(unsigned __int8)a3
{
  self->_int itemScope = a3;
}

- (void)_setCKInfo:(id)a3
{
}

- (void)_moveItemAsideWithUUIDString
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: can't move aside a root item!%@", v2, v3, v4, v5, v6);
}

- (unint64_t)diffAgainstLocalInfo:(id)a3
{
  uint64_t v4 = a3;
  unint64_t v5 = [(BRCStatInfo *)self diffAgainst:v4];
  unint64_t v6 = v5;
  if ((v5 & 0x100000000) == 0 && self->super._state != *((unsigned __int8 *)v4 + 24)) {
    unint64_t v6 = v5 | 0x100000000;
  }
  if ((v6 & 0x200000000) != 0) {
    goto LABEL_10;
  }
  int v7 = (void *)v4[18];
  id v8 = self->_documentID;
  id v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_10;
  }
  id v10 = v9;
  if (!v9)
  {

    goto LABEL_17;
  }
  char v11 = [(NSNumber *)v8 isEqual:v9];

  if (v11)
  {
LABEL_10:
    if ((v6 & 0x400000000) != 0) {
      goto LABEL_21;
    }
LABEL_11:
    id v12 = (void *)v4[16];
    id v13 = self->_fileID;
    id v14 = v12;
    if (v13 == v14)
    {

      goto LABEL_21;
    }
    int v15 = v14;
    if (v14)
    {
      char v16 = [(NSNumber *)v13 isEqual:v14];

      if (v16) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    v6 |= 0x400000000uLL;
    goto LABEL_21;
  }
LABEL_17:
  v6 |= 0x200000000uLL;
  if ((v6 & 0x400000000) == 0) {
    goto LABEL_11;
  }
LABEL_21:
  if ((v6 & 0x800000000) != 0) {
    goto LABEL_27;
  }
  int v17 = (void *)v4[17];
  objc_super v18 = self->_generationID;
  BOOL v19 = v17;
  if (v18 == v19)
  {

    goto LABEL_27;
  }
  unsigned int v20 = v19;
  if (!v19)
  {

    goto LABEL_34;
  }
  BOOL v21 = [(BRCGenerationID *)v18 isEqual:v19];

  if (v21)
  {
LABEL_27:
    if ((v6 & 0x1000000000) != 0) {
      goto LABEL_38;
    }
LABEL_28:
    uint64_t v22 = (void *)v4[20];
    int v23 = self->_physicalName;
    id v24 = v22;
    if (v23 == v24)
    {

      goto LABEL_38;
    }
    uint64_t v25 = v24;
    if (v24)
    {
      char v26 = [(NSString *)v23 isEqual:v24];

      if (v26) {
        goto LABEL_38;
      }
    }
    else
    {
    }
    v6 |= 0x1000000000uLL;
    goto LABEL_38;
  }
LABEL_34:
  v6 |= 0x800000000uLL;
  if ((v6 & 0x1000000000) == 0) {
    goto LABEL_28;
  }
LABEL_38:
  if ((v6 & 0x4000000000) == 0)
  {
    uint64_t v27 = (void *)v4[21];
    v28 = self->_stagedFileID;
    int v29 = v27;
    if (v28 == v29)
    {
    }
    else
    {
      id v30 = v29;
      if (!v29)
      {

        goto LABEL_58;
      }
      char v31 = [(NSNumber *)v28 isEqual:v29];

      if ((v31 & 1) == 0)
      {
LABEL_58:
        v6 |= 0x4000000000uLL;
        if ((v6 & 0x4000000000) != 0) {
          goto LABEL_47;
        }
        goto LABEL_45;
      }
    }
  }
  if ((v6 & 0x4000000000) != 0) {
    goto LABEL_47;
  }
LABEL_45:
  if (self->_stagedGenerationID != *((_DWORD *)v4 + 44)) {
    v6 |= 0x4000000000uLL;
  }
LABEL_47:
  if ((v6 & 0x1000000000) != 0) {
    goto LABEL_53;
  }
  v32 = (void *)v4[23];
  uint64_t v33 = self->_bouncedLogicalName;
  v34 = v32;
  if (v33 == v34)
  {

    goto LABEL_53;
  }
  BOOL v35 = v34;
  if (!v34)
  {

    goto LABEL_61;
  }
  char v36 = [(NSString *)v33 isEqual:v34];

  if (v36)
  {
LABEL_53:
    if ((v6 & 0x2000000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_54;
  }
LABEL_61:
  v6 |= 0x1000000000uLL;
  if ((v6 & 0x2000000000) != 0) {
    goto LABEL_56;
  }
LABEL_54:
  if (self->_itemScope != *((unsigned __int8 *)v4 + 192)) {
    v6 |= 0x2000000000uLL;
  }
LABEL_56:

  return v6;
}

- (void)_markDead
{
  if (self->super._state != 1)
  {
    self->super._int state = 1;
    documentID = self->_documentID;
    self->_documentID = 0;

    fileID = self->_fileID;
    self->_fileID = 0;

    generationID = self->_generationID;
    self->_generationID = 0;

    stagedFileID = self->_stagedFileID;
    self->_stagedFileID = 0;

    self->_stagedGenerationID = 0;
    processingStamp = self->_processingStamp;
    self->_processingStamp = 0;
  }
}

- (void)_markDeadAsSharedTopLevelItemWithDocumentsItemID:(id)a3
{
  uint64_t v4 = (BRCItemID *)a3;
  [(BRCLocalStatInfo *)self _markDead];
  parentID = self->super._parentID;
  self->super._parentID = v4;
}

- (void)_updateStatMeta:(id)a3
{
  id v4 = a3;
  self->super._mode = [v4 mode];
  self->super._birthtime = [v4 birthtime];
  self->super._hiddenExt = [v4 isHiddenExt];
  unint64_t v5 = [v4 xattrSignature];
  xattrSignature = self->super._xattrSignature;
  self->super._xattrSignature = v5;

  lazyXattr = self->super._lazyXattr;
  self->super._lazyXattr = 0;

  id v8 = [v4 finderTags];
  finderTags = self->super._finderTags;
  self->super._finderTags = v8;

  self->super._favoriteRank = [v4 favoriteRank];
  self->super._lastUsedTime = [v4 lastUsedTime];
  id v10 = [v4 trashPutBackPath];
  trashPutBackPath = self->super._trashPutBackPath;
  self->super._trashPutBackPath = v10;

  id v12 = [v4 trashPutBackParentID];

  trashPutBackParentID = self->super._trashPutBackParentID;
  self->super._trashPutBackParentID = v12;
}

- (BOOL)checkStateWithItemID:(id)a3 logToFile:(__sFILE *)a4
{
  id v6 = a3;
  if self->super._state >= 0xFDu && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BRCLocalStatInfo;
    BOOL v7 = [(BRCStatInfo *)&v9 checkStateWithItemID:v6 logToFile:a4];
  }

  return v7;
}

- (NSNumber)processingStamp
{
  return self->_processingStamp;
}

- (void)setItemScope:(unsigned __int8)a3
{
  self->_int itemScope = a3;
}

- (NSString)rawBouncedLogicalName
{
  return self->_bouncedLogicalName;
}

- (void)setRawBouncedLogicalName:(id)a3
{
}

- (NSNumber)documentID
{
  return self->_documentID;
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (BRCGenerationID)generationID
{
  return self->_generationID;
}

- (NSString)physicalName
{
  return self->_physicalName;
}

- (NSNumber)tmpBouncedNo
{
  return self->_tmpBouncedNo;
}

- (NSNumber)stagedFileID
{
  return self->_stagedFileID;
}

- (unsigned)stagedGenerationID
{
  return self->_stagedGenerationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingStamp, 0);
  objc_storeStrong((id *)&self->_bouncedLogicalName, 0);
  objc_storeStrong((id *)&self->_stagedFileID, 0);
  objc_storeStrong((id *)&self->_physicalName, 0);
  objc_storeStrong((id *)&self->_tmpBouncedNo, 0);
  objc_storeStrong((id *)&self->_documentID, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
}

- (void)itemScope
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _itemScope != BRC_ITEM_SCOPE_UNKNOWN || _state == BRC_ITEM_STATE_TOMBSTONE || _state == BRC_ITEM_STATE_RESERVED%@", v2, v3, v4, v5, v6);
}

- (void)descriptionWithContext:origName:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [s isKindOfClass:[NSMutableString class]]%@", v2, v3, v4, v5, v6);
}

- (void)setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: got a fault name%@", v2, v3, v4, v5, v6);
}

- (void)setFilename:(void *)a1 forcePhysicalName:forceBouncedLogicalName:serverName:.cold.2(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Not overriding name equal to bounced name %@%@", (void)v3, DWORD2(v3));
}

- (void)setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_tmpBouncedNo || ![self.logicalName isEqualToString:name]%@", v2, v3, v4, v5, v6);
}

@end