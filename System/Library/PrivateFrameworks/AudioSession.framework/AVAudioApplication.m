@interface AVAudioApplication
+ (AVAudioApplication)sharedInstance;
+ (BOOL)allowAppToInitiatePlaybackTemporarily:(id)a3 error:(id *)a4;
+ (BOOL)appleTVSupportsEnhanceDialogue;
+ (BOOL)currentRouteSupportsEnhanceDialogue:(id *)a3;
+ (BOOL)getEnhanceDialogueLevel:(int64_t *)a3 error:(id *)a4;
+ (BOOL)iosDeviceSupportsEnhanceDialogue;
+ (BOOL)setEnhanceDialogueLevel:(int64_t)a3 error:(id *)a4;
+ (BOOL)setEnhanceDialoguePreference:(int64_t)a3 error:(id *)a4;
+ (BOOL)toggleInputMute:(id *)a3;
+ (id)muteRunningInputs:(id *)a3;
+ (void)requestMicrophoneInjectionPermissionWithCompletionHandler:(id)a3;
+ (void)requestRecordPermissionWithCompletionHandler:(void *)response;
- (AVAudioApplication)initWithSpecification:(id)a3;
- (AVAudioApplicationRecordPermission)recordPermission;
- (BOOL)isInputMuted;
- (BOOL)privateCreateAudioApplicationInServer:(id)a3;
- (BOOL)privateRecreateAudioApplicationInServer;
- (BOOL)setInputMuteStateChangeHandler:(void *)inputMuteHandler error:(NSError *)outError;
- (BOOL)setInputMuted:(BOOL)a3 context:(id)a4 error:(id *)a5;
- (BOOL)setInputMuted:(BOOL)muted error:(NSError *)outError;
- (BOOL)stemClickMutingEnabled;
- (id).cxx_construct;
- (id)initDelegateForProcess:(id *)a3 processAttribution:(id)a4;
- (id)initPrivate:(id)a3;
- (id)initProxyForProcess:(id *)a3;
- (id)privateCreateAudioApplicationInServer:;
- (id)sessionIDs;
- (int)privateSetAppProperty:(id)a3 value:(id)a4;
- (int)privateSetAppProperty:(id)a3 value:(id)a4 guard:(void *)a5;
- (int)privateSetMXPropertyOnAllSessions:(id)a3 value:(id)a4;
- (int)privateUpdateAppProperty:(id)a3 value:(id)a4 context:(id)a5;
- (int64_t)microphoneInjectionPermission;
- (sync_guard<as::client::AVAudioApplicationImpl,)privateGetImplGuard;
- (tuple<int,)privateGetAppProperty:(id)a3;
- (tuple<int,)privateGetMXProperty:(id)a3;
- (tuple<std::shared_ptr<as::client::XPCConnection>,)privateGetConnection;
- (uint64_t)privateCreateAudioApplicationInServer:;
- (unsigned)clientID;
- (void)dealloc;
- (void)postNotificationName:(id)a3 userInfo:(id)a4;
- (void)privateCreateAudioApplicationInServer:;
- (void)privateEnableSystemMute:(BOOL)a3;
- (void)privateHandlePing;
- (void)privateOptInToStemClickMuting;
@end

@implementation AVAudioApplication

+ (void)requestRecordPermissionWithCompletionHandler:(void *)response
{
  id v4 = response;
  v3 = +[AVAudioSession sharedInstance];
  [v3 requestRecordPermission:v4];
}

+ (BOOL)currentRouteSupportsEnhanceDialogue:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = +[AVAudioSession sharedInstance];
  id v4 = [v3 currentRoute];
  v5 = [v4 outputs];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v6)
  {
    BOOL v21 = 0;
    goto LABEL_43;
  }
  uint64_t v27 = *(void *)v29;
  while (2)
  {
    uint64_t v26 = v6;
    for (uint64_t i = 0; i != v26; ++i)
    {
      if (*(void *)v29 != v27) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(id *)(*((void *)&v28 + 1) + 8 * i);
      if (+[AVAudioApplication appleTVSupportsEnhanceDialogue])
      {
        v9 = [v8 portType];
        if (v9 == @"HDMIOutput")
        {
          v9 = @"HDMIOutput";
LABEL_41:

LABEL_42:
          BOOL v21 = 1;
          goto LABEL_43;
        }
        v10 = [v8 portType];
        if (v10 == @"BluetoothA2DPOutput")
        {
          v22 = @"BluetoothA2DPOutput";
LABEL_40:

          goto LABEL_41;
        }
        v11 = [v8 portType];
        BOOL v12 = v11 == @"BluetoothHFP";

        if (v12) {
          goto LABEL_42;
        }
      }
      if (!+[AVAudioApplication iosDeviceSupportsEnhanceDialogue])goto LABEL_32; {
      v9 = [v8 portType];
      }
      if (v9 == @"Speaker")
      {
        v9 = @"Speaker";
        goto LABEL_41;
      }
      v13 = [v8 portType];
      if (v13 == @"Headphones")
      {
        v22 = @"Headphones";
        goto LABEL_40;
      }
      v14 = [v8 portType];
      if (v14 == @"LineOut")
      {
        BOOL v20 = 1;
      }
      else
      {
        v15 = [v8 portType];
        if (v15 == @"BluetoothA2DPOutput")
        {
          BOOL v20 = 1;
        }
        else
        {
          v16 = [v8 portType];
          if (v16 == @"BluetoothHFP")
          {
            BOOL v20 = 1;
          }
          else
          {
            v17 = [v8 portType];
            if (v17 == @"BluetoothLE")
            {
              BOOL v20 = 1;
            }
            else
            {
              v24 = [v8 portType];
              if (v24 == @"USBAudio")
              {
                BOOL v20 = 1;
              }
              else
              {
                v18 = [v8 portType];
                if (v18 == @"DisplayPort")
                {
                  BOOL v20 = 1;
                }
                else
                {
                  v19 = [v8 portType];
                  BOOL v20 = v19 == @"HDMIOutput";
                }
              }
            }
          }
        }
      }

      if (v20) {
        goto LABEL_42;
      }
LABEL_32:
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    BOOL v21 = 0;
    if (v6) {
      continue;
    }
    break;
  }
LABEL_43:

  return v21;
}

