@interface _DOCViewStyleSelectorAXIdentifier
+ (NSString)column;
+ (NSString)grid;
+ (NSString)list;
+ (id)idBase;
@end

@implementation _DOCViewStyleSelectorAXIdentifier

+ (id)idBase
{
  return @"DOC.viewStyleSelector";
}

+ (NSString)grid
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"grid");

  return (NSString *)v3;
}

+ (NSString)list
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"list");

  return (NSString *)v3;
}

+ (NSString)column
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"column");

  return (NSString *)v3;
}

@end