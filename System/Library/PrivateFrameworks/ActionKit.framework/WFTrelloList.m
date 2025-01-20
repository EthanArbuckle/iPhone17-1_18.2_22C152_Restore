@interface WFTrelloList
+ (BOOL)supportsSecureCoding;
+ (id)listWithName:(id)a3;
@end

@implementation WFTrelloList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)listWithName:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setName:v3];

  return v4;
}

@end