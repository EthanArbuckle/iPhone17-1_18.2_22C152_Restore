@interface HMDPersistentStore
+ (BOOL)archiveMetadata:(id)a3;
+ (BOOL)deserializeHomeData:(id *)a3 localStorage:(BOOL)a4 fromData:(id)a5;
+ (BOOL)deserializeHomeData:(id *)a3 usingLocalStorage:(BOOL)a4 fromData:(id)a5 forHH2Migration:(BOOL)a6;
+ (BOOL)hasControllerKeyWithUsername:(id)a3 error:(id *)a4;
+ (BOOL)removeLegacyHomeArchive:(id *)a3;
+ (BOOL)writeDictionary:(id)a3 toStorePath:(id)a4;
+ (id)_writeData:(id)a3 toStorePath:(id)a4 dataLabel:(id)a5;
+ (id)archiveCloudServerTokenData:(id)a3;
+ (id)archiveHomeData:(id)a3 toLocation:(id)a4;
+ (id)archiveHomeDataForTransaction:(id)a3;
+ (id)archiveHomeDataLegacy:(id)a3;
+ (id)archiveHomeDataLegacy:(id)a3 toLocation:(id)a4;
+ (id)archiveIDSDataSyncJournal:(id)a3;
+ (id)controllerUsernameForPairingIdentity:(id)a3 error:(id *)a4;
+ (id)decryptData:(id)a3 withKey:(id)a4 error:(id *)a5;
+ (id)decryptDataWithControllerKey:(id)a3 totalKeysFound:(unint64_t *)a4 deleteExtraKeys:(BOOL)a5 allowControllerIdentifierToChange:(BOOL)a6 controllerIdentifierChanged:(BOOL *)a7 successfulKeyUserName:(id *)a8 error:(id *)a9;
+ (id)encryptData:(id)a3 withKey:(id)a4 error:(id *)a5;
+ (id)encryptDataWithControllerKey:(id)a3 error:(id *)a4;
+ (id)loadBuiltinPlainMetadataDictionary;
+ (id)loadPlainMetadataDictionary;
+ (id)logCategory;
+ (id)readDataFromPath:(id)a3;
+ (id)serializeHomeData:(id)a3 localStorage:(BOOL)a4 remoteDeviceOnSameAccount:(BOOL)a5;
+ (id)unarchiveBulletinBoard;
+ (id)unarchiveHomeData:(id *)a3 decryptionFailed:(BOOL *)a4 fromLocation:(id)a5 successfulKeyUserName:(id *)a6 forHH2Migration:(BOOL)a7;
+ (id)unarchiveHomeData:(id *)a3 decryptionFailed:(BOOL *)a4 successfulKeyUserName:(id *)a5;
+ (id)unarchiveIDSDataSyncJournal;
+ (id)unarchiveVendorStore;
+ (id)writeData:(id)a3 toStorePath:(id)a4 dataLabel:(id)a5;
+ (void)archiveBulletinBoard:(id)a3;
+ (void)archiveVendorStore:(id)a3;
+ (void)cleanupKeysInStore;
+ (void)removeServerTokenDataFile;
+ (void)removeTransactionJournal;
+ (void)resetConfiguration:(unint64_t)a3;
- (id)archiveDictionary:(id)a3 withPath:(id)a4 forKey:(id)a5;
- (id)unarchiveDictionaryFromData:(id)a3 allowedClasses:(id)a4 forKey:(id)a5;
- (id)unarchiveDictionaryWithPath:(id)a3 allowedClasses:(id)a4 forKey:(id)a5;
- (id)writeData:(id)a3 toStorePath:(id)a4 dataLabel:(id)a5;
@end

@implementation HMDPersistentStore

+ (id)logCategory
{
  if (logCategory__hmf_once_t49 != -1) {
    dispatch_once(&logCategory__hmf_once_t49, &__block_literal_global_60954);
  }
  v2 = (void *)logCategory__hmf_once_v50;
  return v2;
}

uint64_t __33__HMDPersistentStore_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v50;
  logCategory__hmf_once_v50 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)controllerUsernameForPairingIdentity:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F5BE48] systemStore];
  id v28 = 0;
  id v29 = 0;
  int v8 = [v7 getAllAvailableControllerPublicKeys:&v29 secretKeys:0 userNames:&v28 error:a4];
  id v9 = v29;
  id v10 = v28;

  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = v11 || v10 == 0;
  if (v12 || (uint64_t v13 = [v10 count], v13 != objc_msgSend(v9, "count")))
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = a1;
    v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
LABEL_16:

      v19 = 0;
      goto LABEL_17;
    }
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v31 = v23;
    v24 = "%{public}@Unable to get controller public keys";
    v25 = v22;
    os_log_type_t v26 = OS_LOG_TYPE_INFO;
LABEL_15:
    _os_log_impl(&dword_1D49D5000, v25, v26, v24, buf, 0xCu);

    goto LABEL_16;
  }
  if ([v10 count] != 1)
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = a1;
    v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v31 = v23;
    v24 = "%{public}@Found multiple controller keys.";
    v25 = v22;
    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    goto LABEL_15;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F65510]);
  v15 = [v9 objectAtIndexedSubscript:0];
  v16 = (void *)[v14 initWithPairingKeyData:v15];

  v17 = [v6 publicKey];
  int v18 = [v16 isEqual:v17];

  v19 = 0;
  if (v18)
  {
    v19 = [v10 objectAtIndexedSubscript:0];
  }

LABEL_17:
  return v19;
}

+ (BOOL)hasControllerKeyWithUsername:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F5BE48] systemStore];
  id v24 = 0;
  id v25 = 0;
  int v8 = [v7 getAllAvailableControllerPublicKeys:0 secretKeys:0 userNames:&v25 error:&v24];
  id v9 = v25;
  id v10 = v24;

  if (v8) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11 || v9 == 0)
  {
    if (v10)
    {
      if (a4)
      {
        id v13 = v10;
LABEL_20:
        BOOL v18 = 0;
        *a4 = v13;
        goto LABEL_22;
      }
LABEL_21:
      BOOL v18 = 0;
      goto LABEL_22;
    }
LABEL_16:
    v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = a1;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Did not find controller key for given username.", buf, 0xCu);
    }
    if (a4)
    {
      id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (![v9 containsObject:v6]) {
    goto LABEL_16;
  }
  id v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = a1;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v27 = v17;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Found controller key for username", buf, 0xCu);
  }
  BOOL v18 = 1;
LABEL_22:

  return v18;
}

