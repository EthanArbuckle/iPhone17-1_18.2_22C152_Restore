@interface CIEnhancementCalculator
- (BOOL)curvesEnabled;
- (BOOL)faceBalanceEnabled;
- (BOOL)shadowsEnabled;
- (BOOL)vibranceEnabled;
- (CIEnhancementCalculator)init;
- (id)histogramFromRows:(id)a3 componentOffset:(unsigned int)a4;
- (id)setupFaceColorFromImage:(id)a3 usingContext:(id)a4 detectorOpts:(id)a5;
- (void)analyzeFeatures:(id)a3 usingContext:(id)a4 baseImage:(id)a5;
- (void)dealloc;
- (void)setCurvesEnabled:(BOOL)a3;
- (void)setFaceBalanceEnabled:(BOOL)a3;
- (void)setShadowsEnabled:(BOOL)a3;
- (void)setVibranceEnabled:(BOOL)a3;
- (void)setupFaceColorFromImage:(id)a3 usingContext:(id)a4 features:(id)a5;
- (void)setupHistogramsUsing:(id)a3 redIndex:(int)a4 greenIndex:(int)a5 blueIndex:(int)a6;
@end

@implementation CIEnhancementCalculator

- (CIEnhancementCalculator)init
{
  v3.receiver = self;
  v3.super_class = (Class)CIEnhancementCalculator;
  result = [(CIEnhancementCalculation *)&v3 init];
  if (result)
  {
    result->shadowsEnabled = 1;
    result->curvesEnabled = 1;
    result->vibranceEnabled = 1;
    result->faceBalanceEnabled = 1;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CIEnhancementCalculator;
  [(CIEnhancementCalculation *)&v2 dealloc];
}

- (id)histogramFromRows:(id)a3 componentOffset:(unsigned int)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [a3 width];
  unint64_t v7 = [a3 height];
  int v8 = [a3 bytesPerPixel];
  bzero(v20, 0x800uLL);
  if (v7)
  {
    for (unint64_t i = 0; i < v7; unint64_t i = (i + 1))
    {
      uint64_t v10 = [a3 rowAtIndex:i];
      if (v6)
      {
        unsigned int v11 = 0;
        unsigned int v12 = 1;
        do
        {
          uint64_t v13 = *(unsigned __int8 *)(v10 + a4 + v11);
          v20[v13] = v20[v13] + 1.0;
          v11 += v8;
        }
        while (v6 > v12++);
      }
    }
  }
  uint64_t v15 = 0;
  double v16 = 0.0;
  do
    double v16 = v16 + v20[v15++];
  while (v15 != 256);
  uint64_t v17 = 0;
  float64x2_t v18 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v16, 0);
  do
  {
    *(float64x2_t *)&v20[v17] = vdivq_f64(*(float64x2_t *)&v20[v17], v18);
    v17 += 2;
  }
  while (v17 != 256);
  return +[CIEnhancementHistogram histogramFromData:v20];
}

