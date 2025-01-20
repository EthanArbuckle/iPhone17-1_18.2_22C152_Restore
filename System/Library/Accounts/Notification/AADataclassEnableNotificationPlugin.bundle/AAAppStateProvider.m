@interface AAAppStateProvider
+ (id)appStateForBundleID:(id)a3;
@end

@implementation AAAppStateProvider

+ (id)appStateForBundleID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F01878]);
    uint64_t v18 = 0;
    v6 = objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v4, v5, (uint64_t)v3, 1, &v18);
    uint64_t v9 = (uint64_t)v6;
    if (v6)
    {
      v10 = objc_msgSend_applicationState(v6, v7, v8);
      uint64_t isRestricted = objc_msgSend_isRestricted(v10, v11, v12);

      uint64_t v9 = 1;
    }
    else
    {
      uint64_t isRestricted = 0;
    }
  }
  else
  {
    uint64_t isRestricted = 0;
    uint64_t v9 = 0;
  }
  v14 = [AAAppState alloc];
  v16 = objc_msgSend_initWithInstalled_isRestricted_(v14, v15, v9, isRestricted);

  return v16;
}

@end