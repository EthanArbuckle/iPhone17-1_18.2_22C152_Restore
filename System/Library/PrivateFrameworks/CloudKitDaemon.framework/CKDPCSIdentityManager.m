@interface CKDPCSIdentityManager
+ (BOOL)_rollTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 oldIdentityID:(id *)a5 newIdentityID:(id *)a6 withError:(id *)a7;
+ (BOOL)_rollTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5;
+ (BOOL)_setIdentitySet:(_PCSIdentitySetData *)a3 forServiceName:(id)a4 backingMockAccount:(id)a5 withError:(id *)a6;
+ (BOOL)credentialsAreValidForAccount:(id)a3;
+ (_PCSIdentitySetData)_copyStingrayIdentitiesForOptions:(id)a3 withError:(id *)a4;
+ (_PCSIdentitySetData)_copyStingrayIdentitiesForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5;
+ (_PCSIdentitySetData)_createIdentitySetForService:(id)a3 dsid:(id)a4 error:(id *)a5;
+ (_PCSIdentitySetData)_getTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5;
+ (_PCSIdentitySetData)_getTestAccountIdentitySetForService:(id)a3 forBackingMockAccount:(id)a4 shouldFaultInIdentities:(BOOL)a5 withError:(id *)a6;
+ (_PCSIdentitySetData)_getTestAccountIdentitySetForService:(id)a3 forBackingMockAccount:(id)a4 withError:(id *)a5;
+ (_PCSIdentitySetData)copyTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5;
+ (_PCSIdentitySetData)copyTestAccountIdentitySetForService:(id)a3 forBackingMockAccount:(id)a4 withError:(id *)a5;
+ (_PCSIdentitySetData)createFullKeychainIdentitySetForAccount:(id)a3 serviceName:(id)a4 error:(id *)a5;
+ (id)_copyPCSIdentitiesForBackingMockAccount:(id)a3 withError:(id *)a4;
+ (id)_generatePCSIdentityOptionsForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5;
+ (id)overrideKeys;
+ (id)sharedFakeIdentitySetsByServiceByUsername;
+ (id)sharedMockIdentitySetsByServiceByIdentifier;
+ (void)clearSharedMockIdentitySetsCache;
- (BOOL)_checkAndClearPCSTestOverrideForKey:(id)a3;
- (BOOL)_hasCurrentKeyForService:(id)a3 inIdentitySet:(_PCSIdentitySetData *)a4 withError:(id *)a5;
- (BOOL)currentServiceIsManatee;
- (BOOL)forceEnableReadOnlyManatee;
- (BOOL)forceSecurityErrorOnIdentityValidation;
- (BOOL)identitySet:(_PCSIdentitySetData *)a3 containsPublicKey:(id)a4 error:(id *)a5;
- (BOOL)isManateeAvailableWithError:(id *)a3;
- (BOOL)liverpoolServiceOwnsPublicID:(id)a3;
- (BOOL)refetchPCSIdentitySet;
- (BOOL)serviceIsManatee:(id)a3;
- (BOOL)serviceIsManateeForUnitTests;
- (CKDAccount)account;
- (CKDLogicalDeviceContext)deviceContext;
- (CKDPCSIdentityManager)initWithAccount:(id)a3 deviceContext:(id)a4 serviceName:(id)a5 forceEnableReadOnlyManatee:(BOOL)a6 clientSDKVersion:(unsigned int)a7;
- (NSMutableDictionary)PCSIdentityWrappersByServiceName;
- (NSString)cachedAccountDSID;
- (NSString)serviceName;
- (_PCSIdentityData)createCombinedIdentityWithOutOfNetworkPrivateKey:(id)a3 publicSharingIdentity:(id)a4;
- (_PCSIdentityData)createRandomSharingIdentityWithError:(id *)a3;
- (_PCSIdentityData)createSharingIdentityFromData:(id)a3 error:(id *)a4;
- (_PCSIdentityData)debugIdentity;
- (_PCSIdentityData)debugSharingIdentity;
- (_PCSIdentitySetData)_copyIdentityForService:(id)a3 useCache:(BOOL)a4 validateCurrentKey:(BOOL)a5 error:(id *)a6;
- (_PCSIdentitySetData)copyIdentitySetWithType:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5;
- (_PCSIdentitySetData)copyTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5;
- (_PCSIdentitySetData)createFullKeychainIdentitySetWithError:(id *)a3;
- (_PCSIdentitySetData)createTemporaryCloudKitFeaturesSigningIdentitySetForServiceName:(id)a3 withError:(id *)a4;
- (_PCSPublicIdentityData)copyDiversifiedIdentityForService:(unint64_t)a3 userIDEntropy:(id)a4 withError:(id *)a5;
- (_PCSPublicIdentityData)createPublicSharingIdentityFromPublicKey:(id)a3 error:(id *)a4;
- (id)PCSServiceStringFromCKServiceType:(unint64_t)a3;
- (id)_cacheIdentitySet:(_PCSIdentitySetData *)a3 forService:(id)a4;
- (id)_copyPublicKeyDataForAllIdentitiesInSet:(_PCSIdentitySetData *)a3 withService:(unint64_t)a4;
- (id)_copyPublicKeyDataForIdentitySet:(_PCSIdentitySetData *)a3 withService:(unint64_t)a4 withError:(id *)a5;
- (id)copyAllPublicKeysForService:(unint64_t)a3 withError:(id *)a4;
- (id)copyDiversifiedPublicKeyForService:(unint64_t)a3 userIDEntropy:(id)a4 withError:(id *)a5;
- (id)copyPublicKeyForService:(unint64_t)a3 withError:(id *)a4;
- (id)dataFromSharingIdentity:(_PCSIdentityData *)a3 error:(id *)a4;
- (unsigned)clientSDKVersion;
- (void)clearOverrides;
- (void)dealloc;
- (void)identitiesChanged;
- (void)setAccount:(id)a3;
- (void)setCachedAccountDSID:(id)a3;
- (void)setClientSDKVersion:(unsigned int)a3;
- (void)setDebugIdentity:(_PCSIdentityData *)a3;
- (void)setForceSecurityErrorOnIdentityValidation:(BOOL)a3;
- (void)setOverride:(id)a3 value:(id)a4;
- (void)setPCSIdentityWrappersByServiceName:(id)a3;
- (void)setPCSServiceNameOverwrite:(id)a3;
- (void)setRefetchPCSIdentitySet:(BOOL)a3;
- (void)setServiceIsManateeForUnitTests:(BOOL)a3;
- (void)updateAccount:(id)a3;
@end

@implementation CKDPCSIdentityManager

- (id)PCSServiceStringFromCKServiceType:(unint64_t)a3
{
  v4 = @"com.apple.reminders";
  switch(a3)
  {
    case 0uLL:
      objc_msgSend_serviceName(self, a2, a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      v5 = (id *)MEMORY[0x1E4F93F78];
      goto LABEL_6;
    case 2uLL:
      v5 = (id *)MEMORY[0x1E4F93FF0];
      goto LABEL_6;
    case 3uLL:
      v5 = (id *)MEMORY[0x1E4F93FC0];
LABEL_6:
      v4 = (__CFString *)*v5;
      break;
    case 5uLL:
      v4 = @"com.apple.CloudKitFeatures";
      break;
    case 6uLL:
      v4 = @"com.apple.CloudKitFeaturesStingray";
      break;
    default:
      break;
  }
  return v4;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (CKDPCSIdentityManager)initWithAccount:(id)a3 deviceContext:(id)a4 serviceName:(id)a5 forceEnableReadOnlyManatee:(BOOL)a6 clientSDKVersion:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CKDPCSIdentityManager;
  v16 = [(CKDPCSIdentityManager *)&v25 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_account, a3);
    objc_storeStrong((id *)&v17->_deviceContext, a4);
    objc_storeStrong((id *)&v17->_serviceName, a5);
    v17->_forceEnableReadOnlyManatee = a6;
    uint64_t v20 = objc_msgSend_dsid(v13, v18, v19);
    cachedAccountDSID = v17->_cachedAccountDSID;
    v17->_cachedAccountDSID = (NSString *)v20;

    v17->_clientSDKVersion = a7;
    uint64_t v22 = objc_opt_new();
    PCSIdentityWrappersByServiceName = v17->_PCSIdentityWrappersByServiceName;
    v17->_PCSIdentityWrappersByServiceName = (NSMutableDictionary *)v22;
  }
  return v17;
}

- (void)setPCSServiceNameOverwrite:(id)a3
{
}

- (void)dealloc
{
  debugIdentity = self->_debugIdentity;
  if (debugIdentity)
  {
    CFRelease(debugIdentity);
    self->_debugIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDPCSIdentityManager;
  [(CKDPCSIdentityManager *)&v4 dealloc];
}

- (void)updateAccount:(id)a3
{
  id v23 = a3;
  v6 = objc_msgSend_accountID(v23, v4, v5);
  v9 = objc_msgSend_account(self, v7, v8);
  v12 = objc_msgSend_accountID(v9, v10, v11);
  char isEqualToString = objc_msgSend_isEqualToString_(v6, v13, (uint64_t)v12);

  id v15 = self;
  objc_sync_enter(v15);
  objc_msgSend_setAccount_(v15, v16, (uint64_t)v23);
  if ((isEqualToString & 1) == 0)
  {
    objc_msgSend_identitiesChanged(v15, v17, v18);
    v21 = objc_msgSend_dsid(v23, v19, v20);
    objc_msgSend_setCachedAccountDSID_(v15, v22, (uint64_t)v21);
  }
  objc_sync_exit(v15);
}

- (void)identitiesChanged
{
  id v4 = (id)objc_opt_new();
  objc_msgSend_setPCSIdentityWrappersByServiceName_(self, v3, (uint64_t)v4);
}

- (id)_cacheIdentitySet:(_PCSIdentitySetData *)a3 forService:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = [CKDPCSIdentityWrapper alloc];
    a3 = (_PCSIdentitySetData *)objc_msgSend_initWithIdentitySet_withPrimaryServiceName_(v7, v8, (uint64_t)a3, v6);
    v9 = self;
    objc_sync_enter(v9);
    v12 = objc_msgSend_PCSIdentityWrappersByServiceName(v9, v10, v11);
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)a3, v6);

    objc_sync_exit(v9);
  }

  return a3;
}

