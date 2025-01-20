@interface MLPredictionOptions
+ (BOOL)supportsSecureCoding;
+ (id)defaultOptions;
- (BOOL)_validateDirectBindingExpectations:(id)a3 directlyBoundFeatureNames:(id)a4 unexpectedDirectBindings:(id *)a5 unexpectedCopyBindings:(id *)a6;
- (BOOL)enablePixelBufferDirectBinding;
- (BOOL)hasDirectBindingExpectations;
- (BOOL)predictionUsesCPU;
- (BOOL)usesCPUOnly;
- (BOOL)validateExpectationsWithDirectlyBoundInputs:(id)a3 outputs:(id)a4 error:(id *)a5;
- (MLPredictionOptions)init;
- (MLPredictionOptions)initWithCoder:(id)a3;
- (MLPredictionOptions)initWithUsesCPUOnly:(BOOL)a3;
- (MLPredictionSyncPoint)completionSyncPoint;
- (NSArray)waitSyncPoints;
- (NSDictionary)automaticOutputBackingMode;
- (NSDictionary)inputDirectBindingExpectations;
- (NSDictionary)outputBackings;
- (NSDictionary)outputDirectBindingExpectations;
- (NSString)aneExecutionPriority;
- (NSString)e5rtStreamReuseExpectation;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)classifyTopK;
- (unint64_t)maxComputationBatchSize;
- (unint64_t)parentSignpostID;
- (unsigned)aneQoS;
- (void)encodeWithCoder:(id)a3;
- (void)setAneExecutionPriority:(id)a3;
- (void)setAneQoS:(unsigned int)a3;
- (void)setAutomaticOutputBackingMode:(id)a3;
- (void)setClassifyTopK:(unint64_t)a3;
- (void)setCompletionSyncPoint:(id)a3;
- (void)setE5rtStreamReuseExpectation:(id)a3;
- (void)setEnablePixelBufferDirectBinding:(BOOL)a3;
- (void)setInputDirectBindingExpectations:(id)a3;
- (void)setMaxComputationBatchSize:(unint64_t)a3;
- (void)setOutputBackings:(NSDictionary *)outputBackings;
- (void)setOutputDirectBindingExpectations:(id)a3;
- (void)setParentSignpostID:(unint64_t)a3;
- (void)setUsesCPUOnly:(BOOL)usesCPUOnly;
- (void)setWaitSyncPoints:(id)a3;
@end

@implementation MLPredictionOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionSyncPoint, 0);
  objc_storeStrong((id *)&self->_waitSyncPoints, 0);
  objc_storeStrong((id *)&self->_outputDirectBindingExpectations, 0);
  objc_storeStrong((id *)&self->_inputDirectBindingExpectations, 0);
  objc_storeStrong((id *)&self->_e5rtStreamReuseExpectation, 0);
  objc_storeStrong((id *)&self->_automaticOutputBackingMode, 0);

  objc_storeStrong((id *)&self->_outputBackings, 0);
}

- (unsigned)aneQoS
{
  return self->_aneQoS;
}

- (NSString)aneExecutionPriority
{
  return self->_aneExecutionPriority;
}

- (BOOL)predictionUsesCPU
{
  return self->_usesCPUOnly;
}

- (unint64_t)parentSignpostID
{
  return self->_parentSignpostID;
}

- (NSDictionary)automaticOutputBackingMode
{
  return self->_automaticOutputBackingMode;
}

- (NSDictionary)outputBackings
{
  return self->_outputBackings;
}

- (BOOL)hasDirectBindingExpectations
{
  v3 = [(MLPredictionOptions *)self inputDirectBindingExpectations];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(MLPredictionOptions *)self outputDirectBindingExpectations];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (NSDictionary)outputDirectBindingExpectations
{
  return self->_outputDirectBindingExpectations;
}

- (NSDictionary)inputDirectBindingExpectations
{
  return self->_inputDirectBindingExpectations;
}

