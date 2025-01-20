@interface HSTServerStage
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (HSTServerStage)initWithName:(id)a3 description:(id)a4 queue:(id)a5;
- (id).cxx_construct;
- (id)preferenceValueForKey:(id)a3;
- (id)preferences;
- (void)dealloc;
- (void)setPreferenceValue:(id)a3 forKey:(id)a4;
@end

@implementation HSTServerStage

- (HSTServerStage)initWithName:(id)a3 description:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_19:
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HSTServerStage.mm", 25, @"Invalid parameter not satisfying: %@", @"description" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_20;
  }
  v18 = +[NSAssertionHandler currentHandler];
  [v18 handleFailureInMethod:a2, self, @"HSTServerStage.mm", 24, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

  if (!v10) {
    goto LABEL_19;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_20:
  v20 = +[NSAssertionHandler currentHandler];
  [v20 handleFailureInMethod:a2, self, @"HSTServerStage.mm", 26, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)HSTServerStage;
  v12 = [(HSServerStage *)&v25 initWithName:v9 description:v10 queue:v11];
  if (v12)
  {
    unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
    HSUtil::ReceiveRight::ReceiveRight((HSUtil::PortRight *)&v23);
    if ((v24 - 1) >= 0xFFFFFFFE)
    {
      memset(__b, 170, sizeof(__b));
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTServerStage.mm", __b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[HSTServerStage initWithName:description:queue:]();
      }
      v16 = 0;
    }
    else
    {
      unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
      HSUtil::SendRight::SendRight((uint64_t)&v21, (uint64_t)&v23);
      if ((v22 - 1) >= 0xFFFFFFFE)
      {
        memset(__b, 170, sizeof(__b));
        basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTServerStage.mm", __b);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[HSTServerStage initWithName:description:queue:]();
        }
        v16 = 0;
      }
      else
      {
        HSAccessProvider::RegisterServer((HSAccessProvider *)&v21, (const HSUtil::SendRight *)"com.apple.hid.HSServiceDirectory", v13);
        v14 = [[HSServiceDirectory alloc] initWithReceiveRight:&v23 authorizer:&__block_literal_global_3];
        serviceDirectory = v12->_serviceDirectory;
        v12->_serviceDirectory = v14;

        [(HSServiceDirectory *)v12->_serviceDirectory addService:v12];
        v16 = v12;
      }
      HSUtil::SendRight::~SendRight((HSUtil::SendRight *)&v21);
    }
    HSUtil::ReceiveRight::~ReceiveRight((HSUtil::ReceiveRight *)&v23);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

BOOL __49__HSTServerStage_initWithName_description_queue___block_invoke(id a1, __SecTask *a2)
{
  v3 = +[NSString stringWithUTF8String:"com.apple.hid.HSServiceDirectory.access"];
  v4 = (void *)SecTaskCopyValueForEntitlement(a2, v3, 0);

  if (!v4)
  {
    v6 = (__CFString *)SecTaskCopySigningIdentifier(a2, 0);
    v7 = v6;
    if (v6)
    {
      if (([(__CFString *)v6 isEqualToString:@"com.apple.NanoSettings"] & 1) != 0
        || ([(__CFString *)v7 isEqualToString:@"com.apple.Preferences"] & 1) != 0)
      {
        BOOL v5 = 1;
LABEL_13:

        goto LABEL_14;
      }
      v8 = MTLoggingPlugin();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __49__HSTServerStage_initWithName_description_queue___block_invoke_cold_2((uint64_t)v7, v8);
      }
    }
    else
    {
      memset(__b, 170, sizeof(__b));
      basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTServerStage.mm", __b);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __49__HSTServerStage_initWithName_description_queue___block_invoke_cold_1();
      }
    }
    BOOL v5 = 0;
    goto LABEL_13;
  }
  BOOL v5 = 1;
LABEL_14:

  return v5;
}

- (void)dealloc
{
  NSLog(@"~HSTServerStage", a2);
  v3.receiver = self;
  v3.super_class = (Class)HSTServerStage;
  [(HSServerStage *)&v3 dealloc];
}

