void sub_1934(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void (*v9)(void);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SMDSParticipant *v22;
  SMDSIdentity *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  SMDSSharedResource *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  SMDSSharedResource *v46;
  uint64_t v47;
  id v48;
  id obj;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  SMDSSharedResource *v60;
  unsigned char v61[128];
  NSString *v62;
  uint8_t buf[4];
  id v64;

  v6 = a2;
  v7 = a4;
  if (v7)
  {
    v8 = qword_9230;
    if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v7;
      _os_log_error_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Failed to fetch shared resouces due to error: %@", buf, 0xCu);
    }
    v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_44:
    v9();
    goto LABEL_45;
  }
  if (([v6 isActiveState] & 1) == 0)
  {
    v45 = qword_9230;
    if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Session not in active state, no resources to fetch.", buf, 2u);
    }
    v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_44;
  }
  v47 = a1;
  v51 = objc_alloc_init((Class)CNContactStore);
  v62 = CNContactIdentifierKey;
  v50 = +[NSArray arrayWithObjects:&v62 count:1];
  v46 = objc_alloc_init(SMDSSharedResource);
  v10 = objc_alloc((Class)NSMutableArray);
  v11 = [v6 configuration];
  v12 = [v11 conversation];
  v13 = [v12 receiverHandles];
  v52 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v13, "count"));

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v48 = v6;
  v14 = [v6 configuration];
  v15 = [v14 conversation];
  v16 = [v15 receiverHandles];

  obj = v16;
  v54 = [v16 countByEnumeratingWithState:&v56 objects:v61 count:16];
  v17 = 0;
  v18 = 0;
  v19 = 0;
  if (!v54) {
    goto LABEL_38;
  }
  v53 = *(void *)v57;
  do
  {
    v20 = 0;
    do
    {
      if (*(void *)v57 != v53) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v56 + 1) + 8 * (void)v20);
      v22 = objc_alloc_init(SMDSParticipant);
      v23 = objc_alloc_init(SMDSIdentity);
      v24 = [v21 primaryHandle];
      v25 = qword_9230;
      if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v24;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Searching for contact with handle: %@", buf, 0xCu);
      }
      if (+[CNEmailAddressUtilities isStringEmailAddress:](CNEmailAddressUtilities, "isStringEmailAddress:", v24, v46))
      {
        v26 = qword_9230;
        if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v24;
          _os_log_debug_impl(&dword_0, v26, OS_LOG_TYPE_DEBUG, "Participant identifier is email: %@", buf, 0xCu);
        }
        [(SMDSIdentity *)v23 setEmailAddress:v24];
        v27 = +[CNContact predicateForContactsMatchingEmailAddress:v24];
      }
      else
      {
        if (!+[CNPhoneNumberHelper isStringPhoneNumber:v24])goto LABEL_22; {
        v28 = qword_9230;
        }
        if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v24;
          _os_log_debug_impl(&dword_0, v28, OS_LOG_TYPE_DEBUG, "Participant identifier is phone: %@", buf, 0xCu);
        }
        [(SMDSIdentity *)v23 setPhoneNumber:v24];
        v29 = [objc_alloc((Class)CNPhoneNumber) initWithStringValue:v24];
        v27 = +[CNContact predicateForContactsMatchingPhoneNumber:v29];

        v17 = v29;
      }

      v17 = (void *)v27;
LABEL_22:
      v30 = qword_9230;
      if (v17)
      {
        if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v17;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Searching contact store with predicate: %@", buf, 0xCu);
        }
        v55 = v19;
        v31 = [v51 unifiedContactsMatchingPredicate:v17 keysToFetch:v50 error:&v55];
        v32 = v55;

        if ([v31 count])
        {
          v33 = [v31 firstObject];
          v34 = (void *)qword_9230;
          if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
          {
            v35 = v34;
            v36 = [v31 firstObject];
            *(_DWORD *)buf = 138412290;
            v64 = v36;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Found contact: %@", buf, 0xCu);
          }
          v37 = [v33 identifier];
          [(SMDSIdentity *)v23 setUnifiedContactIdentifier:v37];
        }
        else
        {
          v38 = qword_9230;
          if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "No contacts found.", buf, 2u);
          }
        }
        [(SMDSParticipant *)v22 setIdentity:v23];
        v39 = qword_9230;
        if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v22;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Participant info: %@", buf, 0xCu);
        }
        [v52 addObject:v22];
        v18 = v31;
        v19 = v32;
      }
      else if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v24;
        _os_log_error_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, "Participant identifier was neither email nor phone number: %@", buf, 0xCu);
      }

      v20 = (char *)v20 + 1;
    }
    while (v54 != v20);
    v54 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  }
  while (v54);
LABEL_38:

  v40 = [v52 copy];
  v41 = v46;
  [(SMDSSharedResource *)v46 setParticipants:v40];

  v42 = qword_9230;
  if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v46;
    _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "Passing resource, %@", buf, 0xCu);
  }
  v43 = *(void *)(v47 + 32);
  v60 = v46;
  v44 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1, v46);
  (*(void (**)(uint64_t, void *, void))(v43 + 16))(v43, v44, 0);

  v7 = 0;
  v6 = v48;
LABEL_45:
}

void sub_21D4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v8 = v7;
  if (!v6 || v7 || ([v6 isValidState] & 1) == 0)
  {
    v9 = qword_9230;
    if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Failed to end session due to error fetching sessionID: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  v10 = [*(id *)(a1 + 32) safetyMonitorManager];
  v11 = [v6 configuration];
  v12 = [v11 sessionID];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2370;
  v13[3] = &unk_41A8;
  id v14 = *(id *)(a1 + 40);
  [v10 endSessionForSessionID:v12 reason:4 handler:v13];
}

void sub_2370(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = qword_9230;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Failed to end session due to error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Ending session.", (uint8_t *)&v6, 2u);
  }
  v5 = qword_9230;
  if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "All sharing stopped.", (uint8_t *)&v6, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2594(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2684(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_conversation(void *a1, const char *a2, ...)
{
  return [a1 conversation];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isActiveState(void *a1, const char *a2, ...)
{
  return [a1 isActiveState];
}

id objc_msgSend_isValidState(void *a1, const char *a2, ...)
{
  return [a1 isValidState];
}

id objc_msgSend_primaryHandle(void *a1, const char *a2, ...)
{
  return [a1 primaryHandle];
}

id objc_msgSend_receiverHandles(void *a1, const char *a2, ...)
{
  return [a1 receiverHandles];
}

id objc_msgSend_safetyMonitorManager(void *a1, const char *a2, ...)
{
  return [a1 safetyMonitorManager];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:");
}