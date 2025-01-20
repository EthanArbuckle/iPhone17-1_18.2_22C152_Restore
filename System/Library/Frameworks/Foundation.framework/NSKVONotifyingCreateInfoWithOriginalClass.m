@interface NSKVONotifyingCreateInfoWithOriginalClass
@end

@implementation NSKVONotifyingCreateInfoWithOriginalClass

IMP ___NSKVONotifyingCreateInfoWithOriginalClass_block_invoke_16()
{
  v0 = (objc_class *)objc_opt_class();
  qword_1EB1ED2B8 = (uint64_t)class_getMethodImplementation(v0, sel_willChangeValueForKey_);
  v1 = (objc_class *)objc_opt_class();
  IMP result = class_getMethodImplementation(v1, sel_didChangeValueForKey_);
  qword_1EB1ED2C0 = (uint64_t)result;
  return result;
}

os_log_t ___NSKVONotifyingCreateInfoWithOriginalClass_block_invoke()
{
  os_log_t result = os_log_create("com.apple.foundation.kvo", "general");
  qword_1EB1ED2A0 = (uint64_t)result;
  return result;
}

@end