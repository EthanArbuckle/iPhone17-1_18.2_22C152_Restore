@interface NEIKEv2AppVersionAttribute
+ (id)copyTypeDescription;
- (BOOL)validForChildlessSA;
- (id)attributeName;
- (unint64_t)attributeType;
@end

@implementation NEIKEv2AppVersionAttribute

+ (id)copyTypeDescription
{
  return @"App Version";
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
      v5 = @"AssignedAppVersion";
    }
  }
  else
  {
    v5 = @"AssignedAppVersion";
  }
  return v5;
}

- (unint64_t)attributeType
{
  if (!self) {
    return 7;
  }
  if (self->super._customType) {
    return self->super._customType;
  }
  return 7;
}

@end