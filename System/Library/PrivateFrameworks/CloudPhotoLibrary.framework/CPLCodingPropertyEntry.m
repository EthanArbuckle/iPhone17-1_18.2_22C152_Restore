@interface CPLCodingPropertyEntry
- (BOOL)isReadOnly;
- (NSSet)propertyClasses;
- (NSString)structName;
- (SEL)propertyGetter;
- (SEL)propertySetter;
- (char)propertyType;
- (id)ivarValueForObject:(id)a3;
- (objc_ivar)ivar;
- (void)ivarAddrForObject:(id)a3;
- (void)propertyGetterIMP;
- (void)propertySetterIMP;
- (void)setIvar:(objc_ivar *)a3;
- (void)setIvarValue:(id)a3 forObject:(id)a4;
- (void)setPropertyClasses:(id)a3;
- (void)setPropertyGetter:(SEL)a3;
- (void)setPropertyGetterIMP:(void *)a3;
- (void)setPropertySetter:(SEL)a3;
- (void)setPropertySetterIMP:(void *)a3;
- (void)setPropertyType:(char)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setStructName:(id)a3;
@end

@implementation CPLCodingPropertyEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structName, 0);
  objc_storeStrong((id *)&self->_propertyClasses, 0);
}

- (void)setStructName:(id)a3
{
}

- (NSString)structName
{
  return self->_structName;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)setIvar:(objc_ivar *)a3
{
  self->_ivar = a3;
}

- (objc_ivar)ivar
{
  return self->_ivar;
}

- (void)setPropertySetterIMP:(void *)a3
{
  self->_propertySetterIMP = a3;
}

- (void)propertySetterIMP
{
  return self->_propertySetterIMP;
}

- (void)setPropertyGetterIMP:(void *)a3
{
  self->_propertyGetterIMP = a3;
}

- (void)propertyGetterIMP
{
  return self->_propertyGetterIMP;
}

- (void)setPropertySetter:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_propertySetter = v3;
}

- (SEL)propertySetter
{
  if (self->_propertySetter) {
    return self->_propertySetter;
  }
  else {
    return 0;
  }
}

- (void)setPropertyGetter:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_propertyGetter = v3;
}

- (SEL)propertyGetter
{
  if (self->_propertyGetter) {
    return self->_propertyGetter;
  }
  else {
    return 0;
  }
}

- (void)setPropertyClasses:(id)a3
{
}

- (NSSet)propertyClasses
{
  return self->_propertyClasses;
}

- (void)setPropertyType:(char)a3
{
  self->_propertyType = a3;
}

- (char)propertyType
{
  return self->_propertyType;
}

- (void)setIvarValue:(id)a3 forObject:(id)a4
{
  ivar = self->_ivar;
  if (ivar) {
    object_setIvar(a4, ivar, a3);
  }
}

- (id)ivarValueForObject:(id)a3
{
  ivar = self->_ivar;
  if (ivar)
  {
    v4 = object_getIvar(a3, ivar);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)ivarAddrForObject:(id)a3
{
  result = self->_ivar;
  if (result) {
    return (char *)a3 + ivar_getOffset((Ivar)result);
  }
  return result;
}

@end