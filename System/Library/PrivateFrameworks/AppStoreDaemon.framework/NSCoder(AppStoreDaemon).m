@interface NSCoder(AppStoreDaemon)
- (BOOL)_asd_encodeJSONObject:()AppStoreDaemon forKey:error:;
- (id)_asd_decodeJSONObjectForKey:()AppStoreDaemon error:;
- (id)asd_decodeJSONDictionaryForKey:()AppStoreDaemon;
- (void)asd_encodeJSONDictionary:()AppStoreDaemon forKey:;
@end

@implementation NSCoder(AppStoreDaemon)

- (id)asd_decodeJSONDictionaryForKey:()AppStoreDaemon
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v13 = 0;
  v5 = objc_msgSend(a1, "_asd_decodeJSONObjectForKey:error:", v4, &v13);
  id v6 = v13;
  if (v6)
  {
    v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v15 = v11;
      __int16 v16 = 2114;
      id v17 = v4;
      __int16 v18 = 2114;
      id v19 = v6;
      id v12 = v11;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Error decoding JSON dictionary. key = %{public}@, error = %{public}@", buf, 0x20u);
    }
  }
  objc_opt_class();
  id v8 = v5;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (void)asd_encodeJSONDictionary:()AppStoreDaemon forKey:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v11 = 0;
  objc_msgSend(a1, "_asd_encodeJSONObject:forKey:error:", a3, v6, &v11);
  id v7 = v11;
  if (v7)
  {
    id v8 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v6;
      __int16 v16 = 2114;
      id v17 = v7;
      id v10 = v9;
      _os_log_error_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Error encoding JSON dictionary. key = %{public}@, error = %{public}@", buf, 0x20u);
    }
  }
}

- (id)_asd_decodeJSONObjectForKey:()AppStoreDaemon error:
{
  id v6 = a3;
  id v7 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v6];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_asd_encodeJSONObject:()AppStoreDaemon forKey:error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v8])
  {
    id v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:a5];
    BOOL v11 = v10 != 0;
    if (v10) {
      [a1 encodeObject:v10 forKey:v9];
    }
  }
  else
  {
    id v12 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = objc_opt_class();
      id v15 = v14;
      __int16 v16 = AMSHashIfNeeded();
      int v17 = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      uint64_t v20 = v16;
      _os_log_error_impl(&dword_19BF6A000, v12, OS_LOG_TYPE_ERROR, "[%{public}@]: Error encoding JSON object. object = %{public}@", (uint8_t *)&v17, 0x16u);
    }
    if (a5)
    {
      ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 507, @"Invalid JSON Object");
      BOOL v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

@end