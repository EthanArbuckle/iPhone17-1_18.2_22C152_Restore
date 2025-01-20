@interface _HDDataInsertionJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (_HDDataInsertionJournalEntry)initWithCoder:(id)a3;
- (id)description;
- (id)initWithDataObject:(void *)a3 provenance:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDDataInsertionJournalEntry

- (id)initWithDataObject:(void *)a3 provenance:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    uint64_t v8 = [a1 init];
    a1 = (id *)v8;
    if (v8)
    {
      objc_storeStrong((id *)(v8 + 8), a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@ - %@", v5, self->_dataObject];

  return v6;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v76 = a4;
  id v6 = [v76 deviceManager];
  id v87 = 0;
  v70 = [v6 deviceEntityForNoDeviceWithError:&v87];
  id v7 = v87;

  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v69 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v83 objects:v93 count:16];
  id v73 = v8;
  if (v9)
  {
    uint64_t v10 = v9;
    id v74 = *(id *)v84;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(id *)v84 != v74) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v83 + 1) + 8 * v11);
        if (v12)
        {
          id v13 = *(id *)(v12 + 16);
          v14 = *(void **)(v12 + 8);
        }
        else
        {
          id v13 = 0;
          v14 = 0;
        }
        id v15 = v14;
        v16 = [v15 _sourceBundleIdentifier];

        v17 = [v13 sourceID];

        if (v17)
        {
          id v18 = v7;
          goto LABEL_12;
        }
        v19 = [v76 sourceManager];
        id v82 = v7;
        v20 = [v19 localSourceForBundleIdentifier:v16 error:&v82];
        id v18 = v82;

        if (v20)
        {
          v21 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v20, "persistentID"));
          [v13 setSourceID:v21];

LABEL_12:
          v22 = [v13 deviceID];

          if (!v22)
          {
            if (!v70)
            {
              _HKInitializeLogging();
              v34 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "missing no device entity!", buf, 2u);
              }
              [NSString stringWithFormat:@"%@", objc_opt_class(), v68];
              goto LABEL_29;
            }
            v23 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v70, "persistentID"));
            [v13 setDeviceID:v23];
          }
          v24 = [v13 sourceVersion];

          if (!v24) {
            [v13 setSourceVersion:&stru_1F1728D60];
          }
          v25 = [v13 sourceID];

          if (v25)
          {
            if (!v16) {
              goto LABEL_40;
            }
            v26 = (void *)[[NSString alloc] initWithFormat:@"%@-%ld", v16, objc_msgSend(v13, "hash")];
            uint64_t v27 = [v8 objectForKeyedSubscript:v16];
            if (v27)
            {
              v28 = (HDSourceEntity *)v27;
              v29 = [v8 objectForKeyedSubscript:v26];

              if (!v29) {
LABEL_33:
              }
                [v8 setObject:v28 forKeyedSubscript:v26];
              id v35 = [v71 objectForKeyedSubscript:v26];
              if (!v35)
              {
                id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [v71 setObject:v35 forKeyedSubscript:v26];
                [v69 setObject:v13 forKeyedSubscript:v26];
              }
              if (v12) {
                uint64_t v42 = *(void *)(v12 + 8);
              }
              else {
                uint64_t v42 = 0;
              }
              [v35 addObject:v42];
              goto LABEL_39;
            }
            v40 = [HDSourceEntity alloc];
            v41 = [v13 sourceID];
            v28 = -[HDSQLiteEntity initWithPersistentID:](v40, "initWithPersistentID:", [v41 longLongValue]);

            [v8 setObject:v28 forKeyedSubscript:v16];
            goto LABEL_33;
          }
          _HKInitializeLogging();
          v30 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v90 = (uint64_t)v16;
            __int16 v91 = 2114;
            id v92 = v18;
            v31 = v30;
            v32 = "Missing source for %{public}@: %{public}@.";
LABEL_43:
            _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);
            goto LABEL_25;
          }
          goto LABEL_25;
        }
        _HKInitializeLogging();
        v33 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v90 = (uint64_t)v16;
          __int16 v91 = 2114;
          id v92 = v18;
          v31 = v33;
          v32 = "missing source for %{public}@: %{public}@";
          goto LABEL_43;
        }
LABEL_25:
        [NSString stringWithFormat:@"%@-%@", objc_opt_class(), v16];
        v26 = LABEL_29:;
        v28 = [v76 daemon];
        id v35 = [(HDSourceEntity *)v28 autoBugCaptureReporter];
        v36 = NSNumber;
        if (v12) {
          v37 = *(void **)(v12 + 16);
        }
        else {
          v37 = 0;
        }
        id v38 = v37;
        v39 = objc_msgSend(v36, "numberWithLongLong:", objc_msgSend(v38, "syncProvenance"));
        [v35 reportJournalFailureWithErrorDescription:v26 provenance:v39 error:v18];

        id v8 = v73;
