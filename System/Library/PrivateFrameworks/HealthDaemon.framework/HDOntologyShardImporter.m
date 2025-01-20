@interface HDOntologyShardImporter
- (BOOL)importStagedShardFilesWithError:(id *)a3;
- (HDOntologyShardImporter)init;
- (HDOntologyShardImporter)initWithOntologyUpdateCoordinator:(id)a3;
- (HDOntologyUpdateCoordinator)updateCoordinator;
- (id)_registeredImporterClasses;
- (void)addOntologyShardImporterObserver:(id)a3 queue:(id)a4;
- (void)removeOntologyShardImporterObserver:(id)a3;
@end

@implementation HDOntologyShardImporter

- (HDOntologyShardImporter)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyShardImporter)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDOntologyShardImporter;
  v5 = [(HDOntologyShardImporter *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    id v7 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v8 = NSStringFromProtocol((Protocol *)&unk_1F1829AE8);
    v9 = HKLogHealthOntology();
    uint64_t v10 = [v7 initWithName:v8 loggingCategory:v9];
    ontologyShardImporterObservers = v6->_ontologyShardImporterObservers;
    v6->_ontologyShardImporterObservers = (HDOntologyShardImporterObserver *)v10;
  }
  return v6;
}

- (id)_registeredImporterClasses
{
  v42[16] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v3 = *(void **)(a1 + 16);
    if (!v3)
    {
      v27 = v2;
      os_unfair_lock_assert_owner(v2);
      id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
      self;
      v41[0] = *MEMORY[0x1E4F2A2E8];
      v42[0] = objc_opt_class();
      v41[1] = *MEMORY[0x1E4F2A2F8];
      v42[1] = objc_opt_class();
      v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
      v6 = (void *)[v4 initWithDictionary:v5];

      uint64_t v29 = a1;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v8 = [WeakRetained daemon];
      v9 = [v8 pluginManager];
      uint64_t v10 = [v9 pluginsConformingToProtocol:&unk_1F18A8A68];
      v11 = [v10 allValues];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      obuint64_t j = v11;
      uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v31)
      {
        uint64_t v12 = *(void *)v38;
        uint64_t v28 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v38 != v12) {
              objc_enumerationMutation(obj);
            }
            v32 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            v14 = [v32 ontologySchemaImporterClasses];
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            v15 = [v14 allKeys];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v34;
              do
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v34 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * j);
                  uint64_t v21 = [v14 objectForKeyedSubscript:v20];
                  if ([v6 objectForKeyedSubscript:v20])
                  {
                    v22 = [MEMORY[0x1E4F28B00] currentHandler];
                    [v22 handleFailureInMethod:sel__lock_loadImporterClasses, v29, @"HDOntologyShardImporter.m", 294, @"%@ is attemping to register as importer for %@, but %@ already is registered.", v32, v20, objc_msgSend(v6, "objectForKeyedSubscript:", v20) object file lineNumber description];

                    uint64_t v12 = v28;
                  }
                  [v6 setObject:v21 forKeyedSubscript:v20];
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
              }
              while (v17);
            }
          }
          uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v31);
      }

      uint64_t v23 = [v6 copy];
      v24 = *(void **)(v29 + 16);
      *(void *)(v29 + 16) = v23;

      v3 = *(void **)(v29 + 16);
      v2 = v27;
    }
    id v25 = v3;
    os_unfair_lock_unlock(v2);
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (BOOL)importStagedShardFilesWithError:(id *)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  location = (id *)&self->_updateCoordinator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  id v4 = [WeakRetained daemon];
  v5 = [v4 behavior];
  v6 = [v5 features];
  char v7 = [v6 shardedOntology];

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 111, @"Sharded ontology import is disabled");
    return 0;
  }
  v8 = self;
  if (!self)
  {
LABEL_62:
    BOOL v70 = 0;
    goto LABEL_66;
  }
  v9 = (void *)MEMORY[0x1E4F65D08];
  uint64_t v10 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"desired_state" equalToValue:&unk_1F17EEF88];
  v85[0] = v10;
  v11 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"available_state" equalToValue:&unk_1F17EEFA0];
  v85[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
  objc_super v13 = [v9 predicateMatchingAllPredicates:v12];

  v14 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"current_version" entityClass:objc_opt_class() ascending:1];
  *(void *)&long long v86 = v14;
  v15 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"desired_state_date" entityClass:objc_opt_class() ascending:0];
  *((void *)&v86 + 1) = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:2];

  id v17 = objc_loadWeakRetained(location);
  uint64_t v18 = [v17 shardRegistry];
  v19 = [v18 entriesWithPredicate:v13 orderingTerms:v16 error:a3];

  if (!v19)
  {
    v8 = 0;
    goto LABEL_62;
  }
  id v20 = v19;
  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  obuint64_t j = (HDOntologyShardImporter *)v20;
  uint64_t v82 = [(HDOntologyShardImporter *)obj countByEnumeratingWithState:&v86 objects:v85 count:16];
  if (!v82) {
    goto LABEL_55;
  }
  uint64_t v81 = *(void *)v87;
  do
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v87 != v81) {
        objc_enumerationMutation(obj);
      }
      v22 = *(void **)(*((void *)&v86 + 1) + 8 * v21);
      id v84 = 0;
      uint64_t v23 = v22;
      v24 = -[HDOntologyShardImporter _registeredImporterClasses]((uint64_t)self);
      id v25 = [(__CFString *)v23 schemaType];
      v26 = (void *)[v24 objectForKeyedSubscript:v25];

      if (!v26)
      {
        _HKInitializeLogging();
        v42 = HKLogHealthOntology();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v23;
          v43 = v42;
          v44 = "%{public}@: No ontology importer class is registered yet to import %{public}@";
          uint32_t v45 = 22;
          goto LABEL_31;
        }
