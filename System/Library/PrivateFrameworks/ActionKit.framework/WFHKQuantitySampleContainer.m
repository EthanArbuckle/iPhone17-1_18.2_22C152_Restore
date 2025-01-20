@interface WFHKQuantitySampleContainer
+ (BOOL)supportsSecureCoding;
- (BOOL)canProvideDataSamples;
- (BOOL)hasSubsamples;
- (BOOL)hasValue;
- (HKQuantitySample)quantitySample;
- (HKUnit)unit;
- (NSArray)dataSamples;
- (NSArray)subcontainers;
- (NSArray)subsamples;
- (NSString)description;
- (NSString)wfName;
- (WFHKQuantitySampleContainer)initWithCoder:(id)a3;
- (WFHKQuantitySampleContainer)initWithSample:(id)a3 unit:(id)a4;
- (WFHKQuantitySampleContainer)initWithSubsamples:(id)a3 unit:(id)a4;
- (double)normalizedValue;
- (double)value;
- (void)encodeWithCoder:(id)a3;
- (void)setQuantitySample:(id)a3;
- (void)setSubcontainers:(id)a3;
- (void)setSubsamples:(id)a3;
- (void)setUnit:(id)a3;
- (void)updateValue:(id)a3 fromStatisticsOperation:(int64_t)a4;
@end

@implementation WFHKQuantitySampleContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsamples, 0);
  objc_storeStrong((id *)&self->_subcontainers, 0);
  objc_storeStrong((id *)&self->_quantitySample, 0);
  objc_storeStrong((id *)&self->_unit, 0);
}

- (void)setSubsamples:(id)a3
{
}

- (NSArray)subsamples
{
  return self->_subsamples;
}

- (void)setSubcontainers:(id)a3
{
}

- (double)value
{
  return self->_value;
}

- (void)setQuantitySample:(id)a3
{
}

- (BOOL)canProvideDataSamples
{
  return self->_canProvideDataSamples;
}

- (void)setUnit:(id)a3
{
}

- (void)updateValue:(id)a3 fromStatisticsOperation:(int64_t)a4
{
  v5 = (void *)MEMORY[0x263F0A630];
  id v6 = a3;
  v7 = [(WFHKQuantitySampleContainer *)self unit];
  [v6 doubleValue];
  double v9 = v8;

  id v18 = [v5 quantityWithUnit:v7 doubleValue:v9];

  v10 = [(WFHKQuantitySampleContainer *)self quantitySample];
  v11 = [v10 quantityType];

  v12 = (void *)MEMORY[0x263F0A648];
  v13 = [(WFHKQuantitySampleContainer *)self quantitySample];
  v14 = [v13 startDate];
  v15 = [(WFHKQuantitySampleContainer *)self quantitySample];
  v16 = [v15 endDate];
  v17 = [v12 quantitySampleWithType:v11 quantity:v18 startDate:v14 endDate:v16];
  [(WFHKQuantitySampleContainer *)self setQuantitySample:v17];
}

- (NSArray)dataSamples
{
  v2 = [(WFHKQuantitySampleContainer *)self subcontainers];
  v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_26563);

  return (NSArray *)v3;
}

id __42__WFHKQuantitySampleContainer_dataSamples__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  id v3 = a2;
  v4 = [v3 quantitySample];
  v5 = [v4 quantity];
  id v6 = [v3 unit];

  [v5 doubleValueForUnit:v6];
  v7 = objc_msgSend(v2, "numberWithDouble:");

  return v7;
}

- (NSString)wfName
{
  id v3 = [(WFHKQuantitySampleContainer *)self unit];

  if (v3)
  {
    v4 = [(WFHKQuantitySampleContainer *)self quantitySample];
    v5 = [v4 quantity];
    id v6 = [(WFHKQuantitySampleContainer *)self unit];
    objc_msgSend(v5, "wf_normalizedDoubleValueForUnit:", v6);
    double v8 = v7;

    id v9 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v9 setNumberStyle:1];
    [v9 setUsesGroupingSeparator:0];
    v10 = NSString;
    v11 = WFLocalizedString(@"%1$@ %2$@");
    v12 = [NSNumber numberWithDouble:v8];
    v13 = [v9 stringFromNumber:v12];
    v14 = [(WFHKQuantitySampleContainer *)self unit];
    v15 = [v14 unitString];
    v16 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v13, v15);
  }
  else
  {
    v17 = NSString;
    WFLocalizedString(@"%@ Quantity Sample, no unit data");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v11 = [(WFHKQuantitySampleContainer *)self quantitySample];
    v12 = [v11 quantityType];
    v13 = [v12 identifier];
    v14 = +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:v13];
    v16 = objc_msgSend(v17, "localizedStringWithFormat:", v9, v14);
  }

  return (NSString *)v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  if ([(WFHKQuantitySampleContainer *)self hasSubsamples])
  {
    v4 = [(WFHKQuantitySampleContainer *)self subsamples];
    v5 = @"subsamples";
  }
  else
  {
    v4 = [(WFHKQuantitySampleContainer *)self quantitySample];
    v5 = @"quantitySample";
  }
  [v7 encodeObject:v4 forKey:v5];

  id v6 = [(WFHKQuantitySampleContainer *)self unit];
  [v7 encodeObject:v6 forKey:@"unit"];
}

