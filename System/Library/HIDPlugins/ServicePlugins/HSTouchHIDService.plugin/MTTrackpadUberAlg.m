@interface MTTrackpadUberAlg
+ (MTForceBehavior_)forceBehaviorFromForceConfig:(SEL)a3 mask:(__MTForceConfig *)a4;
+ (int)getForceSourceForBehavior:(int)a3 secondaryClickEnabled:(BOOL)a4;
- (BOOL)divingButtonState;
- (BOOL)handleProperty:(id)a3 value:(id)a4;
- (BOOL)hostClickEnabled;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (BOOL)shouldHandleTPSettings;
- (BOOL)supportsDeepPress;
- (BOOL)updateGestureConfiguration:(id)a3 value:(id)a4;
- (MTTrackpadUberAlg)initWithConfig:(Config *)a3 actuationHandler:(id)a4 builtIn:(BOOL)a5 supportsDeepPress:(BOOL)a6;
- (__IOHIDEvent)createHIDCollectionEvents:(unsigned int)a3 timestamp:(double)a4;
- (double)autoReleaseTapAndAHalfDrag:(double)a3 eventRef:(__IOHIDEvent *)a4;
- (double)lastFrameInterval;
- (id).cxx_construct;
- (void)cancelCurrentTapAndAHalfDrag;
- (void)clearState;
- (void)createDigitizerChildEventForPath:(__IOHIDEvent *)a3 parserPath:(const MTParserPath_ *)a4 pathEventMask:(id *)a5 hostTimestamp:(float)a6 cancellingCollection:(float)a7;
- (void)createDigitizerPathChildEvents:(__IOHIDEvent *)a3 collectionEventMask:(unsigned int)a4 hostTimestamp:(unint64_t)a5 additionalEventMask:(unsigned int *)a6;
- (void)dealloc;
- (void)handleMomentumState:(int)a3 active:(BOOL)a4;
- (void)handleMouseSettings:(const mt_StandardMouseSettings *)a3;
- (void)handleTPSettings:(const mt_StandardTrackpadSettings *)a3;
- (void)processContact:(id *)a3 activePathCount:(float)a4 timestamp:(float)a5 baseEvent:callbackInterval:isFlush:;
- (void)setDivingButtonState:(BOOL)a3;
- (void)setHostClickEnabled:(BOOL)a3;
- (void)setMouseButtonFilterData:(float)a3;
- (void)setMouseMotionFilterData:(const MTPoint *)a3;
- (void)setSupportsDeepPress:(BOOL)a3;
- (void)updateFingerStats:(id)a3;
@end

@implementation MTTrackpadUberAlg

- (MTTrackpadUberAlg)initWithConfig:(Config *)a3 actuationHandler:(id)a4 builtIn:(BOOL)a5 supportsDeepPress:(BOOL)a6
{
  id v9 = a4;
  id v28 = v9;
  BOOL v27 = a5;
  v26.receiver = self;
  v26.super_class = (Class)MTTrackpadUberAlg;
  id v10 = [(MTTrackpadUberAlg *)&v26 init];
  id v11 = v10;
  if (v10)
  {
    *((void *)v10 + 1) = *(void *)&a3->type;
    ptr = a3->dimensions.__ptr_;
    cntrl = a3->dimensions.__cntrl_;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    v14 = (std::__shared_weak_count *)*((void *)v10 + 3);
    *((void *)v11 + 2) = ptr;
    *((void *)v11 + 3) = cntrl;
    if (v14)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      ptr = (MTSurfaceDimensions_ *)*((void *)v11 + 2);
    }
    LODWORD(v23) = 0;
    std::allocate_shared[abi:ne180100]<MTPathStates_,std::allocator<MTPathStates_>,MTSurfaceDimensions_ &,MTParserType &,MTParserOptions &,BOOL &,int,void>((uint64_t)ptr, (unsigned int *)v11 + 2, (unsigned int *)v11 + 3, (unsigned __int8 *)&v27, (unsigned int *)&v23, &v25);
    long long v15 = v25;
    long long v25 = 0uLL;
    v16 = (std::__shared_weak_count *)*((void *)v11 + 5);
    *((_OWORD *)v11 + 2) = v15;
    if (v16)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
      if (*((void *)&v25 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v25 + 1));
      }
    }
    int v24 = 1;
    v23 = "Right";
    std::allocate_shared[abi:ne180100]<MTHandStatistics_,std::allocator<MTHandStatistics_>,MTHandIdentity,char *,MTParserType &,MTParserOptions &,void>(&v24, (uint64_t *)&v23, (int *)v11 + 2, (int *)v11 + 3, &v25);
    long long v17 = v25;
    long long v25 = 0uLL;
    v18 = (std::__shared_weak_count *)*((void *)v11 + 7);
    *((_OWORD *)v11 + 3) = v17;
    if (v18)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      if (*((void *)&v25 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v25 + 1));
      }
    }
    uint64_t v19 = *((void *)v11 + 2);
    LODWORD(v23) = 1;
    std::allocate_shared[abi:ne180100]<MTHandMotion_,std::allocator<MTHandMotion_>,MTSurfaceDimensions_ &,MTParserType &,MTParserOptions &,MTHandIdentity,char const(&)[6],void>(v19, (unsigned int *)v11 + 2, (unsigned int *)v11 + 3, (unsigned int *)&v23, &v25);
    long long v20 = v25;
    long long v25 = 0uLL;
    v21 = (std::__shared_weak_count *)*((void *)v11 + 9);
    *((_OWORD *)v11 + 4) = v20;
    if (v21)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
      if (*((void *)&v25 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v25 + 1));
      }
    }
    std::allocate_shared[abi:ne180100]<MTPListGestureConfig_,std::allocator<MTPListGestureConfig_>,MTParserType &,MTParserOptions &,BOOL &,MTDragManagerEventQueue_ &,void>((uint64_t)&v23, (int *)v11 + 2, (unsigned int *)v11 + 3, (unsigned __int8 *)&v27, (uint64_t)v11 + 96);
  }

  return 0;
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
  v5.super_class = (Class)MTTrackpadUberAlg;
  [(MTTrackpadUberAlg *)&v5 dealloc];
}

- (void)setDivingButtonState:(BOOL)a3
{
  int v3 = a3;
  MTPathStates_::setDivingButtonState(self->_pathStates.__ptr_, a3);
  ptr = self->_mtHandStats.__ptr_;
  if (*((unsigned __int8 *)ptr + 305) != v3) {
    *((void *)ptr + 36) = *((void *)ptr + 1);
  }
  *((unsigned char *)ptr + 305) = v3;
  self->_divingButtonState = v3;
}