- (void)setupHistogramsUsing:(id)a3 redIndex:(int)a4 greenIndex:(int)a5 blueIndex:(int)a6
{
  uint64_t v6 = MEMORY[0x1F4188790](self, a2, a3, *(void *)&a4, *(void *)&a5, *(void *)&a6);
  int v8 = v7;
  int v10 = v9;
  int v12 = v11;
  v14 = v13;
  v56 = (void *)v6;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  bzero(v62, 0x800uLL);
  bzero(v61, 0x800uLL);
  bzero(v60, 0x800uLL);
  int v15 = [v14 bytesPerPixel];
  bzero(v59, 0x800uLL);
  uint64_t v16 = [v14 width];
  v58 = v14;
  unint64_t v57 = [v14 height];
  if (v57)
  {
    uint64_t v17 = v16;
    unint64_t v18 = 0;
    uint64_t v19 = v8;
    unint64_t v20 = v17 - 1;
    do
    {
      uint64_t v21 = [v58 rowAtIndex:v18];
      if (v20)
      {
        unsigned int v25 = 0;
        LOBYTE(v22) = *(unsigned char *)(v21 + v19);
        LOBYTE(v23) = *(unsigned char *)(v21 + v12);
        LOBYTE(v24) = *(unsigned char *)(v21 + v10);
        double v26 = (double)v24 * 0.7 + (double)v23 * 0.2;
        LOBYTE(v27) = llround(v26 + (double)v22 * 0.1);
        do
        {
          uint64_t v28 = v21 + v25 * v15;
          unsigned int v29 = *(unsigned __int8 *)(v28 + v12);
          v59[*(unsigned __int8 *)(v28 + v12)] = v59[*(unsigned __int8 *)(v28 + v12)] + 1.0;
          unsigned int v30 = *(unsigned __int8 *)(v28 + v10);
          v59[*(unsigned __int8 *)(v28 + v10)] = v59[*(unsigned __int8 *)(v28 + v10)] + 1.0;
          unsigned int v31 = *(unsigned __int8 *)(v28 + v19);
          double v32 = v59[v31] + 1.0;
          v59[v31] = v32;
          LOBYTE(v36) = v27;
          uint64_t v33 = v21 + ++v25 * v15;
          LOBYTE(v32) = *(unsigned char *)(v33 + v12);
          LOBYTE(v26) = *(unsigned char *)(v33 + v10);
          *(double *)&unint64_t v34 = (double)*(unint64_t *)&v26 * 0.7;
          double v35 = *(double *)&v34 + (double)*(unint64_t *)&v32 * 0.2;
          LOBYTE(v34) = *(unsigned char *)(v33 + v19);
          double v26 = (double)v34;
          unsigned int v27 = llround(v35 + v26 * 0.1);
          *(double *)&v62[8 * v36] = *(double *)&v62[8 * v36] + 1.0;
          unsigned int v36 = v36;
          if (v36 >= v27) {
            unsigned int v37 = v27;
          }
          else {
            unsigned int v37 = v36;
          }
          if (v36 <= v27) {
            unsigned int v36 = v27;
          }
          unsigned int v38 = v37 + 1;
          if (v38 < v36)
          {
            do
            {
              *(double *)&v61[8 * (__int16)v38] = *(double *)&v61[8 * (__int16)v38] + 1.0;
              ++v38;
            }
            while ((int)v36 > (__int16)v38);
          }
          if (v30 <= v31) {
            unsigned int v39 = v31;
          }
          else {
            unsigned int v39 = v30;
          }
          if (v29 > v39) {
            unsigned int v39 = v29;
          }
          if (v39 == v31)
          {
            if (v31 != v29 || (LOBYTE(v39) = v31, v31 != v30))
            {
              LOBYTE(v39) = 2 * v31;
              if (2 * v31 >= 0xFF) {
                LOBYTE(v39) = -1;
              }
            }
          }
          if (v30 >= v31) {
            unsigned int v30 = v31;
          }
          if (v29 >= v30) {
            LOBYTE(v29) = v30;
          }
          v60[(v39 - v29)] = v60[(v39 - v29)] + 1.0;
        }
        while (v20 > v25);
      }
      unint64_t v18 = (v18 + 1);
    }
    while (v57 > v18);
  }
  uint64_t v40 = 0;
  double v41 = 0.0;
  do
    double v41 = v41 + v59[v40++];
  while (v40 != 256);
  uint64_t v42 = 0;
  float64x2_t v43 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v41, 0);
  do
  {
    *(float64x2_t *)&v59[v42] = vdivq_f64(*(float64x2_t *)&v59[v42], v43);
    v42 += 2;
  }
  while (v42 != 256);
  objc_msgSend(v56, "setRGBSumHistogram:", +[CIEnhancementHistogram histogramFromData:](CIEnhancementHistogram, "histogramFromData:", v59));
  uint64_t v44 = 0;
  double v45 = 0.0;
  do
  {
    double v45 = v45 + *(double *)&v62[v44];
    v44 += 8;
  }
  while (v44 != 2048);
  uint64_t v46 = 0;
  float64x2_t v47 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v45, 0);
  do
  {
    *(float64x2_t *)&v62[v46] = vdivq_f64(*(float64x2_t *)&v62[v46], v47);
    v46 += 16;
  }
  while (v46 != 2048);
  objc_msgSend(v56, "setLuminanceHistogram:", +[CIEnhancementHistogram histogramFromData:](CIEnhancementHistogram, "histogramFromData:", v62));
  uint64_t v48 = 0;
  double v49 = 0.0;
  do
  {
    double v49 = v49 + *(double *)&v61[v48];
    v48 += 8;
  }
  while (v48 != 2048);
  uint64_t v50 = 0;
  float64x2_t v51 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v49, 0);
  do
  {
    *(float64x2_t *)&v61[v50] = vdivq_f64(*(float64x2_t *)&v61[v50], v51);
    v50 += 16;
  }
  while (v50 != 2048);
  objc_msgSend(v56, "setBorderHistogram:", +[CIEnhancementHistogram histogramFromData:](CIEnhancementHistogram, "histogramFromData:", v61));
  uint64_t v52 = 0;
  double v53 = 0.0;
  do
    double v53 = v53 + v60[v52++];
  while (v52 != 256);
  uint64_t v54 = 0;
  float64x2_t v55 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v53, 0);
  do
  {
    *(float64x2_t *)&v60[v54] = vdivq_f64(*(float64x2_t *)&v60[v54], v55);
    v54 += 2;
  }
  while (v54 != 256);
  objc_msgSend(v56, "setSaturationHistogram:", +[CIEnhancementHistogram histogramFromData:](CIEnhancementHistogram, "histogramFromData:", v60));
}

