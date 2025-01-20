@interface HMDWalletPassLibrary
+ (id)logCategory;
- (BOOL)isExpressModeEnabledForPassUniqueIdentifier:(id)a3 serialNumber:(id)a4;
- (BOOL)isWalletVisible;
- (BOOL)removePassWithTypeIdentifier:(id)a3 serialNumber:(id)a4 flow:(id)a5;
- (HMDWalletPassLibrary)initWithWorkQueue:(id)a3;
- (HMDWalletPassLibraryDelegate)delegate;
- (NSSet)walletKeys;
- (NSString)secureElementIdentifier;
- (OS_dispatch_queue)workQueue;
- (PKPassLibrary)passLibrary;
- (id)createTemporaryPassDirectoryURL;
- (id)nfcInfoFromPaymentApplication:(id)a3 readerKey:(id)a4 flow:(id)a5;
- (id)passUniqueIDOfWalletKeyWithTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (id)urlForWalletKeyWithTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (id)walletKeyWithTypeIdentifier:(id)a3 serialNumber:(id)a4 flow:(id)a5;
- (void)acquireAssertionOfType:(unint64_t)a3 withReason:(id)a4 completion:(id)a5;
- (void)addPassAtURL:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)deleteKeyMaterialForSubCredentialId:(id)a3;
- (void)enableExpressWithAuthData:(id)a3 passTypeIdentifier:(id)a4 serialNumber:(id)a5 flow:(id)a6 completion:(id)a7;
- (void)fetchExpressEnablementConflictingPassDescriptionForPassAtURL:(id)a3 completion:(id)a4;
- (void)fetchExpressEnablementConflictingPassDescriptionForPassAtURL:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)fetchHomeKeySupportedWithFlow:(id)a3 completion:(id)a4;
- (void)fetchIsExpressEnabledForPassWithTypeIdentifier:(id)a3 serialNumber:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)fetchTransactionKeyForPassWithTypeIdentifier:(id)a3 serialNumber:(id)a4 completion:(id)a5;
- (void)generateHomeKeyNFCInfoWithReaderPublicKey:(id)a3 readerIdentifier:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)handlePassLibraryDidChangeNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressSettingsWithAuthData:(id)a3 enableUWB:(BOOL)a4 enableNFCExpress:(BOOL)a5 passTypeIdentifier:(id)a6 serialNumber:(id)a7 flow:(id)a8 completion:(id)a9;
- (void)start;
- (void)updatePassAtURL:(id)a3 flow:(id)a4 completion:(id)a5;
@end

@implementation HMDWalletPassLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (PKPassLibrary)passLibrary
{
  return (PKPassLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDWalletPassLibraryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDWalletPassLibraryDelegate *)WeakRetained;
}

- (BOOL)isWalletVisible
{
  return [MEMORY[0x263F5C2E8] isWalletVisible];
}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDWalletPassLibrary *)self passLibrary];
  [v5 deleteKeyMaterialForSubCredentialId:v4];
}

- (void)handlePassLibraryDidChangeNotification:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v4 = [v32 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5C640]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = objc_msgSend(v7, "na_filter:", &__block_literal_global_67_217877);

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        v14 = [(HMDWalletPassLibrary *)self workQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke_2;
        block[3] = &unk_264A2F820;
        block[4] = self;
        block[5] = v13;
        dispatch_async(v14, block);
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v10);
  }

  v15 = [v32 userInfo];
  v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263F5C680]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  v19 = objc_msgSend(v18, "na_filter:", &__block_literal_global_70_217878);

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v33 = v19;
  uint64_t v20 = [v33 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v39;
    uint64_t v23 = *MEMORY[0x263F5C688];
    uint64_t v24 = *MEMORY[0x263F5C668];
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v33);
        }
        v26 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        v27 = objc_msgSend(v26, "hmf_stringForKey:", v23);
        uint64_t v28 = objc_msgSend(v26, "hmf_stringForKey:", v24);
        v29 = (void *)v28;
        if (v27) {
          BOOL v30 = v28 == 0;
        }
        else {
          BOOL v30 = 1;
        }
        if (!v30)
        {
          v31 = [(HMDWalletPassLibrary *)self workQueue];
          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke_4;
          v35[3] = &unk_264A2F2F8;
          v35[4] = self;
          id v36 = v27;
          id v37 = v29;
          dispatch_async(v31, v35);
        }
      }
      uint64_t v21 = [v33 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v21);
  }
}

void __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) serialNumber];
  id v4 = [*(id *)(a1 + 40) passTypeIdentifier];
  [v5 passLibrary:v2 didAddPassWithSerialNumber:v3 typeIdentifier:v4];
}

void __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 passLibrary:*(void *)(a1 + 32) didRemovePassWithSerialNumber:*(void *)(a1 + 40) typeIdentifier:*(void *)(a1 + 48)];
}

uint64_t __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

uint64_t __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

