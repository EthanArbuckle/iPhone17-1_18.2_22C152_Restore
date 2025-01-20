@interface DolbyVisionDisplayManagement
- (BOOL)enableMSRandIOSTuning:(id *)a3;
- (DolbyVisionDisplayManagement)initWithDevice:(id)a3;
- (DolbyVisionDisplayManagement)initWithModelPointer:(id)a3;
- (DolbyVisionDisplayManagement)initWithTmLutSize:(int)a3;
- (float)dovi84_getScalingFactor:(float)a3 tableSize:(unint64_t)a4 config:(id *)a5 tmParam:(const _DoViTMParam *)a6 edrAdaptationParam:(const _EdrAdaptationParam *)a7 ambAdaptationParam:(const _AmbAdaptationParam *)a8 hlgOOTFCombined:(BOOL)a9;
- (float)dovi84_getScalingFactorForPT:(float)a3 tableSize:(unint64_t)a4 config:(id *)a5 tmParam:(const _DoViTMParam *)a6 edrAdaptationParam:(const _EdrAdaptationParam *)a7 ambAdaptationParam:(const _AmbAdaptationParam *)a8 hlgOOTFCombined:(BOOL)a9;
- (id)getAdaptiveTM;
- (id)getComputePipeLineStateForShader:(id)a3;
- (id)getDolbyVisionDM4;
- (id)getHistBasedToneMapping;
- (id)initTmEngine:(int)a3 device:(id)a4;
- (void)dovi84_setupTmParams:(id *)a3 hdrCtrl:(id *)a4 tcCtrl:(ToneCurve_Control *)a5 applyPostRGBtoRGBMatrixScaler:(BOOL *)a6 sMinPq:(float)a7 sMaxPq:(float)a8 tMinPq:(float)a9 tMaxPq:(float)a10 nominalPQ:(float)a11 targetingDoviLLOrSDR:(BOOL)a12 dm40:(id)a13;
- (void)dovi_computeDM4Tables:(const _DoViTMParam *)a3 config:(id *)a4 edrAdaptationParam:(const _EdrAdaptationParam *)a5 ambAdaptationParam:(const _AmbAdaptationParam *)a6 tLutI:(float *)a7 tLutS:(float *)a8 sLutI:(float *)a9 sLutS:(float *)a10 tLutISize:(unint64_t)a11 tLutSSize:(unint64_t)a12 sLutISize:(unint64_t)a13 sLutSSize:(unint64_t)a14 IsDoVi84:(BOOL)a15 HlgOOTFCombined:(BOOL)a16;
- (void)dovi_setSat2FactorTable:(float *)a3 tableSize:(unint64_t)a4 config:(id *)a5 llDovi:(BOOL)a6 applyDoVi84SatAdjustment:(BOOL)a7;
- (void)dovi_setScalingFactorTable:(float *)a3 lutInput:(const float *)a4 tableSize:(unint64_t)a5 config:(id *)a6 hdrCtrl:(id *)a7 tmParam:(const _DoViTMParam *)a8 edrAdaptationParam:(const _EdrAdaptationParam *)a9 ambAdaptationParam:(const _AmbAdaptationParam *)a10 hlgOOTFCombined:(BOOL)a11 hlgOOTFOnly:(BOOL)a12 isDoVi84:(BOOL)a13 tcCtrl:(ToneCurve_Control *)a14;
- (void)encodeToCommandBuffer:(id)a3 Input:(__IOSurface *)a4 Output:(__IOSurface *)a5 MetaData:(id *)a6;
- (void)encodeToCommandBuffer:(id)a3 Input:(__IOSurface *)a4 Output:(__IOSurface *)a5 MetaData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8;
- (void)getSat2Parameters:(id *)a3;
- (void)getToneCurves:(id *)a3 tcCtrl:(ToneCurve_Control *)a4 tmData:(_TMData *)a5;
- (void)getToneCurves:(id *)a3 tcCtrl:(ToneCurve_Control *)a4 tmData:(_TMData *)a5 srcMinPQ:(float)a6 srcMaxPQ:(float)a7 tgtMinPQ:(float)a8 tgtMaxPQ:(float)a9 srcDiagSize:(float)a10 dstDiagSize:(float)a11 EDRFactor:(float)a12 ambient:(float)a13 nominalPQ:(float)a14 useLCDPanel:(BOOL)a15 referenceDisplay:(BOOL)a16 slopeScaled:(float *)a17 c1:(float *)a18 c2:(float *)a19 c3:(float *)a20 BrightAdjBySat2:(float *)a21 DM_MetaData:(id *)a22;
- (void)getToneCurvesDM31:(id *)a3;
- (void)hlg_setupTmParams:(id *)a3 hdrCtrl:(id *)a4 tcCtrl:(ToneCurve_Control *)a5 dm40:(id)a6 applyPostRGBtoRGBMatrixScaler:(BOOL *)a7 pHistBasedToneMapping:(id)a8;
- (void)initToneCurveParams:(id *)a3 srcMinPQ:(float)a4 srcMaxPQ:(float)a5 tgtMinPQ:(float)a6 tgtMaxPQ:(float)a7 srcCrushPQ:(float)a8 srcMidPQ:(float)a9 srcClipPQ:(float)a10 srcDiagSize:(float)a11 dstDiagSize:(float)a12 EDRFactor:(float)a13 ambient:(float)a14 nominalPQ:(float)a15 useLCDPanel:(BOOL)a16 noPCC:(BOOL)a17 referenceDisplay:(BOOL)a18 passThroughTM:(BOOL)a19 slopeScaled:(float *)a20 c1:(float *)a21 c2:(float *)a22 c3:(float *)a23 BrightAdjBySat2:(float *)a24;
- (void)releaseResources;
- (void)setConvertConfig:(id *)a3 tcCtrl:(ToneCurve_Control *)a4 hdrCtrl:(id *)a5 auxData:(_AuxData *)a6 tmData:(_TMData *)a7;
- (void)setDisplayManagementConfigFromDictionary:(id *)a3 hdrCtrl:(id *)a4 tcCtrl:(ToneCurve_Control *)a5 infoFrame:(id *)a6;
- (void)setDisplayManagementConfigFromMetaData:(id *)a3 config:(id *)a4 hdrCtrl:(id *)a5 tcCtrl:(ToneCurve_Control *)a6;
- (void)setDisplayManagementToneMappingConfigFromDictionary:(id *)a3 hdrCtrl:(id *)a4 tcCtrl:(ToneCurve_Control *)a5 infoFrame:(id *)a6;
- (void)setDisplayManagementToneMappingConfigFromMetaData:(id *)a3 config:(id *)a4 tcCtrl:(ToneCurve_Control *)a5 hdrCtrl:(id *)a6 auxData:(_AuxData *)a7 dpcParam:(_DpcParam *)a8;
- (void)setInputDmVersion:(int)a3;
- (void)setupDoViDmVersion:(id *)a3 tmData:(_TMData *)a4 hdrCtrl:(id *)a5;
- (void)setupMetal;
- (void)setupTexturesWithInput:(__IOSurface *)a3 Output:(__IOSurface *)a4;
@end

@implementation DolbyVisionDisplayManagement

- (float)dovi84_getScalingFactor:(float)a3 tableSize:(unint64_t)a4 config:(id *)a5 tmParam:(const _DoViTMParam *)a6 edrAdaptationParam:(const _EdrAdaptationParam *)a7 ambAdaptationParam:(const _AmbAdaptationParam *)a8 hlgOOTFCombined:(BOOL)a9
{
  float SDRTmax_nits = a6->SDRTmax_nits;
  float OOTFMixingFactor = a6->OOTFMixingFactor;
  float v17 = a3;
  if (a9)
  {
    float v18 = -(float)(a3 + -0.0000014619);
    if (a3 >= 0.00000073096) {
      float v18 = a3;
    }
    float v19 = flt_2222D1868[a3 < 0.00000073096];
    float v20 = powf(v18, 0.012683);
    float v21 = fmax((float)((float)(v20 + -0.83594) / (float)((float)(v20 * -18.688) + 18.852)), 0.0);
    float v22 = powf(v21, 6.2774);
    float v23 = a6->Smin_nits + (float)(powf((float)(v19 * v22) / 1000.0, a5[1].var3 + 1.0) * (float)(1000.0 - a6->Smin_nits));
    if (v23 >= 0.0)
    {
      float v25 = powf(v23 * 0.0001, 0.1593);
      float v17 = powf((float)((float)(v25 * 18.852) + 0.83594) / (float)((float)(v25 * 18.688) + 1.0), 78.844);
    }
    else
    {
      float v24 = powf(v23 * -0.0001, 0.1593);
      float v17 = 0.0000014619 - powf((float)((float)(v24 * 18.852) + 0.83594) / (float)((float)(v24 * 18.688) + 1.0), 78.844);
    }
  }
  float v26 = v17;
  if (a6->on)
  {
    if (LODWORD(a5[1].var49) == 4)
    {
      *(float *)&double v27 = v17;
      -[DolbyVisionDM4 toneMapI:](self->_dm40, "toneMapI:", a4, v27);
      goto LABEL_30;
    }
    float v28 = powf(v17, a5->var36);
    float v29 = fmax((float)((float)(a5->var37 + (float)(a5->var38 * v28)) / (float)((float)(a5->var39 * v28) + 1.0)), 0.0);
    float v30 = powf(v29, 0.33333);
    if (BYTE1(a5[1].var52))
    {
      float v31 = applyLinearStretchInPQ(v30, a6->linearScaler, a6->linearOffset);
    }
    else
    {
      BOOL v32 = v30 < 0.00000073096;
      if (v30 < 0.00000073096) {
        float v30 = -(float)(v30 + -0.0000014619);
      }
      float v33 = flt_2222D1868[v32];
      float v34 = powf(v30, 0.012683);
      float v35 = fmax((float)((float)(v34 + -0.83594) / (float)((float)(v34 * -18.688) + 18.852)), 0.0);
      float v36 = (float)(v33 * powf(v35, 6.2774)) * a6->linearScaler;
      if (v36 < 0.0)
      {
        float v37 = powf(v36 * -0.0001, 0.1593);
        float v38 = 0.0000014619
            - powf((float)((float)(v37 * 18.852) + 0.83594) / (float)((float)(v37 * 18.688) + 1.0), 78.844);
        goto LABEL_18;
      }
      float v39 = powf(v36 * 0.0001, 0.1593);
      float v31 = powf((float)((float)(v39 * 18.852) + 0.83594) / (float)((float)(v39 * 18.688) + 1.0), 78.844);
    }
    float v38 = v31;
LABEL_18:
    if (hasTrim(&a5->var0))
    {
      float v40 = fmax((float)(*(float *)&a5->var56 + (float)(v38 * *(float *)&a5->var55.on)), 0.0);
      float v26 = powf(v40, *(float *)&a5->var57);
    }
    else
    {
      float rangeMax = a5->var55.rangeMax;
      float v42 = -(float)(a3 + -0.0000014619);
      if (a3 >= 0.00000073096) {
        float v42 = a3;
      }
      float v43 = flt_2222D1868[a3 < 0.00000073096];
      float v44 = powf(v42, 0.012683);
      float v45 = fmax((float)((float)(v44 + -0.83594) / (float)((float)(v44 * -18.688) + 18.852)), 0.0);
      float v46 = (float)(v43 * powf(v45, 6.2774)) / 1000.0;
      long double v47 = (float)(SDRTmax_nits / 1000.0);
      if (SDRTmax_nits <= 400.0 || SDRTmax_nits >= 2000.0)
      {
        long double v49 = log2(v47);
        double v48 = pow(1.11099994, v49) * 1.20000005 + -1.0;
      }
      else
      {
        double v48 = log10(v47) * 0.419999987 + 1.20000005 + -1.0;
      }
      float v50 = v48;
      float v51 = rangeMax * powf(v46, v50 + 1.0);
      if (v51 >= 0.0)
      {
        float v54 = powf(v51 * 0.0001, 0.1593);
        float v53 = powf((float)((float)(v54 * 18.852) + 0.83594) / (float)((float)(v54 * 18.688) + 1.0), 78.844);
      }
      else
      {
        float v52 = powf(v51 * -0.0001, 0.1593);
        float v53 = 0.0000014619
            - powf((float)((float)(v52 * 18.852) + 0.83594) / (float)((float)(v52 * 18.688) + 1.0), 78.844);
      }
      float v26 = (float)((float)(1.0 - OOTFMixingFactor) * v53) + (float)(OOTFMixingFactor * v38);
    }
  }
LABEL_30:
  *(float *)&double v55 = applyEdrAdaptationCurveS((uint64_t)a7, v26);
  double v56 = applyAmbAdaptationCurveS_C((uint64_t)a8, v55);
  if (SLODWORD(a5[1].var49) <= 3 && *(float *)&a5->var56 > 0.0)
  {
    float v57 = *(float *)&v56 / v17;
    if (v17 == 0.0) {
      float v57 = 1.0;
    }
    float v58 = fmin(v57, 2.0);
    *(float *)&double v56 = v17 * v58;
  }
  float result = *(float *)&v56 / a3;
  if (a3 == 0.0) {
    return 1.0;
  }
  return result;
}

- (float)dovi84_getScalingFactorForPT:(float)a3 tableSize:(unint64_t)a4 config:(id *)a5 tmParam:(const _DoViTMParam *)a6 edrAdaptationParam:(const _EdrAdaptationParam *)a7 ambAdaptationParam:(const _AmbAdaptationParam *)a8 hlgOOTFCombined:(BOOL)a9
{
  float SDRTmax_nits = a6->SDRTmax_nits;
  float OOTFMixingFactor = a6->OOTFMixingFactor;
  float tm_Smax_C = a6->tm_Smax_C;
  float tm_Smin_C = a6->tm_Smin_C;
  BOOL v19 = tm_Smax_C == tm_Smin_C;
  double v20 = fmax((float)((float)(a3 - tm_Smin_C) / (float)(tm_Smax_C - tm_Smin_C)), 0.0);
  *(float *)&double v20 = v20;
  *(float *)&double v20 = fminf(*(float *)&v20, 1.0);
  if (v19) {
    float v21 = 1.0;
  }
  else {
    float v21 = *(float *)&v20;
  }
  float v22 = a3;
  if (a9)
  {
    float v23 = -(float)(a3 + -0.0000014619);
    if (a3 >= 0.00000073096) {
      float v23 = a3;
    }
    float v24 = flt_2222D1868[a3 < 0.00000073096];
    float v25 = powf(v23, 0.012683);
    float v26 = fmax((float)((float)(v25 + -0.83594) / (float)((float)(v25 * -18.688) + 18.852)), 0.0);
    float v27 = powf(v26, 6.2774);
    float v28 = a6->Smin_nits + (float)(powf((float)(v24 * v27) / 1000.0, a5[1].var3 + 1.0) * (float)(1000.0 - a6->Smin_nits));
    if (v28 >= 0.0)
    {
      float v30 = powf(v28 * 0.0001, 0.1593);
      float v22 = powf((float)((float)(v30 * 18.852) + 0.83594) / (float)((float)(v30 * 18.688) + 1.0), 78.844);
    }
    else
    {
      float v29 = powf(v28 * -0.0001, 0.1593);
      float v22 = 0.0000014619 - powf((float)((float)(v29 * 18.852) + 0.83594) / (float)((float)(v29 * 18.688) + 1.0), 78.844);
    }
  }
  float v31 = v22;
  if (a6->on)
  {
    if (LODWORD(a5[1].var49) == 4)
    {
      *(float *)&double v20 = v22;
      -[DolbyVisionDM4 toneMapI:](self->_dm40, "toneMapI:", a4, v20);
      LODWORD(v33) = v32;
      *(float *)&double v34 = v22;
      [(DolbyVisionDM4 *)self->_dm40 satMapI:v34 Adm:v33];
      goto LABEL_33;
    }
    float v35 = powf(v22, a5->var36);
    float v36 = fmax((float)((float)(a5->var37 + (float)(a5->var38 * v35)) / (float)((float)(a5->var39 * v35) + 1.0)), 0.0);
    float v37 = powf(v36, 0.33333);
    if (BYTE1(a5[1].var52))
    {
      float v38 = applyLinearStretchInPQ(v37, a6->linearScaler, a6->linearOffset);
    }
    else
    {
      BOOL v39 = v37 < 0.00000073096;
      if (v37 < 0.00000073096) {
        float v37 = -(float)(v37 + -0.0000014619);
      }
      float v40 = flt_2222D1868[v39];
      float v41 = powf(v37, 0.012683);
      float v42 = fmax((float)((float)(v41 + -0.83594) / (float)((float)(v41 * -18.688) + 18.852)), 0.0);
      float v43 = (float)(v40 * powf(v42, 6.2774)) * a6->linearScaler;
      if (v43 < 0.0)
      {
        float v44 = powf(v43 * -0.0001, 0.1593);
        float v45 = 0.0000014619
            - powf((float)((float)(v44 * 18.852) + 0.83594) / (float)((float)(v44 * 18.688) + 1.0), 78.844);
        goto LABEL_21;
      }
      float v46 = powf(v43 * 0.0001, 0.1593);
      float v38 = powf((float)((float)(v46 * 18.852) + 0.83594) / (float)((float)(v46 * 18.688) + 1.0), 78.844);
    }
    float v45 = v38;
LABEL_21:
    if (hasTrim(&a5->var0))
    {
      float v47 = fmax((float)(*(float *)&a5->var56 + (float)(v45 * *(float *)&a5->var55.on)), 0.0);
      float v31 = powf(v47, *(float *)&a5->var57);
    }
    else
    {
      float rangeMax = a5->var55.rangeMax;
      float v48 = -(float)(a3 + -0.0000014619);
      if (a3 >= 0.00000073096) {
        float v48 = a3;
      }
      float v49 = flt_2222D1868[a3 < 0.00000073096];
      float v50 = powf(v48, 0.012683);
      float v51 = fmax((float)((float)(v50 + -0.83594) / (float)((float)(v50 * -18.688) + 18.852)), 0.0);
      float v52 = (float)(v49 * powf(v51, 6.2774)) / 1000.0;
      long double v53 = (float)(SDRTmax_nits / 1000.0);
      if (SDRTmax_nits <= 400.0 || SDRTmax_nits >= 2000.0)
      {
        long double v55 = log2(v53);
        double v54 = pow(1.11099994, v55) * 1.20000005 + -1.0;
      }
      else
      {
        double v54 = log10(v53) * 0.419999987 + 1.20000005 + -1.0;
      }
      float v56 = v54;
      float v57 = rangeMax * powf(v52, v56 + 1.0);
      if (v57 >= 0.0)
      {
        float v60 = powf(v57 * 0.0001, 0.1593);
        float v59 = powf((float)((float)(v60 * 18.852) + 0.83594) / (float)((float)(v60 * 18.688) + 1.0), 78.844);
      }
      else
      {
        float v58 = powf(v57 * -0.0001, 0.1593);
        float v59 = 0.0000014619
            - powf((float)((float)(v58 * 18.852) + 0.83594) / (float)((float)(v58 * 18.688) + 1.0), 78.844);
      }
      float v31 = (float)((float)(1.0 - OOTFMixingFactor) * v59) + (float)(OOTFMixingFactor * v45);
    }
  }
LABEL_33:
  *(float *)&double v61 = applyEdrAdaptationCurveS((uint64_t)a7, v31);
  double v62 = applyAmbAdaptationCurveS_C((uint64_t)a8, v61);
  if (SLODWORD(a5[1].var49) <= 3 && *(float *)&a5->var56 > 0.0)
  {
    float v63 = *(float *)&v62 / v22;
    if (v22 == 0.0) {
      float v63 = 1.0;
    }
    float v64 = fmin(v63, 2.0);
    *(float *)&double v62 = v22 * v64;
  }
  float v65 = *(float *)&v62 / a3;
  if (a3 == 0.0) {
    float v66 = 1.0;
  }
  else {
    float v66 = v65;
  }
  return (float)(v21 * (float)(1.0 - (float)(a3 - (float)(v66 * a3)))) + (float)((float)(1.0 - v21) * powf(v66, 0.7));
}

- (void)dovi_computeDM4Tables:(const _DoViTMParam *)a3 config:(id *)a4 edrAdaptationParam:(const _EdrAdaptationParam *)a5 ambAdaptationParam:(const _AmbAdaptationParam *)a6 tLutI:(float *)a7 tLutS:(float *)a8 sLutI:(float *)a9 sLutS:(float *)a10 tLutISize:(unint64_t)a11 tLutSSize:(unint64_t)a12 sLutISize:(unint64_t)a13 sLutSSize:(unint64_t)a14 IsDoVi84:(BOOL)a15 HlgOOTFCombined:(BOOL)a16
{
}

