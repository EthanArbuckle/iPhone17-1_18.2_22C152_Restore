@interface HAPSystemKeychainStore
+ (id)getDictionaryFromGenericData:(id)a3;
+ (id)logCategory;
+ (id)serializeDictionary:(id)a3;
+ (id)systemStore;
+ (id)updateAccessoryPairingGenericData:(id)a3 updatedControllerKeyIdentifier:(id)a4;
+ (id)viewHintForType:(id)a3;
- (BOOL)_getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6 allowCreation:(BOOL)a7 forAccessory:(id)a8 error:(id *)a9;
- (BOOL)_getFirstAvailableControllerKeyChainItemForAccount:(id)a3 publicKey:(id *)a4 secretKey:(id *)a5 userName:(id *)a6 keyPair:(id *)a7 error:(id *)a8;
- (BOOL)_savePairingIdentityToBackUpTableWithIdentifier:(id)a3 serializedKeyPair:(id)a4;
- (BOOL)_updateKeychainItemWithPlatformIdentifier:(void *)a3 keychainItem:(id)a4 error:(id *)a5;
- (BOOL)createAccessoryPairingKey:(id)a3 error:(id *)a4;
- (BOOL)deleteAllPeripheralIdentifiers:(id *)a3;
- (BOOL)deleteKeychainItem:(id)a3 error:(id *)a4;
- (BOOL)deletePairingKeysForAccessory:(id)a3 error:(id *)a4;
- (BOOL)deletePeripheralIdentifierForAccessoryIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deserializeKeyPair:(id)a3 publicKey:(id *)a4 secretKey:(id *)a5 error:(id *)a6;
- (BOOL)establishRelationshipBetweenAccessoryAndControllerKey:(id)a3 error:(id *)a4;
- (BOOL)getAllAvailableControllerPublicKeys:(id *)a3 secretKeys:(id *)a4 userNames:(id *)a5 error:(id *)a6;
- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6 allowCreation:(BOOL)a7 error:(id *)a8;
- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6 allowCreation:(BOOL)a7 forAccessory:(id)a8 error:(id *)a9;
- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 username:(id *)a5 allowCreation:(BOOL)a6 error:(id *)a7;
- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 username:(id *)a5 allowCreation:(BOOL)a6 forAccessory:(id)a7 error:(id *)a8;
- (BOOL)getCurrentiCloudIdentifier:(id *)a3 controllerPairingIdentifier:(id *)a4 error:(id *)a5;
- (BOOL)getOrCreateHH2ControllerKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6;
- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3 controllerID:(id *)a4;
- (BOOL)isHH2Enabled;
- (BOOL)isHH2KeyType:(id)a3;
- (BOOL)registerAccessoryWithHomeKit:(id)a3 error:(id *)a4;
- (BOOL)removeAccessoryKeyForName:(id)a3 error:(id *)a4;
- (BOOL)removeAllAccessoryKeys:(id *)a3;
- (BOOL)removeControllerKeyPairForIdentifier:(id)a3 leaveTombstone:(BOOL)a4 error:(id *)a5;
- (BOOL)removeControllerKeyPairLeaveTombstone:(BOOL)a3 error:(id *)a4;
- (BOOL)removeControllerKeyPairWithError:(id *)a3;
- (BOOL)saveAppleMediaAccessoryPairingIdentity:(id)a3;
- (BOOL)saveAppleMediaAccessorySensorPairingIdentity:(id)a3;
- (BOOL)saveHH2PairingIdentity:(id)a3 syncable:(BOOL)a4;
- (BOOL)saveKeyPair:(id)a3 username:(id)a4 syncable:(BOOL)a5 error:(id *)a6;
- (BOOL)saveLocalPairingIdentity:(id)a3 syncable:(BOOL)a4 error:(id *)a5;
- (BOOL)savePairingIdentityToBackUpTable:(id)a3;
- (BOOL)savePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 resumeSessionID:(unint64_t)a6 error:(id *)a7;
- (BOOL)savePublicKey:(id)a3 forAccessoryName:(id)a4 error:(id *)a5;
- (BOOL)triggerPreferredHH2ControllerKeyRoll;
- (BOOL)unitTest_enable_hh2;
- (BOOL)updateAccessoryPairingKey:(id)a3 error:(id *)a4;
- (BOOL)updateActiveControllerPairingIdentifier:(id)a3;
- (BOOL)updateCurrentiCloudIdentifier:(id)a3 controllerPairingIdentifier:(id)a4 error:(id *)a5;
- (BOOL)updateKeychainItem:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5;
- (BOOL)updatePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 previousVersion:(unint64_t *)a6 resumeSessionID:(unint64_t)a7 error:(id *)a8;
- (HAPSystemKeychainStore)init;
- (NSString)activeControllerIdentifier;
- (NSString)activeControllerPairingIdentifier;
- (OS_dispatch_queue)queue;
- (id)_allAccessoryPairingKeysIncludingHH2Key:(BOOL)a3;
- (id)_auditKeychainItems:(id)a3 managedAccessories:(id)a4;
- (id)_chooseHH2KeyFromMultipleHH2Keys:(id)a3;
- (id)_getControllerKeychainItemError:(int *)a3;
- (id)_getControllerKeychainItemForKeyType:(id)a3 error:(int *)a4;
- (id)_getKeychainItemsForAccessGroup:(id)a3 type:(id)a4 account:(id)a5 shouldReturnData:(BOOL)a6 error:(int *)a7;
- (id)_getLocalPairingIdentityAllowingCreation:(BOOL)a3 error:(id *)a4;
- (id)_lookupPairingIdentityFromBackUpTableWithIdentifier:(id)a3;
- (id)allAccessoryPairingKeys;
- (id)allHH2PairingKeys;
- (id)allKeychainItemsForType:(id)a3 identifier:(id)a4 syncable:(id)a5 error:(id *)a6;
- (id)allKeysForType:(id)a3 error:(id *)a4;
- (id)allLegacyAccessoryPairingKeys;
- (id)auditKeysOfManagedAccessories:(id)a3;
- (id)countAccessoryPairingKeysForMetrics;
- (id)dumpState;
- (id)getAssociatedControllerKeyForAccessory:(id)a3;
- (id)getHH2ControllerKeyWithIdentifier:(id)a3;
- (id)getLocalPairingIdentity:(id *)a3;
- (id)getOrCreateLocalPairingIdentity:(id *)a3;
- (id)getPeripheralIdentifiersAndAccessoryNames;
- (id)getPreferredHH2ControllerKey;
- (id)pairingIdentityForAppleMediaAccessorySensorWithUUID:(id)a3;
- (id)pairingIdentityForAppleMediaAccessoryWithUUID:(id)a3;
- (id)pairingIdentityFromKeychainItem:(id)a3;
- (id)readAccessoryPairingKeyForAccessory:(id)a3 error:(id *)a4;
- (id)readControllerPairingKeyForAccessory:(id)a3 error:(id *)a4;
- (id)readPeripheralIdentifierForAccessoryIdentifier:(id)a3 protocolVersion:(unint64_t *)a4 resumeSessionID:(unint64_t *)a5 error:(id *)a6;
- (id)readPublicKeyForAccessoryName:(id)a3 registeredWithHomeKit:(BOOL *)a4 error:(id *)a5;
- (int)_addKeychainItem:(id)a3 logDuplicateItemError:(BOOL)a4;
- (int)_createControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6;
- (int)_deleteAllPeripheralIdentifiers;
- (int)_deletePeripheralIdentifierForAccessoryIdentifier:(id)a3;
- (int)_getAllAvailableControllerPublicKeys:(id *)a3 secretKeys:(id *)a4 userNames:(id *)a5;
- (int)_getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6;
- (int)_getPeripheralIdentifier:(id *)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t *)a5 resumeSessionID:(unint64_t *)a6;
- (int)_getPublicKey:(id *)a3 registeredWithHomeKit:(BOOL *)a4 forAccessoryName:(id)a5;
- (int)_removeAccessoryKeyForName:(id)a3;
- (int)_removeControllerKeyPairForIdentifier:(id)a3 leaveTombstone:(BOOL)a4;
- (int)_removeControllerKeyPairForKeyType:(id)a3 identifier:(id)a4 leaveTombstone:(BOOL)a5;
- (int)_removeKeychainItem:(id)a3 leaveTombstone:(BOOL)a4;
- (int)_saveKeyPair:(id)a3 username:(id)a4 syncable:(BOOL)a5 keyType:(id)a6;
- (int)_savePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 resumeSessionID:(unint64_t)a6;
- (int)_savePublicKey:(id)a3 forAccessoryName:(id)a4;
- (int)_updateCurrentiCloudIdentifier:(id)a3 controllerPairingIdentifier:(id)a4;
- (int)createHH2ControllerKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6;
- (int)createHH2ControllerKeyWithUsername:(id)a3 publicKey:(id *)a4 secretKey:(id *)a5 keyPair:(id *)a6 username:(id *)a7;
- (int)keychainStoreUpdatedNotificationToken;
- (void)_updateKeychainItemToInvisible:(id)a3;
- (void)configure;
- (void)dealloc;
- (void)ensureControllerKeyExistsForAllViews;
- (void)setActiveControllerIdentifier:(id)a3;
- (void)setKeychainStoreUpdatedNotificationToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)setUnitTest_enable_hh2:(BOOL)a3;
@end

@implementation HAPSystemKeychainStore

- (id)readPublicKeyForAccessoryName:(id)a3 registeredWithHomeKit:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5093;
  v28 = __Block_byref_object_dispose__5094;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5093;
  v22 = __Block_byref_object_dispose__5094;
  id v23 = 0;
  v9 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HAPSystemKeychainStore_readPublicKeyForAccessoryName_registeredWithHomeKit_error___block_invoke;
  block[3] = &unk_1E69F2D50;
  block[4] = self;
  v15 = &v24;
  v17 = a4;
  id v10 = v8;
  id v14 = v10;
  v16 = &v18;
  dispatch_sync(v9, block);

  if (a5) {
    *a5 = (id) v19[5];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __84__HAPSystemKeychainStore_readPublicKeyForAccessoryName_registeredWithHomeKit_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v2 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _getPublicKey:&obj registeredWithHomeKit:*(void *)(a1 + 64) forAccessoryName:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(v2 + 40), obj);
  uint64_t v4 = HMErrorFromOSStatus(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (int)_getPublicKey:(id *)a3 registeredWithHomeKit:(BOOL *)a4 forAccessoryName:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int v46 = 0;
  v9 = [NSNumber numberWithUnsignedInt:1751216193];
  id v10 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v9 account:v8 shouldReturnData:1 error:&v46];

  int v11 = v46;
  if (v46)
  {
    v27 = 0;
    if (!a3) {
      goto LABEL_28;
    }
LABEL_25:
    if (!v11)
    {
      id v36 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v47 length:32];
      *a3 = v36;

      int v11 = v46;
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  if ([v10 count] != 1)
  {
    v38 = a4;
    v40 = a3;
    v12 = (void *)MEMORY[0x1D944E080]();
    v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      uint64_t v16 = [v10 count];
      *(_DWORD *)buf = 138543874;
      v50 = v15;
      __int16 v51 = 2048;
      uint64_t v52 = v16;
      __int16 v53 = 2112;
      id v54 = v8;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_INFO, "%{public}@Invalid number of keychain items(%tu) for accessory '%@'", buf, 0x20u);
    }
    id v41 = v8;

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v39 = v10;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          id v23 = (void *)MEMORY[0x1D944E080]();
          uint64_t v24 = v13;
          v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            uint64_t v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v50 = v26;
            __int16 v51 = 2112;
            uint64_t v52 = v22;
            _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_INFO, "%{public}@Keychain item %@", buf, 0x16u);
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v19);
    }

    a3 = v40;
    id v8 = v41;
    a4 = v38;
    id v10 = v39;
  }
  if ([v10 count] != 1)
  {
    v27 = 0;
    int v11 = -6764;
    int v46 = -6764;
    if (!a3) {
      goto LABEL_28;
    }
LABEL_26:
    *a3 = 0;
    goto LABEL_28;
  }
  v27 = [v10 firstObject];
  id v28 = [v27 valueData];
  uint64_t v29 = [v28 bytes];
  v30 = [v27 valueData];
  int v46 = _deserializePublicKey(v29, [v30 length]);

  if (a4)
  {
    v31 = [v27 genericData];

    if (v31)
    {
      v32 = (void *)MEMORY[0x1E4F28F98];
      v33 = [v27 genericData];
      v34 = [v32 propertyListWithData:v33 options:0 format:0 error:0];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_21:
        v35 = [v34 objectForKeyedSubscript:@"homeKitRegistered"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v35 = 0;
        }
        *a4 = [v35 BOOLValue];

        goto LABEL_24;
      }
    }
    v34 = 0;
    goto LABEL_21;
  }
LABEL_24:
  int v11 = v46;
  if (a3) {
    goto LABEL_25;
  }
LABEL_28:

  return v11;
}

- (id)_getKeychainItemsForAccessGroup:(id)a3 type:(id)a4 account:(id)a5 shouldReturnData:(BOOL)a6 error:(int *)a7
{
  BOOL v8 = a6;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  value = __viewHintForKeyType(v13);
  id v15 = 0;
  OSStatus v16 = -6705;
  id v17 = 0;
  if (!v12 || !v13)
  {
LABEL_32:
    if (!a7) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], v12);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B8C0], v13);
  if (v14) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v14);
  }
  uint64_t v19 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC68], (const void *)*MEMORY[0x1E4F1CFD0]);
  if (v8) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = (const void *)*MEMORY[0x1E4F1CFC8];
  }
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], v20);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], (const void *)*MEMORY[0x1E4F3B880]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC78], v19);
  if (value) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B870], value);
  }
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BB80], (const void *)*MEMORY[0x1E4F3BB88]);
  CFTypeRef result = 0;
  OSStatus v16 = SecItemCopyMatching(Mutable, &result);
  CFRelease(Mutable);
  if (!v16)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CFTypeID v21 = CFGetTypeID(result);
    if (v21 == CFArrayGetTypeID())
    {
      id v40 = v12;
      id v41 = v14;
      id v38 = v13;
      v39 = a7;
      CFIndex v22 = 0;
      id v17 = 0;
      while (CFArrayGetCount((CFArrayRef)result) > v22)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)result, v22);
        if (+[HAPKeychainItem isQueryResultValid:ValueAtIndex shouldIncludeData:v8])
        {
          uint64_t v24 = [[HAPKeychainItem alloc] initWithQueryResult:ValueAtIndex shouldIncludeData:v8];

          [v15 addObject:v24];
          [(HAPSystemKeychainStore *)self _updateKeychainItemToInvisible:v24];
          id v17 = v24;
        }
        else
        {
          v25 = (void *)MEMORY[0x1D944E080]();
          uint64_t v26 = self;
          v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            id v28 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            long long v45 = v28;
            _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Corrupted keychain item detected. Ignoring", buf, 0xCu);
          }
        }
        ++v22;
      }
      a7 = v39;
      id v12 = v40;
      id v13 = v38;
      goto LABEL_30;
    }
    CFTypeID v29 = CFGetTypeID(result);
    if (v29 == CFDictionaryGetTypeID())
    {
      if (+[HAPKeychainItem isQueryResultValid:result shouldIncludeData:v8])
      {
        v30 = [HAPKeychainItem alloc];
        id v17 = [(HAPKeychainItem *)v30 initWithQueryResult:result shouldIncludeData:v8];
        [v15 addObject:v17];
        [(HAPSystemKeychainStore *)self _updateKeychainItemToInvisible:v17];
LABEL_31:
        CFRelease(result);
        OSStatus v16 = 0;
        goto LABEL_32;
      }
      id v41 = v14;
      id v31 = v13;
      v32 = (void *)MEMORY[0x1D944E080]();
      v33 = self;
      v34 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v45 = v35;
      id v36 = "%{public}@Corrupted keychain item detected. Ignoring";
    }
    else
    {
      id v41 = v14;
      id v31 = v13;
      v32 = (void *)MEMORY[0x1D944E080]();
      v33 = self;
      v34 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
LABEL_29:

        id v17 = 0;
        id v13 = v31;
LABEL_30:
        id v14 = v41;
        goto LABEL_31;
      }
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v45 = v35;
      id v36 = "%{public}@Unexpected type returned from keychain result";
    }
    _os_log_impl(&dword_1D4758000, v34, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);

    goto LABEL_29;
  }
  id v15 = 0;
  id v17 = 0;
  if (a7) {
LABEL_33:
  }
    *a7 = v16;
LABEL_34:

  return v15;
}

- (void)_updateKeychainItemToInvisible:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isSyncable]
    && ([v4 isInvisible] & 1) == 0
    && [v4 platformReference])
  {
    uint64_t v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    BOOL v8 = (const void *)[v4 platformReference];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD40], v8);
    v9 = CFDictionaryCreateMutable(0, 0, v5, v6);
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      CFDictionaryAddValue(v9, (const void *)*MEMORY[0x1E4F3B698], (const void *)*MEMORY[0x1E4F1CFD0]);
      OSStatus v11 = SecItemUpdate(Mutable, v10);
      if (v11)
      {
        OSStatus v12 = v11;
        id v13 = (void *)MEMORY[0x1D944E080]();
        id v14 = self;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          OSStatus v16 = HMFGetLogIdentifier();
          int v18 = 138543618;
          uint64_t v19 = v16;
          __int16 v20 = 1024;
          OSStatus v21 = v12;
          _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to updated keychain item to set invisible with error: %d", (uint8_t *)&v18, 0x12u);
        }
      }
      CFRelease(Mutable);
      CFDictionaryRef v17 = v10;
    }
    else
    {
      CFDictionaryRef v17 = Mutable;
    }
    CFRelease(v17);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeControllerIdentifier, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setUnitTest_enable_hh2:(BOOL)a3
{
  self->_unitTest_enable_hh2 = a3;
}

- (BOOL)unitTest_enable_hh2
{
  return self->_unitTest_enable_hh2;
}

- (void)setKeychainStoreUpdatedNotificationToken:(int)a3
{
  self->_keychainStoreUpdatedNotificationToken = a3;
}

- (int)keychainStoreUpdatedNotificationToken
{
  return self->_keychainStoreUpdatedNotificationToken;
}

- (void)setActiveControllerIdentifier:(id)a3
{
}

- (NSString)activeControllerIdentifier
{
  return self->_activeControllerIdentifier;
}

- (void)setQueue:(id)a3
{
}

- (id)_chooseHH2KeyFromMultipleHH2Keys:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  v6 = [v4 firstObject];
  if ((unint64_t)[v5 count] < 2)
  {
    BOOL v8 = v6;
  }
  else
  {
    v7 = [v5 sortedArrayUsingComparator:&__block_literal_global_364];
    BOOL v8 = [v7 firstObject];

    v9 = (void *)MEMORY[0x1D944E080]();
    CFDictionaryRef v10 = self;
    OSStatus v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      OSStatus v12 = HMFGetLogIdentifier();
      id v13 = [v8 account];
      int v15 = 138543618;
      OSStatus v16 = v12;
      __int16 v17 = 2112;
      int v18 = v13;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Chosen HH2 Key : %@", (uint8_t *)&v15, 0x16u);
    }
  }

  return v8;
}

