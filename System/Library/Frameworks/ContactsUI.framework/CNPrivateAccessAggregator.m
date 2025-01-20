@interface CNPrivateAccessAggregator
+ (BOOL)shouldShowPickerTipForBundleIdentifier:(id)a3;
+ (id)allLoggedBundledIdentifiers;
+ (id)log;
+ (id)sharedInstance;
+ (void)recordAccessForBundleIdentifier:(id)a3;
+ (void)recordPickerTipDismissalForBundleIdentifier:(id)a3;
+ (void)resetLog;
- (BOOL)isSupportedOnThisPlatform;
- (BOOL)shouldShowPrivacyTipInPickerForBundleIdentifier:(id)a3;
- (CNPrivateAccessAggregator)init;
- (NSFileCoordinator)fileCoordinator;
- (NSMutableArray)privateAccessClients;
- (NSSet)supportedClasses;
- (NSURL)privateAccessAggregatorURL;
- (id)applicationGroupContainerURL;
- (id)bundleIdentifiers;
- (id)fileURLToPrivateAccessAggregator;
- (id)filterExpiredPrivateAccessEntries:(id)a3;
- (id)readBundleIdentifiersFromURLAccessor:(id)a3 error:(id *)a4;
- (void)privacyTipDismissedByUserForBundleIdentifier:(id)a3;
- (void)resetLoggedIdentifiers;
- (void)setFileCoordinator:(id)a3;
- (void)setPrivateAccessAggregatorURL:(id)a3;
- (void)setPrivateAccessClients:(id)a3;
- (void)setSupportedClasses:(id)a3;
- (void)updateAggregatorWithBundleID:(id)a3;
@end

@implementation CNPrivateAccessAggregator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateAccessClients, 0);
  objc_storeStrong((id *)&self->_supportedClasses, 0);
  objc_storeStrong((id *)&self->_privateAccessAggregatorURL, 0);

  objc_storeStrong((id *)&self->_fileCoordinator, 0);
}

- (void)setPrivateAccessClients:(id)a3
{
}

- (NSMutableArray)privateAccessClients
{
  return self->_privateAccessClients;
}

- (void)setSupportedClasses:(id)a3
{
}

- (NSSet)supportedClasses
{
  return self->_supportedClasses;
}

- (void)setPrivateAccessAggregatorURL:(id)a3
{
}

- (NSURL)privateAccessAggregatorURL
{
  return self->_privateAccessAggregatorURL;
}

- (void)setFileCoordinator:(id)a3
{
}

- (NSFileCoordinator)fileCoordinator
{
  return self->_fileCoordinator;
}

