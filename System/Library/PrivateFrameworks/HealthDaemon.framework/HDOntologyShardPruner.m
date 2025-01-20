@interface HDOntologyShardPruner
- (BOOL)pruneOntologyWithOptions:(unint64_t)a3 error:(id *)a4;
- (HDOntologyShardPruner)init;
- (HDOntologyShardPruner)initWithOntologyUpdateCoordinator:(id)a3;
- (HDOntologyUpdateCoordinator)updateCoordinator;
- (id)_importerClassesBySchemaType;
- (id)_orderedSchemaTypes;
- (int64_t)purgeSpaceForUrgency:(int)a3 volume:(id)a4;
- (int64_t)purgeableSpaceForUrgency:(int)a3 volume:(id)a4;
@end

@implementation HDOntologyShardPruner

- (HDOntologyShardPruner)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyShardPruner)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDOntologyShardPruner;
  v5 = [(HDOntologyShardPruner *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
  }

  return v6;
}

- (BOOL)pruneOntologyWithOptions:(unint64_t)a3 error:(id *)a4
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v6 = HKLogHealthOntology();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = HKStringFromHKOntologyPruneOptions();
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Garbage collect and prune ontology with options %{pubic}@", buf, 0x16u);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  id v90 = 0;
  if (self)
  {
    v9 = (void *)MEMORY[0x1E4F65D08];
    v10 = objc_msgSend(MEMORY[0x1E4F65D10], "containsPredicateWithProperty:values:", @"desired_state", &unk_1F17E90C0, Current);
    *(void *)buf = v10;
    v11 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"available_state" notEqualToValue:&unk_1F17EAF98];
    *(void *)&buf[8] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:2];
    v13 = [v9 predicateMatchingAllPredicates:v12];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
    v15 = [WeakRetained shardRegistry];
    v16 = [v15 entriesWithPredicate:v13 orderingTerms:0 error:&v90];

    if (v16)
    {
      unint64_t v82 = a3;
      id v17 = objc_loadWeakRetained((id *)&self->_updateCoordinator);
      v18 = [v17 shardRegistry];
      int v19 = [v18 deleteStagedFilesNotMatchingEntries:v16 error:&v90];

      if (v19)
      {
        v20 = (void *)MEMORY[0x1E4F65D08];
        v21 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"desired_state" notEqualToValue:&unk_1F17EAF98];
        *(void *)buf = v21;
        v22 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"current_version" notEqualToValue:&unk_1F17EAFB0];
        *(void *)&buf[8] = v22;
        v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:2];
        v24 = [v20 predicateMatchingAllPredicates:v23];

        id v25 = objc_loadWeakRetained((id *)&self->_updateCoordinator);
        v26 = [v25 shardRegistry];
        v27 = [v26 entriesWithPredicate:v24 orderingTerms:0 error:&v90];

        if (v27)
        {
          location = (id *)&self->_updateCoordinator;
          id v80 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v28 = -[HDOntologyShardPruner _importerClassesBySchemaType](self);
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          uint64_t v86 = [v28 countByEnumeratingWithState:&v91 objects:buf count:16];
          if (v86)
          {
            unint64_t v29 = v82;
            unint64_t v88 = v82 & 1;
            uint64_t v85 = *(void *)v92;
            char v79 = 1;
            v83 = v28;
            v84 = self;
            v81 = v27;
            do
            {
              for (uint64_t i = 0; i != v86; ++i)
              {
                if (*(void *)v92 != v85) {
                  objc_enumerationMutation(v28);
                }
                v31 = *(void **)(*((void *)&v91 + 1) + 8 * i);
                v32 = (void *)[v28 objectForKeyedSubscript:v31];
                id v33 = v31;
                *(void *)v102 = MEMORY[0x1E4F143A8];
                *(void *)&v102[8] = 3221225472;
                *(void *)&v102[16] = __56__HDOntologyShardPruner__entriesWithSchemaType_entries___block_invoke;
                v103 = &unk_1E62F4A08;
                id v34 = v33;
                *(void *)v104 = v34;
                v35 = objc_msgSend(v27, "hk_filter:", v102);

                if ([v35 count] | v88)
                {
                  v87 = v35;
                  id v36 = v35;
                  id v89 = v34;
                  CFAbsoluteTimeGetCurrent();
                  _HKInitializeLogging();
                  v37 = HKLogHealthOntology();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    v38 = HKStringFromHKOntologyPruneOptions();
                    *(_DWORD *)v102 = 138544130;
                    *(void *)&v102[4] = self;
                    *(_WORD *)&v102[12] = 2114;
                    *(void *)&v102[14] = v89;
                    *(_WORD *)&v102[22] = 2114;
                    v103 = v32;
                    *(_WORD *)v104 = 2114;
                    *(void *)&v104[2] = v38;
                    _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Request to prune content for schema type %{public}@ with %{public}@ %{public}@", v102, 0x2Au);
                  }
                  id v95 = 0;
                  id v39 = v36;
                  v40 = [(HDOntologyShardPruner *)self updateCoordinator];
                  v41 = [v40 shardRegistry];

                  v42 = [v32 willPruneEntries:v39 options:v29 shardRegistry:v41 error:&v95];
                  v43 = v42;
                  if (v42)
                  {
                    if ([v42 count] | v88)
                    {
                      v44 = [MEMORY[0x1E4F1C9C8] date];
                      *(void *)v109 = MEMORY[0x1E4F143A8];
                      *(void *)&v109[8] = 3221225472;
                      *(void *)&v109[16] = __78__HDOntologyShardPruner__pruneEntries_options_schemaType_importerClass_error___block_invoke;
                      v110 = &unk_1E62F49C0;
                      id v45 = v44;
                      id v111 = v45;
                      v46 = objc_msgSend(v43, "hk_map:", v109);

                      if ([v41 insertEntries:v46 error:&v95])
                      {
                        id v47 = v39;
                        id v48 = objc_loadWeakRetained(location);
                        id v96 = 0;
                        *(void *)v102 = MEMORY[0x1E4F143A8];
                        *(void *)&v102[8] = 3221225472;
                        *(void *)&v102[16] = __64__HDOntologyShardPruner__persistPruneRequestMetadataForEntries___block_invoke;
                        v103 = &unk_1E62F4A30;
                        id v49 = v47;
                        *(void *)v104 = v49;
                        *(void *)&v104[8] = self;
                        char v50 = [v48 performOntologyTransactionForWrite:1 databaseTransaction:0 error:&v96 transactionHandler:v102];
                        id v51 = v96;

                        if ((v50 & 1) == 0)
                        {
                          _HKInitializeLogging();
                          v52 = HKLogHealthOntology();
                          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v61 = [v49 count];
                            *(_DWORD *)v112 = 138543874;
                            *(void *)&v112[4] = v84;
                            __int16 v113 = 2048;
                            uint64_t v114 = v61;
                            __int16 v115 = 2114;
                            id v116 = v51;
                            _os_log_error_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_ERROR, "%{public}@: error persisting prune request metadata for %ld entries: %{public}@", v112, 0x20u);
                          }
                        }
                        unint64_t v29 = v82;
                        v43 = [v32 pruneEntries:v46 options:v82 shardRegistry:v41 error:&v95];
                        self = v84;
                        v27 = v81;
                      }
                      else
                      {
                        v43 = 0;
                      }
                    }
                    else
                    {
                      v46 = v43;
                      v43 = (void *)MEMORY[0x1E4F1CBF0];
                    }
                  }
                  id v53 = v95;
                  _HKInitializeLogging();
                  v54 = HKLogHealthOntology();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v55 = [v43 count];
                    uint64_t v56 = [v39 count];
                    CFAbsoluteTimeGetCurrent();
                    HKDiagnosticStringFromDuration();
                    id v57 = (id)objc_claimAutoreleasedReturnValue();
                    v58 = &stru_1F1728D60;
                    if (!v43) {
                      v58 = (__CFString *)[[NSString alloc] initWithFormat:@": %@", v53];
                    }
                    *(_DWORD *)v102 = 138544898;
                    *(void *)&v102[4] = v84;
                    *(_WORD *)&v102[12] = 2114;
                    *(void *)&v102[14] = v32;
                    *(_WORD *)&v102[22] = 2048;
                    v103 = (void *)v55;
                    *(_WORD *)v104 = 2048;
                    *(void *)&v104[2] = v56;
                    *(_WORD *)&v104[10] = 2114;
                    *(void *)&v104[12] = v89;
                    __int16 v105 = 2114;
                    id v106 = v57;
                    __int16 v107 = 2112;
                    v108 = v58;
                    _os_log_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ pruned %ld out of %ld eligable %{public}@ shards in %{public}@%@", v102, 0x48u);
                    if (!v43) {

                    }
                    self = v84;
                    v27 = v81;
                    unint64_t v29 = v82;
                  }

                  id v59 = v53;
                  v60 = v59;
                  if (v59) {
                    id v90 = v59;
                  }

                  v28 = v83;
                  v35 = v87;
                  if (v43) {
                    [v80 addObjectsFromArray:v43];
                  }
                  else {
                    char v79 = 0;
                  }
                }
              }
              uint64_t v86 = [v28 countByEnumeratingWithState:&v91 objects:buf count:16];
            }
            while (v86);
          }
          else
          {
            char v79 = 1;
          }
          id v62 = v80;
          id v63 = objc_loadWeakRetained(location);
          *(void *)v112 = 0;
          *(void *)v102 = MEMORY[0x1E4F143A8];
          *(void *)&v102[8] = 3221225472;
          *(void *)&v102[16] = __44__HDOntologyShardPruner__markPrunedEntries___block_invoke;
          v103 = &unk_1E62F4A30;
          *(void *)v104 = self;
          id v64 = v62;
          *(void *)&v104[8] = v64;
          char v65 = [v63 performOntologyTransactionForWrite:1 databaseTransaction:0 error:v112 transactionHandler:v102];
          id v66 = *(id *)v112;

          LOBYTE(v19) = v79;
          if ((v65 & 1) == 0)
          {
            _HKInitializeLogging();
            v67 = HKLogHealthOntology();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v109 = 138543618;
              *(void *)&v109[4] = self;
              *(_WORD *)&v109[12] = 2114;
              *(void *)&v109[14] = v66;
              _os_log_error_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_ERROR, "%{public}@: Unable to mark pruned entries in the shard registry: %{public}@", v109, 0x16u);
            }
          }
        }
        else
        {
          LOBYTE(v19) = 0;
        }
      }
    }
    else
    {

      LOBYTE(v19) = 0;
    }
    v68 = v90;
  }
  else
  {
    v68 = 0;
    LOBYTE(v19) = 0;
  }
  id v69 = v68;
  _HKInitializeLogging();
  v70 = HKLogHealthOntology();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    if (v19) {
      v71 = @"SUCCESS";
    }
    else {
      v71 = @"FAILURE";
    }
    CFAbsoluteTimeGetCurrent();
    HKDiagnosticStringFromDuration();
    id v72 = (id)objc_claimAutoreleasedReturnValue();
    if (v19) {
      v73 = &stru_1F1728D60;
    }
    else {
      v73 = (__CFString *)[[NSString alloc] initWithFormat:@": %@", v69];
    }
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v71;
    __int16 v98 = 2114;
    id v99 = v72;
    __int16 v100 = 2114;
    v101 = v73;
    _os_log_impl(&dword_1BCB7D000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@: Garbage collect and prune ontology %{public}@ in %{public}@%{public}@", buf, 0x2Au);
    if ((v19 & 1) == 0) {
  }
    }
  id v74 = v69;
  v75 = v74;
  if (v74)
  {
    if (a4) {
      *a4 = v74;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v19 & 1;
}

- (int64_t)purgeableSpaceForUrgency:(int)a3 volume:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (a3 != 4)
  {
    _HKInitializeLogging();
    int v19 = HKLogHealthOntology();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v43 = 138543618;
      v44 = self;
      __int16 v45 = 1024;
      LODWORD(v46) = a3;
      v20 = "%{public}@: Non-maximum urgency request for purgable space for urgency %d";
      v21 = v19;
      uint32_t v22 = 18;
LABEL_20:
      _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, v20, v43, v22);
    }