+ (id)decryptDataWithControllerKey:(id)a3 totalKeysFound:(unint64_t *)a4 deleteExtraKeys:(BOOL)a5 allowControllerIdentifierToChange:(BOOL)a6 controllerIdentifierChanged:(BOOL *)a7 successfulKeyUserName:(id *)a8 error:(id *)a9
{
  BOOL obj = a6;
  BOOL v9 = a5;
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  BOOL v12 = [MEMORY[0x1E4F1CA48] array];
  id v13 = [MEMORY[0x1E4F5BE48] systemStore];
  id v134 = 0;
  id v135 = 0;
  id v133 = 0;
  int v14 = [v13 getAllAvailableControllerPublicKeys:0 secretKeys:&v135 userNames:&v134 error:&v133];
  id v15 = v135;
  id v16 = v134;
  v17 = (id *)v133;

  if (v14) {
    BOOL v18 = v15 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  BOOL v19 = v18 || v16 == 0;
  if (v19 || (uint64_t v20 = [v16 count], v20 != objc_msgSend(v15, "count")))
  {
    v36 = (void *)MEMORY[0x1D9452090]();
    id v37 = a1;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v138 = v39;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Unable to get controller public keys", buf, 0xCu);
    }
    v35 = a9;
    if (a9)
    {
      v17 = v17;
      id v34 = 0;
      v35 = 0;
      *a9 = v17;
    }
    else
    {
      id v34 = 0;
    }
    goto LABEL_82;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a4) {
    *a4 = [v15 count];
  }
  if (!obj)
  {
    id v21 = [MEMORY[0x1E4F5BE48] systemStore];
    v22 = [v21 activeControllerPairingIdentifier];
    v23 = (void *)[v22 copy];

    if (!v23)
    {
      v40 = (void *)MEMORY[0x1D9452090]();
      id v41 = a1;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v138 = v43;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Cannot find controller key because active controller pairing identifier is not set", buf, 0xCu);
      }
      v44 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v45 = v44;
      if (a9) {
        *a9 = v44;
      }

      id v34 = 0;
      v35 = 0;
      goto LABEL_82;
    }
    BOOL v109 = v9;
    id v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    id v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    uint64_t v26 = [v16 indexOfObject:v23];
    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v112 = v15;
      id v116 = v16;
      id v27 = v11;
      uint64_t v28 = (void *)MEMORY[0x1D9452090]();
      id v29 = a1;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v138 = v31;
        __int16 v139 = 2112;
        v140 = v23;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Cannot find controller key for active controller pairing identifier, %@", buf, 0x16u);
      }
      uint64_t v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v33 = v32;
      if (a9) {
        *a9 = v32;
      }

      id v34 = 0;
      v35 = 0;
      id v11 = v27;
      id v16 = v116;
      id v15 = v112;
      goto LABEL_82;
    }
    uint64_t v46 = v26;
    v47 = [v16 objectAtIndexedSubscript:v26];
    [v25 addObject:v47];

    v48 = [v15 objectAtIndexedSubscript:v46];
    [v24 addObject:v48];

    uint64_t v49 = [v24 copy];
    uint64_t v50 = [v25 copy];

    id v16 = (id)v50;
    id v15 = (id)v49;
    BOOL v9 = v109;
  }
  if (![v15 count])
  {
    id v34 = 0;
    v51 = 0;
    if (![v12 count]) {
      goto LABEL_75;
    }
LABEL_72:
    v100 = (void *)MEMORY[0x1D9452090]();
    id v101 = a1;
    v102 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
    {
      v103 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v138 = v103;
      _os_log_impl(&dword_1D49D5000, v102, OS_LOG_TYPE_INFO, "%{public}@Data has not been decrypted, not deleting extra keys", buf, 0xCu);
    }
    v51 = 0;
LABEL_75:
    if (a9 && !v51)
    {
      v17 = v17;
      *a9 = v17;
    }
    goto LABEL_81;
  }
  BOOL v110 = v9;
  v51 = 0;
  id v34 = 0;
  unint64_t v52 = 0;
  v114 = v12;
  id v117 = v11;
  do
  {
    if (v51)
    {
      v119 = v51;
      v53 = (void *)MEMORY[0x1D9452090]();
      id v54 = a1;
      v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v57 = id v56 = v34;
        v58 = [v16 objectAtIndexedSubscript:v52];
        *(_DWORD *)buf = 138543618;
        v138 = v57;
        __int16 v139 = 2112;
        v140 = v58;
        _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@Data has already been decrypted, adding controller key: %@", buf, 0x16u);

        id v11 = v117;
        id v34 = v56;
        BOOL v12 = v114;
      }

      v59 = [v16 objectAtIndexedSubscript:v52];
      [v12 addObject:v59];
      v51 = v119;
      goto LABEL_50;
    }

    v60 = [v15 objectAtIndexedSubscript:v52];
    id v132 = 0;
    v61 = [a1 decryptData:v11 withKey:v60 error:&v132];
    v17 = (id *)v132;

    if (v17 || !v61)
    {
      v76 = (void *)MEMORY[0x1D9452090]();
      id v77 = a1;
      v78 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        v79 = HMFGetLogIdentifier();
        v80 = [v16 objectAtIndexedSubscript:v52];
        [v15 objectAtIndexedSubscript:v52];
        v121 = v76;
        id v81 = v15;
        id v82 = v16;
        v83 = (id *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v138 = v79;
        __int16 v139 = 2114;
        v140 = v80;
        __int16 v141 = 2114;
        v142 = v83;
        __int16 v143 = 2114;
        v144 = v17;
        _os_log_impl(&dword_1D49D5000, v78, OS_LOG_TYPE_INFO, "%{public}@Decryption failed with controller key: %{public}@, key:%{public}@ with error: %{public}@", buf, 0x2Au);

        id v16 = v82;
        id v15 = v81;
        v76 = v121;

        BOOL v12 = v114;
      }

      v59 = [v16 objectAtIndexedSubscript:v52];
      [v12 addObject:v59];
      v51 = 0;
      id v34 = v61;
      id v11 = v117;
      goto LABEL_50;
    }
    id v34 = v61;
    v17 = a8;
    if (obj)
    {
      v62 = (void *)MEMORY[0x1D9452090]();
      id v63 = a1;
      v64 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        v65 = HMFGetLogIdentifier();
        [v16 objectAtIndexedSubscript:v52];
        v120 = v62;
        id v66 = v11;
        id v67 = v15;
        id v68 = v16;
        v69 = v12;
        v71 = id v70 = v34;
        *(_DWORD *)buf = 138543618;
        v138 = v65;
        __int16 v139 = 2112;
        v140 = v71;
        _os_log_impl(&dword_1D49D5000, v64, OS_LOG_TYPE_INFO, "%{public}@Updating active controller identifier to %@", buf, 0x16u);

        id v34 = v70;
        BOOL v12 = v69;
        id v16 = v68;
        id v15 = v67;
        id v11 = v66;
        v62 = v120;

        v17 = a8;
      }

      v72 = [MEMORY[0x1E4F5BE48] systemStore];
      v73 = [v16 objectAtIndexedSubscript:v52];
      char v74 = [v72 updateActiveControllerPairingIdentifier:v73];

      if (a7) {
        *a7 = v74;
      }
    }
    if (v17)
    {
      v75 = v17;
      v59 = [v16 objectAtIndexedSubscript:v52];
      v17 = 0;
      id *v75 = (id)[v59 copy];
      v51 = v34;
LABEL_50:

      goto LABEL_51;
    }
    v51 = v34;
