@interface CUILog
@end

@implementation CUILog

BOOL ___CUILog_block_invoke()
{
  BOOL result = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"CUIShowDebugLogs"];
  _CUILog___showDebugLogs = result;
  return result;
}

@end