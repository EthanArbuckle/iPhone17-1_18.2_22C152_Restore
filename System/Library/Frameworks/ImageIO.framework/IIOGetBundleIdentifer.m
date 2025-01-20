@interface IIOGetBundleIdentifer
@end

@implementation IIOGetBundleIdentifer

__CFBundle *__IIOGetBundleIdentifer_block_invoke()
{
  result = CFBundleGetMainBundle();
  IIOGetBundleIdentifer::gMainBundle = (uint64_t)result;
  if (result)
  {
    result = (__CFBundle *)CFBundleGetIdentifier(result);
    IIOGetBundleIdentifer::gBundleIdentifer = (uint64_t)result;
  }
  return result;
}

@end