LABEL_51:
    ++v52;
  }
  while (v52 < [v15 count]);
  if (![v12 count]) {
    goto LABEL_75;
  }
  if (!v51) {
    goto LABEL_72;
  }
  if (v110)
  {
    v122 = v51;
    id v111 = v34;
    id v113 = v15;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id obja = v12;
    uint64_t v84 = [obja countByEnumeratingWithState:&v128 objects:v136 count:16];
    if (v84)
    {
      uint64_t v85 = v84;
      uint64_t v86 = *(void *)v129;
      do
      {
        uint64_t v87 = 0;
        v88 = v17;
        do
        {
          if (*(void *)v129 != v86) {
            objc_enumerationMutation(obja);
          }
          v89 = *(void **)(*((void *)&v128 + 1) + 8 * v87);
          v90 = (void *)MEMORY[0x1D9452090]();
          id v91 = a1;
          v92 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            v93 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v138 = v93;
            __int16 v139 = 2112;
            v140 = v89;
            _os_log_impl(&dword_1D49D5000, v92, OS_LOG_TYPE_INFO, "%{public}@Deleting extra key corresponding to username: %@", buf, 0x16u);
          }
          v94 = [MEMORY[0x1E4F5BE48] systemStore];
          v127 = v88;
          char v95 = [v94 removeControllerKeyPairForIdentifier:v89 leaveTombstone:1 error:&v127];
          v17 = v127;

          if ((v95 & 1) == 0)
          {
            v96 = (void *)MEMORY[0x1D9452090]();
            id v97 = v91;
            v98 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
            {
              v99 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v138 = v99;
              __int16 v139 = 2112;
              v140 = v89;
              __int16 v141 = 2112;
              v142 = v17;
              _os_log_impl(&dword_1D49D5000, v98, OS_LOG_TYPE_INFO, "%{public}@Failed to delete extra key for username: %@ due to error: %@", buf, 0x20u);
            }
          }
          ++v87;
          v88 = v17;
        }
        while (v85 != v87);
        uint64_t v85 = [obja countByEnumeratingWithState:&v128 objects:v136 count:16];
      }
      while (v85);
    }

    id v11 = v117;
    BOOL v12 = v114;
    id v34 = v111;
    id v15 = v113;
    v51 = v122;
    goto LABEL_75;
  }
  v104 = (void *)MEMORY[0x1D9452090]();
  id v105 = a1;
  v106 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v107 = v123 = v51;
    *(_DWORD *)buf = 138543362;
    v138 = v107;
    _os_log_impl(&dword_1D49D5000, v106, OS_LOG_TYPE_INFO, "%{public}@Not deleting extra keys as it has not been requested", buf, 0xCu);

    v51 = v123;
  }

LABEL_81:
  v35 = v51;
LABEL_82:

  return v35;
}

+ (id)encryptDataWithControllerKey:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F5BE48] systemStore];
  id v17 = 0;
  id v18 = 0;
  int v8 = [v7 getControllerPublicKey:0 secretKey:&v18 username:&v17 allowCreation:0 error:a4];
  id v9 = v18;
  id v10 = v17;

  if (v8)
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = a1;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Using key [%@] to encrypt the homedata and store it: %@", buf, 0x20u);
    }
    id v15 = [v12 encryptData:v6 withKey:v9 error:a4];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)decryptData:(id)a3 withKey:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [v7 length];
  unint64_t v10 = v9 - 28;
  if (v9 > 0x1C)
  {
    ccsha512_di();
    [v8 length];
    [v8 bytes];
    cchkdf();
    objc_msgSend(v7, "bytes", v33);
    id v18 = [MEMORY[0x1E4F1CA58] dataWithLength:v10];
    [v18 mutableBytes];
    int v19 = chacha20_poly1305_decrypt_all_96x32();
    if (v19)
    {
      if (a5)
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F28760];
        uint64_t v22 = v19;
        uint64_t v29 = *MEMORY[0x1E4F28568];
        uint64_t v23 = [NSString stringWithUTF8String:DebugGetErrorString()];
        id v24 = (void *)v23;
        uint64_t v25 = @"?";
        if (v23) {
          uint64_t v25 = (__CFString *)v23;
        }
        v30 = v25;
        uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        id v27 = [v20 errorWithDomain:v21 code:v22 userInfo:v26];
        *a5 = v27;

        a5 = 0;
      }
    }
    else
    {
      a5 = v18;
      id v18 = a5;
    }
  }
  else
  {
    if (a5)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28760];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      uint64_t v13 = [NSString stringWithUTF8String:DebugGetErrorString()];
      int v14 = (void *)v13;
      id v15 = @"?";
      if (v13) {
        id v15 = (__CFString *)v13;
      }
      uint64_t v32 = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id v17 = [v11 errorWithDomain:v12 code:-6743 userInfo:v16];
      *a5 = v17;

      a5 = 0;
    }
    id v18 = 0;
  }

  return a5;
}

+ (id)encryptData:(id)a3 withKey:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  ccsha512_di();
  [v6 length];
  id v8 = v6;
  [v8 bytes];

  cchkdf();
  RandomBytes();
  ccsha512_di();
  cchkdf();
  uint64_t v9 = objc_msgSend(v7, "length", &v15);
  id v10 = [MEMORY[0x1E4F1CA58] dataWithLength:v9 + 28];
  uint64_t v11 = [v10 mutableBytes];
  int v12 = v16;
  *(void *)uint64_t v11 = v15;
  *(_DWORD *)(v11 + 8) = v12;
  id v13 = v7;
  [v13 bytes];

  chacha20_poly1305_encrypt_all_96x32();
  return v10;
}

+ (id)unarchiveBulletinBoard
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](a1, a2);
  id v4 = (id)bulletinBoardDataStorePath;
  if (!v4)
  {
    id v7 = 0;
LABEL_12:
    int v14 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  id v6 = [a1 readDataFromPath:v4];
  if (v6)
  {
    id v16 = 0;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v16];
    id v8 = v16;
    if (v7)
    {
      int v9 = 0;
    }
    else
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = a1;
      int v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v18 = v13;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive bulletin board from data: %@", buf, 0x16u);
      }
      int v9 = 1;
    }
  }
  else
  {
    id v7 = 0;
    int v9 = 1;
  }

  if (v9) {
    goto LABEL_12;
  }
  id v7 = v7;
  int v14 = v7;
LABEL_14:

  return v14;
}

+ (void)archiveBulletinBoard:(id)a3
{
  id v8 = a3;
  id v4 = (void *)MEMORY[0x1D9452090]();
  v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
  id v6 = (id)bulletinBoardDataStorePath;
  id v7 = (id)[a1 _writeData:v5 toStorePath:v6 dataLabel:@"bulletin board"];
}

