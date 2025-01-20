@interface ACHTemplateEntity
+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange;
+ ($2825F4736939C4A6D3AD43837233062D)syncVersionRangeForSession:(id)a3;
+ (ACHTemplateEntitySyncedTemplatesObserver)syncedTemplatesObserver;
+ (BOOL)_insertTemplate:(id)a3 provenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 error:(id *)a7;
+ (BOOL)_insertTemplates:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 profile:(id)a6 databaseContext:(id)a7 error:(id *)a8;
+ (BOOL)_journalTemplates:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 action:(int64_t)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)_removeTemplateWithPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5;
+ (BOOL)_removeTemplates:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_templateWithUniqueName:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)_templatesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)allTemplatesWithProfile:(id)a3 error:(id *)a4;
+ (id)codableTemplateForTemplateInDatabase:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int)currentSyncVersion;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
+ (void)setSyncedTemplatesObserver:(id)a3;
@end

@implementation ACHTemplateEntity

+ (void)setSyncedTemplatesObserver:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&syncObserverLock_0);
  objc_storeWeak(&_syncObserver_0, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&syncObserverLock_0);
}

+ (ACHTemplateEntitySyncedTemplatesObserver)syncedTemplatesObserver
{
  os_unfair_lock_lock((os_unfair_lock_t)&syncObserverLock_0);
  id WeakRetained = objc_loadWeakRetained(&_syncObserver_0);
  os_unfair_lock_unlock((os_unfair_lock_t)&syncObserverLock_0);
  return (ACHTemplateEntitySyncedTemplatesObserver *)WeakRetained;
}

+ (id)databaseTable
{
  return (id)[NSString stringWithFormat:@"%@_templates", *MEMORY[0x263F23448]];
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 39;
  return (const $27325D3925FB5ACF38BB0AF4A70276FF *)columnDefinitionsWithCount__columnDefinitions_0;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[ACHTemplateEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)allTemplatesWithProfile:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x263F434D0];
  id v7 = a3;
  v8 = [v6 truePredicate];
  v9 = [a1 _templatesWithPredicate:v8 profile:v7 error:a4];

  v10 = ACHSortedTemplates();

  return v10;
}

+ (BOOL)_insertTemplates:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 profile:(id)a6 databaseContext:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  if (!v16)
  {
    id v16 = [MEMORY[0x263F431E0] contextForWritingProtectedData];
  }
  v17 = [v15 database];
  v18 = (void *)[v16 copyForWritingProtectedData];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke;
  v29[3] = &unk_2645180A0;
  id v32 = a1;
  id v30 = v14;
  BOOL v34 = a5;
  id v31 = v15;
  int64_t v33 = a4;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_419;
  v23[3] = &unk_2645180C8;
  id v26 = a1;
  int64_t v27 = a4;
  BOOL v28 = a5;
  id v24 = v30;
  id v25 = v31;
  id v19 = v31;
  id v20 = v30;
  char v21 = [v17 performTransactionWithContext:v18 error:a8 block:v29 inaccessibilityHandler:v23];

  return v21;
}

uint64_t __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v39 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v44;
    *(void *)&long long v8 = 138543362;
    long long v36 = v8;
    id v37 = v5;
    id v38 = v6;
