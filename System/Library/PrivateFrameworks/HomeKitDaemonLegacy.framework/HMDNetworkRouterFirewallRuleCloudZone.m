@interface HMDNetworkRouterFirewallRuleCloudZone
+ (BOOL)__verifyDataFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 dataKey:(id)a5 dataAssetKey:(id)a6 maxDataSize:(unint64_t)a7 signatureKey:(id)a8 signatureAssetKey:(id)a9 maxSignatureSize:(unint64_t)a10 baseAccessoryIdentifier:(id *)a11 data:(id *)a12 error:(id *)a13;
+ (BOOL)__verifyDigestDataAgainstSignatureFromRecord:(id)a3 digestData:(id)a4 signatureData:(id)a5 signatureVerificationPublicKeys:(id)a6 error:(id *)a7;
+ (BOOL)verifyNetworkDeclarationsFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 baseAccessoryIdentifier:(id *)a5 data:(id *)a6 error:(id *)a7;
+ (BOOL)verifyNetworkDeclarationsFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 error:(id *)a5;
+ (BOOL)verifyPairedMetadataFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 error:(id *)a5;
+ (id)__calculateDigestDataFromRecord:(id)a3 dataKey:(id)a4 dataAssetKey:(id)a5 maxDataSize:(unint64_t)a6 error:(id *)a7;
+ (id)__createBaseAccessoryIdentifierFromRecord:(id)a3 error:(id *)a4;
+ (id)__getDataFromRecord:(id)a3 dataKey:(id)a4 dataAssetKey:(id)a5 maxDataSize:(unint64_t)a6 error:(id *)a7;
+ (id)__getSignatureDataFromRecord:(id)a3 signatureKey:(id)a4 signatureAssetKey:(id)a5 maxSignatureSize:(unint64_t)a6 error:(id *)a7;
+ (unint64_t)__maxSizeForCKRecordNetworkDeclarations;
+ (unint64_t)__maxSizeForCKRecordNetworkDeclarationsSignature;
+ (unint64_t)__maxSizeForCKRecordPairedMetadata;
+ (unint64_t)__maxSizeForCKRecordPairedMetadataSignature;
+ (unint64_t)__maxSizeForCKRecordString;
+ (unint64_t)__maxSizeFromPreferenceWithKey:(id)a3 defaultValue:(unint64_t)a4;
- (BOOL)__canRecoverFromError:(id)a3 fetchInfo:(id)a4;
- (BOOL)__commitLocalChanges:(id)a3 error:(id *)a4;
- (BOOL)useAnonymousRequests;
- (HMDNetworkRouterFirewallRuleCloudZone)initWithCloudDatabase:(id)a3 state:(id)a4 useAnonymousRequests:(BOOL)a5 watchedRecordIDs:(id)a6 signatureVerificationPublicKeys:(id)a7;
- (NSArray)signatureVerificationPublicKeys;
- (NSMutableSet)uncommittedModifiedRecordIDsFromLastPull;
- (NSSet)modifiedRecordIDsFromLastPull;
- (NSSet)watchedRecordIDs;
- (id)attributeDescriptions;
- (id)decodeModelFrom:(id)a3 recordSource:(unint64_t)a4 error:(id *)a5;
- (id)fetchChangesWithToken:(id)a3 options:(id)a4;
- (void)__fetchZoneChangesWithFetchInfo:(id)a3;
- (void)__finalizeUpdatedRecordIDs;
- (void)__noteUpdatedRecordID:(id)a3;
- (void)__recordChanged:(id)a3 fetchInfo:(id)a4;
- (void)__recordDeleted:(id)a3 recordType:(id)a4 fetchInfo:(id)a5;
- (void)__retryFetchWithFetchInfo:(id)a3;
- (void)__zoneChangeTokensUpdated:(id)a3 fetchInfo:(id)a4;
- (void)__zoneChangesCompleted:(id)a3 fetchInfo:(id)a4;
- (void)__zoneFetchCompletedWithChangeToken:(id)a3 error:(id)a4 moreComing:(BOOL)a5 fetchInfo:(id)a6;
- (void)setModifiedRecordIDsFromLastPull:(id)a3;
- (void)setUncommittedModifiedRecordIDsFromLastPull:(id)a3;
- (void)startUpWithLocalZone:(id)a3;
@end

@implementation HMDNetworkRouterFirewallRuleCloudZone

- (id)decodeModelFrom:(id)a3 recordSource:(unint64_t)a4 error:(id *)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = objc_opt_class();
  v9 = [(HMDNetworkRouterFirewallRuleCloudZone *)self signatureVerificationPublicKeys];
  id v81 = 0;
  id v82 = 0;
  LODWORD(v8) = [v8 verifyNetworkDeclarationsFromRecord:v7 signatureVerificationPublicKeys:v9 baseAccessoryIdentifier:&v82 data:&v81 error:a5];
  id v10 = v82;
  unint64_t v11 = (unint64_t)v81;

  if (!v8)
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    v14 = objc_opt_class();
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = id v64 = v10;
      [v7 recordID];
      v71 = v7;
      v17 = unint64_t v75 = v11;
      v18 = [v17 zoneID];
      [v18 zoneName];
      v20 = v19 = a5;
      [v71 recordID];
      v21 = v67 = v13;
      v22 = [v21 recordName];
      id v23 = *v19;
      *(_DWORD *)buf = 138544130;
      v84 = v16;
      __int16 v85 = 2112;
      v86 = v20;
      __int16 v87 = 2112;
      v88 = v22;
      __int16 v89 = 2112;
      id v90 = v23;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Signature verification of fetched network declarations failed for record %@/%@ with error %@", buf, 0x2Au);

      v13 = v67;
      a5 = v19;

      id v7 = v71;
      unint64_t v11 = v75;

      id v10 = v64;
    }

LABEL_7:
    v24 = objc_opt_class();
    v25 = [(HMDNetworkRouterFirewallRuleCloudZone *)self signatureVerificationPublicKeys];
    uint64_t v26 = objc_msgSend((id)objc_opt_class(), "__maxSizeForCKRecordPairedMetadata");
    id v79 = 0;
    id v80 = v10;
    LODWORD(v24) = objc_msgSend(v24, "__verifyDataFromRecord:signatureVerificationPublicKeys:dataKey:dataAssetKey:maxDataSize:signatureKey:signatureAssetKey:maxSignatureSize:baseAccessoryIdentifier:data:error:", v7, v25, @"CD_pairedMetadata", @"CD_pairedMetadata_ckAsset", v26, @"CD_pairedMetadataSignature", @"CD_pairedMetadataSignature_ckAsset", objc_msgSend((id)objc_opt_class(), "__maxSizeForCKRecordPairedMetadataSignature"), &v80, &v79, a5);
    id v27 = v80;

    unint64_t v28 = (unint64_t)v79;
    if (v24)
    {
      v29 = [[HMDCloudPairedMetadata alloc] initWithBaseAccessoryIdentifier:v27 data:v28];
      if (!v29)
      {
        v52 = (void *)MEMORY[0x1D9452090]();
        v53 = objc_opt_class();
        v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v55 = unint64_t v78 = v11;
          [v7 recordID];
          v56 = v66 = v52;
          [v56 zoneID];
          id v74 = v27;
          v58 = v57 = v7;
          v59 = [v58 zoneName];
          [v57 recordID];
          v60 = v70 = a5;
          v61 = [v60 recordName];
          *(_DWORD *)buf = 138543874;
          v84 = v55;
          __int16 v85 = 2112;
          v86 = v59;
          __int16 v87 = 2112;
          v88 = v61;
          _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_ERROR, "%{public}@Fetched Paired metadata failed to parse for record %@/%@", buf, 0x20u);

          a5 = v70;
          id v7 = v57;
          id v27 = v74;

          v52 = v66;
          unint64_t v11 = v78;
        }

        if (a5)
        {
          [MEMORY[0x1E4F28C58] hmErrorWithCode:43];
          v41 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
LABEL_23:
        v41 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      unint64_t v76 = v11;
      v30 = (void *)MEMORY[0x1D9452090]();
      v31 = objc_opt_class();
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v63 = HMFGetLogIdentifier();
        v65 = [v7 recordID];
        v33 = [v65 zoneID];
        [v33 zoneName];
        v34 = v68 = v30;
        v35 = [v7 recordID];
        [v35 recordName];
        v36 = id v72 = v27;
        id v37 = *a5;
        *(_DWORD *)buf = 138544130;
        v84 = v63;
        __int16 v85 = 2112;
        v86 = v34;
        __int16 v87 = 2112;
        v88 = v36;
        __int16 v89 = 2112;
        id v90 = v37;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Signature verification of fetched Paired metadata failed for record %@/%@ with error %@", buf, 0x2Au);

        id v27 = v72;
        v30 = v68;
      }
      unint64_t v11 = v76;
    }
    if (v11 | v28)
    {
      v38 = [HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel alloc];
      v39 = [(HMBCloudZone *)self cloudZoneID];
      v40 = [v7 recordID];
      v41 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *)v38 initWithCloudZoneID:v39 recordID:v40 networkDeclarationsData:v11 pairedMetadataData:v28];

