@interface ENExposureWindow
- (ENCalibrationConfidence)calibrationConfidence;
- (ENDiagnosisReportType)diagnosisReportType;
- (ENExposureWindow)initWithXPCObject:(id)a3 error:(id *)a4;
- (ENInfectiousness)infectiousness;
- (ENVariantOfConcernType)variantOfConcernType;
- (NSArray)scanInstances;
- (NSDate)date;
- (id)description;
- (void)encodeWithXPCObject:(id)a3;
- (void)setCalibrationConfidence:(unsigned __int8)a3;
- (void)setDate:(id)a3;
- (void)setDiagnosisReportType:(unsigned int)a3;
- (void)setInfectiousness:(unsigned int)a3;
- (void)setScanInstances:(id)a3;
- (void)setVariantOfConcernType:(unsigned int)a3;
@end

@implementation ENExposureWindow

- (ENExposureWindow)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(ENExposureWindow *)self init];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_30;
    }
LABEL_29:
    ENErrorF(2);
    v20 = 0;
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
  uint64_t v23 = 0;
  int v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_calibrationConfidence = v23;
  }
  else if (v8 == 5)
  {
    goto LABEL_30;
  }
  double v29 = 0.0;
  if (!CUXPCDecodeDouble()) {
    goto LABEL_30;
  }
  if (v29 != 0.0)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:v29];
    date = v7->_date;
    v7->_date = (NSDate *)v9;
  }
  uint64_t v23 = 0;
  int v11 = CUXPCDecodeUInt64RangedEx();
  if (v11 == 6)
  {
    v7->_diagnosisReportType = v23;
  }
  else if (v11 == 5)
  {
    goto LABEL_30;
  }
  uint64_t v23 = 0;
  int v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 == 6)
  {
    v7->_infectiousness = v23;
  }
  else if (v12 == 5)
  {
    goto LABEL_30;
  }
  uint64_t v23 = 0;
  int v13 = CUXPCDecodeUInt64RangedEx();
  if (v13 == 6)
  {
    v7->_variantOfConcernType = v23;
    goto LABEL_18;
  }
  if (v13 == 5)
  {
LABEL_30:
    v20 = 0;
    goto LABEL_25;
  }
LABEL_18:
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  v15 = xpc_dictionary_get_array(v6, "scanInst");
  v16 = v15;
  if (!v15) {
    goto LABEL_23;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __44__ENExposureWindow_initWithXPCObject_error___block_invoke;
  applier[3] = &unk_264244840;
  applier[4] = v14;
  applier[5] = &v23;
  xpc_array_apply(v15, applier);
  v17 = (void *)v24[5];
  if (v17)
  {
    if (a4) {
      *a4 = v17;
    }
  }
  else
  {
    uint64_t v18 = [v14 copy];
    scanInstances = v7->_scanInstances;
    v7->_scanInstances = (NSArray *)v18;
  }
  _Block_object_dispose(&v23, 8);

  if (v17) {
    v20 = 0;
  }
  else {
LABEL_23:
  }
    v20 = v7;

LABEL_25:
  return v20;
}

BOOL __44__ENExposureWindow_initWithXPCObject_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    v5 = [ENScanInstance alloc];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    v7 = [(ENScanInstance *)v5 initWithXPCObject:v4 error:&obj];
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
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    uint64_t v10 = ENErrorF(15);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    BOOL v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (self->_calibrationConfidence) {
    xpc_dictionary_set_uint64(v4, "caliConf", self->_calibrationConfidence);
  }
  uint64_t v6 = self->_date;
  v7 = v6;
  if (v6)
  {
    [(NSDate *)v6 timeIntervalSinceReferenceDate];
    if (v8 != 0.0) {
      xpc_dictionary_set_double(v5, "tims", v8);
    }
  }

  uint64_t diagnosisReportType = self->_diagnosisReportType;
  if (diagnosisReportType) {
    xpc_dictionary_set_uint64(v5, "dRT", diagnosisReportType);
  }
  uint64_t infectiousness = self->_infectiousness;
  if (infectiousness) {
    xpc_dictionary_set_uint64(v5, "infect", infectiousness);
  }
  uint64_t variantOfConcernType = self->_variantOfConcernType;
  if (variantOfConcernType) {
    xpc_dictionary_set_uint64(v5, "vcRT", variantOfConcernType);
  }
  int v12 = self->_scanInstances;
  if (v12)
  {
    xpc_object_t v13 = xpc_array_create(0, 0);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v14 = self->_scanInstances;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
          objc_msgSend(v19, "encodeWithXPCObject:", v20, (void)v21);
          xpc_array_set_value(v13, 0xFFFFFFFFFFFFFFFFLL, v20);
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    xpc_dictionary_set_value(v5, "scanInst", v13);
  }
}

- (id)description
{
  NSAppendPrintF_safe();
  id v13 = 0;
  NSAppendPrintF_safe();
  id v3 = v13;

  NSAppendPrintF_safe();
  id v4 = v3;

  NSAppendPrintF_safe();
  id v5 = v4;

  NSAppendPrintF_safe();
  id v6 = v5;

  uint64_t variantOfConcernType = (int)self->_variantOfConcernType;
  if (variantOfConcernType > 4) {
    double v8 = "?";
  }
  else {
    double v8 = off_264244940[variantOfConcernType];
  }
  int v12 = v8;
  NSAppendPrintF_safe();
  id v9 = v6;

  [(NSArray *)self->_scanInstances count];
  NSAppendPrintF_safe();
  id v10 = v9;

  return v10;
}

- (ENCalibrationConfidence)calibrationConfidence
{
  return self->_calibrationConfidence;
}

- (void)setCalibrationConfidence:(unsigned __int8)a3
{
  self->_calibrationConfidence = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (ENDiagnosisReportType)diagnosisReportType
{
  return self->_diagnosisReportType;
}

- (void)setDiagnosisReportType:(unsigned int)a3
{
  self->_uint64_t diagnosisReportType = a3;
}

- (ENInfectiousness)infectiousness
{
  return self->_infectiousness;
}

- (void)setInfectiousness:(unsigned int)a3
{
  self->_uint64_t infectiousness = a3;
}

- (NSArray)scanInstances
{
  return self->_scanInstances;
}

- (void)setScanInstances:(id)a3
{
}

- (ENVariantOfConcernType)variantOfConcernType
{
  return self->_variantOfConcernType;
}

- (void)setVariantOfConcernType:(unsigned int)a3
{
  self->_uint64_t variantOfConcernType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanInstances, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end