uint64_t __59__HAPSystemKeychainStore__chooseHH2KeyFromMultipleHH2Keys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 account];
  v6 = [v4 account];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)pairingIdentityForAppleMediaAccessorySensorWithUUID:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v39 = 0;
  uint64_t v5 = [(HAPSystemKeychainStore *)self allKeychainItemsForType:&unk_1F2C80A00 identifier:0 syncable:MEMORY[0x1E4F1CC28] error:&v39];
  id v6 = v39;
  uint64_t v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      id v14 = (void *)MEMORY[0x1D944E080]();
      int v15 = self;
      OSStatus v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v44 = v17;
        __int16 v45 = 2112;
        id v46 = v5;
        _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Found multiple Identities for AMAS. Returning the first one: [%@]", buf, 0x16u);
      }
    }
    int v18 = [v5 firstObject];
    uint64_t v19 = [v18 valueData];
    int v20 = _deserializeDataToKeyPair(v19, (uint64_t)buf, (uint64_t)__s);

    if (v20)
    {
      OSStatus v21 = (void *)MEMORY[0x1D944E080]();
      uint64_t v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)id v40 = 138543362;
        id v41 = v24;
        _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to deserialize AMAS key-pair", v40, 0xCu);
      }
      id v13 = 0;
    }
    else
    {
      id v25 = objc_alloc(MEMORY[0x1E4F65510]);
      uint64_t v26 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:32];
      v27 = (void *)[v25 initWithPairingKeyData:v26];

      id v28 = objc_alloc(MEMORY[0x1E4F65510]);
      CFTypeID v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];
      v30 = (void *)[v28 initWithPairingKeyData:v29];

      uint64_t v31 = memset_s(__s, 0x20uLL, 0, 0x20uLL);
      if (v27 && v30)
      {
        id v32 = objc_alloc(MEMORY[0x1E4F65508]);
        v33 = [v18 account];
        id v13 = (void *)[v32 initWithIdentifier:v33 publicKey:v27 privateKey:v30];
      }
      else
      {
        v34 = (void *)MEMORY[0x1D944E080](v31);
        v35 = self;
        id v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = HMFGetLogIdentifier();
          *(_DWORD *)id v40 = 138543362;
          id v41 = v37;
          _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_ERROR, "%{public}@Unable to initialize public or private key out of deserialized amas key pair", v40, 0xCu);
        }
        id v13 = 0;
      }
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D944E080]();
    CFDictionaryRef v10 = self;
    OSStatus v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      OSStatus v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v44 = v12;
      __int16 v45 = 2112;
      id v46 = v4;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Did not find the pairing identity for AMAS : %@", buf, 0x16u);
    }
    id v13 = 0;
  }

  return v13;
}

- (BOOL)saveAppleMediaAccessorySensorPairingIdentity:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  id v6 = [v4 publicKey];
  uint64_t v7 = [v6 data];

  BOOL v8 = [v5 privateKey];
  v9 = [v8 data];

  id v10 = v7;
  uint64_t v11 = [v10 bytes];
  id v12 = v9;
  id v29 = 0;
  uint64_t v13 = _serializeKeyPairToData(v11, [v12 bytes], &v29);
  id v14 = v29;
  if (v13)
  {
    int v15 = (void *)MEMORY[0x1D944E080]();
    OSStatus v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = HMFGetLogIdentifier();
      uint64_t v19 = HMErrorFromOSStatus(v13);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize apple media sensor pairing key pair to data: %@", buf, 0x16u);
LABEL_8:

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  int v20 = [v5 identifier];
  uint64_t v21 = [(HAPSystemKeychainStore *)self _saveKeyPair:v14 username:v20 syncable:0 keyType:&unk_1F2C80A00];

  int v15 = (void *)MEMORY[0x1D944E080]();
  uint64_t v22 = self;
  id v23 = HMFGetOSLogHandle();
  __int16 v17 = v23;
  if (v21)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v18 = HMFGetLogIdentifier();
      uint64_t v24 = [v5 identifier];
      uint64_t v19 = HMErrorFromOSStatus(v21);
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      v33 = v24;
      __int16 v34 = 2112;
      v35 = v19;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to save apple media sensor accessory pairing identity %@ : %@", buf, 0x20u);

      goto LABEL_8;
    }
LABEL_9:
    BOOL v25 = 0;
    goto LABEL_10;
  }
  BOOL v25 = 1;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v27 = HMFGetLogIdentifier();
    id v28 = [v5 identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v27;
    __int16 v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully saved pairing identity for apple media sensor accessory %@ to keychain", buf, 0x16u);
  }
LABEL_10:

  return v25;
}

- (id)pairingIdentityForAppleMediaAccessoryWithUUID:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v39 = 0;
  uint64_t v5 = [(HAPSystemKeychainStore *)self allKeychainItemsForType:&unk_1F2C809E8 identifier:0 syncable:MEMORY[0x1E4F1CC28] error:&v39];
  id v6 = v39;
  uint64_t v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      id v14 = (void *)MEMORY[0x1D944E080]();
      int v15 = self;
      OSStatus v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v44 = v17;
        __int16 v45 = 2112;
        id v46 = v5;
        _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Found multiple Identities for AMA. Returning the first one: [%@]", buf, 0x16u);
      }
    }
    int v18 = [v5 firstObject];
    uint64_t v19 = [v18 valueData];
    int v20 = _deserializeDataToKeyPair(v19, (uint64_t)buf, (uint64_t)__s);

    if (v20)
    {
      uint64_t v21 = (void *)MEMORY[0x1D944E080]();
      uint64_t v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)id v40 = 138543362;
        id v41 = v24;
        _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to deserialize AMA key-pair", v40, 0xCu);
      }
      uint64_t v13 = 0;
    }
    else
    {
      id v25 = objc_alloc(MEMORY[0x1E4F65510]);
      uint64_t v26 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:32];
      v27 = (void *)[v25 initWithPairingKeyData:v26];

      id v28 = objc_alloc(MEMORY[0x1E4F65510]);
      id v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];
      v30 = (void *)[v28 initWithPairingKeyData:v29];

      uint64_t v31 = memset_s(__s, 0x20uLL, 0, 0x20uLL);
      if (v27 && v30)
      {
        id v32 = objc_alloc(MEMORY[0x1E4F65508]);
        v33 = [v18 account];
        uint64_t v13 = (void *)[v32 initWithIdentifier:v33 publicKey:v27 privateKey:v30];
      }
      else
      {
        __int16 v34 = (void *)MEMORY[0x1D944E080](v31);
        v35 = self;
        uint64_t v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = HMFGetLogIdentifier();
          *(_DWORD *)id v40 = 138543362;
          id v41 = v37;
          _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_ERROR, "%{public}@Unable to initialize public or private key out of deserialized key pair", v40, 0xCu);
        }
        uint64_t v13 = 0;
      }
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v44 = v12;
      __int16 v45 = 2112;
      id v46 = v4;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Did not find the pairing identity for AMA : %@", buf, 0x16u);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)saveAppleMediaAccessoryPairingIdentity:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  id v6 = [v4 publicKey];
  uint64_t v7 = [v6 data];

  BOOL v8 = [v5 privateKey];
  v9 = [v8 data];

  id v10 = v7;
  uint64_t v11 = [v10 bytes];
  id v12 = v9;
  id v29 = 0;
  uint64_t v13 = _serializeKeyPairToData(v11, [v12 bytes], &v29);
  id v14 = v29;
  if (v13)
  {
    int v15 = (void *)MEMORY[0x1D944E080]();
    OSStatus v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = HMFGetLogIdentifier();
      uint64_t v19 = HMErrorFromOSStatus(v13);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize apple media pairing key pair to data: %@", buf, 0x16u);
LABEL_8:

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  int v20 = [v5 identifier];
  uint64_t v21 = [(HAPSystemKeychainStore *)self _saveKeyPair:v14 username:v20 syncable:0 keyType:&unk_1F2C809E8];

  int v15 = (void *)MEMORY[0x1D944E080]();
  uint64_t v22 = self;
  id v23 = HMFGetOSLogHandle();
  __int16 v17 = v23;
  if (v21)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v18 = HMFGetLogIdentifier();
      uint64_t v24 = [v5 identifier];
      uint64_t v19 = HMErrorFromOSStatus(v21);
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      v33 = v24;
      __int16 v34 = 2112;
      v35 = v19;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to save apple media accessory pairing identity %@ : %@", buf, 0x20u);

      goto LABEL_8;
    }
LABEL_9:
    BOOL v25 = 0;
    goto LABEL_10;
  }
  BOOL v25 = 1;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v27 = HMFGetLogIdentifier();
    id v28 = [v5 identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v27;
    __int16 v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully saved pairing identity for apple media accessory %@ to keychain", buf, 0x16u);
  }
LABEL_10:

  return v25;
}

- (id)getAssociatedControllerKeyForAccessory:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  id v6 = (void *)MEMORY[0x1D944E080]();
  uint64_t v7 = self;
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v62 = v9;
    __int16 v63 = 2112;
    id v64 = v5;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Looking for associated controller key for accessory : [%@]", buf, 0x16u);
  }
  id v10 = [NSNumber numberWithUnsignedInt:1751216193];
  unsigned int v60 = 0;
  uint64_t v11 = [(HAPSystemKeychainStore *)v7 _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v10 account:v5 shouldReturnData:1 error:&v60];
  id v12 = v11;
  if (v11 && !objc_msgSend(v11, "hmf_isEmpty"))
  {
    if ((unint64_t)[v12 count] >= 2)
    {
      uint64_t v19 = (void *)MEMORY[0x1D944E080]();
      int v20 = v7;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v62 = v22;
        __int16 v63 = 2112;
        id v64 = v12;
        _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Warning: Multiple associated key exist : %@", buf, 0x16u);
      }
    }
    id v23 = [v12 firstObject];
    uint64_t v24 = objc_opt_class();
    BOOL v25 = [v23 genericData];
    uint64_t v26 = [v24 getDictionaryFromGenericData:v25];

    if (v26)
    {
      v27 = objc_msgSend(v26, "hmf_stringForKey:", @"ctrlKeyId");
      if (v27)
      {
        id v58 = 0;
        id v59 = 0;
        id v56 = 0;
        id v57 = 0;
        BOOL v28 = [(HAPSystemKeychainStore *)v7 _getFirstAvailableControllerKeyChainItemForAccount:v27 publicKey:&v59 secretKey:&v58 userName:&v57 keyPair:0 error:&v56];
        id v29 = v59;
        id v30 = v58;
        id v54 = v57;
        id v31 = v56;
        __int16 v53 = v30;
        uint64_t v55 = v31;
        if (!v28 || v31)
        {
          long long v44 = (void *)MEMORY[0x1D944E080]();
          __int16 v45 = v7;
          id v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v47 = uint64_t v52 = v44;
            *(_DWORD *)buf = 138544130;
            v62 = v47;
            __int16 v63 = 2112;
            id v64 = v27;
            __int16 v65 = 2112;
            v66 = v5;
            __int16 v67 = 2112;
            v68 = v55;
            _os_log_impl(&dword_1D4758000, v46, OS_LOG_TYPE_ERROR, "%{public}@No controller key exist for accessory : [Looking for controller key : %@] [accessory : %@] : [error : %@]", buf, 0x2Au);

            long long v44 = v52;
          }

          int v18 = 0;
        }
        else
        {
          __int16 v51 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v29];
          __int16 v32 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v30];
          context = (void *)MEMORY[0x1D944E080]();
          v33 = v7;
          __int16 v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v35 = id v49 = v29;
            *(_DWORD *)buf = 138543874;
            v62 = v35;
            __int16 v63 = 2112;
            id v64 = v54;
            __int16 v65 = 2112;
            v66 = v5;
            _os_log_impl(&dword_1D4758000, v34, OS_LOG_TYPE_INFO, "%{public}@Found [%@] for accessory : [%@]", buf, 0x20u);

            id v29 = v49;
          }

          int v18 = [[HAPPairingIdentity alloc] initWithIdentifier:v27 publicKey:v51 privateKey:v32];
        }
      }
      else
      {
        id v40 = (void *)MEMORY[0x1D944E080]();
        id v41 = v7;
        long long v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          long long v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v62 = v43;
          __int16 v63 = 2112;
          id v64 = v5;
          _os_log_impl(&dword_1D4758000, v42, OS_LOG_TYPE_INFO, "%{public}@Generic dictionary does not contain the association key for accessory identifier [%@]", buf, 0x16u);
        }
        int v18 = 0;
      }
    }
    else
    {
      uint64_t v36 = (void *)MEMORY[0x1D944E080]();
      v37 = v7;
      id v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        id v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v62 = v39;
        __int16 v63 = 2112;
        id v64 = v5;
        _os_log_impl(&dword_1D4758000, v38, OS_LOG_TYPE_INFO, "%{public}@Generic data for the accessory does not exist for accessory identifier [%@]", buf, 0x16u);
      }
      int v18 = 0;
    }
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1D944E080]();
    id v14 = v7;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      OSStatus v16 = HMFGetLogIdentifier();
      __int16 v17 = HMErrorFromOSStatus(v60);
      *(_DWORD *)buf = 138543874;
      v62 = v16;
      __int16 v63 = 2112;
      id v64 = v5;
      __int16 v65 = 2112;
      v66 = v17;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Could not locate the accessory keychain item for : %@, error: %@", buf, 0x20u);
    }
    int v18 = 0;
  }

  return v18;
}

- (BOOL)isHH2KeyType:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  if ([(HAPSystemKeychainStore *)self isHH2Enabled])
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    uint64_t v7 = [NSNumber numberWithUnsignedInt:1752001330];
    int v18 = 0;
    BOOL v8 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v7 account:v5 shouldReturnData:0 error:&v18];
    v9 = v8;
    if (v8 && !objc_msgSend(v8, "hmf_isEmpty"))
    {
      id v10 = (void *)MEMORY[0x1D944E080]();
      OSStatus v16 = self;
      id v12 = HMFGetOSLogHandle();
      BOOL v14 = 1;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v20 = v17;
        __int16 v21 = 2112;
        uint64_t v22 = v5;
        _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@[%@] is HH2 key type", buf, 0x16u);
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1D944E080]();
      uint64_t v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v20 = v13;
        __int16 v21 = 2112;
        uint64_t v22 = v5;
        _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@[%@] is not HH2 key type", buf, 0x16u);
      }
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)pairingIdentityFromKeychainItem:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 valueData];
  int v6 = _deserializeDataToKeyPair(v5, (uint64_t)v29, (uint64_t)__s);

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080]();
    BOOL v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v10;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to get pairing identity from keychain item due to unable to deserialize data", (uint8_t *)&v26, 0xCu);
    }
    uint64_t v11 = 0;
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F65510]);
    uint64_t v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v29 length:32];
    BOOL v14 = (void *)[v12 initWithPairingKeyData:v13];

    id v15 = objc_alloc(MEMORY[0x1E4F65510]);
    OSStatus v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];
    __int16 v17 = (void *)[v15 initWithPairingKeyData:v16];

    uint64_t v18 = memset_s(__s, 0x20uLL, 0, 0x20uLL);
    if (v14 && v17)
    {
      uint64_t v19 = [HAPPairingIdentity alloc];
      int v20 = [v4 account];
      uint64_t v11 = [(HAPPairingIdentity *)v19 initWithIdentifier:v20 publicKey:v14 privateKey:v17 permissions:0];
    }
    else
    {
      __int16 v21 = (void *)MEMORY[0x1D944E080](v18);
      uint64_t v22 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        int v26 = 138543362;
        v27 = v24;
        _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get pairing identity from keychain item due to unable to initialize public or private key out of deserialized key pair", (uint8_t *)&v26, 0xCu);
      }
      uint64_t v11 = 0;
    }
  }

  return v11;
}

- (id)_lookupPairingIdentityFromBackUpTableWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HAPSystemKeychainStore *)self allKeysForType:&unk_1F2C809D0 error:0];
  int v6 = (void *)MEMORY[0x1D944E080]();
  uint64_t v7 = self;
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    OSStatus v16 = v9;
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2112;
    int v20 = v5;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Was asked to look pairing key with identifier [%@] from the back up list: %@", buf, 0x20u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__HAPSystemKeychainStore__lookupPairingIdentityFromBackUpTableWithIdentifier___block_invoke;
  v13[3] = &unk_1E69F0FF0;
  id v14 = v4;
  id v10 = v4;
  uint64_t v11 = objc_msgSend(v5, "na_firstObjectPassingTest:", v13);

  return v11;
}

uint64_t __78__HAPSystemKeychainStore__lookupPairingIdentityFromBackUpTableWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  uint64_t v3 = HMFEqualObjects();

  return v3;
}

- (BOOL)savePairingIdentityToBackUpTable:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    int v6 = [v4 publicKey];
    uint64_t v7 = [v6 data];

    BOOL v8 = [v5 privateKey];
    v9 = [v8 data];

    id v10 = v7;
    uint64_t v11 = [v10 bytes];
    id v12 = v9;
    id v27 = 0;
    uint64_t v13 = _serializeKeyPairToData(v11, [v12 bytes], &v27);
    id v14 = v27;
    if (v13)
    {
      id v15 = (void *)MEMORY[0x1D944E080]();
      OSStatus v16 = self;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        __int16 v19 = HMErrorFromOSStatus(v13);
        *(_DWORD *)buf = 138543618;
        id v29 = v18;
        __int16 v30 = 2112;
        id v31 = v19;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize pairing identity key pair to data: %@", buf, 0x16u);
      }
      BOOL v20 = 0;
    }
    else
    {
      BOOL v25 = [v5 identifier];
      BOOL v20 = [(HAPSystemKeychainStore *)self _savePairingIdentityToBackUpTableWithIdentifier:v25 serializedKeyPair:v14];
    }
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1D944E080]();
    uint64_t v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v29 = v24;
    }
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)_savePairingIdentityToBackUpTableWithIdentifier:(id)a3 serializedKeyPair:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)MEMORY[0x1D944E080]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  uint64_t v11 = v10;
  if (v6 && v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      int v26 = 138543618;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v6;
    }
    uint64_t v13 = objc_alloc_init(HAPKeychainItem);
    [(HAPKeychainItem *)v13 setAccessGroup:@"com.apple.hap.pairing"];
    [(HAPKeychainItem *)v13 setLabel:@"HomeKit Pairing Identity Backup"];
    [(HAPKeychainItem *)v13 setItemDescription:@"Backup of identity used to pair with HomeKit accessories."];
    [(HAPKeychainItem *)v13 setAccount:v6];
    [(HAPKeychainItem *)v13 setValueData:v7];
    [(HAPKeychainItem *)v13 setSyncable:0];
    [(HAPKeychainItem *)v13 setType:&unk_1F2C809D0];
    id v14 = [(HAPKeychainItem *)v13 type];
    id v15 = __viewHintForKeyType(v14);
    [(HAPKeychainItem *)v13 setViewHint:v15];

    uint64_t v16 = [(HAPSystemKeychainStore *)v9 _addKeychainItem:v13 logDuplicateItemError:1];
    BOOL v17 = v16 == 0;
    if (v16)
    {
      uint64_t v18 = v16;
      __int16 v19 = (void *)MEMORY[0x1D944E080]();
      BOOL v20 = v9;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        uint64_t v23 = HMErrorFromOSStatus(v18);
        int v26 = 138543874;
        id v27 = v22;
        __int16 v28 = 2112;
        id v29 = v6;
        __int16 v30 = 2112;
        id v31 = v23;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      int v26 = 138543874;
      id v27 = v24;
      __int16 v28 = 2112;
      id v29 = v6;
      __int16 v30 = 2112;
      id v31 = v7;
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (id)getPreferredHH2ControllerKey
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(HAPSystemKeychainStore *)self isHH2Enabled])
  {
    id v13 = 0;
    uint64_t v3 = [(HAPSystemKeychainStore *)self allKeychainItemsForType:&unk_1F2C80988 identifier:0 syncable:MEMORY[0x1E4F1CC38] error:&v13];
    id v4 = v13;
    if (v3 && ([v3 count] ? (BOOL v5 = v4 == 0) : (BOOL v5 = 0), v5))
    {
      uint64_t v11 = [(HAPSystemKeychainStore *)self _chooseHH2KeyFromMultipleHH2Keys:v3];
      id v10 = [(HAPSystemKeychainStore *)self pairingIdentityFromKeychainItem:v11];
    }
    else
    {
      id v6 = (void *)MEMORY[0x1D944E080]();
      id v7 = self;
      BOOL v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v15 = v9;
        _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Did not find the HH2 pairing key.", buf, 0xCu);
      }
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)getHH2ControllerKeyWithIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HAPSystemKeychainStore *)self isHH2Enabled])
  {
    id v27 = 0;
    BOOL v5 = [(HAPSystemKeychainStore *)self allKeychainItemsForType:&unk_1F2C80988 identifier:0 syncable:MEMORY[0x1E4F1CC38] error:&v27];
    id v6 = v27;
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __60__HAPSystemKeychainStore_getHH2ControllerKeyWithIdentifier___block_invoke;
    BOOL v25 = &unk_1E69F0F28;
    id v7 = v4;
    id v26 = v7;
    uint64_t v11 = objc_msgSend(v5, "na_firstObjectPassingTest:", &v22);
    if (v11)
    {
      id v12 = -[HAPSystemKeychainStore pairingIdentityFromKeychainItem:](self, "pairingIdentityFromKeychainItem:", v11, v22, v23, v24, v25);
    }
    else
    {
      id v13 = (void *)MEMORY[0x1D944E080](0, v8, v9, v10);
      id v14 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v29 = v16;
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2112;
        id v33 = v6;
        _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to find HH2 controller key with identifier: %@ with error: %@", buf, 0x20u);
      }
      id v12 = -[HAPSystemKeychainStore _lookupPairingIdentityFromBackUpTableWithIdentifier:](v14, "_lookupPairingIdentityFromBackUpTableWithIdentifier:", v7, v22, v23, v24, v25);
      if (v12)
      {
        BOOL v17 = (void *)MEMORY[0x1D944E080]();
        uint64_t v18 = v14;
        __int16 v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v29 = v20;
          __int16 v30 = 2112;
          id v31 = v12;
          _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Detected HH2 key loss. Looks like we found the key from our back up list. Going to restore it by saving it as hmk2 type : %@", buf, 0x16u);
        }
        [(HAPSystemKeychainStore *)v18 saveHH2PairingIdentity:v12 syncable:1];
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __60__HAPSystemKeychainStore_getHH2ControllerKeyWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 account];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)getOrCreateHH2ControllerKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(HAPSystemKeychainStore *)self isHH2Enabled])
  {
    id v32 = 0;
    uint64_t v11 = [(HAPSystemKeychainStore *)self allKeychainItemsForType:&unk_1F2C80988 identifier:0 syncable:MEMORY[0x1E4F1CC38] error:&v32];
    id v12 = v32;
    id v13 = v12;
    if (v11) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    if (!v14)
    {
      id v15 = (void *)MEMORY[0x1D944E080]();
      uint64_t v16 = self;
      BOOL v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v35 = v18;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Did not find the HH2 pairing key. Creating a new HH2 pairing key.", buf, 0xCu);
      }
      if ([(HAPSystemKeychainStore *)v16 createHH2ControllerKey:a3 secretKey:a4 keyPair:a5 username:a6])
      {
        __int16 v19 = (void *)MEMORY[0x1D944E080]();
        BOOL v20 = v16;
        uint64_t v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v35 = v22;
          _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to get or create HH2 pairing key.", buf, 0xCu);
        }
        BOOL v23 = 0;
        goto LABEL_31;
      }
