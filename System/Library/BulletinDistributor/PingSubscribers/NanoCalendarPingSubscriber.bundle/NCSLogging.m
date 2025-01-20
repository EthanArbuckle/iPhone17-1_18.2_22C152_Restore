@interface NCSLogging
+ (id)nanoPrivacyAwareDescriptionForCollection:(id)a3 expectedClass:(Class)a4;
@end

@implementation NCSLogging

+ (id)nanoPrivacyAwareDescriptionForCollection:(id)a3 expectedClass:(Class)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableString);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          v13 = [v12 nanoPrivacyAwareDescription];
          [v5 appendFormat:@"  <%@>,\n", v13];

          ++v9;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  v14 = +[NSString stringWithFormat:@"<%tu> [\n%@\n]", v9, v5, (void)v16];

  return v14;
}

@end