+ (id)unarchiveIDSDataSyncJournal
{
  v57[4] = *MEMORY[0x1E4F143B8];
  v44 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = (id)idsDataSyncJournalDataStorePath;
  uint64_t v5 = [a1 readDataFromPath:v4];

  if (!v5)
  {
LABEL_30:
    id v38 = 0;
    goto LABEL_32;
  }
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  v57[2] = objc_opt_class();
  v57[3] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:4];
  id v8 = [v6 setWithArray:v7];

  id v49 = 0;
  v43 = (void *)v5;
  int v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v5 error:&v49];
  id v42 = v49;
  if (v9)
  {
    id v10 = v9;
    objc_opt_class();
    int v11 = objc_opt_isKindOfClass() & 1;
    if (v11) {
      int v12 = v10;
    }
    else {
      int v12 = 0;
    }
    id v13 = v12;

    if (v11)
    {
      int v14 = objc_msgSend(v10, "hmf_dictionaryForKey:", @"kTransactionJournalKey");

      if (v14)
      {
        id v40 = v13;
        id v41 = v3;
        id v10 = v14;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v15 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v46 != v17) {
                objc_enumerationMutation(v10);
              }
              __int16 v19 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v20 = v19;
                uint64_t v21 = [v10 objectForKeyedSubscript:v20];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v22 = [MEMORY[0x1E4F1CA80] setWithSet:v21];
                  [v44 setObject:v22 forKeyedSubscript:v20];
                }
              }
            }
            uint64_t v16 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
          }
          while (v16);
        }

        int v23 = 0;
        v3 = v41;
        id v13 = v40;
      }
      else
      {
        id v10 = 0;
        int v23 = 0;
      }
    }
    else
    {
      v30 = v3;
      uint64_t v31 = (void *)MEMORY[0x1D9452090]();
      id v32 = a1;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = id v34 = v13;
        v36 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        unint64_t v52 = v35;
        __int16 v53 = 2112;
        id v54 = v36;
        __int16 v55 = 2112;
        id v56 = v10;
        id v37 = v36;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Object was not of expected class NSDictionary (class=%@): %@", buf, 0x20u);

        id v13 = v34;
      }

      int v23 = 1;
      v3 = v30;
    }

    id v27 = v42;
  }
  else
  {
    id v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = a1;
    uint64_t v26 = HMFGetOSLogHandle();
    id v27 = v42;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = uint64_t v28 = v3;
      *(_DWORD *)buf = 138543618;
      unint64_t v52 = v29;
      __int16 v53 = 2112;
      id v54 = v42;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive info dictionary from data: %@", buf, 0x16u);

      v3 = v28;
    }

    int v23 = 1;
  }

  if (v23) {
    goto LABEL_30;
  }
  id v38 = v44;
LABEL_32:

  return v38;
}

+ (id)archiveIDSDataSyncJournal:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = v6;
  if (v4)
  {
    [v6 setObject:v4 forKeyedSubscript:@"kTransactionJournalKey"];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    [v7 setObject:v8 forKeyedSubscript:@"kTransactionJournalKey"];
  }
  id v9 = (id)idsDataSyncJournalDataStorePath;
  id v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
  int v11 = [a1 _writeData:v10 toStorePath:v9 dataLabel:@"transactions journal"];

  return v11;
}

+ (void)removeTransactionJournal
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (id)transactionJournalDataStorePath;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = 0;
    char v7 = [v6 removeItemAtPath:v3 error:&v13];
    id v8 = v13;

    if ((v7 & 1) == 0)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = a1;
      int v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        id v17 = v3;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete file %@ due to error: %@", buf, 0x20u);
      }
    }
  }
}

+ (id)archiveCloudServerTokenData:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = v5;
  if (v4)
  {
    [v5 setObject:v4 forKeyedSubscript:@"kServerTokenDataBlobKey"];
  }
  else
  {
    char v7 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v7 forKeyedSubscript:@"kServerTokenDataBlobKey"];
  }
  id v8 = (id)serverTokenDataStorePath;
  id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  id v10 = [a1 _writeData:v9 toStorePath:v8 dataLabel:@"server token"];

  return v10;
}

+ (void)removeServerTokenDataFile
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (id)serverTokenDataStorePath;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = 0;
    char v7 = [v6 removeItemAtPath:v3 error:&v13];
    id v8 = v13;

    if ((v7 & 1) == 0)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = a1;
      int v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        id v17 = v3;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete file %@ due to error: %@", buf, 0x20u);
      }
    }
  }
}

+ (BOOL)archiveMetadata:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:*MEMORY[0x1E4F5BFB0]],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (char v7 = (void *)v6,
        [v5 objectForKeyedSubscript:*MEMORY[0x1E4F5BF80]],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = (id)configPlainMetadataPath;
    char v10 = [a1 writeDictionary:v5 toStorePath:v9];
  }
  else
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = a1;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive metadata dictionary %@", (uint8_t *)&v16, 0x16u);
    }
    char v10 = 0;
  }

  return v10;
}

+ (id)loadBuiltinPlainMetadataDictionary
{
  id v2 = (id)builtinConfigMetadataDictionaryPath;
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)loadPlainMetadataDictionary
{
  id v2 = (id)configPlainMetadataPath;
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)unarchiveVendorStore
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v3 = (id)configVendorIDStorePath;
  if (v3)
  {
    id v4 = [a1 readDataFromPath:v3];
    if (v4)
    {
      int v5 = (void *)MEMORY[0x1E4F1CAD0];
      v40[0] = objc_opt_class();
      v40[1] = objc_opt_class();
      v40[2] = objc_opt_class();
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
      char v7 = [v5 setWithArray:v6];

      id v33 = 0;
      id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v7 fromData:v4 error:&v33];
      id v9 = v33;
      if (v8)
      {
        id v10 = v8;
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
          int v14 = [v10 objectForKeyedSubscript:@"kApplicationVendorIDStoreDataKey"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v15 = v14;
          }
          else {
            uint64_t v15 = 0;
          }
          id v16 = v15;
        }
        else
        {
          id v25 = (void *)MEMORY[0x1D9452090]();
          id v26 = a1;
          id v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v28 = v32 = v25;
            uint64_t v29 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v35 = v28;
            __int16 v36 = 2112;
            id v37 = v29;
            __int16 v38 = 2112;
            id v39 = v10;
            id v30 = v29;
            _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Object was not of expected class NSDictionary (class=%@): %@", buf, 0x20u);

            id v25 = v32;
          }

          id v16 = 0;
        }
      }
      else
      {
        uint64_t v21 = (void *)MEMORY[0x1D9452090]();
        id v22 = a1;
        int v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v35 = v24;
          __int16 v36 = 2112;
          id v37 = v9;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive info dictionary from data: %@", buf, 0x16u);
        }
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = a1;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v35 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Unable to determine vendor store path", buf, 0xCu);
    }
    id v16 = 0;
  }

  return v16;
}

+ (void)archiveVendorStore:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)configVendorIDStorePath;
  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  if (v5)
  {
    uint64_t v21 = @"kApplicationVendorIDStoreDataKey";
    v22[0] = v4;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v8 = encodeRootObject();
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = a1;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v15 = 138543874;
      id v16 = v12;
      __int16 v17 = 2048;
      uint64_t v18 = [v8 length];
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Saving data file of length %tu at path %@", (uint8_t *)&v15, 0x20u);
    }
    id v13 = (id)[v10 _writeData:v8 toStorePath:v5 dataLabel:@"vendor id store"];
  }
  else
  {
    id v7 = a1;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v14;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Unable to determine vendor store path", (uint8_t *)&v15, 0xCu);
    }
  }
}

