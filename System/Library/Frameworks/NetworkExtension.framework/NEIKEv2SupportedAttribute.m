@interface NEIKEv2SupportedAttribute
+ (id)copyTypeDescription;
- (BOOL)validForChildlessSA;
- (id)attributeName;
- (unint64_t)attributeType;
@end

@implementation NEIKEv2SupportedAttribute

+ (id)copyTypeDescription
{
  return @"Supported Attributes";
}

- (BOOL)validForChildlessSA
{
  return 1;
}

- (id)attributeName
{
  if (self)
  {
    if (self->super._customType && objc_getProperty(self, a2, 8, 1)) {
      v5 = (__CFString *)objc_getProperty(self, v4, 8, 1);
    }
    else {
      v5 = @"AssignedSupportedAttribute";
    }
  }
  else
  {
    v5 = @"AssignedSupportedAttribute";
  }
  return v5;
}

- (unint64_t)attributeType
{
  if (!self) {
    return 14;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 14;
}

@end