- (void)dovi_setScalingFactorTable:(float *)a3 lutInput:(const float *)a4 tableSize:(unint64_t)a5 config:(id *)a6 hdrCtrl:(id *)a7 tmParam:(const _DoViTMParam *)a8 edrAdaptationParam:(const _EdrAdaptationParam *)a9 ambAdaptationParam:(const _AmbAdaptationParam *)a10 hlgOOTFCombined:(BOOL)a11 hlgOOTFOnly:(BOOL)a12 isDoVi84:(BOOL)a13 tcCtrl:(ToneCurve_Control *)a14
{
  BOOL v15 = 0;
  HIBYTE(a6[1].var52) = 0;
  if (!a13) {
    BOOL v15 = LODWORD(a6[1].var49) == 4;
  }
  unsigned int var2 = a7->var2;
  int v19 = a13 & ~a12 | v15;
  if (var2 == 1 && v19 != 0) {
    HIBYTE(a6[1].var52) = 1;
  }
  if (!LOBYTE(a6[1].var53))
  {
    if (a13) {
      goto LABEL_16;
    }
LABEL_18:
    dm40 = self->_dm40;
    float v30 = a3;
    float v31 = a4;
    unint64_t v32 = a5;
    double v33 = a6;
    double v34 = a8;
    float v35 = a9;
    float v36 = dm40;
LABEL_19:
    dovi_setScalingFactorTableS_C((uint64_t)v30, (uint64_t)v31, v32, (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, (uint64_t)a10, v36);
    return;
  }
  HIBYTE(a6[1].var52) = 0;
  if (!a13) {
    goto LABEL_18;
  }
  if (var2 || !a7->var30)
  {
    float v21 = self->_dm40;
    if (a11)
    {
      float v38 = self->_dm40;
      unsigned __int8 v37 = 0;
      float v22 = a3;
      float v23 = a4;
      unint64_t v24 = a5;
      float v25 = a6;
      float v26 = a8;
      float v27 = a9;
      BOOL v28 = 1;
LABEL_14:
      dovi84_setScalingFactorTableS_L((uint64_t)v22, (uint64_t)v23, v24, &v25->var0, (uint64_t)v26, (uint64_t)v27, (uint64_t)a10, v28, v37, v38);
      return;
    }
    float v30 = a3;
    float v31 = a4;
    unint64_t v32 = a5;
    double v33 = a6;
    double v34 = a8;
    float v35 = a9;
    float v36 = v21;
    goto LABEL_19;
  }
LABEL_16:
  if (a12)
  {
    float v38 = self->_dm40;
    unsigned __int8 v37 = 1;
    float v22 = a3;
    float v23 = a4;
    unint64_t v24 = a5;
    float v25 = a6;
    float v26 = a8;
    float v27 = a9;
    BOOL v28 = a11;
    goto LABEL_14;
  }
  dovi84_setScalingFactorTableS_C((uint64_t)a3, (uint64_t)a4, a5, (HDRConfig *)a6, (uint64_t)a8, (uint64_t)a9, (uint64_t)a10, a11, self->_dm40, (uint64_t)a14);
}

- (void)dovi_setSat2FactorTable:(float *)a3 tableSize:(unint64_t)a4 config:(id *)a5 llDovi:(BOOL)a6 applyDoVi84SatAdjustment:(BOOL)a7
{
  int v29 = 0;
  if (a4)
  {
    BOOL v7 = a7;
    BOOL v8 = a6;
    double v13 = (double)a4;
    float v14 = (float)a4;
    int v15 = 1;
    unsigned int v16 = 1;
    do
    {
      int v17 = v16 - 1;
      if (LODWORD(a5[1].var49) == 4)
      {
        double v18 = ((double)v17 + (double)v17) / v13;
        float v19 = v18;
        *(float *)&double v18 = v19;
        [(DolbyVisionDM4 *)self->_dm40 toneMapS:v18];
        a3[v15 - 1] = v20;
        *(float *)&double v21 = v19;
        [(DolbyVisionDM4 *)self->_dm40 satMapS:v21];
      }
      else
      {
        if (v8)
        {
          a3[v15 - 1] = 1.0 - (float)((float)(*(float *)&a5->var60 * (float)v17) / v14);
          float v23 = (float)(*(float *)&a5->var60 * (float)v17) / v14;
          if (v7) {
            float v24 = v23 + 1.0;
          }
          else {
            float v24 = 1.0 - v23;
          }
          a3[v15] = v24;
          goto LABEL_16;
        }
        getSat2FactorForI(v16 - 1, a4, &a5->var0, &v29);
        a3[v15 - 1] = v25;
        float v26 = ((double)v17 + (double)v17) / v13;
        if (v29) {
          double v27 = v26 / -6.0 + 1.04;
        }
        else {
          double v27 = 1.0 - (float)(*(float *)&a5->var60 * v26);
        }
        float v22 = v27;
        if (v22 < 0.6) {
          float v22 = 0.6;
        }
      }
      a3[v15] = v22;
LABEL_16:
      unint64_t v28 = v16++;
      v15 += 2;
    }
    while (v28 < a4);
  }
}

- (void)hlg_setupTmParams:(id *)a3 hdrCtrl:(id *)a4 tcCtrl:(ToneCurve_Control *)a5 dm40:(id)a6 applyPostRGBtoRGBMatrixScaler:(BOOL *)a7 pHistBasedToneMapping:(id)a8
{
  id v178 = a6;
  id v14 = a8;
  targetColorPrimaries = a5->targetColorPrimaries;
  BOOL v17 = targetColorPrimaries != (__CFString *)*MEMORY[0x263F03F08]
     && targetColorPrimaries == (__CFString *)*MEMORY[0x263F03F00];
  float targetDisplayContrastRatio = a5->auxData.targetDisplayContrastRatio;
  double targetMaxLinear = a5->targetMaxLinear;
  unsigned int var21 = a4->var21;
  if (var21 >= 0x3E8) {
    unsigned int v21 = 1000;
  }
  else {
    unsigned int v21 = a4->var21;
  }
  if (var21) {
    unsigned int v22 = v21;
  }
  else {
    unsigned int v22 = 1000;
  }
  if (BYTE1(a3[1].var52))
  {
    float v23 = targetMaxLinear;
    float v24 = fminf(*(float *)&a3[1].var2, 4000.0);
  }
  else
  {
    float v23 = fminf(*(float *)&a3[1].var2, 4000.0);
    float v24 = v23;
  }
  double v25 = targetDisplayContrastRatio;
  unsigned int var15 = a4->var15;
  float v27 = 0.0;
  v174 = self;
  if (targetDisplayContrastRatio > 0.0001 && a5->tmData.gradingAmbientEnvironmentType == 1) {
    float v27 = targetMaxLinear * 0.0000249999994;
  }
  double v28 = targetMaxLinear * v25;
  id v177 = v14;
  v175 = (__CFString *)*MEMORY[0x263F03F08];
  v176 = a5->targetColorPrimaries;
  v173 = (__CFString *)*MEMORY[0x263F03F00];
  BOOL v172 = v17;
  float v29 = fmax(targetMaxLinear * v25, 0.0);
  float var12 = (float)v22;
  switch(a5->tmData.hlgTmMode)
  {
    case 1:
      BOOL v31 = 0;
      a5->tmData.Smin_nits = 0.0;
      goto LABEL_31;
    case 2:
      BOOL v31 = 0;
      a5->tmData.Smin_nits = 0.0;
      float var12 = v23;
      goto LABEL_31;
    case 3:
      BOOL v31 = 0;
      a5->tmData.Smin_nits = 0.0;
      float var12 = 1000.0;
      goto LABEL_31;
    case 4:
      BOOL v31 = 0;
      a5->tmData.Smin_nits = 0.0;
      if (v23 < var12) {
        float var12 = v23;
      }
      goto LABEL_31;
    case 5:
      BOOL v31 = 0;
      a5->tmData.Smin_nits = 0.0;
      int v32 = 12;
      goto LABEL_32;
    case 6:
      BOOL v31 = 0;
      a5->tmData.Smin_nits = 0.0;
      float v29 = 0.0;
      float var12 = 1000.0;
      goto LABEL_30;
    case 7:
      BOOL v31 = 0;
      float var12 = (float)a4->var12;
      a5->tmData.Smin_nits = 0.0;
      goto LABEL_30;
    default:
      a5->tmData.Smin_nits = 0.0;
      BOOL v31 = 1;
      float v29 = 0.0;
      float var12 = 10000.0;
LABEL_30:
      float v23 = var12;
LABEL_31:
      int v32 = var15;
LABEL_32:
      a5->tmData.Smax_nits = var12;
      a5->tmData.Tmin_nits = v29;
      a5->tmData.Tmax_nits = v23;
      *a7 = v31;
      a5->tmData.tm_Tmin_nits = 0.0;
      a5->tmData.tm_Tmax_nits = v24;
      a5->tmData.edrAdaptationGaiuint64_t n = 0.9;
      float diffuseInNits = a5->diffuseInNits;
      a5->tmData.edrFactor = 1.0 / a5->maxEDRValue;
      a5->tmData.float diffuseInNits = diffuseInNits;
      float AmbientInNits = a5->AmbientInNits;
      float v35 = 15916.0;
      if ((float)(AmbientInNits + -5.093) <= 15916.0) {
        float v35 = AmbientInNits + -5.093;
      }
      float v36 = 0.0;
      if ((float)(AmbientInNits + -5.093) >= 0.0) {
        float v36 = v35;
      }
      a5->tmData.ambReflected_nits = a5->auxData.targetDisplayReflectionRatio
                                   * (float)(a5->auxData.ambAdaptationRatio * v36);
      a5->tmData.float Cmin_nits = 0.0;
      a5->tmData.float Cmax_nits = var12;
      a5->tmData.Cend_nits = var12;
      a5->tmData.float Capl_nits = 10.0;
      if (AmbientInNits >= 0.0)
      {
        float v39 = powf(AmbientInNits * 0.0001, 0.1593);
        float v38 = powf((float)((float)(v39 * 18.852) + 0.83594) / (float)((float)(v39 * 18.688) + 1.0), 78.844);
      }
      else
      {
        float v37 = powf(AmbientInNits * -0.0001, 0.1593);
        float v38 = 0.0000014619
            - powf((float)((float)(v37 * 18.852) + 0.83594) / (float)((float)(v37 * 18.688) + 1.0), 78.844);
      }
      a5->tmData.ambientPQ = v38;
      float v40 = powf(diffuseInNits / 10000.0, 0.1593);
      float v41 = (v40 * 18.8515625 + 0.8359375) / (v40 * 18.6875 + 1.0);
      float v43 = powf(v41, 78.844);
      float v44 = 1.0;
      if (v43 <= 1.0) {
        float v44 = v43;
      }
      BOOL v45 = v43 < 0.0;
      float v46 = 0.0;
      if (!v45) {
        float v46 = v44;
      }
      a5->tmData.nominalPQ = v46;
      float v47 = v28;
      a5->tmData.disp_Tmin_nits = v47;
      int gradingAmbientEnvironmentType = a5->tmData.gradingAmbientEnvironmentType;
      if (gradingAmbientEnvironmentType == 1)
      {
        Config = GetConfig(v42);
        float v51 = v177;
        if (Config)
        {
          long double v53 = GetConfig((HDRConfig *)Config);
          if (*(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v53, 0x83u, 0) == 1) {
            int v49 = -1;
          }
          else {
            int v49 = 15;
          }
        }
        else
        {
          int v49 = 15;
        }
        int v50 = 12;
      }
      else
      {
        int v49 = 13;
        int v50 = 8;
        float v51 = v177;
      }
      setupHistogramBasedToneMapping((uint64_t)a3, (uint64_t)a5, (uint64_t)&a5->tmData, v51, v50, 0, gradingAmbientEnvironmentType != 1, v49, 5);
      float Cmin_nits = *(float *)&overrideCminNits;
      if (*(float *)&overrideCminNits < 0.0) {
        float Cmin_nits = a5->tmData.Cmin_nits;
      }
      a5->tmData.float Cmin_nits = Cmin_nits;
      float Cmax_nits = *(float *)&overrideCmaxNits;
      if (*(float *)&overrideCmaxNits < 0.0) {
        float Cmax_nits = a5->tmData.Cmax_nits;
      }
      a5->tmData.float Cmax_nits = Cmax_nits;
      float Capl_nits = *(float *)&overrideCmidNits;
      if (*(float *)&overrideCmidNits < 0.0) {
        float Capl_nits = a5->tmData.Capl_nits;
      }
      a5->tmData.float Capl_nits = Capl_nits;
      int v57 = a5->tmData.hdr10TmMode - 7;
      if v57 < 6 && ((0x33u >> v57)) {
        a5->tmData.doviTmMode = dword_2222D3360[v57];
      }
      unsigned int var10 = a4->var10;
      if (a4->var2 == 1)
      {
        if (var10 != 1) {
          goto LABEL_65;
        }
      }
      else if (var10 >= 3)
      {
        goto LABEL_65;
      }
      *a7 = 1;
LABEL_65:
      if (LOBYTE(a3[1].var55.alpha))
      {
        hlg_generateSceneLuxAdaptationDataS((HDRConfig *)a5, (float *)&a5->tmData.hdr10TmMode, (uint64_t)&a5->hlgTmParam.sceneLuxAdaptationParam);
        calculateSceneLuxAdaptationParamS((uint64_t)&a5->hlgTmParam.sceneLuxAdaptationParam, v174->_dmSceneLuxB2D_IPTModel);
        a5->hlgTmParam.sceneLuxAdaptationParam.mixFactor = calcSceneLuxAdaptationMixFactor(a5->diffuseInNits);
        float v59 = a5->tmData.Cmin_nits;
        if (v59 >= 0.0)
        {
          float v62 = powf(v59 * 0.0001, 0.1593);
          float v61 = powf((float)((float)(v62 * 18.852) + 0.83594) / (float)((float)(v62 * 18.688) + 1.0), 78.844);
        }
        else
        {
          float v60 = powf(v59 * -0.0001, 0.1593);
          float v61 = 0.0000014619
              - powf((float)((float)(v60 * 18.852) + 0.83594) / (float)((float)(v60 * 18.688) + 1.0), 78.844);
        }
        float v63 = applySceneLuxAdaptationS_C((uint64_t)&a5->hlgTmParam.sceneLuxAdaptationParam, v61);
        BOOL v64 = v63 < 0.00000073096;
        if (v63 < 0.00000073096) {
          float v63 = -(float)(v63 + -0.0000014619);
        }
        float v65 = flt_2222D1868[v64];
        float v66 = powf(v63, 0.012683);
        float v67 = fmax((float)((float)(v66 + -0.83594) / (float)((float)(v66 * -18.688) + 18.852)), 0.0);
        a5->tmData.float Cmin_nits = v65 * powf(v67, 6.2774);
        float v68 = a5->tmData.Capl_nits;
        if (v68 >= 0.0)
        {
          float v71 = powf(v68 * 0.0001, 0.1593);
          float v70 = powf((float)((float)(v71 * 18.852) + 0.83594) / (float)((float)(v71 * 18.688) + 1.0), 78.844);
        }
        else
        {
          float v69 = powf(v68 * -0.0001, 0.1593);
          float v70 = 0.0000014619
              - powf((float)((float)(v69 * 18.852) + 0.83594) / (float)((float)(v69 * 18.688) + 1.0), 78.844);
        }
        float v72 = applySceneLuxAdaptationS_C((uint64_t)&a5->hlgTmParam.sceneLuxAdaptationParam, v70);
        BOOL v73 = v72 < 0.00000073096;
        if (v72 < 0.00000073096) {
          float v72 = -(float)(v72 + -0.0000014619);
        }
        float v74 = flt_2222D1868[v73];
        float v75 = powf(v72, 0.012683);
        float v76 = fmax((float)((float)(v75 + -0.83594) / (float)((float)(v75 * -18.688) + 18.852)), 0.0);
        a5->tmData.float Capl_nits = v74 * powf(v76, 6.2774);
        float v77 = a5->tmData.Cmax_nits;
        if (v77 >= 0.0)
        {
          float v80 = powf(v77 * 0.0001, 0.1593);
          float v79 = powf((float)((float)(v80 * 18.852) + 0.83594) / (float)((float)(v80 * 18.688) + 1.0), 78.844);
        }
        else
        {
          float v78 = powf(v77 * -0.0001, 0.1593);
          float v79 = 0.0000014619
              - powf((float)((float)(v78 * 18.852) + 0.83594) / (float)((float)(v78 * 18.688) + 1.0), 78.844);
        }
        float v81 = applySceneLuxAdaptationS_C((uint64_t)&a5->hlgTmParam.sceneLuxAdaptationParam, v79);
        BOOL v82 = v81 < 0.00000073096;
        if (v81 < 0.00000073096) {
          float v81 = -(float)(v81 + -0.0000014619);
        }
        float v83 = flt_2222D1868[v82];
        float v84 = powf(v81, 0.012683);
        float v85 = fmax((float)((float)(v84 + -0.83594) / (float)((float)(v84 * -18.688) + 18.852)), 0.0);
        a5->tmData.float Cmax_nits = v83 * powf(v85, 6.2774);
        int v86 = overrideEdrAdaptationMode;
        if (overrideEdrAdaptationMode >= 0x14) {
          int v86 = 18;
        }
        a5->tmData.edrAdaptationMode = v86;
      }
      else
      {
        a5->hlgTmParam.sceneLuxAdaptationParam.sceneLuxAdaptationMode = 0;
      }
      a5->tmData.enableRangeAdjustment = a5->tmData.gradingAmbientEnvironmentType != 1;
      hlg_calculateTonemapCurveParamS((uint64_t)&a5->tmData, (uint64_t)a3, v178, (uint64_t)&a5->hlgTmParam);
      hlg_generateEdrAdaptationDataS((uint64_t)&a5->tmData, (uint64_t)&a5->hlgTmParam, (uint64_t)a3, v178, (uint64_t)&a5->edrAdaptationData);
      calculateEdrAdaptationParamS((float *)&a5->edrAdaptationData.mode, (uint64_t)&a5->edrAdaptationParam);
      hlg_generateAmbAdaptationDataS((uint64_t)&a5->tmData, (uint64_t)&a5->hlgTmParam, (uint64_t)&a5->edrAdaptationData, (uint64_t)&a5->edrAdaptationParam, (uint64_t)a3, (uint64_t)&a5->ambAdaptationData, v27);
      calculateAmbAdaptationParamS((float *)&a5->ambAdaptationData.mode, (uint64_t)&a5->ambAdaptationParam);
      p_var16 = (long long *)&a3[1].var16;
      a5->auxData.tm_Send_nits = a5->hlgTmParam.artisticOOTFParam.tm_Send_nits;
      a3[1].var3 = a5->hlgTmParam.systemGamma + -1.0;
      if (!BYTE1(a3[1].var52)) {
        a3[1].unsigned int var2 = LODWORD(a5->tmData.Tmax_nits);
      }
      uint64_t v88 = 0;
      long long v90 = *p_var16;
      long long v89 = *(_OWORD *)&a3[1].var20;
      long long v91 = *(_OWORD *)&a3[1].var24;
      do
      {
        v92 = (int *)&RGBtoRGBIdentity_coeff + v88;
        int v93 = *v92;
        long long v222 = v90;
        *(_DWORD *)((unint64_t)&v222 & 0xFFFFFFFFFFFFFFF3 | (4 * (v88 & 3))) = v93;
        long long v90 = v222;
        a3[1].var18 = *((float *)&v222 + 2);
        *(void *)p_var16 = v90;
        int v94 = v92[3];
        long long v224 = v89;
        *(_DWORD *)((unint64_t)&v224 & 0xFFFFFFFFFFFFFFF3 | (4 * (v88 & 3))) = v94;
        long long v89 = v224;
        a3[1].var22 = *((float *)&v224 + 2);
        *(void *)&a3[1].var20 = v89;
        int v95 = v92[6];
        long long v223 = v91;
        *(_DWORD *)((unint64_t)&v223 & 0xFFFFFFFFFFFFFFF3 | (4 * (v88 & 3))) = v95;
        long long v91 = v223;
        a3[1].var26 = DWORD2(v223);
        *(void *)&a3[1].var24 = v91;
        ++v88;
      }
      while (v88 != 3);
      switch(var15)
      {
        case 1u:
          if (v32 == 12)
          {
            for (uint64_t i = 0; i != 3; ++i)
            {
              v117 = (int *)((char *)&RGB709toRGBP3_coeff + 4 * i);
              int v118 = *v117;
              long long v204 = v90;
              *(_DWORD *)((unint64_t)&v204 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3))) = v118;
              long long v90 = v204;
              a3[1].var18 = *((float *)&v204 + 2);
              *(void *)p_var16 = v90;
              int v119 = v117[3];
              long long v206 = v89;
              *(_DWORD *)((unint64_t)&v206 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3))) = v119;
              long long v89 = v206;
              a3[1].var22 = *((float *)&v206 + 2);
              *(void *)&a3[1].var20 = v89;
              int v120 = v117[6];
              long long v205 = v91;
              *(_DWORD *)((unint64_t)&v205 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3))) = v120;
              long long v91 = v205;
              a3[1].var26 = DWORD2(v205);
              *(void *)&a3[1].var24 = v91;
            }
          }
          else if (v32 == 9)
          {
            for (uint64_t j = 0; j != 3; ++j)
            {
              v102 = (int *)((char *)&RGB709toRGB2020_coeff + 4 * j);
              int v103 = *v102;
              long long v207 = v90;
              *(_DWORD *)((unint64_t)&v207 & 0xFFFFFFFFFFFFFFF3 | (4 * (j & 3))) = v103;
              long long v90 = v207;
              a3[1].var18 = *((float *)&v207 + 2);
              *(void *)p_var16 = v90;
              int v104 = v102[3];
              long long v209 = v89;
              *(_DWORD *)((unint64_t)&v209 & 0xFFFFFFFFFFFFFFF3 | (4 * (j & 3))) = v104;
              long long v89 = v209;
              a3[1].var22 = *((float *)&v209 + 2);
              *(void *)&a3[1].var20 = v89;
              int v105 = v102[6];
              long long v208 = v91;
              *(_DWORD *)((unint64_t)&v208 & 0xFFFFFFFFFFFFFFF3 | (4 * (j & 3))) = v105;
              long long v91 = v208;
              a3[1].var26 = DWORD2(v208);
              *(void *)&a3[1].var24 = v91;
            }
          }
          break;
        case 9u:
          if (v32 == 1)
          {
            for (uint64_t k = 0; k != 3; ++k)
            {
              v122 = (int *)((char *)&RGB2020toRGB709_coeff + 4 * k);
              int v123 = *v122;
              long long v216 = v90;
              *(_DWORD *)((unint64_t)&v216 & 0xFFFFFFFFFFFFFFF3 | (4 * (k & 3))) = v123;
              long long v90 = v216;
              a3[1].var18 = *((float *)&v216 + 2);
              *(void *)p_var16 = v90;
              int v124 = v122[3];
              long long v218 = v89;
              *(_DWORD *)((unint64_t)&v218 & 0xFFFFFFFFFFFFFFF3 | (4 * (k & 3))) = v124;
              long long v89 = v218;
              a3[1].var22 = *((float *)&v218 + 2);
              *(void *)&a3[1].var20 = v89;
              int v125 = v122[6];
              long long v217 = v91;
              *(_DWORD *)((unint64_t)&v217 & 0xFFFFFFFFFFFFFFF3 | (4 * (k & 3))) = v125;
              long long v91 = v217;
              a3[1].var26 = DWORD2(v217);
              *(void *)&a3[1].var24 = v91;
            }
          }
          else if (v32 == 12)
          {
            for (uint64_t m = 0; m != 3; ++m)
            {
              v107 = (int *)((char *)&RGB2020toRGBP3_coeff + 4 * m);
              int v108 = *v107;
              long long v219 = v90;
              *(_DWORD *)((unint64_t)&v219 & 0xFFFFFFFFFFFFFFF3 | (4 * (m & 3))) = v108;
              long long v90 = v219;
              a3[1].var18 = *((float *)&v219 + 2);
              *(void *)p_var16 = v90;
              int v109 = v107[3];
              long long v221 = v89;
              *(_DWORD *)((unint64_t)&v221 & 0xFFFFFFFFFFFFFFF3 | (4 * (m & 3))) = v109;
              long long v89 = v221;
              a3[1].var22 = *((float *)&v221 + 2);
              *(void *)&a3[1].var20 = v89;
              int v110 = v107[6];
              long long v220 = v91;
              *(_DWORD *)((unint64_t)&v220 & 0xFFFFFFFFFFFFFFF3 | (4 * (m & 3))) = v110;
              long long v91 = v220;
              a3[1].var26 = DWORD2(v220);
              *(void *)&a3[1].var24 = v91;
            }
          }
          break;
        case 0xCu:
          if (v32 == 1)
          {
            for (uint64_t n = 0; n != 3; ++n)
            {
              v112 = (int *)((char *)&RGBP3toRGB709_coeff + 4 * n);
              int v113 = *v112;
              long long v210 = v90;
              *(_DWORD *)((unint64_t)&v210 & 0xFFFFFFFFFFFFFFF3 | (4 * (n & 3))) = v113;
              long long v90 = v210;
              a3[1].var18 = *((float *)&v210 + 2);
              *(void *)p_var16 = v90;
              int v114 = v112[3];
              long long v212 = v89;
              *(_DWORD *)((unint64_t)&v212 & 0xFFFFFFFFFFFFFFF3 | (4 * (n & 3))) = v114;
              long long v89 = v212;
              a3[1].var22 = *((float *)&v212 + 2);
              *(void *)&a3[1].var20 = v89;
              int v115 = v112[6];
              long long v211 = v91;
              *(_DWORD *)((unint64_t)&v211 & 0xFFFFFFFFFFFFFFF3 | (4 * (n & 3))) = v115;
              long long v91 = v211;
              a3[1].var26 = DWORD2(v211);
              *(void *)&a3[1].var24 = v91;
            }
          }
          else if (v32 == 9)
          {
            for (uint64_t ii = 0; ii != 3; ++ii)
            {
              v97 = (int *)((char *)&RGBP3toRGB2020_coeff + 4 * ii);
              int v98 = *v97;
              long long v213 = v90;
              *(_DWORD *)((unint64_t)&v213 & 0xFFFFFFFFFFFFFFF3 | (4 * (ii & 3))) = v98;
              long long v90 = v213;
              a3[1].var18 = *((float *)&v213 + 2);
              *(void *)p_var16 = v90;
              int v99 = v97[3];
              long long v215 = v89;
              *(_DWORD *)((unint64_t)&v215 & 0xFFFFFFFFFFFFFFF3 | (4 * (ii & 3))) = v99;
              long long v89 = v215;
              a3[1].var22 = *((float *)&v215 + 2);
              *(void *)&a3[1].var20 = v89;
              int v100 = v97[6];
              long long v214 = v91;
              *(_DWORD *)((unint64_t)&v214 & 0xFFFFFFFFFFFFFFF3 | (4 * (ii & 3))) = v100;
              long long v91 = v214;
              a3[1].var26 = DWORD2(v214);
              *(void *)&a3[1].var24 = v91;
            }
          }
          break;
      }
      int v126 = 0;
      long long v127 = *(_OWORD *)&a3[1].var28;
      do
      {
        long long v203 = v127;
        *(_DWORD *)((unint64_t)&v203 & 0xFFFFFFFFFFFFFFF3 | (4 * (v126 & 3))) = 1051372203;
        long long v127 = v203;
        ++v126;
      }
      while (v126 != 3);
      a3[1].var30 = *((float *)&v203 + 2);
      *(void *)&a3[1].var28 = v127;
      switch(v32)
      {
        case 1:
          for (juint64_t j = 0; jj != 3; ++jj)
          {
            int v129 = RGB709toHLGY_coeff[jj];
            long long v200 = v127;
            *(_DWORD *)((unint64_t)&v200 & 0xFFFFFFFFFFFFFFF3 | (4 * (jj & 3))) = v129;
            long long v127 = v200;
            a3[1].var30 = *((float *)&v200 + 2);
            *(void *)&a3[1].var28 = v127;
          }
          break;
        case 12:
          for (kuint64_t k = 0; kk != 3; ++kk)
          {
            int v133 = RGBP3toHLGY_coeff[kk];
            long long v201 = v127;
            *(_DWORD *)((unint64_t)&v201 & 0xFFFFFFFFFFFFFFF3 | (4 * (kk & 3))) = v133;
            long long v127 = v201;
            a3[1].var30 = *((float *)&v201 + 2);
            *(void *)&a3[1].var28 = v127;
          }
          break;
        case 9:
          for (muint64_t m = 0; mm != 3; ++mm)
          {
            int v131 = RGB2020toHLGY_coeff[mm];
            long long v202 = v127;
            *(_DWORD *)((unint64_t)&v202 & 0xFFFFFFFFFFFFFFF3 | (4 * (mm & 3))) = v131;
            long long v127 = v202;
            a3[1].var30 = *((float *)&v202 + 2);
            *(void *)&a3[1].var28 = v127;
          }
          break;
      }
      uint64_t v134 = 0;
      long long v136 = *(_OWORD *)&a3[1].var32;
      long long v135 = *(_OWORD *)&a3[1].var36;
      long long v137 = *(_OWORD *)&a3[1].var40;
      do
      {
        v138 = (int *)&RGBtoRGBIdentity_coeff + v134;
        int v139 = *v138;
        long long v197 = v136;
        *(_DWORD *)((unint64_t)&v197 & 0xFFFFFFFFFFFFFFF3 | (4 * (v134 & 3))) = v139;
        long long v136 = v197;
        a3[1].var34 = *((float *)&v197 + 2);
        *(void *)&a3[1].var32 = v136;
        int v140 = v138[3];
        long long v199 = v135;
        *(_DWORD *)((unint64_t)&v199 & 0xFFFFFFFFFFFFFFF3 | (4 * (v134 & 3))) = v140;
        long long v135 = v199;
        a3[1].var38 = *((float *)&v199 + 2);
        *(void *)&a3[1].var36 = v135;
        int v141 = v138[6];
        long long v198 = v137;
        *(_DWORD *)((unint64_t)&v198 & 0xFFFFFFFFFFFFFFF3 | (4 * (v134 & 3))) = v141;
        long long v137 = v198;
        a3[1].var42 = *((float *)&v198 + 2);
        *(void *)&a3[1].var40 = v137;
        ++v134;
      }
      while (v134 != 3);
      switch(v32)
      {
        case 1:
          if (v176 == v175 || v176 == v173)
          {
            if (v172)
            {
              for (nuint64_t n = 0; nn != 3; ++nn)
              {
                v153 = (int *)((char *)&RGB709toRGB2020_coeff + 4 * nn);
                int v154 = *v153;
                long long v179 = v136;
                *(_DWORD *)((unint64_t)&v179 & 0xFFFFFFFFFFFFFFF3 | (4 * (nn & 3))) = v154;
                long long v136 = v179;
                a3[1].var34 = *((float *)&v179 + 2);
                *(void *)&a3[1].var32 = v136;
                int v155 = v153[3];
                long long v181 = v135;
                *(_DWORD *)((unint64_t)&v181 & 0xFFFFFFFFFFFFFFF3 | (4 * (nn & 3))) = v155;
                long long v135 = v181;
                a3[1].var38 = *((float *)&v181 + 2);
                *(void *)&a3[1].var36 = v135;
                int v156 = v153[6];
                long long v180 = v137;
                *(_DWORD *)((unint64_t)&v180 & 0xFFFFFFFFFFFFFFF3 | (4 * (nn & 3))) = v156;
                long long v137 = v180;
                a3[1].var42 = *((float *)&v180 + 2);
                *(void *)&a3[1].var40 = v137;
              }
            }
          }
          else
          {
            for (uint64_t i1 = 0; i1 != 3; ++i1)
            {
              v143 = (int *)((char *)&RGB709toRGBP3_coeff + 4 * i1);
              int v144 = *v143;
              long long v182 = v136;
              *(_DWORD *)((unint64_t)&v182 & 0xFFFFFFFFFFFFFFF3 | (4 * (i1 & 3))) = v144;
              long long v136 = v182;
              a3[1].var34 = *((float *)&v182 + 2);
              *(void *)&a3[1].var32 = v136;
              int v145 = v143[3];
              long long v184 = v135;
              *(_DWORD *)((unint64_t)&v184 & 0xFFFFFFFFFFFFFFF3 | (4 * (i1 & 3))) = v145;
              long long v135 = v184;
              a3[1].var38 = *((float *)&v184 + 2);
              *(void *)&a3[1].var36 = v135;
              int v146 = v143[6];
              long long v183 = v137;
              *(_DWORD *)((unint64_t)&v183 & 0xFFFFFFFFFFFFFFF3 | (4 * (i1 & 3))) = v146;
              long long v137 = v183;
              a3[1].var42 = *((float *)&v183 + 2);
              *(void *)&a3[1].var40 = v137;
            }
          }
          break;
        case 9:
          if (v176 == v175)
          {
            for (uint64_t i2 = 0; i2 != 3; ++i2)
            {
              v168 = (int *)((char *)&RGB2020toRGB709_coeff + 4 * i2);
              int v169 = *v168;
              long long v194 = v136;
              *(_DWORD *)((unint64_t)&v194 & 0xFFFFFFFFFFFFFFF3 | (4 * (i2 & 3))) = v169;
              long long v136 = v194;
              a3[1].var34 = *((float *)&v194 + 2);
              *(void *)&a3[1].var32 = v136;
              int v170 = v168[3];
              long long v196 = v135;
              *(_DWORD *)((unint64_t)&v196 & 0xFFFFFFFFFFFFFFF3 | (4 * (i2 & 3))) = v170;
              long long v135 = v196;
              a3[1].var38 = *((float *)&v196 + 2);
              *(void *)&a3[1].var36 = v135;
              int v171 = v168[6];
              long long v195 = v137;
              *(_DWORD *)((unint64_t)&v195 & 0xFFFFFFFFFFFFFFF3 | (4 * (i2 & 3))) = v171;
              long long v137 = v195;
              a3[1].var42 = *((float *)&v195 + 2);
              *(void *)&a3[1].var40 = v137;
            }
          }
          else if (v176 != v173)
          {
            for (uint64_t i3 = 0; i3 != 3; ++i3)
            {
              v158 = (int *)((char *)&RGB2020toRGBP3_coeff + 4 * i3);
              int v159 = *v158;
              long long v191 = v136;
              *(_DWORD *)((unint64_t)&v191 & 0xFFFFFFFFFFFFFFF3 | (4 * (i3 & 3))) = v159;
              long long v136 = v191;
              a3[1].var34 = *((float *)&v191 + 2);
              *(void *)&a3[1].var32 = v136;
              int v160 = v158[3];
              long long v193 = v135;
              *(_DWORD *)((unint64_t)&v193 & 0xFFFFFFFFFFFFFFF3 | (4 * (i3 & 3))) = v160;
              long long v135 = v193;
              a3[1].var38 = *((float *)&v193 + 2);
              *(void *)&a3[1].var36 = v135;
              int v161 = v158[6];
              long long v192 = v137;
              *(_DWORD *)((unint64_t)&v192 & 0xFFFFFFFFFFFFFFF3 | (4 * (i3 & 3))) = v161;
              long long v137 = v192;
              a3[1].var42 = *((float *)&v192 + 2);
              *(void *)&a3[1].var40 = v137;
            }
          }
          break;
        case 12:
          if (v176 == v175)
          {
            for (uint64_t i4 = 0; i4 != 3; ++i4)
            {
              v163 = (int *)((char *)&RGBP3toRGB709_coeff + 4 * i4);
              int v164 = *v163;
              long long v188 = v136;
              *(_DWORD *)((unint64_t)&v188 & 0xFFFFFFFFFFFFFFF3 | (4 * (i4 & 3))) = v164;
              long long v136 = v188;
              a3[1].var34 = *((float *)&v188 + 2);
              *(void *)&a3[1].var32 = v136;
              int v165 = v163[3];
              long long v190 = v135;
              *(_DWORD *)((unint64_t)&v190 & 0xFFFFFFFFFFFFFFF3 | (4 * (i4 & 3))) = v165;
              long long v135 = v190;
              a3[1].var38 = *((float *)&v190 + 2);
              *(void *)&a3[1].var36 = v135;
              int v166 = v163[6];
              long long v189 = v137;
              *(_DWORD *)((unint64_t)&v189 & 0xFFFFFFFFFFFFFFF3 | (4 * (i4 & 3))) = v166;
              long long v137 = v189;
              a3[1].var42 = *((float *)&v189 + 2);
              *(void *)&a3[1].var40 = v137;
            }
          }
          else if (v176 == v173)
          {
            for (uint64_t i5 = 0; i5 != 3; ++i5)
            {
              v148 = (int *)((char *)&RGBP3toRGB2020_coeff + 4 * i5);
              int v149 = *v148;
              long long v185 = v136;
              *(_DWORD *)((unint64_t)&v185 & 0xFFFFFFFFFFFFFFF3 | (4 * (i5 & 3))) = v149;
              long long v136 = v185;
              a3[1].var34 = *((float *)&v185 + 2);
              *(void *)&a3[1].var32 = v136;
              int v150 = v148[3];
              long long v187 = v135;
              *(_DWORD *)((unint64_t)&v187 & 0xFFFFFFFFFFFFFFF3 | (4 * (i5 & 3))) = v150;
              long long v135 = v187;
              a3[1].var38 = *((float *)&v187 + 2);
              *(void *)&a3[1].var36 = v135;
              int v151 = v148[6];
              long long v186 = v137;
              *(_DWORD *)((unint64_t)&v186 & 0xFFFFFFFFFFFFFFF3 | (4 * (i5 & 3))) = v151;
              long long v137 = v186;
              a3[1].var42 = *((float *)&v186 + 2);
              *(void *)&a3[1].var40 = v137;
            }
          }
          break;
      }

      return;
  }
}

