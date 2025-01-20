@interface _WKTouchEventGenerator
+ (id)sharedTouchEventGenerator;
+ (int64_t)nextEventCallbackID;
- (BOOL)_sendHIDEvent:(__IOHIDEvent *)a3 window:(id)a4;
- (BOOL)_sendMarkerHIDEventInWindow:(id)a3 completionBlock:(id)a4;
- (NSMutableDictionary)eventCallbacks;
- (_WKTouchEventGenerator)init;
- (__IOHIDEvent)_createIOHIDEventType:(int)a3;
- (id).cxx_construct;
- (uint64_t)_sendHIDEvent:(WTF *)this window:(void *)a2;
- (uint64_t)_sendHIDEvent:(uint64_t)a1 window:;
- (uint64_t)_sendMarkerHIDEventInWindow:(WTF *)this completionBlock:(void *)a2;
- (uint64_t)_sendMarkerHIDEventInWindow:(uint64_t)a1 completionBlock:;
- (void)_sendHIDEvent:(void *)a1 window:;
- (void)_sendMarkerHIDEventInWindow:(void *)a1 completionBlock:;
- (void)_updateTouchPoints:(CGPoint *)a3 count:(unint64_t)a4 window:(id)a5;
- (void)dealloc;
- (void)liftUp:(CGPoint)a3 touchCount:(unint64_t)a4 window:(id)a5;
- (void)liftUp:(CGPoint)a3 window:(id)a4 completionBlock:(id)a5;
- (void)liftUpAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 window:(id)a5;
- (void)moveToPoint:(CGPoint)a3 duration:(double)a4 window:(id)a5 completionBlock:(id)a6;
- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 duration:(double)a5 window:(id)a6;
- (void)receivedHIDEvent:(__IOHIDEvent *)a3;
- (void)setEventCallbacks:(id)a3;
- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 window:(id)a5;
- (void)touchDown:(CGPoint)a3 window:(id)a4 completionBlock:(id)a5;
- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 window:(id)a5;
@end

@implementation _WKTouchEventGenerator

+ (id)sharedTouchEventGenerator
{
  if (_MergedGlobals_36 == 1) {
    return (id)qword_1EB3589A8;
  }
  id result = objc_alloc_init(_WKTouchEventGenerator);
  qword_1EB3589A8 = (uint64_t)result;
  _MergedGlobals_36 = 1;
  return result;
}

+ (int64_t)nextEventCallbackID
{
  return +++[_WKTouchEventGenerator nextEventCallbackID]::callbackID;
}

