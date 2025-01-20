@interface DESFedStatsRecorder
+ (void)initialize;
- (BOOL)record:(id)a3 data:(id)a4 dataTypeContent:(id)a5 metadata:(id)a6 errorOut:(id *)a7;
- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7;
@end

@implementation DESFedStatsRecorder

- (BOOL)record:(id)a3 data:(id)a4 dataTypeContent:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (PrivateFederatedLearningLibraryCore())
  {
    if ([v11 count])
    {
      v13 = [v11 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        getFedStatsDataEncoderClass();
        char v15 = objc_opt_respondsToSelector();
        id FedStatsDataEncoderClass = getFedStatsDataEncoderClass();
        v17 = FedStatsDataEncoderClass;
        if (v15)
        {
          id v25 = 0;
          char v18 = [FedStatsDataEncoderClass encodeDataArrayAndRecord:v11 dataTypeContent:v12 baseKey:v10 errorOut:&v25];
          id v19 = v25;
          if (!a7) {
            goto LABEL_15;
          }
        }
        else
        {
          v23 = [v11 objectAtIndexedSubscript:0];
          id v24 = 0;
          char v18 = [v17 encodeDataAndRecord:v23 dataTypeContent:v12 baseKey:v10 errorOut:&v24];
          id v19 = v24;

          if (!a7)
          {
LABEL_15:

            goto LABEL_12;
          }
        }
        *a7 = v19;
        goto LABEL_15;
      }
    }
    v20 = sLog_0;
    if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_ERROR)) {
      -[DESFedStatsRecorder record:data:dataTypeContent:metadata:errorOut:](v20);
    }
  }
  else
  {
    v21 = sLog_0;
    if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_ERROR)) {
      -[DESFedStatsRecorder record:data:dataTypeContent:metadata:errorOut:](v21);
    }
  }
  char v18 = 0;
LABEL_12:

  return v18;
}

- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [v14 objectForKeyedSubscript:@"dataContentTypes"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = [NSString stringWithFormat:@"key=%@ has wrong type, value=%@", @"dataContentTypes", v16];
    id v22 = [v19 exceptionWithName:v20 reason:v21 userInfo:0];

    objc_exception_throw(v22);
  }
  BOOL v17 = [(DESFedStatsRecorder *)self record:v12 data:v13 dataTypeContent:v16 metadata:v15 errorOut:a7];

  return v17;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog_0 = (uint64_t)os_log_create("com.apple.DistributedEvaluation", "DESFedStatsRecorder");
    MEMORY[0x1F41817F8]();
  }
}

- (void)record:(os_log_t)log data:dataTypeContent:metadata:errorOut:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Failed to softlink PrivateFederatedLearning framework", v1, 2u);
}

- (void)record:(os_log_t)log data:dataTypeContent:metadata:errorOut:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Data to be encoded by FedStats is malformed, should be a non-empty array of dictionaries", v1, 2u);
}

@end