- (WFHKQuantitySampleContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unit"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quantitySample"];
  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"subsamples"];

  if ([v10 count]) {
    v11 = [(WFHKQuantitySampleContainer *)self initWithSubsamples:v10 unit:v5];
  }
  else {
    v11 = [(WFHKQuantitySampleContainer *)self initWithSample:v6 unit:v5];
  }
  v12 = v11;

  return v12;
}

- (NSString)description
{
  id v3 = NSString;
  [(WFHKQuantitySampleContainer *)self normalizedValue];
  uint64_t v5 = v4;
  id v6 = [(WFHKQuantitySampleContainer *)self unit];
  id v7 = [v6 unitString];
  uint64_t v8 = [v3 stringWithFormat:@"<WFHKQuantitySampleContainer %p> %.1f %@", self, v5, v7];

  return (NSString *)v8;
}

- (BOOL)hasSubsamples
{
  v2 = [(WFHKQuantitySampleContainer *)self subsamples];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (double)normalizedValue
{
  BOOL v3 = [(WFHKQuantitySampleContainer *)self unit];

  if (!v3) {
    return 0.0;
  }
  uint64_t v4 = [(WFHKQuantitySampleContainer *)self quantitySample];
  uint64_t v5 = [v4 quantity];
  id v6 = [(WFHKQuantitySampleContainer *)self unit];
  objc_msgSend(v5, "wf_normalizedDoubleValueForUnit:", v6);
  double v8 = v7;

  return v8;
}

- (BOOL)hasValue
{
  v2 = [(WFHKQuantitySampleContainer *)self unit];
  BOOL v3 = v2 != 0;

  return v3;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (HKQuantitySample)quantitySample
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  quantitySample = self->_quantitySample;
  if (quantitySample)
  {
    BOOL v3 = quantitySample;
  }
  else if ([(WFHKQuantitySampleContainer *)self hasSubsamples] {
         && [(WFHKQuantitySampleContainer *)self hasValue])
  }
  {
    uint64_t v5 = [(WFHKQuantitySampleContainer *)self subsamples];
    id v6 = [(WFHKQuantitySampleContainer *)self unit];
    id v7 = v5;
    double v8 = [v7 firstObject];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
      double v13 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "quantity", (void)v32);
          [v15 doubleValueForUnit:v6];
          double v13 = v13 + v16;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v11);
    }
    else
    {
      double v13 = 0.0;
    }

    v17 = [v8 quantityType];
    uint64_t v18 = [v17 aggregationStyle];

    if (v18 == 1) {
      double v13 = v13 / (double)(unint64_t)[v9 count];
    }
    v19 = objc_msgSend(MEMORY[0x263F0A630], "quantityWithUnit:doubleValue:", v6, v13, (void)v32);
    v20 = [v8 quantityType];
    v21 = [v9 valueForKeyPath:@"@min.startDate"];
    v22 = [v9 valueForKeyPath:@"@max.endDate"];
    if ([v20 isMaximumDurationRestricted]
      && ([v20 maximumAllowedDuration],
          double v24 = v23,
          [v22 timeIntervalSinceDate:v21],
          v25 > v24)
      || [v20 isMinimumDurationRestricted]
      && ([v20 minimumAllowedDuration],
          double v27 = v26,
          [v22 timeIntervalSinceDate:v21],
          v28 < v27))
    {
      BOOL v3 = 0;
    }
    else
    {
      v29 = (void *)MEMORY[0x263F0A648];
      v30 = [v8 metadata];
      BOOL v3 = [v29 quantitySampleWithType:v20 quantity:v19 startDate:v21 endDate:v22 metadata:v30];
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (NSArray)subcontainers
{
  BOOL v3 = [(WFHKQuantitySampleContainer *)self subsamples];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__WFHKQuantitySampleContainer_subcontainers__block_invoke;
  v6[3] = &unk_264E59840;
  v6[4] = self;
  uint64_t v4 = objc_msgSend(v3, "if_map:", v6);

  return (NSArray *)v4;
}

WFHKQuantitySampleContainer *__44__WFHKQuantitySampleContainer_subcontainers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [WFHKQuantitySampleContainer alloc];
  uint64_t v5 = [*(id *)(a1 + 32) unit];
  id v6 = [(WFHKQuantitySampleContainer *)v4 initWithSample:v3 unit:v5];

  return v6;
}

- (WFHKQuantitySampleContainer)initWithSubsamples:(id)a3 unit:(id)a4
{
  id v6 = a3;
  id v7 = [(WFHKQuantitySampleContainer *)self initWithSample:0 unit:a4];
  double v8 = v7;
  if (v7)
  {
    [(WFHKQuantitySampleContainer *)v7 setSubsamples:v6];
    id v9 = v8;
  }

  return v8;
}

- (WFHKQuantitySampleContainer)initWithSample:(id)a3 unit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFHKQuantitySampleContainer;
  double v8 = [(WFHKQuantitySampleContainer *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    [(WFHKQuantitySampleContainer *)v8 setQuantitySample:v6];
    [(WFHKQuantitySampleContainer *)v9 setUnit:v7];
    uint64_t v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end