LABEL_24:
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  v12 = [[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc] initWithBaseAccessoryIdentifier:v10 data:v11];
  if (v12)
  {

    goto LABEL_7;
  }
  v42 = (void *)MEMORY[0x1D9452090]();
  v43 = objc_opt_class();
  v44 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    v45 = HMFGetLogIdentifier();
    [v7 recordID];
    v46 = v73 = v42;
    [v46 zoneID];
    v69 = a5;
    v47 = unint64_t v77 = v11;
    [v47 zoneName];
    v49 = v48 = v7;
    v50 = [v48 recordID];
    v51 = [v50 recordName];
    *(_DWORD *)buf = 138543874;
    v84 = v45;
    __int16 v85 = 2112;
    v86 = v49;
    __int16 v87 = 2112;
    v88 = v51;
    _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Fetched network declarations failed to parse for record %@/%@", buf, 0x20u);

    id v7 = v48;
    unint64_t v11 = v77;
    a5 = v69;

    v42 = v73;
  }

  if (a5)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:43];
    v41 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = 0;
  }
  id v27 = v10;
LABEL_25:

  return v41;
}

+ (BOOL)verifyPairedMetadataFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v11 = 0;
  id v12 = 0;
  LOBYTE(a5) = objc_msgSend(a1, "__verifyDataFromRecord:signatureVerificationPublicKeys:dataKey:dataAssetKey:maxDataSize:signatureKey:signatureAssetKey:maxSignatureSize:baseAccessoryIdentifier:data:error:", v9, v8, @"CD_pairedMetadata", @"CD_pairedMetadata_ckAsset", objc_msgSend(a1, "__maxSizeForCKRecordPairedMetadata"), @"CD_pairedMetadataSignature", @"CD_pairedMetadataSignature_ckAsset", objc_msgSend(a1, "__maxSizeForCKRecordPairedMetadataSignature"), &v12, &v11, a5);

  return (char)a5;
}

+ (BOOL)verifyNetworkDeclarationsFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 error:(id *)a5
{
  uint64_t v7 = 0;
  id v8 = 0;
  char v5 = [a1 verifyNetworkDeclarationsFromRecord:a3 signatureVerificationPublicKeys:a4 baseAccessoryIdentifier:&v8 data:&v7 error:a5];

  return v5;
}

+ (BOOL)verifyNetworkDeclarationsFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 baseAccessoryIdentifier:(id *)a5 data:(id *)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a3;
  LOBYTE(a7) = objc_msgSend(a1, "__verifyDataFromRecord:signatureVerificationPublicKeys:dataKey:dataAssetKey:maxDataSize:signatureKey:signatureAssetKey:maxSignatureSize:baseAccessoryIdentifier:data:error:", v13, v12, @"CD_networkDeclarations", @"CD_networkDeclarations_ckAsset", objc_msgSend(a1, "__maxSizeForCKRecordNetworkDeclarations"), @"CD_networkDeclarationsSignature", @"CD_networkDeclarationsSignature_ckAsset", objc_msgSend(a1, "__maxSizeForCKRecordNetworkDeclarationsSignature"), a5, a6, a7);

  return (char)a7;
}

+ (BOOL)__verifyDataFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 dataKey:(id)a5 dataAssetKey:(id)a6 maxDataSize:(unint64_t)a7 signatureKey:(id)a8 signatureAssetKey:(id)a9 maxSignatureSize:(unint64_t)a10 baseAccessoryIdentifier:(id *)a11 data:(id *)a12 error:(id *)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  id v23 = a9;
  v24 = objc_msgSend(a1, "__createBaseAccessoryIdentifierFromRecord:error:", v18, a13);
  if (v24)
  {
    v25 = objc_msgSend(a1, "__calculateDigestDataFromRecord:dataKey:dataAssetKey:maxDataSize:error:", v18, v20, v21, a7, a13);
    if (v25)
    {
      id v30 = v19;
      uint64_t v26 = objc_msgSend(a1, "__getSignatureDataFromRecord:signatureKey:signatureAssetKey:maxSignatureSize:error:", v18, v22, v23, a10, a13);
      if (v26
        && objc_msgSend(a1, "__verifyDigestDataAgainstSignatureFromRecord:digestData:signatureData:signatureVerificationPublicKeys:error:", v18, v25, v26, v30, a13))
      {
        objc_msgSend(a1, "__getDataFromRecord:dataKey:dataAssetKey:maxDataSize:error:", v18, v20, v21, a7, a13);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        *a12 = v27;
        if (v27)
        {
          *a11 = v24;
          BOOL v28 = 1;
        }
        else
        {
          BOOL v28 = 0;
        }
      }
      else
      {
        BOOL v28 = 0;
      }

      id v19 = v30;
    }
    else
    {
      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

+ (id)__getDataFromRecord:(id)a3 dataKey:(id)a4 dataAssetKey:(id)a5 maxDataSize:(unint64_t)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12
    || (readDataFromCKRecordOptionalAssetField((uint64_t)v10), (id v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v13 = dataFromCKRecordRequiredField(v10, v11, a7);
  }

  return v13;
}

+ (BOOL)__verifyDigestDataAgainstSignatureFromRecord:(id)a3 digestData:(id)a4 signatureData:(id)a5 signatureVerificationPublicKeys:(id)a6 error:(id *)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  CFDataRef v10 = (const __CFData *)a4;
  CFDataRef v11 = (const __CFData *)a5;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = a6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    v15 = 0;
    uint64_t v16 = *(void *)v34;
    CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F3BA38];
    while (2)
    {
      uint64_t v18 = 0;
      id v19 = v15;
      do
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v12);
        }
        id v20 = *(__SecKey **)(*((void *)&v33 + 1) + 8 * v18);
        *(void *)error = 0;
        int v21 = SecKeyVerifySignature(v20, v17, v10, v11, (CFErrorRef *)error);
        v15 = *(void **)error;

        if (v21)
        {

          BOOL v22 = 1;
          goto LABEL_17;
        }
        ++v18;
        id v19 = v15;
      }
      while (v14 != v18);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    v15 = 0;
  }

  id v23 = (void *)MEMORY[0x1D9452090]();
  id v24 = a1;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = HMFGetLogIdentifier();
    id v27 = [v32 recordID];
    BOOL v28 = [v27 hmbDescription];
    *(_DWORD *)error = 138543874;
    *(void *)&error[4] = v26;
    __int16 v38 = 2112;
    v39 = v28;
    __int16 v40 = 2112;
    v41 = v15;
    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Digest does not match signature on record %@: %@", error, 0x20u);
  }
  if (a7)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:53];
    BOOL v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_17:

  return v22;
}

+ (id)__getSignatureDataFromRecord:(id)a3 signatureKey:(id)a4 signatureAssetKey:(id)a5 maxSignatureSize:(unint64_t)a6 error:(id *)a7
{
  id v8 = stringFromCKRecord(a3, a4, a5, a6, a7);
  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
    CFDataRef v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else if (a7)
    {
      *a7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:53];
    }
  }
  else
  {
    CFDataRef v10 = 0;
  }

  return v10;
}

