@interface NSObject(WFTyping)
- (WFObjectType)wfType;
@end

@implementation NSObject(WFTyping)

- (WFObjectType)wfType
{
  uint64_t v0 = objc_opt_class();
  return +[WFObjectType typeWithClass:v0];
}

@end