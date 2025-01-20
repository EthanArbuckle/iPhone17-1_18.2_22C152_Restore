@interface ADJasperColorInFieldCalibrationResult
- (ADJasperColorInFieldCalibrationResult)initWithDictionary:(id)a3;
- (BOOL)executed;
- (__n128)jasperToColorExtrinsics;
- (__n128)setJasperToColorExtrinsics:(__n128)a3;
- (char)validDepthPercentage;
- (float)absoluteRotationPostISFX;
- (float)absoluteRotationPostISFY;
- (float)absoluteRotationPostISFZ;
- (float)absoluteRotationX;
- (float)absoluteRotationY;
- (float)absoluteRotationZ;
- (float)alpha;
- (float)confidence;
- (float)deltaRotationX;
- (float)deltaRotationY;
- (float)deltaRotationZ;
- (float)factoryRotationX;
- (float)factoryRotationY;
- (float)factoryRotationZ;
- (float)postRelative2FactoryX;
- (float)postRelative2FactoryY;
- (float)postRelative2FactoryZ;
- (float)postRelative2PrevX;
- (float)postRelative2PrevY;
- (float)postRelative2PrevZ;
- (float)preRelative2FactoryX;
- (float)preRelative2FactoryY;
- (float)preRelative2FactoryZ;
- (float)stdX;
- (float)stdY;
- (float)stdZ;
- (id)dictionaryRepresentation;
- (int64_t)executionStatus;
- (uint64_t)motionRotation;
- (uint64_t)motionTranslation;
- (void)setAbsoluteRotationPostISFX:(float)a3;
- (void)setAbsoluteRotationPostISFY:(float)a3;
- (void)setAbsoluteRotationPostISFZ:(float)a3;
- (void)setAbsoluteRotationX:(float)a3;
- (void)setAbsoluteRotationY:(float)a3;
- (void)setAbsoluteRotationZ:(float)a3;
- (void)setAlpha:(float)a3;
- (void)setConfidence:(float)a3;
- (void)setDeltaRotationX:(float)a3;
- (void)setDeltaRotationY:(float)a3;
- (void)setDeltaRotationZ:(float)a3;
- (void)setExecuted:(BOOL)a3;
- (void)setExecutionStatus:(int64_t)a3;
- (void)setFactoryRotationX:(float)a3;
- (void)setFactoryRotationY:(float)a3;
- (void)setFactoryRotationZ:(float)a3;
- (void)setMotionRotation:(ADJasperColorInFieldCalibrationResult *)self;
- (void)setMotionTranslation:(ADJasperColorInFieldCalibrationResult *)self;
- (void)setPostRelative2FactoryX:(float)a3;
- (void)setPostRelative2FactoryY:(float)a3;
- (void)setPostRelative2FactoryZ:(float)a3;
- (void)setPostRelative2PrevX:(float)a3;
- (void)setPostRelative2PrevY:(float)a3;
- (void)setPostRelative2PrevZ:(float)a3;
- (void)setPreRelative2FactoryX:(float)a3;
- (void)setPreRelative2FactoryY:(float)a3;
- (void)setPreRelative2FactoryZ:(float)a3;
- (void)setStdX:(float)a3;
- (void)setStdY:(float)a3;
- (void)setStdZ:(float)a3;
- (void)setValidDepthPercentage:(char *)a3;
@end

@implementation ADJasperColorInFieldCalibrationResult

- (void)setValidDepthPercentage:(char *)a3
{
  self->_validDepthPercentage = a3;
}

- (char)validDepthPercentage
{
  return self->_validDepthPercentage;
}

- (void)setMotionTranslation:(ADJasperColorInFieldCalibrationResult *)self
{
  *(void *)self->_motionTranslation = v2;
}

- (uint64_t)motionTranslation
{
  return *(void *)(a1 + 136);
}

- (void)setMotionRotation:(ADJasperColorInFieldCalibrationResult *)self
{
  *(void *)self->_motionRotation = v2;
}

- (uint64_t)motionRotation
{
  return *(void *)(a1 + 128);
}

- (void)setAlpha:(float)a3
{
  self->_alpha = a3;
}

- (float)alpha
{
  return self->_alpha;
}

- (void)setExecutionStatus:(int64_t)a3
{
  self->_executionStatus = a3;
}

- (int64_t)executionStatus
{
  return self->_executionStatus;
}

- (void)setPostRelative2PrevZ:(float)a3
{
  self->_postRelative2PrevZ = a3;
}

