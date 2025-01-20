@interface ADPearlColorInFieldCalibrationInterSessionData
- (ADPearlColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3;
- (ADPearlColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andDeviceName:(id)a4;
- (ADPearlColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andFlowType:(int)a4;
- (ADPearlColorInFieldCalibrationInterSessionData)initWithFactoryPearlToColorTransform:(__n128)a3 currentPearlToColorTransform:(__n128)a4 andFlowType:(double)a5;
- (ADPearlColorInFieldCalibrationTelemetryData)inFieldCalibrationTelemetryData;
- (BOOL)insertEntryToDiagnosticPipelineLog:(ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)a3;
- (__n128)convertDictToExtrinsicsAngles:(void *)a3;
- (__n128)pearlToColorRotationAngles;
- (id).cxx_construct;
- (id)convertExtrinsicsAnglesToDict:(ADPearlColorInFieldCalibrationInterSessionData *)self;
- (id)persistenceData;
- (uint64_t)initWithFactoryPearlToColorTransform:(double)a3 currentPearlToColorTransform:(double)a4 andDeviceName:(double)a5;
- (uint64_t)initWithFactoryPearlToColorTransform:(void *)a1 currentPearlToColorTransform:(const char *)a2;
- (void)initDiagnosticPipelineLogWithFlowType:(int)a3;
- (void)initIsf;
- (void)initIsfWithFlowType:(int)a3;
- (void)setInFieldCalibrationTelemetryData:(id)a3;
@end

@implementation ADPearlColorInFieldCalibrationInterSessionData

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
  begin = self->_diagnosticPipelineLog.__begin_;
  if (begin)
  {
    self->_diagnosticPipelineLog.__end_ = begin;
    operator delete(begin);
  }
}

- (__n128)pearlToColorRotationAngles
{
  return a1[5];
}

- (void)setInFieldCalibrationTelemetryData:(id)a3
{
}

- (ADPearlColorInFieldCalibrationTelemetryData)inFieldCalibrationTelemetryData
{
  return self->_inFieldCalibrationTelemetryData;
}

- (BOOL)insertEntryToDiagnosticPipelineLog:(ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)a3
{
  begin = self->_diagnosticPipelineLog.__begin_;
  end = self->_diagnosticPipelineLog.__end_;
  if (end != begin)
  {
    v5 = (char *)begin + 53 * self->_diagnosticPipelineLogIndex;
    long long v7 = *(_OWORD *)&a3->var7;
    long long v6 = *(_OWORD *)&a3->var9[2];
    long long v8 = *(_OWORD *)&a3->var0;
    *(void *)(v5 + 45) = *(void *)((char *)&a3->var10[2] + 1);
    *((_OWORD *)v5 + 1) = v7;
    *((_OWORD *)v5 + 2) = v6;
    *(_OWORD *)v5 = v8;
    self->_diagnosticPipelineLogIndex = (self->_diagnosticPipelineLogIndex + 1)
                                      % (0x21CFB2B78C13521DLL
                                       * ((char *)self->_diagnosticPipelineLog.__end_
                                        - (char *)self->_diagnosticPipelineLog.__begin_));
  }
  return end != begin;
}

- (__n128)convertDictToExtrinsicsAngles:(void *)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"rotX"];
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

- (id)convertExtrinsicsAnglesToDict:(ADPearlColorInFieldCalibrationInterSessionData *)self
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

- (id)persistenceData
{
  v24[3] = *MEMORY[0x263EF8340];
  v23[0] = @"rotX";
  LODWORD(v2) = *(_DWORD *)self->_pearlToColorRotationAngles;
  double v4 = [NSNumber numberWithFloat:v2];
  v24[0] = v4;
  v23[1] = @"rotY";
  LODWORD(v5) = *(_DWORD *)&self->_pearlToColorRotationAngles[4];
  long long v6 = [NSNumber numberWithFloat:v5];
  v24[1] = v6;
  v23[2] = @"rotZ";
  LODWORD(v7) = *(_DWORD *)&self->_pearlToColorRotationAngles[8];
  long long v8 = [NSNumber numberWithFloat:v7];
  v24[2] = v8;
  long long v9 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];

  v10 = (void *)MEMORY[0x263EFF9A0];
  v21[0] = @"isfHistoryKey";
  unsigned __int32 v11 = [(ADInterSessionFilter *)self->super._isf persistenceData];
  v22[0] = v11;
  v21[1] = @"telemetryKey";
  unsigned __int32 v12 = [(ADPearlColorInFieldCalibrationInterSessionData *)self inFieldCalibrationTelemetryData];
  unsigned __int32 v13 = [v12 persistenceData];
  v22[1] = v13;
  v22[2] = v9;
  v21[2] = @"depthToMcamFactoryExtrinsics";
  v21[3] = @"interSessionDataVersion";
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ADInFieldCalibrationInterSessionData version](self, "version"));
  v22[3] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  v16 = [v10 dictionaryWithDictionary:v15];

  begin = self->_diagnosticPipelineLog.__begin_;
  int64_t v18 = (char *)self->_diagnosticPipelineLog.__end_ - (char *)begin;
  if (v18)
  {
    v19 = [MEMORY[0x263EFF990] dataWithBytes:(char *)begin + 53 * self->_diagnosticPipelineLogIndex length:53 * (0x21CFB2B78C13521DLL * v18 - self->_diagnosticPipelineLogIndex)];
    [v19 appendBytes:self->_diagnosticPipelineLog.__begin_ length:53 * self->_diagnosticPipelineLogIndex];
    [v16 setObject:v19 forKey:@"diagnosticPipelineLog"];
  }
  return v16;
}

