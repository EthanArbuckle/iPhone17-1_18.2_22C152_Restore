@interface SKGPersonaNode
+ (Class)edgeClass;
+ (id)label;
+ (id)personaWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4;
- (SKGPersonaNode)initWithPersona:(id)a3;
@end

@implementation SKGPersonaNode

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)label
{
  return off_1000F83A8[0];
}

+ (id)personaWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4
{
  v5 = [a4 graph];
  v6 = [v5 nodeForIdentifier:a3];

  v7 = [SKGPersonaNode alloc];
  v8 = [v6 propertyForKey:@"value"];
  v9 = [(SKGPersonaNode *)v7 initWithPersona:v8];

  return v9;
}

- (SKGPersonaNode)initWithPersona:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKGPersonaNode;
  return [(SKGNode *)&v4 initWithValue:a3];
}

@end