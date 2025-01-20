@interface BMSiriExecutionEvent_v3
- (BMSiriExecutionEvent_v3)initWithProto:(id)a3;
@end

@implementation BMSiriExecutionEvent_v3

- (BMSiriExecutionEvent_v3)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [v5 taskId];
      uint64_t v7 = [v5 taskStep];
      uint64_t v8 = v7;
      if (v7 >= 0x5F)
      {
        v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMSiriExecutionEvent_v3 initWithProto:](v8);
        }

        uint64_t v9 = 94;
      }
      else
      {
        uint64_t v9 = qword_18EB36A48[(int)v7];
      }
      v12 = [v5 statusReason];
      v13 = [v5 slotValue];
      v14 = [v5 intentName];
      v15 = [v5 appBundleId];
      v16 = [v5 interactionId];
      [v5 absoluteTimestamp];
      self = -[BMSiriExecutionEvent initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:](self, "initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:", v6, v9, v12, v13, v14, v15, v16);

      v10 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMSiriExecutionEvent initWithProto:]();
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

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSiriExecutionEvent: unable to convert BMPBTaskStepType v3 enum value: %@", v4, v5, v6, v7, v8);
}

@end