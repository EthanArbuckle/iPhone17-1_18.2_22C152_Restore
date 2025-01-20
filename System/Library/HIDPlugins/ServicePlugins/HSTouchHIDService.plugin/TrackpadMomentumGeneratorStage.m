@interface TrackpadMomentumGeneratorStage
- (MomentumCurve)momentumCurve;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)momentumTimer;
- (TrackpadMomentumGeneratorStage)initWithQueue:(id)a3;
- (float)scrollMomentumDispatchRate;
- (id)createMomentumPointingEventWithDeltas:(const void *)a3;
- (id)createScrollMomentumEventWithDeltas:(const void *)a3;
- (unint64_t)signpostBeginTime;
- (unsigned)momentumBits;
- (void)_handleGetDebugEvent:(id)a3;
- (void)cancelMomentumTimerWithInterrupted:(BOOL)a3;
- (void)dealloc;
- (void)decayMomentumPointDragWithMouseDelta:(const void *)a3;
- (void)dispatch:(id)a3;
- (void)handleConsume:(id)a3;
- (void)handleGetPropertyEvent:(id)a3;
- (void)handleMomentumRequestEvent:(id)a3;
- (void)handleMomentumStateEvent:(id)a3;
- (void)handleSetPropertyEvent:(id)a3;
- (void)handleTimerEvent:(id)a3;
- (void)momentumTimerCallback:(void *)a3;
- (void)setMomentumBits:(unsigned __int8)a3;
- (void)setMomentumCurve:(id)a3;
- (void)setMomentumState:(int)a3;
- (void)setMomentumTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScrollMomentumDispatchRate:(float)a3;
- (void)setScrollMomentumEvent:(id)a3 interrupted:(BOOL)a4;
- (void)setSignpostBeginTime:(unint64_t)a3;
- (void)startMomentumTimerWithMomentumRequest:(id)a3;
@end

@implementation TrackpadMomentumGeneratorStage

- (TrackpadMomentumGeneratorStage)initWithQueue:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TrackpadMomentumGeneratorStage;
  v6 = [(HSStage *)&v14 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  p_queue = &v6->_queue;
  objc_storeStrong((id *)&v6->_queue, a3);
  v9 = objc_alloc_init(MomentumCurve);
  momentumCurve = v7->_momentumCurve;
  v7->_momentumCurve = v9;

  v7->_momentumBits = 0;
  momentumTimer = v7->_momentumTimer;
  v7->_momentumTimer = 0;

  if (!*p_queue) {
    goto LABEL_5;
  }
  if (v7->_momentumCurve) {
    v12 = v7;
  }
  else {
LABEL_5:
  }
    v12 = 0;

  return v12;
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
  v5.super_class = (Class)TrackpadMomentumGeneratorStage;
  [(HSStage *)&v5 dealloc];
}

- (void)dispatch:(id)a3
{
  id v4 = a3;
  objc_super v5 = MTLoggingPlugin();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 134349314;
    unint64_t v8 = [(TrackpadMomentumGeneratorStage *)self signpostBeginTime];
    __int16 v9 = 2080;
    ClassName = object_getClassName(v4);
    _os_signpost_emit_with_name_impl(&def_411C8, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TrackpadMomentumGeneratorStage", "%{public, signpost.description:begin_time}llu event=%s", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)TrackpadMomentumGeneratorStage;
  [(HSStage *)&v6 handleConsume:v4];
  [(TrackpadMomentumGeneratorStage *)self setSignpostBeginTime:mach_continuous_time()];
}

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  [(TrackpadMomentumGeneratorStage *)self setSignpostBeginTime:mach_continuous_time()];
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
    [(TrackpadMomentumGeneratorStage *)self handleMomentumRequestEvent:v5];
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
      [(TrackpadMomentumGeneratorStage *)self handleMomentumStateEvent:v7];
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
        [(TrackpadMomentumGeneratorStage *)self handleTimerEvent:v9];
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
          [(TrackpadMomentumGeneratorStage *)self handleSetPropertyEvent:v11];
        }
        else
        {
          v13 = HSUtil::DynamicCast<HSTGetPropertyEvent>(v11);

          if (v13)
          {
            [(TrackpadMomentumGeneratorStage *)self handleGetPropertyEvent:v11];
          }
          else
          {
            objc_super v14 = HSUtil::DynamicCast<HSTGetDebugStateEvent>(v11);

            if (v14)
            {
              [(TrackpadMomentumGeneratorStage *)self _handleGetDebugEvent:v11];
            }
            else
            {
              v15.receiver = self;
              v15.super_class = (Class)TrackpadMomentumGeneratorStage;
              [(HSStage *)&v15 handleConsume:v11];
            }
          }
        }
      }
    }
  }
}