- (void)dovi84_setupTmParams:(id *)a3 hdrCtrl:(id *)a4 tcCtrl:(ToneCurve_Control *)a5 applyPostRGBtoRGBMatrixScaler:(BOOL *)a6 sMinPq:(float)a7 sMaxPq:(float)a8 tMinPq:(float)a9 tMaxPq:(float)a10 nominalPQ:(float)a11 targetingDoviLLOrSDR:(BOOL)a12 dm40:(id)a13
{
  BOOL v13 = a12;
  id v81 = a13;
  unsigned int var10 = a4->var10;
  if (var10 > 7 || ((1 << var10) & 0xB8) == 0)
  {
    if (v13 && LODWORD(a3[1].var49) == 3) {
      a5->tmData.doviTmMode = 3;
    }
    a5->tmData.edrAdaptationMode = 0;
    a5->tmData.ambAdaptationMode = 0;
  }
  *(void *)&a5->tmData.hdr10TmMode = -1;
  float diffuseInNits = a5->diffuseInNits;
  float v24 = 1.0 / a5->maxEDRValue;
  float ambAdaptationRatio = a5->auxData.ambAdaptationRatio;
  a5->tmData.edrAdaptationGaiuint64_t n = a5->auxData.edrAdaptationGain;
  a5->tmData.edrFactor = v24;
  a5->tmData.float diffuseInNits = diffuseInNits;
  float AmbientInNits = a5->AmbientInNits;
  float v26 = 15916.0;
  if ((float)(AmbientInNits + -5.093) <= 15916.0) {
    float v26 = AmbientInNits + -5.093;
  }
  float v27 = 0.0;
  if ((float)(AmbientInNits + -5.093) >= 0.0) {
    float v27 = v26;
  }
  a5->tmData.ambReflected_nits = a5->auxData.targetDisplayReflectionRatio * (float)(ambAdaptationRatio * v27);
  a5->tmData.Smin_nits = 0.0;
  float v28 = -(float)(a8 + -0.0000014619);
  if (a8 >= 0.00000073096) {
    float v28 = a8;
  }
  float v29 = 10000.0;
  if (a8 < 0.00000073096) {
    float v29 = -10000.0;
  }
  float v80 = v29;
  float v30 = powf(v28, 0.012683);
  float v31 = fmax((float)((float)(v30 + -0.83594) / (float)((float)(v30 * -18.688) + 18.852)), 0.0);
  a5->tmData.Smax_nits = v80 * powf(v31, 6.2774);
  float v32 = -(float)(a9 + -0.0000014619);
  BOOL v33 = a9 < 0.00000073096;
  if (a9 >= 0.00000073096) {
    float v32 = a9;
  }
  float v34 = 10000.0;
  if (v33) {
    float v35 = -10000.0;
  }
  else {
    float v35 = 10000.0;
  }
  float v36 = powf(v32, 0.012683);
  float v37 = fmax((float)((float)(v36 + -0.83594) / (float)((float)(v36 * -18.688) + 18.852)), 0.0);
  float v38 = v35 * powf(v37, 6.2774);
  a5->tmData.Tmin_nits = v38;
  a5->tmData.tm_Tmin_nits = v38;
  if (BYTE1(a3[1].var52))
  {
    float targetMaxLinear = a5->targetMaxLinear;
    float v40 = *(float *)&a3[1].var2;
  }
  else
  {
    float v41 = -(float)(a10 + -0.0000014619);
    if (a10 >= 0.00000073096) {
      float v41 = a10;
    }
    float v42 = flt_2222D1868[a10 < 0.00000073096];
    float v43 = powf(v41, 0.012683);
    float v44 = fmax((float)((float)(v43 + -0.83594) / (float)((float)(v43 * -18.688) + 18.852)), 0.0);
    float targetMaxLinear = v42 * powf(v44, 6.2774);
    float v40 = targetMaxLinear;
  }
  a5->tmData.Tmax_nits = targetMaxLinear;
  a5->tmData.tm_Tmax_nits = v40;
  float32x2_t v45 = *(float32x2_t *)&a5->crush;
  int8x8_t v46 = (int8x8_t)vcge_f32(v45, (float32x2_t)vdup_n_s32(0x354436E8u));
  int8x8_t v47 = vbsl_s8(v46, (int8x8_t)v45, (int8x8_t)vneg_f32(vadd_f32(v45, (float32x2_t)vdup_n_s32(0xB5C436E8))));
  float v74 = *(float *)v47.i32;
  float32x2_t v48 = (float32x2_t)vbsl_s8(v46, (int8x8_t)vdup_n_s32(0x461C4000u), (int8x8_t)vdup_n_s32(0xC61C4000));
  float v77 = powf(*(float *)&v47.i32[1], 0.012683);
  v49.f32[0] = powf(v74, 0.012683);
  v49.f32[1] = v77;
  float32x2_t v50 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(vadd_f32(v49, (float32x2_t)vdup_n_s32(0xBF560000)), vmla_f32((float32x2_t)vdup_n_s32(0x4196D000u), (float32x2_t)vdup_n_s32(0xC1958000), v49))), (float64x2_t)0));
  float v75 = v50.f32[0];
  float v78 = powf(v50.f32[1], 6.2774);
  v51.f32[0] = powf(v75, 6.2774);
  v51.f32[1] = v78;
  *(float32x2_t *)&a5->tmData.float Cmin_nits = vmul_f32(v48, v51);
  a5->tmData.Cend_nits = 10000.0;
  float mid = a5->mid;
  if (mid >= 0.00000073096)
  {
    float v53 = 10000.0;
  }
  else
  {
    float mid = -(float)(mid + -0.0000014619);
    float v53 = -10000.0;
  }
  float v54 = powf(mid, 0.012683);
  float v55 = fmax((float)((float)(v54 + -0.83594) / (float)((float)(v54 * -18.688) + 18.852)), 0.0);
  a5->tmData.float Capl_nits = v53 * powf(v55, 6.2774);
  if (AmbientInNits >= 0.0)
  {
    float v59 = powf(AmbientInNits * 0.0001, 0.1593);
    float v58 = powf((float)((float)(v59 * 18.852) + 0.83594) / (float)((float)(v59 * 18.688) + 1.0), 78.844);
  }
  else
  {
    float v56 = powf(AmbientInNits * -0.0001, 0.1593);
    float v58 = 0.0000014619 - powf((float)((float)(v56 * 18.852) + 0.83594) / (float)((float)(v56 * 18.688) + 1.0), 78.844);
  }
  a5->tmData.ambientPQ = v58;
  a5->tmData.nominalPQ = a11;
  if (var10 <= 7
    && ((1 << var10) & 0xB8) != 0
    && a5->tmData.gradingAmbientEnvironmentType == 1
    && a5->tmData.processingType == 4
    && a3[1].var55.alphaPrime >= 0.0
    && (Config = GetConfig(v57)) != 0
    && (float v61 = GetConfig((HDRConfig *)Config), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v61, 0x9Cu, 0)))
  {
    LOBYTE(a3[1].var55.alpha) = 1;
    dovi84_generateSceneLuxAdaptationDataS((uint64_t)a5, (uint64_t)&a5->doviTmParam.sceneLuxAdaptationParam);
    calculateSceneLuxAdaptationParamS((uint64_t)&a5->doviTmParam.sceneLuxAdaptationParam, self->_dmSceneLuxB2D_IPTModel);
    a5->doviTmParam.sceneLuxAdaptationParam.mixFactor = calcSceneLuxAdaptationMixFactor(a5->diffuseInNits);
    float v62 = applySceneLuxAdaptationS_C((uint64_t)&a5->doviTmParam.sceneLuxAdaptationParam, a5->crush);
    if (v62 >= 0.00000073096)
    {
      float v63 = 10000.0;
    }
    else
    {
      float v62 = -(float)(v62 + -0.0000014619);
      float v63 = -10000.0;
    }
    float v64 = powf(v62, 0.012683);
    float v65 = fmax((float)((float)(v64 + -0.83594) / (float)((float)(v64 * -18.688) + 18.852)), 0.0);
    a5->tmData.float Cmin_nits = v63 * powf(v65, 6.2774);
    float v66 = applySceneLuxAdaptationS_C((uint64_t)&a5->doviTmParam.sceneLuxAdaptationParam, a5->mid);
    if (v66 < 0.00000073096)
    {
      float v66 = -(float)(v66 + -0.0000014619);
      float v34 = -10000.0;
    }
    float v67 = powf(v66, 0.012683);
    float v68 = fmax((float)((float)(v67 + -0.83594) / (float)((float)(v67 * -18.688) + 18.852)), 0.0);
    a5->tmData.float Capl_nits = v34 * powf(v68, 6.2774);
    float v69 = applySceneLuxAdaptationS_C((uint64_t)&a5->doviTmParam.sceneLuxAdaptationParam, a5->clip);
    if (v69 >= 0.00000073096)
    {
      float v70 = 10000.0;
    }
    else
    {
      float v69 = -(float)(v69 + -0.0000014619);
      float v70 = -10000.0;
    }
    float v71 = powf(v69, 0.012683);
    float v72 = fmax((float)((float)(v71 + -0.83594) / (float)((float)(v71 * -18.688) + 18.852)), 0.0);
    a5->tmData.float Cmax_nits = v70 * powf(v72, 6.2774);
    int v73 = overrideEdrAdaptationMode;
    if (overrideEdrAdaptationMode >= 0x14) {
      int v73 = 18;
    }
    a5->tmData.edrAdaptationMode = v73;
  }
  else
  {
    a5->doviTmParam.sceneLuxAdaptationParam.sceneLuxAdaptationMode = 0;
  }
  a5->tmData.enableRangeAdjustment = 0;
  dovi_calculateTonemapCurveParamS((uint64_t)&a5->tmData, (uint64_t)a3, (uint64_t)&a5->doviTmParam);
  dovi84_generateEdrAdaptationDataS((uint64_t)&a5->tmData, (uint64_t)&a5->doviTmParam, (uint64_t)a3, (uint64_t)&a5->edrAdaptationData, v81);
  calculateEdrAdaptationParamS((float *)&a5->edrAdaptationData.mode, (uint64_t)&a5->edrAdaptationParam);
  dovi84_generateAmbAdaptationDataS((uint64_t)&a5->tmData, (uint64_t)&a5->doviTmParam, (uint64_t)&a5->edrAdaptationData, (uint64_t)&a5->edrAdaptationParam, (uint64_t)a3, (uint64_t)&a5->ambAdaptationData);
  calculateAmbAdaptationParamS((float *)&a5->ambAdaptationData.mode, (uint64_t)&a5->ambAdaptationParam);
  a5->auxData.tm_Send_nits = a5->doviTmParam.tm_Send_nits;
}

- (DolbyVisionDisplayManagement)initWithTmLutSize:(int)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DolbyVisionDisplayManagement;
  v4 = [(DolbyVisionDisplayManagement *)&v13 init];
  if (!v4) {
    goto LABEL_5;
  }
  v5 = [[DolbyVisionDM4 alloc] init:a3];
  dm40 = v4->_dm40;
  v4->_dm40 = v5;

  if (!v4->_dm40) {
    goto LABEL_6;
  }
  BOOL v7 = objc_alloc_init(HistBasedToneMapping);
  histBasedToneMapping = v4->_histBasedToneMapping;
  v4->_histBasedToneMapping = v7;

  if (!v4->_histBasedToneMapping) {
    goto LABEL_6;
  }
  v9 = [[AdaptiveTM alloc] init:v4->_histBasedToneMapping];
  adaptiveTM = v4->_adaptiveTM;
  v4->_adaptiveTM = v9;

  if (v4->_adaptiveTM) {
LABEL_5:
  }
    v11 = v4;
  else {
LABEL_6:
  }
    v11 = 0;

  return v11;
}

