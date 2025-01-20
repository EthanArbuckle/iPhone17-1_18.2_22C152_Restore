@interface MouseSettingsManager
- (BOOL)handleGetProperty:(id)a3;
- (BOOL)handleSetProperty:(id)a3 value:(id)a4;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (MouseSettingsManager)initWithDevice:(__MTDevice *)a3 parserOptions:(int)a4 handler:(id)a5;
- (NSMutableDictionary)mPreferences;
- (void)dealloc;
- (void)determineMouseSettings;
- (void)fetchDefaultPreference;
- (void)sync;
@end

@implementation MouseSettingsManager

- (MouseSettingsManager)initWithDevice:(__MTDevice *)a3 parserOptions:(int)a4 handler:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MouseSettingsManager;
  v9 = [(MouseSettingsManager *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_mtDeviceRef = a3;
    v9->_parserOptions = a4;
    id v11 = objc_retainBlock(v8);
    id handlerBlock = v10->_handlerBlock;
    v10->_id handlerBlock = v11;

    userPrefDict = v10->_userPrefDict;
    v10->_userPrefDict = (NSDictionary *)&off_149EC0;

    *(_WORD *)&v10->_mSettings.horizontalScrolling = 257;
    v10->_mSettings.navSwipes2F = 0;
    *(void *)&v10->_mSettings.dockSwipes2F = 0x101010101010101;
    [(MouseSettingsManager *)v10 fetchDefaultPreference];
    v14 = v10;
  }

  return v10;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    [(MouseBridge *)v4 dealloc];
  }
  v5.receiver = self;
  v5.super_class = (Class)MouseSettingsManager;
  [(MouseSettingsManager *)&v5 dealloc];
}

- (BOOL)handleSetProperty:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSDictionary *)self->_userPrefDict objectForKeyedSubscript:v6];

  if (v8)
  {
    [(NSMutableDictionary *)self->_mPreferences setObject:v7 forKeyedSubscript:v6];
    [(MouseSettingsManager *)self determineMouseSettings];
    id handlerBlock = (void (**)(id, mt_StandardMouseSettings *, uint64_t))self->_handlerBlock;
    if (handlerBlock) {
      handlerBlock[2](handlerBlock, &self->_mSettings, 1);
    }
  }

  return v8 != 0;
}

- (BOOL)handleGetProperty:(id)a3
{
  v4 = a3;
  objc_super v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  id v6 = [(NSDictionary *)self->_userPrefDict objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_mPreferences objectForKeyedSubscript:v5];
    id v8 = (void *)v4[5];
    v4[5] = v7;
LABEL_8:

    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"MTEventSource"])
  {
    id v8 = (void *)v4[5];
    CFStringRef v9 = (const __CFString *)&__kCFBooleanTrue;
LABEL_7:
    v4[5] = v9;
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"DeviceTypeHint"])
  {
    id v8 = (void *)v4[5];
    CFStringRef v9 = @"Mouse";
    goto LABEL_7;
  }
LABEL_9:

  return v6 != 0;
}

- (void)sync
{
  [(MouseSettingsManager *)self determineMouseSettings];
  id handlerBlock = self->_handlerBlock;
  if (handlerBlock)
  {
    v4 = (void (*)(void))*((void *)handlerBlock + 2);
    v4();
  }
}

- (void)determineMouseSettings
{
  id v13 = [(NSMutableDictionary *)self->_mPreferences objectForKeyedSubscript:@"MouseHorizontalScroll"];
  self->_mSettings.horizontalScrolling = [v13 BOOLValue];

  id v14 = [(NSMutableDictionary *)self->_mPreferences objectForKeyedSubscript:@"MouseVerticalScroll"];
  self->_mSettings.verticalScrolling = [v14 BOOLValue];

  v3 = [(NSMutableDictionary *)self->_mPreferences objectForKeyedSubscript:@"MouseTwoFingerHorizSwipeGesture"];
  v4 = v3;
  if (v3) {
    char v5 = [v3 intValue] == 1;
  }
  else {
    char v5 = 1;
  }
  self->_mSettings.navSwipes2F = v5;
  id v6 = [(NSMutableDictionary *)self->_mPreferences objectForKeyedSubscript:@"MouseTwoFingerHorizSwipeGesture"];

  if (v6) {
    char v7 = [v6 intValue] == 2;
  }
  else {
    char v7 = 1;
  }
  self->_mSettings.dockSwipes2F = v7;
  id v8 = [(NSMutableDictionary *)self->_mPreferences objectForKeyedSubscript:@"MouseOneFingerDoubleTapGesture"];

  if (v8) {
    char v9 = [v8 intValue] == 1;
  }
  else {
    char v9 = 1;
  }
  self->_mSettings.zoomToggle = v9;
  self->_mSettings.showDefinition = 0;
  id v15 = [(NSMutableDictionary *)self->_mPreferences objectForKeyedSubscript:@"MouseTwoFingerDoubleTapGesture"];

  if (v15) {
    char v10 = [v15 intValue] == 3;
  }
  else {
    char v10 = 1;
  }
  self->_mSettings.missionControl = v10;
  id v11 = [(NSMutableDictionary *)self->_mPreferences objectForKeyedSubscript:@"MouseMomentumScroll"];
  self->_mSettings.scrollMomentumEnabled = [v11 BOOLValue];

  if (self->_mSettings.dockSwipes2F
    && MTPreferencesGetAppBooleanValue(@"EnableMouseNavSwipes", @"com.apple.MultitouchSupport", 0))
  {
    *(_WORD *)&self->_mSettings.navSwipes2F = 1;
  }
  BOOL v12 = (self->_parserOptions & 4) != 0
     || MTPreferencesGetAppBooleanValue(@"ScrollMomentum", @"com.apple.MultitouchSupport", 0);
  self->_mSettings.supportsScrollMomentum = v12;
  *(_WORD *)&self->_mSettings.supportsGestureScrolling = 257;
}