- (ADPearlColorInFieldCalibrationInterSessionData)initWithFactoryPearlToColorTransform:(__n128)a3 currentPearlToColorTransform:(__n128)a4 andFlowType:(double)a5
{
  v36.receiver = a1;
  v36.super_class = (Class)ADPearlColorInFieldCalibrationInterSessionData;
  unsigned __int32 v11 = [(ADInFieldCalibrationInterSessionData *)&v36 init];
  unsigned __int32 v12 = v11;
  if (!v11) {
    goto LABEL_5;
  }
  [(ADInFieldCalibrationInterSessionData *)v11 setVersion:6];
  [(ADPearlColorInFieldCalibrationInterSessionData *)v12 initIsfWithFlowType:a10];
  if (!v12->super._isf) {
    goto LABEL_4;
  }
  [(ADPearlColorInFieldCalibrationInterSessionData *)v12 initDiagnosticPipelineLogWithFlowType:a10];
  unsigned __int32 v13 = objc_alloc_init(ADPearlColorInFieldCalibrationTelemetryData);
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
  *(_OWORD *)v12->_pearlToColorRotationAngles = v15;
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
  v20 = -[ADPearlColorInFieldCalibrationInterSessionData convertExtrinsicsAnglesToDict:](v12, "convertExtrinsicsAnglesToDict:");
  uint64_t v21 = [(ADInterSessionFilter *)isf fillWithEntry:v20];

  if (v21) {
LABEL_4:
  }
    v22 = 0;
  else {
LABEL_5:
  }
    v22 = v12;

  return v22;
}

