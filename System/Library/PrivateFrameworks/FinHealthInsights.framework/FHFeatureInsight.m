@interface FHFeatureInsight
+ (BOOL)supportsSecureCoding;
- (FHFeatureInsight)initWithCoder:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDecimalNumber)averageAmount;
- (NSDecimalNumber)spendAmount;
- (NSDecimalNumber)spendingInsightAmount;
- (NSDecimalNumber)spendingInsightPercentageValue;
- (NSString)currencyCode;
- (NSString)description;
- (NSString)type;
- (int64_t)detectionType;
- (int64_t)direction;
- (int64_t)window;
- (unint64_t)windowReference;
- (void)encodeWithCoder:(id)a3;
- (void)setAverageAmount:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDetectionType:(int64_t)a3;
- (void)setDirection:(int64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setSpendAmount:(id)a3;
- (void)setSpendingInsightAmount:(id)a3;
- (void)setSpendingInsightPercentageValue:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setType:(id)a3;
- (void)setWindow:(int64_t)a3;
- (void)setWindowReference:(unint64_t)a3;
@end

@implementation FHFeatureInsight

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FHFeatureInsight *)self type];
  [v4 encodeObject:v5 forKey:@"type"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[FHFeatureInsight detectionType](self, "detectionType"), @"detectionType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHFeatureInsight direction](self, "direction"), @"direction");
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHFeatureInsight window](self, "window"), @"window");
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHFeatureInsight windowReference](self, "windowReference"), @"windowReference");
  v6 = [(FHFeatureInsight *)self startDate];
  [v4 encodeObject:v6 forKey:@"startDate"];

  v7 = [(FHFeatureInsight *)self endDate];
  [v4 encodeObject:v7 forKey:@"endDate"];

  v8 = [(FHFeatureInsight *)self averageAmount];
  [v4 encodeObject:v8 forKey:@"averageAmount"];

  v9 = [(FHFeatureInsight *)self spendAmount];
  [v4 encodeObject:v9 forKey:@"spendAmount"];

  v10 = [(FHFeatureInsight *)self spendingInsightAmount];
  [v4 encodeObject:v10 forKey:@"spendingInsightAmount"];

  v11 = [(FHFeatureInsight *)self spendingInsightPercentageValue];
  [v4 encodeObject:v11 forKey:@"spendingInsightPercentageValue"];

  id v12 = [(FHFeatureInsight *)self currencyCode];
  [v4 encodeObject:v12 forKey:@"currencyCode"];
}

- (FHFeatureInsight)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FHFeatureInsight;
  v5 = [(FHFeatureInsight *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->type;
    v5->type = (NSString *)v6;

    v5->detectionType = [v4 decodeIntegerForKey:@"detectionType"];
    v5->direction = [v4 decodeIntegerForKey:@"direction"];
    v5->window = [v4 decodeIntegerForKey:@"window"];
    v5->windowReference = [v4 decodeIntegerForKey:@"windowReference"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->startDate;
    v5->startDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->endDate;
    v5->endDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"averageAmount"];
    averageAmount = v5->averageAmount;
    v5->averageAmount = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spendAmount"];
    spendAmount = v5->spendAmount;
    v5->spendAmount = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spendingInsightAmount"];
    spendingInsightAmount = v5->spendingInsightAmount;
    v5->spendingInsightAmount = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spendingInsightPercentageValue"];
    spendingInsightPercentageValue = v5->spendingInsightPercentageValue;
    v5->spendingInsightPercentageValue = (NSDecimalNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->currencyCode;
    v5->currencyCode = (NSString *)v20;
  }
  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"type", self->type];
  [v3 appendFormat:@"%@: '%lu'; ", @"detectionType", self->detectionType];
  [v3 appendFormat:@"%@: '%lu'; ", @"direction", self->direction];
  [v3 appendFormat:@"%@: '%lu'; ", @"window", self->window];
  [v3 appendFormat:@"%@: '%lu'; ", @"windowReference", self->windowReference];
  [v3 appendFormat:@"%@: '%@'; ", @"startDate", self->startDate];
  [v3 appendFormat:@"%@: '%@'; ", @"endDate", self->endDate];
  [v3 appendFormat:@"%@: '%@'; ", @"averageAmount", self->averageAmount];
  [v3 appendFormat:@"%@: '%@'; ", @"spendAmount", self->spendAmount];
  [v3 appendFormat:@"%@: '%@'; ", @"spendingInsightAmount", self->spendingInsightAmount];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"spendingInsightPercentageValue",
    self->spendingInsightPercentageValue);
  [v3 appendFormat:@"%@: '%@'; ", @"currencyCode", self->currencyCode];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)type
{
  return self->type;
}

- (void)setType:(id)a3
{
}

- (int64_t)detectionType
{
  return self->detectionType;
}

- (void)setDetectionType:(int64_t)a3
{
  self->detectionType = a3;
}

- (int64_t)direction
{
  return self->direction;
}

- (void)setDirection:(int64_t)a3
{
  self->direction = a3;
}

- (int64_t)window
{
  return self->window;
}

- (void)setWindow:(int64_t)a3
{
  self->window = a3;
}

- (unint64_t)windowReference
{
  return self->windowReference;
}

- (void)setWindowReference:(unint64_t)a3
{
  self->windowReference = a3;
}

- (NSDate)startDate
{
  return self->startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSDecimalNumber)averageAmount
{
  return self->averageAmount;
}

- (void)setAverageAmount:(id)a3
{
}

- (NSDecimalNumber)spendAmount
{
  return self->spendAmount;
}

- (void)setSpendAmount:(id)a3
{
}

- (NSDecimalNumber)spendingInsightAmount
{
  return self->spendingInsightAmount;
}

- (void)setSpendingInsightAmount:(id)a3
{
}

- (NSDecimalNumber)spendingInsightPercentageValue
{
  return self->spendingInsightPercentageValue;
}

- (void)setSpendingInsightPercentageValue:(id)a3
{
}

- (NSString)currencyCode
{
  return self->currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->currencyCode, 0);
  objc_storeStrong((id *)&self->spendingInsightPercentageValue, 0);
  objc_storeStrong((id *)&self->spendingInsightAmount, 0);
  objc_storeStrong((id *)&self->spendAmount, 0);
  objc_storeStrong((id *)&self->averageAmount, 0);
  objc_storeStrong((id *)&self->endDate, 0);
  objc_storeStrong((id *)&self->startDate, 0);
  objc_storeStrong((id *)&self->type, 0);
}

@end