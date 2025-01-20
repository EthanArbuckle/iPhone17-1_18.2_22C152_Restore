@interface CTDataConnectionAvailabilityStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)available;
- (CTDataConnectionAvailabilityStatus)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)csiError;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setCsiError:(int)a3;
@end

@implementation CTDataConnectionAvailabilityStatus

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", available=%d", -[CTDataConnectionAvailabilityStatus available](self, "available")];
  [v3 appendFormat:@", error=%d", -[CTDataConnectionAvailabilityStatus csiError](self, "csiError")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAvailable:", -[CTDataConnectionAvailabilityStatus available](self, "available"));
  objc_msgSend(v4, "setCsiError:", -[CTDataConnectionAvailabilityStatus csiError](self, "csiError"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTDataConnectionAvailabilityStatus available](self, "available"), @"available");
  objc_msgSend(v4, "encodeInt:forKey:", -[CTDataConnectionAvailabilityStatus csiError](self, "csiError"), @"error");
}

- (CTDataConnectionAvailabilityStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTDataConnectionAvailabilityStatus;
  v5 = [(CTDataConnectionAvailabilityStatus *)&v7 init];
  if (v5)
  {
    v5->_available = [v4 decodeBoolForKey:@"available"];
    v5->_csiError = [v4 decodeIntForKey:@"error"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)available
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (int)csiError
{
  return self->_csiError;
}

- (void)setCsiError:(int)a3
{
  self->_csiError = a3;
}

@end