- (ADPearlColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andFlowType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ADPearlColorInFieldCalibrationInterSessionData;
  double v7 = [(ADInFieldCalibrationInterSessionData *)&v29 init];
  if (!v7) {
    goto LABEL_18;
  }
  long long v8 = [v6 objectForKey:@"interSessionDataVersion"];
  -[ADInFieldCalibrationInterSessionData setVersion:](v7, "setVersion:", [v8 unsignedIntValue]);

  if ([(ADInFieldCalibrationInterSessionData *)v7 version] < 5
    || [(ADInFieldCalibrationInterSessionData *)v7 version] > 6
    || ([(ADPearlColorInFieldCalibrationInterSessionData *)v7 initIsfWithFlowType:v4],
        !v7->super._isf))
  {
LABEL_20:
    v27 = 0;
    goto LABEL_21;
  }
  [(ADPearlColorInFieldCalibrationInterSessionData *)v7 initDiagnosticPipelineLogWithFlowType:v4];
  long long v9 = [v6 objectForKey:@"telemetryKey"];
  v10 = [v6 objectForKey:@"isfHistoryKey"];
  unsigned __int32 v11 = [v6 objectForKey:@"depthToMcamFactoryExtrinsics"];
  unsigned __int32 v12 = [v6 objectForKey:@"diagnosticPipelineLog"];
  isf = v7->super._isf;
  if (!v10)
  {
    v14 = [(ADPearlColorInFieldCalibrationInterSessionData *)v7 convertExtrinsicsAnglesToDict:0.0];
    uint64_t v15 = [(ADInterSessionFilter *)isf fillWithEntry:v14];

    if (!v15) {
      goto LABEL_9;
    }
LABEL_19:

    goto LABEL_20;
  }
  if ([(ADInterSessionFilter *)v7->super._isf fillWithDictionaryRepresentation:v10])
  {
    goto LABEL_19;
  }
LABEL_9:
  if (v9) {
    float32x4_t v16 = [[ADPearlColorInFieldCalibrationTelemetryData alloc] initWithDictionaryRepresentation:v9];
  }
  else {
    float32x4_t v16 = objc_alloc_init(ADPearlColorInFieldCalibrationTelemetryData);
  }
  inFieldCalibrationTelemetryData = v7->_inFieldCalibrationTelemetryData;
  v7->_inFieldCalibrationTelemetryData = v16;

  if (!v7->_inFieldCalibrationTelemetryData || !v11) {
    goto LABEL_19;
  }
  float32x4_t v18 = [v11 objectForKeyedSubscript:@"rotX"];
  [v18 floatValue];
  *(_DWORD *)v7->_pearlToColorRotationAngles = v19;

  v20 = [v11 objectForKeyedSubscript:@"rotY"];
  [v20 floatValue];
  *(_DWORD *)&v7->_pearlToColorRotationAngles[4] = v21;

  v22 = [v11 objectForKeyedSubscript:@"rotZ"];
  [v22 floatValue];
  *(_DWORD *)&v7->_pearlToColorRotationAngles[8] = v23;

  if (v12)
  {
    uint64_t v24 = [v12 length];
    begin = v7->_diagnosticPipelineLog.__begin_;
    if (v24 == (char *)v7->_diagnosticPipelineLog.__end_ - (char *)begin)
    {
      id v26 = v12;
      memcpy(begin, (const void *)[v26 bytes], objc_msgSend(v26, "length"));
      goto LABEL_17;
    }
    goto LABEL_19;
  }
LABEL_17:
  [(ADInFieldCalibrationInterSessionData *)v7 setVersion:6];

LABEL_18:
  v27 = v7;
LABEL_21:

  return v27;
}

- (ADPearlColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andDeviceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 hasPrefix:@"N301"])
  {
    uint64_t v8 = 0;
  }
  else if ([v7 hasPrefix:@"J7"])
  {
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v8 = 1;
  }

  long long v9 = [(ADPearlColorInFieldCalibrationInterSessionData *)self initWithDictionaryRepresentation:v6 andFlowType:v8];
  return v9;
}

