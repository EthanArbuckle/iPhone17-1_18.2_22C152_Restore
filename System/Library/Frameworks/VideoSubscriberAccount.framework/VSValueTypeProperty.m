@interface VSValueTypeProperty
+ (id)valueTypePropertyWithName:(id)a3 kind:(unint64_t)a4 allowedClasses:(id)a5 initialValue:(id)a6;
- (NSSet)allowedClasses;
- (NSString)name;
- (id)initialValue;
- (unint64_t)kind;
- (void)setAllowedClasses:(id)a3;
- (void)setInitialValue:(id)a3;
- (void)setKind:(unint64_t)a3;
- (void)setName:(id)a3;
@end

@implementation VSValueTypeProperty

+ (id)valueTypePropertyWithName:(id)a3 kind:(unint64_t)a4 allowedClasses:(id)a5 initialValue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)a1);
  [v13 setName:v12];

  [v13 setKind:a4];
  [v13 setAllowedClasses:v11];

  [v13 setInitialValue:v10];

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (void)setAllowedClasses:(id)a3
{
}

- (id)initialValue
{
  return self->_initialValue;
}

- (void)setInitialValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_allowedClasses, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end