- (void)processContact:(id *)a3 activePathCount:(float)a4 timestamp:(float)a5 baseEvent:callbackInterval:isFlush:
{
  unsigned int v9 = v8;
  v48 = v7;
  id v10 = v6;
  double v11 = *(double *)&a4;
  int v49 = v5;
  ChordTableForHand = (MTChordCycling_ *)MTGestureConfig_::getChordTableForHand((uint64_t)self->_gestureConfig.__ptr_, 1);
  long long v15 = ChordTableForHand;
  int cycle_state = self->_dragManagerEventQueue._cycle_state;
  char hasTriggeredFluidDock = cycle_state > 2;
  if (cycle_state <= 2)
  {
    if (ChordTableForHand)
    {
      char hasTriggeredFluidDock = MTChordCycling_::hasTriggeredFluidDock(ChordTableForHand);
      p_pathStates = &self->_pathStates;
      ptr = self->_pathStates.__ptr_;
      goto LABEL_6;
    }
    p_pathStates = &self->_pathStates;
    ptr = self->_pathStates.__ptr_;
  }
  else
  {
    p_pathStates = &self->_pathStates;
    ptr = self->_pathStates.__ptr_;
    if (ChordTableForHand)
    {
      char hasTriggeredFluidDock = 1;
LABEL_6:
      *((_DWORD *)ptr + 102) = MTChordTable_::getMinThumbSpecificFingerCount(v15);
      long long v20 = p_pathStates->__ptr_;
      *((unsigned char *)v20 + 404) = MTChordTable_::hasTwoFingerOrientationEvents(v15);
      v21 = p_pathStates->__ptr_;
      int CommittedFingerCount = MTChordCycling_::getCommittedFingerCount(v15);
      char v23 = 0;
      ptr = p_pathStates->__ptr_;
      goto LABEL_9;
    }
  }
  int CommittedFingerCount = 0;
  *((_DWORD *)ptr + 102) = 0;
  char v23 = 1;
  *((unsigned char *)ptr + 404) = 1;
  v21 = ptr;
LABEL_9:
  *((_DWORD *)v21 + 103) = CommittedFingerCount;
  int v24 = self->_forceManagement.__ptr_;
  *((_DWORD *)v24 + 144) = (__PAIR64__(*((unsigned __int8 *)self->_mtHandStats.__ptr_ + 186), *((unsigned __int8 *)self->_mtHandStats.__ptr_ + 195))- *((unsigned __int8 *)self->_mtHandStats.__ptr_ + 186)) >> 32;
  BOOL isForceButtonActivated = MTForceManagement_::isForceButtonActivated(v24);
  MTPathStates_::updateDragDisplacements_mm(ptr, isForceButtonActivated);
  objc_super v26 = self->_forceManagement.__ptr_;
  if (v23) {
    char v27 = 1;
  }
  else {
    char v27 = MTChordCycling_::shouldBlockClicks(v15, self->_mtHandStats.__ptr_, self->_mtHandMotion.__ptr_) ^ 1;
  }
  *((unsigned char *)v26 + 604) = v27;
  uint64_t v28 = mach_continuous_time();
  int v29 = MTPathStates_::unpackContactFrame((uint64_t)self->_pathStates.__ptr_, (uint64_t)a3, v49, v11);
  v30 = self->_forceManagement.__ptr_;
  if (*((unsigned char *)v30 + 606)) {
    MTForceManagement_::analyzeAndManageStrongestForces(v30, p_pathStates->__ptr_);
  }
  v31 = MTLoggingPlugin();
  if (os_signpost_enabled(v31))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v51 = v28;
    _os_signpost_emit_with_name_impl(&def_411C8, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MTTrackpadAlg-Path+Force", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
  }

  uint64_t v32 = mach_continuous_time();
  if (MTHandStatistics_::processHandState(self->_mtHandStats.__ptr_, self->_pathStates.__ptr_, v29 & v9, hasTriggeredFluidDock))
  {
    if (v23) {
      int ActiveDegreesOfFreedomMask = 0;
    }
    else {
      int ActiveDegreesOfFreedomMask = MTChordIntegrating_::getActiveDegreesOfFreedomMask((MTChordCycling_ *)((char *)v15 + 408), self->_mtHandStats.__ptr_, v15);
    }
    v34 = self->_mtHandStats.__ptr_;
    int v35 = *((unsigned __int8 *)v34 + 191);
    if ((*((unsigned char *)v34 + 168) & 0x20) != 0)
    {
      v35 += *((unsigned __int8 *)v34 + 193);
      int v36 = *((unsigned __int8 *)v34 + 188) + *((unsigned __int8 *)v34 + 186);
      int v37 = *((unsigned __int8 *)v34 + 189) + *((unsigned __int8 *)v34 + 187);
    }
    else
    {
      int v36 = *((unsigned __int8 *)v34 + 186);
      int v37 = *((unsigned __int8 *)v34 + 187);
    }
    float v38 = v11 - *((double *)v34 + 7);
    MTHandMotion_::processHandMotion(self->_mtHandMotion.__ptr_, self->_pathStates.__ptr_, v35, v36, v37, v38, ActiveDegreesOfFreedomMask, *((unsigned __int16 *)v34 + 148));
    *id v10 = [(MTTrackpadUberAlg *)self createHIDCollectionEvents:(*((_DWORD *)self->_mtHandMotion.__ptr_ + 35) | *((_DWORD *)self->_mtHandStats.__ptr_ + 43)) timestamp:v11];
    v39 = MTLoggingPlugin();
    if (os_signpost_enabled(v39))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v51 = v32;
      _os_signpost_emit_with_name_impl(&def_411C8, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MTTrackpadAlg-HSHMHID", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
    }

    if (!*v10) {
      goto LABEL_36;
    }
    if (v49 < 1) {
      char v40 = v9;
    }
    else {
      char v40 = 0;
    }
    if (MTForceManagement_::actuateForceAndHIDEvents(self->_forceManagement.__ptr_, self->_pathStates.__ptr_, *v10, v40))
    {
      v41 = self->_mtHandStats.__ptr_;
      MTAbsoluteTimeGetCurrent();
      *((void *)v41 + 6) = v42;
      [(MTTrackpadUberAlg *)self setDivingButtonState:MTForceManagement_::isForceButtonActivated(self->_forceManagement.__ptr_)];
      MTDragManagerEventQueue_::forceButtonChange(&self->_dragManagerEventQueue, *v10);
    }
    uint64_t v43 = mach_continuous_time();
    (*(void (**)(MTChordCycling_ *, MTHandStatistics_ *, MTHandMotion_ *, __IOHIDEvent *))(*(void *)v15 + 32))(v15, self->_mtHandStats.__ptr_, self->_mtHandMotion.__ptr_, *v10);
    v44 = MTLoggingPlugin();
    if (os_signpost_enabled(v44))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v51 = v43;
      _os_signpost_emit_with_name_impl(&def_411C8, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MTTrackpadAlg-Gesture", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
    }

    [(MTTrackpadUberAlg *)self updateFingerStats:*v10];
    if (self->_dragManagerEventQueue._cycle_state >= 1
      && *((unsigned __int8 *)self->_mtHandStats.__ptr_ + 211)
       + *((unsigned __int8 *)self->_mtHandStats.__ptr_ + 186) <= self->_dragManagerEventQueue._resting_finger_count)
    {
      goto LABEL_40;
    }
  }
  if (*v10) {
    goto LABEL_38;
  }
LABEL_36:
  v45 = self->_mtHandStats.__ptr_;
  if (!*((unsigned char *)v45 + 186)
    || *((unsigned __int8 *)v45 + 211) + *((unsigned __int8 *)v45 + 186) <= self->_dragManagerEventQueue._resting_finger_count)
  {
LABEL_40:
    v47 = v48;
    if (!v48) {
      return;
    }
    [(MTTrackpadUberAlg *)self autoReleaseTapAndAHalfDrag:v10 eventRef:v11];
    goto LABEL_42;
  }
LABEL_38:
  uint64_t v46 = 0;
  v47 = v48;
  if (v48) {
LABEL_42:
  }
    void *v47 = v46;
}

