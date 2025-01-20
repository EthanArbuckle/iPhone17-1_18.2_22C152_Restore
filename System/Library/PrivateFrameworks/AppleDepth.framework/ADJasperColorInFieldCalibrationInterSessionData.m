@interface ADJasperColorInFieldCalibrationInterSessionData
- (ADJasperColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3;
- (ADJasperColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andDeviceName:(id)a4;
- (ADJasperColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andFlowType:(int)a4;
- (ADJasperColorInFieldCalibrationInterSessionData)initWithFactoryJasperToColorTransform:(__n128)a3 currentJasperToColorTransform:(__n128)a4 andFlowType:(double)a5;
- (ADJasperColorInFieldCalibrationTelemetryData)inFieldCalibrationTelemetryData;
- (BOOL)insertEntryToDiagnosticPipelineLog:(ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)a3;
- (NSData)intersessionFeaturesHistory;
- (__n128)convertDictToExtrinsicsAngles:(void *)a3;
- (__n128)jasperToColorRotationAngles;
- (id).cxx_construct;
- (id)convertExtrinsicsAnglesToDict:(ADJasperColorInFieldCalibrationInterSessionData *)self;
- (id)persistenceData;
- (uint64_t)initWithFactoryJasperToColorTransform:(double)a3 currentJasperToColorTransform:(double)a4 andDeviceName:(double)a5;
- (uint64_t)initWithFactoryJasperToColorTransform:(void *)a1 currentJasperToColorTransform:(const char *)a2;
- (unsigned)intersessionFeaturesHistoryCount;
- (unsigned)isfCapacity;
- (unsigned)successfulResultCount;
- (void)initDiagnosticPipelineLogWithFlowType:(int)a3;
- (void)initIsf;
- (void)initIsfWithFlowType:(int)a3;
- (void)setInFieldCalibrationTelemetryData:(id)a3;
- (void)setIntersessionFeaturesHistory:(id)a3;
- (void)setIntersessionFeaturesHistoryCount:(unsigned int)a3;
- (void)setSuccessfulResultCount:(unsigned int)a3;
@end

@implementation ADJasperColorInFieldCalibrationInterSessionData

- (ADJasperColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andFlowType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ADJasperColorInFieldCalibrationInterSessionData;
  v7 = [(ADInFieldCalibrationInterSessionData *)&v36 init];
  if (!v7) {
    goto LABEL_21;
  }
  v8 = [v6 objectForKey:@"interSessionDataVersion"];
  -[ADInFieldCalibrationInterSessionData setVersion:](v7, "setVersion:", [v8 unsignedIntValue]);

  if ([(ADInFieldCalibrationInterSessionData *)v7 version] < 5
    || [(ADInFieldCalibrationInterSessionData *)v7 version] > 7
    || ([(ADJasperColorInFieldCalibrationInterSessionData *)v7 initIsfWithFlowType:v4],
        !v7->super._isf))
  {
LABEL_23:
    v34 = 0;
    goto LABEL_24;
  }
  [(ADJasperColorInFieldCalibrationInterSessionData *)v7 initDiagnosticPipelineLogWithFlowType:v4];
  v9 = [v6 objectForKey:@"telemetryKey"];
  v10 = [v6 objectForKey:@"isfHistoryKey"];
  v11 = [v6 objectForKey:@"depthToMcamFactoryExtrinsics"];
  v12 = [v6 objectForKey:@"featursHistoryDataKey"];
  v13 = [v6 objectForKey:@"featuresHistoryCountKey"];
  unsigned int v14 = [v13 unsignedLongLongValue];

  v15 = [v6 objectForKey:@"successfulResultCountKey"];
  unsigned int v16 = [v15 unsignedLongLongValue];

  v17 = [v6 objectForKey:@"diagnosticPipelineLog"];
  v7->_intersessionFeaturesHistoryCount = v14;
  if (v12)
  {
    v18 = objc_opt_new();
  }
  else
  {
    v18 = [MEMORY[0x263EFF8F8] dataWithData:0];
  }
  v19 = v18;
  objc_storeStrong((id *)&v7->_intersessionFeaturesHistory, v18);

  v7->_successfulResultCount = v16;
  isf = v7->super._isf;
  if (!v10)
  {
    v21 = [(ADJasperColorInFieldCalibrationInterSessionData *)v7 convertExtrinsicsAnglesToDict:0.0];
    uint64_t v22 = [(ADInterSessionFilter *)isf fillWithEntry:v21];

    if (!v22) {
      goto LABEL_12;
    }
LABEL_22:

    goto LABEL_23;
  }
  if ([(ADInterSessionFilter *)v7->super._isf fillWithDictionaryRepresentation:v10])
  {
    goto LABEL_22;
  }
LABEL_12:
  if (v9) {
    v23 = [[ADJasperColorInFieldCalibrationTelemetryData alloc] initWithDictionaryRepresentation:v9];
  }
  else {
    v23 = objc_alloc_init(ADJasperColorInFieldCalibrationTelemetryData);
  }
  inFieldCalibrationTelemetryData = v7->_inFieldCalibrationTelemetryData;
  v7->_inFieldCalibrationTelemetryData = v23;

  if (!v7->_inFieldCalibrationTelemetryData || !v11) {
    goto LABEL_22;
  }
  v25 = [v11 objectForKeyedSubscript:@"rotX"];
  [v25 floatValue];
  *(_DWORD *)v7->_jasperToColorRotationAngles = v26;

  v27 = [v11 objectForKeyedSubscript:@"rotY"];
  [v27 floatValue];
  *(_DWORD *)&v7->_jasperToColorRotationAngles[4] = v28;

  v29 = [v11 objectForKeyedSubscript:@"rotZ"];
  [v29 floatValue];
  *(_DWORD *)&v7->_jasperToColorRotationAngles[8] = v30;

  if (v17)
  {
    uint64_t v31 = [v17 length];
    begin = v7->_diagnosticPipelineLog.__begin_;
    if (v31 == (char *)v7->_diagnosticPipelineLog.__end_ - (char *)begin)
    {
      id v33 = v17;
      memcpy(begin, (const void *)[v33 bytes], objc_msgSend(v33, "length"));
      goto LABEL_20;
    }
    goto LABEL_22;
  }
LABEL_20:
  [(ADInFieldCalibrationInterSessionData *)v7 setVersion:7];

LABEL_21:
  v34 = v7;
LABEL_24:

  return v34;
}

- (id)persistenceData
{
  v28[3] = *MEMORY[0x263EF8340];
  v27[0] = @"rotX";
  LODWORD(v2) = *(_DWORD *)self->_jasperToColorRotationAngles;
  uint64_t v4 = [NSNumber numberWithFloat:v2];
  v28[0] = v4;
  v27[1] = @"rotY";
  LODWORD(v5) = *(_DWORD *)&self->_jasperToColorRotationAngles[4];
  id v6 = [NSNumber numberWithFloat:v5];
  v28[1] = v6;
  v27[2] = @"rotZ";
  LODWORD(v7) = *(_DWORD *)&self->_jasperToColorRotationAngles[8];
  v8 = [NSNumber numberWithFloat:v7];
  v28[2] = v8;
  v24 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

  v9 = (void *)MEMORY[0x263EFF9A0];
  v25[0] = @"isfHistoryKey";
  v23 = [(ADInterSessionFilter *)self->super._isf persistenceData];
  v26[0] = v23;
  v25[1] = @"telemetryKey";
  v10 = [(ADJasperColorInFieldCalibrationInterSessionData *)self inFieldCalibrationTelemetryData];
  v11 = [v10 persistenceData];
  v26[1] = v11;
  v26[2] = v24;
  v25[2] = @"depthToMcamFactoryExtrinsics";
  v25[3] = @"interSessionDataVersion";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ADInFieldCalibrationInterSessionData version](self, "version"));
  v26[3] = v12;
  v25[4] = @"featuresHistoryCountKey";
  v13 = [NSNumber numberWithUnsignedInt:self->_intersessionFeaturesHistoryCount];
  v26[4] = v13;
  v25[5] = @"featursHistoryDataKey";
  intersessionFeaturesHistory = self->_intersessionFeaturesHistory;
  v15 = intersessionFeaturesHistory;
  if (!intersessionFeaturesHistory) {
    v15 = objc_opt_new();
  }
  v26[5] = v15;
  v25[6] = @"successfulResultCountKey";
  unsigned int v16 = [NSNumber numberWithUnsignedInt:self->_successfulResultCount];
  v26[6] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:7];
  v18 = [v9 dictionaryWithDictionary:v17];

  if (!intersessionFeaturesHistory) {
  begin = self->_diagnosticPipelineLog.__begin_;
  }
  uint64_t v20 = (char *)self->_diagnosticPipelineLog.__end_ - (char *)begin;
  if (v20)
  {
    v21 = [MEMORY[0x263EFF990] dataWithBytes:(char *)begin + 150 * self->_diagnosticPipelineLogIndex length:150 * (0x2FC962FC962FC963 * (v20 >> 1) - self->_diagnosticPipelineLogIndex)];
    [v21 appendBytes:self->_diagnosticPipelineLog.__begin_ length:150 * self->_diagnosticPipelineLogIndex];
    [v18 setObject:v21 forKey:@"diagnosticPipelineLog"];
  }
  return v18;
}

