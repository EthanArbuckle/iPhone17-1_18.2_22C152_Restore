@interface HDMedicationScheduleItemQueryServer
+ (Class)queryClass;
- (HDMedicationScheduleItemQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
@end

@implementation HDMedicationScheduleItemQueryServer

- (HDMedicationScheduleItemQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMedicationScheduleItemQueryServer;
  v12 = [(HDQueryServer *)&v15 initWithUUID:a3 configuration:v11 client:a5 delegate:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_configuration, a4);
  }

  return v13;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  v2 = self;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v53.receiver = self;
  v53.super_class = (Class)HDMedicationScheduleItemQueryServer;
  [(HDQueryServer *)&v53 _queue_start];
  uint64_t v3 = [(HDQueryServer *)v2 queryUUID];
  v4 = [(HDQueryServer *)v2 clientProxy];
  v5 = [v4 remoteObjectProxy];

  v6 = [(HKMedicationScheduleItemQueryConfiguration *)v2->_configuration fromDate];

  if (v6)
  {
    v7 = [(HKMedicationScheduleItemQueryConfiguration *)v2->_configuration fromDate];
    HDMedicationScheduleItemPredicateForScheduledDateTime(6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  v9 = [(HKMedicationScheduleItemQueryConfiguration *)v2->_configuration toDate];

  if (v9)
  {
    v10 = [(HKMedicationScheduleItemQueryConfiguration *)v2->_configuration toDate];
    id v11 = HDMedicationScheduleItemPredicateForScheduledDateTime(3);

    if (v8)
    {
      uint64_t v12 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v8 otherPredicate:v11];

      id v8 = (id)v12;
    }
    else
    {
      id v8 = v11;
    }
  }
  v13 = [(HKMedicationScheduleItemQueryConfiguration *)v2->_configuration identifier];

  if (v13)
  {
    v14 = [(HKMedicationScheduleItemQueryConfiguration *)v2->_configuration identifier];
    objc_super v15 = HDMedicationScheduleItemPredicateForIdentifier((uint64_t)v14, 1);

    if (v8)
    {
      uint64_t v16 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v8 otherPredicate:v15];

      id v8 = (id)v16;
    }
    else
    {
      id v8 = v15;
    }
  }
  v17 = [(HKMedicationScheduleItemQueryConfiguration *)v2->_configuration sortDescriptors];

  unint64_t v18 = 0x1E4F1C000uLL;
  if (v17)
  {
    v42 = v5;
    v43 = (void *)v3;
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v41 = v2;
    id v20 = [(HKMedicationScheduleItemQueryConfiguration *)v2->_configuration sortDescriptors];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v50;
      uint64_t v24 = *MEMORY[0x1E4F66950];
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v50 != v23) {
            objc_enumerationMutation(v20);
          }
          v26 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v27 = [v26 key];
          int v28 = [v27 isEqualToString:v24];

          if (!v28)
          {
            v31 = (void *)MEMORY[0x1E4F28C58];
            v32 = NSString;
            uint64_t v33 = objc_opt_class();
            v34 = [v26 key];
            v35 = [v32 stringWithFormat:@"%@ Invalid sort descriptor key passed: '%@", v33, v34];
            objc_msgSend(v31, "hk_error:description:", 3, v35);
            id v36 = (id)objc_claimAutoreleasedReturnValue();

            v5 = v42;
            v37 = v43;
            objc_msgSend(v42, "client_deliverError:forQuery:", v36, v43);
            goto LABEL_30;
          }
          v29 = objc_msgSend(MEMORY[0x1E4F65D50], "orderingTermWithProperty:entityClass:ascending:", @"scheduled_date_time", objc_opt_class(), objc_msgSend(v26, "ascending"));
          [v19 addObject:v29];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    v5 = v42;
    v30 = v43;
    v2 = v41;
    unint64_t v18 = 0x1E4F1C000;
  }
  else
  {
    v30 = (void *)v3;
    id v19 = 0;
  }
  id v38 = objc_alloc_init(*(Class *)(v18 + 2632));
  v39 = [(HDQueryServer *)v2 profile];
  v40 = [v39 database];
  id v48 = 0;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __51__HDMedicationScheduleItemQueryServer__queue_start__block_invoke;
  v44[3] = &unk_1E6338330;
  id v45 = v8;
  id v19 = v19;
  id v46 = v19;
  id v20 = v38;
  id v47 = v20;
  LODWORD(v38) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v40 error:&v48 block:v44];
  id v36 = v48;

  if (v38)
  {
    v37 = v30;
    objc_msgSend(v5, "client_deliverScheduleItems:queryUUID:", v20, v30);
  }
  else
  {
    v37 = v30;
    objc_msgSend(v5, "client_deliverError:forQuery:", v36, v30);
  }

LABEL_30:
}

BOOL __51__HDMedicationScheduleItemQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HDMedicationScheduleItemQueryServer__queue_start__block_invoke_2;
  v9[3] = &unk_1E6337120;
  id v10 = *(id *)(a1 + 48);
  BOOL v7 = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:v5 orderingTerms:v6 transaction:a2 error:a3 enumerationHandler:v9];

  return v7;
}

uint64_t __51__HDMedicationScheduleItemQueryServer__queue_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void).cxx_destruct
{
}

@end