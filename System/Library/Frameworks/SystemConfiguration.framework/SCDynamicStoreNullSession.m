@interface SCDynamicStoreNullSession
@end

@implementation SCDynamicStoreNullSession

SCDynamicStoreRef ____SCDynamicStoreNullSession_block_invoke()
{
  SCDynamicStoreRef result = SCDynamicStoreCreateWithOptions(0, @"null", 0, 0, 0);
  S_null_session = (uint64_t)result;
  return result;
}

@end