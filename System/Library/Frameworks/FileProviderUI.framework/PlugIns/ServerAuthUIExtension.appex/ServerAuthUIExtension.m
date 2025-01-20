void ServerAuthUIInitLogging()
{
  if (qword_10000D258 != -1) {
    dispatch_once(&qword_10000D258, &stru_100008350);
  }
}

void sub_1000028AC(id a1)
{
  serverAuthUILogHandle = (uint64_t)os_log_create("com.apple.FileProviderUI.ServerAuthUIExtension", "ServerAuthUI");

  _objc_release_x1();
}

void sub_1000034FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000035DC;
  v10[3] = &unk_100008378;
  id v11 = a3;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v8 = v5;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

void sub_1000035DC(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!*(void *)(a1 + 32))
  {
    v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 56) count]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = *(id *)(v1 + 56);
    id v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (!v5) {
      goto LABEL_23;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
    v25 = v4;
    uint64_t v26 = v1;
    uint64_t v24 = *(void *)v32;
    while (1)
    {
      id v8 = 0;
      id v27 = v6;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v8);
        v10 = objc_opt_new();
        objc_msgSend(v10, "setType:", objc_msgSend(v9, "unsignedIntegerValue"));
        if ([v10 type] == (id)1)
        {
          uint64_t v11 = *(void *)(v1 + 48);
          id v12 = *(void **)(v11 + 32);
          id v29 = 0;
          id v30 = 0;
          [v12 getUsername:&v30 password:&v29 forServerURL:*(void *)(v11 + 24)];
          id v13 = v30;
          id v14 = v29;
          v15 = +[NSURLComponents componentsWithURL:*(void *)(*(void *)(v1 + 48) + 24) resolvingAgainstBaseURL:0];
          v16 = [v15 user];
          id v17 = [v16 copy];

          if (v13 && v14)
          {
            if (v17 && ![v17 isEqualToString:v13])
            {
              id v20 = 0;
              v19 = v17;
              id v18 = v17;
            }
            else
            {
              id v18 = v13;
              v19 = v14;
              id v20 = v14;
            }
LABEL_19:
            id v23 = v19;
            v21 = v20;
            v22 = v18;
          }
          else
          {
            id v20 = 0;
            v21 = 0;
            v22 = 0;
            v19 = v17;
            id v18 = v17;
            if (v17) {
              goto LABEL_19;
            }
          }
          [v10 setUsername:v22];
          [v10 setPassword:v21];

          v4 = v25;
          uint64_t v1 = v26;
          uint64_t v7 = v24;
          id v6 = v27;
        }
        [v4 addObject:v10];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (!v6)
      {
LABEL_23:

        [*(id *)(v1 + 40) authenticationDelegate:*(void *)(v1 + 48) didReceiveCredentialDescriptors:v4];
        return;
      }
    }
  }
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(v1 + 48);

  objc_msgSend(v2, "authenticationDelegate:didEncounterError:", v3);
}

void sub_1000039DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000039F8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v8 = a1[4];
    if (v6)
    {
      [a1[4] authenticationDelegate:WeakRetained didEncounterError:v6];
    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100003B30;
      v9[3] = &unk_1000083C8;
      objc_copyWeak(&v12, a1 + 6);
      id v10 = a1[5];
      id v11 = v5;
      [v8 authenticationDelegate:WeakRetained didFinishWithError:0 completionHandler:v9];

      objc_destroyWeak(&v12);
    }
  }
}

void sub_100003B1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100003B30(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[4] storeCredentialsFromServerURL:*(void *)(a1 + 32)];
    [v3 _updateRecentServersListWithServer:*(void *)(a1 + 32)];
    if ([*(id *)(a1 + 40) length])
    {
      v4 = [@"com.apple.SMBClientProvider.FileProvider" stringByAppendingPathComponent:*(void *)(a1 + 40)];
      uint64_t v7 = FPUIAuthenticationProviderDomainIdentifier;
      id v8 = v4;
      id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    }
    else
    {
      id v5 = &__NSDictionary0__struct;
    }
    id v6 = [v3 extensionContext];
    [v6 completeRequestWithUserInfo:v5];
  }
}

void sub_100003EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003EC8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003FC0;
  v10[3] = &unk_100008440;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v8 = v6;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v13 = v7;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  objc_destroyWeak(&v14);
}

void sub_100003FC0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) firstObject];
  uint64_t v3 = *(void **)(a1 + 40);
  v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v6 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000040C8;
  v8[3] = &unk_100008418;
  id v7 = v2;
  id v9 = v7;
  objc_copyWeak(&v10, v4);
  [v3 authenticationDelegate:WeakRetained didFinishWithError:v6 completionHandler:v8];

  objc_destroyWeak(&v10);
}

void sub_1000040B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000040C8(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = objc_msgSend(@"com.apple.SMBClientProvider.FileProvider", "stringByAppendingPathComponent:");
    uint64_t v7 = FPUIAuthenticationProviderDomainIdentifier;
    id v8 = v2;
    uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateRecentServersListWithServer:WeakRetained[3]];
    uint64_t v6 = [v5 extensionContext];
    [v6 completeRequestWithUserInfo:v3];
  }
}

void sub_1000054E8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005508(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100005524(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "nil username or password", v1, 2u);
}

void sub_100005568(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  sub_1000054E8((void *)&_mh_execute_header, v2, v3, "Unexpected type %@ for password data", v4, v5, v6, v7, 2u);
}

void sub_1000055F4(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  sub_1000054E8((void *)&_mh_execute_header, v2, v3, "Unexpected type %@ for username", v4, v5, v6, v7, 2u);
}

void sub_100005680(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  sub_1000054E8((void *)&_mh_execute_header, v2, v3, "Unexpected item in keychain of type %@", v4, v5, v6, v7, 2u);
}

void sub_10000570C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005778(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000057E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLHostAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLHostAllowedCharacterSet];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_initialURL(void *a1, const char *a2, ...)
{
  return [a1 initialURL];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newManager(void *a1, const char *a2, ...)
{
  return [a1 newManager];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return [a1 user];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}