@interface DNDState
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)willSuppressInterruptions;
- (DNDModeConfiguration)activeModeConfiguration;
- (DNDState)initWithCoder:(id)a3;
- (DNDState)initWithSuppressionState:(unint64_t)a3 activeModeAssertionMetadata:(id)a4 startDate:(id)a5 userVisibleTransitionDate:(id)a6 userVisibleTransitionLifetimeType:(unint64_t)a7 activeModeConfiguration:(id)a8;
- (NSArray)activeModeAssertionMetadata;
- (NSArray)activeModeIdentifiers;
- (NSDate)startDate;
- (NSDate)userVisibleTransitionDate;
- (NSString)activeModeIdentifier;
- (NSUUID)activeModeUUID;
- (id)description;
- (unint64_t)hash;
- (unint64_t)suppressionState;
- (unint64_t)userVisibleTransitionLifetimeType;
- (void)encodeWithCoder:(id)a3;
- (void)setOverrideModeIdentifier:(id)a3;
@end

@implementation DNDState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = DNDStringFromInterruptionSuppressionState([(DNDState *)self suppressionState]);
  v6 = [(DNDState *)self startDate];
  v7 = [(DNDState *)self userVisibleTransitionDate];
  v8 = DNDStringFromModeAssertionLifetimeType([(DNDState *)self userVisibleTransitionLifetimeType]);
  v9 = [(DNDState *)self activeModeConfiguration];
  v10 = [v9 shortDescription];
  v11 = [(DNDState *)self activeModeIdentifier];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; suppressionState: %@; startDate: %@; userVisibleTransitionDate: %@; userVisibleTransitionLifetimeType: %@; activeModeConfiguration: %@; activeModeIdentifier: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v10,
  v12 = v11);

  return v12;
}

- (unint64_t)userVisibleTransitionLifetimeType
{
  return self->_userVisibleTransitionLifetimeType;
}

- (NSDate)userVisibleTransitionDate
{
  return self->_userVisibleTransitionDate;
}

- (unint64_t)suppressionState
{
  return self->_suppressionState;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)activeModeIdentifier
{
  overrideModeIdentifier = self->_overrideModeIdentifier;
  if (overrideModeIdentifier)
  {
    v3 = overrideModeIdentifier;
  }
  else
  {
    uint64_t v4 = [(DNDState *)self activeModeConfiguration];
    v5 = [v4 mode];
    v3 = [v5 modeIdentifier];
  }
  return v3;
}

- (DNDModeConfiguration)activeModeConfiguration
{
  return self->_activeModeConfiguration;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[DNDState suppressionState](self, "suppressionState"), @"suppressionState");
  uint64_t v4 = [(DNDState *)self activeModeAssertionMetadata];
  [v8 encodeObject:v4 forKey:@"activeModeAssertionMetadata"];

  v5 = [(DNDState *)self startDate];
  [v8 encodeObject:v5 forKey:@"startDate"];

  v6 = [(DNDState *)self userVisibleTransitionDate];
  [v8 encodeObject:v6 forKey:@"userVisibleTransitionDate"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[DNDState userVisibleTransitionLifetimeType](self, "userVisibleTransitionLifetimeType"), @"userVisibleTransitionLifetimeType");
  v7 = [(DNDState *)self activeModeConfiguration];
  [v8 encodeObject:v7 forKey:@"activeModeConfiguration"];

  [v8 encodeObject:self->_overrideModeIdentifier forKey:@"overrideModeIdentifier"];
}

- (NSArray)activeModeAssertionMetadata
{
  v2 = (void *)[(NSArray *)self->_activeModeAssertionMetadata copy];
  return (NSArray *)v2;
}

