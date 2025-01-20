@interface HDOntologyDiagnosticOperation
+ (id)_udcTableColumnTitles;
+ (void)_appendEntry:(id)a3 tableFormatter:(id)a4;
- (BOOL)_enumerateUDCTableInDatabase:(id)a3 appendToFormatter:(id)a4 error:(id *)a5;
- (id)_countOfElementsPerSlotInDatabase:(id)a3;
- (id)_entriesForSlots:(id)a3 database:(id)a4;
- (id)_expandResultsToIndividualSlots:(id)a3;
- (id)_valueForDaemonDefaultKey:(id)a3 healthStore:(id)a4;
- (id)reportFilename;
- (void)_appendDateStringForDefaultKey:(id)a3 tableFormatter:(id)a4 healthStore:(id)a5;
- (void)_logAndAndAppendFormat:(id)a3;
- (void)_reportBasicChecksForDatabase:(id)a3;
- (void)_reportCountsForUDCTableRowsInDatabase:(id)a3;
- (void)_reportDomain:(id)a3 keyValues:(id)a4;
- (void)_reportElementCountsBySlot:(id)a3 entriesBySlot:(id)a4;
- (void)_reportElementCountsBySlotForDatabase:(id)a3;
- (void)_reportForOntologyDatabase;
- (void)_reportForOntologyDatabase:(id)a3;
- (void)_reportForOntologyFeaturesWithOntologyStore:(id)a3;
- (void)_reportForOntologyKeyValueDomains;
- (void)_reportForOntologyKeyValueDomainsWithDatabase:(id)a3;
- (void)_reportForOntologyUserDefaultsWithHealthStore:(id)a3;
- (void)_reportForShardRequirementStatuses:(id)a3;
- (void)_reportLocaleAndRegion;
- (void)_reportNetworkReachabilityForEnvironment:(id)a3;
- (void)_reportOntologyHostURLWithOntologyStore:(id)a3;
- (void)_reportOntologyMetadataForDatabase:(id)a3;
- (void)_reportReachabilityFlags:(unsigned int)a3;
- (void)_reportShardRegistryForDatabase:(id)a3;
- (void)_reportUDCTableInDatabase:(id)a3;
- (void)_reportUserDomainConcepts;
- (void)_reportUserDomainConceptsForDatabase:(id)a3;
- (void)run;
@end

@implementation HDOntologyDiagnosticOperation

- (id)reportFilename
{
  return @"Ontology.txt";
}

- (void)run
{
  [(HDDiagnosticOperation *)self log:@"Analyzing ontology database...\n"];
  id v9 = objc_alloc_init(MEMORY[0x263F0A410]);
  v3 = (void *)[objc_alloc(MEMORY[0x263F0A5C8]) initWithHealthStore:v9];
  v4 = [MEMORY[0x263F0A980] sharedBehavior];
  [v4 supportsOntology];
  v5 = HKStringFromBool();
  [(HDDiagnosticOperation *)self appendFormat:@"Supports Ontology: %@", v5];

  [v4 supportsOntologyDatabaseUpdates];
  v6 = HKStringFromBool();
  [(HDDiagnosticOperation *)self appendFormat:@"Supports Ontology Database Updates: %@", v6];

  v7 = [v4 features];
  [v7 shardedOntology];
  v8 = HKStringFromBool();
  [(HDDiagnosticOperation *)self appendFormat:@"Sharded Ontology Enabled: %@", v8];

  [(HDOntologyDiagnosticOperation *)self _reportLocaleAndRegion];
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDOntologyDiagnosticOperation *)self _reportOntologyHostURLWithOntologyStore:v3];
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDOntologyDiagnosticOperation *)self _reportForOntologyDatabase];
  [(HDOntologyDiagnosticOperation *)self _reportForOntologyFeaturesWithOntologyStore:v3];
  [(HDOntologyDiagnosticOperation *)self _reportForOntologyKeyValueDomains];
  [(HDOntologyDiagnosticOperation *)self _reportForOntologyUserDefaultsWithHealthStore:v9];
  [(HDOntologyDiagnosticOperation *)self _reportUserDomainConcepts];
}

- (void)_reportLocaleAndRegion
{
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  v3 = [v6 localeIdentifier];
  [(HDDiagnosticOperation *)self appendFormat:@"Current Locale: %@", v3];

  v4 = [v6 languageCode];
  [(HDDiagnosticOperation *)self appendFormat:@"Current Language: %@", v4];

  v5 = [v6 countryCode];
  [(HDDiagnosticOperation *)self appendFormat:@"Current Country/Region: %@", v5];
}

