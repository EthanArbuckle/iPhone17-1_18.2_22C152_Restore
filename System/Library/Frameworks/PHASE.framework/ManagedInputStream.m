@interface ManagedInputStream
- (BOOL)canRecord;
- (BOOL)isFading;
- (BOOL)isMuted;
- (BOOL)isStreamPaused;
- (BOOL)shouldResumeWithSession;
- (ManagedInputStream)initWithPaused:(BOOL)a3 attributedTo:(id)a4 definition:(id)a5 canRecord:(BOOL)a6 fader:(shared_ptr<caulk:(id)a8 :synchronized<Phase::Controller::ExternalStreamFader>>)a7 pauseStateDidUpdateCallback:;
- (NSUUID)attributedClientID;
- (PHASEExternalInputStreamDefinition)definition;
- (id).cxx_construct;
- (id)pauseStateDidUpdateCallback;
- (shared_ptr<caulk::synchronized<Phase::Controller::ExternalStreamFader>>)fader;
- (void)setAttributedClientID:(id)a3;
- (void)setCanRecord:(BOOL)a3;
- (void)setDefinition:(id)a3;
- (void)setFader:(shared_ptr<caulk::synchronized<Phase::Controller::ExternalStreamFader>>)a3;
- (void)setIsFading:(BOOL)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setPauseStateDidUpdateCallback:(id)a3;
- (void)setShouldResumeWithSession:(BOOL)a3;
- (void)setStreamPaused:(BOOL)a3;
@end

@implementation ManagedInputStream

- (ManagedInputStream)initWithPaused:(BOOL)a3 attributedTo:(id)a4 definition:(id)a5 canRecord:(BOOL)a6 fader:(shared_ptr<caulk:(id)a8 :synchronized<Phase::Controller::ExternalStreamFader>>)a7 pauseStateDidUpdateCallback:
{
  cntrl = a7.__cntrl_;
  ptr = (void **)a7.__ptr_;
  id v15 = a4;
  id v16 = a5;
  v17 = cntrl;
  v26.receiver = self;
  v26.super_class = (Class)ManagedInputStream;
  v18 = [(ManagedInputStream *)&v26 init];
  v19 = v18;
  if (v18)
  {
    v18->_streamPaused = a3;
    objc_storeStrong((id *)&v18->_definition, a5);
    objc_storeStrong((id *)&v19->_attributedClientID, a4);
    v19->_canRecord = a6;
    v19->_isMuted = 0;
    v21 = *ptr;
    v20 = (atomic_ullong *)ptr[1];
    if (v20) {
      atomic_fetch_add_explicit(v20 + 1, 1uLL, memory_order_relaxed);
    }
    v22 = (std::__shared_weak_count *)v19->_fader.__cntrl_;
    v19->_fader.__ptr_ = v21;
    v19->_fader.__cntrl_ = (__shared_weak_count *)v20;
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    v19->_isFading = 0;
    v23 = _Block_copy(v17);
    id pauseStateDidUpdateCallback = v19->_pauseStateDidUpdateCallback;
    v19->_id pauseStateDidUpdateCallback = v23;
  }
  return v19;
}

- (BOOL)isStreamPaused
{
  return self->_streamPaused;
}

- (void)setStreamPaused:(BOOL)a3
{
  self->_streamPaused = a3;
}

- (PHASEExternalInputStreamDefinition)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
}

- (NSUUID)attributedClientID
{
  return self->_attributedClientID;
}

- (void)setAttributedClientID:(id)a3
{
}

- (BOOL)canRecord
{
  return self->_canRecord;
}

- (void)setCanRecord:(BOOL)a3
{
  self->_canRecord = a3;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setIsMuted:(BOOL)a3
{
  self->_isMuted = a3;
}

- (shared_ptr<caulk::synchronized<Phase::Controller::ExternalStreamFader>>)fader
{
  cntrl = self->_fader.__cntrl_;
  *v2 = self->_fader.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setFader:(shared_ptr<caulk::synchronized<Phase::Controller::ExternalStreamFader>>)a3
{
  v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_fader.__cntrl_;
  self->_fader.__ptr_ = v4;
  self->_fader.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (BOOL)isFading
{
  return self->_isFading;
}

- (void)setIsFading:(BOOL)a3
{
  self->_isFading = a3;
}

- (BOOL)shouldResumeWithSession
{
  return self->_shouldResumeWithSession;
}

- (void)setShouldResumeWithSession:(BOOL)a3
{
  self->_shouldResumeWithSession = a3;
}

- (id)pauseStateDidUpdateCallback
{
  return self->_pauseStateDidUpdateCallback;
}

- (void)setPauseStateDidUpdateCallback:(id)a3
{
}

- (void).cxx_destruct
{
  cntrl = self->_fader.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong(&self->_pauseStateDidUpdateCallback, 0);
  objc_storeStrong((id *)&self->_attributedClientID, 0);

  objc_storeStrong((id *)&self->_definition, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end