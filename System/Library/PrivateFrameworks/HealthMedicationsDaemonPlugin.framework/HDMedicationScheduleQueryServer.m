@interface HDMedicationScheduleQueryServer
+ (Class)queryClass;
- (HDMedicationScheduleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
@end

@implementation HDMedicationScheduleQueryServer

- (HDMedicationScheduleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMedicationScheduleQueryServer;
  v11 = [(HDQueryServer *)&v15 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v11->_limit = [v10 limit];
    uint64_t v12 = [v10 sortDescriptors];
    sortDescriptors = v11->_sortDescriptors;
    v11->_sortDescriptors = (NSArray *)v12;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  v22.receiver = self;
  v22.super_class = (Class)HDMedicationScheduleQueryServer;
  [(HDQueryServer *)&v22 _queue_start];
  v3 = [(HDQueryServer *)self queryUUID];
  v4 = [(HDQueryServer *)self clientProxy];
  v5 = [v4 remoteObjectProxy];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = [(HDQueryServer *)self profile];
  v8 = [v7 healthMedicationsProfileExtension];
  v9 = [v8 medicationScheduleManager];

  sortDescriptors = self->_sortDescriptors;
  if (sortDescriptors)
  {
    id v21 = 0;
    uint64_t v11 = [v9 orderingTermsForSortDescriptors:sortDescriptors error:&v21];
    id v12 = v21;
    v13 = v12;
    if (!v11)
    {
      objc_msgSend(v5, "client_deliverError:forQuery:", v12, v3);
      id v17 = 0;
      goto LABEL_10;
    }

    v13 = (void *)v11;
  }
  else
  {
    v13 = 0;
  }
  unint64_t limit = self->_limit;
  id v20 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__HDMedicationScheduleQueryServer__queue_start__block_invoke;
  v18[3] = &unk_1E6337228;
  id v15 = v6;
  id v19 = v15;
  int v16 = [v9 enumerateMedicationSchedulesWithPredicate:0 limit:limit orderingTerms:v13 error:&v20 enumerationHandler:v18];
  id v17 = v20;
  if (v16) {
    objc_msgSend(v5, "client_deliverSchedules:queryUUID:", v15, v3);
  }
  else {
    objc_msgSend(v5, "client_deliverError:forQuery:", v17, v3);
  }

LABEL_10:
}

uint64_t __47__HDMedicationScheduleQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void).cxx_destruct
{
}

@end