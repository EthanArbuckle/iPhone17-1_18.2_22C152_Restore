@interface MCMCommandInvalidateCodeSigningCache
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (void)execute;
@end

@implementation MCMCommandInvalidateCodeSigningCache

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 20;
}

- (void)execute
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  uint64_t v4 = [(id)gCodeSigningMapping invalidateCodeSigningInfoForAppsWithoutDataContainer];
  if (v4 == 1) {
    v5 = 0;
  }
  else {
    v5 = [[MCMError alloc] initWithErrorType:v4];
  }
  v6 = container_log_handle_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1D7739000, v6, OS_LOG_TYPE_DEFAULT, "Invalidate codesign cache; error = %@",
      (uint8_t *)&v9,
      0xCu);
  }

  v7 = [[MCMResultBase alloc] initWithError:v5];
  v8 = [(MCMCommand *)self resultPromise];
  [v8 completeWithResult:v7];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToAccessCodesignMapping];

  return v4;
}

@end