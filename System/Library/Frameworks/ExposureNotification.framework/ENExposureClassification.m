@interface ENExposureClassification
+ (BOOL)supportsSecureCoding;
- (BOOL)anyThresholdsExceeded;
- (ENExposureClassification)initWithCoder:(id)a3;
- (ENRegion)region;
- (NSDate)date;
- (NSNumber)clinicalDiagnosisPerDaySumERVAboveThreshold;
- (NSNumber)confirmedTestPerDaySumERVAboveThreshold;
- (NSNumber)perDayMaxERVAboveThreshold;
- (NSNumber)perDaySumERVAboveThreshold;
- (NSNumber)recursivePerDaySumERVAboveThreshold;
- (NSNumber)selfReportPerDaySumERVAboveThreshold;
- (NSNumber)weightedDurationAtAttenuationAboveThreshold;
- (NSString)name;
- (id)description;
- (unsigned)index;
- (void)encodeWithCoder:(id)a3;
- (void)setClinicalDiagnosisPerDaySumERVAboveThreshold:(id)a3;
- (void)setConfirmedTestPerDaySumERVAboveThreshold:(id)a3;
- (void)setDate:(id)a3;
- (void)setIndex:(unsigned __int8)a3;
- (void)setName:(id)a3;
- (void)setPerDayMaxERVAboveThreshold:(id)a3;
- (void)setPerDaySumERVAboveThreshold:(id)a3;
- (void)setRecursivePerDaySumERVAboveThreshold:(id)a3;
- (void)setRegion:(id)a3;
- (void)setSelfReportPerDaySumERVAboveThreshold:(id)a3;
- (void)setWeightedDurationAtAttenuationAboveThreshold:(id)a3;
@end

@implementation ENExposureClassification

