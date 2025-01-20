@interface MCMCommandGetCodeSignMapping
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandGetCodeSignMapping)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (NSString)identifier;
- (void)execute;
@end

@implementation MCMCommandGetCodeSignMapping

- (void).cxx_destruct
{
  p_identifier = &self->_identifier;

  objc_storeStrong((id *)p_identifier, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)execute
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = (void *)gCodeSigningMapping;
  v5 = [(MCMCommandGetCodeSignMapping *)self identifier];
  id v6 = [v4 getCodeSigningInfoForIdentifier:v5];

  if (v6)
  {
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      v11 = 0;
      goto LABEL_10;
    }
    v8 = [MCMError alloc];
    uint64_t v9 = 93;
    uint64_t v10 = 5;
  }
  else
  {
    v8 = [MCMError alloc];
    uint64_t v9 = 21;
    uint64_t v10 = 3;
  }
  v11 = [(MCMError *)v8 initWithErrorType:v9 category:v10];
LABEL_10:
  v12 = container_log_handle_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v11;
    _os_log_impl(&dword_1D7739000, v12, OS_LOG_TYPE_DEFAULT, "Get codesign info; error = %@", (uint8_t *)&v17, 0xCu);
  }

  v13 = [MCMResultGetCodeSignMapping alloc];
  if (v6) {
    uint64_t v14 = [(MCMResultGetCodeSignMapping *)v13 initWithInfo:v6];
  }
  else {
    uint64_t v14 = [(MCMResultBase *)v13 initWithError:v11];
  }
  v15 = (void *)v14;
  v16 = [(MCMCommand *)self resultPromise];
  [v16 completeWithResult:v15];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToAccessCodesignMapping];

  return v4;
}

- (MCMCommandGetCodeSignMapping)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandGetCodeSignMapping;
  uint64_t v9 = [(MCMCommand *)&v13 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 identifier];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;
  }
  return v9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 19;
}

@end