+ (id)defaultOptions
{
  v2 = objc_alloc_init(MLPredictionOptions);

  return v2;
}

- (MLPredictionOptions)init
{
  return [(MLPredictionOptions *)self initWithUsesCPUOnly:0];
}

- (MLPredictionOptions)initWithUsesCPUOnly:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MLPredictionOptions;
  BOOL v4 = [(MLPredictionOptions *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_usesCPUOnly = a3;
    v4->_classifyTopK = -1;
    v4->_maxComputationBatchSize = -1;
    outputBackings = v4->_outputBackings;
    v7 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    v4->_outputBackings = (NSDictionary *)MEMORY[0x1E4F1CC08];

    automaticOutputBackingMode = v5->_automaticOutputBackingMode;
    v5->_automaticOutputBackingMode = v7;

    inputDirectBindingExpectations = v5->_inputDirectBindingExpectations;
    v5->_inputDirectBindingExpectations = v7;

    outputDirectBindingExpectations = v5->_outputDirectBindingExpectations;
    v5->_outputDirectBindingExpectations = v7;

    v5->_parentSignpostID = 0;
    e5rtStreamReuseExpectation = v5->_e5rtStreamReuseExpectation;
    v5->_e5rtStreamReuseExpectation = (NSString *)@"MLE5EngineStreamReuseExpectationDefault";

    v5->_aneQoS = 0;
    v5->_aneExecutionPriority = (NSString *)@"MLANEExecutionPriority_Unspecified";
  }
  return v5;
}

- (void)setAneExecutionPriority:(id)a3
{
  self->_aneExecutionPriority = (NSString *)a3;
}

- (void)setAneQoS:(unsigned int)a3
{
  self->_aneQoS = a3;
}

- (void)setCompletionSyncPoint:(id)a3
{
}

- (MLPredictionSyncPoint)completionSyncPoint
{
  return self->_completionSyncPoint;
}

- (void)setWaitSyncPoints:(id)a3
{
}

- (NSArray)waitSyncPoints
{
  return self->_waitSyncPoints;
}

- (void)setOutputDirectBindingExpectations:(id)a3
{
}

- (void)setInputDirectBindingExpectations:(id)a3
{
}

- (void)setEnablePixelBufferDirectBinding:(BOOL)a3
{
  self->_enablePixelBufferDirectBinding = a3;
}

- (BOOL)enablePixelBufferDirectBinding
{
  return self->_enablePixelBufferDirectBinding;
}

- (void)setE5rtStreamReuseExpectation:(id)a3
{
}

- (NSString)e5rtStreamReuseExpectation
{
  return self->_e5rtStreamReuseExpectation;
}

- (void)setMaxComputationBatchSize:(unint64_t)a3
{
  self->_maxComputationBatchSize = a3;
}

- (unint64_t)maxComputationBatchSize
{
  return self->_maxComputationBatchSize;
}

- (void)setAutomaticOutputBackingMode:(id)a3
{
}

- (void)setClassifyTopK:(unint64_t)a3
{
  self->_classifyTopK = a3;
}

- (unint64_t)classifyTopK
{
  return self->_classifyTopK;
}

- (void)setParentSignpostID:(unint64_t)a3
{
  self->_parentSignpostID = a3;
}

- (void)setOutputBackings:(NSDictionary *)outputBackings
{
}

- (void)setUsesCPUOnly:(BOOL)usesCPUOnly
{
  self->_usesCPUOnly = usesCPUOnly;
}

- (BOOL)usesCPUOnly
{
  return self->_usesCPUOnly;
}

