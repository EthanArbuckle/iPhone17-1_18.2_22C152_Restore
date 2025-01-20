@interface NSURLCacheInternal
- (void)dealloc;
@end

@implementation NSURLCacheInternal

- (void)dealloc
{
  cacheRef = self->_cacheRef;
  if (cacheRef)
  {
    uint64_t v5 = *((void *)cacheRef + 2);
    v4 = (std::__shared_weak_count *)*((void *)cacheRef + 3);
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    pthread_mutex_lock((pthread_mutex_t *)(v5 + 56));
    *(unsigned char *)(v5 + 40) = 1;
    CFRelease(self->_cacheRef);
    pthread_mutex_unlock((pthread_mutex_t *)(v5 + 56));
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v4);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)NSURLCacheInternal;
  [(NSURLCacheInternal *)&v6 dealloc];
}

@end