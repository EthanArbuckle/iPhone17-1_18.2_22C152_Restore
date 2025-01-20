@interface CTLazuliToggleStatusInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliToggleStatusInformation:(id)a3;
- (CTLazuliToggleStatusInformation)initWithCoder:(id)a3;
- (CTLazuliToggleStatusInformation)initWithReflection:(const ToggleStatusInformation *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (int64_t)userPreferenceForSwitch;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUserPreferenceForSwitch:(int64_t)a3;
@end

@implementation CTLazuliToggleStatusInformation

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliToggleStatusInformation *)self type];
  int64_t v7 = [(CTLazuliToggleStatusInformation *)self type];
  [v3 appendFormat:@", type = [%ld - %s]", v4, print_CTLazuliToggleStateType(&v7)];
  int64_t v5 = [(CTLazuliToggleStatusInformation *)self userPreferenceForSwitch];
  int64_t v7 = [(CTLazuliToggleStatusInformation *)self userPreferenceForSwitch];
  [v3 appendFormat:@", userPreferenceForSwitch = [%ld - %s]", v5, print_CTLazuliToggleSwitchPreferenceType(&v7)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliToggleStatusInformation:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliToggleStatusInformation *)self type];
  if (v5 == [v4 type])
  {
    int64_t v6 = [(CTLazuliToggleStatusInformation *)self userPreferenceForSwitch];
    BOOL v7 = v6 == [v4 userPreferenceForSwitch];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliToggleStatusInformation *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliToggleStatusInformation *)self isEqualToCTLazuliToggleStatusInformation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliToggleStatusInformation allocWithZone:a3];
  [(CTLazuliToggleStatusInformation *)v4 setType:self->_type];
  [(CTLazuliToggleStatusInformation *)v4 setUserPreferenceForSwitch:self->_userPreferenceForSwitch];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [NSNumber numberWithLong:self->_type];
  [v6 encodeObject:v4 forKey:@"kTypeKey"];

  int64_t v5 = [NSNumber numberWithLong:self->_userPreferenceForSwitch];
  [v6 encodeObject:v5 forKey:@"kUserPreferenceForSwitchKey"];
}

- (CTLazuliToggleStatusInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliToggleStatusInformation;
  int64_t v5 = [(CTLazuliToggleStatusInformation *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTypeKey"];
    v5->_type = [v6 longValue];

    BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUserPreferenceForSwitchKey"];
    v5->_userPreferenceForSwitch = [v7 longValue];
  }
  return v5;
}

- (CTLazuliToggleStatusInformation)initWithReflection:(const ToggleStatusInformation *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CTLazuliToggleStatusInformation;
  id v4 = [(CTLazuliToggleStatusInformation *)&v6 init];
  if (v4)
  {
    v4->_type = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3);
    v4->_userPreferenceForSwitch = encode_CTLazuliGroupChatParticipantRoleType(&a3->var1);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)userPreferenceForSwitch
{
  return self->_userPreferenceForSwitch;
}

- (void)setUserPreferenceForSwitch:(int64_t)a3
{
  self->_userPreferenceForSwitch = a3;
}

@end