LABEL_30:
      BOOL v23 = 1;
LABEL_31:

      return v23;
    }
    uint64_t v24 = [(HAPSystemKeychainStore *)self _chooseHH2KeyFromMultipleHH2Keys:v11];
    BOOL v25 = [v24 valueData];
    int v26 = _deserializeDataToKeyPair(v25, (uint64_t)buf, (uint64_t)__s);

    if (a3)
    {
      if (!v26)
      {
        id v27 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:32];
        *a3 = v27;

        if (!a4) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      *a3 = 0;
    }
    if (!a4) {
      goto LABEL_21;
    }
    if (v26)
    {
      *a4 = 0;
      goto LABEL_21;
    }
LABEL_20:
    id v28 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];
    *a4 = v28;

LABEL_21:
    if (a5)
    {
      if (!v26)
      {
        id v29 = [v24 valueData];
        *a5 = v29;

        if (!a6) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
      *a5 = 0;
    }
    if (!a6)
    {
LABEL_29:
      memset_s(__s, 0x20uLL, 0, 0x20uLL);

      goto LABEL_30;
    }
    if (v26)
    {
      *a6 = 0;
      goto LABEL_29;
    }
LABEL_28:
    id v30 = [v24 account];
    *a6 = v30;

    goto LABEL_29;
  }
  return 0;
}

- (int)createHH2ControllerKeyWithUsername:(id)a3 publicKey:(id *)a4 secretKey:(id *)a5 keyPair:(id *)a6 username:(id *)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if ([(HAPSystemKeychainStore *)self isHH2Enabled])
  {
    cced25519_make_key_pair_compat();
    id v45 = 0;
    _serializeKeyPairToData((uint64_t)v53, (uint64_t)__s, &v45);
    id v13 = v45;
    BOOL v14 = objc_alloc_init(HAPKeychainItem);
    [(HAPKeychainItem *)v14 setAccessGroup:@"com.apple.hap.pairing"];
    [(HAPKeychainItem *)v14 setLabel:@"HomeKit Pairing Identity"];
    [(HAPKeychainItem *)v14 setItemDescription:@"Identity used to pair with HomeKit accessories."];
    [(HAPKeychainItem *)v14 setAccount:v12];
    [(HAPKeychainItem *)v14 setValueData:v13];
    [(HAPKeychainItem *)v14 setSyncable:1];
    [(HAPKeychainItem *)v14 setType:&unk_1F2C80988];
    id v15 = [(HAPKeychainItem *)v14 type];
    uint64_t v16 = __viewHintForKeyType(v15);
    [(HAPKeychainItem *)v14 setViewHint:v16];

    uint64_t v17 = [(HAPSystemKeychainStore *)self _addKeychainItem:v14 logDuplicateItemError:1];
    if (v17)
    {
      long long v44 = a7;
      context = (void *)MEMORY[0x1D944E080]();
      uint64_t v18 = self;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        BOOL v20 = v42 = v13;
        HMErrorFromOSStatus(v17);
        v21 = id v41 = a6;
        *(_DWORD *)buf = 138543874;
        uint64_t v47 = v20;
        __int16 v48 = 2112;
        id v49 = v12;
        __int16 v50 = 2112;
        __int16 v51 = v21;
        _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HH2 controller key for username %@ with error: %@", buf, 0x20u);

        a6 = v41;
        id v13 = v42;
      }

      a7 = v44;
      if (a4) {
        *a4 = 0;
      }
    }
    else if (a4)
    {
      id v22 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v53 length:32];
      *a4 = v22;
    }
    if (a5)
    {
      if (!v17)
      {
        id v30 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];
        *a5 = v30;

        if (!a7) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }
      *a5 = 0;
    }
    if (!a7) {
      goto LABEL_18;
    }
LABEL_14:
    if (v17) {
      BOOL v23 = 0;
    }
    else {
      BOOL v23 = v12;
    }
    *a7 = v23;
LABEL_18:
    if (a6)
    {
      if (v17)
      {
        *a6 = 0;
LABEL_22:
        uint64_t v24 = (void *)MEMORY[0x1D944E080]();
        BOOL v25 = self;
        int v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v28 = v27 = v13;
          id v29 = HMErrorFromOSStatus(v17);
          *(_DWORD *)buf = 138543618;
          uint64_t v47 = v28;
          __int16 v48 = 2112;
          id v49 = v29;
          _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not create HH2 controller key : %@", buf, 0x16u);

          id v13 = v27;
        }

LABEL_31:
        memset_s(__s, 0x20uLL, 0, 0x20uLL);

        goto LABEL_32;
      }
      id v31 = [(HAPKeychainItem *)v14 valueData];
      *a6 = v31;
    }
    else if (v17)
    {
      goto LABEL_22;
    }
    id v32 = v13;
    [(HAPSystemKeychainStore *)self _savePairingIdentityToBackUpTableWithIdentifier:v12 serializedKeyPair:v13];
    id v33 = (void *)MEMORY[0x1D944E080]();
    uint64_t v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      v37 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v36;
      __int16 v48 = 2112;
      id v49 = v37;
      _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_INFO, "%{public}@Saving the HH2 key as back up key : %@", buf, 0x16u);
    }
    id v38 = objc_opt_new();
    id v39 = (id)[v38 backupWithInfo:0];

    id v13 = v32;
    goto LABEL_31;
  }
  LODWORD(v17) = -6705;
LABEL_32:

  return v17;
}

- (int)createHH2ControllerKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6
{
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  id v12 = [v11 UUIDString];
  LODWORD(a6) = [(HAPSystemKeychainStore *)self createHH2ControllerKeyWithUsername:v12 publicKey:a3 secretKey:a4 keyPair:a5 username:a6];

  return (int)a6;
}

- (BOOL)triggerPreferredHH2ControllerKeyRoll
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HAPSystemKeychainStore *)self getPreferredHH2ControllerKey];
  if (v3)
  {
    uint64_t v4 = 0;
    do
    {
      BOOL v5 = v4;
      id v6 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v4 = [v6 UUIDString];

      id v7 = [v3 identifier];
      uint64_t v8 = [v4 compare:v7];
    }
    while (v8 == 1);
    BOOL v9 = [(HAPSystemKeychainStore *)self createHH2ControllerKeyWithUsername:v4 publicKey:0 secretKey:0 keyPair:0 username:0] == 0;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1D944E080]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to trigger preferred hh2 controller key roll due to no existing HH2 controller key", (uint8_t *)&v15, 0xCu);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (id)allLegacyAccessoryPairingKeys
{
  return [(HAPSystemKeychainStore *)self _allAccessoryPairingKeysIncludingHH2Key:0];
}

- (id)allAccessoryPairingKeys
{
  BOOL v3 = [(HAPSystemKeychainStore *)self isHH2Enabled];

  return [(HAPSystemKeychainStore *)self _allAccessoryPairingKeysIncludingHH2Key:v3];
}

- (id)countAccessoryPairingKeysForMetrics
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = (void *)MEMORY[0x1D944E080]();
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __61__HAPSystemKeychainStore_countAccessoryPairingKeysForMetrics__block_invoke;
  uint64_t v11 = &unk_1E69F0FC8;
  id v12 = self;
  id v5 = v3;
  id v13 = v5;
  [&unk_1F2C80E50 enumerateObjectsUsingBlock:&v8];

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return v6;
}

void __61__HAPSystemKeychainStore_countAccessoryPairingKeysForMetrics__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v9 = 0;
  id v4 = a2;
  id v5 = [v3 allKeysForType:v4 error:&v9];
  id v6 = v9;
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  [v7 setObject:v8 forKey:v4];
}

- (id)_allAccessoryPairingKeysIncludingHH2Key:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = (void *)MEMORY[0x1D944E080]();
  if (v3)
  {
    id v7 = [&unk_1F2C80E38 arrayByAddingObjectsFromArray:&unk_1F2C80E20];
  }
  else
  {
    id v7 = &unk_1F2C80E20;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HAPSystemKeychainStore__allAccessoryPairingKeysIncludingHH2Key___block_invoke;
  v10[3] = &unk_1E69F0FC8;
  v10[4] = self;
  id v8 = v5;
  id v11 = v8;
  [v7 enumerateObjectsUsingBlock:v10];

  return v8;
}

void __66__HAPSystemKeychainStore__allAccessoryPairingKeysIncludingHH2Key___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v14 = 0;
  id v5 = [v4 allKeysForType:v3 error:&v14];
  id v6 = v14;
  if ([v5 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__HAPSystemKeychainStore__allAccessoryPairingKeysIncludingHH2Key___block_invoke_334;
    v12[3] = &unk_1E69F0FA0;
    id v13 = *(id *)(a1 + 40);
    [v5 enumerateObjectsUsingBlock:v12];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = KeyTypeDescription(v3);
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Error while retrieving all identifies for keyType : %s, error: %@", buf, 0x20u);
    }
  }
}

void __66__HAPSystemKeychainStore__allAccessoryPairingKeysIncludingHH2Key___block_invoke_334(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)allHH2PairingKeys
{
  return [(HAPSystemKeychainStore *)self allKeysForType:&unk_1F2C80988 error:0];
}

- (id)allKeysForType:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = [v6 array];
  id v22 = 0;
  id v9 = [(HAPSystemKeychainStore *)self allKeychainItemsForType:v7 identifier:0 syncable:MEMORY[0x1E4F1CC38] error:&v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__HAPSystemKeychainStore_allKeysForType_error___block_invoke;
  v20[3] = &unk_1E69F0F78;
  id v10 = v8;
  id v21 = v10;
  [v9 enumerateObjectsUsingBlock:v20];
  __int16 v19 = 0;
  id v11 = [(HAPSystemKeychainStore *)self allKeychainItemsForType:v7 identifier:0 syncable:MEMORY[0x1E4F1CC28] error:&v19];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__HAPSystemKeychainStore_allKeysForType_error___block_invoke_2;
  v17[3] = &unk_1E69F0F78;
  id v12 = v10;
  id v18 = v12;
  [v11 enumerateObjectsUsingBlock:v17];
  if (a4)
  {
    if (v22) {
      id v13 = v22;
    }
    else {
      id v13 = v19;
    }
    *a4 = v13;
  }
  id v14 = v18;
  id v15 = v12;

  return v15;
}

uint64_t __47__HAPSystemKeychainStore_allKeysForType_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[HAPPairingIdentity alloc] initWithKeychainItem:v3];

  if (v5 && ([*(id *)(a1 + 32) containsObject:v5] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __47__HAPSystemKeychainStore_allKeysForType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[HAPPairingIdentity alloc] initWithKeychainItem:v3];

  if (v5 && ([*(id *)(a1 + 32) containsObject:v5] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3 controllerID:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  id v7 = v6;
  id v8 = [NSNumber numberWithUnsignedInt:1751216193];
  id v9 = [(HAPSystemKeychainStore *)self allKeychainItemsForType:v8 identifier:v7 syncable:0 error:0];

  if (v9 && !objc_msgSend(v9, "hmf_isEmpty"))
  {
    if ((unint64_t)[v9 count] >= 2)
    {
      id v15 = (void *)MEMORY[0x1D944E080]();
      uint64_t v16 = self;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v28 = v18;
        __int16 v29 = 2112;
        id v30 = v7;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error : Multiple entries found for accessory : %@. Using the first one", buf, 0x16u);
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __78__HAPSystemKeychainStore_isAccessoryAssociatedWithControllerKey_controllerID___block_invoke;
      v26[3] = &unk_1E69F0F78;
      v26[4] = v16;
      [v9 enumerateObjectsUsingBlock:v26];
    }
    __int16 v19 = [v9 firstObject];
    id v20 = objc_opt_class();
    id v21 = [v19 genericData];
    id v22 = [v20 getDictionaryFromGenericData:v21];

    if (v22)
    {
      BOOL v23 = [v22 objectForKeyedSubscript:@"ctrlKeyId"];
      uint64_t v24 = v23;
      BOOL v14 = v23 != 0;
      if (a4 && v23) {
        *a4 = v23;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D944E080]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v13;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@No keychain entries found for accessory : %@", buf, 0x16u);
    }
    BOOL v14 = 0;
  }

  return v14;
}

void __78__HAPSystemKeychainStore_isAccessoryAssociatedWithControllerKey_controllerID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%{public}@%@", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)deletePairingKeysForAccessory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(HAPMutableKeychainItem);
  [(HAPKeychainItem *)v7 setAccessGroup:@"com.apple.hap.pairing"];
  [(HAPKeychainItem *)v7 setType:&unk_1F2C80928];
  int v8 = [(HAPKeychainItem *)v7 type];
  id v9 = +[HAPSystemKeychainStore viewHintForType:v8];
  [(HAPKeychainItem *)v7 setViewHint:v9];

  [(HAPKeychainItem *)v7 setAccount:v6];
  LOBYTE(a4) = [(HAPSystemKeychainStore *)self deleteKeychainItem:v7 error:a4];

  return (char)a4;
}

- (BOOL)createAccessoryPairingKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[HAPMutableKeychainItem alloc] initWithPairingIdentity:v6];

  [(HAPKeychainItem *)v7 setAccessGroup:@"com.apple.hap.pairing"];
  [(HAPKeychainItem *)v7 setType:&unk_1F2C80928];
  int v8 = [(HAPKeychainItem *)v7 type];
  id v9 = +[HAPSystemKeychainStore viewHintForType:v8];
  [(HAPKeychainItem *)v7 setViewHint:v9];

  [(HAPKeychainItem *)v7 setItemDescription:@"HomeKit accessory that has been paired with this account."];
  [(HAPKeychainItem *)v7 setLabel:@"Paired HomeKit Accessory"];
  LOBYTE(a4) = [(HAPSystemKeychainStore *)self updateKeychainItem:v7 createIfNeeded:0 error:a4];

  return (char)a4;
}

- (BOOL)updateAccessoryPairingKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[HAPMutableKeychainItem alloc] initWithPairingIdentity:v6];

  [(HAPKeychainItem *)v7 setAccessGroup:@"com.apple.hap.pairing"];
  [(HAPKeychainItem *)v7 setType:&unk_1F2C80928];
  int v8 = [(HAPKeychainItem *)v7 type];
  id v9 = +[HAPSystemKeychainStore viewHintForType:v8];
  [(HAPKeychainItem *)v7 setViewHint:v9];

  LOBYTE(a4) = [(HAPSystemKeychainStore *)self updateKeychainItem:v7 createIfNeeded:0 error:a4];
  return (char)a4;
}

- (id)readAccessoryPairingKeyForAccessory:(id)a3 error:(id *)a4
{
  uint64_t v13 = 0;
  if (a4) {
    id v4 = a4;
  }
  else {
    id v4 = (id *)&v13;
  }
  id v5 = [(HAPSystemKeychainStore *)self allKeychainItemsForType:&unk_1F2C80928 identifier:a3 syncable:MEMORY[0x1E4F1CC28] error:v4];
  id v6 = v5;
  if (v5)
  {
    if ([v5 count])
    {
      if ([v6 count] == 1)
      {
        id v7 = [HAPPairingIdentity alloc];
        int v8 = [v6 firstObject];
        id v9 = [(HAPPairingIdentity *)v7 initWithKeychainItem:v8];

        goto LABEL_12;
      }
      __int16 v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = 15;
    }
    else
    {
      __int16 v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = 2;
    }
    [v10 hmfErrorWithCode:v11];
    id v9 = 0;
    *id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
LABEL_12:

  return v9;
}

- (BOOL)updateKeychainItem:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)[v8 mutableCopy];
  __int16 v10 = [v9 creationDate];

  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    [v9 setCreationDate:v11];

    uint64_t v12 = [v9 viewHint];

    if (!v12)
    {
      uint64_t v13 = [v8 type];
      BOOL v14 = __viewHintForKeyType(v13);
      [v9 setViewHint:v14];
    }
  }
  id v15 = [v9 accessGroup];

  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  uint64_t v16 = [v9 type];

  if (!v16)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  __int16 v17 = [v9 account];

  if (!v17)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  id v18 = [v9 creationDate];

  if (!v18)
  {
LABEL_15:
    _HMFPreconditionFailure();
LABEL_16:
    BOOL v25 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);
    _Unwind_Resume(v25);
  }
  __int16 v19 = [v9 accessGroup];
  char v20 = [v19 isEqual:@"com.apple.hap.pairing"];

  if ((v20 & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__5093;
  v35 = __Block_byref_object_dispose__5094;
  id v36 = 0;
  id v21 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HAPSystemKeychainStore_updateKeychainItem_createIfNeeded_error___block_invoke;
  block[3] = &unk_1E69F0E88;
  block[4] = self;
  id v22 = v9;
  BOOL v30 = a4;
  id v27 = v22;
  id v28 = &v31;
  __int16 v29 = &v37;
  dispatch_sync(v21, block);

  if (a5) {
    *a5 = (id) v32[5];
  }
  char v23 = *((unsigned char *)v38 + 24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

void __66__HAPSystemKeychainStore_updateKeychainItem_createIfNeeded_error___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unsigned int v33 = 0;
  uint64_t v2 = (id *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) accessGroup];
  id v5 = [*v2 type];
  id v6 = [*v2 account];
  id v7 = [v3 _getKeychainItemsForAccessGroup:v4 type:v5 account:v6 shouldReturnData:1 error:&v33];

  if (v33 == -25300)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v8 = [*(id *)(a1 + 32) _addKeychainItem:*(void *)(a1 + 40) logDuplicateItemError:0];
      unsigned int v33 = v8;
      if (v8)
      {
        uint64_t v9 = HMErrorFromOSStatus(v8);
        uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      }
    }
    else
    {
      unsigned int v33 = 0;
    }
  }
  else if ([v7 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v35 = __Block_byref_object_copy__5093;
    *(void *)id v36 = __Block_byref_object_dispose__5094;
    *(void *)&v36[8] = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __66__HAPSystemKeychainStore_updateKeychainItem_createIfNeeded_error___block_invoke_2;
    v29[3] = &unk_1E69F0F50;
    id v30 = *(id *)(a1 + 40);
    uint64_t v31 = buf;
    long long v32 = *(_OWORD *)(a1 + 48);
    [v7 enumerateObjectsUsingBlock:v29];
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {

      _Block_object_dispose(buf, 8);
    }
    else
    {
      char v23 = *(void **)(*(void *)&buf[8] + 40);
      if (v23)
      {
        uint64_t v24 = *(void **)(a1 + 32);
        uint64_t v25 = [v23 platformReference];
        uint64_t v26 = *(void *)(a1 + 40);
        uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
        id obj = *(id *)(v27 + 40);
        LOBYTE(v24) = [v24 _updateKeychainItemWithPlatformIdentifier:v25 keychainItem:v26 error:&obj];
        objc_storeStrong((id *)(v27 + 40), obj);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v24;
      }

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D944E080]();
    id v13 = *(id *)(a1 + 32);
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      uint64_t v16 = [*(id *)(a1 + 40) accessGroup];
      __int16 v17 = [*(id *)(a1 + 40) type];
      id v18 = [*(id *)(a1 + 40) account];
      __int16 v19 = HMErrorFromOSStatus(v33);
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v35 = v17;
      *(_WORD *)id v36 = 2112;
      *(void *)&v36[2] = v18;
      *(_WORD *)&v36[10] = 2112;
      *(void *)&v36[12] = v19;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to get keychain items for access group %@, type %@, and account %@ due to error %@", buf, 0x34u);
    }
    uint64_t v20 = HMErrorFromOSStatus(v33);
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    id v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

void __66__HAPSystemKeychainStore_updateKeychainItem_createIfNeeded_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  if ([*(id *)(a1 + 32) isSyncable] && objc_msgSend(v13, "isSyncable"))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void *)(v7 + 40);
    uint64_t v8 = (id *)(v7 + 40);
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }
    else
    {
      objc_storeStrong(v8, a2);
    }
  }
}

