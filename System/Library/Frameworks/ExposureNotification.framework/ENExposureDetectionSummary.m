@interface ENExposureDetectionSummary
- (ENExposureDetectionSummary)initWithXPCObject:(id)a3 error:(id *)a4;
- (ENRiskScore)maximumRiskScore;
- (NSArray)attenuationDurations;
- (NSArray)daySummaries;
- (NSDictionary)metadata;
- (NSInteger)daysSinceLastExposure;
- (double)maximumRiskScoreFullRange;
- (double)riskScoreSumFullRange;
- (id)description;
- (uint64_t)matchedKeyCount;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAttenuationDurations:(id)a3;
- (void)setDaySummaries:(id)a3;
- (void)setDaysSinceLastExposure:(int64_t)a3;
- (void)setMatchedKeyCount:(unint64_t)a3;
- (void)setMaximumRiskScore:(unsigned __int8)a3;
- (void)setMaximumRiskScoreFullRange:(double)a3;
- (void)setRiskScoreSumFullRange:(double)a3;
@end

@implementation ENExposureDetectionSummary

- (ENExposureDetectionSummary)initWithXPCObject:(id)a3 error:(id *)a4
{
  v33[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ENExposureDetectionSummary;
  v7 = [(ENExposureDetectionSummary *)&v31 init];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_29;
    }
LABEL_28:
    ENErrorF(2);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (MEMORY[0x2166BCD00](v6) != MEMORY[0x263EF8708])
  {
    if (!a4) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (!CUXPCDecodeNSArrayOfInteger()) {
    goto LABEL_29;
  }
  unint64_t v25 = 0;
  int v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 == 6)
  {
    v7->_daysSinceLastExposure = v25;
  }
  else if (v8 == 5)
  {
    goto LABEL_29;
  }
  unint64_t v25 = 0;
  int v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 == 6)
  {
    v7->_matchedKeyCount = v25;
  }
  else if (v9 == 5)
  {
    goto LABEL_29;
  }
  unint64_t v25 = 0;
  int v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 != 6)
  {
    if (v10 != 5) {
      goto LABEL_13;
    }
LABEL_29:
    v17 = 0;
    goto LABEL_24;
  }
  v7->_maximumRiskScore = v25;
LABEL_13:
  if (!CUXPCDecodeDouble() || !CUXPCDecodeDouble()) {
    goto LABEL_29;
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12 = xpc_dictionary_get_array(v6, "daySummaries");
  v13 = v12;
  if (!v12) {
    goto LABEL_20;
  }
  unint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __54__ENExposureDetectionSummary_initWithXPCObject_error___block_invoke;
  applier[3] = &unk_264244840;
  applier[4] = v11;
  applier[5] = &v25;
  xpc_array_apply(v12, applier);
  v14 = (void *)v26[5];
  if (v14)
  {
    if (a4) {
      *a4 = v14;
    }
  }
  else
  {
    uint64_t v15 = [v11 copy];
    daySummaries = v7->_daySummaries;
    v7->_daySummaries = (NSArray *)v15;
  }
  _Block_object_dispose(&v25, 8);

  if (v14)
  {
    v17 = 0;
  }
  else
  {
LABEL_20:
    attenuationDurations = v7->_attenuationDurations;
    if (!attenuationDurations) {
      attenuationDurations = (NSArray *)MEMORY[0x263EFFA68];
    }
    v33[0] = attenuationDurations;
    v32[0] = @"attenuationDurations";
    v32[1] = @"maximumRiskScoreFullRange";
    v19 = [NSNumber numberWithDouble:v7->_maximumRiskScoreFullRange];
    v33[1] = v19;
    v32[2] = @"riskScoreSumFullRange";
    v20 = [NSNumber numberWithDouble:v7->_riskScoreSumFullRange];
    v33[2] = v20;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
    metadata = v7->_metadata;
    v7->_metadata = (NSDictionary *)v21;

    v17 = v7;
  }

LABEL_24:
  return v17;
}

