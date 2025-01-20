@interface XRFrameActivityManager
+ (BOOL)_establishesAffinity;
+ (BOOL)enableConcurrentActivities;
+ (BOOL)supportsQoS;
+ (int)_identifierForSignposting;
+ (unsigned)_activityQoS;
+ (void)initialize;
- (BOOL)holdBackArrivingAgent:(id)a3;
- (BOOL)holdBackRevisitingAgent:(id)a3;
- (XRFrameActivityManager)init;
- (XRFrameActivityManager)initWithRing:(id)a3;
- (id).cxx_construct;
- (id)scheduleActivityAsOperation:(id)a3;
- (int)agentStopDiagnosticsTypeCode;
- (unsigned)currentSlot;
- (void)_acquiredMinorFrame:(unsigned __int8)a3;
- (void)_extendingMinorFrame:(unsigned __int8)a3;
- (void)_managerImplPtr;
- (void)_needsScheduling;
- (void)_reevaluateArrivingAgent:(id)a3;
- (void)_secondTierManagerImplPtr;
- (void)_shutdown;
- (void)_startingMajorFrame;
- (void)_underrunMinorFrame:(unsigned __int8)a3;
- (void)_yieldingMinorFrame:(unsigned __int8)a3;
- (void)activateNextMajorFrame;
- (void)dealloc;
- (void)performDuringMinorFrame:(id)a3;
- (void)performOutsideMinorFrame:(id)a3;
- (void)receiveMobileAgent:(id)a3;
- (void)scheduleActivity:(id)a3;
- (void)scheduleInactivity:(id)a3;
- (void)setupVisitDuringMinorFrame:(id)a3 agent:(id)a4 mode:(id)a5 ticket:(id)a6;
@end

@implementation XRFrameActivityManager

+ (BOOL)enableConcurrentActivities
{
  return 0;
}

+ (BOOL)supportsQoS
{
  return 0;
}

+ (unsigned)_activityQoS
{
  return 25;
}

+ (int)_identifierForSignposting
{
  return -1;
}

+ (BOOL)_establishesAffinity
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v6 = [MEMORY[0x263EFFA40] objc_msgSend_standardUserDefaults:v2 :v3 :v4 :v5];
    byte_2687AA2D8 = [v6 XREnableInternalSignposts:v8 :v9];

    if (byte_2687AA2D8)
    {
      qword_2687A9E60 = sub_23459614C();
      MEMORY[0x270F9A758]();
    }
  }
}

