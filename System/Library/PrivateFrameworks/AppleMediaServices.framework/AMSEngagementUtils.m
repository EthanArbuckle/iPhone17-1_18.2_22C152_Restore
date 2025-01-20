@interface AMSEngagementUtils
+ (id)encodeModel:(id)a3;
+ (id)modelFromData:(id)a3 class:(Class)a4 error:(id *)a5;
@end

@implementation AMSEngagementUtils

+ (id)encodeModel:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v11];
  id v4 = v11;
  if (v4)
  {
    v5 = +[AMSLogConfig sharedEngagementConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      v8 = AMSLogKey();
      v9 = AMSLogableError(v4);
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      v15 = v8;
      __int16 v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to serialize engagement model, error = %{public}@", buf, 0x20u);
    }
  }

  return v3;
}

+ (id)modelFromData:(id)a3 class:(Class)a4 error:(id *)a5
{
  id v10 = 0;
  v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a4 fromData:a3 error:&v10];
  id v7 = v10;
  v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return v6;
}

@end