+ (id)__calculateDigestDataFromRecord:(id)a3 dataKey:(id)a4 dataAssetKey:(id)a5 maxDataSize:(unint64_t)a6 error:(id *)a7
{
  uint64_t v7 = MEMORY[0x1F4188790](a1);
  id v9 = v8;
  unint64_t v11 = v10;
  uint64_t v13 = v12;
  v15 = v14;
  uint64_t v16 = (void *)v7;
  v100[2] = *MEMORY[0x1E4F143B8];
  id v18 = v17;
  id v19 = v15;
  id v20 = v13;
  id v21 = v18;
  id v22 = v19;
  id v23 = v20;
  if (v23)
  {
    id v24 = filePathFromCKRecordOptionalAssetField(v21, v23);
    v25 = v24;
    if (v24)
    {
      uint64_t v26 = createInputStreamWithFilePath(v24, v9);
      if (v26)
      {
        id v27 = (void *)v26;
        goto LABEL_15;
      }
    }
  }
  v25 = dataFromCKRecordRequiredField(v21, v22, v9);
  if (v25)
  {
    BOOL v28 = [MEMORY[0x1E4F1CA10] inputStreamWithData:v25];
    id v27 = v28;
    if (v28)
    {
      id v29 = v28;
    }
    else
    {
      unint64_t v78 = v16;
      id v82 = v9;
      id v30 = (void *)MEMORY[0x1D9452090]();
      v31 = objc_opt_class();
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        long long v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v96 = v33;
        __int16 v97 = 2112;
        v98 = v25;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input stream with data: %@", buf, 0x16u);
      }
      uint64_t v16 = v78;
      id v9 = v82;
      if (v82)
      {
        *id v82 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      }
    }
  }
  else
  {
    id v27 = 0;
  }
LABEL_15:

  if (!v27)
  {
    v54 = 0;
    goto LABEL_54;
  }
  id v79 = v16;
  v83 = v9;
  id v77 = v22;
  long long v34 = [v21 recordID];
  long long v35 = [v34 zoneID];
  long long v36 = [v35 zoneName];
  v100[0] = v36;
  unint64_t v76 = v34;
  id v37 = [v34 recordName];
  v100[1] = v37;
  __int16 v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:2];

  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v39 = v38;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v84 objects:v99 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v85 != v42) {
          objc_enumerationMutation(v39);
        }
        id v44 = [*(id *)(*((void *)&v84 + 1) + 8 * i) dataUsingEncoding:4];
        CC_SHA256_Update(&c, (const void *)[v44 bytes], objc_msgSend(v44, "length"));
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v84 objects:v99 count:16];
    }
    while (v41);
  }

  [v27 open];
  uint64_t v45 = [v27 read:buf maxLength:4096];
  if (v45 < 1)
  {
LABEL_32:
    uint64_t v50 = [v27 close];
    if ((v45 & 0x8000000000000000) == 0)
    {
      v51 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
      v52 = v51;
      id v22 = v77;
      if (v51)
      {
        id v53 = v51;
        CC_SHA256_Final((unsigned __int8 *)[v53 mutableBytes], &c);
        v54 = (void *)[v53 copy];
      }
      else
      {
        v70 = (void *)MEMORY[0x1D9452090]();
        id v71 = v79;
        id v72 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          v73 = HMFGetLogIdentifier();
          *(_DWORD *)__int16 v89 = 138543618;
          id v90 = v73;
          __int16 v91 = 2048;
          uint64_t v92 = 32;
          _os_log_impl(&dword_1D49D5000, v72, OS_LOG_TYPE_ERROR, "%{public}@Failed to allocate %lu bytes to hold digest", v89, 0x16u);
        }
        if (v83)
        {
          [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
          v54 = 0;
          void *v83 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v54 = 0;
        }
      }
      v69 = v76;

      goto LABEL_53;
    }
    v63 = (void *)MEMORY[0x1D9452090](v50);
    id v64 = v79;
    v65 = HMFGetOSLogHandle();
    id v22 = v77;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = HMFGetLogIdentifier();
      unint64_t v75 = [v21 recordID];
      v67 = [v75 hmbDescription];
      [v27 streamError];
      v68 = id v81 = v63;
      *(_DWORD *)__int16 v89 = 138543874;
      id v90 = v66;
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v67;
      __int16 v93 = 2112;
      v94 = v68;
      _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_ERROR, "%{public}@Error reading data from record %@: %@", v89, 0x20u);

      v63 = v81;
    }

    v61 = v83;
    if (v83)
    {
      v62 = [v27 streamError];
      goto LABEL_44;
    }
LABEL_45:
    v54 = 0;
    goto LABEL_46;
  }
  unint64_t v46 = 0;
  while (1)
  {
    BOOL v47 = __CFADD__(v45, v46);
    v46 += v45;
    uint64_t v48 = v47;
    uint64_t v49 = v48 << 63 >> 63;
    if (v49 != v48 || v49 < 0 || v46 > v11) {
      break;
    }
    CC_SHA256_Update(&c, buf, v45);
    uint64_t v45 = [v27 read:buf maxLength:4096];
    if (v45 <= 0) {
      goto LABEL_32;
    }
  }
  v55 = (void *)MEMORY[0x1D9452090]([v27 close]);
  id v56 = v79;
  v57 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v58 = id v80 = v55;
    v59 = [v21 recordID];
    v60 = [v59 hmbDescription];
    *(_DWORD *)__int16 v89 = 138543874;
    id v90 = v58;
    __int16 v91 = 2048;
    uint64_t v92 = v11;
    __int16 v93 = 2112;
    v94 = v60;
    _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_ERROR, "%{public}@Data size is bigger than maximum %ld bytes on record %@", v89, 0x20u);

    v55 = v80;
  }

  id v22 = v77;
  v61 = v83;
  if (!v83) {
    goto LABEL_45;
  }
  v62 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
LABEL_44:
  v54 = 0;
  void *v61 = v62;
LABEL_46:
  v69 = v76;
LABEL_53:

LABEL_54:
  return v54;
}

+ (id)__createBaseAccessoryIdentifierFromRecord:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = stringFromCKRecord(v6, @"CD_productGroup", @"CD_productGroup_ckAsset", objc_msgSend(a1, "__maxSizeForCKRecordString"), a4);
  if (!v7)
  {
    id v19 = 0;
    goto LABEL_20;
  }
  id v8 = stringFromCKRecord(v6, @"CD_productNumber", @"CD_productNumber_ckAsset", objc_msgSend(a1, "__maxSizeForCKRecordString"), a4);
  if (v8)
  {
    long long v33 = a4;
    long long v34 = v8;
    id v9 = [[HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc] initWithProductGroup:v7 productNumber:v8 firmwareVersion:0];
    unint64_t v10 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v9 cloudKitZoneName];
    unint64_t v11 = [v6 recordID];
    id v12 = [v11 zoneID];
    uint64_t v13 = [v12 zoneName];
    char v14 = [v10 isEqualToString:v13];

    if (v14)
    {
      v15 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v9 cloudKitRecordName];
      uint64_t v16 = [v6 recordID];
      id v17 = [v16 recordName];
      char v18 = [v15 isEqualToString:v17];

      if ((v18 & 1) == 0)
      {
        uint64_t v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = a1;
        BOOL v28 = HMFGetOSLogHandle();
        id v8 = v34;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          id v29 = HMFGetLogIdentifier();
          id v30 = [v6 recordID];
          v31 = [v30 hmbDescription];
          *(_DWORD *)buf = 138544130;
          long long v36 = v29;
          __int16 v37 = 2112;
          __int16 v38 = @"CD_productNumber";
          __int16 v39 = 2112;
          uint64_t v40 = v34;
          __int16 v41 = 2112;
          uint64_t v42 = v31;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@'%@' field value '%@' does not match record name on %@", buf, 0x2Au);
        }
        if (v33)
        {
          [MEMORY[0x1E4F28C58] hmErrorWithCode:53];
          id v19 = 0;
          id *v33 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v19 = 0;
        }
        goto LABEL_18;
      }
      id v19 = v9;
    }
    else
    {
      id v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = a1;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        id v24 = [v6 recordID];
        v25 = [v24 hmbDescription];
        *(_DWORD *)buf = 138544130;
        long long v36 = v23;
        __int16 v37 = 2112;
        __int16 v38 = @"CD_productGroup";
        __int16 v39 = 2112;
        uint64_t v40 = v7;
        __int16 v41 = 2112;
        uint64_t v42 = v25;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@'%@' field value '%@' does not match zone name on %@", buf, 0x2Au);
      }
      if (v33)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:53];
        id v19 = 0;
        id *v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = 0;
      }
    }
    id v8 = v34;