- (_PCSIdentitySetData)_copyIdentityForService:(id)a3 useCache:(BOOL)a4 validateCurrentKey:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (__CFString *)a3;
  if (!v11)
  {
    v162 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v162, v163, (uint64_t)a2, self, @"CKDPCSIdentityManager.m", 155, @"No serviceName provided to _copyIdentityForService");
  }
  v12 = self;
  objc_sync_enter(v12);
  id v15 = objc_msgSend_account(v12, v13, v14);
  uint64_t v18 = objc_msgSend_dsid(v15, v16, v17);
  uint64_t v21 = objc_msgSend_length(v18, v19, v20);

  if (v21)
  {
    if (objc_msgSend_serviceIsManatee_(v12, v22, (uint64_t)v11)) {
      char v25 = objc_msgSend_forceEnableReadOnlyManatee(v12, v23, v24) ^ 1;
    }
    else {
      char v25 = 0;
    }
    v29 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v23, v24);
    if (objc_msgSend_fakeManateeOverride(v29, v30, v31))
    {
      v34 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v32, v33);
      char v37 = objc_msgSend_fakeWalrusOverride(v34, v35, v36);
    }
    else
    {
      char v37 = 0;
    }

    if (v25)
    {
      uint64_t v40 = 5006;
    }
    else
    {
      v41 = objc_msgSend_deviceContext(v12, v38, v39);
      v44 = objc_msgSend_accountDataSecurityObserver(v41, v42, v43);
      v47 = objc_msgSend_account(v12, v45, v46);
      int v49 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v44, v48, (uint64_t)v47, 1);

      if (!v49)
      {
        v58 = 0;
        goto LABEL_41;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v52 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v171 = v11;
        __int16 v172 = 2112;
        v173 = @"YES";
        _os_log_debug_impl(&dword_1C4CFF000, v52, OS_LOG_TYPE_DEBUG, "Walrus enabled for service %{public}@: %@", buf, 0x16u);
      }
      objc_msgSend_clientSDKVersion(v12, v53, v54);
      if (CKLinkCheck32f5805a68adfc1b65f94a0de69aa32177c7cd24()) {
        uint64_t v40 = 5014;
      }
      else {
        uint64_t v40 = 2012;
      }
    }
    if (objc_msgSend_accountType(v15, v38, v39) != 2
      || (*MEMORY[0x1E4F1A4E0] ? (char v56 = 1) : (char v56 = v37), (v56 & 1) != 0))
    {
      id v169 = 0;
      char isManateeAvailableWithError = objc_msgSend_isManateeAvailableWithError_(v12, v55, (uint64_t)&v169);
      v58 = (__CFString *)v169;
      if ((isManateeAvailableWithError & 1) == 0)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v59 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          v171 = v11;
          __int16 v172 = 2112;
          v173 = v58;
          _os_log_debug_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_DEBUG, "Can't copy identity set for service %{public}@. Manatee not available for current account due to %@.", buf, 0x16u);
        }
        v62 = objc_msgSend_domain(v58, v60, v61);
        if (objc_msgSend_isEqualToString_(v62, v63, *MEMORY[0x1E4F5B2D0]))
        {
          BOOL v66 = objc_msgSend_code(v58, v64, v65) == -5311;

          if (v66)
          {
            if (a6)
            {
              objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v67, *MEMORY[0x1E4F19DD8], 1013, v58, @"CoreCDP failed to check manatee availability");
              id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:
              int v80 = 0;
              v81 = 0;
              goto LABEL_60;
            }
LABEL_75:
            int v80 = 0;
LABEL_90:
            v81 = 0;
            goto LABEL_91;
          }
        }
        else
        {
        }
        if (a6)
        {
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v67, *MEMORY[0x1E4F19DD8], v40, v58, @"Manatee is not available for the current account");
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_59;
        }
        goto LABEL_75;
      }
LABEL_41:
      v68 = (unsigned char *)MEMORY[0x1E4F1A4E0];
      if (*MEMORY[0x1E4F1A4E0])
      {
        char v69 = objc_msgSend_refetchPCSIdentitySet(v12, v50, v51);
        if (!v7) {
          goto LABEL_49;
        }
      }
      else
      {
        char v69 = 0;
        if (!v7) {
          goto LABEL_49;
        }
      }
      v70 = objc_msgSend_PCSIdentityWrappersByServiceName(v12, v50, v51);
      v72 = objc_msgSend_objectForKeyedSubscript_(v70, v71, (uint64_t)v11);
      if (v72) {
        char v73 = v69;
      }
      else {
        char v73 = 1;
      }

      if ((v73 & 1) == 0)
      {
        v91 = objc_msgSend_cachedAccountDSID(v12, v50, v51);
        v94 = objc_msgSend_dsid(v15, v92, v93);
        char isEqualToString = objc_msgSend_isEqualToString_(v91, v95, (uint64_t)v94);

        if (isEqualToString)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v99 = (id)*MEMORY[0x1E4F1A528];
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v153 = objc_msgSend_accountType(v15, v100, v101);
            CKStringForAccountType(v153);
            v154 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            v157 = objc_msgSend_dsid(v15, v155, v156);
            *(_DWORD *)buf = 138543874;
            v171 = v11;
            __int16 v172 = 2112;
            v173 = v154;
            __int16 v174 = 2112;
            v175 = v157;
            _os_log_debug_impl(&dword_1C4CFF000, v99, OS_LOG_TYPE_DEBUG, "Returning cached identity for service %{public}@ and %@ account %@", buf, 0x20u);
          }
          v104 = objc_msgSend_PCSIdentityWrappersByServiceName(v12, v102, v103);
          v81 = objc_msgSend_objectForKeyedSubscript_(v104, v105, (uint64_t)v11);
        }
        else
        {
          if (*v68)
          {
            v164 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v97, v98);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v164, v165, (uint64_t)a2, v12, @"CKDPCSIdentityManager.m", 225, @"Identity cache missed an invalidation, dsid of backing account has changed");

            __break(1u);
            return result;
          }
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v106 = (id)*MEMORY[0x1E4F1A528];
          if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend_dsid(v15, v107, v108);
            v158 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_cachedAccountDSID(v12, v159, v160);
            v161 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v171 = v158;
            __int16 v172 = 2112;
            v173 = v161;
            _os_log_fault_impl(&dword_1C4CFF000, v106, OS_LOG_TYPE_FAULT, "Current dsid: %@. Cached identities dsid: %@. The dsid has changed underneath us and we didn't clear our identity cache. Clearing cache and failing identity request", buf, 0x16u);
          }
          objc_msgSend_identitiesChanged(v12, v109, v110);
          v81 = 0;
        }
        goto LABEL_82;
      }
LABEL_49:
      uint64_t v74 = objc_msgSend_accountType(v15, v50, v51);
      if (v74 == 2)
      {
        v77 = objc_msgSend_backingAccount(v15, v75, v76);
        uint64_t IdentitySetForService_dsid_error = objc_msgSend_copyTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError_(v12, v82, (uint64_t)v11, v77, a6);
      }
      else if (v74 == 3)
      {
        v77 = objc_msgSend_backingAccount(v15, v75, v76);
        uint64_t IdentitySetForService_dsid_error = objc_msgSend_copyTestAccountIdentitySetForService_forBackingMockAccount_withError_(CKDPCSIdentityManager, v78, (uint64_t)v11, v77, a6);
      }
      else
      {
        v77 = objc_msgSend_dsid(v15, v75, v76);
        uint64_t IdentitySetForService_dsid_error = objc_msgSend__createIdentitySetForService_dsid_error_(CKDPCSIdentityManager, v83, (uint64_t)v11, v77, a6);
      }
      v84 = (const void *)IdentitySetForService_dsid_error;

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v85 = (id)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v151 = objc_msgSend_accountType(v15, v86, v87);
        *(_DWORD *)buf = 134218242;
        v171 = (__CFString *)v151;
        __int16 v172 = 2114;
        v173 = v11;
        _os_log_debug_impl(&dword_1C4CFF000, v85, OS_LOG_TYPE_DEBUG, "Caching a fresh %lld-type identity set for service %{public}@.", buf, 0x16u);
      }

      v81 = objc_msgSend__cacheIdentitySet_forService_(v12, v88, (uint64_t)v84, v11);
      if (v84) {
        CFRelease(v84);
      }
