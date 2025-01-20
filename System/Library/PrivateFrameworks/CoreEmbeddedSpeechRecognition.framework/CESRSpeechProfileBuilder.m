@interface CESRSpeechProfileBuilder
+ (BOOL)deleteProfileAtDirectory:(id)a3 locale:(id)a4 userId:(id)a5 error:(id *)a6;
+ (BOOL)shouldOverrideDeferralForCategory:(id)a3 updateMode:(unint64_t)a4;
+ (id)CESRErrorForXPCError:(id)a3;
+ (id)categoryToFieldTypeMap;
+ (id)categoryToLimitHintMap;
+ (id)getSpeechLocaleForLocale:(id)a3;
+ (id)profileDirPathFromBasePath:(id)a3 language:(id)a4 userId:(id)a5;
+ (id)profileFilePathFromBasePath:(id)a3 language:(id)a4 userId:(id)a5;
+ (id)speechProfilePathsForLocale:(id)a3;
+ (id)supportedCategories;
+ (void)deleteInactiveSites;
+ (void)deleteLegacyProfiles;
- (BOOL)_flushItemsWithError:(id *)a3;
- (BOOL)_setProfileConfigWithLanguage:(id)a3 profileDir:(id)a4 userId:(id)a5 dataProtectionClass:(int64_t)a6;
- (BOOL)addCodepathId:(id)a3 error:(id *)a4;
- (BOOL)addVocabularyItem:(id)a3 error:(id *)a4;
- (BOOL)addVocabularyItem:(id)a3 isBoosted:(BOOL)a4 error:(id *)a5;
- (BOOL)beginWithCategoriesAndVersions:(id)a3 bundleId:(id)a4 error:(id *)a5;
- (BOOL)cancelCategoriesWithError:(id *)a3;
- (BOOL)finishAndSaveProfile:(BOOL)a3 error:(id *)a4;
- (BOOL)removeCodepathId:(id)a3 error:(id *)a4;
- (CESRSpeechProfileBuilder)initWithDirectory:(id)a3 locale:(id)a4 userId:(id)a5 dataProtectionClass:(int64_t)a6;
- (NSLocale)locale;
- (NSString)userId;
- (NSURL)directory;
- (id)_newConnection;
- (id)getCodepathIdsWithError:(id *)a3;
- (int64_t)dataProtectionClass;
- (int64_t)getVersionForCategory:(id)a3 error:(id *)a4;
- (unint64_t)getGlobalItemsMemoryLimitInBytes;
- (void)dealloc;
@end