- (void)fetchTransactionKeyForPassWithTypeIdentifier:(id)a3 serialNumber:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(HMDWalletPassLibrary *)self passLibrary];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __93__HMDWalletPassLibrary_fetchTransactionKeyForPassWithTypeIdentifier_serialNumber_completion___block_invoke;
  v14[3] = &unk_264A27B00;
  id v15 = v8;
  id v16 = v9;
  v14[4] = self;
  id v12 = v8;
  id v13 = v9;
  [v11 fetchTransactionKeyForPassTypeIdentifier:v10 serialNumber:v12 completionHandler:v14];
}

void __93__HMDWalletPassLibrary_fetchTransactionKeyForPassWithTypeIdentifier_serialNumber_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  if ([v5 length] == 65)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_5:
    v7();
    goto LABEL_9;
  }
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(a1 + 40);
    int v15 = 138544130;
    id v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = [v5 length];
    __int16 v21 = 2048;
    uint64_t v22 = 65;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch transaction key for pass with serial number: %@, received unexpected transaction key length: %lu expected: %lu", (uint8_t *)&v15, 0x2Au);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  v14 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);

LABEL_9:
}

- (void)acquireAssertionOfType:(unint64_t)a3 withReason:(id)a4 completion:(id)a5
{
}

- (id)createTemporaryPassDirectoryURL
{
  id v2 = NSURL;
  uint64_t v3 = HMDCreateHomeKitDaemonCacheDirectory();
  id v4 = [v2 fileURLWithPath:v3];
  id v5 = [MEMORY[0x263F08C38] UUID];
  id v6 = [v5 UUIDString];
  id v7 = [v4 URLByAppendingPathComponent:v6];

  return v7;
}

- (id)nfcInfoFromPaymentApplication:(id)a3 readerKey:(id)a4 flow:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 secureElementIdentifier];
  uint64_t v11 = [v7 applicationIdentifier];
  uint64_t v12 = [v7 subcredentials];
  uint64_t v13 = [v12 anyObject];
  v14 = [v13 transactionKey];

  int v15 = [v7 subcredentials];
  id v16 = [v15 anyObject];
  long long v46 = [v16 identifier];

  int64_t v17 = +[HMDHomeWalletKeySecureElementInfo hmdPaymentTypeFromPKPaymentType:flow:](HMDHomeWalletKeySecureElementInfo, "hmdPaymentTypeFromPKPaymentType:flow:", [v7 paymentType], v9);
  if ([v7 paymentType] == 1003)
  {
    uint64_t v18 = [v8 identifier];
  }
  else
  {
    [v8 publicKey];
    __int16 v19 = v10;
    id v20 = v9;
    v22 = id v21 = v8;
    uint64_t v18 = +[HMDNIST256Utilities identifier16BytesForKey:v22];

    id v8 = v21;
    id v9 = v20;
    id v10 = v19;
  }
  uint64_t v23 = (void *)v11;
  if (v10 && v11 && v46 && v14 && v18)
  {
    if ([v14 length] == 65)
    {
      uint64_t v24 = [HMDHomeWalletKeySecureElementInfo alloc];
      objc_msgSend(v18, "hmf_hexadecimalRepresentation");
      v26 = id v25 = v8;
      v27 = [(HMDHomeWalletKeySecureElementInfo *)v24 initWithDeviceCredentialKey:v14 applicationIdentifier:v23 subCredentialIdentifier:v46 secureElementIdentifier:v10 pairedReaderIdentifier:v26 paymentCredentialType:v17];

      id v8 = v25;
    }
    else
    {
      v34 = v10;
      v35 = (void *)MEMORY[0x230FBD990]();
      id v36 = self;
      id v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        long long v38 = v42 = v35;
        [v9 UUID];
        long long v39 = v45 = v8;
        *(_DWORD *)buf = 138544130;
        v48 = v38;
        __int16 v49 = 2112;
        v50 = v39;
        __int16 v51 = 2048;
        uint64_t v52 = [v14 length];
        __int16 v53 = 2048;
        uint64_t v54 = 65;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to generate home key nfc info, received unexpected transaction key length: %lu expected: %lu", buf, 0x2Au);

        id v8 = v45;
        v35 = v42;
      }

      v27 = 0;
      id v10 = v34;
    }
  }
  else
  {
    uint64_t v28 = v10;
    v29 = (void *)MEMORY[0x230FBD990]();
    BOOL v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v32 = v44 = v8;
      [v9 UUID];
      id v33 = v41 = v29;
      *(_DWORD *)buf = 138544898;
      v48 = v32;
      __int16 v49 = 2112;
      v50 = v33;
      __int16 v51 = 2112;
      uint64_t v52 = (uint64_t)v28;
      __int16 v53 = 2112;
      uint64_t v54 = (uint64_t)v23;
      __int16 v55 = 2112;
      v56 = v46;
      __int16 v57 = 2112;
      v58 = v14;
      __int16 v59 = 2112;
      v60 = v18;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to generate home key nfc info because either secureElementIdentifier: %@ is nil or applicationIdentifier: %@ is nil or subCredentialIdentifier: %@ is nil or transactionKey: %@ is nil or readerIdentifier is nil: %@", buf, 0x48u);

      v29 = v41;
      id v8 = v44;
    }

    v27 = 0;
    id v10 = v28;
  }

  return v27;
}

