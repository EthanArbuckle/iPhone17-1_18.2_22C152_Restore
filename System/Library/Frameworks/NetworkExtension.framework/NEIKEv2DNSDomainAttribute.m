@interface NEIKEv2DNSDomainAttribute
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
@end

@implementation NEIKEv2DNSDomainAttribute

+ (id)copyTypeDescription
{
  return @"DNS Domain";
}

- (id)attributeName
{
  if (self)
  {
    if (self->super._customType && objc_getProperty(self, a2, 8, 1)) {
      v5 = (__CFString *)objc_getProperty(self, v4, 8, 1);
    }
    else {
      v5 = @"AssignedDNSDomain";
    }
  }
  else
  {
    v5 = @"AssignedDNSDomain";
  }
  return v5;
}

- (unint64_t)attributeType
{
  if (!self) {
    return 25;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 25;
}

@end