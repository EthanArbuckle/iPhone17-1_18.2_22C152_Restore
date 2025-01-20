@interface NSURL(AppleMediaServices_Project)
+ (id)ams_realHomeDirectory;
+ (uint64_t)_isAppendWithUnmodifiedParametersFeatureFlagEnabled;
- (id)ams_URLByAppendingQueryItems:()AppleMediaServices_Project preservingQueryEncoding:;
- (id)ams_URLByAppendingQueryParameter:()AppleMediaServices_Project name:;
- (id)ams_URLByAppendingQueryParameters:()AppleMediaServices_Project preservingQueryEncoding:;
- (id)ams_URLByDeletingTrailingSlash;
- (id)ams_URLByReplaceingQueryParameters:()AppleMediaServices_Project withEncodedParameters:;
- (id)ams_URLByReplacingQueryItems:()AppleMediaServices_Project withEncodedParameters:;
- (id)ams_URLByReplacingSchemeWithScheme:()AppleMediaServices_Project;
- (id)ams_URLBySortingQueryParameters;
- (id)ams_URLQueryAllowedCharacterSet;
- (id)ams_schemeSwizzledURL;
- (uint64_t)_sortedQueryItemsFromQueryItems:()AppleMediaServices_Project;
- (uint64_t)ams_URLByAppendingQueryParameters:()AppleMediaServices_Project;
- (uint64_t)ams_isBagLoadURL;
- (uint64_t)ams_isHTTP;
- (uint64_t)ams_isSecure;
@end

@implementation NSURL(AppleMediaServices_Project)

- (uint64_t)ams_isSecure
{
  v1 = [a1 scheme];
  uint64_t v2 = [v1 isEqualToString:@"https"];

  return v2;
}

- (uint64_t)ams_isBagLoadURL
{
  uint64_t v2 = [MEMORY[0x1E4F1CB10] URLWithString:0x1EDCAAD68];
  v3 = [MEMORY[0x1E4F1CB10] URLWithString:0x1EDCAAD88];
  v4 = [a1 host];
  v5 = [v2 host];
  int v6 = [v4 hasSuffix:v5];
  if (v6)
  {
    v7 = [a1 path];
    v8 = [v2 path];
    if ([v7 isEqualToString:v8])
    {
      uint64_t v9 = 1;
LABEL_9:

      goto LABEL_10;
    }
    v15 = v8;
    v17 = v7;
  }
  v10 = objc_msgSend(a1, "host", v15, v17);
  v11 = [v3 host];
  if ([v10 hasSuffix:v11])
  {
    v12 = [a1 path];
    v13 = [v3 path];
    uint64_t v9 = [v12 isEqualToString:v13];
  }
  else
  {
    uint64_t v9 = 0;
  }

  v8 = v16;
  v7 = v18;
  if (v6) {
    goto LABEL_9;
  }
LABEL_10:

  return v9;
}