- (void)privacyTipDismissedByUserForBundleIdentifier:(id)a3
{
  id v5 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__31657;
  v22[4] = __Block_byref_object_dispose__31658;
  id v23 = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke;
  aBlock[3] = &unk_1E5498F08;
  objc_copyWeak(v20, &location);
  id v6 = v5;
  v20[1] = (id)a2;
  id v18 = v6;
  v19 = v24;
  v7 = _Block_copy(aBlock);
  v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v9 = [v8 schedulerProvider];
  v10 = [v9 backgroundScheduler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke_39;
  v12[3] = &unk_1E5498F30;
  objc_copyWeak(&v16, &location);
  v14 = v22;
  id v11 = v7;
  id v13 = v11;
  v15 = v24;
  [v10 performBlock:v12 qualityOfService:4];

  objc_destroyWeak(&v16);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
}

void __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v33 = 0;
  v8 = [WeakRetained readBundleIdentifiersFromURLAccessor:v6 error:&v33];

  id v9 = v33;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v8)
  {
    id v29 = v5;
    id v11 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
    goto LABEL_3;
  }
  if (!v9)
  {
    id v29 = v5;
    id v11 = 0;
LABEL_3:
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke_38;
    v31[3] = &unk_1E5498EE0;
    id v32 = *(id *)(a1 + 32);
    v12 = [v11 objectsPassingTest:v31];
    id v13 = v12;
    if (v12 && [v12 count])
    {
      if ((unint64_t)[v13 count] >= 2)
      {
        v14 = +[CNPrivateAccessAggregator log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          v24 = NSStringFromSelector(*(SEL *)(a1 + 56));
          char v25 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          id v35 = v24;
          __int16 v36 = 2112;
          id v37 = v25;
          _os_log_fault_impl(&dword_18B625000, v14, OS_LOG_TYPE_FAULT, "%@: more than 1 entry found for %@; Defaulting to first",
            buf,
            0x16u);
        }
      }
      v15 = [v13 allObjects];
      id v16 = [v15 objectAtIndex:0];

      if (([v16 isForClientWithBundleIdentifier:*(void *)(a1 + 32)] & 1) == 0)
      {
        v26 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v28 = *(void *)(a1 + 56);
        v27 = [v16 bundleIdentifier];
        [v26 handleFailureInMethod:v28, WeakRetained, @"CNPrivateAccessAggregator.m", 387, @"Existing entry is for %@ but the given bundleID is %@", v27, *(void *)(a1 + 32) object file lineNumber description];
      }
      [v11 removeObject:v16];
    }
    v17 = [[CNPrivateAccessEntry alloc] initWithBundleIdentifier:*(void *)(a1 + 32) privateAccessTipDismissedByUser:1];
    [v11 addObject:v17];
    if (v11)
    {
      id v18 = [v11 allObjects];
      [v10 addObjectsFromArray:v18];
    }
    id v30 = 0;
    v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v30];
    id v20 = v30;
    v21 = v20;
    if (v19 || !v20)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v19 writeToURL:v29 atomically:1];
    }
    else
    {
      v22 = +[CNPrivateAccessAggregator log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v35 = v10;
        __int16 v36 = 2112;
        id v37 = v21;
        _os_log_error_impl(&dword_18B625000, v22, OS_LOG_TYPE_ERROR, "Unable to archive contents (%@). Error: %@", buf, 0x16u);
      }
    }
    id v5 = v29;
    goto LABEL_24;
  }
  id v11 = +[CNPrivateAccessAggregator log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v23 = [WeakRetained privateAccessAggregatorURL];
    *(_DWORD *)buf = 138412546;
    id v35 = v23;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_error_impl(&dword_18B625000, v11, OS_LOG_TYPE_ERROR, "Unable to read contents from Private access aggregator (%@). Error: %@", buf, 0x16u);
  }
LABEL_24:
}

void __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke_39(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = [WeakRetained fileCoordinator];
  v4 = [WeakRetained privateAccessAggregatorURL];
  id v5 = [WeakRetained privateAccessAggregatorURL];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  [v3 coordinateReadingItemAtURL:v4 options:0 writingItemAtURL:v5 options:0 error:&obj byAccessor:v6];
  objc_storeStrong((id *)(v7 + 40), obj);

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v8 = +[CNPrivateAccessAggregator log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      id v9 = [WeakRetained privateAccessAggregatorURL];
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_fault_impl(&dword_18B625000, v8, OS_LOG_TYPE_FAULT, "Unable to read from / write to Private access aggregator (%@), error: %@", buf, 0x16u);
    }
  }
}

