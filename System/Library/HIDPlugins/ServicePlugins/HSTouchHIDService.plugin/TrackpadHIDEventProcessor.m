@interface TrackpadHIDEventProcessor
+ (unsigned)nextScrollPhase:(unsigned __int8)a3 anyScroll:(BOOL)a4;
- (BOOL)gestureScrollsEnabled;
- (BOOL)hostClickControl;
- (BOOL)isDigitizerCollectionHIDEvent:(id)a3;
- (BOOL)noPointing;
- (BOOL)scrollMomentumEnabled;
- (BOOL)shouldDispatchEvent:(id)a3;
- (NSDictionary)debugDictionary;
- (OS_dispatch_queue)queue;
- (TrackpadHIDEventProcessor)initWithDeviceID:(unint64_t)a3;
- (id)createPointingEventWithDeltaX:(int)a3 deltaY:(int)a4 buttonMask:(unsigned int)a5 timestamp:(unint64_t)a6;
- (id)createScrollEventWithDeltaX:(int)a3 deltaY:(int)a4 deltaZ:(int)a5 options:(unsigned int)a6;
- (id)handleHIDEvent:(id)a3;
- (unint64_t)deviceID;
- (unsigned)deviceButtonState;
- (unsigned)previousButtonState;
- (unsigned)stdScrollPhase;
- (void)_dispatchPointerButtonUpEvent;
- (void)_handleContactFrame:(id)a3;
- (void)_handleMouseSettings:(id)a3;
- (void)_handleTPSettings:(id)a3;
- (void)dealloc;
- (void)dispatch:(id)a3;
- (void)handleConsume:(id)a3;
- (void)handleGetDebugEvent:(id)a3;
- (void)handleHIDEvents:(id)a3;
- (void)handleHSPointerFrame:(id)a3;
- (void)mergeScrollEvent:(id)a3 with:(id)a4;
- (void)setHostClickControl:(BOOL)a3;
- (void)setPreviousButtonState:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)setStdScrollPhase:(unsigned __int8)a3;
- (void)updateScrollPhaseFor:(id)a3 anyScroll:(BOOL)a4;
@end

@implementation TrackpadHIDEventProcessor

+ (unsigned)nextScrollPhase:(unsigned __int8)a3 anyScroll:(BOOL)a4
{
  if (a3 > 5u) {
    return 0;
  }
  else {
    return gNextScrollPhaseForPhase[2 * a3 + a4];
  }
}

- (TrackpadHIDEventProcessor)initWithDeviceID:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TrackpadHIDEventProcessor;
  v4 = [(HSStage *)&v9 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    v6 = (void *)*((void *)v4 + 15);
    *((void *)v4 + 15) = v5;

    v4[128] = 1;
    *((void *)v4 + 20) = a3;
    v4[144] = MTPreferencesGetAppBooleanValue(@"NoPointing", @"com.apple.MultitouchSupport", 0);
    v4[148] = 0;
    *((_DWORD *)v4 + 38) = 0;
    *((_DWORD *)v4 + 39) = 0;
    *(_WORD *)(v4 + 145) = 1;
    v4[147] = 0;
    v7 = v4;
  }

  return (TrackpadHIDEventProcessor *)v4;
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
  v5.super_class = (Class)TrackpadHIDEventProcessor;
  [(HSStage *)&v5 dealloc];
}

- (void)dispatch:(id)a3
{
  id v4 = a3;
  objc_super v5 = MTLoggingPlugin();
  if (os_signpost_enabled(v5))
  {
    unint64_t signpost_begin_time = self->_signpost_begin_time;
    *(_DWORD *)buf = 134349314;
    unint64_t v9 = signpost_begin_time;
    __int16 v10 = 2080;
    ClassName = object_getClassName(v4);
    _os_signpost_emit_with_name_impl(&def_411C8, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TrackpadHIDEventProcessor", "%{public, signpost.description:begin_time}llu event=%s", buf, 0x16u);
  }

  [(HSTHIDEventStatistics *)self->_hidStats handleHIDEvents:v4];
  v7.receiver = self;
  v7.super_class = (Class)TrackpadHIDEventProcessor;
  [(HSStage *)&v7 handleConsume:v4];
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
    [(TrackpadHIDEventProcessor *)self handleHIDEvents:v5];
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
      [(TrackpadHIDEventProcessor *)self _handleTPSettings:v7];
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
        [(TrackpadHIDEventProcessor *)self _handleMouseSettings:v9];
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
          [(TrackpadHIDEventProcessor *)self _handleContactFrame:v11];
        }
        else
        {
          v13 = HSUtil::DynamicCast<HSTGetDebugStateEvent>(v11);

          if (v13)
          {
            [(TrackpadHIDEventProcessor *)self handleGetDebugEvent:v11];
          }
          else
          {
            v14 = HSUtil::DynamicCast<HSPointerFrame>(v11);

            if (v14)
            {
              [(TrackpadHIDEventProcessor *)self handleHSPointerFrame:v11];
            }
            else
            {
              v15.receiver = self;
              v15.super_class = (Class)TrackpadHIDEventProcessor;
              [(HSStage *)&v15 handleConsume:v11];
            }
          }
        }
      }
    }
  }
}

