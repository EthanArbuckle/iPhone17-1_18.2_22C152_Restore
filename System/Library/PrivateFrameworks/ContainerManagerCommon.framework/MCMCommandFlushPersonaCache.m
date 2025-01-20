@interface MCMCommandFlushPersonaCache
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (void)execute;
@end

@implementation MCMCommandFlushPersonaCache

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 34;
}

- (void)execute
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = [(MCMCommand *)self context];
  v5 = [v4 userIdentityCache];
  [v5 flush];

  v6 = container_log_handle_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D7739000, v6, OS_LOG_TYPE_DEFAULT, "Flush persona cache; error = nil", v9, 2u);
  }

  v7 = [[MCMResultBase alloc] initWithError:0];
  v8 = [(MCMCommand *)self resultPromise];
  [v8 completeWithResult:v7];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToControlCaches];

  return v4;
}

@end