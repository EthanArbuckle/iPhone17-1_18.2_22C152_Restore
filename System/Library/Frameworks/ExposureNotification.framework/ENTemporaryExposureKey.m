@interface ENTemporaryExposureKey
- (BOOL)isValid;
- (BOOL)revised;
- (BOOL)vaccinated;
- (ENIntervalNumber)rollingPeriod;
- (ENIntervalNumber)rollingStartNumber;
- (ENRiskLevel)transmissionRiskLevel;
- (ENTemporaryExposureKey)init;
- (ENTemporaryExposureKey)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSData)keyData;
- (id)description;
- (int64_t)daysSinceOnsetOfSymptoms;
- (unsigned)diagnosisReportType;
- (unsigned)originalVariantOfConcernType;
- (unsigned)variantOfConcernType;
- (void)deriveRollingProximityIdentifiersWithBuffer:(id *)a3 count:(unint64_t)a4;
- (void)encodeWithXPCObject:(id)a3;
- (void)getAEMBytes:(void *)a3 input:(const void *)a4 length:(unint64_t)a5 RPI:(id *)a6;
- (void)setDaysSinceOnsetOfSymptoms:(int64_t)a3;
- (void)setDiagnosisReportType:(unsigned int)a3;
- (void)setKeyData:(NSData *)keyData;
- (void)setOriginalVariantOfConcernType:(unsigned int)a3;
- (void)setRevised:(BOOL)a3;
- (void)setRollingPeriod:(ENIntervalNumber)rollingPeriod;
- (void)setRollingStartNumber:(ENIntervalNumber)rollingStartNumber;
- (void)setTransmissionRiskLevel:(ENRiskLevel)transmissionRiskLevel;
- (void)setVaccinated:(BOOL)a3;
- (void)setVariantOfConcernType:(unsigned int)a3;
@end

@implementation ENTemporaryExposureKey

- (ENTemporaryExposureKey)init
{
  v6.receiver = self;
  v6.super_class = (Class)ENTemporaryExposureKey;
  v2 = [(ENTemporaryExposureKey *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_daysSinceOnsetOfSymptoms = 0x7FFFFFFFFFFFFFFFLL;
    v2->_rollingPeriod = 144;
    v4 = v2;
  }

  return v3;
}

- (ENTemporaryExposureKey)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(ENTemporaryExposureKey *)self init];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_25;
    }
LABEL_24:
    ENErrorF(2);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (MEMORY[0x2166BCD00](v6) != MEMORY[0x263EF8708])
  {
    if (!a4) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  int v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 == 6)
  {
    v7->_daysSinceOnsetOfSymptoms = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_25;
  }
  int v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 == 6)
  {
    v7->_diagnosisReportType = 0;
  }
  else if (v9 == 5)
  {
    goto LABEL_25;
  }
  if (!CUXPCDecodeNSDataOfLength()) {
    goto LABEL_25;
  }
  int v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 == 6)
  {
    v7->_rollingStartNumber = 0;
  }
  else if (v10 == 5)
  {
    goto LABEL_25;
  }
  int v11 = CUXPCDecodeUInt64RangedEx();
  if (v11 == 6)
  {
    v7->_transmissionRiskLevel = 0;
  }
  else if (v11 == 5)
  {
    goto LABEL_25;
  }
  int v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 != 6)
  {
    if (v12 != 5) {
      goto LABEL_19;
    }
LABEL_25:
    v13 = 0;
    goto LABEL_20;
  }
  v7->_variantOfConcernType = 0;
LABEL_19:
  v7->_revised = xpc_dictionary_get_BOOL(v6, "tekRv");
  v7->_rollingPeriod = xpc_dictionary_get_uint64(v6, "rlgP");
  v7->_vaccinated = xpc_dictionary_get_BOOL(v6, "vaccinated");
  v13 = v7;
LABEL_20:

  return v13;
}

- (void)encodeWithXPCObject:(id)a3
{
  xpc_object_t xdict = a3;
  int64_t daysSinceOnsetOfSymptoms = self->_daysSinceOnsetOfSymptoms;
  if (daysSinceOnsetOfSymptoms != 0x7FFFFFFFFFFFFFFFLL) {
    xpc_dictionary_set_int64(xdict, "dSOS", daysSinceOnsetOfSymptoms);
  }
  uint64_t diagnosisReportType = self->_diagnosisReportType;
  if (diagnosisReportType) {
    xpc_dictionary_set_uint64(xdict, "dRT", diagnosisReportType);
  }
  keyData = self->_keyData;
  if (keyData)
  {
    v7 = keyData;
    id v8 = xdict;
    int v9 = v7;
    uint64_t v10 = [(NSData *)v9 bytes];
    if (v10) {
      int v11 = (const char *)v10;
    }
    else {
      int v11 = "";
    }
    size_t v12 = [(NSData *)v9 length];

    xpc_dictionary_set_data(v8, "keyD", v11, v12);
  }
  uint64_t rollingStartNumber = self->_rollingStartNumber;
  if (rollingStartNumber) {
    xpc_dictionary_set_uint64(xdict, "rlSN", rollingStartNumber);
  }
  v14 = xdict;
  if (self->_transmissionRiskLevel)
  {
    xpc_dictionary_set_uint64(xdict, "trRL", self->_transmissionRiskLevel);
    v14 = xdict;
  }
  uint64_t variantOfConcernType = self->_variantOfConcernType;
  if (variantOfConcernType)
  {
    xpc_dictionary_set_uint64(xdict, "vcRT", variantOfConcernType);
    v14 = xdict;
  }
  xpc_dictionary_set_BOOL(v14, "tekRv", self->_revised);
  xpc_dictionary_set_uint64(xdict, "rlgP", self->_rollingPeriod);
  xpc_dictionary_set_BOOL(xdict, "vaccinated", self->_vaccinated);
}

