@interface CNAuthorization
+ (id)logger;
- (BOOL)isAccessRestrictedForEntityType:(int64_t)a3;
- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4;
- (CNAuthorization)init;
- (CNAuthorization)initWithAssumedIdentity:(id)a3;
- (CNAuthorization)initWithAuthorizationContext:(id)a3;
- (CNAuthorizationContext)authorizationContext;
- (int64_t)authorizationStatusForEntityType:(int64_t)a3;
- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation CNAuthorization

- (CNAuthorization)init
{
  return [(CNAuthorization *)self initWithAuthorizationContext:0];
}

- (int64_t)authorizationStatusForEntityType:(int64_t)a3
{
  if ([(CNAuthorization *)self isAccessRestrictedForEntityType:a3]) {
    return 1;
  }
  if (authorizationStatusForEntityType__cn_once_token_1 != -1) {
    dispatch_once(&authorizationStatusForEntityType__cn_once_token_1, &__block_literal_global_6_6);
  }
  id v5 = (id)authorizationStatusForEntityType__cn_once_object_1;
  v6 = [(CNAuthorization *)self authorizationContext];
  uint64_t v7 = [v6 authorizationStatus];

  v8 = [NSNumber numberWithInteger:v7];
  v9 = [v5 objectForKeyedSubscript:v8];

  int64_t v4 = [v9 integerValue];
  if (v4 == 2)
  {
    v10 = [(id)objc_opt_class() logger];
    [v10 accessAuthorizationStatusWasDenied];
  }
  return v4;
}

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    return 0;
  }
  v6 = [(CNAuthorization *)self authorizationContext];
  id v10 = 0;
  char v4 = [v6 requestAccessWithError:&v10];
  id v7 = v10;

  if ((v4 & 1) == 0)
  {
    if (v7)
    {
      uint64_t v11 = *MEMORY[0x1E4F28A50];
      v12[0] = v7;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    }
    else
    {
      v8 = 0;
    }
    CNSetError(a4, 100, (uint64_t)v8);
  }
  return v4;
}

- (CNAuthorizationContext)authorizationContext
{
  return self->_authorizationContext;
}

- (BOOL)isAccessRestrictedForEntityType:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  char v4 = [(CNAuthorization *)self authorizationContext];
  char v5 = [v4 isAccessRestricted];

  return v5;
}

- (CNAuthorization)initWithAssumedIdentity:(id)a3
{
  if (a3)
  {
    char v4 = (objc_class *)MEMORY[0x1E4F5A350];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithAuditToken:0 assumedIdentity:v5];
  }
  else
  {
    v6 = 0;
  }
  id v7 = [(CNAuthorization *)self initWithAuthorizationContext:v6];

  return v7;
}

- (CNAuthorization)initWithAuthorizationContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAuthorization;
  id v5 = [(CNAuthorization *)&v10 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (CNAuthorizationContext *)v4;
    }
    else
    {
      v6 = [MEMORY[0x1E4F5A350] sharedInstance];
    }
    authorizationContext = v5->_authorizationContext;
    v5->_authorizationContext = v6;

    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

void __52__CNAuthorization_authorizationStatusForEntityType___block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EE0893C8;
  v6[1] = &unk_1EE0893E0;
  v7[0] = &unk_1EE0893C8;
  v7[1] = &unk_1EE0893F8;
  v6[2] = &unk_1EE0893F8;
  v0 = NSNumber;
  if (dyld_program_sdk_at_least()) {
    uint64_t v1 = 4;
  }
  else {
    uint64_t v1 = 3;
  }
  v2 = [v0 numberWithInteger:v1];
  v6[3] = &unk_1EE089410;
  v7[2] = v2;
  v7[3] = &unk_1EE089410;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  uint64_t v4 = [v3 copy];
  id v5 = (void *)authorizationStatusForEntityType__cn_once_object_1;
  authorizationStatusForEntityType__cn_once_object_1 = v4;
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, void, void *))a4;
  if (a3)
  {
    id v7 = +[CNErrorFactory errorWithCode:100 userInfo:0];
    v6[2](v6, 0, v7);
  }
  else
  {
    v8 = [(CNAuthorization *)self authorizationContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__CNAuthorization_requestAccessForEntityType_completionHandler___block_invoke;
    v9[3] = &unk_1E56B87E0;
    v9[4] = self;
    objc_super v10 = v6;
    [v8 requestAuthorization:1 completionHandler:v9];
  }
}

void __64__CNAuthorization_requestAccessForEntityType_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v7 = 0;
  }
  else
  {
    if (v5)
    {
      uint64_t v11 = *MEMORY[0x1E4F28A50];
      v12[0] = v5;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    }
    else
    {
      v8 = 0;
    }
    id v10 = 0;
    CNSetError(&v10, 100, (uint64_t)v8);
    id v7 = v10;
    v9 = [(id)objc_opt_class() logger];
    [v9 requestAuthorizationWasDenied];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)logger
{
  if (logger_cn_once_token_0 != -1) {
    dispatch_once(&logger_cn_once_token_0, &__block_literal_global_108);
  }
  v2 = (void *)logger_cn_once_object_0;

  return v2;
}

void __25__CNAuthorization_logger__block_invoke()
{
  id v3 = +[CNContactsEnvironment currentEnvironment];
  v0 = [v3 loggerProvider];
  uint64_t v1 = [v0 contactsLogger];
  v2 = (void *)logger_cn_once_object_0;
  logger_cn_once_object_0 = v1;
}

@end