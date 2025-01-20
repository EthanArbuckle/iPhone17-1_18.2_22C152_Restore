@interface FTCinematicHighPriorityTrackerState
- (BOOL)_unsafeMeanFillAndScaleSourceBuffer:(__CVBuffer *)a3 destinationBuffer:(__CVBuffer *)a4 sourceRect:(CGRect)a5 meanPixel:(id)a6 scaler:;
- (BOOL)_updateHighPriorityTrackWithRect:(Rect<double>)a3 confidence:(double)a4 isTapToTrack:(BOOL)a5;
- (BOOL)_validatePostProcessingInvocation;
- (BOOL)completed;
- (BOOL)postProcessExemplarOutputs:(id)a3 forTargetRect:(CGRect)a4;
- (BOOL)postProcessInstanceOutputs:(id)a3;
- (BOOL)preProcessExemplarInputFromSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 forTargetRect:(CGRect)a5 meanPixel:(id)a6 scaler:;
- (BOOL)preProcessInstanceInputFromSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 meanPixel:(id)a5 scaler:;
- (CGRect)exemplarInputRoiForTargetRect:(CGRect)a3;
- (CGRect)instanceInputRoi;
- (CGRect)targetRect;
- (FTCinematicHighPriorityTrackerState)initWithTracker:(shared_ptr<ft:(shared_ptr<ft::Frame>)a4 :CinematicTracker>)a3 frame:;
- (NSMutableDictionary)sessionStorage;
- (id).cxx_construct;
- (id)opDescription;
- (int64_t)op;
- (void)_setup;
- (void)_setupOp;
- (void)_setupSessionStorage;
- (void)_validatePostProcessingInvocation;
- (void)abort;
- (void)setOp:(int64_t)a3;
- (void)setSessionStorage:(id)a3;
- (void)setTargetRect:(CGRect)a3;
@end

@implementation FTCinematicHighPriorityTrackerState

- (FTCinematicHighPriorityTrackerState)initWithTracker:(shared_ptr<ft:(shared_ptr<ft::Frame>)a4 :CinematicTracker>)a3 frame:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v17.receiver = self;
  v17.super_class = (Class)FTCinematicHighPriorityTrackerState;
  v6 = [(FTCinematicHighPriorityTrackerState *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v9 = *(CinematicTracker **)ptr;
    uint64_t v8 = *((void *)ptr + 1);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    v10 = (std::__shared_weak_count *)v6->_tracker.__cntrl_;
    v6->_tracker.__ptr_ = v9;
    v6->_tracker.__cntrl_ = (__shared_weak_count *)v8;
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    v12 = *(Frame **)cntrl;
    uint64_t v11 = *((void *)cntrl + 1);
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
    }
    v13 = (std::__shared_weak_count *)v7->_frame.__cntrl_;
    v7->_frame.__ptr_ = v12;
    v7->_frame.__cntrl_ = (__shared_weak_count *)v11;
    if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    CGSize v14 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v7->_targetRect.origin = (CGPoint)*MEMORY[0x263F001A0];
    v7->_targetRect.size = v14;
    *(_WORD *)&v7->_isTapToTrack = 0;
    [(FTCinematicHighPriorityTrackerState *)v7 _setup];
    v15 = v7;
  }

  return v7;
}

- (void)_setup
{
  v3 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v3);
  [(FTCinematicHighPriorityTrackerState *)self _setupOp];
  [(FTCinematicHighPriorityTrackerState *)self _setupSessionStorage];

  std::recursive_mutex::unlock(v3);
}

- (void)_setupSessionStorage
{
  int64_t op = self->_op;
  if (op != 2)
  {
    if (!op)
    {
      ptr = self->_tracker.__ptr_;
      v5 = (void *)*((void *)ptr + 18);
      if (v5)
      {
        *((void *)ptr + 18) = 0;
      }
      return;
    }
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v7 = self->_tracker.__ptr_;
    uint64_t v8 = (void *)*((void *)v7 + 18);
    *((void *)v7 + 18) = v6;
  }
  uint64_t v9 = *((void *)self->_tracker.__ptr_ + 18);

  [(FTCinematicHighPriorityTrackerState *)self setSessionStorage:v9];
}