- (DolbyVisionDisplayManagement)initWithDevice:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DolbyVisionDisplayManagement;
  v6 = [(DolbyVisionDisplayManagement *)&v19 init];
  BOOL v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v6->_device, a3);
  [(DolbyVisionDisplayManagement *)v7 setupMetal];
  BOOL v8 = [[DolbyVisionDM4 alloc] init:1024];
  dm40 = v7->_dm40;
  v7->_dm40 = v8;

  v10 = objc_alloc_init(HistBasedToneMapping);
  histBasedToneMapping = v7->_histBasedToneMapping;
  v7->_histBasedToneMapping = v10;

  BOOL v12 = IsGpuOnlySystem();
  if (v12) {
    goto LABEL_6;
  }
  Config = GetConfig((HDRConfig *)v12);
  if (Config
    && (id v14 = GetConfig((HDRConfig *)Config), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v14, 0x18u, 0))
    && (int v15 = [[AdaptiveTM alloc] init:v7->_histBasedToneMapping],
        adaptiveTM = v7->_adaptiveTM,
        v7->_adaptiveTM = v15,
        adaptiveTM,
        !v7->_adaptiveTM))
  {
    BOOL v17 = 0;
  }
  else
  {
LABEL_6:
    BOOL v17 = v7;
  }

  return v17;
}

- (id)initTmEngine:(int)a3 device:(id)a4
{
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DolbyVisionDisplayManagement;
  BOOL v8 = [(DolbyVisionDisplayManagement *)&v18 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v8->_device, a4);
  [(DolbyVisionDisplayManagement *)v9 setupMetal];
  v10 = [[DolbyVisionDM4 alloc] init:a3];
  dm40 = v9->_dm40;
  v9->_dm40 = v10;

  if (!v9->_dm40) {
    goto LABEL_6;
  }
  BOOL v12 = objc_alloc_init(HistBasedToneMapping);
  histBasedToneMapping = v9->_histBasedToneMapping;
  v9->_histBasedToneMapping = v12;

  if (!v9->_histBasedToneMapping) {
    goto LABEL_6;
  }
  id v14 = [[AdaptiveTM alloc] init:v9->_histBasedToneMapping];
  adaptiveTM = v9->_adaptiveTM;
  v9->_adaptiveTM = v14;

  if (v9->_adaptiveTM) {
LABEL_5:
  }
    unsigned int v16 = v9;
  else {
LABEL_6:
  }
    unsigned int v16 = 0;

  return v16;
}

- (DolbyVisionDisplayManagement)initWithModelPointer:(id)a3
{
  objc_storeStrong((id *)&self->_dmSceneLuxB2D_IPTModel, a3);
  return result;
}

- (void)releaseResources
{
  dm40 = self->_dm40;
  self->_dm40 = 0;

  histBasedToneMapping = self->_histBasedToneMapping;
  self->_histBasedToneMapping = 0;

  adaptiveTM = self->_adaptiveTM;
  self->_adaptiveTM = 0;

  dmSceneLuxB2D_IPTModel = self->_dmSceneLuxB2D_IPTModel;
  self->_dmSceneLuxB2D_IPTModel = 0;
}

- (id)getComputePipeLineStateForShader:(id)a3
{
  v3 = [a3 getComputePipeLineStateForDevice:self->_device Library:self->_defaultLibrary];
  return v3;
}

- (void)setupMetal
{
  id v9 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HDRProcessing"];
  v3 = [v9 pathForResource:@"default.metallib" ofType:0];
  device = self->_device;
  if (v3) {
    id v5 = (MTLLibrary *)[(MTLDeviceSPI *)device newLibraryWithFile:v3 error:0];
  }
  else {
    id v5 = (MTLLibrary *)[(MTLDeviceSPI *)device newDefaultLibrary];
  }
  defaultLibrary = self->_defaultLibrary;
  self->_defaultLibrary = v5;

  id v7 = +[DMShader createShaderWithName:@"display_management"];
  displayManagementKernel = self->_displayManagementKernel;
  self->_displayManagementKernel = v7;
}

- (void)setInputDmVersion:(int)a3
{
  self->_inputDmVersiouint64_t n = a3;
}

- (id)getDolbyVisionDM4
{
  return self->_dm40;
}

- (void)encodeToCommandBuffer:(id)a3 Input:(__IOSurface *)a4 Output:(__IOSurface *)a5 MetaData:(id *)a6
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v7 = logInstanceID;
    }
    else {
      uint64_t v7 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = WORD1(v7);
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 5194\n", (uint8_t *)&v8, 0xCu);
    }
    prevLogInstanceID = v7;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 5194\n", (uint8_t *)&v8, 2u);
  }
}

- (void)encodeToCommandBuffer:(id)a3 Input:(__IOSurface *)a4 Output:(__IOSurface *)a5 MetaData:(id *)a6 tcControl:(ToneCurve_Control *)a7 hdrControl:(id *)a8
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v14 = a3;
  int v15 = (MTLBuffer *)[(MTLDeviceSPI *)self->_device newBufferWithLength:512 options:0];
  config = self->_config;
  self->_config = v15;

  [(DolbyVisionDisplayManagement *)self setDisplayManagementConfigFromMetaData:a6 config:[(MTLBuffer *)self->_config contents] hdrCtrl:a8 tcCtrl:a7];
  [(DolbyVisionDisplayManagement *)self setupTexturesWithInput:a4 Output:a5];
  BOOL v17 = [v14 computeCommandEncoder];
  uint64_t v18 = [(MTLTexture *)self->_outputTexture width];
  uint64_t v19 = [(MTLTexture *)self->_outputTexture height];
  float v20 = [(DolbyVisionDisplayManagement *)self getComputePipeLineStateForShader:self->_displayManagementKernel];
  if (v20)
  {
    [v17 setComputePipelineState:v20];
    [v17 setTexture:self->_inputYTexture atIndex:0];
    [v17 setTexture:self->_inputUVTexture atIndex:1];
    [v17 setTexture:self->_outputTexture atIndex:2];
    [v17 setBuffer:self->_config offset:0 atIndex:0];
    v24[0] = (unint64_t)(v18 + 15) >> 4;
    v24[1] = (unint64_t)(v19 + 15) >> 4;
    v24[2] = 1;
    int64x2_t v22 = vdupq_n_s64(0x10uLL);
    uint64_t v23 = 1;
    [v17 dispatchThreadgroups:v24 threadsPerThreadgroup:&v22];
    [v17 endEncoding];
  }
  else if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v21 = logInstanceID;
    }
    else {
      uint64_t v21 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v26 = WORD1(v21);
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 5223\n", buf, 0xCu);
    }
    prevLogInstanceID = v21;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 5223\n", buf, 2u);
  }
}

- (void)setupTexturesWithInput:(__IOSurface *)a3 Output:(__IOSurface *)a4
{
  size_t Width = IOSurfaceGetWidth(a3);
  size_t Height = IOSurfaceGetHeight(a3);
  self->_inputProtectionOptions = IOSurfaceGetProtectionOptions();
  self->_outputProtectionOptions = IOSurfaceGetProtectionOptions();
  id v22 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:23 width:Width height:Height mipmapped:0];
  uint64_t v9 = (MTLTexture *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:");
  inputYTexture = self->_inputYTexture;
  self->_inputYTexture = v9;

  size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(a3, 1uLL);
  BOOL v12 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 63, WidthOfPlane, IOSurfaceGetHeightOfPlane(a3, 1uLL), 0);
  objc_super v13 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v12 iosurface:a3 plane:1];
  inputUVTexture = self->_inputUVTexture;
  self->_inputUVTexture = v13;

  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a4);
  int FourCCforType = getFourCCforType(PixelFormat);
  uint64_t v17 = 115;
  if (FourCCforType == 2021078128) {
    uint64_t v17 = 524;
  }
  if (FourCCforType == 1999843442) {
    uint64_t v18 = 555;
  }
  else {
    uint64_t v18 = v17;
  }
  uint64_t v19 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v18 width:Width height:Height mipmapped:0];
  setTextureDescriptorOptions(v19, self->_outputProtectionOptions);
  float v20 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v19 iosurface:a4 plane:0];
  outputTexture = self->_outputTexture;
  self->_outputTexture = v20;
}

- (void)setConvertConfig:(id *)a3 tcCtrl:(ToneCurve_Control *)a4 hdrCtrl:(id *)a5 auxData:(_AuxData *)a6 tmData:(_TMData *)a7
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  p_var16 = (char *)&a3[1].var16;
  if ((a5->var18 | 2) != 2)
  {
    int v77 = 1065353216;
    long long v75 = RGBtoRGBIdentity_coeff;
    long long v76 = unk_2222D25B4;
    int v74 = 1065353216;
    long long v72 = RGBtoRGBIdentity_coeff;
    long long v73 = unk_2222D25B4;
    goto LABEL_23;
  }
  char BitDepthFromSurfaceFormat = getBitDepthFromSurfaceFormat(a5->var8);
  if (a5->var14)
  {
    LODWORD(v14) = 0;
    char v15 = BitDepthFromSurfaceFormat - 6;
  }
  else
  {
    char v15 = BitDepthFromSurfaceFormat - 6;
    *(float *)&uint64_t v14 = (float)(16 << (BitDepthFromSurfaceFormat - 6));
  }
  *((float *)&v14 + 1) = (float)(128 << v15);
  a3->unsigned int var2 = HIDWORD(v14);
  *(void *)&a3->var0 = v14;
  unsigned int var18 = a5->var18;
  int v77 = 1065353216;
  long long v75 = RGBtoRGBIdentity_coeff;
  long long v76 = unk_2222D25B4;
  int v74 = 1065353216;
  long long v72 = RGBtoRGBIdentity_coeff;
  long long v73 = unk_2222D25B4;
  if (var18 == 2)
  {
    if (a5->var15 == 9) {
      goto LABEL_8;
    }
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v18 = logInstanceID;
      }
      else {
        uint64_t v18 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v71 = WORD1(v18);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"hdrCtrl->colourPrimaries == kIOSurfaceTagColorPrimaries_ITU_R_2020\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 5338\n", buf, 0xCu);
      }
      prevLogInstanceID = v18;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"hdrCtrl->colourPrimaries == kIOSurfaceTagColorPrimaries_ITU_R_2020\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 5338\n", buf, 2u);
    }
    unsigned int var15 = a5->var15;
    if (var15 == 1)
    {
      uint64_t v17 = &LMStoRGB_coeff_709;
      goto LABEL_22;
    }
    if (var15 == 9) {
LABEL_8:
    }
      uint64_t v17 = (long long *)&LMStoRGB_coeff_2020;
    else {
      uint64_t v17 = &LMStoRGB_coeff_P3;
    }
LABEL_22:
    Matrix3x3_multmatrix((uint64_t)&v75, (uint64_t)v17);
  }
LABEL_23:
  RGBtoRGBMatrixForUITargetColorPrimary = getRGBtoRGBMatrixForUITargetColorPrimary((uint64_t)a5, (uint64_t)a4);
  Matrix3x3_multmatrix((uint64_t)&v72, (uint64_t)RGBtoRGBMatrixForUITargetColorPrimary);
  if (a4->targetColorSpace == 2)
  {
    targetColorPrimaries = a4->targetColorPrimaries;
    if (targetColorPrimaries == (__CFString *)*MEMORY[0x263F03F08])
    {
      id v22 = &R709_Rgb2LMS;
    }
    else
    {
      id v22 = &P3_Rgb2LMS;
      if (targetColorPrimaries != (__CFString *)*MEMORY[0x263F03F20]
        && targetColorPrimaries == (__CFString *)*MEMORY[0x263F03F00])
      {
        id v22 = (uint64_t *)&R2020_Rgb2LMS;
      }
    }
    int v74 = 1064682340;
    long long v72 = xmmword_2222D2E84;
    long long v73 = unk_2222D2E94;
    Matrix3x3_multmatrix((uint64_t)&v72, (uint64_t)v22);
    Matrix3x3_multmatrix((uint64_t)&v72, (uint64_t)RGBtoRGBMatrixForUITargetColorPrimary);
  }
  uint64_t v23 = 0;
  long long v25 = *(_OWORD *)p_var16;
  long long v24 = *((_OWORD *)p_var16 + 1);
  long long v26 = *((_OWORD *)p_var16 + 2);
  uint64_t v27 = (int *)((unint64_t)&v75 | 0xC);
  do
  {
    int v28 = *(v27 - 3);
    long long v69 = v25;
    *(_DWORD *)((unint64_t)&v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v23 & 3))) = v28;
    long long v25 = v69;
    int v29 = *v27;
    long long v67 = v24;
    *(_DWORD *)((unint64_t)&v67 & 0xFFFFFFFFFFFFFFF3 | (4 * (v23 & 3))) = v29;
    long long v24 = v67;
    int v30 = v27[3];
    long long v68 = v26;
    *(_DWORD *)((unint64_t)&v68 & 0xFFFFFFFFFFFFFFF3 | (4 * (v23 & 3))) = v30;
    long long v26 = v68;
    ++v23;
    ++v27;
  }
  while (v23 != 3);
  uint64_t v31 = 0;
  *((_DWORD *)p_var16 + 2) = DWORD2(v25);
  *(void *)p_var16 = v25;
  *((_DWORD *)p_var16 + 6) = DWORD2(v24);
  *((void *)p_var16 + 2) = v24;
  *((_DWORD *)p_var16 + 10) = DWORD2(v26);
  *((void *)p_var16 + 4) = v26;
  long long v33 = *((_OWORD *)p_var16 + 4);
  long long v32 = *((_OWORD *)p_var16 + 5);
  float v34 = (int *)((unint64_t)&v72 | 0xC);
  long long v35 = *((_OWORD *)p_var16 + 6);
  do
  {
    int v36 = *(v34 - 3);
    long long v66 = v33;
    *(_DWORD *)((unint64_t)&v66 & 0xFFFFFFFFFFFFFFF3 | (4 * (v31 & 3))) = v36;
    long long v33 = v66;
    int v37 = *v34;
    long long v64 = v32;
    *(_DWORD *)((unint64_t)&v64 & 0xFFFFFFFFFFFFFFF3 | (4 * (v31 & 3))) = v37;
    long long v32 = v64;
    int v38 = v34[3];
    long long v65 = v35;
    *(_DWORD *)((unint64_t)&v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v31 & 3))) = v38;
    long long v35 = v65;
    ++v31;
    ++v34;
  }
  while (v31 != 3);
  *((_DWORD *)p_var16 + 18) = DWORD2(v33);
  *((void *)p_var16 + 8) = v33;
  *((_DWORD *)p_var16 + 22) = DWORD2(v32);
  *((void *)p_var16 + 10) = v32;
  *((_DWORD *)p_var16 + 26) = DWORD2(v35);
  *((void *)p_var16 + 12) = v35;
  if (!a5->var18 && a5->var17 == 18 && a4->targetTransferFunction != 18)
  {
    uint64_t v39 = 0;
    unsigned int v40 = a5->var15;
    float v41 = RGB2020toHLGY_coeff;
    if (v40 == 12) {
      float v41 = RGBP3toHLGY_coeff;
    }
    if (v40 == 1) {
      float v42 = RGB709toHLGY_coeff;
    }
    else {
      float v42 = v41;
    }
    long long v43 = *((_OWORD *)p_var16 + 3);
    do
    {
      int v44 = v42[v39];
      long long v63 = v43;
      *(_DWORD *)((unint64_t)&v63 & 0xFFFFFFFFFFFFFFF3 | (4 * (v39 & 3))) = v44;
      long long v43 = v63;
      *((_DWORD *)p_var16 + 14) = DWORD2(v63);
      *((void *)p_var16 + 6) = v43;
      ++v39;
    }
    while (v39 != 3);
    float var21 = (float)a5->var21;
    *(float *)&a3[1].unsigned int var2 = var21;
    *(void *)&a4->tmData.hdr10TmMode = 0x100000000;
    p_mode = (float *)&a4->ambAdaptationData.mode;
    a4->tmData.edrAdaptationMode = 0;
    a4->tmData.ambAdaptationMode = 0;
    float diffuseInNits = a4->diffuseInNits;
    float v47 = 1.0 / a4->maxEDRValue;
    a4->tmData.edrAdaptationGaiuint64_t n = a6->edrAdaptationGain;
    a4->tmData.edrFactor = v47;
    a4->tmData.float diffuseInNits = diffuseInNits;
    float AmbientInNits = a4->AmbientInNits;
    float v49 = 15916.0;
    if ((float)(AmbientInNits + -5.093) <= 15916.0) {
      float v49 = AmbientInNits + -5.093;
    }
    if ((float)(AmbientInNits + -5.093) < 0.0) {
      float v49 = 0.0;
    }
    a4->tmData.ambReflected_nits = a6->targetDisplayReflectionRatio * (float)(a6->ambAdaptationRatio * v49);
    a4->tmData.Smin_nits = 0.0;
    a4->tmData.Smax_nits = var21;
    *(void *)&a4->tmData.tm_Tmin_nits = 0;
    a4->tmData.Tmax_nits = var21;
    a4->tmData.tm_Tmax_nits = var21;
    float v50 = *(float *)&overrideCminNits;
    if (*(float *)&overrideCminNits < 0.0) {
      float v50 = 0.0;
    }
    float v51 = *(float *)&overrideCmaxNits;
    if (*(float *)&overrideCmaxNits < 0.0) {
      float v51 = var21;
    }
    a4->tmData.float Cmin_nits = v50;
    a4->tmData.float Cmax_nits = v51;
    float v52 = *(float *)&overrideCmidNits;
    if (*(float *)&overrideCmidNits < 0.0) {
      float v52 = 10.0;
    }
    a4->tmData.Cend_nits = var21;
    a4->tmData.float Capl_nits = v52;
    if (AmbientInNits >= 0.0)
    {
      float v55 = powf(AmbientInNits * 0.0001, 0.1593);
      float v54 = powf((float)((float)(v55 * 18.852) + 0.83594) / (float)((float)(v55 * 18.688) + 1.0), 78.844);
    }
    else
    {
      float v53 = powf(AmbientInNits * -0.0001, 0.1593);
      float v54 = 0.0000014619 - powf((float)((float)(v53 * 18.852) + 0.83594) / (float)((float)(v53 * 18.688) + 1.0), 78.844);
    }
    a4->tmData.ambientPQ = v54;
    float v56 = powf(diffuseInNits / 10000.0, 0.1593);
    float v57 = (v56 * 18.8515625 + 0.8359375) / (v56 * 18.6875 + 1.0);
    float v58 = powf(v57, 78.844);
    float v59 = 1.0;
    if (v58 <= 1.0) {
      float v59 = v58;
    }
    BOOL v60 = v58 < 0.0;
    float v61 = 0.0;
    if (!v60) {
      float v61 = v59;
    }
    a4->tmData.nominalPQ = v61;
    a4->tmData.enableRangeAdjustment = a4->tmData.gradingAmbientEnvironmentType != 1;
    hlg_calculateTonemapCurveParamS((uint64_t)&a4->tmData, (uint64_t)a3, self->_dm40, (uint64_t)&a4->hlgTmParam);
    hlg_generateEdrAdaptationDataS((uint64_t)&a4->tmData, (uint64_t)&a4->hlgTmParam, (uint64_t)a3, self->_dm40, (uint64_t)&a4->edrAdaptationData);
    calculateEdrAdaptationParamS((float *)&a4->edrAdaptationData.mode, (uint64_t)&a4->edrAdaptationParam);
    hlg_generateAmbAdaptationDataS((uint64_t)&a4->tmData, (uint64_t)&a4->hlgTmParam, (uint64_t)&a4->edrAdaptationData, (uint64_t)&a4->edrAdaptationParam, (uint64_t)a3, (uint64_t)p_mode, 0.0);
    calculateAmbAdaptationParamS(p_mode, (uint64_t)&a4->ambAdaptationParam);
    a6->tm_Send_nits = a4->hlgTmParam.artisticOOTFParam.tm_Send_nits;
    a3[1].var3 = a4->hlgTmParam.systemGamma + -1.0;
  }
  setupOutputScale((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (BOOL)enableMSRandIOSTuning:(id *)a3
{
  return 1;
}

- (void)setupDoViDmVersion:(id *)a3 tmData:(_TMData *)a4 hdrCtrl:(id *)a5
{
  LODWORD(a3[1].var49) = 3;
  *(_WORD *)&a3[1].var50 = 0;
  if (a4->useDM4TmForDM3DoVi84Bright) {
    goto LABEL_2;
  }
  if (self->_inputDmVersion == 4)
  {
    self = (DolbyVisionDisplayManagement *)GetConfig((HDRConfig *)self);
    if (self)
    {
      Config = GetConfig((HDRConfig *)self);
      self = (DolbyVisionDisplayManagement *)HDRConfig::GetConfigEntryValue((uint64_t)Config, 7u, 0);
      if (a4->processingType == 4)
      {
        if (!LOBYTE(self->super.isa)) {
          goto LABEL_10;
        }
        goto LABEL_2;
      }
      if (LOBYTE(self->super.isa) && a5->var2 == 1) {
LABEL_2:
      }
        LODWORD(a3[1].var49) = 4;
    }
  }
LABEL_10:
  if (a5->var2 == 1 || a5->var29)
  {
    char v9 = BYTE1(a3[1].var52);
    if (v9) {
      char v9 = LODWORD(a3[1].var49) != 4;
    }
    BYTE2(a3[1].var52) = v9;
  }
  else
  {
    BYTE2(a3[1].var52) = 0;
  }
  uint64_t v10 = GetConfig((HDRConfig *)self);
  if (v10)
  {
    v11 = GetConfig((HDRConfig *)v10);
    if (*((_DWORD *)v11 + 1543))
    {
      if ((v11[3084] & 0x80) != 0)
      {
        BOOL v12 = GetConfig((HDRConfig *)v11);
        if (v12)
        {
          objc_super v13 = GetConfig((HDRConfig *)v12);
          BOOL v14 = *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v13, 0x46u, 0) != 0;
        }
        else
        {
          BOOL v14 = 0;
        }
        BYTE2(a3[1].var52) = v14;
      }
    }
  }
}

- (void)setDisplayManagementToneMappingConfigFromMetaData:(id *)a3 config:(id *)a4 tcCtrl:(ToneCurve_Control *)a5 hdrCtrl:(id *)a6 auxData:(_AuxData *)a7 dpcParam:(_DpcParam *)a8
{
  uint64_t v325 = *MEMORY[0x263EF8340];
  p_tmData = &a5->tmData;
  p_edrAdaptationData = &a5->edrAdaptationData;
  p_ambAdaptationData = &a5->ambAdaptationData;
  a5->tmData.useDM4TmForDM3DoVi84Bright = 0;
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    uint64_t v17 = GetConfig((HDRConfig *)Config);
    ConfigEntryValue = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v17, 0x47u, 0);
    if (*(unsigned char *)ConfigEntryValue)
    {
      uint64_t v19 = GetConfig(ConfigEntryValue);
      if (v19)
      {
        float v20 = GetConfig((HDRConfig *)v19);
        if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v20, 7u, 0))
        {
          if (self->_inputDmVersion <= 3
            && a5->tmData.gradingAmbientEnvironmentType == 1
            && a5->tmData.processingType == 4)
          {
            unsigned int var10 = a6->var10;
            if (var10 <= 7 && ((1 << var10) & 0x98) != 0)
            {
              a5->tmData.useDM4TmForDM3DoVi84Bright = 1;
              [(DolbyVisionDM4 *)self->_dm40 initDmAlgVerInCm:4];
            }
          }
        }
      }
    }
  }
  [(DolbyVisionDisplayManagement *)self setupDoViDmVersion:a4 tmData:p_tmData hdrCtrl:a6];
  dovi_setupTmConfig((HDRConfig *)a7->doviTmPreset, LODWORD(a4[1].var49), p_tmData, (uint64_t)p_edrAdaptationData);
  if (!BYTE1(a4[1].var52))
  {
    int processingType = a5->tmData.processingType;
    if (processingType == 4 || processingType == 2) {
      a5->float targetMaxLinear = a5->Tmax_nits;
    }
  }
  v284 = self;
  double v23 = fabs(a5->targetMaxLinear + -1000.0);
  if (a6->var0 == 1)
  {
    unsigned int v24 = a6->var10;
    BOOL v25 = a6->var17 != 16 || a3->var16 - 3085 >= 0xFFFFFFF6;
    int v27 = !v25 && v24 == 2;
    if (v23 >= 4.0) {
      int v27 = 0;
    }
  }
  else
  {
    int v27 = 0;
    unsigned int v24 = a6->var10;
  }
  if (v24 > 8 || (int v282 = 1, ((1 << v24) & 0x142) == 0)) {
    int v282 = v27;
  }
  if (a6->var2 != 1)
  {
    int v267 = 0;
LABEL_48:
    int v273 = 0;
    goto LABEL_49;
  }
  int v28 = a5->tmData.processingType;
  if (v24) {
    BOOL v29 = 0;
  }
  else {
    BOOL v29 = v28 == 4;
  }
  int v30 = v29;
  int v267 = v30;
  if (v28) {
    goto LABEL_48;
  }
  if (v24) {
    BOOL v31 = 0;
  }
  else {
    BOOL v31 = a3->var12 == 2;
  }
  int v32 = v31;
  int v273 = v32;
