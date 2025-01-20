@interface NEIKEv2ResponderTransportIPv6Address
+ (id)copyTypeDescription;
- (id)attributeName;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2ResponderTransportIPv6Address

+ (id)copyTypeDescription
{
  return @"IPv6 Responder Transport Address";
}

- (id)attributeName
{
  if (self)
  {
    if (self->super._customType && objc_getProperty(self, a2, 8, 1)) {
      v5 = (__CFString *)objc_getProperty(self, v4, 8, 1);
    }
    else {
      v5 = @"AssignedResponderTransportIPv6Address";
    }
  }
  else
  {
    v5 = @"AssignedResponderTransportIPv6Address";
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
    return 25959;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 25959;
}

@end