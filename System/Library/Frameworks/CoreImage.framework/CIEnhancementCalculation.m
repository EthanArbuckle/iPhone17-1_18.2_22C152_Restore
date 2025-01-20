@interface CIEnhancementCalculation
+ (double)bestWarmthForI:(double)a3 q:(double)a4 percentChange:(double *)a5;
- ($F24F406B2B787EFB06265DBA3D28CBD5)originalFaceColor;
- (CGPoint)curvePointAtIndex:(unint64_t)a3;
- (CIEnhancementCalculation)init;
- (CIEnhancementHistogram)borderHist;
- (CIEnhancementHistogram)lumHist;
- (CIEnhancementHistogram)rgbSumHist;
- (CIEnhancementHistogram)satHist;
- (id)faceBalanceStrength;
- (id)faceBalanceWarmth;
- (id)rawShadow;
- (id)shadow;
- (id)vibrance;
- (int)putShadowsAnalysisInto:(double *)a3;
- (unint64_t)curveCount;
- (void)dealloc;
- (void)downSampleHistogram:(id)a3 to:(unsigned int)a4 storeIn:(double *)a5;
- (void)printAnalysis;
- (void)printHistogram:(id)a3 downsampledTo:(unsigned int)a4;
- (void)printHistogramsDownsampledTo:(unsigned int)a3;
- (void)setBorderHistogram:(id)a3;
- (void)setCurvePercent:(double)a3;
- (void)setExposureValue:(double)a3;
- (void)setFaceColorFromChromaI:(double)a3 andChromaQ:(double)a4;
- (void)setLuminanceHistogram:(id)a3;
- (void)setRGBSumHistogram:(id)a3;
- (void)setSaturationHistogram:(id)a3;
- (void)setShadowsMin:(double)a3 max:(double)a4 zeroExposure:(double)a5;
- (void)setupFaceColor:(id)a3 redIndex:(int)a4 greenIndex:(int)a5 blueIndex:(int)a6;
@end

@implementation CIEnhancementCalculation

