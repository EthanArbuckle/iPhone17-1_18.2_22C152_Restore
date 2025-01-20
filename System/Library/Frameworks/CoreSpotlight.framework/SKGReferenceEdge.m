@interface SKGReferenceEdge
+ (Class)nodeClass;
+ (id)edgeFromReference:(id)a3 toNode:(id)a4;
+ (id)name;
@end

@implementation SKGReferenceEdge

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)name
{
  return off_1000F83A0[0];
}

+ (id)edgeFromReference:(id)a3 toNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(SKGEdge *)[SKGReferenceEdge alloc] initWithSourceNode:v5 targetNode:v6];

  return v7;
}

@end