@interface SKGEmailNode
+ (Class)edgeClass;
+ (id)emailWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4;
+ (id)label;
- (SKGEmailNode)initWithEmailAddress:(id)a3;
@end

@implementation SKGEmailNode

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)label
{
  return off_1000F8390[0];
}

- (SKGEmailNode)initWithEmailAddress:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKGEmailNode;
  return [(SKGNode *)&v4 initWithValue:a3];
}

+ (id)emailWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4
{
  v5 = [a4 graph];
  v6 = [v5 nodeForIdentifier:a3];

  v7 = [SKGEmailNode alloc];
  v8 = [v6 propertyForKey:@"value"];
  v9 = [(SKGEmailNode *)v7 initWithEmailAddress:v8];

  return v9;
}

@end