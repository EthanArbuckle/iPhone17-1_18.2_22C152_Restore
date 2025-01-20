@interface NSKeyValueContainerClass
- (NSKeyValueContainerClass)initWithOriginalClass:(Class)a3;
- (id)description;
@end

@implementation NSKeyValueContainerClass

- (NSKeyValueContainerClass)initWithOriginalClass:(Class)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)NSKeyValueContainerClass;
  v4 = [(NSKeyValueContainerClass *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_originalClass = a3;
    v6 = sel_registerName("observationInfo");
    v5->_cachedObservationInfoImplementation = class_getMethodImplementation(a3, v6);
    originalClass = v5->_originalClass;
    v8 = sel_registerName("setObservationInfo:");
    InstanceMethod = class_getInstanceMethod(originalClass, v8);
    v5->_cachedSetObservationInfoImplementation = method_getImplementation(InstanceMethod);
    method_getArgumentType(InstanceMethod, 2u, &dst, 1uLL);
    if (dst == 64) {
      v5->_cachedSetObservationInfoTakesAnObject = 1;
    }
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  Class originalClass = self->_originalClass;
  notifyingInfo = self->_notifyingInfo;
  if (notifyingInfo) {
    uint64_t var1 = (uint64_t)notifyingInfo->var1;
  }
  else {
    uint64_t var1 = objc_opt_class();
  }
  return +[NSString stringWithFormat:@"<%@: Original class: %@, Notifying class: %@>", v3, originalClass, var1];
}

@end