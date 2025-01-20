@interface NSKeyValueUndefinedSetter
- (NSKeyValueUndefinedSetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5;
@end

@implementation NSKeyValueUndefinedSetter

- (NSKeyValueUndefinedSetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  InstanceMethod = class_getInstanceMethod(a5, sel_setValue_forUndefinedKey_);
  IMP Implementation = method_getImplementation(InstanceMethod);
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey(a5, a4)) {
    return -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:](&v13, sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_, a3, a4, _NSSetValueAndNotifyForUndefinedKey, sel_setValue_forUndefinedKey_, &v14, 2, v12.receiver, v12.super_class, self, NSKeyValueUndefinedSetter, a4, Implementation, 0, v15);
  }
  else {
    return -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:](&v12, sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_, a3, a4, Implementation, sel_setValue_forUndefinedKey_, &v14, 1, self, NSKeyValueUndefinedSetter, v13.receiver, v13.super_class, a4, 0, 0, v15);
  }
}

@end