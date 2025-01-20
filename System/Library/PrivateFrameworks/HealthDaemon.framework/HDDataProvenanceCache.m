@interface HDDataProvenanceCache
- (HDDataProvenanceCache)initWithProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5;
- (id)allCodableObjectCollections;
- (id)allCodableObjectCollectionsByProvenance;
- (id)codableObjectCollectionForProvenance:(id)a3 profile:(id)a4;
- (id)codableProvenanceWithProvenance:(id)a3;
- (id)codableSourceWithProvenance:(id)a3 profile:(id)a4;
- (id)contributorForReference:(id)a3 profile:(id)a4 error:(id *)a5;
- (id)deviceForPersistentID:(id)a3 profile:(id)a4 error:(id *)a5;
- (id)deviceUUIDBytesWithProvenance:(id)a3;
- (id)provenanceWithID:(id)a3;
- (id)sourceRevisionForProvenanceID:(id)a3 dataProvenance:(id)a4 profile:(id)a5 error:(id *)a6;
- (void)clearCodableObjectCollections;
@end

@implementation HDDataProvenanceCache

- (id)provenanceWithID:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_provenanceByID objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = v5;
    goto LABEL_23;
  }
  provenanceManager = self->_provenanceManager;
  transaction = self->_transaction;
  id v35 = 0;
  v9 = [(HDDataProvenanceManager *)provenanceManager originProvenanceForPersistentID:v4 transaction:transaction error:&v35];
  id v10 = v35;
  if (!v9)
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v38 = v4;
      __int16 v39 = 2114;
      id v40 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "failed to find provenance for provenance %{public}@: %{public}@", buf, 0x16u);
    }
    id v6 = 0;
    goto LABEL_22;
  }
  id v11 = v9;
  v12 = [v11 contributorReference];
  profile = self->_profile;
  id v36 = 0;
  uint64_t v14 = +[HDContributorEntity externalReferenceForContributorReference:v12 profile:profile error:&v36];
  id v15 = v36;

  v34 = (void *)v14;
  if (v14) {
    goto LABEL_14;
  }
  if (!objc_msgSend(v15, "hk_isTransactionInterruptedError"))
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v38 = v15;
      _os_log_fault_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_FAULT, "Failed to externalize contributor reference: %{public}@", buf, 0xCu);
    }
    v34 = +[HDContributorReference contributorReferenceForNoContributor];
LABEL_14:
    uint64_t v31 = [v11 syncProvenance];
    uint64_t v30 = [v11 syncIdentity];
    v21 = [v11 productType];
    v22 = [v11 systemBuild];
    [v11 operatingSystemVersion];
    [v11 sourceVersion];
    v23 = id v33 = v10;
    v24 = [v11 timeZoneName];
    [v11 sourceID];
    v25 = id v32 = v15;
    v26 = [v11 deviceID];
    v18 = +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:v31 syncIdentity:v30 productType:v21 systemBuild:v22 operatingSystemVersion:buf sourceVersion:v23 timeZoneName:v24 sourceID:v25 deviceID:v26 contributorReference:v34];

    id v15 = v32;
    id v10 = v33;

LABEL_15:
    id v17 = v10;

    goto LABEL_16;
  }
  id v16 = v15;
  if (!v16)
  {
    v34 = 0;
    v18 = 0;
    goto LABEL_15;
  }
  id v17 = v16;
  v18 = 0;

LABEL_16:
  id v27 = v17;

  if (v18)
  {
    [(NSMutableDictionary *)self->_provenanceByID setObject:v18 forKeyedSubscript:v4];
    id v6 = v18;
  }
  else
  {
    _HKInitializeLogging();
    v28 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v38 = v4;
      __int16 v39 = 2114;
      id v40 = v27;
      _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "failed to externalize contributor for provenance %{public}@: %{public}@", buf, 0x16u);
    }
    id v6 = 0;
  }
  id v10 = v27;
LABEL_22:

LABEL_23:

  return v6;
}

