@interface _BSObjCPropertyBuilder
- (BOOL)optional;
- (BSObjCValue)value;
- (NSString)getterName;
- (NSString)name;
- (NSString)setterName;
- (int64_t)associationPolicy;
- (void)setAssociationPolicy:(int64_t)a3;
- (void)setGetterName:(id)a3;
- (void)setName:(id)a3;
- (void)setOptional:(BOOL)a3;
- (void)setSetterName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation _BSObjCPropertyBuilder

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (BSObjCValue)value
{
  return (BSObjCValue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValue:(id)a3
{
}

- (BOOL)optional
{
  return self->optional;
}

- (void)setOptional:(BOOL)a3
{
  self->optional = a3;
}

- (int64_t)associationPolicy
{
  return self->associationPolicy;
}

- (void)setAssociationPolicy:(int64_t)a3
{
  self->associationPolicy = a3;
}

- (NSString)getterName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGetterName:(id)a3
{
}

- (NSString)setterName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSetterName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->setterName, 0);
  objc_storeStrong((id *)&self->getterName, 0);
  objc_storeStrong((id *)&self->value, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end