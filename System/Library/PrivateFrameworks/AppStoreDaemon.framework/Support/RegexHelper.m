@interface RegexHelper
+ (id)matchURL:(id)a3 toPatterns:(id)a4;
@end

@implementation RegexHelper

+ (id)matchURL:(id)a3 toPatterns:(id)a4
{
  id v18 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a4;
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v22;
    *(void *)&long long v6 = 138543362;
    long long v17 = v6;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v20 = 0;
        v10 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v9, 1, &v20, v17);
        id v11 = v20;
        if (v11)
        {
          v12 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            id v26 = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error parsing regex: %{public}@", buf, 0xCu);
          }
        }
        else
        {
          v13 = [v18 absoluteString];
          v14 = [v18 absoluteString];
          id v15 = objc_msgSend(v10, "numberOfMatchesInString:options:range:", v13, 2, 0, objc_msgSend(v14, "length"));

          if (v15)
          {
            id v5 = v9;

            goto LABEL_15;
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v5;
}

@end