- (void)generateHomeKeyNFCInfoWithReaderPublicKey:(id)a3 readerIdentifier:(id)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    int v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v12 UUID];
      *(_DWORD *)buf = 138543618;
      v29 = v17;
      __int16 v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] WalletV2Error: Called generateHomeKeyNFCInfo in old pass library", buf, 0x16u);
    }
  }
  __int16 v19 = [(HMDWalletPassLibrary *)self passLibrary];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __99__HMDWalletPassLibrary_generateHomeKeyNFCInfoWithReaderPublicKey_readerIdentifier_flow_completion___block_invoke;
  v23[3] = &unk_264A27AD8;
  id v24 = v11;
  id v25 = self;
  id v26 = v12;
  id v27 = v13;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  [v19 generateTransactionKeyWithReaderIdentifier:v22 readerPublicKey:v10 completion:v23];
}

void __99__HMDWalletPassLibrary_generateHomeKeyNFCInfoWithReaderPublicKey_readerIdentifier_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v11 && v12 && v13 && v14 && *(void *)(a1 + 32))
  {
    if ([v14 length] == 65)
    {
      id v16 = [HMDHomeWalletKeySecureElementInfo alloc];
      int64_t v17 = objc_msgSend(*(id *)(a1 + 32), "hmf_hexadecimalRepresentation");
      uint64_t v18 = [(HMDHomeWalletKeySecureElementInfo *)v16 initWithDeviceCredentialKey:v14 applicationIdentifier:v12 subCredentialIdentifier:v13 secureElementIdentifier:v11 pairedReaderIdentifier:v17 paymentCredentialType:0];

      uint64_t v19 = *(void *)(a1 + 56);
      id v44 = v18;
      id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
      (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v20, 0);
    }
    else
    {
      uint64_t v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = *(id *)(a1 + 40);
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        [*(id *)(a1 + 48) UUID];
        id v43 = v13;
        id v36 = v12;
        id v37 = v11;
        v39 = id v38 = v15;
        *(_DWORD *)buf = 138544130;
        long long v46 = v35;
        __int16 v47 = 2112;
        v48 = v39;
        __int16 v49 = 2048;
        uint64_t v50 = [v14 length];
        __int16 v51 = 2048;
        uint64_t v52 = 65;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to generate home key nfc info, received unexpected transaction key length: %lu expected: %lu", buf, 0x2Au);

        id v15 = v38;
        id v11 = v37;
        id v12 = v36;
        id v13 = v43;
      }
      uint64_t v40 = *(void *)(a1 + 56);
      long long v41 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      (*(void (**)(uint64_t, void, void *))(v40 + 16))(v40, 0, v41);
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = *(id *)(a1 + 40);
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v24 = v14;
      id v25 = v13;
      id v26 = v12;
      id v27 = v11;
      v29 = id v28 = v15;
      [*(id *)(a1 + 48) UUID];
      __int16 v30 = v42 = v21;
      uint64_t v31 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138545154;
      long long v46 = v29;
      __int16 v47 = 2112;
      v48 = v30;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v27;
      __int16 v51 = 2112;
      uint64_t v52 = (uint64_t)v26;
      __int16 v53 = 2112;
      id v54 = v25;
      __int16 v55 = 2112;
      id v56 = v24;
      __int16 v57 = 2112;
      uint64_t v58 = v31;
      __int16 v59 = 2112;
      id v60 = v28;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to generate home key nfc info because either secureElementIdentifier: %@ is nil or applicationIdentifier: %@ is nil or subCredentialIdentifier: %@ is nil or transactionKey: %@ is nil or readerIdentifier is nil: %@ error: %@", buf, 0x52u);

      id v21 = v42;
      id v15 = v28;
      id v11 = v27;
      id v12 = v26;
      id v13 = v25;
      id v14 = v24;
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)fetchExpressEnablementConflictingPassDescriptionForPassAtURL:(id)a3 flow:(id)a4 completion:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v49 = 0;
  id v11 = (void *)[objc_alloc(MEMORY[0x263F5BEA0]) initWithFileURL:v8 error:&v49];
  id v12 = v49;
  if (v11)
  {
    [v11 setOwnsFileURL:1];
    id v13 = (void *)[MEMORY[0x263F5BF50] createWithValidatedFileDataAccessor:v11];
    id v14 = [v13 paymentPass];

    if (v14)
    {
      uint64_t v15 = [(HMDWalletPassLibrary *)self secureElementIdentifier];
      id v16 = (void *)v15;
      if (v15)
      {
        uint64_t v50 = v15;
        [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
        v17 = id v43 = v12;
        [v14 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v17];

        id v18 = objc_alloc_init(MEMORY[0x263F5C0A8]);
        long long v41 = v16;
        uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F5BE68]) initForPaymentPass:v14 withTechologyTest:&__block_literal_global_56_217911];
        id v20 = objc_alloc(MEMORY[0x263F5BE60]);
        [v14 secureElementPass];
        id v21 = v10;
        id v22 = v8;
        v24 = id v23 = v9;
        id v25 = (void *)[v20 initWithPassInformation:v19 forSecureElementPass:v24];

        id v9 = v23;
        id v8 = v22;
        id v10 = v21;
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __101__HMDWalletPassLibrary_fetchExpressEnablementConflictingPassDescriptionForPassAtURL_flow_completion___block_invoke_2;
        v46[3] = &unk_264A2D180;
        id v48 = v21;
        v46[4] = self;
        id v47 = v9;
        [v18 conflictingExpressPassIdentifiersForPassConfiguration:v25 withCompletion:v46];

        id v12 = v43;
        id v16 = v41;
      }
      else
      {
        id v36 = (void *)MEMORY[0x230FBD990]();
        id v37 = self;
        id v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          long long v39 = v45 = v12;
          [v9 UUID];
          uint64_t v40 = v42 = v36;
          *(_DWORD *)buf = 138543618;
          uint64_t v52 = v39;
          __int16 v53 = 2112;
          id v54 = v40;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express conflict, secure element identifier is nil", buf, 0x16u);

          id v36 = v42;
          id v12 = v45;
        }

        id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        (*((void (**)(id, void, id))v10 + 2))(v10, 0, v18);
      }
    }
    else
    {
      uint64_t v31 = (void *)MEMORY[0x230FBD990]();
      uint64_t v32 = self;
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        [v9 UUID];
        v35 = id v44 = v12;
        *(_DWORD *)buf = 138543874;
        uint64_t v52 = v34;
        __int16 v53 = 2112;
        id v54 = v35;
        __int16 v55 = 2112;
        id v56 = v8;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express conflict, cannot create payment pass at url: %@", buf, 0x20u);

        id v12 = v44;
      }

      id v16 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
    }
  }
  else
  {
    id v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      __int16 v30 = [v9 UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v52 = v29;
      __int16 v53 = 2112;
      id v54 = v30;
      __int16 v55 = 2112;
      id v56 = v8;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express conflict, create data accessor for pass at url: %@", buf, 0x20u);
    }
    id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __101__HMDWalletPassLibrary_fetchExpressEnablementConflictingPassDescriptionForPassAtURL_flow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 anyObject];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) passLibrary];
    id v6 = [v5 passWithUniqueID:v4];

    if (v6)
    {
      uint64_t v7 = [v6 localizedDescription];
      if (!v7)
      {
        id v18 = (void *)MEMORY[0x230FBD990]();
        id v19 = *(id *)(a1 + 32);
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v21 = HMFGetLogIdentifier();
          id v22 = [*(id *)(a1 + 40) UUID];
          int v25 = 138543874;
          id v26 = v21;
          __int16 v27 = 2112;
          id v28 = v22;
          __int16 v29 = 2112;
          __int16 v30 = v4;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to look up for localized description for conflicting pass with identifier: %@", (uint8_t *)&v25, 0x20u);
        }
        uint64_t v23 = *(void *)(a1 + 48);
        id v24 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);

        id v8 = 0;
        goto LABEL_13;
      }
      id v8 = (void *)v7;
      id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = *(id *)(a1 + 32);
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        id v16 = [*(id *)(a1 + 40) UUID];
        int v25 = 138543874;
        id v26 = v15;
        __int16 v27 = 2112;
        id v28 = v16;
        __int16 v29 = 2112;
        __int16 v30 = v4;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to look up for express enablement conflicting pass with identifier: %@", (uint8_t *)&v25, 0x20u);
      }
      uint64_t v17 = *(void *)(a1 + 48);
      id v8 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      id v9 = *(void (**)(void))(v17 + 16);
    }
    v9();
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);

