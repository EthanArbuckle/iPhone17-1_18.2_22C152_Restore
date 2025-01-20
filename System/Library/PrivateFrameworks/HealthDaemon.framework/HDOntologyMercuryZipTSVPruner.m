@interface HDOntologyMercuryZipTSVPruner
- (HDOntologyMercuryZipTSVPruner)init;
- (HDOntologyMercuryZipTSVPruner)initWithOntologyUpdateCoordinator:(id)a3;
- (HDOntologyUpdateCoordinator)updateCoordinator;
- (int64_t)pruneEntries:(id)a3 options:(unint64_t)a4 error:(id *)a5;
@end

@implementation HDOntologyMercuryZipTSVPruner

- (HDOntologyMercuryZipTSVPruner)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyMercuryZipTSVPruner)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDOntologyMercuryZipTSVPruner;
  v5 = [(HDOntologyMercuryZipTSVPruner *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
  }

  return v6;
}

- (int64_t)pruneEntries:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v5 = a4;
  v40[3] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  if (v5) {
    goto LABEL_7;
  }
  if (!self)
  {
    int64_t v22 = 0;
    goto LABEL_20;
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  v7 = [(HDOntologyMercuryZipTSVPruner *)self updateCoordinator];
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  v34 = __55__HDOntologyMercuryZipTSVPruner__shouldPruneWithError___block_invoke;
  v35 = &unk_1E6308818;
  v36 = self;
  v37 = &v28;
  int v8 = [v7 performOntologyTransactionForWrite:0 databaseTransaction:0 error:a5 transactionHandler:&v32];

  int64_t v9 = v8 ? v29[3] : 0;
  _Block_object_dispose(&v28, 8);
  int64_t v22 = v9;
  if (v9 == 1)
  {
LABEL_7:
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v40[2] = objc_opt_class();
    [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v25;
      int64_t v22 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(uint64_t **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v16 = [v10 count];
          if (!self) {
            goto LABEL_17;
          }
          BOOL v17 = v12 + i + 1 == v16;
          v18 = [(HDOntologyMercuryZipTSVPruner *)self updateCoordinator];
          uint64_t v32 = MEMORY[0x1E4F143A8];
          uint64_t v33 = 3221225472;
          v34 = __78__HDOntologyMercuryZipTSVPruner__pruneElementsFromEntity_isFinalEntity_error___block_invoke;
          v35 = &unk_1E6308840;
          v36 = self;
          v37 = v15;
          BOOL v38 = v17;
          int v19 = [v18 performOntologyTransactionForWrite:1 databaseTransaction:0 error:a5 transactionHandler:&v32];

          if (!v19)
          {
LABEL_17:
            int64_t v22 = 0;
            goto LABEL_19;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v39 count:16];
        v12 += i;
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      int64_t v22 = 1;
    }
LABEL_19:
  }
LABEL_20:

  return v22;
}

BOOL __55__HDOntologyMercuryZipTSVPruner__shouldPruneWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  v7 = v6;
  if (v5)
  {
    id v30 = 0;
    int v8 = [v6 graphDatabase];
    int64_t v9 = [v8 underlyingDatabase];
    BOOL v10 = +[HDSimpleGraphDatabaseMetadataEntity metadataValueForKey:@"MercuryZipTSVLastPruneDate" valueOut:&v30 database:v9 error:a3];
    id v11 = v30;

    uint64_t v12 = 0;
    if (v10)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [v11 doubleValue];
      if (Current - v14 >= 604800.0)
      {
        v18 = (void *)MEMORY[0x1E4F65D08];
        int v19 = (void *)MEMORY[0x1E4F65D00];
        id v20 = v7;
        id v21 = [v19 predicateWithProperty:@"current_version" notEqualToValue:&unk_1F17EEDA8];
        *(void *)buf = v21;
        int64_t v22 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"schema_type" equalToValue:*MEMORY[0x1E4F2A2F8]];
        *(void *)&buf[8] = v22;
        v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:2];
        long long v24 = [v18 predicateMatchingAllPredicates:v23];

        uint64_t v25 = *MEMORY[0x1E4F65C78];
        long long v26 = [v20 graphDatabase];

        long long v27 = [v26 underlyingDatabase];
        uint64_t v28 = +[HDSQLiteEntity countValueForProperty:v25 predicate:v24 database:v27 error:a3];

        if (v28)
        {
          if ([v28 integerValue] >= 1) {
            uint64_t v12 = 1;
          }
          else {
            uint64_t v12 = 2;
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        _HKInitializeLogging();
        v15 = HKLogHealthOntology();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = HKDiagnosticStringFromDuration();
          BOOL v17 = HKDiagnosticStringFromDuration();
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v16;
          __int16 v32 = 2114;
          uint64_t v33 = v17;
          _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: skipping prunning because it has only been %{public}@ since the last prune (waiting for %{public}@)", buf, 0x20u);
        }
        uint64_t v12 = 2;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
}

uint64_t __78__HDOntologyMercuryZipTSVPruner__pruneElementsFromEntity_isFinalEntity_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  v61 = *(void **)(a1 + 40);
  id v6 = v4;
  v59 = (id *)v5;
  v60 = v6;
  if (v5)
  {
    id v7 = v6;
    int v8 = (void *)MEMORY[0x1E4F65D08];
    int64_t v9 = objc_msgSend(MEMORY[0x1E4F65D00], "predicateWithProperty:equalToValue:");
    v63[0] = v9;
    uint64_t v58 = *MEMORY[0x1E4F2A2F8];
    BOOL v10 = objc_msgSend(MEMORY[0x1E4F65D00], "predicateWithProperty:equalToValue:");
    v63[1] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
    uint64_t v12 = [v8 predicateMatchingAllPredicates:v11];

    id v71 = 0;
    uint64_t v72 = (uint64_t)&v71;
    uint64_t v73 = 0x2020000000;
    v74 = 0;
    uint64_t v13 = [v7 graphDatabase];
    double v14 = [v13 underlyingDatabase];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __69__HDOntologyMercuryZipTSVPruner__requiredSlotsWithTransaction_error___block_invoke;
    v65 = &unk_1E62F91F8;
    v66 = &v71;
    LODWORD(v10) = +[HDOntologyShardRegistryEntity enumerateEntriesWithPredicate:v12 orderingTerms:0 database:v14 error:a3 enumerationHandler:buf];

    if (v10)
    {
      v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(v72 + 24)];
    }
    else
    {
      v15 = 0;
    }
    _Block_object_dispose(&v71, 8);

    if (v15)
    {
      uint64_t v16 = [v15 unsignedLongLongValue];
      id v17 = v7;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      int v19 = [v17 graphDatabase];

      id v20 = [v19 underlyingDatabase];

      id v21 = (objc_class *)NSString;
      id v22 = v20;
      id v23 = [v21 alloc];
      long long v24 = [v61 disambiguatedDatabaseTable];
      uint64_t v25 = (void *)[v23 initWithFormat:@"DELETE FROM %@ WHERE (%@ & ?) == 0", v24, @"slots"];

      id v71 = (id)MEMORY[0x1E4F143A8];
      uint64_t v72 = 3221225472;
      uint64_t v73 = (uint64_t)__88__HDOntologyMercuryZipTSVPruner__deleteElementsFromEntity_requiredSlots_database_error___block_invoke;
      v74 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      uint64_t v75 = v16;
      LODWORD(v24) = [v22 executeSQL:v25 error:a3 bindingHandler:&v71 enumerationHandler:0];

      if (!v24) {
        goto LABEL_17;
      }
      int v57 = [v22 getChangesCount];
      long long v26 = (objc_class *)NSString;
      id v27 = v22;
      id v28 = [v26 alloc];
      uint64_t v29 = [v61 disambiguatedDatabaseTable];
      id v30 = (void *)[v28 initWithFormat:@"UPDATE %@ SET %@ = (%@ & ?) WHERE %@ != (%@ & ?)", v29, @"slots", @"slots", @"slots", @"slots"];

      id v71 = (id)MEMORY[0x1E4F143A8];
      uint64_t v72 = 3221225472;
      uint64_t v73 = (uint64_t)__86__HDOntologyMercuryZipTSVPruner__updateElementsOfEntity_requiredSlots_database_error___block_invoke;
      v74 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      uint64_t v75 = v16;
      LOBYTE(v29) = [v27 executeSQL:v30 error:a3 bindingHandler:&v71 enumerationHandler:0];

      if (v29)
      {
        int v31 = [v27 getChangesCount];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __90__HDOntologyMercuryZipTSVPruner__pruneElementsFromEntity_requiredSlots_transaction_error___block_invoke;
        v65 = &unk_1E6308868;
        v66 = v59;
        id v67 = (id)v57;
        uint64_t v68 = v31;
        v69 = v61;
        CFAbsoluteTime v70 = Current;
        [v27 onCommit:buf orRollback:0];

        if (!*(unsigned char *)(a1 + 48))
        {
          uint64_t v5 = 1;
          v55 = v60;
          goto LABEL_20;
        }
        uint64_t v32 = *(void *)(a1 + 32);
        id v33 = v17;
        if (v32)
        {
          id v34 = v33;
          v35 = (void *)MEMORY[0x1E4F65D08];
          v36 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"desired_state" notEqualToValue:&unk_1F17EEDC0];
          id v71 = v36;
          v37 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"current_version" notEqualToValue:&unk_1F17EEDA8];
          uint64_t v72 = (uint64_t)v37;
          BOOL v38 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"schema_type" equalToValue:v58];
          uint64_t v73 = (uint64_t)v38;
          v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:3];
          v40 = [v35 predicateMatchingAllPredicates:v39];

          v41 = [MEMORY[0x1E4F1C9C8] date];
          v42 = [v34 graphDatabase];
          v43 = [v42 underlyingDatabase];
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __86__HDOntologyMercuryZipTSVPruner__markPrunedShardEntriesAsPrunedWithTransaction_error___block_invoke;
          v65 = &unk_1E6308890;
          v66 = v41;
          id v44 = v34;
          id v67 = v44;
          v45 = v41;
          LODWORD(v38) = +[HDOntologyShardRegistryEntity enumerateEntriesWithPredicate:v40 orderingTerms:0 database:v43 error:a3 enumerationHandler:buf];

          if (v38)
          {
            v46 = [v44 graphDatabase];
            v47 = NSNumber;
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            v48 = objc_msgSend(v47, "numberWithDouble:");
            v49 = [v48 stringValue];
            int v50 = [v46 setMetadataValue:v49 forKey:@"MercuryZipTSVLastPruneDate" error:a3];

            if (v50)
            {
              v51 = [v44 graphDatabase];
              id v71 = 0;
              char v52 = [v51 setMetadataValue:0 forKey:@"ontologyAssetVersion" error:&v71];
              id v53 = v71;

              if ((v52 & 1) == 0)
              {
                _HKInitializeLogging();
                v54 = HKLogHealthOntology();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  *(void *)&buf[4] = v32;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = @"ontologyAssetVersion";
                  *(_WORD *)&unsigned char buf[22] = 2114;
                  v65 = v53;
                  _os_log_error_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_ERROR, "%{public}@: Unable to clear metadata for %{public}@: %{public}@", buf, 0x20u);
                }
              }
              uint64_t v5 = 1;
              goto LABEL_19;
            }
          }
        }
      }
      else
      {
LABEL_17:
      }
    }
    uint64_t v5 = 0;
  }
