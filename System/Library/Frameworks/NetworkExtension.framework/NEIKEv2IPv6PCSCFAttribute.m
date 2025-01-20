@interface NEIKEv2IPv6PCSCFAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2IPv6PCSCFAttribute

+ (id)copyTypeDescription
{
  return @"IPv6 PCSCF";
}

- (id)attributeName
{
  if (self)
  {
    if (self->super._customType && objc_getProperty(self, a2, 8, 1)) {
      v5 = (__CFString *)objc_getProperty(self, v4, 8, 1);
    }
    else {
      v5 = @"AssignedIPv6PCSCF_STD";
    }
  }
  else
  {
    v5 = @"AssignedIPv6PCSCF_STD";
  }
  return v5;
}

- (unint64_t)valueType
{
  return 2;
}

- (unint64_t)attributeType
{
  if (!self) {
    return 21;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 21;
}

@end