@interface ENExposureInfo
- (ENAttenuation)attenuationValue;
- (ENDiagnosisReportType)diagnosisReportType;
- (ENExposureInfo)init;
- (ENExposureInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (ENRiskLevel)transmissionRiskLevel;
- (ENRiskScore)totalRiskScore;
- (NSArray)attenuationDurations;
- (NSDate)date;
- (NSDictionary)metadata;
- (NSInteger)daysSinceOnsetOfSymptoms;
- (NSTimeInterval)duration;
- (double)totalRiskScoreFullRange;
- (id)description;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAttenuationDurations:(id)a3;
- (void)setAttenuationValue:(unsigned __int8)a3;
- (void)setDate:(id)a3;
- (void)setDaysSinceOnsetOfSymptoms:(int64_t)a3;
- (void)setDiagnosisReportType:(unsigned int)a3;
- (void)setDuration:(double)a3;
- (void)setMetadata:(id)a3;
- (void)setTotalRiskScore:(unsigned __int8)a3;
- (void)setTotalRiskScoreFullRange:(double)a3;
- (void)setTransmissionRiskLevel:(unsigned __int8)a3;
@end

@implementation ENExposureInfo

- (ENExposureInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)ENExposureInfo;
  v2 = [(ENExposureInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    attenuationDurations = v2->_attenuationDurations;
    v2->_attenuationDurations = (NSArray *)&unk_26C60D420;

    v3->_daysSinceOnsetOfSymptoms = 0x7FFFFFFFFFFFFFFFLL;
    v5 = v3;
  }

  return v3;
}

- (ENExposureInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = [(ENExposureInfo *)self init];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_30;
    }
LABEL_29:
    ENErrorF(2);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (MEMORY[0x2166BCD00](v6) != MEMORY[0x263EF8708])
  {
    if (!a4) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (!CUXPCDecodeNSArrayOfInteger()) {
    goto LABEL_30;
  }
  int v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_attenuationValue = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_30;
  }
  if (!CUXPCDecodeDouble()) {
    goto LABEL_30;
  }
  int v9 = CUXPCDecodeSInt64RangedEx();
  if (v9 == 6)
  {
    v7->_daysSinceOnsetOfSymptoms = 0;
  }
  else if (v9 == 5)
  {
    goto LABEL_30;
  }
  int v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 == 6)
  {
    v7->_diagnosisReportType = 0;
  }
  else if (v10 == 5)
  {
    goto LABEL_30;
  }
  if (!CUXPCDecodeDouble()) {
    goto LABEL_30;
  }
  int v11 = CUXPCDecodeUInt64RangedEx();
  if (v11 == 6)
  {
    v7->_totalRiskScore = 0;
  }
  else if (v11 == 5)
  {
    goto LABEL_30;
  }
  if (!CUXPCDecodeDouble()) {
    goto LABEL_30;
  }
  int v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 != 6)
  {
    if (v12 != 5) {
      goto LABEL_22;
    }
LABEL_30:
    v17 = 0;
    goto LABEL_25;
  }
  v7->_transmissionRiskLevel = 0;
LABEL_22:
  attenuationDurations = v7->_attenuationDurations;
  if (!attenuationDurations) {
    attenuationDurations = (NSArray *)MEMORY[0x263EFFA68];
  }
  v19[1] = @"totalRiskScoreFullRange";
  v20[0] = attenuationDurations;
  v19[0] = @"attenuationDurations";
  v14 = [NSNumber numberWithDouble:v7->_totalRiskScoreFullRange];
  v20[1] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  metadata = v7->_metadata;
  v7->_metadata = (NSDictionary *)v15;

  v17 = v7;
LABEL_25:

  return v17;
}