- (BOOL)deleteKeychainItem:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__5093;
  char v23 = __Block_byref_object_dispose__5094;
  id v24 = 0;
  uint64_t v7 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HAPSystemKeychainStore_deleteKeychainItem_error___block_invoke;
  block[3] = &unk_1E69F26B0;
  block[4] = self;
  id v8 = v6;
  id v17 = v8;
  id v18 = &v19;
  dispatch_sync(v7, block);

  if (a4) {
    *a4 = (id) v20[5];
  }
  if (v20[5])
  {
    uint64_t v9 = (void *)MEMORY[0x1D944E080]();
    uint64_t v10 = self;
    HMFGetOSLogHandle();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = v20[5];
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v12;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      uint64_t v30 = v13;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove keychain item %@: %@", buf, 0x20u);
    }
    BOOL v14 = v20[5] == 0;
  }
  else
  {
    BOOL v14 = 1;
  }

  _Block_object_dispose(&v19, 8);
  return v14;
}

uint64_t __51__HAPSystemKeychainStore_deleteKeychainItem_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _removeKeychainItem:*(void *)(a1 + 40) leaveTombstone:1];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = HMErrorFromOSStatus(result);
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)allKeychainItemsForType:(id)a3 identifier:(id)a4 syncable:(id)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__5093;
  id v42 = __Block_byref_object_dispose__5094;
  id v43 = 0;
  uint64_t v32 = 0;
  unsigned int v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5093;
  id v36 = __Block_byref_object_dispose__5094;
  id v37 = 0;
  uint64_t v13 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HAPSystemKeychainStore_allKeychainItemsForType_identifier_syncable_error___block_invoke;
  block[3] = &unk_1E69F27F0;
  uint64_t v30 = &v38;
  block[4] = self;
  id v14 = v10;
  id v28 = v14;
  id v15 = v11;
  id v29 = v15;
  uint64_t v31 = &v32;
  dispatch_sync(v13, block);

  if (a6) {
    *a6 = (id) v33[5];
  }
  if (v33[5])
  {
    uint64_t v16 = (void *)MEMORY[0x1D944E080]();
    id v17 = self;
    HMFGetOSLogHandle();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v14 unsignedIntegerValue];
      uint64_t v21 = v33[5];
      *(_DWORD *)buf = 138543874;
      id v45 = v19;
      __int16 v46 = 2048;
      uint64_t v47 = v20;
      __int16 v48 = 2112;
      uint64_t v49 = v21;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to query keychain items for group %lu: %@", buf, 0x20u);
    }
    id v22 = 0;
  }
  else
  {
    char v23 = (void *)v39[5];
    if (v12)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __76__HAPSystemKeychainStore_allKeychainItemsForType_identifier_syncable_error___block_invoke_306;
      v25[3] = &unk_1E69F0F28;
      id v26 = v12;
      objc_msgSend(v23, "na_filter:", v25);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = v23;
    }
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v22;
}

void __76__HAPSystemKeychainStore_allKeychainItemsForType_identifier_syncable_error___block_invoke(uint64_t a1)
{
  unsigned int v8 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:*(void *)(a1 + 40) account:*(void *)(a1 + 48) shouldReturnData:1 error:&v8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (v8)
  {
    uint64_t v5 = HMErrorFromOSStatus(v8);
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

uint64_t __76__HAPSystemKeychainStore_allKeychainItemsForType_identifier_syncable_error___block_invoke_306(uint64_t a1, void *a2)
{
  int v3 = [a2 isSyncable];
  return v3 ^ [*(id *)(a1 + 32) BOOLValue] ^ 1;
}

- (BOOL)_getFirstAvailableControllerKeyChainItemForAccount:(id)a3 publicKey:(id *)a4 secretKey:(id *)a5 userName:(id *)a6 keyPair:(id *)a7 error:(id *)a8
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  __int16 v48 = a8;
  long long v44 = a4;
  id v45 = a5;
  if ([(HAPSystemKeychainStore *)self isHH2Enabled])
  {
    uint64_t v13 = [&unk_1F2C80E08 arrayByAddingObjectsFromArray:&unk_1F2C80DF0];
  }
  else
  {
    uint64_t v13 = &unk_1F2C80DF0;
  }
  id v14 = [MEMORY[0x1E4F1CA48] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v64 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v50 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v21 = (void *)MEMORY[0x1D944E080]();
        *(_DWORD *)buf = 0;
        id v22 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v20 account:v12 shouldReturnData:1 error:buf];
        char v23 = v22;
        if (*(_DWORD *)buf) {
          BOOL v24 = 1;
        }
        else {
          BOOL v24 = v22 == 0;
        }
        if (!v24)
        {
          [v14 addObjectsFromArray:v22];

          goto LABEL_16;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v49 objects:v64 count:16];
    }
    while (v17);
  }
LABEL_16:

  uint64_t v25 = [v14 firstObject];
  if (!v25)
  {
    id v26 = [0 account];
    int v27 = [v26 isEqualToString:v12];

    if (v27)
    {
      id v28 = (void *)MEMORY[0x1D944E080]();
      id v29 = self;
      uint64_t v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v61 = v31;
        __int16 v62 = 2112;
        id v63 = v12;
        _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find the controller key for given account identifier : %@", buf, 0x16u);
      }
      uint64_t v32 = v48;
      if (!v48)
      {
        BOOL v34 = 0;
        goto LABEL_37;
      }
      HMErrorFromOSStatus(4294960569);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v34 = 0;
      goto LABEL_27;
    }
  }
  v35 = [v25 valueData];
  uint64_t v36 = _deserializeDataToKeyPair(v35, (uint64_t)buf, (uint64_t)__s);

  BOOL v34 = v36 == 0;
  if (v36)
  {
    id v37 = v14;
    uint64_t v38 = (void *)MEMORY[0x1D944E080]();
    uint64_t v39 = self;
    uint64_t v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v41 = HMFGetLogIdentifier();
      id v42 = HMErrorFromOSStatus(v36);
      *(_DWORD *)__int16 v53 = 138543874;
      uint64_t v54 = v41;
      __int16 v55 = 2112;
      id v56 = v12;
      __int16 v57 = 2112;
      id v58 = v42;
      _os_log_impl(&dword_1D4758000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unable to deserialize the key for account : %@, Encountered error: %@", v53, 0x20u);
    }
    id v14 = v37;
    uint64_t v32 = v48;
    BOOL v34 = 0;
    if (v48)
    {
      HMErrorFromOSStatus(v36);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
      id *v32 = v33;
    }
  }
  else
  {
    if (v44)
    {
      *long long v44 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:32];
    }
    if (v45)
    {
      *id v45 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];
    }
    if (a6)
    {
      *a6 = [v25 account];
    }
    if (a7)
    {
      *a7 = [v25 valueData];
    }
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
  }
LABEL_37:

  return v34;
}

- (BOOL)_getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6 allowCreation:(BOOL)a7 forAccessory:(id)a8 error:(id *)a9
{
  BOOL v9 = a7;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  if (v14)
  {
    if ([(HAPSystemKeychainStore *)self _getPublicKey:0 registeredWithHomeKit:0 forAccessoryName:v14])
    {
      BOOL v15 = v9;
      uint64_t v16 = a3;
      uint64_t v17 = (void *)MEMORY[0x1D944E080]();
      uint64_t v18 = self;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = uint64_t v20 = a4;
        *(_DWORD *)buf = 138543618;
        v93 = v21;
        __int16 v94 = 2112;
        uint64_t v95 = (uint64_t)v14;
        _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@Couldn't find the controller key for the given accessory [%@]. Returning default controller key.", buf, 0x16u);

        a4 = v20;
      }

      char v22 = [(HAPSystemKeychainStore *)v18 getControllerPublicKey:v16 secretKey:a4 keyPair:a5 username:a6 allowCreation:v15 error:a9];
    }
    else
    {
      int v90 = 0;
      uint64_t v30 = [NSNumber numberWithUnsignedInt:1751216193];
      uint64_t v31 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v30 account:v14 shouldReturnData:1 error:&v90];

      BOOL v80 = v9;
      v81 = a5;
      if (v31 && [v31 count] == 1)
      {
        uint64_t v32 = [v31 firstObject];
        id v33 = objc_opt_class();
        BOOL v34 = [v32 genericData];
        v35 = [v33 getDictionaryFromGenericData:v34];

        if (v35)
        {
          uint64_t v36 = objc_msgSend(v35, "hmf_stringForKey:", @"ctrlKeyId");
          if (v36)
          {
            id v85 = 0;
            BOOL v37 = [(HAPSystemKeychainStore *)self _getFirstAvailableControllerKeyChainItemForAccount:v36 publicKey:a3 secretKey:a4 userName:a6 keyPair:v81 error:&v85];
            id v38 = v85;
            uint64_t v39 = v38;
            if (a9) {
              *a9 = v38;
            }
            if (v39) {
              BOOL v40 = 0;
            }
            else {
              BOOL v40 = v37;
            }
            if (v40)
            {
              char v22 = 1;
            }
            else
            {
              v84 = v36;
              v76 = a3;
              v68 = (void *)MEMORY[0x1D944E080]();
              uint64_t v69 = self;
              v70 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v72 = v71 = a4;
                *(_DWORD *)buf = 138543874;
                v93 = v72;
                __int16 v94 = 2112;
                uint64_t v95 = (uint64_t)v84;
                __int16 v96 = 2112;
                id v97 = v39;
                _os_log_impl(&dword_1D4758000, v70, OS_LOG_TYPE_ERROR, "%{public}@No controller keys exist for HAPAccessory : %@: [error : %@]", buf, 0x20u);

                a4 = v71;
              }

              char v22 = [(HAPSystemKeychainStore *)v69 getControllerPublicKey:v76 secretKey:a4 keyPair:v81 username:a6 allowCreation:v80 error:a9];
              uint64_t v36 = v84;
            }
          }
          else
          {
            v79 = v31;
            __int16 v62 = a3;
            id v63 = (void *)MEMORY[0x1D944E080]();
            id v64 = self;
            uint64_t v65 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              __int16 v67 = v66 = a4;
              *(_DWORD *)buf = 138543618;
              v93 = v67;
              __int16 v94 = 2112;
              uint64_t v95 = (uint64_t)v14;
              _os_log_impl(&dword_1D4758000, v65, OS_LOG_TYPE_INFO, "%{public}@Generic dictionary does not exist for the given accessory identifier [%@]. Returning default controller key", buf, 0x16u);

              a4 = v66;
            }

            char v22 = [(HAPSystemKeychainStore *)v64 getControllerPublicKey:v62 secretKey:a4 keyPair:v81 username:a6 allowCreation:v80 error:a9];
            uint64_t v31 = v79;
            uint64_t v36 = 0;
          }
        }
        else
        {
          v78 = v31;
          id v56 = a3;
          __int16 v57 = (void *)MEMORY[0x1D944E080]();
          id v58 = self;
          id v59 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v61 = unsigned int v60 = a4;
            *(_DWORD *)buf = 138543618;
            v93 = v61;
            __int16 v94 = 2112;
            uint64_t v95 = (uint64_t)v14;
            _os_log_impl(&dword_1D4758000, v59, OS_LOG_TYPE_INFO, "%{public}@Generic data for the accessory does not exist for accessory identifier [%@]. Returning default controller key", buf, 0x16u);

            a4 = v60;
          }

          char v22 = [(HAPSystemKeychainStore *)v58 getControllerPublicKey:v56 secretKey:a4 keyPair:v81 username:a6 allowCreation:v80 error:a9];
          uint64_t v31 = v78;
        }
      }
      else
      {
        v75 = a3;
        v74 = a4;
        id v41 = (void *)MEMORY[0x1D944E080]();
        id v42 = self;
        id v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          long long v44 = HMFGetLogIdentifier();
          uint64_t v45 = [v31 count];
          *(_DWORD *)buf = 138543874;
          v93 = v44;
          __int16 v94 = 2048;
          uint64_t v95 = v45;
          __int16 v96 = 2112;
          id v97 = v14;
          _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_INFO, "%{public}@Invalid number of keychain items(%tu) for accessory '%@'", buf, 0x20u);
        }
        id v82 = v14;

        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        v77 = v31;
        id v46 = v31;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v86 objects:v91 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v87;
          do
          {
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v87 != v49) {
                objc_enumerationMutation(v46);
              }
              uint64_t v51 = *(void *)(*((void *)&v86 + 1) + 8 * i);
              long long v52 = (void *)MEMORY[0x1D944E080]();
              __int16 v53 = v42;
              uint64_t v54 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                __int16 v55 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v93 = v55;
                __int16 v94 = 2112;
                uint64_t v95 = v51;
                _os_log_impl(&dword_1D4758000, v54, OS_LOG_TYPE_INFO, "%{public}@Keychain item %@", buf, 0x16u);
              }
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v86 objects:v91 count:16];
          }
          while (v48);
        }

        char v22 = [(HAPSystemKeychainStore *)v42 getControllerPublicKey:v75 secretKey:v74 keyPair:v81 username:a6 allowCreation:v80 error:a9];
        id v14 = v82;
        uint64_t v31 = v77;
      }
    }
  }
  else
  {
    BOOL v23 = v9;
    BOOL v24 = a3;
    uint64_t v25 = (void *)MEMORY[0x1D944E080]();
    id v26 = self;
    int v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v29 = v28 = a4;
      *(_DWORD *)buf = 138543362;
      v93 = v29;
      _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Accessory Identifier is nil. Cannot retrieve controller key for the given accessory. Returning default controller key.", buf, 0xCu);

      a4 = v28;
    }

    char v22 = [(HAPSystemKeychainStore *)v26 getControllerPublicKey:v24 secretKey:a4 keyPair:a5 username:a6 allowCreation:v23 error:a9];
    id v14 = 0;
  }

  return v22;
}

- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6 allowCreation:(BOOL)a7 forAccessory:(id)a8 error:(id *)a9
{
  return -[HAPSystemKeychainStore _getControllerPublicKey:secretKey:keyPair:username:allowCreation:forAccessory:error:](self, "_getControllerPublicKey:secretKey:keyPair:username:allowCreation:forAccessory:error:", a3, a4, a5, a6, a7, a8);
}

- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 username:(id *)a5 allowCreation:(BOOL)a6 forAccessory:(id)a7 error:(id *)a8
{
  return [(HAPSystemKeychainStore *)self _getControllerPublicKey:a3 secretKey:a4 keyPair:0 username:a5 allowCreation:a6 forAccessory:a7 error:a8];
}

- (id)readControllerPairingKeyForAccessory:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v28 = 0;
  id v29 = 0;
  id v26 = 0;
  id v27 = 0;
  BOOL v6 = [(HAPSystemKeychainStore *)self _getControllerPublicKey:&v29 secretKey:&v28 keyPair:0 username:&v27 allowCreation:0 forAccessory:v5 error:&v26];
  id v7 = v29;
  id v8 = v28;
  id v9 = v27;
  id v10 = v26;
  if (v6)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v7];
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v8];
    uint64_t v13 = [[HAPPairingIdentity alloc] initWithIdentifier:v9 publicKey:v11 privateKey:v12 permissions:0];
    if (!v13)
    {
      context = (void *)MEMORY[0x1D944E080]();
      id v14 = self;
      BOOL v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        BOOL v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v23;
        __int16 v32 = 2112;
        id v33 = v9;
        _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get pairing identity with username, %@", buf, 0x16u);
      }
      if (a4)
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = [NSString stringWithFormat:@"Failed to retrieve pairing identity for accessory : %@", v5];
        *a4 = [v16 hapErrorWithCode:1 description:v17 reason:@"did not find pairing identity in keychain" suggestion:0 underlyingError:0];
      }
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1D944E080]();
    id v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v21;
      __int16 v32 = 2112;
      id v33 = v5;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the accessory pairing key for accessory : %@ : %@", buf, 0x20u);
    }
    uint64_t v13 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v13;
}

- (int)_deleteAllPeripheralIdentifiers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v16 = 0;
  int v3 = [NSNumber numberWithUnsignedInt:1751216194];
  id v4 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v3 account:0 shouldReturnData:1 error:&v16];

  int v5 = v16;
  if (!v16)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          -[HAPSystemKeychainStore _removeKeychainItem:leaveTombstone:](self, "_removeKeychainItem:leaveTombstone:", *(void *)(*((void *)&v12 + 1) + 8 * i), 1, (void)v12);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }

    int v5 = v16;
  }

  return v5;
}

- (BOOL)deleteAllPeripheralIdentifiers:(id *)a3
{
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__5093;
  long long v13 = __Block_byref_object_dispose__5094;
  id v14 = 0;
  int v5 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HAPSystemKeychainStore_deleteAllPeripheralIdentifiers___block_invoke;
  block[3] = &unk_1E69F1DE8;
  block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(v5, block);

  if (a3) {
    *a3 = (id) v10[5];
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __57__HAPSystemKeychainStore_deleteAllPeripheralIdentifiers___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _deleteAllPeripheralIdentifiers];
  if (v2)
  {
    int v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v2 userInfo:0];
  }
  else
  {
    int v3 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
  if (v2)
  {
  }
}

- (id)getPeripheralIdentifiersAndAccessoryNames
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__5093;
  id v14 = __Block_byref_object_dispose__5094;
  id v15 = 0;
  int v3 = [(HAPSystemKeychainStore *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HAPSystemKeychainStore_getPeripheralIdentifiersAndAccessoryNames__block_invoke;
  v9[3] = &unk_1E69F44F0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v3, v9);

  id v4 = (void *)v11[5];
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    char v6 = (void *)v11[5];
    v11[5] = v5;

    id v4 = (void *)v11[5];
  }
  id v7 = v4;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __67__HAPSystemKeychainStore_getPeripheralIdentifiersAndAccessoryNames__block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v30 = 0;
  int v2 = *(void **)(a1 + 32);
  int v3 = [NSNumber numberWithUnsignedInt:1751216194];
  id v4 = [v2 _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v3 account:0 shouldReturnData:1 error:&v30];

  if (!v30)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      BOOL v24 = v4;
      id v11 = 0;
      uint64_t v12 = *(void *)v27;
      do
      {
        uint64_t v13 = 0;
        id v14 = v11;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v8);
          }
          id v15 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
          int v16 = [v15 valueData];
          id v25 = v14;
          int v17 = _deserializeUUID(v16, &v25);
          id v11 = v25;

          int v30 = v17;
          if (v30)
          {
            char v18 = (void *)MEMORY[0x1D944E080]();
            id v19 = *(id *)(a1 + 32);
            uint64_t v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              uint64_t v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              __int16 v32 = v21;
              _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_INFO, "%{public}@### Unable to deserialize UUID from keychain item", buf, 0xCu);
            }
          }
          else
          {
            char v22 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            BOOL v23 = [v15 account];
            [v22 setObject:v11 forKeyedSubscript:v23];
          }
          ++v13;
          id v14 = v11;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v10);

      id v4 = v24;
    }
  }
}

