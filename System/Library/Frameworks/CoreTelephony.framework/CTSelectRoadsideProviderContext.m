@interface CTSelectRoadsideProviderContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTSelectRoadsideProviderContext:(id)a3;
- (CTSelectRoadsideProviderContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)providerId;
- (void)encodeWithCoder:(id)a3;
- (void)setProviderId:(int64_t)a3;
@end

@implementation CTSelectRoadsideProviderContext

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", providerId=%ld", -[CTSelectRoadsideProviderContext providerId](self, "providerId")];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTSelectRoadsideProviderContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTSelectRoadsideProviderContext *)self providerId];
  LOBYTE(v5) = v5 == [v4 providerId];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTSelectRoadsideProviderContext *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTSelectRoadsideProviderContext *)self isEqualToCTSelectRoadsideProviderContext:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setProviderId:", -[CTSelectRoadsideProviderContext providerId](self, "providerId"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSelectRoadsideProviderContext providerId](self, "providerId"), @"providerId");
}

- (CTSelectRoadsideProviderContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTSelectRoadsideProviderContext;
  BOOL v5 = [(CTSelectRoadsideProviderContext *)&v7 init];
  if (v5) {
    v5->_providerId = [v4 decodeIntegerForKey:@"providerId"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)providerId
{
  return self->_providerId;
}

- (void)setProviderId:(int64_t)a3
{
  self->_providerId = a3;
}

@end