LABEL_21:
    int64_t v23 = 0;
    goto LABEL_22;
  }
  if (([v6 isEqualToString:@"/private/var/mobile"] & 1) == 0)
  {
    _HKInitializeLogging();
    int v19 = HKLogHealthOntology();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v43 = 138543618;
      v44 = self;
      __int16 v45 = 2114;
      int64_t v46 = (int64_t)v7;
      v20 = "%{public}@: No purgable space for requested volume %{public}@";
      v21 = v19;
      uint32_t v22 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (self)
  {
    unint64_t v29 = v7;
    objc_super v8 = -[HDOntologyShardPruner _importerClassesBySchemaType](self);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    -[HDOntologyShardPruner _orderedSchemaTypes](self);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    v30 = self;
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v34;
      location = (id *)&self->_updateCoordinator;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = (void *)[v8 objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          if (objc_opt_respondsToSelector())
          {
            id WeakRetained = objc_loadWeakRetained(location);
            v16 = [WeakRetained shardRegistry];
            uint64_t v17 = [v14 purgeableSpaceForUrgency:4 shardRegistry:v16];

            _HKInitializeLogging();
            v18 = HKLogHealthOntology();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138544130;
              v38 = v30;
              __int16 v39 = 2114;
              *(void *)v40 = v14;
              *(_WORD *)&v40[8] = 1024;
              *(_DWORD *)&v40[10] = 4;
              __int16 v41 = 2048;
              uint64_t v42 = v17;
              _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ urgency %d purgable space %llu", buf, 0x26u);
            }

            v11 += v17;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }

    self = v30;
    id v25 = objc_loadWeakRetained((id *)&v30->_updateCoordinator);
    v26 = [v25 shardRegistry];
    uint64_t v27 = [v26 purgeableSpaceForStagedShards];

    _HKInitializeLogging();
    v28 = HKLogHealthOntology();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v38 = v30;
      __int16 v39 = 1024;
      *(_DWORD *)v40 = 4;
      *(_WORD *)&v40[4] = 2048;
      *(void *)&v40[6] = v27;
      _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: staged files urgency %d purgable space %llu", buf, 0x1Cu);
    }

    int64_t v23 = v27 + v11;
    v7 = v29;
  }
  else
  {
    int64_t v23 = 0;
  }
  _HKInitializeLogging();
  int v19 = HKLogHealthOntology();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v43 = 138543618;
    v44 = self;
    __int16 v45 = 2048;
    int64_t v46 = v23;
    _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Maximum urgency request for purgable space: %llu bytes", v43, 0x16u);
  }