- (id)deviceForPersistentID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NSMutableDictionary *)self->_deviceByPersistentIDCache objectForKeyedSubscript:v8];
  if (!v10)
  {
    id v11 = [v9 deviceManager];
    id v10 = [v11 deviceForPersistentID:v8 error:a5];

    if (v10) {
      [(NSMutableDictionary *)self->_deviceByPersistentIDCache setObject:v10 forKeyedSubscript:v8];
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codableObjectCollectionsByProvenance, 0);
  objc_storeStrong((id *)&self->_contributorByReferenceCache, 0);
  objc_storeStrong((id *)&self->_deviceByPersistentIDCache, 0);
  objc_storeStrong((id *)&self->_sourceRevisionsDictionaryBySourceCache, 0);
  objc_storeStrong((id *)&self->_sourceRevisionByDataProvenanceIDCache, 0);
  objc_storeStrong((id *)&self->_sourceByPersistentIDCache, 0);
  objc_storeStrong((id *)&self->_deviceUUIDBytesByID, 0);
  objc_storeStrong((id *)&self->_codableSourcesByID, 0);
  objc_storeStrong((id *)&self->_provenanceByID, 0);
  objc_storeStrong((id *)&self->_sourceEncoder, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_provenanceManager, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

- (id)codableProvenanceWithProvenance:(id)a3
{
  id v4 = a3;
  v5 = [(HDDataProvenanceCache *)self codableSourceWithProvenance:v4 profile:self->_profile];
  if (v5)
  {
    id v6 = [(HDDataProvenanceCache *)self deviceUUIDBytesWithProvenance:v4];
    v7 = [v4 sourceVersion];
    id v8 = objc_alloc_init(HDCodableProvenance);
    id v9 = [v4 systemBuild];
    [(HDCodableProvenance *)v8 setOriginBuild:v9];

    id v10 = [v4 productType];
    [(HDCodableProvenance *)v8 setOriginProductType:v10];

    id v11 = [v4 timeZoneName];
    [(HDCodableProvenance *)v8 setTimeZoneName:v11];

    v12 = [v5 uuid];
    [(HDCodableProvenance *)v8 setSourceUUID:v12];

    [(HDCodableProvenance *)v8 setSourceVersion:v7];
    [(HDCodableProvenance *)v8 setDeviceUUID:v6];
    if (v4)
    {
      [v4 operatingSystemVersion];
      [(HDCodableProvenance *)v8 setOriginMajorVersion:v22];
      [v4 operatingSystemVersion];
      [(HDCodableProvenance *)v8 setOriginMinorVersion:v21];
      [v4 operatingSystemVersion];
      uint64_t v13 = v20;
    }
    else
    {
      [(HDCodableProvenance *)v8 setOriginMajorVersion:0];
      [(HDCodableProvenance *)v8 setOriginMinorVersion:0];
      uint64_t v13 = 0;
    }
    [(HDCodableProvenance *)v8 setOriginPatchVersion:v13];
    uint64_t v14 = [v4 contributorReference];
    uint64_t v15 = [v14 contributorType];

    if (v15 != 2)
    {
      id v16 = [v4 contributorReference];
      id v17 = [v16 UUID];
      v18 = objc_msgSend(v17, "hk_dataForUUIDBytes");
      [(HDCodableProvenance *)v8 setContributorUUID:v18];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)deviceUUIDBytesWithProvenance:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 deviceID];
  v5 = [(NSMutableDictionary *)self->_deviceUUIDBytesByID objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = -[HDSQLiteEntity initWithPersistentID:]([HDDeviceEntity alloc], "initWithPersistentID:", [v4 longLongValue]);
    v7 = [(HDDatabaseTransaction *)self->_transaction unprotectedDatabase];
    id v12 = 0;
    id v8 = [(HDDeviceEntity *)v6 deviceUUIDInDatabase:v7 error:&v12];
    id v9 = v12;

    if (v8)
    {
      v5 = objc_msgSend(v8, "hk_dataForUUIDBytes");
      [(NSMutableDictionary *)self->_deviceUUIDBytesByID setObject:v5 forKeyedSubscript:v4];
    }
    else
    {
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v14 = v4;
        __int16 v15 = 2114;
        id v16 = v9;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Failed to find device %{public}@: %{public}@", buf, 0x16u);
      }
      v5 = 0;
    }
  }

  return v5;
}

- (id)allCodableObjectCollections
{
  codableObjectCollectionsByProvenance = self->_codableObjectCollectionsByProvenance;
  if (codableObjectCollectionsByProvenance)
  {
    v3 = [(NSMutableDictionary *)codableObjectCollectionsByProvenance allValues];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (void)clearCodableObjectCollections
{
  codableObjectCollectionsByProvenance = self->_codableObjectCollectionsByProvenance;
  self->_codableObjectCollectionsByProvenance = 0;
}

- (HDDataProvenanceCache)initWithProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)HDDataProvenanceCache;
  id v11 = [(HDDataProvenanceCache *)&v34 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_profile, a3);
    uint64_t v13 = [v9 dataProvenanceManager];
    provenanceManager = v12->_provenanceManager;
    v12->_provenanceManager = (HDDataProvenanceManager *)v13;

    objc_storeStrong((id *)&v12->_transaction, a4);
    __int16 v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    provenanceByID = v12->_provenanceByID;
    v12->_provenanceByID = v15;

    uint64_t v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    codableSourcesByID = v12->_codableSourcesByID;
    v12->_codableSourcesByID = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceUUIDBytesByID = v12->_deviceUUIDBytesByID;
    v12->_deviceUUIDBytesByID = v19;

    unsigned int v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sourceByPersistentIDCache = v12->_sourceByPersistentIDCache;
    v12->_sourceByPersistentIDCache = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sourceRevisionByDataProvenanceIDCache = v12->_sourceRevisionByDataProvenanceIDCache;
    v12->_sourceRevisionByDataProvenanceIDCache = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sourceRevisionsDictionaryBySourceCache = v12->_sourceRevisionsDictionaryBySourceCache;
    v12->_sourceRevisionsDictionaryBySourceCache = v25;

    id v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceByPersistentIDCache = v12->_deviceByPersistentIDCache;
    v12->_deviceByPersistentIDCache = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    contributorByReferenceCache = v12->_contributorByReferenceCache;
    v12->_contributorByReferenceCache = v29;

    uint64_t v31 = +[HDSourceEntity entityEncoderForProfile:v9 transaction:v10 purpose:a5 encodingOptions:0 authorizationFilter:0];
    sourceEncoder = v12->_sourceEncoder;
    v12->_sourceEncoder = (HDEntityEncoder *)v31;
  }
  return v12;
}