- (ENExposureClassification)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ENExposureClassification;
  v5 = [(ENExposureClassification *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    if (v6)
    {
      objc_storeStrong((id *)&v5->_name, v6);
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
      if (v7)
      {
        objc_storeStrong((id *)&v5->_date, v7);
        uint64_t v15 = 0;
        if (NSDecodeSInt64RangedIfPresent()) {
          v5->_index = v15;
        }
        v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reg"];
        if (v8)
        {
          objc_storeStrong((id *)&v5->_region, v8);
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __42__ENExposureClassification_initWithCoder___block_invoke;
          v12[3] = &unk_264244778;
          id v13 = v4;
          v9 = (void (**)(void, void, void))MEMORY[0x2166BC8A0](v12);
          ((void (**)(void, NSNumber **, __CFString *))v9)[2](v9, &v5->_confirmedTestPerDaySumERVAboveThreshold, @"ctestS");
          ((void (**)(void, NSNumber **, __CFString *))v9)[2](v9, &v5->_clinicalDiagnosisPerDaySumERVAboveThreshold, @"cdiagS");
          ((void (**)(void, NSNumber **, __CFString *))v9)[2](v9, &v5->_selfReportPerDaySumERVAboveThreshold, @"selfS");
          ((void (**)(void, NSNumber **, __CFString *))v9)[2](v9, &v5->_recursivePerDaySumERVAboveThreshold, @"recurS");
          ((void (**)(void, NSNumber **, __CFString *))v9)[2](v9, &v5->_perDayMaxERVAboveThreshold, @"pdM");
          ((void (**)(void, NSNumber **, __CFString *))v9)[2](v9, &v5->_perDaySumERVAboveThreshold, @"pdS");
          ((void (**)(void, NSNumber **, __CFString *))v9)[2](v9, &v5->_weightedDurationAtAttenuationAboveThreshold, @"wdaa");
          v10 = v5;
        }
        else
        {
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __42__ENExposureClassification_initWithCoder___block_invoke(uint64_t a1, void **a2, void *a3)
{
  id v8 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsValueForKey:"))
  {
    v5 = NSNumber;
    [*(id *)(a1 + 32) decodeDoubleForKey:v8];
    uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
    v7 = *a2;
    *a2 = (void *)v6;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeObject:self->_date forKey:@"date"];
  if (self->_index) {
    objc_msgSend(v4, "encodeInteger:forKey:");
  }
  [v4 encodeObject:self->_region forKey:@"reg"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__ENExposureClassification_encodeWithCoder___block_invoke;
  v7[3] = &unk_2642447A0;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = (void (**)(void, void, void))MEMORY[0x2166BC8A0](v7);
  ((void (**)(void, NSNumber *, __CFString *))v6)[2](v6, self->_confirmedTestPerDaySumERVAboveThreshold, @"ctestS");
  ((void (**)(void, NSNumber *, __CFString *))v6)[2](v6, self->_clinicalDiagnosisPerDaySumERVAboveThreshold, @"cdiagS");
  ((void (**)(void, NSNumber *, __CFString *))v6)[2](v6, self->_selfReportPerDaySumERVAboveThreshold, @"selfS");
  ((void (**)(void, NSNumber *, __CFString *))v6)[2](v6, self->_recursivePerDaySumERVAboveThreshold, @"recurS");
  ((void (**)(void, NSNumber *, __CFString *))v6)[2](v6, self->_perDayMaxERVAboveThreshold, @"pdM");
  ((void (**)(void, NSNumber *, __CFString *))v6)[2](v6, self->_perDaySumERVAboveThreshold, @"pdS");
  ((void (**)(void, NSNumber *, __CFString *))v6)[2](v6, self->_weightedDurationAtAttenuationAboveThreshold, @"wdaa");
}

void __44__ENExposureClassification_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = a3;
    [a2 doubleValue];
    objc_msgSend(v4, "encodeDouble:forKey:", v5);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v36 = 0;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  name = self->_name;
  uint64_t index = self->_index;
  NSAppendPrintF_safe();
  id v5 = 0;

  id v35 = v5;
  region = self->_region;
  if (!region) {
    region = (ENRegion *)@"<>";
  }
  v24 = region;
  NSAppendPrintF_safe();
  id v7 = v35;

  v34[1] = v7;
  [(NSDate *)self->_date timeIntervalSinceReferenceDate];
  v25 = CUPrintDateCF();
  NSAppendPrintF_safe();
  id v8 = v7;

  v34[0] = v8;
  __39__ENExposureClassification_description__block_invoke(v9, (uint64_t)v34, self->_confirmedTestPerDaySumERVAboveThreshold, @"CTest");
  id v10 = v34[0];

  id v33 = v10;
  __39__ENExposureClassification_description__block_invoke(v11, (uint64_t)&v33, self->_clinicalDiagnosisPerDaySumERVAboveThreshold, @"CClin");
  id v12 = v33;

  id v32 = v12;
  __39__ENExposureClassification_description__block_invoke(v13, (uint64_t)&v32, self->_selfReportPerDaySumERVAboveThreshold, @"SelfRep");
  id v14 = v32;

  id v31 = v14;
  __39__ENExposureClassification_description__block_invoke(v15, (uint64_t)&v31, self->_recursivePerDaySumERVAboveThreshold, @"Recurs");
  id v16 = v31;

  id v30 = v16;
  __39__ENExposureClassification_description__block_invoke(v17, (uint64_t)&v30, self->_perDayMaxERVAboveThreshold, @"PDayMax");
  id v18 = v30;

  id v29 = v18;
  __39__ENExposureClassification_description__block_invoke(v19, (uint64_t)&v29, self->_perDaySumERVAboveThreshold, @"PDaySum");
  id v20 = v29;

  id v28 = v20;
  __39__ENExposureClassification_description__block_invoke(v21, (uint64_t)&v28, self->_weightedDurationAtAttenuationAboveThreshold, @"WDuration");
  id v22 = v28;

  return v22;
}

void __39__ENExposureClassification_description__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3)
  {
    id v5 = a4;
    [a3 doubleValue];
    NSAppendPrintF_safe();
  }
}

- (BOOL)anyThresholdsExceeded
{
  return self->_confirmedTestPerDaySumERVAboveThreshold
      || self->_clinicalDiagnosisPerDaySumERVAboveThreshold
      || self->_selfReportPerDaySumERVAboveThreshold
      || self->_recursivePerDaySumERVAboveThreshold
      || self->_perDayMaxERVAboveThreshold
      || self->_perDaySumERVAboveThreshold
      || self->_weightedDurationAtAttenuationAboveThreshold != 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned __int8)a3
{
  self->_uint64_t index = a3;
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSNumber)confirmedTestPerDaySumERVAboveThreshold
{
  return self->_confirmedTestPerDaySumERVAboveThreshold;
}

- (void)setConfirmedTestPerDaySumERVAboveThreshold:(id)a3
{
}

- (NSNumber)clinicalDiagnosisPerDaySumERVAboveThreshold
{
  return self->_clinicalDiagnosisPerDaySumERVAboveThreshold;
}

- (void)setClinicalDiagnosisPerDaySumERVAboveThreshold:(id)a3
{
}

- (NSNumber)selfReportPerDaySumERVAboveThreshold
{
  return self->_selfReportPerDaySumERVAboveThreshold;
}

- (void)setSelfReportPerDaySumERVAboveThreshold:(id)a3
{
}

- (NSNumber)recursivePerDaySumERVAboveThreshold
{
  return self->_recursivePerDaySumERVAboveThreshold;
}

- (void)setRecursivePerDaySumERVAboveThreshold:(id)a3
{
}

- (NSNumber)perDayMaxERVAboveThreshold
{
  return self->_perDayMaxERVAboveThreshold;
}

- (void)setPerDayMaxERVAboveThreshold:(id)a3
{
}

- (NSNumber)perDaySumERVAboveThreshold
{
  return self->_perDaySumERVAboveThreshold;
}

- (void)setPerDaySumERVAboveThreshold:(id)a3
{
}

- (NSNumber)weightedDurationAtAttenuationAboveThreshold
{
  return self->_weightedDurationAtAttenuationAboveThreshold;
}

- (void)setWeightedDurationAtAttenuationAboveThreshold:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightedDurationAtAttenuationAboveThreshold, 0);
  objc_storeStrong((id *)&self->_perDaySumERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_perDayMaxERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_recursivePerDaySumERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_selfReportPerDaySumERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_clinicalDiagnosisPerDaySumERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_confirmedTestPerDaySumERVAboveThreshold, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end