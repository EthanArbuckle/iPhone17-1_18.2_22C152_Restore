@interface NSDictionary(JSON)
+ (id)dictionaryWithJSONString:()JSON;
@end

@implementation NSDictionary(JSON)

+ (id)dictionaryWithJSONString:()JSON
{
  v0 = objc_msgSend(MEMORY[0x263F8C6D0], "objectWithJSONString:");
  v1 = [NSDictionary typecast:v0];

  return v1;
}

@end