- (CIEnhancementCalculation)init
{
  v3.receiver = self;
  v3.super_class = (Class)CIEnhancementCalculation;
  result = [(CIEnhancementCalculation *)&v3 init];
  if (result)
  {
    result->exposureValue = 0.0;
    *(_OWORD *)&result->satHist = 0u;
    *(_OWORD *)&result->lumHist = 0u;
    result->faceInputSet = 0;
    result->originalFaceColor.i = 0.0;
    result->originalFaceColor.q = 0.0;
    *(_OWORD *)&result->maxShadow = xmmword_193952450;
    *(_OWORD *)&result->exposureValueAtZeroShadow = xmmword_193953170;
    result->percentFaceChange = 0.0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CIEnhancementCalculation;
  [(CIEnhancementCalculation *)&v3 dealloc];
}

- (void)setCurvePercent:(double)a3
{
  self->curvePercent = fmax(fmin(a3, 1.0), 0.0);
}

- (void)setLuminanceHistogram:(id)a3
{
  self->lumHist = (CIEnhancementHistogram *)a3;
}

- (void)setRGBSumHistogram:(id)a3
{
  self->rgbSumHist = (CIEnhancementHistogram *)a3;
}

- (void)setBorderHistogram:(id)a3
{
  self->borderHist = (CIEnhancementHistogram *)a3;
}

- (void)setSaturationHistogram:(id)a3
{
  self->satHist = (CIEnhancementHistogram *)a3;
}

+ (double)bestWarmthForI:(double)a3 q:(double)a4 percentChange:(double *)a5
{
  if (a5)
  {
    double v5 = (unk_1E932C810 - unk_1E932C800) * (unk_1E932C810 - unk_1E932C800);
    double v6 = fmin(fmax(((a4 - unk_1E932C800) * (unk_1E932C810 - unk_1E932C800)+ (a3 - *(double *)&faceBalanceIndoorIQ)* (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ))/ (v5+ (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)* (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)), 0.0), 1.0)* 0.75+ 0.25;
    *a5 = sqrt((a3- (*(double *)&faceBalanceIndoorIQ+ v6 * (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)))* (a3- (*(double *)&faceBalanceIndoorIQ+ v6 * (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)))+ (a4 - (unk_1E932C800 + v6 * (unk_1E932C810 - unk_1E932C800)))* (a4 - (unk_1E932C800 + v6 * (unk_1E932C810 - unk_1E932C800))))/ sqrt((*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)* (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)+ v5);
  }
  return 0.5;
}

- (void)setFaceColorFromChromaI:(double)a3 andChromaQ:(double)a4
{
  self->originalFaceColor.i = a3;
  self->originalFaceColor.q = a4;
  self->faceInputSet = 1;
  +[CIEnhancementCalculation bestWarmthForI:q:percentChange:](CIEnhancementCalculation, "bestWarmthForI:q:percentChange:", &self->percentFaceChange);
}

- (void)setupFaceColor:(id)a3 redIndex:(int)a4 greenIndex:(int)a5 blueIndex:(int)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v45 = [a3 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v45)
  {
    v42 = self;
    uint64_t v44 = *(void *)v55;
    uint64_t v10 = a4;
    uint64_t v11 = a5;
    uint64_t v12 = a6;
    double v13 = 0.0;
    double v14 = 1.0;
    double v15 = 0.0;
    double v16 = 0.0;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v55 != v44) {
          objc_enumerationMutation(a3);
        }
        double v48 = v16;
        uint64_t v47 = v17;
        v18 = *(void **)(*((void *)&v54 + 1) + 8 * v17);
        int v19 = [v18 bytesPerPixel];
        unint64_t v20 = [v18 width];
        v52 = v18;
        unint64_t v21 = [v18 height];
        unint64_t v22 = v21;
        double v49 = v15;
        double v50 = v13;
        unint64_t v46 = v20;
        if (v21)
        {
          unint64_t v23 = 0;
          double v24 = v14 / ((double)v20 * (double)v21);
          unint64_t v25 = v20 - 1;
          double v26 = 0.0;
          double v27 = 0.0;
          for (i = v21; i > v23; unint64_t v22 = i)
          {
            uint64_t v28 = [v52 rowAtIndex:v23];
            if (v25)
            {
              uint64_t v30 = v28;
              unsigned int v31 = 0;
              unsigned int v32 = 1;
              do
              {
                uint64_t v33 = v30 + v31;
                LOBYTE(v29) = *(unsigned char *)(v33 + v10);
                *(double *)&unint64_t v34 = pow((double)*(unint64_t *)&v29 / 255.0, 0.555555556);
                double v35 = *(double *)&v34;
                LOBYTE(v34) = *(unsigned char *)(v33 + v11);
                *(double *)&unint64_t v36 = pow((double)v34 / 255.0, 0.555555556);
                double v37 = *(double *)&v36;
                LOBYTE(v36) = *(unsigned char *)(v33 + v12);
                long double v38 = pow((double)v36 / 255.0, 0.555555556);
                long double v39 = v37 * -0.2755 + v35 * 0.596 + v38 * -0.321;
                double v29 = v37 * -0.523 + v35 * 0.212 + v38 * 0.311;
                double v26 = v26 + v24 * v39;
                double v27 = v27 + v24 * v29;
                v31 += v19;
              }
              while (v25 > v32++);
            }
            unint64_t v23 = (v23 + 1);
          }
        }
        else
        {
          double v27 = 0.0;
          double v26 = 0.0;
        }
        long double __x = 0.0;
        +[CIEnhancementCalculation bestWarmthForI:&__x q:v26 percentChange:v27];
        double v14 = 1.0;
        double v41 = fmin(1.0 / fmax(pow(__x, 3.0), 0.0001), 1.0) * (double)(v22 * v46);
        double v16 = v48 + v41 * v26;
        double v15 = v49 + v41 * v27;
        double v13 = v50 + v41;
        uint64_t v17 = v47 + 1;
      }
      while (v47 + 1 != v45);
      uint64_t v45 = [a3 countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v45);
    if (v13 > 0.0) {
      [(CIEnhancementCalculation *)v42 setFaceColorFromChromaI:v16 / v13 andChromaQ:v15 / v13];
    }
  }
}

