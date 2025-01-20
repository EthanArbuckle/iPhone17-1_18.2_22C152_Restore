@interface NSKeyValueSharedObservers
- (NSKeyValueSharedObservers)initWithObservableClass:(Class)a3;
- (id)snapshot;
- (void)addSharedObserver:(id)a3 forKey:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)dealloc;
@end

@implementation NSKeyValueSharedObservers

- (NSKeyValueSharedObservers)initWithObservableClass:(Class)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSKeyValueSharedObservers;
  result = [(NSKeyValueSharedObservers *)&v5 init];
  if (result)
  {
    result->_observableClass = a3;
    result->_currentClass = a3;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueSharedObservers;
  [(NSKeyValueSharedObservers *)&v3 dealloc];
}

- (void)addSharedObserver:(id)a3 forKey:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  v15[1] = *MEMORY[0x1E4F143B8];

  self->_snapshot = 0;
  os_unfair_recursive_lock_lock_with_options();
  v11 = (NSKeyValueProperty *)NSKeyValuePropertyForIsaAndKeyPath(self->_currentClass, a4);
  currentObservationInfo = self->_currentObservationInfo;
  v15[0] = 0;
  char v14 = 0;
  self->_currentObservationInfo = (NSKeyValueObservationInfo *)_NSKeyValueObservationInfoCreateByAdding(currentObservationInfo, a3, v11, a5, a6, 0, &v14, v15);

  v13 = [(NSKeyValueProperty *)v11 isaForAutonotifying];
  if (v13) {
    self->_currentClass = v13;
  }
  os_unfair_recursive_lock_unlock();
}

- (id)snapshot
{
  snapshot = self->_snapshot;
  if (!snapshot)
  {
    snapshot = [[NSKeyValueSharedObserversSnapshot alloc] _initWithObservationInfo:self->_currentObservationInfo andNotifyingISA:self->_currentClass forObjectOfClass:self->_observableClass];
    self->_snapshot = snapshot;
  }
  uint64_t v4 = snapshot;

  return v4;
}

@end