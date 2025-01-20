@interface MouseBridge
- (BOOL)decodeFromMap:(void *)a3;
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (MouseBridge)initWithDevice:(__MTDevice *)a3 parserOptions:(int)a4;
- (MouseSettingsManager)mSettingsManager;
- (NSDictionary)debug;
- (OS_dispatch_queue)queue;
- (__MTDevice)mtDeviceRef;
- (unint64_t)signpost_begin_time;
- (void)_handleGetDebugEvent:(id)a3;
- (void)_handleGetPropertyEvent:(id)a3;
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

@implementation MouseBridge

- (MouseBridge)initWithDevice:(__MTDevice *)a3 parserOptions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a3)
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MouseBridge.mm", 24, @"Invalid parameter not satisfying: %@", @"deviceRef" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)MouseBridge;
  v7 = [(HSStage *)&v19 init];
  v8 = v7;
  if (v7)
  {
    v7->_mtDeviceRef = a3;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __44__MouseBridge_initWithDevice_parserOptions___block_invoke;
    v16[3] = &unk_141028;
    objc_copyWeak(&v17, &location);
    v9 = objc_retainBlock(v16);
    v10 = [[MouseSettingsManager alloc] initWithDevice:a3 parserOptions:v4 handler:v9];
    mSettingsManager = v8->_mSettingsManager;
    v8->_mSettingsManager = v10;

    v12 = v8;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __44__MouseBridge_initWithDevice_parserOptions___block_invoke(uint64_t a1, uint64_t *a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315650;
      v10 = "[Debug] ";
      __int16 v11 = 2080;
      v12 = "";
      __int16 v13 = 2080;
      v14 = "-[MouseBridge initWithDevice:parserOptions:]_block_invoke";
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s New Input Device Setting", (uint8_t *)&v9, 0x20u);
    }

    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *a2;
    *(_DWORD *)(v7 + 15) = *(_DWORD *)((char *)a2 + 7);
    *(void *)(v7 + 8) = v8;
    *(unsigned char *)(v7 + 19) = a3;
    [WeakRetained dispatch:v7];
  }
}

- (void)dealloc
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "~%@", buf, 0xCu);
}

- (void)dispatch:(id)a3
{
  id v4 = a3;
  v5 = MTLoggingPlugin();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 134349314;
    unint64_t v8 = [(MouseBridge *)self signpost_begin_time];
    __int16 v9 = 2080;
    ClassName = object_getClassName(v4);
    _os_signpost_emit_with_name_impl(&def_411C8, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MouseBridge", "%{public, signpost.description:begin_time}llu event=%s", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)MouseBridge;
  [(HSStage *)&v6 handleConsume:v4];
  [(MouseBridge *)self setSignpost_begin_time:mach_continuous_time()];
}

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  [(MouseBridge *)self setSignpost_begin_time:mach_continuous_time()];
  [(MouseBridge *)self handleHSTEvent:v4];
}

- (void)handleHSTEvent:(id)a3
{
  id v14 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v14;
    v5 = v14;
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
    v5 = v14;
  }

  if (v6)
  {
    [(MouseBridge *)self handleSetPropertyEvent:v14];
  }
  else
  {
    id v7 = v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      [(MouseBridge *)self _handleGetPropertyEvent:v7];
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
        [(MouseBridge *)self _handleResetEvent:v9];
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
          [(MouseBridge *)self handleCancelEvent:v11];
        }
        else
        {
          __int16 v13 = HSUtil::DynamicCast<HSTGetDebugStateEvent>(v11);

          if (v13) {
            [(MouseBridge *)self _handleGetDebugEvent:v11];
          }
          else {
            [(MouseBridge *)self dispatch:v11];
          }
        }
      }
    }
  }
}

- (void)handleSetPropertyEvent:(id)a3
{
  v5 = a3;
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  [(MouseSettingsManager *)self->_mSettingsManager handleSetProperty:v4 value:v5[5]];
  [(MouseBridge *)self dispatch:v5];
}

- (void)_handleGetPropertyEvent:(id)a3
{
  id v4 = a3;
  if (!-[MouseSettingsManager handleGetProperty:](self->_mSettingsManager, "handleGetProperty:")) {
    [(MouseBridge *)self dispatch:v4];
  }
}

- (void)_handleResetEvent:(id)a3
{
  id v5 = a3;
  mSettingsManager = self->_mSettingsManager;
  if (mSettingsManager) {
    [(MouseSettingsManager *)mSettingsManager sync];
  }
  [(MouseBridge *)self dispatch:v5];
}

- (void)handleCancelEvent:(id)a3
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    [(MouseBridge *)v7 handleCancelEvent:v10];
  }
  mSettingsManager = self->_mSettingsManager;
  self->_mSettingsManager = 0;

  [(MouseBridge *)self dispatch:v5];
}

- (void)_handleGetDebugEvent:(id)a3
{
  id v4 = a3;
  v4[16] = 1;
  id v7 = v4;
  id v5 = (void *)*((void *)v4 + 3);
  id v6 = [(MouseBridge *)self debug];
  [v5 addObject:v6];

  [(MouseBridge *)self dispatch:v7];
}

- (NSDictionary)debug
{
  v3 = objc_opt_new();
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 setObject:v5 forKeyedSubscript:@"Stage"];

  id v6 = [(MouseBridge *)self mSettingsManager];

  if (v6)
  {
    id v7 = [(MouseBridge *)self mSettingsManager];
    id v8 = [v7 mPreferences];
    id v9 = [v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"MousePreferences"];
  }
  id v10 = [v3 copy];

  return (NSDictionary *)v10;
}

- (void)encodeToMap:(void *)a3
{
  id v4 = (const CoderKey *)HSUtil::CoderKey::Literal<(char)95,(char)109,(char)83,(char)101,(char)116,(char)116,(char)105,(char)110,(char)103,(char)115,(char)77,(char)97,(char)110,(char)97,(char)103,(char)101,(char)114>::Key;
  id v5 = [(MouseBridge *)self mSettingsManager];
  HSUtil::Encoder::encodeHSCodable((HSUtil::Encoder *)a3, v4, v5);
}

- (BOOL)decodeFromMap:(void *)a3
{
  id v4 = (const CoderKey *)HSUtil::CoderKey::Literal<(char)95,(char)109,(char)83,(char)101,(char)116,(char)116,(char)105,(char)110,(char)103,(char)115,(char)77,(char)97,(char)110,(char)97,(char)103,(char)101,(char)114>::Key;
  id v5 = [(MouseBridge *)self mSettingsManager];
  HSUtil::Decoder::decodeHSCodable((uint64_t)a3, v4, v5);

  return 1;
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  [(MouseBridge *)self encodeToMap:a3];
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
    id v6 = basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PreAlg/TrackpadBridges/MouseBridge.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MouseBridge handleHSDecode:]((uint64_t)v6);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [(MouseBridge *)self decodeFromMap:&v10];
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

- (MouseSettingsManager)mSettingsManager
{
  return self->_mSettingsManager;
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

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_mSettingsManager, 0);
}

- (void)handleCancelEvent:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@::%@", buf, 0x16u);
}

- (void)handleHSDecode:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1 = 136315906;
  v2 = "-[MouseBridge handleHSDecode:]";
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = 172;
  __int16 v7 = 2080;
  id v8 = "coder";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)&v1, 0x2Au);
}

@end