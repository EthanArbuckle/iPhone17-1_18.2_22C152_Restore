@interface SGBinaryClassificationModel
+ (id)modelForPath:(id)a3 modelClass:(Class)a4;
+ (id)modelFromMobileAssetForEntity:(id)a3 type:(id)a4 language:(id)a5 class:(Class)a6;
+ (id)modelFromMobileAssetForName:(id)a3 language:(id)a4;
- (SGBinaryClassificationModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (double)threshold;
- (id)predictLabelForInput:(id)a3;
- (id)serialize;
- (id)toPlistWithChunks:(id)a3;
@end

@implementation SGBinaryClassificationModel

+ (id)modelFromMobileAssetForName:(id)a3 language:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasPrefix:@"args:"])
  {
    v8 = (void *)MEMORY[0x1CB79B230]();
    v9 = (void *)MEMORY[0x1CB79B230]();
    v10 = [v6 substringFromIndex:5];
    v11 = [v10 componentsSeparatedByString:@","];

    if ([v11 count] == 3)
    {
      v12 = [v11 objectAtIndexedSubscript:0];
      v13 = [v11 objectAtIndexedSubscript:1];
      v14 = [v11 objectAtIndexedSubscript:2];
      Class v15 = NSClassFromString(v14);
      if (v15)
      {
        v16 = [a1 modelFromMobileAssetForEntity:v12 type:v13 language:v7 class:v15];
      }
      else
      {
        v19 = sgLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v22 = 136315138;
          uint64_t v23 = [(NSString *)v14 UTF8String];
          _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "Unknown model class: %s", (uint8_t *)&v22, 0xCu);
        }

        v16 = 0;
      }
    }
    else
    {
      v12 = sgLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315138;
        uint64_t v23 = [v6 UTF8String];
        _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "Invalid model string: %s", (uint8_t *)&v22, 0xCu);
      }
      v16 = 0;
    }

    goto LABEL_22;
  }
  if ([v6 isEqualToString:@"dataDetectionSignificantPhrasePhoneLogistic"])
  {
    uint64_t v17 = objc_opt_class();
    v18 = @"significantPhoneNumber";
LABEL_21:
    v16 = [a1 modelFromMobileAssetForEntity:v18 type:@"Logistic" language:v7 class:v17];
    goto LABEL_22;
  }
  if ([v6 isEqualToString:@"dataDetectionSignificantPhraseEmailLogistic"]
    || [v6 isEqualToString:@"dataDetectionSignificantPhraseEmailForIMessageLogistic"])
  {
    uint64_t v17 = objc_opt_class();
    v18 = @"significantEmailAddress";
    goto LABEL_21;
  }
  if ([v6 isEqualToString:@"dataDetectionSignificantPhraseAddressLogistic"]
    || [v6 isEqualToString:@"dataDetectionSignificantPhraseAddressForIMessageLogistic"])
  {
    uint64_t v17 = objc_opt_class();
    v18 = @"significantAddress";
    goto LABEL_21;
  }
  if ([v6 isEqualToString:@"selfIdentificationPhraseLogistic"])
  {
    uint64_t v17 = objc_opt_class();
    v18 = @"selfId";
    goto LABEL_21;
  }
  if ([v6 isEqualToString:@"birthdayTextMessageCongrats"])
  {
    uint64_t v17 = objc_opt_class();
    v18 = @"birthdayExtraction";
    goto LABEL_21;
  }
  v21 = sgLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v22 = 136315138;
    uint64_t v23 = [v6 UTF8String];
    _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "Unknown model name: %s", (uint8_t *)&v22, 0xCu);
  }

  v16 = 0;
LABEL_22:

  return v16;
}

+ (id)modelFromMobileAssetForEntity:(id)a3 type:(id)a4 language:(id)a5 class:(Class)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_%@%@Model.chunk", @"PREDICTION", v12, v10, v11];
  v14 = [MEMORY[0x1E4F5DFA8] asset];
  Class v15 = [v14 filesystemPathForAssetDataRelativePath:v13];

  v16 = sgLogHandle();
  uint64_t v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [v10 UTF8String];
      uint64_t v22 = [v11 UTF8String];
      uint64_t v24 = a6;
      uint64_t v18 = [v12 UTF8String];
      v19 = [MEMORY[0x1E4F5DFA8] asset];
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = v23;
      __int16 v27 = 2080;
      uint64_t v28 = v22;
      __int16 v29 = 2080;
      uint64_t v30 = v18;
      a6 = v24;
      __int16 v31 = 2048;
      uint64_t v32 = [v19 assetVersion];
      __int16 v33 = 2080;
      uint64_t v34 = [v15 UTF8String];
      _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_INFO, "Loading model {entity: %s, type: %s, language: %s, version: %tu, path: %s}", buf, 0x34u);
    }
    v20 = [a1 modelForPath:v15 modelClass:a6];
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v26 = [v13 UTF8String];
      _os_log_error_impl(&dword_1CA650000, v17, OS_LOG_TYPE_ERROR, "Failed to locate assets resource %s", buf, 0xCu);
    }

    v20 = 0;
  }

  return v20;
}

