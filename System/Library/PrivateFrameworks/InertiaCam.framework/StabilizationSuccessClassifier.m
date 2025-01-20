@interface StabilizationSuccessClassifier
- (BOOL)testForHomographies:(const void *)a3 movieSize:(Int32Size)a4 firstIndex:(int)a5 lastIndex:(int)a6 scoreThreshold:(float)a7 errorOut:(id *)a8 verbose:(BOOL)a9;
- (StabilizationSuccessClassifier)init;
- (float)calcLogisticForStats:(id)a3 paramsForStats:(id)a4 error:(id *)a5;
- (float)lastClassifierScore;
- (id)applyClassifierToOverlappedSegments:(void *)a3 withCoefficientsDict:(id)a4 movieSize:(Int32Size)a5 firstIndex:(int)a6 lastIndex:(int)a7 stride:(int)a8 length:(int)a9 result:(float *)a10 verbose:(BOOL)a11 minThreshold:(float)a12;
- (id)calcStatsDictForArray:(id)a3 withKey:(id)a4 firstIndex:(int)a5 lastIndex:(int)a6 usingTempStorage:(void *)a7 outErr:(id *)a8;
- (id)classifySequentialAnalysisSuccess:(void *)a3 movieSize:(Int32Size)a4 precalcedFeatures:(id)a5 result:(float *)a6;
- (id)getDefaultParamDict;
- (id)getSequentialAnalysisCoeffsDict;
- (id)getSequentialParamDict;
- (id)getTripodCorrectionParamDict;
- (id)statsDictFromFrameArray:(id)a3 firstIndex:(int)a4 lastIndex:(int)a5 errorOut:(id *)a6;
- (int)classifierMode;
- (unint64_t)subsegmentLength;
- (unint64_t)subsegmentStep;
- (void)AddStats:(StabStatsRecord *)a3 toDict:(id)a4 withBaseName:(id)a5;
- (void)setClassifierMode:(int)a3;
- (void)setSubsegmentLength:(unint64_t)a3;
- (void)setSubsegmentStep:(unint64_t)a3;
@end

@implementation StabilizationSuccessClassifier

- (StabilizationSuccessClassifier)init
{
  self->classifierMode = 444;
  *(_OWORD *)&self->subsegmentLength = xmmword_1DD512530;
  self->lastClassifierScore = 0.0;
  return self;
}

- (float)calcLogisticForStats:(id)a3 paramsForStats:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = a4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v30;
    double v11 = 0.0;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * v12);
      v14 = objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v29);
      v15 = [v7 objectForKeyedSubscript:v13];
      v16 = v15;
      if (!v15) {
        break;
      }
      [v15 doubleValue];
      double v18 = v17;
      v19 = [v14 objectAtIndexedSubscript:0];
      [v19 doubleValue];
      double v21 = v20;

      v22 = [v14 objectAtIndexedSubscript:1];
      [v22 doubleValue];
      double v24 = v23;

      double v11 = v11 + (v18 - v21) * v24;
      if (v9 == ++v12)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
    v25 = [MEMORY[0x1E4F28C58] errorWithDomain:qword_1EAB53A58 code:555200 userInfo:0];

    if (!v25) {
      goto LABEL_15;
    }
    float v26 = NAN;
    if (!a5) {
      goto LABEL_17;
    }
LABEL_16:
    *a5 = v25;
    goto LABEL_17;
  }
  double v11 = 0.0;
LABEL_14:

LABEL_15:
  long double v27 = exp(v11);
  v25 = 0;
  float v26 = v27 / (v27 + 1.0);
  if (a5) {
    goto LABEL_16;
  }
LABEL_17:

  return v26;
}

- (id)getSequentialParamDict
{
  return &unk_1F38B9180;
}

- (id)getTripodCorrectionParamDict
{
  return &unk_1F38B91A8;
}

- (id)getSequentialAnalysisCoeffsDict
{
  return &unk_1F38B91D0;
}