LABEL_39:

LABEL_40:
        id v7 = v18;

        ++v11;
      }
      while (v10 != v11);
      uint64_t v43 = [obj countByEnumeratingWithState:&v83 objects:v93 count:16];
      uint64_t v10 = v43;
    }
    while (v43);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v75 = [v71 allKeys];
  uint64_t v44 = [v75 countByEnumeratingWithState:&v78 objects:v88 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v79;
    while (2)
    {
      uint64_t v47 = 0;
      v48 = v7;
      do
      {
        if (*(void *)v79 != v46) {
          objc_enumerationMutation(v75);
        }
        v49 = *(void **)(*((void *)&v78 + 1) + 8 * v47);
        _HKInitializeLogging();
        v50 = (void *)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
        {
          v65 = v50;
          v66 = [v71 objectForKeyedSubscript:v49];
          uint64_t v67 = [v66 count];
          *(_DWORD *)buf = 134218242;
          uint64_t v90 = v67;
          __int16 v91 = 2112;
          id v92 = v49;
          _os_log_debug_impl(&dword_1BCB7D000, v65, OS_LOG_TYPE_DEBUG, "Inserting %ld objects for source: %@", buf, 0x16u);
        }
        v51 = [v69 objectForKeyedSubscript:v49];
        if ([v51 syncIdentity] == -1)
        {
          v52 = [v76 syncIdentityManager];
          v53 = [v52 legacySyncIdentity];
          v54 = [v53 entity];
          objc_msgSend(v51, "setSyncIdentity:", objc_msgSend(v54, "persistentID"));
        }
        v55 = [v76 dataManager];
        v56 = [v71 objectForKeyedSubscript:v49];
        id v77 = v48;
        char v57 = [v55 insertDataObjects:v56 withProvenance:v51 creationDate:1 skipInsertionFilter:1 updateSourceOrder:0 resolveAssociations:&v77 error:2.22507386e-308];
        id v7 = v77;

        if ((v57 & 1) == 0)
        {
          _HKInitializeLogging();
          v58 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v90 = (uint64_t)v49;
            __int16 v91 = 2114;
            id v92 = v7;
            _os_log_error_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_ERROR, "Failed to apply for source: %@: %{public}@", buf, 0x16u);
          }
          if (objc_msgSend(v7, "hk_isTransactionInterruptedError"))
          {

            id v8 = v73;
            goto LABEL_66;
          }
          v59 = [NSString stringWithFormat:@"%@", v49];
          v60 = [v76 daemon];
          v61 = [v60 autoBugCaptureReporter];
          v62 = NSNumber;
          v63 = [v69 objectForKeyedSubscript:v49];
          v64 = objc_msgSend(v62, "numberWithLongLong:", objc_msgSend(v63, "syncProvenance"));
          [v61 reportJournalFailureWithErrorDescription:v59 provenance:v64 error:v7];
        }
        ++v47;
        v48 = v7;
        id v8 = v73;
      }
      while (v45 != v47);
      uint64_t v45 = [v75 countByEnumeratingWithState:&v78 objects:v88 count:16];
      if (v45) {
        continue;
      }
      break;
    }
  }
LABEL_66:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDDataInsertionJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataObject"];
  if ([v4 containsValueForKey:@"source"])
  {
    if ([v4 decodeIntegerForKey:@"source"] == 16) {
      +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 1, -1, @"UnknownDevice", @"[8.0, 8.2"), &v10, &stru_1F1728D60, &stru_1F1728D60, 0, 0, 0, HDDataProvenanceOperatingSystemVersion8_0_0, 0);
    }
    else {
      +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 0, -1, @"UnknownDevice", @"[8.0, 8.2"), &v10, &stru_1F1728D60, &stru_1F1728D60, 0, 0, 0, HDDataProvenanceOperatingSystemVersion8_0_0, 0);
    }
  }
  else
  {
    if (![v4 containsValueForKey:@"provenance"])
    {
      id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullProvenance"];
      goto LABEL_9;
    }
    +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", [v4 decodeIntegerForKey:@"provenance"], -1, @"UnknownDevice", @"[8.2, 9.0"), &v10, &stru_1F1728D60, &stru_1F1728D60, 0, 0, 0, HDDataProvenanceOperatingSystemVersion8_2_0, 0);
  id v6 = };
LABEL_9:
  id v7 = v6;
  id v8 = (_HDDataInsertionJournalEntry *)-[_HDDataInsertionJournalEntry initWithDataObject:provenance:]((id *)&self->super.super.isa, v5, v6);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  dataObject = self->_dataObject;
  id v5 = a3;
  [v5 encodeObject:dataObject forKey:@"dataObject"];
  [v5 encodeObject:self->_provenance forKey:@"fullProvenance"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenance, 0);

  objc_storeStrong((id *)&self->_dataObject, 0);
}

@end