- (void)_reportOntologyHostURLWithOntologyStore:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__HDOntologyDiagnosticOperation__reportOntologyHostURLWithOntologyStore___block_invoke;
  v8[3] = &unk_264866F40;
  v10 = &v11;
  id v6 = v5;
  id v9 = v6;
  [v4 ontologyServerURLWithCompletion:v8];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7)) {
    [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"Timed out attempting to get the ontology host URL"];
  }
  [(HDDiagnosticOperation *)self appendFormat:@"Ontology Host URL: %@", v12[5]];
  [(HDOntologyDiagnosticOperation *)self _reportNetworkReachabilityForEnvironment:v12[5]];

  _Block_object_dispose(&v11, 8);
}

intptr_t __73__HDOntologyDiagnosticOperation__reportOntologyHostURLWithOntologyStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 absoluteString];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

- (void)_reportForOntologyDatabase
{
  id v8 = [(HDDiagnosticOperation *)self healthDirectoryURL];
  uint64_t v3 = [v8 URLByAppendingPathComponent:@"ontology" isDirectory:1];
  uint64_t v4 = [v3 URLByAppendingPathComponent:@"HealthOntology.db" isDirectory:0];
  dispatch_semaphore_t v5 = [v4 path];
  [(HDDiagnosticOperation *)self appendFormat:@"Ontology Database %@", v5];

  [(HDDiagnosticOperation *)self reportStatsForDatabaseAtURL:v4];
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self verifyPermissionsForFileAtURL:v4];
  id v6 = [(HDDiagnosticOperation *)self openReadOnlyDatabaseAtURL:v4];
  if (v6)
  {
    [(HDOntologyDiagnosticOperation *)self _reportForOntologyDatabase:v6];
  }
  else
  {
    dispatch_time_t v7 = [v4 path];
    [(HDDiagnosticOperation *)self appendFormat:@"Unable to open %@ \n", v7];
  }
  [v6 close];
}

- (void)_reportForOntologyDatabase:(id)a3
{
  id v4 = a3;
  [(HDOntologyDiagnosticOperation *)self _reportBasicChecksForDatabase:v4];
  [(HDOntologyDiagnosticOperation *)self _reportShardRegistryForDatabase:v4];
  [(HDOntologyDiagnosticOperation *)self _reportElementCountsBySlotForDatabase:v4];
  [(HDOntologyDiagnosticOperation *)self _reportOntologyMetadataForDatabase:v4];
}

- (void)_reportBasicChecksForDatabase:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HDDiagnosticOperation *)self checkSchemaVersionForDatabase:v4 currentSchema:8 futureSchema:10001];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  dispatch_semaphore_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  -[HDDiagnosticOperation reportCountsForDatabase:entityClasses:](self, "reportCountsForDatabase:entityClasses:", v4, v5, v6, v7);

  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  [(HDDiagnosticOperation *)self appendNewline];
}

- (void)_reportShardRegistryForDatabase:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_semaphore_t v5 = (void *)[objc_alloc(MEMORY[0x263F0A808]) initWithColumnTitles:&unk_26DD8D6B8];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = (void *)MEMORY[0x263F432B0];
  id v24 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __65__HDOntologyDiagnosticOperation__reportShardRegistryForDatabase___block_invoke;
  v22[3] = &unk_264866F68;
  id v8 = v6;
  id v23 = v8;
  char v9 = [v7 enumerateEntriesWithPredicate:0 orderingTerms:0 database:v4 error:&v24 enumerationHandler:v22];
  id v10 = v24;
  uint64_t v11 = v10;
  if (v9)
  {
    [v8 sortUsingComparator:&__block_literal_global_0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          [(id)objc_opt_class() _appendEntry:*(void *)(*((void *)&v18 + 1) + 8 * v16++) tableFormatter:v5];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v25 count:16];
      }
      while (v14);
    }

    [(HDDiagnosticOperation *)self appendFormat:@"Ontology Shard Registry"];
    [(HDDiagnosticOperation *)self appendSeparator];
    v17 = [v5 formattedTable];
    [(HDDiagnosticOperation *)self appendString:v17];

    [(HDDiagnosticOperation *)self appendNewline];
    [(HDDiagnosticOperation *)self appendStrongSeparator];
    [(HDDiagnosticOperation *)self appendNewline];
  }
  else
  {
    [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"Failed to enumerate shard registry entries: %@", v10];
  }
}

uint64_t __65__HDOntologyDiagnosticOperation__reportShardRegistryForDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __65__HDOntologyDiagnosticOperation__reportShardRegistryForDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 identifier];
  uint64_t v7 = [v5 identifier];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    char v9 = [v4 schemaType];
    id v10 = [v5 schemaType];
    uint64_t v8 = [v9 compare:v10];

    if (!v8)
    {
      [v4 schemaVersion];
      [v5 schemaVersion];
      uint64_t v8 = HKCompareIntegers();
    }
  }

  return v8;
}