- (__IOHIDEvent)createHIDCollectionEvents:(unsigned int)a3 timestamp:(double)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = mach_absolute_time();
  ptr = self->_mtHandStats.__ptr_;
  if ((*((unsigned char *)ptr + 168) & 0x20) != 0)
  {
    if (*((unsigned __int16 *)ptr + 78) | *((unsigned __int16 *)ptr + 76)
      || *((unsigned __int16 *)ptr + 79) | *((unsigned __int16 *)ptr + 77))
    {
      goto LABEL_8;
    }
  }
  else if (*((_WORD *)ptr + 76) || *((_WORD *)ptr + 77))
  {
    goto LABEL_8;
  }
  if (!*((unsigned char *)ptr + 202)) {
    return 0;
  }
LABEL_8:
  MTSurfaceDimensions_::convertPixelsToSurfaceFraction(self->_surfaceDimensions.__ptr_, *(MTPoint *)((char *)self->_mtHandMotion.__ptr_ + 184));
  unsigned int v8 = self->_mtHandStats.__ptr_;
  if ((*((unsigned char *)v8 + 168) & 0x20) != 0) {
    int v9 = *((unsigned __int8 *)v8 + 188) + *((unsigned __int8 *)v8 + 186);
  }
  else {
    int v9 = *((unsigned __int8 *)v8 + 186);
  }
  LODWORD(v15) = v9 != 0;
  HIDWORD(v15) = 3;
  DigitizerEvent = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent();
  if (DigitizerEvent)
  {
    int v16 = 0;
    -[MTTrackpadUberAlg createDigitizerPathChildEvents:collectionEventMask:hostTimestamp:additionalEventMask:](self, "createDigitizerPathChildEvents:collectionEventMask:hostTimestamp:additionalEventMask:", DigitizerEvent, v4, v6, &v16, v15);
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      CFArrayRef v12 = Children;
      if (CFArrayGetCount(Children) >= 1)
      {
        uint64_t v13 = 0;
        while (!CFArrayGetValueAtIndex(v12, 0) || IOHIDEventGetType() != 11)
        {
          if (++v13 >= CFArrayGetCount(v12)) {
            goto LABEL_20;
          }
        }
        IOHIDEventGetIntegerValue();
        IOHIDEventSetIntegerValue();
      }
    }
LABEL_20:
    if (v16) {
      IOHIDEventSetIntegerValue();
    }
  }
  return DigitizerEvent;
}

- (void)createDigitizerPathChildEvents:(__IOHIDEvent *)a3 collectionEventMask:(unsigned int)a4 hostTimestamp:(unint64_t)a5 additionalEventMask:(unsigned int *)a6
{
  int v35 = a3;
  unint64_t v36 = a5;
  uint64_t v7 = 916;
  uint64_t v8 = 31;
  unsigned int parserOptions = self->_parserOptions;
  do
  {
    int v9 = (unsigned int *)(*((void *)self->_pathStates.__ptr_ + 35) + v7);
    int v10 = *(v9 - 77);
    if (*(v9 - 79) - 32 >= 0xFFFFFFE1 && v10 != 15)
    {
      CFArrayRef v12 = (MTParserPath_ *)(v9 - 87);
      unsigned int v13 = *v9;
      unsigned int v14 = v10 - 1;
      BOOL v15 = v10 != 0;
      unsigned int v16 = *(v9 - 53) - 1;
      unsigned int v17 = *(v9 - 78) - 5;
      int v18 = *(v9 - 54) - 5;
      int v20 = (parserOptions >> 5) & 1;
      if (v14 > 4) {
        int v20 = 1;
      }
      BOOL v29 = __CFADD__(v18, 2);
      BOOL v19 = v14 > 4;
      unsigned int v21 = v19 & (a4 >> 7);
      if (v29) {
        unsigned int v22 = v19 & (a4 >> 7);
      }
      else {
        unsigned int v22 = 1;
      }
      if (v16 > 4) {
        unsigned int v22 = 1;
      }
      if (v14 < 5) {
        unsigned int v22 = 1;
      }
      if (v22) {
        uint64_t v23 = v21;
      }
      else {
        uint64_t v23 = v15;
      }
      if (v23) {
        unsigned int v24 = v13 | 0x83;
      }
      else {
        unsigned int v24 = v13;
      }
      if (v16 < 5) {
        int v25 = 1;
      }
      else {
        int v25 = v20;
      }
      if (v17 < 0xFFFFFFFE) {
        int v25 = 1;
      }
      if (v25) {
        uint64_t v26 = v24;
      }
      else {
        uint64_t v26 = v24 | 2;
      }
      int isStylusContact = MTParserPath_::isStylusContact(v12);
      int v28 = MTParserPath_::wasStylusContact(v12);
      if (v17 >= 0xFFFFFFFE)
      {
        if (v14 < 5) {
          char v31 = 1;
        }
        else {
          char v31 = isStylusContact;
        }
        if (v31)
        {
LABEL_53:
          -[MTTrackpadUberAlg createDigitizerChildEventForPath:parserPath:pathEventMask:hostTimestamp:cancellingCollection:](self, "createDigitizerChildEventForPath:parserPath:pathEventMask:hostTimestamp:cancellingCollection:", v35, v12, v26, v36, v23, v35, v36);
          goto LABEL_54;
        }
      }
      else
      {
        BOOL v29 = v14 >= 5 && v16 >= 5;
        if (v29) {
          int v30 = isStylusContact;
        }
        else {
          int v30 = 1;
        }
        if ((v30 | v28)) {
          goto LABEL_53;
        }
      }
      if ((parserOptions & 0x20) != 0) {
        goto LABEL_53;
      }
      BOOL v32 = (a4 & 0x80) != 0 && v17 >= 0xFFFFFFFE;
      BOOL v33 = v32 && v14 >= 5;
      char v34 = v33 ? isStylusContact : 1;
      if ((((v34 & 1) == 0) | v23) == 1) {
        goto LABEL_53;
      }
    }
LABEL_54:
    v7 += 568;
    --v8;
  }
  while (v8);
}