LABEL_19:
  v55 = v60;

LABEL_20:
  return v5;
}

uint64_t __69__HDOntologyMercuryZipTSVPruner__requiredSlotsWithTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 1 << [a2 slot];
  return 1;
}

void __90__HDOntologyMercuryZipTSVPruner__pruneElementsFromEntity_requiredSlots_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKLogHealthOntology();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = NSStringFromClass(*(Class *)(a1 + 56));
    CFAbsoluteTimeGetCurrent();
    id v7 = HKDiagnosticStringFromDuration();
    int v8 = 138544386;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Directly deleted %ld and updated %ld from %{public}@ in %{public}@", (uint8_t *)&v8, 0x34u);
  }
}

uint64_t __88__HDOntologyMercuryZipTSVPruner__deleteElementsFromEntity_requiredSlots_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __86__HDOntologyMercuryZipTSVPruner__updateElementsOfEntity_requiredSlots_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 32);

  return sqlite3_bind_int64(a2, 2, v4);
}

BOOL __86__HDOntologyMercuryZipTSVPruner__markPrunedShardEntriesAsPrunedWithTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)[a2 copyWithAvailableStateNotImportedForDate:*(void *)(a1 + 32)];
  BOOL v6 = +[HDOntologyShardRegistry insertEntry:v5 transaction:*(void *)(a1 + 40) error:a3];

  return v6;
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