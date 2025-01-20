@interface HDCloudSyncZone
- (BOOL)_addSubscriptionRecord:(id)a3 error:(id *)a4;
- (BOOL)addRecord:(id)a3 error:(id *)a4;
- (BOOL)hasFutureSchemaRecord;
- (BOOL)hasLostIdentity;
- (BOOL)hasOrphanedSequenceRecords;
- (BOOL)isEmpty;
- (BOOL)validatedForSharing;
- (CKRecordID)zoneShareRecordID;
- (CKShare)zoneShare;
- (HDCloudSyncDataUploadRequestRecord)dataUploadRequestRecord;
- (HDCloudSyncMasterRecord)masterRecord;
- (HDCloudSyncRegistryRecord)registryRecord;
- (HDCloudSyncRepository)repository;
- (HDCloudSyncStore)store;
- (HDCloudSyncStoreRecord)storeRecord;
- (HDCloudSyncZoneIdentifier)zoneIdentifier;
- (NSArray)authorizationRecords;
- (NSArray)participantRecords;
- (NSArray)recordNames;
- (NSArray)records;
- (NSArray)storeRecords;
- (NSArray)transactionRecords;
- (NSUUID)storeIdentifier;
- (id)description;
- (id)initForZoneIdentifier:(id)a3 repository:(id)a4 type:(int64_t)a5;
- (int64_t)purpose;
- (int64_t)recordCount;
- (int64_t)zoneType;
- (void)removeRecord:(id)a3;
- (void)setHasFutureSchemaRecord:(BOOL)a3;
- (void)setHasLostIdentity:(BOOL)a3;
- (void)setPurpose:(int64_t)a3;
- (void)setStore:(id)a3;
- (void)setValidatedForSharing:(BOOL)a3;
- (void)setZoneShare:(id)a3;
@end

@implementation HDCloudSyncZone

- (id)initForZoneIdentifier:(id)a3 repository:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HDCloudSyncZone;
  v10 = [(HDCloudSyncZone *)&v25 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_repository, v9);
    uint64_t v12 = [v8 copy];
    zoneIdentifier = v11->_zoneIdentifier;
    v11->_zoneIdentifier = (HDCloudSyncZoneIdentifier *)v12;

    v11->_zoneType = a5;
    v11->_purpose = 2;
    v11->_validatedForSharing = [v8 scope] == 2;
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    storeRecords = v11->_storeRecords;
    v11->_storeRecords = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orphanedSequenceRecords = v11->_orphanedSequenceRecords;
    v11->_orphanedSequenceRecords = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    participantRecords = v11->_participantRecords;
    v11->_participantRecords = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    authorizationRecords = v11->_authorizationRecords;
    v11->_authorizationRecords = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transactionRecords = v11->_transactionRecords;
    v11->_transactionRecords = v22;
  }
  return v11;
}

- (BOOL)isEmpty
{
  return [(NSMutableArray *)self->_records count] == 0;
}

- (BOOL)hasOrphanedSequenceRecords
{
  return [(NSMutableArray *)self->_orphanedSequenceRecords count] != 0;
}

- (BOOL)addRecord:(id)a3 error:(id *)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  records = self->_records;
  if (!records)
  {
    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10 = self->_records;
    self->_records = v9;

    records = self->_records;
  }
  [(NSMutableArray *)records addObject:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v11 = [(HDCloudSyncZone *)self _addSubscriptionRecord:v7 error:a4];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_registryRecord = (id *)&self->_registryRecord;
LABEL_7:
    objc_storeStrong(p_registryRecord, a3);
LABEL_15:
    BOOL v11 = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    participantRecords = self->_participantRecords;
LABEL_14:
    [(NSMutableArray *)participantRecords addObject:v7];
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    participantRecords = self->_authorizationRecords;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    participantRecords = self->_transactionRecords;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_registryRecord = (id *)&self->_masterRecord;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v7;
    switch([(HDCloudSyncZone *)self zoneType])
    {
      case 0:
        v16 = (void *)MEMORY[0x1E4F28C58];
        v17 = [v15 storeIdentifier];
        objc_msgSend(v16, "hk_assignError:code:format:", a4, 719, @"%@: Unexpected store record %@ in master zone.", self, v17);
        goto LABEL_48;
      case 1:
        v20 = [v15 storeIdentifier];
        v21 = [(HDCloudSyncZoneIdentifier *)self->_zoneIdentifier zoneIdentifier];
        v22 = objc_msgSend(v21, "hd_storeIdentifier");
        v23 = v15;
        char v24 = [v20 isEqual:v22];

        if ((v24 & 1) == 0)
        {
          v49 = (void *)MEMORY[0x1E4F28C58];
          zoneIdentifier = self->_zoneIdentifier;
          v51 = [v23 storeIdentifier];
          objc_msgSend(v49, "hk_assignError:code:format:", a4, 719, @"%@: Store record for zone %@ has unexpected store identifier %@", self, zoneIdentifier, v51);

          BOOL v11 = 0;
          goto LABEL_69;
        }
        if ([(NSMutableArray *)self->_storeRecords count])
        {
          BOOL v11 = 1;
LABEL_69:
          id v15 = v23;
          goto LABEL_49;
        }
        id v15 = v23;
        [(NSMutableArray *)self->_storeRecords addObject:v23];
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        v53 = self->_orphanedSequenceRecords;
        uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v68 objects:v78 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v69;
          do
          {
            for (uint64_t i = 0; i != v55; ++i)
            {
              if (*(void *)v69 != v56) {
                objc_enumerationMutation(v53);
              }
              [v23 addSequenceHeaderRecord:*(void *)(*((void *)&v68 + 1) + 8 * i)];
            }
            uint64_t v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v68 objects:v78 count:16];
          }
          while (v55);
        }

        orphanedSequenceRecords = self->_orphanedSequenceRecords;
        self->_orphanedSequenceRecords = 0;