- (void)createDigitizerChildEventForPath:(__IOHIDEvent *)a3 parserPath:(const MTParserPath_ *)a4 pathEventMask:(id *)a5 hostTimestamp:(float)a6 cancellingCollection:(float)a7
{
  ptr = self->_pathStates.__ptr_;
  if (ptr && *((unsigned char *)ptr + 144))
  {
    float x = a4[3].var3.var13.x;
    float var12 = a4[3].var3.var12;
  }
  else
  {
    float var12 = 0.0;
    float x = 0.0;
  }
  if ((a4->var3.var3 - 3) < 2) {
    int v13 = v7 ^ 1;
  }
  else {
    int v13 = 0;
  }
  unsigned int v14 = self->_surfaceDimensions.__ptr_;
  v21.y = MTParserPath_::getQuantizedMinorRadius_mm((MTParserPath_ *)a4);
  v21.float x = 0.0;
  MTSurfaceDimensions_::convertMillimetersToSurfaceFraction(v14, v21);
  BOOL v15 = self->_surfaceDimensions.__ptr_;
  v22.y = MTParserPath_::getQuantizedMajorRadius_mm((MTParserPath_ *)a4);
  v22.float x = 0.0;
  MTSurfaceDimensions_::convertMillimetersToSurfaceFraction(v15, v22);
  v23.float x = var12 + a4[3].var3.var6.x;
  v23.y = x + a4[3].var3.var6.y;
  MTSurfaceDimensions_::convertPixelsToSurfaceFraction(self->_surfaceDimensions.__ptr_, v23);
  MTContact_getEllipseOrientationDegrees();
  DigitizerFingerEventWithQuality = (const void *)IOHIDEventCreateDigitizerFingerEventWithQuality();
  IOHIDEventSetIntegerValue();
  if (DigitizerFingerEventWithQuality)
  {
    unsigned int v17 = self->_surfaceDimensions.__ptr_;
    v24.y = MTParserPath_::getQuantizedRadiusAccuracy_mm((MTParserPath_ *)a4);
    v24.float x = 0.0;
    MTSurfaceDimensions_::convertMillimetersToSurfaceFraction(v17, v24);
    IOHIDEventSetFloatValue();
    if (v13)
    {
      uint64_t VelocityEvent = IOHIDEventCreateVelocityEvent();
      if (VelocityEvent)
      {
        BOOL v19 = (const void *)VelocityEvent;
        IOHIDEventAppendEvent();
        CFRelease(v19);
      }
    }
    if ((a4->var3.var15 & 0x4000) != 0)
    {
      IOHIDEventGetPhase();
      IOHIDEventSetPhase();
    }
    IOHIDEventAppendEvent();
    CFRelease(DigitizerFingerEventWithQuality);
  }
}

- (void)updateFingerStats:(id)a3
{
  id v4 = a3;
  ptr = self->_mtHandStats.__ptr_;
  BOOL v7 = *((double *)ptr + 1) - self->_dragManagerEventQueue.t_mostRecentTap == 0.0
    || self->_dragManagerEventQueue._cycle_state > 1;
  unsigned int v8 = *((unsigned __int8 *)ptr + 186);
  if ((self->_parserOptions & 2) != 0)
  {
    if (v8 <= *((unsigned __int8 *)ptr + 195)) {
      int v9 = 0;
    }
    else {
      int v9 = -1;
    }
  }
  else
  {
    int v9 = 0;
  }
  unsigned int activePathCount = self->_activePathCount;
  int secondaryClickRegionIsActive = self->_secondaryClickRegionIsActive;
  unsigned int v12 = v9 + v8;
  unsigned int secondaryClickZones = self->_secondaryClickZones;
  int v14 = *((_DWORD *)self->_forceManagement.__ptr_ + 66);
  if (v14 < 1)
  {
    int v30 = *((_DWORD *)ptr + 77);
  }
  else
  {
    memcpy(__dst, &unk_111CF8, sizeof(__dst));
    uint64_t v15 = *((void *)self->_pathStates.__ptr_ + 35);
    *(void *)__dst = off_1417C0;
    uint64_t v16 = v15 + 568 * v14;
    memcpy(&__dst[8], (const void *)(v16 + 8), 0x114uLL);
    *(void *)&__dst[288] = off_1419C0;
    uint64_t v17 = *(void *)(v16 + 328);
    long long v18 = *(_OWORD *)(v16 + 312);
    *(_OWORD *)&__dst[296] = *(_OWORD *)(v16 + 296);
    *(_OWORD *)&__dst[312] = v18;
    *(void *)&__dst[328] = v17;
    long long v19 = *(_OWORD *)(v16 + 368);
    long long v20 = *(_OWORD *)(v16 + 336);
    *(_OWORD *)&__dst[352] = *(_OWORD *)(v16 + 352);
    *(_OWORD *)&__dst[336] = v20;
    *(_OWORD *)&__dst[368] = v19;
    long long v21 = *(_OWORD *)(v16 + 416);
    long long v23 = *(_OWORD *)(v16 + 384);
    long long v22 = *(_OWORD *)(v16 + 400);
    *(_OWORD *)&__dst[432] = *(_OWORD *)(v16 + 432);
    *(_OWORD *)&__dst[416] = v21;
    *(_OWORD *)&__dst[384] = v23;
    *(_OWORD *)&__dst[400] = v22;
    long long v24 = *(_OWORD *)(v16 + 480);
    long long v26 = *(_OWORD *)(v16 + 448);
    long long v25 = *(_OWORD *)(v16 + 464);
    *(_OWORD *)&__dst[496] = *(_OWORD *)(v16 + 496);
    *(_OWORD *)&__dst[480] = v24;
    *(_OWORD *)&__dst[448] = v26;
    *(_OWORD *)&__dst[464] = v25;
    long long v28 = *(_OWORD *)(v16 + 528);
    long long v27 = *(_OWORD *)(v16 + 544);
    long long v29 = *(_OWORD *)(v16 + 512);
    *(_DWORD *)&__dst[560] = *(_DWORD *)(v16 + 560);
    *(_OWORD *)&__dst[544] = v27;
    *(_OWORD *)&__dst[512] = v29;
    *(_OWORD *)&__dst[528] = v28;
    int v30 = *(_DWORD *)&__dst[272];
    MTParserPath_::~MTParserPath_((MTParserPath_ *)__dst);
  }
  int v31 = (v30 & secondaryClickZones) != 0;
  self->_unsigned int activePathCount = v12;
  self->_int secondaryClickRegionIsActive = v31;
  int v33 = activePathCount != v12 || secondaryClickRegionIsActive != v31 || v7;
  if (v33 == 1)
  {
    unsigned int secondaryClickEnabled = self->_secondaryClickEnabled;
    if (secondaryClickEnabled || self->_secondaryClickZones)
    {
      self->_shouldSecondaryClick = 0;
      if (!v7 && !self->_previousButtonState)
      {
        if (secondaryClickEnabled && v12 == 2) {
          self->_shouldSecondaryClick = 1;
        }
        if (self->_secondaryClickZones && (v30 & secondaryClickZones) != 0) {
          self->_shouldSecondaryClick = 1;
        }
      }
    }
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  int v35 = objc_msgSend(v4, "children", 0);
  id v36 = [v35 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v45;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(v35);
        }
        v39 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        unsigned int v40 = [v39 type];
        if (v40 == 2)
        {
          uint64_t v41 = 0x20000;
        }
        else
        {
          if (v40 != 17) {
            continue;
          }
          uint64_t v41 = 1114115;
        }
        unint64_t v42 = (unint64_t)[v39 integerValueForField:v41];
        LODWORD(v43) = v42;
        if (self->_shouldSecondaryClick && (v42 & 1) != 0)
        {
          unint64_t v43 = v42 & 0xFFFFFFFFFFFFFFFCLL | 2;
          [v39 setIntegerValue:v43 forField:v41];
        }
        self->_previousButtonState = v43;
      }
      id v36 = [v35 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v36);
  }
}