- (void)setExposureValue:(double)a3
{
  self->exposureValue = a3;
}

- (void)setShadowsMin:(double)a3 max:(double)a4 zeroExposure:(double)a5
{
  self->maxShadow = fmax(a4, 0.0);
  self->minShadow = fmin(a3, 0.0);
  self->exposureValueAtZeroShadow = a5;
}

- (id)faceBalanceStrength
{
  if (self->faceInputSet) {
    return &unk_1EE4AA3B0;
  }
  else {
    return 0;
  }
}

- (id)faceBalanceWarmth
{
  if (!self->faceInputSet) {
    return 0;
  }
  v2 = NSNumber;
  +[CIEnhancementCalculation bestWarmthForI:0 q:self->originalFaceColor.i percentChange:self->originalFaceColor.q];

  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)originalFaceColor
{
  double i = self->originalFaceColor.i;
  double q = self->originalFaceColor.q;
  result.var1 = q;
  result.var0 = i;
  return result;
}

- (id)vibrance
{
  id result = self->satHist;
  if (result)
  {
    uint64_t v4 = [result values];
    double v5 = 0.0;
    unint64_t v6 = 255;
    do
    {
      int v7 = v6 - 1;
      if (v6 < 2) {
        break;
      }
      double v5 = v5 + *(double *)(v4 + 8 * v6--);
    }
    while (v5 < 0.02);
    long double v8 = (255.0 - (double)v7) / 255.0;
    v9 = NSNumber;
    double v10 = fmax(1.0 - self->percentFaceChange, 0.0) * 8.0 * 0.4;
    long double v11 = pow(v8, 3.0) * v10;
    double v12 = pow(1.0 - v8, 1.6) * v11;
    return (id)[v9 numberWithDouble:v12];
  }
  return result;
}

- (unint64_t)curveCount
{
  if (self->rgbSumHist) {
    return 5;
  }
  else {
    return 0;
  }
}