+ (id)ams_realHomeDirectory
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sysconf(71);
  if (v3 == -1)
  {
    BOOL v4 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v5 = +[AMSLogConfig sharedConfig];
    int v6 = (void *)v5;
    if (v4)
    {
      if (!v5)
      {
        int v6 = +[AMSLogConfig sharedConfig];
      }
      v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = AMSLogKey();
        uint64_t v9 = NSString;
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = v10;
        if (v8)
        {
          uint64_t v1 = AMSLogKey();
          [v9 stringWithFormat:@"%@: [%@] ", v11, v1];
        }
        else
        {
          [v9 stringWithFormat:@"%@: ", v10];
        }
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        int v19 = *__error();
        LODWORD(buf.pw_name) = 138543618;
        *(char **)((char *)&buf.pw_name + 4) = v12;
        WORD2(buf.pw_passwd) = 1026;
        *(_DWORD *)((char *)&buf.pw_passwd + 6) = v19;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to query sysconf for buffer size using _SC_GETPW_R_SIZE_MAX. errno = %{public}d", (uint8_t *)&buf, 0x12u);
        if (v8)
        {

          v12 = (char *)v1;
        }
      }
      int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v13 = +[AMSLogConfig sharedConfig];
      [v6 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v13 userInfo:0];
    }
    else
    {
      if (!v5)
      {
        int v6 = +[AMSLogConfig sharedConfig];
      }
      v13 = [v6 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = AMSLogKey();
        v15 = NSString;
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = v16;
        if (v14)
        {
          uint64_t v1 = AMSLogKey();
          [v15 stringWithFormat:@"%@: [%@] ", v17, v1];
        }
        else
        {
          [v15 stringWithFormat:@"%@: ", v16];
        }
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        int v20 = *__error();
        LODWORD(buf.pw_name) = 138543618;
        *(char **)((char *)&buf.pw_name + 4) = v18;
        WORD2(buf.pw_passwd) = 1026;
        *(_DWORD *)((char *)&buf.pw_passwd + 6) = v20;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_FAULT, "%{public}@Failed to query sysconf for buffer size using _SC_GETPW_R_SIZE_MAX. errno = %{public}d", (uint8_t *)&buf, 0x12u);
        if (v14)
        {

          v18 = (char *)v1;
        }
      }
    }

    uint64_t v3 = 4096;
  }
  v21 = (char *)malloc_type_malloc(v3, 0x95827033uLL);
  if (v21)
  {
    memset(&buf, 0, sizeof(buf));
    v77 = 0;
    uid_t v22 = getuid();
    int v23 = getpwuid_r(v22, &buf, v21, v3, &v77);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__NSURL_AppleMediaServices_Project__ams_realHomeDirectory__block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v21;
    v75 = (void (**)(void))_Block_copy(aBlock);
    if (v23)
    {
      if (+[AMSUnitTests isRunningUnitTests])
      {
        v24 = +[AMSLogConfig sharedConfig];
        if (!v24)
        {
          v24 = +[AMSLogConfig sharedConfig];
        }
        v25 = [v24 OSLogObject];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = AMSLogKey();
          v27 = NSString;
          if (v26)
          {
            uint64_t v28 = objc_opt_class();
            a1 = AMSLogKey();
            [v27 stringWithFormat:@"%@: [%@] ", v28, a1];
          }
          else
          {
            [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v29 = };
          *(_DWORD *)v78 = 138544130;
          v79 = v29;
          __int16 v80 = 1026;
          uid_t v81 = v22;
          __int16 v82 = 2050;
          uint64_t v83 = v3;
          __int16 v84 = 1026;
          int v85 = v23;
          _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the real home directory path. getpwuid_r failed for UID %{public}d. bufferSize = %{public}zu | status = %{public}d", v78, 0x22u);
          if (v26)
          {

            v29 = (void *)a1;
          }
        }
        v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v42 = +[AMSLogConfig sharedConfig];
        [v41 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v42 userInfo:0];
      }
      else
      {
        v41 = +[AMSLogConfig sharedConfig];
        if (!v41)
        {
          v41 = +[AMSLogConfig sharedConfig];
        }
        v42 = [v41 OSLogObject];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          v43 = AMSLogKey();
          v44 = NSString;
          if (v43)
          {
            uint64_t v45 = objc_opt_class();
            a1 = AMSLogKey();
            [v44 stringWithFormat:@"%@: [%@] ", v45, a1];
          }
          else
          {
            [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v46 = };
          *(_DWORD *)v78 = 138544130;
          v79 = v46;
          __int16 v80 = 1026;
          uid_t v81 = v22;
          __int16 v82 = 2050;
          uint64_t v83 = v3;
          __int16 v84 = 1026;
          int v85 = v23;
          _os_log_impl(&dword_18D554000, v42, OS_LOG_TYPE_FAULT, "%{public}@Failed to get the real home directory path. getpwuid_r failed for UID %{public}d. bufferSize = %{public}zu | status = %{public}d", v78, 0x22u);
          if (v43)
          {

            v46 = (void *)a1;
          }
        }
      }
      goto LABEL_110;
    }
    if (v77)
    {
      if (buf.pw_dir)
      {
        v40 = objc_msgSend(NSString, "stringWithUTF8String:");
LABEL_111:
        v75[2]();

        goto LABEL_112;
      }
      if (+[AMSUnitTests isRunningUnitTests])
      {
        v54 = +[AMSLogConfig sharedConfig];
        if (!v54)
        {
          v54 = +[AMSLogConfig sharedConfig];
        }
        v55 = [v54 OSLogObject];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          v60 = AMSLogKey();
          v61 = NSString;
          if (v60)
          {
            uint64_t v62 = objc_opt_class();
            a1 = AMSLogKey();
            [v61 stringWithFormat:@"%@: [%@] ", v62, a1];
          }
          else
          {
            [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v63 = };
          *(_DWORD *)v78 = 138543618;
          v79 = v63;
          __int16 v80 = 1026;
          uid_t v81 = v22;
          _os_log_impl(&dword_18D554000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the real home directory path. getpwuid_r found a user for UID %{public}d, but pw_dir is NULL.", v78, 0x12u);
          if (v60)
          {

            v63 = (void *)a1;
          }
        }
LABEL_96:

        v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v42 = +[AMSLogConfig sharedConfig];
        [v41 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v42 userInfo:0];
LABEL_110:

        v40 = 0;
        goto LABEL_111;
      }
      v41 = +[AMSLogConfig sharedConfig];
      if (!v41)
      {
        v41 = +[AMSLogConfig sharedConfig];
      }
      v42 = [v41 OSLogObject];
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        goto LABEL_110;
      }
      v64 = AMSLogKey();
      v72 = NSString;
      if (v64)
      {
        uint64_t v73 = objc_opt_class();
        a1 = AMSLogKey();
        [v72 stringWithFormat:@"%@: [%@] ", v73, a1];
      }
      else
      {
        [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      v67 = };
      *(_DWORD *)v78 = 138543618;
      v79 = v67;
      __int16 v80 = 1026;
      uid_t v81 = v22;
      _os_log_impl(&dword_18D554000, v42, OS_LOG_TYPE_FAULT, "%{public}@Failed to get the real home directory path. getpwuid_r found a user for UID %{public}d, but pw_dir is NULL.", v78, 0x12u);
      if (v64)
      {

        v67 = (void *)a1;
      }
    }
    else
    {
      if (+[AMSUnitTests isRunningUnitTests])
      {
        v54 = +[AMSLogConfig sharedConfig];
        if (!v54)
        {
          v54 = +[AMSLogConfig sharedConfig];
        }
        v55 = [v54 OSLogObject];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          v56 = AMSLogKey();
          v57 = NSString;
          if (v56)
          {
            uint64_t v58 = objc_opt_class();
            a1 = AMSLogKey();
            [v57 stringWithFormat:@"%@: [%@] ", v58, a1];
          }
          else
          {
            [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v59 = };
          *(_DWORD *)v78 = 138543618;
          v79 = v59;
          __int16 v80 = 1026;
          uid_t v81 = v22;
          _os_log_impl(&dword_18D554000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the real home directory path. getpwuid_r did not find a user for UID %{public}d.", v78, 0x12u);
          if (v56)
          {

            v59 = (void *)a1;
          }
        }
        goto LABEL_96;
      }
      v41 = +[AMSLogConfig sharedConfig];
      if (!v41)
      {
        v41 = +[AMSLogConfig sharedConfig];
      }
      v42 = [v41 OSLogObject];
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        goto LABEL_110;
      }
      v64 = AMSLogKey();
      v65 = NSString;
      if (v64)
      {
        uint64_t v66 = objc_opt_class();
        a1 = AMSLogKey();
        [v65 stringWithFormat:@"%@: [%@] ", v66, a1];
      }
      else
      {
        [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      v67 = };
      *(_DWORD *)v78 = 138543618;
      v79 = v67;
      __int16 v80 = 1026;
      uid_t v81 = v22;
      _os_log_impl(&dword_18D554000, v42, OS_LOG_TYPE_FAULT, "%{public}@Failed to get the real home directory path. getpwuid_r did not find a user for UID %{public}d.", v78, 0x12u);
      if (v64)
      {

        v67 = (void *)a1;
      }
    }

    goto LABEL_110;
  }
  BOOL v30 = +[AMSUnitTests isRunningUnitTests];
  uint64_t v31 = +[AMSLogConfig sharedConfig];
  v32 = (void *)v31;
  if (v30)
  {
    if (!v31)
    {
      v32 = +[AMSLogConfig sharedConfig];
    }
    v33 = [v32 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = AMSLogKey();
      v35 = NSString;
      uint64_t v36 = objc_opt_class();
      uint64_t v37 = v36;
      if (v34)
      {
        v38 = AMSLogKey();
        v39 = [v35 stringWithFormat:@"%@: [%@] ", v37, v38];
      }
      else
      {
        v39 = [v35 stringWithFormat:@"%@: ", v36];
        v38 = v39;
      }
      int v68 = *__error();
      LODWORD(buf.pw_name) = 138543874;
      *(char **)((char *)&buf.pw_name + 4) = v39;
      WORD2(buf.pw_passwd) = 2050;
      *(char **)((char *)&buf.pw_passwd + 6) = (char *)v3;
      HIWORD(buf.pw_gid) = 1026;
      LODWORD(buf.pw_change) = v68;
      _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to allocate buffer for getpwuid_r(). bufferSize = %{public}zu, errno = %{public}d", (uint8_t *)&buf, 0x1Cu);
      if (v34) {
    }
      }
    v69 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v70 = +[AMSLogConfig sharedConfig];
    [v69 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v70 userInfo:0];
  }
  else
  {
    if (!v31)
    {
      v32 = +[AMSLogConfig sharedConfig];
    }
    v47 = [v32 OSLogObject];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
    {
      v48 = AMSLogKey();
      v49 = NSString;
      uint64_t v50 = objc_opt_class();
      uint64_t v51 = v50;
      if (v48)
      {
        v52 = AMSLogKey();
        v53 = [v49 stringWithFormat:@"%@: [%@] ", v51, v52];
      }
      else
      {
        v53 = [v49 stringWithFormat:@"%@: ", v50];
        v52 = v53;
      }
      int v71 = *__error();
      LODWORD(buf.pw_name) = 138543874;
      *(char **)((char *)&buf.pw_name + 4) = v53;
      WORD2(buf.pw_passwd) = 2050;
      *(char **)((char *)&buf.pw_passwd + 6) = (char *)v3;
      HIWORD(buf.pw_gid) = 1026;
      LODWORD(buf.pw_change) = v71;
      _os_log_impl(&dword_18D554000, v47, OS_LOG_TYPE_FAULT, "%{public}@Failed to allocate buffer for getpwuid_r(). bufferSize = %{public}zu, errno = %{public}d", (uint8_t *)&buf, 0x1Cu);
      if (v48) {
    }
      }
  }
  v40 = 0;
LABEL_112:
  return v40;
}

- (id)ams_URLBySortingQueryParameters
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  uint64_t v3 = [v2 percentEncodedQueryItems];
  if ([v3 count])
  {
    BOOL v4 = [a1 _sortedQueryItemsFromQueryItems:v3];
    [v2 setPercentEncodedQueryItems:v4];

    uint64_t v5 = [a1 fragment];
    if (v5
      && (int v6 = (void *)v5,
          [a1 fragment],
          v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 isEqualToString:&stru_1EDCA7308],
          v7,
          v6,
          (v8 & 1) == 0))
    {
      uint64_t v10 = [a1 fragment];
      [v2 setFragment:v10];
    }
    else
    {
      [v2 setFragment:0];
    }
    uint64_t v11 = [v2 URL];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = a1;
    }
    id v9 = v13;
  }
  else
  {
    id v9 = a1;
  }

  return v9;
}

