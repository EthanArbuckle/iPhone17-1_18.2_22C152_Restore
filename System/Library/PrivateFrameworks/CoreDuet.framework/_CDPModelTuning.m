@interface _CDPModelTuning
+ (id)f1Score;
+ (id)f2Score;
+ (id)fScoreWithBeta:(float)a3;
+ (unsigned)_newSetDifference:(unsigned int *)a3 setLength:(unint64_t)a4 subset:(unsigned int *)a5 subsetLength:(unint64_t)a6;
+ (void)_addArray:(float *)a3 size:(unint64_t)a4 inArray:(float *)a5;
+ (void)_cumulativeSumOfArray:(float *)a3 size:(unint64_t)a4 reverse:(BOOL)a5;
+ (void)_enumerateSubsetsOfSet:(unsigned int *)a3 setLength:(unint64_t)a4 index:(unint64_t)a5 subset:(unsigned int *)a6 subsetLength:(unint64_t)a7 index:(unint64_t)a8 callback:(id)a9;
+ (void)_enumerateSubsetsOfSet:(unsigned int *)a3 setLength:(unint64_t)a4 withSize:(unint64_t)a5 callback:(id)a6;
- (NSIndexSet)testIndices;
- (_CDPModelTuningState)currentState;
- (_CDPSimpleModel)model;
- (float)_testModelWithThreshold:(float *)a3;
- (id)heartBeat;
- (id)scorer;
- (int)numberOfGridTests;
- (void)resumeTuningWithState:(id)a3;
- (void)setHeartBeat:(id)a3;
- (void)setModel:(id)a3;
- (void)setScorer:(id)a3;
- (void)setTestIndices:(id)a3;
@end

@implementation _CDPModelTuning

+ (id)f1Score
{
  LODWORD(v2) = 1.0;
  return (id)[a1 fScoreWithBeta:v2];
}

+ (id)f2Score
{
  LODWORD(v2) = 2.0;
  return (id)[a1 fScoreWithBeta:v2];
}

+ (id)fScoreWithBeta:(float)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34___CDPModelTuning_fScoreWithBeta___block_invoke;
  v5[3] = &__block_descriptor_36_e11_f16__0f8f12l;
  float v6 = a3;
  v3 = (void *)MEMORY[0x192FB31A0](v5, a2);
  return v3;
}

- (void)resumeTuningWithState:(id)a3
{
  *(void *)&v31[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[_CDPModelTuningState initialTuningState];
  }
  v5 = (_CDPModelTuningState *)[v4 copy];
  currentState = self->_currentState;
  self->_currentState = v5;

  [(_CDPModelTuningState *)self->_currentState setI:0];
  if ([(_CDPModelTuningState *)self->_currentState i] <= 8)
  {
    v7 = MEMORY[0x1E4F14500];
    while (1)
    {
      int v8 = [(_CDPModelTuningState *)self->_currentState i];
      [(_CDPModelTuningState *)self->_currentState setJ:0];
      if ([(_CDPModelTuningState *)self->_currentState j] <= 8) {
        break;
      }
LABEL_6:
      [(_CDPModelTuningState *)self->_currentState setI:[(_CDPModelTuningState *)self->_currentState i] + 1];
      if ([(_CDPModelTuningState *)self->_currentState i] >= 9) {
        goto LABEL_20;
      }
    }
    float v9 = (float)((float)v8 * 0.46111) + 0.0;
    float v10 = exp(v9);
    while (1)
    {
      [(_CDPModelTuningState *)self->_currentState progress];
      float v12 = v11;
      [v4 progress];
      if (v12 > v13)
      {
        float v14 = (float)((float)[(_CDPModelTuningState *)self->_currentState j] * 2.4375) + 0.5;
        *(float *)&double v15 = v10;
        *(float *)&double v16 = v14;
        [(_CDPSimpleModel *)self->_model setLambda:v15 w0:v16];
        float v29 = 0.0;
        [(_CDPModelTuning *)self _testModelWithThreshold:&v29];
        float v18 = v17;
        [(_CDPModelTuningState *)self->_currentState bestScore];
        if (v18 > v19)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            [(_CDPModelTuning *)buf resumeTuningWithState:v18];
          }
          *(float *)&double v20 = v9;
          [(_CDPModelTuningState *)self->_currentState setBestLogLambda:v20];
          *(float *)&double v21 = v14;
          [(_CDPModelTuningState *)self->_currentState setBestW0:v21];
          *(float *)&double v22 = v29;
          [(_CDPModelTuningState *)self->_currentState setBestThreshold:v22];
          *(float *)&double v23 = v18;
          [(_CDPModelTuningState *)self->_currentState setBestScore:v23];
        }
        v24 = [(_CDPModelTuning *)self heartBeat];

        if (v24)
        {
          char v28 = 0;
          v25 = [(_CDPModelTuning *)self heartBeat];
          float v26 = v29;
          [(_CDPModelTuningState *)self->_currentState progress];
          ((void (**)(void, _CDPModelTuning *, char *, float, float, float, float, float))v25)[2](v25, self, &v28, v10, v14, v26, v18, v27);

          if (v28) {
            break;
          }
        }
      }
      [(_CDPModelTuningState *)self->_currentState setJ:[(_CDPModelTuningState *)self->_currentState j] + 1];
      if ([(_CDPModelTuningState *)self->_currentState j] >= 9) {
        goto LABEL_6;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[_CDPModelTuning resumeTuningWithState:]();
    }
  }
LABEL_20:
}

