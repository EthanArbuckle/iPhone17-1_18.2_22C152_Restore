@interface _DKProcessContext
+ (BOOL)isRunningInUserContext;
@end

@implementation _DKProcessContext

+ (BOOL)isRunningInUserContext
{
  if (isRunningInUserContext_onceToken != -1) {
    dispatch_once(&isRunningInUserContext_onceToken, &__block_literal_global_5);
  }
  return isRunningInUserContext_userContext;
}

@end