- (XRFrameActivityManager)initWithRing:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)XRFrameActivityManager;
  uint64_t v5 = [(XRFrameActivityManager *)&v53 init];
  if (!v5) {
    goto LABEL_22;
  }
  v6 = objc_opt_class();
  unsigned __int8 v52 = [v6 establishesAffinity:v7 with:v8 and:v9 and:v10];
  v11 = objc_opt_class();
  unsigned int v51 = [v11 _enableConcurrentActivities:v12, v13, v14, v15];
  if (v4) {
    [v4 _parent:v16 child:v17 childIndex:v18 ofParent:v19];
  }
  else {
    long long v49 = 0uLL;
  }
  sub_23458F30C(&v49, &v52, (int *)&v51, &v50);
  long long v20 = v50;
  long long v50 = 0uLL;
  v21 = (std::__shared_weak_count *)*((void *)v5 + 2);
  *(_OWORD *)(v5 + 8) = v20;
  if (v21)
  {
    sub_234578B24(v21);
    if (*((void *)&v50 + 1)) {
      sub_234578B24(*((std::__shared_weak_count **)&v50 + 1));
    }
  }
  if (*((void *)&v49 + 1)) {
    sub_234578B24(*((std::__shared_weak_count **)&v49 + 1));
  }
  sub_234596FD8(*((void *)v5 + 1), (uint64_t)v5);
  v22 = objc_opt_class();
  if ([v22 _supportsQoS:v23 queue:v24 priority:v25 qos:v26])
  {
    if (v4) {
      [v4 _parent:v27 child:v28 childIndex:v29 ofParent:v30];
    }
    else {
      long long v49 = 0uLL;
    }
    unsigned __int8 v48 = 0;
    sub_23458F4E4(&v49, &v48, (int *)&v51, &v50);
    long long v42 = v50;
    long long v50 = 0uLL;
    v43 = (std::__shared_weak_count *)*((void *)v5 + 4);
    *(_OWORD *)(v5 + 24) = v42;
    if (v43)
    {
      sub_234578B24(v43);
      if (*((void *)&v50 + 1)) {
        sub_234578B24(*((std::__shared_weak_count **)&v50 + 1));
      }
    }
    if (*((void *)&v49 + 1)) {
      sub_234578B24(*((std::__shared_weak_count **)&v49 + 1));
    }
    sub_234596FD8(*((void *)v5 + 3), (uint64_t)v5);
    sub_23458F63C(&v51, &v50);
    uint64_t v44 = *((void *)v5 + 1);
    long long v47 = v50;
    if (*((void *)&v50 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v50 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    sub_23459733C(v44, (uint64_t *)&v47);
    if (*((void *)&v47 + 1)) {
      sub_234578B24(*((std::__shared_weak_count **)&v47 + 1));
    }
    uint64_t v45 = *((void *)v5 + 3);
    long long v46 = v50;
    if (*((void *)&v50 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v50 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    sub_23459733C(v45, (uint64_t *)&v46);
    if (*((void *)&v46 + 1)) {
      sub_234578B24(*((std::__shared_weak_count **)&v46 + 1));
    }
    v33 = (std::__shared_weak_count *)*((void *)&v50 + 1);
    if (!*((void *)&v50 + 1)) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v32 = *((void *)v5 + 1);
    uint64_t v31 = *((void *)v5 + 2);
    if (v31) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v31 + 8), 1uLL, memory_order_relaxed);
    }
    v33 = (std::__shared_weak_count *)*((void *)v5 + 4);
    *((void *)v5 + 3) = v32;
    *((void *)v5 + 4) = v31;
    if (!v33) {
      goto LABEL_17;
    }
  }
  sub_234578B24(v33);
LABEL_17:
  if (byte_2687AA2D8)
  {
    v34 = objc_opt_class();
    int v39 = [v34 identifierForSignposting:v35, v36, v37, v38];
    int v40 = 10 * v39 + 500;
    if (v39 < 0) {
      int v40 = -1;
    }
    *((_DWORD *)v5 + 12) = v40;
    *((void *)v5 + 7) = os_signpost_id_make_with_pointer((os_log_t)qword_2687A9E60, v5);
    *((void *)v5 + 8) = os_signpost_id_make_with_pointer((os_log_t)qword_2687A9E60, v4);
  }
  else
  {
    *((_DWORD *)v5 + 12) = -1;
  }
LABEL_22:

  return (XRFrameActivityManager *)v5;
}

- (XRFrameActivityManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)XRFrameActivityManager;
  return [(XRFrameActivityManager *)&v3 init];
}

- (void)dealloc
{
  ptr = self->_managerImpl.__ptr_;
  if (ptr) {
    sub_234596FD8((uint64_t)ptr, 0);
  }
  id v4 = self->_secondTierManagerImpl.__ptr_;
  if (v4 && v4 != self->_managerImpl.__ptr_) {
    sub_234596FD8((uint64_t)v4, 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)XRFrameActivityManager;
  [(XRFrameActivityManager *)&v5 dealloc];
}

- (int)agentStopDiagnosticsTypeCode
{
  return 10;
}

- (void)performDuringMinorFrame:(id)a3
{
}

- (void)performOutsideMinorFrame:(id)a3
{
}

- (id)scheduleActivityAsOperation:(id)a3
{
  id v4 = a3;
  objc_super v5 = [XRFrameActivityBlockAgent alloc];
  uint64_t v9 = [v5 initWithBlock:v6 block:v4 block:v7 block:v8];
  [v9 activateAtStop:v10 activationTicket:self finalDestination:0 finalTicket:0];
  uint64_t v15 = [v9 operationRepresentation:v11 withOptions:v12 withError:v13 withContext:v14];

  return v15;
}

- (void)scheduleActivity:(id)a3
{
}

- (void)scheduleInactivity:(id)a3
{
}

- (void)setupVisitDuringMinorFrame:(id)a3 agent:(id)a4 mode:(id)a5 ticket:(id)a6
{
  id v23 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 _callOutQueue_willDestroyWithTransitionContext:v14 completion:v23] == NO)
  {
    v21 = [MEMORY[0x263F08690] currentHandler:v17, v18, v19, v20];
    [v21 _handleFailureInMethod:v22 object:a2 file:self lineNumber:163 description:@"Invalid parameter not satisfying: %@", @"[agent holdsItinerary:itinerary]"];
  }
  [v23 setNextStop:v17 mode:self ticket:v12];
}

