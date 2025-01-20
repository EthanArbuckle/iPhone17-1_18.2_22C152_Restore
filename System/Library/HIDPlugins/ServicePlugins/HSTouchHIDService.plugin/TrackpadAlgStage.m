@interface TrackpadAlgStage
- (BOOL)decodeFromMap:(void *)a3;
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (BOOL)supportsDeepPress;
- (NSNumber)builtIn;
- (OS_dispatch_queue)queue;
- (TrackpadAlgStage)initWithConfig:(Config *)a3;
- (id).cxx_construct;
- (int)_extractMTContacts:(id *)a3;
- (unsigned)deviceButtonState;
- (void)_applyMouseSettings:(id)a3;
- (void)_applyTPSettings:(id)a3;
- (void)_clear;
- (void)_flushState;
- (void)_handleActivateEvent:(id)a3;
- (void)_handleContactFrame:(id)a3;
- (void)_handleContactFrame:(id)a3[32] numActivePaths:(float)a4 timestampS:frameNumber:baseEvent:handleTapAndAHalf:isFlush:;
- (void)_handleGetDebugEvent:(id)a3;
- (void)_handleHSTNotificationEvent:(id)a3;
- (void)_handleMomentumRequestEvent:(id)a3;
- (void)_handleMomentumStateEvent:(id)a3;
- (void)_handleMouseSettings:(id)a3;
- (void)_handlePointerFrame:(id)a3;
- (void)_handleResetEvent:(id)a3;
- (void)_handleSetPropertyEvent:(id)a3;
- (void)_handleSystemPowerEvent:(id)a3;
- (void)_handleTPSettings:(id)a3;
- (void)_handleTimerEvent:(id)a3;
- (void)_tickleMouseFilters;
- (void)_updateButtonMotionFilter:(float)a3 shouldSpike:(BOOL)a4;
- (void)_updateMouseMotionFilterWithXVelocity:(float)a3 YVelocity:(float)a4 tickle:(BOOL)a5;
- (void)dealloc;
- (void)dispatch:(id)a3;
- (void)encodeToMap:(void *)a3;
- (void)handleConsume:(id)a3;
- (void)scheduleTapAndAHalfCallbackTimer:(double)a3 delay:(double)a4;
- (void)setBuiltIn:(id)a3;
- (void)setDeviceButtonState:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)setSupportsDeepPress:(BOOL)a3;
@end

@implementation TrackpadAlgStage

- (TrackpadAlgStage)initWithConfig:(Config *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TrackpadAlgStage;
  v4 = [(HSStage *)&v13 init];
  v5 = (TrackpadAlgStage *)v4;
  if (v4)
  {
    v6 = v4 + 152;
    *((void *)v4 + 19) = *(void *)&a3->type;
    ptr = a3->dimensions.__ptr_;
    cntrl = a3->dimensions.__cntrl_;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    v9 = (std::__shared_weak_count *)*((void *)v4 + 21);
    *((void *)v6 + 1) = ptr;
    *((void *)v6 + 2) = cntrl;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    SurfaceCoordinates surfaceCoordinates = a3->surfaceCoordinates;
    *(_OWORD *)(v6 + 36) = *(_OWORD *)&a3->surfaceCoordinates.top;
    *(SurfaceCoordinates *)(v6 + 24) = surfaceCoordinates;
    v5->_deviceButtonState = 0;
    [(MTTrackpadUberAlg *)v5->_uberAlg clearState];
    v11 = v5;
  }

  return v5;
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
  v5.super_class = (Class)TrackpadAlgStage;
  [(HSStage *)&v5 dealloc];
}

- (void)setDeviceButtonState:(unsigned int)a3
{
  if ([(TrackpadAlgStage *)self deviceButtonState] != a3)
  {
    if ((self->_config.type - 2000) <= 0x3E7)
    {
      LODWORD(v5) = 1.0;
      [(TrackpadAlgStage *)self _updateButtonMotionFilter:1 shouldSpike:v5];
    }
    [(MTTrackpadUberAlg *)self->_uberAlg setDivingButtonState:a3 != 0];
  }
  self->_deviceButtonState = a3;
}

