@interface CTLazuliOperationStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliOperationStatus:(id)a3;
- (CTLazuliOperationStatus)initWithCoder:(id)a3;
- (CTLazuliOperationStatus)initWithReflection:(const OperationStatus *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cellularDataRequirement;
- (int64_t)registrationState;
- (int64_t)switchState;
- (void)encodeWithCoder:(id)a3;
- (void)setCellularDataRequirement:(int64_t)a3;
- (void)setRegistrationState:(int64_t)a3;
- (void)setSwitchState:(int64_t)a3;
@end

@implementation CTLazuliOperationStatus

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliOperationStatus *)self registrationState];
  int64_t v8 = [(CTLazuliOperationStatus *)self registrationState];
  [v3 appendFormat:@", registrationState = [%ld - %s]", v4, print_CTLazuliRegistrationStateType(&v8)];
  int64_t v5 = [(CTLazuliOperationStatus *)self switchState];
  int64_t v8 = [(CTLazuliOperationStatus *)self switchState];
  [v3 appendFormat:@", switchState = [%ld - %s]", v5, print_CTLazuliToggleStateType(&v8)];
  int64_t v6 = [(CTLazuliOperationStatus *)self cellularDataRequirement];
  int64_t v8 = [(CTLazuliOperationStatus *)self cellularDataRequirement];
  [v3 appendFormat:@", cellularDataRequirement = [%ld - %s]", v6, print_CTLazuliCurrentSimCellularDataRequirementType(&v8)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliOperationStatus:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliOperationStatus *)self registrationState];
  if (v5 == [v4 registrationState]
    && (int64_t v6 = -[CTLazuliOperationStatus switchState](self, "switchState"), v6 == [v4 switchState]))
  {
    int64_t v7 = [(CTLazuliOperationStatus *)self cellularDataRequirement];
    BOOL v8 = v7 == [v4 cellularDataRequirement];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliOperationStatus *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliOperationStatus *)self isEqualToCTLazuliOperationStatus:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliOperationStatus allocWithZone:a3];
  [(CTLazuliOperationStatus *)v4 setRegistrationState:self->_registrationState];
  [(CTLazuliOperationStatus *)v4 setSwitchState:self->_switchState];
  [(CTLazuliOperationStatus *)v4 setCellularDataRequirement:self->_cellularDataRequirement];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [NSNumber numberWithLong:self->_registrationState];
  [v7 encodeObject:v4 forKey:@"kRegistrationStateKey"];

  int64_t v5 = [NSNumber numberWithLong:self->_switchState];
  [v7 encodeObject:v5 forKey:@"kSwitchStateKey"];

  BOOL v6 = [NSNumber numberWithLong:self->_cellularDataRequirement];
  [v7 encodeObject:v6 forKey:@"kCellularDataRequirementKey"];
}

- (CTLazuliOperationStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliOperationStatus;
  int64_t v5 = [(CTLazuliOperationStatus *)&v10 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRegistrationStateKey"];
    v5->_registrationState = [v6 longValue];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSwitchStateKey"];
    v5->_switchState = [v7 longValue];

    BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCellularDataRequirementKey"];
    v5->_cellularDataRequirement = [v8 longValue];
  }
  return v5;
}

- (CTLazuliOperationStatus)initWithReflection:(const OperationStatus *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CTLazuliOperationStatus;
  id v4 = [(CTLazuliOperationStatus *)&v6 init];
  if (v4)
  {
    v4->_registrationState = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3);
    v4->_switchState = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)&a3->var1);
    v4->_cellularDataRequirement = encode_CTLazuliGroupChatParticipantRoleType(&a3->var2);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)registrationState
{
  return self->_registrationState;
}

- (void)setRegistrationState:(int64_t)a3
{
  self->_registrationState = a3;
}

- (int64_t)switchState
{
  return self->_switchState;
}

- (void)setSwitchState:(int64_t)a3
{
  self->_switchState = a3;
}

- (int64_t)cellularDataRequirement
{
  return self->_cellularDataRequirement;
}

- (void)setCellularDataRequirement:(int64_t)a3
{
  self->_cellularDataRequirement = a3;
}

@end