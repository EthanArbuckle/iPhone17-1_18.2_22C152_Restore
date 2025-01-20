@interface BMMindfulnessSessionEvent_v1
- (BMMindfulnessSessionEvent_v1)initWithProto:(id)a3;
@end

@implementation BMMindfulnessSessionEvent_v1

- (BMMindfulnessSessionEvent_v1)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [v5 sessionType];
      uint64_t v7 = v6;
      if (v6 >= 4)
      {
        v10 = __biome_log_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[BMMindfulnessSessionEvent_v1 initWithProto:](v7);
        }

        uint64_t v8 = 3;
      }
      else
      {
        uint64_t v8 = qword_18EB36E68[(int)v6];
      }
      self = [(BMMindfulnessSessionEvent *)self initWithSessionType:v8 stateType:typeWithBMPBMindfulnessSessionStateType([v5 stateType])];
      v9 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMMindfulnessSessionEvent initWithProto:]();
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
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMMindfulnessSessionEvent: unable to convert BMPBMindfulnessSessionType v1 enum value: %@", v4, v5, v6, v7, v8);
}

@end