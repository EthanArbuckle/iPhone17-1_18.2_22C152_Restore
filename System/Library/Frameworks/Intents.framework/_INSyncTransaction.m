@interface _INSyncTransaction
+ (id)beginTransactionForBundleID:(id)a3 bundlePath:(id)a4 syncSlot:(id)a5;
- (BOOL)_isMissingLatestFileError:(id)a3;
- (BOOL)fullResetRequired;
- (_INVocabularyGenerationDocument)latestVocabularyDocument;
- (_INVocabularyGenerationDocument)sentVocabularyDocument;
- (id)_emptySentDocument;
- (id)_initWithVocabularyManager:(id)a3 syncSlot:(id)a4 deleteExistingVocabulary:(BOOL)a5;
- (id)calculateDiff;
- (void)_beginTransaction;
- (void)_deleteInvalidSavedData;
- (void)_saveAndCleanup;
- (void)endTransactionWithFinalAnchor:(id)a3;
- (void)setFullResetRequired:(BOOL)a3;
@end

@implementation _INSyncTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sent, 0);
  objc_storeStrong((id *)&self->_latest, 0);
  objc_storeStrong((id *)&self->_storeManager, 0);
  objc_storeStrong((id *)&self->_syncSlot, 0);
  objc_storeStrong((id *)&self->_pathToSentVocabularyDocument, 0);
  objc_storeStrong((id *)&self->_pathToStagedVocabularyDocument, 0);

  objc_storeStrong((id *)&self->_pathToLatestVocabularyDocument, 0);
}

- (void)setFullResetRequired:(BOOL)a3
{
  self->_fullResetRequired = a3;
}

- (BOOL)fullResetRequired
{
  return self->_fullResetRequired;
}

- (_INVocabularyGenerationDocument)latestVocabularyDocument
{
  return self->_latest;
}

- (void)_beginTransaction
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_deleteExistingVocabulary)
  {
    [(_INSyncTransaction *)self _deleteInvalidSavedData];
    v3 = 0;
LABEL_3:
    v4 = [(_INSyncTransaction *)self _emptySentDocument];
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[_INSyncTransaction _beginTransaction]";
      _os_log_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_INFO, "%s No sent vocabulary at all, forcing a sync up once.", buf, 0xCu);
    }
    [(_INVocabularyGenerationDocument *)v4 setResetOnNextSync:1];
    goto LABEL_20;
  }
  uint64_t v6 = 16;
  if (!self->_vocabularyUpdatesEnabled) {
    uint64_t v6 = 24;
  }
  id v7 = *(id *)((char *)&self->super.isa + v6);
  v8 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[_INSyncTransaction _beginTransaction]";
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s staging at %@", buf, 0x16u);
  }
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_pathToLatestVocabularyDocument];
  id v19 = 0;
  char v12 = [v9 replaceItemAtURL:v10 withItemAtURL:v11 backupItemName:0 options:0 resultingItemURL:0 error:&v19];
  id v13 = v19;

  if ((v12 & 1) == 0)
  {
    BOOL v14 = [(_INSyncTransaction *)self _isMissingLatestFileError:v13];
    v15 = INSiriLogContextIntents;
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[_INSyncTransaction _beginTransaction]";
        _os_log_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_INFO, "%s No latest vocabulary file", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[_INSyncTransaction _beginTransaction]";
      __int16 v22 = 2114;
      id v23 = v13;
      _os_log_error_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_ERROR, "%s Error reading latest vocabulary file: %{public}@", buf, 0x16u);
    }
  }
  if (self->_vocabularyUpdatesEnabled)
  {
    v4 = [[_INVocabularyGenerationDocument alloc] initWithContentsOfFile:self->_pathToSentVocabularyDocument];
    v3 = [[_INVocabularyGenerationDocument alloc] initWithContentsOfFile:self->_pathToStagedVocabularyDocument];
  }
  else
  {
    v4 = [(_INSyncTransaction *)self _emptySentDocument];
    v3 = 0;
  }

  if (!v4) {
    goto LABEL_3;
  }