uint64_t __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke_38(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = +[CNPrivateAccessAggregator log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_INFO, "id obj = %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = [v5 isForClientWithBundleIdentifier:*(void *)(a1 + 32)];
  if (v7) {
    *a3 = 1;
  }

  return v7;
}

- (BOOL)shouldShowPrivacyTipInPickerForBundleIdentifier:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__31657;
  v35[4] = __Block_byref_object_dispose__31658;
  id v36 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__31657;
  id v29 = __Block_byref_object_dispose__31658;
  id v30 = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CNPrivateAccessAggregator_shouldShowPrivacyTipInPickerForBundleIdentifier___block_invoke;
  aBlock[3] = &unk_1E5498FD0;
  objc_copyWeak(v23, &location);
  v19 = v35;
  id v20 = &v25;
  v21 = &v31;
  id v6 = v5;
  v23[1] = (id)a2;
  id v18 = v6;
  v22 = &v37;
  uint64_t v7 = _Block_copy(aBlock);
  v8 = [(CNPrivateAccessAggregator *)self fileCoordinator];
  int v9 = [(CNPrivateAccessAggregator *)self privateAccessAggregatorURL];
  id v10 = (id *)(v26 + 5);
  id obj = (id)v26[5];
  [v8 coordinateReadingItemAtURL:v9 options:0 error:&obj byAccessor:v7];
  objc_storeStrong(v10, obj);

  if (!*((unsigned char *)v32 + 24) || v26[5])
  {
    uint64_t v11 = +[CNPrivateAccessAggregator log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      __int16 v14 = [(CNPrivateAccessAggregator *)self privateAccessAggregatorURL];
      uint64_t v15 = v26[5];
      *(_DWORD *)buf = 138412546;
      v42 = v14;
      __int16 v43 = 2112;
      uint64_t v44 = v15;
      _os_log_fault_impl(&dword_18B625000, v11, OS_LOG_TYPE_FAULT, "Unable to read from Private access aggregator (%@), error: %@", buf, 0x16u);
    }
  }
  BOOL v12 = *((unsigned char *)v38 + 24) != 0;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&v37, 8);
  return v12;
}

void __77__CNPrivateAccessAggregator_shouldShowPrivacyTipInPickerForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = (id *)(a1 + 72);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [WeakRetained readBundleIdentifiersFromURLAccessor:v4 error:&obj];

  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __77__CNPrivateAccessAggregator_shouldShowPrivacyTipInPickerForBundleIdentifier___block_invoke_2;
  v22 = &unk_1E5498FA8;
  id v23 = *(id *)(a1 + 32);
  uint64_t v11 = objc_msgSend(v10, "_cn_filter:", &v19);
  BOOL v12 = v11;
  if (v11 && [v11 count])
  {
    if ((unint64_t)[v12 count] >= 2)
    {
      id v13 = +[CNPrivateAccessAggregator log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v15;
        _os_log_fault_impl(&dword_18B625000, v13, OS_LOG_TYPE_FAULT, "Hmmm.. more then one entry is found for %@; Defaulting to first",
          buf,
          0xCu);
      }
    }
    __int16 v14 = [v12 objectAtIndex:0];
    if (([v14 isForClientWithBundleIdentifier:*(void *)(a1 + 32)] & 1) == 0)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v17 = *(void *)(a1 + 80);
      id v18 = [v14 bundleIdentifier];
      [v16 handleFailureInMethod:v17, WeakRetained, @"CNPrivateAccessAggregator.m", 335, @"Existing entry is for %@ but the given bundleID is %@", v18, *(void *)(a1 + 32), v19, v20, v21, v22 object file lineNumber description];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v14 isPrivateAccessTipDismissedByUser] ^ 1;
  }
}

uint64_t __77__CNPrivateAccessAggregator_shouldShowPrivacyTipInPickerForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isForClientWithBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)resetLoggedIdentifiers
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([(CNPrivateAccessAggregator *)self isSupportedOnThisPlatform])
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__31657;
    uint64_t v28 = __Block_byref_object_dispose__31658;
    id v29 = 0;
    v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    id v4 = [v3 entitlementVerifier];
    uint64_t v5 = *MEMORY[0x1E4F5A240];
    uint64_t v6 = (id *)(v25 + 5);
    id obj = (id)v25[5];
    char v7 = [v4 currentProcessHasBooleanEntitlement:v5 error:&obj];
    objc_storeStrong(v6, obj);

    if (v7)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v31 = 0x2020000000;
      char v32 = 0;
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __51__CNPrivateAccessAggregator_resetLoggedIdentifiers__block_invoke;
      aBlock[3] = &unk_1E5498F80;
      void aBlock[4] = &buf;
      uint64_t v8 = _Block_copy(aBlock);
      int v9 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      id v10 = [v9 schedulerProvider];
      uint64_t v11 = [v10 backgroundScheduler];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __51__CNPrivateAccessAggregator_resetLoggedIdentifiers__block_invoke_37;
      v16[3] = &unk_1E5498F30;
      objc_copyWeak(&v20, &location);
      id v18 = &v24;
      id v12 = v8;
      id v17 = v12;
      p_long long buf = &buf;
      [v11 performBlock:v16 qualityOfService:4];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      id v13 = +[CNPrivateAccessAggregator log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
        uint64_t v15 = [v14 mainBundleIdentifier];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "%{public}@ is not entitled to reset private contact access records", (uint8_t *)&buf, 0xCu);
      }
    }
    _Block_object_dispose(&v24, 8);
  }
}