- (void)handleHIDEvents:(id)a3
{
  v20 = 0;
  v21 = 0;
  uint64_t v22 = 0;
  v14 = (char *)a3;
  id v4 = (id *)*((void *)v14 + 1);
  for (i = (id *)*((void *)v14 + 2); v4 != i; ++v4)
  {
    id v6 = *v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = (void ***)0xAAAAAAAAAAAAAAAALL;
        id v7 = (void **)v6;
        v23 = (void ***)v7;
        if ([v7 type] == 1)
        {
          std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100]((char **)&v20, (id *)&v23);
        }
        else
        {
          id v8 = [(TrackpadHIDEventProcessor *)self handleHIDEvent:v7];
          id v9 = v8;
          if (v8)
          {
            long long v15 = 0u;
            long long v16 = 0u;
            long long v17 = 0u;
            long long v18 = 0u;
            id v10 = v8;
            id v11 = [v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v16;
              do
              {
                for (j = 0; j != v11; j = (char *)j + 1)
                {
                  if (*(void *)v16 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
                  unint64_t v19 = *(void *)(*((void *)&v15 + 1) + 8 * (void)j);
                  std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100]((char **)&v20, (id *)&v19);
                }
                id v11 = [v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
              }
              while (v11);
            }
          }
        }
      }
    }
  }
  if (v14 + 8 != (char *)&v20) {
    std::vector<HIDEvent * {__strong}>::__assign_with_size[abi:ne180100]<HIDEvent * {__strong}*,HIDEvent * {__strong}*>((uint64_t)(v14 + 8), v20, v21, v21 - v20);
  }
  [(TrackpadHIDEventProcessor *)self dispatch:v14];
  v23 = &v20;
  std::vector<HIDEvent * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v23);
}

- (id)handleHIDEvent:(id)a3
{
  id v4 = a3;
  if ([(TrackpadHIDEventProcessor *)self shouldDispatchEvent:v4])
  {
    id v7 = v4;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_handleTPSettings:(id)a3
{
  id v4 = a3;
  id v5 = MTLoggingPlugin();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = v4[33];
    int v7 = v4[32];
    int v8 = v4[18];
    *(_DWORD *)buf = 136316418;
    long long v15 = "[Debug] ";
    __int16 v16 = 2080;
    long long v17 = "";
    __int16 v18 = 2080;
    unint64_t v19 = "-[TrackpadHIDEventProcessor _handleTPSettings:]";
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 1024;
    int v23 = v7;
    __int16 v24 = 1024;
    int v25 = v8;
    _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s Momentum [s:%u/e:%u] Scroll [e:%u]", buf, 0x32u);
  }

  if (v4[33]) {
    BOOL v9 = v4[32] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  self->_scrollMomentumEnabled = v9;
  self->_gestureScrollsEnabled = v4[18];
  char v10 = v4[8];
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = !self->_parserEnabled;
  }
  if (!v11 && [(TrackpadHIDEventProcessor *)self previousButtonState])
  {
    uint64_t v12 = MTLoggingPlugin();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      long long v15 = "[Debug] ";
      __int16 v16 = 2080;
      long long v17 = "";
      __int16 v18 = 2080;
      unint64_t v19 = "-[TrackpadHIDEventProcessor _handleTPSettings:]";
      _os_log_impl(&def_411C8, v12, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s Trackpad has been disabled with button down. Dispatching button up event", buf, 0x20u);
    }

    [(TrackpadHIDEventProcessor *)self _dispatchPointerButtonUpEvent];
  }
  self->_parserEnabled = v10;
  v13.receiver = self;
  v13.super_class = (Class)TrackpadHIDEventProcessor;
  [(HSStage *)&v13 handleConsume:v4];
}

- (void)_handleMouseSettings:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[15]) {
    BOOL v6 = v4[16] != 0;
  }
  else {
    BOOL v6 = 0;
  }
  self->_scrollMomentumEnabled = v6;
  self->_gestureScrollsEnabled = v4[18];
  v7.receiver = self;
  v7.super_class = (Class)TrackpadHIDEventProcessor;
  [(HSStage *)&v7 handleConsume:v4];
}

