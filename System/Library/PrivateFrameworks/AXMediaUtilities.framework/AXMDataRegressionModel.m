@interface AXMDataRegressionModel
+ (id)getModelForX:(double *)a3 y:(double *)a4 n:(int)a5;
- (AXMDataRegressionModel)initWithXValues:(double *)a3 yValues:(double *)a4 count:(int)a5;
- (BOOL)dataSatisfiesInitialConditions;
- (BOOL)isDisqualified;
- (NSArray)partialDerivatives;
- (NSString)modelDescription;
- (double)bestFitParameters;
- (double)confidence;
- (double)error;
- (double)fitDataWithModelParams:(double *)a3 finalParams:(double *)a4;
- (double)magnitude:(double *)a3 size:(int)a4;
- (double)roundNumber:(double)a3 withSignificantFigures:(unint64_t)a4;
- (double)score;
- (double)x;
- (double)y;
- (id)modelFunction;
- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4;
- (int)getMatrixInverse:(double *)a3 size:(int)a4 pivot:(int *)a5 tmp:(double *)a6 result:(double *)a7;
- (int)iterations;
- (int)modelParameterCount;
- (int)n;
- (void)computeScore;
- (void)dealloc;
- (void)getDiagonal:(double *)a3 size:(int)a4 result:(double *)a5;
- (void)getGradientForX:(double)a3 parameterValues:(double *)a4 result:(double *)a5;
- (void)getIdentityMatrixWithSize:(int)a3 scalar:(double)a4 result:(double *)a5;
- (void)getInitialParams:(double *)a3;
- (void)getJacobianForParameters:(double *)a3 gradient:(double *)a4 result:(double *)a5;
- (void)getResidualsVector:(double *)a3 result:(double *)a4;
- (void)getSMA:(double *)a3 lookback:(int)a4;
- (void)printMatrix:(double *)a3 rows:(int)a4 cols:(int)a5;
- (void)setIsDisqualified:(BOOL)a3;
- (void)sortDataPoints;
@end

@implementation AXMDataRegressionModel