void __51__CNPrivateAccessAggregator_resetLoggedIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v10 = 0;
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:MEMORY[0x1E4F1CBF0] requiringSecureCoding:1 error:&v10];
  id v5 = v10;
  uint64_t v6 = v5;
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 writeToURL:v3 atomically:1];
  }
  else
  {
    uint64_t v8 = +[CNPrivateAccessAggregator log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "Unable to reset logged identifiers. Error: %@", buf, 0xCu);
    }
  }
}

void __51__CNPrivateAccessAggregator_resetLoggedIdentifiers__block_invoke_37(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained fileCoordinator];
  id v4 = [WeakRetained privateAccessAggregatorURL];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  [v3 coordinateWritingItemAtURL:v4 options:0 error:&obj byAccessor:v5];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    BOOL v7 = +[CNPrivateAccessAggregator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v17 = [WeakRetained privateAccessAggregatorURL];
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      _os_log_error_impl(&dword_18B625000, v7, OS_LOG_TYPE_ERROR, "Unable to reset Private access aggregator (%@), error: %@", buf, 0x16u);
    }
    uint64_t v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v9 = [v8 fileManager];
    id v10 = [WeakRetained privateAccessAggregatorURL];
    uint64_t v11 = [(id)v9 removeItemAtURL:v10];

    id v12 = [v11 value];
    LOBYTE(v9) = [v12 BOOLValue];

    if ((v9 & 1) == 0)
    {
      uint64_t v13 = [v11 error];

      if (v13)
      {
        __int16 v14 = [v11 error];
        uint64_t v15 = [v14 code];

        if (v15 != 4)
        {
          uint64_t v16 = +[CNPrivateAccessAggregator log];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            uint64_t v19 = [v11 error];
            *(_DWORD *)long long buf = 138412290;
            v22 = v19;
            _os_log_fault_impl(&dword_18B625000, v16, OS_LOG_TYPE_FAULT, "Unable to delete the Private access aggregator file, error: %@", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (id)bundleIdentifiers
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([(CNPrivateAccessAggregator *)self isSupportedOnThisPlatform])
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__31657;
    v32[4] = __Block_byref_object_dispose__31658;
    id v33 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__31657;
    id v30 = __Block_byref_object_dispose__31658;
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v22 = 0;
    __int16 v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__31657;
    id v20 = __Block_byref_object_dispose__31658;
    id v21 = 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__CNPrivateAccessAggregator_bundleIdentifiers__block_invoke;
    aBlock[3] = &unk_1E5498F58;
    objc_copyWeak(&v14, &location);
    void aBlock[4] = v32;
    void aBlock[5] = &v16;
    aBlock[6] = &v22;
    aBlock[7] = &v26;
    id v3 = _Block_copy(aBlock);
    id v4 = [(CNPrivateAccessAggregator *)self fileCoordinator];
    uint64_t v5 = [(CNPrivateAccessAggregator *)self privateAccessAggregatorURL];
    uint64_t v6 = (id *)(v17 + 5);
    id obj = (id)v17[5];
    [v4 coordinateReadingItemAtURL:v5 options:0 error:&obj byAccessor:v3];
    objc_storeStrong(v6, obj);

    if (!*((unsigned char *)v23 + 24) || v17[5])
    {
      BOOL v7 = +[CNPrivateAccessAggregator log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        id v10 = [(CNPrivateAccessAggregator *)self privateAccessAggregatorURL];
        uint64_t v11 = v17[5];
        *(_DWORD *)long long buf = 138412546;
        id v35 = v10;
        __int16 v36 = 2112;
        uint64_t v37 = v11;
        _os_log_fault_impl(&dword_18B625000, v7, OS_LOG_TYPE_FAULT, "Unable to read from Private access aggregator (%@), error: %@", buf, 0x16u);
      }
    }
    id v8 = (id)v27[5];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(v32, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __46__CNPrivateAccessAggregator_bundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [WeakRetained readBundleIdentifiersFromURLAccessor:v3 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    || !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v9 = [WeakRetained filterExpiredPrivateAccessEntries:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    id v12 = 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "bundleIdentifier", (void)v20);
        [v18 addObject:v19];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v15);
  }
}

- (void)updateAggregatorWithBundleID:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(CNPrivateAccessAggregator *)self isSupportedOnThisPlatform])
  {
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__31657;
    __int16 v36 = __Block_byref_object_dispose__31658;
    id v37 = 0;
    uint64_t v6 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v7 = [v6 entitlementVerifier];
    uint64_t v8 = *MEMORY[0x1E4F5A218];
    uint64_t v9 = (id *)(v33 + 5);
    id obj = (id)v33[5];
    char v10 = [v7 currentProcessHasBooleanEntitlement:v8 error:&obj];
    objc_storeStrong(v9, obj);

    if (v10)
    {
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v39 = 0;
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke;
      aBlock[3] = &unk_1E5498F08;
      objc_copyWeak(v29, &location);
      id v11 = v5;
      v29[1] = (id)a2;
      id v27 = v11;
      uint64_t v28 = buf;
      id v12 = _Block_copy(aBlock);
      id v13 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      uint64_t v14 = [v13 schedulerProvider];
      uint64_t v15 = [v14 backgroundScheduler];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke_35;
      v21[3] = &unk_1E5498F30;
      objc_copyWeak(&v25, &location);
      long long v23 = &v32;
      id v16 = v12;
      id v22 = v16;
      uint64_t v24 = buf;
      [v15 performBlock:v21 qualityOfService:4];

      objc_destroyWeak(&v25);
      objc_destroyWeak(v29);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v17 = +[CNPrivateAccessAggregator log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
        uint64_t v19 = [v18 mainBundleIdentifier];
        uint64_t v20 = v33[5];
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v20;
        _os_log_error_impl(&dword_18B625000, v17, OS_LOG_TYPE_ERROR, "Current process(%{public}@) is not entitled to record private access to contacts (error: %@)", buf, 0x16u);
      }
    }
    _Block_object_dispose(&v32, 8);
  }
}