+ (BOOL)iosDeviceSupportsEnhanceDialogue
{
  BOOL IsAPhone = PlatformUtilities_iOS::ProductIsAPhone((PlatformUtilities_iOS *)a1);
  if (IsAPhone || (BOOL v3 = PlatformUtilities_iOS::ProductIsiPad((PlatformUtilities_iOS *)IsAPhone))) {
    LOBYTE(v3) = (_get_cpu_capabilities() & 0x78000000) != 0;
  }
  return v3;
}

+ (BOOL)appleTVSupportsEnhanceDialogue
{
  BOOL IsAppleTV = PlatformUtilities_iOS::ProductIsAppleTV((PlatformUtilities_iOS *)a1);
  if (IsAppleTV)
  {
    int ProductType = PlatformUtilities_iOS::GetProductType((PlatformUtilities_iOS *)IsAppleTV);
    LOBYTE(IsAppleTV) = ProductType == 79 || ProductType == 82;
  }
  return IsAppleTV;
}

+ (AVAudioApplication)sharedInstance
{
  if (+[AVAudioApplication sharedInstance]::onceToken != -1) {
    dispatch_once(&+[AVAudioApplication sharedInstance]::onceToken, &__block_literal_global_2);
  }
  v2 = (void *)+[AVAudioApplication sharedInstance]::singleton;
  return (AVAudioApplication *)v2;
}

void __36__AVAudioApplication_sharedInstance__block_invoke()
{
  as::ProcessIdentity::currentProcess((uint64_t)v8);
  id v0 = objc_alloc_init(MEMORY[0x1E4F4EA18]);
  [v0 setAudioAppType:1886546285];
  v7[0] = v8[0];
  v7[1] = v8[1];
  [v0 setAppAuditToken:v7];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v1 bundleIdentifier];
  [v0 setAttributionBundleID:v2];
  id v4 = ;
  [v0 setProcessName:v4];

  id v5 = [[AVAudioApplication alloc] initPrivate:v0];
  uint64_t v6 = (void *)+[AVAudioApplication sharedInstance]::singleton;
  +[AVAudioApplication sharedInstance]::singleton = (uint64_t)v5;
}

- (AVAudioApplication)initWithSpecification:(id)a3
{
  id v4 = a3;
  if ([v4 audioAppType] == 1886546285)
  {
    id v5 = +[AVAudioApplication sharedInstance];
  }
  else
  {
    id v5 = (AVAudioApplication *)[(AVAudioApplication *)self initPrivate:v4];
    self = v5;
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)initPrivate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    [v4 appAuditToken];
  }
  else {
    memset(&v14[1], 0, 32);
  }
  audit_token_t buf = *(audit_token_t *)&v14[1].receiver;
  audit_token_t atoken = *(audit_token_t *)&v14[1].receiver;
  pid_t v18 = audit_token_to_pid(&atoken);
  audit_token_t v15 = *(audit_token_t *)&v14[1].receiver;
  int v19 = audit_token_to_pidversion(&v15);
  BOOL isValid = as::ProcessIdentity::isValid((as::ProcessIdentity *)&buf);
  if (!isValid)
  {
    id v8 = *(id *)as::client::gSessionClientLog((as::client *)isValid);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      v9 = {;
    }
      buf.val[0] = 136315650;
      *(void *)&buf.val[1] = "AVAudioApplication.mm";
      LOWORD(buf.val[3]) = 1024;
      *(unsigned int *)((char *)&buf.val[3] + 2) = 196;
      HIWORD(buf.val[4]) = 2112;
      *(void *)&buf.val[5] = v9;
      _os_log_impl(&dword_1A169D000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Error - bad audit token provided (creation description: %@)", (uint8_t *)&buf, 0x1Cu);
    }
    goto LABEL_14;
  }
  v14[0].receiver = self;
  v14[0].super_class = (Class)AVAudioApplication;
  self = [(objc_super *)v14 init];
  if (!self) {
    goto LABEL_19;
  }
  v7 = (as::client *)[v5 audioAppType];
  if (v7 == (as::client *)1684825972)
  {
    if (![(AVAudioApplication *)self privateCreateAudioApplicationInServer:v5])goto LABEL_14; {
    [(AVAudioApplication *)self privateOptInToStemClickMuting];
    }
LABEL_19:
    self = self;
    v10 = self;
    goto LABEL_20;
  }
  if (v7 == (as::client *)1886546285)
  {
    if (![(AVAudioApplication *)self privateCreateAudioApplicationInServer:v5])goto LABEL_14; {
    _CFNotificationCenterRegisterDependentNotificationList();
    }
    goto LABEL_19;
  }
  if (v7 == (as::client *)1886547832)
  {
    if ([(AVAudioApplication *)self privateCreateAudioApplicationInServer:v5])
    {
      goto LABEL_19;
    }
  }
  else
  {
    BOOL v12 = *(id *)as::client::gSessionClientLog(v7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      v13 = {;
    }
      buf.val[0] = 136315650;
      *(void *)&buf.val[1] = "AVAudioApplication.mm";
      LOWORD(buf.val[3]) = 1024;
      *(unsigned int *)((char *)&buf.val[3] + 2) = 230;
      HIWORD(buf.val[4]) = 2112;
      *(void *)&buf.val[5] = v13;
      _os_log_impl(&dword_1A169D000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Error - unknown audio app type. creation description: %@", (uint8_t *)&buf, 0x1Cu);
    }
  }
LABEL_14:
  v10 = 0;
LABEL_20:

  return v10;
}

