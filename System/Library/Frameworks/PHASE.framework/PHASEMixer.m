@interface PHASEMixer
+ (PHASEMixer)new;
- (NSString)identifier;
- (NSString)uid;
- (PHASEMetaParameter)gainMetaParameter;
- (PHASEMixer)init;
- (PHASEMixer)initWithIdentifier:(id)a3;
- (double)gain;
- (id).cxx_construct;
- (void)setUid:(id)a3;
- (void)setWeakActionTreeObject:(weak_ptr<Phase::ActionTreeObject>)a3;
- (weak_ptr<Phase::ActionTreeObject>)weakActionTreeObject;
@end

@implementation PHASEMixer

- (PHASEMixer)init
{
  return 0;
}

+ (PHASEMixer)new
{
  return 0;
}

- (NSString)uid
{
  return self->_identifier;
}

- (void)setUid:(id)a3
{
}

- (PHASEMixer)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHASEMixer;
  v6 = [(PHASEMixer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    gainMetaParameter = v6->_gainMetaParameter;
    v6->_gain = 1.0;
    v6->_gainMetaParameter = 0;

    objc_storeStrong((id *)&v7->_identifier, a3);
    v9 = v7;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)gain
{
  return self->_gain;
}

- (PHASEMetaParameter)gainMetaParameter
{
  return self->_gainMetaParameter;
}

- (weak_ptr<Phase::ActionTreeObject>)weakActionTreeObject
{
  cntrl = self->_weakActionTreeObject.__cntrl_;
  *v2 = self->_weakActionTreeObject.__ptr_;
  v2[1] = (ActionTreeObject *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ActionTreeObject *)self;
  return result;
}

- (void)setWeakActionTreeObject:(weak_ptr<Phase::ActionTreeObject>)a3
{
  v4 = *(ActionTreeObject **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_weakActionTreeObject.__cntrl_;
  self->_weakActionTreeObject.__ptr_ = v4;
  self->_weakActionTreeObject.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void).cxx_destruct
{
  cntrl = self->_weakActionTreeObject.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_gainMetaParameter, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end