LABEL_3:
    uint64_t v11 = 0;
    uint64_t v40 = v9;
    while (1)
    {
      if (*(void *)v44 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(void **)(*((void *)&v43 + 1) + 8 * v11);
      if (objc_msgSend(v12, "minimumEngineVersion", v36) < 0xF)
      {
        if ([v12 _isValid])
        {
          id v19 = *(void **)(a1 + 48);
          id v20 = [v12 uniqueName];
          id v13 = [v19 _templateWithUniqueName:v20 profile:*(void *)(a1 + 40) transaction:v5 error:a3];

          if (v13)
          {
            unint64_t v21 = [v13 version];
            if (v21 < [v12 version])
            {
              v22 = *(void **)(a1 + 48);
              uint64_t v23 = [v13 key];
              id v42 = 0;
              LODWORD(v22) = [v22 _removeTemplateWithPersistentID:v23 database:v39 error:&v42];
              id v24 = v42;
              if (!v22)
              {
                id v25 = v24;
                if (v25)
                {
                  if (a3) {
                    *a3 = v25;
                  }
                  else {
                    _HKLogDroppedError();
                  }
                }

                id v32 = ACHLogDatabase();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                  __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_cold_1(v12, (uint64_t)v25, v32);
                }
                goto LABEL_35;
              }
            }
          }
          ACHTemplateSyncIdentityFromTemplate(v12, *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 40), v5);
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          int64_t v27 = *(void **)(a1 + 48);
          uint64_t v26 = *(void *)(a1 + 56);
          BOOL v28 = [v25 entity];
          uint64_t v29 = [v28 persistentID];
          id v41 = 0;
          LOBYTE(v26) = [v27 _insertTemplate:v12 provenance:v26 syncIdentity:v29 database:v39 error:&v41];
          id v30 = v41;

          if ((v26 & 1) == 0)
          {
            id v32 = v30;
            if (v32)
            {
              if (a3) {
                *a3 = v32;
              }
              else {
                _HKLogDroppedError();
              }
            }

            int64_t v33 = ACHLogDatabase();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v35 = [v12 uniqueName];
              *(_DWORD *)buf = 138543618;
              v48 = v35;
              __int16 v49 = 2114;
              v50 = v32;
              _os_log_error_impl(&dword_21F5DA000, v33, OS_LOG_TYPE_ERROR, "Error inserting template '%{public}@': %{public}@", buf, 0x16u);
            }
LABEL_35:

            uint64_t v31 = 0;
            id v5 = v37;
            id v6 = v38;
            goto LABEL_36;
          }

          id v5 = v37;
          id v6 = v38;
          uint64_t v9 = v40;
        }
        else
        {
          id v13 = ACHLogDatabase();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [v12 uniqueName];
            *(_DWORD *)buf = v36;
            v48 = v15;
            id v16 = v13;
            v17 = "Not inserting invalid template: %{public}@";
            uint32_t v18 = 12;
            goto LABEL_18;
          }
        }
      }
      else
      {
        id v13 = ACHLogDatabase();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v14 = [v12 minimumEngineVersion];
          id v15 = [v12 uniqueName];
          *(_DWORD *)buf = 134218242;
          v48 = v14;
          uint64_t v9 = v40;
          __int16 v49 = 2114;
          v50 = v15;
          id v16 = v13;
          v17 = "Not inserting template with higher minimum engine version (%ld): %{public}@";
          uint32_t v18 = 22;
LABEL_18:
          _os_log_impl(&dword_21F5DA000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
        }
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = [v6 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  uint64_t v31 = 1;
LABEL_36:

  return v31;
}

uint64_t __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_419(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) _journalTemplates:*(void *)(a1 + 32) provenance:*(void *)(a1 + 56) useLegacySyncIdentity:*(unsigned __int8 *)(a1 + 64) action:0 profile:*(void *)(a1 + 40) error:a3];
}

+ (BOOL)_insertTemplate:(id)a3 provenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v12 = a3;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __76__ACHTemplateEntity__insertTemplate_provenance_syncIdentity_database_error___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__ACHTemplateEntity__insertTemplate_provenance_syncIdentity_database_error___block_invoke_2;
  v15[3] = &unk_264518110;
  id v16 = v12;
  int64_t v17 = a4;
  int64_t v18 = a5;
  id v13 = v12;
  LOBYTE(a7) = [a6 executeCachedStatementForKey:&_insertTemplate_provenance_syncIdentity_database_error__insertKey error:a7 SQLGenerator:v19 bindingHandler:v15 enumerationHandler:0];

  return (char)a7;
}

id __76__ACHTemplateEntity__insertTemplate_provenance_syncIdentity_database_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  objc_msgSend(v1, "stringWithFormat:", @"INSERT OR IGNORE INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", v2, @"unique_name", @"version", @"minimum_engine_version", @"created_date", @"creator_device", @"source_name", @"predicate", @"grace_predicate", @"value_expression", @"grace_value_expression", @"progress_expression", @"grace_progress_expression", @"goal_expression", @"grace_goal_expression", @"triggers",
    @"earn_limit",
    @"visibility_predicate",
    @"grace_visibility_predicate",
    @"visibility_start_date",
    @"visibility_end_date",
    @"availability_predicate",
    @"availability_start_date",
    @"availability_end_date",
    @"available_country_codes",
    @"alertability_predicate",
    @"alert_dates",
    @"duplicateremoval_strategy",
    @"duplicateremoval_calendar_unit",
    @"earn_date",
    @"display_order",
    @"displays_earned_instance_count",
    @"canonical_unit",
    @"sync_provenance",
    @"available_suffixes",
    @"daily_target",
    @"daily_target_canonical_unit",
    @"sync_identity",
  id v3 = @"prerequisite_template_name");

  return v3;
}