@implementation CESRSpeechProfileBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_isBoosted, 0);
  objc_storeStrong((id *)&self->_pendingItems, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (int64_t)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (NSString)userId
{
  return self->_userId;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSURL)directory
{
  return self->_directory;
}

- (unint64_t)getGlobalItemsMemoryLimitInBytes
{
  return 104857600;
}

- (BOOL)finishAndSaveProfile:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1495;
  v25 = __Block_byref_object_dispose__1496;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1495;
  v19 = __Block_byref_object_dispose__1496;
  id v20 = 0;
  if ([(CESRSpeechProfileBuilder *)self _flushItemsWithError:a4])
  {
    connection = self->_connection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__CESRSpeechProfileBuilder_finishAndSaveProfile_error___block_invoke;
    v14[3] = &unk_1E61C3B30;
    v14[4] = &v21;
    v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__CESRSpeechProfileBuilder_finishAndSaveProfile_error___block_invoke_382;
    v13[3] = &unk_1E61C3CC0;
    v13[4] = &v27;
    v13[5] = &v15;
    [v8 finishAndSaveProfile:v5 completion:v13];

    int v9 = *((unsigned __int8 *)v28 + 24);
    if (a4 && !*((unsigned char *)v28 + 24))
    {
      v10 = (void *)v22[5];
      if (!v10) {
        v10 = (void *)v16[5];
      }
      *a4 = v10;
      int v9 = *((unsigned __int8 *)v28 + 24);
    }
    if (v9)
    {
      if (v5) {
        self->_summedCommittedItemsMemoryInBytes = 0;
      }
      else {
        self->_summedCommittedItemsMemoryInBytes += self->_uncommittedItemsMemoryInBytes;
      }
      self->_uncommittedItemsMemoryInBytes = 0;
    }
    BOOL v11 = v9 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v11;
}

void __55__CESRSpeechProfileBuilder_finishAndSaveProfile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = +[CESRSpeechProfileBuilder CESRErrorForXPCError:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315394;
      int v9 = "-[CESRSpeechProfileBuilder finishAndSaveProfile:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __55__CESRSpeechProfileBuilder_finishAndSaveProfile_error___block_invoke_382(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      __int16 v10 = "-[CESRSpeechProfileBuilder finishAndSaveProfile:error:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v9, 0x16u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (BOOL)cancelCategoriesWithError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1495;
  v33 = __Block_byref_object_dispose__1496;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__1495;
  uint64_t v27 = __Block_byref_object_dispose__1496;
  id v28 = 0;
  connection = self->_connection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__CESRSpeechProfileBuilder_cancelCategoriesWithError___block_invoke;
  v22[3] = &unk_1E61C3B30;
  v22[4] = &v29;
  v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__CESRSpeechProfileBuilder_cancelCategoriesWithError___block_invoke_381;
  v21[3] = &unk_1E61C3CC0;
  v21[4] = &v35;
  v21[5] = &v23;
  [v6 cancelWithCompletion:v21];

  int v7 = *((unsigned __int8 *)v36 + 24);
  if (a3 && !*((unsigned char *)v36 + 24))
  {
    int v8 = (void *)v30[5];
    if (!v8) {
      int v8 = (void *)v24[5];
    }
    *a3 = v8;
    int v7 = *((unsigned __int8 *)v36 + 24);
  }
  if (v7)
  {
    self->_uncommittedItemsMemoryInBytes = 0;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v9 = self->_pendingItems;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "content", (void)v17);
          v14 = [v13 data];
          self->_uncommittedItemsMemoryInBytes -= [v14 length];
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v39 count:16];
      }
      while (v10);
    }
  }
  [(NSMutableArray *)self->_pendingItems removeAllObjects];
  [(NSMutableArray *)self->_isBoosted removeAllObjects];
  BOOL v15 = *((unsigned char *)v36 + 24) != 0;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v15;
}

void __54__CESRSpeechProfileBuilder_cancelCategoriesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = +[CESRSpeechProfileBuilder CESRErrorForXPCError:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315394;
      int v9 = "-[CESRSpeechProfileBuilder cancelCategoriesWithError:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __54__CESRSpeechProfileBuilder_cancelCategoriesWithError___block_invoke_381(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      __int16 v10 = "-[CESRSpeechProfileBuilder cancelCategoriesWithError:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v9, 0x16u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (BOOL)_flushItemsWithError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_pendingItems count]) {
    return 1;
  }
  uint64_t v37 = 0;
  char v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__1495;
  uint64_t v35 = __Block_byref_object_dispose__1496;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__1495;
  uint64_t v29 = __Block_byref_object_dispose__1496;
  id v30 = 0;
  connection = self->_connection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __49__CESRSpeechProfileBuilder__flushItemsWithError___block_invoke;
  v24[3] = &unk_1E61C3B30;
  v24[4] = &v31;
  v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v24];
  pendingItems = self->_pendingItems;
  isBoosted = self->_isBoosted;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __49__CESRSpeechProfileBuilder__flushItemsWithError___block_invoke_380;
  v23[3] = &unk_1E61C3CC0;
  v23[4] = &v37;
  v23[5] = &v25;
  [v6 addVocabularyItems:pendingItems isBoosted:isBoosted completion:v23];

  int v9 = *((unsigned __int8 *)v38 + 24);
  if (a3 && !*((unsigned char *)v38 + 24))
  {
    __int16 v10 = (void *)v32[5];
    if (!v10) {
      __int16 v10 = (void *)v26[5];
    }
    *a3 = v10;
    int v9 = *((unsigned __int8 *)v38 + 24);
  }
  if (!v9)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    __int16 v11 = self->_pendingItems;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v11);
          }
          BOOL v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "content", (void)v19);
          v16 = [v15 data];
          self->_uncommittedItemsMemoryInBytes -= [v16 length];
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v41 count:16];
      }
      while (v12);
    }
  }
  [(NSMutableArray *)self->_pendingItems removeAllObjects];
  [(NSMutableArray *)self->_isBoosted removeAllObjects];
  BOOL v17 = *((unsigned char *)v38 + 24) != 0;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  return v17;
}