LABEL_14:
}

uint64_t __101__HMDWalletPassLibrary_fetchExpressEnablementConflictingPassDescriptionForPassAtURL_flow_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F5C1F8] supportsExpressForAutomaticSelectionTechnologyType:a2];
}

- (void)fetchExpressEnablementConflictingPassDescriptionForPassAtURL:(id)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F42530];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 untrackedPlaceholderFlow];
  [(HMDWalletPassLibrary *)self fetchExpressEnablementConflictingPassDescriptionForPassAtURL:v8 flow:v9 completion:v7];
}

- (NSString)secureElementIdentifier
{
  return (NSString *)[MEMORY[0x263F5C1F8] primarySecureElementIdentifier];
}

- (id)passUniqueIDOfWalletKeyWithTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDWalletPassLibrary *)self passLibrary];
  id v9 = [v8 passWithPassTypeIdentifier:v6 serialNumber:v7];

  if (v9)
  {
    id v10 = v9;
    objc_opt_class();
    int v11 = objc_opt_isKindOfClass() & 1;
    if (v11) {
      id v12 = v10;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    if (v11)
    {
      id v14 = [v10 uniqueID];
    }
    else
    {
      id v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = self;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        int v25 = 138543874;
        id v26 = v22;
        __int16 v27 = 2112;
        id v28 = v10;
        __int16 v29 = 2112;
        id v30 = (id)objc_opt_class();
        id v23 = v30;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Pass object is not of type payment pass %@:%@", (uint8_t *)&v25, 0x20u);
      }
      id v14 = 0;
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      int v25 = 138543874;
      id v26 = v18;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to find pass with type identifier: %@ and serial number: %@", (uint8_t *)&v25, 0x20u);
    }
    id v14 = 0;
  }

  return v14;
}