+ (void)_appendEntry:(id)a3 tableFormatter:(id)a4
{
  v62[27] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v46 = a4;
  v61 = [v5 identifier];
  v62[0] = v61;
  v60 = [v5 schemaType];
  v62[1] = v60;
  v59 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "schemaVersion"));
  v58 = [v59 stringValue];
  v62[2] = v58;
  [v5 settings];
  v57 = HKStringFromOntologyShardSettings();
  v62[3] = v57;
  v56 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "slot"));
  v55 = [v56 stringValue];
  v62[4] = v55;
  [v5 desiredState];
  v54 = HKStringFromOntologyShardState();
  v62[5] = v54;
  v53 = [v5 desiredStateDate];
  v52 = HKDiagnosticStringFromDate();
  v62[6] = v52;
  [v5 currentVersion];
  v51 = HKStringFromOntologyShardVersion();
  v62[7] = v51;
  v50 = [v5 currentVersionDate];
  v49 = HKDiagnosticStringFromDate();
  v62[8] = v49;
  v48 = [v5 currentRegion];
  v62[9] = v48;
  v47 = [v5 currentRegionDate];
  v45 = HKDiagnosticStringFromDate();
  v62[10] = v45;
  uint64_t v6 = [v5 currentLocale];
  v44 = (void *)v6;
  if (v6) {
    uint64_t v7 = (__CFString *)v6;
  }
  else {
    uint64_t v7 = @"nil";
  }
  v62[11] = v7;
  v43 = [v5 currentLocaleDate];
  v42 = HKDiagnosticStringFromDate();
  v62[12] = v42;
  [v5 availableVersion];
  v41 = HKStringFromOntologyShardVersion();
  v62[13] = v41;
  v40 = [v5 availableVersionDate];
  v39 = HKDiagnosticStringFromDate();
  v62[14] = v39;
  v38 = [v5 availableRegion];
  v62[15] = v38;
  v37 = [v5 availableRegionDate];
  v36 = HKDiagnosticStringFromDate();
  v62[16] = v36;
  uint64_t v8 = [v5 availableLocale];
  v35 = (void *)v8;
  if (v8) {
    char v9 = (__CFString *)v8;
  }
  else {
    char v9 = @"nil";
  }
  v62[17] = v9;
  v34 = [v5 availableLocaleDate];
  v33 = HKDiagnosticStringFromDate();
  v62[18] = v33;
  v32 = [v5 availableURL];
  uint64_t v10 = [v32 absoluteString];
  v31 = (void *)v10;
  if (v10) {
    uint64_t v11 = (__CFString *)v10;
  }
  else {
    uint64_t v11 = @"nil";
  }
  v62[19] = v11;
  v30 = [v5 availableURLDate];
  v29 = HKDiagnosticStringFromDate();
  v62[20] = v29;
  uint64_t v12 = [v5 availableChecksum];
  uint64_t v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = @"nil";
  }
  v62[21] = v14;
  v28 = [v5 availableChecksumDate];
  v27 = HKDiagnosticStringFromDate();
  v62[22] = v27;
  uint64_t v15 = [v5 availableSize];
  uint64_t v16 = *MEMORY[0x263F09B68];
  uint64_t v26 = v15;
  if (v15 == *MEMORY[0x263F09B68])
  {
    v17 = @"unkown";
  }
  else
  {
    id v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "availableSize"));
    v17 = [v24 stringValue];
  }
  v25 = v17;
  v62[23] = v17;
  long long v18 = [v5 availableSizeDate];
  long long v19 = HKDiagnosticStringFromDate();
  v62[24] = v19;
  [v5 availableState];
  long long v20 = HKStringFromOntologyShardState();
  v62[25] = v20;
  long long v21 = [v5 availableStateDate];
  v22 = HKDiagnosticStringFromDate();
  v62[26] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:27];
  [v46 appendRow:v23];

  if (v26 != v16)
  {
  }
}

- (void)_reportElementCountsBySlotForDatabase:(id)a3
{
  id v4 = a3;
  id v8 = [(HDOntologyDiagnosticOperation *)self _countOfElementsPerSlotInDatabase:v4];
  id v5 = [(HDOntologyDiagnosticOperation *)self _expandResultsToIndividualSlots:v8];
  uint64_t v6 = [v5 allKeys];
  uint64_t v7 = [(HDOntologyDiagnosticOperation *)self _entriesForSlots:v6 database:v4];

  [(HDOntologyDiagnosticOperation *)self _reportElementCountsBySlot:v5 entriesBySlot:v7];
}

