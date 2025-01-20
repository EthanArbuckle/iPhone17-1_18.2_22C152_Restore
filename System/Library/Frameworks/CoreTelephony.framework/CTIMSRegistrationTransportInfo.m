@interface CTIMSRegistrationTransportInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isRegistered;
- (CTIMSRegistrationTransportInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)contextType;
- (int)transportType;
- (void)encodeWithCoder:(id)a3;
- (void)setContextType:(int)a3;
- (void)setIsRegistered:(BOOL)a3;
- (void)setTransportType:(int)a3;
@end

@implementation CTIMSRegistrationTransportInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", isRegistered=%d", -[CTIMSRegistrationTransportInfo isRegistered](self, "isRegistered")];
  [v3 appendFormat:@", contextType=%d", -[CTIMSRegistrationTransportInfo contextType](self, "contextType")];
  [v3 appendFormat:@", transportType=%d", -[CTIMSRegistrationTransportInfo transportType](self, "transportType")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsRegistered:", -[CTIMSRegistrationTransportInfo isRegistered](self, "isRegistered"));
  objc_msgSend(v4, "setContextType:", -[CTIMSRegistrationTransportInfo contextType](self, "contextType"));
  objc_msgSend(v4, "setTransportType:", -[CTIMSRegistrationTransportInfo transportType](self, "transportType"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTIMSRegistrationTransportInfo isRegistered](self, "isRegistered"), @"isRegistered");
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIMSRegistrationTransportInfo contextType](self, "contextType"), @"contextType");
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIMSRegistrationTransportInfo transportType](self, "transportType"), @"transportType");
}

- (CTIMSRegistrationTransportInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTIMSRegistrationTransportInfo;
  v5 = [(CTIMSRegistrationTransportInfo *)&v7 init];
  if (v5)
  {
    v5->_isRegistered = [v4 decodeBoolForKey:@"isRegistered"];
    v5->_contextType = [v4 decodeIntForKey:@"contextType"];
    v5->_transportType = [v4 decodeIntForKey:@"transportType"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isRegistered
{
  return self->_isRegistered;
}

- (void)setIsRegistered:(BOOL)a3
{
  self->_isRegistered = a3;
}

- (int)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int)a3
{
  self->_contextType = a3;
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

@end