- (void)fetchIsExpressEnabledForPassWithTypeIdentifier:(id)a3 serialNumber:(id)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, uint64_t, void))a6;
  id v14 = [(HMDWalletPassLibrary *)self passLibrary];
  uint64_t v15 = [v14 passWithPassTypeIdentifier:v10 serialNumber:v11];

  if (v15)
  {
    id v43 = v10;
    id v44 = v12;
    id v42 = v11;
    id v16 = v15;
    objc_opt_class();
    int v17 = objc_opt_isKindOfClass() & 1;
    if (v17) {
      id v18 = v16;
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;

    if (v17)
    {
      id v20 = objc_alloc_init(MEMORY[0x263F5C0A8]);
      id v21 = [v16 uniqueID];
      id v22 = [v20 expressPassConfigurationWithPassUniqueIdentifier:v21];

      id v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = self;
      int v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = HMFGetLogIdentifier();
        uint64_t v40 = [v44 UUID];
        [v22 isNFCExpressEnabled];
        HMFBooleanToString();
        v27 = id v41 = v19;
        [v22 isUWBExpressEnabled];
        id v28 = HMFBooleanToString();
        *(_DWORD *)buf = 138544130;
        long long v46 = v26;
        __int16 v47 = 2112;
        id v48 = v40;
        __int16 v49 = 2112;
        id v50 = v27;
        __int16 v51 = 2112;
        id v52 = v28;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found current express config with expressEnabled: %@, UWBEnabled: %@", buf, 0x2Au);

        id v19 = v41;
      }

      v13[2](v13, [v22 isNFCExpressEnabled], objc_msgSend(v22, "isUWBExpressEnabled"), 0);
    }
    else
    {
      v34 = (void *)MEMORY[0x230FBD990]();
      v35 = self;
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v37 = HMFGetLogIdentifier();
        id v38 = [v44 UUID];
        *(_DWORD *)buf = 138544130;
        long long v46 = v37;
        __int16 v47 = 2112;
        id v48 = v38;
        __int16 v49 = 2112;
        id v50 = v16;
        __int16 v51 = 2112;
        id v52 = (id)objc_opt_class();
        id v39 = v52;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Pass object is not of type payment pass %@:%@", buf, 0x2Au);
      }
      id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      ((void (**)(id, uint64_t, uint64_t, id))v13)[2](v13, 0, 0, v20);
    }
    id v11 = v42;

    id v10 = v43;
    id v12 = v44;
  }
  else
  {
    __int16 v29 = (void *)MEMORY[0x230FBD990]();
    id v30 = self;
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      id v33 = [v12 UUID];
      *(_DWORD *)buf = 138544130;
      long long v46 = v32;
      __int16 v47 = 2112;
      id v48 = v33;
      __int16 v49 = 2112;
      id v50 = v10;
      __int16 v51 = 2112;
      id v52 = v11;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unable to find pass with type identifier: %@ and serial number: %@", buf, 0x2Au);
    }
    id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    ((void (**)(id, uint64_t, uint64_t, id))v13)[2](v13, 0, 0, v19);
  }
}

- (BOOL)isExpressModeEnabledForPassUniqueIdentifier:(id)a3 serialNumber:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDWalletPassLibrary *)self passLibrary];
  id v9 = [v8 passWithPassTypeIdentifier:v6 serialNumber:v7];

  if (v9)
  {
    id v10 = v9;
    objc_opt_class();
    int v11 = objc_opt_isKindOfClass() & 1;
    if (v11) {
      id v12 = v10;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    if (v11)
    {
      id v14 = objc_alloc_init(MEMORY[0x263F5C0A8]);
      uint64_t v15 = [v10 uniqueID];
      char v16 = [v14 isExpressModeEnabledForPassUniqueIdentifier:v15];
    }
    else
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        int v27 = 138543874;
        id v28 = v24;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2112;
        id v32 = (id)objc_opt_class();
        id v25 = v32;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Pass object is not of type payment pass %@:%@", (uint8_t *)&v27, 0x20u);
      }
      char v16 = 0;
    }
  }
  else
  {
    int v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      int v27 = 138543874;
      id v28 = v20;
      __int16 v29 = 2112;
      id v30 = v6;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to find pass with type identifier: %@ and serial number: %@", (uint8_t *)&v27, 0x20u);
    }
    char v16 = 0;
  }

  return v16;
}

