@interface SKGUserEdge
+ (Class)nodeClass;
+ (id)edgeFromUser:(id)a3 toNode:(id)a4;
+ (id)name;
@end

@implementation SKGUserEdge

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)name
{
  return off_1000F8350[0];
}

+ (id)edgeFromUser:(id)a3 toNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(SKGEdge *)[SKGUserEdge alloc] initWithSourceNode:v5 targetNode:v6];

  return v7;
}

@end