LABEL_41:

LABEL_42:
        BOOL v11 = 1;
LABEL_49:

        break;
      case 2:
        [(NSMutableArray *)self->_storeRecords addObject:v15];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        obuint64_t j = (NSMutableArray *)[(NSMutableArray *)self->_orphanedSequenceRecords copy];
        uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v64 objects:v77 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v65;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v65 != v27) {
                objc_enumerationMutation(obj);
              }
              v29 = *(void **)(*((void *)&v64 + 1) + 8 * j);
              v30 = [v29 storeIdentifier];
              [v15 storeIdentifier];
              v32 = v31 = v15;
              int v33 = [v30 isEqual:v32];

              id v15 = v31;
              if (v33)
              {
                [v31 addSequenceHeaderRecord:v29];
                [(NSMutableArray *)self->_orphanedSequenceRecords removeObject:v29];
              }
            }
            uint64_t v26 = [(NSMutableArray *)obj countByEnumeratingWithState:&v64 objects:v77 count:16];
          }
          while (v26);
        }
        orphanedSequenceRecords = obj;
        goto LABEL_41;
      case 3:
        v35 = (void *)MEMORY[0x1E4F28C58];
        v17 = [v15 storeIdentifier];
        objc_msgSend(v35, "hk_assignError:code:format:", a4, 719, @"%@: Unexpected store record %@ in shared summary zone.", self, v17);
        goto LABEL_48;
      case 4:
        v36 = (void *)MEMORY[0x1E4F28C58];
        v17 = [v15 storeIdentifier];
        objc_msgSend(v36, "hk_assignError:code:format:", a4, 719, @"%@: Unexpected store record %@ in private metadata zone.", self, v17);
        goto LABEL_48;
      case 5:
        v37 = (void *)MEMORY[0x1E4F28C58];
        v17 = [v15 storeIdentifier];
        objc_msgSend(v37, "hk_assignError:code:format:", a4, 719, @"%@: Unexpected store record %@ attachment zone.", self, v17);
        goto LABEL_48;
      case 6:
        v38 = (void *)MEMORY[0x1E4F28C58];
        v17 = [v15 storeIdentifier];
        objc_msgSend(v38, "hk_assignError:code:format:", a4, 719, @"%@: Unexpected store record %@ in state sync zone.", self, v17);
        goto LABEL_48;
      case 7:
        v39 = (void *)MEMORY[0x1E4F28C58];
        v17 = [v15 storeIdentifier];
        objc_msgSend(v39, "hk_assignError:code:format:", a4, 719, @"%@: Unexpected store record %@ in context sync zone.", self, v17);