- (id)preferences
{
  {
    v4 = [[HSPreference alloc] initWithKey:@"remoteAccessEnabled" name:@"Remote Access" description:@"Allow remote connections to the Touch pipeline"];
    BOOL v5 = v4;
    -[HSTServerStage preferences]::prefs = +[NSArray arrayWithObjects:&v5 count:1];
  }
  v2 = (void *)-[HSTServerStage preferences]::prefs;

  return v2;
}

- (id)preferenceValueForKey:(id)a3
{
  id v4 = a3;
  v7[0] = (id)0xAAAAAAAAAAAAAAAALL;
  v7[1] = (id)0xAAAAAAAAAAAAAAAALL;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v7, self);
  if ([v4 isEqualToString:@"remoteAccessEnabled"])
  {
    BOOL v5 = +[NSNumber numberWithBool:self->_state.remoteAccessEnabled];
  }
  else
  {
    BOOL v5 = 0;
  }
  HSUtil::ObjectLock::~ObjectLock(v7);

  return v5;
}

- (void)setPreferenceValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  id v18 = (id)0xAAAAAAAAAAAAAAAALL;
  HSUtil::ObjectLock::ObjectLock((uint64_t)&v17, self);
  if (![v7 isEqualToString:@"remoteAccessEnabled"]) {
    goto LABEL_9;
  }
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8)
    {
      unsigned int v9 = [v8 BOOLValue];
      self->_state.remoteAccessEnabled = v9;
      if (v9)
      {
        v14 = &off_141448;
        v15 = &off_141478;
        v16[1] = -1431655766;
        v16[0] = -1;
        HSAccessProvider::CreateServerSocket((HSAccessProvider *)@"127.0.0.1", (NSString *)((char *)&loc_CAFC + 2), (uint64_t)v12);
        if ((v16[0] & 0x80000000) == 0) {
          close(v16[0]);
        }
        v16[0] = v13;
        int v13 = -1;
        HSUtil::FileDescriptor::~FileDescriptor((HSUtil::FileDescriptor *)v12);
        if ((v16[0] & 0x80000000) == 0) {
          [(HSServiceDirectory *)self->_serviceDirectory setRemoteAccessSocket:&v14];
        }
      }
      else
      {
        serviceDirectory = self->_serviceDirectory;
        v14 = &off_141448;
        v15 = &off_141478;
        v16[0] = -1;
        [(HSServiceDirectory *)serviceDirectory setRemoteAccessSocket:&v14];
      }
      HSUtil::FileDescriptor::~FileDescriptor((HSUtil::FileDescriptor *)&v14);
      int v10 = 1;
      goto LABEL_13;
    }
LABEL_9:
    int v10 = 0;
    goto LABEL_14;
  }
  int v10 = 0;
LABEL_13:

LABEL_14:
  [v18 unlock];
  LOBYTE(v17) = 0;
  if (v10) {
    [(HSStage *)self postNotification:HSPreferenceChangedNotification];
  }
  HSUtil::ObjectLock::~ObjectLock((id *)&v17);
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  HSUtil::Encoder::encodeString((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)114,(char)111,(char)106,(char)101,(char)99,(char)116,(char)86,(char)101,(char)114,(char)115,(char)105,(char)111,(char)110>::Key, "8120.4");
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)handleHSDecode:(void *)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 160) = 0;
  return self;
}

- (void)initWithName:(uint64_t)a1 description:queue:.cold.1(uint64_t a1)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  OUTLINED_FUNCTION_3_1(&def_411C8, v1, v2, "Failed to register mach port in bootstrap namespace: %{public}s", v3, v4, v5, v6, 2u);
}

- (void)initWithName:description:queue:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)initWithName:description:queue:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void __49__HSTServerStage_initWithName_description_queue___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

void __49__HSTServerStage_initWithName_description_queue___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&def_411C8, a2, OS_LOG_TYPE_ERROR, "Process denied access to HSServiceDirectory: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)setPreferenceValue:(uint64_t)a1 forKey:.cold.1(uint64_t a1)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  OUTLINED_FUNCTION_3_1(&def_411C8, v1, v2, "Failed to create server socket: %{public}s", v3, v4, v5, v6, 2u);
}

@end