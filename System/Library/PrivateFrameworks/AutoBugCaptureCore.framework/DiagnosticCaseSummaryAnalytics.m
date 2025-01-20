@interface DiagnosticCaseSummaryAnalytics
+ (id)listCaseSummaryProperties;
+ (id)listSummaryItemFromCaseSummaryDictionary:(id)a3;
+ (id)pbRequestForCases:(id)a3;
+ (id)stringRepresentationOfAttachmentsWithSize:(id)a3;
+ (void)extractPbAttachmentsFromString:(id)a3 completion:(id)a4;
- (DiagnosticCaseSummaryAnalytics)init;
- (DiagnosticCaseSummaryAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4;
- (id)diagnosticCaseSummaryDictionaryForIdentifier:(id)a3 properties:(id)a4;
- (id)fetchCaseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5;
- (id)fetchCaseSummariesWithIdentifiers:(id)a3;
- (int64_t)removeAllDiagnosticCaseSummaries;
- (int64_t)removeDiagnosticCaseSummariesWithState:(signed __int16)a3 olderThan:(unint64_t)a4;
- (void)insertEntityForDiagnosticCase:(id)a3;
- (void)updateSubmittedCases:(id)a3;
@end

@implementation DiagnosticCaseSummaryAnalytics

- (DiagnosticCaseSummaryAnalytics)init
{
  v3 = +[AnalyticsWorkspace defaultWorkspace];
  v6.receiver = self;
  v6.super_class = (Class)DiagnosticCaseSummaryAnalytics;
  v4 = [(ObjectAnalytics *)&v6 initWithWorkspace:v3 entityName:@"DiagnosticCaseSummary" withCache:1];

  return v4;
}

- (DiagnosticCaseSummaryAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DiagnosticCaseSummaryAnalytics;
  return [(ObjectAnalytics *)&v5 initWithWorkspace:a3 entityName:@"DiagnosticCaseSummary" withCache:a4];
}

- (void)insertEntityForDiagnosticCase:(id)a3
{
  id v4 = a3;
  id v22 = [(ObjectAnalytics *)self createEntity];
  objc_super v5 = [v4 caseStorage];
  objc_super v6 = [v5 caseID];
  [v22 setCaseID:v6];

  v7 = [v5 caseGroupID];
  [v22 setCaseGroupID:v7];

  v8 = [v5 timeStamp];
  [v22 setCaseCreatedTime:v8];

  v9 = [v5 caseClosedTime];
  [v22 setCaseClosedTime:v9];

  v10 = [v5 caseDomain];
  [v22 setCaseDomain:v10];

  v11 = [v5 caseType];
  [v22 setCaseType:v11];

  v12 = [v5 caseSubtype];
  [v22 setCaseSubtype:v12];

  v13 = [v5 caseSubtypeContext];
  [v22 setCaseSubtypeContext:v13];

  v14 = [v5 caseDetectedProcess];
  [v22 setCaseDetectedProcess:v14];

  v15 = [v5 caseEffectiveProcess];
  [v22 setCaseEffectiveProcess:v15];

  v16 = [v5 caseRelatedProcesses];
  [v22 setCaseRelatedProcesses:v16];

  v17 = [v5 caseThresholdValues];
  [v22 setCaseThresholdValues:v17];

  objc_msgSend(v22, "setCaseClosureType:", objc_msgSend(v5, "caseClosureType"));
  objc_msgSend(v22, "setCaseDampeningType:", objc_msgSend(v5, "caseDampeningType"));
  v18 = [v5 caseContext];
  [v22 setCaseContext:v18];

  objc_msgSend(v22, "setRemoteTrigger:", objc_msgSend(v5, "remoteTrigger"));
  v19 = [v5 buildVariant];
  [v22 setBuildVariant:v19];

  v20 = [v5 buildVersion];
  [v22 setBuildVersion:v20];

  v21 = [v4 stringRepresentationOfAttachmentsWithSize];

  [v22 setCaseAttachments:v21];
}

- (void)updateSubmittedCases:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = summaryLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v3 count];
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Update caseSummaryState to Submitted for %ld case(s)", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setCaseSummaryState:", 1, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int64_t)removeDiagnosticCaseSummariesWithState:(signed __int16)a3 olderThan:(unint64_t)a4
{
  int v4 = a3;
  v16[2] = *MEMORY[0x263EF8340];
  double v6 = (double)(86400 * a4);
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = [v7 dateByAddingTimeInterval:-v6];

  uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K <= %@", @"caseCreatedTime", v8];
  long long v10 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"caseSummaryState == %d", v4);
  long long v11 = (void *)MEMORY[0x263F08730];
  v16[0] = v9;
  v16[1] = v10;
  long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  long long v13 = [v11 andPredicateWithSubpredicates:v12];

  int64_t v14 = [(ObjectAnalytics *)self removeEntitiesMatching:v13];
  return v14;
}

