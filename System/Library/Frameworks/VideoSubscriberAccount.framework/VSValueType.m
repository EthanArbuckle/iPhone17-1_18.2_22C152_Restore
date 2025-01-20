@interface VSValueType
- (BOOL)isSuperclassAlsoValueType;
- (Class)implementationClass;
- (NSArray)properties;
- (void)setImplementationClass:(Class)a3;
- (void)setProperties:(id)a3;
@end

@implementation VSValueType

- (BOOL)isSuperclassAlsoValueType
{
  return objc_msgSend((id)-[objc_class superclass](-[VSValueType implementationClass](self, "implementationClass"), "superclass"), "isEqual:", objc_opt_class()) ^ 1;
}

- (Class)implementationClass
{
  return self->_implementationClass;
}

- (void)setImplementationClass:(Class)a3
{
}

- (NSArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_implementationClass, 0);
}

@end