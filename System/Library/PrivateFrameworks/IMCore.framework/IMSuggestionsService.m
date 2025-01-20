@interface IMSuggestionsService
+ (id)sharedInstance;
- (BOOL)_maybeEmailAddress:(id)a3;
- (BOOL)_maybePhoneNumber:(id)a3;
- (BOOL)isBusiness:(id)a3;
- (IMSuggestionsService)init;
- (id)_contactForSGContactMatch:(id)a3;
- (id)fetchCNContactForSuggestedHandle:(id)a3;
- (id)personNameComponentsForHandle:(id)a3;
- (id)serviceConnection;
- (id)suggestedNameFromCache:(id)a3 wasFound:(BOOL *)a4;
- (void)_startRequestForDisplayName:(id)a3 messageUID:(id)a4 queue:(id)a5;
- (void)_startRequestForDisplayNameCallbackWithSuggestedName:(id)a3 displayName:(id)a4 queue:(id)a5;
- (void)dealloc;
- (void)fetchSuggestedRealNameForDisplayName:(id)a3 messageUID:(id)a4 queue:(id)a5 block:(id)a6;
- (void)scheduleFetchIfNecessaryForHandle:(id)a3;
- (void)startUsingLocalLookupsWithTable:(id)a3;
- (void)stopUsingLocalLookups;
@end

@implementation IMSuggestionsService

- (IMSuggestionsService)init
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)IMSuggestionsService;
  v5 = [(IMSuggestionsService *)&v48 init];
  if (v5)
  {
    if (qword_1E965E700 != -1) {
      dispatch_once(&qword_1E965E700, &unk_1EF8E5998);
    }
    v6 = (void *)qword_1E965E708;
    if (!qword_1E965E708)
    {
      long long v49 = xmmword_1E5B7B610;
      long long v50 = *(_OWORD *)off_1E5B7B620;
      uint64_t v51 = 32;
      v7 = NSString;
      uint64_t v8 = IMFileLocationTrimFileName();
      uint64_t v9 = v51;
      v12 = objc_msgSend_stringWithFormat_(NSString, v10, (uint64_t)&stru_1EF8E78C8, v11);
      v15 = objc_msgSend_stringWithFormat_(v7, v13, @"Unexpected nil '%@' in %s at %s:%d. %@", v14, @"suggestionsServiceClass", "NSObject<SGSuggestionsServiceContactsProtocol> *_IMDSuggestionsNewConnection(void)", v8, v9, v12);

      v16 = (void (*)(void *))IMGetAssertionFailureHandler();
      if (v16)
      {
        v16(v15);
      }
      else if (IMOSLoggingEnabled())
      {
        v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v15;
          _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
        }
      }
      v6 = (void *)qword_1E965E708;
    }
    v18 = objc_msgSend_serviceForContacts(v6, v2, v3, v4);
    objc_msgSend_setQueuesRequestsIfBusy_(v18, v19, 1, v20);
    connection = v5->_connection;
    v5->_connection = (SGSuggestionsServiceContactsProtocol *)v18;

    uint64_t v22 = objc_opt_new();
    cache = v5->_cache;
    v5->_cache = (NSCache *)v22;

    v24 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    id v26 = objc_claimAutoreleasedReturnValue();
    v30 = (const char *)objc_msgSend_UTF8String(v26, v27, v28, v29);
    dispatch_queue_t v31 = dispatch_queue_create(v30, v24);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v31;

    uint64_t v33 = objc_opt_new();
    pending = v5->_pending;
    v5->_pending = (NSMutableDictionary *)v33;

    id v35 = objc_alloc(MEMORY[0x1E4F28D30]);
    uint64_t v37 = objc_msgSend_initWithOptions_capacity_(v35, v36, 517, 0);
    handlesToRetry = v5->_handlesToRetry;
    v5->_handlesToRetry = (NSHashTable *)v37;

    v39 = v5->_connection;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = sub_1A4B556D0;
    v46[3] = &unk_1E5B7B530;
    v40 = v5;
    v47 = v40;
    uint64_t v43 = objc_msgSend_registerContactsChangeObserver_(v39, v41, (uint64_t)v46, v42);
    id newContactNotificationToken = v40->_newContactNotificationToken;
    v40->_id newContactNotificationToken = (id)v43;
  }
  return v5;
}