void __49__CESRSpeechProfileBuilder__flushItemsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = +[CESRSpeechProfileBuilder CESRErrorForXPCError:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315394;
      int v9 = "-[CESRSpeechProfileBuilder _flushItemsWithError:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __49__CESRSpeechProfileBuilder__flushItemsWithError___block_invoke_380(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      __int16 v10 = "-[CESRSpeechProfileBuilder _flushItemsWithError:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v9, 0x16u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (BOOL)addVocabularyItem:(id)a3 error:(id *)a4
{
  return [(CESRSpeechProfileBuilder *)self addVocabularyItem:a3 isBoosted:0 error:a4];
}

- (BOOL)addVocabularyItem:(id)a3 isBoosted:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = [v8 content];
  __int16 v10 = [v9 data];
  uint64_t v11 = [v10 length];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v8 metaContent];
    uint64_t v13 = [v12 data];
    v11 += [v13 length];
  }
  unint64_t v14 = self->_uncommittedItemsMemoryInBytes + v11 + self->_summedCommittedItemsMemoryInBytes;
  if (v14 < [(CESRSpeechProfileBuilder *)self getGlobalItemsMemoryLimitInBytes])
  {
    [(NSMutableArray *)self->_pendingItems addObject:v8];
    isBoosted = self->_isBoosted;
    v16 = [NSNumber numberWithBool:v6];
    [(NSMutableArray *)isBoosted addObject:v16];

    self->_uncommittedItemsMemoryInBytes += v11;
  }
  BOOL v17 = (unint64_t)[(NSMutableArray *)self->_pendingItems count] < 0x32
     || [(CESRSpeechProfileBuilder *)self _flushItemsWithError:a5];

  return v17;
}

- (BOOL)beginWithCategoriesAndVersions:(id)a3 bundleId:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__1495;
  id v28 = __Block_byref_object_dispose__1496;
  id v29 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__1495;
  long long v22 = __Block_byref_object_dispose__1496;
  id v23 = 0;
  connection = self->_connection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__CESRSpeechProfileBuilder_beginWithCategoriesAndVersions_bundleId_error___block_invoke;
  v17[3] = &unk_1E61C3B30;
  v17[4] = &v24;
  uint64_t v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__CESRSpeechProfileBuilder_beginWithCategoriesAndVersions_bundleId_error___block_invoke_377;
  v16[3] = &unk_1E61C3CC0;
  v16[4] = &v30;
  v16[5] = &v18;
  [v11 beginWithCategoriesAndVersions:v8 bundleId:v9 completion:v16];

  int v12 = *((unsigned __int8 *)v31 + 24);
  if (a5 && !*((unsigned char *)v31 + 24))
  {
    uint64_t v13 = (void *)v25[5];
    if (!v13) {
      uint64_t v13 = (void *)v19[5];
    }
    *a5 = v13;
    int v12 = *((unsigned __int8 *)v31 + 24);
  }
  BOOL v14 = v12 != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v14;
}