- (void)analyzeFeatures:(id)a3 usingContext:(id)a4 baseImage:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v9 = [a3 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unint64_t v34 = self;
      uint64_t v11 = *(void *)v38;
      double v12 = 0.0;
      double v13 = 0.0;
      double v14 = 0.0;
      while (1)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(a3);
          }
          uint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [CIAutoEnhanceFace alloc];
            [v16 bounds];
            unint64_t v18 = -[CIAutoEnhanceFace initWithBounds:andImage:usingContext:](v17, "initWithBounds:andImage:usingContext:", a5, a4);
            __x.origin.long double x = 0.0;
            [(CIAutoEnhanceFace *)v18 I];
            double v20 = v19;
            [(CIAutoEnhanceFace *)v18 Q];
            +[CIEnhancementCalculation bestWarmthForI:&__x q:v20 percentChange:v21];
            if (__x.origin.x < 4.3)
            {
              int v22 = [(CIAutoEnhanceFace *)v18 size];
              double v23 = (double)([(CIAutoEnhanceFace *)v18 size] * v22);
              long double x = __x.origin.x;
              goto LABEL_10;
            }
            goto LABEL_11;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFDictionaryRef v28 = (const __CFDictionary *)[v16 valueForKey:@"bounds"];
            memset(&__x, 0, sizeof(__x));
            if (v28)
            {
              if (CGRectMakeWithDictionaryRepresentation(v28, &__x))
              {
                unsigned int v29 = [CIAutoEnhanceFace alloc];
                unint64_t v18 = -[CIAutoEnhanceFace initWithBounds:andImage:usingContext:](v29, "initWithBounds:andImage:usingContext:", a5, a4, __x.origin.x, __x.origin.y, *(_OWORD *)&__x.size);
                double v35 = 0.0;
                [(CIAutoEnhanceFace *)v18 I];
                double v31 = v30;
                [(CIAutoEnhanceFace *)v18 Q];
                +[CIEnhancementCalculation bestWarmthForI:&v35 q:v31 percentChange:v32];
                if (v35 < 4.3)
                {
                  int v33 = [(CIAutoEnhanceFace *)v18 size];
                  double v23 = (double)([(CIAutoEnhanceFace *)v18 size] * v33);
                  long double x = v35;
LABEL_10:
                  double v25 = fmin(1.0 / fmax(pow(x, 3.0), 0.0001), 1.0) * v23;
                  double v12 = v12 + v25;
                  [(CIAutoEnhanceFace *)v18 I];
                  double v14 = v14 + v25 * v26;
                  [(CIAutoEnhanceFace *)v18 Q];
                  double v13 = v13 + v25 * v27;
                }
LABEL_11:

                continue;
              }
            }
          }
        }
        uint64_t v10 = [a3 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (!v10)
        {
          if (v12 > 0.0) {
            [(CIEnhancementCalculation *)v34 setFaceColorFromChromaI:v14 / v12 andChromaQ:v13 / v12];
          }
          return;
        }
      }
    }
  }
}

- (id)setupFaceColorFromImage:(id)a3 usingContext:(id)a4 detectorOpts:(id)a5
{
  int v8 = [+[CIDetector detectorOfType:context:options:](CIDetector, "detectorOfType:context:options:", @"CIDetectorTypeFace") featuresInImage:a3 options:a5];
  [(CIEnhancementCalculator *)self analyzeFeatures:v8 usingContext:a4 baseImage:a3];
  return v8;
}

- (void)setupFaceColorFromImage:(id)a3 usingContext:(id)a4 features:(id)a5
{
}

- (BOOL)faceBalanceEnabled
{
  return self->faceBalanceEnabled;
}

- (void)setFaceBalanceEnabled:(BOOL)a3
{
  self->faceBalanceEnabled = a3;
}

- (BOOL)vibranceEnabled
{
  return self->vibranceEnabled;
}

- (void)setVibranceEnabled:(BOOL)a3
{
  self->vibranceEnabled = a3;
}

- (BOOL)curvesEnabled
{
  return self->curvesEnabled;
}

- (void)setCurvesEnabled:(BOOL)a3
{
  self->curvesEnabled = a3;
}

- (BOOL)shadowsEnabled
{
  return self->shadowsEnabled;
}

- (void)setShadowsEnabled:(BOOL)a3
{
  self->shadowsEnabled = a3;
}

@end