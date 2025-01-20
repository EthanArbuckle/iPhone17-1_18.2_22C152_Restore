uint64_t sub_2B08()
{
  return 0;
}

gss_cred_id_t sub_2B14(gss_name_t_desc_struct *a1, const gss_OID_desc *a2, uint64_t a3)
{
  v5 = sub_32A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_36F8(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (!gss_oid_equal(a2, &__gss_krb5_mechanism_oid_desc)) {
    return 0;
  }
  v13 = sub_32A8();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_3690();
  }

  DisplayString = (__CFString *)GSSNameCreateDisplayString(a1);
  v15 = sub_32A8();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_3628();
  }

  v70 = DisplayString;
  v16 = [(__CFString *)v70 componentsSeparatedByString:@"@"];
  v17 = (char *)[v16 count];
  if (v17 != (unsigned char *)&dword_0 + 3)
  {
    if (v17 == (unsigned char *)&dword_0 + 2)
    {
      v20 = objc_msgSend(v16, "objectAtIndexedSubscript:", 0, context);
      v18 = [v20 componentsSeparatedByString:@"/"];

      v21 = (char *)[v18 count];
      v22 = v18;
      if (v21 == (unsigned char *)&dword_0 + 2
        || (v23 = (char *)[v16 count], v22 = v16, v23 == (unsigned char *)&dword_0 + 2))
      {
        v77 = [v22 objectAtIndexedSubscript:1];
        goto LABEL_21;
      }
LABEL_20:
      v77 = 0;
      goto LABEL_21;
    }
    if (v17 == (unsigned char *)&dword_0 + 1)
    {
      v18 = [(__CFString *)v70 componentsSeparatedByString:@"/", context];
      if ([v18 count] == (char *)&dword_0 + 2)
      {
        v77 = [v18 objectAtIndexedSubscript:1];
LABEL_21:

        goto LABEL_22;
      }
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (objc_msgSend(v16, "count", context) != (char *)&dword_0 + 2)
  {
LABEL_19:
    v77 = 0;
    goto LABEL_22;
  }
  v77 = [v16 objectAtIndexedSubscript:1];
LABEL_22:

  if (!v77)
  {
    gss_cred_id_t v19 = 0;
    goto LABEL_74;
  }
  v24 = sub_32A8();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    sub_35C0();
  }

  v25 = +[SOKerberosHeimdalPluginSettings retrieveAllCurrentSettings];
  v26 = sub_32A8();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_3578(buf, (uint64_t)[v25 count], v26);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v25;
  id v27 = [obj countByEnumeratingWithState:&v82 objects:v89 count:16];
  if (!v27)
  {

    goto LABEL_69;
  }
  id v28 = 0;
  v29 = 0;
  uint64_t v73 = *(void *)v83;
  id v74 = v27;
  do
  {
    for (i = 0; i != v74; i = (char *)i + 1)
    {
      if (*(void *)v83 != v73) {
        objc_enumerationMutation(obj);
      }
      v75 = i;
      v76 = *(void **)(*((void *)&v82 + 1) + 8 * i);
      v31 = sub_32A8();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v32 = +[SOKerberosHeimdalPluginSettings stringWithCredentialUseMode:](SOKerberosHeimdalPluginSettings, "stringWithCredentialUseMode:", [v76 credentialUseMode]);
        sub_351C(v32, v87, &v88, v31);
      }

      if ((char *)[v76 credentialUseMode] - 1 > (unsigned char *)&dword_0 + 1) {
        continue;
      }
      v33 = (char *)[v76 credentialUseMode];
      if (a3 && v33 == (unsigned char *)&dword_0 + 1)
      {
        v34 = 0;
        goto LABEL_56;
      }
      v35 = objc_msgSend(v76, "hosts", context);
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v36 = v35;
      id v37 = [v36 countByEnumeratingWithState:&v78 objects:v86 count:16];
      if (!v37)
      {
        v34 = v29;
        goto LABEL_55;
      }
      uint64_t v38 = *(void *)v79;
      v34 = v29;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v79 != v38) {
            objc_enumerationMutation(v36);
          }
          v40 = *(void **)(*((void *)&v78 + 1) + 8 * (void)j);
          if (![v40 hasPrefix:@"."])
          {
            v45 = [v77 lowercaseString];
            v46 = [v40 lowercaseString];
            unsigned int v47 = [v45 isEqualToString:v46];

            if (!v47) {
              continue;
            }
            [v76 currentCredential];
            v34 = v41 = v34;
            goto LABEL_50;
          }
          v41 = [v77 lowercaseString];
          v42 = [v40 lowercaseString];
          if (![v41 hasSuffix:v42])
          {

LABEL_50:
            continue;
          }
          BOOL v43 = [v40 length] > v28;

          if (v43)
          {
            uint64_t v44 = [v76 currentCredential];

            id v28 = [v40 length];
            v34 = (void *)v44;
          }
        }
        id v37 = [v36 countByEnumeratingWithState:&v78 objects:v86 count:16];
      }
      while (v37);
