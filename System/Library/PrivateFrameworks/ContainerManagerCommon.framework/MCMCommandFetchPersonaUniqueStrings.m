@interface MCMCommandFetchPersonaUniqueStrings
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (void)execute;
@end

@implementation MCMCommandFetchPersonaUniqueStrings

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 32;
}

- (void)execute
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
  v5 = [(MCMCommand *)self context];
  v6 = [v5 clientIdentity];
  v7 = [v6 userIdentity];

  if ([v7 isNoSpecificPersona])
  {
    v8 = [(MCMCommand *)self context];
    v9 = [v8 userIdentityCache];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__MCMCommandFetchPersonaUniqueStrings_execute__block_invoke;
    v14[3] = &unk_1E6A7F200;
    id v15 = v4;
    [v9 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v14];
  }
  else
  {
    v10 = [v7 personaUniqueString];
    if (v10) {
      [v4 addObject:v10];
    }
  }
  v11 = container_log_handle_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    __int16 v18 = 2112;
    uint64_t v19 = 0;
    _os_log_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEFAULT, "Fetch persona unique strings result: %@; error = %@",
      buf,
      0x16u);
  }

  v12 = [[MCMResultFetchPersonaUniqueStrings alloc] initWithPersonaUniqueStrings:v4];
  v13 = [(MCMCommand *)self resultPromise];
  [v13 completeWithResult:v12];
}

uint64_t __46__MCMCommandFetchPersonaUniqueStrings_execute__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 personaUniqueString];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x1F41817F8]();
}

- (BOOL)preflightClientAllowed
{
  return 1;
}

@end