@interface HDConceptQueryServer
+ (Class)queryClass;
- (HDConceptQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
@end

@implementation HDConceptQueryServer

- (HDConceptQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)HDConceptQueryServer;
  return [(HDQueryServer *)&v7 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)HDConceptQueryServer;
  [(HDQueryServer *)&v19 _queue_start];
  v3 = [(HDQueryServer *)self queryUUID];
  v4 = [(HDQueryServer *)self clientProxy];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15 = [(HDQueryServer *)self configuration];
  v6 = [v15 selection];
  objc_super v7 = [(HDQueryServer *)self profile];
  v8 = [v6 predicateWithProfile:v7];
  v9 = [(HDQueryServer *)self profile];
  id v18 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __36__HDConceptQueryServer__queue_start__block_invoke;
  v16[3] = &unk_1E62F5E38;
  id v10 = v5;
  id v17 = v10;
  BOOL v11 = +[HDOntologyConceptManager enumerateConceptsMatchingPredicate:v8 profile:v9 error:&v18 enumerationHandler:v16];
  id v12 = v18;

  if (v11)
  {
    objc_msgSend(v4, "client_deliverConcepts:queryUUID:", v10, v3);
  }
  else
  {
    _HKInitializeLogging();
    v13 = HKLogHealthOntology();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      __int16 v22 = 2114;
      v23 = self;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Error while fetching concepts: %{public}@", buf, 0x16u);
    }
    objc_msgSend(v4, "client_deliverError:forQuery:", v12, v3);
  }
}

uint64_t __36__HDConceptQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

@end