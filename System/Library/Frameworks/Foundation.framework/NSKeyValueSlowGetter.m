@interface NSKeyValueSlowGetter
- (NSKeyValueSlowGetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5;
@end

@implementation NSKeyValueSlowGetter

- (NSKeyValueSlowGetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5
{
  v12[3] = *MEMORY[0x1E4F143B8];
  InstanceMethod = class_getInstanceMethod(a5, sel_valueForKey_);
  IMP Implementation = method_getImplementation(InstanceMethod);
  v12[1] = 0;
  v12[2] = 0;
  v11.receiver = self;
  v11.super_class = (Class)NSKeyValueSlowGetter;
  v12[0] = a4;
  return [(NSKeyValueAccessor *)&v11 initWithContainerClassID:a3 key:a4 implementation:Implementation selector:sel_valueForKey_ extraArguments:v12 count:1];
}

@end