- (void)dealloc
{
  if (self->_impl.__ptr_.__value_)
  {
    BOOL v3 = (uint64_t **)CADeprecated::TSingleton<ApplicationMap>::instance();
    value = (os_unfair_lock_s *)self->_impl.__ptr_.__value_;
    os_unfair_lock_lock(value);
    ApplicationMap::Remove(v3, value[6]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(value);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAudioApplication;
  [(AVAudioApplication *)&v5 dealloc];
}

- (unsigned)clientID
{
  value = (os_unfair_lock_s *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock(value);
  unsigned int os_unfair_lock_opaque = value[6]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(value);
  return os_unfair_lock_opaque;
}

- (BOOL)isInputMuted
{
  [(AVAudioApplication *)self privateGetAppProperty:@"InputMute"];
  id v3 = v9;
  id v4 = v3;
  if (v8) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    char v6 = 0;
  }
  else
  {
    char v6 = [v3 BOOLValue];
    self->_inputMuted = v6;
  }

  return v6;
}

- (BOOL)setInputMuted:(BOOL)muted error:(NSError *)outError
{
  return [(AVAudioApplication *)self setInputMuted:muted context:0 error:outError];
}

- (BOOL)setInputMuteStateChangeHandler:(void *)inputMuteHandler error:(NSError *)outError
{
  if (outError)
  {
    NSErrorUnimplemented();
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (AVAudioApplicationRecordPermission)recordPermission
{
  v2 = +[AVAudioSession sharedInstance];
  AVAudioApplicationRecordPermission v3 = [v2 recordPermission];

  return v3;
}

- (int64_t)microphoneInjectionPermission
{
  v2 = +[AVAudioSession sharedInstance];
  char v3 = [v2 isMicrophoneInjectionServiceEnabledByUser];

  if ((v3 & 1) == 0) {
    return 1936876659;
  }
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1970168948;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__AVAudioApplication_microphoneInjectionPermission__block_invoke;
  v6[3] = &unk_1E5A82878;
  v6[4] = &v7;
  makeTCCAccessRequest(0, 2, 1768843892, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __51__AVAudioApplication_microphoneInjectionPermission__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 1684369017;
  if (a2 == 1) {
    uint64_t v2 = 1970168948;
  }
  if (a2 == 2) {
    uint64_t v2 = 1735552628;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  return result;
}

+ (void)requestMicrophoneInjectionPermissionWithCompletionHandler:(id)a3
{
  char v3 = (void (**)(id, uint64_t))a3;
  int64_t v4 = +[AVAudioApplication sharedInstance];
  uint64_t v5 = [v4 microphoneInjectionPermission];

  if (v5 == 1684369017 || v5 == 1735552628 || v5 == 1936876659)
  {
    v3[2](v3, v5);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _OWORD v8[2] = __80__AVAudioApplication_requestMicrophoneInjectionPermissionWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E5A82A18;
    uint64_t v9 = v3;
    makeTCCAccessRequest(1, 0, 1768843892, v8);
  }
}

void __80__AVAudioApplication_requestMicrophoneInjectionPermissionWithCompletionHandler___block_invoke(as::client *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = *(id *)as::client::gSessionClientLog(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    buf[0] = 136315650;
    *(void *)&buf[1] = "AVAudioApplication.mm";
    __int16 v6 = 1024;
    int v7 = 355;
    __int16 v8 = 1024;
    BOOL v9 = a2 == 2;
    _os_log_impl(&dword_1A169D000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Got Microphone Injection Permission value %d", (uint8_t *)buf, 0x18u);
  }
  EphemeralAudioApp::EphemeralAudioApp((EphemeralAudioApp *)&v4);
}

- (sync_guard<as::client::AVAudioApplicationImpl,)privateGetImplGuard
{
  char v3 = v2;
  value = (os_unfair_lock_s *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock(value);
  NSObject *v3 = value;
  v3[1] = value + 2;
  result.var1.var0 = v6;
  result.var0 = v5;
  return result;
}

- (tuple<std::shared_ptr<as::client::XPCConnection>,)privateGetConnection
{
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), (__n128 *)retstr);
  if (value)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  }
  return result;
}

- (void)privateOptInToStemClickMuting
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v3 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    value = (os_unfair_lock_s *)self->_impl.__ptr_.__value_;
    os_unfair_lock_lock(value);
    uint32_t os_unfair_lock_opaque = value[18]._os_unfair_lock_opaque;
    int v8 = 136315650;
    BOOL v9 = "AVAudioApplication.mm";
    __int16 v10 = 1024;
    int v11 = 389;
    __int16 v12 = 1024;
    uint32_t v13 = os_unfair_lock_opaque;
    _os_log_impl(&dword_1A169D000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d App (pid:%d) registered to observe AVAudioApplication input mute notifications", (uint8_t *)&v8, 0x18u);
    os_unfair_lock_unlock(value);
  }

  __int16 v6 = (as::client *)[(AVAudioApplication *)self privateSetMXPropertyOnAllSessions:*MEMORY[0x1E4F764D8] value:MEMORY[0x1E4F1CC38]];
  if (v6)
  {
    int v7 = *(id *)as::client::gSessionClientLog(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      BOOL v9 = "AVAudioApplication.mm";
      __int16 v10 = 1024;
      int v11 = 407;
      _os_log_impl(&dword_1A169D000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to opt in to PrefersBluetoothAccessoryMuting", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (void)privateEnableSystemMute:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSNumber numberWithBool:a3];
  LODWORD(self) = [(AVAudioApplication *)self privateSetAppProperty:@"EnableSystemMute" value:v4];

  __int16 v6 = *(id *)as::client::gSessionClientLog(v5);
  int v7 = v6;
  if (self)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v11 = 136315394;
    __int16 v12 = "AVAudioApplication.mm";
    __int16 v13 = 1024;
    int v14 = 419;
    int v8 = "%25s:%-5d Failed to set EnableSystemMute property";
    BOOL v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v11 = 136315394;
    __int16 v12 = "AVAudioApplication.mm";
    __int16 v13 = 1024;
    int v14 = 422;
    int v8 = "%25s:%-5d Enabled system mute";
    BOOL v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_1A169D000, v9, v10, v8, (uint8_t *)&v11, 0x12u);
}

- (BOOL)privateCreateAudioApplicationInServer:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  operator new();
}

- (BOOL)privateRecreateAudioApplicationInServer
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  os_unfair_lock_t lock = (os_unfair_lock_t)value;
  v64 = (as::client::AVAudioApplicationImpl *)(value + 8);
  uint64_t v3 = *((unsigned int *)value + 6);
  uint64_t v4 = (uint64_t **)CADeprecated::TSingleton<ApplicationMap>::instance();
  ApplicationMap::Remove(v4, v3);
  uint64_t v5 = (as::client::XPCConnection *)*((void *)value + 14);
  __int16 v6 = (std::__shared_weak_count *)*((void *)value + 15);
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  as::client::XPCConnection::sync_message<unsigned int>(v5, (uint64_t)v82);
  int v7 = (void *)MEMORY[0x1A6235350]();
  int v8 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int>::sync_proxy((void **)v82);
  uint64_t v9 = *((void *)v64 + 3);
  os_log_type_t v10 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int>::reply((uint64_t)v82);
  [v8 createAudioApplicationForSpecification:v9 reply:v10];

  int v11 = (as::client *)*(id *)&v82[40];
  v46 = v11;
  if (v11)
  {
    __int16 v12 = *(id *)as::client::gSessionClientLog(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = __int16 v13 = [(as::client *)v46 description];
      *(_DWORD *)audit_token_t buf = 136315906;
      *(void *)&buf[4] = "AVAudioApplication.mm";
      __int16 v74 = 1024;
      int v75 = 476;
      __int16 v76 = 2112;
      v77 = v13;
      __int16 v78 = 2112;
      v79 = v14;
      _os_log_impl(&dword_1A169D000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to recreate application, error: %@, specification: %@", buf, 0x26u);
    }
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = v83;
  }

  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned int> &&)>::~__value_func[abi:ne180100](&v82[8]);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  if (!v46)
  {
    as::client::AVAudioApplicationImpl::SetClientID((uint64_t)v64, v15);
    v16 = (ApplicationMap *)CADeprecated::TSingleton<ApplicationMap>::instance();
    ApplicationMap::Add(v16, v15, self);
    as::AudioAppState::getPropertyApp((id *)v64 + 9, &cfstr_Hasinputmuteha.isa, (uint64_t)v61);
    id v45 = v62;
    if (v45)
    {
      if ([v45 unsignedIntegerValue] == v3)
      {
        v17 = (id *)v64;
        pid_t v18 = [NSNumber numberWithUnsignedInt:v15];
        LOBYTE(v17) = as::AudioAppState::setPropertyApp(v17 + 9, @"HasInputMuteHandlerSetMacOS", v18) == 0;

        if ((v17 & 1) == 0)
        {
          uint64_t v20 = *(id *)as::client::gSessionClientLog(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v82 = 136315906;
            *(void *)&v82[4] = "AVAudioApplication.mm";
            *(_WORD *)&v82[12] = 1024;
            *(_DWORD *)&v82[14] = 495;
            *(_WORD *)&v82[18] = 1024;
            *(_DWORD *)&v82[20] = v3;
            *(_WORD *)&v82[24] = 1024;
            *(_DWORD *)&v82[26] = v15;
            _os_log_impl(&dword_1A169D000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d error - failed to update ClientOwningInputMuteHandlerMacOS from old clientID (%u) to new clientID (%u)", v82, 0x1Eu);
          }
        }
      }
    }
    as::AudioAppState::getAppPropertiesExplicitlySet((id *)v64 + 9);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    v48 = long long v58 = 0u;
    BOOL v21 = [v48 allKeys];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v57 objects:v85 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v58;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v58 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v57 + 1) + 8 * v24);
          {
            as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
          }
          if (!as::AudioSessionMuteEnabled(void)::enabled
            || ([v25 isEqualToString:@"InputMute"] & 1) == 0)
          {
            uint64_t v26 = objc_msgSend(v48, "objectForKey:", v25, v45);
            BOOL v27 = [(AVAudioApplication *)self privateSetAppProperty:v25 value:v26 guard:&lock] == 0;

            if (!v27)
            {
              long long v29 = *(id *)as::client::gSessionClientLog(v28);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                long long v30 = [v48 objectForKey:v25];
                *(_DWORD *)v82 = 136315906;
                *(void *)&v82[4] = "AVAudioApplication.mm";
                *(_WORD *)&v82[12] = 1024;
                *(_DWORD *)&v82[14] = 513;
                *(_WORD *)&v82[18] = 2112;
                *(void *)&v82[20] = v25;
                *(_WORD *)&v82[28] = 2112;
                *(void *)&v82[30] = v30;
                _os_log_impl(&dword_1A169D000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d error - failed to apply app property {key: %@ value: %@} after server restart", v82, 0x26u);
              }
            }
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v31 = [v21 countByEnumeratingWithState:&v57 objects:v85 count:16];
        uint64_t v22 = v31;
      }
      while (v31);
    }

    as::AudioAppState::getMXPropertiesExplicitlySet((id *)v64 + 9);
    id vala = (id)objc_claimAutoreleasedReturnValue();
    as::client::AVAudioApplicationImpl::GetConnection((__n128 *)v64, (__n128 *)v82);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = [vala allKeys];
    uint64_t v32 = [obj countByEnumeratingWithState:&v53 objects:v81 count:16];
    if (v32)
    {
      uint64_t v49 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v54 != v49) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          as::client::XPCConnection::sync_message<>(*(as::client::XPCConnection **)v82, buf);
          v35 = (void *)MEMORY[0x1A6235350]();
          v36 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy((void **)buf);
          v52[0] = *(_OWORD *)&v82[16];
          v52[1] = *(_OWORD *)&v82[32];
          uint64_t v37 = v84;
          v38 = [vala objectForKey:v34];
          v39 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)buf);
          [v36 setMXPropertyOnAllSessions:v52 clientID:v37 MXProperty:v34 values:v38 reply:v39];

          v40 = (as::client *)v80;
          v41 = v40;
          if (v40)
          {
            v42 = *(id *)as::client::gSessionClientLog(v40);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              v43 = [vala objectForKey:v34];
              *(_DWORD *)v65 = 136315906;
              v66 = "AVAudioApplication.mm";
              __int16 v67 = 1024;
              int v68 = 533;
              __int16 v69 = 2112;
              uint64_t v70 = v34;
              __int16 v71 = 2112;
              v72 = v43;
              _os_log_impl(&dword_1A169D000, v42, OS_LOG_TYPE_ERROR, "%25s:%-5d error - failed to apply MX property {key: %@ value: %@} after server restart", v65, 0x26u);
            }
          }

          _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(&buf[8]);
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v53 objects:v81 count:16];
      }
      while (v32);
    }

    if (*(void *)&v82[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v82[8]);
    }
  }
  if (lock) {
    os_unfair_lock_unlock(lock);
  }
  return v46 == 0;
}