- (ADJasperColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andDeviceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[ADJasperColorInFieldCalibrationInterSessionData initWithDictionaryRepresentation:andFlowType:](self, "initWithDictionaryRepresentation:andFlowType:", v6, [v7 hasPrefix:@"N301"] ^ 1);

  return v8;
}

- (void)initIsfWithFlowType:(int)a3
{
  [(ADInterSessionFilterParameters *)self->super._isfParameters setIsStepDetectionActive:1];
  [(ADInterSessionFilterParameters *)self->super._isfParameters setMinStepIndex:2];
  isf = self->super._isf;
  self->super._isf = 0;

  if (a3 == 1)
  {
    [(ADInterSessionFilterParameters *)self->super._isfParameters setMinimalEntriesForResult:50];
    [(ADInterSessionFilterParameters *)self->super._isfParameters setCapacity:50];
    int v15 = 1017370378;
    LODWORD(v16) = 1017370378;
    [(ADInterSessionFilterParameters *)self->super._isfParameters setMinimalWeight:v16];
    LODWORD(v17) = 0.25;
    [(ADInterSessionFilterParameters *)self->super._isfParameters setMaximalWeight:v17];
    [(ADInterSessionFilterParameters *)self->super._isfParameters setOutlierNumber:11];
    v12 = &unk_26C698550;
    uint64_t v13 = 10;
    int v14 = 1084093366;
    goto LABEL_5;
  }
  if (!a3)
  {
    id v6 = +[ADDeviceConfiguration numberForKey:kADDeviceConfigurationKeyJasperColorIsfCapacity];
    -[ADInterSessionFilterParameters setMinimalEntriesForResult:](self->super._isfParameters, "setMinimalEntriesForResult:", [v6 unsignedIntValue]);

    id v7 = +[ADDeviceConfiguration numberForKey:kADDeviceConfigurationKeyJasperColorIsfCapacity];
    -[ADInterSessionFilterParameters setCapacity:](self->super._isfParameters, "setCapacity:", [v7 unsignedIntValue]);

    LODWORD(v8) = 1031798784;
    [(ADInterSessionFilterParameters *)self->super._isfParameters setMinimalWeight:v8];
    LODWORD(v9) = 1058642330;
    [(ADInterSessionFilterParameters *)self->super._isfParameters setMaximalWeight:v9];
    v10 = +[ADDeviceConfiguration numberForKey:kADDeviceConfigurationKeyJasperColorIsfOutliers];
    -[ADInterSessionFilterParameters setOutlierNumber:](self->super._isfParameters, "setOutlierNumber:", [v10 unsignedIntValue]);

    v12 = &unk_26C698538;
    uint64_t v13 = 15;
    int v14 = 1092846921;
    int v15 = 1031798784;
LABEL_5:
    LODWORD(v11) = v15;
    [(ADInterSessionFilterParameters *)self->super._isfParameters setOutlierWeight:v11];
    [(ADInterSessionFilterParameters *)self->super._isfParameters setMinStepSize:v13];
    LODWORD(v18) = v14;
    [(ADInterSessionFilterParameters *)self->super._isfParameters setStepDetectionThreshold:v18];
    v19 = (ADInterSessionFilter *)[objc_alloc(MEMORY[0x263F26C80]) initWithFieldNames:v12 parameters:self->super._isfParameters];
    uint64_t v20 = self->super._isf;
    self->super._isf = v19;

    return;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "initIsf unknown flow type", v21, 2u);
  }
}