LABEL_20:
  if (!v3) {
    v3 = (_INVocabularyGenerationDocument *)[(_INVocabularyGenerationDocument *)v4 copy];
  }
  latest = self->_latest;
  self->_latest = v3;
  v17 = v3;

  sent = self->_sent;
  self->_sent = v4;
}

- (BOOL)_isMissingLatestFileError:(id)a3
{
  id v4 = a3;
  v5 = [v4 domain];
  int v6 = [v5 isEqual:*MEMORY[0x1E4F281F8]];

  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = [v4 code];
  BOOL v8 = 1;
  if (v7 != 4 && v7 != 260)
  {
    if (v7 == 512)
    {
      v9 = [v4 userInfo];
      v10 = [v9 objectForKey:*MEMORY[0x1E4F28A50]];

      BOOL v8 = [(_INSyncTransaction *)self _isMissingLatestFileError:v10];
      goto LABEL_7;
    }
LABEL_6:
    BOOL v8 = 0;
  }
LABEL_7:

  return v8;
}

- (void)_deleteInvalidSavedData
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    syncSlot = self->_syncSlot;
    storeManager = self->_storeManager;
    int v6 = v3;
    uint64_t v7 = [(_INVocabularyStoreManager *)storeManager appBundleID];
    int v11 = 136315650;
    char v12 = "-[_INSyncTransaction _deleteInvalidSavedData]";
    __int16 v13 = 2112;
    BOOL v14 = syncSlot;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s Removing all vocabulary of type %@ for %@", (uint8_t *)&v11, 0x20u);
  }
  BOOL v8 = [(_INVocabularyStoreManager *)self->_storeManager deleteIntentSlot:self->_syncSlot];
  if (v8)
  {
    v9 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v10 = self->_syncSlot;
      int v11 = 136315650;
      char v12 = "-[_INSyncTransaction _deleteInvalidSavedData]";
      __int16 v13 = 2114;
      BOOL v14 = v10;
      __int16 v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_ERROR, "%s Error cleaning up %{public}@ %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (id)_emptySentDocument
{
  v3 = objc_alloc_init(_INVocabularyGenerationDocument);
  id v4 = [(_INVocabularyStoreManager *)self->_storeManager appBundleID];
  [(_INVocabularyGenerationDocument *)v3 setAppBundleID:v4];

  [(_INVocabularyGenerationDocument *)v3 setVocabularyItems:MEMORY[0x1E4F1CBF0]];
  [(_INVocabularyGenerationDocument *)v3 setIntentSlot:self->_syncSlot];

  return v3;
}

- (_INVocabularyGenerationDocument)sentVocabularyDocument
{
  return self->_sent;
}

- (id)calculateDiff
{
  if ([(_INSyncTransaction *)self fullResetRequired]) {
    [(_INVocabularyGenerationDocument *)self->_latest setResetOnNextSync:1];
  }
  [(_INVocabularyGenerationDocument *)self->_latest assignMissingSiriIDsForOptimalDiffFromPreviousDocument:self->_sent];
  latest = self->_latest;
  sent = self->_sent;

  return [(_INVocabularyGenerationDocument *)latest diffFromPreviousDocument:sent];
}

- (void)endTransactionWithFinalAnchor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_INVocabularyGenerationDocument *)self->_latest setThisGeneration:v4];
  [(_INVocabularyGenerationDocument *)self->_latest setResetOnNextSync:0];
  BOOL vocabularyUpdatesEnabled = 0;
  if (!self->_deleteExistingVocabulary) {
    BOOL vocabularyUpdatesEnabled = self->_vocabularyUpdatesEnabled;
  }
  int v6 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSNumber;
    BOOL v8 = v6;
    v9 = [v7 numberWithBool:vocabularyUpdatesEnabled];
    int v12 = 136315650;
    __int16 v13 = "-[_INSyncTransaction endTransactionWithFinalAnchor:]";
    __int16 v14 = 2112;
    id v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s finalAnchor = '%@' cleaning up=%@", (uint8_t *)&v12, 0x20u);
  }
  if (vocabularyUpdatesEnabled) {
    [(_INSyncTransaction *)self _saveAndCleanup];
  }
  latest = self->_latest;
  self->_latest = 0;

  sent = self->_sent;
  self->_sent = 0;
}