LABEL_49:
  unsigned int var11 = a3->var11;
  unsigned int v34 = ~(-1 << var11);
  BOOL v278 = (__int16)a3->var21.var2 == -2 && (__int16)a3->var21.var1 == -2;
  p_var28 = (long long *)&a4[1].var28;
  p_doviTmParauint64_t m = &a5->doviTmParam;
  p_edrAdaptationParauint64_t m = &a5->edrAdaptationParam;
  float v36 = 1.0 / (double)(unsigned __int16)~(-1 << var11);
  a4->var28 = v36;
  a4->var29 = v36 * 0.0;
  float v37 = *(float *)&a3->var12;
  a4->var35 = v37;
  float v38 = (float)(unsigned __int16)~(-1 << var11);
  long long v40 = *(_OWORD *)&a4->var4;
  long long v39 = *(_OWORD *)&a4->var8;
  long long v41 = *(_OWORD *)&a4->var12;
  v286 = a3;
  v262 = a8;
  p_mode = (float *)&p_edrAdaptationData->mode;
  v277 = (float *)&p_ambAdaptationData->mode;
  if (v24 == 2 && LODWORD(v37) == 2)
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      long long v43 = (float *)((char *)&R2020_Yuv2RgbNarrow + 4 * i);
      float v44 = *v43 / v38;
      long long v310 = v40;
      *(float *)((unint64_t)&v310 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3))) = v44;
      long long v40 = v310;
      float v45 = v43[3] / v38;
      long long v312 = v39;
      *(float *)((unint64_t)&v312 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3))) = v45;
      long long v39 = v312;
      float v46 = v43[6] / v38;
      long long v311 = v41;
      *(float *)((unint64_t)&v311 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3))) = v46;
      long long v41 = v311;
    }
    float v47 = a6;
    a4->var6 = *((float *)&v40 + 2);
    a4->unsigned int var10 = *((float *)&v39 + 2);
    *(void *)&a4->var4 = v40;
    *(void *)&a4->var8 = v39;
    a4->var14 = *((float *)&v41 + 2);
    *(void *)&a4->unsigned int var12 = v41;
  }
  else
  {
    float v47 = a6;
    uint64_t v48 = 0;
    float v49 = &a3->var4[3];
    do
    {
      float v50 = (float)((float)*(v49 - 3) * 0.00012207) / v38;
      long long v313 = v40;
      *(float *)((unint64_t)&v313 & 0xFFFFFFFFFFFFFFF3 | (4 * (v48 & 3))) = v50;
      long long v40 = v313;
      a4->var6 = *((float *)&v313 + 2);
      *(void *)&a4->var4 = v40;
      float v51 = (float)((float)*v49 * 0.00012207) / v38;
      long long v314 = v39;
      *(float *)((unint64_t)&v314 & 0xFFFFFFFFFFFFFFF3 | (4 * (v48 & 3))) = v51;
      long long v39 = v314;
      a4->unsigned int var10 = *((float *)&v314 + 2);
      *(void *)&a4->var8 = v39;
      float v52 = (float)((float)v49[3] * 0.00012207) / v38;
      long long v315 = v41;
      *(float *)((unint64_t)&v315 & 0xFFFFFFFFFFFFFFF3 | (4 * (v48 & 3))) = v52;
      long long v41 = v315;
      a4->var14 = *((float *)&v315 + 2);
      *(void *)&a4->unsigned int var12 = v41;
      ++v48;
      ++v49;
    }
    while (v48 != 3);
  }
  p_sceneLuxAdaptationParauint64_t m = &a5->doviTmParam.sceneLuxAdaptationParam;
  float32x2_t v53 = vcvt_f32_s32((int32x2_t)vshl_u32((uint32x2_t)0x8000000010, (uint32x2_t)vdup_n_s32(var11 - 8)));
  a4->unsigned int var2 = v53.u32[1];
  *(float32x2_t *)&a4->var0 = v53;
  unsigned int v54 = v34 << (12 - var11);
  BOOL v25 = var11 >= 0xC;
  unsigned int v55 = v34 >> (var11 - 12);
  if (!v25) {
    unsigned int v55 = v54;
  }
  *(float *)&a4[1].var54 = (float)(int)(v55 / (unsigned __int16)v34);
  unsigned int var7 = a3->var7;
  if (var7 == 0xFFFF) {
    int v57 = 0xFFFF;
  }
  else {
    int v57 = 0;
  }
  LODWORD(a4->var30) = v57;
  float v58 = (float)var7 * 0.000061035;
  a4->var31 = v58;
  float32x2_t v293 = vmul_f32(vcvt_f32_u32(*(uint32x2_t *)&a3->var8), (float32x2_t)0x378000003E800000);
  *(float *)&long long v60 = powf(v293.f32[1], v58);
  uint64_t v59 = 0;
  *(float32x2_t *)&a4->var32 = v293;
  a4->var34 = *(float *)&v60 * v293.f32[0];
  *(void *)&long long v60 = *(void *)&a4->var22;
  long long v289 = v60;
  *(void *)&long long v60 = *(void *)&a4->var24;
  long long v294 = v60;
  *(void *)&long long v60 = *(void *)&a4->var26;
  var6 = a3->var6;
  do
  {
    long long v288 = v60;
    __int16 v62 = ATFMTLfloat2half_rtz((float)*var6 * 0.000061035);
    *((void *)&v63 + 1) = *((void *)&v289 + 1);
    uint64_t v307 = v289;
    *(_WORD *)((unint64_t)&v307 & 0xFFFFFFFFFFFFFFF9 | (2 * (v59 & 3))) = v62;
    *(void *)&long long v63 = v307;
    LOWORD(a4->var23) = WORD2(v307);
    long long v289 = v63;
    LODWORD(a4->var22) = v63;
    __int16 v64 = ATFMTLfloat2half_rtz((float)var6[3] * 0.000061035);
    *((void *)&v65 + 1) = *((void *)&v294 + 1);
    uint64_t v308 = v294;
    *(_WORD *)((unint64_t)&v308 & 0xFFFFFFFFFFFFFFF9 | (2 * (v59 & 3))) = v64;
    *(void *)&long long v65 = v308;
    LOWORD(a4->var25) = WORD2(v308);
    long long v294 = v65;
    LODWORD(a4->var24) = v65;
    __int16 v66 = ATFMTLfloat2half_rtz((float)var6[6] * 0.000061035);
    *((void *)&v60 + 1) = *((void *)&v288 + 1);
    uint64_t v309 = v288;
    *(_WORD *)((unint64_t)&v309 & 0xFFFFFFFFFFFFFFF9 | (2 * (v59 & 3))) = v66;
    *(void *)&long long v60 = v309;
    LOWORD(a4->var27) = WORD2(v309);
    a4->var26 = v60;
    ++v59;
    ++var6;
  }
  while (v59 != 3);
  uint64_t v67 = (uint64_t)v47;
  unsigned int v68 = v47->var10;
  float v69 = powf(a5->diffuseInNits / 10000.0, 0.1593);
  float v70 = (v69 * 18.8515625 + 0.8359375) / (v69 * 18.6875 + 1.0);
  float v72 = powf(v70, 78.844);
  float v74 = 1.0;
  if (v72 <= 1.0) {
    float v74 = v72;
  }
  if (v72 >= 0.0) {
    float v75 = v74;
  }
  else {
    float v75 = 0.0;
  }
  if (v68 <= 7 && ((1 << v68) & 0xB8) != 0 || v47->var29)
  {
    uint64_t v76 = (uint64_t)v286;
    if (!a5->tmData.processingType && LODWORD(a4[1].var49) == 4)
    {
      uint64_t v71 = (uint64_t)GetConfig((HDRConfig *)v71);
      if (v71)
      {
        int v77 = GetConfig((HDRConfig *)v71);
        uint64_t v71 = HDRConfig::GetConfigEntryValue((uint64_t)v77, 0x5Au, 0);
        if (*(unsigned char *)v71) {
          *(_WORD *)&a4[1].var50 = 1536;
        }
      }
    }
    p_isa = (id *)&v284->super.isa;
    BOOL v79 = v278;
    if ((*(_WORD *)&a4[1].var50 & 0x200) != 0 && (debugDM4DisableConf & 0x200) == 0)
    {
      a5->tmData.edrAdaptationMode = 0;
      a5->tmData.ambAdaptationMode = 6;
    }
    unsigned int v80 = v47->var10;
    BOOL v272 = (v80 & 0xFFFFFFFE) == 4;
    if (v80 == 5) {
      double EDRFactor = 1.0 / a5->maxEDRValue;
    }
    else {
      double EDRFactor = a5->EDRFactor;
    }
    float v82 = EDRFactor;
    float v270 = v82;
    float AmbientInNits = a5->AmbientInNits;
    uint64_t v71 = (uint64_t)GetConfig((HDRConfig *)v71);
    if (v71
      && (uint64_t v71 = (uint64_t)GetConfig((HDRConfig *)v71), *(_DWORD *)(v71 + 9076))
      && (*(unsigned char *)(v71 + 9072) & 0x80) != 0)
    {
      uint64_t v71 = (uint64_t)GetConfig((HDRConfig *)v71);
      if (v71)
      {
        float v85 = GetConfig((HDRConfig *)v71);
        uint64_t v71 = HDRConfig::GetConfigEntryValue((uint64_t)v85, 0x67u, 0);
        float v86 = *(float *)v71;
      }
      else
      {
        float v86 = 0.0;
      }
      a5->doviTmParam.extraPTTrimPower = v86;
    }
    else if (a7->targetDisplayContrastRatio <= 0.0005)
    {
      a5->doviTmParam.extraPTTrimPower = 0.0;
    }
    else
    {
      a5->doviTmParam.extraPTTrimPower = 0.75;
    }
    goto LABEL_101;
  }
  uint64_t v76 = (uint64_t)v286;
  if (v24 != 6 && v24 != 1)
  {
    if (v282)
    {
      BOOL v272 = 0;
      LODWORD(a4[1].var49) = 3;
      *(void *)&a5->tmData.int doviTmMode = 3;
      a5->tmData.ambAdaptationMode = 0;
      float AmbientInNits = 0.0;
      float v270 = -1.0;
LABEL_310:
      float v269 = v75;
      p_isa = (id *)&v284->super.isa;
      BOOL v79 = v278;
      goto LABEL_102;
    }
    p_isa = (id *)&v284->super.isa;
    BOOL v79 = v278;
    if (v267)
    {
      a5->tmData.int doviTmMode = 0;
      LODWORD(a4[1].var49) = 2;
      __int16 v260 = 237;
    }
    else
    {
      if (!v273 || LODWORD(a4[1].var49) != 4) {
        goto LABEL_320;
      }
      __int16 v260 = 360;
    }
    *(_WORD *)&a4[1].var50 = v260;
LABEL_320:
    BOOL v272 = 0;
    a5->tmData.edrAdaptationMode = 0;
    a5->tmData.ambAdaptationMode = 0;
    float AmbientInNits = 0.0;
    float v269 = 0.0;
    float v270 = -1.0;
    goto LABEL_102;
  }
  a5->tmData.edrAdaptationMode = 0;
  a5->tmData.ambAdaptationMode = 0;
  if (LODWORD(a4[1].var49) != 4)
  {
    float v270 = -1.0;
    float AmbientInNits = 0.0;
    BOOL v272 = 0;
    goto LABEL_310;
  }
  int v83 = a5->tmData.processingType;
  p_isa = (id *)&v284->super.isa;
  BOOL v79 = v278;
  if (v83)
  {
    float v270 = -1.0;
    float AmbientInNits = 0.0;
    if (v83 != 4)
    {
      BOOL v272 = 0;
      goto LABEL_101;
    }
    BOOL v272 = 0;
    __int16 v84 = 123;
  }
  else
  {
    float v270 = -1.0;
    float AmbientInNits = 0.0;
    BOOL v272 = 0;
    __int16 v84 = 122;
  }
  *(_WORD *)&a4[1].var50 = v84;
LABEL_101:
  float v269 = v75;
LABEL_102:
  if ((v68 <= 7 && ((1 << v68) & 0xB8) != 0 || v47->var29)
    && a5->tmData.gradingAmbientEnvironmentType == 1
    && a5->tmData.processingType == 4
    && a4[1].var55.alphaPrime >= 0.0)
  {
    v87 = GetConfig((HDRConfig *)v71);
    if (v87)
    {
      uint64_t v88 = GetConfig((HDRConfig *)v87);
      if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v88, 0x9Cu, 0)) {
        LOBYTE(a4[1].var55.alpha) = 1;
      }
    }
  }
  float32x2_t v89 = vcvt_f32_u32(*(uint32x2_t *)(v76 + 132));
  float32x2_t v90 = (float32x2_t)vdup_n_s32(0x457FF000u);
  unsigned int v91 = v47->var10;
  if (v91 && a5->tmData.doviTmMode <= 3)
  {
    int v92 = *(unsigned __int16 *)(v76 + 162);
    LOWORD(v73) = *(_WORD *)(v76 + 160);
    *(float *)&unsigned int v93 = fmaxf((float)v73, 2081.0);
    int v94 = (int)*(float *)&v93;
    LOWORD(v93) = *(_WORD *)(v76 + 158);
    int v95 = (int)fminf((float)v93, 614.0);
    if (v95 + 700 > v92) {
      int v92 = v95 + 700;
    }
    if (v92 >= v94) {
      LOWORD(v92) = v94 - 1;
    }
    *(_WORD *)(v76 + 160) = v94;
    *(_WORD *)(v76 + 158) = v95;
    *(_WORD *)(v76 + 162) = v92;
  }
  float32x2_t v96 = vdiv_f32(v89, v90);
  unsigned int v274 = v68;
  float32x2_t v295 = v96;
  if (v79)
  {
    float v97 = v96.f32[1];
    if (v96.f32[1] > 0.90257)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v98 = logInstanceID;
        }
        else {
          uint64_t v98 = prevLogInstanceID;
        }
        int v99 = &_os_log_internal;
        id v100 = &_os_log_internal;
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = WORD1(v98);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"sMaxPq <= L2PqNorm(4000)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 5789\n", buf, 0xCu);
        }

        uint64_t v76 = (uint64_t)v286;
        prevLogInstanceID = v98;
      }
      else
      {
        v106 = &_os_log_internal;
        id v107 = &_os_log_internal;
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"sMaxPq <= L2PqNorm(4000)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 5789\n", buf, 2u);
        }

        uint64_t v76 = (uint64_t)v286;
      }
    }
    if (v295.f32[0] < 0.015076)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v108 = logInstanceID;
        }
        else {
          uint64_t v108 = prevLogInstanceID;
        }
        int v109 = &_os_log_internal;
        id v110 = &_os_log_internal;
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = WORD1(v108);
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"sMinPq >= L2PqNorm(0.005)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 5790\n", buf, 0xCu);
        }

        uint64_t v76 = (uint64_t)v286;
        prevLogInstanceID = v108;
      }
      else
      {
        v111 = &_os_log_internal;
        id v112 = &_os_log_internal;
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"sMinPq >= L2PqNorm(0.005)\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 5790\n", buf, 2u);
        }

        uint64_t v76 = (uint64_t)v286;
      }
    }
    *(float32x2_t *)&a5->crush = v295;
    a5->float mid = (float)(v97 + v295.f32[0]) * 0.5;
  }
  else
  {
    v96.i16[0] = *(_WORD *)(v76 + 162);
    float v101 = (float)v96.u32[0];
    v96.i16[0] = *(_WORD *)(v76 + 160);
    v96.f32[0] = (float)v96.u32[0] / 4095.0;
    LODWORD(a5->clip) = v96.i32[0];
    float v102 = v101 / 4095.0;
    a5->float mid = v102;
    LOWORD(v102) = *(_WORD *)(v76 + 158);
    float v103 = (float)LODWORD(v102) / 4095.0;
    a5->crush = v103;
    p_crush = &a5->crush;
    int doviTmMode = a5->tmData.doviTmMode;
    if (doviTmMode == 2) {
      goto LABEL_131;
    }
    if (doviTmMode == 4)
    {
      objc_msgSend(p_isa[11], "applyL3:srcCrushPQ:srcMidPQ:srcClipPQ:", v76, p_crush, &a5->mid);
      goto LABEL_151;
    }
    if (!v91)
    {
LABEL_131:
      if (v295.f32[1] > 0.69629)
      {
        if (v96.f32[0] < 0.69629) {
          v96.f32[0] = 0.69629;
        }
        LODWORD(a5->clip) = v96.i32[0];
      }
      float *p_crush = fminf(v103, 0.015076);
    }
  }
LABEL_151:
  if (a5->tmData.doviTmMode == 4) {
    [p_isa[11] applyL9:v76];
  }
  float v113 = a5->targetMaxLinear * a7->targetDisplayContrastRatio;
  if (v113 <= 0.005) {
    float v114 = a5->targetMaxLinear * a7->targetDisplayContrastRatio;
  }
  else {
    float v114 = 0.005;
  }
  if (LOBYTE(a4[1].var53) && (!*(unsigned char *)(v67 + 181) || *(_DWORD *)(v67 + 8))
    || ![p_isa enableMSRandIOSTuning:v67])
  {
    if (v282)
    {
      double targetMinLinear = a5->targetMinLinear;
      BOOL v120 = targetMinLinear <= 0.00005;
      float v123 = targetMinLinear;
      if (v120) {
        float v114 = 0.001;
      }
      else {
        float v114 = v123;
      }
    }
  }
  else
  {
    float v115 = 0.001;
    if (!v282) {
      float v115 = v114;
    }
    int v116 = a5->tmData.processingType;
    BOOL v117 = v116 == 4;
    if (v116 == 4) {
      int v118 = 0;
    }
    else {
      int v118 = v282;
    }
    if (v117) {
      float v114 = 0.0;
    }
    else {
      float v114 = v115;
    }
    if (v118 == 1)
    {
      double v119 = a5->targetMinLinear;
      BOOL v120 = v119 <= 0.00005;
      float v121 = v119;
      if (v120) {
        float v114 = v115;
      }
      else {
        float v114 = v121;
      }
    }
  }
  float v124 = powf(v114 / 10000.0, 0.1593);
  float v125 = (v124 * 18.8515625 + 0.8359375) / (v124 * 18.6875 + 1.0);
  float v127 = powf(v125, 78.844);
  float v128 = 1.0;
  if (v127 <= 1.0) {
    float v128 = v127;
  }
  BOOL v129 = v127 < 0.0;
  float v130 = 0.0;
  if (v129) {
    float v128 = 0.0;
  }
  float v290 = v128;
  if ((*((unsigned char *)a5 + 152) & 2) == 0) {
    float v130 = v114;
  }
  a5->tmData.disp_Tmin_nits = v130;
  float v321 = 0.0;
  int v131 = GetConfig(v126);
  if (v131 && (v132 = GetConfig((HDRConfig *)v131), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v132, 0x1Du, 0)))
  {
    int v133 = [p_isa getHistBasedToneMapping];
  }
  else
  {
    int v133 = 0;
  }
  adjustPeakWhiteBasedOnContent((uint64_t)a4, (uint64_t)a5, (int *)v67, a5->tmData.processingType, (float *)&a4[1].var2, &v321, &a4[1].var13, &a5->tmData.adjMaxEDRValue, (float)*(unsigned int *)(v67 + 148), &a5->tmData.adjTmax_nits, v133);
  float targetMaxLinear = a5->targetMaxLinear;
  a4->var55.float rangeMax = targetMaxLinear;
  float maxForwardTargetInNits = a5->maxForwardTargetInNits;
  a4->var55.alpha = maxForwardTargetInNits;
  a4->var55.alphaPrime = 0.005;
  int v320 = 3696;
  if (!*(_WORD *)(v76 + 164) || SLODWORD(a4[1].var49) > 3) {
    goto LABEL_194;
  }
  char v136 = v282;
  if (v23 < 4.0) {
    char v136 = 1;
  }
  if ((v136 & 1) != 0 || (unsigned int v137 = *(_DWORD *)(v67 + 40), v137 <= 7) && ((1 << v137) & 0xB8) != 0)
  {
    if (v267)
    {
LABEL_194:
      *(_OWORD *)&a4->var55.ouint64_t n = xmmword_2222D2380;
      char v263 = 1;
      float v138 = 1.0;
      goto LABEL_195;
    }
  }
  else
  {
    char v254 = v267;
    if (!*(unsigned char *)(v67 + 180)) {
      char v254 = 1;
    }
    if (v254) {
      goto LABEL_194;
    }
  }
  memset(buf, 0, sizeof(buf));
  createTrimSet((uint64_t)buf, v76, &v320, v321);
  LOWORD(v256) = *(_WORD *)&buf[6];
  LOWORD(v255) = *(_WORD *)&buf[4];
  LOWORD(v257) = *(_WORD *)&buf[8];
  LOWORD(v258) = *(_WORD *)&buf[12];
  *(float *)&unint64_t v255 = (double)v255 * 0.000244140625 + -0.5 + 1.0;
  *(float *)&int v259 = (double)v256 * 0.000244140625 + -0.5;
  *(_DWORD *)&a4->var55.ouint64_t n = v255;
  a4->var56 = v259;
  *(float *)&unint64_t v256 = (double)v257 * 0.000244140625 + -0.5 + 1.0;
  float v138 = (double)v258 * 0.000244140625 + -0.5 + 1.0;
  *(_DWORD *)&a4->var57 = v256;
  a4->var59 = v138;
  if (v282 && *(_WORD *)(v76 + 306) && *(float *)&v259 > 0.0) {
    a4->var56 = 0;
  }
  char v263 = 0;