- (void)initDiagnosticPipelineLogWithFlowType:(int)a3
{
  if (!a3 && +[ADDeviceConfiguration isInternalBuild])
  {
    p_diagnosticPipelineLog = &self->_diagnosticPipelineLog;
    begin = self->_diagnosticPipelineLog.__begin_;
    end = self->_diagnosticPipelineLog.__end_;
    int64_t v7 = (char *)end - (char *)begin;
    unint64_t v8 = 0x2FC962FC962FC963 * (((char *)end - (char *)begin) >> 1);
    if (v8 >> 3 > 0x270)
    {
      if (v7 == 750000)
      {
LABEL_20:
        self->_diagnosticPipelineLogIndex = 0;
        return;
      }
      v25 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)begin + 750000);
    }
    else
    {
      value = self->_diagnosticPipelineLog.__end_cap_.__value_;
      if (0x2FC962FC962FC963 * (((char *)value - (char *)end) >> 1) < 5000 - v8)
      {
        unint64_t v10 = 0x2FC962FC962FC963 * (((char *)value - (char *)begin) >> 1);
        unint64_t v11 = 0x5F92C5F92C5F92C6 * (((char *)value - (char *)begin) >> 1);
        if (v11 <= 0x1388) {
          unint64_t v11 = 5000;
        }
        if (v10 >= 0xDA740DA740DA74) {
          unint64_t v12 = 0x1B4E81B4E81B4E8;
        }
        else {
          unint64_t v12 = v11;
        }
        if (v12 > 0x1B4E81B4E81B4E8) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v13 = 150 * v12;
        int v14 = (char *)operator new(150 * v12);
        int v15 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)&v14[2 * (((char *)end - (char *)begin) >> 1)];
        double v16 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)&v14[v13];
        bzero(v15, 150 * ((749850 - v7) / 0x96uLL) + 150);
        double v17 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)(&v15->var12 + 150 * ((749850 - v7) / 0x96uLL));
        if (end != begin)
        {
          do
          {
            long long v18 = *(_OWORD *)((char *)&end[-1].var0 + 2);
            *(_OWORD *)((char *)&v15[-1].var6 + 2) = *(_OWORD *)((char *)&end[-1].var6 + 2);
            *(_OWORD *)((char *)&v15[-1].var0 + 2) = v18;
            long long v19 = *(_OWORD *)((char *)&end[-1].var8[0][2] + 2);
            long long v20 = *(_OWORD *)((char *)&end[-1].var8[2][0] + 2);
            long long v21 = *(_OWORD *)((char *)&end[-1].var8[3][1] + 2);
            *(_OWORD *)((char *)&v15[-1].var8[4][2] + 2) = *(_OWORD *)((char *)&end[-1].var8[4][2] + 2);
            *(_OWORD *)((char *)&v15[-1].var8[3][1] + 2) = v21;
            *(_OWORD *)((char *)&v15[-1].var8[2][0] + 2) = v20;
            *(_OWORD *)((char *)&v15[-1].var8[0][2] + 2) = v19;
            long long v22 = *(_OWORD *)((char *)&end[-1].var9[1][0] + 2);
            long long v23 = *(_OWORD *)((char *)&end[-1].var9[2][1] + 2);
            long long v24 = *(_OWORD *)((char *)&end[-1].var9[3][2] + 2);
            *(void *)v15[-1].var10 = *(void *)end[-1].var10;
            *(_OWORD *)((char *)&v15[-1].var9[3][2] + 2) = v24;
            *(_OWORD *)((char *)&v15[-1].var9[2][1] + 2) = v23;
            *(_OWORD *)((char *)&v15[-1].var9[1][0] + 2) = v22;
            int v15 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)v15 - 150);
            end = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)end - 150);
          }
          while (end != begin);
          end = p_diagnosticPipelineLog->__begin_;
        }
        p_diagnosticPipelineLog->__begin_ = v15;
        self->_diagnosticPipelineLog.__end_ = v17;
        self->_diagnosticPipelineLog.__end_cap_.__value_ = v16;
        if (end) {
          operator delete(end);
        }
        goto LABEL_20;
      }
      bzero(self->_diagnosticPipelineLog.__end_, 150 * ((749850 - v7) / 0x96uLL) + 150);
      v25 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)(&end->var12 + 150 * ((749850 - v7) / 0x96uLL));
    }
    self->_diagnosticPipelineLog.__end_ = v25;
    goto LABEL_20;
  }
}