- (void)_saveAndCleanup
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(_INVocabularyGenerationDocument *)self->_latest vocabularyItems];
  uint64_t v4 = [v3 count];

  v5 = INSiriLogContextIntents;
  BOOL v6 = os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      latest = self->_latest;
      pathToSentVocabularyDocument = self->_pathToSentVocabularyDocument;
      int v21 = 136315650;
      __int16 v22 = "-[_INSyncTransaction _saveAndCleanup]";
      __int16 v23 = 2112;
      uint64_t v24 = latest;
      __int16 v25 = 2112;
      v26 = pathToSentVocabularyDocument;
      _os_log_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_INFO, "%s Saving latest vocab %@ to %@", (uint8_t *)&v21, 0x20u);
    }
    uint64_t v9 = [(_INVocabularyGenerationDocument *)self->_latest writeToFile:self->_pathToSentVocabularyDocument createIntermediateDirectories:0];
    if (v9)
    {
      v10 = (void *)v9;
      int v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315394;
        __int16 v22 = "-[_INSyncTransaction _saveAndCleanup]";
        __int16 v23 = 2114;
        uint64_t v24 = v10;
        int v12 = "%s Error writing sent file %{public}@";
LABEL_19:
        _os_log_error_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v21, 0x16u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (v6)
    {
      syncSlot = self->_syncSlot;
      storeManager = self->_storeManager;
      id v15 = v5;
      __int16 v16 = [(_INVocabularyStoreManager *)storeManager appBundleID];
      int v21 = 136315650;
      __int16 v22 = "-[_INSyncTransaction _saveAndCleanup]";
      __int16 v23 = 2112;
      uint64_t v24 = syncSlot;
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_INFO, "%s Removing the sent file, because it is now empty %@ %@", (uint8_t *)&v21, 0x20u);
    }
    uint64_t v17 = [(_INVocabularyStoreManager *)self->_storeManager deleteVocabularyStoreItemAt:self->_pathToSentVocabularyDocument];
    if (v17)
    {
      uint64_t v18 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315394;
        __int16 v22 = "-[_INSyncTransaction _saveAndCleanup]";
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_18CB2F000, v18, OS_LOG_TYPE_ERROR, "%s Error removing empty sent vocab file %{public}@", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  id v19 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    pathToStagedVocabularyDocument = self->_pathToStagedVocabularyDocument;
    int v21 = 136315394;
    __int16 v22 = "-[_INSyncTransaction _saveAndCleanup]";
    __int16 v23 = 2112;
    uint64_t v24 = pathToStagedVocabularyDocument;
    _os_log_impl(&dword_18CB2F000, v19, OS_LOG_TYPE_INFO, "%s Removing staged vocabulary at %@", (uint8_t *)&v21, 0x16u);
  }
  v10 = [(_INVocabularyStoreManager *)self->_storeManager deleteVocabularyStoreItemAt:self->_pathToStagedVocabularyDocument];
  if (v10)
  {
    int v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315394;
      __int16 v22 = "-[_INSyncTransaction _saveAndCleanup]";
      __int16 v23 = 2114;
      uint64_t v24 = v10;
      int v12 = "%s Error cleaning up user vocabulary %{public}@";
      goto LABEL_19;
    }
  }
LABEL_17:
}

