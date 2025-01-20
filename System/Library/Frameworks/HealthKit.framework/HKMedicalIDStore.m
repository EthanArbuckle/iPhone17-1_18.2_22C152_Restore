@interface HKMedicalIDStore
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)setupStatusClientInterface;
+ (id)setupStatusServerInterface;
+ (id)setupStatusTaskIdentifier;
+ (id)taskIdentifier;
- (HKMedicalIDStore)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (id)lastFetchedMedicalIDData;
- (id)remoteInterface;
- (int64_t)medicalIDSetUpStatus;
- (void)addEmergencyContact:(id)a3 completion:(id)a4;
- (void)deleteMedicalIDDataWithCompletion:(id)a3;
- (void)fetchMedicalIDClinicalContactsWithCompletion:(id)a3;
- (void)fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion:(id)a3;
- (void)fetchMedicalIDDataWithCompletion:(id)a3;
- (void)fetchMedicalIDEmergencyContactsWithCompletion:(id)a3;
- (void)removeEmergencyContact:(id)a3 completion:(id)a4;
- (void)setLastFetchedMedicalIDData:(id)a3;
- (void)updateMedicalIDData:(id)a3 completion:(id)a4;
@end

@implementation HKMedicalIDStore

- (HKMedicalIDStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKMedicalIDStore;
  v5 = [(HKMedicalIDStore *)&v21 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [(id)objc_opt_class() clientInterface];
    v9 = [(id)objc_opt_class() serverInterface];
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 exportedInterface:v8 remoteInterface:v9 taskUUID:v10];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
    v13 = [HKTaskServerProxyProvider alloc];
    v14 = [(id)objc_opt_class() setupStatusTaskIdentifier];
    v15 = [(id)objc_opt_class() setupStatusClientInterface];
    v16 = [(id)objc_opt_class() setupStatusServerInterface];
    v17 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v18 = [(HKTaskServerProxyProvider *)v13 initWithHealthStore:v4 taskIdentifier:v14 exportedObject:v5 exportedInterface:v15 remoteInterface:v16 taskUUID:v17];
    setupStatusProxyProvider = v5->_setupStatusProxyProvider;
    v5->_setupStatusProxyProvider = (HKTaskServerProxyProvider *)v18;

    [(HKProxyProvider *)v5->_setupStatusProxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

- (void)setLastFetchedMedicalIDData:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (_HKMedicalIDData *)[v5 copy];

  lastFetchedMedicalIDData = self->_lastFetchedMedicalIDData;
  self->_lastFetchedMedicalIDData = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)lastFetchedMedicalIDData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lastFetchedMedicalIDData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)setupStatusTaskIdentifier
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [v2 stringWithFormat:@"%@.%@", v4, @"setupStatus"];

  return v5;
}

- (int64_t)medicalIDSetUpStatus
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  setupStatusProxyProvider = self->_setupStatusProxyProvider;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke;
  v5[3] = &unk_1E58C3E08;
  v5[4] = &v6;
  [(HKProxyProvider *)setupStatusProxyProvider getSynchronousProxyWithHandler:v5 errorHandler:&__block_literal_global_62];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke_2;
  v3[3] = &unk_1E58BEF70;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "remote_medicalIDSetUpStatusWithCompletion:", v3);
}

uint64_t __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  int64_t v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke_3_cold_1((uint64_t)v2, v3);
  }
}

- (void)fetchMedicalIDDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
  }
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke;
  v13[3] = &unk_1E58C3E30;
  v13[4] = self;
  id v14 = v4;
  uint64_t v6 = [(HKProxyProvider *)proxyProvider clientQueueObjectHandlerWithCompletion:v13];
  v7 = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_2;
  v11[3] = &unk_1E58C3E58;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_4;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)v7 fetchProxyWithHandler:v11 errorHandler:v9];
}

void __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) setLastFetchedMedicalIDData:v7];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_3;
  v3[3] = &unk_1E58BE3D8;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_fetchMedicalIDWithCompletion:", v3);
}

