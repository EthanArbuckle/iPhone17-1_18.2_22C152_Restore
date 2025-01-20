@interface CKCoalescer
- (CKCoalescer)initWithActivityDelay:(unint64_t)a3 maxActivityDelay:(unint64_t)a4 coalescingInterval:(unint64_t)a5 processingDelay:(unint64_t)a6 notifyBlock:(id)a7;
- (CKCoalescer)initWithNotifyBlock:(id)a3;
- (CKCoalescer)initWithNotifyFrequency:(unint64_t)a3 notifyBlock:(id)a4;
- (id)notifyBlock;
- (unint64_t)activityDelay;
- (unint64_t)coalescingInterval;
- (unint64_t)maxActivityDelay;
- (unint64_t)processingDelay;
- (void)coalesce:(id)a3;
- (void)dealloc;
- (void)delayPostBy:(unint64_t)a3;
- (void)finish:(id)a3;
- (void)mutate:(id)a3;
- (void)postFinishedNotice;
- (void)postNotice;
- (void)processingComplete;
- (void)setActivityDelay:(unint64_t)a3;
- (void)setCoalescingInterval:(unint64_t)a3;
- (void)setMaxActivityDelay:(unint64_t)a3;
- (void)setProcessingDelay:(unint64_t)a3;
@end

@implementation CKCoalescer

- (void)coalesce:(id)a3
{
  v26 = (void (**)(void))a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_finished)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    v11 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v9, v12, v10, @"%@ called on an already finished coalescer. Ignored.", v11);

    goto LABEL_20;
  }
  if (v26) {
    v26[2](v26);
  }
  uint64_t v13 = objc_msgSend_activityDelay(self, v6, v7, v8);
  uint64_t v17 = objc_msgSend_maxActivityDelay(self, v14, v15, v16);
  unint64_t v20 = v17;
  unint64_t coalesceStart = self->_coalesceStart;
  if (!coalesceStart || v17)
  {
    __uint64_t v22 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    if (!coalesceStart) {
      self->_unint64_t coalesceStart = v22;
    }
    if (v13 && v20)
    {
      __uint64_t v23 = v22 - self->_coalesceStart;
      if (v23 + v13 <= v20) {
        goto LABEL_17;
      }
      BOOL v24 = v20 >= v23;
      uint64_t v25 = v20 - v23;
      if (v24) {
        uint64_t v13 = v25;
      }
      else {
        uint64_t v13 = 0;
      }
    }
  }
  if (!coalesceStart || v13)
  {
LABEL_17:
    objc_msgSend_delayPostBy_(self, v18, v13, v19);
    if (!coalesceStart) {
      dispatch_resume((dispatch_object_t)self->_fireTimer);
    }
  }
  ++self->_eventCount;
LABEL_20:
  pthread_mutex_unlock(p_lock);
}

- (unint64_t)maxActivityDelay
{
  return self->_maxActivityDelay;
}

- (void)delayPostBy:(unint64_t)a3
{
  __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  unint64_t coalesceStart = self->_coalesceStart;
  if (coalesceStart) {
    __uint64_t v7 = v5 - coalesceStart;
  }
  else {
    __uint64_t v7 = 0;
  }
  unint64_t v8 = v7 + a3;
  if (v7 + a3 > self->_fireDelay)
  {
    fireTimer = self->_fireTimer;
    dispatch_time_t v10 = dispatch_time(0, a3);
    dispatch_source_set_timer(fireTimer, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    self->_fireDelay = v8;
  }
}

- (unint64_t)activityDelay
{
  return self->_activityDelay;
}

- (CKCoalescer)initWithNotifyBlock:(id)a3
{
  return (CKCoalescer *)MEMORY[0x1F4181798](self, sel_initWithActivityDelay_maxActivityDelay_coalescingInterval_processingDelay_notifyBlock_, 0, 0);
}

- (CKCoalescer)initWithNotifyFrequency:(unint64_t)a3 notifyBlock:(id)a4
{
  return (CKCoalescer *)MEMORY[0x1F4181798](self, sel_initWithActivityDelay_maxActivityDelay_coalescingInterval_processingDelay_notifyBlock_, (0x3B9ACA00 / a3) >> 2, 0x3B9ACA00 / a3);
}

- (CKCoalescer)initWithActivityDelay:(unint64_t)a3 maxActivityDelay:(unint64_t)a4 coalescingInterval:(unint64_t)a5 processingDelay:(unint64_t)a6 notifyBlock:(id)a7
{
  id v12 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CKCoalescer;
  uint64_t v13 = [(CKCoalescer *)&v25 init];
  v14 = v13;
  if (v13)
  {
    pthread_mutex_init(&v13->_lock, 0);
    uint64_t v15 = _Block_copy(v12);
    id notifyBlock = v14->_notifyBlock;
    v14->_id notifyBlock = v15;

    v14->_activityDelay = a3;
    v14->_maxActivityDelay = a4;
    v14->_coalescingInterval = a5;
    v14->_processingDelay = a6;
    uint64_t v17 = dispatch_get_global_queue(17, 0);
    dispatch_source_t v18 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v17);
    fireTimer = v14->_fireTimer;
    v14->_fireTimer = (OS_dispatch_source *)v18;

    objc_initWeak(&location, v14);
    unint64_t v20 = v14->_fireTimer;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_18B12423C;
    v22[3] = &unk_1E54610B0;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v20, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (void)dealloc
{
  if (self->_delegateProcessingInProgress) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"CKCoalescer deallocated while delegate processing in progress. (Did the delegate invoke the processingComplete block?)");
  }
  dispatch_source_cancel((dispatch_source_t)self->_fireTimer);
  if (!self->_coalesceStart) {
    dispatch_resume((dispatch_object_t)self->_fireTimer);
  }
  v3.receiver = self;
  v3.super_class = (Class)CKCoalescer;
  [(CKCoalescer *)&v3 dealloc];
}

