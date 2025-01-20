@interface HKMedicalRecordsStore
+ (id)taskIdentifier;
- (HKMedicalRecordsStore)initWithHealthStore:(id)a3;
- (void)fetchMedicalRecordsForClinicalRecords:(id)a3 completion:(id)a4;
@end

@implementation HKMedicalRecordsStore

- (HKMedicalRecordsStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMedicalRecordsStore;
  v5 = [(HKMedicalRecordsStore *)&v13 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
    v11 = objc_alloc_init(HKTaskConfiguration);
    [(HKTaskServerProxyProvider *)v5->_proxyProvider setTaskConfiguration:v11];
  }
  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)fetchMedicalRecordsForClinicalRecords:(id)a3 completion:(id)a4
{
  proxyProvider = self->_proxyProvider;
  id v7 = a3;
  v8 = [(HKProxyProvider *)proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  uint64_t v9 = objc_msgSend(v7, "hk_map:", &__block_literal_global_35);

  v10 = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__HKMedicalRecordsStore_fetchMedicalRecordsForClinicalRecords_completion___block_invoke_2;
  v15[3] = &unk_1E58C0E10;
  id v16 = v9;
  id v17 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__HKMedicalRecordsStore_fetchMedicalRecordsForClinicalRecords_completion___block_invoke_3;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v11 = v17;
  id v12 = v9;
  [(HKProxyProvider *)v10 fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __74__HKMedicalRecordsStore_fetchMedicalRecordsForClinicalRecords_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

uint64_t __74__HKMedicalRecordsStore_fetchMedicalRecordsForClinicalRecords_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchMedicalRecordsForClinicalRecordsUUIDs:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __74__HKMedicalRecordsStore_fetchMedicalRecordsForClinicalRecords_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end