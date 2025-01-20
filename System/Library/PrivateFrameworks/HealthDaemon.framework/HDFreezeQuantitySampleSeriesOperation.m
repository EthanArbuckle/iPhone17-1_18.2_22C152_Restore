@interface HDFreezeQuantitySampleSeriesOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDFreezeQuantitySampleSeriesOperation)initWithCoder:(id)a3;
- (HDFreezeQuantitySampleSeriesOperation)initWithIdentifier:(id)a3 metadata:(id)a4 endDate:(id)a5;
- (NSDate)endDate;
- (NSDictionary)metadata;
- (NSUUID)frozenIdentifier;
- (NSUUID)identifier;
- (int64_t)freezeResult;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDFreezeQuantitySampleSeriesOperation

- (HDFreezeQuantitySampleSeriesOperation)initWithIdentifier:(id)a3 metadata:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDFreezeQuantitySampleSeriesOperation;
  v11 = [(HDFreezeQuantitySampleSeriesOperation *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    metadata = v11->_metadata;
    v11->_metadata = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v16;

    v11->_freezeResult = 0;
  }

  return v11;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  p_frozenIdentifier = &self->_frozenIdentifier;
  objc_storeStrong((id *)&self->_frozenIdentifier, self->_identifier);
  self->_freezeResult = 1;
  uint64_t v11 = [v10 protectedDatabase];
  uint64_t v12 = HDDataEntityPredicateForDataUUID();
  id v78 = 0;
  v13 = (void *)v11;
  id v14 = +[HDDataEntity anyInDatabase:v11 predicate:v12 error:&v78];
  id v15 = v78;

  if (v14)
  {
    v67 = a5;
    uint64_t v16 = [v14 hasSeriesDataWithTransaction:v10 error:a5];
    v17 = v16;
    v18 = v10;
    if (!v16)
    {
      id v24 = 0;
      LOBYTE(self) = 0;
      id v20 = v15;
LABEL_66:

LABEL_67:
      goto LABEL_68;
    }
    objc_super v19 = v13;
    id v20 = v15;
    if ([v16 BOOLValue])
    {

      v21 = [v14 countForSeriesWithTransaction:v18 error:v67];
      v22 = v21;
      if (v21)
      {
        if ([v21 integerValue] == 1)
        {
          v23 = [v14 HFDKeyWithDatabase:v19 error:v67];
          if (!v23)
          {
            id v20 = 0;
            id v24 = 0;
            LOBYTE(self) = 0;
LABEL_64:

            goto LABEL_65;
          }
        }
        else
        {
          v23 = 0;
        }
        v66 = v17;
        v26 = [v14 freezeWithEndDate:self->_endDate transaction:v18 profile:v9 error:v67];

        id v14 = v26;
        if (!v26)
        {
          id v20 = 0;
          id v24 = 0;
          LOBYTE(self) = 0;
          v17 = v66;
          goto LABEL_64;
        }
        v64 = v18;
        uint64_t v27 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v26, "persistentID"));
        v65 = (void *)v27;
        if (!self->_metadata)
        {
          id v24 = 0;
          v17 = v66;
          v36 = v67;
LABEL_44:
          if (!v23
            || +[HDQuantitySampleSeriesEntity deleteSeriesDataWithKey:database:error:](HDQuantitySampleSeriesEntity, "deleteSeriesDataWithKey:database:error:", [v23 longLongValue], v19, v36))
          {
            identifier = self->_identifier;
            id v74 = 0;
            uint64_t v45 = +[HDDataEntity objectWithUUID:identifier encodingOptions:0 profile:v9 error:&v74];
            id v20 = v74;
            v62 = v23;
            id v63 = v14;
            if (v45)
            {
              v71 = (HDFreezeQuantitySampleSeriesOperation *)v45;
              +[HDSQLiteEntity entityWithPersistentID:v65];
              v69 = id v73 = v20;
              uint64_t v46 = [v69 numberForProperty:@"provenance" transaction:v64 error:&v73];
              id v61 = v73;

              v68 = (void *)v46;
              if (v46)
              {
                v47 = [v9 dataProvenanceManager];
                id v72 = v61;
                uint64_t v48 = [v47 originProvenanceForPersistentID:v46 transaction:v64 error:&v72];
                id v20 = v72;

                if (v48)
                {
                  v49 = (void *)v48;
                }
                else
                {
                  _HKInitializeLogging();
                  v52 = *MEMORY[0x1E4F29F18];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    id v81 = v20;
                    _os_log_error_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_ERROR, "Failed to look up provenance for series after freezing: %{public}@", buf, 0xCu);
                  }
                  v49 = 0;
                }
              }
              else
              {
                _HKInitializeLogging();
                v51 = *MEMORY[0x1E4F29F18];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  id v20 = v61;
                  id v81 = v61;
                  _os_log_error_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_ERROR, "Failed to look up provenance ID for series after freezing: %{public}@", buf, 0xCu);
                  v49 = 0;
                }
                else
                {
                  v49 = 0;
                  id v20 = v61;
                }
                v17 = v66;
              }
              v53 = [v9 dataManager];
              v79 = v71;
              LOBYTE(self) = 1;
              v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
              [v53 shouldNotifyForDataObjects:v54 provenance:v49 database:v19 anchor:v65];

              v43 = v71;
              v18 = v64;
            }
            else
            {
              _HKInitializeLogging();
              v50 = *MEMORY[0x1E4F29F18];
              v18 = v64;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v81 = v20;
                _os_log_error_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_ERROR, "Failed to look up series after freezing: %{public}@", buf, 0xCu);
              }
              v43 = 0;
              LOBYTE(self) = 1;
            }
            id v14 = v63;