- (void)dispatch:(id)a3
{
  id v4 = a3;
  double v5 = MTLoggingPlugin();
  if (os_signpost_enabled(v5))
  {
    unint64_t signpost_begin_time = self->_signpost_begin_time;
    *(_DWORD *)buf = 134349314;
    v11 = (const char *)signpost_begin_time;
    __int16 v12 = 2080;
    ClassName = object_getClassName(v4);
    _os_signpost_emit_with_name_impl(&def_411C8, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TrackpadAlgStage", "%{public, signpost.description:begin_time}llu event=%s", buf, 0x16u);
  }

  if (self->_cachedSettingsEvent
    && [(MTTrackpadUberAlg *)self->_uberAlg shouldHandleTPSettings])
  {
    v7 = MTLoggingPlugin();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v11 = "[Debug] ";
      __int16 v12 = 2080;
      ClassName = "";
      __int16 v14 = 2080;
      v15 = "-[TrackpadAlgStage dispatch:]";
      _os_log_impl(&def_411C8, v7, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s Applying cached TP setting", buf, 0x20u);
    }

    [(TrackpadAlgStage *)self _applyTPSettings:self->_cachedSettingsEvent];
    cachedSettingsEvent = self->_cachedSettingsEvent;
    self->_cachedSettingsEvent = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)TrackpadAlgStage;
  [(HSStage *)&v9 handleConsume:v4];
  self->_unint64_t signpost_begin_time = mach_continuous_time();
}

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  self->_unint64_t signpost_begin_time = mach_continuous_time();
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    [(TrackpadAlgStage *)self _handleResetEvent:v5];
  }
  else
  {
    id v7 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      [(TrackpadAlgStage *)self _handleActivateEvent:v7];
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
        [(TrackpadAlgStage *)self _handleSetPropertyEvent:v9];
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
          [(TrackpadAlgStage *)self _handleContactFrame:v11];
        }
        else
        {
          objc_super v13 = HSUtil::DynamicCast<HSTPSettingsEvent>(v11);

          if (v13)
          {
            [(TrackpadAlgStage *)self _handleTPSettings:v11];
          }
          else
          {
            __int16 v14 = HSUtil::DynamicCast<HSMouseSettingsEvent>(v11);

            if (v14)
            {
              [(TrackpadAlgStage *)self _handleMouseSettings:v11];
            }
            else
            {
              v15 = HSUtil::DynamicCast<HSTimerEvent>(v11);

              if (v15)
              {
                [(TrackpadAlgStage *)self _handleTimerEvent:v11];
              }
              else
              {
                v16 = HSUtil::DynamicCast<HSTNotificationEvent>(v11);

                if (v16)
                {
                  [(TrackpadAlgStage *)self _handleHSTNotificationEvent:v11];
                }
                else
                {
                  v17 = HSUtil::DynamicCast<HSMomentumRequestEvent>(v11);

                  if (v17)
                  {
                    [(TrackpadAlgStage *)self _handleMomentumRequestEvent:v11];
                  }
                  else
                  {
                    v18 = HSUtil::DynamicCast<HSMomentumStateEvent>(v11);

                    if (v18)
                    {
                      [(TrackpadAlgStage *)self _handleMomentumStateEvent:v11];
                    }
                    else
                    {
                      v19 = HSUtil::DynamicCast<HSTSystemPowerEvent>(v11);

                      if (v19)
                      {
                        [(TrackpadAlgStage *)self _handleSystemPowerEvent:v11];
                      }
                      else
                      {
                        v20 = HSUtil::DynamicCast<HSTGetDebugStateEvent>(v11);

                        if (v20)
                        {
                          [(TrackpadAlgStage *)self _handleGetDebugEvent:v11];
                        }
                        else
                        {
                          v21 = HSUtil::DynamicCast<HSPointerFrame>(v11);

                          if (v21)
                          {
                            [(TrackpadAlgStage *)self _handlePointerFrame:v11];
                          }
                          else
                          {
                            v22.receiver = self;
                            v22.super_class = (Class)TrackpadAlgStage;
                            [(HSStage *)&v22 handleConsume:v11];
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_handleResetEvent:(id)a3
{
  id v4 = a3;
  builtIn = self->_builtIn;
  self->_builtIn = 0;

  self->_supportsDeepPress = 1;
  id v6 = (NSMutableDictionary *)objc_opt_new();
  uberAlgProperties = self->_uberAlgProperties;
  self->_uberAlgProperties = v6;

  self->_hostClickEnabled = 0;
  self->_parserEnabled = 1;
  cachedSettingsEvent = self->_cachedSettingsEvent;
  self->_cachedSettingsEvent = 0;

  v9.receiver = self;
  v9.super_class = (Class)TrackpadAlgStage;
  [(HSStage *)&v9 handleConsume:v4];
}

- (void)_handleActivateEvent:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __41__TrackpadAlgStage__handleActivateEvent___block_invoke;
  v16[3] = &unk_1412F8;
  objc_copyWeak(&v17, &location);
  id v5 = objc_retainBlock(v16);
  id v6 = [MTTrackpadUberAlg alloc];
  ptr = self->_config.dimensions.__ptr_;
  v13[0] = *(void *)&self->_config.type;
  v13[1] = ptr;
  cntrl = self->_config.dimensions.__cntrl_;
  __int16 v14 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  v15[0] = self->_config.surfaceCoordinates;
  *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)&self->_config.surfaceCoordinates.top;
  objc_super v9 = [(TrackpadAlgStage *)self builtIn];
  id v10 = -[MTTrackpadUberAlg initWithConfig:actuationHandler:builtIn:supportsDeepPress:](v6, "initWithConfig:actuationHandler:builtIn:supportsDeepPress:", v13, v5, [v9 BOOLValue], -[TrackpadAlgStage supportsDeepPress](self, "supportsDeepPress"));
  uberAlg = self->_uberAlg;
  self->_uberAlg = v10;

  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  v12.receiver = self;
  v12.super_class = (Class)TrackpadAlgStage;
  [(HSStage *)&v12 handleConsume:v4];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __41__TrackpadAlgStage__handleActivateEvent___block_invoke(uint64_t a1, int a2, int a3, float a4, float a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = objc_opt_new();
  *(_DWORD *)(v9 + 8) = a2;
  *(_DWORD *)(v9 + 12) = a3;
  *(float *)(v9 + 16) = a4;
  *(float *)(v9 + 20) = a5;
  [WeakRetained dispatch:v9];
}

- (void)_handleSetPropertyEvent:(id)a3
{
  id v4 = (id *)a3;
  id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  id v6 = v4[5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if ([(MTTrackpadUberAlg *)self->_uberAlg handleProperty:v5 value:v4[5]]) {
    [(NSMutableDictionary *)self->_uberAlgProperties setObject:v4[5] forKeyedSubscript:v5];
  }
  if ([v5 isEqualToString:@"Built-In"])
  {
    [(TrackpadAlgStage *)self setBuiltIn:v7];
  }
  else if ([v5 isEqualToString:@"SupportsDeepPress"])
  {
    if (v7) {
      id v8 = [v7 BOOLValue];
    }
    else {
      id v8 = (id)[(TrackpadAlgStage *)self supportsDeepPress];
    }
    [(TrackpadAlgStage *)self setSupportsDeepPress:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)TrackpadAlgStage;
  [(HSStage *)&v9 handleConsume:v4];
}

- (void)_handleTimerEvent:(id)a3
{
  id v4 = (id *)a3;
  if ([v4[1] isEqualToString:@"TapAndAHalf"])
  {
    id v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = v4[1];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "[Debug] ";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "";
      *(_WORD *)&buf[22] = 2080;
      v30 = "-[TrackpadAlgStage _handleTimerEvent:]";
      LOWORD(v31[0]) = 2112;
      *(void *)((char *)v31 + 2) = v6;
      _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s Timer event received : %@", buf, 0x2Au);
    }

    uint64_t v28 = 0;
    [(MTTrackpadUberAlg *)self->_uberAlg autoReleaseTapAndAHalfDrag:&v28 eventRef:self->_tsAtTapAndAHalfTimeTimer];
    double v8 = v7;
    if (v28)
    {
      objc_super v9 = (char **)objc_opt_new();
      id v10 = v9 + 1;
      uint64_t v11 = v28;
      objc_super v12 = v9[2];
      unint64_t v13 = (unint64_t)v9[3];
      if ((unint64_t)v12 >= v13)
      {
        uint64_t v15 = (v12 - *v10) >> 3;
        if ((unint64_t)(v15 + 1) >> 61) {
          std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v16 = v13 - (void)*v10;
        uint64_t v17 = v16 >> 2;
        if (v16 >> 2 <= (unint64_t)(v15 + 1)) {
          uint64_t v17 = v15 + 1;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v17;
        }
        v31[0] = v9 + 3;
        if (v18) {
          v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSUtil::CoderKey const*>>((uint64_t)(v9 + 3), v18);
        }
        else {
          v19 = 0;
        }
        v20 = &v19[8 * v15];
        v21 = &v19[8 * v18];
        v30 = v21;
        *(void *)v20 = v11;
        __int16 v14 = v20 + 8;
        *(void *)&buf[16] = v20 + 8;
        v23 = *v10;
        objc_super v22 = v9[2];
        if (v22 == *v10)
        {
          v25 = v9[2];
        }
        else
        {
          do
          {
            uint64_t v24 = *((void *)v22 - 1);
            v22 -= 8;
            *(void *)objc_super v22 = 0;
            *((void *)v20 - 1) = v24;
            v20 -= 8;
          }
          while (v22 != v23);
          v25 = *v10;
          objc_super v22 = v9[2];
          __int16 v14 = *(char **)&buf[16];
          v21 = v30;
        }
        *id v10 = v20;
        *(void *)&buf[8] = v25;
        v9[2] = v14;
        *(void *)&buf[16] = v22;
        v26 = v9[3];
        v9[3] = (char *)v21;
        v30 = v26;
        *(void *)buf = v25;
        std::__split_buffer<HIDEvent * {__strong}>::~__split_buffer((uint64_t)buf);
      }
      else
      {
        *(void *)objc_super v12 = v28;
        __int16 v14 = v12 + 8;
      }
      v9[2] = v14;
      [(TrackpadAlgStage *)self dispatch:v9];
    }
    if (v8 > 0.0) {
      [(TrackpadAlgStage *)self scheduleTapAndAHalfCallbackTimer:self->_tsAtTapAndAHalfTimeTimer delay:v8];
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)TrackpadAlgStage;
    [(HSStage *)&v27 handleConsume:v4];
  }
}

- (void)_handleTPSettings:(id)a3
{
  id v5 = a3;
  if ([(MTTrackpadUberAlg *)self->_uberAlg shouldHandleTPSettings])
  {
    [(TrackpadAlgStage *)self _applyTPSettings:v5];
  }
  else
  {
    id v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315650;
      double v8 = "[Debug] ";
      __int16 v9 = 2080;
      id v10 = "";
      __int16 v11 = 2080;
      objc_super v12 = "-[TrackpadAlgStage _handleTPSettings:]";
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s Caching new TP setting - waiting for Algs", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)&self->_cachedSettingsEvent, a3);
  }
  [(TrackpadAlgStage *)self dispatch:v5];
}

- (void)_handleMouseSettings:(id)a3
{
  id v4 = a3;
  -[TrackpadAlgStage _applyMouseSettings:](self, "_applyMouseSettings:");
  [(TrackpadAlgStage *)self dispatch:v4];
}

- (void)_applyTPSettings:(id)a3
{
  id v4 = (char *)a3;
  long long v11 = *(_OWORD *)(v4 + 8);
  long long v5 = *(_OWORD *)(v4 + 24);
  long long v6 = *(_OWORD *)(v4 + 40);
  long long v7 = *(_OWORD *)(v4 + 56);
  *(_DWORD *)&v14[15] = *(_DWORD *)(v4 + 71);
  *(_OWORD *)__int16 v14 = v7;
  int parserEnabled = self->_parserEnabled;
  int v9 = v11;
  self->_int parserEnabled = v11;
  long long v12 = v5;
  long long v13 = v6;
  if (parserEnabled != v9 || v4[75] != 0) {
    [(TrackpadAlgStage *)self _clear];
  }
  [(MTTrackpadUberAlg *)self->_uberAlg handleTPSettings:&v11];
}

- (void)_applyMouseSettings:(id)a3
{
  id v4 = (char *)a3;
  uint64_t v5 = *((void *)v4 + 1);
  *(_DWORD *)((char *)&v6 + 7) = *(_DWORD *)(v4 + 15);
  *(void *)&long long v6 = v5;
  if (v4[19]) {
    [(TrackpadAlgStage *)self _clear];
  }
  [(MTTrackpadUberAlg *)self->_uberAlg handleMouseSettings:&v6];
}

- (void)_handleMomentumRequestEvent:(id)a3
{
  id v4 = a3;
  [(MTTrackpadUberAlg *)self->_uberAlg lastFrameInterval];
  v4[4] = v5;
  v6.receiver = self;
  v6.super_class = (Class)TrackpadAlgStage;
  [(HSStage *)&v6 handleConsume:v4];
}

- (void)_handleMomentumStateEvent:(id)a3
{
  id v4 = (unsigned int *)a3;
  -[MTTrackpadUberAlg handleMomentumState:active:](self->_uberAlg, "handleMomentumState:active:", v4[3], [v4 isMomentumActive]);
  v5.receiver = self;
  v5.super_class = (Class)TrackpadAlgStage;
  [(HSStage *)&v5 handleConsume:v4];
}

- (void)_handleSystemPowerEvent:(id)a3
{
  id v4 = a3;
  if ([v4 systemPowerState] == -536870272)
  {
    objc_super v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315650;
      long long v7 = "[Debug] ";
      __int16 v8 = 2080;
      int v9 = "";
      __int16 v10 = 2080;
      long long v11 = "-[TrackpadAlgStage _handleSystemPowerEvent:]";
      _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s Handling System Sleep", (uint8_t *)&v6, 0x20u);
    }

    [(MTTrackpadUberAlg *)self->_uberAlg cancelCurrentTapAndAHalfDrag];
  }
}

- (void)_handleGetDebugEvent:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v17 = +[NSAssertionHandler currentHandler];
    unint64_t v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TrackpadAlgStage _handleGetDebugEvent:]");
    [v17 handleFailureInFunction:v18, @"TrackpadAlgStage.mm", 339, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  v23[0] = @"Stage";
  objc_super v5 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v5);
  v24[0] = v19;
  v23[1] = @"Built-In";
  uint64_t v6 = [(TrackpadAlgStage *)self builtIn];
  long long v7 = (void *)v6;
  CFStringRef v8 = @"Not set";
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  v24[1] = v8;
  v23[2] = @"AlgHostClickMode";
  int v9 = +[NSNumber numberWithBool:self->_hostClickEnabled];
  v24[2] = v9;
  v23[3] = @"ParserEnabled";
  __int16 v10 = +[NSNumber numberWithBool:self->_parserEnabled];
  v24[3] = v10;
  v23[4] = @"TapAndAHalfTimerExpire";
  long long v11 = +[NSNumber numberWithDouble:self->_tsAtTapAndAHalfTimeTimer];
  v24[4] = v11;
  v23[5] = @"DeviceButtonState";
  long long v12 = +[NSNumber numberWithUnsignedInt:[(TrackpadAlgStage *)self deviceButtonState]];
  v24[5] = v12;
  v23[6] = @"UberAlg";
  if (self->_uberAlgProperties) {
    uberAlgProperties = self->_uberAlgProperties;
  }
  else {
    uberAlgProperties = (NSMutableDictionary *)@"None";
  }
  v21[0] = @"Properties";
  v21[1] = @"DivingButtonState";
  v22[0] = uberAlgProperties;
  __int16 v14 = +[NSNumber numberWithBool:[(MTTrackpadUberAlg *)self->_uberAlg divingButtonState]];
  v22[1] = v14;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[6] = v15;
  uint64_t v16 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:7];

  *((unsigned char *)v4 + 16) = 1;
  [*((id *)v4 + 3) addObject:v16];
  v20.receiver = self;
  v20.super_class = (Class)TrackpadAlgStage;
  [(HSStage *)&v20 handleConsume:v4];
}

- (void)_flushState
{
  [(MTTrackpadUberAlg *)self->_uberAlg cancelCurrentTapAndAHalfDrag];
  uint64_t v21 = 0;
  [(TrackpadAlgStage *)self _handleContactFrame:0 numActivePaths:0 timestampS:0 frameNumber:&v21 baseEvent:0 handleTapAndAHalf:1 isFlush:0.0];
  if (v21)
  {
    v3 = objc_opt_new();
    id v4 = (char **)(v3 + 1);
    uint64_t v5 = v21;
    uint64_t v6 = (char *)v3[2];
    unint64_t v7 = v3[3];
    if ((unint64_t)v6 >= v7)
    {
      uint64_t v9 = (v6 - *v4) >> 3;
      if ((unint64_t)(v9 + 1) >> 61) {
        std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v10 = v7 - (void)*v4;
      uint64_t v11 = v10 >> 2;
      if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
        uint64_t v11 = v9 + 1;
      }
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v11;
      }
      v25 = v3 + 3;
      if (v12) {
        long long v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSUtil::CoderKey const*>>((uint64_t)(v3 + 3), v12);
      }
      else {
        long long v13 = 0;
      }
      __int16 v14 = &v13[8 * v9];
      uint64_t v15 = &v13[8 * v12];
      uint64_t v24 = v15;
      *(void *)__int16 v14 = v5;
      CFStringRef v8 = v14 + 8;
      v23 = v14 + 8;
      uint64_t v17 = *v4;
      uint64_t v16 = (char *)v3[2];
      if (v16 == *v4)
      {
        v19 = (char *)v3[2];
      }
      else
      {
        do
        {
          uint64_t v18 = *((void *)v16 - 1);
          v16 -= 8;
          *(void *)uint64_t v16 = 0;
          *((void *)v14 - 1) = v18;
          v14 -= 8;
        }
        while (v16 != v17);
        v19 = *v4;
        uint64_t v16 = (char *)v3[2];
        CFStringRef v8 = v23;
        uint64_t v15 = v24;
      }
      unsigned int *v4 = v14;
      v22[1] = v19;
      v3[2] = v8;
      v23 = v16;
      objc_super v20 = (char *)v3[3];
      v3[3] = v15;
      uint64_t v24 = v20;
      v22[0] = v19;
      std::__split_buffer<HIDEvent * {__strong}>::~__split_buffer((uint64_t)v22);
    }
    else
    {
      *(void *)uint64_t v6 = v21;
      CFStringRef v8 = v6 + 8;
    }
    v3[2] = v8;
    [(TrackpadAlgStage *)self handleConsume:v3];
  }
}

- (void)_clear
{
  [(TrackpadAlgStage *)self _flushState];
  [(MTTrackpadUberAlg *)self->_uberAlg clearState];

  bzero(self->_contacts, 0xC00uLL);
}

- (void)_handlePointerFrame:(id)a3
{
  uint64_t v9 = (unsigned int *)a3;
  [(TrackpadAlgStage *)self setDeviceButtonState:v9[8]];
  unint64_t v5 = *((void *)v9 + 3);
  if (v5 == 400 || v5 == 0)
  {
    double v8 = *(double *)(v9 + 9);
  }
  else
  {
    float v7 = 400.0 / (double)v5;
    float32x2_t v4 = vmul_n_f32(vcvt_f32_s32(*(int32x2_t *)(v9 + 9)), v7);
    double v8 = COERCE_DOUBLE(vcvt_s32_f32(v4));
  }
  v4.f32[0] = (float)SLODWORD(v8);
  *(float *)&double v8 = (float)SHIDWORD(v8);
  [(TrackpadAlgStage *)self _updateMouseMotionFilterWithXVelocity:1 YVelocity:*(double *)&v4 tickle:v8];
  [(TrackpadAlgStage *)self dispatch:v9];
}

- (void)_handleContactFrame:(id)a3
{
  id v4 = a3;
  [(TrackpadAlgStage *)self _tickleMouseFilters];
  if (!self->_parserEnabled)
  {
LABEL_38:
    [(TrackpadAlgStage *)self dispatch:v4];
    goto LABEL_39;
  }
  BOOL v5 = *((_DWORD *)v4 + 11) & 1;
  if (v5 != self->_hostClickEnabled)
  {
    uint64_t v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "";
      *(_WORD *)&buf[22] = 2080;
      *(void *)&unsigned char buf[24] = "-[TrackpadAlgStage _handleContactFrame:]";
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v5;
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Setting host click : %u", buf, 0x26u);
    }

    [(MTTrackpadUberAlg *)self->_uberAlg setHostClickEnabled:v5];
    self->_hostClickEnabled = v5;
  }
  if (!v5 && (*(void *)((unsigned char *)v4 + 124) & 0xFF00000000) != 0) {
    -[TrackpadAlgStage setDeviceButtonState:](self, "setDeviceButtonState:");
  }
  double v8 = (unsigned __int8 *)*((void *)v4 + 6);
  uint64_t v9 = (unsigned __int8 *)*((void *)v4 + 7);
  if (v8 == v9)
  {
LABEL_17:
    memcpy(buf, &unk_110000, 0xC00uLL);
    uint64_t v44 = [(TrackpadAlgStage *)self _extractMTContacts:buf];
    uint64_t v45 = *((void *)v4 + 4);
    if ((int)v44 > 0 || self->_lastNumActivePaths > 0)
    {
      uint64_t v64 = 0;
      [(TrackpadAlgStage *)self _handleContactFrame:buf numActivePaths:v44 timestampS:*((void *)v4 + 3) frameNumber:&v64 baseEvent:1 handleTapAndAHalf:0 isFlush:(double)v45 / 1000000.0];
      if (v64)
      {
        v46 = objc_opt_new();
        v47 = (char **)(v46 + 1);
        uint64_t v48 = v64;
        v49 = (char *)v46[2];
        unint64_t v50 = v46[3];
        if ((unint64_t)v49 >= v50)
        {
          uint64_t v52 = (v49 - *v47) >> 3;
          if ((unint64_t)(v52 + 1) >> 61) {
            std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v53 = v50 - (void)*v47;
          uint64_t v54 = v53 >> 2;
          if (v53 >> 2 <= (unint64_t)(v52 + 1)) {
            uint64_t v54 = v52 + 1;
          }
          if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v55 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v55 = v54;
          }
          v68 = v46 + 3;
          if (v55) {
            v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSUtil::CoderKey const*>>((uint64_t)(v46 + 3), v55);
          }
          else {
            v56 = 0;
          }
          v57 = &v56[8 * v52];
          v58 = &v56[8 * v55];
          v67 = v58;
          *(void *)v57 = v48;
          v51 = v57 + 8;
          v66 = v57 + 8;
          v60 = *v47;
          v59 = (char *)v46[2];
          if (v59 == *v47)
          {
            v62 = (char *)v46[2];
          }
          else
          {
            do
            {
              uint64_t v61 = *((void *)v59 - 1);
              v59 -= 8;
              *(void *)v59 = 0;
              *((void *)v57 - 1) = v61;
              v57 -= 8;
            }
            while (v59 != v60);
            v62 = *v47;
            v59 = (char *)v46[2];
            v51 = v66;
            v58 = v67;
          }
          *v47 = v57;
          v65[1] = v62;
          v46[2] = v51;
          v66 = v59;
          v63 = (char *)v46[3];
          v46[3] = v58;
          v67 = v63;
          v65[0] = v62;
          std::__split_buffer<HIDEvent * {__strong}>::~__split_buffer((uint64_t)v65);
        }
        else
        {
          *(void *)v49 = v64;
          v51 = v49 + 8;
        }
        v46[2] = v51;
        [(TrackpadAlgStage *)self dispatch:v46];
      }
    }
    self->_lastNumActivePaths = v44;
    goto LABEL_38;
  }
  int left = self->_config.surfaceCoordinates.left;
  v11.i32[0] = self->_config.surfaceCoordinates.right;
  v11.i32[1] = self->_config.surfaceCoordinates.top;
  v12.i32[0] = left;
  v12.i32[1] = self->_config.surfaceCoordinates.bottom;
  *(float32x2_t *)v13.f32 = vcvt_f32_s32(vsub_s32(v11, v12));
  v13.i64[1] = v13.i64[0];
  float64x2_t v14 = (float64x2_t)vdupq_n_s64(0x408F400000000000uLL);
  while (1)
  {
    unsigned int v15 = *v8;
    if (v15 > 0x1F) {
      break;
    }
    int v17 = *((_DWORD *)v8 + 12);
    int v16 = *((_DWORD *)v8 + 13);
    unsigned __int8 v18 = v8[24];
    uint64_t v19 = *((void *)v8 + 1);
    int v20 = (char)v8[3];
    int v21 = v8[2];
    int v22 = v8[1];
    v23 = (char *)self->_contacts + 96 * *v8;
    double v24 = *((double *)v23 + 1);
    float v26 = *((float *)v23 + 17);
    float v25 = *((float *)v23 + 18);
    int v27 = *((_DWORD *)v8 + 9);
    *(void *)v23 = *((void *)v4 + 3);
    double v28 = (double)*((uint64_t *)v4 + 4) / 1000000.0;
    *((double *)v23 + 1) = v28;
    *((_DWORD *)v23 + 5) = v22;
    *((_DWORD *)v23 + 6) = v21;
    *((_DWORD *)v23 + 7) = v20;
    int32x2_t v29 = *(int32x2_t *)(v8 + 56);
    v30.i32[0] = left;
    v30.i32[1] = self->_config.surfaceCoordinates.bottom;
    *((_DWORD *)v23 + 12) = v16;
    *((float *)v23 + 13) = (float)v27;
    *((_DWORD *)v23 + 14) = v17;
    uint64_t v31 = *((void *)v8 + 5);
    v32.i64[0] = (int)v31;
    v32.i64[1] = SHIDWORD(v31);
    *(float32x2_t *)(v23 + 60) = vcvt_f32_f64(vdivq_f64(vcvtq_f64_s64(v32), v14));
    v33.i64[0] = *((void *)v8 + 2);
    int32x2_t v34 = vadd_s32(*(int32x2_t *)v33.i8, v30);
    v32.i64[0] = v34.i32[0];
    v32.i64[1] = v34.i32[1];
    float32x2_t v35 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_s64(v32), v14));
    *(float32x2_t *)(v23 + 68) = v35;
    uint64_t v36 = *(void *)(v8 + 28);
    v32.i64[0] = (int)v36;
    v32.i64[1] = SHIDWORD(v36);
    v33.i64[1] = v36;
    *((float32x4_t *)v23 + 2) = vdivq_f32(vcvtq_f32_s32(v33), v13);
    *(float32x2_t *)(v23 + 76) = vcvt_f32_f64(vdivq_f64(vcvtq_f64_s64(v32), v14));
    v37 = v23 + 76;
    *((_DWORD *)v37 - 15) = v15;
    *((_WORD *)v37 + 4) = v19;
    *(int32x2_t *)(v37 + 12) = vrev64_s32(v29);
    if (v18)
    {
      v38 = (float *)((char *)self->_contacts + 96 * v15);
      double v39 = v28 - v24;
      float v40 = (float)(v35.f32[0] - v26) / v39;
      *(float *)v37 = v40;
      float v41 = (float)(v35.f32[1] - v25) / v39;
      v38[20] = v41;
      float v42 = v40 * 1000.0 / v13.f32[0];
      float v43 = v41 * 1000.0 / v13.f32[1];
      v38[10] = v42;
      v38[11] = v43;
    }
    v8 += 64;
    if (v8 == v9) {
      goto LABEL_17;
    }
  }
LABEL_39:
}

- (void)_handleContactFrame:(id)a3[32] numActivePaths:(float)a4 timestampS:frameNumber:baseEvent:handleTapAndAHalf:isFlush:
{
  uint64_t v8 = v7;
  int v9 = v6;
  uint64_t v10 = v5;
  double v11 = *(double *)&a4;
  uint64_t v12 = v4;
  double v18 = 0.0;
  uint64_t v15 = mach_continuous_time();
  [(MTTrackpadUberAlg *)self->_uberAlg processContact:a3 activePathCount:v12 timestamp:v10 baseEvent:&v18 callbackInterval:v8 isFlush:v11];
  int v16 = MTLoggingPlugin();
  if (os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v20 = v15;
    _os_signpost_emit_with_name_impl(&def_411C8, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TrackpadAlgProcessing", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
  }

  if (v18 > 0.0 && v9 != 0) {
    [(TrackpadAlgStage *)self scheduleTapAndAHalfCallbackTimer:v11 delay:v18];
  }
}

- (int)_extractMTContacts:(id *)a3
{
  uint64_t v6 = 0;
  int result = 0;
  contacts = self->_contacts;
  do
  {
    int v9 = (char *)contacts + v6;
    if (*(float *)((char *)&contacts->proximity + v6) > 0.0 || (*((_DWORD *)v9 + 5) - 1) <= 6)
    {
      uint64_t v10 = &a3->var0 + 12 * result++;
      long long v11 = *((_OWORD *)v9 + 1);
      *(_OWORD *)uint64_t v10 = *(_OWORD *)v9;
      *((_OWORD *)v10 + 1) = v11;
      long long v12 = *((_OWORD *)v9 + 2);
      long long v13 = *((_OWORD *)v9 + 3);
      long long v14 = *((_OWORD *)v9 + 5);
      *((_OWORD *)v10 + 4) = *((_OWORD *)v9 + 4);
      *((_OWORD *)v10 + 5) = v14;
      *((_OWORD *)v10 + 2) = v12;
      *((_OWORD *)v10 + 3) = v13;
    }
    v6 += 96;
  }
  while (v6 != 3072);
  return result;
}

- (void)scheduleTapAndAHalfCallbackTimer:(double)a3 delay:(double)a4
{
  uint64_t v7 = MTLoggingPlugin();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "[Debug] ";
    __int16 v13 = 2080;
    long long v14 = "";
    __int16 v15 = 2080;
    int v16 = "-[TrackpadAlgStage scheduleTapAndAHalfCallbackTimer:delay:]";
    __int16 v17 = 2048;
    double v18 = a3;
    __int16 v19 = 2048;
    double v20 = a4;
    _os_log_impl(&def_411C8, v7, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s SC2 : %f %f", buf, 0x34u);
  }

  self->_tsAtTapAndAHalfTimeTimer = a3 + a4;
  if (self->_queue)
  {
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __59__TrackpadAlgStage_scheduleTapAndAHalfCallbackTimer_delay___block_invoke;
    block[3] = &unk_141320;
    objc_copyWeak(v11, (id *)buf);
    v11[1] = *(id *)&a3;
    v11[2] = *(id *)&a4;
    dispatch_after(v8, queue, block);
    objc_destroyWeak(v11);
    objc_destroyWeak((id *)buf);
  }
}

void __59__TrackpadAlgStage_scheduleTapAndAHalfCallbackTimer_delay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (double *)WeakRetained;
  if (WeakRetained)
  {
    double v4 = *(double *)(a1 + 40);
    double v5 = *(double *)(a1 + 48);
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 17));
    if (v3[18] == v4 + v5)
    {
      uint64_t v6 = MTLoggingPlugin();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 136315650;
        long long v11 = "[Debug] ";
        __int16 v12 = 2080;
        __int16 v13 = "";
        __int16 v14 = 2080;
        __int16 v15 = "-[TrackpadAlgStage scheduleTapAndAHalfCallbackTimer:delay:]_block_invoke";
        _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s Sending feedback event for TapAndAHalf!!", (uint8_t *)&v10, 0x20u);
      }

      uint64_t v7 = objc_opt_new();
      dispatch_time_t v8 = (void *)v7[1];
      v7[1] = @"TapAndAHalf";

      int v9 = (id *)objc_opt_new();
      objc_storeStrong(v9 + 2, v7);
      [v3 dispatch:v9];
    }
  }
}

