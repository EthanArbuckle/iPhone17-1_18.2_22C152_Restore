@interface AMSBagKeySet
+ (BOOL)supportsSecureCoding;
+ (NSMutableDictionary)defaultValues;
+ (id)defaultValueForKey:(id)a3 profile:(id)a4 profileVersion:(id)a5;
+ (void)registerBagKeySet:(id)a3 forProfile:(id)a4 profileVersion:(id)a5;
- (AMSBagKeySet)init;
- (NSMutableDictionary)defaultValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setDefaultValues:(id)a3;
@end

@implementation AMSBagKeySet

uint64_t __60__AMSBagKeySet_registerBagKeySet_forProfile_profileVersion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

+ (id)defaultValueForKey:(id)a3 profile:(id)a4 profileVersion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  os_unfair_recursive_lock_lock_with_options();
  v11 = [NSString stringWithFormat:@"%@:%@", v10, v9];

  v12 = [a1 defaultValues];
  id v13 = [v12 objectForKeyedSubscript:v11];

  if (!v13)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v14 = [a1 defaultValues];
    [v14 setObject:v13 forKeyedSubscript:v11];
  }
  v15 = [v13 objectForKeyedSubscript:v8];
  os_unfair_recursive_lock_unlock();

  return v15;
}

+ (NSMutableDictionary)defaultValues
{
  if (_MergedGlobals_85 != -1) {
    dispatch_once(&_MergedGlobals_85, &__block_literal_global_16);
  }
  v2 = (void *)qword_1EB38D6B8;
  return (NSMutableDictionary *)v2;
}

- (void).cxx_destruct
{
}

+ (void)registerBagKeySet:(id)a3 forProfile:(id)a4 profileVersion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  os_unfair_recursive_lock_lock_with_options();
  v11 = [NSString stringWithFormat:@"%@:%@", v10, v9];

  v12 = [a1 defaultValues];
  id v13 = [v12 objectForKeyedSubscript:v11];

  if (!v13)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v14 = [a1 defaultValues];
    [v14 setObject:v13 forKeyedSubscript:v11];
  }
  v15 = [v8 defaultValues];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__AMSBagKeySet_registerBagKeySet_forProfile_profileVersion___block_invoke;
  v17[3] = &unk_1E559F770;
  id v18 = v13;
  id v16 = v13;
  [v15 enumerateKeysAndObjectsUsingBlock:v17];

  os_unfair_recursive_lock_unlock();
}

- (NSMutableDictionary)defaultValues
{
  return self->_defaultValues;
}

- (AMSBagKeySet)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSBagKeySet;
  v2 = [(AMSBagKeySet *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    defaultValues = v2->_defaultValues;
    v2->_defaultValues = v3;
  }
  return v2;
}

uint64_t __29__AMSBagKeySet_defaultValues__block_invoke()
{
  qword_1EB38D6B8 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = +[AMSBagKeySet allocWithZone:a3];
  return [(AMSBagKeySet *)v3 init];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v3 = +[AMSMutableBagKeySet allocWithZone:a3];
  return [(AMSBagKeySet *)v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDefaultValues:(id)a3
{
}

@end