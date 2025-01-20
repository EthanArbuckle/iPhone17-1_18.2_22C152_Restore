@interface QuickTypeEvaluatorUtils
+ (BOOL)isMatchingRecipeLocale:(id)a3 withRecordLocale:(id)a4;
@end

@implementation QuickTypeEvaluatorUtils

+ (BOOL)isMatchingRecipeLocale:(id)a3 withRecordLocale:(id)a4
{
  id v21 = a4;
  v16 = +[NSLocale localeWithLocaleIdentifier:a3];
  v5 = [v16 languageCode];
  v6 = [v16 countryCode];
  v17 = +[NSLocale localeWithLocaleIdentifier:v21];
  v20 = [v17 languageCode];
  v18 = [v17 countryCode];
  if ([v5 isEqualToString:v20])
  {
    if (v6)
    {
      if (v18)
      {
        unsigned __int8 v7 = objc_msgSend(v6, "isEqualToString:");
      }
      else
      {
        +[NSLocale preferredLanguages];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v8)
        {
          int v9 = 0;
          uint64_t v10 = *(void *)v23;
          while (2)
          {
            v11 = 0;
            do
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(obj);
              }
              v12 = +[NSLocale localeWithLocaleIdentifier:*(void *)(*((void *)&v22 + 1) + 8 * (void)v11)];
              v13 = [v12 languageCode];
              v14 = [v12 countryCode];
              v9 |= [v5 isEqualToString:v13];
              if (v9 & 1) != 0 && ([v6 isEqualToString:v14])
              {

                goto LABEL_18;
              }

              v11 = (char *)v11 + 1;
            }
            while (v8 != v11);
            id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v8) {
              continue;
            }
            break;
          }
          unsigned __int8 v7 = v9 ^ 1;
        }
        else
        {
LABEL_18:
          unsigned __int8 v7 = 1;
        }
      }
    }
    else
    {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7 & 1;
}

@end