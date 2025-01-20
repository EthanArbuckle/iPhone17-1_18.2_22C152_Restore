@interface CKDAuthorizationObserver
+ (CKDAuthorizationObserver)defaultObserver;
- (CKDAuthorizationObserver)init;
- (CKDAuthorizationObserver)initWithIdentifier:(id)a3;
- (NSSet)bundleIdentifiers;
- (NSSet)services;
- (NSString)identifier;
- (void)_handleTCCAuthorizationEventWithType:(unint64_t)a3 record:(id)a4 block:(id)a5;
- (void)invalidate;
- (void)registerWithBlock:(id)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setServices:(id)a3;
@end

@implementation CKDAuthorizationObserver

+ (CKDAuthorizationObserver)defaultObserver
{
  if (qword_1EBBCFF60 != -1) {
    dispatch_once(&qword_1EBBCFF60, &unk_1F2044290);
  }
  v2 = (void *)qword_1EBBCFF58;
  return (CKDAuthorizationObserver *)v2;
}

- (CKDAuthorizationObserver)init
{
  id v2 = objc_alloc(MEMORY[0x1E4F1A018]);
  id v4 = (id)objc_msgSend_initWithName_format_(v2, v3, *MEMORY[0x1E4F1C3C8], @"You must call -initWithIdentifier: instead");
  objc_exception_throw(v4);
}

- (CKDAuthorizationObserver)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKDAuthorizationObserver;
  v7 = [(CKDAuthorizationObserver *)&v26 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_copy(v4, v5, v6);
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    id v10 = v4;
    v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v15;

    uint64_t v19 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v17, v18);
    services = v7->_services;
    v7->_services = (NSSet *)v19;

    uint64_t v23 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v21, v22);
    bundleIdentifiers = v7->_bundleIdentifiers;
    v7->_bundleIdentifiers = (NSSet *)v23;
  }
  return v7;
}

- (NSSet)services
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_services;
  objc_sync_exit(v2);

  return v3;
}

- (void)setServices:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v9)
  {
    uint64_t v7 = objc_msgSend_copy(v9, v5, v6);
  }
  else
  {
    uint64_t v7 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v5, v6);
  }
  services = v4->_services;
  v4->_services = (NSSet *)v7;

  objc_sync_exit(v4);
}

- (NSSet)bundleIdentifiers
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_bundleIdentifiers;
  objc_sync_exit(v2);

  return v3;
}

- (void)setBundleIdentifiers:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v9)
  {
    uint64_t v7 = objc_msgSend_copy(v9, v5, v6);
  }
  else
  {
    uint64_t v7 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v5, v6);
  }
  bundleIdentifiers = v4->_bundleIdentifiers;
  v4->_bundleIdentifiers = (NSSet *)v7;

  objc_sync_exit(v4);
}

- (void)registerWithBlock:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v8 = objc_msgSend_bundleIdentifiers(v5, v6, v7);
  uint64_t v11 = objc_msgSend_count(v8, v9, v10);

  if (v11)
  {
    xpc_object_t empty = xpc_array_create_empty();
    long long v67 = 0u;
    long long v68 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    dispatch_queue_t v15 = objc_msgSend_bundleIdentifiers(v5, v13, v14);
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v65, v74, 16);
    if (v17)
    {
      uint64_t v18 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v66 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(id *)(*((void *)&v65 + 1) + 8 * i);
          uint64_t v23 = (const char *)objc_msgSend_UTF8String(v20, v21, v22);
          xpc_object_t v24 = xpc_string_create(v23);
          xpc_array_append_value(empty, v24);
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v25, (uint64_t)&v65, v74, 16);
      }
      while (v17);
    }
  }
  else
  {
    xpc_object_t empty = 0;
  }
  xpc_object_t v26 = xpc_dictionary_create_empty();
  v29 = objc_msgSend_services(v5, v27, v28);
  if (objc_msgSend_count(v29, v30, v31)) {
    objc_msgSend_services(v5, v32, v33);
  }
  else {
  v34 = objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v32, *MEMORY[0x1E4FA9A18]);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v35 = v34;
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v61, v73, 16);
  if (v37)
  {
    uint64_t v38 = *(void *)v62;
    if (empty) {
      v39 = empty;
    }
    else {
      v39 = (void *)MEMORY[0x1E4F14518];
    }
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v62 != v38) {
          objc_enumerationMutation(v35);
        }
        id v41 = *(id *)(*((void *)&v61 + 1) + 8 * j);
        v44 = (const char *)objc_msgSend_UTF8String(v41, v42, v43);
        xpc_dictionary_set_value(v26, v44, v39);
      }
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v45, (uint64_t)&v61, v73, 16);
    }
    while (v37);
  }

  objc_initWeak(&location, v5);
  v48 = (void *)tcc_events_filter_create_with_criteria();
  if (!v48)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v49 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v57 = objc_msgSend_bundleIdentifiers(v5, v50, v51);
      *(_DWORD *)buf = 138412546;
      v70 = v57;
      __int16 v71 = 2112;
      id v72 = v35;
      _os_log_error_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_ERROR, "Failed to create event filter for bundle identifier %@ and services %@", buf, 0x16u);
    }
  }
  objc_msgSend_identifier(v5, v46, v47);
  id v52 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v52, v53, v54);
  if (v5) {
    queue = v5->_queue;
  }
  else {
    queue = 0;
  }
  v56 = queue;
  objc_copyWeak(&v59, &location);
  id v58 = v4;
  tcc_events_subscribe();

  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);

  objc_sync_exit(v5);
}

