@interface AdaptiveTM
- (float)computeFrameAPLFromLinearHistData:(float *)a3 histBinInLinear:(float *)a4;
- (id)init:(id)a3;
- (int)adaptiveToneMappingAveragePixelLevel:(id *)a3 DM:(id)a4 TCControl:(ToneCurve_Control *)a5 HDRControl:(id *)a6 LLDoVi:(BOOL)a7;
- (void)adaptiveToneMappingCalcStats;
- (void)adaptiveToneMappingConstraintParam;
- (void)adaptiveToneMappingManagement:(id *)a3 DMConfig:(id *)a4 DM:(id)a5 TCControl:(ToneCurve_Control *)a6 HDRControl:(id *)a7 hdr10InfoFrame:(id *)a8 LLDoVi:(BOOL)a9 frameNumber:(unsigned int)a10;
- (void)adaptiveToneMappingSearch:(id *)a3 DMConfig:(id *)a4 DM:(id)a5 TCControl:(ToneCurve_Control *)a6 HDRControl:(id *)a7 hdr10InfoFrame:(id *)a8 LLDoVi:(BOOL)a9;
- (void)adaptiveToneMappingTemporalProcess:(id *)a3 DMConfig:(id *)a4 DM:(id)a5 TCControl:(ToneCurve_Control *)a6 HDRControl:(id *)a7 hdr10InfoFrame:(id *)a8;
- (void)dealloc;
- (void)getTargetAveragePixelThreshold:(float)a3;
@end

@implementation AdaptiveTM

