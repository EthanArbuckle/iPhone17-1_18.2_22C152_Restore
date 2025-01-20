@interface DYDisplayLinkInterposer
- (DYDisplayLinkInterposer)initWithTarget:(id)a3 selector:(SEL)a4;
- (void)dealloc;
- (void)forwardDisplayLinkCallback:(id)a3;
@end

@implementation DYDisplayLinkInterposer

- (DYDisplayLinkInterposer)initWithTarget:(id)a3 selector:(SEL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)DYDisplayLinkInterposer;
  v6 = [(DYDisplayLinkInterposer *)&v11 init];
  if (v6)
  {
    v6->_target = a3;
    if (a4) {
      SEL v8 = a4;
    }
    else {
      SEL v8 = 0;
    }
    v6->_sel = v8;
    GPUTools::DYLockUtils::Lock((os_unfair_lock_t)&sDisplayLinkIdleTimeLock, v7);
    if (!spDisplayLinkIdleTime) {
      operator new();
    }
    GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdleTimeLock, v9);
  }
  return v6;
}

- (void)forwardDisplayLinkCallback:(id)a3
{
  if (self->_endTimestamp)
  {
    GPUTools::DYLockUtils::Lock((os_unfair_lock_t)&sDisplayLinkIdleTimeLock, (volatile int *)a2);
    uint64_t v5 = mach_absolute_time() - self->_endTimestamp;
    if (g_DYTimebaseInfo != dword_269A2916C) {
      uint64_t v5 = __udivti3();
    }
    uint64_t v6 = spDisplayLinkIdleTime;
    pthread_t v11 = pthread_self();
    v12 = &v11;
    v7 = std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,unsigned long long>>>::__emplace_unique_key_args<_opaque_pthread_t *,std::piecewise_construct_t const&,std::tuple<_opaque_pthread_t *&&>,std::tuple<>>(v6, &v11, (uint64_t)&std::piecewise_construct, &v12);
    v7[3] += v5;
    GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdleTimeLock, v8);
  }
  sel = self->_sel;
  id target = self->_target;
  if (sel) {
    objc_msgSend(target, sel, a3);
  }
  else {
    objc_msgSend(target, 0, a3);
  }
  self->_endTimestamp = mach_absolute_time();
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYDisplayLinkInterposer;
  [(DYDisplayLinkInterposer *)&v3 dealloc];
}

@end