- (void)encodeWithXPCObject:(id)a3
{
  xpc_object_t xdict = a3;
  CUXPCEncodeNSArrayOfNSNumber();
  if (self->_attenuationValue) {
    xpc_dictionary_set_uint64(xdict, "attV", self->_attenuationValue);
  }
  int64_t daysSinceOnsetOfSymptoms = self->_daysSinceOnsetOfSymptoms;
  if (daysSinceOnsetOfSymptoms != 0x7FFFFFFFFFFFFFFFLL) {
    xpc_dictionary_set_int64(xdict, "dSOS", daysSinceOnsetOfSymptoms);
  }
  uint64_t diagnosisReportType = self->_diagnosisReportType;
  if (diagnosisReportType) {
    xpc_dictionary_set_uint64(xdict, "dRT", diagnosisReportType);
  }
  id v6 = self->_date;
  objc_super v7 = v6;
  if (v6)
  {
    [(NSDate *)v6 timeIntervalSinceReferenceDate];
    if (v8 != 0.0) {
      xpc_dictionary_set_double(xdict, "tims", v8);
    }
  }

  double duration = self->_duration;
  if (duration != 0.0) {
    xpc_dictionary_set_double(xdict, "dura", duration);
  }
  int v10 = xdict;
  if (self->_totalRiskScore)
  {
    xpc_dictionary_set_uint64(xdict, "toRS", self->_totalRiskScore);
    int v10 = xdict;
  }
  double totalRiskScoreFullRange = self->_totalRiskScoreFullRange;
  if (totalRiskScoreFullRange == 0.0)
  {
    CFDictionaryGetDouble();
    int v10 = xdict;
  }
  if (totalRiskScoreFullRange != 0.0)
  {
    xpc_dictionary_set_double(xdict, "toRSFR", totalRiskScoreFullRange);
    int v10 = xdict;
  }
  xpc_dictionary_set_uint64(v10, "trRL", self->_transmissionRiskLevel);
}

- (id)description
{
  NSAppendPrintF_safe();
  id v3 = 0;
  v4 = v3;
  if (self->_attenuationValue)
  {
    v17 = v3;
    NSAppendPrintF_safe();
    id v5 = v17;

    v4 = v5;
  }
  id v6 = self->_attenuationDurations;
  if ([(NSArray *)v6 count])
  {
    NSAppendPrintF();
    id v7 = v4;

    v4 = v7;
  }
  date = self->_date;
  if (date)
  {
    v16 = date;
    NSAppendPrintF_safe();
    id v9 = v4;

    v4 = v9;
  }
  if (self->_duration > 0.0)
  {
    NSAppendPrintF_safe();
    id v10 = v4;

    v4 = v10;
  }
  if (self->_daysSinceOnsetOfSymptoms != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSAppendPrintF_safe();
    id v11 = v4;

    v4 = v11;
  }
  if (self->_diagnosisReportType)
  {
    NSAppendPrintF_safe();
    id v12 = v4;

    v4 = v12;
  }
  NSAppendPrintF_safe();
  id v13 = v4;

  if (self->_totalRiskScore)
  {
    NSAppendPrintF_safe();
    id v14 = v13;

    id v13 = v14;
  }

  return v13;
}

- (NSArray)attenuationDurations
{
  return self->_attenuationDurations;
}

- (void)setAttenuationDurations:(id)a3
{
}

- (ENAttenuation)attenuationValue
{
  return self->_attenuationValue;
}

- (void)setAttenuationValue:(unsigned __int8)a3
{
  self->_attenuationValue = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSInteger)daysSinceOnsetOfSymptoms
{
  return self->_daysSinceOnsetOfSymptoms;
}

- (void)setDaysSinceOnsetOfSymptoms:(int64_t)a3
{
  self->_int64_t daysSinceOnsetOfSymptoms = a3;
}

- (ENDiagnosisReportType)diagnosisReportType
{
  return self->_diagnosisReportType;
}

- (void)setDiagnosisReportType:(unsigned int)a3
{
  self->_uint64_t diagnosisReportType = a3;
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (ENRiskScore)totalRiskScore
{
  return self->_totalRiskScore;
}

- (void)setTotalRiskScore:(unsigned __int8)a3
{
  self->_totalRiskScore = a3;
}

- (double)totalRiskScoreFullRange
{
  return self->_totalRiskScoreFullRange;
}

- (void)setTotalRiskScoreFullRange:(double)a3
{
  self->_double totalRiskScoreFullRange = a3;
}

- (ENRiskLevel)transmissionRiskLevel
{
  return self->_transmissionRiskLevel;
}

- (void)setTransmissionRiskLevel:(unsigned __int8)a3
{
  self->_transmissionRiskLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_attenuationDurations, 0);
}

@end