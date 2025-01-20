@interface CDMXPCDefines
+ (id)machServiceName;
- (CDMXPCDefines)init;
@end

@implementation CDMXPCDefines

+ (id)machServiceName
{
  sub_2263BCB20();
  v2 = (void *)sub_2265FB070();
  swift_bridgeObjectRelease();
  return v2;
}

- (CDMXPCDefines)init
{
  return (CDMXPCDefines *)sub_2263BCB3C();
}

@end