@interface SKGDisplayNameNode
+ (Class)edgeClass;
+ (id)displayNameWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4;
+ (id)label;
- (SKGDisplayNameNode)initWithName:(id)a3;
@end

@implementation SKGDisplayNameNode

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)label
{
  return off_1000F8378[0];
}

+ (id)displayNameWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4
{
  v5 = [a4 graph];
  v6 = [v5 nodeForIdentifier:a3];

  v7 = [SKGDisplayNameNode alloc];
  v8 = [v6 propertyForKey:@"value"];
  v9 = [(SKGDisplayNameNode *)v7 initWithName:v8];

  return v9;
}

- (SKGDisplayNameNode)initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKGDisplayNameNode;
  return [(SKGNode *)&v4 initWithValue:a3];
}

@end