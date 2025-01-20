@interface SKGNameNode
+ (Class)edgeClass;
+ (id)label;
+ (id)nameWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4;
- (SKGNameNode)initWithName:(id)a3;
@end

@implementation SKGNameNode

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)label
{
  return off_1000F8380[0];
}

+ (id)nameWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4
{
  v5 = [a4 graph];
  v6 = [v5 nodeForIdentifier:a3];

  v7 = [SKGNameNode alloc];
  v8 = [v6 propertyForKey:@"value"];
  v9 = [(SKGNameNode *)v7 initWithName:v8];

  return v9;
}

- (SKGNameNode)initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKGNameNode;
  return [(SKGNode *)&v4 initWithValue:a3];
}

@end