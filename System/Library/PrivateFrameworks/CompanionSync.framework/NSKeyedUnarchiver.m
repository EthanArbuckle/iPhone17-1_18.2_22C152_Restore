@interface NSKeyedUnarchiver
@end

@implementation NSKeyedUnarchiver

uint64_t __55__NSKeyedUnarchiver_SYAdditions__sy_whitelistedClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  uint64_t v7 = sy_whitelistedClasses_supportedClasses;
  sy_whitelistedClasses_supportedClasses = v6;
  return MEMORY[0x270F9A758](v6, v7);
}

@end