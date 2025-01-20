@interface TrackpadBridge
- (BOOL)decodeFromMap:(void *)a3;
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (NSDictionary)debug;
- (OS_dispatch_queue)queue;
- (TrackpadBridge)initWithDevice:(__MTDevice *)a3 parserOptions:(int)a4;
- (TrackpadSettingsManager)tpSettingsManager;
- (__MTDevice)mtDeviceRef;
- (int)getDisablerDeviceCount;
- (unint64_t)signpost_begin_time;
- (void)_handleGetDebugEvent:(id)a3;
- (void)_handleGetPropertyEvent:(id)a3;
- (void)_handleHSTNotificationEvent:(id)a3;
- (void)_handleResetEvent:(id)a3;
- (void)dealloc;
- (void)dispatch:(id)a3;
- (void)encodeToMap:(void *)a3;
- (void)handleCancelEvent:(id)a3;
- (void)handleConsume:(id)a3;
- (void)handleHSTEvent:(id)a3;
- (void)handleSetPropertyEvent:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSignpost_begin_time:(unint64_t)a3;
@end

@implementation TrackpadBridge

- (TrackpadBridge)initWithDevice:(__MTDevice *)a3 parserOptions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a3)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TrackpadBridge.mm", 33, @"Invalid parameter not satisfying: %@", @"deviceRef" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)TrackpadBridge;
  v7 = [(HSStage *)&v21 init];
  v8 = v7;
  if (v7)
  {
    v7->_mtDeviceRef = a3;
    v9 = (HIDManager *)objc_alloc_init((Class)HIDManager);
    hidManager = v8->_hidManager;
    v8->_hidManager = v9;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __47__TrackpadBridge_initWithDevice_parserOptions___block_invoke;
    v18[3] = &unk_141630;
    objc_copyWeak(&v19, &location);
    v11 = objc_retainBlock(v18);
    v12 = [[TrackpadSettingsManager alloc] initWithDevice:a3 parserOptions:v4 handler:v11];
    tpSettingsManager = v8->_tpSettingsManager;
    v8->_tpSettingsManager = v12;

    v14 = v8;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __47__TrackpadBridge_initWithDevice_parserOptions___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315650;
      v12 = "[Debug] ";
      __int16 v13 = 2080;
      v14 = "";
      __int16 v15 = 2080;
      v16 = "-[TrackpadBridge initWithDevice:parserOptions:]_block_invoke";
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s New TP Setting", (uint8_t *)&v11, 0x20u);
    }

    uint64_t v7 = objc_opt_new();
    *(_OWORD *)(v7 + 8) = *(_OWORD *)a2;
    long long v8 = *(_OWORD *)(a2 + 16);
    long long v9 = *(_OWORD *)(a2 + 32);
    long long v10 = *(_OWORD *)(a2 + 48);
    *(_DWORD *)(v7 + 71) = *(_DWORD *)(a2 + 63);
    *(_OWORD *)(v7 + 40) = v9;
    *(_OWORD *)(v7 + 56) = v10;
    *(_OWORD *)(v7 + 24) = v8;
    *(unsigned char *)(v7 + 75) = a3;
    [WeakRetained dispatch:v7];
  }
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    [(MouseBridge *)v4 dealloc];
  }
  v5.receiver = self;
  v5.super_class = (Class)TrackpadBridge;
  [(HSStage *)&v5 dealloc];
}

- (void)dispatch:(id)a3
{
  id v4 = a3;
  objc_super v5 = MTLoggingPlugin();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 134349314;
    unint64_t v8 = [(TrackpadBridge *)self signpost_begin_time];
    __int16 v9 = 2080;
    ClassName = object_getClassName(v4);
    _os_signpost_emit_with_name_impl(&def_411C8, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TrackpadBridge", "%{public, signpost.description:begin_time}llu event=%s", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)TrackpadBridge;
  [(HSStage *)&v6 handleConsume:v4];
  [(TrackpadBridge *)self setSignpost_begin_time:mach_continuous_time()];
}

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  [(TrackpadBridge *)self setSignpost_begin_time:mach_continuous_time()];
  [(TrackpadBridge *)self handleHSTEvent:v4];
}