- (void)_handleHSTNotificationEvent:(id)a3
{
  id v4 = a3;
  if ([v4 notification] == 1 || objc_msgSend(v4, "notification") == 11) {
    [(TrackpadAlgStage *)self _clear];
  }
  [(TrackpadAlgStage *)self dispatch:v4];
}

- (void)_tickleMouseFilters
{
  [(TrackpadAlgStage *)self _updateMouseMotionFilterWithXVelocity:1 YVelocity:0.0 tickle:0.0];

  [(TrackpadAlgStage *)self _updateButtonMotionFilter:0 shouldSpike:0.0];
}

- (void)_updateButtonMotionFilter:(float)a3 shouldSpike:(BOOL)a4
{
  BOOL v4 = a4;
  MTAbsoluteTimeGetCurrent();
  if (!v4)
  {
    long double v7 = pow(0.699999988, (v7 - self->_buttonMotionIIRLastUpdateTime) / 0.0112500004);
    *(float *)&long double v7 = v7;
    a3 = (float)((float)(1.0 - *(float *)&v7) * a3) + (float)(*(float *)&v7 * self->_buttonMotionIIR);
  }
  self->_buttonMotionIIR = a3;
  *(float *)&long double v7 = a3;
  [(MTTrackpadUberAlg *)self->_uberAlg setMouseButtonFilterData:(double)v7];
  MTAbsoluteTimeGetCurrent();
  self->_buttonMotionIIRLastUpdateTime = v8;
}

