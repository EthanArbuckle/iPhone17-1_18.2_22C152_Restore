@interface DNDStateUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDState)previousState;
- (DNDState)state;
- (DNDStateUpdate)initWithCoder:(id)a3;
- (DNDStateUpdate)initWithPreviousState:(id)a3 state:(id)a4 reason:(unint64_t)a5 source:(int64_t)a6 options:(int64_t)a7;
- (id)description;
- (int64_t)options;
- (int64_t)source;
- (unint64_t)hash;
- (unint64_t)reason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDStateUpdate

- (DNDStateUpdate)initWithPreviousState:(id)a3 state:(id)a4 reason:(unint64_t)a5 source:(int64_t)a6 options:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DNDStateUpdate;
  v14 = [(DNDStateUpdate *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    previousState = v14->_previousState;
    v14->_previousState = (DNDState *)v15;

    uint64_t v17 = [v13 copy];
    state = v14->_state;
    v14->_state = (DNDState *)v17;

    v14->_reason = a5;
    v14->_source = a6;
    v14->_options = a7;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(DNDStateUpdate *)self previousState];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDStateUpdate *)self state];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(DNDStateUpdate *)self reason];
  int64_t v8 = v7 ^ [(DNDStateUpdate *)self source];
  unint64_t v9 = v6 ^ v8 ^ [(DNDStateUpdate *)self options];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (DNDStateUpdate *)a3;
  if (self == v6)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v7 = v6;
      int64_t v8 = [(DNDStateUpdate *)self previousState];
      unint64_t v9 = [(DNDStateUpdate *)v7 previousState];
      if (v8 != v9)
      {
        uint64_t v10 = [(DNDStateUpdate *)self previousState];
        if (!v10)
        {
          BOOL v13 = 0;
          goto LABEL_34;
        }
        v3 = (void *)v10;
        v11 = [(DNDStateUpdate *)v7 previousState];
        if (!v11)
        {
          BOOL v13 = 0;
LABEL_33:

          goto LABEL_34;
        }
        id v12 = [(DNDStateUpdate *)self previousState];
        uint64_t v4 = [(DNDStateUpdate *)v7 previousState];
        if (![v12 isEqual:v4])
        {
          BOOL v13 = 0;
LABEL_32:

          goto LABEL_33;
        }
        v28 = v4;
        v29 = v12;
        v30 = v11;
      }
      v14 = [(DNDStateUpdate *)self state];
      uint64_t v15 = [(DNDStateUpdate *)v7 state];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDStateUpdate *)self state];
        if (!v16) {
          goto LABEL_22;
        }
        uint64_t v4 = (void *)v16;
        uint64_t v17 = [(DNDStateUpdate *)v7 state];
        if (!v17)
        {
          BOOL v13 = 0;
LABEL_29:

          goto LABEL_30;
        }
        v18 = (void *)v17;
        v24 = v3;
        v19 = [(DNDStateUpdate *)self state];
        v26 = [(DNDStateUpdate *)v7 state];
        v27 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          BOOL v13 = 0;
          v3 = v24;
LABEL_28:

          goto LABEL_29;
        }
        v25 = v18;
        v3 = v24;
      }
      unint64_t v20 = [(DNDStateUpdate *)self reason];
      if (v20 == [(DNDStateUpdate *)v7 reason])
      {
        int64_t v21 = [(DNDStateUpdate *)self source];
        if (v21 == [(DNDStateUpdate *)v7 source])
        {
          int64_t v22 = [(DNDStateUpdate *)self options];
          BOOL v13 = v22 == [(DNDStateUpdate *)v7 options];
          v18 = v25;
          if (v14 == v15) {
            goto LABEL_30;
          }
          goto LABEL_28;
        }
      }
      if (v14 == v15)
      {
        BOOL v13 = 0;
LABEL_30:

LABEL_31:
        id v12 = v29;
        v11 = v30;
        uint64_t v4 = v28;
        if (v8 != v9) {
          goto LABEL_32;
        }
LABEL_34:

        goto LABEL_35;
      }

LABEL_22:
      BOOL v13 = 0;
      goto LABEL_31;
    }
    BOOL v13 = 0;
  }
LABEL_35:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = DNDStateUpdateReasonToString([(DNDStateUpdate *)self reason]);
  uint64_t v6 = DNDStateUpdateSourceToString([(DNDStateUpdate *)self source]);
  unint64_t v7 = DNDStateUpdateOptionsToString([(DNDStateUpdate *)self options]);
  int64_t v8 = [(DNDStateUpdate *)self state];
  unint64_t v9 = [(DNDStateUpdate *)self previousState];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; reason: %@; source: %@; options: %@; state: %@; previousState: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  uint64_t v10 = v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDStateUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousState"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"reason"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"options"];
  if ([v4 containsValueForKey:@"source"]) {
    uint64_t v9 = [v4 decodeIntegerForKey:@"source"];
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [(DNDStateUpdate *)self initWithPreviousState:v5 state:v6 reason:v7 source:v9 options:v8];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(DNDStateUpdate *)self previousState];
  [v6 encodeObject:v4 forKey:@"previousState"];

  v5 = [(DNDStateUpdate *)self state];
  [v6 encodeObject:v5 forKey:@"state"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[DNDStateUpdate reason](self, "reason"), @"reason");
  objc_msgSend(v6, "encodeInteger:forKey:", -[DNDStateUpdate source](self, "source"), @"source");
  objc_msgSend(v6, "encodeInteger:forKey:", -[DNDStateUpdate options](self, "options"), @"options");
}

- (DNDState)previousState
{
  return self->_previousState;
}

- (DNDState)state
{
  return self->_state;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (int64_t)source
{
  return self->_source;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
}

@end