void __74__CESRSpeechProfileBuilder_beginWithCategoriesAndVersions_bundleId_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = +[CESRSpeechProfileBuilder CESRErrorForXPCError:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    BOOL v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315394;
      id v9 = "-[CESRSpeechProfileBuilder beginWithCategoriesAndVersions:bundleId:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __74__CESRSpeechProfileBuilder_beginWithCategoriesAndVersions_bundleId_error___block_invoke_377(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      __int16 v10 = "-[CESRSpeechProfileBuilder beginWithCategoriesAndVersions:bundleId:error:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v9, 0x16u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (id)getCodepathIdsWithError:(id *)a3
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__1495;
  id v28 = __Block_byref_object_dispose__1496;
  id v29 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__1495;
  long long v22 = __Block_byref_object_dispose__1496;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = __Block_byref_object_copy__1495;
  v16 = __Block_byref_object_dispose__1496;
  id v17 = 0;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__CESRSpeechProfileBuilder_getCodepathIdsWithError___block_invoke;
  v11[3] = &unk_1E61C3B30;
  v11[4] = &v18;
  BOOL v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__CESRSpeechProfileBuilder_getCodepathIdsWithError___block_invoke_375;
  v10[3] = &unk_1E61C3110;
  v10[4] = &v12;
  v10[5] = &v24;
  [v6 getCodepathIdsWithCompletion:v10];

  if (a3)
  {
    uint64_t v7 = (void *)v19[5];
    if (!v7) {
      uint64_t v7 = (void *)v13[5];
    }
    *a3 = v7;
  }
  id v8 = (id)v25[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

void __52__CESRSpeechProfileBuilder_getCodepathIdsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = +[CESRSpeechProfileBuilder CESRErrorForXPCError:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    BOOL v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315394;
      int v9 = "-[CESRSpeechProfileBuilder getCodepathIdsWithError:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __52__CESRSpeechProfileBuilder_getCodepathIdsWithError___block_invoke_375(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    uint64_t v8 = a1 + 40;
    a3 = a2;
  }
  else
  {
    int v9 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[CESRSpeechProfileBuilder getCodepathIdsWithError:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v8 = a1 + 32;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)v8 + 8) + 40), a3);
}