LABEL_18:

    goto LABEL_19;
  }
  id v19 = 0;
LABEL_19:

LABEL_20:
  return v19;
}

+ (unint64_t)__maxSizeForCKRecordString
{
  return objc_msgSend(a1, "__maxSizeFromPreferenceWithKey:defaultValue:", @"HMDNetworkRouterFirewallRuleCloudZoneStringMaxSize", 256);
}

+ (unint64_t)__maxSizeForCKRecordPairedMetadataSignature
{
  return objc_msgSend(a1, "__maxSizeFromPreferenceWithKey:defaultValue:", @"HMDNetworkRouterFirewallRuleCloudZonePairedMetadataSignatureMaxSize", 1024);
}

+ (unint64_t)__maxSizeForCKRecordPairedMetadata
{
  return objc_msgSend(a1, "__maxSizeFromPreferenceWithKey:defaultValue:", @"HMDNetworkRouterFirewallRuleCloudZonePairedMetadataMaxSize", 10485760);
}

+ (unint64_t)__maxSizeForCKRecordNetworkDeclarationsSignature
{
  return objc_msgSend(a1, "__maxSizeFromPreferenceWithKey:defaultValue:", @"HMDNetworkRouterFirewallRuleCloudZoneNetworkDeclarationsSignatureMaxSize", 1024);
}

+ (unint64_t)__maxSizeForCKRecordNetworkDeclarations
{
  return objc_msgSend(a1, "__maxSizeFromPreferenceWithKey:defaultValue:", @"HMDNetworkRouterFirewallRuleCloudZoneNetworkDeclarationsMaxSize", 10485760);
}

+ (unint64_t)__maxSizeFromPreferenceWithKey:(id)a3 defaultValue:(unint64_t)a4
{
  id v5 = a3;
  if (isInternalBuild())
  {
    id v6 = [MEMORY[0x1E4F65530] sharedPreferences];
    uint64_t v7 = [v6 preferenceForKey:v5];

    id v8 = [v7 numberValue];

    if (v8)
    {
      id v9 = [v7 numberValue];
      a4 = [v9 unsignedIntegerValue];
    }
  }

  return a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureVerificationPublicKeys, 0);
  objc_storeStrong((id *)&self->_watchedRecordIDs, 0);
  objc_storeStrong((id *)&self->_uncommittedModifiedRecordIDsFromLastPull, 0);
  objc_storeStrong((id *)&self->_modifiedRecordIDsFromLastPull, 0);
}

- (NSArray)signatureVerificationPublicKeys
{
  return self->_signatureVerificationPublicKeys;
}

- (NSSet)watchedRecordIDs
{
  return self->_watchedRecordIDs;
}

- (BOOL)useAnonymousRequests
{
  return *(&self->_useAnonymousRequests + 4);
}

- (void)__retryFetchWithFetchInfo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 retryIntervalSeconds];
  double v6 = v5;
  [v4 retryIntervalSeconds];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  id v9 = dispatch_get_global_queue(0, 0);
  unint64_t v10 = [v4 activity];
  if (v6 <= 0.0) {
    unint64_t v11 = "fetch the next batch of records";
  }
  else {
    unint64_t v11 = "retry the fetch";
  }
  [v4 retryIntervalSeconds];
  objc_msgSend(v10, "markWithFormat:", @"Will %s in %lu seconds", v11, (unint64_t)v12);

  uint64_t v13 = (void *)MEMORY[0x1D9452090]();
  char v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    [v4 retryIntervalSeconds];
    *(_DWORD *)buf = 138543874;
    id v24 = v16;
    __int16 v25 = 2080;
    uint64_t v26 = v11;
    __int16 v27 = 2048;
    unint64_t v28 = (unint64_t)v17;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Will %s in %lu seconds", buf, 0x20u);
  }
  [v4 setShouldRetry:0];
  objc_msgSend(v4, "setRetryCount:", objc_msgSend(v4, "retryCount") + 1);
  objc_initWeak((id *)buf, v14);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HMDNetworkRouterFirewallRuleCloudZone___retryFetchWithFetchInfo___block_invoke;
  block[3] = &unk_1E6A13588;
  id v20 = v4;
  id v18 = v4;
  objc_copyWeak(&v21, (id *)buf);
  BOOL v22 = v6 > 0.0;
  dispatch_after(v8, v9, block);
  objc_destroyWeak(&v21);

  objc_destroyWeak((id *)buf);
}

void __67__HMDNetworkRouterFirewallRuleCloudZone___retryFetchWithFetchInfo___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activity];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__HMDNetworkRouterFirewallRuleCloudZone___retryFetchWithFetchInfo___block_invoke_2;
  v3[3] = &unk_1E6A13588;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 48);
  [v2 performBlock:v3];

  objc_destroyWeak(&v5);
}

void __67__HMDNetworkRouterFirewallRuleCloudZone___retryFetchWithFetchInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [*(id *)(a1 + 32) activity];
    if (*(unsigned char *)(a1 + 48)) {
      id v4 = "Retrying";
    }
    else {
      id v4 = "Fetching the next batch of records";
    }
    id v5 = [*(id *)(a1 + 32) changeToken];
    char v6 = [v5 hmbDescription];
    [v3 markWithFormat:@"%s, token: %@", v4, v6];

    double v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = WeakRetained;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = HMFGetLogIdentifier();
      if (*(unsigned char *)(a1 + 48)) {
        unint64_t v11 = "Retrying";
      }
      else {
        unint64_t v11 = "Fetching the next batch of records";
      }
      double v12 = [*(id *)(a1 + 32) changeToken];
      uint64_t v13 = [v12 hmbDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@%s, token: %@", buf, 0x20u);
    }
    objc_msgSend(v8, "__fetchZoneChangesWithFetchInfo:", *(void *)(a1 + 32));
  }
  else
  {
    char v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    [*(id *)(a1 + 32) finishWithError:v14];
  }
}

- (BOOL)__canRecoverFromError:(id)a3 fetchInfo:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 hmbIsCKPartialFailureError])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v34 = __Block_byref_object_copy__140367;
    long long v35 = __Block_byref_object_dispose__140368;
    id v36 = 0;
    id v8 = [v6 userInfo];
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___canRecoverFromError_fetchInfo___block_invoke;
    v32[3] = &unk_1E6A12508;
    v32[4] = self;
    v32[5] = buf;
    [v9 enumerateKeysAndObjectsUsingBlock:v32];

    unint64_t v10 = *(void **)(*(void *)&buf[8] + 40);
    if (v10)
    {
      id v11 = v10;

      id v6 = v11;
    }
    _Block_object_dispose(buf, 8);

    if (!v10) {
      goto LABEL_7;
    }
  }
  if (!objc_msgSend(v6, "hmd_isCKError") || (objc_msgSend(v6, "hmd_isNonRecoverableCKError") & 1) != 0) {
    goto LABEL_7;
  }
  uint64_t v14 = [v6 code];
  switch(v14)
  {
    case 21:
      id v20 = [v7 activity];
      [v20 markWithFormat:@"Change token has expired: %@", v6];

      uint64_t v21 = (void *)MEMORY[0x1D9452090]();
      BOOL v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Change token has expired: %@", buf, 0x16u);
      }
      [v7 setChangeToken:0];
      [v7 setShouldRetry:1];
      goto LABEL_25;
    case 28:
      __int16 v25 = [v7 activity];
      [v25 markWithFormat:@"Zone was deleted: %@", v6];

      uint64_t v26 = (void *)MEMORY[0x1D9452090]();
      __int16 v27 = self;
      unint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Zone was deleted: %@", buf, 0x16u);
      }
      [(HMBCloudZone *)v27 handleDeletion];
      goto LABEL_25;
    case 26:
      v15 = [v7 activity];
      [v15 markWithFormat:@"Zone does not exist: %@", v6];

      uint64_t v16 = (void *)MEMORY[0x1D9452090]();
      __int16 v17 = self;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Zone does not exist: %@", buf, 0x16u);
      }
