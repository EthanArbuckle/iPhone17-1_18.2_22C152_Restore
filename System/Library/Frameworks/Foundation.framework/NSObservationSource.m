@interface NSObservationSource
- (void)_observerStorageOfSize:(unint64_t)a3;
- (void)dealloc;
@end

@implementation NSObservationSource

- (void)_observerStorageOfSize:(unint64_t)a3
{
  if (a3 != 32) {
    __assert_rtn("-[NSObservationSource _observerStorageOfSize:]", "NSObservationTransformers.m", 21, "sz == 4 * sizeof(id)");
  }
  return self->_observers;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NSObservationSource *)self _destroyObserverList];
  v3.receiver = self;
  v3.super_class = (Class)NSObservationSource;
  [(NSObservationSource *)&v3 dealloc];
}

@end