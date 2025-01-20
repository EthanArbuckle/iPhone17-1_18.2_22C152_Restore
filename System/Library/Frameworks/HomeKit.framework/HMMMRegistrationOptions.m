@interface HMMMRegistrationOptions
- (HMMMRegistrationOptions)init;
- (HMMMRegistrationOptions)initWithUserRestriction:(int64_t)a3;
- (id)attributeDescriptions;
- (int64_t)userRestriction;
@end

@implementation HMMMRegistrationOptions

- (int64_t)userRestriction
{
  return self->_userRestriction;
}

- (id)attributeDescriptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v4 = [(HMMMRegistrationOptions *)self userRestriction];
  if (v4 > 2) {
    v5 = @"Unknown";
  }
  else {
    v5 = off_1E59402B0[v4];
  }
  v6 = (void *)[v3 initWithName:@"UserRestriction" value:v5];
  v9[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (HMMMRegistrationOptions)initWithUserRestriction:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMMMRegistrationOptions;
  result = [(HMMMRegistrationOptions *)&v5 init];
  if (result) {
    result->_userRestriction = a3;
  }
  return result;
}

- (HMMMRegistrationOptions)init
{
  return [(HMMMRegistrationOptions *)self initWithUserRestriction:0];
}

@end