- (tuple<int,)privateGetMXProperty:(id)a3
{
  uint64_t v5 = v3;
  id v6 = a3;
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v10);
  if (v10[0].n128_u64[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10[0].n128_u64[1]);
  }
  if (value) {
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  }

  result.var0.var1 = v9;
  *(void *)&result.var0.var0 = v8;
  return result;
}

- (tuple<int,)privateGetAppProperty:(id)a3
{
  uint64_t v5 = v3;
  id v6 = a3;
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v10);
  if (v10[0].n128_u64[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10[0].n128_u64[1]);
  }
  if (value) {
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  }

  result.var0.var1 = v9;
  *(void *)&result.var0.var0 = v8;
  return result;
}

- (int)privateSetAppProperty:(id)a3 value:(id)a4 guard:(void *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  as::client::AVAudioApplicationImpl::GetConnection(*((__n128 **)a5 + 1), v19);
  as::client::XPCConnection::sync_message<>((as::client::XPCConnection *)v19[0].n128_u64[0], &v21);
  uint64_t v9 = (void *)MEMORY[0x1A6235350]();
  os_log_type_t v10 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v21);
  __n128 v17 = v19[1];
  __n128 v18 = v19[2];
  uint64_t v11 = v20;
  __int16 v12 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v21);
  [v10 setApplicationProperty:&v17 clientID:v11 propertyID:v7 propertyValue:v8 reply:v12];

  id v13 = v23;
  if (v13)
  {
    int v14 = v13;
    int v15 = objc_msgSend(v13, "code", *(_OWORD *)&v17, *(_OWORD *)&v18);
  }
  else
  {
    int v15 = as::AudioAppState::setPropertyApp((id *)(*((void *)a5 + 1) + 72), v7, v8);
  }

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v22);
  if (v19[0].n128_u64[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v19[0].n128_u64[1]);
  }

  return v15;
}

