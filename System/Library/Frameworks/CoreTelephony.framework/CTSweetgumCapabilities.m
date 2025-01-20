@interface CTSweetgumCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsApplications;
- (BOOL)supportsPlans;
- (BOOL)supportsServices;
- (BOOL)supportsUsage;
- (CTSweetgumCapabilities)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSupportsApplications:(BOOL)a3;
- (void)setSupportsPlans:(BOOL)a3;
- (void)setSupportsServices:(BOOL)a3;
- (void)setSupportsUsage:(BOOL)a3;
@end

@implementation CTSweetgumCapabilities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" supportsServices=%d", -[CTSweetgumCapabilities supportsServices](self, "supportsServices"));
  objc_msgSend(v3, "appendFormat:", @" supportsUsage=%d", -[CTSweetgumCapabilities supportsUsage](self, "supportsUsage"));
  objc_msgSend(v3, "appendFormat:", @" supportsPlans=%d", -[CTSweetgumCapabilities supportsPlans](self, "supportsPlans"));
  objc_msgSend(v3, "appendFormat:", @" supportsApplications=%d", -[CTSweetgumCapabilities supportsApplications](self, "supportsApplications"));
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTSweetgumCapabilities *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (BOOL v5 = [(CTSweetgumCapabilities *)self supportsServices],
          v5 == [(CTSweetgumCapabilities *)v4 supportsServices])
      && (BOOL v6 = [(CTSweetgumCapabilities *)self supportsUsage],
          v6 == [(CTSweetgumCapabilities *)v4 supportsUsage])
      && (BOOL v7 = [(CTSweetgumCapabilities *)self supportsPlans],
          v7 == [(CTSweetgumCapabilities *)v4 supportsPlans]))
    {
      BOOL v10 = [(CTSweetgumCapabilities *)self supportsApplications];
      BOOL v8 = v10 ^ [(CTSweetgumCapabilities *)v4 supportsApplications] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSupportsServices:", -[CTSweetgumCapabilities supportsServices](self, "supportsServices"));
  objc_msgSend(v4, "setSupportsUsage:", -[CTSweetgumCapabilities supportsUsage](self, "supportsUsage"));
  objc_msgSend(v4, "setSupportsPlans:", -[CTSweetgumCapabilities supportsPlans](self, "supportsPlans"));
  objc_msgSend(v4, "setSupportsApplications:", -[CTSweetgumCapabilities supportsApplications](self, "supportsApplications"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL supportsServices = self->_supportsServices;
  id v5 = a3;
  [v5 encodeBool:supportsServices forKey:@"services"];
  [v5 encodeBool:self->_supportsUsage forKey:@"usage"];
  [v5 encodeBool:self->_supportsPlans forKey:@"plans"];
  [v5 encodeBool:self->_supportsApplications forKey:@"applications"];
}

- (CTSweetgumCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTSweetgumCapabilities;
  id v5 = [(CTSweetgumCapabilities *)&v7 init];
  if (v5)
  {
    v5->_BOOL supportsServices = [v4 decodeBoolForKey:@"services"];
    v5->_supportsUsage = [v4 decodeBoolForKey:@"usage"];
    v5->_supportsPlans = [v4 decodeBoolForKey:@"plans"];
    v5->_supportsApplications = [v4 decodeBoolForKey:@"applications"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsServices
{
  return self->_supportsServices;
}

- (void)setSupportsServices:(BOOL)a3
{
  self->_BOOL supportsServices = a3;
}

- (BOOL)supportsUsage
{
  return self->_supportsUsage;
}

- (void)setSupportsUsage:(BOOL)a3
{
  self->_supportsUsage = a3;
}

- (BOOL)supportsPlans
{
  return self->_supportsPlans;
}

- (void)setSupportsPlans:(BOOL)a3
{
  self->_supportsPlans = a3;
}

- (BOOL)supportsApplications
{
  return self->_supportsApplications;
}

- (void)setSupportsApplications:(BOOL)a3
{
  self->_supportsApplications = a3;
}

@end