- (void)_updateMouseMotionFilterWithXVelocity:(float)a3 YVelocity:(float)a4 tickle:(BOOL)a5
{
  BOOL v5 = a5;
  MTAbsoluteTimeGetCurrent();
  double v8 = v7 - self->_mouseMotionIIRLastUpdateTime;
  if (!v5 || v8 >= 0.0329999998)
  {
    p_MTPoint mouseMotionIIR = &self->_mouseMotionIIR;
    float32x2_t v10 = vabs_f32((float32x2_t)__PAIR64__(LODWORD(a4), LODWORD(a3)));
    MTPoint mouseMotionIIR = self->_mouseMotionIIR;
    double v11 = v8 / 0.00800000038;
    if (vaddv_f32((float32x2_t)mouseMotionIIR) <= 5.0) {
      long double v12 = 0.870000005;
    }
    else {
      long double v12 = 0.699999988;
    }
    long double v13 = pow(v12, v11);
    *(float *)&long double v13 = v13;
    int32x2_t v23 = *(int32x2_t *)&v13;
    long double v14 = pow(0.200000003, v11);
    *(float *)&long double v14 = v14;
    float32x2_t v15 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v10, (float32x2_t)mouseMotionIIR), (int8x8_t)vdup_lane_s32(*(int32x2_t *)&v14, 0), (int8x8_t)vdup_lane_s32(v23, 0));
    __asm { FMOV            V1.2S, #1.0 }
    MTPoint *p_mouseMotionIIR = (MTPoint)vmla_f32(vmul_f32(v10, vsub_f32(_D1, v15)), (float32x2_t)mouseMotionIIR, v15);
    [(MTTrackpadUberAlg *)self->_uberAlg setMouseMotionFilterData:p_mouseMotionIIR];
    MTAbsoluteTimeGetCurrent();
    self->_mouseMotionIIRLastUpdateTime = v21;
  }
}

