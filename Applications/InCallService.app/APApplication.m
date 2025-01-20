@interface APApplication
+ (BOOL)isPhoneAppLocked;
@end

@implementation APApplication

+ (BOOL)isPhoneAppLocked
{
  +[APApplication lockedAppBundleIdentifiers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = TUBundleIdentifierPhoneApplication;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isEqual:", v6, (void)v10))
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

@end