- (double)autoReleaseTapAndAHalfDrag:(double)a3 eventRef:(__IOHIDEvent *)a4
{
  double v4 = 0.0;
  if (a4)
  {
    if (self->_gestureConfig.__ptr_)
    {
      mach_absolute_time();
      DigitizerEvent = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent();
      if (DigitizerEvent)
      {
        int v9 = DigitizerEvent;
        int v10 = MTDragManagerEventQueue_::serviceEventQueue(&self->_dragManagerEventQueue, DigitizerEvent, (MTGestureConfig_ *)self->_gestureConfig.__ptr_, a3, *((unsigned __int8 *)self->_mtHandStats.__ptr_ + 211)+ *((unsigned __int8 *)self->_mtHandStats.__ptr_ + 186));
        if (IOHIDEventGetChildren())
        {
          MTSurfaceDimensions_::convertPixelsToSurfaceFraction(self->_surfaceDimensions.__ptr_, *(MTPoint *)((char *)self->_mtHandMotion.__ptr_ + 184));
          IOHIDEventSetFloatValue();
          IOHIDEventSetFloatValue();
          mach_absolute_time();
          IOHIDEventSetTimeStamp();
          if (*a4) {
            CFRelease(*a4);
          }
          *a4 = v9;
        }
        else
        {
          CFRelease(v9);
        }
        uint64_t ChordTableForHand = MTGestureConfig_::getChordTableForHand((uint64_t)self->_gestureConfig.__ptr_, 1);
        if (ChordTableForHand) {
          int v12 = v10;
        }
        else {
          int v12 = 0;
        }
        if (v12 == 1) {
          return *(float *)(ChordTableForHand + 372);
        }
      }
    }
  }
  return v4;
}

