@interface NSCoder(AppleMediaServices)
- (BOOL)_ams_encodeJSONObject:()AppleMediaServices forKey:error:;
- (BOOL)_ams_encodePropertyListObject:()AppleMediaServices forKey:format:error:;
- (id)_ams_decodeJSONObjectForKey:()AppleMediaServices error:;
- (id)_ams_decodePropertyListObjectForKey:()AppleMediaServices error:;
- (id)ams_decodeBase64EncodedDataForKey:()AppleMediaServices;
- (id)ams_decodeJSONArrayForKey:()AppleMediaServices;
- (id)ams_decodeJSONDictionaryForKey:()AppleMediaServices;
- (id)ams_decodePropertyListArrayForKey:()AppleMediaServices;
- (id)ams_decodePropertyListDictionaryForKey:()AppleMediaServices;
- (void)ams_encodeBase64EncodedData:()AppleMediaServices forKey:;
- (void)ams_encodeJSONArray:()AppleMediaServices forKey:;
- (void)ams_encodeJSONDictionary:()AppleMediaServices forKey:;
- (void)ams_encodePropertyListArray:()AppleMediaServices format:forKey:;
- (void)ams_encodePropertyListDictionary:()AppleMediaServices format:forKey:;
@end

@implementation NSCoder(AppleMediaServices)

- (id)_ams_decodePropertyListObjectForKey:()AppleMediaServices error:
{
  id v6 = a3;
  v7 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v6];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:a4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_ams_decodeJSONObjectForKey:()AppleMediaServices error:
{
  id v6 = a3;
  v7 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v6];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:a4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_ams_encodeJSONObject:()AppleMediaServices forKey:error:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v8])
  {
    v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:a5];
    BOOL v11 = v10 != 0;
    if (v10) {
      [a1 encodeObject:v10 forKey:v9];
    }
  }
  else
  {
    v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      v16 = AMSHashIfNeeded(v8);
      int v18 = 138543874;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      v21 = v15;
      __int16 v22 = 2114;
      v23 = v16;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Error encoding JSON object. object = %{public}@", (uint8_t *)&v18, 0x20u);
    }
    if (a5)
    {
      AMSError(3, @"Invalid JSON Object", @"Could not convert object to JSON.", 0);
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

- (BOOL)_ams_encodePropertyListObject:()AppleMediaServices forKey:format:error:
{
  id v10 = a4;
  BOOL v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:a5 options:0 error:a6];
  if (v11) {
    [a1 encodeObject:v11 forKey:v10];
  }

  return v11 != 0;
}

- (id)ams_decodeBase64EncodedDataForKey:()AppleMediaServices
{
  v4 = NSString;
  id v5 = a3;
  id v6 = objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_msgSend(v4, "classForKeyedUnarchiver"), v5);

  if (v6) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)ams_decodeJSONArrayForKey:()AppleMediaServices
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v15 = 0;
  id v5 = objc_msgSend(a1, "_ams_decodeJSONObjectForKey:error:", v4, &v15);
  id v6 = v15;
  if (v6)
  {
    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      BOOL v11 = AMSLogableError(v6);
      *(_DWORD *)buf = 138544130;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      __int16 v20 = 2114;
      id v21 = v4;
      __int16 v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Error decoding JSON array. key = %{public}@, error = %{public}@", buf, 0x2Au);
    }
  }
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (id)ams_decodeJSONDictionaryForKey:()AppleMediaServices
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v15 = 0;
  id v5 = objc_msgSend(a1, "_ams_decodeJSONObjectForKey:error:", v4, &v15);
  id v6 = v15;
  if (v6)
  {
    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      BOOL v11 = AMSLogableError(v6);
      *(_DWORD *)buf = 138544130;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      __int16 v20 = 2114;
      id v21 = v4;
      __int16 v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Error decoding JSON dictionary. key = %{public}@, error = %{public}@", buf, 0x2Au);
    }
  }
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (id)ams_decodePropertyListArrayForKey:()AppleMediaServices
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v15 = 0;
  id v5 = objc_msgSend(a1, "_ams_decodePropertyListObjectForKey:error:", v4, &v15);
  id v6 = v15;
  if (v6)
  {
    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      BOOL v11 = AMSLogableError(v6);
      *(_DWORD *)buf = 138544130;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      __int16 v20 = 2114;
      id v21 = v4;
      __int16 v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Error decoding property list array. key = %{public}@, error = %{public}@", buf, 0x2Au);
    }
  }
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (id)ams_decodePropertyListDictionaryForKey:()AppleMediaServices
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v15 = 0;
  id v5 = objc_msgSend(a1, "_ams_decodePropertyListObjectForKey:error:", v4, &v15);
  id v6 = v15;
  if (v6)
  {
    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      BOOL v11 = AMSLogableError(v6);
      *(_DWORD *)buf = 138544130;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      __int16 v20 = 2114;
      id v21 = v4;
      __int16 v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Error decoding property list dictionary. key = %{public}@, error = %{public}@", buf, 0x2Au);
    }
  }
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (void)ams_encodeBase64EncodedData:()AppleMediaServices forKey:
{
  id v6 = a4;
  id v7 = [a3 base64EncodedStringWithOptions:0];
  [a1 encodeObject:v7 forKey:v6];
}

- (void)ams_encodeJSONArray:()AppleMediaServices forKey:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v13 = 0;
  objc_msgSend(a1, "_ams_encodeJSONObject:forKey:error:", a3, v6, &v13);
  id v7 = v13;
  if (v7)
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      BOOL v11 = AMSLogKey();
      id v12 = AMSLogableError(v7);
      *(_DWORD *)buf = 138544130;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Error encoding JSON array. key = %{public}@, error = %{public}@", buf, 0x2Au);
    }
  }
}

- (void)ams_encodeJSONDictionary:()AppleMediaServices forKey:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v13 = 0;
  objc_msgSend(a1, "_ams_encodeJSONObject:forKey:error:", a3, v6, &v13);
  id v7 = v13;
  if (v7)
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      BOOL v11 = AMSLogKey();
      id v12 = AMSLogableError(v7);
      *(_DWORD *)buf = 138544130;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Error encoding JSON dictionary. key = %{public}@, error = %{public}@", buf, 0x2Au);
    }
  }
}

- (void)ams_encodePropertyListArray:()AppleMediaServices format:forKey:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v15 = 0;
  objc_msgSend(a1, "_ams_encodePropertyListObject:forKey:format:error:", a3, v8, a4, &v15);
  id v9 = v15;
  if (v9)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    BOOL v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      uint64_t v14 = AMSLogableError(v9);
      *(_DWORD *)buf = 138544130;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      id v19 = v13;
      __int16 v20 = 2114;
      id v21 = v8;
      __int16 v22 = 2114;
      v23 = v14;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Error encoding property list array. key = %{public}@, error = %{public}@", buf, 0x2Au);
    }
  }
}

- (void)ams_encodePropertyListDictionary:()AppleMediaServices format:forKey:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v15 = 0;
  objc_msgSend(a1, "_ams_encodePropertyListObject:forKey:format:error:", a3, v8, a4, &v15);
  id v9 = v15;
  if (v9)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    BOOL v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      uint64_t v14 = AMSLogableError(v9);
      *(_DWORD *)buf = 138544130;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      id v19 = v13;
      __int16 v20 = 2114;
      id v21 = v8;
      __int16 v22 = 2114;
      v23 = v14;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Error encoding property list dictionary. key = %{public}@, error = %{public}@", buf, 0x2Au);
    }
  }
}

@end