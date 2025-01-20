@interface ARPHomeControlSuggestion
+ (BOOL)supportsSecureCoding;
- (ARPHomeControlSuggestion)initWithCoder:(id)a3;
- (ARPHomeControlSuggestion)initWithHomeUUID:(id)a3 targetUUID:(id)a4 accessoryServiceUUID:(id)a5 type:(int64_t)a6 score:(double)a7 computedScore:(double)a8 suggestionReason:(id)a9;
- (ARPHomeControlSuggestion)initWithHomeUUID:(id)a3 targetUUID:(id)a4 accessoryServiceUUID:(id)a5 type:(int64_t)a6 score:(double)a7 suggestionReason:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSString)accessoryServiceUUID;
- (NSString)homeUUID;
- (NSString)suggestionReason;
- (NSString)targetUUID;
- (double)computedScore;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryServiceUUID:(id)a3;
- (void)setComputedScore:(double)a3;
- (void)setHomeUUID:(id)a3;
- (void)setScore:(double)a3;
- (void)setSuggestionReason:(id)a3;
- (void)setTargetUUID:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation ARPHomeControlSuggestion

- (ARPHomeControlSuggestion)initWithHomeUUID:(id)a3 targetUUID:(id)a4 accessoryServiceUUID:(id)a5 type:(int64_t)a6 score:(double)a7 suggestionReason:(id)a8
{
  return [(ARPHomeControlSuggestion *)self initWithHomeUUID:a3 targetUUID:a4 accessoryServiceUUID:a5 type:a6 score:a8 computedScore:a7 suggestionReason:a7];
}

- (ARPHomeControlSuggestion)initWithHomeUUID:(id)a3 targetUUID:(id)a4 accessoryServiceUUID:(id)a5 type:(int64_t)a6 score:(double)a7 computedScore:(double)a8 suggestionReason:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  v30.receiver = self;
  v30.super_class = (Class)ARPHomeControlSuggestion;
  v20 = [(ARPHomeControlSuggestion *)&v30 init];
  if (v20)
  {
    uint64_t v21 = [v16 copy];
    homeUUID = v20->_homeUUID;
    v20->_homeUUID = (NSString *)v21;

    uint64_t v23 = [v17 copy];
    targetUUID = v20->_targetUUID;
    v20->_targetUUID = (NSString *)v23;

    uint64_t v25 = [v18 copy];
    accessoryServiceUUID = v20->_accessoryServiceUUID;
    v20->_accessoryServiceUUID = (NSString *)v25;

    v20->_type = a6;
    v20->_score = a7;
    v20->_computedScore = a8;
    uint64_t v27 = [v19 copy];
    suggestionReason = v20->_suggestionReason;
    v20->_suggestionReason = (NSString *)v27;
  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ARPHomeControlSuggestion *)self type];
  v6 = NSStringFromSelector(sel_type);
  [v4 encodeInteger:v5 forKey:v6];

  [(ARPHomeControlSuggestion *)self score];
  double v8 = v7;
  v9 = NSStringFromSelector(sel_score);
  [v4 encodeDouble:v9 forKey:v8];

  v10 = [(ARPHomeControlSuggestion *)self homeUUID];
  v11 = NSStringFromSelector(sel_homeUUID);
  [v4 encodeObject:v10 forKey:v11];

  v12 = [(ARPHomeControlSuggestion *)self targetUUID];
  v13 = NSStringFromSelector(sel_targetUUID);
  [v4 encodeObject:v12 forKey:v13];

  v14 = [(ARPHomeControlSuggestion *)self accessoryServiceUUID];
  v15 = NSStringFromSelector(sel_accessoryServiceUUID);
  [v4 encodeObject:v14 forKey:v15];

  id v17 = [(ARPHomeControlSuggestion *)self suggestionReason];
  id v16 = NSStringFromSelector(sel_suggestionReason);
  [v4 encodeObject:v17 forKey:v16];
}

