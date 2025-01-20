@interface CTRegistrationDisplayStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)changedDueToSimRemoval;
- (BOOL)isInHomeCountry;
- (BOOL)isRegistrationForcedHome;
- (BOOL)isSatelliteSystem;
- (CTRegistrationDisplayStatus)initWithCoder:(id)a3;
- (NSString)registrationDisplayStatus;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChangedDueToSimRemoval:(BOOL)a3;
- (void)setIsInHomeCountry:(BOOL)a3;
- (void)setIsRegistrationForcedHome:(BOOL)a3;
- (void)setIsSatelliteSystem:(BOOL)a3;
- (void)setRegistrationDisplayStatus:(id)a3;
@end

@implementation CTRegistrationDisplayStatus

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTRegistrationDisplayStatus *)self registrationDisplayStatus];
  [v3 appendFormat:@", registrationDisplayStatus=%@", v4];

  [v3 appendFormat:@", isInHomeCountry=%d", -[CTRegistrationDisplayStatus isInHomeCountry](self, "isInHomeCountry")];
  [v3 appendFormat:@", changedDueToSimRemoval=%d", -[CTRegistrationDisplayStatus changedDueToSimRemoval](self, "changedDueToSimRemoval")];
  [v3 appendFormat:@", isRegistrationForcedHome=%d", -[CTRegistrationDisplayStatus isRegistrationForcedHome](self, "isRegistrationForcedHome")];
  [v3 appendFormat:@", isSatelliteSystem=%d", -[CTRegistrationDisplayStatus isSatelliteSystem](self, "isSatelliteSystem")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTRegistrationDisplayStatus *)self registrationDisplayStatus];
  v6 = (void *)[v5 copy];
  [v4 setRegistrationDisplayStatus:v6];

  objc_msgSend(v4, "setIsInHomeCountry:", -[CTRegistrationDisplayStatus isInHomeCountry](self, "isInHomeCountry"));
  objc_msgSend(v4, "setChangedDueToSimRemoval:", -[CTRegistrationDisplayStatus changedDueToSimRemoval](self, "changedDueToSimRemoval"));
  objc_msgSend(v4, "setIsRegistrationForcedHome:", -[CTRegistrationDisplayStatus isRegistrationForcedHome](self, "isRegistrationForcedHome"));
  objc_msgSend(v4, "setIsSatelliteSystem:", -[CTRegistrationDisplayStatus isSatelliteSystem](self, "isSatelliteSystem"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(CTRegistrationDisplayStatus *)self registrationDisplayStatus];
  [v5 encodeObject:v4 forKey:@"display_status"];

  objc_msgSend(v5, "encodeBool:forKey:", -[CTRegistrationDisplayStatus isInHomeCountry](self, "isInHomeCountry"), @"home_country");
  objc_msgSend(v5, "encodeBool:forKey:", -[CTRegistrationDisplayStatus changedDueToSimRemoval](self, "changedDueToSimRemoval"), @"sim_removal");
  objc_msgSend(v5, "encodeBool:forKey:", -[CTRegistrationDisplayStatus isRegistrationForcedHome](self, "isRegistrationForcedHome"), @"forced_home");
  objc_msgSend(v5, "encodeBool:forKey:", -[CTRegistrationDisplayStatus isSatelliteSystem](self, "isSatelliteSystem"), @"is_satellite_system");
}

- (CTRegistrationDisplayStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTRegistrationDisplayStatus;
  id v5 = [(CTRegistrationDisplayStatus *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_status"];
    registrationDisplayStatus = v5->_registrationDisplayStatus;
    v5->_registrationDisplayStatus = (NSString *)v6;

    v5->_isInHomeCountry = [v4 decodeBoolForKey:@"home_country"];
    v5->_changedDueToSimRemoval = [v4 decodeBoolForKey:@"sim_removal"];
    v5->_isRegistrationForcedHome = [v4 decodeBoolForKey:@"forced_home"];
    v5->_isSatelliteSystem = [v4 decodeBoolForKey:@"is_satellite_system"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)registrationDisplayStatus
{
  return self->_registrationDisplayStatus;
}

- (void)setRegistrationDisplayStatus:(id)a3
{
}

- (BOOL)isInHomeCountry
{
  return self->_isInHomeCountry;
}

- (void)setIsInHomeCountry:(BOOL)a3
{
  self->_isInHomeCountry = a3;
}

- (BOOL)changedDueToSimRemoval
{
  return self->_changedDueToSimRemoval;
}

- (void)setChangedDueToSimRemoval:(BOOL)a3
{
  self->_changedDueToSimRemoval = a3;
}

- (BOOL)isRegistrationForcedHome
{
  return self->_isRegistrationForcedHome;
}

- (void)setIsRegistrationForcedHome:(BOOL)a3
{
  self->_isRegistrationForcedHome = a3;
}

- (BOOL)isSatelliteSystem
{
  return self->_isSatelliteSystem;
}

- (void)setIsSatelliteSystem:(BOOL)a3
{
  self->_isSatelliteSystem = a3;
}

- (void).cxx_destruct
{
}

@end