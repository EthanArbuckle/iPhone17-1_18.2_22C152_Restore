@interface HKHealthRecordsAccountInfoStore
+ (id)taskIdentifier;
- (HKHealthRecordsAccountInfoStore)init;
- (HKHealthRecordsAccountInfoStore)initWithHealthStore:(id)a3;
- (void)determineMedicalRecordsAccountInfoStatusWithCompletion:(id)a3;
@end

@implementation HKHealthRecordsAccountInfoStore

- (HKHealthRecordsAccountInfoStore)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKHealthRecordsAccountInfoStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKHealthRecordsAccountInfoStore;
  v5 = [(HKHealthRecordsAccountInfoStore *)&v12 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)determineMedicalRecordsAccountInfoStatusWithCompletion:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__HKHealthRecordsAccountInfoStore_determineMedicalRecordsAccountInfoStatusWithCompletion___block_invoke;
  v9[3] = &unk_1E58C4740;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__HKHealthRecordsAccountInfoStore_determineMedicalRecordsAccountInfoStatusWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __90__HKHealthRecordsAccountInfoStore_determineMedicalRecordsAccountInfoStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_determineMedicalRecordsAccountInfoStatusWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __90__HKHealthRecordsAccountInfoStore_determineMedicalRecordsAccountInfoStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end