- (int)_getPeripheralIdentifier:(id *)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t *)a5 resumeSessionID:(unint64_t *)a6
{
  int v27 = 0;
  uint64_t v10 = NSNumber;
  id v11 = a4;
  uint64_t v12 = [v10 numberWithUnsignedInt:1751216194];
  uint64_t v13 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v12 account:v11 shouldReturnData:1 error:&v27];

  if (v27)
  {
    id v17 = 0;
    char v18 = 0;
    id v19 = 0;
    id v14 = 0;
    goto LABEL_17;
  }
  if ([v13 count] != 1)
  {
    id v17 = 0;
    char v18 = 0;
    id v19 = 0;
    id v14 = 0;
    int v27 = -6764;
    goto LABEL_17;
  }
  id v14 = [v13 objectAtIndexedSubscript:0];
  id v15 = [v14 valueData];
  id v26 = 0;
  int v16 = _deserializeUUID(v15, &v26);
  id v17 = v26;
  int v27 = v16;

  if (v27)
  {
    char v18 = 0;
    id v19 = 0;
    goto LABEL_17;
  }
  char v18 = [v14 genericData];

  if (v18)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28F98];
    uint64_t v21 = [v14 genericData];
    char v18 = [v20 propertyListWithData:v21 options:0 format:0 error:0];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      char v18 = 0;
    }
  }
  if (!a5)
  {
    id v19 = 0;
    if (!a6) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  id v19 = [v18 objectForKeyedSubscript:@"BLE HomeKit Accessory Protocol Version"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v19 = 0;
  }
  *a5 = [v19 integerValue];
  if (a6)
  {
LABEL_14:
    char v22 = [v18 objectForKeyedSubscript:@"BLE Pair Resume Session ID"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      char v22 = 0;
    }
    *a6 = [v22 longLongValue];
  }
LABEL_17:
  int v23 = v27;
  if (a3)
  {
    if (v27) {
      BOOL v24 = 0;
    }
    else {
      BOOL v24 = v17;
    }
    *a3 = v24;
    int v23 = v27;
  }

  return v23;
}

- (id)readPeripheralIdentifierForAccessoryIdentifier:(id)a3 protocolVersion:(unint64_t *)a4 resumeSessionID:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  int v30 = __Block_byref_object_copy__5093;
  uint64_t v31 = __Block_byref_object_dispose__5094;
  id v32 = 0;
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = __Block_byref_object_copy__5093;
  id v25 = __Block_byref_object_dispose__5094;
  id v26 = 0;
  id v11 = [(HAPSystemKeychainStore *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __111__HAPSystemKeychainStore_readPeripheralIdentifierForAccessoryIdentifier_protocolVersion_resumeSessionID_error___block_invoke;
  v15[3] = &unk_1E69F0F00;
  v15[4] = self;
  id v17 = &v27;
  id v12 = v10;
  id v19 = a4;
  uint64_t v20 = a5;
  id v16 = v12;
  char v18 = &v21;
  dispatch_sync(v11, v15);

  if (a6) {
    *a6 = (id) v22[5];
  }
  id v13 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __111__HAPSystemKeychainStore_readPeripheralIdentifierForAccessoryIdentifier_protocolVersion_resumeSessionID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v2 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _getPeripheralIdentifier:&obj forAccessoryIdentifier:*(void *)(a1 + 40) protocolVersion:*(void *)(a1 + 64) resumeSessionID:*(void *)(a1 + 72)];
  objc_storeStrong((id *)(v2 + 40), obj);
  uint64_t v4 = HMErrorFromOSStatus(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (int)_deletePeripheralIdentifierForAccessoryIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v18 = 0;
  uint64_t v5 = [NSNumber numberWithUnsignedInt:1751216194];
  uint64_t v6 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v5 account:v4 shouldReturnData:1 error:&v18];

  int v7 = v18;
  if (!v18)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        int v18 = -[HAPSystemKeychainStore _removeKeychainItem:leaveTombstone:](self, "_removeKeychainItem:leaveTombstone:", *(void *)(*((void *)&v14 + 1) + 8 * v12), 1, (void)v14);
        if (v18) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    int v7 = v18;
  }

  return v7;
}

- (BOOL)deletePeripheralIdentifierForAccessoryIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__5093;
  uint64_t v20 = __Block_byref_object_dispose__5094;
  id v21 = 0;
  int v7 = [(HAPSystemKeychainStore *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__HAPSystemKeychainStore_deletePeripheralIdentifierForAccessoryIdentifier_error___block_invoke;
  v11[3] = &unk_1E69F1CF8;
  id v8 = v6;
  id v12 = v8;
  id v13 = self;
  long long v14 = &v16;
  long long v15 = &v22;
  dispatch_sync(v7, v11);

  if (a4) {
    *a4 = (id) v17[5];
  }
  char v9 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

uint64_t __81__HAPSystemKeychainStore_deletePeripheralIdentifierForAccessoryIdentifier_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "_deletePeripheralIdentifierForAccessoryIdentifier:");
    if (!v2)
    {
      uint64_t v3 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v2 = 4294960591;
  }
  uint64_t v3 = HMErrorFromOSStatus(v2);
LABEL_6:
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v3;

  return MEMORY[0x1F41817F8]();
}

- (BOOL)updatePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 previousVersion:(unint64_t *)a6 resumeSessionID:(unint64_t)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  uint64_t v36 = 0;
  BOOL v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__5093;
  uint64_t v34 = __Block_byref_object_dispose__5094;
  id v35 = 0;
  uint64_t v16 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__HAPSystemKeychainStore_updatePeripheralIdentifier_forAccessoryIdentifier_protocolVersion_previousVersion_resumeSessionID_error___block_invoke;
  block[3] = &unk_1E69F0ED8;
  id v17 = v15;
  char v25 = &v30;
  uint64_t v27 = a6;
  unint64_t v28 = a5;
  id v22 = v17;
  uint64_t v23 = self;
  unint64_t v29 = a7;
  id v18 = v14;
  id v24 = v18;
  id v26 = &v36;
  dispatch_sync(v16, block);

  if (a8) {
    *a8 = (id) v31[5];
  }
  char v19 = *((unsigned char *)v37 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v19;
}

void __130__HAPSystemKeychainStore_updatePeripheralIdentifier_forAccessoryIdentifier_protocolVersion_previousVersion_resumeSessionID_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(void *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 40), "_getPeripheralIdentifier:forAccessoryIdentifier:protocolVersion:resumeSessionID:", 0);
      **(void **)(a1 + 72) = *(void *)(a1 + 80);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    uint64_t v3 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 40) _deletePeripheralIdentifierForAccessoryIdentifier:v2]);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 88);
      int v13 = 138543874;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating peripheral [%@] keychain with resumeSessionID: %llu", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v9 = [*(id *)(a1 + 40) _savePeripheralIdentifier:*(void *)(a1 + 48) forAccessoryIdentifier:*(void *)(a1 + 32) protocolVersion:*(void *)(a1 + 80) resumeSessionID:*(void *)(a1 + 88)];
    if (v9)
    {
      uint64_t v10 = HMErrorFromOSStatus(v9);
    }
    else
    {
      uint64_t v10 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = HMErrorFromOSStatus(4294960591);
    MEMORY[0x1F41817F8]();
  }
}

- (int)_savePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 resumeSessionID:(unint64_t)a6
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v22[0] = @"BLE HomeKit Accessory Protocol Version";
  id v12 = [NSNumber numberWithUnsignedInteger:a5];
  v22[1] = @"BLE Pair Resume Session ID";
  v23[0] = v12;
  int v13 = [NSNumber numberWithUnsignedLongLong:a6];
  v23[1] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  v24[0] = 0;
  v24[1] = 0;
  if (v10)
  {
    [v10 getUUIDBytes:v24];
    id v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v24 length:16];
    uint64_t v16 = objc_alloc_init(HAPKeychainItem);
    [(HAPKeychainItem *)v16 setAccessGroup:@"com.apple.hap.pairing"];
    __int16 v17 = [NSNumber numberWithUnsignedInt:1751216194];
    [(HAPKeychainItem *)v16 setType:v17];

    uint64_t v18 = [@"BTLE HomeKit Accessory Identifier" stringByAppendingFormat:@": %@", v11];
    [(HAPKeychainItem *)v16 setLabel:v18];

    [(HAPKeychainItem *)v16 setItemDescription:@"Per-device persistent identifier for BTLE accessories that support HomeKit."];
    [(HAPKeychainItem *)v16 setSyncable:0];
    [(HAPKeychainItem *)v16 setAccount:v11];
    [(HAPKeychainItem *)v16 setValueData:v15];
    uint64_t v19 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:200 options:0 error:0];
    [(HAPKeychainItem *)v16 setGenericData:v19];

    int v20 = [(HAPSystemKeychainStore *)self _addKeychainItem:v16 logDuplicateItemError:0];
  }
  else
  {
    int v20 = -6705;
  }

  return v20;
}

- (BOOL)savePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 resumeSessionID:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  unint64_t v29 = __Block_byref_object_copy__5093;
  uint64_t v30 = __Block_byref_object_dispose__5094;
  id v31 = 0;
  id v14 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__HAPSystemKeychainStore_savePeripheralIdentifier_forAccessoryIdentifier_protocolVersion_resumeSessionID_error___block_invoke;
  block[3] = &unk_1E69F0EB0;
  void block[4] = self;
  id v15 = v12;
  id v20 = v15;
  id v16 = v13;
  unint64_t v24 = a5;
  unint64_t v25 = a6;
  id v21 = v16;
  id v22 = &v32;
  uint64_t v23 = &v26;
  dispatch_sync(v14, block);

  if (a7) {
    *a7 = (id) v27[5];
  }
  char v17 = *((unsigned char *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

uint64_t __112__HAPSystemKeychainStore_savePeripheralIdentifier_forAccessoryIdentifier_protocolVersion_resumeSessionID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _savePeripheralIdentifier:*(void *)(a1 + 40) forAccessoryIdentifier:*(void *)(a1 + 48) protocolVersion:*(void *)(a1 + 72) resumeSessionID:*(void *)(a1 + 80)];
  if (v2)
  {
    uint64_t v3 = HMErrorFromOSStatus(v2);
  }
  else
  {
    uint64_t v3 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v3;

  return MEMORY[0x1F41817F8]();
}

- (int)_removeKeychainItem:(id)a3 leaveTombstone:(BOOL)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6 || ![v6 platformReference])
  {
    uint64_t v22 = 4294960591;
LABEL_11:
    uint64_t v23 = (void *)MEMORY[0x1D944E080]();
    unint64_t v24 = self;
    unint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      uint64_t v27 = [NSNumber numberWithInt:v22];
      *(_DWORD *)buf = 138543618;
      id v31 = v26;
      __int16 v32 = 2112;
      id v33 = v27;
      _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete keychain item with error %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  uint64_t v8 = (const void *)[v7 platformReference];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD40], v8);
  id v10 = (void *)MEMORY[0x1D944E080]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = unint64_t v29 = self;
    id v14 = [v7 account];
    id v15 = [v7 label];
    id v16 = [v7 type];
    *(_DWORD *)buf = 138544130;
    id v31 = v13;
    __int16 v32 = 2112;
    id v33 = v14;
    __int16 v34 = 2112;
    char v35 = v15;
    __int16 v36 = 2080;
    BOOL v37 = KeyTypeDescription(v16);
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing keychain item with account  %@(%@) keyType: %s", buf, 0x2Au);

    self = v29;
  }

  if ([v7 isSyncable] && !a4)
  {
    char v17 = (void *)MEMORY[0x1D944E080]();
    uint64_t v18 = v11;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      id v21 = [v7 account];
      *(_DWORD *)buf = 138543618;
      id v31 = v20;
      __int16 v32 = 2112;
      id v33 = v21;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@Removing syncable keychain item with account %@ and not setting tombstone", buf, 0x16u);
    }
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD30], (const void *)*MEMORY[0x1E4F1CFC8]);
  }
  uint64_t v22 = SecItemDelete(Mutable);
  CFRelease(Mutable);
  if (v22) {
    goto LABEL_11;
  }
LABEL_14:

  return v22;
}

- (int)_addKeychainItem:(id)a3 logDuplicateItemError:(BOOL)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 accessGroup];

  if (!v7) {
    goto LABEL_23;
  }
  uint64_t v8 = [v6 type];

  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v9 = [v6 label];

  if (!v9) {
    goto LABEL_23;
  }
  id v10 = [v6 itemDescription];

  if (!v10) {
    goto LABEL_23;
  }
  id v11 = [v6 account];

  if (v11 && ([v6 valueData], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (Mutable)
    {
      id v14 = Mutable;
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
      id v15 = (const void *)*MEMORY[0x1E4F3B550];
      id v16 = [v6 accessGroup];
      CFDictionaryAddValue(v14, v15, v16);

      CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B580]);
      char v17 = (const void *)*MEMORY[0x1E4F3B8C0];
      uint64_t v18 = [v6 type];
      CFDictionaryAddValue(v14, v17, v18);

      uint64_t v19 = (const void *)*MEMORY[0x1E4F3B788];
      id v20 = [v6 label];
      CFDictionaryAddValue(v14, v19, v20);

      id v21 = (const void *)*MEMORY[0x1E4F3B678];
      uint64_t v22 = [v6 itemDescription];
      CFDictionaryAddValue(v14, v21, v22);

      uint64_t v23 = (const void *)*MEMORY[0x1E4F3B5C0];
      unint64_t v24 = [v6 account];
      CFDictionaryAddValue(v14, v23, v24);

      unint64_t v25 = (const void *)*MEMORY[0x1E4F3B850];
      uint64_t v26 = [v6 label];
      CFDictionaryAddValue(v14, v25, v26);

      uint64_t v27 = [v6 genericData];

      if (v27)
      {
        uint64_t v28 = (const void *)*MEMORY[0x1E4F3B688];
        unint64_t v29 = [v6 genericData];
        CFDictionaryAddValue(v14, v28, v29);
      }
      uint64_t v30 = (const void *)*MEMORY[0x1E4F3BD38];
      id v31 = [v6 valueData];
      CFDictionaryAddValue(v14, v30, v31);

      int v32 = [v6 isSyncable];
      id v33 = (const void *)*MEMORY[0x1E4F1CFD0];
      if (v32) {
        __int16 v34 = (const void *)*MEMORY[0x1E4F1CFD0];
      }
      else {
        __int16 v34 = (const void *)*MEMORY[0x1E4F1CFC8];
      }
      CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E4F3B878], v34);
      if ([v6 isSyncable]) {
        CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E4F3B698], v33);
      }
      char v35 = [v6 viewHint];

      if (v35)
      {
        __int16 v36 = (const void *)*MEMORY[0x1E4F3B870];
        BOOL v37 = [v6 viewHint];
        CFDictionaryAddValue(v14, v36, v37);
      }
      OSStatus v38 = SecItemAdd(v14, 0);
      CFRelease(v14);
      if (a4 || (int v39 = -25299, v38 != -25299))
      {
        BOOL v40 = (void *)MEMORY[0x1D944E080]();
        id v41 = self;
        id v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          id v43 = HMFGetLogIdentifier();
          long long v44 = [v6 account];
          uint64_t v45 = [v6 viewHint];
          int v47 = 138544130;
          uint64_t v48 = v43;
          __int16 v49 = 2112;
          long long v50 = v44;
          __int16 v51 = 2112;
          long long v52 = v45;
          __int16 v53 = 2048;
          uint64_t v54 = v38;
          _os_log_impl(&dword_1D4758000, v42, OS_LOG_TYPE_INFO, "%{public}@Adding keychain item for username %@ with viewHint %@ - error %ld", (uint8_t *)&v47, 0x2Au);
        }
        int v39 = v38;
      }
    }
    else
    {
      int v39 = -6728;
    }
  }
  else
  {
LABEL_23:
    int v39 = -6705;
  }

  return v39;
}

- (BOOL)_updateKeychainItemWithPlatformIdentifier:(void *)a3 keychainItem:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (![v8 platformReference])
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  Mutable = [v8 valueData];

  if (!Mutable)
  {
LABEL_13:
    _HMFPreconditionFailure();
LABEL_14:
    CFRelease(Mutable);
    id v16 = 0;
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v9 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  id v10 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, (const void *)*MEMORY[0x1E4F3BD40], a3);
  CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(0, 0, v9, v10);
  if (!v11) {
    goto LABEL_14;
  }
  id v12 = v11;
  id v13 = (const void *)*MEMORY[0x1E4F3BD38];
  id v14 = [v8 valueData];
  CFDictionaryAddValue(v12, v13, v14);

  uint64_t v15 = SecItemUpdate((CFDictionaryRef)Mutable, v12);
  if (v15)
  {
    id v16 = HMErrorFromOSStatus(v15);
    char v17 = (void *)MEMORY[0x1D944E080]();
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v21 = 138543618;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      unint64_t v24 = v16;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to updated keychain item to set invisible with error: %@", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    id v16 = 0;
  }
  CFRelease(Mutable);
  CFRelease(v12);
  if (a5) {
LABEL_10:
  }
    *a5 = v16;
LABEL_11:

  return v16 == 0;
}

- (id)_auditKeychainItems:(id)a3 managedAccessories:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  id v56 = [v7 allKeys];
  __int16 v51 = v7;
  uint64_t v54 = (void *)[v7 mutableCopy];
  uint64_t v9 = (void *)MEMORY[0x1D944E080]();
  id v10 = self;
  CFMutableDictionaryRef v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v68 = v12;
    __int16 v69 = 2112;
    v70 = v56;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Auditing keychain entries for accessories: %@", buf, 0x16u);
  }
  __int16 v53 = (void *)v8;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v6;
  uint64_t v13 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (!v13)
  {
    int v16 = 0;
    goto LABEL_24;
  }
  uint64_t v15 = v13;
  int v16 = 0;
  uint64_t v55 = *(void *)v62;
  *(void *)&long long v14 = 138543618;
  long long v50 = v14;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v62 != v55) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void **)(*((void *)&v61 + 1) + 8 * i);
      uint64_t v19 = objc_msgSend(v18, "account", v50);
      if ([v56 containsObject:v19])
      {
        objc_msgSend(v51, "hmf_dataForKey:", v19);
        id v20 = (HAPKeychainStoreRemovedAccessory *)objc_claimAutoreleasedReturnValue();
        if ([v18 matchesPublicKeyData:v20])
        {
          [v54 removeObjectForKey:v19];
          goto LABEL_20;
        }
        uint64_t v26 = (void *)MEMORY[0x1D944E080]();
        uint64_t v27 = v10;
        uint64_t v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          unint64_t v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v50;
          v68 = v29;
          __int16 v69 = 2112;
          v70 = v19;
          _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_INFO, "%{public}@Auditing keychain entries - will remove keychain item for accessory %@ due to data mismatch", buf, 0x16u);
        }
      }
      else
      {
        int v21 = (void *)MEMORY[0x1D944E080]();
        uint64_t v22 = v10;
        __int16 v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          unint64_t v24 = HMFGetLogIdentifier();
          uint64_t v25 = [v18 account];
          *(_DWORD *)buf = v50;
          v68 = v24;
          __int16 v69 = 2112;
          v70 = v25;
          _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_INFO, "%{public}@Auditing keychain entries - will remove spurious keychain item - %@", buf, 0x16u);
        }
      }
      uint64_t v30 = [HAPKeychainStoreRemovedAccessory alloc];
      id v31 = [v18 account];
      int v32 = [v18 creationDate];
      id v20 = [(HAPKeychainStoreRemovedAccessory *)v30 initWithName:v31 creationDate:v32];

      uint64_t v33 = [(HAPSystemKeychainStore *)v10 _removeKeychainItem:v18 leaveTombstone:1];
      int v16 = v33;
      if (v33)
      {
        __int16 v34 = HMErrorFromOSStatus(v33);
        [(HAPKeychainStoreRemovedAccessory *)v20 setRemoveError:v34];
      }
      [v53 addObject:v20];
LABEL_20:
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  }
  while (v15);
LABEL_24:

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  char v35 = [v54 allKeys];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v58;
    while (2)
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v58 != v38) {
          objc_enumerationMutation(v35);
        }
        BOOL v40 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        id v41 = (void *)MEMORY[0x1D944E080]();
        id v42 = v10;
        id v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          long long v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v68 = v44;
          __int16 v69 = 2112;
          v70 = v40;
          _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_INFO, "%{public}@Auditing keychain entries - adding keychain item for accessory %@", buf, 0x16u);
        }
        uint64_t v45 = objc_msgSend(v54, "hmf_dataForKey:", v40);
        int v46 = [(HAPSystemKeychainStore *)v42 _savePublicKey:v45 forAccessoryName:v40];

        if (v46)
        {

          goto LABEL_38;
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (v37) {
        continue;
      }
      break;
    }

