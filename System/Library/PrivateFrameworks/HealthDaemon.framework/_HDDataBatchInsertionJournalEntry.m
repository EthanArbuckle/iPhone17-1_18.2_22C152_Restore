@interface _HDDataBatchInsertionJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (_HDDataBatchInsertionJournalEntry)initWithCoder:(id)a3;
- (id)description;
- (id)initWithCodableObjectCollection:(void *)a3 provenance:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDDataBatchInsertionJournalEntry

- (id)initWithCodableObjectCollection:(void *)a3 provenance:
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

- (void)encodeWithCoder:(id)a3
{
  collection = self->_collection;
  id v6 = a3;
  v5 = [(HDCodableObjectCollection *)collection data];
  [v6 encodeObject:v5 forKey:@"codableCollectionData"];

  [v6 encodeObject:self->_provenance forKey:@"fullProvenance"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenance, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDDataBatchInsertionJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codableCollectionData"];
  id v6 = [[HDCodableObjectCollection alloc] initWithData:v5];
  if ([v4 containsValueForKey:@"provenance"])
  {
    +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", [v4 decodeIntegerForKey:@"provenance"], -1, @"UnknownDevice", @"[8.2, 9.0"), &v11, &stru_1F1728D60, &stru_1F1728D60, 0, 0, 0, HDDataProvenanceOperatingSystemVersion8_2_0, 0);
    id v7 = LABEL_6:;
    goto LABEL_7;
  }
  if (![v4 containsValueForKey:@"fullProvenance"])
  {
    +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 0, -1, @"UnknownDevice", @"[8.0, 8.2"), &v11, &stru_1F1728D60, &stru_1F1728D60, 0, 0, 0, HDDataProvenanceOperatingSystemVersion8_0_0, 0);
    goto LABEL_6;
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullProvenance"];
LABEL_7:
  uint64_t v8 = v7;
  v9 = (_HDDataBatchInsertionJournalEntry *)-[_HDDataBatchInsertionJournalEntry initWithCodableObjectCollection:provenance:]((id *)&self->super.super.isa, v6, v7);

  return v9;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v94 = a4;
  id v6 = [v94 deviceManager];
  id v105 = 0;
  uint64_t v7 = [v6 deviceEntityForNoDeviceWithError:&v105];
  id v8 = v105;

  v87 = (void *)v7;
  if (!v7 && objc_msgSend(v8, "hk_isTransactionInterruptedError"))
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "Aborting merge of _HDDataBatchInsertionJournalEntry due to interruption", buf, 2u);
    }
    goto LABEL_108;
  }
  id v91 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v89 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v88 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v86 = v5;
  id obj = v5;
  uint64_t v93 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
  if (v93)
  {
    uint64_t v92 = *(void *)v102;
    unint64_t v10 = 0x1EBA09000uLL;
LABEL_7:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v102 != v92) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v101 + 1) + 8 * v11);
      if (v12) {
        v13 = *(void **)(v12 + 8);
      }
      else {
        v13 = 0;
      }
      id v14 = v13;
      v15 = [v14 sourceBundleIdentifier];
      if (!v15)
      {
        v16 = [v14 source];
        v15 = [v16 bundleIdentifier];

        if (!v15)
        {
          _HKInitializeLogging();
          v55 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_ERROR, "missing collection source identifier during journal application", buf, 2u);
          }
          v15 = [NSString stringWithFormat:@"%@", objc_opt_class()];
          v30 = [v94 daemon];
          v32 = [v30 autoBugCaptureReporter];
          v56 = NSNumber;
          if (v12) {
            v57 = *(void **)(v12 + 16);
          }
          else {
            v57 = 0;
          }
          id v46 = v57;
          objc_msgSend(v56, "numberWithLongLong:", objc_msgSend(v46, "syncProvenance"));
          id v42 = (id)objc_claimAutoreleasedReturnValue();
          [(HDSourceEntity *)v32 reportJournalFailureWithErrorDescription:v15 provenance:v42 error:v8];
          goto LABEL_73;
        }
      }
      if (v12) {
        v17 = *(void **)(v12 + *(int *)(v10 + 2776));
      }
      else {
        v17 = 0;
      }
      v18 = [v17 sourceID];

      if (v18)
      {
        id v19 = v8;
        if (!v12) {
          goto LABEL_38;
        }
      }
      else
      {
        v35 = [v94 sourceManager];
        id v100 = v8;
        v36 = [v35 localSourceForBundleIdentifier:v15 error:&v100];
        id v19 = v100;

        if (!v36)
        {
          _HKInitializeLogging();
          v58 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v108 = (uint64_t)v15;
            __int16 v109 = 2114;
            id v110 = v19;
            _os_log_error_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_ERROR, "missing source for %{public}@: %{public}@", buf, 0x16u);
          }
          if (objc_msgSend(v19, "hk_isTransactionInterruptedError"))
          {

            id v8 = v19;
LABEL_106:

            goto LABEL_107;
          }
          [NSString stringWithFormat:@"%@-%@", objc_opt_class(), v15];
          goto LABEL_69;
        }
        if (v12) {
          v37 = *(void **)(v12 + *(int *)(v10 + 2776));
        }
        else {
          v37 = 0;
        }
        v38 = NSNumber;
        id v39 = v37;
        v40 = objc_msgSend(v38, "numberWithLongLong:", objc_msgSend(v36, "persistentID"));
        [v39 setSourceID:v40];

        if (!v12)
        {
LABEL_38:
          v20 = 0;
          goto LABEL_19;
        }
      }
      v20 = *(void **)(v12 + *(int *)(v10 + 2776));