- (ARPHomeControlSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = NSStringFromSelector(sel_type);
  uint64_t v6 = (int)[v4 decodeIntForKey:v5];

  double v7 = NSStringFromSelector(sel_score);
  [v4 decodeDoubleForKey:v7];
  double v9 = v8;

  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_homeUUID);
  v12 = [v4 decodeObjectOfClass:v10 forKey:v11];

  uint64_t v13 = objc_opt_class();
  v14 = NSStringFromSelector(sel_targetUUID);
  v15 = [v4 decodeObjectOfClass:v13 forKey:v14];

  uint64_t v16 = objc_opt_class();
  id v17 = NSStringFromSelector(sel_accessoryServiceUUID);
  id v18 = [v4 decodeObjectOfClass:v16 forKey:v17];

  uint64_t v19 = objc_opt_class();
  v20 = NSStringFromSelector(sel_suggestionReason);
  uint64_t v21 = [v4 decodeObjectOfClass:v19 forKey:v20];

  v22 = [(ARPHomeControlSuggestion *)self initWithHomeUUID:v12 targetUUID:v15 accessoryServiceUUID:v18 type:v6 score:v21 suggestionReason:v9];
  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_homeUUID hash];
  NSUInteger v4 = [(NSString *)self->_targetUUID hash] ^ v3;
  return v4 ^ [(NSString *)self->_accessoryServiceUUID hash] ^ self->_type;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ARPHomeControlSuggestion *)a3;
  int64_t v5 = v4;
  if (self == v4)
  {
    BOOL v25 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        uint64_t v7 = [(ARPHomeControlSuggestion *)self homeUUID];
        if (!v7) {
          goto LABEL_20;
        }
        double v8 = (void *)v7;
        uint64_t v9 = [(ARPHomeControlSuggestion *)self targetUUID];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = [(ARPHomeControlSuggestion *)v6 homeUUID];
          if (v11)
          {
            v12 = (void *)v11;
            uint64_t v13 = [(ARPHomeControlSuggestion *)v6 targetUUID];
            if (v13)
            {
              v14 = (void *)v13;
              uint64_t v15 = [(ARPHomeControlSuggestion *)self accessoryServiceUUID];
              if (v15)
              {
                uint64_t v16 = (void *)v15;
                id v17 = [(ARPHomeControlSuggestion *)v6 accessoryServiceUUID];

                if (v17)
                {
                  id v18 = [(ARPHomeControlSuggestion *)self homeUUID];
                  uint64_t v19 = [(ARPHomeControlSuggestion *)v6 homeUUID];
                  if ([v18 isEqualToString:v19])
                  {
                    v20 = [(ARPHomeControlSuggestion *)self targetUUID];
                    uint64_t v21 = [(ARPHomeControlSuggestion *)v6 targetUUID];
                    if ([v20 isEqualToString:v21])
                    {
                      v22 = [(ARPHomeControlSuggestion *)self accessoryServiceUUID];
                      uint64_t v23 = [(ARPHomeControlSuggestion *)v6 accessoryServiceUUID];
                      if ([v22 isEqualToString:v23])
                      {
                        int64_t v24 = [(ARPHomeControlSuggestion *)self type];
                        BOOL v25 = v24 == [(ARPHomeControlSuggestion *)v6 type];
                      }
                      else
                      {
                        BOOL v25 = 0;
                      }

                      goto LABEL_33;
                    }
                    goto LABEL_30;
                  }
                  goto LABEL_28;
                }
LABEL_20:
                uint64_t v26 = [(ARPHomeControlSuggestion *)self homeUUID];
                if (!v26) {
                  goto LABEL_27;
                }
                id v18 = (void *)v26;
                uint64_t v27 = [(ARPHomeControlSuggestion *)self targetUUID];
                if (!v27)
                {
                  BOOL v25 = 0;
LABEL_35:

                  goto LABEL_36;
                }
                uint64_t v19 = (void *)v27;
                uint64_t v28 = [(ARPHomeControlSuggestion *)v6 homeUUID];
                if (!v28) {
                  goto LABEL_28;
                }
                v29 = (void *)v28;
                objc_super v30 = [(ARPHomeControlSuggestion *)v6 targetUUID];

                if (!v30)
                {
LABEL_27:
                  BOOL v25 = 0;
LABEL_36:

                  goto LABEL_37;
                }
                id v18 = [(ARPHomeControlSuggestion *)self homeUUID];
                uint64_t v19 = [(ARPHomeControlSuggestion *)v6 homeUUID];
                if ([v18 isEqualToString:v19])
                {
                  v20 = [(ARPHomeControlSuggestion *)self targetUUID];
                  uint64_t v21 = [(ARPHomeControlSuggestion *)v6 targetUUID];
                  if ([v20 isEqualToString:v21])
                  {
                    int64_t v31 = [(ARPHomeControlSuggestion *)self type];
                    BOOL v25 = v31 == [(ARPHomeControlSuggestion *)v6 type];
LABEL_33:

                    goto LABEL_34;
                  }
LABEL_30:
                  BOOL v25 = 0;
                  goto LABEL_33;
                }
LABEL_28:
                BOOL v25 = 0;
LABEL_34:

                goto LABEL_35;
              }
            }
          }
        }
        goto LABEL_20;
      }
    }
    BOOL v25 = 0;
  }