- (void)_setupOp
{
  uint64_t v3 = ft::SiameseRpnSession::CurrentStage((ft::SiameseRpnSession *)((char *)self->_tracker.__ptr_ + 200));
  ptr = self->_tracker.__ptr_;
  uint64_t v5 = *((void *)ptr + 19);
  id v6 = (std::__shared_weak_count *)*((void *)ptr + 20);
  uint64_t v15 = v5;
  v16 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v5)
  {
    BOOL v7 = *(unsigned char *)(v5 + 8) & 1;
    self->_isTapToTrack = v7;
    if (v3 == 2)
    {
      self->_int64_t op = 2;
      if (!v6) {
        return;
      }
    }
    else
    {
      if (v3)
      {
        unint64_t v9 = v3;
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::to_string(&v13, v9);
        uint64_t v11 = std::string::insert(&v13, 0, "SiameseRPN at invalid stage: ");
        long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
        v14.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v12;
        v11->__r_.__value_.__l.__size_ = 0;
        v11->__r_.__value_.__r.__words[2] = 0;
        v11->__r_.__value_.__r.__words[0] = 0;
        std::runtime_error::runtime_error(exception, &v14);
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      if (v7)
      {
        self->_int64_t op = 3;
        if (!v6) {
          return;
        }
      }
      else
      {
        self->_int64_t op = 1;
        CGSize v8 = *(CGSize *)(v5 + 40);
        self->_targetRect.origin = *(CGPoint *)(v5 + 24);
        self->_targetRect.size = v8;
        if (!v6) {
          return;
        }
      }
    }
  }
  else
  {
    self->_int64_t op = 0;
    if (!v6) {
      return;
    }
  }
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

- (CGRect)targetRect
{
  double x = self->_targetRect.origin.x;
  double y = self->_targetRect.origin.y;
  double width = self->_targetRect.size.width;
  double height = self->_targetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)exemplarInputRoiForTargetRect:(CGRect)a3
{
  if ((self->_op | 2) == 3)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80));
    ft::SiameseRpnSession::ComputeExemplarInputRect((uint64_t)self->_tracker.__ptr_ + 200);
  }
  double v4 = *MEMORY[0x263F001A0];
  double v5 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)instanceInputRoi
{
  if (self->_op == 2)
  {
    uint64_t v3 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
    std::recursive_mutex::lock(v3);
    double v4 = ft::SiameseRpnSession::ComputeInstanceInputRect((ft::SiameseRpnSession *)((char *)self->_tracker.__ptr_ + 200));
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    std::recursive_mutex::unlock(v3);
  }
  else
  {
    double v4 = *MEMORY[0x263F001A0];
    double v6 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v10 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)_unsafeMeanFillAndScaleSourceBuffer:(__CVBuffer *)a3 destinationBuffer:(__CVBuffer *)a4 sourceRect:(CGRect)a5 meanPixel:(id)a6 scaler:
{
  unsigned int v7 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v14 = v6;
  size_t v15 = CVPixelBufferGetWidth(a3);
  size_t v16 = CVPixelBufferGetHeight(a3);
  size_t v17 = CVPixelBufferGetWidth(a3);
  v18 = (ft *)CVPixelBufferGetHeight(a3);
  double v19 = (float)v15;
  double v20 = x * v19;
  double v21 = (float)v16;
  double v22 = y * v21;
  double v23 = width * v19;
  double v24 = height * v21;
  double v25 = (double)v17;
  double v26 = (double)(unint64_t)v18;
  if (v20 >= 0.0) {
    double v27 = v20;
  }
  else {
    double v27 = 0.0;
  }
  if (v22 >= 0.0) {
    double v28 = v22;
  }
  else {
    double v28 = 0.0;
  }
  if (v20 + v23 <= v25) {
    double v25 = v20 + v23;
  }
  if (v22 + v24 <= v26) {
    double v26 = v22 + v24;
  }
  if (v25 <= v27) {
    double v29 = 0.0;
  }
  else {
    double v29 = v25 - v27;
  }
  if (v26 <= v28) {
    double v30 = 0.0;
  }
  else {
    double v30 = v26 - v28;
  }
  if (v29 <= 0.0 || v30 <= 0.0)
  {
    v38 = ft::GetOsLog(v18);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[FTCinematicHighPriorityTrackerState _unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:]();
    }

    BOOL v37 = 0;
  }
  else
  {
    CGAffineTransformMakeTranslation(&t1, -v20, -v22);
    size_t v31 = CVPixelBufferGetWidth(a4);
    size_t v32 = CVPixelBufferGetHeight(a4);
    CGAffineTransformMakeScale(&v40, (double)v31 / v23, (double)v32 / v24);
    CGAffineTransformConcat(&v42, &t1, &v40);
    v43.origin.double x = v27;
    v43.origin.double y = v28;
    v43.size.double width = v29;
    v43.size.double height = v30;
    CGRect v44 = CGRectApplyAffineTransform(v43, &v42);
    double v33 = v44.origin.x;
    double v34 = v44.origin.y;
    double v35 = v44.size.width;
    double v36 = v44.size.height;
    if (FTFillPixelBufferWithColor(a4, v7))
    {
      BOOL v37 = 0;
    }
    else
    {
      objc_msgSend(v14, "scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:", a3, a4, round(v27), round(v28), round(v29), round(v30), round(v33), round(v34), round(v35), round(v36));
      BOOL v37 = 1;
    }
  }

  return v37;
}

- (BOOL)preProcessExemplarInputFromSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 forTargetRect:(CGRect)a5 meanPixel:(id)a6 scaler:
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v15 = v6;
  size_t v16 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v16);
  -[FTCinematicHighPriorityTrackerState exemplarInputRoiForTargetRect:](self, "exemplarInputRoiForTargetRect:", x, y, width, height);
  LOBYTE(a6) = -[FTCinematicHighPriorityTrackerState _unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:](self, "_unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:", a3, a4, a6, v15);
  std::recursive_mutex::unlock(v16);

  return (char)a6;
}

- (BOOL)preProcessInstanceInputFromSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 meanPixel:(id)a5 scaler:
{
  id v10 = v5;
  double v11 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v11);
  [(FTCinematicHighPriorityTrackerState *)self instanceInputRoi];
  LOBYTE(a5) = -[FTCinematicHighPriorityTrackerState _unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:](self, "_unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:", a3, a4, a5, v10);
  std::recursive_mutex::unlock(v11);

  return (char)a5;
}

- (BOOL)_validatePostProcessingInvocation
{
  BOOL finalized = self->_finalized;
  if (self->_finalized)
  {
    uint64_t v3 = ft::GetOsLog((ft *)self);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[FTCinematicHighPriorityTrackerState _validatePostProcessingInvocation]();
    }

    return !finalized;
  }
  else
  {
    self->_BOOL finalized = 1;
    return !finalized;
  }
}

- (BOOL)_updateHighPriorityTrackWithRect:(Rect<double>)a3 confidence:(double)a4 isTapToTrack:(BOOL)a5
{
  ptr = self->_tracker.__ptr_;
  uint64_t v6 = *((void *)ptr + 19);
  unsigned int v7 = (std::__shared_weak_count *)*((void *)ptr + 20);
  uint64_t v38 = v6;
  v39 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v6)
  {
    *(double *)&long long v22 = a3.var0;
    *((void *)&v22 + 1) = *(void *)&a3.var1;
    double var2 = a3.var2;
    double var3 = a3.var3;
    if (a5)
    {
      uint64_t v25 = 912559;
      float v8 = a4;
      float v26 = v8;
      double v9 = self->_frame.__ptr_;
      uint64_t v10 = *((void *)v9 + 2);
      long long v27 = *(_OWORD *)v9;
      uint64_t v28 = v10;
      uint64_t v11 = MEMORY[0x263F01090];
    }
    else
    {
      uint64_t v25 = *(void *)(v6 + 88);
      float v13 = a4;
      float v26 = v13;
      double v9 = self->_frame.__ptr_;
      long long v14 = *(_OWORD *)v9;
      uint64_t v28 = *((void *)v9 + 2);
      long long v27 = v14;
      if (!*(unsigned char *)(v6 + 232))
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Track not yet initialized.");
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      uint64_t v11 = v6 + 124;
    }
    long long v29 = *(_OWORD *)v11;
    uint64_t v30 = *(void *)(v11 + 16);
    char v31 = 0;
    char v32 = 0;
    char v33 = 0;
    char v34 = 0;
    char v35 = 0;
    char v36 = 0;
    __asm { FMOV            V0.2S, #-1.0 }
    uint64_t v37 = _D0;
    ft::Track::Update(v6, (uint64_t)v9, &v22);
  }
  else
  {
    double v12 = ft::GetOsLog((ft *)self);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[FTCinematicHighPriorityTrackerState _updateHighPriorityTrackWithRect:confidence:isTapToTrack:]();
    }
  }
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  return v6 != 0;
}