LABEL_19:
      v21 = [v20 sourceID];

      if (!v21)
      {
        _HKInitializeLogging();
        v41 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v108 = (uint64_t)v15;
          _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "Found a source for identifier %@, but it had no ID; skipping",
            buf,
            0xCu);
        }
        v30 = [NSString stringWithFormat:@"%@-%@", objc_opt_class(), v15];
        v32 = [v94 daemon];
        id v42 = [(HDSourceEntity *)v32 autoBugCaptureReporter];
        v43 = NSNumber;
        if (v12) {
          v44 = *(void **)(v12 + 16);
        }
        else {
          v44 = 0;
        }
        id v45 = v44;
        objc_msgSend(v43, "numberWithLongLong:", objc_msgSend(v45, "syncProvenance"));
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        [v42 reportJournalFailureWithErrorDescription:v30 provenance:v46 error:v19];

        goto LABEL_72;
      }
      if (v12) {
        v22 = *(void **)(v12 + *(int *)(v10 + 2776));
      }
      else {
        v22 = 0;
      }
      v23 = [v22 deviceID];

      if (v23)
      {
        if (v12) {
          goto LABEL_24;
        }
LABEL_48:
        v24 = 0;
        goto LABEL_25;
      }
      if (v87)
      {
        if (v12) {
          v47 = *(void **)(v12 + *(int *)(v10 + 2776));
        }
        else {
          v47 = 0;
        }
        v48 = NSNumber;
        id v49 = v47;
        v50 = objc_msgSend(v48, "numberWithLongLong:", objc_msgSend(v87, "persistentID"));
        [v49 setDeviceID:v50];

        if (!v12) {
          goto LABEL_48;
        }
LABEL_24:
        v24 = *(void **)(v12 + *(int *)(v10 + 2776));
LABEL_25:
        v25 = [v24 sourceVersion];

        if (!v25)
        {
          if (v12) {
            v26 = *(void **)(v12 + *(int *)(v10 + 2776));
          }
          else {
            v26 = 0;
          }
          [v26 setSourceVersion:&stru_1F1728D60];
        }
        id v27 = [NSString alloc];
        if (v12) {
          v28 = *(void **)(v12 + *(int *)(v10 + 2776));
        }
        else {
          v28 = 0;
        }
        id v29 = v28;
        v30 = (void *)[v27 initWithFormat:@"%@-%ld", v15, objc_msgSend(v29, "hash")];

        uint64_t v31 = [v89 objectForKeyedSubscript:v15];
        if (v31)
        {
          v32 = (HDSourceEntity *)v31;
          v33 = [v89 objectForKeyedSubscript:v30];

          if (!v33)
          {
            v34 = v89;
            goto LABEL_52;
          }
        }
        else
        {
          v51 = [HDSourceEntity alloc];
          if (v12) {
            v52 = *(void **)(v12 + 16);
          }
          else {
            v52 = 0;
          }
          v53 = [v52 sourceID];
          v32 = -[HDSQLiteEntity initWithPersistentID:](v51, "initWithPersistentID:", [v53 longLongValue]);

          [v89 setObject:v32 forKeyedSubscript:v15];
          v34 = v89;
LABEL_52:
          [v34 setObject:v32 forKeyedSubscript:v30];
        }
        id v42 = [v91 objectForKeyedSubscript:v30];
        if (!v42)
        {
          id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v91 setObject:v42 forKeyedSubscript:v30];
          if (v12) {
            uint64_t v54 = *(void *)(v12 + 16);
          }
          else {
            uint64_t v54 = 0;
          }
          [v88 setObject:v54 forKeyedSubscript:v30];
        }
        id v46 = [v14 decodedObjects];
        if (v46) {
          [v42 addObjectsFromArray:v46];
        }
        goto LABEL_72;
      }
      [NSString stringWithFormat:@"%@", objc_opt_class(), v85];
      v30 = LABEL_69:;
      v32 = [v94 daemon];
      id v42 = [(HDSourceEntity *)v32 autoBugCaptureReporter];
      if (v12) {
        v59 = *(void **)(v12 + 16);
      }
      else {
        v59 = 0;
      }
      v60 = NSNumber;
      id v61 = v59;
      objc_msgSend(v60, "numberWithLongLong:", objc_msgSend(v61, "syncProvenance"));
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      [v42 reportJournalFailureWithErrorDescription:v30 provenance:v46 error:v19];