- (void)encodeToMap:(void *)a3
{
}

- (BOOL)decodeFromMap:(void *)a3
{
  return 1;
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  [(TrackpadAlgStage *)self encodeToMap:a3];
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
    uint64_t v6 = basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/Alg/TrackpadAlgStage.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[TrackpadAlgStage handleHSDecode:]((uint64_t)v6);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [(TrackpadAlgStage *)self decodeFromMap:&v10];
  }
  if ((void)v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
  }
  double v8 = (void *)v11;
  *(void *)&long long v11 = 0;
  if (v8)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](v8);
    operator delete();
  }
  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSNumber)builtIn
{
  return self->_builtIn;
}

- (void)setBuiltIn:(id)a3
{
}

- (BOOL)supportsDeepPress
{
  return self->_supportsDeepPress;
}

- (void)setSupportsDeepPress:(BOOL)a3
{
  self->_supportsDeepPress = a3;
}

- (unsigned)deviceButtonState
{
  return self->_deviceButtonState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builtIn, 0);
  objc_storeStrong((id *)&self->_cachedSettingsEvent, 0);
  cntrl = (std::__shared_weak_count *)self->_config.dimensions.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uberAlgProperties, 0);

  objc_storeStrong((id *)&self->_uberAlg, 0);
}

- (id).cxx_construct
{
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  return self;
}

- (void)handleHSDecode:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1 = 136315906;
  v2 = "-[TrackpadAlgStage handleHSDecode:]";
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = 683;
  __int16 v7 = 2080;
  double v8 = "coder";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)&v1, 0x2Au);
}

@end