void __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v31 = 0;
  uint64_t v8 = [WeakRetained readBundleIdentifiersFromURLAccessor:v6 error:&v31];

  id v9 = v31;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v8)
  {
    id v27 = v9;
    id v11 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
    goto LABEL_3;
  }
  if (!v9)
  {
    id v27 = 0;
    id v11 = 0;
LABEL_3:
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    id v29[2] = __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke_24;
    v29[3] = &unk_1E5498EE0;
    id v30 = *(id *)(a1 + 32);
    id v12 = [v11 objectsPassingTest:v29];
    id v13 = v12;
    if (v12 && [v12 count])
    {
      uint64_t v14 = [v13 allObjects];
      uint64_t v15 = [v14 objectAtIndex:0];

      if (([v15 isForClientWithBundleIdentifier:*(void *)(a1 + 32)] & 1) == 0)
      {
        uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v26 = *(void *)(a1 + 56);
        id v25 = [v15 bundleIdentifier];
        [v24 handleFailureInMethod:v26, WeakRetained, @"CNPrivateAccessAggregator.m", 165, @"Existing entry is for %@ but the given bundleID is %@", v25, *(void *)(a1 + 32) object file lineNumber description];
      }
      uint64_t v16 = [v15 isPrivateAccessTipDismissedByUser];
      [v11 removeObject:v15];
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v17 = [[CNPrivateAccessEntry alloc] initWithBundleIdentifier:*(void *)(a1 + 32) privateAccessTipDismissedByUser:v16];
    [v11 addObject:v17];
    if (v11)
    {
      uint64_t v18 = [v11 allObjects];
      [v10 addObjectsFromArray:v18];
    }
    id v28 = 0;
    uint64_t v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v28];
    id v20 = v28;
    long long v21 = v20;
    if (v19 || !v20)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v19 writeToURL:v5 atomically:1];
    }
    else
    {
      id v22 = +[CNPrivateAccessAggregator log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        id v33 = v10;
        __int16 v34 = 2112;
        id v35 = v21;
        _os_log_error_impl(&dword_18B625000, v22, OS_LOG_TYPE_ERROR, "Unable to archive contents (%@). Error: %@", buf, 0x16u);
      }
    }
    id v9 = v27;
    goto LABEL_21;
  }
  id v11 = +[CNPrivateAccessAggregator log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    long long v23 = [WeakRetained privateAccessAggregatorURL];
    *(_DWORD *)long long buf = 138412546;
    id v33 = v23;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_error_impl(&dword_18B625000, v11, OS_LOG_TYPE_ERROR, "Unable to read contents from Private access aggregator (%@). Error: %@", buf, 0x16u);
  }