- (int)privateSetAppProperty:(id)a3 value:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v20);
  if (value) {
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  }
  as::client::XPCConnection::sync_message<>((as::client::XPCConnection *)v20[0].n128_u64[0], &v22);
  uint64_t v9 = (void *)MEMORY[0x1A6235350]();
  os_log_type_t v10 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v22);
  __n128 v18 = v20[1];
  __n128 v19 = v20[2];
  uint64_t v11 = v21;
  __int16 v12 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v22);
  [v10 setApplicationProperty:&v18 clientID:v11 propertyID:v6 propertyValue:v7 reply:v12];

  id v13 = v24;
  if (v13)
  {
    int v14 = v13;
    int v15 = objc_msgSend(v13, "code", *(_OWORD *)&v18, *(_OWORD *)&v19);
  }
  else
  {
    v16 = self->_impl.__ptr_.__value_;
    os_unfair_lock_lock((os_unfair_lock_t)v16);
    int v15 = as::AudioAppState::setPropertyApp((id *)v16 + 10, v6, v7);
    if (v16) {
      os_unfair_lock_unlock((os_unfair_lock_t)v16);
    }
  }

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v23);
  if (v20[0].n128_u64[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v20[0].n128_u64[1]);
  }

  return v15;
}

- (int)privateUpdateAppProperty:(id)a3 value:(id)a4 context:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v23);
  if (value) {
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  }
  as::client::XPCConnection::sync_message<>((as::client::XPCConnection *)v23[0].n128_u64[0], &v25);
  __int16 v12 = (void *)MEMORY[0x1A6235350]();
  id v13 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v25);
  __n128 v21 = v23[1];
  __n128 v22 = v23[2];
  uint64_t v14 = v24;
  int v15 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v25);
  [v13 updateApplicationProperty:&v21 clientID:v14 propertyID:v8 propertyValue:v9 context:v10 reply:v15];

  id v16 = v27;
  if (v16)
  {
    __n128 v17 = v16;
    int v18 = objc_msgSend(v16, "code", *(_OWORD *)&v21, *(_OWORD *)&v22);
  }
  else
  {
    __n128 v19 = self->_impl.__ptr_.__value_;
    os_unfair_lock_lock((os_unfair_lock_t)v19);
    int v18 = as::AudioAppState::setPropertyApp((id *)v19 + 10, v8, v9);
    if (v19) {
      os_unfair_lock_unlock((os_unfair_lock_t)v19);
    }
  }

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v26);
  if (v23[0].n128_u64[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v23[0].n128_u64[1]);
  }

  return v18;
}