- (int64_t)removeAllDiagnosticCaseSummaries
{
  v3.receiver = self;
  v3.super_class = (Class)DiagnosticCaseSummaryAnalytics;
  return [(ObjectAnalytics *)&v3 removeEntitiesMatching:0];
}

- (id)fetchCaseSummariesWithIdentifiers:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v11 length])
        {
          long long v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseID == %@", v11];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    long long v13 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v5];
    int64_t v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"caseCreatedTime" ascending:0];
    v15 = +[DiagnosticCaseSummaryAnalytics listCaseSummaryProperties];
    v23 = v14;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    uint64_t v17 = [(ObjectAnalytics *)self fetchEntityDictionariesWithProperties:v15 predicate:v13 sortDescriptors:v16 limit:0];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)fetchCaseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5
{
  v24[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v10 = objc_opt_new();
  if ([v8 caseInsensitiveCompare:@"pending"])
  {
    if ([v8 caseInsensitiveCompare:@"submitted"]) {
      goto LABEL_6;
    }
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
  }
  long long v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"caseSummaryState == %d", v11);
  [v10 addObject:v12];

LABEL_6:
  long long v13 = +[DiagnosticCaseSummaryAnalytics listCaseSummaryProperties];
  if ([v9 length])
  {
    int64_t v14 = [(DiagnosticCaseSummaryAnalytics *)self diagnosticCaseSummaryDictionaryForIdentifier:v9 properties:v13];
    if ([v14 count])
    {
      v15 = [v14 firstObject];
      uint64_t v16 = v15;
      if (v15)
      {
        uint64_t v17 = [v15 objectForKeyedSubscript:@"caseCreatedTime"];
        v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseCreatedTime < %@", v17];
        [v10 addObject:v18];
      }
    }
  }
  if ([v10 count])
  {
    long long v19 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v10];
  }
  else
  {
    long long v19 = 0;
  }
  long long v20 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"caseCreatedTime" ascending:0];
  v24[0] = v20;
  long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  long long v22 = [(ObjectAnalytics *)self fetchEntityDictionariesWithProperties:v13 predicate:v19 sortDescriptors:v21 limit:a5];

  return v22;
}

- (id)diagnosticCaseSummaryDictionaryForIdentifier:(id)a3 properties:(id)a4
{
  id v6 = (void *)MEMORY[0x263F08A98];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"caseID == %@", a3];
  id v9 = [(ObjectAnalytics *)self fetchEntityDictionariesWithProperties:v7 predicate:v8];

  return v9;
}

+ (id)listCaseSummaryProperties
{
  return &unk_26BDF5EE8;
}

+ (id)listSummaryItemFromCaseSummaryDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  context = (void *)MEMORY[0x21050CEB0]();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = +[DiagnosticCaseSummaryAnalytics listCaseSummaryProperties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKey:v10];
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = [(__CFString *)v11 integerValue];
            if ([v10 isEqualToString:@"caseDampeningType"])
            {
              long long v13 = +[DiagnosticCase descriptionForDampeningType:(__int16)v12];
              [v4 setObject:v13 forKeyedSubscript:v10];

              goto LABEL_19;
            }
            if ([v10 isEqualToString:@"caseSummaryState"])
            {
              if (v12) {
                v15 = @"Submitted";
              }
              else {
                v15 = @"Pending";
              }
              int64_t v14 = v4;
              goto LABEL_18;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || [(__CFString *)v11 length])
            {
              int64_t v14 = v4;
              v15 = v11;
LABEL_18:
              [v14 setObject:v15 forKeyedSubscript:v10];
            }
          }
        }
LABEL_19:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)pbRequestForCases:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[SystemProperties sharedInstance];
  id v5 = objc_opt_new();
  [v5 setVer:1];
  uint64_t v6 = [v4 productType];
  [v5 setDeviceModel:v6];

  uint64_t v7 = [v4 buildPlatform];
  [v5 setBuildPlatform:v7];

  v56 = v4;
  uint64_t v8 = [v4 deviceClassString];
  [v5 setDeviceCategory:v8];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v3;
  uint64_t v9 = [obj countByEnumeratingWithState:&v65 objects:v85 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v66;
    uint64_t v57 = *(void *)v66;
    v58 = v5;
    do
    {
      uint64_t v12 = 0;
      uint64_t v59 = v10;
      do
      {
        if (*(void *)v66 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = v12;
        long long v13 = *(void **)(*((void *)&v65 + 1) + 8 * v12);
        int64_t v14 = objc_opt_new();
        v15 = [v13 buildVersion];
        [v14 setBuild:v15];

        uint64_t v16 = [v13 buildVariant];
        [v14 setBuildVariant:v16];

        uint64_t v17 = [v13 caseDomain];
        [v14 setDomain:v17];

        long long v18 = [v13 caseType];
        [v14 setType:v18];

        long long v19 = [v13 caseSubtype];
        [v14 setSubtype:v19];

        long long v20 = [v13 caseSubtypeContext];
        [v14 setSubtypeContext:v20];

        long long v21 = [v13 caseDetectedProcess];
        [v14 setProcess:v21];

        long long v22 = [v13 caseID];
        [v14 setCaseIdentifier:v22];

        objc_msgSend(v14, "setRemoteTrigger:", objc_msgSend(v13, "remoteTrigger"));
        uint64_t v23 = [v13 caseCreatedTime];
        [v23 timeIntervalSince1970];
        objc_msgSend(v14, "setCaseStartTime:");

        v24 = [v13 caseClosedTime];
        [v24 timeIntervalSince1970];
        objc_msgSend(v14, "setCaseClosedTime:");

        uint64_t v25 = +[DiagnosticCase descriptionForClosureType:](DiagnosticCase, "descriptionForClosureType:", [v13 caseClosureType]);
        [v14 setCaseClosureType:v25];

        v26 = +[DiagnosticCase descriptionForDampeningType:](DiagnosticCase, "descriptionForDampeningType:", [v13 caseDampeningType]);
        [v14 setCaseDampeningType:v26];

        v27 = [v13 caseContext];
        uint64_t v28 = [v27 length];

        if (v28)
        {
          v29 = [v13 caseContext];
          [v14 setCaseContext:v29];
        }
        v30 = [v13 caseEffectiveProcess];
        uint64_t v31 = [v30 length];

        if (v31)
        {
          v32 = [v13 caseEffectiveProcess];
          [v14 setCaseEffectiveProcess:v32];
        }
        v33 = [v13 caseGroupID];
        uint64_t v34 = [v33 length];

        if (v34)
        {
          v35 = [v13 caseGroupID];
          [v14 setCaseGroupIdentifier:v35];
        }
        v36 = [v13 caseRelatedProcesses];
        uint64_t v37 = [v36 length];

        if (v37)
        {
          v38 = [v13 caseRelatedProcesses];
          [v14 setCaseRelatedProcesses:v38];
        }
        v39 = [v13 caseThresholdValues];
        uint64_t v40 = [v39 length];

        if (v40)
        {
          v41 = [v13 caseThresholdValues];
          [v14 setCaseThresholdValues:v41];
        }
        v42 = [v13 caseAttachments];
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __52__DiagnosticCaseSummaryAnalytics_pbRequestForCases___block_invoke;
        v63[3] = &unk_263FC3C98;
        id v43 = v14;
        id v64 = v43;
        +[DiagnosticCaseSummaryAnalytics extractPbAttachmentsFromString:v42 completion:v63];

        v44 = summaryLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v45 = [v13 caseID];
          uint64_t v46 = [v13 caseGroupID];
          v47 = (void *)v46;
          v48 = @"(no grpID)";
          if (v46) {
            v48 = (__CFString *)v46;
          }
          v61 = v48;
          v49 = [v13 caseDomain];
          v50 = [v13 caseType];
          v51 = [v13 caseSubtype];
          v52 = [v13 caseSubtypeContext];
          v53 = [v13 caseDetectedProcess];
          v54 = [v13 caseAttachments];
          *(_DWORD *)buf = 138479619;
          v70 = v45;
          __int16 v71 = 2113;
          v72 = v61;
          __int16 v73 = 2113;
          v74 = v49;
          __int16 v75 = 2113;
          v76 = v50;
          __int16 v77 = 2113;
          v78 = v51;
          __int16 v79 = 2113;
          v80 = v52;
          __int16 v81 = 2113;
          v82 = v53;
          __int16 v83 = 2113;
          v84 = v54;
          _os_log_impl(&dword_209DBA000, v44, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: Processed case: %{private}@/%{private}@ {%{private}@/%{private}@/%{private}@/%{private}@/%{private}@-%{private}@}", buf, 0x52u);

          uint64_t v11 = v57;
          id v5 = v58;

          uint64_t v10 = v59;
        }

        [v5 addSigRequest:v43];
        uint64_t v12 = v62 + 1;
      }
      while (v10 != v62 + 1);
      uint64_t v10 = [obj countByEnumeratingWithState:&v65 objects:v85 count:16];
    }
    while (v10);
  }

  return v5;
}

