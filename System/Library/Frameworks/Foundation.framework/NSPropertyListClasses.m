@interface NSPropertyListClasses
@end

@implementation NSPropertyListClasses

uint64_t ____NSPropertyListClasses_ForArchival_ErrorAndException_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  _MergedGlobals_116 = result;
  return result;
}

@end