- (BOOL)removeCodepathId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__1495;
  uint64_t v25 = __Block_byref_object_dispose__1496;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__1495;
  long long v19 = __Block_byref_object_dispose__1496;
  id v20 = 0;
  connection = self->_connection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__CESRSpeechProfileBuilder_removeCodepathId_error___block_invoke;
  v14[3] = &unk_1E61C3B30;
  v14[4] = &v21;
  uint64_t v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__CESRSpeechProfileBuilder_removeCodepathId_error___block_invoke_373;
  v13[3] = &unk_1E61C3CC0;
  v13[4] = &v15;
  v13[5] = &v27;
  [v8 removeCodepathId:v6 completion:v13];

  int v9 = *((unsigned __int8 *)v28 + 24);
  if (a4 && !*((unsigned char *)v28 + 24))
  {
    int v10 = (void *)v22[5];
    if (!v10) {
      int v10 = (void *)v16[5];
    }
    *a4 = v10;
    int v9 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v11 = v9 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __51__CESRSpeechProfileBuilder_removeCodepathId_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = +[CESRSpeechProfileBuilder CESRErrorForXPCError:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315394;
      int v9 = "-[CESRSpeechProfileBuilder removeCodepathId:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __51__CESRSpeechProfileBuilder_removeCodepathId_error___block_invoke_373(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[CESRSpeechProfileBuilder removeCodepathId:error:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)addCodepathId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__1495;
  uint64_t v25 = __Block_byref_object_dispose__1496;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__1495;
  long long v19 = __Block_byref_object_dispose__1496;
  id v20 = 0;
  connection = self->_connection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__CESRSpeechProfileBuilder_addCodepathId_error___block_invoke;
  v14[3] = &unk_1E61C3B30;
  v14[4] = &v21;
  int v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__CESRSpeechProfileBuilder_addCodepathId_error___block_invoke_372;
  v13[3] = &unk_1E61C3CC0;
  v13[4] = &v15;
  v13[5] = &v27;
  [v8 addCodepathId:v6 completion:v13];

  int v9 = *((unsigned __int8 *)v28 + 24);
  if (a4 && !*((unsigned char *)v28 + 24))
  {
    int v10 = (void *)v22[5];
    if (!v10) {
      int v10 = (void *)v16[5];
    }
    *a4 = v10;
    int v9 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v11 = v9 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __48__CESRSpeechProfileBuilder_addCodepathId_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = +[CESRSpeechProfileBuilder CESRErrorForXPCError:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315394;
      int v9 = "-[CESRSpeechProfileBuilder addCodepathId:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __48__CESRSpeechProfileBuilder_addCodepathId_error___block_invoke_372(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[CESRSpeechProfileBuilder addCodepathId:error:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (int64_t)getVersionForCategory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = -1;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__1495;
  uint64_t v24 = __Block_byref_object_dispose__1496;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__1495;
  uint64_t v18 = __Block_byref_object_dispose__1496;
  id v19 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__CESRSpeechProfileBuilder_getVersionForCategory_error___block_invoke;
  v13[3] = &unk_1E61C3B30;
  v13[4] = &v20;
  int v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__CESRSpeechProfileBuilder_getVersionForCategory_error___block_invoke_370;
  v12[3] = &unk_1E61C30E8;
  v12[4] = &v14;
  v12[5] = &v26;
  [v8 getVersionForCategory:v6 completion:v12];

  if (a4)
  {
    id v9 = (void *)v21[5];
    if (!v9) {
      id v9 = (void *)v15[5];
    }
    *a4 = v9;
  }
  int64_t v10 = v27[3];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

void __56__CESRSpeechProfileBuilder_getVersionForCategory_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = +[CESRSpeechProfileBuilder CESRErrorForXPCError:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315394;
      id v9 = "-[CESRSpeechProfileBuilder getVersionForCategory:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __56__CESRSpeechProfileBuilder_getVersionForCategory_error___block_invoke_370(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      id v9 = "-[CESRSpeechProfileBuilder getVersionForCategory:error:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)_setProfileConfigWithLanguage:(id)a3 profileDir:(id)a4 userId:(id)a5 dataProtectionClass:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__1495;
  v18[4] = __Block_byref_object_dispose__1496;
  id v19 = 0;
  connection = self->_connection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__CESRSpeechProfileBuilder__setProfileConfigWithLanguage_profileDir_userId_dataProtectionClass___block_invoke;
  v17[3] = &unk_1E61C3B30;
  v17[4] = v18;
  uint64_t v14 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__CESRSpeechProfileBuilder__setProfileConfigWithLanguage_profileDir_userId_dataProtectionClass___block_invoke_368;
  v16[3] = &unk_1E61C30C0;
  v16[4] = &v20;
  [v14 setProfileConfigWithLanguage:v10 profileDir:v11 userId:v12 dataProtectionClass:a6 completion:v16];

  LOBYTE(a6) = *((unsigned char *)v21 + 24);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(&v20, 8);
  return a6;
}

void __96__CESRSpeechProfileBuilder__setProfileConfigWithLanguage_profileDir_userId_dataProtectionClass___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = +[CESRSpeechProfileBuilder CESRErrorForXPCError:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 136315394;
      id v9 = "-[CESRSpeechProfileBuilder _setProfileConfigWithLanguage:profileDir:userId:dataProtectionClass:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __96__CESRSpeechProfileBuilder__setProfileConfigWithLanguage_profileDir_userId_dataProtectionClass___block_invoke_368(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)_newConnection
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.siri.embeddedspeech"];
  uint64_t v4 = CESRSpeechProfileBuilderServiceGetXPCInterface();
  [v3 setRemoteObjectInterface:v4];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&CoreEmbeddedSpeechRecognizerInstanceUUIDSpeechProfileBuilder];
  [v3 _setUUID:v5];

  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v8 = dispatch_queue_create("CESRSpeechProfileBuilder", v7);
  [v3 _setQueue:v8];
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __42__CESRSpeechProfileBuilder__newConnection__block_invoke;
  uint64_t v14 = &unk_1E61C3730;
  objc_copyWeak(&v15, &location);
  id v9 = _Block_copy(&v11);
  objc_msgSend(v3, "setInterruptionHandler:", v9, v11, v12, v13, v14);
  [v3 setInvalidationHandler:v9];
  [v3 resume];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v3;
}

void __42__CESRSpeechProfileBuilder__newConnection__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = (void *)MEMORY[0x1E4F29290];
      uint64_t v4 = v2;
      id v5 = [v3 _UUID];
      int v7 = 136315650;
      dispatch_queue_t v8 = "-[CESRSpeechProfileBuilder _newConnection]_block_invoke";
      __int16 v9 = 2112;
      __int16 v10 = WeakRetained;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s %@ cancelling instance %@", (uint8_t *)&v7, 0x20u);
    }
    [WeakRetained[1] invalidate];
    id v6 = WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSXPCConnection *)self->_connection invalidate];
  uint64_t v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[CESRSpeechProfileBuilder dealloc]";
    __int16 v7 = 2112;
    dispatch_queue_t v8 = self;
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s %@ deallocating", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)CESRSpeechProfileBuilder;
  [(CESRSpeechProfileBuilder *)&v4 dealloc];
}