- (void)handleMomentumRequestEvent:(id)a3
{
  id v4 = a3;
  id v5 = MTLoggingPlugin();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v9 = "";
    __int16 v10 = 2080;
    id v11 = "";
    __int16 v12 = 2080;
    v13 = "-[TrackpadMomentumGeneratorStage handleMomentumRequestEvent:]";
    __int16 v14 = 2112;
    objc_super v15 = v4;
    _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Momentum request event received: %@", buf, 0x2Au);
  }

  int v6 = v4[2];
  switch(v6)
  {
    case 2:
      [(TrackpadMomentumGeneratorStage *)self cancelMomentumTimerWithInterrupted:1];
      break;
    case 1:
      [(TrackpadMomentumGeneratorStage *)self decayMomentumPointDragWithMouseDelta:v4 + 4];
      break;
    case 0:
      [(TrackpadMomentumGeneratorStage *)self startMomentumTimerWithMomentumRequest:v4];
      break;
  }
  v7.receiver = self;
  v7.super_class = (Class)TrackpadMomentumGeneratorStage;
  [(HSStage *)&v7 handleConsume:v4];
}

- (void)handleMomentumStateEvent:(id)a3
{
  id v4 = a3;
  id v5 = MTLoggingPlugin();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v8 = "";
    __int16 v9 = 2080;
    __int16 v10 = "";
    __int16 v11 = 2080;
    __int16 v12 = "-[TrackpadMomentumGeneratorStage handleMomentumStateEvent:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Momentum state event received: %@", buf, 0x2Au);
  }

  v6.receiver = self;
  v6.super_class = (Class)TrackpadMomentumGeneratorStage;
  [(HSStage *)&v6 handleConsume:v4];
}

- (void)handleSetPropertyEvent:(id)a3
{
  id v4 = (id *)a3;
  id v5 = v4;
  objc_super v6 = (char *)(v4 + 2);
  int v7 = *((char *)v4 + 39);
  if (v7 < 0)
  {
    if (v4[3] != (char *)&dword_18 + 2) {
      goto LABEL_19;
    }
    objc_super v6 = *(char **)v6;
  }
  else if (v7 != 26)
  {
    goto LABEL_19;
  }
  uint64_t v8 = *(void *)v6;
  uint64_t v9 = *((void *)v6 + 1);
  uint64_t v10 = *((void *)v6 + 2);
  int v11 = *((unsigned __int16 *)v6 + 12);
  if (v8 == 0x6F4D6C6C6F726353 && v9 == 0x69446D75746E656DLL && v10 == 0x6152686374617073 && v11 == 25972)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v5[5];
      [v15 floatValue];
      -[TrackpadMomentumGeneratorStage setScrollMomentumDispatchRate:](self, "setScrollMomentumDispatchRate:");
    }
  }
LABEL_19:
  v16.receiver = self;
  v16.super_class = (Class)TrackpadMomentumGeneratorStage;
  [(HSStage *)&v16 handleConsume:v5];
}

- (void)handleGetPropertyEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  objc_super v6 = (char *)(v4 + 2);
  int v7 = *((char *)v4 + 39);
  if (v7 < 0)
  {
    if (v4[3] != 26) {
      goto LABEL_18;
    }
    objc_super v6 = *(char **)v6;
  }
  else if (v7 != 26)
  {
    goto LABEL_18;
  }
  uint64_t v8 = *(void *)v6;
  uint64_t v9 = *((void *)v6 + 1);
  uint64_t v10 = *((void *)v6 + 2);
  int v11 = *((unsigned __int16 *)v6 + 12);
  if (v8 == 0x6F4D6C6C6F726353 && v9 == 0x69446D75746E656DLL && v10 == 0x6152686374617073 && v11 == 25972)
  {
    [(TrackpadMomentumGeneratorStage *)self scrollMomentumDispatchRate];
    uint64_t v15 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    objc_super v16 = (void *)v5[5];
    v5[5] = v15;
  }
