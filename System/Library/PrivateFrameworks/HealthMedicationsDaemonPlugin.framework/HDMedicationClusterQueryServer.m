@interface HDMedicationClusterQueryServer
+ (Class)queryClass;
- (HDMedicationClusterQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_queryMedicationsWithConfiguration:(void *)a3 errorOut:;
- (id)_queryMedicationsWithExistingMedications:(uint64_t)a3 errorOut:;
- (id)_queryMedicationsWithMachineReadableCode:(uint64_t)a3 errorOut:;
- (id)_queryMedicationsWithScanResult:(uint64_t)a3 errorOut:;
- (id)_queryMedicationsWithSearchTokens:(uint64_t)a3 errorOut:;
- (void)_queue_start;
@end

@implementation HDMedicationClusterQueryServer

- (HDMedicationClusterQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)HDMedicationClusterQueryServer;
  return [(HDQueryServer *)&v7 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  v9.receiver = self;
  v9.super_class = (Class)HDMedicationClusterQueryServer;
  [(HDQueryServer *)&v9 _queue_start];
  v3 = [(HDQueryServer *)self queryUUID];
  v4 = [(HDQueryServer *)self clientProxy];
  v5 = [(HDQueryServer *)self configuration];
  id v8 = 0;
  v6 = -[HDMedicationClusterQueryServer _queryMedicationsWithConfiguration:errorOut:](self, v5, &v8);
  id v7 = v8;

  if (v6)
  {
    objc_msgSend(v4, "client_deliverResults:queryUUID:", v6, v3);
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Query operation returned nil without an error. queryUUID=[%@]", v3);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "client_deliverError:forQuery:", v7, v3);
  }
}

- (id)_queryMedicationsWithConfiguration:(void *)a3 errorOut:
{
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    switch([v5 queryType])
    {
      case 0:
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Received queryType none");
        goto LABEL_4;
      case 1:
        uint64_t v7 = -[HDMedicationClusterQueryServer _queryMedicationsWithScanResult:errorOut:](a1, v6, (uint64_t)a3);
        goto LABEL_9;
      case 2:
        uint64_t v7 = -[HDMedicationClusterQueryServer _queryMedicationsWithMachineReadableCode:errorOut:](a1, v6, (uint64_t)a3);
        goto LABEL_9;
      case 3:
        uint64_t v7 = -[HDMedicationClusterQueryServer _queryMedicationsWithSearchTokens:errorOut:](a1, v6, (uint64_t)a3);
        goto LABEL_9;
      case 4:
        uint64_t v7 = -[HDMedicationClusterQueryServer _queryMedicationsWithExistingMedications:errorOut:](a1, v6, (uint64_t)a3);
LABEL_9:
        a3 = (void *)v7;
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_4:
    a3 = 0;
  }

  return a3;
}

- (id)_queryMedicationsWithScanResult:(uint64_t)a3 errorOut:
{
  if (a1)
  {
    id v5 = a2;
    v6 = [v5 scanResult];
    uint64_t v7 = [v5 limit];

    id v8 = [a1 profile];
    objc_super v9 = +[HDMedicationSearchEngine medicationClustersFromScanResult:v6 limit:v7 profile:v8 errorOut:a3];
  }
  else
  {
    objc_super v9 = 0;
  }
  return v9;
}

- (id)_queryMedicationsWithMachineReadableCode:(uint64_t)a3 errorOut:
{
  id v3 = a1;
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v12 = 0;
    id v5 = a2;
    v6 = [v5 machineReadableCode];
    uint64_t v7 = [v5 codeAttributeType];

    id v8 = [v3 profile];
    BOOL v9 = +[HDMedicationSearchEngine medicationCluster:&v12 machineReadableCode:v6 codeAttributeType:v7 profile:v8 errorOut:a3];
    id v10 = v12;

    id v3 = 0;
    if (v9)
    {
      if (v10)
      {
        v13[0] = v10;
        id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      }
      else
      {
        id v3 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  return v3;
}

- (id)_queryMedicationsWithSearchTokens:(uint64_t)a3 errorOut:
{
  if (a1)
  {
    id v5 = a2;
    v6 = [v5 textSearchTokens];
    uint64_t v7 = [v5 limit];

    id v8 = [a1 profile];
    BOOL v9 = +[HDMedicationSearchEngine medicationClustersFromTextSearchTokens:v6 limit:v7 profile:v8 errorOut:a3];
  }
  else
  {
    BOOL v9 = 0;
  }
  return v9;
}

- (id)_queryMedicationsWithExistingMedications:(uint64_t)a3 errorOut:
{
  if (a1)
  {
    id v5 = a2;
    v6 = [v5 existingMedications];
    uint64_t v7 = [v5 sinceDate];
    uint64_t v8 = [v5 limit];

    BOOL v9 = [a1 profile];
    id v10 = +[HDMedicationSearchEngine medicationClustersForCHRImportWithExistingMedications:v6 sinceDate:v7 limit:v8 profile:v9 errorOut:a3];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

@end