- (void)handleTPSettings:(const mt_StandardTrackpadSettings *)a3
{
  ptr = self->_mtHandMotion.__ptr_;
  BOOL dockScale5F = a3->dockScale5F;
  BOOL v7 = !a3->notificationCenter2F && a3->dockScale5F;
  *((unsigned char *)ptr + 136) = v7;
  if (!a3->notificationCenter2F) {
    BOOL dockScale5F = 0;
  }
  *((unsigned char *)ptr + 137) = dockScale5F;
  *((unsigned char *)ptr + 138) = 0;
  *((unsigned char *)ptr + 139) = a3->screenZoom;
  configureGestureParser(self->_gestureConfig.__ptr_, (mt_StandardTrackpadSettings *)a3);
  unsigned int v8 = self->_forceManagement.__ptr_;
  *((unsigned char *)v8 + 608) = self->_supportsForce;
  BOOL v10 = a3->dragging && a3->dragLock;
  self->_dragManagerEventQueue._tap_drag_lock_enabled = v10;
  self->_unsigned int secondaryClickEnabled = a3->rightClick;
  self->_unsigned int secondaryClickZones = *(_DWORD *)&a3->forceSuppressed;
  self->_actuateDetents = *(unsigned int *)((char *)&a3->actuationStrength + 3) != 0;
  if (self->_supportsForce)
  {
    if (*(unsigned int *)((char *)&a3->rightClickZone + 3) >= 3) {
      unsigned int v11 = 1;
    }
    else {
      unsigned int v11 = *(unsigned int *)((char *)&a3->rightClickZone + 3);
    }
    if (*(unsigned int *)((char *)&a3->firstClickThreshold + 3) >= 3) {
      int v12 = 1;
    }
    else {
      int v12 = *(unsigned int *)((char *)&a3->firstClickThreshold + 3);
    }
    MTForceBehavior_Configuration::clearBehaviors((MTForceBehavior_Configuration *)((char *)v8 + 272));
    if (a3->tapClickWhileResting)
    {
      int v13 = 1;
    }
    else if ([(MTTrackpadUberAlg *)self supportsDeepPress])
    {
      int v13 = 5;
    }
    else
    {
      int v13 = 1;
    }
    uint64_t v14 = MTForceConfigCreate(v13, 0);
    if (v14)
    {
      uint64_t v15 = (const void *)v14;
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v23.var8.__end_cap_.__value_ = v16;
      *(_OWORD *)&v23.var9.__end_ = v16;
      *(_OWORD *)&v23.var7.__end_ = v16;
      *(_OWORD *)&v23.var8.__begin_ = v16;
      *(_OWORD *)&v23.var6.__begin_ = v16;
      *(_OWORD *)&v23.var6.__end_cap_.__value_ = v16;
      *(_OWORD *)&v23.var4 = v16;
      *(_OWORD *)&v23.var5.var1 = v16;
      *(_OWORD *)&v23.var0 = v16;
      uint64_t v17 = objc_opt_class();
      if (v17) {
        objc_msgSend(v17, "forceBehaviorFromForceConfig:mask:", v15, 34, *(_OWORD *)&v23.var0, *(void *)&v23.var4);
      }
      else {
        memset(&v23, 0, sizeof(v23));
      }
      MTForceBehavior_Configuration::addDefaultBehavior((MTForceBehavior_Configuration *)((char *)self->_forceManagement.__ptr_ + 272), &v23);
      CFRelease(v15);
      if (v23.var9.__begin_)
      {
        v23.var9.__end_ = v23.var9.__begin_;
        operator delete(v23.var9.__begin_);
      }
      if (v23.var8.__begin_)
      {
        v23.var8.__end_ = v23.var8.__begin_;
        operator delete(v23.var8.__begin_);
      }
      if (v23.var7.__begin_)
      {
        v23.var7.__end_ = v23.var7.__begin_;
        operator delete(v23.var7.__begin_);
      }
      if (v23.var6.__begin_)
      {
        v23.var6.__end_ = v23.var6.__begin_;
        operator delete(v23.var6.__begin_);
      }
      if (v23.var5.var0)
      {
        v23.var5.var1 = v23.var5.var0;
        operator delete(v23.var5.var0);
      }
    }
    id v18 = [(id)objc_opt_class() getForceSourceForBehavior:2 secondaryClickEnabled:a3->rightClick];
    uint64_t v19 = MTForceConfigCreate(2, 0);
    if (v19)
    {
      long long v20 = (const void *)v19;
      if (v18)
      {
        *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v23.var8.__end_cap_.__value_ = v21;
        *(_OWORD *)&v23.var9.__end_ = v21;
        *(_OWORD *)&v23.var7.__end_ = v21;
        *(_OWORD *)&v23.var8.__begin_ = v21;
        *(_OWORD *)&v23.var6.__begin_ = v21;
        *(_OWORD *)&v23.var6.__end_cap_.__value_ = v21;
        *(_OWORD *)&v23.var4 = v21;
        *(_OWORD *)&v23.var5.var1 = v21;
        *(_OWORD *)&v23.var0 = v21;
        long long v22 = objc_opt_class();
        if (v22) {
          [v22 forceBehaviorFromForceConfig:v20 mask:v18];
        }
        else {
          memset(&v23, 0, sizeof(v23));
        }
        MTForceBehavior_Configuration::addDefaultBehavior((MTForceBehavior_Configuration *)((char *)self->_forceManagement.__ptr_ + 272), &v23);
        if (v23.var9.__begin_)
        {
          v23.var9.__end_ = v23.var9.__begin_;
          operator delete(v23.var9.__begin_);
        }
        if (v23.var8.__begin_)
        {
          v23.var8.__end_ = v23.var8.__begin_;
          operator delete(v23.var8.__begin_);
        }
        if (v23.var7.__begin_)
        {
          v23.var7.__end_ = v23.var7.__begin_;
          operator delete(v23.var7.__begin_);
        }
        if (v23.var6.__begin_)
        {
          v23.var6.__end_ = v23.var6.__begin_;
          operator delete(v23.var6.__begin_);
        }
        if (v23.var5.var0)
        {
          v23.var5.var1 = v23.var5.var0;
          operator delete(v23.var5.var0);
        }
      }
      CFRelease(v20);
    }
    MTForceManagement_::setFirstStageClickPreference((uint64_t)self->_forceManagement.__ptr_, v11);
    MTForceManagement_::setSecondStageClickPreference((uint64_t)self->_forceManagement.__ptr_, v12);
    *((unsigned char *)self->_forceManagement.__ptr_ + 607) = a3->tapClickWhileResting;
  }
}

- (void)handleMouseSettings:(const mt_StandardMouseSettings *)a3
{
}

- (void)handleMomentumState:(int)a3 active:(BOOL)a4
{
  uint64_t ChordTableForHand = MTGestureConfig_::getChordTableForHand((uint64_t)self->_gestureConfig.__ptr_, 1);
  *(_DWORD *)(ChordTableForHand + 1276) = a3;
  *(unsigned char *)(ChordTableForHand + 1272) = a4;
}

- (void)clearState
{
  ptr = self->_mtHandStats.__ptr_;
  MTAbsoluteTimeGetCurrent();
  *((void *)ptr + 5) = v4;
  MTHandStatistics_::clear(self->_mtHandStats.__ptr_, 0);
  MTHandMotion_::clear(self->_mtHandMotion.__ptr_);
  MTPathStates_::clear(self->_pathStates.__ptr_);
  MTForceManagement_::clearState(self->_forceManagement.__ptr_, 0);
  uint64_t ChordTableForHand = MTGestureConfig_::getChordTableForHand((uint64_t)self->_gestureConfig.__ptr_, 1);
  (*(void (**)(uint64_t))(*(void *)ChordTableForHand + 16))(ChordTableForHand);
  MTTapDragManager_::clearState((uint64_t)&self->_dragManagerEventQueue);

  [(MTTrackpadUberAlg *)self setDivingButtonState:0];
}

+ (MTForceBehavior_)forceBehaviorFromForceConfig:(SEL)a3 mask:(__MTForceConfig *)a4
{
  int Behavior = MTForceConfigGetBehavior((uint64_t)a4);
  int NumStages = MTForceConfigGetNumStages((uint64_t)a4);
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&retstr->var0 = v10;
  *(_OWORD *)&retstr->var4 = v10;
  *(_OWORD *)&retstr->var5.var1 = v10;
  *(_OWORD *)&retstr->var6.__begin_ = v10;
  *(_OWORD *)&retstr->var6.__end_cap_.__value_ = v10;
  *(_OWORD *)&retstr->var7.__end_ = v10;
  *(_OWORD *)&retstr->var8.__begin_ = v10;
  *(_OWORD *)&retstr->var8.__end_cap_.__value_ = v10;
  *(_OWORD *)&retstr->var9.__end_ = v10;
  MTForceBehavior_::MTForceBehavior_(retstr);
  result = (MTForceBehavior_ *)MTForceConfigIsContinuous((uint64_t)a4);
  retstr->var3 = (char)result;
  retstr->var0 = Behavior;
  retstr->var1 = a5;
  if (NumStages)
  {
    for (int i = 0; i != NumStages; ++i)
    {
      float ThresholdsForStage = MTForceConfigGetThresholdsForStage((uint64_t)a4, i);
      float v15 = v14;
      uint64_t ActuationsForStage = MTForceConfigGetActuationsForStage((uint64_t)a4, i);
      MTForceBehavior_::addStage(retstr, i, ActuationsForStage, ThresholdsForStage, v15);
      if (MTForceConfigShouldSkipActivationForStage((uint64_t)a4, i)) {
        MTForceBehavior_::addSkippedActivationStage(retstr, i);
      }
      result = (MTForceBehavior_ *)MTForceConfigShouldSkipReleaseForStage((uint64_t)a4, i);
      if (result) {
        MTForceBehavior_::addSkippedReleaseStage(retstr, i);
      }
    }
  }
  return result;
}