- (DNDState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"suppressionState"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"activeModeAssertionMetadata"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userVisibleTransitionDate"];
  uint64_t v12 = [v4 decodeIntegerForKey:@"userVisibleTransitionLifetimeType"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeModeConfiguration"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overrideModeIdentifier"];

  v15 = [(DNDState *)self initWithSuppressionState:v5 activeModeAssertionMetadata:v9 startDate:v10 userVisibleTransitionDate:v11 userVisibleTransitionLifetimeType:v12 activeModeConfiguration:v13];
  [(DNDState *)v15 setOverrideModeIdentifier:v14];

  return v15;
}

- (void)setOverrideModeIdentifier:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  overrideModeIdentifier = self->_overrideModeIdentifier;
  p_overrideModeIdentifier = &self->_overrideModeIdentifier;
  v6 = overrideModeIdentifier;
  if (overrideModeIdentifier != v5 && (!v5 || !v6 || ([(NSString *)v6 isEqual:v5] & 1) == 0)) {
    objc_storeStrong((id *)p_overrideModeIdentifier, a3);
  }
  MEMORY[0x1F41817F8]();
}

- (DNDState)initWithSuppressionState:(unint64_t)a3 activeModeAssertionMetadata:(id)a4 startDate:(id)a5 userVisibleTransitionDate:(id)a6 userVisibleTransitionLifetimeType:(unint64_t)a7 activeModeConfiguration:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)DNDState;
  v18 = [(DNDState *)&v28 init];
  v19 = v18;
  if (v18)
  {
    v18->_suppressionState = a3;
    uint64_t v20 = [v14 copy];
    activeModeAssertionMetadata = v19->_activeModeAssertionMetadata;
    v19->_activeModeAssertionMetadata = (NSArray *)v20;

    uint64_t v22 = [v15 copy];
    startDate = v19->_startDate;
    v19->_startDate = (NSDate *)v22;

    uint64_t v24 = [v16 copy];
    userVisibleTransitionDate = v19->_userVisibleTransitionDate;
    v19->_userVisibleTransitionDate = (NSDate *)v24;

    v19->_userVisibleTransitionLifetimeType = a7;
    objc_storeStrong((id *)&v19->_activeModeConfiguration, a8);
    overrideModeIdentifier = v19->_overrideModeIdentifier;
    v19->_overrideModeIdentifier = 0;
  }
  return v19;
}

- (BOOL)isActive
{
  return [(DNDState *)self suppressionState] != 0;
}

- (NSArray)activeModeIdentifiers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(DNDState *)self activeModeAssertionMetadata];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) modeIdentifier];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = [v3 allObjects];

  return (NSArray *)v10;
}

