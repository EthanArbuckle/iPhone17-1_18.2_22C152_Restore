@interface WKTouchEventsGestureRecognizer
+ (void)initialize;
- (BOOL)_hasActiveTouchesForEvent:(id)a3;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)isDefaultPrevented;
- (BOOL)isDispatchingTouchEvents;
- (NSMapTable)activeTouchesByIdentifier;
- (WKTouchEvent)_touchEventForTouch:(SEL)a3;
- (WKTouchEventsGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 touchDelegate:(id)a5;
- (const)lastTouchEvent;
- (id).cxx_construct;
- (void)_processTouches:(id)a3 withEvent:(id)a4 type:(unsigned __int8)a5;
- (void)_recordTouches:(id)a3 type:(unsigned __int8)a4 coalescedTouches:(id)a5 predictedTouches:(id)a6;
- (void)_updateTapStateWithTouches:(id)a3;
- (void)_updateTapStateWithTouches:(id)a3 type:(unsigned __int8)a4;
- (void)cancel;
- (void)performAction;
- (void)reset;
- (void)setDefaultPrevented:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation WKTouchEventsGestureRecognizer

- (WKTouchEventsGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 touchDelegate:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)WKTouchEventsGestureRecognizer;
  v8 = [(WKTouchEventsGestureRecognizer *)&v15 initWithTarget:0 action:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_touchTarget, a3);
    if (a4) {
      SEL v10 = a4;
    }
    else {
      SEL v10 = 0;
    }
    v9->_touchAction = v10;
    objc_storeWeak((id *)&v9->_touchEventDelegate, a5);
    v11 = (void *)[MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    v12 = v11;
    if (v11) {
      CFRetain(v11);
    }
    m_ptr = v9->_activeTouchesByIdentifier.m_ptr;
    v9->_activeTouchesByIdentifier.m_ptr = v12;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    [(WKTouchEventsGestureRecognizer *)v9 reset];
  }
  return v9;
}

- (void)reset
{
  if (self->_wasExplicitlyCancelled && self->_lastTouchEvent.type <= 1u)
  {
    self->_lastTouchEvent.type = 3;
    unsigned int m_size = self->_lastTouchEvent.touchPoints.m_size;
    if (m_size)
    {
      uint64_t v4 = 88 * m_size;
      v5 = (void *)((char *)self->_lastTouchEvent.touchPoints.m_buffer + 40);
      do
      {
        void *v5 = 4;
        v5 += 11;
        v4 -= 88;
      }
      while (v4);
    }
    [(WKTouchEventsGestureRecognizer *)self performAction];
  }
  self->_passedHitTest = 0;
  self->_defaultPrevented = 0;
  self->_dispatchingTouchEvents = 0;
  self->_wasExplicitlyCancelled = 0;
  self->_originalGestureDistance = NAN;
  self->_originalGestureAngle = NAN;
  self->_isPotentialTap = 0;
  self->_lastTouchEvent.type = 0;
  self->_lastTouchEvent.timestamp = 0.0;
  v6 = (CGPoint *)MEMORY[0x1E4F1DAD8];
  self->_lastTouchEvent.locationInScreenCoordinates = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_lastTouchEvent.locationInDocumentCoordinates = *v6;
  *(int64x2_t *)&self->_lastTouchEvent.scale = vdupq_n_s64(0x7FF8000000000000uLL);
  self->_lastTouchEvent.inJavaScriptGesture = 0;
  self->_lastTouchEvent.isPotentialTap = 0;
  v16 = 0;
  uint64_t v17 = 0;
  uint64_t v7 = self->_lastTouchEvent.coalescedEvents.m_size;
  if (v7) {
    WTF::VectorTypeOperations<WebKit::WKTouchEvent>::destruct((WTF *)self->_lastTouchEvent.coalescedEvents.m_buffer, (WTF *)&self->_lastTouchEvent.coalescedEvents.m_buffer[v7]);
  }
  m_buffer = self->_lastTouchEvent.coalescedEvents.m_buffer;
  if (m_buffer)
  {
    self->_lastTouchEvent.coalescedEvents.m_buffer = 0;
    self->_lastTouchEvent.coalescedEvents.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
    v9 = v16;
    uint64_t v10 = v17;
  }
  else
  {
    v9 = 0;
    uint64_t v10 = 0;
  }
  v16 = 0;
  uint64_t v17 = 0;
  self->_lastTouchEvent.coalescedEvents.m_buffer = v9;
  *(void *)&self->_lastTouchEvent.coalescedEvents.m_capacity = v10;
  WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v16, (void *)a2);
  v16 = 0;
  uint64_t v17 = 0;
  uint64_t v12 = self->_lastTouchEvent.predictedEvents.m_size;
  if (v12) {
    WTF::VectorTypeOperations<WebKit::WKTouchEvent>::destruct((WTF *)self->_lastTouchEvent.predictedEvents.m_buffer, (WTF *)&self->_lastTouchEvent.predictedEvents.m_buffer[v12]);
  }
  v13 = self->_lastTouchEvent.predictedEvents.m_buffer;
  if (v13)
  {
    self->_lastTouchEvent.predictedEvents.m_buffer = 0;
    self->_lastTouchEvent.predictedEvents.m_capacity = 0;
    WTF::fastFree((WTF *)v13, v11);
    v14 = v16;
    uint64_t v15 = v17;
  }
  else
  {
    v14 = 0;
    uint64_t v15 = 0;
  }
  v16 = 0;
  uint64_t v17 = 0;
  self->_lastTouchEvent.predictedEvents.m_buffer = v14;
  *(void *)&self->_lastTouchEvent.predictedEvents.m_capacity = v15;
  WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v16, v11);
  self->_lastTouchesBeganTime = 0.0;
  if (self->_lastTouchesBeganLocation.__engaged_) {
    self->_lastTouchesBeganLocation.__engaged_ = 0;
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    do
      incrementingTouchIdentifier = arc4random();
    while ((incrementingTouchIdentifier + 1) < 2);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 328) = 0;
  *((unsigned char *)self + 344) = 0;
  *((unsigned char *)self + 352) = 0;
  *((void *)self + 45) = 0;
  *((void *)self + 50) = 0;
  *((void *)self + 51) = 0;
  *((unsigned char *)self + 416) = 0;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *((unsigned char *)self + 472) = 0;
  *((void *)self + 60) = 0;
  return self;
}