- (CESRSpeechProfileBuilder)initWithDirectory:(id)a3 locale:(id)a4 userId:(id)a5 dataProtectionClass:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CESRSpeechProfileBuilder;
  uint64_t v14 = [(CESRSpeechProfileBuilder *)&v29 init];
  id v15 = v14;
  if (!v14) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v14->_directory, a3);
  objc_storeStrong((id *)&v15->_locale, a4);
  objc_storeStrong((id *)&v15->_userId, a5);
  v15->_dataProtectionClass = a6;
  uint64_t v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  pendingItems = v15->_pendingItems;
  v15->_pendingItems = v16;

  uint64_t v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  isBoosted = v15->_isBoosted;
  v15->_isBoosted = v18;

  uint64_t v20 = [(CESRSpeechProfileBuilder *)v15 _newConnection];
  connection = v15->_connection;
  v15->_connection = (NSXPCConnection *)v20;

  v15->_summedCommittedItemsMemoryInBytes = 0;
  v15->_uncommittedItemsMemoryInBytes = 0;
  uint64_t v22 = [v12 localeIdentifier];
  char v23 = +[CESRUtilities languageStringForLocaleString:v22];

  uint64_t v24 = [v11 path];
  BOOL v25 = [(CESRSpeechProfileBuilder *)v15 _setProfileConfigWithLanguage:v23 profileDir:v24 userId:v13 dataProtectionClass:a6];

  uint64_t v26 = v15->_connection;
  uint64_t v27 = 0;
  if (v26)
  {
    if (v25) {
LABEL_4:
    }
      uint64_t v27 = v15;
  }

  return v27;
}

+ (id)CESRErrorForXPCError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = v4;
  id v6 = @"Connection to the profile builder service was interrupted";
  if (v3)
  {
    [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v7 = [v3 code];
    if (v7 == 4099) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    if (v7 == 4099) {
      id v6 = @"Connection to the profile builder service was rejected";
    }
  }
  else
  {
    uint64_t v8 = 2;
  }
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CESRProfileErrorDomain" code:v8 userInfo:v5];

  return v9;
}

+ (id)profileFilePathFromBasePath:(id)a3 language:(id)a4 userId:(id)a5
{
  id v5 = +[CESRSpeechProfileBuilder profileDirPathFromBasePath:a3 language:a4 userId:a5];
  id v6 = [v5 stringByAppendingPathComponent:@"SpeechProfile"];

  return v6;
}