LABEL_32:

        BOOL v46 = 1;
        goto LABEL_33;
      }
      if (([v26 canImportEntry:v23] & 1) == 0)
      {
        _HKInitializeLogging();
        v42 = HKLogHealthOntology();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v26;
          *(_WORD *)&buf[22] = 2114;
          v91 = v23;
          v43 = v42;
          v44 = "%{public}@: %{public}@ cannot attempt to import entry %{public}@";
          uint32_t v45 = 32;
LABEL_31:
          _os_log_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_DEFAULT, v44, buf, v45);
        }
        goto LABEL_32;
      }
      CFAbsoluteTimeGetCurrent();
      _HKInitializeLogging();
      v27 = HKLogHealthOntology();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 2114;
        v91 = v23;
        _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ will import shard entry %{public}@", buf, 0x20u);
      }

      id v28 = objc_loadWeakRetained(location);
      uint64_t v29 = [v28 shardRegistry];
      id v93 = 0;
      int v30 = [v26 importOntologyShardEntry:v23 shardRegistry:v29 error:&v93];
      id v31 = v93;

      _HKInitializeLogging();
      v32 = HKLogHealthOntology();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        if (v30) {
          long long v33 = @"Success";
        }
        else {
          long long v33 = @"Error";
        }
        CFAbsoluteTimeGetCurrent();
        HKDiagnosticStringFromDuration();
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        long long v35 = &stru_1F1728D60;
        if ((v30 & 1) == 0) {
          long long v35 = (__CFString *)[[NSString alloc] initWithFormat:@": %@", v31];
        }
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 2114;
        v91 = v33;
        *(_WORD *)v92 = 2114;
        *(void *)&v92[2] = v23;
        *(_WORD *)&v92[10] = 2114;
        *(void *)&v92[12] = v34;
        *(_WORD *)&v92[20] = 2112;
        *(void *)&v92[22] = v35;
        _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ %{public}@ importing %{public}@ in %{public}@%@", buf, 0x3Eu);
        if ((v30 & 1) == 0) {
      }
        }
      id v36 = v31;
      long long v37 = v36;
      if (v36) {
        id v84 = v36;
      }

      if (v30)
      {
        long long v38 = v23;
        id v93 = 0;
        v94 = &v93;
        uint64_t v95 = 0x3032000000;
        v96 = __Block_byref_object_copy__190;
        v97 = __Block_byref_object_dispose__190;
        id v98 = 0;
        id v39 = objc_loadWeakRetained(location);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __52__HDOntologyShardImporter__markImportedEntry_error___block_invoke;
        v91 = (__CFString *)&unk_1E630C5E0;
        *(void *)&v92[16] = &v93;
        *(void *)v92 = self;
        long long v40 = v38;
        *(void *)&v92[8] = v40;
        LODWORD(v38) = [v39 performOntologyTransactionForWrite:1 databaseTransaction:0 error:&v84 transactionHandler:buf];

        if (v38) {
          id v41 = v94[5];
        }
        else {
          id v41 = 0;
        }
        id v58 = v41;

        _Block_object_dispose(&v93, 8);
        BOOL v46 = v58 != 0;
        if (v58)
        {
          id v59 = v58;
          ontologyShardImporterObservers = self->_ontologyShardImporterObservers;
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __60__HDOntologyShardImporter__notifyImportObserversAboutEntry___block_invoke;
          v91 = (__CFString *)&unk_1E630C608;
          *(void *)v92 = self;
          id v61 = v59;
          *(void *)&v92[8] = v61;
          [(HDOntologyShardImporterObserver *)ontologyShardImporterObservers notifyObservers:buf];

          id v62 = objc_loadWeakRetained(location);
          v63 = [v62 shardRegistry];
          id v93 = 0;
          LOBYTE(ontologyShardImporterObservers) = [v63 deleteStagedShardFileForEntry:v61 error:&v93];
          v64 = (__CFString *)v93;

          if ((ontologyShardImporterObservers & 1) == 0)
          {
            _HKInitializeLogging();
            v65 = HKLogHealthOntology();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v61;
              *(_WORD *)&buf[22] = 2114;
              v91 = v64;
              _os_log_impl(&dword_1BCB7D000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to delete shard file for entry %{public}@: %{public}@", buf, 0x20u);
            }
          }
        }
      }
      else
      {
        BOOL v46 = 0;
      }
