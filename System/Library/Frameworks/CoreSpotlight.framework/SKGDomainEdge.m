@interface SKGDomainEdge
+ (Class)nodeClass;
+ (id)edgeFromDomain:(id)a3 toNode:(id)a4;
+ (id)name;
@end

@implementation SKGDomainEdge

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)name
{
  return off_1000F83B0;
}

+ (id)edgeFromDomain:(id)a3 toNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(SKGEdge *)[SKGDomainEdge alloc] initWithSourceNode:v5 targetNode:v6];

  return v7;
}

@end