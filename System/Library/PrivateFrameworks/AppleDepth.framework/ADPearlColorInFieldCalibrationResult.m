@interface ADPearlColorInFieldCalibrationResult
- (ADPearlColorInFieldCalibrationResult)initWithDictionary:(id)a3;
- (BOOL)executed;
- (__n128)motionRotation;
- (__n128)motionTranslation;
- (__n128)pearlToColorExtrinsics;
- (__n128)setPearlToColorExtrinsics:(__n128)a3;
- (float)absoluteRotationPostISFX;
- (float)absoluteRotationPostISFY;
- (float)absoluteRotationPostISFZ;
- (float)absoluteRotationX;
- (float)absoluteRotationY;
- (float)absoluteRotationZ;
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
- (float)validDepthPercentage;
- (id)dictionaryRepresentation;
- (void)setAbsoluteRotationPostISFX:(float)a3;
- (void)setAbsoluteRotationPostISFY:(float)a3;
- (void)setAbsoluteRotationPostISFZ:(float)a3;
- (void)setAbsoluteRotationX:(float)a3;
- (void)setAbsoluteRotationY:(float)a3;
- (void)setAbsoluteRotationZ:(float)a3;
- (void)setConfidence:(float)a3;
- (void)setDeltaRotationX:(float)a3;
- (void)setDeltaRotationY:(float)a3;
- (void)setDeltaRotationZ:(float)a3;
- (void)setExecuted:(BOOL)a3;
- (void)setFactoryRotationX:(float)a3;
- (void)setFactoryRotationY:(float)a3;
- (void)setFactoryRotationZ:(float)a3;
- (void)setMotionRotation:(ADPearlColorInFieldCalibrationResult *)self;
- (void)setMotionTranslation:(ADPearlColorInFieldCalibrationResult *)self;
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
- (void)setValidDepthPercentage:(float)a3;
@end

@implementation ADPearlColorInFieldCalibrationResult

- (void)setValidDepthPercentage:(float)a3
{
  self->_validDepthPercentage = a3;
}

- (float)validDepthPercentage
{
  return self->_validDepthPercentage;
}

- (void)setMotionTranslation:(ADPearlColorInFieldCalibrationResult *)self
{
  *(_OWORD *)self->_motionTranslation = v2;
}

- (__n128)motionTranslation
{
  return a1[9];
}

- (void)setMotionRotation:(ADPearlColorInFieldCalibrationResult *)self
{
  *(_OWORD *)self->_motionRotation = v2;
}

