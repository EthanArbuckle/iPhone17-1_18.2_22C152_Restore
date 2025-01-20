@interface CTSimDeactivationEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNetworkInitiated;
- (BOOL)isRoaming;
- (CTSimDeactivationEvent)initWithCoder:(id)a3;
- (NSString)networkPlmn;
- (NSString)rat;
- (NSString)reasonCode;
- (id)description;
- (int64_t)timeOfEvent;
- (unint64_t)sourceType;
- (void)encodeWithCoder:(id)a3;
- (void)setIsNetworkInitiated:(BOOL)a3;
- (void)setIsRoaming:(BOOL)a3;
- (void)setNetworkPlmn:(id)a3;
- (void)setRat:(id)a3;
- (void)setReasonCode:(id)a3;
- (void)setSourceType:(unint64_t)a3;
- (void)setTimeOfEvent:(int64_t)a3;
@end

@implementation CTSimDeactivationEvent

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  unint64_t v4 = [(CTSimDeactivationEvent *)self sourceType];
  v5 = "CTSimDeactivationEventSourceTypeUnknown";
  if (v4 == 1) {
    v5 = "CTSimDeactivationEventSourceTypeCellular";
  }
  if (v4 == 2) {
    v5 = "CTSimDeactivationEventSourceTypeCarrierEntitlement";
  }
  [v3 appendFormat:@", sourceType=%s", v5];
  v6 = [(CTSimDeactivationEvent *)self reasonCode];
  [v3 appendFormat:@", reasonCode=%@", v6];

  v7 = [(CTSimDeactivationEvent *)self networkPlmn];
  [v3 appendFormat:@", networkPlmn=%@", v7];

  [v3 appendFormat:@", isRoaming=%hhd", -[CTSimDeactivationEvent isRoaming](self, "isRoaming")];
  [v3 appendFormat:@", isNetworkInitiated=%hhd", -[CTSimDeactivationEvent isNetworkInitiated](self, "isNetworkInitiated")];
  v8 = [(CTSimDeactivationEvent *)self rat];
  [v3 appendFormat:@", rat=%@", v8];

  [v3 appendFormat:@", timeOfEvent=%ld", -[CTSimDeactivationEvent timeOfEvent](self, "timeOfEvent")];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sourceType = self->_sourceType;
  id v5 = a3;
  [v5 encodeInteger:sourceType forKey:@"sourceType"];
  [v5 encodeObject:self->_reasonCode forKey:@"reasonCode"];
  [v5 encodeObject:self->_networkPlmn forKey:@"networkPlmn"];
  [v5 encodeBool:self->_isRoaming forKey:@"isRoaming"];
  [v5 encodeBool:self->_isNetworkInitiated forKey:@"isNetworkInitiated"];
  [v5 encodeObject:self->_rat forKey:@"rat"];
  [v5 encodeDouble:@"timeOfEvent" forKey:(double)self->_timeOfEvent];
}