- (void)handleHSTEvent:(id)a3
{
  id v15 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v15;
    objc_super v5 = v15;
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
    objc_super v5 = v15;
  }

  if (v6)
  {
    [(TrackpadBridge *)self handleSetPropertyEvent:v15];
  }
  else
  {
    id v7 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      [(TrackpadBridge *)self _handleGetPropertyEvent:v7];
    }
    else
    {
      id v9 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }

      if (v10)
      {
        [(TrackpadBridge *)self _handleResetEvent:v9];
      }
      else
      {
        id v11 = v9;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }

        if (v12)
        {
          [(TrackpadBridge *)self handleCancelEvent:v11];
        }
        else
        {
          __int16 v13 = HSUtil::DynamicCast<HSTGetDebugStateEvent>(v11);

          if (v13)
          {
            [(TrackpadBridge *)self _handleGetDebugEvent:v11];
          }
          else
          {
            v14 = HSUtil::DynamicCast<HSTNotificationEvent>(v11);

            if (v14) {
              [(TrackpadBridge *)self _handleHSTNotificationEvent:v11];
            }
            else {
              [(TrackpadBridge *)self dispatch:v11];
            }
          }
        }
      }
    }
  }
}

- (void)handleSetPropertyEvent:(id)a3
{
  objc_super v5 = a3;
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  [(TrackpadSettingsManager *)self->_tpSettingsManager handleProperty:v4 value:v5[5]];
  [(TrackpadBridge *)self dispatch:v5];
}

- (void)_handleGetPropertyEvent:(id)a3
{
  id v4 = a3;
  if (!-[TrackpadSettingsManager handleGetProperty:](self->_tpSettingsManager, "handleGetProperty:")) {
    [(TrackpadBridge *)self dispatch:v4];
  }
}

- (void)_handleResetEvent:(id)a3
{
  id v5 = a3;
  tpSettingsManager = self->_tpSettingsManager;
  if (tpSettingsManager) {
    [(TrackpadSettingsManager *)tpSettingsManager sync];
  }
  [(TrackpadBridge *)self dispatch:v5];
}

- (void)handleCancelEvent:(id)a3
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    [(MouseBridge *)v7 handleCancelEvent:v12];
  }
  tpSettingsManager = self->_tpSettingsManager;
  self->_tpSettingsManager = 0;

  hidManager = self->_hidManager;
  if (hidManager)
  {
    [(HIDManager *)hidManager cancel];
    id v11 = self->_hidManager;
    self->_hidManager = 0;
  }
  [(TrackpadBridge *)self dispatch:v5];
}

- (void)_handleGetDebugEvent:(id)a3
{
  id v4 = a3;
  v4[16] = 1;
  id v7 = v4;
  id v5 = (void *)*((void *)v4 + 3);
  id v6 = [(TrackpadBridge *)self debug];
  [v5 addObject:v6];

  [(TrackpadBridge *)self dispatch:v7];
}

- (void)_handleHSTNotificationEvent:(id)a3
{
  id v4 = a3;
  if ([v4 notification] == 12)
  {
    [(TrackpadBridge *)self mtDeviceRef];
    io_registry_entry_t Service = MTDeviceGetService();
    CFProperty = (void *)IORegistryEntryCreateCFProperty(Service, @"ParserDisabled", kCFAllocatorDefault, 0);
    id v7 = CFProperty;
    if (CFProperty) {
      id v8 = [CFProperty BOOLValue];
    }
    else {
      id v8 = 0;
    }
    id v9 = [(TrackpadBridge *)self tpSettingsManager];
    [v9 setParserExternallyDisabled:v8];

    id v10 = MTLoggingPlugin();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = "enabled";
      *(_DWORD *)id v12 = 136315906;
      *(void *)&v12[4] = "";
      if (v8) {
        id v11 = "disabled";
      }
      *(_WORD *)&v12[12] = 2080;
      *(void *)&v12[14] = "";
      __int16 v13 = 2080;
      v14 = "-[TrackpadBridge _handleHSTNotificationEvent:]";
      __int16 v15 = 2080;
      v16 = v11;
      _os_log_impl(&def_411C8, v10, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Trackpad parser was externally %s", v12, 0x2Au);
    }
  }
  -[TrackpadBridge dispatch:](self, "dispatch:", v4, *(_OWORD *)v12);
}

