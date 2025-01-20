@interface ASDAccountStatusTask
+ (BOOL)supportsSecureCoding;
- (ASDAccountStatusTask)init;
- (ASDAccountStatusTask)initWithCoder:(id)a3;
- (BOOL)lookupFamilyInfoIfNecessary;
- (void)encodeWithCoder:(id)a3;
- (void)setLookupFamilyInfoIfNecessary:(BOOL)a3;
- (void)statusWithCompletion:(id)a3;
@end

@implementation ASDAccountStatusTask

- (ASDAccountStatusTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASDAccountStatusTask;
  v2 = [(ASDAccountStatusTask *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ASDServiceBroker defaultBroker];
    broker = v2->_broker;
    v2->_broker = (ASDClipServiceBroker *)v3;
  }
  return v2;
}

- (void)statusWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  broker = self->_broker;
  id v15 = 0;
  objc_super v6 = [(ASDClipServiceBroker *)broker getClipServiceWithError:&v15];
  id v7 = v15;
  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__ASDAccountStatusTask_statusWithCompletion___block_invoke;
    v13[3] = &unk_1E58B2CB8;
    id v8 = v4;
    id v14 = v8;
    v9 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__ASDAccountStatusTask_statusWithCompletion___block_invoke_1;
    v11[3] = &unk_1E58B3A28;
    id v12 = v8;
    [v9 accountStatusUsingRequest:self withReplyHandler:v11];
  }
  else
  {
    v10 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_error_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_ERROR, "Request to service failed with error: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v7);
  }
}

void __45__ASDAccountStatusTask_statusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Request to make a connection with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__ASDAccountStatusTask_statusWithCompletion___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAccountStatusTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASDAccountStatusTask;
  int v5 = [(ASDAccountStatusTask *)&v7 init];
  if (v5) {
    v5->_lookupFamilyInfoIfNecessary = [v4 decodeBoolForKey:@"_lookupFamilyInfoIfNecessary"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)lookupFamilyInfoIfNecessary
{
  return self->_lookupFamilyInfoIfNecessary;
}

- (void)setLookupFamilyInfoIfNecessary:(BOOL)a3
{
  self->_lookupFamilyInfoIfNecessary = a3;
}

- (void).cxx_destruct
{
}

@end