+ (id)profileDirPathFromBasePath:(id)a3 language:(id)a4 userId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 length])
  {
    __int16 v10 = SFUserIdHash();
    uint64_t v11 = SFUserIdHashToString();
    id v12 = (void *)v11;
    id v13 = @"0000000000000000";
    if (v11) {
      id v13 = (__CFString *)v11;
    }
    uint64_t v14 = v13;

    id v15 = [v7 stringByAppendingPathComponent:v14];

    uint64_t v16 = [v15 stringByAppendingPathComponent:v8];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (void)deleteInactiveSites
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = SFSpeechProfileSiteDirectories();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * v6);
        id v8 = SFPersonaIdFromSiteURL();
        if (v8)
        {
          id v9 = [MEMORY[0x1E4F3C278] sharedInstance];
          char v10 = [v9 personaMatchesEnrolledUser:v8];

          if ((v10 & 1) == 0)
          {
            uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v16 = 0;
            char v12 = [v11 removeItemAtURL:v7 error:&v16];
            id v13 = v16;

            uint64_t v14 = *MEMORY[0x1E4F4E380];
            id v15 = *MEMORY[0x1E4F4E380];
            if (v12)
            {
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                uint64_t v22 = "+[CESRSpeechProfileBuilder deleteInactiveSites]";
                __int16 v23 = 2112;
                uint64_t v24 = v7;
                _os_log_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_DEFAULT, "%s Deleted site at URL: %@", buf, 0x16u);
              }
            }
            else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v22 = "+[CESRSpeechProfileBuilder deleteInactiveSites]";
              __int16 v23 = 2112;
              uint64_t v24 = v7;
              __int16 v25 = 2112;
              id v26 = v13;
              _os_log_error_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_ERROR, "%s Failed to delete site (%@), error: %@", buf, 0x20u);
            }
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v4);
  }
}

+ (void)deleteLegacyProfiles
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = AFLibraryDirectoryWithSubPath();
  uint64_t v4 = [v2 contentsOfDirectoryAtPath:v3 error:0];
  uint64_t v5 = [@"SpeechProfile" stringByAppendingString:@"_"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasPrefix:", v5, (void)v13))
        {
          char v12 = [v3 stringByAppendingPathComponent:v11];
          [v2 removeItemAtPath:v12 error:0];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

+ (BOOL)deleteProfileAtDirectory:(id)a3 locale:(id)a4 userId:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [a4 localeIdentifier];
  char v12 = +[CESRUtilities languageStringForLocaleString:v11];

  long long v13 = [v10 path];

  long long v14 = +[CESRSpeechProfileBuilder profileDirPathFromBasePath:v13 language:v12 userId:v9];

  long long v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = 0;
  char v16 = [v15 removeItemAtPath:v14 error:&v19];
  id v17 = v19;

  if (a6 && v17) {
    *a6 = v17;
  }

  return v16;
}

+ (id)speechProfilePathsForLocale:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = [a3 localeIdentifier];
    uint64_t v4 = +[CESRUtilities languageStringForLocaleString:v3];

    uint64_t v5 = +[CESRUtilities speechProfilePathsWithLanguage:v4];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v13 = objc_alloc(MEMORY[0x1E4F1CB10]);
          long long v14 = objc_msgSend(v13, "initFileURLWithPath:", v12, (void)v16);
          [v6 addObject:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)getSpeechLocaleForLocale:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 localeIdentifier];
  uint64_t v5 = +[CESRUtilities languageStringForLocaleString:v4];

  id v6 = MEMORY[0x1BA9CBEC0](v5);

  id v7 = v3;
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA20]);
    uint64_t v9 = +[CESRUtilities localeStringForLanguageString:v6];
    id v7 = (void *)[v8 initWithLocaleIdentifier:v9];
  }

  return v7;
}

