@interface SKGNameEdge
+ (Class)nodeClass;
+ (id)edgeFromName:(id)a3 toNode:(id)a4;
+ (id)name;
@end

@implementation SKGNameEdge

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)name
{
  return off_1000F8380[0];
}

+ (id)edgeFromName:(id)a3 toNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(SKGEdge *)[SKGNameEdge alloc] initWithSourceNode:v5 targetNode:v6];

  return v7;
}

@end