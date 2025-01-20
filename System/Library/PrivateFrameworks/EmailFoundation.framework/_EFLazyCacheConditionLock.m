@interface _EFLazyCacheConditionLock
- (_EFLazyCacheConditionLock)initWithCondition:(int64_t)a3;
- (int64_t)waiterCount;
- (void)decrementWaiterCount;
- (void)incrementWaiterCount;
@end

@implementation _EFLazyCacheConditionLock

- (_EFLazyCacheConditionLock)initWithCondition:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_EFLazyCacheConditionLock;
  result = [(NSConditionLock *)&v4 initWithCondition:a3];
  if (result) {
    atomic_store(0, (unint64_t *)&result->_waiterCount);
  }
  return result;
}

- (int64_t)waiterCount
{
  return atomic_load((unint64_t *)&self->_waiterCount);
}

- (void)incrementWaiterCount
{
}

- (void)decrementWaiterCount
{
}

@end