- (CTSimDeactivationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTSimDeactivationEvent;
  id v5 = [(CTSimDeactivationEvent *)&v14 init];
  if (v5)
  {
    v5->_unint64_t sourceType = [v4 decodeIntegerForKey:@"sourceType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reasonCode"];
    reasonCode = v5->_reasonCode;
    v5->_reasonCode = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkPlmn"];
    networkPlmn = v5->_networkPlmn;
    v5->_networkPlmn = (NSString *)v8;

    v5->_isRoaming = [v4 decodeBoolForKey:@"isRoaming"];
    v5->_isNetworkInitiated = [v4 decodeBoolForKey:@"isNetworkInitiated"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rat"];
    rat = v5->_rat;
    v5->_rat = (NSString *)v10;

    [v4 decodeDoubleForKey:@"timeOfEvent"];
    v5->_timeOfEvent = (uint64_t)v12;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v7 = (CTSimDeactivationEvent *)a3;
  uint64_t v8 = v7;
  if (v7)
  {
    if (v7 == self)
    {
      BOOL v12 = 1;
      goto LABEL_30;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v9 = [(CTSimDeactivationEvent *)self sourceType];
      if (v9 == [(CTSimDeactivationEvent *)v8 sourceType])
      {
        uint64_t v10 = [(CTSimDeactivationEvent *)self reasonCode];
        v11 = [(CTSimDeactivationEvent *)v8 reasonCode];
        if (v10 != v11)
        {
          v3 = [(CTSimDeactivationEvent *)self reasonCode];
          id v4 = [(CTSimDeactivationEvent *)v8 reasonCode];
          if (![v3 isEqualToString:v4])
          {
            BOOL v12 = 0;
            goto LABEL_28;
          }
        }
        v13 = [(CTSimDeactivationEvent *)self networkPlmn];
        objc_super v14 = [(CTSimDeactivationEvent *)v8 networkPlmn];
        if (v13 != v14)
        {
          v15 = [(CTSimDeactivationEvent *)self networkPlmn];
          id v5 = [(CTSimDeactivationEvent *)v8 networkPlmn];
          if (![v15 isEqualToString:v5])
          {
            BOOL v12 = 0;
            goto LABEL_26;
          }
          v26 = v15;
        }
        BOOL v16 = [(CTSimDeactivationEvent *)self isRoaming];
        if (v16 != [(CTSimDeactivationEvent *)v8 isRoaming]
          || (BOOL v17 = [(CTSimDeactivationEvent *)self isNetworkInitiated],
              v17 != [(CTSimDeactivationEvent *)v8 isNetworkInitiated]))
        {
          BOOL v12 = 0;
          v15 = v26;
          if (v13 == v14) {
            goto LABEL_27;
          }
          goto LABEL_26;
        }
        v25 = [(CTSimDeactivationEvent *)self rat];
        v24 = [(CTSimDeactivationEvent *)v8 rat];
        if (v25 == v24)
        {
          v22 = v3;
        }
        else
        {
          v18 = [(CTSimDeactivationEvent *)self rat];
          v21 = [(CTSimDeactivationEvent *)v8 rat];
          v23 = v18;
          if (!objc_msgSend(v18, "isEqualToString:"))
          {
            BOOL v12 = 0;
            v15 = v26;
            goto LABEL_25;
          }
          v22 = v3;
        }
        v15 = v26;
        int64_t v19 = [(CTSimDeactivationEvent *)self timeOfEvent];
        BOOL v12 = v19 == [(CTSimDeactivationEvent *)v8 timeOfEvent];
        if (v25 == v24)
        {

          v3 = v22;
          if (v13 == v14)
          {
LABEL_27:

            if (v10 == v11)
            {
LABEL_29:

              goto LABEL_30;
            }
LABEL_28:

            goto LABEL_29;
          }
LABEL_26:

          goto LABEL_27;
        }
        v3 = v22;
LABEL_25:

        if (v13 == v14) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
    }
  }
  BOOL v12 = 0;
LABEL_30:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_unint64_t sourceType = a3;
}

- (NSString)reasonCode
{
  return self->_reasonCode;
}

- (void)setReasonCode:(id)a3
{
}

- (NSString)networkPlmn
{
  return self->_networkPlmn;
}

- (void)setNetworkPlmn:(id)a3
{
}

- (BOOL)isRoaming
{
  return self->_isRoaming;
}

- (void)setIsRoaming:(BOOL)a3
{
  self->_isRoaming = a3;
}

- (BOOL)isNetworkInitiated
{
  return self->_isNetworkInitiated;
}

- (void)setIsNetworkInitiated:(BOOL)a3
{
  self->_isNetworkInitiated = a3;
}

- (NSString)rat
{
  return self->_rat;
}

- (void)setRat:(id)a3
{
}

- (int64_t)timeOfEvent
{
  return self->_timeOfEvent;
}

- (void)setTimeOfEvent:(int64_t)a3
{
  self->_timeOfEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rat, 0);
  objc_storeStrong((id *)&self->_networkPlmn, 0);

  objc_storeStrong((id *)&self->_reasonCode, 0);
}

@end