LABEL_18:
  v17.receiver = self;
  v17.super_class = (Class)TrackpadMomentumGeneratorStage;
  [(HSStage *)&v17 handleConsume:v5];
}

- (void)handleTimerEvent:(id)a3
{
  id v4 = (id *)a3;
  if (![v4[1] isEqualToString:@"MomentumGesture"])
  {
LABEL_6:
    v9.receiver = self;
    v9.super_class = (Class)TrackpadMomentumGeneratorStage;
    [(HSStage *)&v9 handleConsume:v4];
    goto LABEL_7;
  }
  id v5 = [(TrackpadMomentumGeneratorStage *)self momentumTimer];

  if (v5)
  {
    objc_super v6 = (char *)objc_opt_new();
    [(TrackpadMomentumGeneratorStage *)self momentumTimerCallback:v6 + 8];
    [(TrackpadMomentumGeneratorStage *)self dispatch:v6];
    int v7 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
    unsigned int v8 = [v7 atEndOfCurve];

    if (v8) {
      [(TrackpadMomentumGeneratorStage *)self cancelMomentumTimerWithInterrupted:0];
    }

    goto LABEL_6;
  }
LABEL_7:
}

- (void)_handleGetDebugEvent:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v10 = +[NSAssertionHandler currentHandler];
    int v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TrackpadMomentumGeneratorStage _handleGetDebugEvent:]");
    [v10 handleFailureInFunction:v11, @"TrackpadMomentumGeneratorStage.mm", 184, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  v13[0] = @"Stage";
  id v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  v14[0] = v6;
  v13[1] = @"ScrollMomentumDispatchRate";
  [(TrackpadMomentumGeneratorStage *)self scrollMomentumDispatchRate];
  int v7 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v14[1] = v7;
  v13[2] = @"MomentumBits";
  unsigned int v8 = +[NSNumber numberWithUnsignedChar:[(TrackpadMomentumGeneratorStage *)self momentumBits]];
  v14[2] = v8;
  objc_super v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  *((unsigned char *)v4 + 16) = 1;
  [*((id *)v4 + 3) addObject:v9];
  v12.receiver = self;
  v12.super_class = (Class)TrackpadMomentumGeneratorStage;
  [(HSStage *)&v12 handleConsume:v4];
}

- (void)startMomentumTimerWithMomentumRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
  [(TrackpadMomentumGeneratorStage *)self scrollMomentumDispatchRate];
  objc_msgSend(v5, "generateCurvesWithMomentumState:scrollMomentumDispatchRate:", v4);

  objc_super v6 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
  unsigned int v7 = [v6 atEndOfCurve];

  if (v7)
  {
    [(TrackpadMomentumGeneratorStage *)self setMomentumState:1];
  }
  else
  {
    unsigned int v8 = [(TrackpadMomentumGeneratorStage *)self momentumTimer];
    if (v8)
    {
      objc_super v9 = [(TrackpadMomentumGeneratorStage *)self momentumTimer];
      intptr_t v10 = dispatch_source_testcancel(v9);

      if (!v10)
      {
        int v11 = MTLoggingPlugin();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "[Error] ";
          __int16 v26 = 2080;
          v27 = "";
          __int16 v28 = 2080;
          v29 = "-[TrackpadMomentumGeneratorStage startMomentumTimerWithMomentumRequest:]";
          _os_log_impl(&def_411C8, v11, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Tried to start new momentum timer without ending the previous one", buf, 0x20u);
        }

        objc_super v12 = [(TrackpadMomentumGeneratorStage *)self momentumTimer];
        dispatch_source_cancel(v12);
      }
    }
    __int16 v13 = [(TrackpadMomentumGeneratorStage *)self queue];
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v13);
    [(TrackpadMomentumGeneratorStage *)self setMomentumTimer:v14];

    uint64_t v15 = [(TrackpadMomentumGeneratorStage *)self momentumTimer];
    objc_super v16 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
    [v16 currentInterval];
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(float)(v17 * 1000000000.0));
    v19 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
    [v19 currentInterval];
    dispatch_source_set_timer(v15, v18, (unint64_t)(float)(v20 * 1000000000.0), 0);

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v21 = [(TrackpadMomentumGeneratorStage *)self momentumTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __72__TrackpadMomentumGeneratorStage_startMomentumTimerWithMomentumRequest___block_invoke;
    handler[3] = &unk_141240;
    objc_copyWeak(&v24, (id *)buf);
    dispatch_source_set_event_handler(v21, handler);

    [(TrackpadMomentumGeneratorStage *)self setMomentumState:0];
    v22 = [(TrackpadMomentumGeneratorStage *)self momentumTimer];
    dispatch_resume(v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
}

void __72__TrackpadMomentumGeneratorStage_startMomentumTimerWithMomentumRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  v3 = *(void **)(v2 + 8);
  id obj = (id)v2;
  *(void *)(v2 + 8) = @"MomentumGesture";

  id v4 = (id *)objc_opt_new();
  objc_storeStrong(v4 + 2, obj);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dispatch:v4];
}

