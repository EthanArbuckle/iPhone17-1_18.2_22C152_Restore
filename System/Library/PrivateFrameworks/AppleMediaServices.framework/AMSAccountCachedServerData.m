@interface AMSAccountCachedServerData
+ (id)sharedInstance;
- (AMSAccountCachedServerData)initWithWrappedInstance:(id)a3;
- (AMSAccountCachedServerDataCore)core;
- (id)BOOLForKey:(unint64_t)a3 accountID:(id)a4 updateBlock:(id)a5;
- (id)accountFlagsForAccountID:(id)a3;
- (id)cancelUpdatesForToken:(id)a3;
- (id)intForKey:(unint64_t)a3 accountID:(id)a4 updateBlock:(id)a5;
- (id)stringForKey:(unint64_t)a3 accountID:(id)a4 updateBlock:(id)a5;
- (void)accountAuthSyncForAccountID:(id)a3;
- (void)setAccountFlags:(id)a3 forAccountID:(id)a4;
- (void)setAccountFlags:(id)a3 forAccountID:(id)a4 completion:(id)a5;
- (void)setAutoPlay:(BOOL)a3 forAccountID:(id)a4;
- (void)setPersonalization:(BOOL)a3 forAccountID:(id)a4;
@end

@implementation AMSAccountCachedServerData

+ (id)sharedInstance
{
  if (_MergedGlobals_76 != -1) {
    dispatch_once(&_MergedGlobals_76, &__block_literal_global_2);
  }
  v2 = (void *)qword_1EB38D578;
  return v2;
}

- (id)stringForKey:(unint64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [(AMSAccountCachedServerData *)self core];
  v11 = [v10 stringForKey:a3 accountID:v9 updateBlock:v8];

  return v11;
}

- (id)cancelUpdatesForToken:(id)a3
{
  id v4 = a3;
  v5 = [(AMSAccountCachedServerData *)self core];
  v6 = [v5 cancelUpdateBlockFor:v4];

  return v6;
}

- (AMSAccountCachedServerDataCore)core
{
  return self->_core;
}

void __44__AMSAccountCachedServerData_sharedInstance__block_invoke()
{
  v0 = [AMSAccountCachedServerData alloc];
  id v3 = +[AMSAccountCachedServerDataCore sharedInstance];
  uint64_t v1 = [(AMSAccountCachedServerData *)v0 initWithWrappedInstance:v3];
  v2 = (void *)qword_1EB38D578;
  qword_1EB38D578 = v1;
}

- (AMSAccountCachedServerData)initWithWrappedInstance:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSAccountCachedServerData.m", 43, @"Unexpected nil reference: %s", "core");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSAccountCachedServerData.m", 44, @"Invalid parameter not satisfying: %s", "[core isKindOfClass:AMSAccountCachedServerDataCore.class]");
  }
  v12.receiver = self;
  v12.super_class = (Class)AMSAccountCachedServerData;
  v7 = [(AMSAccountCachedServerData *)&v12 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_core, a3);
  }

  return v8;
}

- (id)BOOLForKey:(unint64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [(AMSAccountCachedServerData *)self core];
  v11 = [v10 BOOLForKey:a3 accountID:v9 updateBlock:v8];

  return v11;
}

- (id)intForKey:(unint64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [(AMSAccountCachedServerData *)self core];
  v11 = [v10 intForKey:a3 accountID:v9 updateBlock:v8];

  return v11;
}

- (id)accountFlagsForAccountID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(AMSAccountCachedServerData *)self core];
    id v6 = [v5 accountFlagsForAccountID:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)setAccountFlags:(id)a3 forAccountID:(id)a4
{
}

- (void)setAutoPlay:(BOOL)a3 forAccountID:(id)a4
{
  if (a4)
  {
    BOOL v4 = a3;
    id v6 = a4;
    id v7 = [(AMSAccountCachedServerData *)self core];
    [v7 setAutoPlayTo:v4 forAccountID:v6 completionHandler:&__block_literal_global_15];
  }
}

- (void)setPersonalization:(BOOL)a3 forAccountID:(id)a4
{
  if (a4)
  {
    BOOL v4 = a3;
    id v6 = a4;
    id v7 = [(AMSAccountCachedServerData *)self core];
    [v7 setPersonalizationTo:v4 forAccountID:v6 completionHandler:&__block_literal_global_17];
  }
}

- (void)accountAuthSyncForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSAccountCachedServerData *)self core];
  [v5 accountAuthSyncForAccountID:v4 completionHandler:&__block_literal_global_20];
}

- (void)setAccountFlags:(id)a3 forAccountID:(id)a4 completion:(id)a5
{
  if (a4)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = [(AMSAccountCachedServerData *)self core];
    [v11 setAccountFlags:v10 forAccountID:v9 completionHandler:v8];
  }
}

- (void).cxx_destruct
{
}

@end