- (int)getDisablerDeviceCount
{
  hidManager = self->_hidManager;
  if (!hidManager) {
    return 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(HIDManager *)hidManager devices];
  int v5 = 0;
  id v6 = [v4 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        *(void *)entryID = 0;
        IORegistryEntryGetRegistryEntryID((io_registry_entry_t)[v9 service], (uint64_t *)entryID);
        io_registry_entry_t parent = 0;
        [(TrackpadBridge *)self mtDeviceRef];
        io_registry_entry_t Service = MTDeviceGetService();
        IORegistryEntryGetParentEntry(Service, "IOService", &parent);
        do
        {
          io_registry_entry_t v11 = parent;
          if (!parent) {
            break;
          }
          uint64_t v14 = 0;
          IORegistryEntryGetRegistryEntryID(parent, &v14);
          IORegistryEntryGetParentEntry(parent, "IOService", &parent);
        }
        while (v14 != *(void *)entryID);
        if (!v11) {
          ++v5;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v27 count:16];
    }
    while (v6);
  }

  id v12 = MTLoggingPlugin();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)entryID = 136315906;
    *(void *)&entryID[4] = "";
    __int16 v21 = 2080;
    v22 = "";
    __int16 v23 = 2080;
    v24 = "-[TrackpadBridge getDisablerDeviceCount]";
    __int16 v25 = 1024;
    int v26 = v5;
    _os_log_impl(&def_411C8, v12, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Disabler count : %d", entryID, 0x26u);
  }

  return v5;
}

- (void)setQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TrackpadBridge.mm", 215, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_queue, a3);
  v22[0] = @"PrimaryUsagePage";
  v22[1] = @"PrimaryUsage";
  v23[0] = &off_149A48;
  v23[1] = &off_149A60;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v24[0] = v7;
  v20[0] = @"PrimaryUsagePage";
  v20[1] = @"PrimaryUsage";
  v21[0] = &off_149A48;
  v21[1] = &off_149A48;
  id v8 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v24[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v24 count:2];

  hidManager = self->_hidManager;
  io_registry_entry_t v11 = [(TrackpadBridge *)self queue];
  [(HIDManager *)hidManager setDispatchQueue:v11];

  [(HIDManager *)self->_hidManager setDeviceMatching:v9];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v12 = self->_hidManager;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __27__TrackpadBridge_setQueue___block_invoke;
  v17[3] = &unk_141658;
  objc_copyWeak(&v18, &location);
  [(HIDManager *)v12 setDeviceNotificationHandler:v17];
  [(HIDManager *)self->_hidManager activate];
  __int16 v13 = [(TrackpadBridge *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __27__TrackpadBridge_setQueue___block_invoke_2;
  block[3] = &unk_141240;
  objc_copyWeak(&v16, &location);
  dispatch_async(v13, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __27__TrackpadBridge_setQueue___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = MTLoggingPlugin();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    io_registry_entry_t v11 = "";
    __int16 v12 = 2080;
    __int16 v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "-[TrackpadBridge setQueue:]_block_invoke";
    __int16 v16 = 2048;
    id v17 = v5;
    __int16 v18 = 1024;
    int v19 = a3;
    _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s HID Dev callback %p : %u", buf, 0x30u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setSignpost_begin_time:", mach_continuous_time());
    id v8 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __27__TrackpadBridge_setQueue___block_invoke_106;
    block[3] = &unk_1412D0;
    void block[4] = WeakRetained;
    dispatch_async(v8, block);
  }
}