- (NSMapTable)activeTouchesByIdentifier
{
  return (NSMapTable *)self->_activeTouchesByIdentifier.m_ptr;
}

- (void)cancel
{
  self->_wasExplicitlyCancelled = 0;
  unint64_t v3 = [(WKTouchEventsGestureRecognizer *)self state];
  if (v3 <= 2)
  {
    uint64_t v4 = qword_1994F6F08[v3];
    self->_wasExplicitlyCancelled = 1;
    [(WKTouchEventsGestureRecognizer *)self setState:v4];
  }
}

- (void)_updateTapStateWithTouches:(id)a3
{
  if ([a3 count] == 1)
  {
    v5 = (void *)[a3 anyObject];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v7 = v6;
    objc_msgSend(v5, "locationInView:", -[WKTouchEventsGestureRecognizer view](self, "view"));
    p_lastTouchesBeganLocation = &self->_lastTouchesBeganLocation;
    if (!self->_lastTouchesBeganLocation.__engaged_)
    {
      self->_lastTouchesBeganTime = v7;
      p_lastTouchesBeganLocation->var0.__val_.x = v8;
      self->_lastTouchesBeganLocation.var0.__val_.y = v9;
      BOOL v11 = 1;
      self->_lastTouchesBeganLocation.__engaged_ = 1;
      goto LABEL_8;
    }
    if (v7 - self->_lastTouchesBeganTime <= 0.75 && vabdd_f64(p_lastTouchesBeganLocation->var0.__val_.x, v8) <= 45.0)
    {
      BOOL v11 = vabdd_f64(self->_lastTouchesBeganLocation.var0.__val_.y, v9) <= 45.0;
      goto LABEL_8;
    }
  }
  BOOL v11 = 0;
LABEL_8:
  self->_lastTouchEvent.isPotentialTap = v11;
  self->_isPotentialTap = v11;
}

- (void)_updateTapStateWithTouches:(id)a3 type:(unsigned __int8)a4
{
  switch(a4)
  {
    case 0u:
      goto LABEL_3;
    case 1u:
    case 2u:
      if (self->_isPotentialTap) {
LABEL_3:
      }
        [(WKTouchEventsGestureRecognizer *)self _updateTapStateWithTouches:a3];
      break;
    case 3u:
      self->_lastTouchEvent.isPotentialTap = 0;
      self->_isPotentialTap = 0;
      break;
    default:
      return;
  }
}

