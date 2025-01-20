int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id CLKWatchFaceLibraryServerInterface()
{
  if (qword_100008CE8 != -1) {
    dispatch_once(&qword_100008CE8, &stru_100004180);
  }
  v0 = (void *)qword_100008CE0;

  return v0;
}

void sub_100002F38(id a1)
{
  qword_100008CE0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLKWatchFaceLibraryServerInterface];

  _objc_release_x1();
}

uint64_t CLKLoggingObjectForDomain()
{
  return _CLKLoggingObjectForDomain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

id objc_msgSend__popTransaction(void *a1, const char *a2, ...)
{
  return [a1 _popTransaction];
}

id objc_msgSend__pushTransaction(void *a1, const char *a2, ...)
{
  return [a1 _pushTransaction];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_validateFaceType_faceBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateFaceType:faceBundleId:");
}
etObject:v8 forKey:UIApplicationOpenURLOptionsSourceApplicationKey];
    v22 = +[LSApplicationWorkspace defaultWorkspace];
    v23 = [v21 copy];
    v24 = [v22 operationToOpenResource:v16 usingApplication:@"com.apple.Bridge" uniqueDocumentIdentifier:0 userInfo:v23 delegate:self];

    [v24 start];
  }
}

- (void)validateFaceType:(id)a3 faceBundleId:(id)a4 completionHandler:(id)a5
{
  v8 = (void (**)(id, void *))a5;
  if (+[NTKGreenfieldUtilities validateFaceType:a3 faceBundleId:a4])
  {
    v7 = 0;
  }
  else
  {
    v7 = +[CLKWatchFaceLibrary errorWithCode:4];
  }
  v8[2](v8, v7);
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  v6 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CLKCompanionWatchFaceLibraryService: didFailWithError: %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = [(CLKCompanionWatchFaceLibraryService *)self completionHandler];

  if (v7)
  {
    v8 = [(CLKCompanionWatchFaceLibraryService *)self completionHandler];
    ((void (**)(void, id))v8)[2](v8, v5);

    [(CLKCompanionWatchFaceLibraryService *)self setCompletionHandler:0];
  }
  [(CLKCompanionWatchFaceLibraryService *)self _popTransaction];
}

- (void)openResourceOperationDidComplete:(id)a3
{
  v4 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLKCompanionWatchFaceLibraryService: openResourceOperationDidComplete", v7, 2u);
  }

  id v5 = [(CLKCompanionWatchFaceLibraryService *)self completionHandler];

  if (v5)
  {
    v6 = [(CLKCompanionWatchFaceLibraryService *)self completionHandler];
    v6[2](v6, 0);

    [(CLKCompanionWatchFaceLibraryService *)self setCompletionHandler:0];
  }
  [(CLKCompanionWatchFaceLibraryService *)self _popTransaction];
}

- (void)_pushTransaction
{
  id v3 = +[NSString stringWithFormat:@"%@.%lu", @"com.apple.ClockKit.CLKCompanionWatchFaceLibraryService", [(NSMutableArray *)self->_transactions count]];
  [v3 cStringUsingEncoding:4];
  v4 = (void *)os_transaction_create();
  [(NSMutableArray *)self->_transactions addObject:v4];
  id v5 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLKCompanionWatchFaceLibraryService: push token: %@", buf, 0xCu);
  }
}

- (void)_popTransaction
{
  if ([(NSMutableArray *)self->_transactions count]) {
    [(NSMutableArray *)self->_transactions removeObjectAtIndex:0];
  }
  id v3 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NSMutableArray *)self->_transactions count];
    int v5 = 134217984;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLKCompanionWatchFaceLibraryService: poped token. Remaining Count: %lu", (uint8_t *)&v5, 0xCu);
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSMutableArray)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactions, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end