- (id)codableSourceWithProvenance:(id)a3 profile:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(HDEntityEncoder *)self->_sourceEncoder purpose])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HDDataProvenanceCache.m", 115, @"Invalid parameter not satisfying: %@", @"[_sourceEncoder purpose] == HDEntityEncodingPurposeCodableObjectCreation" object file lineNumber description];
  }
  id v9 = [v7 sourceID];
  id v10 = [(NSMutableDictionary *)self->_codableSourcesByID objectForKeyedSubscript:v9];
  if (!v10)
  {
    id v11 = -[HDSQLiteEntity initWithPersistentID:]([HDSourceEntity alloc], "initWithPersistentID:", [v9 longLongValue]);
    id v12 = [(HDDatabaseTransaction *)self->_transaction unprotectedDatabase];
    BOOL v13 = [(HDSQLiteEntity *)v11 existsInDatabase:v12];

    if (v13)
    {
      transaction = self->_transaction;
      sourceEncoder = self->_sourceEncoder;
      id v20 = 0;
      id v10 = [(HDSourceEntity *)v11 codableSourceWithEncoder:sourceEncoder transaction:transaction profile:v8 error:&v20];
      id v16 = v20;
      if (v10)
      {
        [(NSMutableDictionary *)self->_codableSourcesByID setObject:v10 forKeyedSubscript:v9];
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v17 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          unsigned int v22 = v9;
          __int16 v23 = 2114;
          id v24 = v16;
          _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "Failed to get codable source for sourceID %{public}@: %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (id)codableObjectCollectionForProvenance:(id)a3 profile:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  codableObjectCollectionsByProvenance = self->_codableObjectCollectionsByProvenance;
  if (!codableObjectCollectionsByProvenance)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v10 = self->_codableObjectCollectionsByProvenance;
    self->_codableObjectCollectionsByProvenance = v9;

    codableObjectCollectionsByProvenance = self->_codableObjectCollectionsByProvenance;
  }
  id v11 = [(NSMutableDictionary *)codableObjectCollectionsByProvenance objectForKeyedSubscript:v6];
  if (v11) {
    goto LABEL_9;
  }
  id v12 = [(HDDataProvenanceCache *)self codableSourceWithProvenance:v6 profile:v7];
  if (!v12)
  {
    id v11 = 0;
    goto LABEL_8;
  }
  BOOL v13 = [(HDDataProvenanceCache *)self codableProvenanceWithProvenance:v6];
  id v11 = objc_alloc_init(HDCodableObjectCollection);
  [(HDCodableObjectCollection *)v11 setSource:v12];
  [(HDCodableObjectCollection *)v11 setProvenance:v13];
  uint64_t v14 = [(HDProfile *)self->_profile syncIdentityManager];
  uint64_t v15 = [v6 syncIdentity];
  transaction = self->_transaction;
  id v24 = 0;
  uint64_t v17 = [v14 identityForEntityID:v15 transaction:transaction error:&v24];
  id v18 = v24;

  if (v17)
  {
    v19 = [v17 identity];
    id v20 = [v19 codableSyncIdentity];
    [(HDCodableObjectCollection *)v11 setSyncIdentity:v20];

    [(NSMutableDictionary *)self->_codableObjectCollectionsByProvenance setObject:v11 forKeyedSubscript:v6];
LABEL_8:

LABEL_9:
    id v11 = v11;
    unsigned int v21 = v11;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  __int16 v23 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v18;
    _os_log_fault_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_FAULT, "Unable to create sync identity from HDDataOriginProvenance  %{public}@", buf, 0xCu);
  }

  unsigned int v21 = 0;
LABEL_10:

  return v21;
}