LABEL_82:
      int v80 = 1;
      if (objc_msgSend_forceEnableReadOnlyManatee(v12, v89, v90)) {
        goto LABEL_91;
      }
      if (!v6) {
        goto LABEL_91;
      }
      uint64_t v113 = objc_msgSend_identitySet(v81, v111, v112);
      if (objc_msgSend__hasCurrentKeyForService_inIdentitySet_withError_(v12, v114, (uint64_t)v11, v113, a6)) {
        goto LABEL_91;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v115 = (id)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      {
        uint64_t v152 = objc_msgSend_identitySet(v81, v116, v117);
        *(_DWORD *)buf = 138412290;
        v171 = (__CFString *)v152;
        _os_log_error_impl(&dword_1C4CFF000, v115, OS_LOG_TYPE_ERROR, "Identity set %@ does not have a current key set. Not using it and removing it from cache.", buf, 0xCu);
      }

      v120 = objc_msgSend_PCSIdentityWrappersByServiceName(v12, v118, v119);
      objc_msgSend_setObject_forKeyedSubscript_(v120, v121, 0, v11);

      goto LABEL_90;
    }
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v55, *MEMORY[0x1E4F19DD8], v40, @"Manatee is not available for explicit-credential accounts");
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v26 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_DEBUG, "We don't have a DSID so we can't copy our current PCS identity", buf, 2u);
    }
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v27, *MEMORY[0x1E4F19DD8], 1002, @"Can't fetch identity, no account dsid available");
      id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:
      int v80 = 0;
      v81 = 0;
      v58 = 0;
LABEL_60:
      *a6 = v28;
      goto LABEL_91;
    }
  }
  int v80 = 0;
  v81 = 0;
  v58 = 0;
LABEL_91:

  objc_sync_exit(v12);
  if (v80)
  {
    v122 = (void *)*MEMORY[0x1E4F1A548];
    if (v81)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v122);
      }
      v123 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        v126 = v123;
        v168 = objc_msgSend_account(v12, v127, v128);
        objc_msgSend_accountID(v168, v129, v130);
        v131 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v134 = objc_msgSend_deviceContext(v12, v132, v133);
        v137 = objc_msgSend_testDeviceReference(v134, v135, v136);
        v140 = objc_msgSend_serverReferenceProtocol(v137, v138, v139);
        objc_msgSend_dataDirectory(v140, v141, v142);
        v143 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v146 = objc_msgSend_identityString(v81, v144, v145);
        *(_DWORD *)buf = 138412802;
        v171 = v131;
        __int16 v172 = 2112;
        v173 = v143;
        __int16 v174 = 2112;
        v175 = v146;
        _os_log_debug_impl(&dword_1C4CFF000, v126, OS_LOG_TYPE_DEBUG, "Using service identity for account %@ %@:\n%@", buf, 0x20u);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v122);
      }
      v148 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C4CFF000, v148, OS_LOG_TYPE_ERROR, "Couldn't get a service identity set from the PCS framework", buf, 2u);
      }
    }
    v149 = (_PCSIdentitySetData *)objc_msgSend_identitySet(v81, v124, v125);
    v147 = v149;
    if (v149) {
      CFRetain(v149);
    }
  }
  else
  {
    v147 = 0;
  }

  return v147;
}

+ (_PCSIdentitySetData)_createIdentitySetForService:(id)a3 dsid:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  BOOL v7 = (_PCSIdentitySetData *)a3;
  id v8 = a4;
  uint64_t v22 = *MEMORY[0x1E4F94018];
  v23[0] = v8;
  uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v23, &v22, 1);
  uint64_t v11 = (_PCSIdentitySetData *)PCSIdentitySetCreate();
  v12 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v13 = *MEMORY[0x1E4F1A550];
  if (!v11)
  {
    if (v13 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v12);
    }
    id v15 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, "Couldn't get an identity set for service %{public}@ from the PCS framework: %@", buf, 0x16u);
      if (!a5) {
        goto LABEL_11;
      }
    }
    else if (!a5)
    {
      goto LABEL_11;
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 5000, 0, @"Couldn't create a PCS identity");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v13 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v12);
  }
  uint64_t v14 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v11;
    _os_log_debug_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEBUG, "Got identity set from the PCS framework %@", buf, 0xCu);
  }
LABEL_11:

  return v11;
}

- (_PCSIdentitySetData)copyIdentitySetWithType:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6 = a4;
  id v8 = objc_msgSend_PCSServiceStringFromCKServiceType_(self, a2, a3);
  uint64_t v10 = (_PCSIdentitySetData *)objc_msgSend__copyIdentityForService_useCache_validateCurrentKey_error_(self, v9, (uint64_t)v8, (v6 & 1) == 0, (v6 & 2) == 0, a5);

  return v10;
}

+ (_PCSIdentitySetData)createFullKeychainIdentitySetForAccount:(id)a3 serviceName:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = objc_msgSend_dsid(v7, v9, v10);
  uint64_t v14 = objc_msgSend_length(v11, v12, v13);

  if (v14)
  {
    uint64_t v17 = objc_msgSend_accountType(v7, v15, v16);
    if (v17 == 2)
    {
      uint64_t v27 = *MEMORY[0x1E4F93FC0];
      __int16 v20 = objc_msgSend_backingAccount(v7, v18, v19);
      uint64_t v34 = 0;
      uint64_t v21 = (id *)&v34;
      uint64_t v23 = objc_msgSend_copyTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError_(CKDPCSIdentityManager, v28, v27, v20, &v34);
    }
    else if (v17 == 3)
    {
      __int16 v20 = objc_msgSend_backingAccount(v7, v18, v19);
      uint64_t v35 = 0;
      uint64_t v21 = (id *)&v35;
      uint64_t v23 = objc_msgSend_copyTestAccountIdentitySetForService_forBackingMockAccount_withError_(CKDPCSIdentityManager, v22, (uint64_t)v8, v20, &v35);
    }
    else
    {
      __int16 v20 = objc_msgSend_dsid(v7, v18, v19);
      uint64_t v33 = 0;
      uint64_t v21 = (id *)&v33;
      uint64_t v23 = objc_msgSend__createIdentitySetForService_dsid_error_(CKDPCSIdentityManager, v29, 0, v20, &v33);
    }
    char v25 = (_PCSIdentitySetData *)v23;
    id v24 = *v21;

    BOOL v26 = v25 == 0;
    if (v25) {
      BOOL v30 = v24 == 0;
    }
    else {
      BOOL v30 = 0;
    }
    if (v30)
    {
      id v24 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v15, *MEMORY[0x1E4F19DD8], 1002, @"Can't fetch identity set, no account dsid available");
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    char v25 = 0;
    BOOL v26 = 1;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v31 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v24;
    _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, "Failed to get full identity set: %@.", buf, 0xCu);
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (a5) {
LABEL_16:
  }
    *a5 = v24;
LABEL_17:
  if (!v26) {
    CFRelease(v25);
  }
  char v25 = 0;
LABEL_21:

  return v25;
}

- (_PCSIdentitySetData)createFullKeychainIdentitySetWithError:(id *)a3
{
  uint64_t v5 = objc_msgSend_account(self, a2, (uint64_t)a3);
  if (objc_msgSend_accountType(v5, v6, v7) == 2) {
    objc_msgSend_PCSServiceStringFromCKServiceType_(self, v8, 3);
  }
  else {
  uint64_t v10 = objc_msgSend_serviceName(self, v8, v9);
  }
  FullKeychainIdentitySetForAccount_serviceName_error = (_PCSIdentitySetData *)objc_msgSend_createFullKeychainIdentitySetForAccount_serviceName_error_(CKDPCSIdentityManager, v11, (uint64_t)v5, v10, a3);

  return FullKeychainIdentitySetForAccount_serviceName_error;
}

- (BOOL)liverpoolServiceOwnsPublicID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v27 = 0;
  char v6 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(self, v5, 3, 0, &v27);
  id v7 = v27;
  id v8 = v7;
  uint64_t v9 = 0;
  LOBYTE(v10) = 0;
  if (v6 && !v7)
  {
    uint64_t v11 = (void *)PCSIdentitySetCopyIdentities();
    uint64_t v14 = v11;
    if (v11)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v15 = objc_msgSend_allValues(v11, v12, v13, 0);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v23, v28, 16);
      if (v10)
      {
        uint64_t v18 = 0;
        uint64_t v19 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v15);
            }
            if (*(void *)(*((void *)&v23 + 1) + 8 * i))
            {
              uint64_t v9 = PCSIdentityGetPublicKey();

              if (objc_msgSend_isEqualToString_(v4, v21, (uint64_t)v9))
              {
                LOBYTE(v10) = 1;
                goto LABEL_18;
              }
              uint64_t v18 = v9;
            }
          }
          uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v23, v28, 16);
          if (v10) {
            continue;
          }
          break;
        }
        uint64_t v9 = v18;
      }
      else
      {
        uint64_t v9 = 0;
      }
LABEL_18:
    }
    else
    {
      LOBYTE(v10) = 0;
      uint64_t v9 = 0;
    }
  }
  if (v6) {
    CFRelease(v6);
  }

  return v10;
}

- (_PCSPublicIdentityData)copyDiversifiedIdentityForService:(unint64_t)a3 userIDEntropy:(id)a4 withError:(id *)a5
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  CFTypeRef cf = 0;
  uint64_t v55 = *MEMORY[0x1E4F93F18];
  v56[0] = MEMORY[0x1E4F1CC28];
  uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v56, &v55, 1);
  if (!objc_msgSend_length(v8, v11, v12))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v21 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Can't create a diversified identity with no server entropy", buf, 2u);
    }
    __int16 v20 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], 5000, 0, @"Can't create a diversified identity with no server entropy");
    goto LABEL_20;
  }
  id v49 = 0;
  uint64_t v14 = (_PCSPublicIdentityData *)objc_msgSend_copyIdentitySetWithType_options_error_(self, v13, a3, 0, &v49);
  id v15 = v49;
  uint64_t v17 = v15;
  if (!v14 || v15)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v23 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      long long v24 = v23;
      long long v25 = sub_1C4DC6110(a3);
      *(_DWORD *)buf = 138543618;
      v52 = v25;
      __int16 v53 = 2112;
      CFTypeRef v54 = v17;
      _os_log_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_INFO, "Warn: Couldn't get a %{public}@ identity set: %@", buf, 0x16u);
    }
    long long v26 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v27 = *MEMORY[0x1E4F19DD8];
    id v28 = sub_1C4DC6110(a3);
    __int16 v20 = objc_msgSend_errorWithDomain_code_error_format_(v26, v29, v27, 5000, v17, @"Couldn't get a %@ identity set", v28);

    if (!v14) {
      goto LABEL_38;
    }
    CFRelease(v14);
