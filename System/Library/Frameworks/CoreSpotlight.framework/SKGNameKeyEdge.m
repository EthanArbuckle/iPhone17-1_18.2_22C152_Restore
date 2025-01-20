@interface SKGNameKeyEdge
+ (Class)nodeClass;
+ (id)edgeFromNameKey:(id)a3 toNode:(id)a4;
+ (id)name;
@end

@implementation SKGNameKeyEdge

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)name
{
  return off_1000F8388[0];
}

+ (id)edgeFromNameKey:(id)a3 toNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(SKGEdge *)[SKGNameKeyEdge alloc] initWithSourceNode:v5 targetNode:v6];

  return v7;
}

@end