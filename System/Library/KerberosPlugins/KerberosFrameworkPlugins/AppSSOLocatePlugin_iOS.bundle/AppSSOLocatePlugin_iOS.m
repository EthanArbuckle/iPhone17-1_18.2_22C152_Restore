uint64_t sub_2D88(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t result;

  v4 = sub_3350();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_342C();
  }

  v5 = malloc_type_calloc(1uLL, 0x10uLL, 0xA0040BD48D6D6uLL);
  if (!v5) {
    return 12;
  }
  v6 = v5;
  result = 0;
  v6[1] = a1;
  *a2 = v6;
  return result;
}

void sub_2E14(void *a1)
{
  v2 = sub_3350();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_3460();
  }

  free(a1);
}

uint64_t sub_2E64(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, id), uint64_t a8)
{
  v10 = sub_3350();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_377C();
  }

  v11 = sub_3350();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_36F4(a1, v11);
  }

  unsigned int v57 = -1765328135;
  v12 = +[NSString stringWithCString:a4 encoding:4];
  v58 = [v12 uppercaseString];

  id v66 = 0;
  v13 = +[SOKerberosHeimdalPluginSettings retrieveCurrentSettingsForRealm:v58 error:&v66];
  id v14 = v66;
  v59 = v14;
  v60 = v13;
  if (!v13)
  {
    if (v14)
    {
      uint64_t v37 = (uint64_t)v14;
      v38 = sub_3350();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_360C(v37, v38);
      }
    }
    v26 = sub_3350();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_35A0(a4, v26, v39, v40, v41, v42, v43, v44);
    }
    goto LABEL_29;
  }
  uint64_t v15 = [v13 siteCode];
  v16 = (void *)*a1;
  *a1 = v15;

  v17 = sub_3350();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_3684((uint64_t)a1, v17, v18, v19, v20, v21, v22, v23);
  }

  v24 = [v60 kdcs];
  BOOL v25 = [v24 count] == 0;

  if (!v25)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v26 = [v60 kdcs];
    id v27 = [v26 countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v63;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v63 != v28) {
            objc_enumerationMutation(v26);
          }
          v30 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v31 = sub_3350();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v30;
            _os_log_debug_impl(&dword_0, v31, OS_LOG_TYPE_DEBUG, "adding kerberos kdc: %@", buf, 0xCu);
          }

          v32 = +[SOKerberosServer serverWithString:v30];
          v33 = v32;
          if (v32
            && ([v32 protocol],
                v34 = objc_claimAutoreleasedReturnValue(),
                BOOL v35 = v34 == 0,
                v34,
                v35))
          {
            id v36 = [@"tcp/" stringByAppendingString:v30];
            a7(a8, [v36 UTF8String]);
          }
          else
          {
            a7(a8, [v30 UTF8String]);
          }
        }
        id v27 = [v26 countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v27);
    }
LABEL_29:
  }
  v45 = v60;
  if (*a1 && ([(id)*a1 isEqualToString:kSOKerberosAttributeValueNoSiteCode] & 1) == 0)
  {
    v46 = sub_3350();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
      sub_3530((uint64_t)a1, v46, v47, v48, v49, v50, v51, v52);
    }

    [(id)*a1 UTF8String];
    v45 = v60;
    krb5_krbhst_set_sitename();
    unsigned int v57 = 0;
  }

  v53 = sub_3350();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
    sub_3494();
  }

  return v57;
}

void sub_3294(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint8_t buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v29 = objc_begin_catch(exception_object);
      v30 = sub_3350();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = [v29 description];
        sub_34C8(a11, v31, &buf, v30);
      }

      objc_end_catch();
      JUMPOUT(0x3214);
    }
    objc_begin_catch(exception_object);
    JUMPOUT(0x3218);
  }
  _Unwind_Resume(exception_object);
}

id sub_3350()
{
  if (qword_8098 != -1) {
    dispatch_once(&qword_8098, &stru_4148);
  }
  v0 = (void *)qword_80A0;

  return v0;
}

void sub_33A4(id a1)
{
  qword_80A0 = (uint64_t)os_log_create("com.apple.AppSSO", "AppSSOLocatePlugin");

  _objc_release_x1();
}

void sub_33E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_3404(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_342C()
{
  sub_3420();
  sub_33E8(&dword_0, v0, v1, "************ kerberos locate plugin locate_init ************", v2, v3, v4, v5, v6);
}

void sub_3460()
{
  sub_3420();
  sub_33E8(&dword_0, v0, v1, "************ kerberos locate plugin locate_fini ************", v2, v3, v4, v5, v6);
}

void sub_3494()
{
  sub_3420();
  sub_33E8(&dword_0, v0, v1, "************ end kerberos locate plugin locate_lookup ************", v2, v3, v4, v5, v6);
}

void sub_34C8(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "exception in plugin for realm: %{public}s, %{public}@", buf, 0x16u);
}

void sub_3530(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_35A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_360C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "error when retrieving plugin settings: %@", (uint8_t *)&v2, 0xCu);
}

void sub_3684(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_36F4(uint64_t *a1, NSObject *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  int v4 = 134218242;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "starting request for krb5 context: %p, sitecode: %@", (uint8_t *)&v4, 0x16u);
}

void sub_377C()
{
  sub_3420();
  sub_33E8(&dword_0, v0, v1, "************ kerberos locate plugin locate_lookup ************", v2, v3, v4, v5, v6);
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

void free(void *a1)
{
}

uint64_t krb5_krbhst_set_sitename()
{
  return _krb5_krbhst_set_sitename();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
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

void objc_release(id a1)
{
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

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_kdcs(void *a1, const char *a2, ...)
{
  return [a1 kdcs];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return [a1 protocol];
}

id objc_msgSend_siteCode(void *a1, const char *a2, ...)
{
  return [a1 siteCode];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}