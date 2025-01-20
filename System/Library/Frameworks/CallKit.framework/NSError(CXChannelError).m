@interface NSError(CXChannelError)
+ (uint64_t)cx_channelErrorWithCode:()CXChannelError;
@end

@implementation NSError(CXChannelError)

+ (uint64_t)cx_channelErrorWithCode:()CXChannelError
{
  return [a1 errorWithDomain:@"com.apple.CallKit.error.channel" code:a3 userInfo:0];
}

@end