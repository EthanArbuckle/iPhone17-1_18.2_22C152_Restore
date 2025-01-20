@interface _HKAppURLSpecification
+ (BOOL)isAtrialFibrillationEventURL:(id)a3;
+ (BOOL)isClinicalLoginRedirectURL:(id)a3;
+ (BOOL)isClinicalOnboardingURL:(id)a3;
+ (BOOL)parseClinicalLoginRedirectURL:(id)a3 resultHandler:(id)a4 errorHandler:(id)a5;
+ (BOOL)parseClinicalOnboardingURL:(id)a3 resultHandler:(id)a4 errorHandler:(id)a5;
@end

@implementation _HKAppURLSpecification

+ (BOOL)isClinicalOnboardingURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v4 setHost:@"provider-universal.health.apple.com"];
  [v4 setPath:@"/o"];
  [v4 setScheme:@"https"];
  v5 = [v4 URL];

  v6 = [v3 scheme];
  v7 = [v5 scheme];
  if (v6 != v7)
  {
    uint64_t v8 = [v5 scheme];
    if (!v8)
    {
      char v19 = 0;
      goto LABEL_15;
    }
    v9 = (void *)v8;
    v10 = [v3 scheme];
    v11 = [v5 scheme];
    if (![v10 isEqual:v11])
    {
      char v19 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v26 = v11;
    v27 = v10;
    v28 = v9;
  }
  v12 = [v3 host];
  v13 = [v12 lowercaseString];
  v14 = [v5 host];
  v15 = [v14 lowercaseString];
  if (v13 == v15)
  {
    char v19 = 1;
  }
  else
  {
    v25 = [v5 host];
    v16 = [v25 lowercaseString];
    if (v16)
    {
      v22 = [v3 host];
      v21 = [v22 lowercaseString];
      [v5 host];
      v17 = v24 = v12;
      [v17 lowercaseString];
      v18 = v23 = v13;
      char v19 = [v21 isEqual:v18];

      v13 = v23;
      v12 = v24;
    }
    else
    {
      char v19 = 0;
    }
  }
  v10 = v27;
  v9 = v28;
  v11 = v26;
  if (v6 != v7) {
    goto LABEL_14;
  }
LABEL_15:

  return v19;
}

+ (BOOL)parseClinicalOnboardingURL:(id)a3 resultHandler:(id)a4 errorHandler:(id)a5
{
  id v8 = a3;
  v9 = (uint64_t (**)(id, void *, void *, void *, void))a4;
  v10 = (uint64_t (**)(id, void *))a5;
  if ([a1 isClinicalOnboardingURL:v8])
  {
    v11 = objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", @"g");
    v12 = objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", @"b");
    v13 = objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", @"src");
    if (v11 && v12)
    {
      v14 = objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", @"f");
      char v15 = v9[2](v9, v11, v12, v13, [v14 isEqualToString:@"clinical-sharing"]);
    }
    else
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      v14 = HKSensitiveLogItem(v8);
      v18 = objc_msgSend(v17, "hk_error:format:", 3, @"Failed to parse onboarding URL: %@", v14);
      char v15 = v10[2](v10, v18);
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    v11 = HKSensitiveLogItem(v8);
    v12 = objc_msgSend(v16, "hk_error:format:", 3, @"Invalid onboarding URL: %@", v11);
    char v15 = v10[2](v10, v12);
  }

  return v15;
}

