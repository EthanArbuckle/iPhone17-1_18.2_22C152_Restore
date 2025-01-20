@interface CTBootstrapState
+ (BOOL)supportsSecureCoding;
- (CTBootstrapState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)bootstrapStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setBootstrapStatus:(int)a3;
@end

@implementation CTBootstrapState

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  unsigned int v4 = [(CTBootstrapState *)self bootstrapStatus];
  if (v4 > 2) {
    v5 = "??";
  }
  else {
    v5 = off_1E52617D8[v4];
  }
  [v3 appendFormat:@", bootstrapStatus=%s", v5];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setBootstrapStatus:", -[CTBootstrapState bootstrapStatus](self, "bootstrapStatus"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTBootstrapState bootstrapStatus](self, "bootstrapStatus"), @"bootsrtap_state");
}

- (CTBootstrapState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTBootstrapState;
  v5 = [(CTBootstrapState *)&v7 init];
  if (v5) {
    v5->_bootstrapStatus = [v4 decodeIntegerForKey:@"bootsrtap_state"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)bootstrapStatus
{
  return self->_bootstrapStatus;
}

- (void)setBootstrapStatus:(int)a3
{
  self->_bootstrapStatus = a3;
}

@end