- (void)fetchDefaultPreference
{
  kern_return_t v4;
  CFMutableDictionaryRef v5;
  BOOL v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *p_super;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  NSMutableDictionary *v19;

  properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  io_registry_entry_t Service = MTDeviceGetService();
  v4 = IORegistryEntryCreateCFProperties(Service, &properties, kCFAllocatorDefault, 0);
  char v5 = properties;
  if (v4) {
    id v6 = 1;
  }
  else {
    id v6 = properties == 0;
  }
  if (v6)
  {
    MTLoggingPlugin();
    char v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v13 = "[Error] ";
      id v14 = 2080;
      id v15 = "";
      objc_super v16 = 2080;
      v17 = "-[MouseSettingsManager fetchDefaultPreference]";
      v18 = 1024;
      LODWORD(v19) = v4;
      _os_log_impl(&def_411C8, &v7->super.super, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Failed to fetch mouse properties: 0x%08x", buf, 0x26u);
    }
  }
  else
  {
    id v8 = [(__CFDictionary *)properties objectForKeyedSubscript:@"MouseUserPreferences"];
    char v7 = (NSMutableDictionary *)v8;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass())
       || ([(__CFDictionary *)v5 objectForKeyedSubscript:@"MultitouchPreferences"],
           char v9 = objc_claimAutoreleasedReturnValue(),
           v7,
           (char v7 = (NSMutableDictionary *)v9) != 0))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char v7 = v7;
      p_super = &self->_mPreferences->super.super;
      self->_mPreferences = v7;
    }
    else
    {
      p_super = MTLoggingPlugin();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        id v13 = "[Error] ";
        id v14 = 2080;
        id v15 = "";
        objc_super v16 = 2080;
        v17 = "-[MouseSettingsManager fetchDefaultPreference]";
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&def_411C8, p_super, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Invalid mouse preferences: %@", buf, 0x2Au);
      }
    }
  }
}

- (BOOL)hsEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  HSUtil::Encoder::encodeCodable<mt_StandardMouseSettings>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)95,(char)109,(char)83,(char)101,(char)116,(char)116,(char)105,(char)110,(char)103,(char)115>::Key, &self->_mSettings);
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)hsDecode:(void *)a3
{
  v5.var0 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&v5.var1 = 0xAAAAAAAAAAAAAAAALL;
  CoderKey v12 = v5;
  CoderKey v13 = v5;
  CoderKey v10 = v5;
  CoderKey v11 = v5;
  CoderKey v9 = v5;
  HSUtil::Decoder::decodeMap((unint64_t *)a3, (uint64_t)&v9);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PreAlg/MouseSettingsManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MouseSettingsManager hsDecode:]();
    }
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  HSUtil::Decoder::decodeCodable<mt_StandardMouseSettings>(&v9, (CoderKey *)HSUtil::CoderKey::Literal<(char)95,(char)109,(char)83,(char)101,(char)116,(char)116,(char)105,(char)110,(char)103,(char)115>::Key, &self->_mSettings);
  if (LODWORD(v9.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PreAlg/MouseSettingsManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MouseSettingsManager hsDecode:]();
    }
    goto LABEL_7;
  }
  BOOL v6 = 1;
LABEL_8:
  if (v11.var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v11.var0);
  }
  var0 = v10.var0;
  v10.var0 = 0;
  if (var0)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](var0);
    operator delete();
  }
  return v6;
}

- (NSMutableDictionary)mPreferences
{
  return self->_mPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_userPrefDict, 0);

  objc_storeStrong((id *)&self->_mPreferences, 0);
}

- (void)hsDecode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)hsDecode:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end