@interface CFNIsRunningInXcode
@end

@implementation CFNIsRunningInXcode

const char *____CFNIsRunningInXcode_block_invoke()
{
  result = getenv("NSUnbufferedIO");
  if (result)
  {
    result = (const char *)strcmp(result, "YES");
    if (!result) {
      __CFNIsRunningInXcode::runningInXcode = 1;
    }
  }
  return result;
}

@end