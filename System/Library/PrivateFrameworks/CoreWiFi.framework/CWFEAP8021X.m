@interface CWFEAP8021X
- (BOOL)isMonitoringEvents;
- (CWFEAP8021X)init;
- (CWFEAP8021X)initWithInterfaceName:(id)a3;
- (NSString)interfaceName;
- (id)clientStatus:(id *)a3;
- (id)controlMode:(id *)a3;
- (id)controlState:(id *)a3;
- (id)eventHandler;
- (id)supplicantState:(id *)a3;
- (void)__startEventMonitoring;
- (void)dealloc;
- (void)setEventHandler:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFEAP8021X

- (CWFEAP8021X)initWithInterfaceName:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CWFEAP8021X;
  v5 = [(CWFEAP8021X *)&v22 init];
  v10 = v5;
  if (!v4) {
    goto LABEL_6;
  }
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v11 = objc_msgSend_copy(v4, v6, v7, v8, v9);
  interfaceName = v10->_interfaceName;
  v10->_interfaceName = (NSString *)v11;

  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v14 = dispatch_queue_create("com.apple.corewifi.EAP8021X-mutex", v13);
  mutexQueue = v10->_mutexQueue;
  v10->_mutexQueue = (OS_dispatch_queue *)v14;

  if (!v10->_mutexQueue) {
    goto LABEL_6;
  }
  v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.corewifi.EAP8021X-event", v16);
  eventQueue = v10->_eventQueue;
  v10->_eventQueue = (OS_dispatch_queue *)v17;

  if (!v10->_eventQueue
    || (v21.version = 0,
        memset(&v21.retain, 0, 24),
        v21.info = v10,
        SCDynamicStoreRef v19 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.corewifi.EAP8021X", (SCDynamicStoreCallBack)sub_1B50086EC, &v21), (v10->_storeRef = v19) == 0))
  {
LABEL_6:

    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  storeRef = self->_storeRef;
  if (storeRef) {
    CFRelease(storeRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)CWFEAP8021X;
  [(CWFEAP8021X *)&v4 dealloc];
}

- (CWFEAP8021X)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"-[CWFEAP8021X init] unavailable", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)__startEventMonitoring
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (sub_1B5009398())
  {
    uint64_t v7 = objc_msgSend_UTF8String(self->_interfaceName, v3, v4, v5, v6);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v8 = (uint64_t (*)(uint64_t))off_1E9D45BF8;
    v29 = off_1E9D45BF8;
    if (!off_1E9D45BF8)
    {
      uint64_t v9 = sub_1B500952C();
      v27[3] = (uint64_t)dlsym(v9, "EAPOLControlKeyCreate");
      off_1E9D45BF8 = (_UNKNOWN *)v27[3];
      uint64_t v8 = (uint64_t (*)(uint64_t))v27[3];
    }
    _Block_object_dispose(&v26, 8);
    if (!v8)
    {
      SCDynamicStoreRef v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
      v23 = objc_msgSend_stringWithUTF8String_(NSString, v20, (uint64_t)"CFStringRef soft_EAPOLControlKeyCreate(const char *)", v21, v22);
      v24 = dlerror();
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v19, v25, (uint64_t)v23, @"CWFEAP8021X.m", 33, @"%s", v24);

      __break(1u);
    }
    uint64_t v14 = v8(v7);
    dispatch_queue_t v17 = (const void *)v14;
    if (v14)
    {
      v30[0] = v14;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v30, 1, v16);
      CFArrayRef v18 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      if (SCDynamicStoreSetNotificationKeys(self->_storeRef, v18, 0)) {
        SCDynamicStoreSetDispatchQueue(self->_storeRef, (dispatch_queue_t)self->_eventQueue);
      }
      CFRelease(v17);
    }
  }
}

- (void)startEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5008C04;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5008CD0;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B5008DEC;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)controlState:(id *)a3
{
  unsigned int v17 = 0;
  CFTypeRef cf = 0;
  if (sub_1B5009398())
  {
    uint64_t v9 = objc_msgSend_UTF8String(self->_interfaceName, v5, v6, v7, v8);
    sub_1B5008F0C(v9, (uint64_t)&v17, (uint64_t)&cf);
    if (v10)
    {
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, *MEMORY[0x1E4F28760], v10, 0);
        uint64_t v14 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, v17, v12, v13);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14;
}

- (id)supplicantState:(id *)a3
{
  int v17 = 0;
  CFTypeRef cf = 0;
  if (sub_1B5009398())
  {
    uint64_t v9 = objc_msgSend_UTF8String(self->_interfaceName, v5, v6, v7, v8);
    sub_1B5008F0C(v9, (uint64_t)&v17, (uint64_t)&cf);
    if (v10)
    {
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, *MEMORY[0x1E4F28760], v10, 0);
        uint64_t v14 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = objc_msgSend_objectForKeyedSubscript_((void *)cf, v11, @"SupplicantState", v12, v13);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14;
}

- (id)controlMode:(id *)a3
{
  int v17 = 0;
  CFTypeRef cf = 0;
  if (sub_1B5009398())
  {
    uint64_t v9 = objc_msgSend_UTF8String(self->_interfaceName, v5, v6, v7, v8);
    sub_1B5008F0C(v9, (uint64_t)&v17, (uint64_t)&cf);
    if (v10)
    {
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, *MEMORY[0x1E4F28760], v10, 0);
        uint64_t v14 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = objc_msgSend_objectForKeyedSubscript_((void *)cf, v11, @"Mode", v12, v13);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14;
}

- (id)clientStatus:(id *)a3
{
  int v17 = 0;
  CFTypeRef cf = 0;
  if (sub_1B5009398())
  {
    uint64_t v9 = objc_msgSend_UTF8String(self->_interfaceName, v5, v6, v7, v8);
    sub_1B5008F0C(v9, (uint64_t)&v17, (uint64_t)&cf);
    if (v10)
    {
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, *MEMORY[0x1E4F28760], v10, 0);
        uint64_t v14 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = objc_msgSend_objectForKeyedSubscript_((void *)cf, v11, @"ClientStatus", v12, v13);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end