LABEL_24:

LABEL_25:
      BOOL v12 = 1;
      goto LABEL_8;
  }
  [v6 hmbCloudKitRetryDelay];
  objc_msgSend(v7, "setRetryIntervalSeconds:");
  if ([v7 shouldRetry])
  {
    id v30 = [v7 activity];
    [v30 markWithFormat:@"Ignoring non-fatal error: %@", v6];

    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Ignoring non-fatal error: %@", buf, 0x16u);
    }
    goto LABEL_24;
  }
LABEL_7:
  BOOL v12 = 0;
LABEL_8:

  return v12;
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___canRecoverFromError_fetchInfo___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v19 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v19;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v9) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13
    || ([*(id *)(a1 + 32) cloudZoneID],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        [v14 zoneID],
        v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v9 isEqual:v15],
        v15,
        v14,
        (v16 & 1) == 0))
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;

    *a4 = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v11);
  }
}

- (BOOL)__commitLocalChanges:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 activity];
  [v7 markWithFormat:@"Committing local changes"];

  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v59 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Committing local changes", buf, 0xCu);
  }
  id v12 = [v6 mirrorInput];
  BOOL v13 = [v6 options];
  char v14 = [v12 frmSyncCommitWithOptions:v13 error:a4];

  v15 = [v6 activity];
  char v16 = v15;
  if ((v14 & 1) == 0)
  {
    [v15 markWithFormat:@"Failed to commit: %@", *a4];

    uint64_t v37 = (void *)MEMORY[0x1D9452090]();
    __int16 v38 = v9;
    __int16 v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = HMFGetLogIdentifier();
      id v41 = *a4;
      *(_DWORD *)buf = 138543618;
      v59 = v40;
      __int16 v60 = 2112;
      id v61 = v41;
      _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit: %@", buf, 0x16u);
    }
    LOBYTE(v42) = 0;
    goto LABEL_21;
  }
  [v15 markWithFormat:@"Committed successfully"];

  uint64_t v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = v9;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v59 = v20;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Committed successfully", buf, 0xCu);
  }
  uint64_t v21 = [v6 originalChangeToken];
  BOOL v22 = [v6 changeToken];
  int v23 = HMFEqualObjects();

  id v24 = [v6 activity];
  __int16 v25 = [v6 changeToken];
  uint64_t v26 = [v25 hmbDescription];
  __int16 v27 = (void *)v26;
  if (!v23)
  {
    [v24 markWithFormat:@"Updating change token: %@", v26];

    uint64_t v43 = (void *)MEMORY[0x1D9452090]();
    id v44 = v18;
    uint64_t v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      unint64_t v46 = HMFGetLogIdentifier();
      BOOL v47 = [v6 changeToken];
      uint64_t v48 = [v47 hmbDescription];
      *(_DWORD *)buf = 138543618;
      v59 = v46;
      __int16 v60 = 2112;
      id v61 = v48;
      _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Updating change token: %@", buf, 0x16u);
    }
    uint64_t v49 = [(HMBCloudZone *)v44 cloudDatabase];
    uint64_t v50 = [v6 changeToken];
    v51 = [(HMBCloudZone *)v44 cloudZoneID];
    [v49 updateServerChangeToken:v50 forZoneWithID:v51];

    v52 = [v6 activity];
    id v53 = [v6 changeToken];
    v54 = [v53 hmbDescription];
    [v52 markWithFormat:@"Updated change token successfully: %@", v54];

    unint64_t v28 = (void *)MEMORY[0x1D9452090]();
    v55 = v44;
    id v30 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    v31 = HMFGetLogIdentifier();
    id v32 = [v6 changeToken];
    long long v33 = [v32 hmbDescription];
    *(_DWORD *)buf = 138543618;
    v59 = v31;
    __int16 v60 = 2112;
    id v61 = v33;
    long long v34 = "%{public}@Updated change token successfully: %@";
    long long v35 = v30;
    os_log_type_t v36 = OS_LOG_TYPE_INFO;
    goto LABEL_16;
  }
  [v24 markWithFormat:@"Change token does not need to be updated: %@", v26];

  unint64_t v28 = (void *)MEMORY[0x1D9452090]();
  uint64_t v29 = v18;
  id v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = HMFGetLogIdentifier();
    id v32 = [v6 changeToken];
    long long v33 = [v32 hmbDescription];
    *(_DWORD *)buf = 138543618;
    v59 = v31;
    __int16 v60 = 2112;
    id v61 = v33;
    long long v34 = "%{public}@Change token does not need to be updated: %@";
    long long v35 = v30;
    os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
    _os_log_impl(&dword_1D49D5000, v35, v36, v34, buf, 0x16u);
  }
LABEL_17:

  if (![v6 shouldRetry])
  {
LABEL_20:
    LOBYTE(v42) = 1;
    goto LABEL_21;
  }
  id v56 = [(HMBCloudZone *)v18 localZone];
  uint64_t v42 = [v56 createMirrorInputWithError:a4];

  if (v42)
  {
    [v6 setMirrorInput:v42];

    goto LABEL_20;
  }
LABEL_21:

  return (char)v42;
}

- (void)__zoneChangesCompleted:(id)a3 fetchInfo:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 activity];
  id v9 = v8;
  if (v6)
  {
    [v8 markWithFormat:@"Zone change operation completed unsuccessfully: %@", v6];

    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v13;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Zone change operation completed unsuccessfully: %@", buf, 0x16u);
    }
    id v14 = v6;
    [(HMDNetworkRouterFirewallRuleCloudZone *)v11 __finalizeUpdatedRecordIDs];
  }
  else
  {
    [v8 markWithFormat:@"Zone change operation completed successfully"];

    v15 = (void *)MEMORY[0x1D9452090]();
    char v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Zone change operation completed successfully", buf, 0xCu);
    }
    id v23 = 0;
    BOOL v19 = [(HMDNetworkRouterFirewallRuleCloudZone *)v16 __commitLocalChanges:v7 error:&v23];
    id v20 = v23;
    uint64_t v21 = v20;
    id v14 = 0;
    if (!v19) {
      id v14 = v20;
    }

    [(HMDNetworkRouterFirewallRuleCloudZone *)v16 __finalizeUpdatedRecordIDs];
    if (!v14) {
      goto LABEL_11;
    }
  }
  if (![(HMDNetworkRouterFirewallRuleCloudZone *)self __canRecoverFromError:v14 fetchInfo:v7])
  {
    [v7 finishWithError:v14];
    goto LABEL_15;
  }
LABEL_11:
  if ([v7 shouldRetry])
  {
    [(HMDNetworkRouterFirewallRuleCloudZone *)self __retryFetchWithFetchInfo:v7];
  }
  else
  {
    BOOL v22 = [MEMORY[0x1E4F1CA98] null];
    [v7 finishWithResult:v22];
  }
LABEL_15:
}

- (void)__zoneFetchCompletedWithChangeToken:(id)a3 error:(id)a4 moreComing:(BOOL)a5 fetchInfo:(id)a6
{
  BOOL v7 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  BOOL v13 = [v12 activity];
  id v14 = [v10 hmbDescription];
  uint64_t v15 = [NSNumber numberWithBool:v7];
  char v16 = (void *)v15;
  if (!v11)
  {
    [v13 markWithFormat:@"Zone fetch completed successfully, token: %@, moreComing: %@", v14, v15];

    id v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = self;
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = HMFGetLogIdentifier();
      id v27 = [v10 hmbDescription];
      uint64_t v28 = [NSNumber numberWithBool:v7];
      *(_DWORD *)buf = 138543874;
      id v30 = v26;
      __int16 v31 = 2112;
      id v32 = v27;
      __int16 v33 = 2112;
      id v34 = v28;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Zone fetch completed successfully, token: %@, moreComing: %@", buf, 0x20u);
    }
LABEL_11:
    [v12 setChangeToken:v10];
    if (!v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [v13 markWithFormat:@"Zone fetch completed unsuccessfully, token: %@, error: %@, moreComing: %@", v14, v11, v15];

  uint64_t v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = self;
  BOOL v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    id v20 = HMFGetLogIdentifier();
    uint64_t v21 = [v10 hmbDescription];
    BOOL v22 = [NSNumber numberWithBool:v7];
    *(_DWORD *)buf = 138544130;
    id v30 = v20;
    __int16 v31 = 2112;
    id v32 = v21;
    __int16 v33 = 2112;
    id v34 = v11;
    __int16 v35 = 2112;
    os_log_type_t v36 = v22;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Zone fetch completed unsuccessfully, token: %@, error: %@, moreComing: %@", buf, 0x2Au);
  }
  if (v10) {
    goto LABEL_11;
  }
  if (v7) {
LABEL_6:
  }
    [v12 setShouldRetry:1];
LABEL_7:
}

