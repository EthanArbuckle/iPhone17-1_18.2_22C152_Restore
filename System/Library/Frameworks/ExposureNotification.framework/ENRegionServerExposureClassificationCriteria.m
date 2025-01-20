@interface ENRegionServerExposureClassificationCriteria
+ (BOOL)getCriteria:(id *)a3 fromDictionary:(id)a4 index:(unsigned __int8)a5;
+ (BOOL)supportsSecureCoding;
- (ENRegionServerExposureClassificationCriteria)initWithCoder:(id)a3;
- (NSDictionary)perDaySumERVThresholdsByDiagnosisReportType;
- (NSString)classificationName;
- (unsigned)index;
- (unsigned)perDayMaxERVThreshold;
- (unsigned)perDaySumERVThreshold;
- (unsigned)weightedDurationAtAttenuationThreshold;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ENRegionServerExposureClassificationCriteria

+ (BOOL)getCriteria:(id *)a3 fromDictionary:(id)a4 index:(unsigned __int8)a5
{
  id v7 = a4;
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __81__ENRegionServerExposureClassificationCriteria_getCriteria_fromDictionary_index___block_invoke;
    v28[3] = &unk_264244A80;
    unsigned __int8 v30 = a5;
    id v29 = v7;
    v8 = (void (**)(void, void))MEMORY[0x2166BC8A0](v28);
    v9 = ((void (**)(void, __CFString *))v8)[2](v8, @"classificationName");
    if (v9)
    {
      v10 = ((void (**)(void, __CFString *))v8)[2](v8, @"perDaySumERVThreshold");
      if (UInt64NumIsInRange(v10))
      {
        v11 = ((void (**)(void, __CFString *))v8)[2](v8, @"perDayMaxERVThreshold");
        if (UInt64NumIsInRange(v11))
        {
          v24 = a3;
          id v25 = v7;
          id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __81__ENRegionServerExposureClassificationCriteria_getCriteria_fromDictionary_index___block_invoke_2;
          v26[3] = &unk_264244AA8;
          v13 = v8;
          v26[4] = v12;
          id v27 = v13;
          v14 = (unsigned int (**)(void, void, void))MEMORY[0x2166BC8A0](v26);
          if (((unsigned int (**)(void, uint64_t, __CFString *))v14)[2](v14, 1, @"confirmedTestPerDaySumERVThreshold")&& ((unsigned int (**)(void, uint64_t, __CFString *))v14)[2](v14, 2, @"clinicalDiagnosisPerDaySumERVThreshold")&& ((unsigned int (**)(void, uint64_t, __CFString *))v14)[2](v14, 3, @"selfReportPerDaySumERVThreshold")&& ((unsigned int (**)(void, uint64_t, __CFString *))v14)[2](v14, 4, @"recursivePerDaySumERVThreshold"))
          {
            v15 = ((void (**)(void, __CFString *))v8)[2](v13, @"weightedDurationAtAttenuationThreshold");
            BOOL v16 = UInt64NumIsInRange(v15);
            if (v16)
            {
              v17 = objc_alloc_init(ENRegionServerExposureClassificationCriteria);
              uint64_t v18 = [v9 copy];
              classificationName = v17->_classificationName;
              v17->_classificationName = (NSString *)v18;

              v17->_index = a5;
              v17->_perDaySumERVThreshold = [v10 unsignedIntValue];
              v17->_perDayMaxERVThreshold = [v11 unsignedIntValue];
              uint64_t v20 = [v12 copy];
              perDaySumERVThresholdsByDiagnosisReportType = v17->_perDaySumERVThresholdsByDiagnosisReportType;
              v17->_perDaySumERVThresholdsByDiagnosisReportType = (NSDictionary *)v20;

              v17->_weightedDurationAtAttenuationThreshold = [v15 unsignedIntValue];
              v22 = v17;
              id *v24 = v22;
            }
          }
          else
          {
            LOBYTE(v16) = 0;
          }

          id v7 = v25;
        }
        else
        {
          LOBYTE(v16) = 0;
        }
      }
      else
      {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      *a3 = 0;
      LOBYTE(v16) = 1;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

id __81__ENRegionServerExposureClassificationCriteria_getCriteria_fromDictionary_index___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithFormat:@"%@_%d", v4, *(unsigned __int8 *)(a1 + 40)];

  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  return v6;
}

uint64_t __81__ENRegionServerExposureClassificationCriteria_getCriteria_fromDictionary_index___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v5 = v4;
  if (v4)
  {
    if (!UInt64NumIsInRange(v4))
    {
      uint64_t v8 = 0;
      goto LABEL_5;
    }
    v6 = *(void **)(a1 + 32);
    id v7 = [NSNumber numberWithUnsignedInt:a2];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  uint64_t v8 = 1;
LABEL_5:

  return v8;
}

- (ENRegionServerExposureClassificationCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"pdsThDRT"];
    v14.receiver = self;
    v14.super_class = (Class)ENRegionServerExposureClassificationCriteria;
    v10 = [(ENRegionServerExposureClassificationCriteria *)&v14 init];
    self = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_classificationName, v5);
      uint64_t v15 = 0;
      if (NSDecodeSInt64RangedIfPresent()) {
        self->_index = v15;
      }
      self->_perDaySumERVThreshold = [v4 decodeInt64ForKey:@"pdsTh"];
      self->_perDayMaxERVThreshold = [v4 decodeInt64ForKey:@"pdsMax"];
      objc_storeStrong((id *)&self->_perDaySumERVThresholdsByDiagnosisReportType, v9);
      self->_weightedDurationAtAttenuationThreshold = [v4 decodeInt64ForKey:@"wdaa"];
      v11 = self;
    }

    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_classificationName forKey:@"name"];
  if (self->_index) {
    objc_msgSend(v4, "encodeInteger:forKey:");
  }
  [v4 encodeInt64:self->_perDaySumERVThreshold forKey:@"pdsTh"];
  [v4 encodeInt64:self->_perDayMaxERVThreshold forKey:@"pdsMax"];
  [v4 encodeObject:self->_perDaySumERVThresholdsByDiagnosisReportType forKey:@"pdsThDRT"];
  [v4 encodeInt64:self->_weightedDurationAtAttenuationThreshold forKey:@"wdaa"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)classificationName
{
  return self->_classificationName;
}

- (unsigned)index
{
  return self->_index;
}

- (unsigned)perDaySumERVThreshold
{
  return self->_perDaySumERVThreshold;
}

- (unsigned)perDayMaxERVThreshold
{
  return self->_perDayMaxERVThreshold;
}

- (NSDictionary)perDaySumERVThresholdsByDiagnosisReportType
{
  return self->_perDaySumERVThresholdsByDiagnosisReportType;
}

- (unsigned)weightedDurationAtAttenuationThreshold
{
  return self->_weightedDurationAtAttenuationThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perDaySumERVThresholdsByDiagnosisReportType, 0);

  objc_storeStrong((id *)&self->_classificationName, 0);
}

@end