LABEL_62:

            v23 = v62;
            goto LABEL_63;
          }
LABEL_50:
          id v20 = 0;
          LOBYTE(self) = 0;
          v18 = v64;
LABEL_63:

          goto LABEL_64;
        }
        id v77 = 0;
        v28 = +[HDDataEntity objectWithID:v27 encodingOptions:0 profile:v9 error:&v77];
        id v29 = v77;
        if (!v28)
        {
          if (v29)
          {
            self = (HDFreezeQuantitySampleSeriesOperation *)v29;
            v17 = v66;
            v39 = v67;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Could not find sample with ID %@", v65);
            self = (HDFreezeQuantitySampleSeriesOperation *)(id)objc_claimAutoreleasedReturnValue();
            v17 = v66;
            v39 = v67;
            if (!self)
            {
              id v20 = 0;
              id v24 = 0;
              goto LABEL_63;
            }
          }
          v62 = v23;
          if (v39) {
            id *v39 = self;
          }
          else {
            _HKLogDroppedError();
          }

          id v20 = 0;
          id v24 = 0;
          v43 = self;
          LOBYTE(self) = 0;
          goto LABEL_62;
        }
        v58 = v29;
        [v28 _setMetadata:self->_metadata];
        v30 = [v28 sourceRevision];
        v31 = [v30 source];
        uint64_t v32 = [v31 _sourceID];

        id v75 = 0;
        id v76 = 0;
        v59 = (void *)v32;
        v60 = v28;
        int64_t v33 = +[HDDataEntity shouldInsertObject:v28 sourceID:v32 profile:v9 transaction:v64 objectToReplace:&v76 objectID:&v75 error:v67];
        id v34 = v76;
        id v35 = v75;
        v56 = v35;
        v57 = v34;
        if (v33 == 2)
        {
          int v40 = 0;
          id v24 = 0;
          id v14 = v26;
          v17 = v66;
          v36 = v67;
          goto LABEL_43;
        }
        if (v33 == 1)
        {
          v36 = v67;
          id v14 = v26;
          v17 = v66;
          if (+[HDQuantitySampleSeriesEntity deleteSeriesWithID:v65 deleteSeriesData:1 profile:v9 transaction:v64 error:v67])
          {
            uint64_t v37 = [v34 UUID];
            v38 = *p_frozenIdentifier;
            *p_frozenIdentifier = (NSUUID *)v37;

            id v24 = 0;
LABEL_35:
            int v40 = 1;
            goto LABEL_43;
          }
          int v40 = 0;
          id v24 = 0;
        }
        else
        {
          id v24 = v35;
          v41 = [v9 metadataManager];
          v36 = v67;
          int v42 = objc_msgSend(v41, "insertMetadata:forObjectID:sourceID:externalSyncObjectCode:objectDeleted:error:", self->_metadata, v65, v59, objc_msgSend(v60, "_externalSyncObjectCode"), 0, v67);

          if (v42
            && +[HDQuantitySampleSeriesEntity replaceObjectID:v24 replacementObjectID:v65 deleteOriginalSeriesData:1 profile:v9 transaction:v64 error:v67])
          {
            id v14 = v26;
            v17 = v66;
            goto LABEL_35;
          }
          int v40 = 0;
          id v14 = v26;
          v17 = v66;
        }
LABEL_43:

        if (!v40) {
          goto LABEL_50;
        }
        goto LABEL_44;
      }
      id v20 = 0;
      id v24 = 0;
      LOBYTE(self) = 0;
    }
    else
    {
      v25 = *p_frozenIdentifier;
      *p_frozenIdentifier = 0;

      self->_freezeResult = 2;
      v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "persistentID"));
      LOBYTE(self) = +[HDQuantitySampleSeriesEntity deleteSeriesWithID:v22 deleteSeriesData:1 profile:v9 transaction:v18 error:v67];
      id v24 = 0;
    }
LABEL_65:

    v13 = v19;
    goto LABEL_66;
  }
  if (v15)
  {
    id v14 = v15;
LABEL_13:
    v18 = v10;
    if (a5)
    {
      id v14 = v14;
      id v24 = 0;
      LOBYTE(self) = 0;
      *a5 = v14;
    }
    else
    {
      _HKLogDroppedError();
      id v24 = 0;
      LOBYTE(self) = 0;
    }
    id v20 = v14;
    goto LABEL_67;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Unable to find quantity series '%@' when freezing."", self->_identifier);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14) {
    goto LABEL_13;
  }
  id v20 = 0;
  id v24 = 0;
  LOBYTE(self) = 0;
  v18 = v10;
LABEL_68:

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDFreezeQuantitySampleSeriesOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
  v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"meta"];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"end"];

  id v9 = [(HDFreezeQuantitySampleSeriesOperation *)self initWithIdentifier:v5 metadata:v7 endDate:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDFreezeQuantitySampleSeriesOperation;
  id v4 = a3;
  [(HDJournalEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, @"id", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_metadata forKey:@"meta"];
  [v4 encodeObject:self->_endDate forKey:@"end"];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSUUID)frozenIdentifier
{
  return self->_frozenIdentifier;
}

- (int64_t)freezeResult
{
  return self->_freezeResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end