+ (int)getForceSourceForBehavior:(int)a3 secondaryClickEnabled:(BOOL)a4
{
  if (a3 > 0x11) {
    return 0;
  }
  if (((1 << a3) & 0x31C22) != 0) {
    return 34;
  }
  if (a3 != 2) {
    return 0;
  }
  if (a4) {
    return 134;
  }
  return 0;
}

- (double)lastFrameInterval
{
  return *((double *)self->_mtHandStats.__ptr_ + 1) - *((double *)self->_mtHandStats.__ptr_ + 2);
}

- (BOOL)shouldHandleTPSettings
{
  return !MTForceManagement_::isForceButtonActivated(self->_forceManagement.__ptr_);
}

- (void)setHostClickEnabled:(BOOL)a3
{
  self->_hostClickEnabled = a3;
  ptr = self->_forceManagement.__ptr_;
  int v4 = *((unsigned __int8 *)ptr + 606);
  *((unsigned char *)ptr + 606) = a3;
  if (v4)
  {
    if (!a3) {
      MTForceManagement_::clearState(ptr, 1);
    }
  }
}

- (void)cancelCurrentTapAndAHalfDrag
{
  if ((*(unsigned int (**)(void))self->_dragManagerEventQueue._vptr$MTTapDragManager_)()) {
    self->_dragManagerEventQueue._tap_drag_needs_immediate_release = 1;
  }
}

- (BOOL)updateGestureConfiguration:(id)a3 value:(id)a4
{
  id v30 = a3;
  BOOL v6 = 0;
  id v29 = a4;
  if (v29 && self->_supportsForce)
  {
    ptr = self->_forceManagement.__ptr_;
    if (ptr && !*((unsigned char *)ptr + 607) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v27 = v29;
      unsigned int v8 = [v27 objectForKey:@"Version"];
      long long v26 = v8;
      if (v8 && [v8 isEqualToNumber:&off_149AA8])
      {
        long long v25 = [v27 objectForKey:@"Behaviors"];
        if (v25)
        {
          if ([v30 isEqualToString:@"MTGestureConfiguration"]) {
            MTForceBehavior_Configuration::clearNonDefaultBehaviors((MTForceBehavior_Configuration *)((char *)self->_forceManagement.__ptr_ + 272));
          }
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v9 = v25;
          id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v10)
          {
            char v28 = 0;
            uint64_t v11 = *(void *)v33;
            do
            {
              for (int i = 0; i != v10; int i = (char *)i + 1)
              {
                if (*(void *)v33 != v11) {
                  objc_enumerationMutation(v9);
                }
                int v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  float v14 = [v13 objectForKey:@"BehaviorID"];
                  float v15 = v14;
                  if (v14)
                  {
                    id v16 = [v14 intValue];
                    uint64_t v17 = (const void *)MTForceConfigCreate((int)v16, 0);
                    id v18 = [(id)objc_opt_class() getForceSourceForBehavior:v16 secondaryClickEnabled:self->_secondaryClickEnabled != 0];
                    if (v17)
                    {
                      id v19 = v18;
                      if (v18)
                      {
                        *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
                        *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
                        *(_OWORD *)&v31.var8.__end_cap_.__value_ = v20;
                        *(_OWORD *)&v31.var9.__end_ = v20;
                        *(_OWORD *)&v31.var7.__end_ = v20;
                        *(_OWORD *)&v31.var8.__begin_ = v20;
                        *(_OWORD *)&v31.var6.__begin_ = v20;
                        *(_OWORD *)&v31.var6.__end_cap_.__value_ = v20;
                        *(_OWORD *)&v31.var4 = v20;
                        *(_OWORD *)&v31.var5.var1 = v20;
                        *(_OWORD *)&v31.var0 = v20;
                        long long v21 = objc_opt_class();
                        if (v21) {
                          [v21 forceBehaviorFromForceConfig:v17 mask:v19];
                        }
                        else {
                          memset(&v31, 0, sizeof(v31));
                        }
                        unsigned int v22 = objc_msgSend(v30, "isEqualToString:", @"MTGestureConfiguration", v25, v26);
                        MTForceBehavior_ v23 = self->_forceManagement.__ptr_;
                        if (v22) {
                          MTForceBehavior_Configuration::pushBehavior((MTForceBehavior_Configuration *)((char *)v23 + 272), &v31);
                        }
                        else {
                          MTForceManagement_::setOverrideBehavior(v23, &v31);
                        }
                        if (v31.var9.__begin_)
                        {
                          v31.var9.__end_ = v31.var9.__begin_;
                          operator delete(v31.var9.__begin_);
                        }
                        if (v31.var8.__begin_)
                        {
                          v31.var8.__end_ = v31.var8.__begin_;
                          operator delete(v31.var8.__begin_);
                        }
                        if (v31.var7.__begin_)
                        {
                          v31.var7.__end_ = v31.var7.__begin_;
                          operator delete(v31.var7.__begin_);
                        }
                        if (v31.var6.__begin_)
                        {
                          v31.var6.__end_ = v31.var6.__begin_;
                          operator delete(v31.var6.__begin_);
                        }
                        if (v31.var5.var0)
                        {
                          v31.var5.var1 = v31.var5.var0;
                          operator delete(v31.var5.var0);
                        }
                        char v28 = 1;
                      }
                      CFRelease(v17);
                    }
                  }
                }
              }
              id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
            }
            while (v10);
          }
          else
          {
            char v28 = 0;
          }
        }
        else
        {
          char v28 = 0;
        }
      }
      else
      {
        char v28 = 0;
      }

      BOOL v6 = v28 & 1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)setMouseMotionFilterData:(const MTPoint *)a3
{
  ptr = self->_mtHandMotion.__ptr_;
  if (ptr) {
    MTHandMotion_::storeFeedbackFromMouse(ptr, *a3);
  }
}

- (void)setMouseButtonFilterData:(float)a3
{
  ptr = self->_mtHandMotion.__ptr_;
  if (ptr) {
    MTHandMotion_::storeFeedbackFromButton(ptr, a3);
  }
}