- (void)_startRequestForDisplayName:(id)a3 messageUID:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    connection = self->_connection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1A4B051A4;
    v14[3] = &unk_1E5B7B580;
    id v15 = v8;
    v16 = self;
    id v17 = v10;
    objc_msgSend_namesForDetail_limitTo_prependMaybe_withCompletion_(connection, v12, (uint64_t)v15, 1, 1, v14);
  }
  else if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "displayName paramater was unexpectedly nil in _startRequestForDisplayName", buf, 2u);
    }
  }
}

- (void)_startRequestForDisplayNameCallbackWithSuggestedName:(id)a3 displayName:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1A4B042C0;
  v15[3] = &unk_1E5B7B1D0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

+ (id)sharedInstance
{
  if (qword_1EB3F2438 != -1) {
    dispatch_once(&qword_1EB3F2438, &unk_1EF8E5198);
  }
  v2 = (void *)qword_1E965E770;

  return v2;
}

- (void)scheduleFetchIfNecessaryForHandle:(id)a3
{
  id location = 0;
  objc_initWeak(&location, a3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4B092C0;
  block[3] = &unk_1E5B7B420;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)fetchSuggestedRealNameForDisplayName:(id)a3 messageUID:(id)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v15 = a6;
  if (v15 && self->_connection)
  {
    if (v10
      && ((objc_msgSend__maybePhoneNumber_(self, v13, (uint64_t)v10, v14) & 1) != 0
       || (objc_msgSend__maybeEmailAddress_(self, v16, (uint64_t)v10, v17) & 1) != 0
       || (objc_msgSend_isBusiness_(self, v16, (uint64_t)v10, v17) & 1) != 0))
    {
      id v18 = objc_msgSend_objectForKey_(self->_cache, v16, (uint64_t)v10, v17);
      if (v18)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1A4B55AAC;
        block[3] = &unk_1E5B7B220;
        id v28 = v15;
        v27 = v18;
        dispatch_async(v12, block);

        v19 = v28;
      }
      else
      {
        queue = self->_queue;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = sub_1A4B04E64;
        v21[3] = &unk_1E5B7B558;
        v21[4] = self;
        id v22 = v10;
        v23 = v12;
        id v25 = v15;
        id v24 = v11;
        dispatch_async(queue, v21);

        v19 = v22;
      }

LABEL_15:
      goto LABEL_16;
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1A4B55A98;
    v29[3] = &unk_1E5B7AE90;
    id v30 = v15;
    dispatch_async(v12, v29);
  }
  else if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Unexpectedly nil parameter in fetchSuggestedRealNameForDisplayName", buf, 2u);
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (BOOL)_maybePhoneNumber:(id)a3
{
}

- (id)suggestedNameFromCache:(id)a3 wasFound:(BOOL *)a4
{
  id v8 = a3;
  if (v8)
  {
    id v12 = objc_msgSend_objectForKey_(self->_cache, v6, (uint64_t)v8, v7);
    BOOL v13 = v12 != 0;
    if (!v12
      || (objc_msgSend_null(MEMORY[0x1E4F1CA98], v9, v10, v11),
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v12 == v14))
    {
      id v15 = 0;
    }
    else
    {
      id v15 = v12;
    }

    if (a4) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v13 = 0;
    id v15 = 0;
    if (a4) {
LABEL_9:
    }
      *a4 = v13;
  }

  return v15;
}

- (void)dealloc
{
  objc_msgSend_deregisterContactsChangeObserverWithToken_(self->_connection, a2, (uint64_t)self->_newContactNotificationToken, v2);
  v4.receiver = self;
  v4.super_class = (Class)IMSuggestionsService;
  [(IMSuggestionsService *)&v4 dealloc];
}

- (id)serviceConnection
{
  return self->_connection;
}

- (BOOL)_maybeEmailAddress:(id)a3
{
  return IMStringIsEmail();
}

- (BOOL)isBusiness:(id)a3
{
}

- (void)startUsingLocalLookupsWithTable:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A4B5598C;
  v7[3] = &unk_1E5B7B130;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)stopUsingLocalLookups
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4B55A50;
  block[3] = &unk_1E5B7ACD0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (id)_contactForSGContactMatch:(id)a3
{
  id v4 = objc_msgSend_sortedArrayUsingComparator_(a3, a2, (uint64_t)&unk_1EF8E4110, v3);
  id v8 = objc_msgSend_firstObject(v4, v5, v6, v7);
  id v9 = (void *)MEMORY[0x1E4F1B8F8];
  BOOL v13 = objc_msgSend_contact(v8, v10, v11, v12);
  id v16 = objc_msgSend_contactFromSuggestion_(v9, v14, (uint64_t)v13, v15);

  return v16;
}