- (ADPearlColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3
{
  return [(ADPearlColorInFieldCalibrationInterSessionData *)self initWithDictionaryRepresentation:a3 andDeviceName:@"N301"];
}

- (uint64_t)initWithFactoryPearlToColorTransform:(double)a3 currentPearlToColorTransform:(double)a4 andDeviceName:(double)a5
{
  id v12 = a11;
  if ([v12 hasPrefix:@"N301"])
  {
    uint64_t v13 = 0;
  }
  else if ([v12 hasPrefix:@"J7"])
  {
    uint64_t v13 = 2;
  }
  else
  {
    uint64_t v13 = 1;
  }

  uint64_t v14 = objc_msgSend(a1, "initWithFactoryPearlToColorTransform:currentPearlToColorTransform:andFlowType:", v13, a2, a3, a4, a5, a6, a7, a8, a9);
  return v14;
}

- (uint64_t)initWithFactoryPearlToColorTransform:(void *)a1 currentPearlToColorTransform:(const char *)a2
{
  return objc_msgSend(a1, "initWithFactoryPearlToColorTransform:currentPearlToColorTransform:andDeviceName:", @"N301");
}

- (void)initDiagnosticPipelineLogWithFlowType:(int)a3
{
  if (!a3 && +[ADDeviceConfiguration isInternalBuild])
  {
    p_diagnosticPipelineLog = &self->_diagnosticPipelineLog;
    begin = self->_diagnosticPipelineLog.__begin_;
    end = self->_diagnosticPipelineLog.__end_;
    int64_t v7 = (char *)end - (char *)begin;
    unint64_t v8 = 0x21CFB2B78C13521DLL * ((char *)end - (char *)begin);
    if (v8 >> 3 > 0x270)
    {
      if (v7 == 265000)
      {
LABEL_20:
        self->_diagnosticPipelineLogIndex = 0;
        return;
      }
      int v23 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)begin + 265000);
    }
    else
    {
      value = self->_diagnosticPipelineLog.__end_cap_.__value_;
      if (0x21CFB2B78C13521DLL * ((char *)value - (char *)end) < 5000 - v8)
      {
        unint64_t v10 = 0x21CFB2B78C13521DLL * ((char *)value - (char *)begin);
        unint64_t v11 = 0x439F656F1826A43ALL * ((char *)value - (char *)begin);
        if (v11 <= 0x1388) {
          unint64_t v11 = 5000;
        }
        if (v10 >= 0x26A439F656F1826) {
          unint64_t v12 = 0x4D4873ECADE304DLL;
        }
        else {
          unint64_t v12 = v11;
        }
        if (v12 > 0x4D4873ECADE304DLL) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v13 = 53 * v12;
        uint64_t v14 = (char *)operator new(53 * v12);
        uint64_t v15 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)&v14[(char *)end - (char *)begin];
        float32x4_t v16 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)&v14[v13];
        uint64_t v17 = ((unint64_t)(264947 - v7) * (unsigned __int128)0x3521CFB2B78C1353uLL) >> 64;
        size_t v18 = 53 * ((v17 + ((unint64_t)(264947 - v7 - v17) >> 1)) >> 5) + 53;
        bzero(v15, v18);
        int v19 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)v15 + v18);
        if (end != begin)
        {
          do
          {
            long long v20 = *(_OWORD *)((char *)&end[-1].var0 + 3);
            long long v21 = *(_OWORD *)((char *)&end[-1].var7 + 3);
            long long v22 = *(_OWORD *)((char *)&end[-1].var9[2] + 3);
            *(void *)&v15[-1].var11 = *(void *)&end[-1].var11;
            *(_OWORD *)((char *)&v15[-1].var9[2] + 3) = v22;
            *(_OWORD *)((char *)&v15[-1].var7 + 3) = v21;
            *(_OWORD *)((char *)&v15[-1].var0 + 3) = v20;
            uint64_t v15 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)v15 - 53);
            end = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)end - 53);
          }
          while (end != begin);
          end = p_diagnosticPipelineLog->__begin_;
        }
        p_diagnosticPipelineLog->__begin_ = v15;
        self->_diagnosticPipelineLog.__end_ = v19;
        self->_diagnosticPipelineLog.__end_cap_.__value_ = v16;
        if (end) {
          operator delete(end);
        }
        goto LABEL_20;
      }
      uint64_t v24 = ((unint64_t)(264947 - v7) * (unsigned __int128)0x3521CFB2B78C1353uLL) >> 64;
      size_t v25 = 53 * ((v24 + ((unint64_t)(264947 - v7 - v24) >> 1)) >> 5) + 53;
      bzero(self->_diagnosticPipelineLog.__end_, v25);
      int v23 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)end + v25);
    }
    self->_diagnosticPipelineLog.__end_ = v23;
    goto LABEL_20;
  }
}

