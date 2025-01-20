@interface IDSUserProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)disableRegistration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUserProperties:(id)a3;
- (IDSUserProperties)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)propsByupdatingDisableRegistration:(BOOL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSUserProperties

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  *((unsigned char *)result + 8) = self->_disableRegistration;
  return result;
}

- (id)propsByupdatingDisableRegistration:(BOOL)a3
{
  v4 = [(IDSUserProperties *)self copy];
  v4[8] = a3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(IDSUserProperties *)self isEqualToUserProperties:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToUserProperties:(id)a3
{
  if (self == a3) {
    return 1;
  }
  unsigned __int8 v4 = [a3 disableRegistration];
  return v4 ^ [(IDSUserProperties *)self disableRegistration] ^ 1;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)IDSUserProperties;
  return [(IDSUserProperties *)&v3 hash] ^ self->_disableRegistration;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unsigned int v4 = [(IDSUserProperties *)self disableRegistration];
  CFStringRef v5 = @"NO";
  if (v4) {
    CFStringRef v5 = @"YES";
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@:%p; disableRegistration: %@>",
           v3,
           self,
           v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (IDSUserProperties)initWithCoder:(id)a3
{
  self->_disableRegistration = [a3 decodeBoolForKey:@"disableReg"];
  return self;
}

- (BOOL)disableRegistration
{
  return self->_disableRegistration;
}

@end