- (void)_handleContactFrame:(id)a3
{
  id v4 = (char *)a3;
  [(TrackpadHIDEventProcessor *)self setHostClickControl:*((_DWORD *)v4 + 11) & 1];
  uint64_t v5 = *(void *)(v4 + 124);
  unsigned __int8 v6 = [(TrackpadHIDEventProcessor *)self hostClickControl];
  if ((v5 & 0xFF00000000) != 0) {
    char v7 = v6;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0 && [(TrackpadHIDEventProcessor *)self deviceButtonState] != v5)
  {
    int v8 = MTLoggingPlugin();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v10 = 136315906;
      *(void *)&v10[4] = "";
      __int16 v11 = 2080;
      uint64_t v12 = "";
      __int16 v13 = 2080;
      v14 = "-[TrackpadHIDEventProcessor _handleContactFrame:]";
      __int16 v15 = 1024;
      int v16 = v5;
      _os_log_impl(&def_411C8, v8, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Dispatching button event from device! [button:%u]", v10, 0x26u);
    }

    BOOL v9 = (char **)objc_opt_new();
    *(void *)char v10 = [(TrackpadHIDEventProcessor *)self createPointingEventWithDeltaX:0 deltaY:0 buttonMask:v5 timestamp:mach_absolute_time()];
    if (*(void *)v10) {
      std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100](v9 + 1, (id *)v10);
    }
    -[TrackpadHIDEventProcessor dispatch:](self, "dispatch:", v9, *(void *)v10);
    self->_deviceButtonState = v5;
  }
}

- (void)handleGetDebugEvent:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    char v7 = +[NSAssertionHandler currentHandler];
    int v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TrackpadHIDEventProcessor handleGetDebugEvent:]");
    [v7 handleFailureInFunction:v8, @"TrackpadHIDEventProcessor.mm", 199, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  v4[16] = 1;
  uint64_t v5 = (void *)*((void *)v4 + 3);
  unsigned __int8 v6 = [(TrackpadHIDEventProcessor *)self debugDictionary];
  [v5 addObject:v6];

  v9.receiver = self;
  v9.super_class = (Class)TrackpadHIDEventProcessor;
  [(HSStage *)&v9 handleConsume:v4];
}

- (BOOL)shouldDispatchEvent:(id)a3
{
  return a3 != 0;
}

- (BOOL)isDigitizerCollectionHIDEvent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  BOOL v5 = v3
    && [v3 type] == 11
    && [v4 integerValueForField:720918] == (char *)&def_411C8 + 1;

  return v5;
}

- (id)createPointingEventWithDeltaX:(int)a3 deltaY:(int)a4 buttonMask:(unsigned int)a5 timestamp:(unint64_t)a6
{
  uint64_t v6 = *(void *)&a5;
  if (a4 | a3 || [(TrackpadHIDEventProcessor *)self previousButtonState] != a5)
  {
    [(TrackpadHIDEventProcessor *)self previousButtonState];
    RelativePointerEvent = (void *)IOHIDEventCreateRelativePointerEvent();
    [(TrackpadHIDEventProcessor *)self setPreviousButtonState:v6];
  }
  else
  {
    RelativePointerEvent = 0;
  }

  return RelativePointerEvent;
}

- (id)createScrollEventWithDeltaX:(int)a3 deltaY:(int)a4 deltaZ:(int)a5 options:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  if ([(TrackpadHIDEventProcessor *)self gestureScrollsEnabled])
  {
    __int16 v11 = +[HIDEvent scrollEvent:mach_absolute_time() x:v6 y:(double)a3 z:(double)a4 options:(double)a5];
    [(TrackpadHIDEventProcessor *)self updateScrollPhaseFor:v11 anyScroll:(a4 | a3 | a5) != 0];
  }
  else
  {
    __int16 v11 = 0;
  }

  return v11;
}

- (void)updateScrollPhaseFor:(id)a3 anyScroll:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 type] == 6)
  {
    [(TrackpadHIDEventProcessor *)self setStdScrollPhase:+[TrackpadHIDEventProcessor nextScrollPhase:[(TrackpadHIDEventProcessor *)self stdScrollPhase] anyScroll:v4]];
    if ([(TrackpadHIDEventProcessor *)self stdScrollPhase]) {
      IOHIDEventSetPhase();
    }
  }
}