LABEL_48:

        BOOL v11 = 0;
        goto LABEL_49;
      default:
        goto LABEL_42;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v7;
      switch([(HDCloudSyncZone *)self zoneType])
      {
        case 0:
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 719, @"%@: Unexpected sequence record %@ in master zone.", self, v18);
          goto LABEL_67;
        case 1:
          if (![(NSMutableArray *)self->_storeRecords count]) {
            goto LABEL_61;
          }
          v40 = [(NSMutableArray *)self->_storeRecords firstObject];
          [v40 addSequenceHeaderRecord:v18];

          goto LABEL_71;
        case 2:
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          obja = self->_storeRecords;
          uint64_t v41 = [(NSMutableArray *)obja countByEnumeratingWithState:&v60 objects:v76 count:16];
          if (!v41) {
            goto LABEL_60;
          }
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v61;
          break;
        case 3:
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 719, @"%@: Unexpected sequence record %@ in shared summary zone.", self, v18);
          goto LABEL_67;
        case 4:
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 719, @"%@: Unexpected sequence record %@ in Private Metadata zone.", self, v18);
          goto LABEL_67;
        case 5:
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 719, @"%@: Unexpected sequence record %@ in Attachment zone.", self, v18);
          goto LABEL_67;
        case 6:
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 719, @"%@: Unexpected sequence record %@ in state sync zone.", self, v18);
          goto LABEL_67;
        case 7:
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 719, @"%@: Unexpected sequence record %@ in context sync zone.", self, v18);
LABEL_67:
          BOOL v11 = 0;
          goto LABEL_72;
        default:
          goto LABEL_71;
      }
      while (2)
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v61 != v43) {
            objc_enumerationMutation(obja);
          }
          v45 = *(void **)(*((void *)&v60 + 1) + 8 * k);
          v46 = [v18 storeIdentifier];
          v47 = [v45 storeIdentifier];
          int v48 = [v46 isEqual:v47];

          if (v48)
          {
            [v45 addSequenceHeaderRecord:v18];

            goto LABEL_71;
          }
        }
        uint64_t v42 = [(NSMutableArray *)obja countByEnumeratingWithState:&v60 objects:v76 count:16];
        if (v42) {
          continue;
        }
        break;
      }
LABEL_60:

LABEL_61:
      [(NSMutableArray *)self->_orphanedSequenceRecords addObject:v18];
LABEL_71:
      BOOL v11 = 1;
LABEL_72:
    }
    else
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v52 = v19;
        *(_DWORD *)buf = 138543618;
        id v73 = v7;
        __int16 v74 = 2114;
        uint64_t v75 = objc_opt_class();
        _os_log_error_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_ERROR, "Ignoring cloud sync record '%{public}@' because it is of unexpected type '%{public}@'", buf, 0x16u);
      }
      BOOL v11 = 0;
    }
  }
LABEL_16:

  return v11;
}

- (void)removeRecord:(id)a3
{
  id v4 = a3;
  v5 = [(HDCloudSyncRecord *)self->_registryRecord recordID];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    registryRecord = self->_registryRecord;
    self->_registryRecord = 0;
  }
  id v8 = [(HDCloudSyncRecord *)self->_masterRecord recordID];
  int v9 = [v8 isEqual:v4];

  if (v9)
  {
    masterRecord = self->_masterRecord;
    self->_masterRecord = 0;
  }
  participantRecords = self->_participantRecords;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __32__HDCloudSyncZone_removeRecord___block_invoke;
  v29[3] = &unk_1E62FAD08;
  id v12 = v4;
  id v30 = v12;
  [(NSMutableArray *)participantRecords hk_removeObjectsPassingTest:v29];
  authorizationRecords = self->_authorizationRecords;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __32__HDCloudSyncZone_removeRecord___block_invoke_2;
  v27[3] = &unk_1E62FAD30;
  id v14 = v12;
  id v28 = v14;
  [(NSMutableArray *)authorizationRecords hk_removeObjectsPassingTest:v27];
  transactionRecords = self->_transactionRecords;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __32__HDCloudSyncZone_removeRecord___block_invoke_3;
  v25[3] = &unk_1E62FAD58;
  id v16 = v14;
  id v26 = v16;
  [(NSMutableArray *)transactionRecords hk_removeObjectsPassingTest:v25];
  storeRecords = self->_storeRecords;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __32__HDCloudSyncZone_removeRecord___block_invoke_4;
  v23[3] = &unk_1E62FAD80;
  id v18 = v16;
  id v24 = v18;
  [(NSMutableArray *)storeRecords hk_removeObjectsPassingTest:v23];
  orphanedSequenceRecords = self->_orphanedSequenceRecords;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __32__HDCloudSyncZone_removeRecord___block_invoke_5;
  v21[3] = &unk_1E62FADA8;
  id v22 = v18;
  id v20 = v18;
  [(NSMutableArray *)orphanedSequenceRecords hk_removeObjectsPassingTest:v21];
}