- (id)allCodableObjectCollectionsByProvenance
{
  if (self->_codableObjectCollectionsByProvenance) {
    return self->_codableObjectCollectionsByProvenance;
  }
  else {
    return MEMORY[0x1E4F1CC08];
  }
}

- (id)sourceRevisionForProvenanceID:(id)a3 dataProvenance:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([(HDEntityEncoder *)self->_sourceEncoder purpose] != 1)
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"HDDataProvenanceCache.m", 260, @"Invalid parameter not satisfying: %@", @"[_sourceEncoder purpose] == HDEntityEncodingPurposeObjectInstantiation" object file lineNumber description];
  }
  uint64_t v14 = [(NSMutableDictionary *)self->_sourceRevisionByDataProvenanceIDCache objectForKeyedSubscript:v11];
  if (v14)
  {
    id v15 = v14;
  }
  else
  {
    id v16 = [v12 sourceID];
    id v17 = v13;
    if ([(HDEntityEncoder *)self->_sourceEncoder purpose] != 1)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:sel__sourceForPersistentID_profile_error_, self, @"HDDataProvenanceCache.m", 243, @"Invalid parameter not satisfying: %@", @"[_sourceEncoder purpose] == HDEntityEncodingPurposeObjectInstantiation" object file lineNumber description];
    }
    id v18 = [(NSMutableDictionary *)self->_sourceByPersistentIDCache objectForKeyedSubscript:v16];
    if (!v18)
    {
      v19 = [v17 sourceManager];
      id v18 = [v19 clientSourceForPersistentID:v16 error:a6];

      if (v18) {
        [(NSMutableDictionary *)self->_sourceByPersistentIDCache setObject:v18 forKeyedSubscript:v16];
      }
    }

    if (v18)
    {
      id v20 = [(NSMutableDictionary *)self->_sourceRevisionsDictionaryBySourceCache objectForKeyedSubscript:v18];
      if (!v20)
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(NSMutableDictionary *)self->_sourceRevisionsDictionaryBySourceCache setObject:v20 forKeyedSubscript:v18];
      }
      id v40 = v13;
      long long v43 = 0uLL;
      uint64_t v44 = 0;
      if (v12) {
        [v12 operatingSystemVersion];
      }
      unsigned int v21 = [v12 sourceVersion];
      unsigned int v22 = [v12 productType];
      long long v41 = v43;
      uint64_t v42 = v44;
      HKNSOperatingSystemVersionString();
      __int16 v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v24 = @"<null>";
      if (v21) {
        uint64_t v25 = v21;
      }
      else {
        uint64_t v25 = @"<null>";
      }
      if (v22) {
        id v26 = v22;
      }
      else {
        id v26 = @"<null>";
      }
      if (v23) {
        id v24 = v23;
      }
      uint64_t v27 = [NSString stringWithFormat:@"%@\n%@\n%@", v25, v26, v24];
      v28 = [v20 objectForKeyedSubscript:v27];
      if (!v28)
      {
        if ([(__CFString *)v21 isEqualToString:&stru_1F1728D60]) {
          v29 = 0;
        }
        else {
          v29 = v21;
        }
        __int16 v39 = v20;
        uint64_t v30 = v29;
        if ([(__CFString *)v22 isEqualToString:@"UnknownDevice"]) {
          uint64_t v31 = 0;
        }
        else {
          uint64_t v31 = v22;
        }
        id v32 = (objc_class *)MEMORY[0x1E4F2B578];
        id v38 = v23;
        id v33 = v31;
        id v34 = [v32 alloc];
        long long v41 = v43;
        uint64_t v42 = v44;
        v28 = (void *)[v34 initWithSource:v18 version:v30 productType:v33 operatingSystemVersion:&v41];

        __int16 v23 = v38;
        id v20 = v39;
        [v39 setObject:v28 forKeyedSubscript:v27];
      }
      [(NSMutableDictionary *)self->_sourceRevisionByDataProvenanceIDCache setObject:v28 forKeyedSubscript:v11];
      id v15 = v28;

      id v13 = v40;
    }
    else
    {
      id v15 = 0;
    }
  }

  return v15;
}

- (id)contributorForReference:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NSMutableDictionary *)self->_contributorByReferenceCache objectForKeyedSubscript:v8];
  if (!v10)
  {
    id v11 = [v9 contributorManager];
    id v10 = [v11 contributorForReference:v8 error:a5];

    if (v10) {
      [(NSMutableDictionary *)self->_contributorByReferenceCache setObject:v10 forKeyedSubscript:v8];
    }
  }

  return v10;
}

@end