- (int)privateSetMXPropertyOnAllSessions:(id)a3 value:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v20);
  if (value) {
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  }
  as::client::XPCConnection::sync_message<>((as::client::XPCConnection *)v20[0].n128_u64[0], &v22);
  id v9 = (void *)MEMORY[0x1A6235350]();
  id v10 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v22);
  __n128 v18 = v20[1];
  __n128 v19 = v20[2];
  uint64_t v11 = v21;
  __int16 v12 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v22);
  [v10 setMXPropertyOnAllSessions:&v18 clientID:v11 MXProperty:v6 values:v7 reply:v12];

  id v13 = v24;
  if (v13)
  {
    uint64_t v14 = v13;
    int v15 = objc_msgSend(v13, "code", *(_OWORD *)&v18, *(_OWORD *)&v19);
  }
  else
  {
    id v16 = (os_unfair_lock_s *)self->_impl.__ptr_.__value_;
    os_unfair_lock_lock(v16);
    int v15 = as::AudioAppState::setPropertyMX((uint64_t)&v16[20], v6, v7);
    if (v16) {
      os_unfair_lock_unlock(v16);
    }
  }

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v23);
  if (v20[0].n128_u64[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v20[0].n128_u64[1]);
  }

  return v15;
}

- (void).cxx_destruct
{
  value = self->_impl.__ptr_.__value_;
  p_impl = &self->_impl;
  uint64_t v3 = (uint64_t)value;
  p_impl->__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<caulk::synchronized<as::client::AVAudioApplicationImpl,caulk::mach::unfair_lock,caulk::empty_atomic_interface<as::client::AVAudioApplicationImpl>>>::operator()[abi:ne180100]((uint64_t)p_impl, v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (id)initProxyForProcess:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F4EA18]);
  [v5 setAudioAppType:1886547832];
  long long v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  id v7 = [v5 setAppAuditToken:v10];
  [v5 setProcessName:v7];

  id v8 = [(AVAudioApplication *)self initWithSpecification:v5];
  return v8;
}