- (WKTouchEvent)_touchEventForTouch:(SEL)a3
{
  [a4 locationInView:0];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_msgSend((id)-[WKTouchEventsGestureRecognizer view](self, "view"), "convertPoint:fromView:", 0, v7, v9);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v15 = COERCE_DOUBLE([a4 phase]);
  [a4 majorRadius];
  double v33 = v16;
  [a4 maximumPossibleForce];
  uint64_t v17 = 0;
  double v18 = 0.0;
  if (v19 > 0.0)
  {
    [a4 force];
    double v21 = v20;
    [a4 maximumPossibleForce];
    double v18 = v21 / v22;
  }
  if ([a4 type] == 2)
  {
    [a4 altitudeAngle];
    uint64_t v31 = v23;
    objc_msgSend(a4, "azimuthAngleInView:", objc_msgSend((id)-[WKTouchEventsGestureRecognizer view](self, "view"), "window"));
    uint64_t v17 = v24;
    char v25 = 1;
  }
  else
  {
    char v25 = 0;
    uint64_t v31 = 0;
  }
  retstr->timestamp = 0.0;
  retstr->scale = 0.0;
  retstr->rotation = 0.0;
  retstr->inJavaScriptGesture = 0;
  retstr->touchPoints = 0u;
  retstr->coalescedEvents = 0u;
  retstr->predictedEvents = 0u;
  retstr->isPotentialTap = 0;
  retstr->type = 1;
  objc_msgSend(a4, "timestamp", v31);
  double v27 = v26;
  double v28 = CACurrentMediaTime();
  double v29 = *MEMORY[0x1E4F1CF78] + CFAbsoluteTimeGetCurrent() - (v28 - v27);
  retstr->locationInDocumentCoordinates.x = v12;
  retstr->locationInDocumentCoordinates.y = v14;
  retstr->timestamp = v29;
  retstr->locationInScreenCoordinates.x = v8;
  retstr->locationInScreenCoordinates.y = v10;
  result = (WKTouchEvent *)WTF::fastMalloc((WTF *)0x58);
  *(CGFloat *)&result->type = v8;
  result->timestamp = v10;
  result->locationInScreenCoordinates.x = v12;
  result->locationInScreenCoordinates.y = v14;
  LODWORD(result->locationInDocumentCoordinates.x) = 0;
  result->locationInDocumentCoordinates.y = v15;
  result->scale = v33;
  result->rotation = v18;
  *(void *)&result->inJavaScriptGesture = v32;
  result->touchPoints.m_buffer = v17;
  LOBYTE(result->touchPoints.m_capacity) = v25;
  retstr->touchPoints.m_buffer = (WKTouchPoint *)result;
  *(void *)&retstr->touchPoints.m_capacity = 0x100000001;
  return result;
}