- (_WKTouchEventGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)_WKTouchEventGenerator;
  v2 = [(_WKTouchEventGenerator *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = 0;
    activePoints = v2->_activePoints;
    do
    {
      activePoints->identifier = fingerIdentifiers[v4];
      ++activePoints;
      ++v4;
    }
    while (v4 != 5);
    v2->_eventCallbacks = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKTouchEventGenerator;
  [(_WKTouchEventGenerator *)&v3 dealloc];
}

- (__IOHIDEvent)_createIOHIDEventType:(int)a3
{
  mach_absolute_time();
  DigitizerEvent = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent();
  IOHIDEventSetIntegerValue();
  if (self->_activePointCount)
  {
    unint64_t v6 = 0;
    p_pathProximity = &self->_activePoints[0].pathProximity;
    do
    {
      if (a3 == 1)
      {
        if (*((double *)p_pathProximity - 2) == 0.0) {
          *((void *)p_pathProximity - 2) = 0x4014000000000000;
        }
        if (*((double *)p_pathProximity - 1) == 0.0) {
          *((void *)p_pathProximity - 1) = 0;
        }
        if (!*p_pathProximity) {
          unsigned __int8 *p_pathProximity = 3;
        }
      }
      else if ((a3 & 0xFFFFFFFE) == 4)
      {
        *((void *)p_pathProximity - 2) = 0;
        *((void *)p_pathProximity - 1) = 0;
        unsigned __int8 *p_pathProximity = 0;
      }
      DigitizerFingerEvent = (const void *)IOHIDEventCreateDigitizerFingerEvent();
      IOHIDEventSetFloatValue();
      IOHIDEventSetFloatValue();
      IOHIDEventAppendEvent();
      if (DigitizerFingerEvent) {
        CFRelease(DigitizerFingerEvent);
      }
      ++v6;
      p_pathProximity += 48;
    }
    while (v6 < self->_activePointCount);
  }
  return DigitizerEvent;
}

- (BOOL)_sendHIDEvent:(__IOHIDEvent *)a3 window:(id)a4
{
  if (!self->_ioSystemClient.m_ptr)
  {
    objc_super v7 = (void *)IOHIDEventSystemClientCreate();
    m_ptr = self->_ioSystemClient.m_ptr;
    self->_ioSystemClient.m_ptr = v7;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  if (a3)
  {
    v9 = (WTF::RunLoop *)[a4 _contextId];
    int v10 = (int)v9;
    WTF::RunLoop::main(v9);
    CFRetain(a3);
    uint64_t v11 = WTF::fastMalloc((WTF *)0x18);
    *(void *)uint64_t v11 = &unk_1EE9B25A0;
    *(void *)(v11 + 8) = a3;
    *(_DWORD *)(v11 + 16) = v10;
    uint64_t v13 = v11;
    WTF::RunLoop::dispatch();
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    }
  }
  return 1;
}

- (BOOL)_sendMarkerHIDEventInWindow:(id)a3 completionBlock:(id)a4
{
  int64_t v14 = +[_WKTouchEventGenerator nextEventCallbackID];
  -[NSMutableDictionary setObject:forKey:](self->_eventCallbacks, "setObject:forKey:", _Block_copy(a4), [NSNumber numberWithLong:v14]);
  mach_absolute_time();
  uint64_t VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
  if (VendorDefinedEvent)
  {
    uint64_t v8 = VendorDefinedEvent;
    v9 = (WTF::RunLoop *)[a3 _contextId];
    int v10 = (int)v9;
    WTF::RunLoop::main(v9);
    uint64_t v11 = WTF::fastMalloc((WTF *)0x18);
    *(void *)uint64_t v11 = &unk_1EE9B25C8;
    *(void *)(v11 + 8) = v8;
    *(_DWORD *)(v11 + 16) = v10;
    uint64_t v13 = v11;
    WTF::RunLoop::dispatch();
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    }
  }
  return 1;
}

- (void)_updateTouchPoints:(CGPoint *)a3 count:(unint64_t)a4 window:(id)a5
{
  unint64_t activePointCount = self->_activePointCount;
  if (activePointCount)
  {
    if (!a4)
    {
      self->_unint64_t activePointCount = 0;
      uint64_t v8 = 4;
      goto LABEL_12;
    }
    if (activePointCount == a4) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 3;
    }
    self->_unint64_t activePointCount = a4;
  }
  else
  {
    self->_unint64_t activePointCount = a4;
    uint64_t v8 = 1;
    if (!a4) {
      goto LABEL_12;
    }
  }
  p_point = &self->_activePoints[0].point;
  do
  {
    CGPoint v10 = *a3++;
    CGPoint *p_point = v10;
    p_point += 3;
    --a4;
  }
  while (a4);
LABEL_12:
  uint64_t v11 = [(_WKTouchEventGenerator *)self _createIOHIDEventType:v8];
  [(_WKTouchEventGenerator *)self _sendHIDEvent:v11 window:a5];
  if (v11)
  {
    CFRelease(v11);
  }
}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 window:(id)a5
{
  unint64_t v7 = 5;
  if (a4 < 5) {
    unint64_t v7 = a4;
  }
  self->_unint64_t activePointCount = v7;
  if (v7)
  {
    p_point = &self->_activePoints[0].point;
    do
    {
      CGPoint v9 = *a3++;
      CGPoint *p_point = v9;
      p_point += 3;
      --v7;
    }
    while (v7);
  }
  CGPoint v10 = [(_WKTouchEventGenerator *)self _createIOHIDEventType:1];
  [(_WKTouchEventGenerator *)self _sendHIDEvent:v10 window:a5];
  if (v10)
  {
    CFRelease(v10);
  }
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 window:(id)a5
{
  if (a4 >= 5) {
    unint64_t v7 = 5;
  }
  else {
    unint64_t v7 = a4;
  }
  if (v7)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    uint64_t v10 = WTF::fastMalloc((WTF *)(16 * v7));
    uint64_t v11 = (WTF *)v10;
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = (CGFloat *)(v10 + v12);
      *uint64_t v13 = x;
      v13[1] = y;
      v12 += 16;
    }
    while (16 * v7 != v12);
  }
  else
  {
    uint64_t v11 = 0;
  }
  [(_WKTouchEventGenerator *)self touchDownAtPoints:v11 touchCount:v7 window:a5];
  if (v11)
  {
    WTF::fastFree(v11, v14);
  }
}

