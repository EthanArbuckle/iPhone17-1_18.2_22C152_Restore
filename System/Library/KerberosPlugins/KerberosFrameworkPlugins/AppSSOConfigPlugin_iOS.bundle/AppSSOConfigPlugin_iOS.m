uint64_t sub_2A08()
{
  NSObject *v0;

  v0 = sub_3290();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_3350();
  }

  return 0;
}

void sub_2A50()
{
  v0 = sub_3290();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_3384();
  }
}

uint64_t sub_2A94(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, id))
{
  v7 = sub_3290();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_3504();
  }

  uint64_t v9 = 2529639161;
  v10 = +[SOKerberosHeimdalPluginSettings retrieveAllCurrentSettings];
  v11 = sub_3290();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_34BC(buf, (uint64_t)[v10 count], v11);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v16, "isDefaultRealm", (void)v21))
        {
          id v17 = [v16 realm];

          if (v17)
          {
            v18 = sub_3290();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              sub_3444((uint64_t)v17, v18);
            }

            id v17 = v17;
            a4(a1, a3, [v17 UTF8String]);
            uint64_t v9 = 0;
          }
          goto LABEL_18;
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v17 = 0;
LABEL_18:

  v19 = sub_3290();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_33B8();
  }

  return v9;
}

void sub_2CCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint8_t buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v17 = objc_begin_catch(exception_object);
      v18 = sub_3290();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = [v17 description];
        sub_33EC(v19, &buf, v18);
      }

      objc_end_catch();
      JUMPOUT(0x2C54);
    }
    objc_begin_catch(exception_object);
    JUMPOUT(0x2C58);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, id))
{
  uint64_t v28 = a4;
  v29 = a5;
  uint64_t v27 = a1;
  v5 = sub_3290();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_365C();
  }

  v6 = +[NSString stringWithCString:a2 encoding:4];
  v7 = +[SOKerberosHeimdalPluginSettings retrieveAllCurrentSettings];
  v8 = sub_3290();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_34BC(buf, (uint64_t)[v7 count], v8);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (!v9)
  {

LABEL_37:
    id v23 = 0;
    uint64_t v24 = 2529639161;
    goto LABEL_38;
  }
  id v31 = v9;
  id v10 = 0;
  id v42 = 0;
  uint64_t v33 = *(void *)v52;
  do
  {
    for (i = 0; i != v31; i = (char *)i + 1)
    {
      if (*(void *)v52 != v33) {
        objc_enumerationMutation(obj);
      }
      v11 = objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * i), "domainRealmMapping", v27, v28, v29);
      v38 = v11;
      if (v11)
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v36 = [v11 allKeys];
        id v39 = [v36 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v39)
        {
          uint64_t v37 = *(void *)v48;
          do
          {
            for (j = 0; j != v39; j = (char *)j + 1)
            {
              if (*(void *)v48 != v37) {
                objc_enumerationMutation(v36);
              }
              v41 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
              id v12 = objc_msgSend(v38, "objectForKeyedSubscript:");
              long long v45 = 0u;
              long long v46 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              id v13 = v12;
              id v14 = [v13 countByEnumeratingWithState:&v43 objects:v55 count:16];
              if (v14)
              {
                uint64_t v15 = *(void *)v44;
                do
                {
                  for (k = 0; k != v14; k = (char *)k + 1)
                  {
                    if (*(void *)v44 != v15) {
                      objc_enumerationMutation(v13);
                    }
                    id v17 = *(void **)(*((void *)&v43 + 1) + 8 * (void)k);
                    v18 = [v6 lowercaseString];
                    v19 = [v17 lowercaseString];
                    if ([v18 hasSuffix:v19])
                    {
                      BOOL v20 = [v17 length] > v10;

                      if (v20)
                      {
                        id v21 = v41;

                        id v10 = [v17 length];
                        id v42 = v21;
                      }
                    }
                    else
                    {
                    }
                  }
                  id v14 = [v13 countByEnumeratingWithState:&v43 objects:v55 count:16];
                }
                while (v14);
              }
            }
            id v39 = [v36 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v39);
        }
      }
    }
    id v31 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  }
  while (v31);

  if (!v42) {
    goto LABEL_37;
  }
  long long v22 = sub_3290();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_35D4((uint64_t)v42, (uint64_t)v6, v22);
  }

  id v23 = v42;
  v29(v27, v28, [v23 UTF8String]);
  uint64_t v24 = 0;
LABEL_38:

  v25 = sub_3290();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_3538();
  }

  return v24;
}

id sub_3290()
{
  if (qword_8098 != -1) {
    dispatch_once(&qword_8098, &stru_4138);
  }
  v0 = (void *)qword_80A0;

  return v0;
}

void sub_32E4(id a1)
{
  qword_80A0 = (uint64_t)os_log_create("com.apple.AppSSO", "AppSSOConfigPlugin");

  _objc_release_x1();
}

void sub_3328(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_3350()
{
  sub_3344();
  sub_3328(&dword_0, v0, v1, "************ kerberos config plugin config_init ************", v2, v3, v4, v5, v6);
}

void sub_3384()
{
  sub_3344();
  sub_3328(&dword_0, v0, v1, "************ kerberos config plugin config_fini ************", v2, v3, v4, v5, v6);
}

void sub_33B8()
{
  sub_3344();
  sub_3328(&dword_0, v0, v1, "************ end kerberos config plugin get_default_realm ************", v2, v3, v4, v5, v6);
}

void sub_33EC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "exception in plugin for defaault realm: %{public}@", buf, 0xCu);
}

void sub_3444(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "returning default realm: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_34BC(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "found %lu profiles", buf, 0xCu);
}

void sub_3504()
{
  sub_3344();
  sub_3328(&dword_0, v0, v1, "************ kerberos config plugin get_default_realm ************", v2, v3, v4, v5, v6);
}

void sub_3538()
{
  sub_3344();
  sub_3328(&dword_0, v0, v1, "************ end kerberos config plugin get_host_domain ************", v2, v3, v4, v5, v6);
}

void sub_356C(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "exception in plugin for host: %{public}s, %{public}@", buf, 0x16u);
}

void sub_35D4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "returning realm: %{public}@ for host: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_365C()
{
  sub_3344();
  sub_3328(&dword_0, v0, v1, "************ kerberos config plugin get_host_domain ************", v2, v3, v4, v5, v6);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domainRealmMapping(void *a1, const char *a2, ...)
{
  return [a1 domainRealmMapping];
}

id objc_msgSend_isDefaultRealm(void *a1, const char *a2, ...)
{
  return [a1 isDefaultRealm];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_realm(void *a1, const char *a2, ...)
{
  return [a1 realm];
}

id objc_msgSend_retrieveAllCurrentSettings(void *a1, const char *a2, ...)
{
  return [a1 retrieveAllCurrentSettings];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}