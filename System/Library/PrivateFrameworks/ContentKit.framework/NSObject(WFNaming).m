@interface NSObject(WFNaming)
- (id)wfName;
@end

@implementation NSObject(WFNaming)

- (id)wfName
{
  v2 = +[WFObjectNameProvider sharedProvider];
  v3 = [v2 nameForObject:a1];

  return v3;
}

@end