- (void)initIsf
{
}

- (void)initIsfWithFlowType:(int)a3
{
  [(ADInterSessionFilterParameters *)self->super._isfParameters setIsStepDetectionActive:1];
  [(ADInterSessionFilterParameters *)self->super._isfParameters setMinStepIndex:2];
  LODWORD(v5) = 1053609165;
  [(ADInterSessionFilterParameters *)self->super._isfParameters setMinimalWeight:v5];
  LODWORD(v6) = 4.0;
  [(ADInterSessionFilterParameters *)self->super._isfParameters setMaximalWeight:v6];
  LODWORD(v7) = 1053609165;
  [(ADInterSessionFilterParameters *)self->super._isfParameters setOutlierWeight:v7];
  LODWORD(v8) = 1092691385;
  [(ADInterSessionFilterParameters *)self->super._isfParameters setStepDetectionThreshold:v8];
  isf = self->super._isf;
  self->super._isf = 0;

  if ((a3 - 1) < 3)
  {
    unint64_t v10 = +[ADDeviceConfiguration numberForKey:kADDeviceConfigurationKeyPearlColorIsfCapacity_iOS];
    -[ADInterSessionFilterParameters setMinimalEntriesForResult:](self->super._isfParameters, "setMinimalEntriesForResult:", [v10 unsignedIntValue]);

    unint64_t v11 = +[ADDeviceConfiguration numberForKey:kADDeviceConfigurationKeyPearlColorIsfCapacity_iOS];
    -[ADInterSessionFilterParameters setCapacity:](self->super._isfParameters, "setCapacity:", [v11 unsignedIntValue]);

    unint64_t v12 = +[ADDeviceConfiguration numberForKey:kADDeviceConfigurationKeyPearlColorIsfOutliers_iOS];
    -[ADInterSessionFilterParameters setOutlierNumber:](self->super._isfParameters, "setOutlierNumber:", [v12 unsignedIntValue]);
    uint64_t v13 = 10;
LABEL_5:

    [(ADInterSessionFilterParameters *)self->super._isfParameters setMinStepSize:v13];
    float32x4_t v16 = (ADInterSessionFilter *)[objc_alloc(MEMORY[0x263F26C80]) initWithFieldNames:&unk_26C6984F0 parameters:self->super._isfParameters];
    uint64_t v17 = self->super._isf;
    self->super._isf = v16;

    return;
  }
  if (!a3)
  {
    uint64_t v14 = +[ADDeviceConfiguration numberForKey:kADDeviceConfigurationKeyPearlColorIsfCapacity];
    -[ADInterSessionFilterParameters setMinimalEntriesForResult:](self->super._isfParameters, "setMinimalEntriesForResult:", [v14 unsignedIntValue]);

    uint64_t v15 = +[ADDeviceConfiguration numberForKey:kADDeviceConfigurationKeyPearlColorIsfCapacity];
    -[ADInterSessionFilterParameters setCapacity:](self->super._isfParameters, "setCapacity:", [v15 unsignedIntValue]);

    unint64_t v12 = +[ADDeviceConfiguration numberForKey:kADDeviceConfigurationKeyPearlColorIsfOutliers];
    -[ADInterSessionFilterParameters setOutlierNumber:](self->super._isfParameters, "setOutlierNumber:", [v12 unsignedIntValue]);
    uint64_t v13 = 30;
    goto LABEL_5;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)size_t v18 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "initIsf unknown flow type", v18, 2u);
  }
}

@end