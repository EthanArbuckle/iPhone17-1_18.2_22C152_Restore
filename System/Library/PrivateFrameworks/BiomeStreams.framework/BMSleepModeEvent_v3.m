@interface BMSleepModeEvent_v3
- (BMSleepModeEvent_v3)initWithProto:(id)a3;
@end

@implementation BMSleepModeEvent_v3

- (BMSleepModeEvent_v3)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [v5 sleepModeState];
      uint64_t v7 = v6;
      if (v6 >= 4)
      {
        v10 = __biome_log_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[BMSleepModeEvent_v3 initWithProto:](v7);
        }

        uint64_t v8 = 3;
      }
      else
      {
        uint64_t v8 = qword_18EB37058[(int)v6];
      }
      uint64_t v11 = BMSleepModeChangeReasonFromReason([v5 sleepModeChangeReason]);
      int v12 = [v5 hasExpectedEndDate];
      if (v12)
      {
        v13 = (void *)MEMORY[0x1E4F1C9C8];
        [v5 expectedEndDate];
        v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        v14 = 0;
      }
      v17.receiver = self;
      v17.super_class = (Class)BMSleepModeEvent_v3;
      v15 = [(BMSleepModeEvent *)&v17 initWithSleepModeState:v8 sleepModeChangeReason:v11 expectedEndDate:v14];
      if (v12) {

      }
      self = v15;
      v9 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMSleepModeEvent initWithProto:]();
      }
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSleepModeEvent: unable to convert BMPBSleepModeState v3 enum value: %@", v4, v5, v6, v7, v8);
}

@end