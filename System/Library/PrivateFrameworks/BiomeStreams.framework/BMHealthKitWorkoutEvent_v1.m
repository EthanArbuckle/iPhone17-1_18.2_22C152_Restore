@interface BMHealthKitWorkoutEvent_v1
- (BMHealthKitWorkoutEvent_v1)initWithProto:(id)a3;
@end

@implementation BMHealthKitWorkoutEvent_v1

- (BMHealthKitWorkoutEvent_v1)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [v5 isFirstPartyDonation];
      uint64_t v7 = [v5 isIndoor];
      v8 = [v5 activityType];
      v9 = [v5 activityUUID];
      uint64_t v10 = [v5 eventType];
      uint64_t v11 = v10;
      if (v10 >= 5)
      {
        v14 = __biome_log_for_category();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[BMHealthKitWorkoutEvent_v1 initWithProto:](v11);
        }

        uint64_t v12 = 4;
      }
      else
      {
        uint64_t v12 = qword_18EB36E88[(int)v10];
      }
      self = [(BMHealthKitWorkoutEvent *)self initWithIsFirstPartyDonation:v6 isIndoor:v7 activityType:v8 activityUUID:v9 eventType:v12 isUpdate:[v5 isUpdate]];

      v13 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMHealthKitWorkoutEvent initWithProto:]();
      }
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMHealthKitWorkoutEvent: unable to convert BMPBHealthKitWorkoutEventType v1 enum value: %@", v4, v5, v6, v7, v8);
}

@end