LABEL_37:

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [+[ARPHomeControlSuggestion allocWithZone:a3] init];
  [(ARPHomeControlSuggestion *)v4 setType:[(ARPHomeControlSuggestion *)self type]];
  int64_t v5 = [(ARPHomeControlSuggestion *)self homeUUID];
  [(ARPHomeControlSuggestion *)v4 setHomeUUID:v5];

  uint64_t v6 = [(ARPHomeControlSuggestion *)self targetUUID];
  [(ARPHomeControlSuggestion *)v4 setTargetUUID:v6];

  uint64_t v7 = [(ARPHomeControlSuggestion *)self accessoryServiceUUID];
  [(ARPHomeControlSuggestion *)v4 setAccessoryServiceUUID:v7];

  [(ARPHomeControlSuggestion *)self score];
  -[ARPHomeControlSuggestion setScore:](v4, "setScore:");
  double v8 = [(ARPHomeControlSuggestion *)self suggestionReason];
  [(ARPHomeControlSuggestion *)v4 setSuggestionReason:v8];

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(ARPHomeControlSuggestion *)self suggestionReason];
  uint64_t v6 = [(ARPHomeControlSuggestion *)self homeUUID];
  uint64_t v7 = [(ARPHomeControlSuggestion *)self targetUUID];
  double v8 = [(ARPHomeControlSuggestion *)self accessoryServiceUUID];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[ARPHomeControlSuggestion type](self, "type"));
  uint64_t v10 = NSNumber;
  [(ARPHomeControlSuggestion *)self score];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  v12 = [v3 stringWithFormat:@"<%@ %p> reason: %@, homeUUID: %@, targetUUID: %@, accessoryServiceUUID: %@, type: %@, score: %@", v4, self, v5, v6, v7, v8, v9, v11];

  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
}

- (NSString)targetUUID
{
  return self->_targetUUID;
}

- (void)setTargetUUID:(id)a3
{
}

- (NSString)accessoryServiceUUID
{
  return self->_accessoryServiceUUID;
}

- (void)setAccessoryServiceUUID:(id)a3
{
}

- (NSString)suggestionReason
{
  return self->_suggestionReason;
}

- (void)setSuggestionReason:(id)a3
{
}

- (double)computedScore
{
  return self->_computedScore;
}

- (void)setComputedScore:(double)a3
{
  self->_computedScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionReason, 0);
  objc_storeStrong((id *)&self->_accessoryServiceUUID, 0);
  objc_storeStrong((id *)&self->_targetUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

@end