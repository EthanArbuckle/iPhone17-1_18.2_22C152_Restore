@interface FigCaptureCMIOExtensionProperty
- (BOOL)readonly;
- (FigCaptureCMIOExtensionProperty)initWithName:(id)a3 defaultValue:(id)a4 readonly:(BOOL)a5;
- (NSString)propertyAliasName;
- (NSString)propertyName;
- (id)description;
- (id)propertyValue;
- (void)setPropertyAliasName:(id)a3;
- (void)setPropertyValue:(id)a3;
- (void)updatePropertyValueWithoutKVONotification:(id)a3;
@end

@implementation FigCaptureCMIOExtensionProperty

- (FigCaptureCMIOExtensionProperty)initWithName:(id)a3 defaultValue:(id)a4 readonly:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FigCaptureCMIOExtensionProperty;
  v10 = [(FigCaptureCMIOExtensionProperty *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_propertyName, a3);
    objc_storeStrong(&v11->_propertyValue, a4);
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: [%p] name:%@ value:%@", v5, self, self->_propertyName, self->_propertyValue];

  return v6;
}

- (void)updatePropertyValueWithoutKVONotification:(id)a3
{
}

- (NSString)propertyName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)propertyValue
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setPropertyValue:(id)a3
{
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (NSString)propertyAliasName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPropertyAliasName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAliasName, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong(&self->_propertyValue, 0);
}

@end