+ (id)archiveHomeData:(id)a3 toLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    int v11 = [a1 serializeHomeData:v6 localStorage:1 remoteDeviceOnSameAccount:0];
    if (v11
      && (uint64_t v15 = 0,
          [a1 encryptDataWithControllerKey:v11 error:&v15],
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v13 = (void *)v12;
      id v9 = [a1 _writeData:v12 toStorePath:v8 dataLabel:@"home data"];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

+ (id)archiveHomeDataLegacy:(id)a3 toLocation:(id)a4
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = (id)configProtectedDataStorePath;
  id v7 = [v5 archiveHomeData:v4 toLocation:v6];

  return v7;
}

+ (id)archiveHomeDataLegacy:(id)a3
{
  id v4 = a3;
  id v5 = (id)configProtectedDataStorePath;
  id v6 = [a1 archiveHomeDataLegacy:v4 toLocation:v5];

  return v6;
}

+ (id)archiveHomeDataForTransaction:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = [a1 serializeHomeData:v4 localStorage:1 remoteDeviceOnSameAccount:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)serializeHomeData:(id)a3 localStorage:(BOOL)a4 remoteDeviceOnSameAccount:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v73 = a4;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [v6 homes];

  if (v8)
  {
    id v9 = [v6 homes];
    [v7 setObject:v9 forKeyedSubscript:@"kHomesDataBlobKey"];
  }
  id v10 = [v6 primaryHomeUUID];

  if (v10)
  {
    int v11 = [v6 primaryHomeUUID];
    uint64_t v12 = [v11 UUIDString];
    [v7 setObject:v12 forKeyedSubscript:@"kPrimaryHomeUUIDKey"];
  }
  id v13 = [v6 lastCurrentHomeUUID];

  if (v13)
  {
    int v14 = [v6 lastCurrentHomeUUID];
    uint64_t v15 = [v14 UUIDString];
    [v7 setObject:v15 forKeyedSubscript:@"kLastCurrentHomeUUIDKey"];
  }
  id v16 = [v6 accessories];

  if (v16)
  {
    v71 = v7;
    __int16 v17 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v18 = [v6 accessories];
    v72 = objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    __int16 v19 = [v6 accessories];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v74 objects:v78 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v75 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(id *)(*((void *)&v74 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v25 = v24;
          }
          else {
            id v25 = 0;
          }
          id v26 = v25;

          id v27 = v24;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v28 = v27;
          }
          else {
            uint64_t v28 = 0;
          }
          id v29 = v28;

          BOOL v30 = !v73;
          if (!v29) {
            BOOL v30 = 0;
          }
          if (!v30 && v26) {
            [v72 addObject:v26];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v74 objects:v78 count:16];
      }
      while (v21);
    }

    uint64_t v31 = (void *)[v72 copy];
    id v7 = v71;
    [v71 setObject:v31 forKeyedSubscript:@"kAccessoriesDataBlobKey"];
  }
  id v32 = [v6 currentDevice];

  if (v32)
  {
    id v33 = [v6 currentDevice];
    [v7 setObject:v33 forKeyedSubscript:@"HM.currentDevice"];
  }
  id v34 = [v6 pendingReasonSaved];

  if (v34)
  {
    v35 = [v6 pendingReasonSaved];
    [v7 setObject:v35 forKeyedSubscript:@"HM.savedReasonsKey"];
  }
  __int16 v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "dataVersion"));
  [v7 setObject:v36 forKeyedSubscript:@"kHomeDataVersionKey"];

  id v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "schemaVersion"));
  [v7 setObject:v37 forKeyedSubscript:@"kHomeSchemaVersionKey"];

  __int16 v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "recoveryVersion"));
  [v7 setObject:v38 forKeyedSubscript:@"kHomeRecoveryVersionKey"];

  id v39 = [v6 dataTag];
  id v40 = [v39 UUIDString];
  [v7 setObject:v40 forKeyedSubscript:@"kHomeDataTagKey"];

  if (v73 || v5)
  {
    v43 = [v6 applicationData];

    if (v43)
    {
      v44 = [v6 applicationData];
      long long v45 = [v44 dictionary];
      [v7 setObject:v45 forKeyedSubscript:@"kApplicationDataKey"];
    }
    if (v73)
    {
      long long v46 = [v6 cloudZones];

      if (v46)
      {
        long long v47 = [v6 cloudZones];
        [v7 setObject:v47 forKeyedSubscript:@"kCloudZonesInformationKey"];
      }
      long long v48 = [v6 UUIDsOfRemovedHomes];
      uint64_t v49 = [v48 count];

      if (v49)
      {
        uint64_t v50 = [v6 UUIDsOfRemovedHomes];
        [v7 setObject:v50 forKeyedSubscript:@"kUuidsOfRemovedHomesKey"];
      }
      v51 = [v6 incomingInvitations];
      uint64_t v52 = [v51 count];

      if (v52)
      {
        __int16 v53 = [v6 incomingInvitations];
        [v7 setObject:v53 forKeyedSubscript:@"kIncomingHomeInvitationsKey"];
      }
      id v54 = [v6 pendingUserManagementOperations];

      if (v54)
      {
        __int16 v55 = [v6 pendingUserManagementOperations];
        [v7 setObject:v55 forKeyedSubscript:@"HM.userManagementPendingOperationsKey"];
      }
      id v56 = [v6 unprocessedOperationIdentifiers];

      if (v56)
      {
        v57 = [v6 unprocessedOperationIdentifiers];
        [v7 setObject:v57 forKeyedSubscript:@"kUserManagementUnprocessedOperationModelsKey"];
      }
      v58 = [v6 account];

      if (v58)
      {
        v59 = [v6 account];
        [v7 setObject:v59 forKeyedSubscript:@"HM.appleAccount"];

        v60 = [v6 primaryAccountHandle];
        [v7 setObject:v60 forKeyedSubscript:@"HM.primaryAccountHandle"];
      }
      v61 = [v6 remoteAccounts];

      if (v61)
      {
        v62 = [v6 remoteAccounts];
        [v7 setObject:v62 forKeyedSubscript:@"HM.remoteAccounts"];
      }
      if ([v6 residentEnabledState])
      {
        BOOL v63 = [v6 residentEnabledState] == 2;
        v64 = [NSNumber numberWithBool:v63];
        [v7 setObject:v64 forKeyedSubscript:@"kResidentEnabledKey"];
      }
      v65 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "accessAllowedWhenLocked"));
      [v7 setObject:v65 forKeyedSubscript:@"HM.accessAllowedWhenLocked"];

      id v66 = [v6 demoAccessories];

      if (v66)
      {
        id v67 = [v6 demoAccessories];
        [v7 setObject:v67 forKeyedSubscript:@"HM.demoAccessories"];
      }
      if ([v6 demoFinalized])
      {
        id v68 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "demoFinalized"));
        [v7 setObject:v68 forKeyedSubscript:@"HM.demoFinalized"];
      }
      id v41 = (void *)[v7 copy];
      uint64_t v42 = encodeRootObject();
    }
    else
    {
      id v41 = (void *)[v7 copy];
      uint64_t v42 = encodeRootObjectForRemoteDeviceOnSameAccountMigrateToHH2(v41, 0, 0);
    }
  }
  else
  {
    id v41 = (void *)[v7 copy];
    uint64_t v42 = encodeRootObjectForRemote(v41, 0, 0);
  }
  v69 = (void *)v42;

  return v69;
}

+ (void)resetConfiguration:(unint64_t)a3
{
  id v4 = +[HMDBackingStore flushBackingStore];
  if (a3 == 4) {
    uint64_t v5 = 128;
  }
  else {
    uint64_t v5 = -1;
  }
  +[HMDResetConfigPostCleanup writePostCleanupRecordWithReason:a3 steps:v5];
  +[HMDHH2FrameworkSwitch setHH2EnablementPreferenceKey:0];
}