- (id)getDefaultParamDict
{
  int classifierMode = self->classifierMode;
  if (classifierMode == 445)
  {
    v3 = [(StabilizationSuccessClassifier *)self getSequentialParamDict];
  }
  else if (classifierMode == 444)
  {
    v3 = [(StabilizationSuccessClassifier *)self getTripodCorrectionParamDict];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)AddStats:(StabStatsRecord *)a3 toDict:(id)a4 withBaseName:(id)a5
{
  id v22 = a4;
  id v7 = a5;
  id v8 = [NSNumber numberWithDouble:a3->var1];
  uint64_t v9 = [v7 stringByAppendingString:@"_min"];
  [v22 setObject:v8 forKeyedSubscript:v9];

  uint64_t v10 = [NSNumber numberWithDouble:a3->var2];
  double v11 = [v7 stringByAppendingString:@"_max"];
  [v22 setObject:v10 forKeyedSubscript:v11];

  uint64_t v12 = [NSNumber numberWithDouble:a3->var0];
  uint64_t v13 = [v7 stringByAppendingString:@"_mean"];
  [v22 setObject:v12 forKeyedSubscript:v13];

  v14 = [NSNumber numberWithDouble:a3->var3];
  v15 = [v7 stringByAppendingString:@"_std"];
  [v22 setObject:v14 forKeyedSubscript:v15];

  v16 = [NSNumber numberWithDouble:a3->var4];
  double v17 = [v7 stringByAppendingString:@"_absmax"];
  [v22 setObject:v16 forKeyedSubscript:v17];

  double v18 = [NSNumber numberWithDouble:a3->var2 - a3->var1];
  v19 = [v7 stringByAppendingString:@"_range"];
  [v22 setObject:v18 forKeyedSubscript:v19];

  double v20 = [NSNumber numberWithDouble:a3->var5];
  double v21 = [v7 stringByAppendingString:@"_rms"];
  [v22 setObject:v20 forKeyedSubscript:v21];
}

- (id)calcStatsDictForArray:(id)a3 withKey:(id)a4 firstIndex:(int)a5 lastIndex:(int)a6 usingTempStorage:(void *)a7 outErr:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  if (a5 < 0
    || [v14 count] <= (unint64_t)a5
    || (int v16 = a6 - a5, a6 < a5)
    || a6 < 0
    || [v14 count] <= (unint64_t)a6)
  {
    double v24 = [MEMORY[0x1E4F28C58] errorWithDomain:qword_1EAB53A58 code:555201 userInfo:0];
    double v17 = 0;
  }
  else
  {
    double v17 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    v28 = a8;
    long long v29 = self;
    uint64_t v18 = (v16 + 1);
    sub_1DD4C1D4C((uint64_t)a7, (int)v18);
    uint64_t v19 = 0;
    while (1)
    {
      double v20 = objc_msgSend(v14, "objectAtIndexedSubscript:", a5 + v19, v28);
      double v21 = [v20 objectForKeyedSubscript:v15];
      id v22 = v21;
      if (!v21) {
        break;
      }
      [v21 floatValue];
      *(double *)(*(void *)a7 + 8 * v19) = v23;

      if (v18 == ++v19)
      {
        double v24 = 0;
        goto LABEL_18;
      }
    }
    double v24 = [MEMORY[0x1E4F28C58] errorWithDomain:qword_1EAB53A58 code:555202 userInfo:0];

LABEL_18:
    -[StabilizationSuccessClassifier AddStats:toDict:withBaseName:](v29, "AddStats:toDict:withBaseName:", v36, v17, v15, sub_1DD4EC1E8((double **)a7, v36));
    v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    sub_1DD4EC2A8(a7, (double **)&v33);
    float v26 = objc_msgSend(v15, "stringByAppendingString:", @"_delta", sub_1DD4EC1E8((double **)&v33, v36));
    [(StabilizationSuccessClassifier *)v29 AddStats:v36 toDict:v17 withBaseName:v26];
    a8 = v28;

    __p = 0;
    long long v31 = 0;
    uint64_t v32 = 0;
    sub_1DD4EC2A8(&v33, (double **)&__p);
    long double v27 = objc_msgSend(v15, "stringByAppendingString:", @"_2ndderiv", sub_1DD4EC1E8((double **)&__p, v36));
    [(StabilizationSuccessClassifier *)v29 AddStats:v36 toDict:v17 withBaseName:v27];

    if (__p)
    {
      long long v31 = __p;
      operator delete(__p);
    }
    if (v33)
    {
      uint64_t v34 = v33;
      operator delete(v33);
    }
  }
  if (v24)
  {

    double v17 = 0;
    if (a8) {
      *a8 = v24;
    }
  }

  return v17;
}