- (id)initDelegateForProcess:(id *)a3 processAttribution:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F4EA18]);
  [v7 setAudioAppType:1684825972];
  long long v8 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v8;
  id v9 = [v7 setAppAuditToken:v12];
  [v7 setProcessName:v9];

  id v10 = [(AVAudioApplication *)self initWithSpecification:v7];
  return v10;
}

- (BOOL)setInputMuted:(BOOL)a3 context:(id)a4 error:(id *)a5
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", a3, a4);
  int v8 = [(AVAudioApplication *)self privateSetAppProperty:@"InputMute" value:v7];

  if (v8)
  {
    id v10 = *(id *)as::client::gSessionClientLog(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = "unmuted";
      uint64_t v14 = "AVAudioApplication.mm";
      int v16 = 681;
      __int16 v17 = 2080;
      int v13 = 136315906;
      __int16 v15 = 1024;
      if (v5) {
        uint64_t v11 = "muted";
      }
      __n128 v18 = v11;
      __int16 v19 = 1024;
      int v20 = v8;
      _os_log_impl(&dword_1A169D000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set input %s, err:%d", (uint8_t *)&v13, 0x22u);
    }
    return FormatNSErrorForReturn();
  }
  else
  {
    self->_inputMuted = v5;
    return 1;
  }
}

+ (BOOL)toggleInputMute:(id *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  EphemeralAudioApp::EphemeralAudioApp((EphemeralAudioApp *)&v4);
}

+ (id)muteRunningInputs:(id *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  {
    as::SmartRoutingPrioritizesCall(void)::enabled = _os_feature_enabled_impl();
  }
  if (as::SmartRoutingPrioritizesCall(void)::enabled) {
    EphemeralAudioApp::EphemeralAudioApp((EphemeralAudioApp *)&v5);
  }
  *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:2003329396 userInfo:0];
  return 0;
}

+ (BOOL)allowAppToInitiatePlaybackTemporarily:(id)a3 error:(id *)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _ZNSt3__115allocate_sharedB8ne180100INS_15recursive_mutexENS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v6);
  as::client::XPCConnection::CreateForAudioApplication();
}

+ (BOOL)setEnhanceDialoguePreference:(int64_t)a3 error:(id *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  EphemeralAudioApp::EphemeralAudioApp((EphemeralAudioApp *)&v5);
}

+ (BOOL)setEnhanceDialogueLevel:(int64_t)a3 error:(id *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  EphemeralAudioApp::EphemeralAudioApp((EphemeralAudioApp *)&v5);
}

+ (BOOL)getEnhanceDialogueLevel:(int64_t *)a3 error:(id *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  EphemeralAudioApp::EphemeralAudioApp((EphemeralAudioApp *)&v5);
}

- (id)sessionIDs
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v16);
  if (value) {
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  }
  as::client::XPCConnection::sync_message<NSArray * {__strong}>((as::client::XPCConnection *)v16[0].n128_u64[0], &v27);
  uint64_t v3 = (void *)MEMORY[0x1A6235350]();
  id v4 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v27);
  __n128 v14 = v16[1];
  __n128 v15 = v16[2];
  uint64_t v5 = v18;
  uint64_t v6 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v27);
  [v4 sessionIDs:&v14 clientID:v5 reply:v6];

  uint64_t v7 = (as::client *)v29;
  if (v7)
  {
    int v8 = v7;
    id v9 = *(id *)as::client::gSessionClientLog(v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = v17;
      uint64_t v11 = [(as::client *)v8 description];
      *(_DWORD *)audit_token_t buf = 136315906;
      int v20 = "AVAudioApplication.mm";
      __int16 v21 = 1024;
      int v22 = 890;
      __int16 v23 = 1024;
      int v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      _os_log_impl(&dword_1A169D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get session IDs for app: %d, err: %@", buf, 0x22u);
    }
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v12 = v30;
  }

  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray * {__strong}> &&)>::~__value_func[abi:ne180100](v28);
  if (v16[0].n128_u64[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v16[0].n128_u64[1]);
  }
  return v12;
}