- (void)postFinishedNotice
{
  objc_super v3 = _Block_copy(self->_notifyBlock);
  if (v3)
  {
    v4 = dispatch_get_global_queue(17, 0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_18B1243C4;
    v5[3] = &unk_1E5460058;
    v5[4] = self;
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

- (void)processingComplete
{
  objc_super v3 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B1244BC;
  block[3] = &unk_1E5460350;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)postNotice
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (!self->_finished)
  {
    __uint64_t v4 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    unint64_t fireDelay = self->_fireDelay;
    __uint64_t v6 = v4 - self->_coalesceStart;
    if (fireDelay <= v6)
    {
      self->_unint64_t coalesceStart = 0;
      self->_unint64_t fireDelay = 0;
      dispatch_suspend((dispatch_object_t)self->_fireTimer);
      uint64_t v12 = objc_msgSend_coalescingInterval(self, v9, v10, v11);
      if (v12) {
        objc_msgSend_delayPostBy_(self, v13, v12, v14);
      }
      dispatch_suspend((dispatch_object_t)self->_fireTimer);
      self->_delegateProcessingInProgress = 1;
      id notifyBlock = self->_notifyBlock;
      if (notifyBlock)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = sub_18B124664;
        v19[3] = &unk_1E5460350;
        v19[4] = self;
        (*((void (**)(id, void, void *))notifyBlock + 2))(notifyBlock, 0, v19);
      }
      else
      {
        objc_msgSend_processingComplete(self, v15, v16, v17);
      }
    }
    else
    {
      fireTimer = self->_fireTimer;
      dispatch_time_t v8 = dispatch_time(0, fireDelay - v6);
      dispatch_source_set_timer(fireTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  pthread_mutex_unlock(p_lock);
}

- (void)mutate:(id)a3
{
  __uint64_t v5 = (void (**)(void))a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(p_lock);
  if (v5) {
    v5[2]();
  }
  pthread_mutex_unlock(p_lock);
}

- (void)finish:(id)a3
{
  __uint64_t v4 = (void (**)(void))a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_finished)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v9 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_fault_impl(&dword_18AF10000, v9, OS_LOG_TYPE_FAULT, "-finish: called on an already finished coalescer. Ignored.", v11, 2u);
    }
  }
  else
  {
    if (v4) {
      v4[2](v4);
    }
    self->_finished = 1;
    if (!self->_delegateProcessingInProgress) {
      objc_msgSend_postFinishedNotice(self, v6, v7, v8);
    }
    id notifyBlock = self->_notifyBlock;
    self->_id notifyBlock = 0;
  }
  pthread_mutex_unlock(p_lock);
}

- (void)setActivityDelay:(unint64_t)a3
{
  self->_activityDelay = a3;
}

- (void)setMaxActivityDelay:(unint64_t)a3
{
  self->_maxActivityDelay = a3;
}

- (unint64_t)coalescingInterval
{
  return self->_coalescingInterval;
}

- (void)setCoalescingInterval:(unint64_t)a3
{
  self->_coalescingInterval = a3;
}

- (unint64_t)processingDelay
{
  return self->_processingDelay;
}

- (void)setProcessingDelay:(unint64_t)a3
{
  self->_processingDelay = a3;
}

- (id)notifyBlock
{
  return self->_notifyBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyBlock, 0);

  objc_storeStrong((id *)&self->_fireTimer, 0);
}

@end