LABEL_36:
    int v47 = v53;
    id v48 = v53;
  }
  else
  {

    if (!v16) {
      goto LABEL_36;
    }
LABEL_38:
    id v48 = 0;
    int v47 = v53;
  }

  return v48;
}

- (id)auditKeysOfManagedAccessories:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__5093;
  int v16 = __Block_byref_object_dispose__5094;
  id v17 = 0;
  uint64_t v5 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HAPSystemKeychainStore_auditKeysOfManagedAccessories___block_invoke;
  block[3] = &unk_1E69F26B0;
  id v10 = v4;
  CFMutableDictionaryRef v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__HAPSystemKeychainStore_auditKeysOfManagedAccessories___block_invoke(uint64_t a1)
{
  int v9 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedInt:1751216193];
  id v4 = [v2 _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v3 account:0 shouldReturnData:1 error:&v9];

  if (v9) {
    BOOL v5 = v9 == -25300;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) _auditKeychainItems:v4 managedAccessories:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (int)_removeAccessoryKeyForName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v19 = 0;
  BOOL v5 = [NSNumber numberWithUnsignedInt:1751216193];
  uint64_t v6 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v5 account:v4 shouldReturnData:1 error:&v19];

  int v7 = v19;
  if (!v19)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = -[HAPSystemKeychainStore _removeKeychainItem:leaveTombstone:](self, "_removeKeychainItem:leaveTombstone:", *(void *)(*((void *)&v15 + 1) + 8 * i), 1, (void)v15);
          if (v13) {
            int v19 = v13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }

    int v7 = v19;
  }

  return v7;
}

- (BOOL)removeAllAccessoryKeys:(id *)a3
{
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__5093;
  int v13 = __Block_byref_object_dispose__5094;
  id v14 = 0;
  BOOL v5 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HAPSystemKeychainStore_removeAllAccessoryKeys___block_invoke;
  block[3] = &unk_1E69F1DE8;
  void block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(v5, block);

  if (a3) {
    *a3 = (id) v10[5];
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __49__HAPSystemKeychainStore_removeAllAccessoryKeys___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _removeAccessoryKeyForName:0];
  if (v2 == -25300
    || (int v3 = v2,
        HMErrorFromOSStatus(v2),
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8),
        char v6 = *(void **)(v5 + 40),
        *(void *)(v5 + 40) = v4,
        v6,
        !v3))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)removeAccessoryKeyForName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  int v19 = __Block_byref_object_copy__5093;
  id v20 = __Block_byref_object_dispose__5094;
  id v21 = 0;
  int v7 = [(HAPSystemKeychainStore *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HAPSystemKeychainStore_removeAccessoryKeyForName_error___block_invoke;
  v11[3] = &unk_1E69F1CF8;
  id v8 = v6;
  id v12 = v8;
  int v13 = self;
  id v14 = &v16;
  uint64_t v15 = &v22;
  dispatch_sync(v7, v11);

  if (a4) {
    *a4 = (id) v17[5];
  }
  char v9 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __58__HAPSystemKeychainStore_removeAccessoryKeyForName_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "_removeAccessoryKeyForName:");
    int v3 = v2;
    uint64_t v4 = HMErrorFromOSStatus(v2);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (!v3) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = HMErrorFromOSStatus(4294960591);
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)registerAccessoryWithHomeKit:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  int v19 = __Block_byref_object_copy__5093;
  id v20 = __Block_byref_object_dispose__5094;
  id v21 = 0;
  int v7 = [(HAPSystemKeychainStore *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HAPSystemKeychainStore_registerAccessoryWithHomeKit_error___block_invoke;
  v11[3] = &unk_1E69F1CF8;
  id v8 = v6;
  id v12 = v8;
  int v13 = self;
  id v14 = &v16;
  uint64_t v15 = &v22;
  dispatch_sync(v7, v11);

  if (a4) {
    *a4 = (id) v17[5];
  }
  char v9 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __61__HAPSystemKeychainStore_registerAccessoryWithHomeKit_error___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    char v19 = 0;
    uint64_t v2 = *(void **)(a1 + 40);
    id v18 = 0;
    uint64_t v3 = objc_msgSend(v2, "_getPublicKey:registeredWithHomeKit:forAccessoryName:", &v18, &v19);
    id v4 = v18;
    if (v3)
    {
      uint64_t v5 = HMErrorFromOSStatus(v3);
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      int v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    else if (!v19)
    {
      [*(id *)(a1 + 40) _removeAccessoryKeyForName:*(void *)(a1 + 32)];
      uint64_t v8 = [*(id *)(a1 + 40) _savePublicKey:v4 forAccessoryName:*(void *)(a1 + 32)];
      int v9 = v8;
      uint64_t v10 = HMErrorFromOSStatus(v8);
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (v9 != -25299)
      {
        if (v9)
        {
          int v13 = (void *)MEMORY[0x1D944E080]();
          id v14 = *(id *)(a1 + 40);
          uint64_t v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            uint64_t v16 = HMFGetLogIdentifier();
            uint64_t v17 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138544130;
            id v21 = v16;
            __int16 v22 = 2112;
            id v23 = v4;
            __int16 v24 = 2112;
            uint64_t v25 = v17;
            __int16 v26 = 2048;
            uint64_t v27 = v9;
            _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize public key '%@' for accessory %@ - error %ld", buf, 0x2Au);
          }
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
      }
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = HMErrorFromOSStatus(4294960591);
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)establishRelationshipBetweenAccessoryAndControllerKey:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_28;
  }
  id v4 = v11;
  uint64_t v5 = [v11 identifier];

  if (!v5)
  {
LABEL_28:
    _HMFPreconditionFailure();
    goto LABEL_29;
  }
  id v12 = [v4 identifier];

  if (v12)
  {
    int v13 = (void *)MEMORY[0x1D944E080]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      uint64_t v17 = [v4 identifier];
      id v18 = [v4 controllerKeyIdentifier];
      *(_DWORD *)buf = 138543874;
      __int16 v49 = v16;
      __int16 v50 = 2112;
      __int16 v51 = v17;
      __int16 v52 = 2112;
      __int16 v53 = v18;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Establish relationship between Accessory : [%@] & controller key : [%@]", buf, 0x20u);
    }
    uint64_t v5 = [NSNumber numberWithUnsignedInt:1751216193];
    int v43 = 0;
    char v19 = [v4 identifier];
    self = [(HAPSystemKeychainStore *)v14 _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v5 account:v19 shouldReturnData:1 error:&v43];

    if (!self || [(HAPSystemKeychainStore *)self hmf_isEmpty])
    {
      id v20 = (void *)MEMORY[0x1D944E080]();
      uint64_t v21 = v14;
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        __int16 v24 = [v4 identifier];
        *(_DWORD *)buf = 138543618;
        __int16 v49 = v23;
        __int16 v50 = 2112;
        __int16 v51 = v24;
        _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not locate the accessory keychain item for : %@", buf, 0x16u);
      }
      LOBYTE(v21) = 0;
      goto LABEL_24;
    }
    uint64_t v8 = [(HAPSystemKeychainStore *)self firstObject];
    uint64_t v25 = objc_opt_class();
    __int16 v26 = [v8 genericData];
    uint64_t v27 = [v4 controllerKeyIdentifier];
    uint64_t v21 = [v25 updateAccessoryPairingGenericData:v26 updatedControllerKeyIdentifier:v27];

    uint64_t v6 = [v4 publicKey];
    id v7 = [v6 data];
    id v42 = (void *)v21;
    if ([v7 bytes])
    {
      DataToHexCStringEx();

      uint64_t v28 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:64];
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      id v41 = v8;
      if ([v8 platformReference])
      {
        uint64_t v30 = (const void *)[v8 platformReference];
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD40], v30);
        id v31 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        if (v31)
        {
          int v32 = v31;
          CFDictionaryAddValue(v31, (const void *)*MEMORY[0x1E4F3BD38], v28);
          CFDictionaryAddValue(v32, (const void *)*MEMORY[0x1E4F3B688], (const void *)v21);
          uint64_t v33 = SecItemUpdate(Mutable, v32);
          LOBYTE(v21) = v33 == 0;
          if (v33)
          {
            uint64_t v34 = v33;
            BOOL v40 = v28;
            context = (void *)MEMORY[0x1D944E080]();
            char v35 = v14;
            uint64_t v36 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              uint64_t v38 = HMFGetLogIdentifier();
              *(_DWORD *)long long v44 = 138543618;
              uint64_t v45 = v38;
              __int16 v46 = 1024;
              int v47 = v34;
              _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to update accessory keychain item : %d", v44, 0x12u);
            }
            uint64_t v28 = v40;
            if (a4)
            {
              HMErrorFromOSStatus(v34);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          CFRelease(Mutable);
          goto LABEL_22;
        }
      }
      else
      {
        int v43 = -6705;
      }
      int v32 = Mutable;
LABEL_22:
      CFRelease(v32);

      uint64_t v8 = v41;
LABEL_23:

LABEL_24:
      goto LABEL_25;
    }
LABEL_29:

    if (a4)
    {
      HMErrorFromOSStatus(4294960591);
      LOBYTE(v21) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v21) = 0;
    }
    goto LABEL_23;
  }
  if (a4)
  {
    HMErrorFromOSStatus(4294960591);
    LOBYTE(v21) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v21) = 0;
  }
LABEL_25:

  return v21 & 1;
}

- (int)_savePublicKey:(id)a3 forAccessoryName:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([a3 bytes])
  {
    DataToHexCStringEx();
    id v7 = objc_alloc_init(HAPKeychainItem);
    [(HAPKeychainItem *)v7 setAccessGroup:@"com.apple.hap.pairing"];
    uint64_t v8 = [NSNumber numberWithUnsignedInt:1751216193];
    [(HAPKeychainItem *)v7 setType:v8];

    int v9 = [@"Paired HomeKit Accessory" stringByAppendingFormat:@": %@", v6];
    [(HAPKeychainItem *)v7 setLabel:v9];

    [(HAPKeychainItem *)v7 setItemDescription:@"HomeKit accessory that has been paired with this account."];
    [(HAPKeychainItem *)v7 setSyncable:0];
    [(HAPKeychainItem *)v7 setAccount:v6];
    uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v17 length:64];
    [(HAPKeychainItem *)v7 setValueData:v10];

    uint64_t v15 = @"homeKitRegistered";
    uint64_t v16 = MEMORY[0x1E4F1CC38];
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:200 options:0 error:0];
    [(HAPKeychainItem *)v7 setGenericData:v12];

    int v13 = [(HAPSystemKeychainStore *)self _addKeychainItem:v7 logDuplicateItemError:0];
  }
  else
  {
    int v13 = -6705;
  }

  return v13;
}

- (BOOL)savePublicKey:(id)a3 forAccessoryName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__5093;
  __int16 v24 = __Block_byref_object_dispose__5094;
  id v25 = 0;
  uint64_t v10 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HAPSystemKeychainStore_savePublicKey_forAccessoryName_error___block_invoke;
  block[3] = &unk_1E69F27F0;
  void block[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  uint64_t v18 = &v20;
  char v19 = &v26;
  dispatch_sync(v10, block);

  if (a5) {
    *a5 = (id) v21[5];
  }
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __63__HAPSystemKeychainStore_savePublicKey_forAccessoryName_error___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _savePublicKey:*(void *)(a1 + 40) forAccessoryName:*(void *)(a1 + 48)];
  int v3 = v2;
  uint64_t v4 = HMErrorFromOSStatus(v2);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (v3 != -25299)
  {
    if (v3)
    {
      id v7 = (void *)MEMORY[0x1D944E080]();
      id v8 = *(id *)(a1 + 32);
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = *(void *)(a1 + 48);
        int v13 = 138544130;
        id v14 = v10;
        __int16 v15 = 2112;
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        __int16 v19 = 2048;
        uint64_t v20 = v3;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize public key '%@' for accessory %@ - error %ld", (uint8_t *)&v13, 0x2Au);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
}

- (int)_removeControllerKeyPairForKeyType:(id)a3 identifier:(id)a4 leaveTombstone:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int v25 = 0;
  id v9 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:a3 account:0 shouldReturnData:1 error:&v25];
  uint64_t v10 = v9;
  int v11 = v25;
  if (!v25)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v9;
    id v13 = (id)[v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      uint64_t v20 = v10;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (v8)
          {
            __int16 v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) account];
            int v18 = [v17 isEqualToString:v8];

            if (v18)
            {
              id v13 = v16;
              [(HAPSystemKeychainStore *)self _removeKeychainItem:v13 leaveTombstone:v5];
              goto LABEL_13;
            }
          }
          else
          {
            [(HAPSystemKeychainStore *)self _removeKeychainItem:*(void *)(*((void *)&v21 + 1) + 8 * i) leaveTombstone:v5];
          }
        }
        id v13 = (id)[v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v13);
LABEL_13:
      uint64_t v10 = v20;
    }

    if (!v8 || v13)
    {
      int v11 = v25;
    }
    else
    {
      int v11 = -6727;
      int v25 = -6727;
    }
  }

  return v11;
}

- (int)_removeControllerKeyPairForIdentifier:(id)a3 leaveTombstone:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(HAPSystemKeychainStore *)self _removeControllerKeyPairForKeyType:&unk_1F2C80928 identifier:v6 leaveTombstone:v4];
  int v8 = [(HAPSystemKeychainStore *)self _removeControllerKeyPairForKeyType:&unk_1F2C80940 identifier:v6 leaveTombstone:v4];
  if (!v7) {
    int v7 = v8;
  }
  int v9 = [(HAPSystemKeychainStore *)self _removeControllerKeyPairForKeyType:&unk_1F2C80958 identifier:v6 leaveTombstone:v4];
  if (!v7) {
    int v7 = v9;
  }
  int v10 = [(HAPSystemKeychainStore *)self _removeControllerKeyPairForKeyType:&unk_1F2C80970 identifier:v6 leaveTombstone:v4];
  if (!v7) {
    int v7 = v10;
  }
  int v11 = [(HAPSystemKeychainStore *)self _removeControllerKeyPairForKeyType:&unk_1F2C80988 identifier:v6 leaveTombstone:v4];
  if (!v7) {
    int v7 = v11;
  }
  int v12 = [(HAPSystemKeychainStore *)self _removeControllerKeyPairForKeyType:&unk_1F2C809A0 identifier:v6 leaveTombstone:v4];

  if (v7) {
    return v7;
  }
  else {
    return v12;
  }
}

- (BOOL)removeControllerKeyPairForIdentifier:(id)a3 leaveTombstone:(BOOL)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__5093;
    uint64_t v28 = __Block_byref_object_dispose__5094;
    id v29 = 0;
    int v9 = [(HAPSystemKeychainStore *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__HAPSystemKeychainStore_removeControllerKeyPairForIdentifier_leaveTombstone_error___block_invoke;
    block[3] = &unk_1E69F0E88;
    void block[4] = self;
    BOOL v20 = a4;
    id v17 = v8;
    p_long long buf = &buf;
    __int16 v19 = &v21;
    dispatch_sync(v9, block);

    if (a5) {
      *a5 = *(id *)(*((void *)&buf + 1) + 40);
    }
    BOOL v10 = *((unsigned char *)v22 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    int v11 = (void *)MEMORY[0x1D944E080]();
    int v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@inIdentifier must be specified", (uint8_t *)&buf, 0xCu);
    }
    if (a5)
    {
      HMErrorFromOSStatus(4294960569);
      BOOL v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

void __84__HAPSystemKeychainStore_removeControllerKeyPairForIdentifier_leaveTombstone_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _removeControllerKeyPairForIdentifier:*(void *)(a1 + 40) leaveTombstone:*(unsigned __int8 *)(a1 + 64)];
  int v3 = v2;
  uint64_t v4 = HMErrorFromOSStatus(v2);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!v3)
  {
    int v7 = [*(id *)(a1 + 32) activeControllerIdentifier];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 40)];

    if (v8)
    {
      int v9 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 32) setActiveControllerIdentifier:0]);
      id v10 = *(id *)(a1 + 32);
      int v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = HMFGetLogIdentifier();
        uint64_t v13 = *(void *)(a1 + 40);
        int v14 = 138543618;
        __int16 v15 = v12;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Removed controller key %@ and set active controller identifier to nil", (uint8_t *)&v14, 0x16u);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (BOOL)removeControllerKeyPairLeaveTombstone:(BOOL)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__5093;
  __int16 v16 = __Block_byref_object_dispose__5094;
  id v17 = 0;
  int v7 = [(HAPSystemKeychainStore *)self queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__HAPSystemKeychainStore_removeControllerKeyPairLeaveTombstone_error___block_invoke;
  v10[3] = &unk_1E69F0E60;
  BOOL v11 = a3;
  v10[4] = self;
  void v10[5] = &v18;
  v10[6] = &v12;
  dispatch_sync(v7, v10);

  if (a4) {
    *a4 = (id) v13[5];
  }
  char v8 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __70__HAPSystemKeychainStore_removeControllerKeyPairLeaveTombstone_error___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _removeControllerKeyPairForIdentifier:0 leaveTombstone:*(unsigned __int8 *)(a1 + 56)];
  if (v2 == -25300)
  {
    [*(id *)(a1 + 32) setActiveControllerIdentifier:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    int v3 = v2;
    uint64_t v4 = HMErrorFromOSStatus(v2);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (!v3)
    {
      uint64_t v7 = [*(id *)(a1 + 32) setActiveControllerIdentifier:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      char v8 = (void *)MEMORY[0x1D944E080](v7);
      id v9 = *(id *)(a1 + 32);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        BOOL v11 = HMFGetLogIdentifier();
        int v12 = 138543362;
        uint64_t v13 = v11;
        _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@Removed controller keys and set active controller identifier to nil", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (BOOL)removeControllerKeyPairWithError:(id *)a3
{
  return [(HAPSystemKeychainStore *)self removeControllerKeyPairLeaveTombstone:1 error:a3];
}

- (BOOL)getCurrentiCloudIdentifier:(id *)a3 controllerPairingIdentifier:(id *)a4 error:(id *)a5
{
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__5093;
  id v29 = __Block_byref_object_dispose__5094;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__5093;
  uint64_t v23 = __Block_byref_object_dispose__5094;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__5093;
  id v17 = __Block_byref_object_dispose__5094;
  id v18 = 0;
  id v9 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__HAPSystemKeychainStore_getCurrentiCloudIdentifier_controllerPairingIdentifier_error___block_invoke;
  block[3] = &unk_1E69F0E38;
  void block[4] = self;
  void block[5] = &v25;
  block[6] = &v19;
  void block[7] = &v13;
  block[8] = &v31;
  dispatch_sync(v9, block);

  if (a3) {
    *a3 = (id) v26[5];
  }
  if (a4) {
    *a4 = (id) v20[5];
  }
  if (a5) {
    *a5 = (id) v14[5];
  }
  char v10 = *((unsigned char *)v32 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v10;
}

void __87__HAPSystemKeychainStore_getCurrentiCloudIdentifier_controllerPairingIdentifier_error___block_invoke(void *a1)
{
  unsigned int v18 = 0;
  uint64_t v2 = (void *)a1[4];
  int v3 = [NSNumber numberWithUnsignedInt:1751216211];
  uint64_t v4 = [v2 _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v3 account:0 shouldReturnData:1 error:&v18];

  uint64_t v5 = v18;
  if (!v18)
  {
    if ([v4 count] == 1)
    {
      id v6 = [v4 firstObject];
      uint64_t v7 = [v6 account];
      uint64_t v8 = *(void *)(a1[5] + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v10 = [NSString alloc];
      BOOL v11 = [v6 valueData];
      uint64_t v12 = [v10 initWithData:v11 encoding:4];
      uint64_t v13 = *(void *)(a1[6] + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      uint64_t v5 = v18;
    }
    else
    {
      uint64_t v5 = 4294960532;
      unsigned int v18 = -6764;
    }
  }
  uint64_t v15 = HMErrorFromOSStatus(v5);
  uint64_t v16 = *(void *)(a1[7] + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  if (!v18) {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
  }
}

- (int)_updateCurrentiCloudIdentifier:(id)a3 controllerPairingIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v16 = 0;
  uint64_t v8 = [NSNumber numberWithUnsignedInt:1751216211];
  id v9 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v8 account:0 shouldReturnData:1 error:&v16];

  if (![v9 count]
    || ([v9 firstObject],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v16 = [(HAPSystemKeychainStore *)self _removeKeychainItem:v10 leaveTombstone:1], v10, (int v11 = v16) == 0))
  {
    int v11 = 0;
    if (v6 && v7)
    {
      uint64_t v12 = objc_alloc_init(HAPKeychainItem);
      [(HAPKeychainItem *)v12 setAccessGroup:@"com.apple.hap.pairing"];
      uint64_t v13 = [NSNumber numberWithUnsignedInt:1751216211];
      [(HAPKeychainItem *)v12 setType:v13];

      [(HAPKeychainItem *)v12 setLabel:@"iCloud HomeKit Identifier"];
      [(HAPKeychainItem *)v12 setItemDescription:@"Per-device mapping between the current iCloud account and the HomeKit Pairing Identity."];
      [(HAPKeychainItem *)v12 setSyncable:0];
      [(HAPKeychainItem *)v12 setAccount:v6];
      uint64_t v14 = [v7 dataUsingEncoding:4];
      [(HAPKeychainItem *)v12 setValueData:v14];

      int v11 = [(HAPSystemKeychainStore *)self _addKeychainItem:v12 logDuplicateItemError:1];
      int v16 = v11;
    }
  }

  return v11;
}

- (BOOL)updateCurrentiCloudIdentifier:(id)a3 controllerPairingIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([(HAPSystemKeychainStore *)self isHH2Enabled])
  {
    int v11 = (void *)MEMORY[0x1D944E080]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      uint64_t v15 = (objc_class *)objc_opt_class();
      int v16 = NSStringFromClass(v15);
      NSStringFromSelector(a2);
      id v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v31 = v17;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@-[%@ %@] no-op in ROAR", buf, 0x20u);
    }
    BOOL v18 = 1;
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__5093;
    int v32 = __Block_byref_object_dispose__5094;
    id v33 = 0;
    uint64_t v19 = [(HAPSystemKeychainStore *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__HAPSystemKeychainStore_updateCurrentiCloudIdentifier_controllerPairingIdentifier_error___block_invoke;
    block[3] = &unk_1E69F27F0;
    void block[4] = self;
    id v22 = v9;
    id v23 = v10;
    id v24 = &v26;
    uint64_t v25 = buf;
    dispatch_sync(v19, block);

    if (a5) {
      *a5 = *(id *)(*(void *)&buf[8] + 40);
    }
    BOOL v18 = *((unsigned char *)v27 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v26, 8);
  }

  return v18;
}

uint64_t __90__HAPSystemKeychainStore_updateCurrentiCloudIdentifier_controllerPairingIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _updateCurrentiCloudIdentifier:*(void *)(a1 + 40) controllerPairingIdentifier:*(void *)(a1 + 48)];
  if (v2)
  {
    uint64_t v3 = HMErrorFromOSStatus(v2);
  }
  else
  {
    uint64_t v3 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v3;

  return MEMORY[0x1F41817F8]();
}

- (NSString)activeControllerPairingIdentifier
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5093;
  int v11 = __Block_byref_object_dispose__5094;
  id v12 = 0;
  uint64_t v3 = [(HAPSystemKeychainStore *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HAPSystemKeychainStore_activeControllerPairingIdentifier__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __59__HAPSystemKeychainStore_activeControllerPairingIdentifier__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) activeControllerIdentifier];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)updateActiveControllerPairingIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HAPSystemKeychainStore_updateActiveControllerPairingIdentifier___block_invoke;
  block[3] = &unk_1E69F26B0;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __66__HAPSystemKeychainStore_updateActiveControllerPairingIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) activeControllerIdentifier];
  char v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void **)(a1 + 40);
      int v17 = 138543618;
      BOOL v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Controller pairing identifier is already set to: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) activeControllerIdentifier];

    if (v9) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    id v10 = (void *)MEMORY[0x1D944E080]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      char v14 = [*(id *)(a1 + 32) activeControllerIdentifier];
      uint64_t v15 = *(void *)(a1 + 40);
      int v16 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v17 = 138544130;
      BOOL v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      __int16 v23 = 1024;
      int v24 = v16;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@Active controller identifier is changing from %@ to %@, marking it as change: %d", (uint8_t *)&v17, 0x26u);
    }
    [*(id *)(a1 + 32) setActiveControllerIdentifier:*(void *)(a1 + 40)];
  }
}