LABEL_21:
}

void __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke_35(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained fileCoordinator];
  id v4 = [WeakRetained privateAccessAggregatorURL];
  id v5 = [WeakRetained privateAccessAggregatorURL];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  [v3 coordinateReadingItemAtURL:v4 options:0 writingItemAtURL:v5 options:0 error:&obj byAccessor:v6];
  objc_storeStrong((id *)(v7 + 40), obj);

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v8 = +[CNPrivateAccessAggregator log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      id v9 = [WeakRetained privateAccessAggregatorURL];
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_fault_impl(&dword_18B625000, v8, OS_LOG_TYPE_FAULT, "Unable to read from / write to Private access aggregator (%@), error: %@", buf, 0x16u);
    }
  }
}

uint64_t __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke_24(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = +[CNPrivateAccessAggregator log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_INFO, "id obj = %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = [v5 isForClientWithBundleIdentifier:*(void *)(a1 + 32)];
  if (v7) {
    *a3 = 1;
  }

  return v7;
}

- (BOOL)isSupportedOnThisPlatform
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  if ([v2 isiOSAppOnMac])
  {
    char v3 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28F80] processInfo];
    char v5 = [v4 isMacCatalystApp];

    char v3 = v5 ^ 1;
  }

  return v3;
}

- (id)filterExpiredPrivateAccessEntries:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(a3, "_cn_filter:", &__block_literal_global_21);
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

uint64_t __63__CNPrivateAccessAggregator_filterExpiredPrivateAccessEntries___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isExpired] ^ 1;
}

- (id)readBundleIdentifiersFromURLAccessor:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6];
  uint64_t v8 = v7;
  if (!v7 || ![v7 length])
  {
    uint64_t v11 = 0;
    id v12 = 0;
    goto LABEL_10;
  }
  int v9 = (void *)MEMORY[0x1E4F28DC0];
  id v10 = [(CNPrivateAccessAggregator *)self supportedClasses];
  id v18 = 0;
  uint64_t v11 = [v9 unarchivedObjectOfClasses:v10 fromData:v8 error:&v18];
  id v12 = v18;

  if (!v11 && v12)
  {
    id v13 = +[CNPrivateAccessAggregator log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "Unable to read contents from Private access aggregator (%@). Error: %@", buf, 0x16u);
    }

    if (a4)
    {
      id v12 = v12;
      uint64_t v11 = 0;
      *a4 = v12;
      goto LABEL_10;
    }
    goto LABEL_18;
  }
  if ([v11 count])
  {
    uint64_t v15 = [v11 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v17 = +[CNPrivateAccessAggregator log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18B625000, v17, OS_LOG_TYPE_DEFAULT, "Current format is missing last access time. Lets ignore", buf, 2u);
      }

LABEL_18:
      uint64_t v11 = 0;
    }
  }