LABEL_195:
  if (*(_DWORD *)(v67 + 40) == 5 && a5->tmData.processingType != 4)
  {
    float v139 = v138 * 1.1;
    a4->var59 = v139;
    a4->var52 = dword_2222D2318[a5->HDRProcessingDisplayAdjustsBlackLevel == 0];
  }
  float v266 = v321;
  a5->forwardDM_tMaxPq = v321;
  a5->forwardDM_tMinPq = v290;
  *(void *)&a5->tmData.hdr10TmMode = -1;
  float diffuseInNits = a5->diffuseInNits;
  float v141 = 1.0 / a5->maxEDRValue;
  a5->tmData.edrAdaptationGaiuint64_t n = a7->edrAdaptationGain;
  a5->tmData.edrFactor = v141;
  a5->tmData.float diffuseInNits = diffuseInNits;
  float v142 = a5->AmbientInNits + -5.093;
  float v143 = 15916.0;
  if (v142 <= 15916.0) {
    float v143 = a5->AmbientInNits + -5.093;
  }
  BOOL v129 = v142 < 0.0;
  float v144 = 0.0;
  if (!v129) {
    float v144 = v143;
  }
  a5->tmData.ambReflected_nits = a7->targetDisplayReflectionRatio * (float)(a7->ambAdaptationRatio * v144);
  float v268 = v75;
  if ((!LOBYTE(a4[1].var53) || *(unsigned char *)(v67 + 181) && !*(_DWORD *)(v67 + 8))
    && [(DolbyVisionDisplayManagement *)v284 enableMSRandIOSTuning:v67]
    && a5->tmData.processingType == 4)
  {
    float v145 = 0.0;
    int v264 = 893662952;
    float v146 = v295.f32[1];
  }
  else
  {
    float v147 = -(float)(v295.f32[0] + -0.0000014619);
    if (v295.f32[0] >= 0.00000073096) {
      float v147 = v295.f32[0];
    }
    float v148 = flt_2222D1868[v295.f32[0] < 0.00000073096];
    float v149 = powf(v147, 0.012683);
    float v150 = fmax((float)((float)(v149 + -0.83594) / (float)((float)(v149 * -18.688) + 18.852)), 0.0);
    float v151 = powf(v150, 6.2774);
    float v146 = v295.f32[1];
    float v145 = v148 * v151;
    int v264 = v295.i32[0];
  }
  a5->tmData.Smin_nits = v145;
  float v152 = -(float)(v146 + -0.0000014619);
  float v265 = v146;
  if (v146 >= 0.00000073096) {
    float v152 = v146;
  }
  float v153 = 10000.0;
  if (v146 >= 0.00000073096) {
    float v154 = 10000.0;
  }
  else {
    float v154 = -10000.0;
  }
  float v296 = v154;
  float v155 = powf(v152, 0.012683);
  float v156 = fmax((float)((float)(v155 + -0.83594) / (float)((float)(v155 * -18.688) + 18.852)), 0.0);
  a5->tmData.Smax_nits = v296 * powf(v156, 6.2774);
  float v157 = -(float)(v290 + -0.0000014619);
  if (v290 < 0.00000073096) {
    float v153 = -10000.0;
  }
  else {
    float v157 = v290;
  }
  float v158 = powf(v157, 0.012683);
  float v159 = fmax((float)((float)(v158 + -0.83594) / (float)((float)(v158 * -18.688) + 18.852)), 0.0);
  float v160 = v153 * powf(v159, 6.2774);
  a5->tmData.Tmin_nits = v160;
  a5->tmData.tm_Tmin_nits = v160;
  float v161 = a5->targetMaxLinear;
  a5->tmData.Tmax_nits = v161;
  LODWORD(a5->tmData.tm_Tmax_nits) = a4[1].var2;
  a5->tmData.Cend_nits = 10000.0;
  float v162 = a5->AmbientInNits;
  if (v162 >= 0.0)
  {
    float v172 = powf(v162 * 0.0001, 0.1593);
    *(float *)&double v164 = powf((float)((float)(v172 * 18.852) + 0.83594) / (float)((float)(v172 * 18.688) + 1.0), 78.844);
  }
  else
  {
    float v163 = powf(v162 * -0.0001, 0.1593);
    *(float *)&double v164 = 0.0000014619
                    - powf((float)((float)(v163 * 18.852) + 0.83594) / (float)((float)(v163 * 18.688) + 1.0), 78.844);
  }
  a5->tmData.ambientPQ = *(float *)&v164;
  a5->tmData.nominalPQ = v268;
  if (LOBYTE(a4[1].var55.alpha))
  {
    dovi84_generateSceneLuxAdaptationDataS((uint64_t)a5, (uint64_t)p_sceneLuxAdaptationParam);
    calculateSceneLuxAdaptationParamS((uint64_t)p_sceneLuxAdaptationParam, v284->_dmSceneLuxB2D_IPTModel);
    a5->doviTmParam.sceneLuxAdaptationParam.mixFactor = calcSceneLuxAdaptationMixFactor(a5->diffuseInNits);
    a5->crush = applySceneLuxAdaptationS_C((uint64_t)p_sceneLuxAdaptationParam, a5->crush);
    a5->float mid = applySceneLuxAdaptationS_C((uint64_t)p_sceneLuxAdaptationParam, a5->mid);
    a5->clip = applySceneLuxAdaptationS_C((uint64_t)p_sceneLuxAdaptationParam, a5->clip);
    int v173 = overrideEdrAdaptationMode;
    if (overrideEdrAdaptationMode >= 0x14) {
      int v173 = 18;
    }
    a5->tmData.edrAdaptationMode = v173;
  }
  else
  {
    p_sceneLuxAdaptationParam->sceneLuxAdaptationMode = 0;
  }
  float c1 = 0.0;
  int v319 = 1077936128;
  int v317 = 1065353216;
  uint64_t v316 = 0;
  *(float *)&double v168 = (float)v286->var17;
  *(float *)&double v170 = v270;
  *(float *)&uint64_t v261 = v269;
  LODWORD(v164) = v264;
  *(float *)&double v165 = v265;
  *(float *)&double v166 = v290;
  *(float *)&double v169 = *(float *)&v168;
  *(float *)&double v171 = AmbientInNits;
  *(float *)&double v167 = v266;
  -[DolbyVisionDisplayManagement getToneCurves:tcCtrl:tmData:srcMinPQ:srcMaxPQ:tgtMinPQ:tgtMaxPQ:srcDiagSize:dstDiagSize:EDRFactor:ambient:nominalPQ:useLCDPanel:referenceDisplay:slopeScaled:c1:c2:c3:BrightAdjBySat2:DM_MetaData:](v284, "getToneCurves:tcCtrl:tmData:srcMinPQ:srcMaxPQ:tgtMinPQ:tgtMaxPQ:srcDiagSize:dstDiagSize:EDRFactor:ambient:nominalPQ:useLCDPanel:referenceDisplay:slopeScaled:c1:c2:c3:BrightAdjBySat2:DM_MetaData:", a4, a5, p_tmData, v272, v274 == 7, &v319, v164, v165, v166, v167, v168, v169, v170, v171, v261, &c1,
    &v317,
    (char *)&v316 + 4,
    &v316,
    v286);
  float mid = a5->mid;
  if (mid >= 0.00000073096)
  {
    float v175 = 10000.0;
  }
  else
  {
    float mid = -(float)(mid + -0.0000014619);
    float v175 = -10000.0;
  }
  float v176 = powf(mid, 0.012683);
  float v177 = fmax((float)((float)(v176 + -0.83594) / (float)((float)(v176 * -18.688) + 18.852)), 0.0);
  a5->tmData.float Capl_nits = v175 * powf(v177, 6.2774);
  float32x2_t v178 = *(float32x2_t *)&a5->crush;
  int8x8_t v179 = (int8x8_t)vcge_f32(v178, (float32x2_t)vdup_n_s32(0x354436E8u));
  int8x8_t v180 = vbsl_s8(v179, (int8x8_t)v178, (int8x8_t)vneg_f32(vadd_f32(v178, (float32x2_t)vdup_n_s32(0xB5C436E8))));
  float v280 = *(float *)v180.i32;
  float32x2_t v181 = (float32x2_t)vbsl_s8(v179, (int8x8_t)vdup_n_s32(0x461C4000u), (int8x8_t)vdup_n_s32(0xC61C4000));
  float v291 = powf(*(float *)&v180.i32[1], 0.012683);
  v182.f32[0] = powf(v280, 0.012683);
  v182.f32[1] = v291;
  float32x2_t v183 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(vadd_f32(v182, (float32x2_t)vdup_n_s32(0xBF560000)), vmla_f32((float32x2_t)vdup_n_s32(0x4196D000u), (float32x2_t)vdup_n_s32(0xC1958000), v182))), (float64x2_t)0));
  float v281 = v183.f32[0];
  float v292 = powf(v183.f32[1], 6.2774);
  v184.f32[0] = powf(v281, 6.2774);
  v184.f32[1] = v292;
  *(float32x2_t *)&a5->tmData.float Cmin_nits = vmul_f32(v181, v184);
  a5->tmData.enableRangeAdjustment = 0;
  dovi_calculateTonemapCurveParamS((uint64_t)p_tmData, (uint64_t)a4, (uint64_t)p_doviTmParam);
  char v185 = v263;
  if ((LODWORD(a4[1].var49) & 0xFFFFFFFE) != 2) {
    char v185 = 1;
  }
  if ((v185 & 1) == 0 && a5->tmData.edrAdaptationMode == 11) {
    adjustL2TrimToAvoidOverflow(a5->doviTmParam.tm_Tmax_C, *(float *)&a4->var55.on, *(float *)&a4->var56, *(float *)&a4->var57, (float)v320 * 0.00024414, (HDRConfig *)&a4->var55.on, (float *)&a4->var56, (float *)&a4->var57);
  }
  dm40 = v284->_dm40;
  if (a5->tmData.processingType == 4) {
    dovi84_generateEdrAdaptationDataS((uint64_t)p_tmData, (uint64_t)p_doviTmParam, (uint64_t)a4, (uint64_t)p_mode, dm40);
  }
  else {
    dovi_generateEdrAdaptationDataS((uint64_t)p_tmData, (uint64_t)p_doviTmParam, (uint64_t)a4, (uint64_t)p_mode, dm40);
  }
  calculateEdrAdaptationParamS(p_mode, (uint64_t)p_edrAdaptationParam);
  if (a5->tmData.processingType == 4) {
    dovi84_generateAmbAdaptationDataS((uint64_t)p_tmData, (uint64_t)p_doviTmParam, (uint64_t)p_mode, (uint64_t)p_edrAdaptationParam, (uint64_t)a4, (uint64_t)v277);
  }
  else {
    dovi_generateAmbAdaptationDataS((uint64_t)p_tmData, (uint64_t)p_doviTmParam, (uint64_t)p_mode, (uint64_t)p_edrAdaptationParam, (uint64_t)a4, (uint64_t)v277);
  }
  calculateAmbAdaptationParamS(v277, (uint64_t)&a5->ambAdaptationParam);
  a7->tm_Send_nits = a5->doviTmParam.tm_Send_nits;
  float sl = a5->doviTmParam.sl;
  float c1 = a5->doviTmParam.c1;
  float v188 = c1;
  int v319 = LODWORD(sl);
  float c2 = a5->doviTmParam.c2;
  HIDWORD(v316) = LODWORD(a5->doviTmParam.c3);
  float v190 = *((float *)&v316 + 1);
  int v317 = LODWORD(c2);
  *(float *)&uint64_t v316 = a5->doviTmParam.brightAdjBySat2;
  float v191 = *(float *)&v316;
  a4->var36 = sl;
  a4->var37 = v188;
  a4->var38 = c2;
  a4->var39 = v190;
  a4[1].var1 = v191;
  a4->var53 = a5->maxEDRValue;
  a4->var55.gaiuint64_t n = v266;
  a4[1].var4 = a5->AmbientInNits;
  setupOutputScale((uint64_t)a4, (uint64_t)a5, v67);
  float v192 = 0.0;
  if ((*((unsigned char *)a5 + 152) & 2) == 0)
  {
    float tm_Smax_C = a5->doviTmParam.tm_Smax_C;
    float tm_Smin_C = a5->doviTmParam.tm_Smin_C;
    float tm_Tmax_C = a5->doviTmParam.tm_Tmax_C;
    float tm_Tmin_C = a5->doviTmParam.tm_Tmin_C;
    int v197 = *(_DWORD *)(v67 + 40);
    if ((v197 == 6 || v197 == 1) && LODWORD(a4[1].var49) == 3) {
      float v198 = (float)((float)(tm_Smax_C + tm_Smin_C) - (float)(tm_Tmax_C + tm_Tmin_C))
    }
           * *(float *)&ChromaVectorWeightDM31;
    else {
      float v198 = *(float *)&chromVectorWeight * (float)((float)(tm_Smax_C + tm_Smin_C) - (float)(tm_Tmax_C + tm_Tmin_C));
    }
    float v192 = v198 * 0.5;
  }
  *(float *)&a4->var60 = v192;
  if (a5->tmData.processingType == 4)
  {
    float v199 = 1000.0;
  }
  else
  {
    float v200 = 0.0;
    if (a5->dovi50toHDR10TVMode != 2) {
      goto LABEL_257;
    }
    float v199 = a5->maxForwardTargetInNits;
  }
  long double v201 = (float)(v199 / 1000.0);
  if (v199 <= 400.0 || v199 >= 2000.0)
  {
    long double v203 = log2(v201);
    double v202 = pow(1.11099994, v203) * 1.20000005 + -1.0;
  }
  else
  {
    double v202 = log10(v201) * 0.419999987 + 1.20000005 + -1.0;
  }
  float v200 = v202;
LABEL_257:
  a4[1].var3 = v200;
  a5->doviTmParam.systemGamma = v200 + 1.0;
  long long v204 = (__CFString **)MEMORY[0x263F03F08];
  if (*(_DWORD *)(v67 + 8) || *(unsigned char *)(v67 + 181))
  {
    targetColorPrimaries = a5->targetColorPrimaries;
    if (targetColorPrimaries == (__CFString *)*MEMORY[0x263F03F08])
    {
      long long v206 = &LMStoRGB_coeff_709;
    }
    else
    {
      long long v206 = &LMStoRGB_coeff_P3;
      if (targetColorPrimaries != (__CFString *)*MEMORY[0x263F03F20]
        && targetColorPrimaries == (__CFString *)*MEMORY[0x263F03F00])
      {
        long long v206 = (long long *)&LMStoRGB_coeff_2020;
      }
    }
  }
  else
  {
    long long v206 = &LMStoRGB_coeff_P3;
  }
  long long v207 = v206[1];
  *(_OWORD *)buf = *v206;
  long long v323 = v207;
  float v324 = *((float *)v206 + 8);
  if (v282)
  {
    int v208 = Matrix3x3_isCrossTalk(v286->var6);
    if (v208) {
      Matrix3x3_multmatrixWithScale((uint64_t)buf, (uint64_t)v286->var6, v208);
    }
  }
  float var49 = a4->var49;
  LOWORD(a4->var16) = ATFMTLfloat2half_rtz(var49 * *(float *)buf);
  HIWORD(a4->var16) = ATFMTLfloat2half_rtz(var49 * *(float *)&buf[4]);
  LOWORD(a4->var17) = ATFMTLfloat2half_rtz(var49 * *(float *)&buf[8]);
  LOWORD(a4->var18) = ATFMTLfloat2half_rtz(var49 * *(float *)&buf[12]);
  HIWORD(a4->var18) = ATFMTLfloat2half_rtz(var49 * *(float *)&v323);
  LOWORD(a4->var19) = ATFMTLfloat2half_rtz(var49 * *((float *)&v323 + 1));
  LOWORD(a4->var20) = ATFMTLfloat2half_rtz(var49 * *((float *)&v323 + 2));
  HIWORD(a4->var20) = ATFMTLfloat2half_rtz(var49 * *((float *)&v323 + 3));
  __int16 v210 = ATFMTLfloat2half_rtz(var49 * v324);
  uint64_t v211 = 0;
  LOWORD(a4->var21) = v210;
  int v212 = *(_DWORD *)(v67 + 60);
  long long v213 = RGB2020toHLGY_coeff;
  if (v212 == 12) {
    long long v213 = RGBP3toHLGY_coeff;
  }
  if (v212 == 1) {
    long long v214 = RGB709toHLGY_coeff;
  }
  else {
    long long v214 = v213;
  }
  long long v215 = *p_var28;
  do
  {
    int v216 = v214[v211];
    long long v306 = v215;
    *(_DWORD *)((unint64_t)&v306 & 0xFFFFFFFFFFFFFFF3 | (4 * (v211 & 3))) = v216;
    long long v215 = v306;
    a4[1].var30 = *((float *)&v306 + 2);
    *(void *)p_var28 = v215;
    ++v211;
  }
  while (v211 != 3);
  long long v217 = a5->targetColorPrimaries;
  if (v217 == *v204)
  {
    uint64_t v228 = 0;
    long long v230 = *(_OWORD *)&a4[1].var32;
    long long v229 = *(_OWORD *)&a4[1].var36;
    long long v231 = *(_OWORD *)&a4[1].var40;
    long long v218 = v286;
    long long v219 = v133;
    do
    {
      v232 = (int *)((char *)&RGBP3toRGB709_coeff + 4 * v228);
      int v233 = *v232;
      long long v297 = v230;
      *(_DWORD *)((unint64_t)&v297 & 0xFFFFFFFFFFFFFFF3 | (4 * (v228 & 3))) = v233;
      long long v230 = v297;
      a4[1].var34 = *((float *)&v297 + 2);
      *(void *)&a4[1].var32 = v230;
      int v234 = v232[3];
      long long v299 = v229;
      *(_DWORD *)((unint64_t)&v299 & 0xFFFFFFFFFFFFFFF3 | (4 * (v228 & 3))) = v234;
      long long v229 = v299;
      a4[1].var38 = *((float *)&v299 + 2);
      *(void *)&a4[1].var36 = v229;
      int v235 = v232[6];
      long long v298 = v231;
      *(_DWORD *)((unint64_t)&v298 & 0xFFFFFFFFFFFFFFF3 | (4 * (v228 & 3))) = v235;
      long long v231 = v298;
      a4[1].var42 = *((float *)&v298 + 2);
      *(void *)&a4[1].var40 = v231;
      ++v228;
    }
    while (v228 != 3);
  }
  else
  {
    long long v218 = v286;
    long long v219 = v133;
    if (v217 == (__CFString *)*MEMORY[0x263F03F00])
    {
      uint64_t v236 = 0;
      long long v238 = *(_OWORD *)&a4[1].var32;
      long long v237 = *(_OWORD *)&a4[1].var36;
      long long v239 = *(_OWORD *)&a4[1].var40;
      do
      {
        v240 = (int *)((char *)&RGBP3toRGB2020_coeff + 4 * v236);
        int v241 = *v240;
        long long v300 = v238;
        *(_DWORD *)((unint64_t)&v300 & 0xFFFFFFFFFFFFFFF3 | (4 * (v236 & 3))) = v241;
        long long v238 = v300;
        a4[1].var34 = *((float *)&v300 + 2);
        *(void *)&a4[1].var32 = v238;
        int v242 = v240[3];
        long long v302 = v237;
        *(_DWORD *)((unint64_t)&v302 & 0xFFFFFFFFFFFFFFF3 | (4 * (v236 & 3))) = v242;
        long long v237 = v302;
        a4[1].var38 = *((float *)&v302 + 2);
        *(void *)&a4[1].var36 = v237;
        int v243 = v240[6];
        long long v301 = v239;
        *(_DWORD *)((unint64_t)&v301 & 0xFFFFFFFFFFFFFFF3 | (4 * (v236 & 3))) = v243;
        long long v239 = v301;
        a4[1].var42 = *((float *)&v301 + 2);
        *(void *)&a4[1].var40 = v239;
        ++v236;
      }
      while (v236 != 3);
    }
    else if (*(_DWORD *)(v67 + 60) == 9)
    {
      uint64_t v220 = 0;
      long long v222 = *(_OWORD *)&a4[1].var32;
      long long v221 = *(_OWORD *)&a4[1].var36;
      long long v223 = *(_OWORD *)&a4[1].var40;
      do
      {
        long long v224 = (int *)((char *)&RGB2020toRGBP3_coeff + 4 * v220);
        int v225 = *v224;
        long long v303 = v222;
        *(_DWORD *)((unint64_t)&v303 & 0xFFFFFFFFFFFFFFF3 | (4 * (v220 & 3))) = v225;
        long long v222 = v303;
        a4[1].var34 = *((float *)&v303 + 2);
        *(void *)&a4[1].var32 = v222;
        int v226 = v224[3];
        long long v305 = v221;
        *(_DWORD *)((unint64_t)&v305 & 0xFFFFFFFFFFFFFFF3 | (4 * (v220 & 3))) = v226;
        long long v221 = v305;
        a4[1].var38 = *((float *)&v305 + 2);
        *(void *)&a4[1].var36 = v221;
        int v227 = v224[6];
        long long v304 = v223;
        *(_DWORD *)((unint64_t)&v304 & 0xFFFFFFFFFFFFFFF3 | (4 * (v220 & 3))) = v227;
        long long v223 = v304;
        a4[1].var42 = *((float *)&v304 + 2);
        *(void *)&a4[1].var40 = v223;
        ++v220;
      }
      while (v220 != 3);
    }
    else
    {
      *(_OWORD *)&a4[1].var32 = xmmword_2222D09D0;
      *(_OWORD *)&a4[1].var36 = xmmword_2222D2390;
      *(_OWORD *)&a4[1].var40 = xmmword_2222D23A0;
    }
  }
  unsigned int var12 = v218->var12;
  float v245 = powf((float)*(unsigned int *)(v67 + 148) / 10000.0, 0.1593);
  float v246 = (v245 * 18.8515625 + 0.8359375) / (v245 * 18.6875 + 1.0);
  float v247 = powf(v246, 78.844);
  float v248 = 1.0;
  if (v247 <= 1.0) {
    float v248 = v247;
  }
  BOOL v129 = v247 < 0.0;
  float v249 = 0.0;
  if (!v129) {
    float v249 = v248;
  }
  double v250 = v249 * 876.0;
  if (var12 == 2)
  {
    double v250 = v250 * 4095.0;
    double v251 = 262144.0;
  }
  else
  {
    double v251 = 64.0;
  }
  *(float *)&int v252 = v251 / v250;
  float v253 = 1024.0 / v250;
  *(float *)&a4->var50 = v253;
  a4->var51 = v252;
  a4->var40 = 0.0;
  a5->dpcData.mode = a7->dpcMode;
  a5->dpcData.edrFactor = 1.0 / a5->maxEDRValue;
  a5->dpcData.float rangeMax = 1.0;
  if (a5->targetTransferFunction == 16) {
    a5->dpcData.float rangeMax = a5->tmData.Tmax_nits / 10000.0;
  }
  a5->dpcData.gaiuint64_t n = a7->dpcGain;
  calculateDpcParamS((float *)&a5->dpcData.mode, (uint64_t)v262);
  a5->tmData.int gradingAmbientEnvironmentType = *(_DWORD *)(v67 + 172);
}