- (void)receiveMobileAgent:(id)a3
{
}

- (void)_reevaluateArrivingAgent:(id)a3
{
  id v4 = a3;
  unsigned int v9 = [v4 desiredQoS:v5, v6, v7, v8];
  uint64_t v10 = 24;
  if (v9 > 0x18) {
    uint64_t v10 = 8;
  }
  uint64_t v11 = *(uint64_t *)((char *)&self->super.isa + v10);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_23458EEE4;
  v13[3] = &unk_264BF20F0;
  v13[4] = self;
  id v12 = v4;
  id v14 = v12;
  sub_234596ACC(v11, v13);
}

- (void)_needsScheduling
{
}

- (void)activateNextMajorFrame
{
}

- (void)_acquiredMinorFrame:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  self->_currentSlot = a3;
  objc_super v5 = (id)qword_2687A9E60;
  uint64_t v6 = v5;
  os_signpost_id_t ringSignpostID = self->_ringSignpostID;
  if (ringSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v15[0] = 67109120;
    v15[1] = [self _agentStopDiagnosticsTypeCode:v8 withOptions:v9 withCompletion:v10 withCompletion:v11];
    _os_signpost_emit_with_name_impl(&dword_234574000, v6, OS_SIGNPOST_INTERVAL_BEGIN, ringSignpostID, "Manager Active", "Stop kind: %d", (uint8_t *)v15, 8u);
  }

  [self _objc_msgSend_enteringMinorFrame_:v12 v3:v13 v14:v14];
}

- (void)_yieldingMinorFrame:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v5 = (id)qword_2687A9E60;
  uint64_t v6 = v5;
  os_signpost_id_t ringSignpostID = self->_ringSignpostID;
  if (ringSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v15[0] = 67109120;
    v15[1] = [self _agentStopDiagnosticsTypeCode:v8 withOptions:v9 withCompletion:v10 withCompletionHandler:v11];
    _os_signpost_emit_with_name_impl(&dword_234574000, v6, OS_SIGNPOST_INTERVAL_END, ringSignpostID, "Manager Active", "Stop kind: %d", (uint8_t *)v15, 8u);
  }

  [self _yieldingMinorFrame:v12 v3:v13 v14:v14];
}

- (void)_underrunMinorFrame:(unsigned __int8)a3
{
  self->_currentSlot = a3;
  ((void (*)(XRFrameActivityManager *, char *, void))MEMORY[0x270F9A6D0])(self, sel_underrunMinorFrame_, a3);
}

- (void)_extendingMinorFrame:(unsigned __int8)a3
{
  self->_currentSlot = a3;
  ((void (*)(XRFrameActivityManager *, char *, void))MEMORY[0x270F9A6D0])(self, sel_extendingMinorFrame_, a3);
}

- (void)_startingMajorFrame
{
}

- (void)_shutdown
{
}

- (void)_managerImplPtr
{
  return &self->_managerImpl;
}

- (void)_secondTierManagerImplPtr
{
  return &self->_secondTierManagerImpl;
}

- (BOOL)holdBackRevisitingAgent:(id)a3
{
  return 0;
}

- (BOOL)holdBackArrivingAgent:(id)a3
{
  return 0;
}

- (unsigned)currentSlot
{
  return self->_currentSlot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncActivity, 0);
  cntrl = self->_secondTierManagerImpl.__cntrl_;
  if (cntrl) {
    sub_234578B24((std::__shared_weak_count *)cntrl);
  }
  id v4 = self->_managerImpl.__cntrl_;
  if (v4)
  {
    sub_234578B24((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end