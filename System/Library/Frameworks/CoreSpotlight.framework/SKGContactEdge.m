@interface SKGContactEdge
+ (Class)nodeClass;
+ (id)edgeFromContact:(id)a3 toNode:(id)a4;
+ (id)name;
@end

@implementation SKGContactEdge

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)name
{
  return off_1000F8360[0];
}

+ (id)edgeFromContact:(id)a3 toNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(SKGEdge *)[SKGContactEdge alloc] initWithSourceNode:v5 targetNode:v6];

  return v7;
}

@end