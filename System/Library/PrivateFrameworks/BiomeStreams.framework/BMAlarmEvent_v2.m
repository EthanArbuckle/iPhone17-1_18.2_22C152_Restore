@interface BMAlarmEvent_v2
- (BMAlarmEvent_v2)initWithProto:(id)a3;
@end

@implementation BMAlarmEvent_v2

- (BMAlarmEvent_v2)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unsigned int v6 = [v5 eventType] - 1;
      if (v6 >= 6)
      {
        v9 = __biome_log_for_category();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[BMAlarmEvent_v2 initWithProto:]();
        }

        uint64_t v7 = 1;
      }
      else
      {
        uint64_t v7 = qword_18EB37128[v6];
      }
      uint64_t v10 = [v5 lastEventType] - 1;
      if (v10 >= 0xB)
      {
        v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMAlarmEvent_v2 initWithProto:]();
        }

        uint64_t v10 = 0;
      }
      id v12 = objc_alloc(MEMORY[0x1E4F29128]);
      v13 = [v5 alarmID];
      v14 = (void *)[v12 initWithUUIDString:v13];
      self = [(BMAlarmEvent *)self initWithEventType:v7 lastEventType:v10 alarmID:v14 isSleepAlarm:[v5 isSleepAlarm]];

      v8 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMAlarmEvent initWithProto:]();
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMAlarmEvent: unable to convert BMLastAlarmEventType v2 enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMAlarmEvent: unable to convert BMPBAlarmEventType v2 enum value: %@", v3, v4, v5, v6, v7);
}

@end