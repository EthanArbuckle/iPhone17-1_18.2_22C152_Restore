@interface NSKVOUsesBaseClassObservationInfoImplementationForClass
@end

@implementation NSKVOUsesBaseClassObservationInfoImplementationForClass

IMP ___NSKVOUsesBaseClassObservationInfoImplementationForClass_block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  _MergedGlobals_101 = (uint64_t)class_getMethodImplementation(v0, sel_observationInfo);
  v1 = (objc_class *)objc_opt_class();
  IMP result = class_getMethodImplementation(v1, sel_setObservationInfo_);
  qword_1EB1ED290 = (uint64_t)result;
  return result;
}

@end