- (AXMDataRegressionModel)initWithXValues:(double *)a3 yValues:(double *)a4 count:(int)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AXMDataRegressionModel;
  v8 = [(AXMDataRegressionModel *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_n = a5;
    v8->_x = (double *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
    v9->_y = (double *)malloc_type_malloc(8 * v9->_n, 0x100004000313F17uLL);
    v9->_bestFitParameters = (double *)malloc_type_malloc(8 * [(AXMDataRegressionModel *)v9 modelParameterCount], 0x100004000313F17uLL);
    memcpy(v9->_x, a3, 8 * v9->_n);
    memcpy(v9->_y, a4, 8 * v9->_n);
    v9->_error = 1.79769313e308;
  }
  return v9;
}

- (void)dealloc
{
  free(self->_bestFitParameters);
  free(self->_x);
  free(self->_y);
  v3.receiver = self;
  v3.super_class = (Class)AXMDataRegressionModel;
  [(AXMDataRegressionModel *)&v3 dealloc];
}

- (NSString)modelDescription
{
  return 0;
}

+ (id)getModelForX:(double *)a3 y:(double *)a4 n:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v38[5] = *MEMORY[0x1E4F143B8];
  v8 = (void *)getModelForX_y_n__modelClasses;
  if (!getModelForX_y_n__modelClasses)
  {
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    v38[3] = objc_opt_class();
    v38[4] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:5];
    v10 = (void *)getModelForX_y_n__modelClasses;
    getModelForX_y_n__modelClasses = v9;

    v8 = (void *)getModelForX_y_n__modelClasses;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v13 = 0;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = (void *)[objc_alloc(*(Class *)(*((void *)&v33 + 1) + 8 * i)) initWithXValues:a3 yValues:a4 count:v5];
        v17 = malloc_type_malloc(8 * (int)[v16 modelParameterCount], 0x100004000313F17uLL);
        v18 = malloc_type_malloc(8 * (int)[v16 modelParameterCount], 0x100004000313F17uLL);
        [v16 getInitialParams:v17];
        [v16 fitDataWithModelParams:v17 finalParams:v18];
        if (([v16 isDisqualified] & 1) == 0)
        {
          if (!v13 || ([v16 score], double v20 = v19, objc_msgSend(v13, "score"), v20 < v21))
          {
            id v22 = v16;
            v23 = v13;
            uint64_t v24 = v12;
            uint64_t v25 = v14;
            v26 = a3;
            v27 = a4;
            uint64_t v28 = v5;
            id v29 = v22;

            id v30 = v29;
            uint64_t v5 = v28;
            a4 = v27;
            a3 = v26;
            uint64_t v14 = v25;
            uint64_t v12 = v24;
            v13 = v30;
          }
        }
        free(v17);
        free(v18);
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (double)confidence
{
  double result = 1.0 - self->_score;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)fitDataWithModelParams:(double *)a3 finalParams:(double *)a4
{
  if ([(AXMDataRegressionModel *)self dataSatisfiesInitialConditions])
  {
    long long v34 = a4;
    int v7 = [(AXMDataRegressionModel *)self modelParameterCount];
    __B[0] = 1.0;
    v46 = (double *)malloc_type_malloc(8 * self->_n * v7, 0x100004000313F17uLL);
    v47 = (double *)malloc_type_malloc(8 * self->_n * v7, 0x100004000313F17uLL);
    double v8 = (double)v7 * (double)v7;
    size_t v9 = vcvtd_n_u64_f64(v8, 3uLL);
    v10 = (double *)malloc_type_malloc(v9, 0x2864E889uLL);
    v45 = (double *)malloc_type_malloc(v9, 0x9E50E3DDuLL);
    __C = (double *)malloc_type_malloc(v9, 0x7DDD9EADuLL);
    long long v33 = malloc_type_malloc(v9, 0x2BEA48D2uLL);
    v32 = malloc_type_malloc(8 * self->_n * v7, 0x100004000313F17uLL);
    v43 = (double *)malloc_type_malloc(8 * v7 * self->_n, 0x84E3ADDEuLL);
    v31 = malloc_type_malloc(v9, 0x7D016862uLL);
    v42 = (double *)malloc_type_malloc(v9, 0xD8EDABDFuLL);
    uint64_t v11 = (double *)malloc_type_malloc(v9, 0xF915A36CuLL);
    uint64_t v12 = malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    v13 = (double *)malloc_type_malloc(8 * self->_n, 0x100004000313F17uLL);
    long long v36 = malloc_type_malloc(8 * self->_n, 0x100004000313F17uLL);
    v40 = malloc_type_malloc(4 * self->_n, 0x100004052888210uLL);
    v39 = malloc_type_malloc(8 * self->_n, 0x100004000313F17uLL);
    v38 = malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    long long v35 = malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    uint64_t v14 = (double *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    __uint64_t n = 8 * v7;
    memcpy(v12, a3, __n);
    [(AXMDataRegressionModel *)self getResidualsVector:v12 result:v13];
    uint64_t n = self->_n;
    if ((int)n < 1)
    {
      double v19 = 0.0;
    }
    else
    {
      double v16 = 0.0;
      v17 = v13;
      do
      {
        double v18 = *v17++;
        double v16 = v16 + v18 * v18;
        --n;
      }
      while (n);
      double v19 = v16 * 0.5;
    }
    v41 = v13;
    int v20 = 0;
    while (1)
    {
      [(AXMDataRegressionModel *)self getJacobianForParameters:v12 gradient:v38 result:v46];
      vDSP_mtransD(v46, 1, v47, 1, v7, self->_n);
      vDSP_mmulD(v47, 1, v46, 1, v10, 1, v7, v7, self->_n);
      [(AXMDataRegressionModel *)self getDiagonal:v10 size:v7 result:v45];
      vDSP_vsmulD(v45, 1, __B, __C, 1, (unint64_t)v8);
      vDSP_vaddD(v10, 1, __C, 1, v42, 1, (unint64_t)v8);
      [(AXMDataRegressionModel *)self getMatrixInverse:v42 size:v7 pivot:v40 tmp:v39 result:v11];
      if (v8 > 0.0)
      {
        uint64_t v21 = 0;
        do
        {
          v11[v21] = -v11[v21];
          ++v21;
        }
        while (v8 > (double)(int)v21);
      }
      vDSP_mmulD(v11, 1, v47, 1, v43, 1, v7, self->_n, v7);
      id v22 = v41;
      vDSP_mmulD(v43, 1, v41, 1, v14, 1, v7, 1uLL, self->_n);
      [(AXMDataRegressionModel *)self magnitude:v14 size:v7];
      double v24 = v23;
      vDSP_vaddD((const double *)v12, 1, v14, 1, (double *)v12, 1, v7);
      [(AXMDataRegressionModel *)self getResidualsVector:v12 result:v41];
      uint64_t v25 = self->_n;
      double v26 = 0.0;
      if ((int)v25 >= 1)
      {
        do
        {
          double v27 = *v22++;
          double v26 = v26 + v27 * v27;
          --v25;
        }
        while (v25);
      }
      double v28 = sqrt(v24);
      if (v28 > 0.05 || (double v29 = v26 * 0.5, v26 * 0.5 >= v19))
      {
        if (v28 > 0.05) {
          __B[0] = __B[0] * 10.0;
        }
      }
      else
      {
        vDSP_vaddD((const double *)v12, 1, v14, 1, (double *)v12, 1, v7);
        __B[0] = __B[0] / 10.0;
        double v19 = v29;
      }
      if (v28 <= 0.05 && v28 < 0.0000001) {
        break;
      }
      self->_error = v19;
      [(AXMDataRegressionModel *)self computeScore];
      if (++v20 == 15000)
      {
        int v20 = 15000;
        break;
      }
    }
    [(AXMDataRegressionModel *)self disqualifyModelIfNecessary];
    memcpy(v34, v12, __n);
    memcpy(self->_bestFitParameters, v12, __n);
    free(v46);
    free(v47);
    free(v10);
    free(v45);
    free(__C);
    free(v33);
    free(v32);
    free(v43);
    free(v31);
    free(v42);
    free(v11);
    free(v12);
    free(v41);
    free(v36);
    free(v40);
    free(v39);
    free(v38);
    free(v35);
    free(v14);
    self->_iterations = v20;
  }
  else
  {
    self->_error = 1.79769313e308;
    [(AXMDataRegressionModel *)self computeScore];
    return self->_error;
  }
  return v19;
}

- (void)printMatrix:(double *)a3 rows:(int)a4 cols:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v12 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v12, "appendFormat:", @"\n%d x %d\n", v6, v5);
  if ((int)v6 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = v5;
      v10 = a3;
      if ((int)v5 >= 1)
      {
        do
        {
          uint64_t v11 = *(void *)v10++;
          objc_msgSend(v12, "appendFormat:", @"\t%.6f", v11);
          --v9;
        }
        while (v9);
      }
      [v12 appendString:@"\n"];
      ++v8;
      a3 += v6;
    }
    while (v8 != v6);
  }
  NSLog(&stru_1F0E75070.isa, v12);
}

