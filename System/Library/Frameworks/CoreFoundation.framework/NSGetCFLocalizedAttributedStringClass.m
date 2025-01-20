@interface NSGetCFLocalizedAttributedStringClass
@end

@implementation NSGetCFLocalizedAttributedStringClass

Class ____NSGetCFLocalizedAttributedStringClass_block_invoke()
{
  Class result = objc_lookUpClass("__NSCFLocalizedAttributedString");
  __NSCFLocalizedAttributedStringClass = (uint64_t)result;
  return result;
}

@end