- (BOOL)handleProperty:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"AppKitActuateWithID"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (*((unsigned char *)self->_forceManagement.__ptr_ + 607)) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = !self->_actuateDetents;
      }
      if (!v8 && *((unsigned char *)self->_mtHandStats.__ptr_ + 186) != 0)
      {
        [v7 intValue];
        (*((void (**)(float, float))self->_actBlock + 2))(1.0, 1.0);
      }
      goto LABEL_26;
    }
  }
  if (([v6 isEqualToString:@"MTGestureConfiguration"] & 1) == 0
    && ![v6 isEqualToString:@"MTGestureConfigurationOverride"])
  {
    if ([v6 isEqualToString:@"SendClickThresholdInfo"])
    {
      if (self->_supportsForce)
      {
        self = (MTTrackpadUberAlg *)self->_forceManagement.__ptr_;
        if (!self) {
          goto LABEL_28;
        }
        LOBYTE(self->_forceManagement.__cntrl_) = [v7 BOOLValue];
LABEL_26:
        LOBYTE(self) = 1;
        goto LABEL_28;
      }
    }
    else if ([v6 isEqualToString:@"DisableClickWaveformAdaptation"])
    {
      if (self->_supportsForce)
      {
        self = (MTTrackpadUberAlg *)self->_forceManagement.__ptr_;
        if (!self) {
          goto LABEL_28;
        }
        MTForceManagement_::setDisableClickWaveformAdaptation((MTForceManagement_ *)self, (char)[v7 BOOLValue]);
        goto LABEL_26;
      }
    }
    else if ([v6 isEqualToString:@"DisableForceThresholdAdaptation"] {
           && self->_supportsForce)
    }
    {
      self = (MTTrackpadUberAlg *)self->_forceManagement.__ptr_;
      if (!self) {
        goto LABEL_28;
      }
      MTForceManagement_::setDisableForceThresholdAdaptation((MTForceManagement_ *)self, (char)[v7 BOOLValue]);
      goto LABEL_26;
    }
    LOBYTE(self) = 0;
    goto LABEL_28;
  }
  LOBYTE(self) = [(MTTrackpadUberAlg *)self updateGestureConfiguration:v6 value:v7];
LABEL_28:

  return (char)self;
}

- (BOOL)hsEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  HSUtil::Encoder::encodeCodable<MTHandStatistics_>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)116,(char)72,(char)97,(char)110,(char)100,(char)83,(char)116,(char)97,(char)116,(char)115>::Key, self->_mtHandStats.__ptr_);
  HSUtil::Encoder::encodeCodable<MTHandStatistics_>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)116,(char)80,(char)97,(char)116,(char)104,(char)83,(char)116,(char)97,(char)116,(char)101,(char)115>::Key, (MTHandStatistics_ *)self->_pathStates.__ptr_);
  HSUtil::Encoder::encodeCodable<MTForceManagement_>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)102,(char)111,(char)114,(char)99,(char)101,(char)77,(char)97,(char)110,(char)97,(char)103,(char)101,(char)109,(char)101,(char)110,(char)116>::Key, self->_forceManagement.__ptr_);
  HSUtil::Encoder::encodeCodable<MTPListGestureConfig_>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)103,(char)101,(char)115,(char)116,(char)117,(char)114,(char)101,(char)67,(char)111,(char)110,(char)102,(char)105,(char)103>::Key, (MTGestureConfig_ *)self->_gestureConfig.__ptr_);
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
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/Alg/MTTrackpadUberAlg.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MTTrackpadUberAlg hsDecode:].cold.5();
    }
LABEL_16:
    BOOL v6 = 0;
    goto LABEL_17;
  }
  HSUtil::Decoder::decodeCodable<MTHandStatistics_>(&v9, (CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)116,(char)72,(char)97,(char)110,(char)100,(char)83,(char)116,(char)97,(char)116,(char)115>::Key, self->_mtHandStats.__ptr_);
  if (LODWORD(v9.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/Alg/MTTrackpadUberAlg.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MTTrackpadUberAlg hsDecode:].cold.4();
    }
    goto LABEL_16;
  }
  HSUtil::Decoder::decodeCodable<MTPathStates_>(&v9, (CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)116,(char)80,(char)97,(char)116,(char)104,(char)83,(char)116,(char)97,(char)116,(char)101,(char)115>::Key, self->_pathStates.__ptr_);
  if (LODWORD(v9.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/Alg/MTTrackpadUberAlg.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MTTrackpadUberAlg hsDecode:]();
    }
    goto LABEL_16;
  }
  HSUtil::Decoder::decodeCodable<MTForceManagement_>(&v9, (CoderKey *)HSUtil::CoderKey::Literal<(char)102,(char)111,(char)114,(char)99,(char)101,(char)77,(char)97,(char)110,(char)97,(char)103,(char)101,(char)109,(char)101,(char)110,(char)116>::Key, self->_forceManagement.__ptr_);
  if (LODWORD(v9.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/Alg/MTTrackpadUberAlg.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MTTrackpadUberAlg hsDecode:]();
    }
    goto LABEL_16;
  }
  HSUtil::Decoder::decodeCodable<MTPListGestureConfig_>(&v9, (CoderKey *)HSUtil::CoderKey::Literal<(char)103,(char)101,(char)115,(char)116,(char)117,(char)114,(char)101,(char)67,(char)111,(char)110,(char)102,(char)105,(char)103>::Key, (MTGestureConfig_ *)self->_gestureConfig.__ptr_);
  if (LODWORD(v9.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/Alg/MTTrackpadUberAlg.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[MTTrackpadUberAlg hsDecode:]();
    }
    goto LABEL_16;
  }
  BOOL v6 = 1;
LABEL_17:
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

- (BOOL)hostClickEnabled
{
  return self->_hostClickEnabled;
}

- (BOOL)divingButtonState
{
  return self->_divingButtonState;
}

- (BOOL)supportsDeepPress
{
  return self->_supportsDeepPress;
}

- (void)setSupportsDeepPress:(BOOL)a3
{
  self->_supportsDeepPress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actBlock, 0);
  cntrl = (std::__shared_weak_count *)self->_forceManagement.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  int v4 = (std::__shared_weak_count *)self->_gestureConfig.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  CoderKey v5 = (std::__shared_weak_count *)self->_mtHandMotion.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  BOOL v6 = (std::__shared_weak_count *)self->_mtHandStats.__cntrl_;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  id v7 = (std::__shared_weak_count *)self->_pathStates.__cntrl_;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  BOOL v8 = (std::__shared_weak_count *)self->_surfaceDimensions.__cntrl_;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

- (id).cxx_construct
{
  self->_gestureConfig = 0u;
  self->_mtHandStats = 0u;
  self->_mtHandMotion = 0u;
  self->_surfaceDimensions = 0u;
  self->_pathStates = 0u;
  MTDragManagerEventQueue_::MTDragManagerEventQueue_(&self->_dragManagerEventQueue);
  self->_forceManagement.__ptr_ = 0;
  self->_forceManagement.__cntrl_ = 0;
  return self;
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

- (void)hsDecode:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)hsDecode:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)hsDecode:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end