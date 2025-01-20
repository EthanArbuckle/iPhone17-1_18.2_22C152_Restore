@interface BMInferredModeEvent_v2
- (BMInferredModeEvent_v2)initWithProto:(id)a3;
@end

@implementation BMInferredModeEvent_v2

- (BMInferredModeEvent_v2)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [v5 absoluteTimestamp];
      double v7 = v6;
      v30 = [v5 modeIdentifier];
      unsigned int v8 = [v5 origin] + 1;
      if (v8 >= 0x13)
      {
        v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMInferredModeEvent_v2 initWithProto:]();
        }

        uint64_t v9 = -1;
      }
      else
      {
        uint64_t v9 = qword_18EB36EB8[v8];
      }
      uint64_t v28 = v9;
      v29 = [v5 originBundleId];
      v12 = [v5 originAnchorType];
      unsigned int v27 = [v5 isAutomationEnabled];
      uint64_t v26 = [v5 uiLocation];
      char v13 = [v5 isStart];
      [v5 confidenceScore];
      double v15 = v14;
      v16 = [v5 uuid];
      v17 = [v5 serializedTriggers];
      char v18 = [v5 shouldSuggestTriggers];
      unsigned int v19 = [v5 modeType];
      if (v19 >= 0x12)
      {
        v21 = __biome_log_for_category();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[BMInferredModeEvent_v2 initWithProto:]();
        }

        uint64_t v20 = 1;
      }
      else
      {
        uint64_t v20 = qword_18EB36F50[v19];
      }
      v22 = [v5 userModeName];
      LOBYTE(v25) = v18;
      LOBYTE(v24) = v13;
      self = [(BMInferredModeEvent *)self initWithAbsoluteTimestamp:v30 modeUUID:v28 origin:v29 originBundleId:v12 originAnchorType:v27 isAutomationEnabled:v26 uiLocation:v7 isStart:v15 confidenceScore:v24 suggestionUUID:v16 serializedTriggers:v17 shouldSuggestTriggers:v25 modeType:v20 userModeName:v22];

      v10 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMInferredModeEvent initWithProto:]();
      }
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMInferredModeEvent: unable to convert BMPBInferredModeType v2 enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMInferredModeEvent: unable to convert BMPBInferredModeOrigin v2 enum value: %@", v3, v4, v5, v6, v7);
}

@end