- (id)statsDictFromFrameArray:(id)a3 firstIndex:(int)a4 lastIndex:(int)a5 errorOut:(id *)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  if ((v7 & 0x80000000) != 0
    || [v9 count] <= (unint64_t)v7
    || (int)v7 > (int)v6
    || (v6 & 0x80000000) != 0
    || [v9 count] <= (unint64_t)v6)
  {
    double v17 = [MEMORY[0x1E4F28C58] errorWithDomain:qword_1EAB53A58 code:555201 userInfo:0];
  }
  else
  {
    uint64_t v19 = [v9 objectAtIndexedSubscript:v7];
    [v19 allKeys];
    __p = 0;
    v28 = 0;
    uint64_t v29 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v22 = 0;
          id v15 = [(StabilizationSuccessClassifier *)self calcStatsDictForArray:v9 withKey:v14 firstIndex:v7 lastIndex:v6 usingTempStorage:&__p outErr:&v22];
          id v16 = v22;
          if (v16)
          {
            double v17 = v16;

            goto LABEL_23;
          }
          [v10 addEntriesFromDictionary:v15];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    double v17 = 0;
LABEL_23:

    [v10 setObject:&unk_1F38B8260 forKeyedSubscript:@"_intercept"];
    if (__p)
    {
      v28 = __p;
      operator delete(__p);
    }
  }
  if (v17)
  {

    uint64_t v10 = 0;
    if (a6) {
      *a6 = v17;
    }
  }

  return v10;
}

- (BOOL)testForHomographies:(const void *)a3 movieSize:(Int32Size)a4 firstIndex:(int)a5 lastIndex:(int)a6 scoreThreshold:(float)a7 errorOut:(id *)a8 verbose:(BOOL)a9
{
  BOOL v29 = a9;
  self->float lastClassifierScore = 0.0;
  uint64_t v11 = sub_1DD4AF32C((uint64_t *)a3, *(void *)&a4, a5, a6);
  long long v30 = [(StabilizationSuccessClassifier *)self getDefaultParamDict];
  uint64_t v12 = 0;
  char v13 = 1;
  char v14 = 1;
  while (1)
  {
    int subsegmentLength = self->subsegmentLength;
    uint64_t v16 = [v11 count];
    int v17 = v12 + subsegmentLength;
    int v18 = v17 - 1;
    unint64_t v19 = v16 - 1;
    if (v16 - 1 <= (unint64_t)(v17 - 1))
    {
      int v21 = [v11 count] - 1;
      uint64_t v12 = (v12 - v18 + v21) & ~(((int)v12 - v18 + v21) >> 31);
      uint64_t v20 = v21 & ~(v21 >> 31);
    }
    else
    {
      uint64_t v20 = (v17 - 1);
    }
    id v32 = 0;
    id v22 = [(StabilizationSuccessClassifier *)self statsDictFromFrameArray:v11 firstIndex:v12 lastIndex:v20 errorOut:&v32];
    id v23 = v32;
    if (v23) {
      break;
    }
    id v31 = 0;
    [(StabilizationSuccessClassifier *)self calcLogisticForStats:v22 paramsForStats:v30 error:&v31];
    float v25 = v24;
    id v23 = v31;
    if (v29) {
      NSLog(&cfstr_SubsegmentClas.isa, v12, v20, v25);
    }
    float lastClassifierScore = v25;
    if ((v14 & 1) == 0)
    {
      float lastClassifierScore = self->lastClassifierScore;
      if (v25 < lastClassifierScore) {
        float lastClassifierScore = v25;
      }
    }
    self->float lastClassifierScore = lastClassifierScore;
    v13 &= v25 >= a7;
    if (v19 <= v18 || [v11 count] - 1 == (int)v20) {
      break;
    }
    uint64_t v12 = (v12 + LODWORD(self->subsegmentStep));

    char v14 = 0;
    if (v23) {
      goto LABEL_16;
    }
  }

LABEL_16:
  if (a8) {
    *a8 = v23;
  }

  return v13 & 1;
}