- (int)_getAllAvailableControllerPublicKeys:(id *)a3 secretKeys:(id *)a4 userNames:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  int v48 = 0;
  int v7 = deviceSupportsKeychainSync();
  if (v7) {
    uint64_t v8 = &unk_1F2C80928;
  }
  else {
    uint64_t v8 = &unk_1F2C80970;
  }
  id v9 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v8 account:0 shouldReturnData:1 error:&v48];
  [v6 addObjectsFromArray:v9];
  int v47 = 0;
  id v10 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:&unk_1F2C80940 account:0 shouldReturnData:1 error:&v47];
  [v6 addObjectsFromArray:v10];
  int v46 = 0;
  uint64_t v39 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:&unk_1F2C80958 account:0 shouldReturnData:1 error:&v46];
  objc_msgSend(v6, "addObjectsFromArray:");
  if (v7)
  {
    v51[0] = 0;
    id v11 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:&unk_1F2C80970 account:0 shouldReturnData:1 error:v51];
    [v6 addObjectsFromArray:v11];
    int v13 = v47;
    int v12 = v48;
    int v14 = v46;
    int v15 = v51[0];

    if (!v12 || !v13 || !v14 || !v15) {
      goto LABEL_14;
    }
LABEL_13:
    id v16 = 0;
    int v17 = 0;
    BOOL v18 = 0;
    __int16 v19 = 0;
    uint64_t v20 = (void *)v39;
    goto LABEL_38;
  }
  int v12 = v48;
  if (v48 && v47 && v46) {
    goto LABEL_13;
  }
LABEL_14:
  if ([v6 count])
  {
    id v40 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    id v16 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    id v16 = 0;
    uint64_t v21 = 0;
    id v40 = 0;
  }
  id v41 = (id)v21;
  uint64_t v34 = v10;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  char v35 = v6;
  id v22 = v6;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    __int16 v19 = 0;
    uint64_t v25 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v28 = [v27 account];
        char v29 = [v16 containsObject:v28];

        if ((v29 & 1) == 0)
        {
          id v30 = [v27 valueData];
          int v12 = _deserializeDataToKeyPair(v30, (uint64_t)v51, (uint64_t)__s);

          if (v12)
          {

            id v6 = v35;
            id v10 = v34;
            uint64_t v20 = (void *)v39;
            BOOL v18 = v40;
            goto LABEL_37;
          }
          uint64_t v31 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v51 length:32];

          [v40 addObject:v31];
          __int16 v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];

          [v41 addObject:v19];
          int v32 = [v27 account];
          [v16 addObject:v32];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }
  else
  {
    __int16 v19 = 0;
  }

  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  BOOL v18 = v40;
  if (a3) {
    *a3 = v40;
  }
  id v6 = v35;
  id v10 = v34;
  uint64_t v20 = (void *)v39;
  if (a4) {
    *a4 = v41;
  }
  if (a5)
  {
    id v16 = v16;
    int v12 = 0;
    *a5 = v16;
  }
  else
  {
    int v12 = 0;
  }
LABEL_37:
  int v17 = v41;
LABEL_38:

  return v12;
}

- (BOOL)getAllAvailableControllerPublicKeys:(id *)a3 secretKeys:(id *)a4 userNames:(id *)a5 error:(id *)a6
{
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__5093;
  uint64_t v37 = __Block_byref_object_dispose__5094;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__5093;
  uint64_t v31 = __Block_byref_object_dispose__5094;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__5093;
  uint64_t v25 = __Block_byref_object_dispose__5094;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  BOOL v18 = __Block_byref_object_copy__5093;
  __int16 v19 = __Block_byref_object_dispose__5094;
  id v20 = 0;
  id v11 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__HAPSystemKeychainStore_getAllAvailableControllerPublicKeys_secretKeys_userNames_error___block_invoke;
  block[3] = &unk_1E69F0E10;
  void block[4] = self;
  void block[5] = &v33;
  block[6] = &v27;
  void block[7] = &v21;
  block[8] = &v15;
  void block[9] = &v39;
  dispatch_sync(v11, block);

  if (a3) {
    *a3 = (id) v34[5];
  }
  if (a4) {
    *a4 = (id) v28[5];
  }
  if (a5) {
    *a5 = (id) v22[5];
  }
  if (a6) {
    *a6 = (id) v16[5];
  }
  char v12 = *((unsigned char *)v40 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  return v12;
}

void __89__HAPSystemKeychainStore_getAllAvailableControllerPublicKeys_secretKeys_userNames_error___block_invoke(void *a1)
{
  char v3 = a1 + 4;
  uint64_t v2 = (void *)a1[4];
  uint64_t v4 = *(void *)(v3[1] + 8);
  id v5 = *(void **)(v4 + 40);
  uint64_t v6 = a1[7];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v14 = *(id *)(v7 + 40);
  id obj = v5;
  uint64_t v8 = *(void *)(v6 + 8);
  id v13 = *(id *)(v8 + 40);
  uint64_t v9 = [v2 _getAllAvailableControllerPublicKeys:&obj secretKeys:&v14 userNames:&v13];
  objc_storeStrong((id *)(v4 + 40), obj);
  objc_storeStrong((id *)(v7 + 40), v14);
  objc_storeStrong((id *)(v8 + 40), v13);
  uint64_t v10 = HMErrorFromOSStatus(v9);
  uint64_t v11 = *(void *)(a1[8] + 8);
  char v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (!v9) {
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
}

- (BOOL)deserializeKeyPair:(id)a3 publicKey:(id *)a4 secretKey:(id *)a5 error:(id *)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = _deserializeDataToKeyPair(a3, (uint64_t)v15, (uint64_t)__s);
  uint64_t v10 = v9;
  if (a4)
  {
    if (!v9)
    {
      id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:32];
      *a4 = v11;

      if (!a5) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    *a4 = 0;
  }
  if (!a5) {
    goto LABEL_9;
  }
  if (v9)
  {
    *a5 = 0;
    goto LABEL_9;
  }
LABEL_8:
  id v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];
  *a5 = v12;

LABEL_9:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  if (a6)
  {
    HMErrorFromOSStatus(v10);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10 == 0;
}

- (int)_saveKeyPair:(id)a3 username:(id)a4 syncable:(BOOL)a5 keyType:(id)a6
{
  BOOL v7 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc_init(HAPKeychainItem);
  [(HAPKeychainItem *)v13 setAccessGroup:@"com.apple.hap.pairing"];
  [(HAPKeychainItem *)v13 setType:v12];
  [(HAPKeychainItem *)v13 setLabel:@"HomeKit Pairing Identity"];
  [(HAPKeychainItem *)v13 setItemDescription:@"Identity used to pair with HomeKit accessories."];
  [(HAPKeychainItem *)v13 setSyncable:v7];
  [(HAPKeychainItem *)v13 setAccount:v11];
  [(HAPKeychainItem *)v13 setValueData:v10];
  id v14 = __viewHintForKeyType(v12);
  [(HAPKeychainItem *)v13 setViewHint:v14];

  uint64_t v15 = (void *)MEMORY[0x1D944E080]();
  uint64_t v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    BOOL v18 = HMFGetLogIdentifier();
    int v21 = 138543618;
    id v22 = v18;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Attempting to save controller key-pair for username %@", (uint8_t *)&v21, 0x16u);
  }
  int v19 = [(HAPSystemKeychainStore *)v16 _addKeychainItem:v13 logDuplicateItemError:1];

  return v19;
}

- (BOOL)saveKeyPair:(id)a3 username:(id)a4 syncable:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__5093;
  uint64_t v27 = __Block_byref_object_dispose__5094;
  id v28 = 0;
  id v12 = [(HAPSystemKeychainStore *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__HAPSystemKeychainStore_saveKeyPair_username_syncable_error___block_invoke;
  v17[3] = &unk_1E69F1D98;
  BOOL v22 = a5;
  void v17[4] = self;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  id v20 = &v23;
  int v21 = &v29;
  dispatch_sync(v12, v17);

  if (a6) {
    *a6 = (id) v24[5];
  }
  char v15 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

void __62__HAPSystemKeychainStore_saveKeyPair_username_syncable_error___block_invoke(uint64_t a1)
{
  if (!deviceSupportsKeychainSync())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    goto LABEL_7;
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (!*(unsigned char *)(a1 + 72))
  {
LABEL_7:
    BOOL v7 = &unk_1F2C80970;
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v5 = [v2 _saveKeyPair:v3 username:v4 syncable:1 keyType:&unk_1F2C80928];
  if (v5) {
    goto LABEL_9;
  }
  uint64_t v5 = [*(id *)(a1 + 32) _saveKeyPair:*(void *)(a1 + 40) username:*(void *)(a1 + 48) syncable:*(unsigned __int8 *)(a1 + 72) keyType:&unk_1F2C80940];
  if (v5) {
    goto LABEL_9;
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
  BOOL v7 = &unk_1F2C80958;
LABEL_8:
  uint64_t v5 = [v2 _saveKeyPair:v3 username:v4 syncable:v6 keyType:v7];
LABEL_9:
  uint64_t v8 = HMErrorFromOSStatus(v5);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (!v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

- (int)_createControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  cced25519_make_key_pair_compat();
  id v57 = 0;
  _serializeKeyPairToData((uint64_t)v65, (uint64_t)__s, &v57);
  id v11 = v57;
  id v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];

  id v14 = objc_alloc_init(HAPKeychainItem);
  [(HAPKeychainItem *)v14 setAccessGroup:@"com.apple.hap.pairing"];
  [(HAPKeychainItem *)v14 setLabel:@"HomeKit Pairing Identity"];
  [(HAPKeychainItem *)v14 setItemDescription:@"Identity used to pair with HomeKit accessories."];
  [(HAPKeychainItem *)v14 setAccount:v13];
  [(HAPKeychainItem *)v14 setValueData:v11];
  if (deviceSupportsKeychainSync())
  {
    [(HAPKeychainItem *)v14 setSyncable:1];
    [(HAPKeychainItem *)v14 setType:&unk_1F2C80928];
    char v15 = [(HAPKeychainItem *)v14 type];
    uint64_t v16 = __viewHintForKeyType(v15);
    [(HAPKeychainItem *)v14 setViewHint:v16];

    uint64_t v17 = [(HAPSystemKeychainStore *)self _addKeychainItem:v14 logDuplicateItemError:1];
    if (v17)
    {
      uint64_t v18 = v17;
      id v19 = (void *)MEMORY[0x1D944E080]();
      id v20 = self;
      int v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        BOOL v22 = HMFGetLogIdentifier();
        uint64_t v23 = HMErrorFromOSStatus(v18);
        *(_DWORD *)long long buf = 138543874;
        long long v59 = v22;
        __int16 v60 = 2112;
        long long v61 = v13;
        __int16 v62 = 2112;
        long long v63 = v23;
        id v24 = "%{public}@Failed to create v3 controller key for username %@ with error: %@";
LABEL_8:
        _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, v24, buf, 0x20u);

        goto LABEL_28;
      }
      goto LABEL_28;
    }
    [(HAPKeychainItem *)v14 setSyncable:1];
    [(HAPKeychainItem *)v14 setType:&unk_1F2C80940];
    uint64_t v29 = [(HAPKeychainItem *)v14 type];
    id v30 = __viewHintForKeyType(v29);
    [(HAPKeychainItem *)v14 setViewHint:v30];

    uint64_t v31 = [(HAPSystemKeychainStore *)self _addKeychainItem:v14 logDuplicateItemError:1];
    id v56 = a5;
    if (v31)
    {
      uint64_t v32 = v31;
      context = (void *)MEMORY[0x1D944E080]();
      uint64_t v33 = self;
      uint64_t v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = __int16 v53 = a6;
        uint64_t v36 = HMErrorFromOSStatus(v32);
        *(_DWORD *)long long buf = 138543874;
        long long v59 = v35;
        __int16 v60 = 2112;
        long long v61 = v13;
        __int16 v62 = 2112;
        long long v63 = v36;
        _os_log_impl(&dword_1D4758000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to create v2 controller key for username %@ with error: %@", buf, 0x20u);

        a6 = v53;
      }

      a5 = v56;
    }
    -[HAPKeychainItem setSyncable:](v14, "setSyncable:", 1, v53);
    [(HAPKeychainItem *)v14 setType:&unk_1F2C80958];
    uint64_t v37 = [(HAPKeychainItem *)v14 type];
    id v38 = __viewHintForKeyType(v37);
    [(HAPKeychainItem *)v14 setViewHint:v38];

    uint64_t v39 = [(HAPSystemKeychainStore *)self _addKeychainItem:v14 logDuplicateItemError:1];
    if (v39)
    {
      uint64_t v40 = v39;
      contexta = (void *)MEMORY[0x1D944E080]();
      uint64_t v41 = self;
      char v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        long long v43 = v53 = a4;
        long long v44 = HMErrorFromOSStatus(v40);
        *(_DWORD *)long long buf = 138543874;
        long long v59 = v43;
        __int16 v60 = 2112;
        long long v61 = v13;
        __int16 v62 = 2112;
        long long v63 = v44;
        _os_log_impl(&dword_1D4758000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to create v0 controller key for username %@ with error: %@", buf, 0x20u);

        a4 = v53;
      }

      a5 = v56;
    }
LABEL_17:
    if (a3)
    {
      id v45 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v65 length:32];
      *a3 = v45;
    }
    if (a4)
    {
      id v46 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];
      *a4 = v46;
    }
    if (a6) {
      *a6 = v13;
    }
    if (a5)
    {
      *a5 = [(HAPKeychainItem *)v14 valueData];
    }
    -[HAPSystemKeychainStore setActiveControllerIdentifier:](self, "setActiveControllerIdentifier:", v13, v53);
    int v47 = objc_opt_new();
    id v48 = (id)[v47 backupWithInfo:0];

    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    __int16 v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v49 postNotificationName:@"kControllerKeyPairGeneratedNotification" object:self];

    id v19 = (void *)MEMORY[0x1D944E080]();
    __int16 v50 = self;
    int v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v51 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      long long v59 = v51;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Posting controller key creation notification", buf, 0xCu);
    }
    LODWORD(v18) = 0;
    goto LABEL_28;
  }
  [(HAPKeychainItem *)v14 setSyncable:0];
  [(HAPKeychainItem *)v14 setType:&unk_1F2C80970];
  uint64_t v25 = [(HAPKeychainItem *)v14 type];
  id v26 = __viewHintForKeyType(v25);
  [(HAPKeychainItem *)v14 setViewHint:v26];

  uint64_t v27 = [(HAPSystemKeychainStore *)self _addKeychainItem:v14 logDuplicateItemError:1];
  if (!v27) {
    goto LABEL_17;
  }
  uint64_t v18 = v27;
  id v19 = (void *)MEMORY[0x1D944E080]();
  id v28 = self;
  int v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    BOOL v22 = HMFGetLogIdentifier();
    uint64_t v23 = HMErrorFromOSStatus(v18);
    *(_DWORD *)long long buf = 138543874;
    long long v59 = v22;
    __int16 v60 = 2112;
    long long v61 = v13;
    __int16 v62 = 2112;
    long long v63 = v23;
    id v24 = "%{public}@Failed to create syncable controller key for username %@ with error: %@";
    goto LABEL_8;
  }
LABEL_28:

  return v18;
}

- (BOOL)saveHH2PairingIdentity:(id)a3 syncable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  BOOL v7 = v6;
  uint64_t v8 = [v6 publicKey];
  uint64_t v9 = [v8 data];

  id v10 = [v7 privateKey];
  id v11 = [v10 data];

  id v12 = v9;
  uint64_t v13 = [v12 bytes];
  id v14 = v11;
  id v31 = 0;
  uint64_t v15 = _serializeKeyPairToData(v13, [v14 bytes], &v31);
  id v16 = v31;
  if (v15)
  {
    uint64_t v17 = (void *)MEMORY[0x1D944E080]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      int v21 = HMErrorFromOSStatus(v15);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v33 = v20;
      __int16 v34 = 2112;
      uint64_t v35 = v21;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize HH2 key pair to data: %@", buf, 0x16u);
LABEL_8:

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  BOOL v22 = [v7 identifier];
  uint64_t v23 = [(HAPSystemKeychainStore *)self _saveKeyPair:v16 username:v22 syncable:v4 keyType:&unk_1F2C80988];

  uint64_t v17 = (void *)MEMORY[0x1D944E080]();
  id v24 = self;
  uint64_t v25 = HMFGetOSLogHandle();
  id v19 = v25;
  if (v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      id v26 = [v7 identifier];
      int v21 = HMErrorFromOSStatus(v23);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v33 = v20;
      __int16 v34 = 2112;
      uint64_t v35 = v26;
      __int16 v36 = 2112;
      uint64_t v37 = v21;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to save HH2 pairing identity %@ : %@", buf, 0x20u);

      goto LABEL_8;
    }
LABEL_9:
    BOOL v27 = 0;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = HMFGetLogIdentifier();
    id v30 = [v7 identifier];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v33 = v29;
    __int16 v34 = 2112;
    uint64_t v35 = v30;
    _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully saved HH2 pairing identity %@ to keychain", buf, 0x16u);
  }
  BOOL v27 = 1;
