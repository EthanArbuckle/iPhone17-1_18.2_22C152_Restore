@interface _ATXScoreInterpreterCoreMLModel
+ (double)scoreForOutputValue:(id)a3 outputIndexedSubscript:(int64_t)a4;
+ (id)coreMLModelForCoreMLModelName:(id)a3;
- (BOOL)hasOutputIndexedSubscript;
- (_ATXScoreInterpreterCoreMLModel)initWithModelName:(id)a3 features:(id)a4 outputSpecification:(id)a5;
- (double)predictionForEvaluatedFeatures:(id)a3 withOutputIndexedSubscript:(int64_t)a4;
- (id)featureAtIndex:(unint64_t)a3;
- (id)getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures:(id)a3 outputSpecification:(id)a4;
- (unint64_t)numberOfFeatures;
@end

@implementation _ATXScoreInterpreterCoreMLModel

- (_ATXScoreInterpreterCoreMLModel)initWithModelName:(id)a3 features:(id)a4 outputSpecification:(id)a5
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ATXScoreInterpreterCoreMLModel;
  v7 = [(_ATXScoreInterpreterCoreMLModel *)&v14 init];
  if (v7)
  {
    v8 = objc_opt_new();
    uint64_t v9 = +[_ATXScoreInterpreterCoreMLModel coreMLModelForCoreMLModelName:v6];
    v10 = (void *)v8[1];
    v8[1] = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v8];
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v11;
  }
  return v7;
}

+ (id)coreMLModelForCoreMLModelName:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F4AF08] pathForResource:v3 ofType:@"mlmodelc" isDirectory:1];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1E968];
    id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    id v18 = 0;
    v7 = [v5 modelWithContentsOfURL:v6 error:&v18];
    v8 = v18;

    if (v8)
    {
      uint64_t v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[_ATXScoreInterpreterCoreMLModel coreMLModelForCoreMLModelName:v9];
      }
    }
  }
  else
  {
    v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[_ATXScoreInterpreterCoreMLModel coreMLModelForCoreMLModelName:](v8, v10, v11, v12, v13, v14, v15, v16);
    }
    v7 = 0;
  }

  return v7;
}

- (id)getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures:(id)a3 outputSpecification:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __121___ATXScoreInterpreterCoreMLModel_getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures_outputSpecification___block_invoke;
  v25 = &unk_1E68B03D0;
  id v10 = v9;
  id v26 = v10;
  id v11 = v8;
  id v27 = v11;
  [v7 enumerateKeysAndObjectsUsingBlock:&v22];

  uint64_t v12 = (NSArray *)objc_msgSend(v11, "copy", v22, v23, v24, v25);
  coreMLInputFeatures = self->_coreMLInputFeatures;
  self->_coreMLInputFeatures = v12;

  uint64_t v14 = [v6 objectForKeyedSubscript:@"outputName"];
  coreMLModelOutputName = self->_coreMLModelOutputName;
  self->_coreMLModelOutputName = v14;

  uint64_t v16 = [v6 objectForKeyedSubscript:@"outputIndexedSubscript"];

  v17 = (void *)[v10 mutableCopy];
  id v18 = v17;
  if (v16)
  {
    [v17 addObject:v16];
    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = 0;
  }
  self->_hasOutputIndexedSubscript = v19;
  v20 = (void *)[v18 copy];

  return v20;
}

- (unint64_t)numberOfFeatures
{
  return [(NSArray *)self->_coreMLInputFeatures count];
}

- (id)featureAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_coreMLInputFeatures objectAtIndexedSubscript:a3];
}

- (double)predictionForEvaluatedFeatures:(id)a3 withOutputIndexedSubscript:(int64_t)a4
{
  id v6 = a3;
  uint64_t v43 = 0;
  v44[0] = &v43;
  v44[1] = 0x3032000000;
  v44[2] = __Block_byref_object_copy__44;
  v44[3] = __Block_byref_object_dispose__44;
  id v45 = 0;
  id v7 = objc_alloc(MEMORY[0x1E4F1E930]);
  v8 = (id *)(v44[0] + 40);
  id obj = *(id *)(v44[0] + 40);
  uint64_t v9 = (void *)[v7 initWithDictionary:v6 error:&obj];
  objc_storeStrong(v8, obj);
  if (*(void *)(v44[0] + 40))
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_ATXScoreInterpreterCoreMLModel predictionForEvaluatedFeatures:withOutputIndexedSubscript:]((uint64_t)v44, v10, v11, v12, v13, v14, v15, v16);
    }

    double v17 = -31337.0;
  }
  else
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__44;
    v40 = __Block_byref_object_dispose__44;
    id v41 = 0;
    lock = self->_lock;
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __93___ATXScoreInterpreterCoreMLModel_predictionForEvaluatedFeatures_withOutputIndexedSubscript___block_invoke;
    v32 = &unk_1E68B03F8;
    v34 = &v36;
    id v33 = v9;
    v35 = &v43;
    [(_PASLock *)lock runWithLockAcquired:&v29];
    if (*(void *)(v44[0] + 40))
    {
      BOOL v19 = __atxlog_handle_default();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[_ATXScoreInterpreterCoreMLModel predictionForEvaluatedFeatures:withOutputIndexedSubscript:]((uint64_t)v44, v19, v20, v21, v22, v23, v24, v25);
      }

      double v17 = -31337.0;
    }
    else
    {
      id v26 = objc_msgSend((id)v37[5], "featureValueForName:", self->_coreMLModelOutputName, v29, v30, v31, v32);
      +[_ATXScoreInterpreterCoreMLModel scoreForOutputValue:v26 outputIndexedSubscript:a4];
      double v17 = v27;
    }
    _Block_object_dispose(&v36, 8);
  }
  _Block_object_dispose(&v43, 8);

  return v17;
}

+ (double)scoreForOutputValue:(id)a3 outputIndexedSubscript:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 type];
  switch(v6)
  {
    case 1:
      double v7 = (double)[v5 int64Value];
      break;
    case 2:
      [v5 doubleValue];
      double v7 = v8;
      break;
    case 5:
      uint64_t v16 = [v5 multiArrayValue];
      double v17 = [v16 objectAtIndexedSubscript:a4];
      [v17 doubleValue];
      double v7 = v18;
      goto LABEL_9;
    case 6:
      uint64_t v16 = [v5 dictionaryValue];
      double v17 = [NSNumber numberWithInteger:a4];
      BOOL v19 = [v16 objectForKeyedSubscript:v17];
      [v19 doubleValue];
      double v7 = v20;

LABEL_9:
      break;
    default:
      uint64_t v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[_ATXScoreInterpreterCoreMLModel scoreForOutputValue:outputIndexedSubscript:](v6, v9, v10, v11, v12, v13, v14, v15);
      }

      double v7 = -31337.0;
      break;
  }

  return v7;
}

- (BOOL)hasOutputIndexedSubscript
{
  return self->_hasOutputIndexedSubscript;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_coreMLInputFeatures, 0);
  objc_storeStrong((id *)&self->_coreMLModelOutputName, 0);
}

+ (void)coreMLModelForCoreMLModelName:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)coreMLModelForCoreMLModelName:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "error initializing %@ model: %@", (uint8_t *)&v3, 0x16u);
}

- (void)predictionForEvaluatedFeatures:(uint64_t)a3 withOutputIndexedSubscript:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)predictionForEvaluatedFeatures:(uint64_t)a3 withOutputIndexedSubscript:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)scoreForOutputValue:(uint64_t)a3 outputIndexedSubscript:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end