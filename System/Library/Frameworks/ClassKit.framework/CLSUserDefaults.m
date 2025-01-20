@interface CLSUserDefaults
+ (Class)endpointClass;
+ (id)displayNameForDefaultName:(id)a3;
+ (id)sharedDefaults;
- (BOOL)userDefaultForDefaultNamed:(id)a3;
- (CLSEndpointConnection)endpointConnection;
- (CLSUserDefaults)initWithEndpoint:(id)a3;
- (id)syncUtilityServer:(id)a3;
- (id)utilityServer:(id)a3;
- (void)getUserDefaultForDefaultNamed:(id)a3 completion:(id)a4;
- (void)setEndpointConnection:(id)a3;
- (void)setUserDefaultValue:(id)a3 forDefaultNamed:(id)a4 completion:(id)a5;
- (void)userDefaultsConfigurationDictionaryWithCompletion:(id)a3;
@end

@implementation CLSUserDefaults

+ (Class)endpointClass
{
  return (Class)objc_opt_class();
}

+ (id)sharedDefaults
{
  v4 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], a2, v2);
  v7 = objc_msgSend_executablePath(v4, v5, v6);

  v10 = objc_msgSend_lastPathComponent(v7, v8, v9);
  int isEqualToString = objc_msgSend_isEqualToString_(v10, v11, @"progressd");

  if (isEqualToString)
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v13 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1DC60F000, v13, OS_LOG_TYPE_FAULT, "ERROR: CLSUserDefaults is not available to progressd", buf, 2u);
    }
    id v14 = 0;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DC624DD4;
    block[3] = &unk_1E6C95AC0;
    block[4] = a1;
    if (qword_1EB5D4718 != -1) {
      dispatch_once(&qword_1EB5D4718, block);
    }
    id v14 = (id)qword_1EB5D4710;
  }

  return v14;
}

+ (id)displayNameForDefaultName:(id)a3
{
  id v3 = a3;
  v5 = v3;
  if (qword_1EB5D4728 == -1)
  {
    if (v3)
    {
LABEL_3:
      uint64_t v6 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EB5D4720, v4, (uint64_t)v5);
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&qword_1EB5D4728, &unk_1F37A1490);
    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
LABEL_6:

  return v6;
}

- (CLSUserDefaults)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CLSUserDefaults;
  uint64_t v6 = [(CLSUserDefaults *)&v30 init];
  if (!v6)
  {
LABEL_9:
    v11 = v6;
    goto LABEL_10;
  }
  id v32 = 0;
  v7 = objc_msgSend_entitlementsForCurrentTaskWithError_(CLSEntitlements, v5, (uint64_t)&v32);
  id v8 = v32;
  if (v8)
  {
    v10 = v8;

    v11 = 0;
    goto LABEL_10;
  }
  uint64_t v31 = 0;
  int v12 = objc_msgSend_BOOLValueForEntitlement_error_(v7, v9, @"com.apple.private.ClassKit.dashboard", &v31);
  uint64_t v13 = v31;

  v11 = 0;
  if (!v13 && v12)
  {
    id v14 = objc_opt_class();
    v17 = objc_msgSend_endpointClass(v14, v15, v16);
    uint64_t v19 = objc_msgSend_instanceForEndpoint_(v17, v18, (uint64_t)v4);
    endpointConnection = v6->_endpointConnection;
    v6->_endpointConnection = (CLSEndpointConnection *)v19;

    v21 = CLSDispatchQueueName(v6, 0);
    v24 = (const char *)objc_msgSend_UTF8String(v21, v22, v23);
    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    if (qword_1EB5D4738 != -1) {
      dispatch_once(&qword_1EB5D4738, &unk_1F37A13D0);
    }
    v26 = (id)qword_1EB5D4730;
    dispatch_queue_t v27 = dispatch_queue_create_with_target_V2(v24, v25, v26);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v27;

    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (id)utilityServer:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_endpointConnection(self, v5, v6);
  uint64_t v9 = objc_msgSend_utilityServer_(v7, v8, (uint64_t)v4);

  return v9;
}

- (id)syncUtilityServer:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_endpointConnection(self, v5, v6);
  uint64_t v9 = objc_msgSend_syncUtilityServer_(v7, v8, (uint64_t)v4);

  return v9;
}

- (void)userDefaultsConfigurationDictionaryWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC62526C;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_getUserDefaultsConfigurationDictionaryWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)getUserDefaultForDefaultNamed:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC625348;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_getUserDefaultForDefaultNamed_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)setUserDefaultValue:(id)a3 forDefaultNamed:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC625438;
  v15[3] = &unk_1E6C95CF8;
  id v16 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v13 = objc_msgSend_utilityServer_(self, v12, (uint64_t)v15);
  objc_msgSend_remote_setUserDefaultValue_forDefaultNamed_completion_(v13, v14, (uint64_t)v11, v10, v9);
}

- (BOOL)userDefaultForDefaultNamed:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v6 = objc_msgSend_syncUtilityServer_(self, v5, (uint64_t)&unk_1F37A0FF0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DC62561C;
  v10[3] = &unk_1E6C95D40;
  v10[4] = &v11;
  objc_msgSend_remote_getUserDefaultForDefaultNamed_completion_(v6, v7, (uint64_t)v4, v10);
  char v8 = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v8;
}

- (CLSEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end