uint64_t __32__HDCloudSyncZone_removeRecord___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __32__HDCloudSyncZone_removeRecord___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __32__HDCloudSyncZone_removeRecord___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __32__HDCloudSyncZone_removeRecord___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __32__HDCloudSyncZone_removeRecord___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (NSArray)storeRecords
{
  return (NSArray *)self->_storeRecords;
}

- (NSArray)records
{
  v2 = (void *)[(NSMutableArray *)self->_records copy];

  return (NSArray *)v2;
}

- (NSArray)recordNames
{
  v2 = [(NSMutableArray *)self->_records hk_map:&__block_literal_global_60];
  v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  return (NSArray *)v3;
}

id __30__HDCloudSyncZone_recordNames__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 record];
  v3 = [v2 recordID];
  uint64_t v4 = [v3 recordName];

  return v4;
}

- (int64_t)recordCount
{
  return [(NSMutableArray *)self->_records count];
}

- (BOOL)_addSubscriptionRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 record];
  BOOL v8 = +[HDCloudSyncDataUploadRequestRecord isDataUploadRequestRecord:v7];

  if (v8) {
    objc_storeStrong((id *)&self->_dataUploadRequestRecord, a3);
  }

  return v8;
}

- (CKRecordID)zoneShareRecordID
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  uint64_t v4 = *MEMORY[0x1E4F19D48];
  v5 = [(HDCloudSyncZoneIdentifier *)self->_zoneIdentifier zoneIdentifier];
  id v6 = (void *)[v3 initWithRecordName:v4 zoneID:v5];

  return (CKRecordID *)v6;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  zoneIdentifier = self->_zoneIdentifier;
  id v6 = HDCloudSyncZoneTypeToString(self->_zoneType);
  id v7 = HDCloudSyncZonePurposeToString(self->_purpose);
  BOOL v8 = [v3 stringWithFormat:@"<%@:%p %@ (%@, %@)>", v4, self, zoneIdentifier, v6, v7];

  return v8;
}

- (NSUUID)storeIdentifier
{
  v2 = [(HDCloudSyncZone *)self storeRecord];
  id v3 = [v2 storeIdentifier];

  return (NSUUID *)v3;
}

- (HDCloudSyncStoreRecord)storeRecord
{
  return (HDCloudSyncStoreRecord *)[(NSMutableArray *)self->_storeRecords firstObject];
}

- (HDCloudSyncRepository)repository
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_repository);

  return (HDCloudSyncRepository *)WeakRetained;
}

- (HDCloudSyncZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (int64_t)zoneType
{
  return self->_zoneType;
}

- (BOOL)hasLostIdentity
{
  return self->_hasLostIdentity;
}

- (void)setHasLostIdentity:(BOOL)a3
{
  self->_hasLostIdentity = a3;
}

- (HDCloudSyncRegistryRecord)registryRecord
{
  return self->_registryRecord;
}

- (BOOL)hasFutureSchemaRecord
{
  return self->_hasFutureSchemaRecord;
}

- (void)setHasFutureSchemaRecord:(BOOL)a3
{
  self->_hasFutureSchemaRecord = a3;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (CKShare)zoneShare
{
  return self->_zoneShare;
}

- (void)setZoneShare:(id)a3
{
}

- (BOOL)validatedForSharing
{
  return self->_validatedForSharing;
}

- (void)setValidatedForSharing:(BOOL)a3
{
  self->_validatedForSharing = a3;
}

- (HDCloudSyncMasterRecord)masterRecord
{
  return self->_masterRecord;
}

- (HDCloudSyncStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (HDCloudSyncDataUploadRequestRecord)dataUploadRequestRecord
{
  return self->_dataUploadRequestRecord;
}

- (NSArray)participantRecords
{
  return &self->_participantRecords->super;
}

- (NSArray)authorizationRecords
{
  return &self->_authorizationRecords->super;
}

- (NSArray)transactionRecords
{
  return &self->_transactionRecords->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataUploadRequestRecord, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_masterRecord, 0);
  objc_storeStrong((id *)&self->_zoneShare, 0);
  objc_storeStrong((id *)&self->_registryRecord, 0);
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_destroyWeak((id *)&self->_repository);
  objc_storeStrong((id *)&self->_transactionRecords, 0);
  objc_storeStrong((id *)&self->_authorizationRecords, 0);
  objc_storeStrong((id *)&self->_participantRecords, 0);
  objc_storeStrong((id *)&self->_orphanedSequenceRecords, 0);
  objc_storeStrong((id *)&self->_storeRecords, 0);

  objc_storeStrong((id *)&self->_records, 0);
}

@end