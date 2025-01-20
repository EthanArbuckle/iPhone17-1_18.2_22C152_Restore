@interface NSValue(LPExtras)
+ (uint64_t)_lp_valueWithCGRect:()LPExtras;
+ (uint64_t)_lp_valueWithCGSize:()LPExtras;
@end

@implementation NSValue(LPExtras)

+ (uint64_t)_lp_valueWithCGRect:()LPExtras
{
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
}

+ (uint64_t)_lp_valueWithCGSize:()LPExtras
{
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
}

@end