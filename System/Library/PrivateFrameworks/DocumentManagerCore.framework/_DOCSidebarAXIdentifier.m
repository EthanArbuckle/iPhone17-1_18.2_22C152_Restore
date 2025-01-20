@interface _DOCSidebarAXIdentifier
+ (NSString)containerView;
+ (id)headerWithTitle:(id)a3;
+ (id)idBase;
+ (id)itemWithTitle:(id)a3;
@end

@implementation _DOCSidebarAXIdentifier

+ (id)idBase
{
  return @"DOC.sidebar";
}

+ (NSString)containerView
{
  return (NSString *)@"Browse View";
}

+ (id)headerWithTitle:(id)a3
{
  id v4 = a3;
  v5 = [a1 idBase];
  v6 = composedID(@"header", v4);

  v7 = composedID(v5, v6);

  return v7;
}

+ (id)itemWithTitle:(id)a3
{
  id v4 = a3;
  v5 = [a1 idBase];
  v6 = composedID(@"item", v4);

  v7 = composedID(v5, v6);

  return v7;
}

@end