- (float)postRelative2PrevZ
{
  return self->_postRelative2PrevZ;
}

- (void)setPostRelative2PrevY:(float)a3
{
  self->_postRelative2PrevY = a3;
}

- (float)postRelative2PrevY
{
  return self->_postRelative2PrevY;
}

- (void)setPostRelative2PrevX:(float)a3
{
  self->_postRelative2PrevX = a3;
}

- (float)postRelative2PrevX
{
  return self->_postRelative2PrevX;
}

- (void)setPostRelative2FactoryZ:(float)a3
{
  self->_postRelative2FactoryZ = a3;
}

- (float)postRelative2FactoryZ
{
  return self->_postRelative2FactoryZ;
}

- (void)setPostRelative2FactoryY:(float)a3
{
  self->_postRelative2FactoryY = a3;
}

- (float)postRelative2FactoryY
{
  return self->_postRelative2FactoryY;
}

- (void)setPostRelative2FactoryX:(float)a3
{
  self->_postRelative2FactoryX = a3;
}

- (float)postRelative2FactoryX
{
  return self->_postRelative2FactoryX;
}

- (void)setPreRelative2FactoryZ:(float)a3
{
  self->_preRelative2FactoryZ = a3;
}

- (float)preRelative2FactoryZ
{
  return self->_preRelative2FactoryZ;
}

- (void)setPreRelative2FactoryY:(float)a3
{
  self->_preRelative2FactoryY = a3;
}

- (float)preRelative2FactoryY
{
  return self->_preRelative2FactoryY;
}

- (void)setPreRelative2FactoryX:(float)a3
{
  self->_preRelative2FactoryX = a3;
}

