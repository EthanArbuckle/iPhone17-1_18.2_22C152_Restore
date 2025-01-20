@interface TMSDKUserAgent
+ (id)userAgentHeaderString;
@end

@implementation TMSDKUserAgent

+ (id)userAgentHeaderString
{
  return (id)[@"TMTumblrSDK" stringByAppendingPathComponent:@"2.0.2"];
}

@end