void __76__ACHTemplateEntity__insertTemplate_provenance_syncIdentity_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  v4 = [*(id *)(a1 + 32) uniqueName];
  HDSQLiteBindStringToStatement();

  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 32) version]);
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 32) minimumEngineVersion]);
  id v5 = [*(id *)(a1 + 32) createdDate];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 5, [*(id *)(a1 + 32) creatorDevice]);
  id v6 = [*(id *)(a1 + 32) sourceName];
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v7 = [*(id *)(a1 + 32) predicate];
  HDSQLiteBindFoundationValueToStatement();

  long long v8 = [*(id *)(a1 + 32) gracePredicate];
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v9 = [*(id *)(a1 + 32) valueExpression];
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v10 = [*(id *)(a1 + 32) graceValueExpression];
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v11 = [*(id *)(a1 + 32) progressExpression];
  HDSQLiteBindFoundationValueToStatement();

  id v12 = [*(id *)(a1 + 32) graceProgressExpression];
  HDSQLiteBindFoundationValueToStatement();

  id v13 = [*(id *)(a1 + 32) goalExpression];
  HDSQLiteBindFoundationValueToStatement();

  unint64_t v14 = [*(id *)(a1 + 32) graceGoalExpression];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 15, [*(id *)(a1 + 32) triggers]);
  sqlite3_bind_int64(a2, 16, [*(id *)(a1 + 32) earnLimit]);
  id v15 = [*(id *)(a1 + 32) visibilityPredicate];
  HDSQLiteBindFoundationValueToStatement();

  id v16 = [*(id *)(a1 + 32) graceVisibilityPredicate];
  HDSQLiteBindFoundationValueToStatement();

  int64_t v17 = [*(id *)(a1 + 32) visibilityStart];
  int64_t v18 = ACHYearMonthDayStringFromDateComponents();
  HDSQLiteBindFoundationValueToStatement();

  id v19 = [*(id *)(a1 + 32) visibilityEnd];
  id v20 = ACHYearMonthDayStringFromDateComponents();
  HDSQLiteBindFoundationValueToStatement();

  unint64_t v21 = [*(id *)(a1 + 32) availabilityPredicate];
  HDSQLiteBindFoundationValueToStatement();

  v22 = [*(id *)(a1 + 32) availabilityStart];
  uint64_t v23 = ACHYearMonthDayStringFromDateComponents();
  HDSQLiteBindFoundationValueToStatement();

  id v24 = [*(id *)(a1 + 32) availabilityEnd];
  id v25 = ACHYearMonthDayStringFromDateComponents();
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v26 = [*(id *)(a1 + 32) availableCountryCodes];
  int64_t v27 = ACHTemplateAvailableCountryCodesStringFromStrings();
  HDSQLiteBindFoundationValueToStatement();

  BOOL v28 = [*(id *)(a1 + 32) alertabilityPredicate];
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v29 = [*(id *)(a1 + 32) alertDates];
  id v30 = ACHTemplateAlertDatesStringFromDates();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 27, [*(id *)(a1 + 32) duplicateRemovalStrategy]);
  sqlite3_bind_int64(a2, 28, [*(id *)(a1 + 32) duplicateRemovalCalendarUnit]);
  sqlite3_bind_int64(a2, 29, [*(id *)(a1 + 32) earnDateStrategy]);
  sqlite3_bind_int64(a2, 30, [*(id *)(a1 + 32) displayOrder]);
  sqlite3_bind_int(a2, 31, [*(id *)(a1 + 32) displaysEarnedInstanceCount]);
  uint64_t v31 = [*(id *)(a1 + 32) canonicalUnit];
  id v32 = [v31 unitString];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 33, *(void *)(a1 + 40));
  int64_t v33 = [*(id *)(a1 + 32) availableSuffixes];
  BOOL v34 = ACHTemplateAvailableSuffixesStringFromStrings();
  HDSQLiteBindFoundationValueToStatement();

  [*(id *)(a1 + 32) dailyTarget];
  sqlite3_bind_double(a2, 35, v35);
  long long v36 = [*(id *)(a1 + 32) dailyTargetCanonicalUnit];
  id v37 = [v36 unitString];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 37, *(void *)(a1 + 48));
  id v38 = [*(id *)(a1 + 32) prerequisiteTemplateName];
  HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)_removeTemplateWithPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v7 = a4;
  long long v8 = [(HDSQLiteEntity *)[ACHTemplateEntity alloc] initWithPersistentID:a3];
  LOBYTE(a5) = [(HDSQLiteEntity *)v8 deleteFromDatabase:v7 error:a5];

  return (char)a5;
}