- (id)_countOfElementsPerSlotInDatabase:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v16 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__HDOntologyDiagnosticOperation__countOfElementsPerSlotInDatabase___block_invoke;
  v14[3] = &unk_264866D68;
  id v7 = v6;
  id v15 = v7;
  char v8 = [v5 executeSQL:@"SELECT 'nodes', slots, COUNT(*) FROM nodes GROUP BY slots UNION ALL SELECT 'attributes', slots, COUNT(*) FROM attributes GROUP BY slots UNION ALL SELECT 'relationships', slots, COUNT(*) FROM relationships GROUP BY slots", &v16, 0, v14 error bindingHandler enumerationHandler];

  id v9 = v16;
  uint64_t v10 = v9;
  if ((v8 & 1) == 0) {
    [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"Failed to get count of elements per shard slot: %@", v9];
  }
  uint64_t v11 = v15;
  id v12 = v7;

  return v12;
}

uint64_t __67__HDOntologyDiagnosticOperation__countOfElementsPerSlotInDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = MEMORY[0x22A6B89F0](a2, 0);
  id v5 = MEMORY[0x22A6B89E0](a2, 1);
  id v6 = MEMORY[0x22A6B89E0](a2, 2);
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
  }
  [v7 setObject:v6 forKeyedSubscript:v4];

  return 1;
}

- (id)_expandResultsToIndividualSlots:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = v3;
  uint64_t v26 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v38;
    id v28 = v5;
    id v29 = v4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v38 != v25)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(v5);
          uint64_t v6 = v7;
        }
        uint64_t v8 = 0;
        uint64_t v27 = v6;
        id v9 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
        v30 = v9;
        do
        {
          if (((unint64_t)objc_msgSend(v9, "unsignedLongLongValue", v25) >> v8))
          {
            uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v8];
            uint64_t v11 = [v5 objectForKeyedSubscript:v9];
            uint64_t v12 = [v4 objectForKeyedSubscript:v10];
            if (v12)
            {
              uint64_t v13 = (void *)v12;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              uint64_t v14 = [&unk_26DD8D6D0 countByEnumeratingWithState:&v33 objects:v41 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                v31 = v10;
                uint64_t v32 = v8;
                uint64_t v16 = *(void *)v34;
                do
                {
                  for (uint64_t i = 0; i != v15; ++i)
                  {
                    if (*(void *)v34 != v16) {
                      objc_enumerationMutation(&unk_26DD8D6D0);
                    }
                    uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * i);
                    long long v19 = NSNumber;
                    long long v20 = [v13 objectForKeyedSubscript:v18];
                    uint64_t v21 = [v20 integerValue];
                    v22 = [v11 objectForKeyedSubscript:v18];
                    id v23 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v22, "integerValue") + v21);
                    [v13 setObject:v23 forKeyedSubscript:v18];
                  }
                  uint64_t v15 = [&unk_26DD8D6D0 countByEnumeratingWithState:&v33 objects:v41 count:16];
                }
                while (v15);
                id v5 = v28;
                id v4 = v29;
                uint64_t v10 = v31;
                uint64_t v8 = v32;
                id v9 = v30;
              }
            }
            else
            {
              uint64_t v13 = (void *)[v11 mutableCopy];
              [v4 setObject:v13 forKeyedSubscript:v10];
            }
          }
          ++v8;
        }
        while (v8 != 64);
        uint64_t v6 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v26);
  }

  return v4;
}

- (id)_entriesForSlots:(id)a3 database:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  id v10 = objc_alloc(MEMORY[0x263F434B0]);
  uint64_t v11 = (void *)[v10 initWithProperty:*MEMORY[0x263F43060] values:v8 contains:1];

  uint64_t v12 = (void *)MEMORY[0x263F432B0];
  id v21 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __59__HDOntologyDiagnosticOperation__entriesForSlots_database___block_invoke;
  v19[3] = &unk_264866F68;
  id v13 = v9;
  id v20 = v13;
  LOBYTE(v12) = [v12 enumerateEntriesWithPredicate:v11 orderingTerms:0 database:v7 error:&v21 enumerationHandler:v19];

  id v14 = v21;
  uint64_t v15 = v14;
  if ((v12 & 1) == 0) {
    [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"Failed to enumerate shard registry entries: %@", v14];
  }
  uint64_t v16 = v20;
  id v17 = v13;

  return v17;
}

uint64_t __59__HDOntologyDiagnosticOperation__entriesForSlots_database___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v4 = a2;
  id v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "slot"));
  [v2 setObject:v4 forKeyedSubscript:v5];

  return 1;
}

