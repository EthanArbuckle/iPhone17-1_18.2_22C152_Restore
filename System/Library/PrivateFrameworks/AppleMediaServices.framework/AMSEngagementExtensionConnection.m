@interface AMSEngagementExtensionConnection
- (AMSEngagementExtensionConnection)initWithPrincipalObject:(id)a3;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (id)principalObject;
- (void)performRequestWithObject:(id)a3 completion:(id)a4;
@end

@implementation AMSEngagementExtensionConnection

- (AMSEngagementExtensionConnection)initWithPrincipalObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSEngagementExtensionConnection;
  v6 = [(AMSEngagementExtensionConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_principalObject, a3);
  }

  return v7;
}

- (id)principalObject
{
  return self->_principalObject;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 processIdentifier];
  v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = objc_opt_class();
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Accepting XPC connection from %d", (uint8_t *)&v10, 0x12u);
  }

  [v4 setExportedObject:self];
  v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51608];
  [v4 setExportedInterface:v8];
  [v4 resume];

  return 1;
}

- (void)performRequestWithObject:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  Class v8 = (Class)[v7 principalClass];

  if (v8) {
    goto LABEL_2;
  }
  uint64_t v11 = [MEMORY[0x1E4F28B50] mainBundle];
  __int16 v12 = [v11 infoDictionary];
  int v13 = [v12 objectForKeyedSubscript:@"NSExtension"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  v15 = [v14 objectForKeyedSubscript:@"NSExtensionPrincipalClass"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  id v16 = v15;

  if (!v16)
  {
LABEL_15:

    goto LABEL_16;
  }
  Class v8 = NSClassFromString((NSString *)v16);

  if (v8)
  {
LABEL_2:
    objc_super v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      objc_super v9 = +[AMSLogConfig sharedConfig];
    }
    int v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      uint64_t v21 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling primary class", (uint8_t *)&v20, 0xCu);
    }

    [(objc_class *)v8 performRequestWithObject:v5 completion:v6];
    goto LABEL_21;
  }
LABEL_16:
  v17 = +[AMSLogConfig sharedConfig];
  if (!v17)
  {
    v17 = +[AMSLogConfig sharedConfig];
  }
  v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v20 = 138543362;
    uint64_t v21 = objc_opt_class();
    _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to locate class", (uint8_t *)&v20, 0xCu);
  }

  v19 = AMSError(0, @"Extension Failure", @"Unable to locate principle class", 0);
  v6[2](v6, 0, v19);

LABEL_21:
}

- (void).cxx_destruct
{
}

@end