BOOL __54__ENExposureDetectionSummary_initWithXPCObject_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    v5 = [ENExposureDaySummary alloc];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    v7 = [(ENExposureDaySummary *)v5 initWithXPCObject:v4 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    BOOL v8 = v7 != 0;
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      uint64_t v13 = ENErrorF(12);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    uint64_t v10 = ENErrorF(15);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    BOOL v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CUXPCEncodeNSArrayOfNSNumber();
  int64_t daysSinceLastExposure = self->_daysSinceLastExposure;
  if (daysSinceLastExposure) {
    xpc_dictionary_set_int64(v4, "daLE", daysSinceLastExposure);
  }
  uint64_t matchedKeyCount = self->_matchedKeyCount;
  if (matchedKeyCount) {
    xpc_dictionary_set_uint64(v4, "mtKC", matchedKeyCount);
  }
  if (self->_maximumRiskScore) {
    xpc_dictionary_set_uint64(v4, "mxRS", self->_maximumRiskScore);
  }
  double maximumRiskScoreFullRange = self->_maximumRiskScoreFullRange;
  if (maximumRiskScoreFullRange != 0.0) {
    xpc_dictionary_set_double(v4, "mxRSFR", maximumRiskScoreFullRange);
  }
  double riskScoreSumFullRange = self->_riskScoreSumFullRange;
  if (riskScoreSumFullRange != 0.0) {
    xpc_dictionary_set_double(v4, "rssFR", riskScoreSumFullRange);
  }
  int v9 = self->_daySummaries;
  if (v9)
  {
    xpc_object_t v10 = xpc_array_create(0, 0);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = self->_daySummaries;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
          objc_msgSend(v16, "encodeWithXPCObject:", v17, (void)v18);
          xpc_array_set_value(v10, 0xFFFFFFFFFFFFFFFFLL, v17);
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    xpc_dictionary_set_value(v4, "daySummaries", v10);
  }
}

- (id)description
{
  NSAppendPrintF_safe();
  id v3 = 0;
  id v4 = self->_attenuationDurations;
  if ([(NSArray *)v4 count])
  {
    NSAppendPrintF();
    id v5 = v3;

    id v3 = v5;
  }
  NSAppendPrintF_safe();
  id v6 = v3;

  NSAppendPrintF_safe();
  id v7 = v6;

  double maximumRiskScoreFullRange = self->_maximumRiskScoreFullRange;
  NSAppendPrintF_safe();
  id v8 = v7;

  double riskScoreSumFullRange = self->_riskScoreSumFullRange;
  NSAppendPrintF_safe();
  id v9 = v8;

  [(NSArray *)self->_daySummaries count];
  NSAppendPrintF_safe();
  id v10 = v9;

  return v10;
}

- (NSArray)attenuationDurations
{
  return self->_attenuationDurations;
}

- (void)setAttenuationDurations:(id)a3
{
}

- (NSInteger)daysSinceLastExposure
{
  return self->_daysSinceLastExposure;
}

- (void)setDaysSinceLastExposure:(int64_t)a3
{
  self->_int64_t daysSinceLastExposure = a3;
}

- (uint64_t)matchedKeyCount
{
  return self->_matchedKeyCount;
}

- (void)setMatchedKeyCount:(unint64_t)a3
{
  self->_uint64_t matchedKeyCount = a3;
}

- (ENRiskScore)maximumRiskScore
{
  return self->_maximumRiskScore;
}

- (void)setMaximumRiskScore:(unsigned __int8)a3
{
  self->_maximumRiskScore = a3;
}

- (double)maximumRiskScoreFullRange
{
  return self->_maximumRiskScoreFullRange;
}

- (void)setMaximumRiskScoreFullRange:(double)a3
{
  self->_double maximumRiskScoreFullRange = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (double)riskScoreSumFullRange
{
  return self->_riskScoreSumFullRange;
}

- (void)setRiskScoreSumFullRange:(double)a3
{
  self->_double riskScoreSumFullRange = a3;
}

- (NSArray)daySummaries
{
  return self->_daySummaries;
}

- (void)setDaySummaries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daySummaries, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_attenuationDurations, 0);
}

@end