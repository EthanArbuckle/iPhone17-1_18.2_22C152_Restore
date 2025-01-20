@interface NSArray(JSON)
+ (id)arrayWithJSONString:()JSON;
@end

@implementation NSArray(JSON)

+ (id)arrayWithJSONString:()JSON
{
  v0 = objc_msgSend(MEMORY[0x263F8C6D0], "objectWithJSONString:");
  v1 = [MEMORY[0x263EFF8C0] typecast:v0];

  return v1;
}

@end