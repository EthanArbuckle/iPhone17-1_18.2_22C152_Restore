@interface HDInsertWorkoutZonesAssociationOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDInsertWorkoutZonesAssociationOperation)initWithCodableWorkoutZoneAssociations:(id)a3 syncProvenance:(int64_t)a4;
- (HDInsertWorkoutZonesAssociationOperation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDInsertWorkoutZonesAssociationOperation

- (HDInsertWorkoutZonesAssociationOperation)initWithCodableWorkoutZoneAssociations:(id)a3 syncProvenance:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDInsertWorkoutZonesAssociationOperation;
  v7 = [(HDInsertWorkoutZonesAssociationOperation *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    workoutZoneAssociations = v7->_workoutZoneAssociations;
    v7->_workoutZoneAssociations = (NSArray *)v8;

    v7->_syncProvenance = a4;
  }

  return v7;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v29 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obj = self->_workoutZoneAssociations;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v32;
    *(void *)&long long v6 = 138543618;
    long long v25 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_super v11 = (void *)MEMORY[0x1E4F29128];
        v12 = objc_msgSend(v10, "workoutUUID", v25);
        v13 = objc_msgSend(v11, "hk_UUIDWithData:", v12);

        v14 = (void *)MEMORY[0x1E4F29128];
        v15 = [v10 zonesSampleUUID];
        v16 = objc_msgSend(v14, "hk_UUIDWithData:", v15);

        v17 = [v10 syncIdentity];
        id v30 = 0;
        v18 = +[HDSyncIdentity syncIdentityWithCodable:v17 error:&v30];
        id v19 = v30;

        if (v18)
        {
          v35 = v16;
          v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
          BOOL v21 = +[HDWorkoutZonesAssociationEntity associateSyncedZonesSamplesWithUUIDs:v20 withWorkoutUUID:v13 syncIdentity:v18 syncProvenance:self->_syncProvenance transaction:v29 error:a5];

          if (!v21)
          {

            BOOL v23 = 0;
            goto LABEL_14;
          }
        }
        else
        {
          _HKInitializeLogging();
          v22 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v25;
            v37 = self;
            __int16 v38 = 2114;
            id v39 = v19;
            _os_log_fault_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_FAULT, "%{public}@: ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v7);
  }
  BOOL v23 = 1;
LABEL_14:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertWorkoutZonesAssociationOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"associations"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"syncProvenance"];

  uint64_t v7 = [(HDInsertWorkoutZonesAssociationOperation *)self initWithCodableWorkoutZoneAssociations:v5 syncProvenance:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  workoutZoneAssociations = self->_workoutZoneAssociations;
  id v5 = a3;
  [v5 encodeObject:workoutZoneAssociations forKey:@"associations"];
  [v5 encodeInt64:self->_syncProvenance forKey:@"syncProvenance"];
}

- (void).cxx_destruct
{
}

@end