+ (BOOL)_removeTemplates:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count] == 1)
  {
    uint64_t v10 = [v8 firstObject];
    uint64_t v11 = [v10 uniqueName];
    id v12 = [MEMORY[0x263F434A0] predicateWithProperty:@"unique_name" equalToValue:v11];
  }
  else
  {
    id v29 = a1;
    id v30 = a5;
    id v13 = v8;
    id v14 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        uint64_t v19 = 0;
        id v20 = v14;
        do
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v15);
          }
          unint64_t v21 = [*(id *)(*((void *)&v39 + 1) + 8 * v19) uniqueName];
          v22 = [MEMORY[0x263F434A0] predicateWithProperty:@"unique_name" equalToValue:v21];

          id v14 = [v20 arrayByAddingObject:v22];

          ++v19;
          id v20 = v14;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v17);
    }

    id v12 = [MEMORY[0x263F434A8] predicateMatchingAnyPredicates:v14];

    a1 = v29;
    a5 = v30;
  }
  uint64_t v23 = [v9 database];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __52__ACHTemplateEntity__removeTemplates_profile_error___block_invoke;
  v35[3] = &unk_264516350;
  id v38 = a1;
  id v36 = v12;
  id v37 = v9;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __52__ACHTemplateEntity__removeTemplates_profile_error___block_invoke_2;
  v31[3] = &unk_264518138;
  id v33 = v37;
  id v34 = a1;
  id v32 = v8;
  id v24 = v37;
  id v25 = v8;
  id v26 = v12;
  char v27 = [a1 performWriteTransactionWithHealthDatabase:v23 error:a5 block:v35 inaccessibilityHandler:v31];

  return v27;
}

uint64_t __52__ACHTemplateEntity__removeTemplates_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) database];
  uint64_t v7 = [v5 deleteEntitiesWithPredicate:v4 healthDatabase:v6 error:a3];

  return v7;
}

uint64_t __52__ACHTemplateEntity__removeTemplates_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) _journalTemplates:*(void *)(a1 + 32) provenance:0 useLegacySyncIdentity:0 action:1 profile:*(void *)(a1 + 40) error:a3];
}

+ (BOOL)_journalTemplates:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 action:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __93__ACHTemplateEntity__journalTemplates_provenance_useLegacySyncIdentity_action_profile_error___block_invoke;
  v14[3] = &__block_descriptor_49_e46___ACHTemplateJournalEntry_16__0__ACHTemplate_8l;
  BOOL v15 = a5;
  v14[4] = a4;
  v14[5] = a6;
  id v10 = a7;
  uint64_t v11 = objc_msgSend(a3, "hk_map:", v14);
  id v12 = [v10 database];

  LOBYTE(a8) = [v12 addJournalEntries:v11 error:a8];
  return (char)a8;
}

ACHTemplateJournalEntry *__93__ACHTemplateEntity__journalTemplates_provenance_useLegacySyncIdentity_action_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[ACHTemplateJournalEntry alloc] initWithTemplate:v3 provenance:*(void *)(a1 + 32) useLegacySyncIdentity:*(unsigned __int8 *)(a1 + 48) action:*(void *)(a1 + 40)];

  return v4;
}

+ (id)_templateWithUniqueName:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [MEMORY[0x263F434A0] predicateWithProperty:@"unique_name" equalToValue:v10];
  id v14 = [a1 entityEncoderForProfile:v11 transaction:v12 purpose:1 encodingOptions:0 authorizationFilter:0];
  BOOL v15 = [v12 databaseForEntityClass:objc_opt_class()];
  uint64_t v16 = [a1 queryWithDatabase:v15 predicate:v13];
  uint64_t v27 = 0;
  BOOL v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__27;
  uint64_t v31 = __Block_byref_object_dispose__27;
  id v32 = 0;
  uint64_t v17 = [v14 orderedProperties];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __71__ACHTemplateEntity__templateWithUniqueName_profile_transaction_error___block_invoke;
  v23[3] = &unk_264518180;
  id v26 = &v27;
  id v18 = v14;
  id v24 = v18;
  id v19 = v10;
  id v25 = v19;
  LODWORD(a6) = [v16 enumeratePersistentIDsAndProperties:v17 error:a6 enumerationHandler:v23];

  if (a6) {
    id v20 = (void *)v28[5];
  }
  else {
    id v20 = 0;
  }
  id v21 = v20;

  _Block_object_dispose(&v27, 8);
  return v21;
}