- (__n128)motionRotation
{
  return a1[8];
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

- (__n128)setPearlToColorExtrinsics:(__n128)a3
{
  result[10] = a2;
  result[11] = a3;
  result[12] = a4;
  result[13] = a5;
  return result;
}

- (__n128)pearlToColorExtrinsics
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

- (ADPearlColorInFieldCalibrationResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v111.receiver = self;
  v111.super_class = (Class)ADPearlColorInFieldCalibrationResult;
  v5 = [(ADPearlColorInFieldCalibrationResult *)&v111 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pearlToColorExtrinsics"];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
      v9 = [v8 objectAtIndexedSubscript:0];
      [v9 floatValue];
      unsigned int v110 = v10;

      v11 = [v8 objectAtIndexedSubscript:1];
      [v11 floatValue];
      unsigned int v106 = v12;

      v13 = [v8 objectAtIndexedSubscript:2];
      [v13 floatValue];
      int v15 = v14;

      v16 = [v8 objectAtIndexedSubscript:3];
      [v16 floatValue];
      unsigned int v109 = v17;

      v18 = [v8 objectAtIndexedSubscript:4];
      [v18 floatValue];
      unsigned int v105 = v19;

      v20 = [v8 objectAtIndexedSubscript:5];
      [v20 floatValue];
      float v22 = v21;

      v23 = [v8 objectAtIndexedSubscript:6];
      [v23 floatValue];
      unsigned int v108 = v24;

      v25 = [v8 objectAtIndexedSubscript:7];
      [v25 floatValue];
      unsigned int v104 = v26;

      v27 = [v8 objectAtIndexedSubscript:8];
      [v27 floatValue];
      float v29 = v28;

      v30 = [v8 objectAtIndexedSubscript:9];
      [v30 floatValue];
      unsigned int v107 = v31;

      v32 = [v8 objectAtIndexedSubscript:10];
      [v32 floatValue];
      uint64_t v103 = v33;

      v34 = [v8 objectAtIndexedSubscript:11];
      [v34 floatValue];
      float v36 = v35;

      *(_DWORD *)&v5[1]._executed = v15;
      v5[1].super.isa = (Class)__PAIR64__(v106, v110);
      v5[1]._stdX = v22;
      *(void *)&v5[1]._deltaRotationY = __PAIR64__(v105, v109);
      v5[1]._absoluteRotationY = v29;
      *(void *)&v5[1]._stdZ = __PAIR64__(v104, v108);
      v5[1]._factoryRotationZ = v36;
      *(void *)&v5[1]._factoryRotationX = __PAIR64__(v103, v107);
    }
    v37 = objc_msgSend(v4, "objectForKeyedSubscript:", @"execute", v103);
    v5->_executed = [v37 BOOLValue];

    v38 = [v4 objectForKeyedSubscript:@"deltaRotationX"];
    [v38 doubleValue];
    *(float *)&double v39 = v39;
    v5->_deltaRotationX = *(float *)&v39;

    v40 = [v4 objectForKeyedSubscript:@"deltaRotationY"];
    [v40 doubleValue];
    *(float *)&double v41 = v41;
    v5->_deltaRotationY = *(float *)&v41;

    v42 = [v4 objectForKeyedSubscript:@"deltaRotationZ"];
    [v42 doubleValue];
    *(float *)&double v43 = v43;
    v5->_deltaRotationZ = *(float *)&v43;

    v44 = [v4 objectForKeyedSubscript:@"STDX"];
    [v44 doubleValue];
    *(float *)&double v45 = v45;
    v5->_stdX = *(float *)&v45;

    v46 = [v4 objectForKeyedSubscript:@"STDY"];
    [v46 doubleValue];
    *(float *)&double v47 = v47;
    v5->_stdY = *(float *)&v47;

    v48 = [v4 objectForKeyedSubscript:@"STDZ"];
    [v48 doubleValue];
    *(float *)&double v49 = v49;
    v5->_stdZ = *(float *)&v49;

    v50 = [v4 objectForKeyedSubscript:@"absoluteRotationX"];
    [v50 doubleValue];
    *(float *)&double v51 = v51;
    v5->_absoluteRotationX = *(float *)&v51;

    v52 = [v4 objectForKeyedSubscript:@"absoluteRotationY"];
    [v52 doubleValue];
    *(float *)&double v53 = v53;
    v5->_absoluteRotationY = *(float *)&v53;

    v54 = [v4 objectForKeyedSubscript:@"absoluteRotationZ"];
    [v54 doubleValue];
    *(float *)&double v55 = v55;
    v5->_absoluteRotationZ = *(float *)&v55;

    v56 = [v4 objectForKeyedSubscript:@"factoryRotationX"];
    [v56 doubleValue];
    *(float *)&double v57 = v57;
    v5->_factoryRotationX = *(float *)&v57;

    v58 = [v4 objectForKeyedSubscript:@"factoryRotationY"];
    [v58 doubleValue];
    *(float *)&double v59 = v59;
    v5->_factoryRotationY = *(float *)&v59;

    v60 = [v4 objectForKeyedSubscript:@"factoryRotationZ"];
    [v60 doubleValue];
    *(float *)&double v61 = v61;
    v5->_factoryRotationZ = *(float *)&v61;

    v62 = [v4 objectForKeyedSubscript:@"absoluteRotationPostISFX"];
    [v62 doubleValue];
    *(float *)&double v63 = v63;
    v5->_absoluteRotationPostISFX = *(float *)&v63;

    v64 = [v4 objectForKeyedSubscript:@"absoluteRotationPostISFY"];
    [v64 doubleValue];
    *(float *)&double v65 = v65;
    v5->_absoluteRotationPostISFY = *(float *)&v65;

    v66 = [v4 objectForKeyedSubscript:@"absoluteRotationPostISFZ"];
    [v66 doubleValue];
    *(float *)&double v67 = v67;
    v5->_absoluteRotationPostISFZ = *(float *)&v67;

    v68 = [v4 objectForKeyedSubscript:@"confidence"];
    [v68 doubleValue];
    *(float *)&double v69 = v69;
    v5->_confidence = *(float *)&v69;

    v70 = [v4 objectForKeyedSubscript:@"preRelative2FactoryX"];
    [v70 doubleValue];
    *(float *)&double v71 = v71;
    v5->_preRelative2FactoryX = *(float *)&v71;

    v72 = [v4 objectForKeyedSubscript:@"preRelative2FactoryY"];
    [v72 doubleValue];
    *(float *)&double v73 = v73;
    v5->_preRelative2FactoryY = *(float *)&v73;

    v74 = [v4 objectForKeyedSubscript:@"preRelative2FactoryZ"];
    [v74 doubleValue];
    *(float *)&double v75 = v75;
    v5->_preRelative2FactoryZ = *(float *)&v75;

    v76 = [v4 objectForKeyedSubscript:@"postRelative2FactoryX"];
    [v76 doubleValue];
    *(float *)&double v77 = v77;
    v5->_postRelative2FactoryX = *(float *)&v77;

    v78 = [v4 objectForKeyedSubscript:@"postRelative2FactoryY"];
    [v78 doubleValue];
    *(float *)&double v79 = v79;
    v5->_postRelative2FactoryY = *(float *)&v79;

    v80 = [v4 objectForKeyedSubscript:@"postRelative2FactoryZ"];
    [v80 doubleValue];
    *(float *)&double v81 = v81;
    v5->_postRelative2FactoryZ = *(float *)&v81;

    v82 = [v4 objectForKeyedSubscript:@"postRelative2PrevX"];
    [v82 doubleValue];
    *(float *)&double v83 = v83;
    v5->_postRelative2PrevX = *(float *)&v83;

    v84 = [v4 objectForKeyedSubscript:@"postRelative2PrevY"];
    [v84 doubleValue];
    *(float *)&double v85 = v85;
    v5->_postRelative2PrevY = *(float *)&v85;

    v86 = [v4 objectForKeyedSubscript:@"postRelative2PrevZ"];
    [v86 doubleValue];
    *(float *)&double v87 = v87;
    v5->_postRelative2PrevZ = *(float *)&v87;

    v88 = [v4 objectForKeyedSubscript:@"motionRotationX"];
    [v88 doubleValue];
    *(float *)&double v89 = v89;
    *(_DWORD *)v5->_motionRotation = LODWORD(v89);

    v90 = [v4 objectForKeyedSubscript:@"motionRotationY"];
    [v90 doubleValue];
    *(float *)&double v91 = v91;
    *(_DWORD *)&v5->_motionRotation[4] = LODWORD(v91);

    v92 = [v4 objectForKeyedSubscript:@"motionRotationZ"];
    [v92 doubleValue];
    *(float *)&double v93 = v93;
    *(_DWORD *)&v5->_motionRotation[8] = LODWORD(v93);

    v94 = [v4 objectForKeyedSubscript:@"motionTranslationX"];
    [v94 doubleValue];
    *(float *)&double v95 = v95;
    *(_DWORD *)v5->_motionTranslation = LODWORD(v95);

    v96 = [v4 objectForKeyedSubscript:@"motionTranslationY"];
    [v96 doubleValue];
    *(float *)&double v97 = v97;
    *(_DWORD *)&v5->_motionTranslation[4] = LODWORD(v97);

    v98 = [v4 objectForKeyedSubscript:@"motionTranslationZ"];
    [v98 doubleValue];
    *(float *)&double v99 = v99;
    *(_DWORD *)&v5->_motionTranslation[8] = LODWORD(v99);

    v100 = [v4 objectForKeyedSubscript:@"validDepthPercentage"];
    [v100 doubleValue];
    *(float *)&double v101 = v101;
    v5->_validDepthPercentage = *(float *)&v101;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v72[34] = *MEMORY[0x263EF8340];
  v70 = ADCommonUtils::matrixNxMToArrayColumnFirst<4ul,3ul,simd_float4x3>(&self[1]);
  v71[0] = @"execute";
  double v69 = [NSNumber numberWithBool:self->_executed];
  v72[0] = v69;
  v71[1] = @"deltaRotationX";
  *(float *)&double v3 = self->_deltaRotationX;
  v68 = [NSNumber numberWithFloat:v3];
  v72[1] = v68;
  v71[2] = @"deltaRotationY";
  *(float *)&double v4 = self->_deltaRotationY;
  double v67 = [NSNumber numberWithFloat:v4];
  v72[2] = v67;
  v71[3] = @"deltaRotationZ";
  *(float *)&double v5 = self->_deltaRotationZ;
  v66 = [NSNumber numberWithFloat:v5];
  v72[3] = v66;
  v71[4] = @"STDX";
  *(float *)&double v6 = self->_stdX;
  double v65 = [NSNumber numberWithFloat:v6];
  v72[4] = v65;
  v71[5] = @"STDY";
  *(float *)&double v7 = self->_stdY;
  v64 = [NSNumber numberWithFloat:v7];
  v72[5] = v64;
  v71[6] = @"STDZ";
  *(float *)&double v8 = self->_stdZ;
  double v63 = [NSNumber numberWithFloat:v8];
  v72[6] = v63;
  v71[7] = @"absoluteRotationX";
  *(float *)&double v9 = self->_absoluteRotationX;
  v62 = [NSNumber numberWithFloat:v9];
  v72[7] = v62;
  v71[8] = @"absoluteRotationY";
  *(float *)&double v10 = self->_absoluteRotationY;
  double v61 = [NSNumber numberWithFloat:v10];
  v72[8] = v61;
  v71[9] = @"absoluteRotationZ";
  *(float *)&double v11 = self->_absoluteRotationZ;
  v60 = [NSNumber numberWithFloat:v11];
  v72[9] = v60;
  v71[10] = @"factoryRotationX";
  *(float *)&double v12 = self->_factoryRotationX;
  double v59 = [NSNumber numberWithFloat:v12];
  v72[10] = v59;
  v71[11] = @"factoryRotationY";
  *(float *)&double v13 = self->_factoryRotationY;
  v58 = [NSNumber numberWithFloat:v13];
  v72[11] = v58;
  v71[12] = @"factoryRotationZ";
  *(float *)&double v14 = self->_factoryRotationZ;
  double v57 = [NSNumber numberWithFloat:v14];
  v72[12] = v57;
  v71[13] = @"absoluteRotationPostISFX";
  *(float *)&double v15 = self->_absoluteRotationPostISFX;
  v56 = [NSNumber numberWithFloat:v15];
  v72[13] = v56;
  v71[14] = @"absoluteRotationPostISFY";
  *(float *)&double v16 = self->_absoluteRotationPostISFY;
  double v55 = [NSNumber numberWithFloat:v16];
  v72[14] = v55;
  v71[15] = @"absoluteRotationPostISFZ";
  *(float *)&double v17 = self->_absoluteRotationPostISFZ;
  v54 = [NSNumber numberWithFloat:v17];
  v72[15] = v54;
  v71[16] = @"confidence";
  *(float *)&double v18 = self->_confidence;
  double v53 = [NSNumber numberWithFloat:v18];
  v72[16] = v53;
  v71[17] = @"preRelative2FactoryX";
  *(float *)&double v19 = self->_preRelative2FactoryX;
  v52 = [NSNumber numberWithFloat:v19];
  v72[17] = v52;
  v71[18] = @"preRelative2FactoryY";
  *(float *)&double v20 = self->_preRelative2FactoryY;
  double v51 = [NSNumber numberWithFloat:v20];
  v72[18] = v51;
  v71[19] = @"preRelative2FactoryZ";
  *(float *)&double v21 = self->_preRelative2FactoryZ;
  v50 = [NSNumber numberWithFloat:v21];
  v72[19] = v50;
  v71[20] = @"postRelative2FactoryX";
  *(float *)&double v22 = self->_postRelative2FactoryX;
  double v49 = [NSNumber numberWithFloat:v22];
  v72[20] = v49;
  v71[21] = @"postRelative2FactoryY";
  *(float *)&double v23 = self->_postRelative2FactoryY;
  v48 = [NSNumber numberWithFloat:v23];
  v72[21] = v48;
  v71[22] = @"postRelative2FactoryZ";
  *(float *)&double v24 = self->_postRelative2FactoryZ;
  double v47 = [NSNumber numberWithFloat:v24];
  v72[22] = v47;
  v71[23] = @"postRelative2PrevX";
  *(float *)&double v25 = self->_postRelative2PrevX;
  v46 = [NSNumber numberWithFloat:v25];
  v72[23] = v46;
  v71[24] = @"postRelative2PrevY";
  *(float *)&double v26 = self->_postRelative2PrevY;
  v27 = [NSNumber numberWithFloat:v26];
  v72[24] = v27;
  v71[25] = @"postRelative2PrevZ";
  *(float *)&double v28 = self->_postRelative2PrevZ;
  float v29 = [NSNumber numberWithFloat:v28];
  v72[25] = v29;
  v71[26] = @"motionRotationX";
  LODWORD(v30) = *(_DWORD *)self->_motionRotation;
  unsigned int v31 = [NSNumber numberWithFloat:v30];
  v72[26] = v31;
  v71[27] = @"motionRotationY";
  LODWORD(v32) = *(_DWORD *)&self->_motionRotation[4];
  uint64_t v33 = [NSNumber numberWithFloat:v32];
  v72[27] = v33;
  v71[28] = @"motionRotationZ";
  LODWORD(v34) = *(_DWORD *)&self->_motionRotation[8];
  float v35 = [NSNumber numberWithFloat:v34];
  v72[28] = v35;
  v71[29] = @"motionTranslationX";
  LODWORD(v36) = *(_DWORD *)self->_motionTranslation;
  v37 = [NSNumber numberWithFloat:v36];
  v72[29] = v37;
  v71[30] = @"motionTranslationY";
  LODWORD(v38) = *(_DWORD *)&self->_motionTranslation[4];
  double v39 = [NSNumber numberWithFloat:v38];
  v72[30] = v39;
  v71[31] = @"motionTranslationZ";
  LODWORD(v40) = *(_DWORD *)&self->_motionTranslation[8];
  double v41 = [NSNumber numberWithFloat:v40];
  v72[31] = v41;
  v71[32] = @"validDepthPercentage";
  *(float *)&double v42 = self->_validDepthPercentage;
  double v43 = [NSNumber numberWithFloat:v42];
  v71[33] = @"pearlToColorExtrinsics";
  v72[32] = v43;
  v72[33] = v70;
  id v45 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:34];

  return v45;
}

@end