- (id)init:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AdaptiveTM;
  v6 = [(AdaptiveTM *)&v14 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_histTM, a3);
  v8 = (float *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL);
  v7->_normHistHeightInLinear = v8;
  if (!v8) {
    goto LABEL_7;
  }
  v9 = (float *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL);
  v7->_atmHistBinCentroidInLinear = v9;
  if (v9
    && (v10 = (float *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL), (v7->_idxLinear = v10) != 0)
    && (v11 = (float *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL), (v7->_histBinMapped = v11) != 0))
  {
    v7->_apceFactor = 1.0;
    *(void *)&v7->_maxAvgPixelLevelRatioTm = 0x3F80000000000000;
    v12 = v7;
  }
  else
  {
LABEL_7:
    v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  [(AdaptiveTM *)self adaptiveToneMappingLog];
  normHistHeightInLinear = self->_normHistHeightInLinear;
  if (normHistHeightInLinear)
  {
    free(normHistHeightInLinear);
    self->_normHistHeightInLinear = 0;
  }
  atmHistBinCentroidInLinear = self->_atmHistBinCentroidInLinear;
  if (atmHistBinCentroidInLinear)
  {
    free(atmHistBinCentroidInLinear);
    self->_atmHistBinCentroidInLinear = 0;
  }
  idxLinear = self->_idxLinear;
  if (idxLinear)
  {
    free(idxLinear);
    self->_idxLinear = 0;
  }
  histBinMapped = self->_histBinMapped;
  if (histBinMapped)
  {
    free(histBinMapped);
    self->_histBinMapped = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AdaptiveTM;
  [(AdaptiveTM *)&v7 dealloc];
}

- (float)computeFrameAPLFromLinearHistData:(float *)a3 histBinInLinear:(float *)a4
{
  uint64_t v4 = 0;
  float result = 0.0;
  do
  {
    float32x4_t v6 = vmulq_f32(*(float32x4_t *)&a3[v4], *(float32x4_t *)&a4[v4]);
    float result = (float)((float)((float)(result + v6.f32[0]) + v6.f32[1]) + v6.f32[2]) + v6.f32[3];
    v4 += 4;
  }
  while (v4 != 128);
  return result;
}

- (void)adaptiveToneMappingConstraintParam
{
  float displayAveragePixelThreshold = self->_displayAveragePixelThreshold;
  double targetMaxLinear = self->_targetMaxLinear;
  float v4 = (float)(displayAveragePixelThreshold + -1.0) / (targetMaxLinear - self->_displaySustainedBrightnessInNits);
  float v5 = displayAveragePixelThreshold - v4 * targetMaxLinear;
  self->_constraintSlope = v4;
  self->_constraintIntercept = v5;
}

- (void)getTargetAveragePixelThreshold:(float)a3
{
  self->_targetAveragePixelThreshold = self->_constraintIntercept + (float)(self->_constraintSlope * a3);
}

- (int)adaptiveToneMappingAveragePixelLevel:(id *)a3 DM:(id)a4 TCControl:(ToneCurve_Control *)a5 HDRControl:(id *)a6 LLDoVi:(BOOL)a7
{
  id v10 = a4;
  uint64_t processingType = a5->tmData.processingType;
  v12 = [v10 getDolbyVisionDM4];
  int v13 = 0;
  self->_float avgPixelLevelRatioTm = 0.0;
  switch((int)processingType)
  {
    case 0:
      uint64_t v54 = processingType;
      id v55 = v10;
      uint64_t v14 = 0;
      histBinCentroidInPQ = self->_histBinCentroidInPQ;
      do
      {
        float ScalingFactorS_C = dovi_getScalingFactorS_C((uint64_t)a3, (uint64_t)&a5->doviTmParam, (uint64_t)&a5->edrAdaptationParam, (uint64_t)&a5->ambAdaptationParam, v12, histBinCentroidInPQ[v14]);
        histBinCentroidInPQ = self->_histBinCentroidInPQ;
        float v17 = ScalingFactorS_C * histBinCentroidInPQ[v14];
        BOOL v18 = v17 < 0.00000073096;
        if (v17 < 0.00000073096) {
          float v17 = -(float)(v17 + -0.0000014619);
        }
        float v19 = flt_2222D1868[v18];
        float v20 = powf(v17, 0.012683);
        float v21 = fmax((float)((float)(v20 + -0.83594) / (float)((float)(v20 * -18.688) + 18.852)), 0.0);
        float v22 = v19 * powf(v21, 6.2774);
        double targetMaxLinearOutput = a5->targetMaxLinearOutput;
        if (targetMaxLinearOutput < v22) {
          float v22 = targetMaxLinearOutput;
        }
        self->_histBinMapped[v14++] = v22;
      }
      while (v14 != 128);
      goto LABEL_25;
    case 1:
      uint64_t v54 = processingType;
      id v55 = v10;
      uint64_t v24 = 0;
      histBinCentroidInLinear = self->_histBinCentroidInLinear;
      do
      {
        float ScalingFactorS_L_NormIn = hdr10_getScalingFactorS_L_NormIn(&a5->hdr10TmParam, (uint64_t)&a5->edrAdaptationParam, (uint64_t)&a5->ambAdaptationParam, (uint64_t)a3, v12, histBinCentroidInLinear[v24] / 10000.0);
        histBinCentroidInLinear = self->_histBinCentroidInLinear;
        float v27 = ScalingFactorS_L_NormIn * histBinCentroidInLinear[v24];
        double v28 = a5->targetMaxLinearOutput;
        if (v28 < v27) {
          float v27 = v28;
        }
        self->_histBinMapped[v24++] = v27;
      }
      while (v24 != 128);
      goto LABEL_25;
    case 2:
      uint64_t v54 = processingType;
      id v55 = v10;
      uint64_t v29 = 0;
      int hlgTmMode = a5->tmData.hlgTmMode;
      v31 = self->_histBinCentroidInLinear;
      do
      {
        float ScalingFactor = hlg_getScalingFactor(v31[v29] / 1000.0, 128, (uint64_t)a3, (uint64_t)&a5->hlgTmParam, (uint64_t)&a5->edrAdaptationParam, (uint64_t)&a5->ambAdaptationParam, hlgTmMode, v12);
        v31 = self->_histBinCentroidInLinear;
        float v33 = ScalingFactor * v31[v29];
        double v34 = a5->targetMaxLinearOutput;
        if (v34 < v33) {
          float v33 = v34;
        }
        self->_histBinMapped[v29++] = v33;
      }
      while (v29 != 128);
      goto LABEL_25;
    case 4:
      uint64_t v54 = processingType;
      id v55 = v10;
      uint64_t v35 = 0;
      v36 = self->_histBinCentroidInPQ;
      do
      {
        float v37 = dovi84_getScalingFactorS_C((uint64_t)a3, (uint64_t)&a5->doviTmParam, (uint64_t)&a5->edrAdaptationParam, (uint64_t)&a5->ambAdaptationParam, 1, v12, v36[v35]);
        v36 = self->_histBinCentroidInPQ;
        float v38 = v37 * v36[v35];
        BOOL v39 = v38 < 0.00000073096;
        if (v38 < 0.00000073096) {
          float v38 = -(float)(v38 + -0.0000014619);
        }
        float v40 = flt_2222D1868[v39];
        float v41 = powf(v38, 0.012683);
        float v42 = fmax((float)((float)(v41 + -0.83594) / (float)((float)(v41 * -18.688) + 18.852)), 0.0);
        float v43 = v40 * powf(v42, 6.2774);
        double v44 = a5->targetMaxLinearOutput;
        if (v44 < v43) {
          float v43 = v44;
        }
        self->_histBinMapped[v35++] = v43;
      }
      while (v35 != 128);
LABEL_25:
      int v45 = v54;
      id v10 = v55;
      [(HistBasedToneMapping *)self->_histTM avgPixelLevel];
      if (v54 == 2) {
        float v47 = 1000.0;
      }
      else {
        float v47 = 10000.0;
      }
      self->_avgPixelLevelRatio = v46 / v47;
      -[AdaptiveTM computeFrameAPLFromLinearHistData:histBinInLinear:](self, "computeFrameAPLFromLinearHistData:histBinInLinear:", self->_normHistHeight, self->_histBinMapped, v54);
      self->_avgPixelLevelTm = v48;
      double targetMaxLinear = a5->targetMaxLinear;
      if (v45 == 2)
      {
        float v48 = v48 / 1000.0 * targetMaxLinear;
        self->_avgPixelLevelTm = v48;
      }
      double v50 = v48 / targetMaxLinear * self->_apceFactor;
      *(float *)&double v50 = v50;
      self->_float avgPixelLevelRatioTm = *(float *)&v50;
      *(float *)&double v50 = targetMaxLinear;
      [(AdaptiveTM *)self getTargetAveragePixelThreshold:v50];
      float avgPixelLevelRatioTm = self->_avgPixelLevelRatioTm;
      float targetAveragePixelThreshold = self->_targetAveragePixelThreshold;
      if (avgPixelLevelRatioTm <= targetAveragePixelThreshold) {
        int v13 = avgPixelLevelRatioTm >= targetAveragePixelThreshold;
      }
      else {
        int v13 = 2;
      }
      break;
    default:
      break;
  }

  return v13;
}

- (void)adaptiveToneMappingSearch:(id *)a3 DMConfig:(id *)a4 DM:(id)a5 TCControl:(ToneCurve_Control *)a6 HDRControl:(id *)a7 hdr10InfoFrame:(id *)a8 LLDoVi:(BOOL)a9
{
  float v27 = (HDRConfig *)a5;
  float displaySustainedBrightnessInNits = self->_displaySustainedBrightnessInNits;
  Config = GetConfig(v27);
  if (Config)
  {
    float v17 = GetConfig((HDRConfig *)Config);
    float v18 = *(float *)HDRConfig::GetConfigEntryValue((uint64_t)v17, 0x28u, 0);
  }
  else
  {
    float v18 = 0.0;
  }
  int v19 = 0;
  if (v18 == 0.0) {
    float v18 = displaySustainedBrightnessInNits;
  }
  double v20 = v18;
  double v21 = (a6->targetMaxLinear - v18) / 255.0;
  int v22 = 255;
  v23 = v27;
  while (1)
  {
    int v24 = v19 + v22;
    if (v19 + v22 < 0 != __OFADD__(v19, v22)) {
      ++v24;
    }
    int v25 = v24 >> 1;
    a6->double targetMaxLinear = v20 + v21 * (double)(v24 >> 1);
    if (a7->var0 == 1) {
      [(HDRConfig *)v23 setDisplayManagementConfigFromMetaData:a3 config:a4 hdrCtrl:a7 tcCtrl:a6];
    }
    else {
      [(HDRConfig *)v23 setDisplayManagementConfigFromDictionary:a4 hdrCtrl:a7 tcCtrl:a6 infoFrame:a8];
    }
    int v26 = [(AdaptiveTM *)self adaptiveToneMappingAveragePixelLevel:a4 DM:v27 TCControl:a6 HDRControl:a7 LLDoVi:a9];
    if (v26 == 2)
    {
      int v22 = v25 - 1;
      goto LABEL_16;
    }
    if (v26 == 1) {
      break;
    }
    int v19 = v25 + 1;
LABEL_16:
    v23 = v27;
    self->_atmTargetMaxLinear = a6->targetMaxLinear;
    if (v19 > v22) {
      goto LABEL_19;
    }
  }
  self->_atmTargetMaxLinear = a6->targetMaxLinear;
  v23 = v27;
LABEL_19:
  ++self->_atmFrames;
}

- (void)adaptiveToneMappingTemporalProcess:(id *)a3 DMConfig:(id *)a4 DM:(id)a5 TCControl:(ToneCurve_Control *)a6 HDRControl:(id *)a7 hdr10InfoFrame:(id *)a8
{
  id v34 = a5;
  int v13 = [(HistBasedToneMapping *)self->_histTM tempMode];
  if (v13 == 1) {
    goto LABEL_6;
  }
  if (v13 != 2)
  {
    if (v13 == 3)
    {
      uint64_t v14 = [(HistBasedToneMapping *)self->_histTM statLinkedListCurr];
      uint64_t v15 = [v14 numOfProcessedFrames];
      unsigned int v16 = [(HistBasedToneMapping *)self->_histTM bufSize];

      if ([(HistBasedToneMapping *)self->_histTM isSceneChanged]) {
        goto LABEL_8;
      }
      histTM = self->_histTM;
      double atmTargetMaxLinear = self->_atmTargetMaxLinear;
      v32 = [(HistBasedToneMapping *)histTM statLinkedListCurr];
      uint64_t v29 = [v32 targetMaxBuffer];
      v30 = [(HistBasedToneMapping *)self->_histTM statLinkedListCurr];
      -[HistBasedToneMapping FIRFilterHistStat:statBuffer:currIndex:numOfProcessedFrames:](histTM, "FIRFilterHistStat:statBuffer:currIndex:numOfProcessedFrames:", v29, (v15 - 1) % (unint64_t)v16, [v30 numOfProcessedFrames] - 1, atmTargetMaxLinear);
      self->_filteredTargetMaxLinear = v31;

      goto LABEL_11;
    }
LABEL_6:
    self->_filteredTargetMaxLinear = self->_atmTargetMaxLinear;
    goto LABEL_11;
  }
  if ([(HistBasedToneMapping *)self->_histTM isSceneChanged])
  {
LABEL_8:
    double v17 = self->_atmTargetMaxLinear;
    float v18 = [(HistBasedToneMapping *)self->_histTM statLinkedListCurr];
    *(double *)[v18 targetMaxBuffer] = v17;
    self->_filteredTargetMaxLinear = v17;

    goto LABEL_11;
  }
  int v19 = [(HistBasedToneMapping *)self->_histTM statLinkedListCurr];
  double v20 = *(double *)[v19 targetMaxBuffer];
  double v21 = self->_atmTargetMaxLinear;
  int v22 = [(HistBasedToneMapping *)self->_histTM statLinkedListCurr];
  v23 = (double *)[v22 targetMaxBuffer];
  float v24 = v20;
  float v25 = v21;
  double v26 = (float)((float)(v25 * 0.2) + (float)(v24 * 0.8));
  double *v23 = v26;
  self->_filteredTargetMaxLinear = v26;

LABEL_11:
  if (self->_atmTargetMaxLinear != self->_targetMaxLinear)
  {
    a6->double targetMaxLinear = self->_filteredTargetMaxLinear;
    if (a7->var0 == 1) {
      [v34 setDisplayManagementConfigFromMetaData:a3 config:a4 hdrCtrl:a7 tcCtrl:a6];
    }
    else {
      [v34 setDisplayManagementConfigFromDictionary:a4 hdrCtrl:a7 tcCtrl:a6 infoFrame:a8];
    }
  }
}

- (void)adaptiveToneMappingCalcStats
{
  float avgPixelLevelRatioTm = self->_avgPixelLevelRatioTm;
  if (avgPixelLevelRatioTm > self->_maxAvgPixelLevelRatioTm) {
    self->_maxAvgPixelLevelRatioTm = avgPixelLevelRatioTm;
  }
  if (avgPixelLevelRatioTm < self->_minAvgPixelLevelRatioTm) {
    self->_minAvgPixelLevelRatioTm = avgPixelLevelRatioTm;
  }
  unsigned int frameNumber = self->_frameNumber;
  float v4 = (float)frameNumber++;
  self->_averageAPLThreshold = (float)(self->_displayAveragePixelThreshold + (float)(self->_averageAPLThreshold * v4))
                             / (float)frameNumber;
  v5.f64[0] = self->_targetMaxLinear;
  v5.f64[1] = self->_filteredTargetMaxLinear;
  *(float32x2_t *)&self->_averageDPL = vcvt_f32_f64(vdivq_f64(vaddq_f64(v5, vcvtq_f64_f32(vmul_n_f32(*(float32x2_t *)&self->_averageDPL, v4))), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)frameNumber), 0)));
}