+ (BOOL)shouldOverrideDeferralForCategory:(id)a3 updateMode:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  if (([v5 isEqualToString:@"\\NT-contact"] & 1) != 0
    || ([v5 isEqualToString:@"\\NT-appname"] & 1) != 0
    || ([v5 isEqualToString:@"\\NT-appvocab"] & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    char v8 = [v5 isEqualToString:@"\\NT-device"];
    if ((v4 & 5) != 0) {
      BOOL v6 = v8;
    }
    else {
      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (id)categoryToFieldTypeMap
{
  v24[19] = *MEMORY[0x1E4F143B8];
  v23[0] = @"\\NT-contact";
  uint64_t v22 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E878];
  v24[0] = v22;
  v23[1] = @"\\NT-appcontact";
  uint64_t v21 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E890];
  v24[1] = v21;
  v23[2] = @"\\NT-action";
  long long v20 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E8A8];
  v24[2] = v20;
  v23[3] = @"\\NT-payaccount";
  long long v19 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E8C0];
  v24[3] = v19;
  v23[4] = @"\\NT-savedactivity";
  long long v18 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E8D8];
  v24[4] = v18;
  v23[5] = @"\\NT-notetitle";
  long long v17 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E8F0];
  void v24[5] = v17;
  void v23[6] = @"\\NT-notefolder";
  long long v16 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E908];
  v24[6] = v16;
  v23[7] = @"\\NT-phototag";
  long long v15 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E920];
  v24[7] = v15;
  v23[8] = @"\\NT-photoalbum";
  long long v14 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E938];
  v24[8] = v14;
  v23[9] = @"\\NT-house";
  id v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E950];
  v24[9] = v13;
  v23[10] = @"\\NT-room";
  v2 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E968];
  v24[10] = v2;
  v23[11] = @"\\NT-zone";
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E980];
  v24[11] = v3;
  v23[12] = @"\\NT-scene";
  char v4 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E998];
  v24[12] = v4;
  v23[13] = @"\\NT-group";
  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E9B0];
  v24[13] = v5;
  v23[14] = @"\\NT-device";
  BOOL v6 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E9C8];
  v24[14] = v6;
  v23[15] = @"\\NT-artist";
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E9E0];
  v24[15] = v7;
  v23[16] = @"\\NT-playlist";
  char v8 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129E9F8];
  v24[16] = v8;
  v23[17] = @"\\NT-appname";
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129EA10];
  v24[17] = v9;
  v23[18] = @"\\NT-appvocab";
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F129EA28];
  v24[18] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:19];

  return v11;
}

+ (id)supportedCategories
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v3 = +[CESRSpeechProfileBuilder categoryToFieldTypeMap];
  char v4 = [v3 allKeys];
  id v5 = (void *)[v2 initWithArray:v4];

  return v5;
}

+ (id)categoryToLimitHintMap
{
  v5[24] = *MEMORY[0x1E4F143B8];
  v4[0] = @"\\NT-contact";
  v4[1] = @"\\NT-action";
  v5[0] = &unk_1F129E320;
  v5[1] = &unk_1F129E338;
  v4[2] = @"\\NT-payaccount";
  v4[3] = @"\\NT-savedactivity";
  v5[2] = &unk_1F129E338;
  v5[3] = &unk_1F129E338;
  v4[4] = @"\\NT-notetitle";
  v4[5] = @"\\NT-notefolder";
  v5[4] = &unk_1F129E338;
  v5[5] = &unk_1F129E338;
  v4[6] = @"\\NT-phototag";
  v4[7] = @"\\NT-photoalbum";
  v5[6] = &unk_1F129E338;
  v5[7] = &unk_1F129E338;
  v4[8] = @"\\NT-house";
  v4[9] = @"\\NT-room";
  v5[8] = &unk_1F129E338;
  v5[9] = &unk_1F129E338;
  v4[10] = @"\\NT-zone";
  v4[11] = @"\\NT-group";
  v5[10] = &unk_1F129E338;
  v5[11] = &unk_1F129E338;
  v4[12] = @"\\NT-device";
  v4[13] = @"\\NT-scene";
  v5[12] = &unk_1F129E338;
  v5[13] = &unk_1F129E338;
  v4[14] = @"\\NT-playlist";
  v4[15] = @"\\NT-artist";
  v5[14] = &unk_1F129E350;
  v5[15] = &unk_1F129E350;
  v4[16] = @"\\NT-appname";
  v4[17] = @"\\NT-searchterm";
  v5[16] = &unk_1F129E338;
  v5[17] = &unk_1F129E338;
  v4[18] = @"\\NT-location";
  v4[19] = @"\\NT-calevent";
  v5[18] = &unk_1F129E338;
  v5[19] = &unk_1F129E338;
  v4[20] = @"\\NT-unknown";
  v4[21] = @"\\NT-entity";
  v5[20] = &unk_1F129E338;
  v5[21] = &unk_1F129E338;
  v4[22] = @"\\NT-correction";
  v4[23] = @"\\NT-appvocab";
  v5[22] = &unk_1F129E338;
  v5[23] = &unk_1F129E338;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:24];

  return v2;
}

@end