- (ADJasperColorInFieldCalibrationTelemetryData)inFieldCalibrationTelemetryData
{
  return self->_inFieldCalibrationTelemetryData;
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFieldCalibrationTelemetryData, 0);
  objc_storeStrong((id *)&self->_intersessionFeaturesHistory, 0);
  begin = self->_diagnosticPipelineLog.__begin_;
  if (begin)
  {
    self->_diagnosticPipelineLog.__end_ = begin;
    operator delete(begin);
  }
}

- (__n128)jasperToColorRotationAngles
{
  return a1[6];
}

- (void)setInFieldCalibrationTelemetryData:(id)a3
{
}

- (void)setSuccessfulResultCount:(unsigned int)a3
{
  self->_successfulResultCount = a3;
}

- (unsigned)successfulResultCount
{
  return self->_successfulResultCount;
}

- (void)setIntersessionFeaturesHistoryCount:(unsigned int)a3
{
  self->_intersessionFeaturesHistoryCount = a3;
}

- (unsigned)intersessionFeaturesHistoryCount
{
  return self->_intersessionFeaturesHistoryCount;
}

- (void)setIntersessionFeaturesHistory:(id)a3
{
}

- (NSData)intersessionFeaturesHistory
{
  return self->_intersessionFeaturesHistory;
}

