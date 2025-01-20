@interface IDSSysdiagnoseLogCollector
+ (id)sharedInstance;
- (IDSSysdiagnoseLogCollector)init;
- (void)_collectSysdiagnoseLog:(id)a3;
- (void)collectSysdiagnoseLog:(id)a3;
@end

@implementation IDSSysdiagnoseLogCollector

+ (id)sharedInstance
{
  if (qword_1EB2BB750 != -1) {
    dispatch_once(&qword_1EB2BB750, &unk_1EEFCD878);
  }
  v2 = (void *)qword_1EB2BB7A0;
  return v2;
}

- (IDSSysdiagnoseLogCollector)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSSysdiagnoseLogCollector;
  v2 = [(IDSSysdiagnoseLogCollector *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)collectSysdiagnoseLog:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a3;
  v8 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], v5, v6, v7);
  char isInternalInstall = objc_msgSend_isInternalInstall(v8, v9, v10, v11);

  int v13 = _IDSIsLoggingProfileInstalled();
  if ((isInternalInstall & 1) != 0 || v13)
  {
    objc_msgSend__collectSysdiagnoseLog_(self, v14, (uint64_t)v4, v15);
  }
  else
  {
    IMPrintf();
    v18 = objc_msgSend_stringWithFormat_(NSString, v16, @"Sysdiagnose disabled {isInternalInstall: %@, hasLoggingProfileInstalled: %@}", v17, @"NO", @"NO");
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = v18;
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v26, v20, &v25, 1);
    v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v22, @"IDSSysdiagnoseLogCollectorErrorDomain", v23, -1, v21);
    v4[2](v4, v24);
  }
}

- (void)_collectSysdiagnoseLog:(id)a3
{
  id v3 = a3;
  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", 0, 0);
  if (mach_service)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    uint64_t v6 = v5;
    if (v5)
    {
      xpc_dictionary_set_string(v5, "run", "sysdiagnose");
      xpc_dictionary_set_BOOL(v6, "compress", 1);
      xpc_connection_set_event_handler(mach_service, &unk_1EEFCE0B8);
      xpc_connection_resume(mach_service);
      IMPrintf();
      double v7 = im_primary_queue();
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = sub_19DB64358;
      handler[3] = &unk_1E5975BA8;
      id v9 = v3;
      xpc_connection_send_message_with_reply(mach_service, v6, v7, handler);
    }
  }
}

@end