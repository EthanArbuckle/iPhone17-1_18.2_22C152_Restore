@interface TKHostKeychainOperations
- (BOOL)updateForTokenID:(id)a3 items:(id)a4;
- (id)query:(id)a3;
@end

@implementation TKHostKeychainOperations

- (id)query:(id)a3
{
  id v3 = [a3 mutableCopy];
  [v3 setObject:kSecMatchLimitAll forKeyedSubscript:kSecMatchLimit];
  CFTypeRef result = 0;
  OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
  if (v4)
  {
    int v5 = v4;
    v6 = sub_10000D068();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000148AC((uint64_t)v3, v5, v6);
    }

    v7 = 0;
  }
  else
  {
    v7 = (id)result;
  }

  return v7;
}

- (BOOL)updateForTokenID:(id)a3 items:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_os_feature_enabled_impl())
  {
    v17[0] = kSecAttrAccessGroupToken;
    v17[1] = @"com.apple.identities";
    v7 = +[NSArray arrayWithObjects:v17 count:2];
    if (!v7) {
      goto LABEL_9;
    }
  }
  else
  {
    v7 = &off_1000215D0;
  }
  int updated = SecItemUpdateTokenItemsForAccessGroups();
  if (!updated)
  {
LABEL_9:
    BOOL v11 = 1;
    goto LABEL_10;
  }
  int v9 = updated;
  v10 = sub_10000D068();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543618;
    id v14 = v5;
    __int16 v15 = 1024;
    int v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Failed to update keychain with token items of token %{public}@ - error %d", (uint8_t *)&v13, 0x12u);
  }

  BOOL v11 = 0;
LABEL_10:

  return v11;
}

@end