- (BOOL)validateExpectationsWithDirectlyBoundInputs:(id)a3 outputs:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(MLPredictionOptions *)self hasDirectBindingExpectations])
  {
    v10 = (void *)MEMORY[0x19F3C29E0]();
    v11 = [(MLPredictionOptions *)self inputDirectBindingExpectations];
    id v44 = 0;
    id v45 = 0;
    BOOL v12 = [(MLPredictionOptions *)self _validateDirectBindingExpectations:v11 directlyBoundFeatureNames:v8 unexpectedDirectBindings:&v45 unexpectedCopyBindings:&v44];
    id v13 = v45;
    id v41 = v44;

    v14 = [(MLPredictionOptions *)self outputDirectBindingExpectations];
    id v42 = 0;
    id v43 = 0;
    BOOL v15 = [(MLPredictionOptions *)self _validateDirectBindingExpectations:v14 directlyBoundFeatureNames:v9 unexpectedDirectBindings:&v43 unexpectedCopyBindings:&v42];
    id v16 = v43;
    id v17 = v42;

    id v18 = 0;
    char v19 = v12 && v15;
    if ((v19 & 1) == 0)
    {
      v38 = a5;
      if ([v13 count])
      {
        v20 = NSString;
        v21 = [v13 componentsJoinedByString:@","];
        v40 = [v20 stringWithFormat:@"\n  Input features that unexpectedly use direct binding: %@", v21];
      }
      else
      {
        v40 = &stru_1EF0E81D0;
      }
      if ([v41 count])
      {
        v22 = NSString;
        v23 = [v41 componentsJoinedByString:@","];
        v39 = [v22 stringWithFormat:@"\n  Input features that unexpectedly use copy binding: %@", v23];
      }
      else
      {
        v39 = &stru_1EF0E81D0;
      }
      if ([v16 count])
      {
        v24 = NSString;
        v25 = [v16 componentsJoinedByString:@","];
        v26 = [v24 stringWithFormat:@"\n  Output features that unexpectedly use direct binding: %@", v25];
      }
      else
      {
        v26 = &stru_1EF0E81D0;
      }
      if ([v17 count])
      {
        v27 = NSString;
        v28 = [v17 componentsJoinedByString:@","];
        v29 = [v27 stringWithFormat:@"\n  Output features that unexpectedly use copy binding: %@", v28];
      }
      else
      {
        v29 = &stru_1EF0E81D0;
      }
      id v36 = v17;
      v37 = v10;
      v30 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v49 = v40;
        __int16 v50 = 2112;
        v51 = v39;
        __int16 v52 = 2112;
        v53 = v26;
        __int16 v54 = 2112;
        v55 = v29;
        _os_log_error_impl(&dword_19E58B000, v30, OS_LOG_TYPE_ERROR, "The direct binding expectation was NOT fulfilled.%@%@%@%@", buf, 0x2Au);
      }

      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      v32 = [NSString stringWithFormat:@"The direct binding expectation was NOT fulfilled.%@%@%@%@", v40, v39, v26, v29];
      v47 = v32;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      v34 = v33 = v26;
      id v18 = [v31 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v34];

      v10 = v37;
      a5 = v38;
      id v17 = v36;
    }

    if (a5)
    {
      id v18 = v18;
      *a5 = v18;
    }
  }
  else
  {
    id v18 = 0;
    char v19 = 1;
  }

  return v19;
}