- (void)__zoneChangeTokensUpdated:(id)a3 fetchInfo:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 activity];
  id v9 = [v7 changeToken];
  id v10 = [v9 hmbDescription];
  [v8 markWithFormat:@"Change token updated: %@", v10];

  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  BOOL v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = HMFGetLogIdentifier();
    uint64_t v15 = [v7 changeToken];
    char v16 = [v15 hmbDescription];
    *(_DWORD *)buf = 138543618;
    id v18 = v14;
    __int16 v19 = 2112;
    id v20 = v16;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Change token updated: %@", buf, 0x16u);
  }
  [v7 setChangeToken:v6];
}

- (void)__recordDeleted:(id)a3 recordType:(id)a4 fetchInfo:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 activity];
  id v12 = [v8 hmbDescription];
  [v11 markWithFormat:@"Fetched deleted recordID: %@ (%@)", v12, v9];

  BOOL v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    char v16 = HMFGetLogIdentifier();
    uint64_t v17 = [v8 hmbDescription];
    *(_DWORD *)buf = 138543874;
    os_log_type_t v36 = v16;
    __int16 v37 = 2112;
    id v38 = v17;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched deleted recordID: %@ (%@)", buf, 0x20u);
  }
  id v34 = 0;
  id v18 = [v8 externalID:&v34];
  id v19 = v34;
  if (v18)
  {
    id v20 = [v10 mirrorInput];
    id v33 = v19;
    char v21 = [v20 stageRemovalForModelWithExternalID:v18 error:&v33];
    id v22 = v33;

    if (v21)
    {
      [(HMDNetworkRouterFirewallRuleCloudZone *)v14 __noteUpdatedRecordID:v8];
    }
    else
    {
      uint64_t v28 = [v10 activity];
      [v28 markWithFormat:@"Failed to remove model: %@", v22];

      uint64_t v29 = (void *)MEMORY[0x1D9452090]();
      id v30 = v14;
      __int16 v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        os_log_type_t v36 = v32;
        __int16 v37 = 2112;
        id v38 = v22;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove model: %@", buf, 0x16u);
      }
    }
    id v19 = v22;
  }
  else
  {
    id v23 = [v10 activity];
    [v23 markWithFormat:@"Failed to determine externalID: %@", v19];

    id v24 = (void *)MEMORY[0x1D9452090]();
    __int16 v25 = v14;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      os_log_type_t v36 = v27;
      __int16 v37 = 2112;
      id v38 = v19;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine externalID: %@", buf, 0x16u);
    }
  }
}

- (void)__recordChanged:(id)a3 fetchInfo:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recordID];
  id v9 = [v7 activity];
  id v10 = [v8 hmbDescription];
  id v11 = [v6 recordType];
  [v9 markWithFormat:@"Fetched changed record %@ (%@)", v10, v11];

  id v12 = (void *)MEMORY[0x1D9452090]();
  BOOL v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    char v16 = [v8 hmbDescription];
    uint64_t v17 = [v6 recordType];
    *(_DWORD *)buf = 138543874;
    v57 = v15;
    __int16 v58 = 2112;
    id v59 = v16;
    __int16 v60 = 2112;
    id v61 = v17;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched changed record %@ (%@)", buf, 0x20u);
  }
  id v55 = 0;
  id v18 = [(HMDNetworkRouterFirewallRuleCloudZone *)v13 decodeModelFrom:v6 recordSource:4 error:&v55];
  id v19 = v55;
  id v20 = v19;
  if (v18)
  {
    id v54 = v19;
    char v21 = [v6 externalID:&v54];
    id v22 = v54;

    if (v21)
    {
      id v53 = v22;
      id v23 = [v6 externalData:&v53];
      id v24 = v53;

      if (v23)
      {
        __int16 v25 = [v7 mirrorInput];
        id v52 = v24;
        char v26 = [v25 stageAdditionForModel:v18 externalID:v21 externalData:v23 error:&v52];
        id v50 = v52;

        if (v26)
        {
          [(HMDNetworkRouterFirewallRuleCloudZone *)v13 __noteUpdatedRecordID:v8];
        }
        else
        {
          uint64_t v42 = [v7 activity];
          uint64_t v43 = [v8 hmbDescription];
          [v42 markWithFormat:@"Failed to update model for %@: %@", v43, v50];

          id v44 = (void *)MEMORY[0x1D9452090]();
          uint64_t v45 = v13;
          unint64_t v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            BOOL v47 = HMFGetLogIdentifier();
            [v8 hmbDescription];
            uint64_t v48 = v49 = v44;
            *(_DWORD *)buf = 138543874;
            v57 = v47;
            __int16 v58 = 2112;
            id v59 = v48;
            __int16 v60 = 2112;
            id v61 = v50;
            _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to update model for %@: %@", buf, 0x20u);

            id v44 = v49;
          }
        }
        id v24 = v50;
      }
      else
      {
        __int16 v37 = [v7 activity];
        [v37 markWithFormat:@"Failed to determine externalData: %@", v24];

        id v38 = (void *)MEMORY[0x1D9452090]();
        __int16 v39 = v13;
        id v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          uint64_t v41 = v51 = v38;
          *(_DWORD *)buf = 138543618;
          v57 = v41;
          __int16 v58 = 2112;
          id v59 = v24;
          _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine externalData: %@", buf, 0x16u);

          id v38 = v51;
        }
      }

      id v22 = v24;
    }
    else
    {
      id v32 = [v7 activity];
      [v32 markWithFormat:@"Failed to determine externalID: %@", v22];

      id v33 = (void *)MEMORY[0x1D9452090]();
      id v34 = v13;
      __int16 v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v57 = v36;
        __int16 v58 = 2112;
        id v59 = v22;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine externalID: %@", buf, 0x16u);
      }
    }

    id v20 = v22;
  }
  else
  {
    id v27 = [v7 activity];
    [v27 markWithFormat:@"Failed to decode model: %@", v20];

    uint64_t v28 = (void *)MEMORY[0x1D9452090]();
    uint64_t v29 = v13;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v57 = v31;
      __int16 v58 = 2112;
      id v59 = v20;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode model: %@", buf, 0x16u);
    }
  }
}

- (void)__finalizeUpdatedRecordIDs
{
  v3 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x1E4F69F20]);
  os_unfair_lock_lock_with_options();
  if (self->_modifiedRecordIDsFromLastPull)
  {
    id v4 = [(HMDNetworkRouterFirewallRuleCloudZone *)self uncommittedModifiedRecordIDsFromLastPull];

    if (v4)
    {
      id v5 = [(HMDNetworkRouterFirewallRuleCloudZone *)self uncommittedModifiedRecordIDsFromLastPull];
      [v5 unionSet:self->_modifiedRecordIDsFromLastPull];
    }
  }
  id v6 = [(HMDNetworkRouterFirewallRuleCloudZone *)self uncommittedModifiedRecordIDsFromLastPull];
  id v7 = (void *)[v6 copy];
  [(HMDNetworkRouterFirewallRuleCloudZone *)self setModifiedRecordIDsFromLastPull:v7];

  [(HMDNetworkRouterFirewallRuleCloudZone *)self setUncommittedModifiedRecordIDsFromLastPull:0];
  os_unfair_lock_unlock(v3);
}

