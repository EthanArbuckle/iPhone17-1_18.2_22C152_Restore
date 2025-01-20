@interface SKGUserNode
+ (Class)edgeClass;
+ (id)label;
+ (id)user;
- (SKGUserNode)init;
@end

@implementation SKGUserNode

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)label
{
  return off_1000F8350[0];
}

+ (id)user
{
  v2 = objc_alloc_init(SKGUserNode);

  return v2;
}

- (SKGUserNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKGUserNode;
  return [(SKGNode *)&v3 initWithValue:@"user"];
}

@end