- (float)preRelative2FactoryX
{
  return self->_preRelative2FactoryX;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setAbsoluteRotationPostISFZ:(float)a3
{
  self->_absoluteRotationPostISFZ = a3;
}

- (float)absoluteRotationPostISFZ
{
  return self->_absoluteRotationPostISFZ;
}

- (void)setAbsoluteRotationPostISFY:(float)a3
{
  self->_absoluteRotationPostISFY = a3;
}

- (float)absoluteRotationPostISFY
{
  return self->_absoluteRotationPostISFY;
}

- (void)setAbsoluteRotationPostISFX:(float)a3
{
  self->_absoluteRotationPostISFX = a3;
}

- (float)absoluteRotationPostISFX
{
  return self->_absoluteRotationPostISFX;
}

- (void)setFactoryRotationZ:(float)a3
{
  self->_factoryRotationZ = a3;
}

- (float)factoryRotationZ
{
  return self->_factoryRotationZ;
}

- (void)setFactoryRotationY:(float)a3
{
  self->_factoryRotationY = a3;
}

- (float)factoryRotationY
{
  return self->_factoryRotationY;
}

- (void)setFactoryRotationX:(float)a3
{
  self->_factoryRotationX = a3;
}

- (float)factoryRotationX
{
  return self->_factoryRotationX;
}

- (void)setAbsoluteRotationZ:(float)a3
{
  self->_absoluteRotationZ = a3;
}

- (float)absoluteRotationZ
{
  return self->_absoluteRotationZ;
}

- (void)setAbsoluteRotationY:(float)a3
{
  self->_absoluteRotationY = a3;
}

- (float)absoluteRotationY
{
  return self->_absoluteRotationY;
}

- (void)setAbsoluteRotationX:(float)a3
{
  self->_absoluteRotationX = a3;
}

- (float)absoluteRotationX
{
  return self->_absoluteRotationX;
}

- (void)setStdZ:(float)a3
{
  self->_stdZ = a3;
}

- (float)stdZ
{
  return self->_stdZ;
}

- (void)setStdY:(float)a3
{
  self->_stdY = a3;
}

- (float)stdY
{
  return self->_stdY;
}

- (void)setStdX:(float)a3
{
  self->_stdX = a3;
}

- (float)stdX
{
  return self->_stdX;
}

- (void)setDeltaRotationZ:(float)a3
{
  self->_deltaRotationZ = a3;
}

- (float)deltaRotationZ
{
  return self->_deltaRotationZ;
}

- (void)setDeltaRotationY:(float)a3
{
  self->_deltaRotationY = a3;
}

- (float)deltaRotationY
{
  return self->_deltaRotationY;
}

- (void)setDeltaRotationX:(float)a3
{
  self->_deltaRotationX = a3;
}

- (float)deltaRotationX
{
  return self->_deltaRotationX;
}

- (__n128)setJasperToColorExtrinsics:(__n128)a3
{
  result[10] = a2;
  result[11] = a3;
  result[12] = a4;
  result[13] = a5;
  return result;
}

- (__n128)jasperToColorExtrinsics
{
  return a1[10];
}

- (void)setExecuted:(BOOL)a3
{
  self->_executed = a3;
}

- (BOOL)executed
{
  return self->_executed;
}

- (ADJasperColorInFieldCalibrationResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)ADJasperColorInFieldCalibrationResult;
  v5 = [(ADJasperColorInFieldCalibrationResult *)&v77 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"jasperToColorExtrinsics"];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
      v9 = [v8 objectAtIndexedSubscript:0];
      [v9 floatValue];

      v10 = [v8 objectAtIndexedSubscript:1];
      [v10 floatValue];

      v11 = [v8 objectAtIndexedSubscript:2];
      [v11 floatValue];

      v12 = [v8 objectAtIndexedSubscript:3];
      [v12 floatValue];

      v13 = [v8 objectAtIndexedSubscript:4];
      [v13 floatValue];

      v14 = [v8 objectAtIndexedSubscript:5];
      [v14 floatValue];

      v15 = [v8 objectAtIndexedSubscript:6];
      [v15 floatValue];

      v16 = [v8 objectAtIndexedSubscript:7];
      [v16 floatValue];

      v17 = [v8 objectAtIndexedSubscript:8];
      [v17 floatValue];

      v18 = [v8 objectAtIndexedSubscript:9];
      [v18 floatValue];

      v19 = [v8 objectAtIndexedSubscript:10];
      [v19 floatValue];

      v20 = [v8 objectAtIndexedSubscript:11];
      [v20 floatValue];
    }
    v21 = [v4 objectForKeyedSubscript:@"execute"];
    v5->_executed = [v21 BOOLValue];

    v22 = [v4 objectForKeyedSubscript:@"deltaRotationX"];
    [v22 doubleValue];
    *(float *)&double v23 = v23;
    v5->_deltaRotationX = *(float *)&v23;

    v24 = [v4 objectForKeyedSubscript:@"deltaRotationY"];
    [v24 doubleValue];
    *(float *)&double v25 = v25;
    v5->_deltaRotationY = *(float *)&v25;

    v26 = [v4 objectForKeyedSubscript:@"deltaRotationZ"];
    [v26 doubleValue];
    *(float *)&double v27 = v27;
    v5->_deltaRotationZ = *(float *)&v27;

    v28 = [v4 objectForKeyedSubscript:@"STDX"];
    [v28 doubleValue];
    *(float *)&double v29 = v29;
    v5->_stdX = *(float *)&v29;

    v30 = [v4 objectForKeyedSubscript:@"STDY"];
    [v30 doubleValue];
    *(float *)&double v31 = v31;
    v5->_stdY = *(float *)&v31;

    v32 = [v4 objectForKeyedSubscript:@"STDZ"];
    [v32 doubleValue];
    *(float *)&double v33 = v33;
    v5->_stdZ = *(float *)&v33;

    v34 = [v4 objectForKeyedSubscript:@"absoluteRotationX"];
    [v34 doubleValue];
    *(float *)&double v35 = v35;
    v5->_absoluteRotationX = *(float *)&v35;

    v36 = [v4 objectForKeyedSubscript:@"absoluteRotationY"];
    [v36 doubleValue];
    *(float *)&double v37 = v37;
    v5->_absoluteRotationY = *(float *)&v37;

    v38 = [v4 objectForKeyedSubscript:@"absoluteRotationZ"];
    [v38 doubleValue];
    *(float *)&double v39 = v39;
    v5->_absoluteRotationZ = *(float *)&v39;

    v40 = [v4 objectForKeyedSubscript:@"factoryRotationX"];
    [v40 doubleValue];
    *(float *)&double v41 = v41;
    v5->_factoryRotationX = *(float *)&v41;

    v42 = [v4 objectForKeyedSubscript:@"factoryRotationY"];
    [v42 doubleValue];
    *(float *)&double v43 = v43;
    v5->_factoryRotationY = *(float *)&v43;

    v44 = [v4 objectForKeyedSubscript:@"factoryRotationZ"];
    [v44 doubleValue];
    *(float *)&double v45 = v45;
    v5->_factoryRotationZ = *(float *)&v45;

    v46 = [v4 objectForKeyedSubscript:@"absoluteRotationPostISFX"];
    [v46 doubleValue];
    *(float *)&double v47 = v47;
    v5->_absoluteRotationPostISFX = *(float *)&v47;

    v48 = [v4 objectForKeyedSubscript:@"absoluteRotationPostISFY"];
    [v48 doubleValue];
    *(float *)&double v49 = v49;
    v5->_absoluteRotationPostISFY = *(float *)&v49;

    v50 = [v4 objectForKeyedSubscript:@"absoluteRotationPostISFZ"];
    [v50 doubleValue];
    *(float *)&double v51 = v51;
    v5->_absoluteRotationPostISFZ = *(float *)&v51;

    v52 = [v4 objectForKeyedSubscript:@"confidence"];
    [v52 doubleValue];
    *(float *)&double v53 = v53;
    v5->_confidence = *(float *)&v53;

    v54 = [v4 objectForKeyedSubscript:@"preRelative2FactoryX"];
    [v54 doubleValue];
    *(float *)&double v55 = v55;
    v5->_preRelative2FactoryX = *(float *)&v55;

    v56 = [v4 objectForKeyedSubscript:@"preRelative2FactoryY"];
    [v56 doubleValue];
    *(float *)&double v57 = v57;
    v5->_preRelative2FactoryY = *(float *)&v57;

    v58 = [v4 objectForKeyedSubscript:@"preRelative2FactoryZ"];
    [v58 doubleValue];
    *(float *)&double v59 = v59;
    v5->_preRelative2FactoryZ = *(float *)&v59;

    v60 = [v4 objectForKeyedSubscript:@"postRelative2FactoryX"];
    [v60 doubleValue];
    *(float *)&double v61 = v61;
    v5->_postRelative2FactoryX = *(float *)&v61;

    v62 = [v4 objectForKeyedSubscript:@"postRelative2FactoryY"];
    [v62 doubleValue];
    *(float *)&double v63 = v63;
    v5->_postRelative2FactoryY = *(float *)&v63;

    v64 = [v4 objectForKeyedSubscript:@"postRelative2FactoryZ"];
    [v64 doubleValue];
    *(float *)&double v65 = v65;
    v5->_postRelative2FactoryZ = *(float *)&v65;

    v66 = [v4 objectForKeyedSubscript:@"postRelative2PrevX"];
    [v66 doubleValue];
    *(float *)&double v67 = v67;
    v5->_postRelative2PrevX = *(float *)&v67;

    v68 = [v4 objectForKeyedSubscript:@"postRelative2PrevY"];
    [v68 doubleValue];
    *(float *)&double v69 = v69;
    v5->_postRelative2PrevY = *(float *)&v69;

    v70 = [v4 objectForKeyedSubscript:@"postRelative2PrevZ"];
    [v70 doubleValue];
    *(float *)&double v71 = v71;
    v5->_postRelative2PrevZ = *(float *)&v71;

    v72 = [v4 objectForKeyedSubscript:@"executionStatus"];
    [v72 doubleValue];
    v5->_executionStatus = (uint64_t)v73;

    v74 = [v4 objectForKeyedSubscript:@"alpha"];
    [v74 doubleValue];
    *(float *)&double v75 = v75;
    v5->_alpha = *(float *)&v75;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v61[29] = *MEMORY[0x263EF8340];
  double v59 = ADCommonUtils::matrixNxMToArrayColumnFirst<4ul,3ul,simd_float4x3>(&self[1]);
  v60[0] = @"execute";
  v58 = [NSNumber numberWithBool:self->_executed];
  v61[0] = v58;
  v60[1] = @"deltaRotationX";
  *(float *)&double v3 = self->_deltaRotationX;
  double v57 = [NSNumber numberWithFloat:v3];
  v61[1] = v57;
  v60[2] = @"deltaRotationY";
  *(float *)&double v4 = self->_deltaRotationY;
  v56 = [NSNumber numberWithFloat:v4];
  v61[2] = v56;
  v60[3] = @"deltaRotationZ";
  *(float *)&double v5 = self->_deltaRotationZ;
  double v55 = [NSNumber numberWithFloat:v5];
  v61[3] = v55;
  v60[4] = @"STDX";
  *(float *)&double v6 = self->_stdX;
  v54 = [NSNumber numberWithFloat:v6];
  v61[4] = v54;
  v60[5] = @"STDY";
  *(float *)&double v7 = self->_stdY;
  double v53 = [NSNumber numberWithFloat:v7];
  v61[5] = v53;
  v60[6] = @"STDZ";
  *(float *)&double v8 = self->_stdZ;
  v52 = [NSNumber numberWithFloat:v8];
  v61[6] = v52;
  v60[7] = @"absoluteRotationX";
  *(float *)&double v9 = self->_absoluteRotationX;
  double v51 = [NSNumber numberWithFloat:v9];
  v61[7] = v51;
  v60[8] = @"absoluteRotationY";
  *(float *)&double v10 = self->_absoluteRotationY;
  v50 = [NSNumber numberWithFloat:v10];
  v61[8] = v50;
  v60[9] = @"absoluteRotationZ";
  *(float *)&double v11 = self->_absoluteRotationZ;
  double v49 = [NSNumber numberWithFloat:v11];
  v61[9] = v49;
  v60[10] = @"factoryRotationX";
  *(float *)&double v12 = self->_factoryRotationX;
  v48 = [NSNumber numberWithFloat:v12];
  v61[10] = v48;
  v60[11] = @"factoryRotationY";
  *(float *)&double v13 = self->_factoryRotationY;
  double v47 = [NSNumber numberWithFloat:v13];
  v61[11] = v47;
  v60[12] = @"factoryRotationZ";
  *(float *)&double v14 = self->_factoryRotationZ;
  v46 = [NSNumber numberWithFloat:v14];
  v61[12] = v46;
  v60[13] = @"absoluteRotationPostISFX";
  *(float *)&double v15 = self->_absoluteRotationPostISFX;
  double v45 = [NSNumber numberWithFloat:v15];
  v61[13] = v45;
  v60[14] = @"absoluteRotationPostISFY";
  *(float *)&double v16 = self->_absoluteRotationPostISFY;
  v44 = [NSNumber numberWithFloat:v16];
  v61[14] = v44;
  v60[15] = @"absoluteRotationPostISFZ";
  *(float *)&double v17 = self->_absoluteRotationPostISFZ;
  double v43 = [NSNumber numberWithFloat:v17];
  v61[15] = v43;
  v60[16] = @"confidence";
  *(float *)&double v18 = self->_confidence;
  v42 = [NSNumber numberWithFloat:v18];
  v61[16] = v42;
  v60[17] = @"preRelative2FactoryX";
  *(float *)&double v19 = self->_preRelative2FactoryX;
  double v41 = [NSNumber numberWithFloat:v19];
  v61[17] = v41;
  v60[18] = @"preRelative2FactoryY";
  *(float *)&double v20 = self->_preRelative2FactoryY;
  v40 = [NSNumber numberWithFloat:v20];
  v61[18] = v40;
  v60[19] = @"preRelative2FactoryZ";
  *(float *)&double v21 = self->_preRelative2FactoryZ;
  v22 = [NSNumber numberWithFloat:v21];
  v61[19] = v22;
  v60[20] = @"postRelative2FactoryX";
  *(float *)&double v23 = self->_postRelative2FactoryX;
  v24 = [NSNumber numberWithFloat:v23];
  v61[20] = v24;
  v60[21] = @"postRelative2FactoryY";
  *(float *)&double v25 = self->_postRelative2FactoryY;
  v26 = [NSNumber numberWithFloat:v25];
  v61[21] = v26;
  v60[22] = @"postRelative2FactoryZ";
  *(float *)&double v27 = self->_postRelative2FactoryZ;
  v28 = [NSNumber numberWithFloat:v27];
  v61[22] = v28;
  v60[23] = @"postRelative2PrevX";
  *(float *)&double v29 = self->_postRelative2PrevX;
  v30 = [NSNumber numberWithFloat:v29];
  v61[23] = v30;
  v60[24] = @"postRelative2PrevY";
  *(float *)&double v31 = self->_postRelative2PrevY;
  v32 = [NSNumber numberWithFloat:v31];
  v61[24] = v32;
  v60[25] = @"postRelative2PrevZ";
  *(float *)&double v33 = self->_postRelative2PrevZ;
  v34 = [NSNumber numberWithFloat:v33];
  v61[25] = v34;
  v60[26] = @"executionStatus";
  double v35 = [NSNumber numberWithInteger:self->_executionStatus];
  v61[26] = v35;
  v60[27] = @"alpha";
  *(float *)&double v36 = self->_alpha;
  double v37 = [NSNumber numberWithFloat:v36];
  v60[28] = @"jasperToColorExtrinsics";
  v61[27] = v37;
  v61[28] = v59;
  v38 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:29];

  return v38;
}

@end