@interface AFExperimentState
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFExperimentState)init;
- (AFExperimentState)initWithBuilder:(id)a3;
- (AFExperimentState)initWithCoder:(id)a3;
- (AFExperimentState)initWithDictionaryRepresentation:(id)a3;
- (AFExperimentState)initWithLastSyncDate:(id)a3 didEnd:(BOOL)a4 endingGroupIdentifier:(id)a5 version:(id)a6;
- (BOOL)didEnd;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastSyncDate;
- (NSString)description;
- (NSString)endingGroupIdentifier;
- (NSString)version;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFExperimentState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_endingGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
}

- (NSString)version
{
  return self->_version;
}

- (NSString)endingGroupIdentifier
{
  return self->_endingGroupIdentifier;
}

- (BOOL)didEnd
{
  return self->_didEnd;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  lastSyncDate = self->_lastSyncDate;
  if (lastSyncDate) {
    [v3 setObject:lastSyncDate forKey:@"lastSyncDate"];
  }
  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_didEnd];
  [v4 setObject:v6 forKey:@"didEnd"];

  endingGroupIdentifier = self->_endingGroupIdentifier;
  if (endingGroupIdentifier) {
    [v4 setObject:endingGroupIdentifier forKey:@"endingGroupIdentifier"];
  }
  version = self->_version;
  if (version) {
    [v4 setObject:version forKey:@"version"];
  }
  v9 = (void *)[v4 copy];

  return v9;
}

- (AFExperimentState)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"lastSyncDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    v9 = [v5 objectForKey:@"didEnd"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    uint64_t v11 = [v10 BOOLValue];
    v12 = [v5 objectForKey:@"endingGroupIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [v5 objectForKey:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    self = [(AFExperimentState *)self initWithLastSyncDate:v7 didEnd:v11 endingGroupIdentifier:v13 version:v15];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  lastSyncDate = self->_lastSyncDate;
  id v6 = a3;
  [v6 encodeObject:lastSyncDate forKey:@"AFExperimentState::lastSyncDate"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_didEnd];
  [v6 encodeObject:v5 forKey:@"AFExperimentState::didEnd"];

  [v6 encodeObject:self->_endingGroupIdentifier forKey:@"AFExperimentState::endingGroupIdentifier"];
  [v6 encodeObject:self->_version forKey:@"AFExperimentState::version"];
}

- (AFExperimentState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentState::lastSyncDate"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentState::didEnd"];
  uint64_t v7 = [v6 BOOLValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentState::endingGroupIdentifier"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentState::version"];

  id v10 = [(AFExperimentState *)self initWithLastSyncDate:v5 didEnd:v7 endingGroupIdentifier:v8 version:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFExperimentState *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL didEnd = self->_didEnd;
      if (didEnd == [(AFExperimentState *)v5 didEnd])
      {
        uint64_t v7 = [(AFExperimentState *)v5 lastSyncDate];
        lastSyncDate = self->_lastSyncDate;
        if (lastSyncDate == v7 || [(NSDate *)lastSyncDate isEqual:v7])
        {
          v9 = [(AFExperimentState *)v5 endingGroupIdentifier];
          endingGroupIdentifier = self->_endingGroupIdentifier;
          if (endingGroupIdentifier == v9 || [(NSString *)endingGroupIdentifier isEqual:v9])
          {
            uint64_t v11 = [(AFExperimentState *)v5 version];
            version = self->_version;
            BOOL v13 = version == v11 || [(NSString *)version isEqual:v11];
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_lastSyncDate hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_didEnd];
  uint64_t v5 = [v4 hash];
  NSUInteger v6 = v3 ^ [(NSString *)self->_endingGroupIdentifier hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_version hash];

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)AFExperimentState;
  uint64_t v5 = [(AFExperimentState *)&v10 description];
  NSUInteger v6 = (void *)v5;
  NSUInteger v7 = @"YES";
  if (!self->_didEnd) {
    NSUInteger v7 = @"NO";
  }
  v8 = (void *)[v4 initWithFormat:@"%@ {lastSyncDate = %@, BOOL didEnd = %@, endingGroupIdentifier = %@, version = %@}", v5, self->_lastSyncDate, v7, self->_endingGroupIdentifier, self->_version];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(AFExperimentState *)self _descriptionWithIndent:0];
}

- (AFExperimentState)initWithLastSyncDate:(id)a3 didEnd:(BOOL)a4 endingGroupIdentifier:(id)a5 version:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__AFExperimentState_initWithLastSyncDate_didEnd_endingGroupIdentifier_version___block_invoke;
  v18[3] = &unk_1E5928D38;
  BOOL v22 = a4;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  v16 = [(AFExperimentState *)self initWithBuilder:v18];

  return v16;
}

void __79__AFExperimentState_initWithLastSyncDate_didEnd_endingGroupIdentifier_version___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLastSyncDate:v3];
  [v4 setDidEnd:*(unsigned __int8 *)(a1 + 56)];
  [v4 setEndingGroupIdentifier:*(void *)(a1 + 40)];
  [v4 setVersion:*(void *)(a1 + 48)];
}

- (AFExperimentState)init
{
  return [(AFExperimentState *)self initWithBuilder:0];
}

- (AFExperimentState)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFExperimentStateMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFExperimentState;
  uint64_t v5 = [(AFExperimentState *)&v18 init];
  NSUInteger v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFExperimentStateMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFExperimentStateMutation *)v7 isDirty])
    {
      v8 = [(_AFExperimentStateMutation *)v7 getLastSyncDate];
      uint64_t v9 = [v8 copy];
      lastSyncDate = v6->_lastSyncDate;
      v6->_lastSyncDate = (NSDate *)v9;

      v6->_BOOL didEnd = [(_AFExperimentStateMutation *)v7 getDidEnd];
      id v11 = [(_AFExperimentStateMutation *)v7 getEndingGroupIdentifier];
      uint64_t v12 = [v11 copy];
      endingGroupIdentifier = v6->_endingGroupIdentifier;
      v6->_endingGroupIdentifier = (NSString *)v12;

      id v14 = [(_AFExperimentStateMutation *)v7 getVersion];
      uint64_t v15 = [v14 copy];
      version = v6->_version;
      v6->_version = (NSString *)v15;
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
  id v4 = (void (**)(id, _AFExperimentStateMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFExperimentStateMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFExperimentStateMutation *)v5 isDirty])
    {
      NSUInteger v6 = objc_alloc_init(AFExperimentState);
      NSUInteger v7 = [(_AFExperimentStateMutation *)v5 getLastSyncDate];
      uint64_t v8 = [v7 copy];
      lastSyncDate = v6->_lastSyncDate;
      v6->_lastSyncDate = (NSDate *)v8;

      v6->_BOOL didEnd = [(_AFExperimentStateMutation *)v5 getDidEnd];
      id v10 = [(_AFExperimentStateMutation *)v5 getEndingGroupIdentifier];
      uint64_t v11 = [v10 copy];
      endingGroupIdentifier = v6->_endingGroupIdentifier;
      v6->_endingGroupIdentifier = (NSString *)v11;

      id v13 = [(_AFExperimentStateMutation *)v5 getVersion];
      uint64_t v14 = [v13 copy];
      version = v6->_version;
      v6->_version = (NSString *)v14;
    }
    else
    {
      NSUInteger v6 = (AFExperimentState *)[(AFExperimentState *)self copy];
    }
  }
  else
  {
    NSUInteger v6 = (AFExperimentState *)[(AFExperimentState *)self copy];
  }

  return v6;
}

@end