- (void)_recordTouches:(id)a3 type:(unsigned __int8)a4 coalescedTouches:(id)a5 predictedTouches:(id)a6
{
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  p_lastTouchEvent = &self->_lastTouchEvent;
  unsigned int v139 = a4;
  self->_lastTouchEvent.type = a4;
  self->_lastTouchEvent.inJavaScriptGesture = 0;
  double v149 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v150 = *MEMORY[0x1E4F1DAD8];
  self->_dispatchingTouchEvents = 1;
  unint64_t v9 = [a3 count];
  unint64_t m_size = p_lastTouchEvent->touchPoints.m_size;
  unint64_t v136 = v9;
  if (v9 != m_size)
  {
    if (v9 > m_size)
    {
      unint64_t m_capacity = p_lastTouchEvent->touchPoints.m_capacity;
      if (v9 > m_capacity)
      {
        unint64_t v12 = m_capacity + (m_capacity >> 2);
        if (v12 >= 0x10) {
          unint64_t v13 = v12 + 1;
        }
        else {
          unint64_t v13 = 16;
        }
        if (v13 <= v9) {
          unint64_t v13 = v9;
        }
        if (v13 >= 0x2E8BA2F)
        {
          __break(0xC471u);
LABEL_110:
          JUMPOUT(0x198DAB028);
        }
        m_buffer = (WTF *)p_lastTouchEvent->touchPoints.m_buffer;
        int v15 = 88 * v13;
        uint64_t v16 = WTF::fastMalloc((WTF *)(88 * v13));
        p_lastTouchEvent->touchPoints.unint64_t m_capacity = (v15 & 0xFFFFFFF8) / 0x58;
        p_lastTouchEvent->touchPoints.m_buffer = (WKTouchPoint *)v16;
        if (m_size)
        {
          uint64_t v18 = 88 * m_size;
          double v19 = m_buffer;
          do
          {
            long long v20 = *((_OWORD *)v19 + 1);
            *(_OWORD *)uint64_t v16 = *(_OWORD *)v19;
            *(_OWORD *)(v16 + 16) = v20;
            long long v21 = *((_OWORD *)v19 + 2);
            long long v22 = *((_OWORD *)v19 + 3);
            long long v23 = *((_OWORD *)v19 + 4);
            *(void *)(v16 + 80) = *((void *)v19 + 10);
            *(_OWORD *)(v16 + 48) = v22;
            *(_OWORD *)(v16 + 64) = v23;
            *(_OWORD *)(v16 + 32) = v21;
            v16 += 88;
            double v19 = (WTF *)((char *)v19 + 88);
            v18 -= 88;
          }
          while (v18);
        }
        if (m_buffer)
        {
          if ((WTF *)p_lastTouchEvent->touchPoints.m_buffer == m_buffer)
          {
            p_lastTouchEvent->touchPoints.m_buffer = 0;
            p_lastTouchEvent->touchPoints.unint64_t m_capacity = 0;
          }
          WTF::fastFree(m_buffer, v17);
        }
      }
      v24 = p_lastTouchEvent->touchPoints.m_buffer;
      if (v24)
      {
        uint64_t v25 = p_lastTouchEvent->touchPoints.m_size;
        if (v136 != v25) {
          bzero((char *)v24 + 88 * v25, 88 * ((88 * v136 - 88 * v25 - 88) / 0x58) + 88);
        }
      }
    }
    p_lastTouchEvent->touchPoints.unint64_t m_size = v136;
  }
  objc_msgSend((id)objc_msgSend(a3, "anyObject"), "timestamp");
  CFTimeInterval v27 = CACurrentMediaTime() - v26;
  double v28 = *MEMORY[0x1E4F1CF78];
  p_lastTouchEvent->timestamp = v28 + CFAbsoluteTimeGetCurrent() - v27;
  long long v159 = 0uLL;
  p_coalescedEvents = (WTF **)&p_lastTouchEvent->coalescedEvents;
  uint64_t v31 = p_lastTouchEvent->coalescedEvents.m_size;
  if (v31) {
    WTF::VectorTypeOperations<WebKit::WKTouchEvent>::destruct(*p_coalescedEvents, (WTF *)((char *)*p_coalescedEvents + 128 * v31));
  }
  uint64_t v32 = *p_coalescedEvents;
  if (*p_coalescedEvents)
  {
    p_lastTouchEvent->coalescedEvents.m_buffer = 0;
    p_lastTouchEvent->coalescedEvents.unint64_t m_capacity = 0;
    WTF::fastFree(v32, v29);
    uint64_t v34 = *((void *)&v159 + 1);
    double v33 = (WKTouchEvent *)v159;
  }
  else
  {
    double v33 = 0;
    uint64_t v34 = 0;
  }
  long long v159 = 0uLL;
  p_lastTouchEvent->coalescedEvents.m_buffer = v33;
  *(void *)&p_lastTouchEvent->coalescedEvents.unint64_t m_capacity = v34;
  WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v159, v29);
  long long v159 = 0uLL;
  p_predictedEvents = (WTF **)&p_lastTouchEvent->predictedEvents;
  uint64_t v37 = p_lastTouchEvent->predictedEvents.m_size;
  if (v37) {
    WTF::VectorTypeOperations<WebKit::WKTouchEvent>::destruct(*p_predictedEvents, (WTF *)((char *)*p_predictedEvents + 128 * v37));
  }
  v38 = *p_predictedEvents;
  if (*p_predictedEvents)
  {
    p_lastTouchEvent->predictedEvents.m_buffer = 0;
    p_lastTouchEvent->predictedEvents.unint64_t m_capacity = 0;
    WTF::fastFree(v38, v35);
  }
  p_lastTouchEvent->predictedEvents.m_buffer = (WKTouchEvent *)v159;
  uint64_t v39 = *((void *)&v159 + 1);
  long long v159 = 0uLL;
  *(void *)&p_lastTouchEvent->predictedEvents.unint64_t m_capacity = v39;
  WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v159, v35);
  if (v139 == 1)
  {
    long long v176 = 0u;
    long long v177 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    uint64_t v40 = [a5 countByEnumeratingWithState:&v174 objects:v180 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v175;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v175 != v41) {
            objc_enumerationMutation(a5);
          }
          [(WKTouchEventsGestureRecognizer *)self _touchEventForTouch:*(void *)(*((void *)&v174 + 1) + 8 * i)];
          uint64_t v44 = p_lastTouchEvent->coalescedEvents.m_size;
          if (v44 == p_lastTouchEvent->coalescedEvents.m_capacity)
          {
            WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebKit::WKTouchEvent>((unsigned int *)&p_lastTouchEvent->coalescedEvents, (unint64_t)&v159);
          }
          else
          {
            v45 = &p_lastTouchEvent->coalescedEvents.m_buffer[v44];
            CGPoint v46 = v160;
            CGPoint v47 = v161;
            long long v48 = v162;
            v45->inJavaScriptGesture = v163;
            v45->locationInDocumentCoordinates = v47;
            *(_OWORD *)&v45->scale = v48;
            v45->locationInScreenCoordinates = v46;
            *(_OWORD *)&v45->type = v159;
            v45->touchPoints.m_buffer = 0;
            *(void *)&v45->touchPoints.unint64_t m_capacity = 0;
            v49 = v164;
            v164 = 0;
            v45->touchPoints.m_buffer = (WKTouchPoint *)v49;
            LODWORD(v49) = v165;
            int v165 = 0;
            v45->touchPoints.unint64_t m_capacity = v49;
            LODWORD(v49) = v166;
            int v166 = 0;
            v45->touchPoints.unint64_t m_size = v49;
            v45->coalescedEvents.m_buffer = 0;
            *(void *)&v45->coalescedEvents.unint64_t m_capacity = 0;
            v50 = v167;
            v167 = 0;
            v45->coalescedEvents.m_buffer = v50;
            LODWORD(v50) = v168;
            int v168 = 0;
            v45->coalescedEvents.unint64_t m_capacity = v50;
            LODWORD(v50) = v169;
            int v169 = 0;
            v45->coalescedEvents.unint64_t m_size = v50;
            v45->predictedEvents.m_buffer = 0;
            *(void *)&v45->predictedEvents.unint64_t m_capacity = 0;
            v51 = v170;
            v170 = 0;
            v45->predictedEvents.m_buffer = v51;
            LODWORD(v51) = v171;
            int v171 = 0;
            v45->predictedEvents.unint64_t m_capacity = v51;
            LODWORD(v51) = v172;
            int v172 = 0;
            v45->predictedEvents.unint64_t m_size = v51;
            v45->isPotentialTap = v173;
            ++p_lastTouchEvent->coalescedEvents.m_size;
          }
          WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v170, v43);
          WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v167, v52);
          v54 = v164;
          if (v164)
          {
            v164 = 0;
            int v165 = 0;
            WTF::fastFree(v54, v53);
          }
        }
        uint64_t v40 = [a5 countByEnumeratingWithState:&v174 objects:v180 count:16];
      }
      while (v40);
    }
    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    uint64_t v55 = [a6 countByEnumeratingWithState:&v155 objects:v179 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v156;
      do
      {
        for (uint64_t j = 0; j != v55; ++j)
        {
          if (*(void *)v156 != v56) {
            objc_enumerationMutation(a6);
          }
          [(WKTouchEventsGestureRecognizer *)self _touchEventForTouch:*(void *)(*((void *)&v155 + 1) + 8 * j)];
          uint64_t v59 = p_lastTouchEvent->predictedEvents.m_size;
          if (v59 == p_lastTouchEvent->predictedEvents.m_capacity)
          {
            WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebKit::WKTouchEvent>((unsigned int *)&p_lastTouchEvent->predictedEvents, (unint64_t)&v159);
          }
          else
          {
            v60 = &p_lastTouchEvent->predictedEvents.m_buffer[v59];
            CGPoint v61 = v160;
            CGPoint v62 = v161;
            long long v63 = v162;
            v60->inJavaScriptGesture = v163;
            v60->locationInDocumentCoordinates = v62;
            *(_OWORD *)&v60->scale = v63;
            v60->locationInScreenCoordinates = v61;
            *(_OWORD *)&v60->type = v159;
            v60->touchPoints.m_buffer = 0;
            *(void *)&v60->touchPoints.unint64_t m_capacity = 0;
            v64 = v164;
            v164 = 0;
            v60->touchPoints.m_buffer = (WKTouchPoint *)v64;
            LODWORD(v64) = v165;
            int v165 = 0;
            v60->touchPoints.unint64_t m_capacity = v64;
            LODWORD(v64) = v166;
            int v166 = 0;
            v60->touchPoints.unint64_t m_size = v64;
            v60->coalescedEvents.m_buffer = 0;
            *(void *)&v60->coalescedEvents.unint64_t m_capacity = 0;
            v65 = v167;
            v167 = 0;
            v60->coalescedEvents.m_buffer = v65;
            LODWORD(v65) = v168;
            int v168 = 0;
            v60->coalescedEvents.unint64_t m_capacity = v65;
            LODWORD(v65) = v169;
            int v169 = 0;
            v60->coalescedEvents.unint64_t m_size = v65;
            v60->predictedEvents.m_buffer = 0;
            *(void *)&v60->predictedEvents.unint64_t m_capacity = 0;
            v66 = v170;
            v170 = 0;
            v60->predictedEvents.m_buffer = v66;
            LODWORD(v66) = v171;
            int v171 = 0;
            v60->predictedEvents.unint64_t m_capacity = v66;
            LODWORD(v66) = v172;
            int v172 = 0;
            v60->predictedEvents.unint64_t m_size = v66;
            v60->isPotentialTap = v173;
            ++p_lastTouchEvent->predictedEvents.m_size;
          }
          WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v170, v58);
          WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v167, v67);
          v69 = v164;
          if (v164)
          {
            v164 = 0;
            int v165 = 0;
            WTF::fastFree(v69, v68);
          }
        }
        uint64_t v55 = [a6 countByEnumeratingWithState:&v155 objects:v179 count:16];
      }
      while (v55);
    }
  }
  [self->_activeTouchesByIdentifier.m_ptr removeAllObjects];
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  uint64_t v140 = [a3 countByEnumeratingWithState:&v151 objects:v178 count:16];
  if (!v140)
  {
    double v129 = v149;
    double v128 = v150;
    double v126 = v149;
    double v122 = v150;
    double v125 = v149;
    double v127 = v150;
    double v130 = v149;
    double v131 = v150;
    goto LABEL_104;
  }
  uint64_t v70 = 0;
  unsigned int v71 = 0;
  uint64_t v138 = *(void *)v152;
  double v141 = v150;
  double v142 = v149;
  double v143 = v150;
  double v144 = v150;
  double v72 = v149;
  double v73 = v150;
  double v74 = v149;
  double v145 = v150;
  double v146 = v149;
  double obja = v149;
  do
  {
    uint64_t v75 = 0;
    uint64_t v76 = 88 * v70;
    do
    {
      if (*(void *)v152 != v138) {
        objc_enumerationMutation(a3);
      }
      v77 = *(void **)(*((void *)&v151 + 1) + 8 * v75);
      id AssociatedObject = objc_getAssociatedObject(v77, &associatedTouchIdentifierKey);
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      if (((v139 == 0) & [v77 _isPointerTouch]) != 0
        || ((isKindOfClass ^ 1) & 1) != 0
        || !AssociatedObject)
      {
        if (incrementingTouchIdentifier == -2) {
          int v80 = 1;
        }
        else {
          int v80 = incrementingTouchIdentifier + 1;
        }
        incrementingTouchIdentifier = v80;
        id AssociatedObject = (id)objc_msgSend(NSNumber, "numberWithUnsignedInt:");
        objc_setAssociatedObject(v77, &associatedTouchIdentifierKey, AssociatedObject, (void *)1);
      }
      [self->_activeTouchesByIdentifier.m_ptr setObject:v77 forKey:AssociatedObject];
      if (v70 + v75 >= (unint64_t)p_lastTouchEvent->touchPoints.m_size)
      {
        __break(0xC471u);
        goto LABEL_110;
      }
      v81 = p_lastTouchEvent->touchPoints.m_buffer;
      [v77 locationInView:0];
      double v83 = v82;
      double v85 = v84;
      v86 = (double *)((char *)v81 + v76);
      double *v86 = v82;
      v86[1] = v84;
      objc_msgSend((id)-[WKTouchEventsGestureRecognizer view](self, "view"), "convertPoint:fromView:", 0, v82, v84);
      double v88 = v87;
      double v90 = v89;
      v91 = (double *)((char *)v81 + v76);
      v91[2] = v87;
      v91[3] = v89;
      *((_DWORD *)v91 + 8) = [AssociatedObject unsignedIntValue];
      *((void *)v91 + 5) = [v77 phase];
      [v77 majorRadius];
      *(void *)((char *)v81 + v76 + 48) = v92;
      [v77 maximumPossibleForce];
      double v93 = 0.0;
      if (v94 > 0.0)
      {
        [v77 force];
        double v96 = v95;
        [v77 maximumPossibleForce];
        double v93 = v96 / v97;
      }
      v98 = (char *)v81 + v76;
      *(double *)((char *)v81 + v76 + 56) = v93;
      if ([v77 type] == 2)
      {
        v98[80] = 1;
        [v77 altitudeAngle];
        *(void *)((char *)v81 + v76 + 64) = v99;
        objc_msgSend(v77, "azimuthAngleInView:", objc_msgSend((id)-[WKTouchEventsGestureRecognizer view](self, "view"), "window"));
      }
      else
      {
        v98[80] = 0;
        *(void *)((char *)v81 + v76 + 64) = 0;
        uint64_t v100 = 0;
      }
      double v101 = v73 + v83;
      double v102 = v74 + v85;
      *(void *)((char *)v81 + v76 + 72) = v100;
      double v104 = v143;
      double v103 = v144;
      double v105 = v143 + v88;
      double v106 = v72 + v90;
      double v108 = v145;
      double v107 = v146;
      if (v71 == 1) {
        double v109 = v88;
      }
      else {
        double v109 = v145;
      }
      unint64_t v110 = *((void *)v91 + 5) - 3;
      double v112 = obja;
      double v111 = v149;
      if (v71 == 1) {
        double v113 = v90;
      }
      else {
        double v113 = obja;
      }
      if (v71) {
        int v114 = v71 + 1;
      }
      else {
        int v114 = 1;
      }
      if (v71)
      {
        double v115 = v144;
      }
      else
      {
        double v109 = v145;
        double v113 = obja;
        double v115 = v88;
      }
      if (v71) {
        double v116 = v146;
      }
      else {
        double v116 = v90;
      }
      double v118 = v141;
      double v117 = v142;
      double v119 = v150;
      if (v110 <= 1)
      {
        double v119 = v150 + v88;
        double v111 = v149 + v90;
      }
      double v149 = v111;
      double v150 = v119;
      if (v110 <= 1)
      {
        double v118 = v141 + v83;
        double v117 = v142 + v85;
      }
      double v141 = v118;
      double v142 = v117;
      if (v110 > 1)
      {
        double v104 = v143 + v88;
        double v72 = v72 + v90;
        double v73 = v73 + v83;
        double v74 = v74 + v85;
        unsigned int v71 = v114;
        double v108 = v109;
        double v112 = v113;
      }
      double obja = v112;
      ++v75;
      if (v110 > 1) {
        double v103 = v115;
      }
      double v143 = v104;
      double v144 = v103;
      v76 += 88;
      if (v110 > 1) {
        double v107 = v116;
      }
      double v145 = v108;
      double v146 = v107;
    }
    while (v140 != v75);
    uint64_t v140 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v151, v178, 16, v105, v101, v102, v106);
    v70 += v75;
  }
  while (v140);
  if (v71)
  {
    double v120 = v73 / (double)v71;
    double v121 = v74 / (double)v71;
    double v122 = v144;
    double v123 = v143 / (double)v71;
    double v124 = v72 / (double)v71;
    double v126 = v146;
    double v125 = obja;
    double v127 = v145;
    goto LABEL_105;
  }
  double v129 = v149;
  double v128 = v150;
  double v126 = v146;
  double v125 = obja;
  double v122 = v144;
  double v127 = v145;
  double v131 = v141;
  double v130 = v142;