LABEL_20:
    uint64_t v14 = 0;
    goto LABEL_38;
  }
  objc_msgSend_PCSServiceStringFromCKServiceType_(self, v16, a3);
  uint64_t v18 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
  if (v18 && !cf)
  {
    uint64_t DiversifiedIdentityOptions = PCSIdentityCreateDiversifiedIdentityOptions();
    if (!DiversifiedIdentityOptions || cf)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v48 = v10;
      uint64_t v39 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        uint64_t v40 = v39;
        v41 = sub_1C4DC6110(a3);
        *(_DWORD *)buf = 138543618;
        v52 = v41;
        __int16 v53 = 2112;
        CFTypeRef v54 = cf;
        _os_log_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_INFO, "Warn: Couldn't create a diversified %{public}@ identity: %@", buf, 0x16u);
      }
      v42 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v43 = *MEMORY[0x1E4F19DD8];
      CFTypeRef v44 = cf;
      v45 = sub_1C4DC6110(a3);
      __int16 v20 = objc_msgSend_errorWithDomain_code_error_format_(v42, v46, v43, 5000, v44, @"Couldn't create a diversified %@ identity", v45);

      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      uint64_t v10 = v48;
    }
    else
    {
      __int16 v20 = 0;
    }
    CFRelease(v14);
LABEL_37:
    CFRelease(v18);
    uint64_t v14 = (_PCSPublicIdentityData *)DiversifiedIdentityOptions;
    goto LABEL_38;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  BOOL v30 = v10;
  uint64_t v31 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    v32 = v31;
    uint64_t v33 = sub_1C4DC6110(a3);
    *(_DWORD *)buf = 138543618;
    v52 = v33;
    __int16 v53 = 2112;
    CFTypeRef v54 = cf;
    _os_log_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_INFO, "Warn: Couldn't get a %{public}@ identity: %@", buf, 0x16u);
  }
  uint64_t v34 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v35 = *MEMORY[0x1E4F19DD8];
  CFTypeRef v36 = cf;
  id v37 = sub_1C4DC6110(a3);
  __int16 v20 = objc_msgSend_errorWithDomain_code_error_format_(v34, v38, v35, 5000, v36, @"Couldn't get a %@ identity", v37);

  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  CFRelease(v14);
  uint64_t DiversifiedIdentityOptions = 0;
  uint64_t v14 = 0;
  uint64_t v10 = v30;
  if (v18) {
    goto LABEL_37;
  }
LABEL_38:
  if (a5) {
    *a5 = v20;
  }

  return v14;
}

- (id)copyDiversifiedPublicKeyForService:(unint64_t)a3 userIDEntropy:(id)a4 withError:(id *)a5
{
  id v17 = 0;
  id v7 = (const void *)objc_msgSend_copyDiversifiedIdentityForService_userIDEntropy_withError_(self, a2, a3, a4, &v17);
  id v8 = v17;
  uint64_t v9 = v8;
  if (v7 && !v8)
  {
    uint64_t v10 = PCSPublicIdentityCopyPublicKey();
LABEL_7:
    CFRelease(v7);
    id v15 = (void *)v10;
    goto LABEL_8;
  }
  if (!v8)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v12 = *MEMORY[0x1E4F19DD8];
    uint64_t v13 = sub_1C4DC6110(a3);
    uint64_t v9 = objc_msgSend_errorWithDomain_code_format_(v11, v14, v12, 5000, @"Couldn't get a diversified identity for service %@", v13);
  }
  uint64_t v10 = 0;
  id v15 = 0;
  if (v7) {
    goto LABEL_7;
  }
LABEL_8:
  if (a5) {
    *a5 = v9;
  }

  return v15;
}

+ (BOOL)credentialsAreValidForAccount:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (id)*MEMORY[0x1E4F93FC0];
  id v10 = 0;
  uint64_t TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError = objc_msgSend__getTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError_(CKDPCSIdentityManager, v5, (uint64_t)v4, v3, &v10);
  id v7 = v10;
  if (!TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v8 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_error_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_ERROR, "Couldn't get a %{public}@ identity for %@: %@", buf, 0x20u);
    }
  }

  return TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError != 0;
}

- (id)copyPublicKeyForService:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v23 = 0;
  id v7 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(self, a2, a3, 0, &v23);
  id v8 = v23;
  id v10 = v8;
  if (!v7 || (id v11 = 0, v8))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v12 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      __int16 v13 = v12;
      id v14 = sub_1C4DC6110(a3);
      *(_DWORD *)buf = 138543618;
      long long v25 = v14;
      __int16 v26 = 2112;
      uint64_t v27 = v10;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Warn: Couldn't get a %{public}@ identity set: %@", buf, 0x16u);
    }
    __int16 v15 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v16 = *MEMORY[0x1E4F19DD8];
    uint64_t v17 = sub_1C4DC6110(a3);
    objc_msgSend_errorWithDomain_code_format_(v15, v18, v16, 5000, @"Couldn't get a %@ identity set to add to the share PCS", v17);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v7 || v11)
  {
    uint64_t v19 = 0;
    __int16 v20 = 0;
    if (!v7) {
      goto LABEL_13;
    }
  }
  else
  {
    id v22 = 0;
    uint64_t v19 = objc_msgSend__copyPublicKeyDataForIdentitySet_withService_withError_(self, v9, (uint64_t)v7, a3, &v22);
    id v11 = v22;
  }
  CFRelease(v7);
  __int16 v20 = (void *)v19;
LABEL_13:
  if (a4) {
    *a4 = v11;
  }

  return v20;
}

- (id)copyAllPublicKeysForService:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v22 = 0;
  id v7 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(self, a2, a3, 0, &v22);
  id v8 = v22;
  id v10 = v8;
  if (!v7 || (id v11 = 0, v8))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v12 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      __int16 v13 = v12;
      id v14 = sub_1C4DC6110(a3);
      *(_DWORD *)buf = 138543618;
      long long v24 = v14;
      __int16 v25 = 2112;
      __int16 v26 = v10;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Warn: Couldn't get a %{public}@ identity set: %@", buf, 0x16u);
    }
    __int16 v15 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v16 = *MEMORY[0x1E4F19DD8];
    uint64_t v17 = sub_1C4DC6110(a3);
    id v11 = objc_msgSend_errorWithDomain_code_format_(v15, v18, v16, 5000, @"Couldn't get a %@ identity set to add to the share PCS", v17);
  }
  if (!v7 || v11)
  {
    uint64_t v19 = 0;
    __int16 v20 = 0;
    if (!v7) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v19 = objc_msgSend__copyPublicKeyDataForAllIdentitiesInSet_withService_(self, v9, (uint64_t)v7, a3);
  }
  CFRelease(v7);
  __int16 v20 = (void *)v19;
LABEL_13:
  if (a4) {
    *a4 = v11;
  }

  return v20;
}

- (id)_copyPublicKeyDataForAllIdentitiesInSet:(_PCSIdentitySetData *)a3 withService:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v6 = objc_opt_new();
  id v8 = objc_msgSend_PCSServiceStringFromCKServiceType_(self, v7, a4);
  id v9 = v6;
  id v14 = v9;
  PCSIdentitySetEnumeratePublicKeys();
  if (!objc_msgSend_count(v9, v10, v11))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v12 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Warn: Did not get any public keys for service %{public}@.", buf, 0xCu);
    }

    id v9 = 0;
  }

  return v9;
}

- (id)_copyPublicKeyDataForIdentitySet:(_PCSIdentitySetData *)a3 withService:(unint64_t)a4 withError:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_msgSend_PCSServiceStringFromCKServiceType_(self, a2, a4);
  id v7 = (const void *)PCSIdentitySetCopyCurrentPublicIdentityWithError();
  if (v7)
  {
    id v8 = (void *)PCSPublicIdentityCopyPublicKey();
    id v9 = 0;
    CFRelease(v7);
    if (v8)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v10 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v8;
        _os_log_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_INFO, "Current identity public key data is %{public}@", buf, 0xCu);
      }
      return v8;
    }
  }
  else
  {
    id v9 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v6, *MEMORY[0x1E4F19DD8], 5002, 0, @"Couldn't copy a public identity for our current user");
    id v8 = 0;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v11 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v9;
    _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Warn: Error generating fingerprint for current self identity: %@", buf, 0xCu);
  }
  if (a5) {
    *a5 = v9;
  }

  return 0;
}

+ (_PCSIdentitySetData)_copyStingrayIdentitiesForOptions:(id)a3 withError:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (_PCSIdentitySetData *)PCSIdentityRecoverFDE();
  char v6 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v7 = *MEMORY[0x1E4F1A550];
  if (!v5)
  {
    if (v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v6);
    }
    id v10 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = 0;
      _os_log_error_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_ERROR, "Error fetching Stingray PCS identity set: %@", buf, 0xCu);
      if (!a4) {
        return v5;
      }
    }
    else if (!a4)
    {
      return v5;
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 5001, 0, @"Couldn't fetch PCS identities from Stingray");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (v7 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v6);
  }
  id v8 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEBUG, "PCS identity set fetched:", buf, 2u);
  }
  __int16 v13 = (void *)PCSIdentitySetCopyService();
  id v9 = v13;
  PCSIdentitySetEnumeratePublicKeys();

  return v5;
}

