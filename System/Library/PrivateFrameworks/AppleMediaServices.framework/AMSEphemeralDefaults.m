@interface AMSEphemeralDefaults
+ (BOOL)HARLoggingEnabled;
+ (BOOL)bagKeyRegistrationEnabled;
+ (BOOL)preferEphemeralImageLoader;
+ (BOOL)preferEphemeralURLSessions;
+ (BOOL)processAssertionsEnabled;
+ (BOOL)purchaseAccountFallback;
+ (BOOL)suppressEngagement;
+ (id)_propertyForKey:(id)a3 defaultValue:(id)a4 expectedType:(Class)a5;
+ (int64_t)HARLoggingItemLimit;
+ (void)_accessDataStoreUsingBlock:(id)a3;
+ (void)_setProperty:(id)a3 forKey:(id)a4;
+ (void)setHARLoggingItemLimit:(int64_t)a3;
+ (void)setPreferEphemeralImageLoader:(BOOL)a3;
+ (void)setPreferEphemeralURLSessions:(BOOL)a3;
+ (void)setProcessAssertionsEnabled:(BOOL)a3;
+ (void)setPurchaseAccountFallback:(BOOL)a3;
+ (void)setSuppressEngagement:(BOOL)a3;
@end

@implementation AMSEphemeralDefaults

uint64_t __51__AMSEphemeralDefaults__accessDataStoreUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__AMSEphemeralDefaults__propertyForKey_defaultValue_expectedType___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)preferEphemeralURLSessions
{
  v2 = [a1 _propertyForKey:@"preferEphemeralURLSessions" defaultValue:MEMORY[0x1E4F1CC28] expectedType:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (BOOL)suppressEngagement
{
  char v3 = [a1 _propertyForKey:@"suppressEngagement" defaultValue:MEMORY[0x1E4F1CC28] expectedType:objc_opt_class()];
  if (objc_opt_respondsToSelector())
  {
    v4 = [a1 _propertyForKey:@"suppressEngagement" defaultValue:MEMORY[0x1E4F1CC28] expectedType:objc_opt_class()];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)processAssertionsEnabled
{
  v2 = [a1 _propertyForKey:@"processAssertionsEnabled" defaultValue:MEMORY[0x1E4F1CC38] expectedType:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (id)_propertyForKey:(id)a3 defaultValue:(id)a4 expectedType:(Class)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v16 = 0;
  v17 = (id *)&v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__30;
  v20 = __Block_byref_object_dispose__30;
  id v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__AMSEphemeralDefaults__propertyForKey_defaultValue_expectedType___block_invoke;
  v13[3] = &unk_1E559E440;
  v15 = &v16;
  id v9 = v7;
  id v14 = v9;
  [a1 _accessDataStoreUsingBlock:v13];
  id v10 = v17[5];
  if (!v10)
  {
    objc_storeStrong(v17 + 5, a4);
    id v10 = v17[5];
  }
  id v11 = v10;

  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (void)_accessDataStoreUsingBlock:(id)a3
{
  id v3 = a3;
  if (qword_1EB38D8B0 != -1) {
    dispatch_once(&qword_1EB38D8B0, &__block_literal_global_50);
  }
  v4 = _MergedGlobals_105;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AMSEphemeralDefaults__accessDataStoreUsingBlock___block_invoke_2;
  block[3] = &unk_1E55A2790;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

uint64_t __51__AMSEphemeralDefaults__accessDataStoreUsingBlock___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSEphemeralDefaults", 0);
  v1 = (void *)_MergedGlobals_105;
  _MergedGlobals_105 = (uint64_t)v0;

  qword_1EB38D8A8 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

+ (void)setHARLoggingItemLimit:(int64_t)a3
{
  if (a3 == -1)
  {
    +[AMSHTTPArchiveController setMaxBufferSizeOverride:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSHTTPArchiveController setMaxBufferSizeOverride:v3];
  }
}

uint64_t __44__AMSEphemeralDefaults__setProperty_forKey___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [a2 setObject:v2 forKeyedSubscript:*(void *)(result + 40)];
  }
  return result;
}

+ (void)setSuppressEngagement:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [a1 _setProperty:v4 forKey:@"suppressEngagement"];
}

+ (void)_setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__AMSEphemeralDefaults__setProperty_forKey___block_invoke;
  v10[3] = &unk_1E55A2768;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [a1 _accessDataStoreUsingBlock:v10];
}

+ (int64_t)HARLoggingItemLimit
{
  uint64_t v2 = +[AMSHTTPArchiveController maxBufferSizeOverride];
  id v3 = (void *)v2;
  id v4 = &unk_1EDD01288;
  if (v2) {
    id v4 = (void *)v2;
  }
  id v5 = v4;

  int64_t v6 = [v5 integerValue];
  return v6;
}

+ (BOOL)preferEphemeralImageLoader
{
  uint64_t v2 = [a1 _propertyForKey:@"preferEphemeralImageLoader" defaultValue:MEMORY[0x1E4F1CC38] expectedType:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (BOOL)purchaseAccountFallback
{
  char v3 = [a1 _propertyForKey:@"purchaseAccountFallback" defaultValue:MEMORY[0x1E4F1CC28] expectedType:objc_opt_class()];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [a1 _propertyForKey:@"purchaseAccountFallback" defaultValue:MEMORY[0x1E4F1CC28] expectedType:objc_opt_class()];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (void)setPreferEphemeralImageLoader:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [a1 _setProperty:v4 forKey:@"preferEphemeralImageLoader"];
}

+ (void)setPreferEphemeralURLSessions:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [a1 _setProperty:v4 forKey:@"preferEphemeralURLSessions"];
}

+ (void)setProcessAssertionsEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [a1 _setProperty:v4 forKey:@"processAssertionsEnabled"];
}

+ (void)setPurchaseAccountFallback:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [a1 _setProperty:v4 forKey:@"purchaseAccountFallback"];
}

+ (BOOL)bagKeyRegistrationEnabled
{
  return 0;
}

+ (BOOL)HARLoggingEnabled
{
  return 1;
}

@end