void sub_4D00(id a1)
{
  uint64_t vars8;

  qword_C8F0 = (uint64_t)os_log_create("com.apple.Registration", "IDSServiceOwner");
  _objc_release_x1();
}

void sub_4D88(id a1)
{
  byte_C900 = sandbox_check() == 0;
}

BOOL sub_53EC(id a1, IDSAccount *a2, BOOL *a3)
{
  v3 = a2;
  if (([(IDSAccount *)v3 isActive] & 1) == 0)
  {
    v5 = +[IDSServiceOwner Logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v3;
      v6 = "IDSAccount (%@) is not currently active!";
LABEL_8:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
LABEL_9:

    BOOL v4 = 0;
    goto LABEL_10;
  }
  if ([(IDSAccount *)v3 accountType] != 1)
  {
    v5 = +[IDSServiceOwner Logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v3;
      v6 = "IDSAccount (%@) is not signed in to Apple ID!";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  BOOL v4 = 1;
LABEL_10:

  return v4;
}

BOOL sub_5588(id a1, IDSAccount *a2, BOOL *a3)
{
  v3 = a2;
  unsigned int v4 = [(IDSAccount *)v3 accountType];
  if (v4 != 1)
  {
    v5 = +[IDSServiceOwner Logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      int v8 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "IDSAccount (%@) is not signed in to Apple ID!", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 == 1;
}

void sub_5EDC(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = +[IDSServiceOwner Logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = 1;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "User disabled Phone Registration -- ignoring service owner request {status: %d}", buf, 8u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    unsigned int v4 = [*(id *)(a1 + 32) signInController];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_60C0;
    v11[3] = &unk_82C0;
    uint64_t v8 = *(void *)(a1 + 64);
    id v9 = *(id *)(a1 + 56);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v9;
    [v4 signInUsername:v5 withProvidedCredential:v6 onService:v8 waitUntilRegistered:v7 completion:v11];

    v10 = [*(id *)(a1 + 32) signInController];
    objc_msgSend(v10, "enableUserType:onService:completion:", 0);
  }
}

void sub_60C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKey:NSUnderlyingErrorKey];
  if (v5)
  {

LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_6;
  }
  id v6 = [v3 code];

  if (v6 != (id)-1000) {
    goto LABEL_5;
  }
  uint64_t v7 = *(void **)IMWeakLinkSymbol();
  NSErrorUserInfoKey v11 = NSUnderlyingErrorKey;
  id v12 = v3;
  id v8 = v7;
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v10 = +[NSError errorWithDomain:v8 code:-1003 userInfo:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_6:
}

void sub_6228(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = +[IDSServiceOwner Logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v5;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Finished enabling phone number account {signInType: %d, error: %@}", (uint8_t *)v6, 0x12u);
  }
}

void sub_64F0(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Passed the wrong service typefor IDS to sign in with!", v1, 2u);
}

void sub_6534(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Passed the wrong service type for IDS to sign in with!", v1, 2u);
}

void sub_6578(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Passed the wrong service type %@ for IDS to sign in with!", (uint8_t *)&v2, 0xCu);
}

uint64_t IDSRegistrationControlGetStateForRegistrationType()
{
  return _IDSRegistrationControlGetStateForRegistrationType();
}

uint64_t IDSRegistrationControlSyncGetStateForRegistrationType()
{
  return _IDSRegistrationControlSyncGetStateForRegistrationType();
}

uint64_t IMDSelfTaskCopyValueForEntitlement()
{
  return _IMDSelfTaskCopyValueForEntitlement();
}

uint64_t IMGetMainBundleIdentifier()
{
  return _IMGetMainBundleIdentifier();
}

uint64_t IMWeakLinkSymbol()
{
  return _IMWeakLinkSymbol();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

pid_t getpid(void)
{
  return _getpid();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

uint64_t sandbox_check()
{
  return _sandbox_check();
}

id objc_msgSend_Logger(void *a1, const char *a2, ...)
{
  return [a1 Logger];
}

id objc_msgSend__hasIDSMachAccess(void *a1, const char *a2, ...)
{
  return [a1 _hasIDSMachAccess];
}

id objc_msgSend__identityServicesAccountType(void *a1, const char *a2, ...)
{
  return [a1 _identityServicesAccountType];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_authenticationResults(void *a1, const char *a2, ...)
{
  return [a1 authenticationResults];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_faceTimeAvailable(void *a1, const char *a2, ...)
{
  return [a1 faceTimeAvailable];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isSetup(void *a1, const char *a2, ...)
{
  return [a1 isSetup];
}

id objc_msgSend_loginID(void *a1, const char *a2, ...)
{
  return [a1 loginID];
}

id objc_msgSend_madridAvailable(void *a1, const char *a2, ...)
{
  return [a1 madridAvailable];
}

id objc_msgSend_profileID(void *a1, const char *a2, ...)
{
  return [a1 profileID];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_signInController(void *a1, const char *a2, ...)
{
  return [a1 signInController];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   objc_storeStrong((id *)&self->_accountStore, a3);
}

- (NSDictionary)accountControllers
{
  return self->_accountControllers;
}

- (void)setAccountControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountControllers, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_signInController, 0);
}

@end