LABEL_72:
      id v8 = v19;
LABEL_73:

      ++v11;
      unint64_t v10 = 0x1EBA09000;
      if (v93 == v11)
      {
        uint64_t v62 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
        uint64_t v93 = v62;
        if (v62) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obj = [v91 allKeys];
  uint64_t v63 = [obj countByEnumeratingWithState:&v96 objects:v106 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v97;
    do
    {
      uint64_t v66 = 0;
      v67 = v8;
      do
      {
        if (*(void *)v97 != v65) {
          objc_enumerationMutation(obj);
        }
        v68 = *(void **)(*((void *)&v96 + 1) + 8 * v66);
        _HKInitializeLogging();
        v69 = (void *)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
        {
          v82 = v69;
          v83 = [v91 objectForKeyedSubscript:v68];
          uint64_t v84 = [v83 count];
          *(_DWORD *)buf = 134218242;
          uint64_t v108 = v84;
          __int16 v109 = 2112;
          id v110 = v68;
          _os_log_debug_impl(&dword_1BCB7D000, v82, OS_LOG_TYPE_DEBUG, "Inserting %ld objects for source: %@", buf, 0x16u);
        }
        id v14 = [v88 objectForKeyedSubscript:v68];
        if ([v14 syncIdentity] == -1)
        {
          v70 = [v94 syncIdentityManager];
          v71 = [v70 legacySyncIdentity];
          v72 = [v71 entity];
          objc_msgSend(v14, "setSyncIdentity:", objc_msgSend(v72, "persistentID"));
        }
        v73 = [v94 dataManager];
        v74 = [v91 objectForKeyedSubscript:v68];
        BOOL v75 = [v14 syncProvenance] == 0;
        id v95 = v67;
        char v76 = [v73 insertDataObjects:v74 withProvenance:v14 creationDate:1 skipInsertionFilter:v75 updateSourceOrder:0 resolveAssociations:&v95 error:2.22507386e-308];
        id v8 = v95;

        if ((v76 & 1) == 0)
        {
          _HKInitializeLogging();
          v77 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v108 = (uint64_t)v68;
            __int16 v109 = 2114;
            id v110 = v8;
            _os_log_error_impl(&dword_1BCB7D000, v77, OS_LOG_TYPE_ERROR, "Failed to apply for source: %@: %{public}@", buf, 0x16u);
          }
          if (objc_msgSend(v8, "hk_isTransactionInterruptedError")) {
            goto LABEL_106;
          }
          v78 = [NSString stringWithFormat:@"%@", v68];
          v79 = [v94 daemon];
          v80 = [v79 autoBugCaptureReporter];
          v81 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "syncProvenance"));
          [v80 reportJournalFailureWithErrorDescription:v78 provenance:v81 error:v8];
        }
        ++v66;
        v67 = v8;
      }
      while (v64 != v66);
      uint64_t v64 = [obj countByEnumeratingWithState:&v96 objects:v106 count:16];
    }
    while (v64);
  }
LABEL_107:
  id v5 = v86;

LABEL_108:
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@ - %@", v5, self->_collection];

  return v6;
}

@end