- (BOOL)_validateDirectBindingExpectations:(id)a3 directlyBoundFeatureNames:(id)a4 unexpectedDirectBindings:(id *)a5 unexpectedCopyBindings:(id *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (void *)MEMORY[0x1E4F1CBF0];
  id v27 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  BOOL v12 = (void *)[v11 mutableCopy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    v26 = a5;
    uint64_t v16 = *(void *)v29;
    char v17 = 1;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v20 = [v13 objectForKeyedSubscript:v19];
        int v21 = [v10 containsObject:v19];
        int v22 = v21;
        BOOL v23 = v20 == @"MLDirectBindingExpectationAlways" && v21 == 0;
        v24 = v12;
        if (v23) {
          goto LABEL_13;
        }
        if (v20 != @"MLDirectBindingExpectationNever") {
          int v22 = 0;
        }
        v24 = v27;
        if (v22 == 1)
        {
LABEL_13:
          [v24 addObject:v19];
          char v17 = 0;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);

    if (!((a6 == 0) | v17 & 1))
    {
      id *v26 = v27;
      char v17 = 0;
      *a6 = v12;
    }
  }
  else
  {

    char v17 = 1;
  }

  return v17 & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithUsesCPUOnly:", -[MLPredictionOptions predictionUsesCPU](self, "predictionUsesCPU"));
  objc_msgSend(v4, "setClassifyTopK:", -[MLPredictionOptions classifyTopK](self, "classifyTopK"));
  objc_msgSend(v4, "setMaxComputationBatchSize:", -[MLPredictionOptions maxComputationBatchSize](self, "maxComputationBatchSize"));
  v5 = [(MLPredictionOptions *)self outputBackings];
  [v4 setOutputBackings:v5];

  v6 = [(MLPredictionOptions *)self automaticOutputBackingMode];
  [v4 setAutomaticOutputBackingMode:v6];

  v7 = [(MLPredictionOptions *)self inputDirectBindingExpectations];
  [v4 setInputDirectBindingExpectations:v7];

  id v8 = [(MLPredictionOptions *)self outputDirectBindingExpectations];
  [v4 setOutputDirectBindingExpectations:v8];

  objc_msgSend(v4, "setParentSignpostID:", -[MLPredictionOptions parentSignpostID](self, "parentSignpostID"));
  id v9 = [(MLPredictionOptions *)self e5rtStreamReuseExpectation];
  [v4 setE5rtStreamReuseExpectation:v9];

  objc_msgSend(v4, "setAneQoS:", -[MLPredictionOptions aneQoS](self, "aneQoS"));
  id v10 = [(MLPredictionOptions *)self aneExecutionPriority];
  [v4 setAneExecutionPriority:v10];

  return v4;
}

- (MLPredictionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MLPredictionOptions;
  v5 = [(MLPredictionOptions *)&v16 init];
  if (v5)
  {
    v5->_usesCPUOnly = [v4 decodeBoolForKey:@"usesCPUOnly"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classifyTopK"];
    v5->_classifyTopK = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxComputationBatchSize"];
    v5->_maxComputationBatchSize = [v7 unsignedIntegerValue];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentSignpostID"];
    v5->_parentSignpostID = [v8 unsignedLongLongValue];

    outputBackings = v5->_outputBackings;
    id v10 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    v5->_outputBackings = (NSDictionary *)MEMORY[0x1E4F1CC08];

    automaticOutputBackingMode = v5->_automaticOutputBackingMode;
    v5->_automaticOutputBackingMode = v10;

    inputDirectBindingExpectations = v5->_inputDirectBindingExpectations;
    v5->_inputDirectBindingExpectations = v10;

    outputDirectBindingExpectations = v5->_outputDirectBindingExpectations;
    v5->_outputDirectBindingExpectations = v10;

    e5rtStreamReuseExpectation = v5->_e5rtStreamReuseExpectation;
    v5->_e5rtStreamReuseExpectation = (NSString *)@"MLE5EngineStreamReuseExpectationDefault";

    v5->_aneQoS = 0;
    v5->_aneExecutionPriority = (NSString *)@"MLANEExecutionPriority_Unspecified";
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MLPredictionOptions predictionUsesCPU](self, "predictionUsesCPU"), @"usesCPUOnly");
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLPredictionOptions classifyTopK](self, "classifyTopK"));
  [v4 encodeObject:v5 forKey:@"classifyTopK"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLPredictionOptions maxComputationBatchSize](self, "maxComputationBatchSize"));
  [v4 encodeObject:v6 forKey:@"maxComputationBatchSize"];

  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MLPredictionOptions parentSignpostID](self, "parentSignpostID"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"parentSignpostID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end