LABEL_22:

  return v23;
}

- (int64_t)purgeSpaceForUrgency:(int)a3 volume:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (a3 != 4)
  {
    _HKInitializeLogging();
    int v19 = HKLogHealthOntology();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v43 = 138543618;
      v44 = self;
      __int16 v45 = 1024;
      LODWORD(v46) = a3;
      v20 = "%{public}@: Non-maximum urgency request request to purge space for urgency %d";
      v21 = v19;
      uint32_t v22 = 18;
LABEL_20:
      _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, v20, v43, v22);
    }
LABEL_21:
    int64_t v23 = 0;
    goto LABEL_22;
  }
  if (([v6 isEqualToString:@"/private/var/mobile"] & 1) == 0)
  {
    _HKInitializeLogging();
    int v19 = HKLogHealthOntology();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v43 = 138543618;
      v44 = self;
      __int16 v45 = 2114;
      int64_t v46 = (int64_t)v7;
      v20 = "%{public}@: Nothing to purge for requested volume %{public}@";
      v21 = v19;
      uint32_t v22 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (self)
  {
    uint64_t v27 = v7;
    objc_super v8 = -[HDOntologyShardPruner _importerClassesBySchemaType](self);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    -[HDOntologyShardPruner _orderedSchemaTypes](self);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
    v28 = self;
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v32;
      location = (id *)&self->_updateCoordinator;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = (void *)[v8 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          if (objc_opt_respondsToSelector())
          {
            id WeakRetained = objc_loadWeakRetained(location);
            v16 = [WeakRetained shardRegistry];
            uint64_t v17 = [v14 purgeSpaceForUrgency:4 shardRegistry:v16];

            _HKInitializeLogging();
            v18 = HKLogHealthOntology();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138544130;
              long long v36 = v28;
              __int16 v37 = 2114;
              v38 = v14;
              __int16 v39 = 1024;
              int v40 = 4;
              __int16 v41 = 2048;
              uint64_t v42 = v17;
              _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ urgency %d request to purge space %llu", buf, 0x26u);
            }

            v11 += v17;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }

    self = v28;
    id v25 = objc_loadWeakRetained((id *)&v28->_updateCoordinator);
    v26 = [v25 shardRegistry];
    int64_t v23 = [v26 purgeSpaceForStagedShards] + v11;

    v7 = v27;
  }
  else
  {
    int64_t v23 = 0;
  }
  _HKInitializeLogging();
  int v19 = HKLogHealthOntology();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v43 = 138543618;
    v44 = self;
    __int16 v45 = 2048;
    int64_t v46 = v23;
    _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Maximum urgency request to purge space: %llu bytes", v43, 0x16u);
  }
