@interface DiagnosticCaseStorageAnalytics
- (DiagnosticCaseStorageAnalytics)init;
- (DiagnosticCaseStorageAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4;
- (id)allDiagnosticCasesStorage;
- (id)diagnosticCaseDictionaryKeys;
- (id)diagnosticCaseStorageDictionaryForIdentifier:(id)a3 properties:(id)a4;
- (id)diagnosticCaseStorageWithId:(id)a3;
- (id)diagnosticCaseStorageWithIdentifier:(id)a3;
- (id)historicalDiagnosticCaseStorageDictionaryFromIdentifier:(id)a3 withEvents:(BOOL)a4 count:(unint64_t)a5;
- (id)historicalDiagnosticCaseStorageFromIdentifier:(id)a3 count:(unint64_t)a4;
- (int64_t)removeAllDiagnosticCaseStorages;
@end

@implementation DiagnosticCaseStorageAnalytics

- (DiagnosticCaseStorageAnalytics)init
{
  v3 = +[AnalyticsWorkspace defaultWorkspace];
  v6.receiver = self;
  v6.super_class = (Class)DiagnosticCaseStorageAnalytics;
  v4 = [(ObjectAnalytics *)&v6 initWithWorkspace:v3 entityName:@"DiagnosticCaseStorage" withCache:1];

  return v4;
}

- (DiagnosticCaseStorageAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DiagnosticCaseStorageAnalytics;
  return [(ObjectAnalytics *)&v5 initWithWorkspace:a3 entityName:@"DiagnosticCaseStorage" withCache:a4];
}

- (id)diagnosticCaseStorageWithId:(id)a3
{
  v4 = (void *)MEMORY[0x263F08A98];
  objc_super v5 = [a3 UUIDString];
  objc_super v6 = [v4 predicateWithFormat:@"%K == %@", @"caseID", v5];

  v7 = [(ObjectAnalytics *)self fetchEntitiesFreeForm:v6 sortDesc:0];

  return v7;
}

- (id)diagnosticCaseStorageWithIdentifier:(id)a3
{
  v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseID == %@", a3];
  objc_super v5 = [(ObjectAnalytics *)self fetchEntitiesFreeForm:v4 sortDesc:0];

  return v5;
}

- (id)diagnosticCaseStorageDictionaryForIdentifier:(id)a3 properties:(id)a4
{
  objc_super v6 = (void *)MEMORY[0x263F08A98];
  id v7 = a4;
  v8 = [v6 predicateWithFormat:@"caseID == %@", a3];
  v9 = [(ObjectAnalytics *)self fetchEntityDictionariesWithProperties:v7 predicate:v8];

  return v9;
}

- (id)diagnosticCaseDictionaryKeys
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", @"timeStamp", @"caseClosedTime", @"caseID", @"caseAttachments", @"caseDampeningType", @"caseClosureType", @"remoteTrigger", @"dpSubmissionState", @"caseDomain", @"caseType", @"caseSubtype", @"caseSubtypeContext", @"caseDetectedProcess", @"caseEffectiveProcess", @"caseRelatedProcesses", @"caseThresholdValues", @"caseContext",
                 @"caseGroupID",
                 @"buildVersion",
                 @"buildVariant",
                 0);

  return v2;
}

- (id)historicalDiagnosticCaseStorageFromIdentifier:(id)a3 count:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = [(DiagnosticCaseStorageAnalytics *)self diagnosticCaseStorageWithIdentifier:v6];
    if ([v7 count])
    {
      v8 = [v7 firstObject];
      v9 = v8;
      if (v8)
      {
        v10 = (void *)MEMORY[0x263F08A98];
        v11 = [v8 timeStamp];
        v12 = [v10 predicateWithFormat:@"timeStamp < %@", v11];
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"timeStamp" ascending:0];
  v14 = [(ObjectAnalytics *)self fetchEntitiesFreeForm:v12 sortDesc:v13 limit:a4];

  return v14;
}

- (id)historicalDiagnosticCaseStorageDictionaryFromIdentifier:(id)a3 withEvents:(BOOL)a4 count:(unint64_t)a5
{
  BOOL v6 = a4;
  v20[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = [(DiagnosticCaseStorageAnalytics *)self diagnosticCaseDictionaryKeys];
  v10 = v9;
  if (v6) {
    [v9 addObject:@"caseEvents"];
  }
  if ([v8 length])
  {
    v11 = [(DiagnosticCaseStorageAnalytics *)self diagnosticCaseStorageDictionaryForIdentifier:v8 properties:v10];
    if ([v11 count])
    {
      v12 = [v11 firstObject];
      v13 = v12;
      if (v12)
      {
        v14 = [v12 objectForKeyedSubscript:@"timeStamp"];
        v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"timeStamp < %@", v14];
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"timeStamp" ascending:0];
  v20[0] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  v18 = [(ObjectAnalytics *)self fetchEntityDictionariesWithProperties:v10 predicate:v15 sortDescriptors:v17 limit:a5];

  return v18;
}

- (id)allDiagnosticCasesStorage
{
  return [(ObjectAnalytics *)self fetchEntitiesFreeForm:0 sortDesc:0];
}

- (int64_t)removeAllDiagnosticCaseStorages
{
  v3.receiver = self;
  v3.super_class = (Class)DiagnosticCaseStorageAnalytics;
  return [(ObjectAnalytics *)&v3 removeEntitiesMatching:0];
}

@end