- (CGPoint)curvePointAtIndex:(unint64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v34[2] = xmmword_1939578A8;
  v34[3] = unk_1939578B8;
  v34[4] = xmmword_1939578C8;
  v34[0] = xmmword_193957888;
  v34[1] = unk_193957898;
  rgbSumHist = self->rgbSumHist;
  if (rgbSumHist)
  {
    uint64_t v30 = 0;
    long long v32 = 0u;
    double v31 = 0.25;
    uint64_t v33 = 0x3FF0000000000000;
    double v29 = 0.0;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v6 = [(CIEnhancementHistogram *)rgbSumHist values];
    uint64_t v7 = 0;
    double v8 = 0.0;
    do
    {
      double v8 = v8 + *(double *)(v6 + v7);
      v7 += 8;
    }
    while (v7 != 2048);
    for (uint64_t i = 0; i != 5; ++i)
    {
      uint64_t v10 = 0;
      double v11 = v8 * *((double *)&v26 + i);
      double v12 = 0.0;
      while (1)
      {
        double v13 = *(double *)(v6 + 8 * v10);
        if (v12 + v13 >= v11) {
          break;
        }
        ++v10;
        double v12 = v12 + v13;
        if (v10 == 256) {
          goto LABEL_10;
        }
      }
      *((double *)&v27 + i) = (double)(int)v10 * 0.00390625 + (v11 - v12) / v13 * 0.00390625;
LABEL_10:
      ;
    }
    uint64_t v14 = 0;
    double v15 = *(double *)&v27 * fmin(fmax(*(double *)&v27 * -0.8 + 1.0, 0.6), 1.0);
    double v16 = (1.0 - v29) * fmin(fmax((1.0 - v29) * -0.8 + 1.0, 0.6), 1.0) * -0.5 + 1.0;
    double v17 = 1.0 / (v16 - v15);
    *(double *)&long long v27 = v15;
    *((double *)&v27 + 1) = (*((double *)&v27 + 1)
                           + (*(double *)&v28 - v15 + 1.0) * v15
                           + (*(double *)&v28 - v15 + 1.0) * *(double *)&v28)
                          / ((*(double *)&v28 - v15) * 2.0 + 3.0);
    *((double *)&v28 + 1) = (*((double *)&v28 + 1)
                           + (v16 - *(double *)&v28 + 1.0) * v16
                           + (v16 - *(double *)&v28 + 1.0) * *(double *)&v28)
                          / ((v16 - *(double *)&v28) * 2.0 + 3.0);
    double v29 = v16;
    double v18 = (*(double *)&v28 - v15) * v17;
    double curvePercent = self->curvePercent;
    double v20 = v17 * (1.0 - curvePercent);
    double v31 = (*((double *)&v27 + 1) - v15) * v20
        + curvePercent * fmin((v18 + 0.0) * 0.5, v17 * (*((double *)&v27 + 1) - v15));
    *(double *)&long long v32 = v18;
    *((double *)&v32 + 1) = v20 * (*((double *)&v28 + 1) - v15)
                          + curvePercent * fmax((v18 + 1.0) * 0.5, v17 * (*((double *)&v28 + 1) - v15));
    unint64_t v21 = (void *)v34 + 1;
    do
    {
      uint64_t v22 = *(uint64_t *)((char *)&v30 + v14);
      *(v21 - 1) = *(void *)((char *)&v27 + v14);
      *unint64_t v21 = v22;
      v14 += 8;
      v21 += 2;
    }
    while (v14 != 40);
    unint64_t v23 = (double *)&v34[a3 % 5];
    double v24 = *v23;
    double v25 = v23[1];
  }
  else
  {
    double v25 = 0.0;
    double v24 = 0.0;
  }
  result.y = v25;
  result.x = v24;
  return result;
}