- (uint64_t)_sortedQueryItemsFromQueryItems:()AppleMediaServices_Project
{
  return [a3 sortedArrayUsingComparator:&__block_literal_global_151];
}

- (uint64_t)ams_isHTTP
{
  uint64_t v2 = [a1 scheme];
  if ([v2 isEqualToString:@"http"])
  {
    uint64_t v3 = 1;
  }
  else
  {
    BOOL v4 = [a1 scheme];
    uint64_t v3 = [v4 isEqualToString:@"https"];
  }
  return v3;
}

- (id)ams_schemeSwizzledURL
{
  id v1 = a1;
  uint64_t v2 = [v1 scheme];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDD019F0];
  BOOL v4 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDD01A08];
  if ([v3 containsObject:v2])
  {
    uint64_t v5 = @"http";
  }
  else
  {
    if (![v4 containsObject:v2]) {
      goto LABEL_6;
    }
    uint64_t v5 = @"https";
  }
  int v6 = [v1 absoluteString];
  v7 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v2, "length"));
  char v8 = [(__CFString *)v5 stringByAppendingString:v7];

  uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];

  id v1 = (id)v9;
LABEL_6:

  return v1;
}

- (id)ams_URLQueryAllowedCharacterSet
{
  if (qword_1EB38E178 != -1) {
    dispatch_once(&qword_1EB38E178, &__block_literal_global_151);
  }
  v0 = (void *)_MergedGlobals_162;
  return v0;
}

