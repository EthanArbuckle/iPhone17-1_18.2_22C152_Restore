@interface HDUserTrackedConceptQueryServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDUserTrackedConceptQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
@end

@implementation HDUserTrackedConceptQueryServer

- (HDUserTrackedConceptQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDUserTrackedConceptQueryServer;
  v11 = [(HDQueryServer *)&v15 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
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

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6 = a4;
  v7 = [v6 entitlements];
  char v8 = [v7 hasEntitlement:*MEMORY[0x1E4F2A548]];

  if ((v8 & 1) != 0
    || ([v6 entitlements],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 hasPrivateAccessEntitlementWithIdentifier:*MEMORY[0x1E4F2A540]],
        v9,
        (v10 & 1) != 0))
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 4, @"Missing required entitlement. Please reach out to the HealthKit team (Potentially in #help-healthkit-disclosed Slack channel) for further instructions.");
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_queue_start
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)HDUserTrackedConceptQueryServer;
  [(HDQueryServer *)&v19 _queue_start];
  v3 = [(HDQueryServer *)self queryUUID];
  v4 = [(HDQueryServer *)self clientProxy];
  v5 = [(HDQueryServer *)self client];
  id v6 = [v5 authorizationOracle];
  char v7 = [v6 clientHasAuthorizationForAllTypes];

  if ((v7 & 1) == 0)
  {
    char v8 = [(HDQueryServer *)self objectType];
    id v18 = 0;
    v9 = [(HDQueryServer *)self readAuthorizationStatusForType:v8 error:&v18];
    id v10 = v18;

    if (!v9)
    {
      objc_msgSend(v4, "client_deliverError:forQuery:", v10, v3);
      goto LABEL_13;
    }
    if (([v9 canRead] & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E4F1CBF0];
      v13 = v4;
      goto LABEL_12;
    }
  }
  BOOL v11 = [(HDQueryServer *)self profile];
  id v17 = 0;
  uint64_t v12 = +[HDUserDomainConceptAPIObjectManager allAPIObjectsFromUserDomainConceptsWithProfile:v11 error:&v17];
  id v10 = v17;

  v9 = objc_msgSend(v12, "hk_filter:", &__block_literal_global_136);

  if (v9)
  {
    v13 = v4;
    v14 = v9;
LABEL_12:
    objc_msgSend(v13, "client_deliverUserTrackedConcepts:queryUUID:", v14, v3);
    goto LABEL_13;
  }
  _HKInitializeLogging();
  objc_super v15 = HKLogHealthOntology();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    v21 = v16;
    __int16 v22 = 2114;
    v23 = self;
    _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Error while fetching concepts: %{public}@", buf, 0x16u);
  }
  objc_msgSend(v4, "client_deliverError:forQuery:", v10, v3);
  v9 = 0;
LABEL_13:
}

uint64_t __47__HDUserTrackedConceptQueryServer__queue_start__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 userTrackedConceptType];
  v3 = [v2 identifier];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F2AAA8]];

  return v4;
}

- (void).cxx_destruct
{
}

@end