- (NSUUID)activeModeUUID
{
  v2 = [(DNDState *)self activeModeConfiguration];
  id v3 = [v2 mode];
  id v4 = [v3 identifier];

  return (NSUUID *)v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDState *)self suppressionState];
  id v4 = [(DNDState *)self activeModeAssertionMetadata];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [(DNDState *)self userVisibleTransitionDate];
  uint64_t v7 = [v6 hash];
  unint64_t v8 = v5 ^ v7 ^ [(DNDState *)self userVisibleTransitionLifetimeType];
  v9 = [(DNDState *)self activeModeConfiguration];
  uint64_t v10 = v8 ^ [v9 hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_overrideModeIdentifier hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (DNDState *)a3;
  if (self == v5)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      unint64_t v7 = [(DNDState *)self suppressionState];
      if (v7 != [(DNDState *)v6 suppressionState])
      {
        char v15 = 0;
LABEL_52:

        goto LABEL_53;
      }
      unint64_t v8 = [(DNDState *)self activeModeAssertionMetadata];
      v9 = [(DNDState *)v6 activeModeAssertionMetadata];
      if (v8 != v9)
      {
        uint64_t v10 = [(DNDState *)self activeModeAssertionMetadata];
        if (!v10)
        {
          char v15 = 0;
          goto LABEL_51;
        }
        unint64_t v3 = (void *)v10;
        uint64_t v11 = [(DNDState *)v6 activeModeAssertionMetadata];
        if (!v11)
        {
          char v15 = 0;
LABEL_50:

          goto LABEL_51;
        }
        long long v12 = (void *)v11;
        long long v13 = [(DNDState *)self activeModeAssertionMetadata];
        long long v14 = [(DNDState *)v6 activeModeAssertionMetadata];
        if (![v13 isEqual:v14])
        {
          char v15 = 0;
LABEL_49:

          goto LABEL_50;
        }
        v43 = v3;
        v44 = v14;
        v45 = v13;
        v46 = v12;
      }
      id v16 = [(DNDState *)self userVisibleTransitionDate];
      uint64_t v17 = [(DNDState *)v6 userVisibleTransitionDate];
      if (v16 != v17)
      {
        uint64_t v18 = [(DNDState *)self userVisibleTransitionDate];
        if (v18)
        {
          v42 = (void *)v18;
          uint64_t v19 = [(DNDState *)v6 userVisibleTransitionDate];
          if (v19)
          {
            uint64_t v20 = (void *)v19;
            v21 = [(DNDState *)self userVisibleTransitionDate];
            unint64_t v3 = [(DNDState *)v6 userVisibleTransitionDate];
            if ([v21 isEqual:v3])
            {
              v38 = v3;
              v39 = v21;
              v40 = v20;
              goto LABEL_18;
            }
          }
        }

        char v15 = 0;
        goto LABEL_48;
      }
LABEL_18:
      unint64_t v22 = [(DNDState *)self userVisibleTransitionLifetimeType];
      if (v22 == [(DNDState *)v6 userVisibleTransitionLifetimeType])
      {
        v23 = [(DNDState *)self activeModeConfiguration];
        uint64_t v24 = [(DNDState *)v6 activeModeConfiguration];
        if (v23 == v24)
        {
LABEL_29:
          overrideModeIdentifier = self->_overrideModeIdentifier;
          v32 = v6->_overrideModeIdentifier;
          char v15 = overrideModeIdentifier == v32;
          if (overrideModeIdentifier != v32 && overrideModeIdentifier && v32)
          {
            char v15 = -[NSString isEqual:](overrideModeIdentifier, "isEqual:");
            v41 = v23;
            BOOL v33 = v23 == v24;
            v26 = v35;
            if (v33) {
              goto LABEL_44;
            }
            goto LABEL_41;
          }
          if (v23 == v24)
          {
            v41 = v23;
            goto LABEL_44;
          }

LABEL_45:
          if (v16 != v17)
          {
          }
LABEL_48:
          long long v13 = v45;
          long long v12 = v46;
          unint64_t v3 = v43;
          long long v14 = v44;
          if (v8 != v9) {
            goto LABEL_49;
          }
LABEL_51:

          goto LABEL_52;
        }
        v41 = v23;
        uint64_t v25 = [(DNDState *)self activeModeConfiguration];
        if (v25)
        {
          v26 = (void *)v25;
          uint64_t v27 = [(DNDState *)v6 activeModeConfiguration];
          if (!v27)
          {
            char v15 = 0;
LABEL_42:

LABEL_44:
            goto LABEL_45;
          }
          v37 = (void *)v27;
          uint64_t v28 = [(DNDState *)self activeModeConfiguration];
          uint64_t v29 = [(DNDState *)v6 activeModeConfiguration];
          v36 = (void *)v28;
          v30 = (void *)v28;
          unint64_t v3 = (void *)v29;
          if (![v30 isEqual:v29])
          {
            char v15 = 0;
LABEL_41:

            goto LABEL_42;
          }
          v35 = v26;
          v23 = v41;
          goto LABEL_29;
        }
      }
      char v15 = 0;
      goto LABEL_45;
    }
    char v15 = 0;
  }
LABEL_53:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeModeConfiguration, 0);
  objc_storeStrong((id *)&self->_userVisibleTransitionDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_overrideModeIdentifier, 0);
  objc_storeStrong((id *)&self->_activeModeAssertionMetadata, 0);
}

- (BOOL)willSuppressInterruptions
{
  return 0;
}

@end