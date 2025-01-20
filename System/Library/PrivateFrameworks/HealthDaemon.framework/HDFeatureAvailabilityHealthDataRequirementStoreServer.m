@interface HDFeatureAvailabilityHealthDataRequirementStoreServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)featureAvailabilityRequirement:(id)a3 didUpdateSatisfaction:(BOOL)a4;
- (void)remote_getEvaluationOfRequirements:(id)a3 completion:(id)a4;
- (void)remote_startObservingChangesInRequirements:(id)a3 completion:(id)a4;
- (void)remote_stopObservingChanges;
@end

@implementation HDFeatureAvailabilityHealthDataRequirementStoreServer

- (void)remote_getEvaluationOfRequirements:(id)a3 completion:(id)a4
{
  manager = self->_manager;
  id v9 = 0;
  v6 = (void (**)(id, void *, id))a4;
  v7 = [(HDFeatureAvailabilityHealthDataRequirementEvaluationManager *)manager evaluationOfRequirements:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (void)remote_startObservingChangesInRequirements:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  _HKInitializeLogging();
  id v8 = HKLogInfrastructure();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering for changes", buf, 0xCu);
  }

  manager = self->_manager;
  id v12 = 0;
  uint64_t v10 = [(HDFeatureAvailabilityHealthDataRequirementEvaluationManager *)manager registerObserver:self forRequirements:v7 queue:0 error:&v12];

  id v11 = v12;
  v6[2](v6, v10, v11);
}

- (void)remote_stopObservingChanges
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unregistering for changes", (uint8_t *)&v4, 0xCu);
  }

  [(HDFeatureAvailabilityHealthDataRequirementEvaluationManager *)self->_manager unregisterObserver:self];
}

- (void)featureAvailabilityRequirement:(id)a3 didUpdateSatisfaction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = HKLogInfrastructure();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = self;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of requirement satisfaction update", (uint8_t *)&v10, 0xCu);
  }

  if (self)
  {
    id v8 = [(HDStandardTaskServer *)self client];
    id v9 = [v8 connection];
    self = [v9 remoteObjectProxy];
  }
  [(HDFeatureAvailabilityHealthDataRequirementStoreServer *)self client_featureAvailabilityRequirement:v6 didUpdateSatisfaction:v4];
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(HDStandardTaskServer *)[HDFeatureAvailabilityHealthDataRequirementStoreServer alloc] initWithUUID:v13 configuration:v12 client:v11 delegate:v10];

  uint64_t v15 = [v11 profile];

  uint64_t v16 = [v15 healthDataRequirementEvaluationManager];
  manager = v14->_manager;
  v14->_manager = (HDFeatureAvailabilityHealthDataRequirementEvaluationManager *)v16;

  return v14;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v5 = a4;
  id v6 = [v5 entitlements];
  char v7 = [v6 hasEntitlement:*MEMORY[0x1E4F2A548]];

  id v8 = [v5 entitlements];
  char v9 = [v8 hasEntitlement:*MEMORY[0x1E4F29C40]];

  id v10 = [v5 entitlements];

  LOBYTE(v5) = [v10 hasEntitlement:*MEMORY[0x1E4F29C30]];
  return v7 | v9 | v5;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7CC0](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7CB8](self, a2);
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
}

@end