- (void)_reportElementCountsBySlot:(id)a3 entriesBySlot:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v25 = a4;
  uint64_t v26 = v6;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  objc_msgSend(v6, "hk_sortedKeys");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v27)
  {
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        id v9 = [v25 objectForKeyedSubscript:v8];
        id v29 = v9;
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = NSString;
          uint64_t v12 = [v9 identifier];
          id v13 = [v10 schemaType];
          id v14 = [v11 stringWithFormat:@" %@ %@ %ld", v12, v13, objc_msgSend(v10, "schemaVersion")];
        }
        else
        {
          id v14 = &stru_26DD8B888;
        }
        id v28 = v14;
        [(HDDiagnosticOperation *)self appendFormat:@"Slot %@%@", v8, v14];
        [(HDDiagnosticOperation *)self appendSeparator];
        uint64_t v15 = [v26 objectForKeyedSubscript:v8];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v16 = objc_msgSend(v15, "hk_sortedKeys");
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * j);
              v22 = [v15 objectForKeyedSubscript:v21];
              -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", @"        %lld %@", [v22 longLongValue], v21);
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v18);
        }

        [(HDDiagnosticOperation *)self appendNewline];
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v27);
  }
}

- (void)_reportOntologyMetadataForDatabase:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F0A808];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithColumnTitles:&unk_26DD8D6E8];
  id v7 = (void *)MEMORY[0x263F43340];
  id v14 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__HDOntologyDiagnosticOperation__reportOntologyMetadataForDatabase___block_invoke;
  v12[3] = &unk_264866FB0;
  id v8 = v6;
  id v13 = v8;
  LOBYTE(v7) = [v7 enumerateMetadataValuesWithPredicate:0 database:v5 error:&v14 enumerationHandler:v12];

  id v9 = v14;
  id v10 = v9;
  if ((v7 & 1) == 0) {
    [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"Failed to enumerate ontology metadata: %@", v9];
  }
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendFormat:@"Ontology Metadata"];
  [(HDDiagnosticOperation *)self appendSeparator];
  uint64_t v11 = [v8 formattedTable];
  [(HDDiagnosticOperation *)self appendString:v11];

  [(HDDiagnosticOperation *)self appendNewline];
}

uint64_t __68__HDOntologyDiagnosticOperation__reportOntologyMetadataForDatabase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[2] = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 32);
  v10[0] = a2;
  v10[1] = a3;
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 arrayWithObjects:v10 count:2];
  [v4 appendRow:v8];

  return 1;
}

- (void)_reportForOntologyFeaturesWithOntologyStore:(id)a3
{
  id v4 = a3;
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  [(HDDiagnosticOperation *)self appendNewline];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__1;
  uint64_t v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __77__HDOntologyDiagnosticOperation__reportForOntologyFeaturesWithOntologyStore___block_invoke;
  uint64_t v11 = &unk_264866FD8;
  id v13 = &v14;
  id v6 = v5;
  uint64_t v12 = v6;
  [v4 shardRequirementStatusesWithCompletion:&v8];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"Timed out attempting to get shard requirement statuses", v8, v9, v10, v11];
  }
  else if (objc_msgSend((id)v15[5], "count", v8, v9, v10, v11))
  {
    [(HDOntologyDiagnosticOperation *)self _reportForShardRequirementStatuses:v15[5]];
  }
  else
  {
    [(HDDiagnosticOperation *)self appendFormat:@"No feature evaluators to report required shards"];
  }

  _Block_object_dispose(&v14, 8);
}

void __77__HDOntologyDiagnosticOperation__reportForOntologyFeaturesWithOntologyStore___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_reportForShardRequirementStatuses:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_semaphore_t v5 = (void *)[objc_alloc(MEMORY[0x263F0A808]) initWithColumnTitles:&unk_26DD8D700];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v19[0] = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        uint64_t v11 = [v6 objectForKeyedSubscript:(void)v15];
        [v11 integerValue];
        uint64_t v12 = HKStringFromOptionalBooleanResult();
        v19[1] = v12;
        id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
        [v5 appendRow:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  [(HDDiagnosticOperation *)self appendFormat:@"Ontology Feature Evaluator Statuses"];
  [(HDDiagnosticOperation *)self appendSeparator];
  uint64_t v14 = [v5 formattedTable];
  [(HDDiagnosticOperation *)self appendString:v14];

  [(HDDiagnosticOperation *)self appendNewline];
}