- (void)momentumTimerCallback:(void *)a3
{
  id v5 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
  id v6 = [v5 getCurrentMomentumDeltasAndStep];

  unsigned int v7 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
  [v7 nextInterval];
  float v9 = v8;
  intptr_t v10 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
  [v10 currentInterval];
  float v12 = v11;

  if (v9 != v12)
  {
    __int16 v13 = [(TrackpadMomentumGeneratorStage *)self momentumTimer];
    dispatch_source_t v14 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
    [v14 nextInterval];
    dispatch_time_t v16 = dispatch_walltime(0, (uint64_t)(float)(v15 * 1000000000.0));
    float v17 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
    [v17 nextInterval];
    dispatch_source_set_timer(v13, v16, (unint64_t)(float)(v18 * 1000000000.0), 0);
  }
  if (v6)
  {
    id v22 = 0;
    v19 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
    unsigned int v20 = [v19 subtype];

    id v21 = v6;
    if (v20 == 1) {
      [(TrackpadMomentumGeneratorStage *)self createScrollMomentumEventWithDeltas:&v21];
    }
    else {
    id v22 = [(TrackpadMomentumGeneratorStage *)self createMomentumPointingEventWithDeltas:&v21];
    }
    std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100]((char **)a3, &v22);
  }
}

- (void)decayMomentumPointDragWithMouseDelta:(const void *)a3
{
  id v5 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
  unint64_t v6 = (unint64_t)[v5 getCurrentMomentumDeltas];
  int v7 = v6;
  unint64_t v8 = HIDWORD(v6);

  float v9 = hypotf((float)v7, (float)(int)v8);
  float v10 = (float)v7 + (double)*(int *)a3 * 0.25;
  float v11 = (float)(int)v8 + (double)*((int *)a3 + 1) * 0.25;
  float v12 = hypotf(v10, v11);
  if (v9 > 0.0 && v12 > v9)
  {
    float v13 = v9 / v12;
    float v10 = v13 * v10;
    float v11 = v13 * v11;
  }
  dispatch_source_t v14 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
  *(float *)float v15 = v10;
  *(float *)&v15[1] = v11;
  [v14 regenerateCurvesWithInitialDelta:v15];
}

- (void)cancelMomentumTimerWithInterrupted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(TrackpadMomentumGeneratorStage *)self momentumTimer];
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    int v7 = [(TrackpadMomentumGeneratorStage *)self momentumTimer];
    intptr_t v8 = dispatch_source_testcancel(v7);

    if (!v8)
    {
      float v9 = [(TrackpadMomentumGeneratorStage *)self momentumTimer];
      dispatch_source_cancel(v9);

      [(TrackpadMomentumGeneratorStage *)self setMomentumTimer:0];
      float v10 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
      unsigned int v11 = [v10 subtype];

      if (v11 == 1)
      {
        float v12 = (char **)objc_opt_new();
        uint64_t v13 = 0;
        id v14 = [(TrackpadMomentumGeneratorStage *)self createScrollMomentumEventWithDeltas:&v13];
        [(TrackpadMomentumGeneratorStage *)self setScrollMomentumEvent:v14 interrupted:v3];
        std::vector<HIDEvent * {__strong}>::push_back[abi:ne180100](v12 + 1, &v14);
        [(TrackpadMomentumGeneratorStage *)self dispatch:v12];
      }
    }
  }
  [(TrackpadMomentumGeneratorStage *)self setMomentumState:1];
}