- (void)mergeScrollEvent:(id)a3 with:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if ([v20 type] == 6 && objc_msgSend(v6, "type") == 6)
  {
    [v6 doubleValueForField:393216];
    double v8 = v7;
    [v6 doubleValueForField:393217];
    double v10 = v9;
    [v6 doubleValueForField:393218];
    double v12 = v11;
    [v20 doubleValueForField:393216];
    float v13 = v8;
    [v20 setDoubleValue:393216 forField:v14 + v13];
    [v20 doubleValueForField:393217];
    *(float *)&double v10 = v10;
    [v20 setDoubleValue:393217 forField:v15 + *(float *)&v10];
    [v20 doubleValueForField:393218];
    float v16 = v12;
    [v20 setDoubleValue:393218 forField:v17 + v16];
    BOOL v18 = *(float *)&v10 != 0.0 || v13 != 0.0;
    uint64_t v19 = v16 != 0.0 || v18;
    [(TrackpadHIDEventProcessor *)self updateScrollPhaseFor:v20 anyScroll:v19];
  }
}

- (void)_dispatchPointerButtonUpEvent
{
  id v3 = (char **)objc_opt_new();
  id v4 = [(TrackpadHIDEventProcessor *)self createPointingEventWithDeltaX:0 deltaY:0 buttonMask:0 timestamp:mach_absolute_time()];
  if (v4) {
    std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100](v3 + 1, &v4);
  }
  [(TrackpadHIDEventProcessor *)self dispatch:v3];
}

- (NSDictionary)debugDictionary
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v16[0] = v4;
  BOOL v5 = +[NSNumber numberWithBool:[(TrackpadHIDEventProcessor *)self noPointing]];
  v16[1] = v5;
  v15[2] = @"GestureScrollsEnabled";
  id v6 = +[NSNumber numberWithBool:[(TrackpadHIDEventProcessor *)self gestureScrollsEnabled]];
  v16[2] = v6;
  v15[3] = @"ScrollMomentumEnabled";
  double v7 = +[NSNumber numberWithBool:[(TrackpadHIDEventProcessor *)self scrollMomentumEnabled]];
  v16[3] = v7;
  v15[4] = @"HostClickControl";
  double v8 = +[NSNumber numberWithBool:[(TrackpadHIDEventProcessor *)self hostClickControl]];
  v16[4] = v8;
  v15[5] = @"PreviousButtonState";
  double v9 = +[NSNumber numberWithUnsignedInt:[(TrackpadHIDEventProcessor *)self previousButtonState]];
  v16[5] = v9;
  v15[6] = @"DeviceButtonState";
  double v10 = +[NSNumber numberWithUnsignedInt:[(TrackpadHIDEventProcessor *)self deviceButtonState]];
  v16[6] = v10;
  v15[7] = @"ScrollEventPhase";
  double v11 = +[NSNumber numberWithUnsignedChar:[(TrackpadHIDEventProcessor *)self stdScrollPhase]];
  v16[7] = v11;
  v15[8] = @"GenerationStats";
  double v12 = [(HSTHIDEventStatistics *)self->_hidStats stats];
  v16[8] = v12;
  float v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:9];

  return (NSDictionary *)v13;
}

- (void)handleHSPointerFrame:(id)a3
{
  id v4 = (unsigned int *)a3;
  BOOL v5 = (char **)objc_opt_new();
  id v6 = [(TrackpadHIDEventProcessor *)self createPointingEventWithDeltaX:v4[9] deltaY:v4[10] buttonMask:v4[8] timestamp:mach_absolute_time()];
  if (v6)
  {
    std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100](v5 + 1, &v6);
    [(TrackpadHIDEventProcessor *)self dispatch:v5];
  }
}

- (unint64_t)deviceID
{
  return self->_deviceID;
}

- (BOOL)noPointing
{
  return self->_noPointing;
}

- (BOOL)gestureScrollsEnabled
{
  return self->_gestureScrollsEnabled;
}

- (BOOL)scrollMomentumEnabled
{
  return self->_scrollMomentumEnabled;
}

- (unsigned)stdScrollPhase
{
  return self->_stdScrollPhase;
}

- (void)setStdScrollPhase:(unsigned __int8)a3
{
  self->_stdScrollPhase = a3;
}

- (BOOL)hostClickControl
{
  return self->_hostClickControl;
}

- (void)setHostClickControl:(BOOL)a3
{
  self->_hostClickControl = a3;
}

- (unsigned)deviceButtonState
{
  return self->_deviceButtonState;
}

- (unsigned)previousButtonState
{
  return self->_previousButtonState;
}

- (void)setPreviousButtonState:(unsigned int)a3
{
  self->_previousButtonState = a3;
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

  objc_storeStrong((id *)&self->_hidStats, 0);
}

@end