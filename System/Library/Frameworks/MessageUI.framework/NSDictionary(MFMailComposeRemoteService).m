@interface NSDictionary(MFMailComposeRemoteService)
- (id)mf_filterUsingMap:()MFMailComposeRemoteService inverse:;
@end

@implementation NSDictionary(MFMailComposeRemoteService)

- (id)mf_filterUsingMap:()MFMailComposeRemoteService inverse:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = [a1 allKeys];
  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v26;
    *(void *)&long long v8 = 138412546;
    long long v21 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(NSObject **)(*((void *)&v25 + 1) + 8 * i);
        v12 = objc_msgSend(v5, "objectForKey:", v11, v21);
        if (!v12)
        {
          v13 = MFLogGeneral();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v11;
            _os_log_impl(&dword_1AF945000, v13, OS_LOG_TYPE_DEFAULT, "#Warning Unexpected key (%@).", buf, 0xCu);
          }
          goto LABEL_23;
        }
        v13 = [a1 objectForKey:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v15 = MFLogGeneral();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = (objc_class *)objc_opt_class();
              v17 = NSStringFromClass(v16);
              *(_DWORD *)buf = v21;
              v30 = v13;
              __int16 v31 = 2112;
              v32 = v17;
              _os_log_impl(&dword_1AF945000, v15, OS_LOG_TYPE_DEFAULT, "#Warning Value (%@) of unexpected class (%@).", buf, 0x16u);
            }
LABEL_22:

LABEL_23:
            v18 = 0;
            goto LABEL_24;
          }
          v14 = [v13 mf_filterUsingMap:v12 inverse:a4];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [v12 transformValue:v13 inverse:a4];
          }
          else
          {
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v15 = MFLogGeneral();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                v19 = NSStringFromClass((Class)v12);
                *(_DWORD *)buf = v21;
                v30 = v13;
                __int16 v31 = 2112;
                v32 = v19;
                _os_log_impl(&dword_1AF945000, v15, OS_LOG_TYPE_DEFAULT, "#Warning Value (%@) of unexpected class (%@).", buf, 0x16u);
              }
              goto LABEL_22;
            }
            v14 = v13;
          }
        }
        v18 = v14;

        if (v18) {
          [v22 setObject:v18 forKey:v11];
        }
LABEL_24:
      }
      v6 = obj;
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v7);
  }

  return v22;
}

@end