- (double)magnitude:(double *)a3 size:(int)a4
{
  if (a4 < 1) {
    return 0.0;
  }
  uint64_t v4 = a4;
  double result = 0.0;
  do
  {
    double v6 = *a3++;
    double result = result + v6 * v6;
    --v4;
  }
  while (v4);
  return result;
}

- (void)getIdentityMatrixWithSize:(int)a3 scalar:(double)a4 result:(double *)a5
{
  if (a3)
  {
    uint64_t v5 = 0;
    LODWORD(v6) = a3 * a3;
    if ((a3 * a3) <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v6;
    }
    do
    {
      if ((int)v5 / a3 == (int)v5 % a3) {
        double v7 = a4;
      }
      else {
        double v7 = 0.0;
      }
      a5[v5++] = v7;
    }
    while (v6 != v5);
  }
}

- (void)getResidualsVector:(double *)a3 result:(double *)a4
{
  v10 = [(AXMDataRegressionModel *)self modelFunction];
  int v7 = [(AXMDataRegressionModel *)self modelParameterCount];
  if (self->_n >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v7;
    do
    {
      a4[v8] = v10[2](v10, a3, v9, self->_x[v8]) - self->_y[v8];
      ++v8;
    }
    while (v8 < self->_n);
  }
}

- (void)getGradientForX:(double)a3 parameterValues:(double *)a4 result:(double *)a5
{
  int v9 = [(AXMDataRegressionModel *)self modelParameterCount];
  id v12 = [(AXMDataRegressionModel *)self partialDerivatives];
  if ([v12 count])
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = [v12 objectAtIndexedSubscript:v10];
      a5[v10] = ((double (**)(void, double *, void, double))v11)[2](v11, a4, v9, a3);

      ++v10;
    }
    while (v10 < [v12 count]);
  }
}

- (void)getJacobianForParameters:(double *)a3 gradient:(double *)a4 result:(double *)a5
{
  int v9 = [(AXMDataRegressionModel *)self modelParameterCount];
  if (self->_n >= 1)
  {
    int v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = 8 * v9;
    uint64_t v13 = v9;
    do
    {
      [(AXMDataRegressionModel *)self getGradientForX:a3 parameterValues:a4 result:self->_x[v11]];
      uint64_t v14 = v13;
      v15 = a4;
      double v16 = a5;
      if (v10 >= 1)
      {
        do
        {
          uint64_t v17 = *(void *)v15++;
          *(void *)v16++ = v17;
          --v14;
        }
        while (v14);
      }
      ++v11;
      a5 = (double *)((char *)a5 + v12);
    }
    while (v11 < self->_n);
  }
}

- (int)getMatrixInverse:(double *)a3 size:(int)a4 pivot:(int *)a5 tmp:(double *)a6 result:(double *)a7
{
  return 0;
}

