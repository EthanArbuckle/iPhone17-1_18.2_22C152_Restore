@interface CAField
+ (id)fieldWithName:(id)a3 ioProperty:(id)a4 valueType:(Class)a5;
- (BOOL)isValidValue:(id)a3;
- (CAField)initWithName:(id)a3 ioProperty:(id)a4 valueType:(Class)a5;
- (Class)valueType;
- (NSString)ioProperty;
- (NSString)name;
@end

@implementation CAField

- (CAField)initWithName:(id)a3 ioProperty:(id)a4 valueType:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CAField;
  v11 = [(CAField *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    objc_storeStrong((id *)&v12->_ioProperty, a4);
    objc_storeStrong((id *)&v12->_valueType, a5);
  }

  return v12;
}

+ (id)fieldWithName:(id)a3 ioProperty:(id)a4 valueType:(Class)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithName:v9 ioProperty:v8 valueType:a5];

  return v10;
}

- (BOOL)isValidValue:(id)a3
{
  id v3 = a3;
  BOOL v5 = 0;
  if (v3)
  {
    id v4 = +[NSNull null];

    if (v4 == v3 || (objc_opt_isKindOfClass() & 1) != 0) {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)ioProperty
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (Class)valueType
{
  return (Class)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_ioProperty, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end