+ (void)_enumerateSubsetsOfSet:(unsigned int *)a3 setLength:(unint64_t)a4 index:(unint64_t)a5 subset:(unsigned int *)a6 subsetLength:(unint64_t)a7 index:(unint64_t)a8 callback:(id)a9
{
  id v16 = a9;
  id v19 = v16;
  if (a8 == a7)
  {
    (*((void (**)(id, unsigned int *, unint64_t))v16 + 2))(v16, a6, a8);
  }
  else
  {
    int v17 = a4 - a5;
    a6[a8] = a3[a5];
    unint64_t v18 = a5 + 1;
    [a1 _enumerateSubsetsOfSet:a3 setLength:a4 index:v18 subset:a6 subsetLength:a7 index:a8 + 1 callback:v16];
    if ((int)a7 - (int)a8 < v17) {
      [a1 _enumerateSubsetsOfSet:a3 setLength:a4 index:v18 subset:a6 subsetLength:a7 index:a8 callback:v19];
    }
  }
}

+ (void)_enumerateSubsetsOfSet:(unsigned int *)a3 setLength:(unint64_t)a4 withSize:(unint64_t)a5 callback:(id)a6
{
  id v10 = a6;
  float v11 = malloc_type_calloc(a5, 4uLL, 0x100004052888210uLL);
  [a1 _enumerateSubsetsOfSet:a3 setLength:a4 index:0 subset:v11 subsetLength:a5 index:0 callback:v10];

  free(v11);
}

+ (unsigned)_newSetDifference:(unsigned int *)a3 setLength:(unint64_t)a4 subset:(unsigned int *)a5 subsetLength:(unint64_t)a6
{
  unint64_t v8 = a4;
  result = (unsigned int *)malloc_type_calloc(a4 - a6, 4uLL, 0x100004052888210uLL);
  if (v8)
  {
    int v11 = 0;
    int v12 = 0;
    do
    {
      unsigned int v14 = *a3++;
      unsigned int v13 = v14;
      if (v12 < a6 && v13 == a5[v12]) {
        ++v12;
      }
      else {
        result[v11++] = v13;
      }
      --v8;
    }
    while (v8);
  }
  return result;
}

+ (void)_cumulativeSumOfArray:(float *)a3 size:(unint64_t)a4 reverse:(BOOL)a5
{
  uint64_t v5 = (int)a4 - 1;
  if (a5) {
    vDSP_Stride v6 = -1;
  }
  else {
    vDSP_Stride v6 = 1;
  }
  if (!a5) {
    uint64_t v5 = 0;
  }
  v7 = &a3[v5];
  float v8 = *v7;
  v7[v6] = *v7 + v7[v6];
  float __S = 1.0;
  vDSP_vrsum(v7, v6, &__S, v7, v6, a4);
  float *v7 = v8;
}

+ (void)_addArray:(float *)a3 size:(unint64_t)a4 inArray:(float *)a5
{
}

- (float)_testModelWithThreshold:(float *)a3
{
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __43___CDPModelTuning__testModelWithThreshold___block_invoke;
  v37[3] = &__block_descriptor_40_e8_f12__0i8l;
  v37[4] = 0x3F00106400000000;
  uint64_t v5 = (float (**)(void, void))MEMORY[0x192FB31A0](v37, a2);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __43___CDPModelTuning__testModelWithThreshold___block_invoke_2;
  v36[3] = &__block_descriptor_48_e8_q12__0f8l;
  v36[4] = 2000;
  v36[5] = 0x3F00106400000000;
  vDSP_Stride v6 = (void *)MEMORY[0x192FB31A0](v36);
  unint64_t v7 = [(_CDPSimpleModel *)self->_model nPeople];
  float v8 = (float *)malloc_type_calloc(0x7D0uLL, 4uLL, 0x100004052888210uLL);
  float v9 = (float *)malloc_type_calloc(0x7D0uLL, 4uLL, 0x100004052888210uLL);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  id v10 = [(_CDPModelTuning *)self testIndices];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  double v22 = __43___CDPModelTuning__testModelWithThreshold___block_invoke_3;
  double v23 = &unk_1E560E740;
  v24 = self;
  uint64_t v27 = 2000;
  id v11 = v6;
  char v28 = v8;
  unint64_t v29 = v7;
  int v31 = 1056968804;
  v30 = v9;
  id v25 = v11;
  float v26 = &v32;
  [v10 enumerateIndexesUsingBlock:&v20];

  float v12 = 0.0;
  for (uint64_t i = 1; i != 2000; ++i)
  {
    float v14 = v8[i];
    float v15 = v9[i];
    unsigned int v16 = *((_DWORD *)v33 + 6);
    int v17 = [(_CDPModelTuning *)self scorer];
    float v18 = v17[2](v14 / v15, v14 / (float)v16);

    if (v18 > v12)
    {
      *a3 = v5[2](v5, i);
      float v12 = v18;
    }
  }
  free(v8);
  free(v9);

  _Block_object_dispose(&v32, 8);
  return v12;
}

- (_CDPModelTuningState)currentState
{
  return self->_currentState;
}

- (id)scorer
{
  return self->_scorer;
}

- (void)setScorer:(id)a3
{
}

- (id)heartBeat
{
  return self->_heartBeat;
}

- (void)setHeartBeat:(id)a3
{
}

- (_CDPSimpleModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSIndexSet)testIndices
{
  return self->_testIndices;
}

- (void)setTestIndices:(id)a3
{
}

- (int)numberOfGridTests
{
  return self->_numberOfGridTests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testIndices, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong(&self->_heartBeat, 0);
  objc_storeStrong(&self->_scorer, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

- (void)resumeTuningWithState:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[TUNING] interrupted", v0, 2u);
}

- (void)resumeTuningWithState:(float)a3 .cold.2(uint8_t *buf, double *a2, float a3)
{
  *(_DWORD *)buf = 134217984;
  *a2 = a3;
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[TUNING] new best score %g", buf, 0xCu);
}

@end