+ (void)cleanupKeysInStore
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](a1, a2);
  id v4 = a1;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v64 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Cleaning up keys in keychain store", buf, 0xCu);
  }
  id v7 = (id)configProtectedDataStorePath;
  if (v7)
  {
    unint64_t v62 = 0;
    uint64_t v8 = [v4 readDataFromPath:v7];
    if (v8)
    {
      id v9 = (void *)v8;
      id v60 = 0;
      id v61 = 0;
      id v10 = [v4 decryptDataWithControllerKey:v8 totalKeysFound:&v62 deleteExtraKeys:0 allowControllerIdentifierToChange:1 controllerIdentifierChanged:0 successfulKeyUserName:&v61 error:&v60];
      id v11 = v61;
      id v12 = v60;
      id v50 = v11;
      if (v10)
      {

        if (v62 > 1)
        {
          v51 = v4;
          uint64_t v28 = [MEMORY[0x1E4F5BE48] systemStore];
          id v58 = v12;
          id v59 = 0;
          char v29 = [v28 getAllAvailableControllerPublicKeys:0 secretKeys:0 userNames:&v59 error:&v58];
          id v30 = v59;
          id v31 = v58;

          if (v29)
          {
            id v48 = v30;
            id v49 = v7;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            id obj = v30;
            uint64_t v32 = [obj countByEnumeratingWithState:&v54 objects:v71 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v55;
              do
              {
                for (uint64_t i = 0; i != v33; ++i)
                {
                  if (*(void *)v55 != v34) {
                    objc_enumerationMutation(obj);
                  }
                  __int16 v36 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                  if (([v36 isEqualToString:v11] & 1) == 0)
                  {
                    id v37 = [MEMORY[0x1E4F5BE48] systemStore];
                    id v53 = v31;
                    [v37 removeControllerKeyPairForIdentifier:v36 leaveTombstone:1 error:&v53];
                    id v38 = v53;

                    id v39 = (void *)MEMORY[0x1D9452090]();
                    id v40 = v51;
                    id v41 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v42 = HMFGetLogIdentifier();
                      v43 = HMFBooleanToString();
                      *(_DWORD *)buf = 138544130;
                      v64 = v42;
                      __int16 v65 = 2112;
                      unint64_t v66 = (unint64_t)v36;
                      __int16 v67 = 2112;
                      id v68 = v43;
                      __int16 v69 = 2112;
                      id v70 = v38;
                      _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Removal of controller key-pair for identifier: %@ result in %@, error %@", buf, 0x2Au);

                      id v11 = v50;
                    }

                    id v31 = v38;
                  }
                }
                uint64_t v33 = [obj countByEnumeratingWithState:&v54 objects:v71 count:16];
              }
              while (v33);
            }

            id v30 = v48;
            id v7 = v49;
          }
          else
          {
            v44 = (void *)MEMORY[0x1D9452090]();
            id v45 = v51;
            long long v46 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              long long v47 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v64 = v47;
              __int16 v65 = 2112;
              unint64_t v66 = (unint64_t)v31;
              _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Could not get all the controller public keys: %@", buf, 0x16u);
            }
            id v11 = v50;
          }

          id v12 = v31;
          goto LABEL_34;
        }
        id v13 = (void *)MEMORY[0x1D9452090]();
        id v14 = v4;
        uint64_t v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          id v16 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v64 = v16;
          __int16 v65 = 2048;
          unint64_t v66 = v62;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@There are only %tu keys in the store", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v21 = MEMORY[0x1D9452090]();
        uint64_t v22 = v4;
        int v23 = (void *)v21;
        id v24 = v22;
        id v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = id v26 = v7;
          *(_DWORD *)buf = 138543618;
          v64 = v27;
          __int16 v65 = 2112;
          unint64_t v66 = (unint64_t)v12;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Failed to decrypt data: %@", buf, 0x16u);

          id v7 = v26;
        }
      }
      id v11 = v50;
LABEL_34:
    }
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = v4;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v64 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Failed to get the protected store path", buf, 0xCu);
    }
  }
}

+ (id)unarchiveHomeData:(id *)a3 decryptionFailed:(BOOL *)a4 fromLocation:(id)a5 successfulKeyUserName:(id *)a6 forHH2Migration:(BOOL)a7
{
  uint64_t v7 = a7;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = v12;
  if (a4) {
    *a4 = 0;
  }
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = (id)configProtectedDataStorePath;
    if (!v14)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      __int16 v17 = (void *)[v32 initWithDomain:*MEMORY[0x1E4F281F8] code:258 userInfo:0];
      goto LABEL_30;
    }
  }
  id v42 = 0;
  uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v14 options:2 error:&v42];
  id v16 = v42;
  __int16 v17 = v16;
  if (v15)
  {
    id v37 = a3;
    id v40 = 0;
    unint64_t v41 = 0;
    id v39 = v16;
    id v18 = [a1 decryptDataWithControllerKey:v15 totalKeysFound:&v41 deleteExtraKeys:0 allowControllerIdentifierToChange:1 controllerIdentifierChanged:0 successfulKeyUserName:&v40 error:&v39];
    id v19 = v40;
    id v38 = v39;

    if (v18)
    {
      if (v41 >= 2)
      {
        unsigned int v36 = v7;
        id v20 = (id)serverTokenDataStorePath;
        uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
        v35 = v20;
        LODWORD(v20) = [v21 fileExistsAtPath:v20];

        if (v20)
        {
          uint64_t v22 = (void *)MEMORY[0x1D9452090]();
          id v23 = a1;
          id v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            id v25 = v34 = v22;
            *(_DWORD *)buf = 138543618;
            v44 = v25;
            __int16 v45 = 2048;
            unint64_t v46 = v41;
            _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@We have %lu controller keys on boot, nuking server token data to help autocorrect on next fetch", buf, 0x16u);

            uint64_t v22 = v34;
          }

          id v26 = (id)[v23 archiveCloudServerTokenData:0];
          id v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v27 postNotificationName:@"kCloudServerTokenDataResetNotification" object:v23];
        }
        else if (a6 && v41 == 1)
        {
          *a6 = v19;
        }

        uint64_t v7 = v36;
      }

      if ([a1 deserializeHomeData:v37 usingLocalStorage:1 fromData:v18 forHH2Migration:v7])
      {
        __int16 v17 = 0;
      }
      else
      {
        if (a4) {
          *a4 = 1;
        }
        __int16 v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:52 userInfo:0];
      }
    }
    else
    {
      if (a4) {
        *a4 = 1;
      }

      id v18 = 0;
      __int16 v17 = v38;
    }
  }
  else
  {
    uint64_t v28 = (void *)MEMORY[0x1D9452090]();
    id v29 = a1;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v44 = v31;
      __int16 v45 = 2112;
      unint64_t v46 = (unint64_t)v14;
      __int16 v47 = 2112;
      id v48 = v17;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to load data store from file path %@: %@", buf, 0x20u);
    }
    id v18 = 0;
  }

LABEL_30:
  return v17;
}

+ (id)unarchiveHomeData:(id *)a3 decryptionFailed:(BOOL *)a4 successfulKeyUserName:(id *)a5
{
  uint64_t v8 = objc_opt_class();
  return (id)[v8 unarchiveHomeData:a3 decryptionFailed:a4 fromLocation:0 successfulKeyUserName:a5 forHH2Migration:0];
}

+ (BOOL)removeLegacyHomeArchive:(id *)a3
{
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = (id)configProtectedDataStorePath;
  int v6 = [v4 fileExistsAtPath:v5];

  if (!v6) {
    return 1;
  }
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = (id)configProtectedDataStorePath;
  char v9 = [v7 removeItemAtPath:v8 error:a3];

  return v9;
}

