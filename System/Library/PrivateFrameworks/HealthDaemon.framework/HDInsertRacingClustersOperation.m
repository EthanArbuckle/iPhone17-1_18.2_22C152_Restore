@interface HDInsertRacingClustersOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDInsertRacingClustersOperation)initWithClusters:(id)a3 provenance:(int64_t)a4;
- (HDInsertRacingClustersOperation)initWithCoder:(id)a3;
- (NSArray)clusters;
- (int64_t)provenance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDInsertRacingClustersOperation

- (HDInsertRacingClustersOperation)initWithClusters:(id)a3 provenance:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDInsertRacingClustersOperation;
  v7 = [(HDInsertRacingClustersOperation *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    clusters = v7->_clusters;
    v7->_clusters = (NSArray *)v8;

    v7->_provenance = a4;
  }

  return v7;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v8 = a4;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v41 = self;
  v9 = self->_clusters;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v48;
    *(void *)&long long v11 = 138543362;
    long long v36 = v11;
    v37 = a5;
    v38 = v9;
    uint64_t v39 = *(void *)v48;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v48 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v47 + 1) + 8 * v14);
      v16 = objc_msgSend(v15, "eligibleClusterUUIDs", v36);
      uint64_t v17 = [v16 count];

      if (v17)
      {
        uint64_t v18 = [v15 eligibleClusterUUIDs];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __72__HDInsertRacingClustersOperation_performWithProfile_transaction_error___block_invoke;
        v44[3] = &unk_1E6303658;
        id v19 = v8;
        id v45 = v19;
        v46 = v41;
        v20 = objc_msgSend((id)v18, "hk_map:", v44);

        LOBYTE(v18) = +[HDRaceRouteClusterEntity pruneRaceRouteClustersWithEligibleEntities:v20 transaction:v19 error:a5];
        if ((v18 & 1) == 0)
        {
          LOBYTE(v34) = 0;
          goto LABEL_26;
        }
        goto LABEL_22;
      }
      v21 = [v40 syncIdentityManager];
      v22 = [v21 legacySyncIdentity];

      if (![v15 hasSyncIdentity]) {
        goto LABEL_13;
      }
      id v23 = v8;
      v24 = [v15 syncIdentity];
      id v43 = 0;
      v25 = +[HDSyncIdentity syncIdentityWithCodable:v24 error:&v43];
      id v26 = v43;

      if (v25)
      {
        v27 = [v40 syncIdentityManager];
        id v42 = v26;
        uint64_t v28 = [v27 concreteIdentityForIdentity:v25 shouldCreate:1 transaction:v23 error:&v42];
        id v29 = v42;

        if (v28)
        {

          v22 = (void *)v28;
          id v8 = v23;
          a5 = v37;
LABEL_13:
          int64_t provenance = v41->_provenance;
          v31 = [v22 entity];
          v34 = +[HDRaceRouteClusterEntity insertCodableCluster:syncProvenance:syncIdentity:transaction:error:](HDRaceRouteClusterEntity, "insertCodableCluster:syncProvenance:syncIdentity:transaction:error:", v15, provenance, [v31 persistentID], v8, a5);

          if (!v34)
          {

            v9 = v38;
            goto LABEL_26;
          }
          v9 = v38;
          goto LABEL_21;
        }
        _HKInitializeLogging();
        v33 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v36;
          id v52 = v29;
          _os_log_fault_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }
        v22 = 0;
        id v26 = v29;
        v9 = v38;
      }
      else
      {
        _HKInitializeLogging();
        v32 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v36;
          id v52 = v26;
          _os_log_fault_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }
      }

      id v8 = v23;
      a5 = v37;
LABEL_21:

      uint64_t v13 = v39;
LABEL_22:
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSArray *)v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  LOBYTE(v34) = 1;
LABEL_26:

  return (char)v34;
}

id __72__HDInsertRacingClustersOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v12 = 0;
  v5 = +[HDRaceRouteClusterEntity entityForClusterUUID:v3 transaction:v4 error:&v12];
  id v6 = v12;
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_FAULT))
    {
      v9 = v7;
      uint64_t v10 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      v16 = v3;
      __int16 v17 = 2114;
      id v18 = v6;
      id v11 = v10;
      _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "%{public}@: Failed to find eligible cluster (%{public}@) during pruning: %{public}@", buf, 0x20u);
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertRacingClustersOperation)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v8 = (void *)[v6 initWithArray:v7];

  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"clusters"];
  uint64_t v10 = [v5 decodeInt64ForKey:@"provenance"];

  id v11 = [(HDInsertRacingClustersOperation *)self initWithClusters:v9 provenance:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  clusters = self->_clusters;
  id v5 = a3;
  [v5 encodeObject:clusters forKey:@"clusters"];
  [v5 encodeInt64:self->_provenance forKey:@"provenance"];
}

- (NSArray)clusters
{
  return self->_clusters;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
}

@end