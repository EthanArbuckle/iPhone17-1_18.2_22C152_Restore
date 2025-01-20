@interface IsWorkingInDictionaryApp
@end

@implementation IsWorkingInDictionaryApp

__CFBundle *__IsWorkingInDictionaryApp_block_invoke()
{
  result = CFBundleGetMainBundle();
  if (result)
  {
    result = (__CFBundle *)CFBundleGetIdentifier(result);
    if (result)
    {
      result = (__CFBundle *)CFStringCompare((CFStringRef)result, @"com.apple.Dictionary", 0);
      BOOL v1 = result == 0;
    }
    else
    {
      BOOL v1 = 0;
    }
    IsWorkingInDictionaryApp__Flag = v1;
  }
  return result;
}

@end