+ (BOOL)deserializeHomeData:(id *)a3 usingLocalStorage:(BOOL)a4 fromData:(id)a5 forHH2Migration:(BOOL)a6
{
  BOOL v6 = a4;
  v95[18] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = v9;
  char isKindOfClass = 0;
  if (a3 && v9)
  {
    BOOL v80 = v6;
    *a3 = 0;
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    v95[0] = objc_opt_class();
    v95[1] = objc_opt_class();
    v95[2] = objc_opt_class();
    v95[3] = objc_opt_class();
    v95[4] = objc_opt_class();
    v95[5] = objc_opt_class();
    v95[6] = objc_opt_class();
    v95[7] = objc_opt_class();
    v95[8] = objc_opt_class();
    v95[9] = objc_opt_class();
    v95[10] = objc_opt_class();
    v95[11] = objc_opt_class();
    v95[12] = objc_opt_class();
    v95[13] = objc_opt_class();
    v95[14] = objc_opt_class();
    v95[15] = objc_opt_class();
    v95[16] = objc_opt_class();
    v95[17] = objc_opt_class();
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:18];
    id v14 = [v12 setWithArray:v13];

    id v87 = 0;
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v10 error:&v87];
    id v16 = v87;
    [v15 _allowDecodingCyclesInSecureMode];
    uint64_t v17 = *MEMORY[0x1E4F284E8];
    id v86 = v16;
    id v18 = [v15 decodeTopLevelObjectOfClasses:v14 forKey:v17 error:&v86];
    id v19 = v86;

    if (v18)
    {
      id v79 = v19;
      id v20 = v18;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = 0;
      }
      id v22 = v21;

      if (isKindOfClass)
      {
        long long v76 = v18;
        v78 = v14;
        id v23 = objc_alloc_init(HMDMutableHomeData);
        id v24 = objc_msgSend(v20, "hmf_arrayForKey:", @"kAccessoriesDataBlobKey");
        [(HMDHomeData *)v23 setAccessories:v24];

        id v25 = objc_msgSend(v20, "hmf_arrayForKey:", @"kHomesDataBlobKey");
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v82 objects:v88 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v83;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v83 != v28) {
                objc_enumerationMutation(v25);
              }
              objc_msgSend(*(id *)(*((void *)&v82 + 1) + 8 * i), "_removeCorruptAccessories", v76);
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v82 objects:v88 count:16];
          }
          while (v27);
        }
        -[HMDHomeData setHomes:](v23, "setHomes:", v25, v76);
        id v30 = objc_msgSend(v22, "hmf_UUIDForKey:", @"kPrimaryHomeUUIDKey");
        [(HMDHomeData *)v23 setPrimaryHomeUUID:v30];

        id v31 = objc_msgSend(v22, "hmf_UUIDForKey:", @"kLastCurrentHomeUUIDKey");
        [(HMDHomeData *)v23 setLastCurrentHomeUUID:v31];

        if (v80)
        {
          id v32 = objc_msgSend(v22, "hmf_arrayForKey:", @"kUuidsOfRemovedHomesKey");
          [(HMDHomeData *)v23 setUUIDsOfRemovedHomes:v32];

          uint64_t v33 = objc_msgSend(v22, "hmf_arrayForKey:", @"kIncomingHomeInvitationsKey");
          [(HMDHomeData *)v23 setIncomingInvitations:v33];
        }
        uint64_t v34 = objc_msgSend(v22, "hmf_dictionaryForKey:", @"kZonesInformationKey");
        if (v34) {
          +[HMDCloudZoneInformation cloudZonesWithDictionary:v34];
        }
        else {
        uint64_t v49 = objc_msgSend(v22, "hmf_arrayForKey:", @"kCloudZonesInformationKey");
        }
        [(HMDHomeData *)v23 setCloudZones:v49];

        id v50 = objc_msgSend(v22, "hmf_numberForKey:", @"kHomeSchemaVersionKey");
        v51 = v50;
        if (v50) {
          -[HMDHomeData setSchemaVersion:](v23, "setSchemaVersion:", [v50 integerValue]);
        }

        uint64_t v52 = objc_msgSend(v22, "hmf_numberForKey:", @"kHomeDataVersionKey");
        id v53 = v52;
        if (v52) {
          -[HMDHomeData setDataVersion:](v23, "setDataVersion:", [v52 integerValue]);
        }

        long long v54 = objc_msgSend(v22, "hmf_numberForKey:", @"kHomeRecoveryVersionKey");
        long long v55 = v54;
        if (v54) {
          -[HMDHomeData setRecoveryVersion:](v23, "setRecoveryVersion:", [v54 integerValue]);
        }

        long long v56 = objc_msgSend(v22, "hmf_UUIDForKey:", @"kHomeDataTagKey");
        if (v56)
        {
          [(HMDHomeData *)v23 setDataTag:v56];
        }
        else
        {
          long long v57 = [MEMORY[0x1E4F29128] UUID];
          [(HMDHomeData *)v23 setDataTag:v57];
        }
        if (v80)
        {
          id v58 = objc_msgSend(v22, "hmf_arrayForKey:", @"HM.userManagementPendingOperationsKey");
          if (v58)
          {
            [(HMDHomeData *)v23 setPendingUserManagementOperations:v58];
          }
          else
          {
            id v59 = objc_msgSend(v22, "hmf_arrayForKey:", @"kUserManagementOperationsKey");
            [(HMDHomeData *)v23 setPendingUserManagementOperations:v59];
          }
        }
        id v60 = objc_msgSend(v22, "hmf_arrayForKey:", @"kUserManagementUnprocessedOperationModelsKey");
        [(HMDHomeData *)v23 setUnprocessedOperationIdentifiers:v60];

        id v61 = objc_msgSend(v22, "hmf_dictionaryForKey:", @"kApplicationDataKey");
        unint64_t v62 = [HMDApplicationData alloc];
        BOOL v63 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
        v64 = [(HMDApplicationData *)v62 initWithDictionary:v61 parentUUID:v63];

        [(HMDHomeData *)v23 setApplicationData:v64];
        buf[0] = 0;
        int v65 = objc_msgSend(v22, "hmf_BOOLForKey:isPresent:", @"kResidentEnabledKey", buf);
        uint64_t v66 = 1;
        if (v65) {
          uint64_t v66 = 2;
        }
        if (buf[0]) {
          uint64_t v67 = v66;
        }
        else {
          uint64_t v67 = 0;
        }
        [(HMDHomeData *)v23 setResidentEnabledState:v67];
        if (v80)
        {
          id v68 = [v22 objectForKey:@"HM.appleAccount"];
          [(HMDHomeData *)v23 setAccount:v68];

          __int16 v69 = objc_msgSend(v22, "hmf_arrayForKey:", @"HM.remoteAccounts");
          [(HMDHomeData *)v23 setRemoteAccounts:v69];

          id v70 = [v22 objectForKey:@"HM.primaryAccountHandle"];
          [(HMDHomeData *)v23 setPrimaryAccountHandle:v70];
        }
        v71 = [v22 objectForKey:@"HM.currentDevice"];
        [(HMDHomeData *)v23 setCurrentDevice:v71];

        uint64_t v72 = [v22 objectForKey:@"HM.savedReasonsKey"];
        [(HMDHomeData *)v23 setPendingReasonSaved:v72];

        buf[0] = 0;
        uint64_t v73 = objc_msgSend(v22, "hmf_BOOLForKey:isPresent:", @"HM.accessAllowedWhenLocked", buf);
        id v18 = v77;
        id v19 = v79;
        if (!buf[0]) {
          uint64_t v73 = isiOSDevice();
        }
        [(HMDHomeData *)v23 setAccessAllowedWhenLocked:v73];
        long long v74 = [v22 objectForKey:@"HM.demoAccessories"];
        [(HMDHomeData *)v23 setDemoAccessories:v74];

        -[HMDHomeData setDemoFinalized:](v23, "setDemoFinalized:", objc_msgSend(v22, "hmf_BOOLForKey:", @"HM.demoFinalized"));
        *a3 = (id)[(HMDMutableHomeData *)v23 copy];

        id v14 = v78;
      }
      else
      {
        unint64_t v41 = (void *)MEMORY[0x1D9452090]();
        id v42 = a1;
        v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v81 = v15;
          v44 = v18;
          unint64_t v46 = v45 = v14;
          __int16 v47 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v90 = v46;
          __int16 v91 = 2112;
          v92 = v47;
          __int16 v93 = 2112;
          id v94 = v20;
          id v48 = v47;
          _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Object was not of expected class NSDictionary (class=%@): %@", buf, 0x20u);

          id v14 = v45;
          id v18 = v44;
          uint64_t v15 = v81;
        }

        id v19 = v79;
      }
    }
    else
    {
      v35 = (void *)MEMORY[0x1D9452090]();
      id v36 = a1;
      id v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        id v38 = HMFGetLogIdentifier();
        HMFBooleanToString();
        id v40 = v39 = v19;
        *(_DWORD *)buf = 138543874;
        v90 = v38;
        __int16 v91 = 2112;
        v92 = v40;
        __int16 v93 = 2112;
        id v94 = v39;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive home data from keyed archive: HH2 Migration: %@ / error: %@", buf, 0x20u);

        id v19 = v39;
      }

      char isKindOfClass = 0;
    }
  }
  return isKindOfClass & 1;
}

