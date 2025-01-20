@interface CUIDebugAllowDebugging
@end

@implementation CUIDebugAllowDebugging

BOOL ____CUIDebugAllowDebugging_block_invoke()
{
  BOOL result = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"CUIAllowDebugPrefs"];
  __CUIDebugAllowDebugging___AllowDebugPrefs = result;
  return result;
}

@end