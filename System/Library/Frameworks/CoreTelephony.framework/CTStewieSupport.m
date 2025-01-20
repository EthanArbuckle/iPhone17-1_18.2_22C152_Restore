@interface CTStewieSupport
+ (BOOL)supportsSecureCoding;
- (BOOL)hwSupport;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSupport:(id)a3;
- (BOOL)status;
- (CTStewieSupport)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setHwSupport:(BOOL)a3;
- (void)setStatus:(BOOL)a3;
@end

@implementation CTStewieSupport

- (CTStewieSupport)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTStewieSupport;
  v5 = [(CTStewieSupport *)&v7 init];
  if (v5)
  {
    v5->_status = [v4 decodeBoolForKey:@"status"];
    v5->_hwSupport = [v4 decodeBoolForKey:@"hwSupport"];
  }

  return v5;
}

- (BOOL)status
{
  return self->_status;
}

- (void)setStatus:(BOOL)a3
{
  self->_status = a3;
}

- (void)setHwSupport:(BOOL)a3
{
  self->_hwSupport = a3;
}

- (BOOL)hwSupport
{
  return self->_hwSupport;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTStewieSupport status](self, "status"), @"status");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTStewieSupport hwSupport](self, "hwSupport"), @"hwSupport");
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", status=%d", -[CTStewieSupport status](self, "status")];
  [v3 appendFormat:@", hwSupport=%d", -[CTStewieSupport hwSupport](self, "hwSupport")];
  [v3 appendString:@">"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToSupport:(id)a3
{
  id v4 = a3;
  int v5 = [(CTStewieSupport *)self status];
  if (v5 == [v4 status])
  {
    BOOL v7 = [(CTStewieSupport *)self hwSupport];
    int v6 = v7 ^ [v4 hwSupport] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieSupport *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CTStewieSupport *)self isEqualToSupport:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStatus:", -[CTStewieSupport status](self, "status"));
  objc_msgSend(v4, "setHwSupport:", -[CTStewieSupport hwSupport](self, "hwSupport"));
  return v4;
}

@end