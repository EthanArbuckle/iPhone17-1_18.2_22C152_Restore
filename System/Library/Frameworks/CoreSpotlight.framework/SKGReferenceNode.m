@interface SKGReferenceNode
+ (Class)edgeClass;
+ (id)label;
+ (id)referenceWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4;
- (SKGReferenceNode)initWithReference:(id)a3;
@end

@implementation SKGReferenceNode

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)label
{
  return off_1000F83A0[0];
}

+ (id)referenceWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4
{
  v5 = [a4 graph];
  v6 = [v5 nodeForIdentifier:a3];

  v7 = [SKGReferenceNode alloc];
  v8 = [v6 propertyForKey:@"value"];
  v9 = [(SKGReferenceNode *)v7 initWithReference:v8];

  return v9;
}

- (SKGReferenceNode)initWithReference:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKGReferenceNode;
  return [(SKGNode *)&v4 initWithValue:a3];
}

@end