+ (id)modelForPath:(id)a3 modelClass:(Class)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PMLReadChunkFile();
  id v6 = sgLogHandle();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_INFO, "Model loaded.", (uint8_t *)&v9, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315138;
    uint64_t v10 = [v4 UTF8String];
    _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "Failed to load model chunk file resource %s", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (double)threshold
{
  return self->_threshold;
}

- (id)serialize
{
  return (id)MEMORY[0x1F4146038](self, a2);
}

- (id)toPlistWithChunks:(id)a3
{
  v28[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(SGModel *)self model];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = @"LOGISTIC";
  }
  else
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = [(SGModel *)self model];
    uint64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v9 handleFailureInMethod:a2, self, @"SGBinaryClassificationModel.m", 128, @"Unknown type of model class: %@", v12 object file lineNumber description];

    v8 = 0;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F93838]);
  v14 = (void *)[v13 initWithClassNameKey:*MEMORY[0x1E4F93868]];
  Class v15 = [(SGModel *)self featurizer];
  v16 = [v14 writeToPlistWithObject:v15 andChunks:v5];

  v27[0] = @"MODEL_DATA";
  uint64_t v17 = [(SGModel *)self model];
  uint64_t v18 = [v17 toPlistWithChunks:v5];
  v28[0] = v18;
  v27[1] = @"MODEL_LOCALE";
  v19 = [(SGModel *)self locale];
  v28[1] = v19;
  v28[2] = v8;
  v27[2] = @"MODEL_TYPE";
  v27[3] = @"MODEL_FEATURIZER";
  v28[3] = v16;
  v27[4] = @"MODEL_SOURCE_SESSION_DESCRIPTOR";
  v20 = [(SGModel *)self modelSource];
  v21 = [v20 sessionDescriptor];
  uint64_t v22 = [v21 toPlistWithChunks:v5];

  v28[4] = v22;
  v27[5] = @"MODEL_DECISION_THRESHOLD";
  uint64_t v23 = NSNumber;
  [(SGBinaryClassificationModel *)self threshold];
  uint64_t v24 = objc_msgSend(v23, "numberWithDouble:");
  v28[5] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:6];

  return v25;
}

- (SGBinaryClassificationModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[SGBinaryClassificationModel initWithPlist:chunks:context:]", "SGBinaryClassificationModel.m", 81, "[dict isKindOfClass:[NSDictionary class]]");
  }
  id v13 = [v12 objectForKeyedSubscript:@"MODEL_TYPE"];
  v14 = [v12 objectForKeyedSubscript:@"MODEL_LOCALE"];
  Class v15 = [v12 objectForKeyedSubscript:@"MODEL_DATA"];
  if ([v13 isEqualToString:@"LOGISTIC"])
  {
    v16 = (objc_class *)objc_opt_class();
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGBinaryClassificationModel.m", 91, @"Unknown model type: %@", v13 object file lineNumber description];

    v16 = 0;
  }
  uint64_t v18 = (void *)[[v16 alloc] initWithPlist:v15 chunks:v10 context:v11];
  if (v18)
  {
    __int16 v33 = v15;
    uint64_t v34 = v14;
    id v19 = objc_alloc(MEMORY[0x1E4F93838]);
    v20 = (void *)[v19 initWithClassNameKey:*MEMORY[0x1E4F93868]];
    v21 = [v12 objectForKeyedSubscript:@"MODEL_FEATURIZER"];
    uint64_t v32 = v20;
    uint64_t v22 = [v20 readObjectWithPlist:v21 chunks:v10 context:v11];

    id v23 = objc_alloc(MEMORY[0x1E4F93840]);
    uint64_t v24 = [v12 objectForKeyedSubscript:@"MODEL_SOURCE_SESSION_DESCRIPTOR"];
    v25 = (void *)[v23 initWithPlist:v24 chunks:v10 context:v11];

    if (v25)
    {
      uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F5DFB8]) initWithSessionDescriptor:v25 modelClass:objc_opt_class()];
      v14 = v34;
      __int16 v27 = [(SGModel *)self initWithModel:v18 locale:v34 featurizer:v22 modelSource:v26];
      if (v27)
      {
        uint64_t v28 = [v12 objectForKeyedSubscript:@"MODEL_DECISION_THRESHOLD"];
        [v28 doubleValue];
        v27->_threshold = v29;

        v14 = v34;
      }
      self = v27;

      uint64_t v30 = self;
    }
    else
    {
      uint64_t v30 = 0;
      v14 = v34;
    }

    Class v15 = v33;
  }
  else
  {
    uint64_t v30 = 0;
  }

  return v30;
}

- (id)predictLabelForInput:(id)a3
{
  id v4 = [(SGModel *)self predictForInput:a3];
  id v5 = [v4 firstObject];
  [v5 doubleValue];
  double v7 = v6;

  v8 = (void *)MEMORY[0x1E4F93BB8];
  id v9 = NSNumber;
  [(SGBinaryClassificationModel *)self threshold];
  id v11 = [v9 numberWithBool:v7 > v10];
  id v12 = [NSNumber numberWithDouble:v7];
  id v13 = [v8 tupleWithFirst:v11 second:v12];

  return v13;
}

@end