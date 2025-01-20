@interface SKGPhoneEdge
+ (Class)nodeClass;
+ (id)edgeFromPhone:(id)a3 toNode:(id)a4;
+ (id)name;
@end

@implementation SKGPhoneEdge

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)name
{
  return off_1000F8398[0];
}

+ (id)edgeFromPhone:(id)a3 toNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(SKGEdge *)[SKGPhoneEdge alloc] initWithSourceNode:v5 targetNode:v6];

  return v7;
}

@end