- (void)_reportForOntologyKeyValueDomains
{
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  [(HDDiagnosticOperation *)self appendNewline];
  id v3 = [(HDDiagnosticOperation *)self healthDirectoryURL];
  id v6 = [v3 URLByAppendingPathComponent:@"healthdb.sqlite" isDirectory:0];

  id v4 = [(HDDiagnosticOperation *)self openReadOnlyDatabaseAtURL:v6];
  if (v4)
  {
    [(HDOntologyDiagnosticOperation *)self _reportForOntologyKeyValueDomainsWithDatabase:v4];
  }
  else
  {
    dispatch_semaphore_t v5 = [v6 path];
    [(HDDiagnosticOperation *)self appendFormat:@"Unable to open %@ \n", v5];
  }
  [v4 close];
}

- (void)_reportForOntologyKeyValueDomainsWithDatabase:(id)a3
{
  id v7 = 0;
  id v4 = [MEMORY[0x263F433E8] _rawValuesForKeys:0 domain:@"HDOntologyUpdateCoordinator" category:0 database:a3 error:&v7];
  id v5 = v7;
  id v6 = v5;
  if (v4) {
    [(HDOntologyDiagnosticOperation *)self _reportDomain:@"HDOntologyUpdateCoordinator" keyValues:v4];
  }
  else {
    [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"ERROR: Failed to get key value pairs for domain \"%@\": %@", @"HDOntologyUpdateCoordinator", v5];
  }
}

- (void)_reportDomain:(id)a3 keyValues:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v5 = a4;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F0A808]) initWithColumnTitles:&unk_26DD8D718];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  objc_msgSend(v5, "hk_sortedKeys");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [v5 objectForKeyedSubscript:v11];
        if (([v11 containsString:@"updateStartDate"] & 1) != 0
          || [v11 containsString:@"updateEndDate"])
        {
          id v13 = (void *)MEMORY[0x263EFF910];
          [v12 doubleValue];
          uint64_t v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
          long long v15 = HKDiagnosticStringFromDate();
        }
        else
        {
          if ([v11 containsString:@"updateError"])
          {
            id v16 = v12;
          }
          else
          {
            id v16 = [v12 description];
          }
          long long v15 = v16;
        }
        v26[0] = v11;
        v26[1] = v15;
        long long v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
        [v6 appendRow:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  [(HDDiagnosticOperation *)self appendFormat:@"%@ Key Value Domain", v20];
  [(HDDiagnosticOperation *)self appendSeparator];
  long long v18 = [v6 formattedTable];
  [(HDDiagnosticOperation *)self appendString:v18];

  [(HDDiagnosticOperation *)self appendNewline];
}

- (void)_reportForOntologyUserDefaultsWithHealthStore:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  [(HDDiagnosticOperation *)self appendNewline];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F0A808]) initWithColumnTitles:&unk_26DD8D730];
  id v6 = [(HDOntologyDiagnosticOperation *)self _valueForDaemonDefaultKey:@"PeriodicActivity-com.apple.healthd.ontology.update-ErrorCount" healthStore:v4];
  v12[0] = @"PeriodicActivity-com.apple.healthd.ontology.update-ErrorCount";
  uint64_t v7 = [v6 stringValue];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = @"(null)";
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  v12[1] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  [v5 appendRow:v10];

  [(HDOntologyDiagnosticOperation *)self _appendDateStringForDefaultKey:@"PeriodicActivity-com.apple.healthd.ontology.update-LastSuccessfulRun" tableFormatter:v5 healthStore:v4];
  [(HDOntologyDiagnosticOperation *)self _appendDateStringForDefaultKey:@"PeriodicActivity-com.apple.healthd.ontology.update-EarliestNextRun" tableFormatter:v5 healthStore:v4];

  [(HDDiagnosticOperation *)self appendFormat:@"healthd User Defaults"];
  [(HDDiagnosticOperation *)self appendSeparator];
  uint64_t v11 = [v5 formattedTable];
  [(HDDiagnosticOperation *)self appendString:v11];

  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  [(HDDiagnosticOperation *)self appendNewline];
}

- (void)_appendDateStringForDefaultKey:(id)a3 tableFormatter:(id)a4 healthStore:(id)a5
{
  v13[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(HDOntologyDiagnosticOperation *)self _valueForDaemonDefaultKey:v9 healthStore:a5];
  if (v10)
  {
    HKDiagnosticStringFromDate();
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = @"(null)";
  }
  v13[0] = v9;
  v13[1] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  [v8 appendRow:v12];
}