- (void)setExpressSettingsWithAuthData:(id)a3 enableUWB:(BOOL)a4 enableNFCExpress:(BOOL)a5 passTypeIdentifier:(id)a6 serialNumber:(id)a7 flow:(id)a8 completion:(id)a9
{
  BOOL v12 = a5;
  BOOL v13 = a4;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v51 = a3;
  id v15 = a6;
  id v16 = a7;
  id v52 = a8;
  id v17 = a9;
  id v18 = [(HMDWalletPassLibrary *)self passLibrary];
  id v50 = v16;
  id v19 = [v18 passWithPassTypeIdentifier:v15 serialNumber:v16];

  if (v19)
  {
    id v49 = v15;
    id v20 = v19;
    objc_opt_class();
    int v21 = objc_opt_isKindOfClass() & 1;
    if (v21) {
      id v22 = v20;
    }
    else {
      id v22 = 0;
    }
    id v23 = v22;

    if (v21)
    {
      id v24 = (void *)[objc_alloc(MEMORY[0x263F5BE60]) initForPaymentPass:v20 isNFCExpressEnabled:v12 isUWBExpressEnabled:v13 withTechologyTest:&__block_literal_global_50_217930];
      id v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = self;
      int v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = HMFGetLogIdentifier();
        [v52 UUID];
        v29 = __int16 v47 = v25;
        id v30 = HMFBooleanToString();
        __int16 v31 = HMFBooleanToString();
        *(_DWORD *)buf = 138544130;
        uint64_t v57 = v28;
        __int16 v58 = 2112;
        __int16 v59 = v29;
        __int16 v60 = 2112;
        id v61 = v30;
        __int16 v62 = 2112;
        id v63 = v31;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Setting express settings with enableUWB: %@, enableNFCExpress: %@", buf, 0x2Au);

        id v25 = v47;
      }

      id v32 = objc_alloc_init(MEMORY[0x263F5C0A8]);
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __130__HMDWalletPassLibrary_setExpressSettingsWithAuthData_enableUWB_enableNFCExpress_passTypeIdentifier_serialNumber_flow_completion___block_invoke_51;
      v53[3] = &unk_264A27AB0;
      v53[4] = v26;
      uint64_t v33 = v52;
      id v54 = v52;
      id v55 = v17;
      v34 = v51;
      [v32 setExpressWithPassConfiguration:v24 credential:v51 handler:v53];
    }
    else
    {
      id v41 = (void *)MEMORY[0x230FBD990]();
      id v42 = self;
      id v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        id v44 = HMFGetLogIdentifier();
        [v52 UUID];
        id v45 = v48 = v41;
        *(_DWORD *)buf = 138544130;
        uint64_t v57 = v44;
        __int16 v58 = 2112;
        __int16 v59 = v45;
        __int16 v60 = 2112;
        id v61 = v20;
        __int16 v62 = 2112;
        id v63 = (id)objc_opt_class();
        id v46 = v63;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Pass object is not of type payment pass %@:%@", buf, 0x2Au);

        id v41 = v48;
      }

      id v24 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      (*((void (**)(id, void *))v17 + 2))(v17, v24);
      v34 = v51;
      uint64_t v33 = v52;
    }
    id v38 = v50;

    id v15 = v49;
  }
  else
  {
    v35 = (void *)MEMORY[0x230FBD990]();
    id v36 = self;
    id v37 = HMFGetOSLogHandle();
    uint64_t v33 = v52;
    id v38 = v50;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v39 = HMFGetLogIdentifier();
      uint64_t v40 = [v52 UUID];
      *(_DWORD *)buf = 138544130;
      uint64_t v57 = v39;
      __int16 v58 = 2112;
      __int16 v59 = v40;
      __int16 v60 = 2112;
      id v61 = v15;
      __int16 v62 = 2112;
      id v63 = v50;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unable to find pass with type identifier: %@ and serial number: %@", buf, 0x2Au);
    }
    id v23 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*((void (**)(id, id))v17 + 2))(v17, v23);
    v34 = v51;
  }
}

void __130__HMDWalletPassLibrary_setExpressSettingsWithAuthData_enableUWB_enableNFCExpress_passTypeIdentifier_serialNumber_flow_completion___block_invoke_51(uint64_t a1, char a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = [*(id *)(a1 + 40) UUID];
      int v16 = 138543618;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully set express settings for home key", (uint8_t *)&v16, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = HMFGetLogIdentifier();
      BOOL v13 = [*(id *)(a1 + 40) UUID];
      int v16 = 138543874;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set express config. Current state is: %@", (uint8_t *)&v16, 0x20u);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

uint64_t __130__HMDWalletPassLibrary_setExpressSettingsWithAuthData_enableUWB_enableNFCExpress_passTypeIdentifier_serialNumber_flow_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F5C1F8] supportsExpressForAutomaticSelectionTechnologyType:a2];
}