- (void)__noteUpdatedRecordID:(id)a3
{
  id v7 = a3;
  id v4 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x1E4F69F20]);
  os_unfair_lock_lock_with_options();
  id v5 = [(HMDNetworkRouterFirewallRuleCloudZone *)self uncommittedModifiedRecordIDsFromLastPull];

  if (v5)
  {
    id v6 = [(HMDNetworkRouterFirewallRuleCloudZone *)self uncommittedModifiedRecordIDsFromLastPull];
    [v6 addObject:v7];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA80] setWithObject:v7];
    [(HMDNetworkRouterFirewallRuleCloudZone *)self setUncommittedModifiedRecordIDsFromLastPull:v6];
  }

  os_unfair_lock_unlock(v4);
}

- (void)__fetchZoneChangesWithFetchInfo:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1A060]);
  id v6 = [v4 changeToken];
  [v5 setPreviousServerChangeToken:v6];

  id v7 = [(HMBCloudZone *)self cloudZoneID];
  id v8 = [v7 zoneID];
  uint64_t v41 = v8;
  v42[0] = v5;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];

  id v10 = objc_alloc(MEMORY[0x1E4F1A070]);
  id v11 = [(HMBCloudZone *)self cloudZoneID];
  id v12 = [v11 zoneID];
  id v40 = v12;
  BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  id v14 = (void *)[v10 initWithRecordZoneIDs:v13 configurationsByRecordZoneID:v9];

  [v14 setFetchAllChanges:1];
  objc_initWeak(&location, self);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke;
  v36[3] = &unk_1E6A12440;
  id v15 = v4;
  id v37 = v15;
  objc_copyWeak(&v38, &location);
  [v14 setRecordChangedBlock:v36];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_3;
  v33[3] = &unk_1E6A12468;
  id v16 = v15;
  id v34 = v16;
  objc_copyWeak(&v35, &location);
  [v14 setRecordWithIDWasDeletedBlock:v33];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_5;
  v30[3] = &unk_1E6A12490;
  id v17 = v16;
  id v31 = v17;
  objc_copyWeak(&v32, &location);
  [v14 setRecordZoneChangeTokensUpdatedBlock:v30];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_161;
  v27[3] = &unk_1E6A124E0;
  id v18 = v17;
  id v28 = v18;
  objc_copyWeak(&v29, &location);
  [v14 setRecordZoneFetchCompletionBlock:v27];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_167;
  v23[3] = &unk_1E6A15888;
  id v19 = v18;
  id v24 = v19;
  __int16 v25 = self;
  objc_copyWeak(&v26, &location);
  [v14 setFetchRecordZoneChangesCompletionBlock:v23];
  id v20 = [(HMBCloudZone *)self database];
  [v20 addOperation:v14];

  char v21 = [v19 operationStartTime];
  LODWORD(v20) = v21 == 0;

  if (v20)
  {
    id v22 = [MEMORY[0x1E4F1C9C8] now];
    [v19 setOperationStartTime:v22];
  }
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&location);
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) activity];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2;
  v6[3] = &unk_1E6A16550;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  id v5 = v3;
  id v8 = v5;
  [v4 performBlock:v6];

  objc_destroyWeak(&v9);
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) activity];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_4;
  v10[3] = &unk_1E6A17780;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v11 = *(id *)(a1 + 32);
  id v8 = v5;
  id v12 = v8;
  id v9 = v6;
  id v13 = v9;
  [v7 performBlock:v10];

  objc_destroyWeak(&v14);
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) activity];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_6;
  v13[3] = &unk_1E6A17780;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  id v11 = v7;
  id v14 = v11;
  id v12 = v8;
  id v15 = v12;
  id v16 = *(id *)(a1 + 32);
  [v10 performBlock:v13];

  objc_destroyWeak(&v17);
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_161(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = [*(id *)(a1 + 32) activity];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2_162;
  v19[3] = &unk_1E6A124B8;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  id v16 = v11;
  id v20 = v16;
  id v17 = v12;
  id v21 = v17;
  id v18 = v14;
  id v22 = v18;
  char v25 = a5;
  id v23 = *(id *)(a1 + 32);
  [v15 performBlock:v19];

  objc_destroyWeak(&v24);
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_167(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) activity];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2_168;
  v8[3] = &unk_1E6A17780;
  id v5 = v3;
  id v9 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  [v4 performBlock:v8];

  objc_destroyWeak(&v12);
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2_168(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) activity];
  id v4 = v3;
  if (v2)
  {
    [v3 markWithFormat:@"Fetch zone changes operation completed with error: %@", *(void *)(a1 + 32)];

    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    char v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v9;
    id v10 = "%{public}@Fetch zone changes operation completed with error: %@";
    uint64_t v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 22;
  }
  else
  {
    [v3 markWithFormat:@"Fetch zone changes operation completed successfully"];

    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    char v25 = v8;
    id v10 = "%{public}@Fetch zone changes operation completed successfully";
    uint64_t v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 12;
  }
  _os_log_impl(&dword_1D49D5000, v11, v12, v10, buf, v13);

LABEL_7:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v15 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "__zoneChangesCompleted:fetchInfo:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  else
  {
    id v16 = [*(id *)(a1 + 40) activity];
    [v16 markWithFormat:@"CloudZone has been deallocated"];

    id v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = objc_opt_class();
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v25 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@CloudZone has been deallocated", buf, 0xCu);
    }
    id v21 = *(void **)(a1 + 32);
    if (v21)
    {
      id v22 = v21;
    }
    else
    {
      id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    }
    id v23 = v22;
    [*(id *)(a1 + 40) finishWithError:v22];
  }
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2_162(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained cloudZoneID];
    id v5 = [v4 zoneID];
    char v6 = HMFEqualObjects();

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = v3;
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        id v10 = HMFGetLogIdentifier();
        uint64_t v11 = [*(id *)(a1 + 32) hmbDescription];
        *(_DWORD *)buf = 138543618;
        id v17 = v10;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: recordZoneFetchCompletionBlock called with unknown zone: %@", buf, 0x16u);
      }
      os_log_type_t v12 = [HMDAssertionLogEvent alloc];
      uint32_t v13 = [*(id *)(a1 + 32) hmbDescription];
      id v14 = [(HMDAssertionLogEvent *)v12 initWithReason:@"recordZoneFetchCompletionBlock called with unknown zone: %@", v13];

      id v15 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v15 submitLogEvent:v14];
    }
    objc_msgSend(v3, "__zoneFetchCompletedWithChangeToken:error:moreComing:fetchInfo:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 56));
  }
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_6(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained cloudZoneID];
    id v5 = [v4 zoneID];
    char v6 = HMFEqualObjects();

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = v3;
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        id v10 = HMFGetLogIdentifier();
        uint64_t v11 = [*(id *)(a1 + 32) hmbDescription];
        *(_DWORD *)buf = 138543618;
        id v17 = v10;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: recordZoneChangeTokensUpdatedBlock called with unknown zone: %@", buf, 0x16u);
      }
      os_log_type_t v12 = [HMDAssertionLogEvent alloc];
      uint32_t v13 = [*(id *)(a1 + 32) hmbDescription];
      id v14 = [(HMDAssertionLogEvent *)v12 initWithReason:@"recordZoneChangeTokensUpdatedBlock called with unknown zone: %@", v13];

      id v15 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v15 submitLogEvent:v14];
    }
    objc_msgSend(v3, "__zoneChangeTokensUpdated:fetchInfo:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) interestedRecordIDs];
    int v4 = [v3 containsObject:*(void *)(a1 + 40)];

    id WeakRetained = v5;
    if (v4)
    {
      objc_msgSend(v5, "__recordDeleted:recordType:fetchInfo:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 32));
      id WeakRetained = v5;
    }
  }
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = [a1[4] interestedRecordIDs];
    int v4 = [a1[5] recordID];
    int v5 = [v3 containsObject:v4];

    id WeakRetained = v6;
    if (v5)
    {
      objc_msgSend(v6, "__recordChanged:fetchInfo:", a1[5], a1[4]);
      id WeakRetained = v6;
    }
  }
}