LABEL_104:
  unsigned int v71 = 0;
  double v120 = v131 / (double)v136;
  double v121 = v130 / (double)v136;
  double v123 = v128 / (double)v136;
  double v124 = v129 / (double)v136;
LABEL_105:
  p_lastTouchEvent->scale = 0.0;
  p_lastTouchEvent->locationInScreenCoordinates.x = v120;
  p_lastTouchEvent->locationInScreenCoordinates.y = v121;
  p_lastTouchEvent->locationInDocumentCoordinates.x = v123;
  p_lastTouchEvent->locationInDocumentCoordinates.y = v124;
  p_lastTouchEvent->rotation = 0.0;
  if (v71 >= 2)
  {
    float v132 = (v125 - v126) * (v125 - v126) + (v127 - v122) * (v127 - v122);
    p_lastTouchEvent->scale = sqrtf(v132) / self->_originalGestureDistance;
    float v133 = v127 - v122;
    float v134 = v125 - v126;
    float v135 = atan2f(v133, v134) * 180.0 * 0.318309886;
    p_lastTouchEvent->rotation = self->_originalGestureAngle - v135;
    p_lastTouchEvent->inJavaScriptGesture = 1;
  }
  [(WKTouchEventsGestureRecognizer *)self _updateTapStateWithTouches:a3 type:v139];
}