- (id)createScrollMomentumEventWithDeltas:(const void *)a3
{
  int v5 = *(_DWORD *)a3;
  int v4 = *((_DWORD *)a3 + 1);
  mach_absolute_time();
  ScrollEvent = (void *)IOHIDEventCreateScrollEvent();
  if (v5 | v4)
  {
    if (![(TrackpadMomentumGeneratorStage *)self momentumBits]
      || ([(TrackpadMomentumGeneratorStage *)self momentumBits] & 4) != 0)
    {
      uint64_t v7 = 2;
    }
    else
    {
      uint64_t v7 = ([(TrackpadMomentumGeneratorStage *)self momentumBits] & 3) != 0;
    }
  }
  else
  {
    uint64_t v7 = 4 * (([(TrackpadMomentumGeneratorStage *)self momentumBits] & 3) != 0);
  }
  [(TrackpadMomentumGeneratorStage *)self setMomentumBits:v7];
  [(TrackpadMomentumGeneratorStage *)self momentumBits];
  IOHIDEventSetScrollMomentum();
  intptr_t v8 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
  [v8 scrollMomentumDispatchRate];
  int v10 = v9;

  LODWORD(v11) = v10;
  float v12 = +[NSNumber numberWithFloat:v11];
  _IOHIDEventSetAttachment();

  return ScrollEvent;
}

- (void)setScrollMomentumEvent:(id)a3 interrupted:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4 && (IOHIDEventGetScrollMomentum() & 4) != 0) {
    IOHIDEventSetScrollMomentum();
  }
}

- (id)createMomentumPointingEventWithDeltas:(const void *)a3
{
  mach_absolute_time();
  BOOL v4 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
  [v4 dragButtons];
  id v5 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
  [v5 dragButtons];
  RelativePointerEvent = (void *)IOHIDEventCreateRelativePointerEvent();

  return RelativePointerEvent;
}

- (void)setScrollMomentumDispatchRate:(float)a3
{
  float v5 = 300.0;
  if (a3 <= 300.0) {
    float v5 = a3;
  }
  if (v5 < 60.0) {
    float v5 = 60.0;
  }
  self->_double scrollMomentumDispatchRate = v5;
  unint64_t v6 = MTLoggingPlugin();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double scrollMomentumDispatchRate = self->_scrollMomentumDispatchRate;
    int v8 = 136316162;
    int v9 = "";
    __int16 v10 = 2080;
    double v11 = "";
    __int16 v12 = 2080;
    uint64_t v13 = "-[TrackpadMomentumGeneratorStage setScrollMomentumDispatchRate:]";
    __int16 v14 = 2048;
    double v15 = a3;
    __int16 v16 = 2048;
    double v17 = scrollMomentumDispatchRate;
    _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Momentum scroll dispatch rate set - requested value %f -> set value %f", (uint8_t *)&v8, 0x34u);
  }
}

- (void)setMomentumState:(int)a3
{
  id obj = (_DWORD *)objc_opt_new();
  obj[2] = a3;
  float v5 = [(TrackpadMomentumGeneratorStage *)self momentumCurve];
  obj[3] = [v5 subtype];

  unint64_t v6 = (id *)objc_opt_new();
  objc_storeStrong(v6 + 2, obj);
  [(TrackpadMomentumGeneratorStage *)self dispatch:v6];
}

- (unint64_t)signpostBeginTime
{
  return self->_signpostBeginTime;
}

- (void)setSignpostBeginTime:(unint64_t)a3
{
  self->_signpostBeginTime = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MomentumCurve)momentumCurve
{
  return self->_momentumCurve;
}

- (void)setMomentumCurve:(id)a3
{
}

- (float)scrollMomentumDispatchRate
{
  return self->_scrollMomentumDispatchRate;
}

- (OS_dispatch_source)momentumTimer
{
  return self->_momentumTimer;
}

- (void)setMomentumTimer:(id)a3
{
}

- (unsigned)momentumBits
{
  return self->_momentumBits;
}

- (void)setMomentumBits:(unsigned __int8)a3
{
  self->_momentumBits = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentumTimer, 0);
  objc_storeStrong((id *)&self->_momentumCurve, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end