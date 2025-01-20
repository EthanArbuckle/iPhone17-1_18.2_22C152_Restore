@interface BMPropertyDefinition
- (BMPropertyDefinition)initWithName:(id)a3 type:(int)a4 enumValues:(id)a5 classPropertyDefinitions:(id)a6 comment:(id)a7;
- (NSArray)classPropertyDefinitions;
- (NSArray)enumValues;
- (NSString)comment;
- (NSString)name;
- (int)type;
@end

@implementation BMPropertyDefinition

- (BMPropertyDefinition)initWithName:(id)a3 type:(int)a4 enumValues:(id)a5 classPropertyDefinitions:(id)a6 comment:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMPropertyDefinition;
  v17 = [(BMPropertyDefinition *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    v18->_type = a4;
    objc_storeStrong((id *)&v18->_enumValues, a5);
    objc_storeStrong((id *)&v18->_classPropertyDefinitions, a6);
    objc_storeStrong((id *)&v18->_comment, a7);
  }

  return v18;
}

- (NSString)name
{
  return self->_name;
}

- (int)type
{
  return self->_type;
}

- (NSArray)enumValues
{
  return self->_enumValues;
}

- (NSArray)classPropertyDefinitions
{
  return self->_classPropertyDefinitions;
}

- (NSString)comment
{
  return self->_comment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_classPropertyDefinitions, 0);
  objc_storeStrong((id *)&self->_enumValues, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end