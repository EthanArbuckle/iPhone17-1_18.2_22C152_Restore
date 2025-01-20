void sub_1224(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char **p_name;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  NSObject *v27;
  DSFMParticipant *v28;
  void *v29;
  id v30;
  char **v31;
  uint64_t v32;
  void *v33;
  DSFMIdentity *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id obj;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  uint64_t v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  unsigned char v57[128];

  v5 = a2;
  v6 = a3;
  p_name = &OBJC_PROTOCOL___DSFMF.name;
  v8 = (void *)qword_A058;
  if (os_log_type_enabled((os_log_t)qword_A058, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    *(_DWORD *)buf = 134349056;
    v54 = [v5 count];
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Found %{public}lu handles following my location", buf, 0xCu);
  }
  if (!v6)
  {
    v44 = 0;
    v45 = v5;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v5;
    v11 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (!v11) {
      goto LABEL_28;
    }
    v12 = v11;
    v13 = *(void *)v49;
    v46 = a1;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v16 = p_name[11];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = v16;
          v18 = [v15 identifier];
          *(_DWORD *)buf = 138477827;
          v54 = v18;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Finding contact for handle %{private}@", buf, 0xCu);
        }
        v19 = objc_msgSend(*(id *)(a1 + 32), "findMy", v44, v45);
        v20 = [v19 contactForHandle:v15];

        v21 = p_name[11];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = v21;
          v23 = [v15 identifier];
          *(_DWORD *)buf = 138478083;
          v54 = v20;
          v55 = 2113;
          v56 = v23;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Found contact %{private}@ for handle %{private}@", buf, 0x16u);
        }
        v24 = [v20 identifier];
        v25 = [*(id *)(a1 + 40) meCardIdentifier];
        v26 = [v24 isEqualToString:v25];

        if (!v26)
        {
          v30 = v12;
          v31 = p_name;
          v32 = v13;
          v28 = objc_alloc_init(DSFMParticipant);
          [(DSFMParticipant *)v28 setRole:2];
          v33 = [v15 identifier];
          [(DSFMParticipant *)v28 setIdentifier:v33];

          [(DSFMParticipant *)v28 setPermission:1];
          v34 = objc_alloc_init(DSFMIdentity);
          v35 = [v20 identifier];
          [(DSFMIdentity *)v34 setUnifiedContactIdentifier:v35];

          v36 = [v15 identifier];
          LODWORD(v35) = +[CNEmailAddressUtilities isStringEmailAddress:v36];

          if (v35)
          {
            v37 = [v15 identifier];
            [(DSFMIdentity *)v34 setEmailAddress:v37];
            v13 = v32;
            p_name = v31;
            v12 = v30;
            a1 = v46;
            goto LABEL_23;
          }
          v38 = [v15 identifier];
          v39 = +[CNPhoneNumberHelper isStringPhoneNumber:v38];

          v13 = v32;
          p_name = v31;
          v12 = v30;
          a1 = v46;
          if (v39)
          {
            v37 = [v15 identifier];
            [(DSFMIdentity *)v34 setPhoneNumber:v37];
LABEL_23:
          }
          [(DSFMParticipant *)v28 setIdentity:v34];
          [*(id *)(a1 + 48) addObject:v28];

          goto LABEL_25;
        }
        v27 = p_name[11];
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        v28 = v27;
        v29 = [v15 identifier];
        *(_DWORD *)buf = 138477827;
        v54 = v29;
        _os_log_impl(&dword_0, &v28->super, OS_LOG_TYPE_DEFAULT, "Ignoring handle who matches the me card with identifier %{private}@", buf, 0xCu);

LABEL_25:
LABEL_26:
      }
      v12 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (!v12)
      {
LABEL_28:

        [*(id *)(a1 + 56) setParticipants:*(void *)(a1 + 48)];
        v40 = [*(id *)(a1 + 56) participants];
        v41 = [v40 count];

        v42 = *(void *)(a1 + 64);
        if (v41)
        {
          v52 = *(void *)(a1 + 56);
          v43 = +[NSArray arrayWithObjects:&v52 count:1];
          (*(void (**)(uint64_t, void *, void))(v42 + 16))(v42, v43, 0);
        }
        else
        {
          (*(void (**)(void, void *, void))(v42 + 16))(*(void *)(a1 + 64), &__NSArray0__struct, 0);
        }
        v6 = v44;
        v5 = v45;
        goto LABEL_32;
      }
    }
  }
  v10 = qword_A058;
  if (os_log_type_enabled((os_log_t)qword_A058, OS_LOG_TYPE_ERROR)) {
    sub_2538((uint64_t)v6, v10);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_32:
}

void sub_18B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_18C8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_18D8(uint64_t a1)
{
}

void sub_18E0(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_19D0;
    v9[3] = &unk_4260;
    v8 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v8 stopSharingMyLocationWithHandles:v7 groupId:0 callerId:0 completion:v9];
  }
}

uint64_t sub_19D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1A78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D3C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = +[NSMutableSet set];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v13 = *(void **)(a1 + 32);
          v14 = [v12 identifier];
          LODWORD(v13) = [v13 containsObject:v14];

          if (v13) {
            [v6 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    if ([v6 count])
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1F44;
      v16[3] = &unk_4260;
      v15 = *(void **)(a1 + 40);
      id v17 = *(id *)(a1 + 48);
      [v15 stopSharingMyLocationWithHandles:v6 groupId:0 callerId:0 completion:v16];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

uint64_t sub_1F44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2538(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to fetch handles because %{public}@", (uint8_t *)&v2, 0xCu);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
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

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_findMy(void *a1, const char *a2, ...)
{
  return [a1 findMy];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_meCardIdentifier(void *a1, const char *a2, ...)
{
  return [a1 meCardIdentifier];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return [a1 participants];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_unifiedContactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 unifiedContactIdentifier];
}

id objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedContactWithIdentifier:keysToFetch:error:");
}