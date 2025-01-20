@interface NEIKEv2IPv4PCSCFAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2IPv4PCSCFAttribute

+ (id)copyTypeDescription
{
  return @"IPv4 PCSCF";
}

- (id)attributeName
{
  if (self)
  {
    if (self->super._customType && objc_getProperty(self, a2, 8, 1)) {
      v5 = (__CFString *)objc_getProperty(self, v4, 8, 1);
    }
    else {
      v5 = @"AssignedIPv4PCSCF_STD";
    }
  }
  else
  {
    v5 = @"AssignedIPv4PCSCF_STD";
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
    return 20;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 20;
}

@end