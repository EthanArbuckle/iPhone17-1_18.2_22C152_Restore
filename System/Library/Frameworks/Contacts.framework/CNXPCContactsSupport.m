@interface CNXPCContactsSupport
+ (CNXPCContactsSupport)sharedInstance;
+ (id)os_log;
+ (id)serviceProtocolInterface;
- (CNContactsLogger)logger;
- (CNXPCConnection)serviceConnection;
- (CNXPCContactsSupport)init;
- (CNXPCContactsSupport)initWithConnection:(id)a3;
- (CNXPCContactsSupportService)serviceProxy;
- (id)requestProviderDomainCommand:(id)a3 error:(id *)a4;
@end

@implementation CNXPCContactsSupport

+ (id)os_log
{
  if (os_log_cn_once_token_1_4 != -1) {
    dispatch_once(&os_log_cn_once_token_1_4, &__block_literal_global_135);
  }
  v2 = (void *)os_log_cn_once_object_1_4;

  return v2;
}

uint64_t __30__CNXPCContactsSupport_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "CNXPCContactsSupport");
  uint64_t v1 = os_log_cn_once_object_1_4;
  os_log_cn_once_object_1_4 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (CNXPCContactsSupport)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CNXPCContactsSupport_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_cn_once_token_2 != -1) {
    dispatch_once(&sharedInstance_cn_once_token_2, block);
  }
  v2 = (void *)sharedInstance_cn_once_object_2;

  return (CNXPCContactsSupport *)v2;
}

uint64_t __38__CNXPCContactsSupport_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_cn_once_object_2;
  sharedInstance_cn_once_object_2 = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (CNXPCContactsSupport)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.contactsd.support" options:0];
  v4 = [(CNXPCContactsSupport *)self initWithConnection:v3];

  return v4;
}

- (CNXPCContactsSupport)initWithConnection:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNXPCContactsSupport;
  v5 = [(CNXPCContactsSupport *)&v18 init];
  if (v5)
  {
    v6 = +[CNContactsEnvironment currentEnvironment];
    v7 = [v6 loggerProvider];
    v8 = [v7 contactsLogger];

    logger = v5->_logger;
    v5->_logger = v8;
    v10 = v8;

    v11 = +[CNXPCContactsSupport serviceProtocolInterface];
    v12 = [[CNXPCConnection alloc] initWithConnection:v4 interface:v11 logger:v10];
    serviceConnection = v5->_serviceConnection;
    v5->_serviceConnection = v12;

    uint64_t v14 = [(CNXPCConnection *)v5->_serviceConnection serviceProxy];
    serviceProxy = v5->_serviceProxy;
    v5->_serviceProxy = (CNXPCContactsSupportService *)v14;

    v16 = v5;
  }

  return v5;
}

+ (id)serviceProtocolInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE0B8520];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_requestProviderDomainCommand_withReply_ argumentIndex:0 ofReply:0];

  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_requestProviderDomainCommand_withReply_ argumentIndex:0 ofReply:1];

  v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_requestProviderDomainCommand_withReply_ argumentIndex:1 ofReply:1];

  return v2;
}

- (id)requestProviderDomainCommand:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__34;
  v27 = __Block_byref_object_dispose__34;
  id v28 = 0;
  uint64_t v17 = 0;
  objc_super v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__34;
  v21 = __Block_byref_object_dispose__34;
  id v22 = 0;
  uint64_t v7 = [(CNXPCContactsSupport *)self logger];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__CNXPCContactsSupport_requestProviderDomainCommand_error___block_invoke;
  v13[3] = &unk_1E56B8F30;
  v15 = &v23;
  v13[4] = self;
  id v8 = v6;
  id v14 = v8;
  v16 = &v17;
  [v7 requestingProviderDomainCommand:v13];

  v9 = (void *)v18[5];
  id v10 = (id)v24[5];
  v11 = v10;
  if (a4 && !v10) {
    *a4 = v9;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __59__CNXPCContactsSupport_requestProviderDomainCommand_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serviceConnection];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 remoteResultForSelector:sel_requestProviderDomainCommand_withReply_ param1:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (CNXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (CNXPCContactsSupportService)serviceProxy
{
  return self->_serviceProxy;
}

- (CNContactsLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);

  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

@end