- (void)setDisplayManagementConfigFromMetaData:(id *)a3 config:(id *)a4 hdrCtrl:(id *)a5 tcCtrl:(ToneCurve_Control *)a6
{
  p_auxData = &a6->auxData;
  a6->tmData.int processingType = getProcessingType((uint64_t)a5, (uint64_t)a6);
  a6->auxData.isDoViL2TrimAvailable = a3->var22[0].var0 != 0;
  overrideDefaults((HDRConfig *)a4, (uint64_t)a5, (uint64_t)a6, 1);
  if (a6->tmData.processingType == 5)
  {
    [(DolbyVisionDisplayManagement *)self setConvertConfig:a4 tcCtrl:a6 hdrCtrl:a5 auxData:p_auxData tmData:&a6->tmData];
  }
  else
  {
    [(DolbyVisionDisplayManagement *)self setDisplayManagementToneMappingConfigFromMetaData:a3 config:a4 tcCtrl:a6 hdrCtrl:a5 auxData:p_auxData dpcParam:&a4[1].var44];
  }
}

- (void)setDisplayManagementToneMappingConfigFromDictionary:(id *)a3 hdrCtrl:(id *)a4 tcCtrl:(ToneCurve_Control *)a5 infoFrame:(id *)a6
{
  uint64_t v192 = *MEMORY[0x263EF8340];
  p_tmData = &a5->tmData;
  p_edrAdaptationData = &a5->edrAdaptationData;
  int processingType = a5->tmData.processingType;
  if (processingType == 2)
  {
    hlg_setupTmConfig((HDRConfig *)a5->auxData.hlgTmPreset, (uint64_t)&a5->tmData, (uint64_t)p_edrAdaptationData, a5->targetMaxLinear);
  }
  else if (processingType == 1)
  {
    hdr10_setupTmConfig((HDRConfig *)a5->auxData.hdr10TmPreset, &a5->tmData.hdr10TmMode, (uint64_t)p_edrAdaptationData);
  }
  if (!BYTE1(a3[1].var52))
  {
    int v13 = a5->tmData.processingType;
    if (v13 == 4 || v13 == 2) {
      a5->double targetMaxLinear = a5->Tmax_nits;
    }
  }
  p_var16 = (long long *)&a3[1].var16;
  a3->var28 = 0.0002442;
  a3->var54 = a4->var21;
  float v16 = 256.0;
  if (a4->var14) {
    float v16 = 0.0;
  }
  a3->unsigned int var2 = 1157627904;
  *(void *)&a3->var0 = LODWORD(v16) | 0x4500000000000000;
  unsigned int BitDepthFromSurfaceFormat = getBitDepthFromSurfaceFormat(a4->var8);
  signed int v19 = ~(-1 << BitDepthFromSurfaceFormat) >> (BitDepthFromSurfaceFormat - 12);
  if (BitDepthFromSurfaceFormat <= 0xB) {
    signed int v19 = (1 << (12 - BitDepthFromSurfaceFormat) << BitDepthFromSurfaceFormat) - (1 << (12 - BitDepthFromSurfaceFormat));
  }
  *(float *)&a3[1].var54 = (float)v19 / 4095.0;
  if (a4->var17 == 16) {
    LODWORD(a3->var30) = 0xFFFF;
  }
  uint64_t v20 = 0;
  *(void *)&long long v18 = *(void *)&a3->var22;
  long long v155 = v18;
  *(void *)&long long v18 = *(void *)&a3->var24;
  long long v158 = v18;
  var20 = a4->var20;
  *(void *)&long long v18 = *(void *)&a3->var26;
  do
  {
    long long v153 = v18;
    __int16 v22 = ATFMTLfloat2half_rtz(*var20);
    *((void *)&v23 + 1) = *((void *)&v155 + 1);
    uint64_t v185 = v155;
    *(_WORD *)((unint64_t)&v185 & 0xFFFFFFFFFFFFFFF9 | (2 * (v20 & 3))) = v22;
    *(void *)&long long v23 = v185;
    LOWORD(a3->var23) = WORD2(v185);
    long long v155 = v23;
    LODWORD(a3->var22) = v23;
    __int16 v24 = ATFMTLfloat2half_rtz(var20[3]);
    *((void *)&v25 + 1) = *((void *)&v158 + 1);
    uint64_t v186 = v158;
    *(_WORD *)((unint64_t)&v186 & 0xFFFFFFFFFFFFFFF9 | (2 * (v20 & 3))) = v24;
    *(void *)&long long v25 = v186;
    LOWORD(a3->var25) = WORD2(v186);
    long long v158 = v25;
    LODWORD(a3->var24) = v25;
    __int16 v26 = ATFMTLfloat2half_rtz(var20[6]);
    *((void *)&v18 + 1) = *((void *)&v153 + 1);
    uint64_t v187 = v153;
    *(_WORD *)((unint64_t)&v187 & 0xFFFFFFFFFFFFFFF9 | (2 * (v20 & 3))) = v26;
    *(void *)&long long v18 = v187;
    LOWORD(a3->var27) = WORD2(v187);
    a3->var26 = v18;
    ++v20;
    ++var20;
  }
  while (v20 != 3);
  *(_OWORD *)&a3->var55.ouint64_t n = xmmword_2222D2380;
  float var22 = a4->var22;
  float v27 = powf((float)a4->var21 / 10000.0, 0.1593);
  float v28 = (v27 * 18.8515625 + 0.8359375) / (v27 * 18.6875 + 1.0);
  float v29 = powf(v28, 78.844);
  if (v29 <= 1.0) {
    float v30 = v29;
  }
  else {
    float v30 = 1.0;
  }
  BOOL v31 = v29 < 0.0;
  float v32 = 0.0;
  if (!v31) {
    float v32 = v30;
  }
  float v156 = v32;
  float v33 = powf(var22 / 10000.0, 0.1593);
  float v34 = (v33 * 18.8515625 + 0.8359375) / (v33 * 18.6875 + 1.0);
  float v36 = powf(v34, 78.844);
  if (v36 <= 1.0) {
    float v37 = v36;
  }
  else {
    float v37 = 1.0;
  }
  if (v36 >= 0.0) {
    float v38 = v37;
  }
  else {
    float v38 = 0.0;
  }
  unsigned int var10 = a4->var10;
  if ((var10 <= 7 && ((1 << var10) & 0xB8) != 0 || a4->var29)
    && a5->tmData.gradingAmbientEnvironmentType == 1
    && a5->tmData.processingType == 2
    && a3[1].var55.alphaPrime >= 0.0)
  {
    Config = (HDRConfig *)GetConfig(Config);
    if (Config)
    {
      long long v40 = GetConfig(Config);
      Config = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v40, 0x9Cu, 0);
      if (*(unsigned char *)Config) {
        LOBYTE(a3[1].var55.alpha) = 1;
      }
    }
  }
  float v189 = 0.0;
  long long v41 = GetConfig(Config);
  if (v41 && (float v42 = GetConfig((HDRConfig *)v41), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v42, 0x1Du, 0)))
  {
    long long v43 = [(DolbyVisionDisplayManagement *)self getHistBasedToneMapping];
  }
  else
  {
    long long v43 = 0;
  }
  adjustPeakWhiteBasedOnContent((uint64_t)a3, (uint64_t)a5, (int *)a4, a5->tmData.processingType, (float *)&a3[1].var2, &v189, &a3[1].var13, &a5->tmData.adjMaxEDRValue, (float)a4->var21, &a5->tmData.adjTmax_nits, v43);
  float v44 = a5->targetMaxLinear * a5->auxData.targetDisplayContrastRatio;
  if (v44 <= 0.005) {
    float v45 = a5->targetMaxLinear * a5->auxData.targetDisplayContrastRatio;
  }
  else {
    float v45 = 0.005;
  }
  uint64_t v46 = (var10 < 9) & (0x142u >> var10);
  if (v46)
  {
    double targetMinLinear = a5->targetMinLinear;
    BOOL v48 = targetMinLinear <= 0.00005;
    float v49 = targetMinLinear;
    if (v48) {
      float v45 = 0.001;
    }
    else {
      float v45 = v49;
    }
  }
  unsigned int v50 = var10 - 3;
  float v51 = powf(v45 / 10000.0, 0.1593);
  float v52 = (v51 * 18.8515625 + 0.8359375) / (v51 * 18.6875 + 1.0);
  float v152 = powf(v52, 78.844);
  float v53 = 0.0;
  if ((*((unsigned char *)a5 + 152) & 2) == 0) {
    float v53 = v45;
  }
  a5->tmData.disp_Tmin_nits = v53;
  float v54 = powf(a5->diffuseInNits / 10000.0, 0.1593);
  float v55 = (v54 * 18.8515625 + 0.8359375) / (v54 * 18.6875 + 1.0);
  float v57 = powf(v55, 78.844);
  uint64_t v58 = 0;
  long long v60 = *(_OWORD *)&a3->var4;
  long long v59 = *(_OWORD *)&a3->var8;
  var19 = a4->var19;
  long long v62 = *(_OWORD *)&a3->var12;
  do
  {
    float v63 = *var19 / 4095.0;
    long long v182 = v60;
    *(float *)((unint64_t)&v182 & 0xFFFFFFFFFFFFFFF3 | (4 * (v58 & 3))) = v63;
    long long v60 = v182;
    a3->var6 = *((float *)&v182 + 2);
    *(void *)&a3->var4 = v60;
    float v64 = var19[3] / 4095.0;
    long long v183 = v59;
    *(float *)((unint64_t)&v183 & 0xFFFFFFFFFFFFFFF3 | (4 * (v58 & 3))) = v64;
    long long v59 = v183;
    a3->unsigned int var10 = *((float *)&v183 + 2);
    *(void *)&a3->var8 = v59;
    float v65 = var19[6] / 4095.0;
    long long v184 = v62;
    *(float *)((unint64_t)&v184 & 0xFFFFFFFFFFFFFFF3 | (4 * (v58 & 3))) = v65;
    long long v62 = v184;
    a3->var14 = *((float *)&v184 + 2);
    *(void *)&a3->unsigned int var12 = v62;
    ++v58;
    ++var19;
  }
  while (v58 != 3);
  float v66 = 1.0;
  if (v152 <= 1.0) {
    float v67 = v152;
  }
  else {
    float v67 = 1.0;
  }
  if (v57 <= 1.0) {
    float v66 = v57;
  }
  if (v152 >= 0.0) {
    float v68 = v67;
  }
  else {
    float v68 = 0.0;
  }
  if (v57 >= 0.0) {
    float v69 = v66;
  }
  else {
    float v69 = 0.0;
  }
  float v70 = v189;
  a5->forwardDM_tMaxPq = v189;
  a5->forwardDM_tMinPq = v68;
  a5->crush = v38;
  a5->clip = v156;
  float v71 = v156 + v38;
  float v72 = (float)(v156 + v38) * 0.5;
  if (v50 < 3) {
    float v72 = 0.3;
  }
  a5->float mid = v72;
  a3[1].var3 = -10.0;
  char v188 = 0;
  switch(a5->tmData.processingType)
  {
    case 1:
      unsigned int v73 = GetConfig(v56);
      if (v73 && (float v75 = GetConfig((HDRConfig *)v73), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v75, 0x1Du, 0)))
      {
        uint64_t v76 = [(DolbyVisionDisplayManagement *)self getHistBasedToneMapping];
      }
      else
      {
        uint64_t v76 = 0;
      }
      hdr10_setupTmParams((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, self->_dm40, v74, v76);

      goto LABEL_86;
    case 2:
      uint64_t v78 = GetConfig(v56);
      if (v78 && (BOOL v79 = GetConfig((HDRConfig *)v78), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v79, 0x1Du, 0)))
      {
        unsigned int v80 = [(DolbyVisionDisplayManagement *)self getHistBasedToneMapping];
      }
      else
      {
        unsigned int v80 = 0;
      }
      [(DolbyVisionDisplayManagement *)self hlg_setupTmParams:a3 hdrCtrl:a4 tcCtrl:a5 dm40:self->_dm40 applyPostRGBtoRGBMatrixScaler:&v188 pHistBasedToneMapping:v80];

      goto LABEL_86;
    case 3:
      if (a4->var0 == 3)
      {
        unsigned int var21 = a4->var21;
        *(float *)&a3[1].unsigned int var2 = (float)var21;
        long double v82 = (float)((float)var21 / 1000.0);
        if (var21 - 401 > 0x63E)
        {
          long double v110 = log2(v82);
          double v83 = pow(1.11099994, v110) * 1.20000005 + -1.0;
        }
        else
        {
          double v83 = log10(v82) * 0.419999987 + 1.20000005 + -1.0;
        }
        float v111 = v83;
        a3[1].var3 = v111;
        unsigned int var15 = a4->var15;
        if (var15 != 1)
        {
          if (var15 == 12)
          {
            uint64_t v123 = 0;
            long long v124 = *p_var16;
            long long v125 = *(_OWORD *)&a3[1].var20;
            int v126 = &dword_2222D2640;
            long long v127 = *(_OWORD *)&a3[1].var24;
            long long v128 = *(_OWORD *)&a3[1].var28;
            do
            {
              int v129 = RGBP3toHLGY_coeff[v123];
              long long v177 = v128;
              *(_DWORD *)((unint64_t)&v177 & 0xFFFFFFFFFFFFFFF3 | (4 * (v123 & 3))) = v129;
              long long v128 = v177;
              a3[1].var30 = *((float *)&v177 + 2);
              *(void *)&a3[1].var28 = v128;
              int v130 = *(v126 - 3);
              long long v176 = v124;
              *(_DWORD *)((unint64_t)&v176 & 0xFFFFFFFFFFFFFFF3 | (4 * (v123 & 3))) = v130;
              long long v124 = v176;
              a3[1].unsigned int var18 = *((float *)&v176 + 2);
              *(void *)p_var16 = v124;
              int v131 = *v126;
              long long v174 = v125;
              *(_DWORD *)((unint64_t)&v174 & 0xFFFFFFFFFFFFFFF3 | (4 * (v123 & 3))) = v131;
              long long v125 = v174;
              a3[1].float var22 = *((float *)&v174 + 2);
              *(void *)&a3[1].var20 = v125;
              int v132 = v126[3];
              long long v175 = v127;
              *(_DWORD *)((unint64_t)&v175 & 0xFFFFFFFFFFFFFFF3 | (4 * (v123 & 3))) = v132;
              long long v127 = v175;
              a3[1].var26 = DWORD2(v175);
              *(void *)&a3[1].var24 = v127;
              ++v123;
              ++v126;
            }
            while (v123 != 3);
            goto LABEL_135;
          }
          if (var15 == 9)
          {
            uint64_t v113 = 0;
            long long v114 = *p_var16;
            long long v115 = *(_OWORD *)&a3[1].var20;
            int v116 = (int *)&RGBtoRGBIdentity_coeff + 3;
            long long v117 = *(_OWORD *)&a3[1].var24;
            long long v118 = *(_OWORD *)&a3[1].var28;
            do
            {
              int v119 = RGB2020toHLGY_coeff[v113];
              long long v181 = v118;
              *(_DWORD *)((unint64_t)&v181 & 0xFFFFFFFFFFFFFFF3 | (4 * (v113 & 3))) = v119;
              long long v118 = v181;
              a3[1].var30 = *((float *)&v181 + 2);
              *(void *)&a3[1].var28 = v118;
              int v120 = *(v116 - 3);
              long long v180 = v114;
              *(_DWORD *)((unint64_t)&v180 & 0xFFFFFFFFFFFFFFF3 | (4 * (v113 & 3))) = v120;
              long long v114 = v180;
              a3[1].unsigned int var18 = *((float *)&v180 + 2);
              *(void *)p_var16 = v114;
              int v121 = *v116;
              long long v178 = v115;
              *(_DWORD *)((unint64_t)&v178 & 0xFFFFFFFFFFFFFFF3 | (4 * (v113 & 3))) = v121;
              long long v115 = v178;
              a3[1].float var22 = *((float *)&v178 + 2);
              *(void *)&a3[1].var20 = v115;
              int v122 = v116[3];
              long long v179 = v117;
              *(_DWORD *)((unint64_t)&v179 & 0xFFFFFFFFFFFFFFF3 | (4 * (v113 & 3))) = v122;
              long long v117 = v179;
              a3[1].var26 = DWORD2(v179);
              *(void *)&a3[1].var24 = v117;
              ++v113;
              ++v116;
            }
            while (v113 != 3);
LABEL_135:
            uint64_t v144 = 0;
            long long v146 = *(_OWORD *)&a3[1].var32;
            long long v145 = *(_OWORD *)&a3[1].var36;
            long long v147 = *(_OWORD *)&a3[1].var40;
            long long v89 = xmmword_2222D23B0;
            do
            {
              float v148 = (int *)((char *)&R2020_Rgb2YuvNarrow + 4 * v144);
              int v149 = *v148;
              long long v167 = v146;
              *(_DWORD *)((unint64_t)&v167 & 0xFFFFFFFFFFFFFFF3 | (4 * (v144 & 3))) = v149;
              long long v146 = v167;
              a3[1].var34 = *((float *)&v167 + 2);
              *(void *)&a3[1].var32 = v146;
              int v150 = v148[3];
              long long v169 = v145;
              *(_DWORD *)((unint64_t)&v169 & 0xFFFFFFFFFFFFFFF3 | (4 * (v144 & 3))) = v150;
              long long v145 = v169;
              a3[1].var38 = *((float *)&v169 + 2);
              *(void *)&a3[1].var36 = v145;
              int v151 = v148[6];
              long long v168 = v147;
              *(_DWORD *)((unint64_t)&v168 & 0xFFFFFFFFFFFFFFF3 | (4 * (v144 & 3))) = v151;
              long long v147 = v168;
              a3[1].var42 = *((float *)&v168 + 2);
              *(void *)&a3[1].var40 = v147;
              ++v144;
            }
            while (v144 != 3);
            goto LABEL_87;
          }
          if (enableLogInstance)
          {
            if (logInstanceID) {
              uint64_t v133 = logInstanceID;
            }
            else {
              uint64_t v133 = prevLogInstanceID;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v191 = WORD1(v133);
              _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"hdrCtrl->colourPrimaries == kIOSurfaceTagColorPrimaries_ITU_R_709_2\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 6485\n", buf, 0xCu);
            }
            prevLogInstanceID = v133;
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"hdrCtrl->colourPrimaries == kIOSurfaceTagColorPrimaries_ITU_R_709_2\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/DisplayManagement/DolbyVisionDisplayManagement.mm\" at line 6485\n", buf, 2u);
          }
        }
        uint64_t v134 = 0;
        long long v135 = *p_var16;
        long long v136 = *(_OWORD *)&a3[1].var20;
        unsigned int v137 = &dword_2222D25F8;
        long long v138 = *(_OWORD *)&a3[1].var24;
        long long v139 = *(_OWORD *)&a3[1].var28;
        do
        {
          int v140 = RGB709toHLGY_coeff[v134];
          long long v173 = v139;
          *(_DWORD *)((unint64_t)&v173 & 0xFFFFFFFFFFFFFFF3 | (4 * (v134 & 3))) = v140;
          long long v139 = v173;
          a3[1].var30 = *((float *)&v173 + 2);
          *(void *)&a3[1].var28 = v139;
          int v141 = *(v137 - 3);
          long long v172 = v135;
          *(_DWORD *)((unint64_t)&v172 & 0xFFFFFFFFFFFFFFF3 | (4 * (v134 & 3))) = v141;
          long long v135 = v172;
          a3[1].unsigned int var18 = *((float *)&v172 + 2);
          *(void *)p_var16 = v135;
          int v142 = *v137;
          long long v170 = v136;
          *(_DWORD *)((unint64_t)&v170 & 0xFFFFFFFFFFFFFFF3 | (4 * (v134 & 3))) = v142;
          long long v136 = v170;
          a3[1].float var22 = *((float *)&v170 + 2);
          *(void *)&a3[1].var20 = v136;
          int v143 = v137[3];
          long long v171 = v138;
          *(_DWORD *)((unint64_t)&v171 & 0xFFFFFFFFFFFFFFF3 | (4 * (v134 & 3))) = v143;
          long long v138 = v171;
          a3[1].var26 = DWORD2(v171);
          *(void *)&a3[1].var24 = v138;
          ++v134;
          ++v137;
        }
        while (v134 != 3);
        goto LABEL_135;
      }
      a3[1].var3 = 0.0;
LABEL_86:
      long long v89 = xmmword_2222D23B0;
LABEL_87:
      float brightAdjBySat2 = 0.0;
