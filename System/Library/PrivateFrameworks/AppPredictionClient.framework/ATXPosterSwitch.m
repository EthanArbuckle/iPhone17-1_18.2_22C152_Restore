@interface ATXPosterSwitch
+ (BOOL)supportsSecureCoding;
- (ATXPosterSwitch)initWithCoder:(id)a3;
- (ATXPosterSwitch)initWithLockscreenId:(id)a3 switchMechanism:(id)a4;
- (ATXPosterSwitch)initWithLockscreenId:(id)a3 switchMechanism:(id)a4 outcome:(id)a5 duration:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPosterSwitch:(id)a3;
- (NSString)lockscreenId;
- (NSString)outcome;
- (NSString)switchMechanism;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)duration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXPosterSwitch

- (ATXPosterSwitch)initWithLockscreenId:(id)a3 switchMechanism:(id)a4
{
  return [(ATXPosterSwitch *)self initWithLockscreenId:a3 switchMechanism:a4 outcome:@"unknown" duration:-1];
}

- (ATXPosterSwitch)initWithLockscreenId:(id)a3 switchMechanism:(id)a4 outcome:(id)a5 duration:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXPosterSwitch;
  v13 = [(ATXPosterSwitch *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    lockscreenId = v13->_lockscreenId;
    v13->_lockscreenId = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    switchMechanism = v13->_switchMechanism;
    v13->_switchMechanism = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    outcome = v13->_outcome;
    v13->_outcome = (NSString *)v18;

    v13->_duration = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXPosterSwitch)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockscreenId"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"switchMechanism"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outcome"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"duration"];

  v9 = [(ATXPosterSwitch *)self initWithLockscreenId:v5 switchMechanism:v6 outcome:v7 duration:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(ATXPosterSwitch *)self lockscreenId];
  [v7 encodeObject:v4 forKey:@"lockscreenId"];

  v5 = [(ATXPosterSwitch *)self switchMechanism];
  [v7 encodeObject:v5 forKey:@"switchMechanism"];

  v6 = [(ATXPosterSwitch *)self outcome];
  [v7 encodeObject:v6 forKey:@"outcome"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[ATXPosterSwitch duration](self, "duration"), @"duration");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  id v4 = [(ATXPosterSwitch *)v3 lockscreenId];
  v5 = (void *)[v4 copy];
  v6 = [(ATXPosterSwitch *)v3 switchMechanism];
  id v7 = (void *)[v6 copy];
  uint64_t v8 = [(ATXPosterSwitch *)v3 outcome];
  v9 = (void *)[v8 copy];
  id v10 = [(ATXPosterSwitch *)v3 initWithLockscreenId:v5 switchMechanism:v7 outcome:v9 duration:[(ATXPosterSwitch *)v3 duration]];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXPosterSwitch *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPosterSwitch *)self isEqualToATXPosterSwitch:v5];

  return v6;
}

- (BOOL)isEqualToATXPosterSwitch:(id)a3
{
  id v4 = (id *)a3;
  lockscreenId = self->_lockscreenId;
  BOOL v6 = (NSString *)v4[1];
  if (lockscreenId == v6)
  {
  }
  else
  {
    id v7 = v6;
    uint64_t v8 = lockscreenId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_11;
    }
  }
  switchMechanism = self->_switchMechanism;
  id v11 = (NSString *)v4[2];
  if (switchMechanism == v11)
  {
  }
  else
  {
    id v12 = v11;
    v13 = switchMechanism;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_11;
    }
  }
  outcome = self->_outcome;
  uint64_t v16 = (NSString *)v4[3];
  if (outcome == v16)
  {

    goto LABEL_13;
  }
  v17 = v16;
  uint64_t v18 = outcome;
  char v19 = [(NSString *)v18 isEqual:v17];

  if (v19)
  {
LABEL_13:
    int64_t duration = self->_duration;
    BOOL v20 = duration == [v4 duration];
    goto LABEL_14;
  }
LABEL_11:
  BOOL v20 = 0;
LABEL_14:

  return v20;
}

- (unint64_t)hash
{
  v3 = [(ATXPosterSwitch *)self lockscreenId];
  uint64_t v4 = [v3 hash];

  v5 = [(ATXPosterSwitch *)self switchMechanism];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  id v7 = [(ATXPosterSwitch *)self outcome];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  return [(ATXPosterSwitch *)self duration] - v8 + 32 * v8;
}

- (NSString)lockscreenId
{
  return self->_lockscreenId;
}

- (NSString)switchMechanism
{
  return self->_switchMechanism;
}

- (NSString)outcome
{
  return self->_outcome;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_switchMechanism, 0);

  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end