- (BOOL)postProcessExemplarOutputs:(id)a3 forTargetRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  uint64_t v10 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v10);
  if (![(FTCinematicHighPriorityTrackerState *)self _validatePostProcessingInvocation])goto LABEL_11; {
  ptr = self->_tracker.__ptr_;
  }
  AsEspressoBufferMap((uint64_t)__p, v9);
  ft::SiameseRpnSession::PostProcessExemplarOutputs((ft::SiameseRpnSession *)((char *)ptr + 200), __p);
  double v12 = (void **)v18;
  if (v18)
  {
    do
    {
      id v15 = (void **)*v12;
      if (*((char *)v12 + 39) < 0) {
        operator delete(v12[2]);
      }
      operator delete(v12);
      double v12 = v15;
    }
    while (v15);
  }
  float v13 = __p[0];
  __p[0] = 0;
  if (v13) {
    operator delete(v13);
  }
  if (!self->_isTapToTrack
    || -[FTCinematicHighPriorityTrackerState _updateHighPriorityTrackWithRect:confidence:isTapToTrack:](self, "_updateHighPriorityTrackWithRect:confidence:isTapToTrack:", 1, x, y, width, height, 1.0))
  {
    BOOL v14 = 1;
  }
  else
  {
LABEL_11:
    BOOL v14 = 0;
  }
  std::recursive_mutex::unlock(v10);

  return v14;
}

- (BOOL)postProcessInstanceOutputs:(id)a3
{
  id v4 = a3;
  double v5 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v5);
  if (![(FTCinematicHighPriorityTrackerState *)self _validatePostProcessingInvocation])goto LABEL_8; {
  ptr = self->_tracker.__ptr_;
  }
  AsEspressoBufferMap((uint64_t)__p, v4);
  ft::SiameseRpnSession::PostProcessInstanceOutputs((unsigned __int8 **)ptr + 25, __p, (uint64_t)v14);
  unsigned int v7 = (void **)v13;
  if (v13)
  {
    do
    {
      uint64_t v10 = (void **)*v7;
      if (*((char *)v7 + 39) < 0) {
        operator delete(v7[2]);
      }
      operator delete(v7);
      unsigned int v7 = v10;
    }
    while (v10);
  }
  float v8 = __p[0];
  __p[0] = 0;
  if (v8) {
    operator delete(v8);
  }
  if (!v16)
  {
    ft::CinematicTracker::TerminateHighPriorityTrack((ft::CinematicTracker *)self->_tracker.__ptr_);
    goto LABEL_13;
  }
  if (-[FTCinematicHighPriorityTrackerState _updateHighPriorityTrackWithRect:confidence:isTapToTrack:](self, "_updateHighPriorityTrackWithRect:confidence:isTapToTrack:", self->_isTapToTrack, v14[0], v14[1], v14[2], v14[3], v15))
  {
LABEL_13:
    BOOL v9 = 1;
    goto LABEL_14;
  }
  ft::CinematicTracker::TerminateHighPriorityTrack((ft::CinematicTracker *)self->_tracker.__ptr_);
LABEL_8:
  BOOL v9 = 0;
LABEL_14:
  std::recursive_mutex::unlock(v5);

  return v9;
}

- (void)abort
{
  uint64_t v3 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v3);
  ft::CinematicTracker::TerminateHighPriorityTrack((ft::CinematicTracker *)self->_tracker.__ptr_);
  self->_BOOL finalized = 1;

  std::recursive_mutex::unlock(v3);
}

- (BOOL)completed
{
  return !self->_op || self->_finalized;
}

- (id)opDescription
{
  unint64_t op = self->_op;
  if (op > 3) {
    return @"Unknown";
  }
  else {
    return off_264294D38[op];
  }
}

- (NSMutableDictionary)sessionStorage
{
  return self->_sessionStorage;
}

- (void)setSessionStorage:(id)a3
{
}

- (void)setTargetRect:(CGRect)a3
{
  self->_targetRect = a3;
}

- (int64_t)op
{
  return self->_op;
}

- (void)setOp:(int64_t)a3
{
  self->_unint64_t op = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStorage, 0);
  cntrl = self->_frame.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    id v4 = self->_tracker.__cntrl_;
    if (!v4) {
      return;
    }
  }
  else
  {
    id v4 = self->_tracker.__cntrl_;
    if (!v4) {
      return;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void)_unsafeMeanFillAndScaleSourceBuffer:destinationBuffer:sourceRect:meanPixel:scaler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "Requested source rect is invalid.", v2, v3, v4, v5, v6);
}

- (void)_validatePostProcessingInvocation
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "Post processing invoked multiple times.", v2, v3, v4, v5, v6);
}

- (void)_updateHighPriorityTrackWithRect:confidence:isTapToTrack:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "Internal inconsistency: high priority track missing during tracking update.", v2, v3, v4, v5, v6);
}

@end