- (void)getDiagonal:(double *)a3 size:(int)a4 result:(double *)a5
{
  if (a4 >= 1)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      for (uint64_t j = 0; j != a4; a5[j++] = v7)
      {
        double v7 = 0.0;
        if (i == j) {
          double v7 = a3[i + i * a4];
        }
      }
      a5 += a4;
    }
  }
}

- (void)computeScore
{
  uint64_t n = self->_n;
  if ((int)n < 1)
  {
    double v11 = 0.0;
  }
  else
  {
    y = self->_y;
    double v4 = 0.0;
    uint64_t v5 = y;
    uint64_t v6 = self->_n;
    do
    {
      double v7 = *v5++;
      double v4 = v4 + v7;
      --v6;
    }
    while (v6);
    double v8 = v4 / (double)(int)n;
    double v9 = 0.0;
    do
    {
      double v10 = *y++;
      double v9 = v9 + (v10 - v8) * (v10 - v8);
      --n;
    }
    while (n);
    double v11 = v9 * 0.5;
  }
  self->_score = self->_error / v11;
}

- (id)modelFunction
{
  v2 = NSStringFromSelector(a2);
  NSLog(&cfstr_SubclassesMust.isa, v2);

  return 0;
}

- (int)modelParameterCount
{
  v2 = NSStringFromSelector(a2);
  NSLog(&cfstr_SubclassesMust.isa, v2);

  return 0;
}

- (void)getInitialParams:(double *)a3
{
  int v4 = [(AXMDataRegressionModel *)self modelParameterCount];
  if (v4 >= 1)
  {
    memset_pattern16(a3, &xmmword_1B58ACFC0, 8 * v4);
  }
}

- (NSArray)partialDerivatives
{
  v2 = NSStringFromSelector(a2);
  NSLog(&cfstr_SubclassesMust.isa, v2);

  return 0;
}

- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4
{
  int v4 = NSStringFromSelector(a2);
  NSLog(&cfstr_SubclassesMust.isa, v4);

  return 0;
}

- (BOOL)dataSatisfiesInitialConditions
{
  return self->_n > 0;
}

- (void)sortDataPoints
{
  id v10 = [MEMORY[0x1E4F1CA48] array];
  if (self->_n >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      int v4 = objc_alloc_init(AXMPoint);
      [(AXMPoint *)v4 setX:self->_x[v3]];
      [(AXMPoint *)v4 setY:self->_y[v3]];
      [v10 addObject:v4];

      ++v3;
    }
    while (v3 < self->_n);
  }
  [v10 sortUsingComparator:&__block_literal_global_32];
  if (self->_n >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = [v10 objectAtIndexedSubscript:v5];
      [v6 x];
      self->_x[v5] = v7;

      double v8 = [v10 objectAtIndexedSubscript:v5];
      [v8 y];
      self->_y[v5] = v9;

      ++v5;
    }
    while (v5 < self->_n);
  }
}

uint64_t __40__AXMDataRegressionModel_sortDataPoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 x];
  double v7 = v6;
  [v5 x];
  if (v7 >= v8)
  {
    [v4 x];
    double v11 = v10;
    [v5 x];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void)getSMA:(double *)a3 lookback:(int)a4
{
  uint64_t n = self->_n;
  if ((int)n >= 1)
  {
    for (uint64_t i = 0; i != n; ++i)
    {
      if (a4 < 1)
      {
        double v7 = 0.0;
LABEL_9:
        int v8 = a4;
      }
      else
      {
        int v6 = 0;
        double v7 = 0.0;
        while ((int)i + v6 >= 0)
        {
          double v7 = v7 + self->_y[(i + v6--)];
          if ((int)i + v6 <= (int)i - a4) {
            goto LABEL_9;
          }
        }
        int v8 = -v6;
      }
      a3[i] = v7 / (double)v8;
    }
  }
}

- (double)roundNumber:(double)a3 withSignificantFigures:(unint64_t)a4
{
  long double v5 = fabs(a3);
  double v6 = floor(log10(v5)) - (double)a4 + 1.0;
  double v7 = round(v5 * __exp10(-v6));
  double v8 = __exp10(v6) * v7;
  double result = -v8;
  if (a3 >= 0.0) {
    return v8;
  }
  return result;
}

- (double)x
{
  return self->_x;
}

- (double)y
{
  return self->_y;
}

- (double)bestFitParameters
{
  return self->_bestFitParameters;
}

- (int)n
{
  return self->_n;
}

- (double)error
{
  return self->_error;
}

- (double)score
{
  return self->_score;
}

- (BOOL)isDisqualified
{
  return self->_isDisqualified;
}

- (void)setIsDisqualified:(BOOL)a3
{
  self->_isDisqualified = a3;
}

- (int)iterations
{
  return self->_iterations;
}

@end