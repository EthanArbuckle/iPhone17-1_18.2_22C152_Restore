@interface FHSmartCompoundFeatureRankedValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FHSmartCompoundFeatureRankedValue)initWithCoder:(id)a3;
- (FHSmartCompoundFeatureRankedValue)initWithLabelAndIntegerRank:(id)a3 featureRank:(int64_t)a4;
- (FHSmartCompoundFeatureRankedValue)initWithLabelAndRank:(id)a3 featureRank:(id)a4;
- (NSArray)eventIdentifiers;
- (NSDate)eventEndDate;
- (NSDate)eventStartDate;
- (NSDecimalNumber)featureRank;
- (NSString)featureLabel;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEventEndDate:(id)a3;
- (void)setEventIdentifiers:(id)a3;
- (void)setEventStartDate:(id)a3;
@end

@implementation FHSmartCompoundFeatureRankedValue

- (FHSmartCompoundFeatureRankedValue)initWithLabelAndRank:(id)a3 featureRank:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(FHSmartCompoundFeatureRankedValue *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureLabel, a3);
    objc_storeStrong((id *)&v10->_featureRank, a4);
  }

  return v10;
}

- (FHSmartCompoundFeatureRankedValue)initWithLabelAndIntegerRank:(id)a3 featureRank:(int64_t)a4
{
  v6 = (void *)MEMORY[0x263F087B0];
  id v7 = NSNumber;
  id v8 = a3;
  v9 = [v7 numberWithInteger:a4];
  v10 = v9;
  if (v9)
  {
    [v9 decimalValue];
  }
  else
  {
    v14[0] = 0;
    v14[1] = 0;
    int v15 = 0;
  }
  v11 = [v6 decimalNumberWithDecimal:v14];
  v12 = [(FHSmartCompoundFeatureRankedValue *)self initWithLabelAndRank:v8 featureRank:v11];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FHSmartCompoundFeatureRankedValue *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    featureLabel = self->_featureLabel;
    id v7 = [(FHSmartCompoundFeatureRankedValue *)v5 featureLabel];
    if ([(NSString *)featureLabel isEqual:v7])
    {
      featureRank = self->_featureRank;
      v9 = [(FHSmartCompoundFeatureRankedValue *)v5 featureRank];
      if ([(NSDecimalNumber *)featureRank isEqual:v9])
      {
        v10 = [(FHSmartCompoundFeatureRankedValue *)self eventIdentifiers];
        v11 = [(FHSmartCompoundFeatureRankedValue *)v5 eventIdentifiers];
        if (FHEqualObjects(v10, v11))
        {
          v12 = [(FHSmartCompoundFeatureRankedValue *)self eventStartDate];
          v13 = [(FHSmartCompoundFeatureRankedValue *)v5 eventStartDate];
          if (FHEqualObjects(v12, v13))
          {
            v14 = [(FHSmartCompoundFeatureRankedValue *)self eventEndDate];
            int v15 = [(FHSmartCompoundFeatureRankedValue *)v5 eventEndDate];
            char v16 = FHEqualObjects(v14, v15);
          }
          else
          {
            char v16 = 0;
          }
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_featureLabel hash];
  v4 = (char *)self->_featureRank + 32 * v3 - v3;
  v5 = [(FHSmartCompoundFeatureRankedValue *)self eventIdentifiers];
  uint64_t v6 = [v5 hash] - (void)v4 + 32 * (void)v4;

  id v7 = [(FHSmartCompoundFeatureRankedValue *)self eventStartDate];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  v9 = [(FHSmartCompoundFeatureRankedValue *)self eventEndDate];
  unint64_t v10 = [v9 hash] - v8 + 32 * v8 + 28629151;

  return v10;
}

- (id)description
{
  NSUInteger v3 = objc_opt_new();
  [v3 appendFormat:@"\"%@\",", self->_featureLabel];
  [(NSDecimalNumber *)self->_featureRank doubleValue];
  objc_msgSend(v3, "appendFormat:", @"\"%f\"", v4);
  v5 = [(FHSmartCompoundFeatureRankedValue *)self eventIdentifiers];

  if (v5)
  {
    uint64_t v6 = [(FHSmartCompoundFeatureRankedValue *)self eventIdentifiers];
    [v3 appendFormat:@"\"Event identifiers: %@\"", v6];
  }
  id v7 = [(FHSmartCompoundFeatureRankedValue *)self eventStartDate];

  if (v7)
  {
    uint64_t v8 = [(FHSmartCompoundFeatureRankedValue *)self eventStartDate];
    [v3 appendFormat:@"\"Event start date: %@\"", v8];
  }
  v9 = [(FHSmartCompoundFeatureRankedValue *)self eventEndDate];

  if (v9)
  {
    unint64_t v10 = [(FHSmartCompoundFeatureRankedValue *)self eventEndDate];
    [v3 appendFormat:@"\"Event end date:%@\"", v10];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  featureLabel = self->_featureLabel;
  id v5 = a3;
  [v5 encodeObject:featureLabel forKey:@"featureLabel"];
  [v5 encodeObject:self->_featureRank forKey:@"featureRank"];
  [v5 encodeObject:self->_eventIdentifiers forKey:@"eventIdentifiers"];
  [v5 encodeObject:self->_eventStartDate forKey:@"eventStartDate"];
  [v5 encodeObject:self->_eventEndDate forKey:@"eventEndDate"];
}

- (FHSmartCompoundFeatureRankedValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FHSmartCompoundFeatureRankedValue;
  id v5 = [(FHSmartCompoundFeatureRankedValue *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureLabel"];
    featureLabel = v5->_featureLabel;
    v5->_featureLabel = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureRank"];
    featureRank = v5->_featureRank;
    v5->_featureRank = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventIdentifiers"];
    eventIdentifiers = v5->_eventIdentifiers;
    v5->_eventIdentifiers = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventStartDate"];
    eventStartDate = v5->_eventStartDate;
    v5->_eventStartDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventEndDate"];
    eventEndDate = v5->_eventEndDate;
    v5->_eventEndDate = (NSDate *)v14;
  }
  return v5;
}

- (NSString)featureLabel
{
  return self->_featureLabel;
}

- (NSDecimalNumber)featureRank
{
  return self->_featureRank;
}

- (NSArray)eventIdentifiers
{
  return self->_eventIdentifiers;
}

- (void)setEventIdentifiers:(id)a3
{
}

- (NSDate)eventStartDate
{
  return self->_eventStartDate;
}

- (void)setEventStartDate:(id)a3
{
}

- (NSDate)eventEndDate
{
  return self->_eventEndDate;
}

- (void)setEventEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventEndDate, 0);
  objc_storeStrong((id *)&self->_eventStartDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifiers, 0);
  objc_storeStrong((id *)&self->_featureRank, 0);
  objc_storeStrong((id *)&self->_featureLabel, 0);
}

@end