+ (BOOL)isClinicalLoginRedirectURL:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v51 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"code", @"state", 0);
  [MEMORY[0x1E4F1CAD0] setWithObject:@"error"];
  v49 = v48 = v5;
  v6 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:1];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v50 = v6;
  id v8 = [v6 queryItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v83 objects:v89 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v84;
    do
    {
      for (i = 0; i != (void *)v10; i = (char *)i + 1)
      {
        if (*(void *)v84 != v11) {
          objc_enumerationMutation(v8);
        }
        v12 = [*(id *)(*((void *)&v83 + 1) + 8 * i) name];
        [v7 addObject:v12];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v83 objects:v89 count:16];
    }
    while (v10);
  }

  if (([v51 isSubsetOfSet:v7] & 1) == 0 && !objc_msgSend(v49, "isSubsetOfSet:", v7))
  {
    BOOL v46 = 0;
    goto LABEL_60;
  }
  v13 = [v50 path];
  uint64_t v14 = [v13 length];

  if (!v14) {
    [v50 setPath:@"/"];
  }
  uint64_t v52 = [v50 URL];
  id v15 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v15 setHost:@"HealthProviderLogin"];
  [v15 setPath:@"/"];
  [v15 setScheme:@"x-argonaut-app"];
  v16 = [v15 URL];

  v88[0] = v16;
  id v17 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v17 setHost:@"redirect.health.apple.com"];
  v18 = [@"/" stringByAppendingPathComponent:@"HealthProviderLogin"];
  [v17 setPath:v18];

  [v17 setScheme:@"https"];
  char v19 = [v17 URL];

  v88[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v21 = v20;
  uint64_t v76 = [v21 countByEnumeratingWithState:&v79 objects:v87 count:16];
  if (!v76)
  {
    BOOL v46 = 0;
    v22 = (void *)v52;
    goto LABEL_58;
  }
  uint64_t v75 = *(void *)v80;
  v22 = (void *)v52;
  obuint64_t j = v21;
  while (2)
  {
    for (uint64_t j = 0; j != v76; ++j)
    {
      v24 = i;
      if (*(void *)v80 != v75) {
        objc_enumerationMutation(obj);
      }
      v25 = *(void **)(*((void *)&v79 + 1) + 8 * j);
      v26 = [v22 scheme];
      v27 = [v25 scheme];
      if (v26 != v27)
      {
        v20 = [v25 scheme];
        if (!v20)
        {
          v34 = v27;
          i = v24;
          goto LABEL_38;
        }
        v28 = [v22 scheme];
        v73 = [v25 scheme];
        v74 = v28;
        if (!objc_msgSend(v28, "isEqual:"))
        {
          i = v24;
          goto LABEL_37;
        }
      }
      v78 = v20;
      uint64_t v29 = [v22 port];
      uint64_t v30 = [v25 port];
      v31 = (void *)v30;
      v77 = (void *)v29;
      if (v29 == v30)
      {
        v69 = (void *)v30;
        v33 = v4;
        v32 = v72;
      }
      else
      {
        id v4 = [v25 port];
        if (!v4) {
          goto LABEL_36;
        }
        v24 = [v22 port];
        v32 = [v25 port];
        if (([v24 isEqual:v32] & 1) == 0)
        {
          v72 = v32;

LABEL_36:
          v34 = v26;
          v20 = v78;
          i = v24;
          if (v26 != v27)
          {
LABEL_37:

            v34 = v27;
          }
LABEL_38:

          continue;
        }
        v69 = v31;
        v33 = v4;
      }
      v67 = [v22 host];
      uint64_t v35 = [v67 lowercaseString];
      v66 = [v25 host];
      v70 = [v66 lowercaseString];
      v71 = (void *)v35;
      v72 = v32;
      if ((void *)v35 == v70)
      {
        v64 = v33;
        goto LABEL_32;
      }
      v63 = [v25 host];
      v62 = [v63 lowercaseString];
      id v4 = v33;
      if (v62)
      {
        v64 = v33;
        v59 = [v22 host];
        v36 = [v59 lowercaseString];
        v57 = [v25 host];
        [v57 lowercaseString];
        v56 = v58 = v36;
        v37 = v69;
        if (!objc_msgSend(v36, "isEqual:"))
        {
          char v68 = 0;
          i = v24;
          id v4 = v64;
          v45 = v77;
LABEL_45:

          goto LABEL_46;
        }
LABEL_32:
        v61 = [v22 path];
        uint64_t v38 = [v61 lowercaseString];
        v39 = [v25 path];
        v40 = [v39 lowercaseString];
        v60 = (void *)v38;
        if ((void *)v38 == v40)
        {
          char v68 = 1;
          i = v24;
          v45 = v77;
          v37 = v69;
        }
        else
        {
          v55 = [v25 path];
          v41 = [v55 lowercaseString];
          if (v41)
          {
            v54 = v41;
            v53 = [v22 path];
            v42 = [v53 lowercaseString];
            v43 = [v25 path];
            v44 = [v43 lowercaseString];
            char v68 = [v42 isEqual:v44];

            v22 = (void *)v52;
            v41 = v54;
          }
          else
          {
            char v68 = 0;
          }
          i = v24;
          v37 = v69;

          v45 = v77;
        }

        v32 = v72;
        id v4 = v64;
        if (v71 == v70) {
          goto LABEL_47;
        }
        goto LABEL_45;
      }
      char v68 = 0;
      v62 = 0;
      i = v24;
      v45 = v77;
      v37 = v69;
LABEL_46:

LABEL_47:
      if (v45 != v37)
      {
      }
      if (v26 == v27)
      {

        v20 = v78;
      }
      else
      {

        v20 = v78;
      }
      if (v68)
      {
        BOOL v46 = 1;
        id v21 = obj;
        goto LABEL_58;
      }
    }
    id v21 = obj;
    uint64_t v76 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
    if (v76) {
      continue;
    }
    break;
  }
  BOOL v46 = 0;
LABEL_58:

LABEL_60:
  return v46;
}

+ (BOOL)parseClinicalLoginRedirectURL:(id)a3 resultHandler:(id)a4 errorHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (uint64_t (**)(id, void *, uint64_t))a4;
  uint64_t v10 = (uint64_t (**)(id, void *, void))a5;
  if ([a1 isClinicalLoginRedirectURL:v8])
  {
    uint64_t v11 = objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", @"code");
    v12 = objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", @"state");
    if (v12)
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
      uint64_t v14 = (void *)v13;
      if (v11)
      {
        if (v13)
        {
          char v15 = v9[2](v9, v11, v13);
LABEL_9:
          char v17 = v15;
LABEL_12:

          goto LABEL_13;
        }
        uint64_t v14 = LABEL_8:;
        char v15 = v10[2](v10, v14, 0);
        goto LABEL_9;
      }
    }
    else
    {
      if (v11) {
        goto LABEL_8;
      }
      uint64_t v14 = 0;
    }
    v18 = objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", @"error");
    char v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_OAuth2_errorFromErrorValue:", v18);
    char v17 = ((uint64_t (**)(id, void *, void *))v10)[2](v10, v19, v14);

    goto LABEL_12;
  }
  v16 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = HKSensitiveLogItem(v8);
  v12 = objc_msgSend(v16, "hk_error:format:", 3, @"Invalid redirect URL: %@", v11);
  char v17 = v10[2](v10, v12, 0);
LABEL_13:

  return v17;
}

+ (BOOL)isAtrialFibrillationEventURL:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "_hk_urlForAtrialFibrillationEventType");
  char v6 = [v4 isEqual:v5];

  return v6;
}

@end