- (void)performAction
{
  id Weak = objc_loadWeak(&self->_touchTarget);
  if (self->_touchAction) {
    touchAction = self->_touchAction;
  }
  else {
    touchAction = 0;
  }

  objc_msgSend(Weak, touchAction, self);
}

- (BOOL)_hasActiveTouchesForEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v3 = objc_msgSend(a3, "touchesForGestureRecognizer:", self, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) phase] < 3)
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (void)_processTouches:(id)a3 withEvent:(id)a4 type:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(a3);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v14 phase] != 2)
        {
          uint64_t v15 = [v14 phase];
          if ((uint64_t)v11 <= v15) {
            unint64_t v11 = v15;
          }
        }
      }
      uint64_t v10 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
    if (v11 <= 7) {
      unsigned __int8 v16 = 0x201000302010100uLL >> (8 * v11);
    }
    else {
      unsigned __int8 v16 = 1;
    }
  }
  else
  {
    unsigned __int8 v16 = 0;
  }
  if (v5 == v16)
  {
    -[WKTouchEventsGestureRecognizer _recordTouches:type:coalescedTouches:predictedTouches:](self, "_recordTouches:type:coalescedTouches:predictedTouches:", a3, v5, objc_msgSend(a4, "coalescedTouchesForTouch:", objc_msgSend(a3, "anyObject")), objc_msgSend(a4, "predictedTouchesForTouch:", objc_msgSend(a3, "anyObject")));
    [(WKTouchEventsGestureRecognizer *)self performAction];
    if (self->_defaultPrevented)
    {
      if ([(WKTouchEventsGestureRecognizer *)self state]) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = 1;
      }
      [(WKTouchEventsGestureRecognizer *)self setState:v17];
    }
    if (v5 >= 2
      && ![(WKTouchEventsGestureRecognizer *)self _hasActiveTouchesForEvent:a4])
    {
      if ([(WKTouchEventsGestureRecognizer *)self state])
      {
        if (v5 == 2)
        {
          uint64_t v18 = 3;
        }
        else
        {
          if (v5 != 3) {
            return;
          }
          uint64_t v18 = 4;
        }
      }
      else
      {
        uint64_t v18 = 5;
      }
      [(WKTouchEventsGestureRecognizer *)self setState:v18];
    }
  }
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6 = [a4 touchesForGestureRecognizer:self];
  id Weak = objc_loadWeak((id *)&self->_touchEventDelegate);
  if ((objc_opt_respondsToSelector() & 1) == 0 || ![Weak shouldIgnoreTouchEvent])
  {
    if (self->_passedHitTest)
    {
LABEL_4:
      [(WKTouchEventsGestureRecognizer *)self _processTouches:v6 withEvent:a4 type:0];
      return;
    }
    if (((objc_opt_respondsToSelector() & 1) == 0
       || ([Weak gestureRecognizer:self shouldIgnoreTouchEvent:a4] & 1) == 0)
      && ([Weak isAnyTouchOverActiveArea:v6] & 1) != 0)
    {
      self->_passedHitTest = 1;
      goto LABEL_4;
    }
  }

  [(WKTouchEventsGestureRecognizer *)self setState:5];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v6 = [a4 touchesForGestureRecognizer:self];

  [(WKTouchEventsGestureRecognizer *)self _processTouches:v6 withEvent:a4 type:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v6 = [a4 touchesForGestureRecognizer:self];

  [(WKTouchEventsGestureRecognizer *)self _processTouches:v6 withEvent:a4 type:2];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v6 = [a4 touchesForGestureRecognizer:self];

  [(WKTouchEventsGestureRecognizer *)self _processTouches:v6 withEvent:a4 type:3];
}

- (const)lastTouchEvent
{
  return &self->_lastTouchEvent;
}

- (BOOL)isDefaultPrevented
{
  return self->_defaultPrevented;
}

- (void)setDefaultPrevented:(BOOL)a3
{
  self->_defaultPrevented = a3;
}

- (BOOL)isDispatchingTouchEvents
{
  return self->_dispatchingTouchEvents;
}

- (void).cxx_destruct
{
  m_ptr = self->_activeTouchesByIdentifier.m_ptr;
  self->_activeTouchesByIdentifier.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_lastTouchEvent.predictedEvents, (void *)a2);
  WTF::Vector<WebKit::WKTouchEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_lastTouchEvent.coalescedEvents, v4);
  m_buffer = self->_lastTouchEvent.touchPoints.m_buffer;
  if (m_buffer)
  {
    self->_lastTouchEvent.touchPoints.m_buffer = 0;
    self->_lastTouchEvent.touchPoints.unint64_t m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, v5);
  }
  objc_destroyWeak((id *)&self->_touchEventDelegate);

  objc_destroyWeak(&self->_touchTarget);
}

@end