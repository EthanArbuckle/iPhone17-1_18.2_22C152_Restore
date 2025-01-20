@interface NEIKEv2IPv4AddressAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2IPv4AddressAttribute

+ (id)copyTypeDescription
{
  return @"IPv4 Address";
}

- (id)attributeName
{
  if (self)
  {
    if (self->super._customType && objc_getProperty(self, a2, 8, 1)) {
      v5 = (__CFString *)objc_getProperty(self, v4, 8, 1);
    }
    else {
      v5 = @"AssignedIPv4Address";
    }
  }
  else
  {
    v5 = @"AssignedIPv4Address";
  }
  return v5;
}

- (unint64_t)valueType
{
  return 1;
}

- (unint64_t)attributeType
{
  if (!self) {
    return 1;
  }
  if (self->super._customType <= 1) {
    return 1;
  }
  return self->super._customType;
}

@end