- (id)fetchChangesWithToken:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __71__HMDNetworkRouterFirewallRuleCloudZone_fetchChangesWithToken_options___block_invoke;
  __int16 v18 = &unk_1E6A12418;
  objc_copyWeak(&v21, &location);
  id v8 = v7;
  id v19 = v8;
  id v9 = v6;
  id v20 = v9;
  id v10 = _Block_copy(&v15);
  uint64_t v11 = (void *)MEMORY[0x1E4F7A0D8];
  os_log_type_t v12 = objc_msgSend(MEMORY[0x1E4F7A0F0], "globalAsyncScheduler", v15, v16, v17, v18);
  uint32_t v13 = [v11 lazyFutureWithBlock:v10 scheduler:v12];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v13;
}

void __71__HMDNetworkRouterFirewallRuleCloudZone_fetchChangesWithToken_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (os_unfair_lock_s *)&WeakRetained[*MEMORY[0x1E4F69F20]];
    os_unfair_lock_lock_with_options();
    [v5 setModifiedRecordIDsFromLastPull:0];
    [v5 setUncommittedModifiedRecordIDsFromLastPull:0];
    os_unfair_lock_unlock(v6);
    id v7 = [v5 watchedRecordIDs];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v9 = [v5 localZone];
      id v41 = 0;
      id v40 = [v9 createMirrorInputWithError:&v41];
      id v39 = v41;

      if (v40)
      {
        id v10 = [HMDNetworkRouterFirewallRuleCloudZoneFetchInfo alloc];
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v11 = *(void *)(a1 + 40);
        uint32_t v13 = [v5 database];
        uint64_t v14 = [v5 useAnonymousRequests];
        uint64_t v15 = [v5 watchedRecordIDs];
        uint64_t v16 = [(HMDNetworkRouterFirewallRuleCloudZoneFetchInfo *)v10 initWithOptions:v12 changeToken:v11 promise:v3 database:v13 useAnonymousRequests:v14 interestedRecordIDs:v15 mirrorInput:v40];

        id v17 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)v16 activity];
        __int16 v18 = [v5 zoneID];
        id v19 = [v18 name];
        id v20 = [(HMDNetworkRouterFirewallRuleCloudZoneFetchInfo *)v16 changeToken];
        id v21 = [v20 hmbDescription];
        [v17 markWithFormat:@"Fetching all changes for zone: %@, token: %@", v19, v21];

        context = (void *)MEMORY[0x1D9452090]();
        id v22 = v5;
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = HMFGetLogIdentifier();
          char v25 = [v22 zoneID];
          __int16 v26 = [v25 name];
          uint64_t v27 = [(HMDNetworkRouterFirewallRuleCloudZoneFetchInfo *)v16 changeToken];
          uint64_t v28 = [v27 hmbDescription];
          *(_DWORD *)buf = 138543874;
          uint64_t v43 = v24;
          __int16 v44 = 2112;
          id v45 = v26;
          __int16 v46 = 2112;
          BOOL v47 = v28;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching all changes for zone: %@, token: %@", buf, 0x20u);
        }
        objc_msgSend(v22, "__fetchZoneChangesWithFetchInfo:", v16);
      }
      else
      {
        id v34 = (void *)MEMORY[0x1D9452090]();
        id v35 = v5;
        os_log_type_t v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          id v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v43 = v37;
          __int16 v44 = 2112;
          id v45 = v39;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to create mirror input: %@", buf, 0x16u);
        }
        [v3 finishWithError:v39];
      }
    }
    else
    {
      id v30 = (void *)MEMORY[0x1D9452090]();
      id v31 = v5;
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        id v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v43 = v33;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEBUG, "%{public}@Not watching any records", buf, 0xCu);
      }
      [v3 finishWithNoResult];
    }
  }
  else
  {
    id v29 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    [v3 finishWithError:v29];
  }
}

- (void)startUpWithLocalZone:(id)a3
{
  [(HMBCloudZone *)self setLocalZone:a3];
  id v4 = [(HMBCloudZone *)self startUp];
  [v4 finishWithNoResult];
}

- (void)setUncommittedModifiedRecordIDsFromLastPull:(id)a3
{
  id v4 = (NSMutableSet *)a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)((char *)self + (int)*MEMORY[0x1E4F69F20]));
  uncommittedModifiedRecordIDsFromLastPull = self->_uncommittedModifiedRecordIDsFromLastPull;
  self->_uncommittedModifiedRecordIDsFromLastPull = v4;
}

- (NSMutableSet)uncommittedModifiedRecordIDsFromLastPull
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)((char *)self + (int)*MEMORY[0x1E4F69F20]));
  uncommittedModifiedRecordIDsFromLastPull = self->_uncommittedModifiedRecordIDsFromLastPull;
  return uncommittedModifiedRecordIDsFromLastPull;
}

- (void)setModifiedRecordIDsFromLastPull:(id)a3
{
  id v4 = (NSSet *)a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)((char *)self + (int)*MEMORY[0x1E4F69F20]));
  modifiedRecordIDsFromLastPull = self->_modifiedRecordIDsFromLastPull;
  self->_modifiedRecordIDsFromLastPull = v4;
}

- (NSSet)modifiedRecordIDsFromLastPull
{
  id v3 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x1E4F69F20]);
  os_unfair_lock_lock_with_options();
  id v4 = self->_modifiedRecordIDsFromLastPull;
  os_unfair_lock_unlock(v3);
  return v4;
}

- (id)attributeDescriptions
{
  v24[5] = *MEMORY[0x1E4F143B8];
  id v3 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x1E4F69F20]);
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDNetworkRouterFirewallRuleCloudZone *)self uncommittedModifiedRecordIDsFromLastPull];
  id v21 = (void *)[v4 copy];

  os_unfair_lock_unlock(v3);
  v23.receiver = self;
  v23.super_class = (Class)HMDNetworkRouterFirewallRuleCloudZone;
  id v20 = [(HMBCloudZone *)&v23 attributeDescriptions];
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v22 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDNetworkRouterFirewallRuleCloudZone useAnonymousRequests](self, "useAnonymousRequests"));
  id v6 = (void *)[v5 initWithName:@"UseAnonymousRequests" value:v22];
  v24[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v8 = [(HMDNetworkRouterFirewallRuleCloudZone *)self watchedRecordIDs];
  id v9 = (void *)[v7 initWithName:@"WatchedRecordIDs" value:v8];
  v24[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v11 = [(HMDNetworkRouterFirewallRuleCloudZone *)self signatureVerificationPublicKeys];
  uint64_t v12 = (void *)[v10 initWithName:@"SignatureVerificationPublicKeys" value:v11];
  v24[2] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v14 = [(HMDNetworkRouterFirewallRuleCloudZone *)self modifiedRecordIDsFromLastPull];
  uint64_t v15 = (void *)[v13 initWithName:@"ModifiedRecordIDsFromLastPull" value:v14];
  v24[3] = v15;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"UncommittedModifiedRecordIDsFromLastPull" value:v21];
  v24[4] = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
  __int16 v18 = [v20 arrayByAddingObjectsFromArray:v17];

  return v18;
}

- (HMDNetworkRouterFirewallRuleCloudZone)initWithCloudDatabase:(id)a3 state:(id)a4 useAnonymousRequests:(BOOL)a5 watchedRecordIDs:(id)a6 signatureVerificationPublicKeys:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (![v15 count])
  {
    context = (void *)MEMORY[0x1D9452090]();
    id v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v24;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must have verification keys", buf, 0xCu);
    }
    id v22 = [[HMDAssertionLogEvent alloc] initWithReason:@"Must have verification keys"];
    objc_super v23 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v23 submitLogEvent:v22];
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F69E50]);
  v26.receiver = self;
  v26.super_class = (Class)HMDNetworkRouterFirewallRuleCloudZone;
  id v17 = [(HMBCloudZone *)&v26 initWithCloudDatabase:v12 configuration:v16 state:v13];

  if (v17)
  {
    *(&v17->_useAnonymousRequests + 4) = a5;
    objc_storeStrong((id *)&v17->_watchedRecordIDs, a6);
    objc_storeStrong((id *)&v17->_signatureVerificationPublicKeys, a7);
    __int16 v18 = v17;
  }

  return v17;
}

@end