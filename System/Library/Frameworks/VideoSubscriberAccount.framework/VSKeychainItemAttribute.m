@interface VSKeychainItemAttribute
- (NSString)attributeValueClassName;
- (NSString)name;
- (__CFString)secItemAttributeKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultValue;
- (unint64_t)attributeType;
- (void)dealloc;
- (void)setAttributeType:(unint64_t)a3;
- (void)setAttributeValueClassName:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setName:(id)a3;
- (void)setSecItemAttributeKey:(__CFString *)a3;
@end

@implementation VSKeychainItemAttribute

- (void)dealloc
{
  secItemAttributeKey = self->_secItemAttributeKey;
  if (secItemAttributeKey) {
    CFRelease(secItemAttributeKey);
  }
  v4.receiver = self;
  v4.super_class = (Class)VSKeychainItemAttribute;
  [(VSKeychainItemAttribute *)&v4 dealloc];
}

- (NSString)attributeValueClassName
{
  v2 = self->_attributeValueClassName;
  if (!v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The attributeValueClassName parameter must not be nil."];
      v2 = 0;
    }
  }

  return v2;
}

- (void)setSecItemAttributeKey:(__CFString *)a3
{
  secItemAttributeKey = self->_secItemAttributeKey;
  if (secItemAttributeKey != a3)
  {
    if (secItemAttributeKey) {
      CFRelease(secItemAttributeKey);
    }
    self->_secItemAttributeKey = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [+[VSKeychainItemAttribute allocWithZone:a3] init];
  v5 = [(VSKeychainItemAttribute *)self name];
  [(VSKeychainItemAttribute *)v4 setName:v5];

  [(VSKeychainItemAttribute *)v4 setAttributeType:[(VSKeychainItemAttribute *)self attributeType]];
  v6 = [(VSKeychainItemAttribute *)self attributeValueClassName];
  [(VSKeychainItemAttribute *)v4 setAttributeValueClassName:v6];

  [(VSKeychainItemAttribute *)v4 setSecItemAttributeKey:[(VSKeychainItemAttribute *)self secItemAttributeKey]];
  v7 = [(VSKeychainItemAttribute *)self defaultValue];
  [(VSKeychainItemAttribute *)v4 setDefaultValue:v7];

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)attributeType
{
  return self->_attributeType;
}

- (void)setAttributeType:(unint64_t)a3
{
  self->_attributeType = a3;
}

- (void)setAttributeValueClassName:(id)a3
{
}

- (__CFString)secItemAttributeKey
{
  return self->_secItemAttributeKey;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_attributeValueClassName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end