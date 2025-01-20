@interface APManagedAppProtectability
+ (BOOL)supportsSecureCoding;
- (APManagedAppProtectability)initWithCoder:(id)a3;
- (BOOL)isHideable;
- (BOOL)isLockable;
- (id)description;
- (id)initLockable:(BOOL)a3 hideable:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APManagedAppProtectability

- (id)initLockable:(BOOL)a3 hideable:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)APManagedAppProtectability;
  id result = [(APManagedAppProtectability *)&v7 init];
  if (result)
  {
    *((unsigned char *)result + 8) = a3;
    *((unsigned char *)result + 9) = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (APManagedAppProtectability)initWithCoder:(id)a3
{
  char v4 = [a3 decodeIntForKey:@"protectability"];
  v6.receiver = self;
  v6.super_class = (Class)APManagedAppProtectability;
  id result = [(APManagedAppProtectability *)&v6 init];
  if (result)
  {
    result->_lockable = v4 & 1;
    result->_hideable = (v4 & 2) != 0;
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ l: %d, h: %d>", objc_opt_class(), self->_lockable, self->_hideable];
}

- (BOOL)isLockable
{
  return self->_lockable;
}

- (BOOL)isHideable
{
  return self->_hideable;
}

@end