LABEL_22:

  return v23;
}

- (id)_importerClassesBySchemaType
{
  v1 = [a1 updateCoordinator];
  v2 = [v1 importer];
  v3 = [v2 importerClasses];

  return v3;
}

- (id)_orderedSchemaTypes
{
  v1 = [a1 updateCoordinator];
  v2 = [v1 importer];
  v3 = [v2 importerClasses];
  id v4 = [v3 allKeys];
  v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_14];

  return v5;
}

id __78__HDOntologyShardPruner__pruneEntries_options_schemaType_importerClass_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copyWithCurrentVersionUndeterminedForDate:*(void *)(a1 + 32)];

  return v2;
}

uint64_t __44__HDOntologyShardPruner__orderedSchemaTypes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4F2A2F8];
  id v5 = a3;
  int v6 = [a2 isEqualToString:v4];
  unsigned int v7 = [v5 isEqualToString:v4];

  if (v6 ^ 1 | v7) {
    return (v6 ^ 1) & v7;
  }
  else {
    return -1;
  }
}

uint64_t __56__HDOntologyShardPruner__entriesWithSchemaType_entries___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 schemaType];
  id v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    uint64_t v7 = 1;
  }
  else if (v5)
  {
    int v6 = [v3 schemaType];
    uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __44__HDOntologyShardPruner__markPrunedEntries___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v29 = a2;
  uint64_t v24 = v3;
  if (v3)
  {
    v28 = [MEMORY[0x1E4F1C9C8] date];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v23 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      location = (id *)(v3 + 8);
      uint64_t v27 = *(void *)v32;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(obj);
          }
          objc_super v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
          id v30 = 0;
          id v9 = v8;
          id v10 = v28;
          id v11 = v29;
          id WeakRetained = objc_loadWeakRetained(location);
          v13 = [WeakRetained shardRegistry];
          v14 = [v9 identifier];
          v15 = [v9 schemaType];
          uint64_t v16 = [v9 schemaVersion];
          *(void *)buf = 0;
          int v17 = [v13 entryWithIdentifier:v14 schemaType:v15 schemaVersion:v16 entryOut:buf transaction:v11 error:&v30];

          if (v17)
          {
            v18 = (void *)[v9 copyWithAvailableStateNotImportedForDate:v10];
            BOOL v19 = +[HDOntologyShardRegistry insertEntry:v18 transaction:v11 error:&v30];
          }
          else
          {
            BOOL v19 = 0;
          }

          id v20 = v30;
          if (!v19)
          {
            _HKInitializeLogging();
            v21 = HKLogHealthOntology();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v24;
              __int16 v36 = 2114;
              id v37 = v9;
              __int16 v38 = 2114;
              id v39 = v20;
              _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Unable to mark pruned entry \"%{public}@\" in the shard registry: %{public}@", buf, 0x20u);
            }
          }
          ++v7;
        }
        while (v6 != v7);
        uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v6);
    }

    id v4 = v23;
  }

  return 1;
}

uint64_t __64__HDOntologyShardPruner__persistPruneRequestMetadataForEntries___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = HKDiagnosticStringFromDate();

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v21 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v24 + 1) + 8 * v9);
        self;
        id v11 = [NSString alloc];
        uint64_t v12 = [v10 identifier];
        v13 = [v10 schemaType];
        uint64_t v14 = [v10 schemaVersion];

        v15 = (void *)[v11 initWithFormat:@"pruneRequest-%@:%@:%ld", v12, v13, v14];
        uint64_t v16 = [v3 graphDatabase];
        id v23 = 0;
        LOBYTE(v11) = [v16 setMetadataValue:v5 forKey:v15 error:&v23];
        id v17 = v23;

        if ((v11 & 1) == 0)
        {
          _HKInitializeLogging();
          v18 = HKLogHealthOntology();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = *(void *)(v21 + 40);
            *(_DWORD *)buf = 138543874;
            uint64_t v29 = v19;
            __int16 v30 = 2114;
            long long v31 = v15;
            __int16 v32 = 2114;
            id v33 = v17;
            _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Unable to set metdata value for key \"%{public}@\": %{public}@", buf, 0x20u);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v7);
  }

  return 1;
}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);

  return (HDOntologyUpdateCoordinator *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end