+ (_PCSIdentitySetData)_copyStingrayIdentitiesForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = 0;
  uint64_t v55 = 0;
  char v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 1;
  uint64_t v45 = *MEMORY[0x1E4F28A50];
  uint64_t v43 = v49;
  uint64_t v9 = 3;
  *(void *)&long long v10 = 138543618;
  long long v42 = v10;
  while (1)
  {

    id v12 = objc_msgSend__generatePCSIdentityOptionsForService_forBackingExplicitCredentialsAccount_withError_(a1, v11, (uint64_t)v6, v7, a5);
    uint64_t v15 = objc_msgSend_mutableCopy(v12, v13, v14);

    if (!v15) {
      break;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v16 = (id)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v40 = objc_msgSend_username(v7, v17, v18);
      *(_DWORD *)buf = v42;
      id v60 = v6;
      __int16 v61 = 2112;
      v62 = v40;
      _os_log_debug_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_DEBUG, "Fetching PCS identity set %{public}@ for account %@", buf, 0x16u);
    }
    id v54 = 0;
    __int16 v20 = (_PCSIdentitySetData *)objc_msgSend__copyStingrayIdentitiesForOptions_withError_(a1, v19, (uint64_t)v15, &v54);
    id v21 = v54;
    id v8 = v21;
    *((unsigned char *)v56 + 24) = 0;
    if (v20 && !v21) {
      goto LABEL_16;
    }
    long long v24 = objc_msgSend_userInfo(v21, v22, v23, v42, v43);
    __int16 v26 = objc_msgSend_objectForKeyedSubscript_(v24, v25, v45);

    objc_msgSend_domain(v26, v27, v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqualToString_(v29, v30, @"CloudServicesErrorDomain")) {
      goto LABEL_12;
    }
    BOOL v33 = objc_msgSend_code(v26, v31, v32) == 305;

    if (v33)
    {
      CFTypeRef v36 = objc_msgSend_password(v7, v34, v35);
      dispatch_semaphore_t v44 = dispatch_semaphore_create(0);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v49[0] = sub_1C4FED040;
      v49[1] = &unk_1E64F85B0;
      id v37 = v7;
      id v50 = v37;
      id v29 = v36;
      id v51 = v29;
      __int16 v53 = &v55;
      uint64_t v38 = v44;
      v52 = v38;
      objc_msgSend_renewAuthTokenWithOptions_completionHandler_(v37, v39, MEMORY[0x1E4F1CC08], v48);
      dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);

LABEL_12:
    }

    if (*((unsigned char *)v56 + 24) && v20)
    {
      CFRelease(v20);
      __int16 v20 = 0;
    }
LABEL_16:

    if (!--v9 || !*((unsigned char *)v56 + 24))
    {

      goto LABEL_20;
    }
  }
  __int16 v20 = 0;
LABEL_20:
  _Block_object_dispose(&v55, 8);

  return v20;
}

+ (id)sharedFakeIdentitySetsByServiceByUsername
{
  if (qword_1EBBD0108 != -1) {
    dispatch_once(&qword_1EBBD0108, &unk_1F2044A30);
  }
  v2 = (void *)qword_1EBBD0100;
  return v2;
}

+ (_PCSIdentitySetData)_getTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_msgSend_sharedFakeIdentitySetsByServiceByUsername(a1, v10, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  uint64_t v15 = objc_msgSend_username(v9, v13, v14);
  uint64_t v18 = (_PCSIdentitySetData *)objc_msgSend_length(v15, v16, v17);

  if (v18)
  {
    id v21 = objc_msgSend_username(v9, v19, v20);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v12, v22, (uint64_t)v21);

    if (!v23)
    {
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v29 = objc_msgSend_username(v9, v27, v28);
      objc_msgSend_setObject_forKeyedSubscript_(v12, v30, (uint64_t)v26, v29);
    }
    uint64_t v31 = objc_msgSend_username(v9, v24, v25);
    BOOL v33 = objc_msgSend_objectForKeyedSubscript_(v12, v32, (uint64_t)v31);

    objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)v8);
    uint64_t v18 = (_PCSIdentitySetData *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      uint64_t v18 = (_PCSIdentitySetData *)objc_msgSend__copyStingrayIdentitiesForService_forBackingExplicitCredentialsAccount_withError_(a1, v35, (uint64_t)v8, v9, a5);
      if (v18)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v33, v36, (uint64_t)v18, v8);
        CFRelease(v18);
      }
    }
  }
  objc_sync_exit(v12);

  return v18;
}

- (_PCSIdentitySetData)copyTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v11 = a4;
  if (*MEMORY[0x1E4F1A4E0] && objc_msgSend_refetchPCSIdentitySet(self, v9, v10))
  {
    id v12 = objc_opt_class();
    objc_msgSend_sharedFakeIdentitySetsByServiceByUsername(v12, v13, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v15);
    uint64_t v18 = objc_msgSend_username(v11, v16, v17);
    uint64_t v21 = objc_msgSend_length(v18, v19, v20);

    if (v21)
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v25 = objc_msgSend_username(v11, v23, v24);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v26, (uint64_t)v22, v25);
    }
    objc_sync_exit(v15);
  }
  uint64_t v27 = (_PCSIdentitySetData *)objc_msgSend_copyTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError_(CKDPCSIdentityManager, v9, (uint64_t)v8, v11, a5);

  return v27;
}

+ (_PCSIdentitySetData)copyTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v38 = 0;
  CFTypeRef cf = 0;
  uint64_t TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError = objc_msgSend__getTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError_(CKDPCSIdentityManager, v8, (uint64_t)v7, a4, &v38);
  id v10 = v38;
  if (TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    __int16 v13 = v10;
    if (v10)
    {
      if (!a5)
      {
LABEL_36:
        uint64_t v18 = 0;
        uint64_t v16 = 0;
LABEL_37:
        Mutable = 0;
        goto LABEL_38;
      }
    }
    else
    {
      __int16 v13 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 5000, 0, @"Couldn't fetch identity set for service %@ to add to a new identity set.", v7);
      if (!a5) {
        goto LABEL_36;
      }
    }
    id v21 = v13;
    __int16 v13 = v21;
LABEL_19:
    uint64_t v18 = 0;
    uint64_t v16 = 0;
    goto LABEL_20;
  }
  uint64_t v14 = PCSIdentitySetCopyIdentities();
  if (!v14)
  {
    if (!a5)
    {
      __int16 v13 = 0;
      goto LABEL_36;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v15, *MEMORY[0x1E4F19DD8], 5000, @"Empty dictionary returned while copying identities. Can't add identities for %@ to mutable identity set.", v7);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v13 = 0;
    goto LABEL_19;
  }
  uint64_t v16 = (void *)v14;
  uint64_t v18 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
  CFTypeRef v19 = cf;
  if (v18) {
    BOOL v20 = cf == 0;
  }
  else {
    BOOL v20 = 0;
  }
  if (v20)
  {
    Mutable = (_PCSIdentitySetData *)PCSIdentitySetCreateMutable();
    CFTypeRef v19 = cf;
    if (Mutable && !cf)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v25 = objc_msgSend_allValues(v16, v23, v24);
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v34, v40, 16);
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v35 != v29) {
              objc_enumerationMutation(v25);
            }
            uint64_t v31 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            if ((PCSIdentitySetAddIdentity() & 1) == 0)
            {
              if (a5)
              {
                objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v32, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't add app-specific service identity (%@) to new identity set: %@", v31, Mutable);
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }
              CFRelease(Mutable);

              __int16 v13 = 0;
              goto LABEL_37;
            }
          }
          uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v32, (uint64_t)&v34, v40, 16);
          if (v28) {
            continue;
          }
          break;
        }
      }

      PCSIdentitySetSetCurrentIdentity();
      __int16 v13 = 0;
      goto LABEL_38;
    }
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v23, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't create a mutable identity set for service: %@", v7);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v13 = 0;
      goto LABEL_21;
    }
    __int16 v13 = 0;
  }
  else
  {
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 5000, v7);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v13 = 0;
LABEL_20:
      Mutable = 0;
LABEL_21:
      *a5 = v21;
LABEL_38:
      CFTypeRef v19 = cf;
      goto LABEL_39;
    }
    __int16 v13 = 0;
    Mutable = 0;
  }
LABEL_39:
  if (v19)
  {
    CFRelease(v19);
    CFTypeRef cf = 0;
  }
  if (v18) {
    CFRelease(v18);
  }

  return Mutable;
}

+ (id)_generatePCSIdentityOptionsForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v50 = 0;
    id v10 = objc_msgSend_iCloudAuthTokenWithError_(v8, v9, (uint64_t)&v50);
    id v11 = v50;
    BOOL v12 = v11;
    if (v10 && !v11)
    {
      __int16 v13 = objc_opt_new();
      uint64_t v16 = objc_msgSend_username(v8, v14, v15);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v17, (uint64_t)v16, *MEMORY[0x1E4F94058]);

      BOOL v20 = objc_msgSend_password(v8, v18, v19);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v21, (uint64_t)v20, *MEMORY[0x1E4F94038]);

      uint64_t v24 = objc_msgSend_dsid(v8, v22, v23);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v25, (uint64_t)v24, *MEMORY[0x1E4F94018]);

      objc_msgSend_setObject_forKeyedSubscript_(v13, v26, (uint64_t)v7, *MEMORY[0x1E4F94048]);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v27, MEMORY[0x1E4F1CC28], *MEMORY[0x1E4F94028]);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v28, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F94050]);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v29, (uint64_t)v10, *MEMORY[0x1E4F94010]);
      uint64_t v31 = objc_msgSend_accountPropertiesForDataclass_(v8, v30, @"com.apple.Dataclass.KeychainSync");
      BOOL v33 = objc_msgSend_objectForKeyedSubscript_(v31, v32, @"escrowProxyUrl");
      objc_msgSend_setObject_forKeyedSubscript_(v13, v34, (uint64_t)v33, *MEMORY[0x1E4F94020]);

      long long v36 = objc_msgSend_accountPropertiesForDataclass_(v8, v35, @"com.apple.Dataclass.Ubiquity");
      id v38 = objc_msgSend_objectForKeyedSubscript_(v36, v37, @"apsEnv");
      objc_msgSend_setObject_forKeyedSubscript_(v13, v39, (uint64_t)v38, *MEMORY[0x1E4F94060]);

      long long v42 = objc_msgSend_copy(v13, v40, v41);
LABEL_15:

      goto LABEL_16;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v43 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      uint64_t v45 = v43;
      v48 = objc_msgSend_username(v8, v46, v47);
      *(_DWORD *)buf = 138412546;
      v52 = v48;
      __int16 v53 = 2112;
      id v54 = v12;
      _os_log_error_impl(&dword_1C4CFF000, v45, OS_LOG_TYPE_ERROR, "Error fetching iCloud auth token for account %@: %@", buf, 0x16u);

      if (a5) {
        goto LABEL_11;
      }
    }
    else if (a5)
    {
LABEL_11:
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v44, *MEMORY[0x1E4F19DD8], 2011, v12, @"Error fetching iCloud auth token");
      long long v42 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    long long v42 = 0;
    goto LABEL_15;
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v9, *MEMORY[0x1E4F19DD8], 1017, @"Account %@ is not a CKDBackingExplicitCredentialsAccount", v8);
    long long v42 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v42 = 0;
  }
LABEL_16:

  return v42;
}

+ (BOOL)_rollTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  return MEMORY[0x1F4181798](CKDPCSIdentityManager, sel__rollTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_oldIdentityID_newIdentityID_withError_, a3);
}

+ (BOOL)_rollTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 oldIdentityID:(id *)a5 newIdentityID:(id *)a6 withError:(id *)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v15 = objc_msgSend__generatePCSIdentityOptionsForService_forBackingExplicitCredentialsAccount_withError_(a1, v14, (uint64_t)v12, v13, a7);
  uint64_t v18 = objc_msgSend_mutableCopy(v15, v16, v17);

  if (v18)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v19, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F94040]);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v20 = (os_log_t *)MEMORY[0x1E4F1A528];
    id v21 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v40 = v21;
      uint64_t v43 = objc_msgSend_username(v13, v41, v42);
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = v43;
      _os_log_debug_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_DEBUG, "Fetching PCS identity set for account %@", buf, 0xCu);
    }
    uint64_t v23 = (const void *)PCSIdentitySetup();
    if (!v23)
    {
      if (a7)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], 5001, 0, @"Couldn't setup PCS identities from stingray");
        uint64_t v27 = 0;
        uint64_t v29 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v27 = 0;
        uint64_t v29 = 0;
      }
      char v33 = 1;
LABEL_22:
      long long v35 = v27;
      long long v34 = v29;
      if (!v23) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    uint64_t v25 = (const void *)PCSIdentitySetCopyCurrentPublicIdentityWithError();
    if (v25)
    {
      id v26 = PCSPublicIdentityGetPublicID();
      uint64_t v27 = v26;
      if (a5) {
        *a5 = v26;
      }
      if (PCSIdentityRollIdentity())
      {
        uint64_t v45 = PCSIdentitySetCopyCurrentPublicIdentityWithError();
        uint64_t v29 = PCSPublicIdentityGetPublicID();
        int isEqualToString = objc_msgSend_isEqualToString_(v27, v30, (uint64_t)v29);
        if (isEqualToString)
        {
          if (!a7)
          {
            uint64_t v39 = (const void *)v45;
            goto LABEL_43;
          }
          char v44 = isEqualToString;
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v32, *MEMORY[0x1E4F19DD8], 5000, 0, @"Rolling PCS identities for service %@ was unsuccessful", v12);
          goto LABEL_38;
        }
        char v44 = 0;
        if (a6) {
          *a6 = v29;
        }
        CFRelease(v23);
        uint64_t v23 = (const void *)PCSIdentitySetup();
        if (!v23)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          long long v37 = *v20;
          if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v47 = 0;
            _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "Error setting up PCS identity set: %@", buf, 0xCu);
            if (a7) {
              goto LABEL_37;
            }
          }
          else if (a7)
          {
LABEL_37:
            objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v38, *MEMORY[0x1E4F19DD8], 5001, 0, @"Couldn't setup PCS identities from stingray");
LABEL_38:
            uint64_t v39 = (const void *)v45;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
            LOBYTE(isEqualToString) = v44;
LABEL_43:
            char v33 = isEqualToString ^ 1;
            CFRelease(v25);
            if (v39) {
              CFRelease(v39);
            }
            goto LABEL_22;
          }
        }
        uint64_t v39 = (const void *)v45;
        goto LABEL_42;
      }
      if (a7)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v28, *MEMORY[0x1E4F19DD8], 5001, 0, @"Couldn't roll PCS identities for service %@", v12);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      long long v35 = v27;
      CFRelease(v25);
      long long v34 = 0;
      char v33 = 0;
    }
    else
    {
      if (a7)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v24, *MEMORY[0x1E4F19DD8], 5000, 0, @"Couldn't get a public identity");
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      long long v34 = 0;
      char v33 = 0;
      long long v35 = 0;
    }
LABEL_27:
    CFRelease(v23);
    uint64_t v29 = v34;
LABEL_28:

    goto LABEL_29;
  }
  char v33 = 0;
LABEL_29:

  return v33;
}

+ (id)_copyPCSIdentitiesForBackingMockAccount:(id)a3 withError:(id *)a4
{
  v49[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = v5;
    id v8 = objc_msgSend_testAccount(v5, v6, v7);
    uint64_t v11 = objc_msgSend_pcsIdentitiesData(v8, v9, v10);

    id v12 = (void *)MEMORY[0x1E4F28DC0];
    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    void v49[2] = objc_opt_class();
    uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v49, 3);
    uint64_t v17 = objc_msgSend_setWithArray_(v13, v16, (uint64_t)v15);
    uint64_t v39 = (void *)v11;
    uint64_t v19 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v12, v18, (uint64_t)v17, v11, 0);

    BOOL v20 = objc_opt_new();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v21 = v19;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v42, v48, 16);
    if (v23)
    {
      uint64_t v25 = v23;
      uint64_t v26 = *(void *)v43;
LABEL_4:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * v27);
        uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v21, v24, v28);
        BOOL v30 = (const void *)PCSIdentitySetCreateFromExternalForm();
        uint64_t v31 = *MEMORY[0x1E4F1A550];
        if (!v30) {
          break;
        }
        if (v31 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v32 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "PCS identity set fetched:", buf, 2u);
        }
        uint64_t v41 = (void *)PCSIdentitySetCopyService();
        id v33 = v41;
        PCSIdentitySetEnumeratePublicKeys();

        objc_msgSend_setObject_forKeyedSubscript_(v20, v34, (uint64_t)v30, v28);
        CFRelease(v30);

        if (v25 == ++v27)
        {
          uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v42, v48, 16);
          if (v25) {
            goto LABEL_4;
          }
          goto LABEL_14;
        }
      }
      if (v31 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v5 = v40;
      long long v36 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = 0;
        _os_log_error_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_ERROR, "Error unarchiving a mock PCS service identity: %@", buf, 0xCu);
        if (!a4) {
          goto LABEL_22;
        }
      }
      else if (!a4)
      {
LABEL_22:

        id v35 = 0;
        goto LABEL_23;
      }
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v37, *MEMORY[0x1E4F19DD8], 5005, 0, @"Error unarchiving a mock PCS service identity");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_14:

    id v35 = v20;
    id v5 = v40;
LABEL_23:
  }
  else if (a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v6, *MEMORY[0x1E4F19DD8], 1017, @"Account %@ is not a CKDBackingMockAccount", v5);
    id v35 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

+ (BOOL)_setIdentitySet:(_PCSIdentitySetData *)a3 forServiceName:(id)a4 backingMockAccount:(id)a5 withError:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v12 = objc_msgSend__copyPCSIdentitiesForBackingMockAccount_withError_(CKDPCSIdentityManager, v11, (uint64_t)v10, a6);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)a3, v9);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_1C4FEE740;
  uint64_t v28 = sub_1C4FEE750;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = sub_1C4FEE758;
  v23[3] = &unk_1E64F85D8;
  v23[4] = &v24;
  uint64_t v16 = objc_msgSend_CKMapValues_(v12, v14, (uint64_t)v23);
  if (a6) {
    *a6 = (id) v25[5];
  }
  uint64_t v17 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v15, (uint64_t)v16, 1, a6);
  BOOL v20 = objc_msgSend_testAccount(v10, v18, v19);
  objc_msgSend_daemonSetPCSIdentitiesData_(v20, v21, (uint64_t)v17);

  _Block_object_dispose(&v24, 8);
  return v17 != 0;
}