uint64_t __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
  }
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke;
  v13[3] = &unk_1E58C3E30;
  v13[4] = self;
  id v14 = v4;
  uint64_t v6 = [(HKProxyProvider *)proxyProvider clientQueueObjectHandlerWithCompletion:v13];
  id v7 = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_2;
  v11[3] = &unk_1E58C3E58;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_4;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)v7 fetchProxyWithHandler:v11 errorHandler:v9];
}

void __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) setLastFetchedMedicalIDData:v7];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_3;
  v3[3] = &unk_1E58BE3D8;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion:", v3);
}

uint64_t __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMedicalIDEmergencyContactsWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
  }
  id v5 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v4];

  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke;
  v10[3] = &unk_1E58C3E58;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke_3;
  v8[3] = &unk_1E58BBD88;
  id v9 = v11;
  id v7 = v11;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v10 errorHandler:v8];
}

void __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke_2;
  v3[3] = &unk_1E58C3E80;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_medicalIDEmergencyContactsWithCompletion:", v3);
}

uint64_t __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMedicalIDClinicalContactsWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
  }
  id v5 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v4];

  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke;
  v10[3] = &unk_1E58C3E58;
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke_3;
  v8[3] = &unk_1E58BBD88;
  id v9 = v11;
  id v7 = v11;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v10 errorHandler:v8];
}

void __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke_2;
  v3[3] = &unk_1E58C3E80;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_medicalIDClinicalContactsWithCompletion:", v3);
}

uint64_t __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateMedicalIDData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  id v8 = [(HKMedicalIDStore *)self lastFetchedMedicalIDData];
  [v6 setModificationDatesForUpdatedFieldsWithMedicalIDData:v8];

  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke;
  v14[3] = &unk_1E58C3EA8;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke_3;
  v12[3] = &unk_1E58BBD88;
  id v13 = v17;
  id v10 = v17;
  id v11 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v12];
}

void __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 lastFetchedMedicalIDData];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke_2;
  v7[3] = &unk_1E58BBD38;
  id v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "remote_updateMedicalIDData:lastFetchedMedicalIDData:completion:", v3, v6, v7);
}

uint64_t __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteMedicalIDDataWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  id v5 = objc_alloc_init(_HKMedicalIDData);
  [(_HKMedicalIDData *)v5 setIsDisabled:1];
  [(_HKMedicalIDData *)v5 setModificationDatesForUpdatedFieldsWithMedicalIDData:0];
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke;
  v10[3] = &unk_1E58C3ED0;
  void v10[4] = self;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke_3;
  v8[3] = &unk_1E58BBD88;
  id v9 = v11;
  id v7 = v11;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v10 errorHandler:v8];
}

void __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 lastFetchedMedicalIDData];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD38;
  id v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "remote_deleteMedicalIDDataWithLastFetchedMedicalIDData:completion:", v5, v6);
}

uint64_t __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addEmergencyContact:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke;
  v13[3] = &unk_1E58C3ED0;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke_3;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

void __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke_2;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addEmergencyContact:completion:", v3, v4);
}

uint64_t __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeEmergencyContact:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke;
  v13[3] = &unk_1E58C3ED0;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke_3;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

void __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke_2;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_removeEmergencyContact:completion:", v3, v4);
}

uint64_t __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)serverInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52C70];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_medicalIDEmergencyContactsWithCompletion_, 0, 1);
  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_medicalIDClinicalContactsWithCompletion_, 0, 1);

  return v2;
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52CD0];
}

+ (id)setupStatusServerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52D30];
}

+ (id)setupStatusClientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52D90];
}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchedMedicalIDData, 0);
  objc_storeStrong((id *)&self->_setupStatusProxyProvider, 0);

  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Failed to get synchronous proxy with error, %{public}@", (uint8_t *)&v2, 0xCu);
}

@end