@interface CTRoamingStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isDataRoaming;
- (BOOL)isVoiceRoaming;
- (CTRoamingStatus)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIsDataRoaming:(BOOL)a3;
- (void)setIsVoiceRoaming:(BOOL)a3;
@end

@implementation CTRoamingStatus

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", isVoiceRoaming=%d", -[CTRoamingStatus isVoiceRoaming](self, "isVoiceRoaming")];
  [v3 appendFormat:@", isDataRoaming=%d", -[CTRoamingStatus isDataRoaming](self, "isDataRoaming")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsVoiceRoaming:", -[CTRoamingStatus isVoiceRoaming](self, "isVoiceRoaming"));
  objc_msgSend(v4, "setIsDataRoaming:", -[CTRoamingStatus isDataRoaming](self, "isDataRoaming"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTRoamingStatus isVoiceRoaming](self, "isVoiceRoaming"), @"voice_roaming");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTRoamingStatus isDataRoaming](self, "isDataRoaming"), @"data_roaming");
}

- (CTRoamingStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTRoamingStatus;
  v5 = [(CTRoamingStatus *)&v7 init];
  if (v5)
  {
    v5->_isVoiceRoaming = [v4 decodeBoolForKey:@"voice_roaming"];
    v5->_isDataRoaming = [v4 decodeBoolForKey:@"data_roaming"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isVoiceRoaming
{
  return self->_isVoiceRoaming;
}

- (void)setIsVoiceRoaming:(BOOL)a3
{
  self->_isVoiceRoaming = a3;
}

- (BOOL)isDataRoaming
{
  return self->_isDataRoaming;
}

- (void)setIsDataRoaming:(BOOL)a3
{
  self->_isDataRoaming = a3;
}

@end