LABEL_10:

  return v11;
}

- (id)fileURLToPrivateAccessAggregator
{
  v2 = [(CNPrivateAccessAggregator *)self applicationGroupContainerURL];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 URLByAppendingPathComponent:@"ContactsPickerView.privateaccess" isDirectory:0];
    char v5 = v4;
    if (v4) {
      id v6 = v4;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)applicationGroupContainerURL
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v3 = [v2 fileManager];
  id v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.contacts.private-access"];

  char v5 = [v4 value];

  id v6 = +[CNPrivateAccessAggregator log];
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v4 value];
      int v12 = 138543362;
      id v13 = v8;
      _os_log_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEFAULT, "Container URL: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    int v9 = [v4 value];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v4 error];
      int v12 = 138543362;
      id v13 = v11;
      _os_log_error_impl(&dword_18B625000, v7, OS_LOG_TYPE_ERROR, "Unable to get container URL. %{public}@", (uint8_t *)&v12, 0xCu);
    }
    int v9 = 0;
  }

  return v9;
}

- (CNPrivateAccessAggregator)init
{
  v13.receiver = self;
  v13.super_class = (Class)CNPrivateAccessAggregator;
  v2 = [(CNPrivateAccessAggregator *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
    [(CNPrivateAccessAggregator *)v2 setFileCoordinator:v3];

    id v4 = [(CNPrivateAccessAggregator *)v2 fileURLToPrivateAccessAggregator];
    [(CNPrivateAccessAggregator *)v2 setPrivateAccessAggregatorURL:v4];

    char v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    [(CNPrivateAccessAggregator *)v2 setSupportedClasses:v10];

    uint64_t v11 = v2;
  }

  return v2;
}

+ (void)recordPickerTipDismissalForBundleIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = +[CNPrivateAccessAggregator log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "Recording limited picker tip dismissal for %@", (uint8_t *)&v6, 0xCu);
    }

    char v5 = +[CNPrivateAccessAggregator sharedInstance];
    [v5 privacyTipDismissedByUserForBundleIdentifier:v3];
  }
}

+ (BOOL)shouldShowPickerTipForBundleIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    id v4 = +[CNPrivateAccessAggregator sharedInstance];
    int v5 = [v4 shouldShowPrivacyTipInPickerForBundleIdentifier:v3];

    int v6 = +[CNPrivateAccessAggregator log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v5;
      _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_DEFAULT, "Should show limited picker tip: %i", (uint8_t *)v8, 8u);
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

+ (void)resetLog
{
  id v2 = +[CNPrivateAccessAggregator sharedInstance];
  [v2 resetLoggedIdentifiers];
}

+ (id)allLoggedBundledIdentifiers
{
  id v2 = +[CNPrivateAccessAggregator sharedInstance];
  id v3 = [v2 bundleIdentifiers];

  return v3;
}

+ (void)recordAccessForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[CNPrivateAccessAggregator sharedInstance];
  [v4 updateAggregatorWithBundleID:v3];
}

+ (id)sharedInstance
{
  if (sharedInstance_cn_once_token_2 != -1) {
    dispatch_once(&sharedInstance_cn_once_token_2, &__block_literal_global_5_31724);
  }
  id v2 = (void *)sharedInstance_cn_once_object_2;

  return v2;
}

void __43__CNPrivateAccessAggregator_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CNPrivateAccessAggregator);
  v1 = (void *)sharedInstance_cn_once_object_2;
  sharedInstance_cn_once_object_2 = (uint64_t)v0;
}

+ (id)log
{
  if (log_cn_once_token_1_31726 != -1) {
    dispatch_once(&log_cn_once_token_1_31726, &__block_literal_global_31727);
  }
  id v2 = (void *)log_cn_once_object_1_31728;

  return v2;
}

void __32__CNPrivateAccessAggregator_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "PrivateAccess");
  v1 = (void *)log_cn_once_object_1_31728;
  log_cn_once_object_1_31728 = (uint64_t)v0;
}

@end