LABEL_88:
      *(_OWORD *)&a3->var36 = v89;
      a3[1].var1 = brightAdjBySat2;
      *(float32x2_t *)&a3->var50 = vcvt_f32_f64(vdivq_f64((float64x2_t)xmmword_2222D23C0, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v156 * 876.0), 0)));
      a3->var53 = a5->maxEDRValue;
      a3->var55.gaiuint64_t n = v70;
      a3[1].var4 = a5->AmbientInNits;
      setupOutputScale((uint64_t)a3, (uint64_t)a5, (uint64_t)a4);
      LODWORD(v91) = 0;
      if ((*((unsigned char *)a5 + 152) & 2) == 0)
      {
        unsigned int v92 = a4->var10;
        if ((v92 == 6 || v92 == 1) && LODWORD(a3[1].var49) == 3) {
          float v93 = (float)(v71 - (float)(v68 + v70)) * *(float *)&ChromaVectorWeightDM31;
        }
        else {
          float v93 = (float)(v71 - (float)(v68 + v70)) * *(float *)&chromVectorWeight;
        }
        *(float *)&long long v91 = v93 * 0.5;
      }
      *(_DWORD *)&a3->var60 = v91;
      targetColorPrimaries = a5->targetColorPrimaries;
      if (targetColorPrimaries == (__CFString *)*MEMORY[0x263F03F08])
      {
        int v95 = &LMStoRGB_coeff_709;
      }
      else
      {
        int v95 = &LMStoRGB_coeff_P3;
        if (targetColorPrimaries != (__CFString *)*MEMORY[0x263F03F20]
          && targetColorPrimaries == (__CFString *)*MEMORY[0x263F03F00])
        {
          int v95 = (long long *)&LMStoRGB_coeff_2020;
        }
      }
      uint64_t v96 = 0;
      float var49 = a3->var49;
      *(void *)&long long v91 = *(void *)&a3->var16;
      long long v157 = v91;
      *(void *)&long long v91 = *(void *)&a3->var18;
      long long v160 = v91;
      *(void *)&long long v91 = *(void *)&a3->var20;
      do
      {
        long long v154 = v91;
        uint64_t v98 = (float *)v95 + v96;
        __int16 v99 = ATFMTLfloat2half_rtz(var49 * *v98);
        *((void *)&v100 + 1) = *((void *)&v157 + 1);
        uint64_t v164 = v157;
        *(_WORD *)((unint64_t)&v164 & 0xFFFFFFFFFFFFFFF9 | (2 * (v96 & 3))) = v99;
        *(void *)&long long v100 = v164;
        LOWORD(a3->var17) = WORD2(v164);
        long long v157 = v100;
        LODWORD(a3->var16) = v100;
        __int16 v101 = ATFMTLfloat2half_rtz(var49 * v98[3]);
        *((void *)&v102 + 1) = *((void *)&v160 + 1);
        uint64_t v165 = v160;
        *(_WORD *)((unint64_t)&v165 & 0xFFFFFFFFFFFFFFF9 | (2 * (v96 & 3))) = v101;
        *(void *)&long long v102 = v165;
        LOWORD(a3->var19) = WORD2(v165);
        long long v160 = v102;
        LODWORD(a3->var18) = v102;
        __int16 v103 = ATFMTLfloat2half_rtz(var49 * v98[6]);
        *((void *)&v91 + 1) = *((void *)&v154 + 1);
        uint64_t v166 = v154;
        *(_WORD *)((unint64_t)&v166 & 0xFFFFFFFFFFFFFFF9 | (2 * (v96 & 3))) = v103;
        *(void *)&long long v91 = v166;
        LOWORD(a3->var21) = WORD2(v166);
        LODWORD(a3->var20) = v91;
        ++v96;
      }
      while (v96 != 3);
      a3->var40 = 0.0;
      if (v188)
      {
        double targetMaxLinear = a5->targetMaxLinear;
        if (a5->atmEnable && a5->targetMaxLinearOutput > a5->diffuseInNits && a4->var0 == 3) {
          double targetMaxLinear = a5->targetMaxLinearOutput;
        }
        int v105 = 0;
        float v106 = targetMaxLinear * var49;
        long long v108 = *(_OWORD *)&a3[1].var32;
        long long v107 = *(_OWORD *)&a3[1].var36;
        long long v109 = *(_OWORD *)&a3[1].var40;
        do
        {
          long long v163 = v108;
          *(float *)((unint64_t)&v163 & 0xFFFFFFFFFFFFFFF3 | (4 * (v105 & 3))) = *(float *)((unint64_t)&v163 & 0xFFFFFFFFFFFFFFF3 | (4 * (v105 & 3)))
                                                                                          * v106;
          long long v108 = v163;
          long long v162 = v107;
          *(float *)((unint64_t)&v162 & 0xFFFFFFFFFFFFFFF3 | (4 * (v105 & 3))) = *(float *)((unint64_t)&v162 & 0xFFFFFFFFFFFFFFF3 | (4 * (v105 & 3)))
                                                                                          * v106;
          long long v107 = v162;
          long long v161 = v109;
          *(float *)((unint64_t)&v161 & 0xFFFFFFFFFFFFFFF3 | (4 * (v105 & 3))) = *(float *)((unint64_t)&v161 & 0xFFFFFFFFFFFFFFF3 | (4 * (v105 & 3)))
                                                                                          * v106;
          long long v109 = v161;
          ++v105;
        }
        while (v105 != 3);
        a3[1].var34 = *((float *)&v108 + 2);
        a3[1].var38 = *((float *)&v107 + 2);
        *(void *)&a3[1].var32 = v108;
        *(void *)&a3[1].var36 = v107;
        a3[1].var42 = *((float *)&v109 + 2);
        *(void *)&a3[1].var40 = v109;
      }
      a5->dpcData.mode = a5->auxData.dpcMode;
      a5->dpcData.edrFactor = 1.0 / a5->maxEDRValue;
      a5->dpcData.float rangeMax = 1.0;
      if (a5->targetTransferFunction == 16) {
        a5->dpcData.float rangeMax = a5->tmData.Tmax_nits / 10000.0;
      }
      a5->dpcData.gaiuint64_t n = a5->auxData.dpcGain;
      calculateDpcParamS((float *)&a5->dpcData.mode, (uint64_t)&a3[1].var44);

      return;
    case 4:
      [(DolbyVisionDisplayManagement *)self setupDoViDmVersion:a3 tmData:p_tmData hdrCtrl:a4];
      *(float *)&double v84 = v38;
      *(float *)&double v85 = v156;
      *(float *)&double v86 = v68;
      *(float *)&double v87 = v70;
      *(float *)&double v88 = v69;
      [(DolbyVisionDisplayManagement *)self dovi84_setupTmParams:a3 hdrCtrl:a4 tcCtrl:a5 applyPostRGBtoRGBMatrixScaler:&v188 sMinPq:v46 sMaxPq:self->_dm40 tMinPq:v84 tMaxPq:v85 nominalPQ:v86 targetingDoviLLOrSDR:v87 dm40:v88];
      goto LABEL_80;
    default:
      [(DolbyVisionDisplayManagement *)self setupDoViDmVersion:a3 tmData:p_tmData hdrCtrl:a4];
      dovi_setupTmParams((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v38, v156, v68, v70, v69, v77, v46, self->_dm40);
LABEL_80:
      long long v89 = *(_OWORD *)&a5->doviTmParam.sl;
      float brightAdjBySat2 = a5->doviTmParam.brightAdjBySat2;
      goto LABEL_88;
  }
}

- (void)setDisplayManagementConfigFromDictionary:(id *)a3 hdrCtrl:(id *)a4 tcCtrl:(ToneCurve_Control *)a5 infoFrame:(id *)a6
{
  a5->tmData.int processingType = getProcessingType((uint64_t)a4, (uint64_t)a5);
  a5->auxData.isDoViL2TrimAvailable = 0;
  overrideDefaults((HDRConfig *)a3, (uint64_t)a4, (uint64_t)a5, 1);
  if (a5->tmData.processingType == 5)
  {
    [(DolbyVisionDisplayManagement *)self setConvertConfig:a3 tcCtrl:a5 hdrCtrl:a4 auxData:&a5->auxData tmData:&a5->tmData];
  }
  else
  {
    [(DolbyVisionDisplayManagement *)self setDisplayManagementToneMappingConfigFromDictionary:a3 hdrCtrl:a4 tcCtrl:a5 infoFrame:a6];
  }
}

- (void)getToneCurves:(id *)a3 tcCtrl:(ToneCurve_Control *)a4 tmData:(_TMData *)a5 srcMinPQ:(float)a6 srcMaxPQ:(float)a7 tgtMinPQ:(float)a8 tgtMaxPQ:(float)a9 srcDiagSize:(float)a10 dstDiagSize:(float)a11 EDRFactor:(float)a12 ambient:(float)a13 nominalPQ:(float)a14 useLCDPanel:(BOOL)a15 referenceDisplay:(BOOL)a16 slopeScaled:(float *)a17 c1:(float *)a18 c2:(float *)a19 c3:(float *)a20 BrightAdjBySat2:(float *)a21 DM_MetaData:(id *)a22
{
  a13 = a10;
  int doviTmMode = a5->doviTmMode;
  if (doviTmMode == 3)
  {
    *(float *)&double v34 = a4->crush;
    *(float *)&double v35 = a4->clip;
    unint64_t v51 = LODWORD(a11) | 0xBF80000000000000;
    *(float *)&double v36 = a4->mid;
    -[DolbyVisionDisplayManagement initToneCurveParams:srcMinPQ:srcMaxPQ:tgtMinPQ:tgtMaxPQ:srcCrushPQ:srcMidPQ:srcClipPQ:srcDiagSize:dstDiagSize:EDRFactor:ambient:nominalPQ:useLCDPanel:noPCC:referenceDisplay:passThroughTM:slopeScaled:c1:c2:c3:BrightAdjBySat2:](self, "initToneCurveParams:srcMinPQ:srcMaxPQ:tgtMinPQ:tgtMaxPQ:srcCrushPQ:srcMidPQ:srcClipPQ:srcDiagSize:dstDiagSize:EDRFactor:ambient:nominalPQ:useLCDPanel:noPCC:referenceDisplay:passThroughTM:slopeScaled:c1:c2:c3:BrightAdjBySat2:", v55, 0, a4->HDRProcessingFullAmbientAdaptation, a16, (*((unsigned __int8 *)a4 + 152) >> 1) & 1, a17, *(double *)&a6, *(double *)&a7, *(double *)&a8, *(double *)&a9, v34, v36, v35, *(double *)&a13, v51, 0,
      a18,
      a19,
      a20,
      a21);
    [(DolbyVisionDisplayManagement *)self getToneCurvesDM31:v55];
LABEL_8:
    [(DolbyVisionDisplayManagement *)self getSat2Parameters:a3];
    return;
  }
  if (doviTmMode != 4)
  {
    *(float *)&double v37 = a4->crush;
    *(float *)&uint64_t v53 = a4->AmbientInNits;
    *((float *)&v53 + 1) = a14;
    unint64_t v52 = __PAIR64__(LODWORD(a12), LODWORD(a11));
    *(float *)&double v38 = a4->mid;
    *(float *)&double v39 = a4->clip;
    -[DolbyVisionDisplayManagement initToneCurveParams:srcMinPQ:srcMaxPQ:tgtMinPQ:tgtMaxPQ:srcCrushPQ:srcMidPQ:srcClipPQ:srcDiagSize:dstDiagSize:EDRFactor:ambient:nominalPQ:useLCDPanel:noPCC:referenceDisplay:passThroughTM:slopeScaled:c1:c2:c3:BrightAdjBySat2:](self, "initToneCurveParams:srcMinPQ:srcMaxPQ:tgtMinPQ:tgtMaxPQ:srcCrushPQ:srcMidPQ:srcClipPQ:srcDiagSize:dstDiagSize:EDRFactor:ambient:nominalPQ:useLCDPanel:noPCC:referenceDisplay:passThroughTM:slopeScaled:c1:c2:c3:BrightAdjBySat2:", v55, a15, a4->HDRProcessingFullAmbientAdaptation, a16, (*((unsigned __int8 *)a4 + 152) >> 1) & 1, a17, *(double *)&a6, *(double *)&a7, *(double *)&a8, *(double *)&a9, v37, v38, v39, *(double *)&a13, v52, v53,
      a18,
      a19,
      a20,
      a21);
    [(DolbyVisionDisplayManagement *)self getToneCurves:v55 tcCtrl:a4 tmData:a5];
    goto LABEL_8;
  }
  float mid = a4->mid;
  float clip = a4->clip;
  float v54 = clip;
  v55[0] = mid;
  __int16 v33 = *(_WORD *)&a3[1].var50;
  if (!v33)
  {
    if (a5->gradingAmbientEnvironmentType == 1)
    {
      adjustDovi84DM4Stats((HDRConfig *)a3, (float *)&a5->hdr10TmMode, v55, &v54, mid, clip);
      __int16 v33 = *(_WORD *)&a3[1].var50;
    }
    else
    {
      __int16 v33 = 0;
    }
  }
  if (a5->useDM4TmForDM3DoVi84Bright) {
    uint64_t v40 = 1;
  }
  else {
    uint64_t v40 = 4 * LOBYTE(a3[1].var55.alpha);
  }
  if ((v33 & 0x400) != 0 && (debugDM4DisableConf & 0x400) == 0)
  {
    if (a22->var25.var0) {
      uint64_t v40 = 2;
    }
    else {
      uint64_t v40 = v40;
    }
  }
  *(float *)&double v41 = a4->crush;
  *(float *)&double v43 = v54;
  *(float *)&double v42 = v55[0];
  *(float *)&double v44 = a5->adjTmax_nits;
  *(float *)&double v45 = a6;
  *(float *)&double v46 = a7;
  *(float *)&double v47 = a8;
  *(float *)&double v48 = a9;
  Config = GetConfig((HDRConfig *)-[DolbyVisionDM4 createToneCurve:srcMaxPQ:tgtMinPQ:tgtMaxPQ:srcCrushPQ:srcMidPQ:srcClipPQ:targetMaxLinear:DM_MetaData:tcCtrl:dm4TmMode:](self->_dm40, "createToneCurve:srcMaxPQ:tgtMinPQ:tgtMaxPQ:srcCrushPQ:srcMidPQ:srcClipPQ:targetMaxLinear:DM_MetaData:tcCtrl:dm4TmMode:", a22, a4, v40, a15, a16, a17, v45, v46, v47, v48, v41, v42, v43, v44));
  if (Config)
  {
    unsigned int v50 = GetConfig((HDRConfig *)Config);
    if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v50, 0x10u, 0)) {
      [(DolbyVisionDM4 *)self->_dm40 dumpConfigDataToFile:g_frame_idx];
    }
  }
}

- (void)initToneCurveParams:(id *)a3 srcMinPQ:(float)a4 srcMaxPQ:(float)a5 tgtMinPQ:(float)a6 tgtMaxPQ:(float)a7 srcCrushPQ:(float)a8 srcMidPQ:(float)a9 srcClipPQ:(float)a10 srcDiagSize:(float)a11 dstDiagSize:(float)a12 EDRFactor:(float)a13 ambient:(float)a14 nominalPQ:(float)a15 useLCDPanel:(BOOL)a16 noPCC:(BOOL)a17 referenceDisplay:(BOOL)a18 passThroughTM:(BOOL)a19 slopeScaled:(float *)a20 c1:(float *)a21 c2:(float *)a22 c3:(float *)a23 BrightAdjBySat2:(float *)a24
{
  a3->var0 = a4;
  a3->var1 = a5;
  a3->unsigned int var2 = a6;
  a3->var3 = a7;
  a3->var4 = a9;
  a3->var5 = a8;
  a3->var6 = a10;
  a3->unsigned int var7 = a11;
  a3->var8 = a12;
  a3->var9 = a20;
  *(_OWORD *)&a3->unsigned int var10 = *(_OWORD *)&a21;
  a3->var20 = a24;
  a3->unsigned int var12 = a23;
  *(void *)&a3->var13 = *(void *)&a13;
  a3->unsigned int var15 = a15;
  a3->var16 = a16;
  a3->var17 = a17;
  a3->unsigned int var18 = a18;
  a3->var19 = a19;
}

- (void)getToneCurves:(id *)a3 tcCtrl:(ToneCurve_Control *)a4 tmData:(_TMData *)a5
{
  if (!a3->var19)
  {
    float var3 = a3->var3;
    float var1 = a3->var1;
    if (var3 >= var1)
    {
      a3->float var3 = var1;
      float var3 = var1;
    }
    float v10 = sqrtf((float)(var3 - a3->var2) / (float)(var1 - a3->var0));
    if (v10 <= 1.0) {
      float v11 = v10;
    }
    else {
      float v11 = 1.0;
    }
    float v12 = log2f(a3->var8);
    float v13 = sqrtf(v12 / log2f(a3->var7));
    var9 = a3->var9;
    float *var9 = (float)(v13 * sqrtf(1.0 / v11)) / 0.33333;
    float var5 = a3->var5;
    float var6 = a3->var6;
    float var4 = a3->var4;
    double v18 = var5 + (float)(var6 - var5) * 0.85;
    float v19 = v13 * (float)(1.0 - v11);
    float v20 = v18;
    if (var4 > v20)
    {
      a3->float var4 = v20;
      float var4 = v18;
    }
    float var14 = a3->var14;
    float v22 = powf(var14 / 10000.0, 0.1593);
    float v23 = (v22 * 18.8515625 + 0.8359375) / (v22 * 18.6875 + 1.0);
    float v25 = powf(v23, 78.844);
    if (v25 <= 1.0) {
      float v26 = v25;
    }
    else {
      float v26 = 1.0;
    }
    if (v25 >= 0.0) {
      float v27 = v26;
    }
    else {
      float v27 = 0.0;
    }
    float v28 = v19
        * (float)(var4
                * (float)((float)((float)(var4 - a3->var0) + (float)(var4 - a3->var0)) / (float)(a3->var1 - a3->var0)));
    if ((float)(var5 - v28) >= a3->var2) {
      float var2 = var5 - v28;
    }
    else {
      float var2 = a3->var2;
    }
    if ((float)(var6 - v28) >= a3->var3) {
      float v30 = a3->var3;
    }
    else {
      float v30 = var6 - v28;
    }
    float v31 = var4 - v28;
    if ((a5->edrAdaptationMode == 1 || a5->ambAdaptationMode == 1) && a3->var13 >= 0.0 && var14 >= 0.0 && !a3->var18)
    {
      Config = GetConfig(v24);
      if (Config
        && (double v35 = GetConfig((HDRConfig *)Config), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v35, 0x44u, 0))
        || a4->tmData.processingType != 4)
      {
        float v31 = fminf(v31, 0.5);
        double v36 = (const float *)&middata_3LED;
      }
      else
      {
        double v36 = (const float *)&middata_3LED_84;
      }
      float var15 = a3->var15;
      float v38 = adjustMidTone(v27, var15, AB_3LED, BR_3LED, 8, 9, v36) + 0.0;
      float v32 = adjustMidTone(v27, var15, AB_3LED, BR_3LED, 8, 9, sat_3LED);
      float v39 = v31 + v38;
      float v40 = a3->var6;
      if (v40 <= 0.001) {
        double v41 = 0.949999988;
      }
      else {
        double v41 = (float)(a3->var4 / v40);
      }
      float v42 = v41 * 1.875 + -0.7937;
      double v43 = v42;
      if (v42 > 0.95) {
        float v42 = 0.95;
      }
      if (v43 < 0.8) {
        float v42 = 0.8;
      }
      float v44 = v30 * v42;
      if (v39 <= v44) {
        float v44 = v31 + v38;
      }
      if (v39 >= var2) {
        float v31 = v44;
      }
      else {
        float v31 = var2;
      }
      var9 = a3->var9;
    }
    else
    {
      float v32 = 0.0;
      if (v31 >= var2)
      {
        double v33 = v30 * 0.95;
        if (v33 < v31) {
          float v31 = v33;
        }
      }
      else
      {
        float v31 = var2;
      }
    }
    *a3->var20 = v32;
    float v45 = *var9;
    float v46 = powf(a3->var5, *var9);
    float v47 = powf(a3->var4, v45);
    float v48 = powf(a3->var6, v45);
    float v49 = powf(var2, 3.0);
    float v50 = powf(v31, 3.0);
    float v51 = powf(v30, 3.0);
    float v52 = (float)((float)((float)(v50 * v47) * (float)(v48 - v46)) + (float)((float)(v51 * v48) * (float)(v46 - v47)))
        + (float)((float)(v49 * v46) * (float)(v47 - v48));
    unsigned int var11 = a3->var11;
    *a3->unsigned int var10 = (float)((float)((float)(v50 * (float)((float)(v51 - v49) * (float)(v46 * v48)))
                               + (float)((float)((float)(v50 - v51) * (float)(v47 * v48)) * v49))
                       + (float)((float)((float)(v49 - v50) * (float)(v46 * v47)) * v51))
               / v52;
    *unsigned int var11 = (float)((float)((float)(v50 * (float)-(float)((float)(v51 * v48) - (float)(v46 * v49)))
                           + (float)((float)-(float)((float)(v50 * v47) - (float)(v48 * v51)) * v49))
                   + (float)((float)-(float)((float)(v49 * v46) - (float)(v47 * v50)) * v51))
           / v52;
    *a3->unsigned int var12 = (float)((float)((float)((float)(v48 - v47) * v49) - (float)((float)(v48 - v46) * v50))
                       + (float)((float)(v47 - v46) * v51))
               / v52;
  }
}

- (void)getToneCurvesDM31:(id *)a3
{
  float var3 = a3->var3;
  float var1 = a3->var1;
  if (var3 >= var1)
  {
    a3->float var3 = var1;
    float var3 = var1;
  }
  float v6 = (float)(var1 + a3->var0) * 0.5;
  float v7 = v6 - (float)((float)(var3 + a3->var2) * 0.5);
  float v8 = log2f(a3->var8);
  float v9 = sqrtf(v8 / log2f(a3->var7));
  var9 = a3->var9;
  float *var9 = (float)((float)(v7 + 1.0) * v9) / 0.33333;
  float var4 = a3->var4;
  float var5 = a3->var5;
  float v13 = (float)((float)(v9 * (float)(v7 * (float)((float)((float)(var4 - v6) * 3.0) + 1.0))) * 0.5) + 0.0;
  if ((float)(var5 - v13) >= a3->var2) {
    float var2 = var5 - v13;
  }
  else {
    float var2 = a3->var2;
  }
  float var6 = a3->var6;
  if ((float)(var6 - v13) >= a3->var3) {
    float v16 = a3->var3;
  }
  else {
    float v16 = var6 - v13;
  }
  double v17 = (float)(var6 - var5);
  float v18 = var5 + v17 * 0.85;
  float v19 = var5 + v17 * 0.15;
  if (var4 > v18) {
    float var4 = v18;
  }
  if (var4 <= v19) {
    float v20 = v19;
  }
  else {
    float v20 = var4;
  }
  a3->float var4 = v20;
  double v21 = (float)(v16 - var2);
  float v22 = var2 + v21 * 0.85;
  float v23 = var2 + v21 * 0.15;
  float v24 = (float)(v20 - v13) + 0.0;
  if (v24 > v22) {
    float v24 = v22;
  }
  if (v24 <= v23) {
    float v25 = v23;
  }
  else {
    float v25 = v24;
  }
  float v26 = *var9;
  float v27 = powf(var5, *var9);
  float v28 = powf(v20, v26);
  float v29 = powf(var6, v26);
  float v30 = powf(var2, 3.0);
  float v31 = powf(v25, 3.0);
  float v32 = powf(v16, 3.0);
  float v33 = (float)((float)((float)(v29 - v27) * (float)(v28 * v31)) + (float)((float)(v29 * v32) * (float)(v27 - v28)))
      + (float)((float)(v27 * v30) * (float)(v28 - v29));
  unsigned int var11 = a3->var11;
  *a3->unsigned int var10 = (float)((float)((float)((float)((float)(v27 * v29) * (float)(v32 - v30)) * v31)
                             + (float)((float)((float)(v29 * v28) * (float)(v31 - v32)) * v30))
                     + (float)((float)((float)(v27 * v28) * (float)(v30 - v31)) * v32))
             / v33;
  *unsigned int var11 = (float)((float)((float)((float)-(float)((float)(v29 * v32) - (float)(v27 * v30)) * v31)
                         + (float)((float)-(float)((float)(v28 * v31) - (float)(v29 * v32)) * v30))
                 + (float)((float)-(float)((float)(v27 * v30) - (float)(v28 * v31)) * v32))
         / v33;
  *a3->unsigned int var12 = (float)((float)((float)((float)(v29 - v28) * v30) - (float)((float)(v29 - v27) * v31))
                     + (float)((float)(v28 - v27) * v32))
             / v33;
}

- (void)getSat2Parameters:(id *)a3
{
  uint64_t v3 = 0;
  float v4 = *(float *)&a3[1].var2;
  id v5 = (float *)-[DolbyVisionDisplayManagement getSat2Parameters:]::sss;
  while (v4 >= *v5)
  {
    ++v3;
    v5 += 6;
    if (v3 == 10)
    {
      LODWORD(v3) = 0;
      break;
    }
  }
  float v6 = &-[DolbyVisionDisplayManagement getSat2Parameters:]::sss[6 * v3];
  float v7 = &-[DolbyVisionDisplayManagement getSat2Parameters:]::sss[6 * (int)v3];
  float v8 = (float)(*(float *)v6 - v4) / (float)(*(float *)v6 - *((float *)v7 - 6));
  *(float32x4_t *)&a3->var64 = vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)(v7 - 5), v8), *(float32x4_t *)(v6 + 1), 1.0 - v8);
  a3[1].var0 = (float)(v8 * *((float *)v7 - 1)) + (float)(*((float *)v6 + 5) * (float)(1.0 - v8));
}

- (id)getAdaptiveTM
{
  return self->_adaptiveTM;
}

- (id)getHistBasedToneMapping
{
  return self->_histBasedToneMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dmSceneLuxB2D_IPTModel, 0);
  objc_storeStrong((id *)&self->_histBasedToneMapping, 0);
  objc_storeStrong((id *)&self->_adaptiveTM, 0);
  objc_storeStrong((id *)&self->_dm40, 0);
  objc_storeStrong((id *)&self->_outputTexture, 0);
  objc_storeStrong((id *)&self->_inputUVTexture, 0);
  objc_storeStrong((id *)&self->_inputYTexture, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_displayManagementKernel, 0);
  objc_storeStrong((id *)&self->_defaultLibrary, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end