- (BOOL)stemClickMutingEnabled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(AVAudioApplication *)self privateGetMXProperty:*MEMORY[0x1E4F764D8]];
  uint64_t v2 = v9;
  uint64_t v3 = v2;
  if (v8) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0;
  }
  if (v4)
  {
    uint64_t v5 = *(id *)as::client::gSessionClientLog(v2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 136315394;
      uint64_t v11 = "AVAudioApplication.mm";
      __int16 v12 = 1024;
      int v13 = 912;
      _os_log_impl(&dword_1A169D000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get PrefersBluetoothAccessoryMuting", buf, 0x12u);
    }
    char v6 = 0;
  }
  else
  {
    char v6 = [(as::client *)v2 BOOLValue];
  }

  return v6;
}

- (void)privateHandlePing
{
  v54[1] = *MEMORY[0x1E4F143B8];
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v40);
  if (value) {
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  }
  as::client::XPCConnection::sync_message<NSArray * {__strong}>((as::client::XPCConnection *)v40[0].n128_u64[0], &v50);
  uint64_t v3 = (void *)MEMORY[0x1A6235350]();
  BOOL v4 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v50);
  v39[0] = v40[1];
  v39[1] = v40[2];
  uint64_t v5 = v42;
  char v6 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v50);
  [v4 getApplicationMessages:v39 clientID:v5 reply:v6];

  if (v52)
  {
    int v8 = *(id *)as::client::gSessionClientLog(v7);
    id obj = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVAudioApplication.mm";
      __int16 v44 = 1024;
      int v45 = 933;
      __int16 v46 = 2112;
      *(void *)v47 = v52;
      id v9 = v52;
      _os_log_impl(&dword_1A169D000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error:. %@", buf, 0x1Cu);
    }
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v53;
    uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(obj);
          }
          int v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v11 = v10;
          __int16 v12 = (as::client *)[v11 countByEnumeratingWithState:&v31 objects:v48 count:16];
          int v13 = v12;
          if (v12)
          {
            uint64_t v14 = *(void *)v32;
            do
            {
              __n128 v15 = 0;
              do
              {
                if (*(void *)v32 != v14) {
                  objc_enumerationMutation(v11);
                }
                int v16 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v15);
                int v17 = *(id *)as::client::gSessionClientLog(v12);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)audit_token_t buf = 136315906;
                  *(void *)&uint8_t buf[4] = "AVAudioApplication.mm";
                  __int16 v44 = 1024;
                  int v45 = 944;
                  __int16 v46 = 1024;
                  *(_DWORD *)v47 = v41;
                  *(_WORD *)&v47[4] = 2112;
                  *(void *)&v47[6] = v16;
                  _os_log_impl(&dword_1A169D000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d Handling application deferred message, PID = %d, notificationName = %@", buf, 0x22u);
                }
                unsigned int v18 = [v11 objectForKey:v16];
                if ([v16 isEqualToString:@"AVAudioApplicationInputMuteStateChangeNotification"])
                {
                  __int16 v19 = [v18 valueForKey:@"AVAudioApplicationMuteStateKey"];
                  if (v19)
                  {
                    int v20 = self->_impl.__ptr_.__value_;
                    os_unfair_lock_lock((os_unfair_lock_t)v20);
                    as::AudioAppState::setPropertyApp((id *)v20 + 10, @"InputMute", v19);
                    if (v20) {
                      os_unfair_lock_unlock((os_unfair_lock_t)v20);
                    }
                  }
                }
                __int16 v21 = self;
                id v22 = v18;
                if ([v16 isEqualToString:@"AVAudioApplicationInputMuteStateChangeNotification"])
                {
                  uint64_t v23 = [v22 valueForKey:@"AVAudioApplicationMuteStateKey"];
                  int v24 = (void *)v23;
                  if (v23)
                  {
                    v54[0] = @"AVAudioApplicationMuteStateKey";
                    *(void *)audit_token_t buf = v23;
                    __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v54 count:1];
                    [(AVAudioApplication *)v21 postNotificationName:@"AVAudioApplicationInputMuteStateChangeNotification" userInfo:v25];
                  }
                }

                __n128 v15 = (as::client *)((char *)v15 + 1);
              }
              while (v13 != v15);
              __int16 v12 = (as::client *)[v11 countByEnumeratingWithState:&v31 objects:v48 count:16];
              int v13 = v12;
            }
            while (v12);
          }
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
      }
      while (v28);
    }
  }
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray * {__strong}> &&)>::~__value_func[abi:ne180100](v51);

  if (v40[0].n128_u64[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v40[0].n128_u64[1]);
  }
}

- (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = __62__AVAudioApplication_Internal__postNotificationName_userInfo___block_invoke;
  v10[3] = &unk_1E5A82A40;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __62__AVAudioApplication_Internal__postNotificationName_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:*(void *)(a1 + 32) object:v4 userInfo:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (uint64_t)privateCreateAudioApplicationInServer:
{
  return a1;
}

- (void)privateCreateAudioApplicationInServer:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained) {
    [WeakRetained privateRecreateAudioApplicationInServer];
  }
}

- (id)privateCreateAudioApplicationInServer:
{
  v1 = (id *)(a1 + 8);
  uint64_t v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_1EF4FBCA0;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end