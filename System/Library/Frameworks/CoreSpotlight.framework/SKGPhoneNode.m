@interface SKGPhoneNode
+ (Class)edgeClass;
+ (id)label;
+ (id)phoneWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4;
- (SKGPhoneNode)initWithPhoneNumber:(id)a3;
@end

@implementation SKGPhoneNode

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)label
{
  return off_1000F8398[0];
}

+ (id)phoneWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4
{
  v5 = [a4 graph];
  v6 = [v5 nodeForIdentifier:a3];

  v7 = [SKGPhoneNode alloc];
  v8 = [v6 propertyForKey:@"value"];
  v9 = [(SKGPhoneNode *)v7 initWithPhoneNumber:v8];

  return v9;
}

- (SKGPhoneNode)initWithPhoneNumber:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKGPhoneNode;
  return [(SKGNode *)&v4 initWithValue:a3];
}

@end