+ (id)sharedMockIdentitySetsByServiceByIdentifier
{
  if (qword_1EBBD0118 != -1) {
    dispatch_once(&qword_1EBBD0118, &unk_1F2044A50);
  }
  v2 = (void *)qword_1EBBD0110;
  return v2;
}

+ (void)clearSharedMockIdentitySetsCache
{
  if (!*MEMORY[0x1E4F1A4E0])
  {
    id v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, a1, @"CKDPCSIdentityManager.m", 892, @"Only for testing");
  }
  id v4 = objc_opt_class();
  objc_msgSend_sharedMockIdentitySetsByServiceByIdentifier(v4, v5, v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v12, v7, v8);
}

+ (_PCSIdentitySetData)_getTestAccountIdentitySetForService:(id)a3 forBackingMockAccount:(id)a4 withError:(id *)a5
{
  return (_PCSIdentitySetData *)MEMORY[0x1F4181798](CKDPCSIdentityManager, sel__getTestAccountIdentitySetForService_forBackingMockAccount_shouldFaultInIdentities_withError_, a3);
}

+ (_PCSIdentitySetData)_getTestAccountIdentitySetForService:(id)a3 forBackingMockAccount:(id)a4 shouldFaultInIdentities:(BOOL)a5 withError:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  objc_msgSend_sharedMockIdentitySetsByServiceByIdentifier(CKDPCSIdentityManager, v11, v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  uint64_t v16 = objc_msgSend_identifier(v10, v14, v15);
  uint64_t v19 = objc_msgSend_length(v16, v17, v18);

  if (v19)
  {
    id v22 = objc_msgSend_identifier(v10, v20, v21);
    uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v13, v23, (uint64_t)v22);

    if (!v24)
    {
      id v29 = objc_msgSend__copyPCSIdentitiesForBackingMockAccount_withError_(CKDPCSIdentityManager, v25, (uint64_t)v10, a6);
      if (v29)
      {
        BOOL v30 = objc_msgSend_identifier(v10, v27, v28);
        objc_msgSend_setObject_forKeyedSubscript_(v13, v31, (uint64_t)v29, v30);
      }
    }
    uint64_t v32 = objc_msgSend_identifier(v10, v25, v26);
    long long v34 = objc_msgSend_objectForKeyedSubscript_(v13, v33, (uint64_t)v32);
    long long v36 = objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)v9);

    if (!v36)
    {
      Mutable = 0;
      if (v7)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v40 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v57 = v9;
          __int16 v58 = 2112;
          id v59 = v10;
          _os_log_error_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_ERROR, "No pre-existing identity for service %@ on account %@. That's unexpected. Filling one out", buf, 0x16u);
        }
        Mutable = (const void *)PCSIdentitySetCreateMutable();
        Master = (const void *)PCSIdentityCreateMaster();
        PCSIdentitySetAddIdentityWithError();
        Service = (const void *)PCSIdentityCreateService();
        PCSIdentitySetAddIdentityWithError();
        if (Service) {
          CFRelease(Service);
        }
        if (Master) {
          CFRelease(Master);
        }
        id v51 = objc_msgSend_identifier(v10, v43, v44);
        __int16 v53 = objc_msgSend_objectForKeyedSubscript_(v13, v52, (uint64_t)v51);
        objc_msgSend_setObject_forKeyedSubscript_(v53, v54, (uint64_t)Mutable, v9);

        objc_msgSend__setIdentitySet_forServiceName_backingMockAccount_withError_(CKDPCSIdentityManager, v55, (uint64_t)Mutable, v9, v10, a6);
      }
      else if (a6)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v37, *MEMORY[0x1E4F19DD8], 5000, 0, @"No pre-existing identity for service %@ on account %@", v9, v10);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    long long v45 = objc_msgSend_identifier(v10, v37, v38);
    uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(v13, v46, (uint64_t)v45);
    objc_msgSend_objectForKeyedSubscript_(v47, v48, (uint64_t)v9);
    id v49 = (_PCSIdentitySetData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v49 = 0;
  }
  objc_sync_exit(v13);

  return v49;
}

+ (_PCSIdentitySetData)copyTestAccountIdentitySetForService:(id)a3 forBackingMockAccount:(id)a4 withError:(id *)a5
{
  buf[3] = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  uint64_t TestAccountIdentitySetForService_forBackingMockAccount_withError = objc_msgSend__getTestAccountIdentitySetForService_forBackingMockAccount_withError_(CKDPCSIdentityManager, a2, (uint64_t)a3, a4, &v15);
  id v7 = v15;
  if (TestAccountIdentitySetForService_forBackingMockAccount_withError) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    buf[0] = 0;
    id v10 = (_PCSIdentitySetData *)PCSIdentitySetCopySet();
    BOOL v11 = v10 == 0;
    if (v10) {
      BOOL v12 = buf[0] == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      id v9 = 0;
      goto LABEL_21;
    }
    id v9 = (id)buf[0];
  }
  else
  {
    id v9 = v7;
    id v10 = 0;
    BOOL v11 = 1;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v13 = *MEMORY[0x1E4F1A528];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
  {
    if (v11) {
      goto LABEL_15;
    }
LABEL_19:
    CFRelease(v10);
    if (a5) {
      goto LABEL_16;
    }
LABEL_20:
    id v10 = 0;
    goto LABEL_21;
  }
  LODWORD(buf[0]) = 138412290;
  *(void *)((char *)buf + 4) = v9;
  _os_log_error_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_ERROR, "Error copying per-silo identity set: %@", (uint8_t *)buf, 0xCu);
  if (!v11) {
    goto LABEL_19;
  }
LABEL_15:
  if (!a5) {
    goto LABEL_20;
  }
LABEL_16:
  id v9 = v9;
  id v10 = 0;
  *a5 = v9;
LABEL_21:

  return v10;
}

- (BOOL)isManateeAvailableWithError:(id *)a3
{
  id v3 = a3;
  id v5 = objc_msgSend_deviceContext(self, a2, (uint64_t)a3);
  BOOL v8 = objc_msgSend_accountDataSecurityObserver(v5, v6, v7);
  BOOL v11 = objc_msgSend_account(self, v9, v10);
  LOBYTE(v3) = objc_msgSend_isManateeAvailableForAccount_isSecondaryAccount_error_(v8, v12, (uint64_t)v11, 0, v3);

  return (char)v3;
}

- (BOOL)currentServiceIsManatee
{
  id v3 = self;
  id v4 = objc_msgSend_serviceName(self, a2, v2);
  LOBYTE(v3) = objc_msgSend_serviceIsManatee_(v3, v5, (uint64_t)v4);

  return (char)v3;
}

- (BOOL)serviceIsManatee:(id)a3
{
  id v4 = a3;
  if (*MEMORY[0x1E4F1A4E0] && self->_serviceIsManateeForUnitTests) {
    char IsManatee = 1;
  }
  else {
    char IsManatee = PCSServiceItemTypeIsManatee();
  }

  return IsManatee;
}

- (_PCSIdentityData)debugSharingIdentity
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_debugIdentity)
  {
    Named = (const void *)PCSIdentitySetCreateNamed();
    v2->_debugIdentity = (_PCSIdentityData *)PCSIdentitySetCopyCurrentIdentityWithError();
    CFRelease(Named);
  }
  objc_sync_exit(v2);

  return v2->_debugIdentity;
}

- (_PCSPublicIdentityData)createPublicSharingIdentityFromPublicKey:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (_PCSPublicIdentityData *)a3;
  if (v5)
  {
    uint64_t v6 = (_PCSPublicIdentityData *)PCSPublicIdentityCreateFromKeyData();
    uint64_t v7 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v8 = *MEMORY[0x1E4F1A550];
    if (v6)
    {
      if (v8 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v7);
      }
      BOOL v12 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v6;
        __int16 v16 = 2114;
        uint64_t v17 = v5;
        _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "Created sharing identity %@ from public key %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (v8 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v7);
      }
      id v9 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = 0;
        _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Couldn't create a sharing identity from public key %{public}@: %@", buf, 0x16u);
      }
      if (a4)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 5005, 0, @"Couldn't create a sharing identity from public key %@", v5);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v11 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Refusing to try to create a sharing identity from a nil public key", buf, 2u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (_PCSIdentityData)createRandomSharingIdentityWithError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  RandomCompactRaw = (_PCSIdentityData *)PCSIdentityCreateRandomCompactRaw();
  id v5 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v6 = *MEMORY[0x1E4F1A550];
  if (RandomCompactRaw)
  {
    if (v6 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v5);
    }
    id v9 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v12 = RandomCompactRaw;
      _os_log_debug_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_DEBUG, "Created sharing identity %@", buf, 0xCu);
    }
  }
  else
  {
    if (v6 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v5);
    }
    uint64_t v7 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v12 = 0;
      _os_log_error_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_ERROR, "Couldn't create a new sharing identity: %@", buf, 0xCu);
      if (!a3) {
        return RandomCompactRaw;
      }
      goto LABEL_6;
    }
    if (a3)
    {
LABEL_6:
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v8, *MEMORY[0x1E4F19DD8], 5005, 0, @"Couldn't create a sharing identity");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return RandomCompactRaw;
}