LABEL_10:

  return v27;
}

- (BOOL)saveLocalPairingIdentity:(id)a3 syncable:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 publicKey];
  id v10 = [v9 data];

  id v11 = [v8 privateKey];
  id v12 = [v11 data];

  id v13 = v10;
  uint64_t v14 = [v13 bytes];
  id v15 = v12;
  id v21 = 0;
  uint64_t v16 = _serializeKeyPairToData(v14, [v15 bytes], &v21);
  id v17 = v21;
  if (v16)
  {
    if (a5)
    {
      HMErrorFromOSStatus(v16);
      BOOL v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    id v19 = [v8 identifier];
    BOOL v18 = [(HAPSystemKeychainStore *)self saveKeyPair:v17 username:v19 syncable:v6 error:a5];
  }
  return v18;
}

- (id)_getControllerKeychainItemForKeyType:(id)a3 error:(int *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v26 = 0;
  BOOL v6 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:a3 account:0 shouldReturnData:1 error:&v26];
  BOOL v7 = v6;
  if (v26)
  {
    id v18 = 0;
    if (!a4) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if ((unint64_t)[v6 count] < 2
    || ([(HAPSystemKeychainStore *)self activeControllerIdentifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    if ([v7 count] != 1)
    {
      id v18 = 0;
      int v19 = -6764;
      goto LABEL_14;
    }
    id v18 = [v7 objectAtIndexedSubscript:0];
    if (!a4) {
      goto LABEL_22;
    }
LABEL_21:
    *a4 = v26;
    goto LABEL_22;
  }
  id v21 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (!v10)
  {
LABEL_12:

    a4 = v21;
LABEL_13:
    id v18 = 0;
    int v19 = -6727;
LABEL_14:
    int v26 = v19;
    if (!a4) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v23;
LABEL_6:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v23 != v12) {
      objc_enumerationMutation(v9);
    }
    uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
    id v15 = [v14 account];
    uint64_t v16 = [(HAPSystemKeychainStore *)self activeControllerIdentifier];
    char v17 = [v15 isEqualToString:v16];

    if (v17) {
      break;
    }
    if (v11 == ++v13)
    {
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v11) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  id v18 = v14;

  a4 = v21;
  if (!v18) {
    goto LABEL_13;
  }
  if (v21) {
    goto LABEL_21;
  }
LABEL_22:

  return v18;
}

- (id)_getControllerKeychainItemError:(int *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v18 = 0;
  int v5 = deviceSupportsKeychainSync();
  if (v5) {
    BOOL v6 = &unk_1F2C80928;
  }
  else {
    BOOL v6 = &unk_1F2C80970;
  }
  BOOL v7 = [(HAPSystemKeychainStore *)self _getControllerKeychainItemForKeyType:v6 error:&v18];
  if (v18 != -25293 && v18 != 0)
  {
    id v9 = [(HAPSystemKeychainStore *)self _getControllerKeychainItemForKeyType:&unk_1F2C80940 error:&v18];

    if (v18 == -25293 || !v18)
    {
      BOOL v7 = v9;
      goto LABEL_11;
    }
    BOOL v7 = [(HAPSystemKeychainStore *)self _getControllerKeychainItemForKeyType:&unk_1F2C80958 error:&v18];

    if (v18 != -25293)
    {
      if (v18)
      {
        if (v5)
        {
          uint64_t v11 = [(HAPSystemKeychainStore *)self _getControllerKeychainItemForKeyType:&unk_1F2C80970 error:&v18];

          if (v18 == -25293 || !v18) {
            goto LABEL_27;
          }
          uint64_t v12 = (void *)MEMORY[0x1D944E080]();
          uint64_t v13 = self;
          uint64_t v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            id v15 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            id v20 = v15;
            _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No controller key", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v12 = (void *)MEMORY[0x1D944E080]();
          uint64_t v16 = self;
          uint64_t v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            char v17 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            id v20 = v17;
            _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No controller key", buf, 0xCu);
          }
          uint64_t v11 = (uint64_t)v7;
        }

LABEL_27:
        BOOL v7 = (void *)v11;
      }
    }
  }
LABEL_11:
  if (a3) {
    *a3 = v18;
  }

  return v7;
}

- (int)_getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v18 = 0;
  uint64_t v10 = [(HAPSystemKeychainStore *)self _getControllerKeychainItemError:&v18];
  uint64_t v11 = v10;
  if (!v18)
  {
    uint64_t v12 = [v10 valueData];
    int v18 = _deserializeDataToKeyPair(v12, (uint64_t)v20, (uint64_t)__s);
  }
  if (a3)
  {
    if (!v18)
    {
      id v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v20 length:32];
      *a3 = v13;

      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_7;
    }
    *a3 = 0;
  }
  if (!a4) {
    goto LABEL_12;
  }
LABEL_7:
  if (v18)
  {
    *a4 = 0;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];
    *a4 = v14;
  }
LABEL_12:
  if (a5)
  {
    *a5 = [v11 valueData];
  }
  if (a6)
  {
    if (v18)
    {
      *a6 = 0;
    }
    else
    {
      id v15 = [v11 account];
      *a6 = v15;
    }
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  int v16 = v18;

  return v16;
}

- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6 allowCreation:(BOOL)a7 error:(id *)a8
{
  uint64_t v50 = 0;
  __int16 v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  int v47 = __Block_byref_object_copy__5093;
  id v48 = __Block_byref_object_dispose__5094;
  id v49 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__5093;
  char v42 = __Block_byref_object_dispose__5094;
  id v43 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__5093;
  __int16 v36 = __Block_byref_object_dispose__5094;
  id v37 = 0;
  uint64_t v26 = 0;
  BOOL v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__5093;
  id v30 = __Block_byref_object_dispose__5094;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__5093;
  long long v24 = __Block_byref_object_dispose__5094;
  id v25 = 0;
  uint64_t v12 = [(HAPSystemKeychainStore *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__HAPSystemKeychainStore_getControllerPublicKey_secretKey_keyPair_username_allowCreation_error___block_invoke;
  block[3] = &unk_1E69F0DE8;
  void block[4] = self;
  void block[5] = &v44;
  block[6] = &v38;
  void block[7] = &v32;
  BOOL v19 = a7;
  block[8] = &v26;
  void block[9] = &v20;
  void block[10] = &v50;
  dispatch_sync(v12, block);

  if (a3) {
    *a3 = (id) v45[5];
  }
  if (a4) {
    *a4 = (id) v39[5];
  }
  if (a5) {
    *a5 = (id) v33[5];
  }
  if (a6) {
    *a6 = (id) v27[5];
  }
  if (a8) {
    *a8 = (id) v21[5];
  }
  char v13 = *((unsigned char *)v51 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v13;
}

void __96__HAPSystemKeychainStore_getControllerPublicKey_secretKey_keyPair_username_allowCreation_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v28 = *(id *)(v6 + 40);
  id obj = v4;
  uint64_t v7 = *(void *)(v5 + 8);
  id v8 = *(void **)(v7 + 40);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v26 = *(id *)(v9 + 40);
  id v27 = v8;
  uint64_t v10 = [v2 _getControllerPublicKey:&obj secretKey:&v28 keyPair:&v27 username:&v26];
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v28);
  objc_storeStrong((id *)(v7 + 40), v27);
  objc_storeStrong((id *)(v9 + 40), v26);
  if (v10 != -25293 && v10 && *(unsigned char *)(a1 + 88))
  {
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    char v13 = *(void **)(v12 + 40);
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    id v24 = *(id *)(v15 + 40);
    id v25 = v13;
    uint64_t v16 = *(void *)(v14 + 8);
    char v17 = *(void **)(v16 + 40);
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id v22 = *(id *)(v18 + 40);
    id v23 = v17;
    uint64_t v10 = [v11 _createControllerPublicKey:&v25 secretKey:&v24 keyPair:&v23 username:&v22];
    objc_storeStrong((id *)(v12 + 40), v25);
    objc_storeStrong((id *)(v15 + 40), v24);
    objc_storeStrong((id *)(v16 + 40), v23);
    objc_storeStrong((id *)(v18 + 40), v22);
  }
  uint64_t v19 = HMErrorFromOSStatus(v10);
  uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  if (!v10) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
}

- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 username:(id *)a5 allowCreation:(BOOL)a6 error:(id *)a7
{
  return [(HAPSystemKeychainStore *)self getControllerPublicKey:a3 secretKey:a4 keyPair:0 username:a5 allowCreation:a6 error:a7];
}

- (id)_getLocalPairingIdentityAllowingCreation:(BOOL)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v26 = 0;
  id v27 = 0;
  id v24 = 0;
  id v25 = 0;
  BOOL v6 = [(HAPSystemKeychainStore *)self getControllerPublicKey:&v27 secretKey:&v26 username:&v25 allowCreation:a3 error:&v24];
  id v7 = v27;
  id v8 = v26;
  id v9 = v25;
  id v10 = v24;
  if (v6)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v7];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v8];
    char v13 = [[HAPPairingIdentity alloc] initWithIdentifier:v9 publicKey:v11 privateKey:v12 permissions:0];
    if (!v13)
    {
      context = (void *)MEMORY[0x1D944E080]();
      uint64_t v14 = self;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"< Redacted with length %tu >", objc_msgSend(v8, "length"));
        *(_DWORD *)long long buf = 138544130;
        uint64_t v29 = v22;
        __int16 v30 = 2112;
        id v31 = v9;
        __int16 v32 = 2112;
        id v33 = v7;
        __int16 v34 = 2112;
        uint64_t v35 = v21;
        _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create pairing identity with identifier, %@, public key, %@, private key, %@", buf, 0x2Au);
      }
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Failed to retrieve local pairing identity." reason:@"Failed to create pairing identity" suggestion:0 underlyingError:0];
      }
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1D944E080]();
    char v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v29 = v19;
      __int16 v30 = 2114;
      id v31 = v10;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the local pairing identity with error: %{public}@", buf, 0x16u);
    }
    char v13 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v13;
}

- (id)getOrCreateLocalPairingIdentity:(id *)a3
{
  return [(HAPSystemKeychainStore *)self _getLocalPairingIdentityAllowingCreation:1 error:a3];
}

- (id)getLocalPairingIdentity:(id *)a3
{
  return [(HAPSystemKeychainStore *)self _getLocalPairingIdentityAllowingCreation:0 error:a3];
}

- (void)ensureControllerKeyExistsForAllViews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(HAPSystemKeychainStore *)self isHH2Enabled])
  {
    BOOL v4 = (void *)MEMORY[0x1D944E080]();
    uint64_t v5 = self;
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@-[%@ %@] no-op in ROAR", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v11 = [(HAPSystemKeychainStore *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__HAPSystemKeychainStore_ensureControllerKeyExistsForAllViews__block_invoke;
    block[3] = &unk_1E69F4330;
    void block[4] = self;
    dispatch_async(v11, block);
  }
}

void __62__HAPSystemKeychainStore_ensureControllerKeyExistsForAllViews__block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  int v46 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) _getControllerKeychainItemError:&v46];
  uint64_t v3 = (void *)v2;
  if (v46) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0;
  }
  if (!v4)
  {
    int v5 = deviceSupportsKeychainSync();
    BOOL v6 = [v3 type];
    uint64_t v7 = [v6 unsignedIntegerValue];

    if (!v5)
    {
      if (v7 != 1752001641)
      {
        id v23 = [v3 valueData];
        id v24 = [v3 account];
        [*(id *)(a1 + 32) _removeControllerKeyPairForKeyType:&unk_1F2C80940 identifier:v24 leaveTombstone:1];
        id v25 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 32) _removeControllerKeyPairForKeyType:&unk_1F2C80958 identifier:v24 leaveTombstone:1]);
        id v26 = *(id *)(a1 + 32);
        id v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          id v28 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          id v48 = v28;
          _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_INFO, "%{public}@No unsyncable controller key, copying current controller key to unsyncable controller key", buf, 0xCu);
        }
        int v46 = [*(id *)(a1 + 32) _saveKeyPair:v23 username:v24 syncable:0 keyType:&unk_1F2C80970];
        if (v46)
        {
          uint64_t v29 = (void *)MEMORY[0x1D944E080]();
          id v30 = *(id *)(a1 + 32);
          id v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            __int16 v32 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            id v48 = v32;
            _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create unsyncable controller key", buf, 0xCu);
          }
          goto LABEL_40;
        }
        id v10 = 0;
        id v8 = 0;
        goto LABEL_38;
      }
      id v9 = 0;
      id v10 = 0;
      id v8 = 0;
      goto LABEL_39;
    }
    if (v7 == 1751999337)
    {
      id v8 = v3;
      id v9 = 0;
    }
    else
    {
      uint64_t v11 = [v3 type];
      uint64_t v12 = [v11 unsignedIntegerValue];

      id v13 = v3;
      uint64_t v14 = v13;
      if (v12 == 1751216227) {
        id v9 = 0;
      }
      else {
        id v9 = v13;
      }
      if (v12 == 1751216227) {
        id v10 = v13;
      }
      else {
        id v10 = 0;
      }
      __int16 v15 = (void *)MEMORY[0x1D944E080]();
      id v16 = *(id *)(a1 + 32);
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        id v48 = v18;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@No v3 controller key, copying current controller key to v3 controller key", buf, 0xCu);
      }
      uint64_t v19 = *(void **)(a1 + 32);
      uint64_t v20 = [v14 valueData];
      uint64_t v21 = [v14 account];
      [v19 _saveKeyPair:v20 username:v21 syncable:1 keyType:&unk_1F2C80928];

      id v8 = 0;
      if (v10)
      {
LABEL_21:
        if (!v9)
        {
LABEL_32:
          uint64_t v40 = [*(id *)(a1 + 32) _getControllerKeychainItemForKeyType:&unk_1F2C80958 error:&v46];
          if (v40)
          {
            id v9 = (void *)v40;
            goto LABEL_39;
          }
          uint64_t v41 = (void *)MEMORY[0x1D944E080]();
          id v42 = *(id *)(a1 + 32);
          id v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            uint64_t v44 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            id v48 = v44;
            _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_INFO, "%{public}@No v0 controller key, copying current controller key to v0 controller key", buf, 0xCu);
          }
          id v45 = *(void **)(a1 + 32);
          id v23 = [v3 valueData];
          id v24 = [v3 account];
          [v45 _saveKeyPair:v23 username:v24 syncable:1 keyType:&unk_1F2C80958];
LABEL_38:

          id v9 = 0;
        }
LABEL_39:

        id v24 = v10;
        id v23 = v8;
LABEL_40:

        goto LABEL_41;
      }
    }
    uint64_t v22 = [*(id *)(a1 + 32) _getControllerKeychainItemForKeyType:&unk_1F2C80940 error:&v46];
    if (!v22)
    {
      id v33 = (void *)MEMORY[0x1D944E080]();
      id v34 = *(id *)(a1 + 32);
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        id v48 = v36;
        _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_INFO, "%{public}@No v2 controller key, copying current controller key to v2 controller key", buf, 0xCu);
      }
      id v37 = *(void **)(a1 + 32);
      uint64_t v38 = [v3 valueData];
      uint64_t v39 = [v3 account];
      [v37 _saveKeyPair:v38 username:v39 syncable:1 keyType:&unk_1F2C80940];

      id v10 = 0;
      if (v9) {
        goto LABEL_39;
      }
      goto LABEL_32;
    }
    id v10 = (id)v22;
    goto LABEL_21;
  }
LABEL_41:
}

- (BOOL)isHH2Enabled
{
  if ([(HAPSystemKeychainStore *)self unitTest_enable_hh2]) {
    return 1;
  }
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  return HAPIsHH2Enabled_hh2Enabled;
}

- (id)dumpState
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v20 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 60; i += 4)
  {
    int v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&dumpState_keyTypes[i]];
    BOOL v6 = [(HAPSystemKeychainStore *)self _getKeychainItemsForAccessGroup:@"com.apple.hap.pairing" type:v5 account:0 shouldReturnData:1 error:&v20];

    if ([v6 count]) {
      [v3 addObjectsFromArray:v6];
    }
  }
  if ([v3 count])
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "description", (void)v16);
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:*MEMORY[0x1E4F64E18]];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v14;
}

- (void)dealloc
{
  int keychainStoreUpdatedNotificationToken = self->_keychainStoreUpdatedNotificationToken;
  if (keychainStoreUpdatedNotificationToken != -1) {
    notify_cancel(keychainStoreUpdatedNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)HAPSystemKeychainStore;
  [(HAPSystemKeychainStore *)&v4 dealloc];
}

- (void)configure
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int out_token = -1;
  objc_initWeak(&location, self);
  uint64_t v3 = [(HAPSystemKeychainStore *)self queue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __35__HAPSystemKeychainStore_configure__block_invoke;
  handler[3] = &unk_1E69F0DC0;
  objc_copyWeak(&v10, &location);
  uint32_t v4 = notify_register_dispatch("com.apple.security.view-change.Home", &out_token, v3, handler);

  if (v4)
  {
    int v5 = (void *)MEMORY[0x1D944E080]();
    BOOL v6 = self;
    HMFGetOSLogHandle();
    uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 1024;
      uint32_t v16 = v4;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for keychain update notification: %u", buf, 0x12u);
    }
  }
  else
  {
    [(HAPSystemKeychainStore *)self setKeychainStoreUpdatedNotificationToken:out_token];
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __35__HAPSystemKeychainStore_configure__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    BOOL v4 = [WeakRetained keychainStoreUpdatedNotificationToken] == a2;
    id WeakRetained = v6;
    if (v4)
    {
      int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"HAPSystemKeychainStoreUpdatedNotification" object:v6];

      id WeakRetained = v6;
    }
  }
}

- (HAPSystemKeychainStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)HAPSystemKeychainStore;
  uint64_t v2 = [(HAPSystemKeychainStore *)&v8 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_int keychainStoreUpdatedNotificationToken = -1;
    BOOL v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.HAPSystemKeychainStore", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

+ (id)viewHintForType:(id)a3
{
  return __viewHintForKeyType(a3);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t93 != -1) {
    dispatch_once(&logCategory__hmf_once_t93, &__block_literal_global_302);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v94;

  return v2;
}

uint64_t __37__HAPSystemKeychainStore_logCategory__block_invoke()
{
  logCategory__hmf_once___int16 v94 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

+ (id)serializeDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v14 = 0;
    dispatch_queue_t v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v14];
    id v6 = v14;
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v5 == 0;
    }
    if (v7)
    {
      objc_super v8 = (void *)MEMORY[0x1D944E080]();
      id v9 = a1;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        uint32_t v16 = v11;
        __int16 v17 = 2112;
        id v18 = v6;
        _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while serializing generic dictionary : %@", buf, 0x16u);
      }
      id v12 = 0;
    }
    else
    {
      id v12 = v5;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)updateAccessoryPairingGenericData:(id)a3 updatedControllerKeyIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [(id)objc_opt_class() getDictionaryFromGenericData:v6];

  if (v7) {
    objc_super v8 = v7;
  }
  else {
    objc_super v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
  [v9 setObject:v5 forKeyedSubscript:@"ctrlKeyId"];

  if (!v7) {
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"homeKitRegistered"];
  }
  id v10 = [(id)objc_opt_class() serializeDictionary:v9];

  return v10;
}

+ (id)getDictionaryFromGenericData:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)systemStore
{
  if (systemStore_systemStoreAllocated != -1) {
    dispatch_once(&systemStore_systemStoreAllocated, &__block_literal_global_233);
  }
  uint64_t v2 = (void *)systemStore_systemStore;

  return v2;
}

uint64_t __37__HAPSystemKeychainStore_systemStore__block_invoke()
{
  v0 = objc_alloc_init(HAPSystemKeychainStore);
  v1 = (void *)systemStore_systemStore;
  systemStore_systemStore = (uint64_t)v0;

  uint64_t v2 = (void *)systemStore_systemStore;

  return [v2 configure];
}

@end