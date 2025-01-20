@interface _CDSleepPredictorMath
- (id)predictFrom:(id)a3;
- (id)predictFrom:(id)a3 withTuning:(id)a4 usingVersion:(int)a5;
@end

@implementation _CDSleepPredictorMath

- (id)predictFrom:(id)a3 withTuning:(id)a4 usingVersion:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", 4 * objc_msgSend(v7, "count"));
  v10 = [v7 reverseObjectEnumerator];
  v11 = [v10 allObjects];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __61___CDSleepPredictorMath_predictFrom_withTuning_usingVersion___block_invoke;
  v40[3] = &unk_1E56107C0;
  id v12 = v9;
  id v41 = v12;
  [v11 enumerateObjectsUsingBlock:v40];

  v13 = [MEMORY[0x1E4F1CA58] dataWithLength:768];
  v14 = [v8 objectForKeyedSubscript:@"kSleepTuningShort"];
  if (v14)
  {
    v15 = [v8 objectForKeyedSubscript:@"kSleepTuningShort"];
    [v15 doubleValue];
    double v17 = v16;
  }
  else
  {
    double v17 = 0.8;
  }

  v18 = [v8 objectForKeyedSubscript:@"kSleepTuningLong"];
  if (v18)
  {
    v19 = [v8 objectForKeyedSubscript:@"kSleepTuningLong"];
    [v19 doubleValue];
    double v21 = v20;
  }
  else
  {
    double v21 = 0.7;
  }

  v22 = [v8 objectForKeyedSubscript:@"kSleepTuningRatio"];
  if (v22)
  {
    v23 = [v8 objectForKeyedSubscript:@"kSleepTuningRatio"];
    [v23 doubleValue];
    double v25 = v24;
  }
  else
  {
    double v25 = 0.5;
  }

  id v26 = v12;
  uint64_t v27 = [v26 mutableBytes];
  int v28 = [v7 count];
  unsigned int v29 = v28;
  if (a5 == 2 && v28 >= 1)
  {
    uint64_t v30 = v28;
    v31 = (_DWORD *)v27;
    do
    {
      if (*v31 == -1) {
        _DWORD *v31 = 0;
      }
      ++v31;
      --v30;
    }
    while (v30);
  }
  id v32 = v13;
  if (sleepPredictionWithParams([v32 mutableBytes], v27, v29, v17, v21, v25, a5))
  {
    v33 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[_CDSleepPredictorMath predictFrom:withTuning:usingVersion:](v33);
    }
    v34 = 0;
  }
  else
  {
    v33 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v35 = [v32 bytes];
    for (uint64_t i = 0; i != 768; i += 8)
    {
      v37 = [NSNumber numberWithDouble:*(double *)(v35 + i)];
      [v33 addObject:v37];
    }
    v38 = [v33 reverseObjectEnumerator];
    v34 = [v38 allObjects];
  }
  return v34;
}

- (id)predictFrom:(id)a3
{
  return [(_CDSleepPredictorMath *)self predictFrom:a3 withTuning:MEMORY[0x1E4F1CC08] usingVersion:1];
}

- (void)predictFrom:(os_log_t)log withTuning:usingVersion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Sleep Prediction: function aborted due to insufficient data", v1, 2u);
}

@end