- (void)invalidate
{
  objc_msgSend_identifier(self, a2, v2);
  id v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v5, v3, v4);
  tcc_events_unsubscribe();
}

- (void)_handleTCCAuthorizationEventWithType:(unint64_t)a3 record:(id)a4 block:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, void, void *, uint64_t, uint64_t))a5;
  uint64_t v10 = a3 - 1;
  if (a3 - 1 < 3)
  {
    uint64_t v11 = off_1E64F6640[v10];
    uint64_t v12 = tcc_authorization_record_get_service();
    v13 = tcc_service_get_CF_name();
    uint64_t v14 = tcc_authorization_record_get_subject_identity();
    if (v14)
    {
      if (!tcc_identity_get_type())
      {
        uint64_t v18 = NSString;
        uint64_t identifier = tcc_identity_get_identifier();
        v21 = objc_msgSend_stringWithUTF8String_(v18, v20, identifier);
        if (v21)
        {
          uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
          uint64_t v23 = @"Unknown";
          uint64_t v24 = -1;
          if (authorization_right == 2)
          {
            uint64_t v24 = 1;
            uint64_t v23 = @"Allowed";
          }
          if (!authorization_right)
          {
            uint64_t v24 = 0;
            uint64_t v23 = @"Denied";
          }
          v40 = v23;
          uint64_t v42 = v24;
          v25 = v21;
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          xpc_object_t v26 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413058;
            unint64_t v46 = (unint64_t)v11;
            __int16 v47 = 2112;
            v48 = v25;
            __int16 v49 = 2112;
            v50 = v13;
            __int16 v51 = 2112;
            id v52 = v40;
            uint64_t v38 = v26;
            _os_log_debug_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_DEBUG, "Posting %@ event for %@(%@) with authorization: %@", buf, 0x2Au);
          }
          v29 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v27, v28);
          v43[0] = @"CKDAuthorizationServiceKey";
          v43[1] = @"CKDAuthorizationBundleIdentifierKey";
          v44[0] = v13;
          v44[1] = v25;
          id v41 = v13;
          v30 = v25;
          v43[2] = @"CKDAuthorizationEventTypeKey";
          v39 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v31, v10);
          v44[2] = v39;
          v43[3] = @"CKDAuthorizationKey";
          uint64_t v33 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v32, v42);
          v44[3] = v33;
          id v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v34, (uint64_t)v44, v43, 4);
          objc_msgSend_postNotificationName_object_userInfo_(v29, v36, @"CKDAuthorizationChangedNotification", self, v35);

          v21 = v30;
          v13 = v41;

          if (v9) {
            ((void (**)(id, void *, void *, uint64_t, uint64_t))v9)[2](v9, v41, v21, v10, v42);
          }
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v37 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v46 = (unint64_t)v13;
            _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "Unable to determine bundle identifier for service: %@", buf, 0xCu);
          }
        }

        goto LABEL_33;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      dispatch_queue_t v15 = *MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
LABEL_33:

        goto LABEL_34;
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v46 = (unint64_t)v13;
      v16 = "Invalid subject identity type for service event: %@";
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      dispatch_queue_t v15 = *MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v46 = (unint64_t)v13;
      v16 = "Unable to determine subject identity for service event: %@";
    }
    _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
    goto LABEL_33;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v17 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v46 = a3;
    _os_log_error_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_ERROR, "Unknown TCC event received: %lld", buf, 0xCu);
  }
LABEL_34:
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_services, 0);
}

@end