- (void)enableExpressWithAuthData:(id)a3 passTypeIdentifier:(id)a4 serialNumber:(id)a5 flow:(id)a6 completion:(id)a7
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v51 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = [(HMDWalletPassLibrary *)self passLibrary];
  id v17 = [v16 passWithPassTypeIdentifier:v12 serialNumber:v13];

  if (v17)
  {
    id v49 = v12;
    id v50 = v14;
    id v48 = v13;
    id v18 = v17;
    objc_opt_class();
    int v19 = objc_opt_isKindOfClass() & 1;
    if (v19) {
      __int16 v20 = v18;
    }
    else {
      __int16 v20 = 0;
    }
    id v21 = v20;

    if (v19)
    {
      id v22 = objc_alloc_init(MEMORY[0x263F5C0A8]);
      id v23 = [v18 uniqueID];
      id v24 = [v22 expressPassConfigurationWithPassUniqueIdentifier:v23];

      id v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = self;
      int v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v28 = v45 = v21;
        [v50 UUID];
        v29 = id v46 = v25;
        [v24 isNFCExpressEnabled];
        id v30 = HMFBooleanToString();
        [v24 isUWBExpressEnabled];
        HMFBooleanToString();
        __int16 v31 = v47 = v24;
        *(_DWORD *)buf = 138544130;
        id v56 = v28;
        __int16 v57 = 2112;
        __int16 v58 = v29;
        __int16 v59 = 2112;
        id v60 = v30;
        __int16 v61 = 2112;
        id v62 = v31;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found current express config with expressEnabled: %@, UWBEnabled: %@", buf, 0x2Au);

        id v25 = v46;
        id v24 = v47;

        id v21 = v45;
      }

      id v32 = objc_msgSend(objc_alloc(MEMORY[0x263F5BE60]), "initForPaymentPass:isNFCExpressEnabled:isUWBExpressEnabled:withTechologyTest:", v18, 1, objc_msgSend(v24, "isUWBExpressEnabled"), &__block_literal_global_217939);
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __98__HMDWalletPassLibrary_enableExpressWithAuthData_passTypeIdentifier_serialNumber_flow_completion___block_invoke_2;
      v52[3] = &unk_264A27AB0;
      v52[4] = v26;
      id v14 = v50;
      id v53 = v50;
      id v54 = v15;
      [v22 setExpressWithPassConfiguration:v32 credential:v51 handler:v52];
    }
    else
    {
      id v39 = (void *)MEMORY[0x230FBD990]();
      uint64_t v40 = self;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v42 = HMFGetLogIdentifier();
        id v43 = [v50 UUID];
        *(_DWORD *)buf = 138544130;
        id v56 = v42;
        __int16 v57 = 2112;
        __int16 v58 = v43;
        __int16 v59 = 2112;
        id v60 = v18;
        __int16 v61 = 2112;
        id v62 = (id)objc_opt_class();
        id v44 = v62;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Pass object is not of type payment pass %@:%@", buf, 0x2Au);
      }
      id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      (*((void (**)(id, id))v15 + 2))(v15, v22);
      id v14 = v50;
    }

    id v13 = v48;
    id v12 = v49;
  }
  else
  {
    uint64_t v33 = (void *)MEMORY[0x230FBD990]();
    v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = id v36 = v14;
      id v38 = [v36 UUID];
      *(_DWORD *)buf = 138544130;
      id v56 = v37;
      __int16 v57 = 2112;
      __int16 v58 = v38;
      __int16 v59 = 2112;
      id v60 = v12;
      __int16 v61 = 2112;
      id v62 = v13;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unable to find pass with type identifier: %@ and serial number: %@", buf, 0x2Au);

      id v14 = v36;
    }

    id v21 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*((void (**)(id, id))v15 + 2))(v15, v21);
  }
}

void __98__HMDWalletPassLibrary_enableExpressWithAuthData_passTypeIdentifier_serialNumber_flow_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 40) UUID];
      int v13 = 138543874;
      id v14 = v9;
      __int16 v15 = 2112;
      int v16 = v10;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set express config. Current state is: %@", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

uint64_t __98__HMDWalletPassLibrary_enableExpressWithAuthData_passTypeIdentifier_serialNumber_flow_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F5C1F8] supportsExpressForAutomaticSelectionTechnologyType:a2];
}

- (void)fetchHomeKeySupportedWithFlow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDWalletPassLibrary *)self passLibrary];
  id v9 = objc_alloc_init(MEMORY[0x263F5BD10]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__HMDWalletPassLibrary_fetchHomeKeySupportedWithFlow_completion___block_invoke;
  v12[3] = &unk_264A27A68;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 canAddSecureElementPassWithConfiguration:v9 completion:v12];
}

void __65__HMDWalletPassLibrary_fetchHomeKeySupportedWithFlow_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(a1 + 40) UUID];
    id v10 = HMFBooleanToString();
    int v11 = 138544130;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    int v16 = v10;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet responded to canAddSecureElementPassWithConfiguration with canAdd: %@, error: %@", (uint8_t *)&v11, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)removePassWithTypeIdentifier:(id)a3 serialNumber:(id)a4 flow:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    int v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      __int16 v15 = [v10 UUID];
      int v28 = 138543618;
      __int16 v29 = v14;
      __int16 v30 = 2112;
      __int16 v31 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] WalletV2Error: Called removePass in old pass library", (uint8_t *)&v28, 0x16u);
    }
  }
  int v16 = [(HMDWalletPassLibrary *)self passLibrary];
  __int16 v17 = [v16 passWithPassTypeIdentifier:v8 serialNumber:v9];

  if (v17)
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [v10 UUID];
      int v28 = 138544386;
      __int16 v29 = v21;
      __int16 v30 = 2112;
      __int16 v31 = v22;
      __int16 v32 = 2112;
      id v33 = v8;
      __int16 v34 = 2112;
      id v35 = v9;
      __int16 v36 = 2112;
      id v37 = v17;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing pass with identifier: %@ and serial number: %@: %@", (uint8_t *)&v28, 0x34u);
    }
    id v23 = [(HMDWalletPassLibrary *)v19 passLibrary];
    [v23 removePass:v17];

    id v24 = [(HMDWalletPassLibrary *)v19 walletKeys];
    BOOL v25 = [v24 count] == 0;

    id v26 = +[HMDHomeKeyDataRecorder sharedRecorder];
    [v26 recordRemovedWalletKeyWithSerialNumber:v9 noWalletKeysRemaining:v25];
  }
  return v17 != 0;
}