- (void)liftUpAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 window:(id)a5
{
  unint64_t activePointCount = self->_activePointCount;
  if (a4 >= activePointCount) {
    unint64_t v8 = self->_activePointCount;
  }
  else {
    unint64_t v8 = a4;
  }
  if (v8 >= 5) {
    uint64_t v9 = 5;
  }
  else {
    uint64_t v9 = v8;
  }
  if (v9)
  {
    uint64_t v10 = (_OWORD *)((char *)&self->_activePoints[0].point.x + 48 * activePointCount - 48 * v9);
    uint64_t v11 = v9;
    do
    {
      long long v12 = (__int128)*a3++;
      *uint64_t v10 = v12;
      v10 += 3;
      --v11;
    }
    while (v11);
  }
  uint64_t v13 = [(_WKTouchEventGenerator *)self _createIOHIDEventType:4];
  [(_WKTouchEventGenerator *)self _sendHIDEvent:v13 window:a5];
  self->_unint64_t activePointCount = activePointCount - v9;
  if (v13)
  {
    CFRelease(v13);
  }
}

- (void)liftUp:(CGPoint)a3 touchCount:(unint64_t)a4 window:(id)a5
{
  if (a4 >= 5) {
    unint64_t v7 = 5;
  }
  else {
    unint64_t v7 = a4;
  }
  if (v7)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    uint64_t v10 = WTF::fastMalloc((WTF *)(16 * v7));
    uint64_t v11 = (WTF *)v10;
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = (CGFloat *)(v10 + v12);
      *uint64_t v13 = x;
      v13[1] = y;
      v12 += 16;
    }
    while (16 * v7 != v12);
  }
  else
  {
    uint64_t v11 = 0;
  }
  [(_WKTouchEventGenerator *)self liftUpAtPoints:v11 touchCount:v7 window:a5];
  if (v11)
  {
    WTF::fastFree(v11, v14);
  }
}

- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 duration:(double)a5 window:(id)a6
{
  if (a4 >= 5) {
    unint64_t v10 = 5;
  }
  else {
    unint64_t v10 = a4;
  }
  if (v10)
  {
    uint64_t v11 = (WTF *)WTF::fastMalloc((WTF *)(16 * v10));
    uint64_t v12 = (WTF *)WTF::fastMalloc((WTF *)(16 * v10));
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (a5 + -0.016 > 0.0)
  {
    int v14 = 0;
    do
    {
      double v15 = CFAbsoluteTimeGetCurrent() - Current;
      if (v10)
      {
        long double v16 = sin(v15 / a5 * 3.14159265 * 0.5);
        *(double *)&uint64_t v17 = sin(v15 / a5 * v16 * 3.14159265 * 0.5);
        p_point = &self->_activePoints[0].point;
        float64x2_t v19 = (float64x2_t)vdupq_lane_s64(v17, 0);
        v20 = (float64x2_t *)v11;
        v21 = a3;
        v22 = (float64x2_t *)v12;
        unint64_t v23 = v10;
        do
        {
          if (!v14) {
            float64x2_t *v20 = *(float64x2_t *)p_point;
          }
          float64x2_t v24 = *v20++;
          float64x2_t v25 = v24;
          float64x2_t v26 = *(float64x2_t *)v21++;
          *v22++ = vmlaq_f64(v25, v19, vsubq_f64(v26, v25));
          p_point += 3;
          --v23;
        }
        while (v23);
      }
      [(_WKTouchEventGenerator *)self _updateTouchPoints:v12 count:v10 window:a6];
      double v27 = -(v15 - (double)v14 * 0.016);
      if (v27 > 0.0)
      {
        __rqtp.tv_sec = 0;
        __rqtp.tv_nsec = (uint64_t)(v27 * 1000000000.0);
        nanosleep(&__rqtp, 0);
      }
      ++v14;
    }
    while (v15 < a5 + -0.016);
  }
  [(_WKTouchEventGenerator *)self _updateTouchPoints:a3 count:v10 window:a6];
  if (v12) {
    WTF::fastFree(v12, v28);
  }
  if (v11) {
    WTF::fastFree(v11, v28);
  }
}

- (void)touchDown:(CGPoint)a3 window:(id)a4 completionBlock:(id)a5
{
  -[_WKTouchEventGenerator touchDown:touchCount:window:](self, "touchDown:touchCount:window:", 1, a4, a3.x, a3.y);

  [(_WKTouchEventGenerator *)self _sendMarkerHIDEventInWindow:a4 completionBlock:a5];
}

- (void)liftUp:(CGPoint)a3 window:(id)a4 completionBlock:(id)a5
{
  -[_WKTouchEventGenerator liftUp:touchCount:window:](self, "liftUp:touchCount:window:", 1, a4, a3.x, a3.y);

  [(_WKTouchEventGenerator *)self _sendMarkerHIDEventInWindow:a4 completionBlock:a5];
}

- (void)moveToPoint:(CGPoint)a3 duration:(double)a4 window:(id)a5 completionBlock:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CGPoint v9 = a3;
  [(_WKTouchEventGenerator *)self moveToPoints:&v9 touchCount:1 duration:a5 window:a4];
  [(_WKTouchEventGenerator *)self _sendMarkerHIDEventInWindow:a5 completionBlock:a6];
}

- (void)receivedHIDEvent:(__IOHIDEvent *)a3
{
  if (IOHIDEventGetType() == 1)
  {
    uint64_t v4 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue()];
    uint64_t v5 = [(NSMutableDictionary *)self->_eventCallbacks objectForKey:v4];
    if (v5)
    {
      unint64_t v6 = (void (**)(void))v5;
      [(NSMutableDictionary *)self->_eventCallbacks removeObjectForKey:v4];
      v6[2](v6);
      _Block_release(v6);
    }
  }
}

- (NSMutableDictionary)eventCallbacks
{
  return self->_eventCallbacks;
}

- (void)setEventCallbacks:(id)a3
{
}

- (void).cxx_destruct
{
  m_ptr = self->_ioSystemClient.m_ptr;
  self->_ioSystemClient.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)_sendHIDEvent:(void *)a1 window:
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9B25A0;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_sendHIDEvent:(WTF *)this window:(void *)a2
{
  objc_super v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EE9B25A0;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)_sendHIDEvent:(uint64_t)a1 window:
{
  softLinkBKSHIDEventSetDigitizerInfo(*(__IOHIDEvent **)(a1 + 8), *(_DWORD *)(a1 + 16), 0, 0, 0, 0.0, 0.0);
  v2 = (void *)[MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v3 = *(void *)(a1 + 8);

  return [v2 _enqueueHIDEvent:v3];
}

- (void)_sendMarkerHIDEventInWindow:(void *)a1 completionBlock:
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9B25C8;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_sendMarkerHIDEventInWindow:(WTF *)this completionBlock:(void *)a2
{
  uint64_t v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EE9B25C8;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)_sendMarkerHIDEventInWindow:(uint64_t)a1 completionBlock:
{
  softLinkBKSHIDEventSetDigitizerInfo(*(__IOHIDEvent **)(a1 + 8), *(_DWORD *)(a1 + 16), 0, 0, 0, 0.0, 0.0);
  v2 = (void *)[MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v3 = *(void *)(a1 + 8);

  return [v2 _enqueueHIDEvent:v3];
}

@end