- (BOOL)insertEntryToDiagnosticPipelineLog:(ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)a3
{
  begin = self->_diagnosticPipelineLog.__begin_;
  end = self->_diagnosticPipelineLog.__end_;
  if (end != begin)
  {
    double v5 = (char *)begin + 150 * self->_diagnosticPipelineLogIndex;
    long long v6 = *(_OWORD *)&a3->var6;
    *(_OWORD *)double v5 = *(_OWORD *)&a3->var0;
    *((_OWORD *)v5 + 1) = v6;
    long long v7 = *(_OWORD *)&a3->var8[4][2];
    long long v9 = *(_OWORD *)&a3->var8[0][2];
    long long v8 = *(_OWORD *)&a3->var8[2][0];
    *((_OWORD *)v5 + 4) = *(_OWORD *)&a3->var8[3][1];
    *((_OWORD *)v5 + 5) = v7;
    *((_OWORD *)v5 + 2) = v9;
    *((_OWORD *)v5 + 3) = v8;
    long long v11 = *(_OWORD *)&a3->var9[2][1];
    long long v10 = *(_OWORD *)&a3->var9[3][2];
    long long v12 = *(_OWORD *)&a3->var9[1][0];
    *(void *)(v5 + 142) = *(void *)((char *)&a3->var9[4][2] + 2);
    *((_OWORD *)v5 + 7) = v11;
    *((_OWORD *)v5 + 8) = v10;
    *((_OWORD *)v5 + 6) = v12;
    self->_diagnosticPipelineLogIndex = (self->_diagnosticPipelineLogIndex + 1)
                                      % (0x2FC962FC962FC963
                                       * (((char *)self->_diagnosticPipelineLog.__end_
                                         - (char *)self->_diagnosticPipelineLog.__begin_) >> 1));
  }
  return end != begin;
}

- (__n128)convertDictToExtrinsicsAngles:(void *)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"rotX"];
  [v4 floatValue];
  unsigned __int32 v13 = v5;
  long long v6 = [v3 objectForKeyedSubscript:@"rotY"];
  [v6 floatValue];
  unsigned __int32 v12 = v7;
  long long v8 = [v3 objectForKeyedSubscript:@"rotZ"];
  [v8 floatValue];
  unsigned __int32 v11 = v9;

  result.n128_u32[0] = v13;
  result.n128_u32[1] = v12;
  result.n128_u32[2] = v11;
  return result;
}

- (id)convertExtrinsicsAnglesToDict:(ADJasperColorInFieldCalibrationInterSessionData *)self
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"rotX";
  long long v9 = v2;
  id v3 = objc_msgSend(NSNumber, "numberWithFloat:");
  v11[0] = v3;
  v10[1] = @"rotY";
  HIDWORD(v4) = DWORD1(v9);
  LODWORD(v4) = DWORD1(v9);
  unsigned __int32 v5 = [NSNumber numberWithFloat:v4];
  v11[1] = v5;
  v10[2] = @"rotZ";
  long long v6 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v9), DWORD2(v9))));
  v11[2] = v6;
  unsigned __int32 v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v7;
}

