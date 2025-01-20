@interface CTCallCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)isCSCallingAvailable;
- (BOOL)isCarrierSupportsEmergencyCallOnWifiNoLimit;
- (BOOL)isEmergencyCallingOnWifiAllowed;
- (BOOL)isEmergencyCallingOnWifiAvailable;
- (BOOL)isVoLTECallingAvailable;
- (BOOL)isWifiCallingAvailable;
- (CTCallCapabilities)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIsCSCallingAvailable:(BOOL)a3;
- (void)setIsCarrierSupportsEmergencyCallOnWifiNoLimit:(BOOL)a3;
- (void)setIsEmergencyCallingOnWifiAllowed:(BOOL)a3;
- (void)setIsEmergencyCallingOnWifiAvailable:(BOOL)a3;
- (void)setIsVoLTECallingAvailable:(BOOL)a3;
- (void)setIsWifiCallingAvailable:(BOOL)a3;
@end

@implementation CTCallCapabilities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", isWifiCallingAvailable=%d", -[CTCallCapabilities isWifiCallingAvailable](self, "isWifiCallingAvailable")];
  [v3 appendFormat:@", isVoLTECallingAvailable=%d", -[CTCallCapabilities isVoLTECallingAvailable](self, "isVoLTECallingAvailable")];
  [v3 appendFormat:@", isCSCallingAvailable=%d", -[CTCallCapabilities isCSCallingAvailable](self, "isCSCallingAvailable")];
  [v3 appendFormat:@", isEmergencyCallingOnWifiAllowed=%d", -[CTCallCapabilities isEmergencyCallingOnWifiAllowed](self, "isEmergencyCallingOnWifiAllowed")];
  [v3 appendFormat:@", isEmergencyCallingOnWifiAvailable=%d", -[CTCallCapabilities isEmergencyCallingOnWifiAvailable](self, "isEmergencyCallingOnWifiAvailable")];
  [v3 appendFormat:@", isCarrierSupportsEmergencyCallOnWifiNoLimit=%d", -[CTCallCapabilities isCarrierSupportsEmergencyCallOnWifiNoLimit](self, "isCarrierSupportsEmergencyCallOnWifiNoLimit")];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsWifiCallingAvailable:", -[CTCallCapabilities isWifiCallingAvailable](self, "isWifiCallingAvailable"));
  objc_msgSend(v4, "setIsVoLTECallingAvailable:", -[CTCallCapabilities isVoLTECallingAvailable](self, "isVoLTECallingAvailable"));
  objc_msgSend(v4, "setIsCSCallingAvailable:", -[CTCallCapabilities isCSCallingAvailable](self, "isCSCallingAvailable"));
  objc_msgSend(v4, "setIsEmergencyCallingOnWifiAllowed:", -[CTCallCapabilities isEmergencyCallingOnWifiAllowed](self, "isEmergencyCallingOnWifiAllowed"));
  objc_msgSend(v4, "setIsEmergencyCallingOnWifiAvailable:", -[CTCallCapabilities isEmergencyCallingOnWifiAvailable](self, "isEmergencyCallingOnWifiAvailable"));
  objc_msgSend(v4, "setIsCarrierSupportsEmergencyCallOnWifiNoLimit:", -[CTCallCapabilities isCarrierSupportsEmergencyCallOnWifiNoLimit](self, "isCarrierSupportsEmergencyCallOnWifiNoLimit"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isWifiCallingAvailable](self, "isWifiCallingAvailable"), @"isWifiCallingAvailable");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isVoLTECallingAvailable](self, "isVoLTECallingAvailable"), @"isVoLTECallingAvailable");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isCSCallingAvailable](self, "isCSCallingAvailable"), @"isCSCallingAvailable");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isEmergencyCallingOnWifiAllowed](self, "isEmergencyCallingOnWifiAllowed"), @"isEmergencyCallingOnWifiAllowed");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isEmergencyCallingOnWifiAvailable](self, "isEmergencyCallingOnWifiAvailable"), @"isEmergencyCallingOnWifiAvailable");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallCapabilities isCarrierSupportsEmergencyCallOnWifiNoLimit](self, "isCarrierSupportsEmergencyCallOnWifiNoLimit"), @"isCarrierSupportsEmergencyCallOnWifiNoLimit");
}

- (CTCallCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTCallCapabilities;
  v5 = [(CTCallCapabilities *)&v7 init];
  if (v5)
  {
    v5->_isWifiCallingAvailable = [v4 decodeBoolForKey:@"isWifiCallingAvailable"];
    v5->_isVoLTECallingAvailable = [v4 decodeBoolForKey:@"isVoLTECallingAvailable"];
    v5->_isCSCallingAvailable = [v4 decodeBoolForKey:@"isCSCallingAvailable"];
    v5->_isEmergencyCallingOnWifiAllowed = [v4 decodeBoolForKey:@"isEmergencyCallingOnWifiAllowed"];
    v5->_isEmergencyCallingOnWifiAvailable = [v4 decodeBoolForKey:@"isEmergencyCallingOnWifiAvailable"];
    v5->_isCarrierSupportsEmergencyCallOnWifiNoLimit = [v4 decodeBoolForKey:@"isCarrierSupportsEmergencyCallOnWifiNoLimit"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isWifiCallingAvailable
{
  return self->_isWifiCallingAvailable;
}

- (void)setIsWifiCallingAvailable:(BOOL)a3
{
  self->_isWifiCallingAvailable = a3;
}

- (BOOL)isVoLTECallingAvailable
{
  return self->_isVoLTECallingAvailable;
}

- (void)setIsVoLTECallingAvailable:(BOOL)a3
{
  self->_isVoLTECallingAvailable = a3;
}

- (BOOL)isCSCallingAvailable
{
  return self->_isCSCallingAvailable;
}

- (void)setIsCSCallingAvailable:(BOOL)a3
{
  self->_isCSCallingAvailable = a3;
}

- (BOOL)isEmergencyCallingOnWifiAllowed
{
  return self->_isEmergencyCallingOnWifiAllowed;
}

- (void)setIsEmergencyCallingOnWifiAllowed:(BOOL)a3
{
  self->_isEmergencyCallingOnWifiAllowed = a3;
}

- (BOOL)isEmergencyCallingOnWifiAvailable
{
  return self->_isEmergencyCallingOnWifiAvailable;
}

- (void)setIsEmergencyCallingOnWifiAvailable:(BOOL)a3
{
  self->_isEmergencyCallingOnWifiAvailable = a3;
}

- (BOOL)isCarrierSupportsEmergencyCallOnWifiNoLimit
{
  return self->_isCarrierSupportsEmergencyCallOnWifiNoLimit;
}

- (void)setIsCarrierSupportsEmergencyCallOnWifiNoLimit:(BOOL)a3
{
  self->_isCarrierSupportsEmergencyCallOnWifiNoLimit = a3;
}

@end