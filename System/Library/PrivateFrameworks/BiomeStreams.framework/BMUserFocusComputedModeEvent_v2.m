@interface BMUserFocusComputedModeEvent_v2
- (BMUserFocusComputedModeEvent_v2)initWithProto:(id)a3;
@end

@implementation BMUserFocusComputedModeEvent_v2

- (BMUserFocusComputedModeEvent_v2)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [v5 mode];
      v7 = [v5 semanticModeIdentifier];
      uint64_t v8 = [v5 starting];
      uint64_t updated = BMUserFocusComputedModeUpdateReasonFromReason([v5 modeUpdateReason]);
      uint64_t v10 = [v5 modeSemanticType] - 1;
      if (v10 >= 0xA)
      {
        v13 = __biome_log_for_category();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[BMUserFocusComputedModeEvent_v2 initWithProto:]();
        }

        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = v10 - 1;
      }
      uint64_t v14 = BMUserFocusComputedModeUpdateSourceFromSource([v5 modeUpdateSource]);
      v17.receiver = self;
      v17.super_class = (Class)BMUserFocusComputedModeEvent_v2;
      v15 = [(BMUserFocusComputedModeEvent *)&v17 initWithMode:v6 semanticModeIdentifier:v7 starting:v8 modeUpdateReason:updated modeSemanticType:v11 modeUpdateSource:v14];

      self = v15;
      v12 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMUserFocusComputedModeEvent initWithProto:]();
      }
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMUserFocusComputedModeEvent: unable to convert BMPBModeSemanticType v2 enum value: %@", v3, v4, v5, v6, v7);
}

@end