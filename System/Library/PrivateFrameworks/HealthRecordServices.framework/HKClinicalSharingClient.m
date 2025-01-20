@interface HKClinicalSharingClient
+ (id)defaultSyncActivityCriteria;
- (HKClinicalSharingClient)init;
- (HKClinicalSharingClient)initWithConnection:(id)a3;
- (id)exportedInterface;
- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)gatherQueryDiagnosticsWithOptions:(unint64_t)a3 date:(id)a4 completion:(id)a5;
- (void)scheduleSharingHealthDataWithReason:(int64_t)a3 completion:(id)a4;
- (void)shareHealthDataWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)shareHealthDataWithOptions:(unint64_t)a3 reason:(int64_t)a4 date:(id)a5 completion:(id)a6;
- (void)submitDailyAnalyticsWithCompletion:(id)a3;
- (void)submitOnboardingAnalyticsForStepIdentifier:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation HKClinicalSharingClient

- (HKClinicalSharingClient)init
{
  v3 = +[HKHealthRecordsDaemonConnection sharedConnection];
  v4 = [(HKClinicalSharingClient *)self initWithConnection:v3];

  return v4;
}

- (HKClinicalSharingClient)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalSharingClient;
  v5 = [(HKClinicalSharingClient *)&v9 init];
  if (v5)
  {
    v6 = [[HKHealthRecordsDaemonProxyProvider alloc] initWithConnection:v4 serviceIdentifier:@"ClinicalSharing" exportedObject:v5];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = &v6->super;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

- (void)shareHealthDataWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
}

- (void)shareHealthDataWithOptions:(unint64_t)a3 reason:(int64_t)a4 date:(id)a5 completion:(id)a6
{
  id v10 = a5;
  v11 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a6];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__HKClinicalSharingClient_shareHealthDataWithOptions_reason_date_completion___block_invoke;
  v16[3] = &unk_2645EF790;
  unint64_t v19 = a3;
  int64_t v20 = a4;
  id v17 = v10;
  id v18 = v11;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__HKClinicalSharingClient_shareHealthDataWithOptions_reason_date_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v18;
  id v12 = v18;
  id v13 = v10;
  [(HKClinicalSharingClient *)self _fetchProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __77__HKClinicalSharingClient_shareHealthDataWithOptions_reason_date_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_shareHealthDataWithOptions:reason:date:completion:", a1[6], a1[7], a1[4], a1[5]);
}

uint64_t __77__HKClinicalSharingClient_shareHealthDataWithOptions_reason_date_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scheduleSharingHealthDataWithReason:(int64_t)a3 completion:(id)a4
{
  v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__HKClinicalSharingClient_scheduleSharingHealthDataWithReason_completion___block_invoke;
  v10[3] = &unk_2645EF7B8;
  int64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__HKClinicalSharingClient_scheduleSharingHealthDataWithReason_completion___block_invoke_2;
  v8[3] = &unk_2645EE630;
  id v9 = v11;
  id v7 = v11;
  [(HKClinicalSharingClient *)self _fetchProxyWithHandler:v10 errorHandler:v8];
}

uint64_t __74__HKClinicalSharingClient_scheduleSharingHealthDataWithReason_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_scheduleSharingHealthDataWithReason:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __74__HKClinicalSharingClient_scheduleSharingHealthDataWithReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)gatherQueryDiagnosticsWithOptions:(unint64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__HKClinicalSharingClient_gatherQueryDiagnosticsWithOptions_date_completion___block_invoke;
  v14[3] = &unk_2645EF7E0;
  unint64_t v17 = a3;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__HKClinicalSharingClient_gatherQueryDiagnosticsWithOptions_date_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKClinicalSharingClient *)self _fetchProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __77__HKClinicalSharingClient_gatherQueryDiagnosticsWithOptions_date_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_gatherQueryDiagnosticsWithOptions:date:completion:", a1[6], a1[4], a1[5]);
}

uint64_t __77__HKClinicalSharingClient_gatherQueryDiagnosticsWithOptions_date_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)submitDailyAnalyticsWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__HKClinicalSharingClient_submitDailyAnalyticsWithCompletion___block_invoke;
  v8[3] = &unk_2645EF808;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__HKClinicalSharingClient_submitDailyAnalyticsWithCompletion___block_invoke_2;
  v6[3] = &unk_2645EE630;
  id v7 = v9;
  id v5 = v9;
  [(HKClinicalSharingClient *)self _fetchProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __62__HKClinicalSharingClient_submitDailyAnalyticsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_submitDailyAnalyticsWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __62__HKClinicalSharingClient_submitDailyAnalyticsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)submitOnboardingAnalyticsForStepIdentifier:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __89__HKClinicalSharingClient_submitOnboardingAnalyticsForStepIdentifier_context_completion___block_invoke;
  v16[3] = &unk_2645EF830;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__HKClinicalSharingClient_submitOnboardingAnalyticsForStepIdentifier_context_completion___block_invoke_2;
  v14[3] = &unk_2645EE630;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKClinicalSharingClient *)self _fetchProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __89__HKClinicalSharingClient_submitOnboardingAnalyticsForStepIdentifier_context_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_submitOnboardingAnalyticsForStepIdentifier:context:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __89__HKClinicalSharingClient_submitOnboardingAnalyticsForStepIdentifier_context_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

+ (id)defaultSyncActivityCriteria
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x263EF82A8], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x263EF82D0], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);

  return empty;
}

- (id)exportedInterface
{
  id v2 = objc_alloc_init(MEMORY[0x263F08D80]);

  return v2;
}

- (void).cxx_destruct
{
}

@end