void __27__TrackpadBridge_setQueue___block_invoke_106(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tpSettingsManager];
  objc_msgSend(v2, "setDisablingDeviceCount:", objc_msgSend(*(id *)(a1 + 32), "getDisablerDeviceCount"));
}

void __27__TrackpadBridge_setQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setSignpost_begin_time:", mach_continuous_time());
    v1 = [WeakRetained tpSettingsManager];
    objc_msgSend(v1, "setDisablingDeviceCount:", objc_msgSend(WeakRetained, "getDisablerDeviceCount"));
  }
}

- (NSDictionary)debug
{
  v3 = objc_opt_new();
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 setObject:v5 forKeyedSubscript:@"Stage"];

  id v6 = [(TrackpadBridge *)self tpSettingsManager];

  if (v6)
  {
    uint64_t v7 = [(TrackpadBridge *)self tpSettingsManager];
    id v8 = [v7 tpPreferences];
    id v9 = [v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"TrackpadPreferences"];

    id v10 = [(TrackpadBridge *)self tpSettingsManager];
    io_registry_entry_t v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 disablingDeviceCount]);
    [v3 setObject:v11 forKeyedSubscript:@"DisablingDeviceCount"];
  }
  id v12 = [v3 copy];

  return (NSDictionary *)v12;
}

- (void)encodeToMap:(void *)a3
{
  id v4 = (const CoderKey *)HSUtil::CoderKey::Literal<(char)95,(char)116,(char)112,(char)83,(char)101,(char)116,(char)116,(char)105,(char)110,(char)103,(char)115,(char)77,(char)97,(char)110,(char)97,(char)103,(char)101,(char)114>::Key;
  id v5 = [(TrackpadBridge *)self tpSettingsManager];
  HSUtil::Encoder::encodeHSCodable((HSUtil::Encoder *)a3, v4, v5);
}

- (BOOL)decodeFromMap:(void *)a3
{
  id v4 = (const CoderKey *)HSUtil::CoderKey::Literal<(char)95,(char)116,(char)112,(char)83,(char)101,(char)116,(char)116,(char)105,(char)110,(char)103,(char)115,(char)77,(char)97,(char)110,(char)97,(char)103,(char)101,(char)114>::Key;
  id v5 = [(TrackpadBridge *)self tpSettingsManager];
  HSUtil::Decoder::decodeHSCodable((uint64_t)a3, v4, v5);

  return 1;
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  [(TrackpadBridge *)self encodeToMap:a3];
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)handleHSDecode:(void *)a3
{
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v13 = v5;
  long long v14 = v5;
  long long v11 = v5;
  long long v12 = v5;
  long long v10 = v5;
  HSUtil::Decoder::decodeMap((unint64_t *)a3, (uint64_t)&v10);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    id v6 = basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PreAlg/TrackpadBridges/TrackpadBridge.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[TrackpadBridge handleHSDecode:]((uint64_t)v6);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [(TrackpadBridge *)self decodeFromMap:&v10];
  }
  if ((void)v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
  }
  id v8 = (void *)v11;
  *(void *)&long long v11 = 0;
  if (v8)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v8);
    operator delete();
  }
  return v7;
}

- (__MTDevice)mtDeviceRef
{
  return self->_mtDeviceRef;
}

- (TrackpadSettingsManager)tpSettingsManager
{
  return self->_tpSettingsManager;
}

- (unint64_t)signpost_begin_time
{
  return self->_signpost_begin_time;
}

- (void)setSignpost_begin_time:(unint64_t)a3
{
  self->_signpost_begin_time = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tpSettingsManager, 0);

  objc_storeStrong((id *)&self->_hidManager, 0);
}

- (void)handleHSDecode:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1 = 136315906;
  id v2 = "-[TrackpadBridge handleHSDecode:]";
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = 293;
  __int16 v7 = 2080;
  id v8 = "coder";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)&v1, 0x2Au);
}

@end