+ (BOOL)deserializeHomeData:(id *)a3 localStorage:(BOOL)a4 fromData:(id)a5
{
  uint64_t v5 = a4;
  id v7 = a5;
  LOBYTE(v5) = [(id)objc_opt_class() deserializeHomeData:a3 usingLocalStorage:v5 fromData:v7 forHH2Migration:0];

  return v5;
}

+ (BOOL)writeDictionary:(id)a3 toStorePath:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  if (!v6 || !v7)
  {
    id v10 = a1;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@### Failed to save dictionary %@ to path %@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  id v18 = 0;
  id v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v18];
  id v10 = v18;
  if (!v9)
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = a1;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      id v20 = v16;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@### Failed to save dictionary %@ to path %@ error %@", buf, 0x2Au);
    }
    id v9 = 0;
LABEL_10:
    char v11 = 0;
    goto LABEL_11;
  }
  char v11 = [v9 writeToFile:v7 atomically:1];
LABEL_11:

  return v11;
}

+ (id)_writeData:(id)a3 toStorePath:(id)a4 dataLabel:(id)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v37 = *MEMORY[0x1E4F28330];
  v38[0] = &unk_1F2DC7F00;
  char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v12 createFileAtPath:v9 contents:0 attributes:v11] & 1) == 0) {
    [v12 setAttributes:v11 ofItemAtPath:v9 error:0];
  }
  id v28 = 0;
  [v8 writeToFile:v9 options:1073741825 error:&v28];
  id v13 = v28;
  if (v13)
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = a1;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      id v25 = v8;
      uint64_t v18 = [v13 code];
      [v13 localizedDescription];
      v19 = id v26 = v14;
      *(_DWORD *)buf = 138544130;
      id v30 = v17;
      __int16 v31 = 2112;
      id v32 = v10;
      __int16 v33 = 2048;
      uint64_t v34 = v18;
      id v8 = v25;
      __int16 v35 = 2112;
      id v36 = v19;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Archive %@ error %ld:%@", buf, 0x2Au);

      id v14 = v26;
    }
  }
  uint64_t v27 = 0;
  id v20 = [v12 attributesOfItemAtPath:v9 error:&v27];
  __int16 v21 = v20;
  if (v20)
  {
    uint64_t v22 = [v20 fileSize];
    __int16 v23 = [NSNumber numberWithUnsignedLongLong:v22];
  }
  else
  {
    __int16 v23 = 0;
  }

  return v23;
}

+ (id)writeData:(id)a3 toStorePath:(id)a4 dataLabel:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v13 = MEMORY[0x1D94505D0](a1, a2);
  id v16 = (void *)[v12 initWithName:v13];

  id v14 = [a1 _writeData:v9 toStorePath:v10 dataLabel:v11];
  __HMFActivityScopeLeave();

  return v14;
}

+ (id)readDataFromPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v13 = 0;
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4 options:2 error:&v13];
  id v6 = v13;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to load data store from file path %@: %@", buf, 0x20u);
    }
  }

  return v5;
}

- (id)unarchiveDictionaryFromData:(id)a3 allowedClasses:(id)a4 forKey:(id)a5
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  id v12 = [v10 setByAddingObjectsFromArray:v11];

  id v23 = 0;
  id v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v12 fromData:v8 error:&v23];
  id v14 = v23;
  if (v13)
  {
    id v15 = [v13 objectForKey:v9];
    if (v15) {
      goto LABEL_9;
    }
    __int16 v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v19;
      __int16 v26 = 2112;
      id v27 = v9;
      uint64_t v20 = "%{public}@Key %@ not found in unarchived data";
LABEL_7:
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);
    }
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x1D9452090]();
    __int16 v21 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v19;
      __int16 v26 = 2112;
      id v27 = v14;
      uint64_t v20 = "%{public}@Failed to unarchive data: %@";
      goto LABEL_7;
    }
  }

  id v15 = 0;
LABEL_9:

  return v15;
}

- (id)unarchiveDictionaryWithPath:(id)a3 allowedClasses:(id)a4 forKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = [(id)objc_opt_class() readDataFromPath:v8];
  if (v12 || [0 length])
  {
    id v13 = [(HMDPersistentStore *)self unarchiveDictionaryFromData:v12 allowedClasses:v9 forKey:v10];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)archiveDictionary:(id)a3 withPath:(id)a4 forKey:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  context = (void *)MEMORY[0x1D9452090]();
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  id v12 = v11;
  if (v8)
  {
    [v11 setObject:v8 forKeyedSubscript:v10];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1CA98] null];
    [v12 setObject:v13 forKeyedSubscript:v10];
  }
  id v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
  id v15 = [NSString stringWithFormat:@"archive data with path: %@", v9];
  __int16 v16 = [(id)objc_opt_class() _writeData:v14 toStorePath:v9 dataLabel:v15];
  id v17 = (void *)MEMORY[0x1D9452090]();
  __int16 v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v23 = v8;
    __int16 v21 = v20 = v10;
    *(_DWORD *)buf = 138543874;
    __int16 v26 = v21;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2112;
    id v30 = v16;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@HMDPersistentStore %@ with size: %@", buf, 0x20u);

    id v10 = v20;
    id v8 = v23;
  }

  return v16;
}

- (id)writeData:(id)a3 toStorePath:(id)a4 dataLabel:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() writeData:v9 toStorePath:v8 dataLabel:v7];

  return v10;
}

@end