@interface IMDaemonQueryController
- (IMDaemonController)daemonController;
- (IMDaemonQueryController)initWithDaemonController:(id)a3;
- (NSMutableDictionary)queries;
- (void)_completeQuery:(id)a3 success:(BOOL)a4 error:(id)a5 userInfo:(id)a6;
- (void)_daemonDisconnected:(id)a3;
- (void)_validateOutstandingQueries;
- (void)completeQuery:(id)a3;
- (void)completeQuery:(id)a3 userInfo:(id)a4;
- (void)failQuery:(id)a3 error:(id)a4;
- (void)performQueryWithKey:(id)a3 expectsSynchronousResult:(BOOL)a4 block:(id)a5;
- (void)performQueryWithKey:(id)a3 expectsSynchronousResult:(BOOL)a4 block:(id)a5 completionHandler:(id)a6;
@end

@implementation IMDaemonQueryController

- (IMDaemonQueryController)initWithDaemonController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMDaemonQueryController;
  v5 = [(IMDaemonQueryController *)&v14 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queries = v5->_queries;
    v5->_queries = v6;

    objc_storeWeak((id *)&v5->_daemonController, v4);
    v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v8, v9, v10);
    objc_msgSend_addObserver_selector_name_object_(v11, v12, (uint64_t)v5, (uint64_t)sel__daemonDisconnected_, @"__kIMDaemonDidDisconnectNotification", 0);
  }
  return v5;
}

- (void)completeQuery:(id)a3 userInfo:(id)a4
{
}

- (void)performQueryWithKey:(id)a3 expectsSynchronousResult:(BOOL)a4 block:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (__CFString *)a3;
  v11 = (void (**)(id, void *))a5;
  id v12 = a6;
  objc_msgSend__validateOutstandingQueries(self, v13, v14, v15);
  if (v11)
  {
    uint64_t v19 = objc_msgSend_length(v10, v16, v17, v18);
    v20 = @"anonymous";
    if (v19) {
      v20 = v10;
    }
    v21 = v20;
    v22 = NSString;
    v26 = objc_msgSend_stringGUID(NSString, v23, v24, v25);
    objc_msgSend_stringWithFormat_(v22, v27, @"%@-%@", v28, v21, v26);
    v29 = (char *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = @"NO";
        if (v8) {
          v32 = @"YES";
        }
        else {
          v32 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        v54 = v29;
        v56 = v32;
        __int16 v55 = 2112;
        if (v12) {
          v31 = @"YES";
        }
        __int16 v57 = 2112;
        v58 = v31;
        _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Initiating query: %@ expectsSynchronousResult: %@ hasCompletionHandler: %@", buf, 0x20u);
      }
    }
    v33 = [IMDaemonQuery alloc];
    v35 = objc_msgSend_initWithID_key_completionHandler_(v33, v34, (uint64_t)v29, (uint64_t)v21, v12);
    v39 = objc_msgSend_queries(self, v36, v37, v38);
    objc_msgSend_setObject_forKey_(v39, v40, (uint64_t)v35, (uint64_t)v29);

    v11[2](v11, v29);
    if (v8)
    {
      v44 = objc_msgSend_queries(self, v41, v42, v43);
      v47 = objc_msgSend_objectForKeyedSubscript_(v44, v45, (uint64_t)v29, v46);
      BOOL v48 = v47 == 0;

      if (!v48)
      {
        v50 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v49, @"com.apple.Messages.IMDaemonQueryErrorDomain", 2, 0);
        objc_msgSend_failQuery_error_(self, v51, (uint64_t)v29, (uint64_t)v50);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v52 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[IMDaemonQueryController performQueryWithKey:expectsSynchronousResult:block:completionHandler:]";
      _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "%s: No execute block for query!", buf, 0xCu);
    }
  }
}

- (void)_validateOutstandingQueries
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_queries(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_count(v5, v6, v7, v8);

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = objc_msgSend_queries(self, v14, v15, v16);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Outstanding queries: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v44 = 0x3032000000;
    v45 = sub_1A4B344FC;
    uint64_t v46 = sub_1A4B34364;
    id v47 = 0;
    uint64_t v18 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v10, v11, v12);
    v22 = objc_msgSend_queries(self, v19, v20, v21);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = sub_1A4AFC098;
    v39[3] = &unk_1E5B7CF20;
    id v23 = v18;
    id v40 = v23;
    p_long long buf = &buf;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v22, v24, (uint64_t)v39, v25);

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v26 = *(id *)(*((void *)&buf + 1) + 40);
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v35, (uint64_t)v42, 16);
    if (v29)
    {
      uint64_t v30 = *(void *)v36;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v36 != v30) {
            objc_enumerationMutation(v26);
          }
          uint64_t v32 = *(void *)(*((void *)&v35 + 1) + 8 * v31);
          v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v28, @"com.apple.Messages.IMDaemonQueryErrorDomain", 3, 0, (void)v35);
          objc_msgSend_failQuery_error_(self, v34, v32, (uint64_t)v33);

          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v35, (uint64_t)v42, 16);
      }
      while (v29);
    }

    _Block_object_dispose(&buf, 8);
  }
}

- (void)_completeQuery:(id)a3 success:(BOOL)a4 error:(id)a5 userInfo:(id)a6
{
  BOOL v8 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v16 = objc_msgSend_queries(self, v13, v14, v15);
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v10, v18);

  if (v19)
  {
    id v23 = objc_msgSend_queries(self, v20, v21, v22);
    objc_msgSend_removeObjectForKey_(v23, v24, (uint64_t)v10, v25);

    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v33 = objc_msgSend_startDate(v19, v30, v31, v32);
        objc_msgSend_timeIntervalSinceNow(v33, v34, v35, v36);
        long long v37 = @"NO";
        *(_DWORD *)uint64_t v42 = 134218754;
        *(double *)&v42[4] = -v38;
        if (v8) {
          long long v37 = @"YES";
        }
        *(_WORD *)&v42[12] = 2112;
        *(void *)&v42[14] = v19;
        __int16 v43 = 2112;
        uint64_t v44 = v37;
        __int16 v45 = 2112;
        id v46 = v11;
        _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, " ==> completed query (took %f seconds): %@ success: %@ error: %@", v42, 0x2Au);
      }
    }
    objc_msgSend_completionHandler(v19, v26, v27, v28, *(_OWORD *)v42);
    v39 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      if (IMOSLoggingEnabled())
      {
        id v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t v42 = 138412290;
          *(void *)&v42[4] = v10;
          _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, " ==> invoking query completion block: %@", v42, 0xCu);
        }
      }
      ((void (**)(void, BOOL, id, id))v39)[2](v39, v8, v11, v12);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v42 = 138412290;
      *(void *)&v42[4] = v10;
      _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_INFO, "Attempted to complete query %@, but query not in query controller!", v42, 0xCu);
    }
  }
}

- (NSMutableDictionary)queries
{
  return self->_queries;
}

- (void)performQueryWithKey:(id)a3 expectsSynchronousResult:(BOOL)a4 block:(id)a5
{
}

- (void)completeQuery:(id)a3
{
}

- (void)failQuery:(id)a3 error:(id)a4
{
}

- (void)_daemonDisconnected:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Daemon disconnected, failing all queries", buf, 2u);
    }
  }
  uint64_t v9 = objc_msgSend_queries(self, v5, v6, v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1A4BB7C14;
  v12[3] = &unk_1E5B7CEF8;
  v12[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v10, (uint64_t)v12, v11);
}

- (IMDaemonController)daemonController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonController);

  return (IMDaemonController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);

  objc_destroyWeak((id *)&self->_daemonController);
}

@end