- (int)putShadowsAnalysisInto:(double *)a3
{
  v71[16] = *MEMORY[0x1E4F143B8];
  double v5 = [(CIEnhancementHistogram *)self->lumHist values];
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  double v8 = *v5;
  double v9 = 0.0;
  do
  {
    double v10 = v5[v7];
    double v8 = fmax(v8, v10);
    double v9 = v9 + v10;
    *(double *)&v67[v7++] = v9;
  }
  while (v7 != 256);
  double v11 = [(CIEnhancementHistogram *)self->borderHist values];
  double v12 = v11;
  uint64_t v13 = 0;
  int v14 = 0;
  double v15 = *v11;
  do
  {
    if (v11[v13] > v15)
    {
      int v14 = v13;
      double v15 = v11[v13];
    }
    ++v13;
  }
  while (v13 != 256);
  if ([(CIEnhancementCalculation *)self curveCount] == 5)
  {
    [(CIEnhancementCalculation *)self curvePointAtIndex:0];
    double v17 = v16;
    [(CIEnhancementCalculation *)self curvePointAtIndex:4];
    unsigned int v18 = llround(v17 * 255.0);
    double v20 = v19 - v17;
  }
  else
  {
    unsigned int v18 = 0;
    double v20 = 1.0;
  }
  v71[0] = 0x3FF0000000000000;
  *(double *)v68 = v15;
  *(double *)v70 = v8;
  v69[0] = 0x3FF0000000000000;
  *(double *)&v71[1] = (double)v14 * 0.00390625;
  unint64_t v21 = (double *)&v12[v14];
  double v22 = *v21;
  *(double *)&v68[1] = *v21 / v15;
  *(double *)&v70[1] = v6[v14] / v8;
  v69[1] = v67[v14];
  double v23 = v22 * 0.5;
  unsigned int v24 = v14;
  do
  {
    int v25 = v24++;
    if (v24 > 0x108) {
      break;
    }
    double v26 = *v21++;
  }
  while (v26 >= v23);
  if (v24 <= 0x108) {
    int v27 = v25;
  }
  else {
    int v27 = 255;
  }
  *(double *)&v71[2] = (double)v27 * 0.00390625;
  *(double *)&v68[2] = v12[v27] / v15;
  *(double *)&v70[2] = v6[v27] / v8;
  v69[2] = v67[v27];
  long long v28 = (double *)&v12[v14];
  do
  {
    int v29 = v14--;
    if (v14 > 0x108) {
      break;
    }
    double v30 = *v28--;
  }
  while (v30 >= v23);
  if (v14 <= 0x108) {
    int v31 = v29;
  }
  else {
    int v31 = 0;
  }
  *(double *)&v71[3] = (double)v31 * 0.00390625;
  *(double *)&v68[3] = v12[v31] / v15;
  *(double *)&v70[3] = v6[v31] / v8;
  v69[3] = v67[v31];
  long long v32 = [(CIEnhancementHistogram *)self->borderHist values];
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v34 = putShadowsAnalysisInto__segTop[i];
    uint64_t v35 = putShadowsAnalysisInto__segStart[i];
    double v36 = 0.0;
    if ((int)v34 > (int)v35)
    {
      double v37 = 1.0 / (double)((int)v34 - (int)v35);
      long double v38 = (double *)&v32[v35];
      uint64_t v39 = v34 - v35;
      double v40 = 0.0;
      double v36 = 0.0;
      do
      {
        double v41 = *v38++;
        double v36 = v36 + v40 * v41;
        double v40 = v37 + v40;
        --v39;
      }
      while (v39);
    }
    uint64_t v42 = putShadowsAnalysisInto__segDown[i];
    if ((int)v34 < (int)v42)
    {
      v43 = (double *)&v32[v34];
      uint64_t v44 = v42 - v34;
      do
      {
        double v45 = *v43++;
        double v36 = v36 + v45;
        --v44;
      }
      while (v44);
    }
    uint64_t v46 = putShadowsAnalysisInto__segEnd[i];
    if ((int)v46 > (int)v42)
    {
      double v47 = 1.0 / (double)((int)v46 - (int)v42);
      double v48 = (double *)&v32[v42];
      uint64_t v49 = v46 - v42;
      double v50 = 1.0;
      do
      {
        double v51 = *v48++;
        double v36 = v36 + v50 * v51;
        double v50 = v50 - v47;
        --v49;
      }
      while (v49);
    }
    *(double *)&(&v63)[i] = v36;
  }
  uint64_t v52 = 0;
  int result = 0;
  v68[4] = v64;
  v70[4] = v65;
  v69[4] = v66;
  int v54 = llround(v20 * (double)(int)(v18 + 64));
  v71[4] = v63;
  *(double *)&v71[5] = (double)v54 * 0.00390625;
  *(double *)&v68[5] = v12[v54] / v15;
  *(double *)&v70[5] = v6[v54] / v8;
  uint64_t v55 = v67[v54];
  int v56 = llround(v20 * (double)(int)(v18 + 128));
  v69[5] = v55;
  *(double *)&v71[6] = (double)v56 * 0.00390625;
  *(double *)&v68[6] = v12[v56] / v15;
  uint64_t v57 = v67[v56];
  *(double *)&v70[6] = v6[v56] / v8;
  v69[6] = v57;
  v63 = v71;
  v64 = v68;
  v65 = v70;
  v66 = v69;
  do
  {
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    v60 = (&v63)[v52];
    do
    {
      a3[result] = *(double *)&v60[v59];
      v61 = &a3[result++ + 2];
      uint64_t v62 = v58;
      do
      {
        a3[result] = *(double *)&v60[v59] - *(double *)((char *)v60 + v62);
        double *v61 = *(double *)&v60[v59] * *(double *)((char *)v60 + v62);
        v61 += 2;
        result += 2;
        v62 += 8;
      }
      while (v62 != 56);
      ++v59;
      v58 += 8;
    }
    while (v59 != 7);
    ++v52;
  }
  while (v52 != 4);
  return result;
}