- (void)adaptiveToneMappingManagement:(id *)a3 DMConfig:(id *)a4 DM:(id)a5 TCControl:(ToneCurve_Control *)a6 HDRControl:(id *)a7 hdr10InfoFrame:(id *)a8 LLDoVi:(BOOL)a9 frameNumber:(unsigned int)a10
{
  id v31 = a5;
  if (![(HistBasedToneMapping *)self->_histTM isDataValid]) {
    goto LABEL_26;
  }
  self->_float displayAveragePixelThreshold = a6->averagePixelThreshold;
  self->_float displaySustainedBrightnessInNits = a6->sustainedBrightnessInNits;
  double targetMaxLinear = a6->targetMaxLinear;
  a6->double targetMaxLinearOutput = a6->targetMaxLinear;
  self->_double targetMaxLinear = targetMaxLinear;
  self->_double atmTargetMaxLinear = targetMaxLinear;
  [(AdaptiveTM *)self adaptiveToneMappingConstraintParam];
  if (self->_displayAveragePixelThreshold < 1.0)
  {
    self->_unsigned int frameNumber = a10;
    self->_histHeight = (unsigned int *)[(HistBasedToneMapping *)self->_histTM getHistDataPtr];
    self->_sumHist = [(HistBasedToneMapping *)self->_histTM getSumHist];
    self->_normHistHeight = [(HistBasedToneMapping *)self->_histTM normHistHeight];
    self->_histBinCentroidInPQ = [(HistBasedToneMapping *)self->_histTM histBinCentroidInPQ];
    self->_histBinCentroidInLinear = [(HistBasedToneMapping *)self->_histTM histBinCentroidInLinear];
    double v17 = (HDRConfig *)[(HistBasedToneMapping *)self->_histTM avgPixelLevel];
    self->_avgPixelLevel = v18;
    unsigned int var0 = a7->var0;
    if (a7->var0 == 3)
    {
      int v20 = 2;
    }
    else if (var0 == 2)
    {
      int v20 = 1;
    }
    else
    {
      if (var0 != 1) {
        goto LABEL_26;
      }
      if (a7->var17 != 18)
      {
        self->_scalingFactorMode = 0;
        goto LABEL_11;
      }
      int v20 = 3;
    }
    self->_scalingFactorMode = v20;
LABEL_11:
    Config = GetConfig(v17);
    if (Config)
    {
      v23 = GetConfig((HDRConfig *)Config);
      LODWORD(v22) = *(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v23, 0x27u, 0);
      if (*(float *)&v22 != 0.0) {
        self->_apceFactor = *(float *)&v22;
      }
    }
    int v24 = -[AdaptiveTM adaptiveToneMappingAveragePixelLevel:DM:TCControl:HDRControl:LLDoVi:](self, "adaptiveToneMappingAveragePixelLevel:DM:TCControl:HDRControl:LLDoVi:", a4, v31, a6, a7, a9, v22);
    if (v24 == 2)
    {
      LOBYTE(v30) = a9;
      [(AdaptiveTM *)self adaptiveToneMappingSearch:a3 DMConfig:a4 DM:v31 TCControl:a6 HDRControl:a7 hdr10InfoFrame:a8 LLDoVi:v30];
      if (self->_prevAplRange >= 2) {
        goto LABEL_19;
      }
    }
    else if (self->_prevAplRange != 2)
    {
LABEL_19:
      self->_prevAplRange = v24;
      goto LABEL_20;
    }
    [(AdaptiveTM *)self adaptiveToneMappingLog];
    goto LABEL_19;
  }
LABEL_20:
  [(AdaptiveTM *)self adaptiveToneMappingTemporalProcess:a3 DMConfig:a4 DM:v31 TCControl:a6 HDRControl:a7 hdr10InfoFrame:a8];
  float v25 = (HDRConfig *)[(AdaptiveTM *)self adaptiveToneMappingCalcStats];
  unsigned int frameNumber = self->_frameNumber;
  if (frameNumber)
  {
    float v27 = GetConfig(v25);
    if (v27)
    {
      double v28 = GetConfig((HDRConfig *)v27);
      unsigned int v29 = *(_DWORD *)HDRConfig::GetConfigEntryValue((uint64_t)v28, 0x29u, 0);
    }
    else
    {
      unsigned int v29 = 0;
    }
    if (!(frameNumber % v29)) {
      [(AdaptiveTM *)self adaptiveToneMappingLog];
    }
  }
LABEL_26:
}

- (void).cxx_destruct
{
}

@end