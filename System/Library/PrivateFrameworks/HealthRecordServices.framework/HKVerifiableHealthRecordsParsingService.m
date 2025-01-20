@interface HKVerifiableHealthRecordsParsingService
- (HKProxyProvider)proxyProvider;
- (HKVerifiableHealthRecordsParsingService)init;
- (HKVerifiableHealthRecordsParsingService)initWithConnection:(id)a3;
- (id)exportedInterface;
- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)parseDataSource:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)setProxyProvider:(id)a3;
@end

@implementation HKVerifiableHealthRecordsParsingService

- (HKVerifiableHealthRecordsParsingService)init
{
  v3 = +[HKHealthRecordsDaemonConnection sharedConnection];
  v4 = [(HKVerifiableHealthRecordsParsingService *)self initWithConnection:v3];

  return v4;
}

- (HKVerifiableHealthRecordsParsingService)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKVerifiableHealthRecordsParsingService;
  v5 = [(HKVerifiableHealthRecordsParsingService *)&v9 init];
  if (v5)
  {
    v6 = [[HKHealthRecordsDaemonProxyProvider alloc] initWithConnection:v4 serviceIdentifier:@"VerifiableHealthRecordsParsingService" exportedObject:v5];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = &v6->super;
  }
  return v5;
}

- (void)parseDataSource:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  objc_super v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__HKVerifiableHealthRecordsParsingService_parseDataSource_options_completion___block_invoke;
  v14[3] = &unk_2645EF6C8;
  id v15 = v8;
  unint64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__HKVerifiableHealthRecordsParsingService_parseDataSource_options_completion___block_invoke_2;
  v12[3] = &unk_2645EE630;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKVerifiableHealthRecordsParsingService *)self _fetchProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __78__HKVerifiableHealthRecordsParsingService_parseDataSource_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_parseDataSource:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __78__HKVerifiableHealthRecordsParsingService_parseDataSource_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
}

- (id)exportedInterface
{
  id v2 = objc_alloc_init(MEMORY[0x263F08D80]);

  return v2;
}

- (HKProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end