- (id)shadow
{
  if (!self->lumHist) {
    return 0;
  }
  objc_msgSend(-[CIEnhancementCalculation rawShadow](self, "rawShadow"), "doubleValue");
  double v3 = fmax(tanh(fmin(fmax(v2, 0.0), 1.0)) * 0.6, 0.0);
  uint64_t v4 = NSNumber;

  return (id)[v4 numberWithDouble:v3];
}

- (id)rawShadow
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->lumHist) {
    return 0;
  }
  bzero(v10, 0xC80uLL);
  [(CIEnhancementCalculation *)self putShadowsAnalysisInto:v10];
  uint64_t v3 = 0;
  double v4 = 0.0;
  do
  {
    float64x2_t v5 = vmulq_f64((float64x2_t)xmmword_193957918[v3], *(float64x2_t *)&v10[v3 * 16]);
    double v4 = v4 + v5.f64[0] + v5.f64[1];
    ++v3;
  }
  while (v3 != 126);
  double maxShadow = self->maxShadow;
  double v7 = fmax(self->minShadow, fmin(maxShadow, v4));
  double exposureValueAtZeroShadow = self->exposureValueAtZeroShadow;
  if (exposureValueAtZeroShadow > 0.0) {
    double v7 = fmin(v7, fmax(maxShadow * (1.0 - self->exposureValue / exposureValueAtZeroShadow), 0.0));
  }
  return (id)[NSNumber numberWithDouble:v7];
}

- (void)downSampleHistogram:(id)a3 to:(unsigned int)a4 storeIn:(double *)a5
{
  uint64_t v7 = [a3 values];
  if (a4)
  {
    uint64_t v8 = 0;
    int v9 = 0;
    do
    {
      uint64_t v10 = v8 + 1;
      double v11 = floor(256.0 / (double)a4 * (double)(v8 + 1));
      double v12 = 0.0;
      if (v11 > (double)v9)
      {
        uint64_t v13 = (double *)(v7 + 8 * v9);
        do
        {
          double v14 = *v13++;
          double v12 = v12 + v14;
          ++v9;
        }
        while (v11 > (double)v9);
      }
      a5[v8++] = v12;
    }
    while (v10 != a4);
  }
}

- (void)printHistogram:(id)a3 downsampledTo:(unsigned int)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  float64x2_t v5 = (double *)((char *)v8 - ((8 * a4 + 15) & 0xFFFFFFFF0));
  -[CIEnhancementCalculation downSampleHistogram:to:storeIn:](self, "downSampleHistogram:to:storeIn:", a3);
  if (a4)
  {
    uint64_t v6 = a4;
    do
    {
      double v7 = *v5++;
      printf("%.5f\t", v7);
      --v6;
    }
    while (v6);
  }
}

- (void)printAnalysis
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = [(CIEnhancementCalculation *)self putShadowsAnalysisInto:v6];
  if (v2 >= 1)
  {
    uint64_t v3 = v2;
    double v4 = (double *)v6;
    do
    {
      double v5 = *v4++;
      printf("%.6f\t", v5);
      --v3;
    }
    while (v3);
  }
}

- (void)printHistogramsDownsampledTo:(unsigned int)a3
{
  [(CIEnhancementCalculation *)self printAnalysis];

  putchar(10);
}

- (CIEnhancementHistogram)lumHist
{
  return self->lumHist;
}

- (CIEnhancementHistogram)rgbSumHist
{
  return self->rgbSumHist;
}

- (CIEnhancementHistogram)satHist
{
  return self->satHist;
}

- (CIEnhancementHistogram)borderHist
{
  return self->borderHist;
}

@end