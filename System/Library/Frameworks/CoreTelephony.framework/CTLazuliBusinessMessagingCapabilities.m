@interface CTLazuliBusinessMessagingCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)enabledByDefault;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliBusinessMessagingCapabilities:(id)a3;
- (BOOL)supported;
- (CTLazuliBusinessMessagingCapabilities)initWithCoder:(id)a3;
- (CTLazuliBusinessMessagingCapabilities)initWithReflection:(const BusinessMessagingCapabilities *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)userPreferenceForSwitch;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabledByDefault:(BOOL)a3;
- (void)setSupported:(BOOL)a3;
- (void)setUserPreferenceForSwitch:(int64_t)a3;
@end

@implementation CTLazuliBusinessMessagingCapabilities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliBusinessMessagingCapabilities *)self userPreferenceForSwitch];
  int64_t v6 = [(CTLazuliBusinessMessagingCapabilities *)self userPreferenceForSwitch];
  [v3 appendFormat:@", userPreferenceForSwitch = [%ld - %s]", v4, print_CTLazuliToggleSwitchPreferenceType(&v6)];
  [v3 appendFormat:@", supported = %d", -[CTLazuliBusinessMessagingCapabilities supported](self, "supported")];
  [v3 appendFormat:@", enabledByDefault = %d", -[CTLazuliBusinessMessagingCapabilities enabledByDefault](self, "enabledByDefault")];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliBusinessMessagingCapabilities:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliBusinessMessagingCapabilities *)self userPreferenceForSwitch];
  if (v5 == [v4 userPreferenceForSwitch]
    && (int v6 = [(CTLazuliBusinessMessagingCapabilities *)self supported],
        v6 == [v4 supported]))
  {
    BOOL v8 = [(CTLazuliBusinessMessagingCapabilities *)self enabledByDefault];
    int v7 = v8 ^ [v4 enabledByDefault] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliBusinessMessagingCapabilities *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliBusinessMessagingCapabilities *)self isEqualToCTLazuliBusinessMessagingCapabilities:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliBusinessMessagingCapabilities allocWithZone:a3];
  [(CTLazuliBusinessMessagingCapabilities *)v4 setUserPreferenceForSwitch:self->_userPreferenceForSwitch];
  [(CTLazuliBusinessMessagingCapabilities *)v4 setSupported:self->_supported];
  [(CTLazuliBusinessMessagingCapabilities *)v4 setEnabledByDefault:self->_enabledByDefault];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [NSNumber numberWithLong:self->_userPreferenceForSwitch];
  [v5 encodeObject:v4 forKey:@"kUserPreferenceForSwitchKey"];

  [v5 encodeBool:self->_supported forKey:@"kSupportedKey"];
  [v5 encodeBool:self->_enabledByDefault forKey:@"kEnabledByDefaultKey"];
}

- (CTLazuliBusinessMessagingCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliBusinessMessagingCapabilities;
  id v5 = [(CTLazuliBusinessMessagingCapabilities *)&v8 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUserPreferenceForSwitchKey"];
    v5->_userPreferenceForSwitch = [v6 longValue];

    v5->_supported = [v4 decodeBoolForKey:@"kSupportedKey"];
    v5->_enabledByDefault = [v4 decodeBoolForKey:@"kEnabledByDefaultKey"];
  }

  return v5;
}

- (CTLazuliBusinessMessagingCapabilities)initWithReflection:(const BusinessMessagingCapabilities *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CTLazuliBusinessMessagingCapabilities;
  id v4 = [(CTLazuliBusinessMessagingCapabilities *)&v6 init];
  if (v4)
  {
    v4->_userPreferenceForSwitch = encode_CTLazuliGroupChatParticipantRoleType(a3);
    v4->_supported = a3->var1;
    v4->_enabledByDefault = a3->var2;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)userPreferenceForSwitch
{
  return self->_userPreferenceForSwitch;
}

- (void)setUserPreferenceForSwitch:(int64_t)a3
{
  self->_userPreferenceForSwitch = a3;
}

- (BOOL)supported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (BOOL)enabledByDefault
{
  return self->_enabledByDefault;
}

- (void)setEnabledByDefault:(BOOL)a3
{
  self->_enabledByDefault = a3;
}

@end