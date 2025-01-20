@interface DNDClientEventBehavior
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDClientEventBehavior)initWithCoder:(id)a3;
- (DNDClientEventBehavior)initWithEventDetails:(id)a3 interruptionSuppression:(unint64_t)a4 intelligentBehavior:(int64_t)a5 resolutionReason:(unint64_t)a6 activeModeUUID:(id)a7;
- (DNDClientEventDetails)eventDetails;
- (NSString)redactedDescription;
- (NSUUID)activeModeUUID;
- (id)_descriptionForRedacted:(BOOL)a3;
- (id)description;
- (int64_t)intelligentBehavior;
- (unint64_t)hash;
- (unint64_t)interruptionSuppression;
- (unint64_t)resolutionReason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDClientEventBehavior

- (DNDClientEventBehavior)initWithEventDetails:(id)a3 interruptionSuppression:(unint64_t)a4 intelligentBehavior:(int64_t)a5 resolutionReason:(unint64_t)a6 activeModeUUID:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)DNDClientEventBehavior;
  v14 = [(DNDClientEventBehavior *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    eventDetails = v14->_eventDetails;
    v14->_eventDetails = (DNDClientEventDetails *)v15;

    v14->_interruptionSuppression = a4;
    v14->_intelligentBehavior = a5;
    v14->_resolutionReason = a6;
    uint64_t v17 = [v13 copy];
    activeModeUUID = v14->_activeModeUUID;
    v14->_activeModeUUID = (NSUUID *)v17;
  }
  return v14;
}

- (unint64_t)hash
{
  v3 = [(DNDClientEventBehavior *)self eventDetails];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(DNDClientEventBehavior *)self interruptionSuppression];
  int64_t v6 = v5 ^ [(DNDClientEventBehavior *)self intelligentBehavior] ^ v4;
  unint64_t v7 = [(DNDClientEventBehavior *)self resolutionReason];
  v8 = [(DNDClientEventBehavior *)self activeModeUUID];
  unint64_t v9 = v6 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v8 = (DNDClientEventBehavior *)a3;
  if (self == v8)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v9 = v8;
      v10 = [(DNDClientEventBehavior *)self eventDetails];
      v11 = [(DNDClientEventBehavior *)v9 eventDetails];
      if (v10 != v11)
      {
        uint64_t v12 = [(DNDClientEventBehavior *)self eventDetails];
        if (!v12)
        {
          BOOL v14 = 0;
          goto LABEL_25;
        }
        v3 = (void *)v12;
        uint64_t v4 = [(DNDClientEventBehavior *)v9 eventDetails];
        if (!v4)
        {
          char v13 = 0;
LABEL_24:

          BOOL v14 = v13;
          goto LABEL_25;
        }
        unint64_t v5 = [(DNDClientEventBehavior *)self eventDetails];
        int64_t v6 = [(DNDClientEventBehavior *)v9 eventDetails];
        if (![v5 isEqual:v6])
        {
          char v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      unint64_t v15 = [(DNDClientEventBehavior *)self interruptionSuppression];
      if (v15 == [(DNDClientEventBehavior *)v9 interruptionSuppression])
      {
        int64_t v16 = [(DNDClientEventBehavior *)self intelligentBehavior];
        if (v16 == [(DNDClientEventBehavior *)v9 intelligentBehavior])
        {
          unint64_t v17 = [(DNDClientEventBehavior *)self resolutionReason];
          if (v17 == [(DNDClientEventBehavior *)v9 resolutionReason])
          {
            v18 = [(DNDClientEventBehavior *)self activeModeUUID];
            uint64_t v19 = [(DNDClientEventBehavior *)v9 activeModeUUID];
            if (v18 == (void *)v19)
            {

              char v13 = 1;
              BOOL v14 = 1;
              goto LABEL_22;
            }
            v27 = (void *)v19;
            uint64_t v20 = [(DNDClientEventBehavior *)self activeModeUUID];
            if (v20)
            {
              v26 = (void *)v20;
              v21 = [(DNDClientEventBehavior *)v9 activeModeUUID];
              if (v21)
              {
                v25 = v21;
                v24 = [(DNDClientEventBehavior *)self activeModeUUID];
                v23 = [(DNDClientEventBehavior *)v9 activeModeUUID];
                char v13 = [v24 isEqual:v23];

                v21 = v25;
              }
              else
              {
                char v13 = 0;
              }

              BOOL v14 = v13;
LABEL_22:
              if (v10 != v11) {
                goto LABEL_23;
              }
LABEL_25:

              goto LABEL_26;
            }
          }
        }
      }
      char v13 = 0;
      BOOL v14 = 0;
      goto LABEL_22;
    }
    BOOL v14 = 0;
  }
LABEL_26:

  return v14;
}

- (id)description
{
  return [(DNDClientEventBehavior *)self _descriptionForRedacted:0];
}

- (NSString)redactedDescription
{
  return (NSString *)[(DNDClientEventBehavior *)self _descriptionForRedacted:1];
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = NSString;
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = [(DNDClientEventBehavior *)self eventDetails];
  v8 = v7;
  unint64_t v9 = v7;
  if (v3)
  {
    unint64_t v9 = [v7 redactedDescription];
  }
  v10 = DNDStringFromInterruptionSuppression([(DNDClientEventBehavior *)self interruptionSuppression]);
  v11 = DNDIntelligentInterruptionBehaviorToString([(DNDClientEventBehavior *)self intelligentBehavior]);
  uint64_t v12 = DNDResolutionReasonToString([(DNDClientEventBehavior *)self resolutionReason]);
  char v13 = [(DNDClientEventBehavior *)self activeModeUUID];
  objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; eventDetails: %@; interruptionSuppression: %@; intelligentBehavior: %@; resolutionReason: %@; activeModeUUID: %@>",
    v6,
    self,
    v9,
    v10,
    v11,
    v12,
  BOOL v14 = v13);

  if (v3) {
  return v14;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDClientEventBehavior)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDetails"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"interruptionSuppression"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"intelligentBehavior"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"resolutionReason"];
  unint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeModeUUID"];

  v10 = [(DNDClientEventBehavior *)self initWithEventDetails:v5 interruptionSuppression:v6 intelligentBehavior:v7 resolutionReason:v8 activeModeUUID:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DNDClientEventBehavior *)self eventDetails];
  [v4 encodeObject:v5 forKey:@"eventDetails"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventBehavior interruptionSuppression](self, "interruptionSuppression"), @"interruptionSuppression");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventBehavior intelligentBehavior](self, "intelligentBehavior"), @"intelligentBehavior");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventBehavior resolutionReason](self, "resolutionReason"), @"resolutionReason");
  id v6 = [(DNDClientEventBehavior *)self activeModeUUID];
  [v4 encodeObject:v6 forKey:@"activeModeUUID"];
}

- (DNDClientEventDetails)eventDetails
{
  return self->_eventDetails;
}

- (unint64_t)interruptionSuppression
{
  return self->_interruptionSuppression;
}

- (int64_t)intelligentBehavior
{
  return self->_intelligentBehavior;
}

- (unint64_t)resolutionReason
{
  return self->_resolutionReason;
}

- (NSUUID)activeModeUUID
{
  return self->_activeModeUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeModeUUID, 0);
  objc_storeStrong((id *)&self->_eventDetails, 0);
}

@end