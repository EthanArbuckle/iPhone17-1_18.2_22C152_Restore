@interface NSKeyedArchiver(CATSecureCoding)
+ (uint64_t)cat_archivedDataWithRootObject:()CATSecureCoding;
+ (uint64_t)cat_archivedDataWithRootObject:()CATSecureCoding error:;
@end

@implementation NSKeyedArchiver(CATSecureCoding)

+ (uint64_t)cat_archivedDataWithRootObject:()CATSecureCoding
{
  return objc_msgSend(a1, "cat_archivedDataWithRootObject:error:", a3, 0);
}

+ (uint64_t)cat_archivedDataWithRootObject:()CATSecureCoding error:
{
  return [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

@end