BOOL __71__ACHTemplateEntity__templateWithUniqueName_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v16 = 0;
  uint64_t v8 = [v7 objectForPersistentID:a2 row:a4 error:&v16];
  id v9 = v16;
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v12)
  {
    id v13 = v9;
    if (v13)
    {
      if (a5) {
        *a5 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v14 = ACHLogDatabase();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __71__ACHTemplateEntity__templateWithUniqueName_profile_transaction_error___block_invoke_cold_1(a1);
    }
  }
  return v12 != 0;
}

+ (id)_templatesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v11 = [v9 database];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke;
  id v20 = &unk_2645181D0;
  id v24 = a1;
  id v21 = v9;
  id v22 = v8;
  id v12 = v10;
  id v23 = v12;
  id v13 = v8;
  id v14 = v9;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v11 error:a5 block:&v17];

  if (a5) {
    BOOL v15 = objc_msgSend(v12, "copy", v17, v18, v19, v20, v21, v22, v23, v24);
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

uint64_t __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 56) entityEncoderForProfile:*(void *)(a1 + 32) transaction:v5 purpose:1 encodingOptions:0 authorizationFilter:0];
  uint64_t v7 = *(void **)(a1 + 56);
  id v8 = [v6 orderedProperties];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) database];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2;
  v15[3] = &unk_2645181A8;
  id v16 = v6;
  id v17 = *(id *)(a1 + 32);
  id v18 = v5;
  id v19 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v6;
  uint64_t v13 = [v7 enumerateProperties:v8 withPredicate:v9 healthDatabase:v10 error:a3 enumerationHandler:v15];

  return v13;
}

uint64_t __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v22 = 0;
  id v8 = objc_msgSend(v7, "objectForPersistentID:row:error:", a2);
  id v9 = v22;
  uint64_t v10 = HDSQLiteColumnWithNameAsInt64();
  id v11 = [*(id *)(a1 + 40) syncIdentityManager];
  uint64_t v12 = *(void *)(a1 + 48);
  id v21 = v9;
  uint64_t v13 = [v11 identityForEntityID:v10 transaction:v12 error:&v21];
  id v14 = v21;

  if (!v13)
  {
    id v16 = ACHLogDatabase();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2_cold_1((uint64_t)v14);
    }
    goto LABEL_15;
  }
  BOOL v15 = [v13 identity];
  id v16 = achSyncIdentity(v15);

  if (v16) {
    [v8 setSyncIdentity:v16];
  }
  if (!v8)
  {
    id v18 = v14;
    if (v18)
    {
      if (a5) {
        *a5 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v19 = ACHLogDatabase();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2_cold_2();
    }

LABEL_15:
    uint64_t v17 = 0;
    goto LABEL_16;
  }
  [*(id *)(a1 + 56) addObject:v8];
  uint64_t v17 = 1;
LABEL_16:

  return v17;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return [a3 syncStoreType] == 1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  id v2 = objc_alloc(MEMORY[0x263F433C8]);
  id v3 = (void *)[v2 initWithEntityIdentifier:*MEMORY[0x263F235F8] schemaIdentifier:*MEMORY[0x263F23448]];
  return (HDSyncEntityIdentifier *)v3;
}

+ (int)currentSyncVersion
{
  return 1;
}

+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)0x100000000;
}

