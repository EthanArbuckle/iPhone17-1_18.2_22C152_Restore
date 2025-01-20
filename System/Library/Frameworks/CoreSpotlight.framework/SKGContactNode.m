@interface SKGContactNode
+ (Class)edgeClass;
+ (id)contactWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4;
+ (id)label;
- (SKGContactNode)initWithIdentifier:(id)a3;
@end

@implementation SKGContactNode

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)label
{
  return off_1000F8360[0];
}

+ (id)contactWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4
{
  v5 = [a4 graph];
  v6 = [v5 nodeForIdentifier:a3];

  v7 = [SKGContactNode alloc];
  v8 = [v6 propertyForKey:@"value"];
  v9 = [(SKGContactNode *)v7 initWithIdentifier:v8];

  return v9;
}

- (SKGContactNode)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKGContactNode;
  return [(SKGNode *)&v4 initWithValue:a3];
}

@end