- (id)ams_URLByAppendingQueryParameter:()AppleMediaServices_Project name:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12 = a4;
  v13[0] = a3;
  int v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];

  uint64_t v10 = objc_msgSend(a1, "ams_URLByAppendingQueryParameters:", v9);

  return v10;
}

- (uint64_t)ams_URLByAppendingQueryParameters:()AppleMediaServices_Project
{
  return objc_msgSend(a1, "ams_URLByAppendingQueryParameters:preservingQueryEncoding:", a3, 0);
}

- (id)ams_URLByAppendingQueryParameters:()AppleMediaServices_Project preservingQueryEncoding:
{
  int v6 = objc_msgSend(a3, "ams_arrayUsingTransform:", &__block_literal_global_130);
  id v7 = objc_msgSend(a1, "ams_URLByAppendingQueryItems:preservingQueryEncoding:", v6, a4);

  return v7;
}

- (id)ams_URLByAppendingQueryItems:()AppleMediaServices_Project preservingQueryEncoding:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [MEMORY[0x1E4F1CB10] _isAppendWithUnmodifiedParametersFeatureFlagEnabled];
  v35 = a1;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  v34 = v8;
  if (v7 & 1) != 0 || (a4) {
    goto LABEL_6;
  }
  uint64_t v9 = +[AMSProcessInfo currentProcess];
  uint64_t v10 = [v9 bundleIdentifier];
  if ([v10 isEqualToString:@"com.apple.Music"])
  {

LABEL_6:
    v14 = [v8 percentEncodedQueryItems];
    uint64_t v15 = 1;
    goto LABEL_7;
  }
  uint64_t v11 = +[AMSProcessInfo currentProcess];
  v12 = [v11 bundleIdentifier];
  int v13 = [v12 isEqualToString:@"com.apple.TVMusic"];

  if (v13) {
    goto LABEL_6;
  }
  v14 = [v8 queryItems];
  uint64_t v15 = 0;