- (id)applyClassifierToOverlappedSegments:(void *)a3 withCoefficientsDict:(id)a4 movieSize:(Int32Size)a5 firstIndex:(int)a6 lastIndex:(int)a7 stride:(int)a8 length:(int)a9 result:(float *)a10 verbose:(BOOL)a11 minThreshold:(float)a12
{
  uint64_t v18 = a9;
  id v36 = a4;
  if (a7 <= a6 || (a7 - a6 + 1 >= a9 ? (BOOL v19 = a9 <= 2) : (BOOL v19 = 1), v19))
  {
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:qword_1EAB53A58 code:555201 userInfo:0];
  }
  else
  {
    self->float lastClassifierScore = 0.0;
    v37 = sub_1DD4AF32C((uint64_t *)a3, *(void *)&a5, a6, a7);
    uint64_t v21 = 0;
    char v34 = 1;
    while (1)
    {
      unint64_t v22 = [v37 count];
      int v23 = v21 + v18;
      int v24 = v21 + v18;
      if (v22 <= (int)v21 + (int)v18)
      {
        int v25 = [v37 count];
        uint64_t v21 = (v25 - v18) & ~((v25 - (int)v18) >> 31);
        if (v25 <= 1) {
          int v24 = 1;
        }
        else {
          int v24 = v25;
        }
      }
      uint64_t v26 = v18;
      id v39 = 0;
      long double v27 = [(StabilizationSuccessClassifier *)self statsDictFromFrameArray:v37 firstIndex:v21 lastIndex:(v24 - 1) errorOut:&v39];
      id v28 = v39;
      if (v28) {
        break;
      }
      id v38 = 0;
      [(StabilizationSuccessClassifier *)self calcLogisticForStats:v27 paramsForStats:v36 error:&v38];
      float v30 = v29;
      id v31 = v38;
      if (a11) {
        NSLog(&cfstr_SubsegmentClas.isa, v21, (v24 - 1), v30);
      }
      if (!v31)
      {
        float lastClassifierScore = v30;
        if ((v34 & 1) == 0)
        {
          float lastClassifierScore = self->lastClassifierScore;
          if (v30 < lastClassifierScore) {
            float lastClassifierScore = v30;
          }
        }
        self->float lastClassifierScore = lastClassifierScore;
        if (v30 < a12) {
          break;
        }
        char v34 = 0;
      }
      if (v22 <= v23 || (uint64_t v18 = v26, [v37 count] == v24))
      {
        id v28 = v31;
        break;
      }
      uint64_t v21 = (v21 + a8);

      if (v31) {
        goto LABEL_27;
      }
    }

    id v31 = v28;
LABEL_27:
    *a10 = self->lastClassifierScore;
    id v20 = v31;
  }
  return v20;
}

- (id)classifySequentialAnalysisSuccess:(void *)a3 movieSize:(Int32Size)a4 precalcedFeatures:(id)a5 result:(float *)a6
{
  uint64_t v10 = [(StabilizationSuccessClassifier *)self getSequentialAnalysisCoeffsDict];
  if ((int)(678152731 * ((*((void *)a3 + 1) - *(void *)a3) >> 4) - 1) >= 95) {
    int v11 = 95;
  }
  else {
    int v11 = 678152731 * ((*((void *)a3 + 1) - *(void *)a3) >> 4) - 1;
  }
  LOBYTE(v15) = 1;
  LODWORD(v14) = v11;
  uint64_t v12 = -[StabilizationSuccessClassifier applyClassifierToOverlappedSegments:withCoefficientsDict:movieSize:firstIndex:lastIndex:stride:length:result:verbose:minThreshold:](self, "applyClassifierToOverlappedSegments:withCoefficientsDict:movieSize:firstIndex:lastIndex:stride:length:result:verbose:minThreshold:", a3, v10, a4, 1, 0.0, v14, a6, v15);

  return v12;
}

- (int)classifierMode
{
  return self->classifierMode;
}

- (void)setClassifierMode:(int)a3
{
  self->int classifierMode = a3;
}

- (unint64_t)subsegmentLength
{
  return self->subsegmentLength;
}

- (void)setSubsegmentLength:(unint64_t)a3
{
  self->int subsegmentLength = a3;
}

- (unint64_t)subsegmentStep
{
  return self->subsegmentStep;
}

- (void)setSubsegmentStep:(unint64_t)a3
{
  self->subsegmentStep = a3;
}

- (float)lastClassifierScore
{
  return self->lastClassifierScore;
}

@end