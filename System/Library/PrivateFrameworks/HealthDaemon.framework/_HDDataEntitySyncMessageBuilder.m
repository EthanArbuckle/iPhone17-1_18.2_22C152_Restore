@interface _HDDataEntitySyncMessageBuilder
- (BOOL)finishAndFlushWithError:(id *)a3;
- (NSArray)orderedProperties;
- (_HDDataEntitySyncMessageBuilder)init;
- (_HDDataEntitySyncMessageBuilder)initWithProfile:(id)a3 transaction:(id)a4 entityClass:(Class)a5 version:(id)a6 provenanceCache:(id)a7 encodingOptions:(id)a8 messageHandler:(id)a9 bytesPerChangeSet:(int64_t)a10 bytesPerChange:(int64_t)a11;
- (id)description;
- (int64_t)addEntity:(id)a3 row:(HDSQLiteRow *)a4 anchor:(int64_t)a5 error:(id *)a6;
- (uint64_t)_sendCurrentCollectionIsFinal:(uint64_t)a3 error:;
@end

@implementation _HDDataEntitySyncMessageBuilder

- (NSArray)orderedProperties
{
  return (NSArray *)[(HDEntityEncoder *)self->_entityEncoder orderedProperties];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_entityEncoder, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_provenanceCache, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

- (_HDDataEntitySyncMessageBuilder)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (_HDDataEntitySyncMessageBuilder)initWithProfile:(id)a3 transaction:(id)a4 entityClass:(Class)a5 version:(id)a6 provenanceCache:(id)a7 encodingOptions:(id)a8 messageHandler:(id)a9 bytesPerChangeSet:(int64_t)a10 bytesPerChange:(int64_t)a11
{
  id v17 = a3;
  id v18 = a4;
  id v27 = a7;
  id v19 = a8;
  id v20 = a9;
  v28.receiver = self;
  v28.super_class = (Class)_HDDataEntitySyncMessageBuilder;
  v21 = [(_HDDataEntitySyncMessageBuilder *)&v28 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_profile, a3);
    v22->_entityClass = a5;
    v22->_entityVersion = ($E7BD3517D03D6A5513A4727339E3F206)a6;
    objc_storeStrong((id *)&v22->_provenanceCache, a7);
    objc_storeStrong((id *)&v22->_transaction, a4);
    uint64_t v23 = [(objc_class *)a5 entityEncoderForProfile:v17 transaction:v18 purpose:0 encodingOptions:v19 authorizationFilter:0];
    entityEncoder = v22->_entityEncoder;
    v22->_entityEncoder = (HDEntityEncoder *)v23;

    objc_storeStrong((id *)&v22->_messageHandler, a9);
    v22->_maxEncodedBytesPerChangeSet = a10;
    v22->_maxEncodedBytesPerChange = a11;
    *(_OWORD *)&v22->_totalEncodedBytes = 0u;
    *(_OWORD *)&v22->_lastEntityAnchor = 0u;
    *(_WORD *)&v22->_hasEncodedAnyObject = 0;
  }

  return v22;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_entityClass];
}

- (int64_t)addEntity:(id)a3 row:(HDSQLiteRow *)a4 anchor:(int64_t)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = [NSNumber numberWithLongLong:HDSQLiteColumnWithNameAsInt64()];
  v12 = [(HDDataProvenanceCache *)self->_provenanceCache provenanceWithID:v11];
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 100, @"Failed to retrieve provenance for id %@", v11);
LABEL_9:
    int64_t v22 = 2;
    goto LABEL_10;
  }
  v13 = [(HDDataProvenanceCache *)self->_provenanceCache codableObjectCollectionForProvenance:v12 profile:self->_profile];

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 100, @"Failed to find/create codable object collection for provenance %@", v12);
    goto LABEL_9;
  }
  id v14 = v10;
  id v15 = v12;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  entityEncoder = self->_entityEncoder;
  v24 = v14;
  uint64_t v17 = [v14 persistentID];
  int64_t maxEncodedBytesPerChange = self->_maxEncodedBytesPerChange;
  int64_t v29 = a5;
  id v30 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68___HDDataEntitySyncMessageBuilder__addEntity_row_anchor_provenance___block_invoke;
  v25[3] = &unk_1E63010C8;
  v25[4] = self;
  id v27 = &v31;
  objc_super v28 = v35;
  id v19 = v15;
  id v26 = v19;
  LOBYTE(v15) = [(HDEntityEncoder *)entityEncoder generateCodableRepresentationsForPersistentID:v17 row:a4 maxBytesPerRepresentation:maxEncodedBytesPerChange error:&v30 handler:v25];
  id v20 = v30;
  if ((v15 & 1) == 0)
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v38 = self;
      __int16 v39 = 2114;
      id v40 = v20;
      _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@: failed to generate codable representation for sync: %{public}@", buf, 0x16u);
    }
  }
  int64_t v22 = v32[3];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v35, 8);

LABEL_10:
  return v22;
}

- (BOOL)finishAndFlushWithError:(id *)a3
{
  [(HDEntityEncoder *)self->_entityEncoder finish];
  if (!self->_hasEncodedAnyObject || self->_didSendFinal) {
    return 1;
  }
  self->_didSendFinal = 1;

  return -[_HDDataEntitySyncMessageBuilder _sendCurrentCollectionIsFinal:error:]((uint64_t)self, 1, (uint64_t)a3);
}

- (uint64_t)_sendCurrentCollectionIsFinal:(uint64_t)a3 error:
{
  if (result)
  {
    uint64_t v5 = result;
    v6 = [*(id *)(result + 32) allCodableObjectCollections];
    uint64_t v7 = [*(id *)(v5 + 56) sendCodableChange:v6 version:*(void *)(v5 + 24) resultAnchor:*(void *)(v5 + 96) sequence:*(void *)(v5 + 104) done:a2 error:a3];
    [*(id *)(v5 + 32) clearCodableObjectCollections];
    *(void *)(v5 + 88) = 0;

    return v7;
  }
  return result;
}

@end