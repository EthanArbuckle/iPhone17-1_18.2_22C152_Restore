@interface MCMCommandSetCodeSignMapping
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandSetCodeSignMapping)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (NSString)identifier;
- (id)info;
- (id)options;
- (void)execute;
@end

@implementation MCMCommandSetCodeSignMapping

- (void).cxx_destruct
{
  objc_storeStrong(&self->_options, 0);
  objc_storeStrong(&self->_info, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)options
{
  return self->_options;
}

- (id)info
{
  return self->_info;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)execute
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = (void *)gCodeSigningMapping;
  v5 = [(MCMCommandSetCodeSignMapping *)self info];
  v6 = [(MCMCommandSetCodeSignMapping *)self identifier];
  v7 = [(MCMCommandSetCodeSignMapping *)self options];
  id v20 = 0;
  v8 = [v4 processCodeSigningInfo:v5 identifier:v6 options:v7 error:&v20];
  id v9 = v20;

  if ([v8 count])
  {
    v10 = objc_alloc_init(MCMResultPromise);
    v11 = [v8 allObjects];
    v12 = [(MCMCommand *)self context];
    v13 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:v11 removeAllCodeSignInfo:0 context:v12 resultPromise:v10];

    [v13 execute];
    v14 = [(MCMResultPromise *)v10 result];
    v15 = [v14 error];

    if (v15)
    {
      v16 = container_log_handle_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v15;
        _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "Failed to destroy container(s) during setCodeSigningMapping; error = %@",
          buf,
          0xCu);
      }
    }
  }
  v17 = container_log_handle_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v9;
    _os_log_impl(&dword_1D7739000, v17, OS_LOG_TYPE_DEFAULT, "Set code sign mapping; error = %@", buf, 0xCu);
  }

  v18 = [[MCMResultBase alloc] initWithError:v9];
  v19 = [(MCMCommand *)self resultPromise];
  [v19 completeWithResult:v18];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToAccessCodesignMapping];

  return v4;
}

- (MCMCommandSetCodeSignMapping)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCMCommandSetCodeSignMapping;
  id v9 = [(MCMCommand *)&v17 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 identifier];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    uint64_t v12 = [v8 options];
    id options = v9->_options;
    v9->_id options = (id)v12;

    uint64_t v14 = [v8 info];
    id info = v9->_info;
    v9->_id info = (id)v14;
  }
  return v9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 18;
}

@end