- (id)fetchCNContactForSuggestedHandle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = v4;
  if (!v4 || !objc_msgSend_length(v4, v5, v6, v7))
  {
    id v23 = 0;
    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Fetching a suggested CNContact for displayName %@", buf, 0xCu);
    }
  }
  int v12 = objc_msgSend__maybePhoneNumber_(self, v9, (uint64_t)v8, v10);
  int v15 = objc_msgSend__maybeEmailAddress_(self, v13, (uint64_t)v8, v14);
  if (v12)
  {
    v19 = objc_msgSend_serviceConnection(self, v16, v17, v18);
    uint64_t v32 = 0;
    v21 = objc_msgSend_contactMatchesByPhoneNumber_error_(v19, v20, (uint64_t)v8, (uint64_t)&v32);
    id v22 = (id *)&v32;
  }
  else
  {
    if (!v15)
    {
      id v25 = 0;
      v21 = 0;
      goto LABEL_14;
    }
    v19 = objc_msgSend_serviceConnection(self, v16, v17, v18);
    uint64_t v31 = 0;
    v21 = objc_msgSend_contactMatchesByEmailAddress_error_(v19, v24, (uint64_t)v8, (uint64_t)&v31);
    id v22 = (id *)&v31;
  }
  id v25 = *v22;

LABEL_14:
  if (objc_msgSend_count(v21, v16, v17, v18))
  {
    id v28 = objc_msgSend__contactForSGContactMatch_(self, v26, (uint64_t)v21, v27);
  }
  else
  {
    id v28 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v28;
      _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "Found suggested contact %@ with error", buf, 0xCu);
    }
  }
  id v23 = v28;

LABEL_22:

  return v23;
}

- (id)personNameComponentsForHandle:(id)a3
{
  id v5 = objc_msgSend_displayID(a3, a2, (uint64_t)a3, v3);
  id v8 = objc_msgSend_fetchCNContactForSuggestedHandle_(self, v6, (uint64_t)v5, v7);

  uint64_t v11 = objc_msgSend_firstNameForCNContact_(MEMORY[0x1E4F6E6D8], v9, (uint64_t)v8, v10);
  uint64_t v14 = objc_msgSend_lastNameForCNContact_(MEMORY[0x1E4F6E6D8], v12, (uint64_t)v8, v13);
  id v15 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  uint64_t v18 = v15;
  if (v11) {
    objc_msgSend_setGivenName_(v15, v16, (uint64_t)v11, v17);
  }
  if (v14) {
    objc_msgSend_setFamilyName_(v18, v16, (uint64_t)v14, v17);
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_newContactNotificationToken, 0);
  objc_storeStrong((id *)&self->_handlesToRetry, 0);
  objc_storeStrong((id *)&self->_localTable, 0);
  objc_storeStrong((id *)&self->_pending, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end