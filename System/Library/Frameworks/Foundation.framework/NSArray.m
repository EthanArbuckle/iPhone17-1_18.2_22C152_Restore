@interface NSArray
@end

@implementation NSArray

IMP __36__NSArray_NSArray__encodeWithCoder___block_invoke(uint64_t a1)
{
  _MergedGlobals_90 = (uint64_t)class_getMethodImplementation((Class)NSKeyedArchiver, *(SEL *)(a1 + 32));
  IMP result = class_getMethodImplementation((Class)NSXPCEncoder, *(SEL *)(a1 + 32));
  qword_1EB1ED138 = (uint64_t)result;
  return result;
}

@end