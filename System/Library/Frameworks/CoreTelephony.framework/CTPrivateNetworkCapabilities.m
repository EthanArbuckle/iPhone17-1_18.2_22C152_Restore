@interface CTPrivateNetworkCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)hideDataRoaming;
- (BOOL)isPrivateNetworkModeEnabled;
- (BOOL)isPrivateNetworkPreferredOverWifi;
- (BOOL)isPrivateNetworkSIM;
- (CTPrivateNetworkCapabilities)init;
- (CTPrivateNetworkCapabilities)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setHideDataRoaming:(BOOL)a3;
- (void)setIsPrivateNetworkModeEnabled:(BOOL)a3;
- (void)setIsPrivateNetworkPreferredOverWifi:(BOOL)a3;
- (void)setIsPrivateNetworkSIM:(BOOL)a3;
@end

@implementation CTPrivateNetworkCapabilities

- (CTPrivateNetworkCapabilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)CTPrivateNetworkCapabilities;
  return [(CTPrivateNetworkCapabilities *)&v3 init];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", isPrivateNetworkSIM=%d", -[CTPrivateNetworkCapabilities isPrivateNetworkSIM](self, "isPrivateNetworkSIM")];
  [v3 appendFormat:@", isPrivateNetworkPreferredOverWifi=%d", -[CTPrivateNetworkCapabilities isPrivateNetworkPreferredOverWifi](self, "isPrivateNetworkPreferredOverWifi")];
  [v3 appendFormat:@", isPrivateNetworkModeEnabled=%d", -[CTPrivateNetworkCapabilities isPrivateNetworkModeEnabled](self, "isPrivateNetworkModeEnabled")];
  [v3 appendFormat:@", hideDataRoaming=%d", -[CTPrivateNetworkCapabilities hideDataRoaming](self, "hideDataRoaming")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsPrivateNetworkSIM:", -[CTPrivateNetworkCapabilities isPrivateNetworkSIM](self, "isPrivateNetworkSIM"));
  objc_msgSend(v4, "setIsPrivateNetworkPreferredOverWifi:", -[CTPrivateNetworkCapabilities isPrivateNetworkPreferredOverWifi](self, "isPrivateNetworkPreferredOverWifi"));
  objc_msgSend(v4, "setIsPrivateNetworkModeEnabled:", -[CTPrivateNetworkCapabilities isPrivateNetworkModeEnabled](self, "isPrivateNetworkModeEnabled"));
  objc_msgSend(v4, "setHideDataRoaming:", -[CTPrivateNetworkCapabilities hideDataRoaming](self, "hideDataRoaming"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTPrivateNetworkCapabilities isPrivateNetworkSIM](self, "isPrivateNetworkSIM"), @"isPrivateNetworkSIM");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTPrivateNetworkCapabilities isPrivateNetworkPreferredOverWifi](self, "isPrivateNetworkPreferredOverWifi"), @"isPrivateNetworkPreferredOverWifi");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTPrivateNetworkCapabilities isPrivateNetworkModeEnabled](self, "isPrivateNetworkModeEnabled"), @"isPrivateNetworkModeEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTPrivateNetworkCapabilities hideDataRoaming](self, "hideDataRoaming"), @"hideDataRoaming");
}

- (CTPrivateNetworkCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTPrivateNetworkCapabilities;
  v5 = [(CTPrivateNetworkCapabilities *)&v7 init];
  if (v5)
  {
    v5->_isPrivateNetworkSIM = [v4 decodeBoolForKey:@"isPrivateNetworkSIM"];
    v5->_isPrivateNetworkPreferredOverWifi = [v4 decodeBoolForKey:@"isPrivateNetworkPreferredOverWifi"];
    v5->_isPrivateNetworkModeEnabled = [v4 decodeBoolForKey:@"isPrivateNetworkModeEnabled"];
    v5->_hideDataRoaming = [v4 decodeBoolForKey:@"hideDataRoaming"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isPrivateNetworkSIM
{
  return self->_isPrivateNetworkSIM;
}

- (void)setIsPrivateNetworkSIM:(BOOL)a3
{
  self->_isPrivateNetworkSIM = a3;
}

- (BOOL)isPrivateNetworkPreferredOverWifi
{
  return self->_isPrivateNetworkPreferredOverWifi;
}

- (void)setIsPrivateNetworkPreferredOverWifi:(BOOL)a3
{
  self->_isPrivateNetworkPreferredOverWifi = a3;
}

- (BOOL)isPrivateNetworkModeEnabled
{
  return self->_isPrivateNetworkModeEnabled;
}

- (void)setIsPrivateNetworkModeEnabled:(BOOL)a3
{
  self->_isPrivateNetworkModeEnabled = a3;
}

- (BOOL)hideDataRoaming
{
  return self->_hideDataRoaming;
}

- (void)setHideDataRoaming:(BOOL)a3
{
  self->_hideDataRoaming = a3;
}

@end