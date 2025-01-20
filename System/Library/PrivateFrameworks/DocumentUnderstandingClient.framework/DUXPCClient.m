@interface DUXPCClient
+ (id)sharedInstance;
- (DUXPCClient)init;
- (id)_syncRemoteObjectProxy;
- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5;
- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5;
- (void)requestExtractionOfPersonalIDFromDocument:(id)a3 pid:(int)a4 completion:(id)a5;
- (void)synchronousEventExtractionWithSerializedDocument:(id)a3 documentType:(int64_t)a4 pid:(int)a5 completion:(id)a6;
@end

@implementation DUXPCClient

- (void).cxx_destruct
{
}

- (void)synchronousEventExtractionWithSerializedDocument:(id)a3 documentType:(int64_t)a4 pid:(int)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstandingClient initiating call to textunderstandingd - synchronousEventExtractionWithSerializedDocument", buf, 2u);
  }
  clientHelpers = self->_clientHelpers;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_24CF7B3A4;
  v15[3] = &unk_2652FA6D8;
  id v13 = v11;
  id v16 = v13;
  v14 = [(DUXPCClientHelpers *)clientHelpers synchronousRemoteObjectProxyWithErrorHandler:v15];
  [v14 synchronousEventExtractionWithSerializedDocument:v10 documentType:a4 pid:v7 completion:v13];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstandingClient completed the call", buf, 2u);
  }
}

- (void)requestExtractionOfPersonalIDFromDocument:(id)a3 pid:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstandingClient initiating call to textunderstandingd - requestExtractionOfPersonalIDFromDocument", v11, 2u);
  }
  id v10 = [(DUXPCClientHelpers *)self->_clientHelpers remoteObjectProxy];
  [v10 requestExtractionOfPersonalIDFromDocument:v8 pid:v6 completion:v9];
}

- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstandingClient initiating call to textunderstandingd - foundInEventResultWithSerializedDocument", v11, 2u);
  }
  id v10 = [(DUXPCClient *)self _syncRemoteObjectProxy];
  [v10 foundInEventResultWithSerializedDocument:v8 documentType:a4 completion:v9];
}

- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstandingClient initiating call to textunderstandingd - addSerializedDocument", v11, 2u);
  }
  id v10 = [(DUXPCClient *)self _syncRemoteObjectProxy];
  [v10 addSerializedDocument:v8 documentType:a4 completion:v9];
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstandingClient initiating call to textunderstandingd - addOrUpdateSearchableItems", v12, 2u);
  }
  id v11 = [(DUXPCClient *)self _syncRemoteObjectProxy];
  [v11 addOrUpdateSearchableItems:v8 bundleID:v9 completion:v10];
}

- (id)_syncRemoteObjectProxy
{
  return [(DUXPCClientHelpers *)self->_clientHelpers synchronousRemoteObjectProxyWithErrorHandler:&unk_26FF53BD8];
}

- (DUXPCClient)init
{
  v16.receiver = self;
  v16.super_class = (Class)DUXPCClient;
  v2 = [(DUXPCClient *)&v16 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FF57D18];
    v4 = (void *)MEMORY[0x253318DF0]();
    id v5 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    [v3 setClasses:v7 forSelector:sel_addOrUpdateSearchableItems_bundleID_completion_ argumentIndex:0 ofReply:0];

    id v8 = (void *)MEMORY[0x253318DF0]();
    id v9 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v9, "initWithObjects:", v10, v11, objc_opt_class(), 0);
    [v3 setClasses:v12 forSelector:sel_synchronousEventExtractionWithSerializedDocument_documentType_pid_completion_ argumentIndex:0 ofReply:1];

    id v13 = [[DUXPCClientHelpers alloc] initWithServiceName:@"com.apple.TextUnderstanding.DocumentUnderstandingHarvesting" whitelistedServerInterface:v3 clientExportedObject:v2 interruptionHandler:&unk_26FF53B98 invalidationHandler:&unk_26FF53BB8];
    clientHelpers = v2->_clientHelpers;
    v2->_clientHelpers = v13;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_24CF7BB84;
  block[3] = &unk_2652FA6B0;
  block[4] = a1;
  if (qword_26B182BB8 != -1) {
    dispatch_once(&qword_26B182BB8, block);
  }
  v2 = (void *)qword_26B182BC0;
  return v2;
}

@end