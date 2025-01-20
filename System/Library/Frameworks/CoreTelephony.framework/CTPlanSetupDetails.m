@interface CTPlanSetupDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)inBuddy;
- (BOOL)isEqual:(id)a3;
- (CTPlanSetupDetails)initWithCoder:(id)a3;
- (CTPlanSetupDetails)initWithInBuddy:(BOOL)a3 carrierName:(id)a4 setupType:(unint64_t)a5 setupResult:(unint64_t)a6 duration:(unint64_t)a7;
- (NSString)carrierName;
- (id)description;
- (unint64_t)duration;
- (unint64_t)setupResult;
- (unint64_t)setupType;
- (void)encodeWithCoder:(id)a3;
- (void)setCarrierName:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setInBuddy:(BOOL)a3;
- (void)setSetupResult:(unint64_t)a3;
- (void)setSetupType:(unint64_t)a3;
@end

@implementation CTPlanSetupDetails

- (CTPlanSetupDetails)initWithInBuddy:(BOOL)a3 carrierName:(id)a4 setupType:(unint64_t)a5 setupResult:(unint64_t)a6 duration:(unint64_t)a7
{
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CTPlanSetupDetails;
  v14 = [(CTPlanSetupDetails *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_inBuddy = a3;
    objc_storeStrong((id *)&v14->_carrierName, a4);
    v15->_setupType = a5;
    v15->_setupResult = a6;
    v15->_duration = a7;
  }

  return v15;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  BOOL v4 = [(CTPlanSetupDetails *)self inBuddy];
  v5 = "NO";
  if (v4) {
    v5 = "YES";
  }
  objc_msgSend(v3, "appendFormat:", @" inBuddy=%s", v5);
  v6 = [(CTPlanSetupDetails *)self carrierName];

  if (v6)
  {
    v7 = [(CTPlanSetupDetails *)self carrierName];
    [v3 appendFormat:@" carrierName=%@", v7];
  }
  objc_msgSend(v3, "appendFormat:", @" setupType=%s", CTPlanSetupTypeAsString(-[CTPlanSetupDetails setupType](self, "setupType")));
  objc_msgSend(v3, "appendFormat:", @" setupResult=%s", CTPlanSetupResultTypeAsString(-[CTPlanSetupDetails setupResult](self, "setupResult")));
  objc_msgSend(v3, "appendFormat:", @" duration=%lu", -[CTPlanSetupDetails duration](self, "duration"));
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (CTPlanSetupDetails *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (BOOL v5 = [(CTPlanSetupDetails *)self inBuddy], v5 == [(CTPlanSetupDetails *)v4 inBuddy]))
    {
      v7 = [(CTPlanSetupDetails *)self carrierName];
      v8 = [(CTPlanSetupDetails *)v4 carrierName];
      if ([v7 isEqualToString:v8]
        && (unint64_t v9 = [(CTPlanSetupDetails *)self setupType],
            v9 == [(CTPlanSetupDetails *)v4 setupType])
        && (unint64_t v10 = [(CTPlanSetupDetails *)self setupResult],
            v10 == [(CTPlanSetupDetails *)v4 setupResult]))
      {
        unint64_t v11 = [(CTPlanSetupDetails *)self duration];
        BOOL v6 = v11 == [(CTPlanSetupDetails *)v4 duration];
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanSetupDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTPlanSetupDetails;
  BOOL v5 = [(CTPlanSetupDetails *)&v9 init];
  if (v5)
  {
    v5->_inBuddy = [v4 decodeBoolForKey:@"inBuddy"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierName"];
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v6;

    v5->_setupType = [v4 decodeIntegerForKey:@"setupType"];
    v5->_setupResult = [v4 decodeIntegerForKey:@"setupResult"];
    v5->_duration = [v4 decodeIntegerForKey:@"duration"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[CTPlanSetupDetails inBuddy](self, "inBuddy"), @"inBuddy");
  id v4 = [(CTPlanSetupDetails *)self carrierName];
  [v5 encodeObject:v4 forKey:@"carrierName"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTPlanSetupDetails setupType](self, "setupType"), @"setupType");
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTPlanSetupDetails setupResult](self, "setupResult"), @"setupResult");
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTPlanSetupDetails duration](self, "duration"), @"duration");
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (NSString)carrierName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCarrierName:(id)a3
{
}

- (unint64_t)setupType
{
  return self->_setupType;
}

- (void)setSetupType:(unint64_t)a3
{
  self->_setupType = a3;
}

- (unint64_t)setupResult
{
  return self->_setupResult;
}

- (void)setSetupResult:(unint64_t)a3
{
  self->_setupResult = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
}

@end