- (id)_initWithVocabularyManager:(id)a3 syncSlot:(id)a4 deleteExistingVocabulary:(BOOL)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v36.receiver = self;
  v36.super_class = (Class)_INSyncTransaction;
  int v11 = [(_INSyncTransaction *)&v36 init];
  if (!v11) {
    goto LABEL_11;
  }
  uint64_t v12 = [v10 copy];
  syncSlot = v11->_syncSlot;
  v11->_syncSlot = (NSString *)v12;

  objc_storeStrong((id *)&v11->_storeManager, a3);
  v11->_deleteExistingVocabulary = a5;
  id v14 = [(_INVocabularyStoreManager *)v11->_storeManager appBundleID];
  id v15 = v10;
  if (INSyncTransactionCheckVocabularyUpdatesEnabled_onceToken != -1) {
    dispatch_once(&INSyncTransactionCheckVocabularyUpdatesEnabled_onceToken, &__block_literal_global_43468);
  }
  __int16 v16 = [(id)INSyncTransactionCheckVocabularyUpdatesEnabled_vocabularyUpdatesOverrides objectForKey:v14];
  char v17 = [v16 containsObject:v15];

  BOOL v18 = (v17 & 1) != 0
     || +[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:v14 intentSlot:v15] == 3;

  v11->_BOOL vocabularyUpdatesEnabled = v18;
  if (!v11->_vocabularyUpdatesEnabled)
  {
    id v19 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      storeManager = v11->_storeManager;
      int v21 = v19;
      __int16 v22 = [(_INVocabularyStoreManager *)storeManager appBundleID];
      *(_DWORD *)buf = 136315394;
      v38 = "-[_INSyncTransaction _initWithVocabularyManager:syncSlot:deleteExistingVocabulary:]";
      __int16 v39 = 2112;
      v40 = v22;
      _os_log_impl(&dword_18CB2F000, v21, OS_LOG_TYPE_INFO, "%s Vocabulary updates disabled for %@", buf, 0x16u);
    }
  }
  if (v11->_deleteExistingVocabulary) {
    goto LABEL_11;
  }
  id v34 = 0;
  id v35 = 0;
  id v33 = 0;
  __int16 v25 = [(_INVocabularyStoreManager *)v11->_storeManager getPathToLatestVocabulary:&v35 pathDuringReading:&v34 sentVocabulary:&v33 forIntentSlot:v11->_syncSlot];
  id v26 = v35;
  id v27 = v35;
  id v28 = v34;
  id v29 = v34;
  id v30 = v33;
  id v31 = v33;
  if (v25)
  {
    v32 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[_INSyncTransaction _initWithVocabularyManager:syncSlot:deleteExistingVocabulary:]";
      __int16 v39 = 2114;
      v40 = v25;
      _os_log_error_impl(&dword_18CB2F000, v32, OS_LOG_TYPE_ERROR, "%s Error accessing intent-slot directory %{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)&v11->_pathToLatestVocabularyDocument, v26);
    objc_storeStrong((id *)&v11->_pathToStagedVocabularyDocument, v28);
    objc_storeStrong((id *)&v11->_pathToSentVocabularyDocument, v30);
  }

  if (v25) {
    __int16 v23 = 0;
  }
  else {
LABEL_11:
  }
    __int16 v23 = v11;

  return v23;
}

+ (id)beginTransactionForBundleID:(id)a3 bundlePath:(id)a4 syncSlot:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[_INVocabularyStoreManager managerForBundleID:v8 bundlePath:v9];
  if (v11)
  {
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 1;
    uint64_t v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    __int16 v23 = __70___INSyncTransaction_beginTransactionForBundleID_bundlePath_syncSlot___block_invoke;
    uint64_t v24 = &unk_1E5518D28;
    id v28 = &v29;
    id v13 = v8;
    id v25 = v13;
    id v14 = v10;
    id v26 = v14;
    id v15 = v12;
    id v27 = v15;
    [v11 checkIfSyncSlot:v14 isAllowedWithCompletion:&v21];
    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    int v16 = *((unsigned __int8 *)v30 + 24);
    if (!*((unsigned char *)v30 + 24))
    {
      char v17 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        id v34 = "+[_INSyncTransaction beginTransactionForBundleID:bundlePath:syncSlot:]";
        __int16 v35 = 2114;
        id v36 = v14;
        __int16 v37 = 2114;
        id v38 = v13;
        __int16 v39 = 2114;
        id v40 = v9;
        _os_log_error_impl(&dword_18CB2F000, v17, OS_LOG_TYPE_ERROR, "%s Sync slot %{public}@ is not valid for %{public}@ at %{public}@", buf, 0x2Au);
      }
      notify_post("INVoocabularyChangedNotification");
    }
    id v18 = objc_alloc((Class)a1);
    id v19 = objc_msgSend(v18, "_initWithVocabularyManager:syncSlot:deleteExistingVocabulary:", v11, v14, v16 == 0, v21, v22, v23, v24);
    [v19 _beginTransaction];

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

@end