LABEL_55:

      v29 = v36;
LABEL_56:

      v29 = v34;
      i = v75;
    }
    id v74 = [obj countByEnumeratingWithState:&v82 objects:v89 count:16];
  }
  while (v74);

  if (!v29)
  {
LABEL_69:
    v49 = sub_32A8();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      sub_33BC(v49, v53, v54, v55, v56, v57, v58, v59);
    }
    v29 = 0;
    goto LABEL_72;
  }
  v48 = sub_32A8();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
    sub_34B4();
  }

  v49 = [v29 UUIDString];
  if (([v49 isEqualToString:&stru_4198] & 1) != 0
    || (CFUUIDRef v50 = CFUUIDCreateFromString(0, (CFStringRef)v49), (v51 = v50) == 0))
  {
LABEL_72:
    gss_cred_id_t v19 = 0;
    goto LABEL_73;
  }
  gss_cred_id_t v19 = GSSCreateCredentialFromUUID(v50);
  CFRelease(v51);
  v52 = sub_32A8();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    sub_33F4();
  }

LABEL_73:
LABEL_74:

  v60 = sub_32A8();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
    sub_3384(v60, v61, v62, v63, v64, v65, v66, v67);
  }

  return v19;
}

void sub_31C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint8_t buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v35 = objc_begin_catch(exception_object);
      id v36 = sub_32A8();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v37 = [v35 description];
        sub_345C(v37, &buf, v36);
      }

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(exception_object);
    }
    JUMPOUT(0x3150);
  }
  _Unwind_Resume(exception_object);
}

id sub_32A8()
{
  if (qword_80B0 != -1) {
    dispatch_once(&qword_80B0, &stru_4158);
  }
  v0 = (void *)qword_80B8;

  return v0;
}

void sub_32FC(id a1)
{
  qword_80B8 = (uint64_t)os_log_create("com.apple.AppSSO", "AppSSOReplacePlugin");

  _objc_release_x1();
}

void sub_3340(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_3368(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_3384(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_33BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_33F4()
{
  sub_335C();
  sub_3340(&dword_0, v0, v1, "using credential: %@", v2, v3, v4, v5, v6);
}

void sub_345C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "exception in plugin %{public}@", buf, 0xCu);
}

void sub_34B4()
{
  sub_335C();
  sub_3340(&dword_0, v0, v1, "using credential uuid: %@", v2, v3, v4, v5, v6);
}

void sub_351C(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "credentialUseMode: %@", buf, 0xCu);
}

void sub_3578(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "found %lu profiles", buf, 0xCu);
}

void sub_35C0()
{
  sub_335C();
  sub_3340(&dword_0, v0, v1, "SPN host: %@", v2, v3, v4, v5, v6);
}

void sub_3628()
{
  sub_335C();
  sub_3340(&dword_0, v0, v1, "SPN: %@", v2, v3, v4, v5, v6);
}

void sub_3690()
{
  sub_335C();
  sub_3340(&dword_0, v0, v1, "original credential: %@", v2, v3, v4, v5, v6);
}

void sub_36F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return _CFUUIDCreateFromString(alloc, uuidStr);
}

gss_cred_id_t GSSCreateCredentialFromUUID(CFUUIDRef uuid)
{
  return _GSSCreateCredentialFromUUID(uuid);
}

CFStringRef GSSNameCreateDisplayString(gss_name_t name)
{
  return _GSSNameCreateDisplayString(name);
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

int gss_oid_equal(gss_const_OID a, gss_const_OID b)
{
  return _gss_oid_equal(a, b);
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

void objc_exception_rethrow(void)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_credentialUseMode(void *a1, const char *a2, ...)
{
  return [a1 credentialUseMode];
}

id objc_msgSend_currentCredential(void *a1, const char *a2, ...)
{
  return [a1 currentCredential];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_hosts(void *a1, const char *a2, ...)
{
  return [a1 hosts];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_retrieveAllCurrentSettings(void *a1, const char *a2, ...)
{
  return [a1 retrieveAllCurrentSettings];
}

id objc_msgSend_stringWithCredentialUseMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCredentialUseMode:");
}