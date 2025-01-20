@interface AFHomeInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFHomeInfo)init;
- (AFHomeInfo)initWithBuilder:(id)a3;
- (AFHomeInfo)initWithCoder:(id)a3;
- (AFHomeInfo)initWithDictionaryRepresentation:(id)a3;
- (AFHomeInfo)initWithHomeIdentifier:(id)a3 activityNotificationsEnabledForPersonalRequests:(BOOL)a4;
- (BOOL)activityNotificationsEnabledForPersonalRequests;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)homeIdentifier;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFHomeInfo

- (void).cxx_destruct
{
}

- (BOOL)activityNotificationsEnabledForPersonalRequests
{
  return self->_activityNotificationsEnabledForPersonalRequests;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  homeIdentifier = self->_homeIdentifier;
  if (homeIdentifier) {
    [v3 setObject:homeIdentifier forKey:@"homeIdentifier"];
  }
  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_activityNotificationsEnabledForPersonalRequests];
  [v4 setObject:v6 forKey:@"activityNotificationsEnabledForPersonalRequests"];

  v7 = (void *)[v4 copy];
  return v7;
}

- (AFHomeInfo)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKey:@"homeIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    v8 = [v4 objectForKey:@"activityNotificationsEnabledForPersonalRequests"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    uint64_t v10 = [v9 BOOLValue];
    self = [(AFHomeInfo *)self initWithHomeIdentifier:v6 activityNotificationsEnabledForPersonalRequests:v10];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  homeIdentifier = self->_homeIdentifier;
  id v5 = a3;
  [v5 encodeObject:homeIdentifier forKey:@"AFHomeInfo::homeIdentifier"];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_activityNotificationsEnabledForPersonalRequests];
  [v5 encodeObject:v6 forKey:@"AFHomeInfo::activityNotificationsEnabledForPersonalRequests"];
}

- (AFHomeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeInfo::homeIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFHomeInfo::activityNotificationsEnabledForPersonalRequests"];

  uint64_t v7 = [v6 BOOLValue];
  v8 = [(AFHomeInfo *)self initWithHomeIdentifier:v5 activityNotificationsEnabledForPersonalRequests:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFHomeInfo *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL activityNotificationsEnabledForPersonalRequests = self->_activityNotificationsEnabledForPersonalRequests;
      if (activityNotificationsEnabledForPersonalRequests == [(AFHomeInfo *)v5 activityNotificationsEnabledForPersonalRequests])
      {
        uint64_t v7 = [(AFHomeInfo *)v5 homeIdentifier];
        homeIdentifier = self->_homeIdentifier;
        BOOL v9 = homeIdentifier == v7 || [(NSUUID *)homeIdentifier isEqual:v7];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_homeIdentifier hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_activityNotificationsEnabledForPersonalRequests];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)AFHomeInfo;
  uint64_t v5 = [(AFHomeInfo *)&v10 description];
  id v6 = (void *)v5;
  if (self->_activityNotificationsEnabledForPersonalRequests) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  v8 = (void *)[v4 initWithFormat:@"%@ {homeIdentifier = %@, BOOL activityNotificationsEnabledForPersonalRequests = %@}", v5, self->_homeIdentifier, v7];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(AFHomeInfo *)self _descriptionWithIndent:0];
}

- (AFHomeInfo)initWithHomeIdentifier:(id)a3 activityNotificationsEnabledForPersonalRequests:(BOOL)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__AFHomeInfo_initWithHomeIdentifier_activityNotificationsEnabledForPersonalRequests___block_invoke;
  v10[3] = &unk_1E592B788;
  id v11 = v6;
  BOOL v12 = a4;
  id v7 = v6;
  v8 = [(AFHomeInfo *)self initWithBuilder:v10];

  return v8;
}

void __85__AFHomeInfo_initWithHomeIdentifier_activityNotificationsEnabledForPersonalRequests___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setHomeIdentifier:v3];
  [v4 setActivityNotificationsEnabledForPersonalRequests:*(unsigned __int8 *)(a1 + 40)];
}

- (AFHomeInfo)init
{
  return [(AFHomeInfo *)self initWithBuilder:0];
}

- (AFHomeInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFHomeInfoMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFHomeInfo;
  uint64_t v5 = [(AFHomeInfo *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFHomeInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFHomeInfoMutation *)v7 isDirty])
    {
      v8 = [(_AFHomeInfoMutation *)v7 getHomeIdentifier];
      uint64_t v9 = [v8 copy];
      homeIdentifier = v6->_homeIdentifier;
      v6->_homeIdentifier = (NSUUID *)v9;

      v6->_BOOL activityNotificationsEnabledForPersonalRequests = [(_AFHomeInfoMutation *)v7 getActivityNotificationsEnabledForPersonalRequests];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFHomeInfoMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFHomeInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFHomeInfoMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFHomeInfo);
      id v7 = [(_AFHomeInfoMutation *)v5 getHomeIdentifier];
      uint64_t v8 = [v7 copy];
      homeIdentifier = v6->_homeIdentifier;
      v6->_homeIdentifier = (NSUUID *)v8;

      v6->_BOOL activityNotificationsEnabledForPersonalRequests = [(_AFHomeInfoMutation *)v5 getActivityNotificationsEnabledForPersonalRequests];
    }
    else
    {
      id v6 = (AFHomeInfo *)[(AFHomeInfo *)self copy];
    }
  }
  else
  {
    id v6 = (AFHomeInfo *)[(AFHomeInfo *)self copy];
  }

  return v6;
}

@end