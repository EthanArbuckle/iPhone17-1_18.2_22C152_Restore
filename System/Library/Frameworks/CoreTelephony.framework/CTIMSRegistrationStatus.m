@interface CTIMSRegistrationStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isRegisteredForSMS;
- (BOOL)isRegisteredForVoice;
- (CTIMSRegistrationStatus)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIsRegisteredForSMS:(BOOL)a3;
- (void)setIsRegisteredForVoice:(BOOL)a3;
@end

@implementation CTIMSRegistrationStatus

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", isRegisteredForVoice=%d", -[CTIMSRegistrationStatus isRegisteredForVoice](self, "isRegisteredForVoice")];
  [v3 appendFormat:@", isRegisteredForSMS=%d", -[CTIMSRegistrationStatus isRegisteredForSMS](self, "isRegisteredForSMS")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsRegisteredForVoice:", -[CTIMSRegistrationStatus isRegisteredForVoice](self, "isRegisteredForVoice"));
  objc_msgSend(v4, "setIsRegisteredForSMS:", -[CTIMSRegistrationStatus isRegisteredForSMS](self, "isRegisteredForSMS"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTIMSRegistrationStatus isRegisteredForVoice](self, "isRegisteredForVoice"), @"isRegisteredForVoice");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTIMSRegistrationStatus isRegisteredForSMS](self, "isRegisteredForSMS"), @"isRegisteredForSMS");
}

- (CTIMSRegistrationStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTIMSRegistrationStatus;
  v5 = [(CTIMSRegistrationStatus *)&v7 init];
  if (v5)
  {
    v5->_isRegisteredForVoice = [v4 decodeBoolForKey:@"isRegisteredForVoice"];
    v5->_isRegisteredForSMS = [v4 decodeBoolForKey:@"isRegisteredForSMS"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isRegisteredForVoice
{
  return self->_isRegisteredForVoice;
}

- (void)setIsRegisteredForVoice:(BOOL)a3
{
  self->_isRegisteredForVoice = a3;
}

- (BOOL)isRegisteredForSMS
{
  return self->_isRegisteredForSMS;
}

- (void)setIsRegisteredForSMS:(BOOL)a3
{
  self->_isRegisteredForSMS = a3;
}

@end