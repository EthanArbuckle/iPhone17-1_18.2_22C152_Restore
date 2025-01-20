@interface _NSKVODeallocSentinel
+ (void)_havingRegistrationLockHeldAttachSentinelToObjectIfNeeded:(id)a3;
- (id)_initWithObservedObject:(id)a3;
- (void)dealloc;
@end

@implementation _NSKVODeallocSentinel

+ (void)_havingRegistrationLockHeldAttachSentinelToObjectIfNeeded:(id)a3
{
  Class = object_getClass(a3);
  if (_NSKVOUsesBaseClassObservationInfoImplementationForClass(Class))
  {
    v6 = (const void *)objc_opt_class();
    if (!objc_getAssociatedObject(a3, v6))
    {
      id value = (id)[objc_alloc((Class)a1) _initWithObservedObject:a3];
      v7 = (const void *)objc_opt_class();
      objc_setAssociatedObject(a3, v7, value, (void *)0x10001);
    }
  }
}

- (id)_initWithObservedObject:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)_NSKVODeallocSentinel;
  id result = [(_NSKVODeallocSentinel *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  _NSKeyValueRemoveObservationInfoForObject((uint64_t)self->_observedObject);
  v3.receiver = self;
  v3.super_class = (Class)_NSKVODeallocSentinel;
  [(_NSKVODeallocSentinel *)&v3 dealloc];
}

@end