- (void)deriveRollingProximityIdentifiersWithBuffer:(id *)a3 count:(unint64_t)a4
{
  v9[4] = *MEMORY[0x263EF8340];
  if (![(ENTemporaryExposureKey *)self isValid])
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ENCommon.m", 558, @"Invalid parameter not satisfying: %@", @"self.valid" object file lineNumber description];
  }
  v9[2] = 0;
  v9[3] = 0;
  [(NSData *)self->_keyData bytes];
  if ([(NSData *)self->_keyData length] <= 0xF) {
    [(NSData *)self->_keyData length];
  }
  __memcpy_chk();
  v9[0] = 0;
  v9[1] = 0;
  ENRPIKDerive();
  ENRPIDeriveBatch((uint64_t)a3, (uint64_t)v9, self->_rollingStartNumber, a4);
}

- (void)getAEMBytes:(void *)a3 input:(const void *)a4 length:(unint64_t)a5 RPI:(id *)a6
{
  if (![(ENTemporaryExposureKey *)self isValid])
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ENCommon.m", 575, @"Invalid parameter not satisfying: %@", @"self.valid" object file lineNumber description];
  }
  [(NSData *)self->_keyData bytes];
  if ([(NSData *)self->_keyData length] <= 0xF) {
    [(NSData *)self->_keyData length];
  }
  __memcpy_chk();
  ENAEMKDerive();
  ENAEMCrypt();
}

- (BOOL)isValid
{
  return [(NSData *)self->_keyData length] == 16;
}

- (id)description
{
  uint64_t v21 = 0;
  NSAppendPrintF_safe();
  id v3 = 0;
  v4 = v3;
  if (self->_revised)
  {
    id v20 = v3;
    v17 = "yes";
    NSAppendPrintF_safe();
    id v5 = v20;

    v4 = v5;
  }
  v19[2] = v4;
  [(NSData *)self->_keyData bytes];
  [(NSData *)self->_keyData length];
  NSAppendPrintF();
  id v6 = v4;

  v19[1] = v6;
  NSAppendPrintF_safe();
  id v7 = v6;

  if (self->_daysSinceOnsetOfSymptoms == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v18 = v7;
    id v8 = &v18;
  }
  else
  {
    v19[0] = v7;
    id v8 = (id *)v19;
  }
  NSAppendPrintF_safe();
  id v9 = *v8;

  NSAppendPrintF_safe();
  id v10 = v9;

  NSAppendPrintF_safe();
  id v11 = v10;

  NSAppendPrintF_safe();
  id v12 = v11;

  NSAppendPrintF_safe();
  id v13 = v12;

  NSAppendPrintF_safe();
  id v14 = v13;

  NSAppendPrintF_safe();
  id v15 = v14;

  return v15;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(NSData *)keyData
{
}

- (ENIntervalNumber)rollingPeriod
{
  return self->_rollingPeriod;
}

- (void)setRollingPeriod:(ENIntervalNumber)rollingPeriod
{
  self->_rollingPeriod = rollingPeriod;
}

- (ENIntervalNumber)rollingStartNumber
{
  return self->_rollingStartNumber;
}

- (void)setRollingStartNumber:(ENIntervalNumber)rollingStartNumber
{
  self->_uint64_t rollingStartNumber = rollingStartNumber;
}

- (ENRiskLevel)transmissionRiskLevel
{
  return self->_transmissionRiskLevel;
}

- (void)setTransmissionRiskLevel:(ENRiskLevel)transmissionRiskLevel
{
  self->_transmissionRiskLevel = transmissionRiskLevel;
}

- (int64_t)daysSinceOnsetOfSymptoms
{
  return self->_daysSinceOnsetOfSymptoms;
}

- (void)setDaysSinceOnsetOfSymptoms:(int64_t)a3
{
  self->_int64_t daysSinceOnsetOfSymptoms = a3;
}

- (unsigned)diagnosisReportType
{
  return self->_diagnosisReportType;
}

- (void)setDiagnosisReportType:(unsigned int)a3
{
  self->_uint64_t diagnosisReportType = a3;
}

- (BOOL)vaccinated
{
  return self->_vaccinated;
}

- (void)setVaccinated:(BOOL)a3
{
  self->_vaccinated = a3;
}

- (BOOL)revised
{
  return self->_revised;
}

- (void)setRevised:(BOOL)a3
{
  self->_revised = a3;
}

- (unsigned)variantOfConcernType
{
  return self->_variantOfConcernType;
}

- (void)setVariantOfConcernType:(unsigned int)a3
{
  self->_uint64_t variantOfConcernType = a3;
}

- (unsigned)originalVariantOfConcernType
{
  return self->_originalVariantOfConcernType;
}

- (void)setOriginalVariantOfConcernType:(unsigned int)a3
{
  self->_originalVariantOfConcernType = a3;
}

- (void).cxx_destruct
{
}

@end