- (id)dataFromSharingIdentity:(_PCSIdentityData *)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    ExportedRawCompact = (void *)PCSIdentityCreateExportedRawCompact();
    uint64_t v7 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v8 = *MEMORY[0x1E4F1A550];
    if (ExportedRawCompact)
    {
      if (v8 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v7);
      }
      BOOL v12 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = a3;
        __int16 v16 = 2112;
        uint64_t v17 = ExportedRawCompact;
        _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "Created data from sharing identity %@: %@", buf, 0x16u);
      }
    }
    else
    {
      if (v8 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v7);
      }
      id v9 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = a3;
        __int16 v16 = 2112;
        uint64_t v17 = 0;
        _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Couldn't create data from sharing identity %@: %@", buf, 0x16u);
      }
      if (a4)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 5005, 0, @"Couldn't create data from web sharing identity %@", a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v11 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Refusing to try to create data from a NULL sharing identity", buf, 2u);
    }
    ExportedRawCompact = 0;
  }
  return ExportedRawCompact;
}

- (_PCSIdentityData)createSharingIdentityFromData:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (_PCSIdentityData *)a3;
  if (v5)
  {
    uint64_t v6 = (_PCSIdentityData *)PCSIdentityCreateFromRaw();
    uint64_t v7 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v8 = *MEMORY[0x1E4F1A550];
    if (v6)
    {
      if (v8 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v7);
      }
      BOOL v12 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v5;
        _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "Created sharing identity %@ from data %@", buf, 0x16u);
      }
    }
    else
    {
      if (v8 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v7);
      }
      id v9 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = 0;
        _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Couldn't create a sharing identity from data %@: %@", buf, 0x16u);
      }
      if (a4)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 5005, 0, @"Couldn't create a sharing identity from data %@", v5);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v11 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Refusing to try to create a sharing identity from nil data", buf, 2u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (_PCSIdentityData)createCombinedIdentityWithOutOfNetworkPrivateKey:(id)a3 publicSharingIdentity:(id)a4
{
  return (_PCSIdentityData *)MEMORY[0x1F4146E30](a3, 0, a4);
}

- (_PCSIdentitySetData)createTemporaryCloudKitFeaturesSigningIdentitySetForServiceName:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  Mutable = (_PCSIdentitySetData *)PCSIdentitySetCreateMutable();
  if (Mutable)
  {
    Master = (const void *)PCSIdentityCreateMaster();
    PCSIdentitySetAddIdentityWithError();
    Service = (const void *)PCSIdentityCreateService();
    PCSIdentitySetAddIdentityWithError();
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v6, *MEMORY[0x1E4F19DD8], 5000, v5, 0);
    Master = 0;
    Service = 0;
  }
  if (a4) {
    *a4 = v11;
  }
  if (Service) {
    CFRelease(Service);
  }
  if (Master) {
    CFRelease(Master);
  }

  return Mutable;
}

- (BOOL)identitySet:(_PCSIdentitySetData *)a3 containsPublicKey:(id)a4 error:(id *)a5
{
  BOOL result = 0;
  if (a3 && a4)
  {
    uint64_t v6 = (const void *)PCSPublicIdentityCreateFromKeyData();
    if (!v6) {
      return 0;
    }
    PublicID = (const void *)PCSPublicIdentityGetPublicID();
    if (PublicID)
    {
      uint64_t v8 = PublicID;
      CFRetain(PublicID);
      CFRelease(v6);
      uint64_t v6 = (const void *)PCSIdentitySetCopyIdentity();
      CFRelease(v8);
      if (!v6) {
        return 0;
      }
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
    }
    CFRelease(v6);
    return v9;
  }
  return result;
}

- (BOOL)_hasCurrentKeyForService:(id)a3 inIdentitySet:(_PCSIdentitySetData *)a4 withError:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = 0;
  if (!v8 || !a4) {
    goto LABEL_22;
  }
  CFErrorRef cf = 0;
  BOOL v11 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
  if (*MEMORY[0x1E4F1A4E0]
    && objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v10, @"ForceSecurityErrorOnIdentityValidation"))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v12 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "Forcing error from security when validating the identity", buf, 2u);
    }
    uint64_t v26 = *MEMORY[0x1E4F28228];
    v27[0] = @"The connection to service named com.apple.securityd.general was invalidated.";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v27, &v26, 1);
    CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFErrorRef cf = CFErrorCreate(0, @"NSCocoaErrorDomain", 4099, v14);

    char v15 = 0;
    if (!v11)
    {
LABEL_13:
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      __int16 v16 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v21 = a4;
        __int16 v22 = 2114;
        id v23 = v8;
        __int16 v24 = 2112;
        CFErrorRef v25 = cf;
        _os_log_error_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_ERROR, "Identity set %@ was expected to have a current key set %{public}@. %@", buf, 0x20u);
        if (!a5)
        {
LABEL_18:
          char v15 = 0;
          BOOL v9 = 0;
          if (!v11) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }
      }
      else if (!a5)
      {
        goto LABEL_18;
      }
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 5000, cf, @"Couldn't create a PCS identity");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else
  {
    char v15 = 1;
    if (!v11) {
      goto LABEL_13;
    }
  }
  if (cf) {
    goto LABEL_13;
  }
LABEL_19:
  CFRelease(v11);
  BOOL v9 = v15;
LABEL_20:
  if (cf) {
    CFRelease(cf);
  }
LABEL_22:

  return v9;
}

+ (id)overrideKeys
{
  if (!*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, a1, @"CKDPCSIdentityManager.m", 1189, @"Only suitable for testing");
  }
  if (qword_1EBBD0128 != -1) {
    dispatch_once(&qword_1EBBD0128, &unk_1F2044A70);
  }
  id v3 = (void *)qword_1EBBD0120;
  return v3;
}

- (void)clearOverrides
{
  if (!*MEMORY[0x1E4F1A4E0])
  {
    id v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CKDPCSIdentityManager.m", 1203, @"Only suitable for testing");
  }
  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_setForceSecurityErrorOnIdentityValidation_(obj, v4, 0);
  objc_msgSend_setServiceIsManateeForUnitTests_(obj, v5, 0);
  objc_msgSend_setRefetchPCSIdentitySet_(obj, v6, 0);
  objc_sync_exit(obj);
}

- (void)setOverride:(id)a3 value:(id)a4
{
  id v23 = a3;
  id v9 = a4;
  if (!*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, @"CKDPCSIdentityManager.m", 1212, @"Only suitable for testing");
  }
  uint64_t v10 = self;
  objc_sync_enter(v10);
  if (objc_msgSend_isEqualToString_(v23, v11, @"ForceSecurityErrorOnIdentityValidation"))
  {
    objc_msgSend_setForceSecurityErrorOnIdentityValidation_(v10, v12, 1);
  }
  else if (objc_msgSend_isEqualToString_(v23, v12, @"MasqueradeAsManateeIdentity"))
  {
    uint64_t v15 = objc_msgSend_BOOLValue(v9, v13, v14);
    objc_msgSend_setServiceIsManateeForUnitTests_(v10, v16, v15);
  }
  else if (objc_msgSend_isEqualToString_(v23, v13, @"RefetchPCSIdentitySet"))
  {
    uint64_t v19 = objc_msgSend_BOOLValue(v9, v17, v18);
    objc_msgSend_setRefetchPCSIdentitySet_(v10, v20, v19);
  }
  objc_sync_exit(v10);
}

- (BOOL)_checkAndClearPCSTestOverrideForKey:(id)a3
{
  id v7 = a3;
  if (!*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, @"CKDPCSIdentityManager.m", 1227, @"Only suitable for testing");
  }
  uint64_t v8 = self;
  objc_sync_enter(v8);
  if (objc_msgSend_isEqualToString_(v7, v9, @"ForceSecurityErrorOnIdentityValidation"))
  {
    char v12 = objc_msgSend_forceSecurityErrorOnIdentityValidation(v8, v10, v11);
    objc_msgSend_setForceSecurityErrorOnIdentityValidation_(v8, v13, 0);
  }
  else
  {
    char v12 = 0;
  }
  objc_sync_exit(v8);

  return v12;
}

- (CKDAccount)account
{
  return (CKDAccount *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccount:(id)a3
{
}

- (CKDLogicalDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (BOOL)forceEnableReadOnlyManatee
{
  return self->_forceEnableReadOnlyManatee;
}

- (NSString)cachedAccountDSID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedAccountDSID:(id)a3
{
}

- (NSMutableDictionary)PCSIdentityWrappersByServiceName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPCSIdentityWrappersByServiceName:(id)a3
{
}

- (_PCSIdentityData)debugIdentity
{
  return self->_debugIdentity;
}

- (void)setDebugIdentity:(_PCSIdentityData *)a3
{
  self->_debugIdentity = a3;
}

- (BOOL)forceSecurityErrorOnIdentityValidation
{
  return self->_forceSecurityErrorOnIdentityValidation;
}

- (void)setForceSecurityErrorOnIdentityValidation:(BOOL)a3
{
  self->_forceSecurityErrorOnIdentityValidation = a3;
}

- (BOOL)serviceIsManateeForUnitTests
{
  return self->_serviceIsManateeForUnitTests;
}

- (void)setServiceIsManateeForUnitTests:(BOOL)a3
{
  self->_serviceIsManateeForUnitTests = a3;
}

- (BOOL)refetchPCSIdentitySet
{
  return self->_refetchPCSIdentitySet;
}

- (void)setRefetchPCSIdentitySet:(BOOL)a3
{
  self->_refetchPCSIdentitySet = a3;
}

- (unsigned)clientSDKVersion
{
  return self->_clientSDKVersion;
}

- (void)setClientSDKVersion:(unsigned int)a3
{
  self->_clientSDKVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PCSIdentityWrappersByServiceName, 0);
  objc_storeStrong((id *)&self->_cachedAccountDSID, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end