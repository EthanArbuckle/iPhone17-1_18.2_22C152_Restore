@interface _DOCNavigationButtonAXIdentifier
+ (NSString)backInHistory;
+ (NSString)forwardInHistory;
+ (NSString)historyMenuPrefix;
+ (id)idBase;
@end

@implementation _DOCNavigationButtonAXIdentifier

+ (id)idBase
{
  return @"DOC.navBarButton";
}

+ (NSString)backInHistory
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"backInHistory");

  return (NSString *)v3;
}

+ (NSString)forwardInHistory
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"forwardInHistory");

  return (NSString *)v3;
}

+ (NSString)historyMenuPrefix
{
  return (NSString *)@"DOC.historyMenuItem";
}

@end