LABEL_33:

      id v47 = v84;
      v48 = v47;
      if (!v46)
      {
        if (objc_msgSend(v47, "hk_isCocoaNoSuchFileError"))
        {
          v49 = (void *)[(__CFString *)v23 copyWithAvailableState:1];
          _HKInitializeLogging();
          v50 = HKLogHealthOntology();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v49;
            _os_log_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: Entry previously marked 'staged' wasn't found on device and has been re-marked as 'on remote', %{public}@", buf, 0x16u);
          }

          id v51 = objc_loadWeakRetained(location);
          v52 = [v51 shardRegistry];
          id v93 = 0;
          char v53 = [v52 insertEntry:v49 error:&v93];
          v54 = (__CFString *)v93;

          if ((v53 & 1) == 0)
          {
            _HKInitializeLogging();
            v55 = HKLogHealthOntology();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v49;
              *(_WORD *)&buf[22] = 2114;
              v91 = v54;
              _os_log_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to persist entry %{public}@: %{public}@", buf, 0x20u);
            }
          }
        }
        v56 = (void *)[[NSString alloc] initWithFormat:@"Error importing %@", v23];
        v57 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 100, v56, v48);
        [v78 addObject:v57];
      }
      ++v21;
    }
    while (v82 != v21);
    uint64_t v66 = [(HDOntologyShardImporter *)obj countByEnumeratingWithState:&v86 objects:v85 count:16];
    uint64_t v82 = v66;
  }
  while (v66);
LABEL_55:

  id v67 = v78;
  uint64_t v68 = [v67 count];
  uint64_t v69 = v68;
  BOOL v70 = v68 < 1;
  if (v68 >= 1)
  {
    v71 = (id *)MEMORY[0x1E4F28A50];
    if (v68 != 1) {
      v71 = (id *)MEMORY[0x1E4F28750];
    }
    v72 = (id *)*v71;
    if (v69 == 1)
    {
      id v73 = [v67 firstObject];
    }
    else
    {
      id v73 = v67;
    }
    v74 = v73;
    id v93 = (id)*MEMORY[0x1E4F28568];
    v94 = v72;
    *(void *)buf = @"Error importing ontology files";
    *(void *)&buf[8] = v73;
    v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v93 count:2];
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:userInfo:", a3, 100, v75);
  }
  v8 = obj;
LABEL_66:

  return v70;
}

- (void)addOntologyShardImporterObserver:(id)a3 queue:(id)a4
{
}

- (void)removeOntologyShardImporterObserver:(id)a3
{
}

BOOL __52__HDOntologyShardImporter__markImportedEntry_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1[4];
  v6 = (void *)a1[5];
  id v7 = a2;
  if (v5)
  {
    id v8 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 32));
    uint64_t v10 = [WeakRetained shardRegistry];
    v11 = [v8 identifier];
    uint64_t v12 = [v8 schemaType];
    uint64_t v13 = [v8 schemaVersion];

    id v20 = 0;
    LODWORD(v8) = [v10 entryWithIdentifier:v11 schemaType:v12 schemaVersion:v13 entryOut:&v20 transaction:v7 error:a3];
    id v14 = v20;

    id v15 = 0;
    if (v8)
    {
      uint64_t v16 = (void *)[v14 copyWithAvailableStateImported];
      if (+[HDOntologyShardRegistry insertEntry:v16 transaction:v7 error:a3])
      {
        id v15 = v16;
      }
      else
      {
        id v15 = 0;
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  uint64_t v17 = *(void *)(a1[6] + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v15;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

uint64_t __60__HDOntologyShardImporter__notifyImportObserversAboutEntry___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ontologyShardImporter:*(void *)(a1 + 32) didImportEntry:*(void *)(a1 + 40)];
}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);

  return (HDOntologyUpdateCoordinator *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCoordinator);
  objc_storeStrong((id *)&self->_ontologyShardImporterObservers, 0);

  objc_storeStrong((id *)&self->_lock_importerClassesBySchemaType, 0);
}

@end