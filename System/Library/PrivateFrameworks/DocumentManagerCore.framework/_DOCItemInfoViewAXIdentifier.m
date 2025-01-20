@interface _DOCItemInfoViewAXIdentifier
+ (NSString)actionsContainer;
+ (NSString)infoContainer;
+ (NSString)levelOfDetailButton;
+ (id)idBase;
+ (id)metadataRowWithLabel:(id)a3;
@end

@implementation _DOCItemInfoViewAXIdentifier

+ (id)idBase
{
  return @"DOC.itemInfoView";
}

+ (NSString)infoContainer
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"infoContainer");

  return (NSString *)v3;
}

+ (NSString)actionsContainer
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"actionsContainer");

  return (NSString *)v3;
}

+ (NSString)levelOfDetailButton
{
  v2 = [a1 idBase];
  v3 = composedID(v2, @"levelOfDetailButton");

  return (NSString *)v3;
}

+ (id)metadataRowWithLabel:(id)a3
{
  id v4 = a3;
  v5 = [a1 idBase];
  v6 = composedID(@"metadata", v4);

  v7 = composedID(v5, v6);

  return v7;
}

@end