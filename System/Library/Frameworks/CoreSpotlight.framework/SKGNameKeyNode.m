@interface SKGNameKeyNode
+ (Class)edgeClass;
+ (id)label;
+ (id)nameKeyWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4;
- (NSString)firstName;
- (NSString)lastName;
- (SKGNameKeyNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (SKGNameKeyNode)initWithNameKey:(id)a3 firstName:(id)a4 lastName:(id)a5;
- (id)propertyDictionary;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
@end

@implementation SKGNameKeyNode

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)label
{
  return off_1000F8388[0];
}

+ (id)nameKeyWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4
{
  v5 = [a4 graph];
  v6 = [v5 nodeForIdentifier:a3];

  v7 = [SKGNameKeyNode alloc];
  v8 = [v6 propertyForKey:@"value"];
  v9 = [v6 propertyForKey:@"firstName"];
  v10 = [v6 propertyForKey:@"lastName"];
  v11 = [(SKGNameKeyNode *)v7 initWithNameKey:v8 firstName:v9 lastName:v10];

  return v11;
}

- (SKGNameKeyNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  id v7 = a6;
  v8 = [v7 objectForKey:@"value"];
  if (v8)
  {
    v9 = [v7 objectForKey:@"firstName"];
    if (v9)
    {
      v10 = [v7 objectForKey:@"lastName"];
      if (v10)
      {
        self = [(SKGNameKeyNode *)self initWithNameKey:v8 firstName:v9 lastName:v10];
        v11 = self;
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (SKGNameKeyNode)initWithNameKey:(id)a3 firstName:(id)a4 lastName:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SKGNameKeyNode;
  v11 = [(SKGNode *)&v14 initWithValue:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_firstName, a4);
    objc_storeStrong((id *)&v12->_lastName, a5);
  }

  return v12;
}

- (id)propertyDictionary
{
  v7[0] = @"value";
  v3 = [(SKGNode *)self value];
  firstName = self->_firstName;
  v8[0] = v3;
  v8[1] = firstName;
  v7[1] = @"firstName";
  v7[2] = @"lastName";
  v8[2] = self->_lastName;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);

  objc_storeStrong((id *)&self->_firstName, 0);
}

@end