+ ($2825F4736939C4A6D3AD43837233062D)syncVersionRangeForSession:(id)a3
{
  return ($2825F4736939C4A6D3AD43837233062D)0x100000000;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F23698];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithData:v4];

  return v5;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [a5 database];
  int64_t v12 = [a1 nextSyncAnchorWithStartAnchor:a4 predicate:0 session:v10 healthDatabase:v11 error:a6];

  uint64_t v13 = ACHLogSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[ACHTemplateEntity nextSyncAnchorWithSession:startSyncAnchor:profile:error:]();
  }

  return v12;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  id v28 = a6;
  id v15 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = -1;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  uint64_t v16 = [v13 maxEncodedBytesPerCodableChangeForSyncEntityClass:a1];
  uint64_t v17 = ACHLogSync();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v45 = v13;
    __int16 v46 = 2048;
    int64_t v47 = var0;
    __int16 v48 = 2048;
    int64_t v49 = var1;
    _os_log_debug_impl(&dword_21F5DA000, v17, OS_LOG_TYPE_DEBUG, "Template Entity generating sync objects for session (%@), Anchor Range Start (%lld), Anchor Range End (%lld)", buf, 0x20u);
  }

  id v18 = [v14 database];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v29[3] = &unk_264518220;
  id v35 = a1;
  id v19 = v14;
  id v30 = v19;
  id v20 = v13;
  int64_t v36 = var0;
  int64_t v37 = var1;
  id v31 = v20;
  id v33 = &v40;
  id v21 = v15;
  id v32 = v21;
  id v34 = v39;
  uint64_t v38 = v16;
  int v22 = [a1 performReadTransactionWithHealthDatabase:v18 error:a7 block:v29];

  if (v22)
  {
    id v23 = ACHLogSync();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      *(_DWORD *)buf = 138543362;
      id v45 = v24;
      _os_log_impl(&dword_21F5DA000, v23, OS_LOG_TYPE_DEFAULT, "Template Entity sync generated (%{public}@} objects for sync.", buf, 0xCu);
    }
    id v25 = [v21 allObjects];
    char v26 = [v28 sendCodableChange:v25 version:0x100000000 resultAnchor:v41[3] sequence:0 done:1 error:a7];
  }
  else
  {
    char v26 = 0;
  }

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v40, 8);

  return v26;
}

uint64_t __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = [*(id *)(a1 + 72) entityEncoderForProfile:*(void *)(a1 + 32) transaction:v4 purpose:0 encodingOptions:0 authorizationFilter:0];
  id v6 = *(void **)(a1 + 72);
  uint64_t v7 = [v5 orderedProperties];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) database];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v20[3] = &unk_2645181F8;
  id v21 = v5;
  id v22 = *(id *)(a1 + 32);
  id v23 = v4;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 64);
  id v24 = v11;
  uint64_t v25 = v12;
  uint64_t v26 = *(void *)(a1 + 96);
  uint64_t v14 = *(void *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 88);
  id v15 = v4;
  id v16 = v5;
  uint64_t v17 = objc_msgSend(v6, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v7, 0, v9, v14, v13, 0, v8, v10, a3, v20);

  return v17;
}

BOOL __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, uint64_t a8)
{
  id v12 = a2;
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(v12, "persistentID"), a4, a8);
  uint64_t v14 = HDSQLiteColumnWithNameAsInt64();
  id v15 = [*(id *)(a1 + 40) syncIdentityManager];
  id v16 = [v15 identityForEntityID:v14 transaction:*(void *)(a1 + 48) error:a8];

  if (v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x263F23690]);
    id v18 = [v16 identity];
    id v19 = [v18 hardwareIdentifier];
    id v20 = objc_msgSend(v19, "hk_dataForUUIDBytes");
    [v17 setHardwareIdentifier:v20];

    id v21 = [v16 identity];
    id v22 = [v21 databaseIdentifier];
    id v23 = objc_msgSend(v22, "hk_dataForUUIDBytes");
    [v17 setDatabaseIdentifier:v23];

    id v24 = [v16 identity];
    uint64_t v25 = [v24 instanceDiscriminator];
    [v17 setInstanceDiscriminator:v25];

    [v13 setSyncIdentity:v17];
    BOOL v26 = v13 != 0;
    if (v13)
    {
      [*(id *)(a1 + 56) addObject:v13];
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v13 encodedByteCount];
      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) >= *(void *)(a1 + 72)) {
        *a7 = 1;
      }
    }
    else
    {
      uint64_t v27 = ACHLogSync();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1();
      }
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = ACHLogSync();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    *(_DWORD *)buf = 138543362;
    long long v39 = v15;
    _os_log_impl(&dword_21F5DA000, v14, OS_LOG_TYPE_DEFAULT, "Template Entity received sync objects, count: %{public}@", buf, 0xCu);
  }
  if (![v11 count])
  {
    id v16 = ACHLogSync();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v16, OS_LOG_TYPE_DEFAULT, "Received zero template sync objects, nothing to do.", buf, 2u);
    }
    goto LABEL_22;
  }
  id v32 = a1;
  id v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v17 = v11;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = (void *)[objc_alloc(MEMORY[0x263F236D8]) initWithCodable:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        if (v22) {
          [v16 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v19);
  }

  uint64_t v23 = [v16 count];
  id v24 = ACHLogSync();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (!v23)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v24, OS_LOG_TYPE_DEFAULT, "Received zero decodable templates from sync, nothing to do.", buf, 2u);
    }

