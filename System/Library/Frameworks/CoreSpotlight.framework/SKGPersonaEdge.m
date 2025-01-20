@interface SKGPersonaEdge
+ (Class)nodeClass;
+ (id)edgeFromPersona:(id)a3 toNode:(id)a4;
+ (id)name;
@end

@implementation SKGPersonaEdge

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)name
{
  return off_1000F83A8[0];
}

+ (id)edgeFromPersona:(id)a3 toNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(SKGEdge *)[SKGPersonaEdge alloc] initWithSourceNode:v5 targetNode:v6];

  return v7;
}

@end