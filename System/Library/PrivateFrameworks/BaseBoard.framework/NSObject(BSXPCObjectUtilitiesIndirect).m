@interface NSObject(BSXPCObjectUtilitiesIndirect)
+ (uint64_t)bs_isXPCObject;
@end

@implementation NSObject(BSXPCObjectUtilitiesIndirect)

+ (uint64_t)bs_isXPCObject
{
  id v2 = BSXPCObjectBaseClass();
  return [a1 isSubclassOfClass:v2];
}

@end