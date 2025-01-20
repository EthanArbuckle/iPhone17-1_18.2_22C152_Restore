id sub_275C(id result, void *a2, uint64_t a3)
{
  void *v3;
  uint64_t v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  if (a2)
  {
    v3 = result;
    if (result)
    {
      if (a3)
      {
        v5 = IDSAccountKeyForServerKey();
        result = [a2 objectForKey:v5];
        if (result)
        {
          v6 = result;
          v7 = +[IMRGLog registration];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v8 = 138412802;
            v9 = v6;
            v10 = 2112;
            v11 = v5;
            v12 = 2112;
            v13 = [v3 identifier];
            _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "   * Setting %@ for key %@  on accountIdentifier: %@", (uint8_t *)&v8, 0x20u);
          }
          return [v3 setAccountProperty:v6 forKey:v5];
        }
      }
    }
  }
  return result;
}

void sub_2864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = +[IMRGLog registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    uint64_t v13 = a2;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Saved account: %@  (error %@  objectID: %@)", (uint8_t *)&v8, 0x20u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_2A38(uint64_t a1)
{
  v2 = dispatch_group_create();
  v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", ACAccountTypeIdentifierIdentityServices, 0);
  uint64_t v4 = IDSAuthenticationDictionaryKeyIDSDelegate;
  id v5 = [*(id *)(a1 + 32) objectForKey:IDSAuthenticationDictionaryKeyIDSDelegate];
  if (v5)
  {
    id v6 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = [(NSArray *)v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        __int16 v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(a1 + 40) _storeAccountForServiceType:*(void *)(*((void *)&v26 + 1) + 8 * (void)v10) accountStore:*(void *)(a1 + 48) parameters:v6 group:v2 completion:*(void *)(a1 + 56)];
          __int16 v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSArray *)v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v8);
    }
    IDSParseAuthDictionaryForServiceData();
    uint64_t v11 = (void *)IDSAccountPropertiesFromAuthenticationDictionary();
    uint64_t v12 = IDSAuthenticationDictionaryKeyAppleID;
    [v11 objectForKey:IDSAuthenticationDictionaryKeyAppleID];
    uint64_t v13 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v14 = objc_msgSend(objc_msgSend(v11, "objectForKey:", IDSAuthenticationDictionaryKeySelfHandle), "objectForKey:", @"uri");
    id v15 = objc_alloc_init((Class)NSMutableArray);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_2E60;
    v25[3] = &unk_4208;
    v25[4] = v15;
    id v16 = objc_msgSend(objc_msgSend(v11, "objectForKey:", IDSAuthenticationDictionaryKeyHandles), "__imArrayByApplyingBlock:", v25);
    id v17 = [v11 objectForKey:IDSAuthenticationDictionaryKeyProfileID];
    if (v17) {
      CFDictionarySetValue(v13, kIDSServiceDefaultsAuthorizationIDKey, v17);
    }
    id v18 = [v11 objectForKey:v12];
    if (v18) {
      CFDictionarySetValue(v13, kIDSServiceDefaultsAppleIDKey, v18);
    }
    if ([v14 length] && v14) {
      CFDictionarySetValue(v13, kIDSServiceDefaultsSelfHandleKey, v14);
    }
    if ([v15 count])
    {
      id v19 = [v15 copy];
      if (v19) {
        CFDictionarySetValue(v13, kIDSServiceDefaultsInvisibleAliasesKey, v19);
      }
    }
    if ([v16 count] && v16) {
      CFDictionarySetValue(v13, kIDSServiceDefaultsVettedAliasesKey, v16);
    }
    id v20 = [(__CFDictionary *)v13 count];
    v21 = +[IMRGLog registration];
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412290;
        v31 = v13;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "   Updating with dictionary: %@", buf, 0xCu);
      }
      IDSiCloudUpdate();
    }
    else if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "   Nothing to update, moving along", buf, 2u);
    }
  }
  else
  {
    v23 = +[IMRGLog warning];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_2F68(v4, v23);
    }
  }
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v24 = +[IMRGLog registration];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "IDSAuthenticationDelegatePlugin - didReceiveAuthenticationResponseParameters done", buf, 2u);
  }
}

id sub_2E60(uint64_t a1, void *a2)
{
  id v4 = objc_msgSend(objc_msgSend(a2, "objectForKey:", @"uri"), "_stripFZIDPrefix");
  unsigned int v5 = objc_msgSend(objc_msgSend(a2, "objectForKey:", @"status"), "intValue");
  id v6 = [a2 objectForKey:@"is-user-visible"];
  if (v6 && ([v6 BOOLValue] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v4];
  }
  if (v5 == 5051) {
    return v4;
  }
  else {
    return 0;
  }
}

void sub_2EF0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "No account type associated with serviceType, %@", (uint8_t *)&v2, 0xCu);
}

void sub_2F68(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Missing necessary setup parameters for service type %@", (uint8_t *)&v2, 0xCu);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

uint64_t IDSAccountKeyForServerKey()
{
  return _IDSAccountKeyForServerKey();
}

uint64_t IDSAccountPropertiesFromAuthenticationDictionary()
{
  return _IDSAccountPropertiesFromAuthenticationDictionary();
}

uint64_t IDSAuthenticationDelegatePrintLoginDelegatesBag()
{
  return _IDSAuthenticationDelegatePrintLoginDelegatesBag();
}

uint64_t IDSParseAuthDictionaryForServiceData()
{
  return _IDSParseAuthDictionaryForServiceData();
}

uint64_t IDSiCloudUpdate()
{
  return _IDSiCloudUpdate();
}

uint64_t IMSingleObjectArray()
{
  return _IMSingleObjectArray();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_release(dispatch_object_t object)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

void objc_enumerationMutation(id obj)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__stripFZIDPrefix(void *a1, const char *a2, ...)
{
  return [a1 _stripFZIDPrefix];
}

id objc_msgSend_accountProperties(void *a1, const char *a2, ...)
{
  return [a1 accountProperties];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_registration(void *a1, const char *a2, ...)
{
  return [a1 registration];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_warning(void *a1, const char *a2, ...)
{
  return [a1 warning];
}
d)(v76 + 1) != v74);
        v74 = [obj countByEnumeratingWithState:&v85 objects:v105 count:16];
      }
      while (v74);
    }
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v52 = (char *)[v69 countByEnumeratingWithState:&v77 objects:v89 count:16];
    if (v52)
    {
      v53 = v52;
      v54 = *(void *)v78;
      do
      {
        for (j = 0; j != v53; ++j)
        {
          if (*(void *)v78 != v54) {
            objc_enumerationMutation(v69);
          }
          objc_msgSend(v60, "saveAccount:pid:verify:dataclassActions:completion:");
        }
        v53 = (char *)[v69 countByEnumeratingWithState:&v77 objects:v89 count:16];
      }
      while (v53);
    }
  }
  else
  {
    v56 = +[IMRGLog warning];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_2EF0((uint64_t)a3, v56);
    }
  }
}

- (void)didReceiveAuthenticationResponseParameters:(id)a3 accountStore:(id)a4 completion:(id)a5
{
  uint64_t v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "IDSAuthenticationDelegatePlugin received parameters", buf, 2u);
  }
  IDSAuthenticationDelegatePrintLoginDelegatesBag();
  id v10 = [a5 copy];
  global_queue = dispatch_get_global_queue(0, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2A38;
  v12[3] = &unk_4230;
  v12[4] = a3;
  v12[5] = self;
  v12[6] = a4;
  v12[7] = v10;
  dispatch_async(global_queue, v12);
}

@end