- (id)_valueForDaemonDefaultKey:(id)a3 healthStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__1;
  uint64_t v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__1;
  long long v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__HDOntologyDiagnosticOperation__valueForDaemonDefaultKey_healthStore___block_invoke;
  v14[3] = &unk_264867000;
  id v16 = &v24;
  long long v17 = &v18;
  id v9 = v8;
  long long v15 = v9;
  [v7 _fetchDaemonPreferenceForKey:v6 completion:v14];
  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v9, v10)) {
    [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"Timed out attempting to get daemon default for key \"%@\"", v6];
  }
  uint64_t v11 = v19[5];
  if (v11) {
    [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"Error getting daemon default for key \"%@\": %@", v6, v11];
  }
  id v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __71__HDOntologyDiagnosticOperation__valueForDaemonDefaultKey_healthStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_reportNetworkReachabilityForEnvironment:(id)a3
{
  SCNetworkReachabilityFlags flags = 0;
  id v4 = a3;
  id v5 = SCNetworkReachabilityCreateWithName(0, (const char *)[v4 UTF8String]);
  if (v5)
  {
    id v6 = v5;
    if (SCNetworkReachabilityGetFlags(v5, &flags)) {
      [(HDOntologyDiagnosticOperation *)self _reportReachabilityFlags:flags];
    }
    else {
      [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"Unable to get reachability flags for \"%@\"", v4];
    }
    CFRelease(v6);
  }
  else
  {
    [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"Unable to get reachability flags for \"%@\"", v4];
  }
}

- (void)_reportReachabilityFlags:(unsigned int)a3
{
  v32[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F0A808]) initWithColumnTitles:&unk_26DD8D748];
  v32[0] = @"TransientConnection";
  id v5 = HKStringFromBool();
  v32[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  [v4 appendRow:v6];

  v31[0] = @"Reachable";
  uint64_t v7 = HKStringFromBool();
  v31[1] = v7;
  dispatch_semaphore_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  [v4 appendRow:v8];

  v30[0] = @"ConnectionRequired";
  uint64_t v9 = HKStringFromBool();
  v30[1] = v9;
  dispatch_time_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  [v4 appendRow:v10];

  v29[0] = @"ConnectionOnTraffic";
  id v11 = HKStringFromBool();
  v29[1] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  [v4 appendRow:v12];

  v28[0] = @"InterventionRequired";
  id v13 = HKStringFromBool();
  v28[1] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  [v4 appendRow:v14];

  v27[0] = @"ConnectionOnDemand";
  long long v15 = HKStringFromBool();
  v27[1] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  [v4 appendRow:v16];

  v26[0] = @"IsLocalAddress";
  long long v17 = HKStringFromBool();
  v26[1] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  [v4 appendRow:v18];

  v25[0] = @"IsDirect";
  id v19 = HKStringFromBool();
  v25[1] = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  [v4 appendRow:v20];

  v24[0] = @"IsWWAN";
  uint64_t v21 = HKStringFromBool();
  v24[1] = v21;
  long long v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  [v4 appendRow:v22];

  [(HDDiagnosticOperation *)self appendSeparator];
  id v23 = [v4 formattedTable];
  [(HDDiagnosticOperation *)self appendString:v23];

  [(HDDiagnosticOperation *)self appendNewline];
}

- (void)_logAndAndAppendFormat:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(HDDiagnosticOperation *)self log:@"%@", v6];
  [(HDDiagnosticOperation *)self appendFormat:@"%@", v6];
}

- (void)_reportUserDomainConcepts
{
  id v6 = [(HDDiagnosticOperation *)self healthDirectoryURL];
  id v3 = [v6 URLByAppendingPathComponent:@"healthdb_secure.sqlite" isDirectory:0];
  id v4 = [(HDDiagnosticOperation *)self openReadOnlyDatabaseAtURL:v3];
  if (v4)
  {
    [(HDOntologyDiagnosticOperation *)self _reportUserDomainConceptsForDatabase:v4];
  }
  else
  {
    id v5 = [v3 path];
    [(HDDiagnosticOperation *)self appendFormat:@"Unable to open %@ \n", v5];
  }
  [v4 close];
}

- (void)_reportUserDomainConceptsForDatabase:(id)a3
{
  id v4 = a3;
  [(HDOntologyDiagnosticOperation *)self _reportCountsForUDCTableRowsInDatabase:v4];
  [(HDOntologyDiagnosticOperation *)self _reportUDCTableInDatabase:v4];
}

- (void)_reportCountsForUDCTableRowsInDatabase:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HDDiagnosticOperation *)self appendString:@"User Domains Concept Table Counts"];
  [(HDDiagnosticOperation *)self appendNewline];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:13];
  -[HDDiagnosticOperation reportCountsForDatabase:entityClasses:](self, "reportCountsForDatabase:entityClasses:", v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);

  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  [(HDDiagnosticOperation *)self appendNewline];
}