void __52__DiagnosticCaseSummaryAnalytics_pbRequestForCases___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 count])
  {
    [*(id *)(a1 + 32) setAttachments:v5];
    [*(id *)(a1 + 32) setLogSizeTotal:a3];
  }
}

+ (id)stringRepresentationOfAttachmentsWithSize:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = [MEMORY[0x263F089D8] stringWithString:&stru_26BDE2C70];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__DiagnosticCaseSummaryAnalytics_stringRepresentationOfAttachmentsWithSize___block_invoke;
  v6[3] = &unk_263FC3CC0;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __76__DiagnosticCaseSummaryAnalytics_stringRepresentationOfAttachmentsWithSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:@","];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendFormat:@"%@:%@", v6, v5];
}

+ (void)extractPbAttachmentsFromString:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v17 = (void (**)(id, void *, void))a4;
  long long v18 = v5;
  long long v19 = objc_opt_new();
  id v6 = [v5 componentsSeparatedByString:@","];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) componentsSeparatedByString:@":"];
        if ([v12 count])
        {
          long long v13 = [v12 firstObject];
          int64_t v14 = [v12 lastObject];
          uint64_t v15 = [v14 longLongValue];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v15)
          {
            uint64_t v16 = objc_opt_new();
            [v16 setFileName:v13];
            [v16 setFileSize:v15];
            [v19 addObject:v16];
            uint64_t v9 = (v9 + v15);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (v17) {
    v17[2](v17, v19, v9);
  }
}

@end