- (ADJasperColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3
{
  return [(ADJasperColorInFieldCalibrationInterSessionData *)self initWithDictionaryRepresentation:a3 andDeviceName:@"N301"];
}

- (ADJasperColorInFieldCalibrationInterSessionData)initWithFactoryJasperToColorTransform:(__n128)a3 currentJasperToColorTransform:(__n128)a4 andFlowType:(double)a5
{
  v36.receiver = a1;
  v36.super_class = (Class)ADJasperColorInFieldCalibrationInterSessionData;
  unsigned __int32 v11 = [(ADInFieldCalibrationInterSessionData *)&v36 init];
  unsigned __int32 v12 = v11;
  if (!v11) {
    goto LABEL_5;
  }
  [(ADInFieldCalibrationInterSessionData *)v11 setVersion:7];
  [(ADJasperColorInFieldCalibrationInterSessionData *)v12 initIsfWithFlowType:a10];
  if (!v12->super._isf) {
    goto LABEL_4;
  }
  [(ADJasperColorInFieldCalibrationInterSessionData *)v12 initDiagnosticPipelineLogWithFlowType:a10];
  unsigned __int32 v13 = objc_alloc_init(ADJasperColorInFieldCalibrationTelemetryData);
  inFieldCalibrationTelemetryData = v12->_inFieldCalibrationTelemetryData;
  v12->_inFieldCalibrationTelemetryData = v13;

  float32x4_t v33 = 0u;
  float32x4_t v34 = 0u;
  v33.i32[2] = a2.n128_i32[2];
  float32x4_t v35 = 0u;
  v34.i32[2] = a3.n128_i32[2];
  v33.i64[0] = a2.n128_u64[0];
  v34.i64[0] = a3.n128_u64[0];
  v35.i32[2] = a4.n128_i32[2];
  v35.i64[0] = a4.n128_u64[0];
  +[ADUtils calcRotationAngle:&v33];
  *(_OWORD *)v12->_jasperToColorRotationAngles = v15;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  float32x4_t v16 = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a6, v33.f32[0]), a7, v34.f32[0]), a8, v35.f32[0]);
  float32x4_t v17 = vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(a6, *(float32x2_t *)v33.f32, 1), a7, *(float32x2_t *)v34.f32, 1), a8, *(float32x2_t *)v35.f32, 1);
  float32x4_t v18 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(a6, v33, 2), a7, v34, 2), a8, v35, 2);
  DWORD2(v30) = v16.i32[2];
  DWORD2(v31) = v17.i32[2];
  *(void *)&long long v30 = v16.i64[0];
  *(void *)&long long v31 = v17.i64[0];
  DWORD2(v32) = v18.i32[2];
  *(void *)&long long v32 = v18.i64[0];
  +[ADUtils calcRotationAngle:&v30];
  isf = v12->super._isf;
  long long v20 = -[ADJasperColorInFieldCalibrationInterSessionData convertExtrinsicsAnglesToDict:](v12, "convertExtrinsicsAnglesToDict:");
  uint64_t v21 = [(ADInterSessionFilter *)isf fillWithEntry:v20];

  if (v21) {
LABEL_4:
  }
    long long v22 = 0;
  else {
LABEL_5:
  }
    long long v22 = v12;

  return v22;
}

- (unsigned)isfCapacity
{
  return [(ADInterSessionFilterParameters *)self->super._isfParameters capacity];
}

- (uint64_t)initWithFactoryJasperToColorTransform:(double)a3 currentJasperToColorTransform:(double)a4 andDeviceName:(double)a5
{
  id v12 = a11;
  uint64_t v13 = objc_msgSend(a1, "initWithFactoryJasperToColorTransform:currentJasperToColorTransform:andFlowType:", objc_msgSend(v12, "hasPrefix:", @"N301") ^ 1, a2, a3, a4, a5, a6, a7, a8, a9);

  return v13;
}

- (uint64_t)initWithFactoryJasperToColorTransform:(void *)a1 currentJasperToColorTransform:(const char *)a2
{
  return objc_msgSend(a1, "initWithFactoryJasperToColorTransform:currentJasperToColorTransform:andDeviceName:", @"N301");
}

- (void)initIsf
{
}

@end