- (id)urlForWalletKeyWithTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDWalletPassLibrary *)self passLibrary];
  id v9 = [v8 passWithPassTypeIdentifier:v7 serialNumber:v6];

  id v10 = [v9 passURL];

  return v10;
}

- (id)walletKeyWithTypeIdentifier:(id)a3 serialNumber:(id)a4 flow:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    int v11 = [(HMDWalletPassLibrary *)self passLibrary];
    id v12 = [v11 passWithPassTypeIdentifier:v8 serialNumber:v9];

    __int16 v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      __int16 v17 = [v10 UUID];
      int v25 = 138544386;
      id v26 = v16;
      __int16 v27 = 2112;
      int v28 = v17;
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      id v32 = v9;
      __int16 v33 = 2112;
      __int16 v34 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found pass with identifier: %@ and serial number: %@: %@", (uint8_t *)&v25, 0x34u);
    }
    if (v12) {
      id v18 = [[HMDHomeWalletKey alloc] initWithPKPass:v12 flow:v10];
    }
    else {
      id v18 = 0;
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    __int16 v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      id v23 = [v10 UUID];
      int v25 = 138544130;
      id v26 = v22;
      __int16 v27 = 2112;
      int v28 = v23;
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Invalid parameter when looking up wallet key. typeIdentifier: %@, serialNumber: %@", (uint8_t *)&v25, 0x2Au);
    }
    id v18 = 0;
  }

  return v18;
}

- (void)updatePassAtURL:(id)a3 flow:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    int v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      __int16 v15 = [v9 UUID];
      *(_DWORD *)buf = 138543618;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] WalletV2Error: Called updatePass in old pass library", buf, 0x16u);
    }
  }
  int v16 = [(HMDWalletPassLibrary *)self passLibrary];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__HMDWalletPassLibrary_updatePassAtURL_flow_completion___block_invoke;
  v18[3] = &unk_264A29300;
  id v19 = v10;
  id v17 = v10;
  [v16 replaceUnsignedPassAtURL:v8 withCompletionHandler:v18];
}

void __56__HMDWalletPassLibrary_updatePassAtURL_flow_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 0);
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
}

- (void)addPassAtURL:(id)a3 flow:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    int v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      __int16 v15 = [v9 UUID];
      *(_DWORD *)buf = 138543618;
      int v28 = v14;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] WalletV2Error: Called addPass in old pass library", buf, 0x16u);
    }
  }
  objc_initWeak((id *)buf, self);
  int v16 = [(HMDWalletPassLibrary *)self passLibrary];
  id v26 = v8;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __53__HMDWalletPassLibrary_addPassAtURL_flow_completion___block_invoke;
  v21[3] = &unk_264A27A40;
  objc_copyWeak(&v25, (id *)buf);
  id v18 = v9;
  id v22 = v18;
  id v19 = v8;
  id v23 = v19;
  id v20 = v10;
  id v24 = v20;
  [v16 addUnsignedPassesAtURLs:v17 withCompletionHandler:v21];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

void __53__HMDWalletPassLibrary_addPassAtURL_flow_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(a1 + 32) UUID];
    uint64_t v10 = *(void *)(a1 + 40);
    int v13 = 138544130;
    id v14 = v8;
    __int16 v15 = 2112;
    int v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = a2;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addUnsignedPassesAtURLs: %@, finished with status: %ld", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (a2)
  {
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
  }
}

- (void)start
{
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *MEMORY[0x263F5C650];
  uint64_t v4 = [(HMDWalletPassLibrary *)self passLibrary];
  [v5 addObserver:self selector:sel_handlePassLibraryDidChangeNotification_ name:v3 object:v4];
}

- (NSSet)walletKeys
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  uint64_t v4 = [(HMDWalletPassLibrary *)self passLibrary];
  id v5 = [v4 passes];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "secureElementPass", (void)v19);
        int v13 = [v12 isHomeKeyPass];

        if (v13)
        {
          id v14 = [HMDHomeWalletKey alloc];
          __int16 v15 = [MEMORY[0x263F42530] untrackedPlaceholderFlow];
          int v16 = [(HMDHomeWalletKey *)v14 initWithPKPass:v11 flow:v15];

          [v3 addObject:v16];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  __int16 v17 = (void *)[v3 copy];
  return (NSSet *)v17;
}

- (HMDWalletPassLibrary)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDWalletPassLibrary;
  id v6 = [(HMDWalletPassLibrary *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    uint64_t v8 = [MEMORY[0x263F5BF80] sharedInstance];
    passLibrary = v7->_passLibrary;
    v7->_passLibrary = (PKPassLibrary *)v8;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t44_217964 != -1) {
    dispatch_once(&logCategory__hmf_once_t44_217964, &__block_literal_global_74_217965);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v45_217966;
  return v2;
}

void __35__HMDWalletPassLibrary_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v45_217966;
  logCategory__hmf_once_v45_217966 = v0;
}

@end