LABEL_22:
    int64_t v30 = 0;
    goto LABEL_23;
  }
  if (v25)
  {
    BOOL v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v16, "count"));
    *(_DWORD *)buf = 138543362;
    long long v39 = v26;
    _os_log_impl(&dword_21F5DA000, v24, OS_LOG_TYPE_DEFAULT, "Decoded %{public}@ templates from sync.", buf, 0xCu);
  }
  uint64_t v27 = [v12 syncProvenance];
  id v28 = [MEMORY[0x263F431E0] contextForWritingProtectedData];
  int v29 = [v32 _insertTemplates:v16 provenance:v27 useLegacySyncIdentity:1 profile:v13 databaseContext:v28 error:a7];

  notify_post((const char *)[(id)*MEMORY[0x263F234A8] UTF8String]);
  int64_t v30 = v29 ^ 1u;
LABEL_23:

  return v30;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  if (a3 >= 8) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (id)codableTemplateForTemplateInDatabase:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  BOOL v25 = __Block_byref_object_copy__27;
  BOOL v26 = __Block_byref_object_dispose__27;
  id v27 = 0;
  id v10 = [v8 uniqueName];
  id v11 = [MEMORY[0x263F434A0] predicateWithProperty:@"unique_name" equalToValue:v10];

  id v12 = [v9 database];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__ACHTemplateEntity_codableTemplateForTemplateInDatabase_profile_error___block_invoke;
  v17[3] = &unk_2645164E0;
  id v21 = a1;
  id v13 = v9;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  uint64_t v20 = &v22;
  [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v17];

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __72__ACHTemplateEntity_codableTemplateForTemplateInDatabase_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 56) entityEncoderForProfile:*(void *)(a1 + 32) transaction:a2 purpose:1 encodingOptions:0 authorizationFilter:0];
  id v6 = *(void **)(a1 + 56);
  uint64_t v7 = [v5 orderedProperties];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) database];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__ACHTemplateEntity_codableTemplateForTemplateInDatabase_profile_error___block_invoke_2;
  v14[3] = &unk_2645164B8;
  uint64_t v10 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v10;
  id v11 = v5;
  uint64_t v12 = [v6 enumerateProperties:v7 withPredicate:v8 healthDatabase:v9 error:a3 enumerationHandler:v14];

  return v12;
}

BOOL __72__ACHTemplateEntity_codableTemplateForTemplateInDatabase_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v12 = 0;
  uint64_t v8 = [v7 codableRepresentationForPersistentID:a2 row:a4 error:&v12];
  id v9 = v12;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
  }
  else
  {
    uint64_t v10 = ACHLogDatabase();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __72__ACHTemplateEntity_codableTemplateForTemplateInDatabase_profile_error___block_invoke_2_cold_1();
    }

    if (*a5) {
      *a5 = v9;
    }
  }

  return v8 != 0;
}

void __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a1 uniqueName];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_21F5DA000, a3, OS_LOG_TYPE_ERROR, "Error removing existing template '%{public}@': %{public}@", (uint8_t *)&v6, 0x16u);
}

void __71__ACHTemplateEntity__templateWithUniqueName_profile_transaction_error___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 40);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v1, v2, "Error instantiating template for unique name %{public}@ during database retrieval: %{public}@", (void)v3, DWORD2(v3));
}

void __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v1, v2, "Error fetching sync identity for template: %{public}@, %{public}@", (void)v3, DWORD2(v3));
}

void __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_ERROR, "Error instantiating template during database retrieval: %{public}@", v1, 0xCu);
}

+ (void)nextSyncAnchorWithSession:startSyncAnchor:profile:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_DEBUG, "Template Entity returning next sync anchor: %lld", v1, 0xCu);
}

void __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error creating codable representation of Template (%@): %@");
}

void __72__ACHTemplateEntity_codableTemplateForTemplateInDatabase_profile_error___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_ERROR, "Error instantiating codable during database retrieval: %{public}@", v1, 0xCu);
}

@end