- (void)_reportUDCTableInDatabase:(id)a3
{
  id v4 = a3;
  [(HDDiagnosticOperation *)self appendString:@"User Domains Concepts"];
  [(HDDiagnosticOperation *)self appendSeparator];
  id v5 = objc_alloc(MEMORY[0x263F0A808]);
  uint64_t v6 = +[HDOntologyDiagnosticOperation _udcTableColumnTitles];
  uint64_t v7 = (void *)[v5 initWithColumnTitles:v6];

  id v11 = 0;
  LOBYTE(v6) = [(HDOntologyDiagnosticOperation *)self _enumerateUDCTableInDatabase:v4 appendToFormatter:v7 error:&v11];

  id v8 = v11;
  uint64_t v9 = v8;
  if (v6)
  {
    uint64_t v10 = [v7 formattedTable];
    [(HDDiagnosticOperation *)self appendString:v10];

    [(HDDiagnosticOperation *)self appendNewline];
    [(HDDiagnosticOperation *)self appendStrongSeparator];
    [(HDDiagnosticOperation *)self appendNewline];
  }
  else
  {
    [(HDOntologyDiagnosticOperation *)self _logAndAndAppendFormat:@"Failed to enumerate UDC table rows: %@", v8];
  }
}

+ (id)_udcTableColumnTitles
{
  return &unk_26DD8D760;
}

- (BOOL)_enumerateUDCTableInDatabase:(id)a3 appendToFormatter:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = NSString;
  id v9 = a3;
  uint64_t v10 = [v8 stringWithFormat:@"SELECT * FROM user_domain_concepts ORDER BY udc_id LIMIT 500"];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__HDOntologyDiagnosticOperation__enumerateUDCTableInDatabase_appendToFormatter_error___block_invoke;
  void v13[3] = &unk_264866D68;
  id v14 = v7;
  id v11 = v7;
  LOBYTE(a5) = [v9 executeSQL:v10 error:a5 bindingHandler:0 enumerationHandler:v13];

  return (char)a5;
}

uint64_t __86__HDOntologyDiagnosticOperation__enumerateUDCTableInDatabase_appendToFormatter_error___block_invoke(uint64_t a1)
{
  v34[14] = *MEMORY[0x263EF8340];
  v1 = HDSQLiteColumnWithNameAsDate();
  v2 = HDSQLiteColumnWithNameAsDate();
  long long v32 = [NSNumber numberWithLongLong:HDSQLiteColumnWithNameAsInt64()];
  long long v31 = [v32 stringValue];
  v34[0] = v31;
  long long v30 = HDSQLiteColumnWithNameAsUUID();
  id v29 = [v30 UUIDString];
  v34[1] = v29;
  uint64_t v3 = HDSQLiteColumnWithNameAsString();
  uint64_t v28 = (void *)v3;
  id v4 = &stru_26DD8B888;
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  v34[2] = v4;
  uint64_t v26 = [NSNumber numberWithLongLong:HDSQLiteColumnWithNameAsInt64()];
  long long v25 = [v26 stringValue];
  v34[3] = v25;
  HDSQLiteColumnWithNameAsBoolean();
  id v23 = HKStringFromBool();
  v34[4] = v23;
  uint64_t v27 = v1;
  long long v22 = HKDiagnosticStringFromDate();
  v34[5] = v22;
  id v5 = NSNumber;
  [v1 timeIntervalSinceReferenceDate];
  uint64_t v21 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v20 = [v21 stringValue];
  v34[6] = v20;
  uint64_t v24 = v2;
  uint64_t v19 = HKDiagnosticStringFromDate();
  v34[7] = v19;
  uint64_t v6 = NSNumber;
  [v2 timeIntervalSinceReferenceDate];
  uint64_t v18 = objc_msgSend(v6, "numberWithDouble:");
  id v7 = [v18 stringValue];
  v34[8] = v7;
  id v8 = [NSNumber numberWithLongLong:HDSQLiteColumnWithNameAsInt64()];
  id v9 = [v8 stringValue];
  v34[9] = v9;
  uint64_t v10 = [NSNumber numberWithLongLong:HDSQLiteColumnWithNameAsInt64()];
  id v11 = [v10 stringValue];
  v34[10] = v11;
  uint64_t v12 = [NSNumber numberWithLongLong:HDSQLiteColumnWithNameAsInt64()];
  uint64_t v13 = [v12 stringValue];
  v34[11] = v13;
  id v14 = HDSQLiteColumnWithNameAsString();
  v34[12] = v14;
  HDSQLiteColumnWithNameIsNull();
  uint64_t v15 = HKStringFromBool();
  v34[13] = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:14];

  [*(id *)(a1 + 32) appendRow:v16];
  return 1;
}

@end