LABEL_7:
  uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  if (v14) {
    uint64_t v16 = v14;
  }
  id v17 = v16;

  v33 = v17;
  v18 = objc_msgSend(v17, "ams_filterUsingTest:", &__block_literal_global_140);
  int v19 = (void *)[v18 mutableCopy];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  uint64_t v20 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (v15)
        {
          v25 = (void *)MEMORY[0x1E4F290C8];
          v26 = [*(id *)(*((void *)&v37 + 1) + 8 * i) name];
          v27 = [v24 value];
          uint64_t v28 = objc_msgSend(v35, "ams_URLQueryAllowedCharacterSet");
          v29 = [v27 stringByAddingPercentEncodingWithAllowedCharacters:v28];
          BOOL v30 = [v25 queryItemWithName:v26 value:v29];

          [v19 addObject:v30];
        }
        else
        {
          [v19 addObject:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v21);
  }

  uint64_t v31 = objc_msgSend(v35, "ams_URLByReplacingQueryItems:withEncodedParameters:", v19, v15);

  return v31;
}

- (id)ams_URLByDeletingTrailingSlash
{
  uint64_t v2 = [a1 absoluteString];
  if ([v2 hasSuffix:@"/"])
  {
    uint64_t v3 = objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") - 1);
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    id v4 = a1;
  }

  return v4;
}

- (id)ams_URLByReplacingSchemeWithScheme:()AppleMediaServices_Project
{
  id v4 = a3;
  uint64_t v5 = [a1 absoluteString];
  id v6 = [a1 scheme];
  char v7 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
  id v8 = [v4 stringByAppendingString:v7];

  uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];

  return v9;
}

- (id)ams_URLByReplaceingQueryParameters:()AppleMediaServices_Project withEncodedParameters:
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__NSURL_AppleMediaServices_Project__ams_URLByReplaceingQueryParameters_withEncodedParameters___block_invoke;
  v12[3] = &unk_1E55A2E38;
  id v13 = v8;
  id v9 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v10 = objc_msgSend(a1, "ams_URLByReplacingQueryItems:withEncodedParameters:", v9, a4);

  return v10;
}

- (id)ams_URLByReplacingQueryItems:()AppleMediaServices_Project withEncodedParameters:
{
  id v6 = (objc_class *)MEMORY[0x1E4F29088];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithURL:a1 resolvingAgainstBaseURL:0];
  id v9 = v8;
  if (a4) {
    [v8 setPercentEncodedQueryItems:v7];
  }
  else {
    [v8 setQueryItems:v7];
  }

  uint64_t v10 = [v9 URL];

  return v10;
}

+ (uint64_t)_isAppendWithUnmodifiedParametersFeatureFlagEnabled
{
  return _os_feature_enabled_impl();
}

@end