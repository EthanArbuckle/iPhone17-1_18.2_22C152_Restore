@interface BMTextInputSessionEvent_v1
- (BMTextInputSessionEvent_v1)initWithProto:(id)a3;
@end

@implementation BMTextInputSessionEvent_v1

- (BMTextInputSessionEvent_v1)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
      v7 = (void *)MEMORY[0x1E4F1C9C8];
      [v5 timestamp];
      v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
      [v5 duration];
      v9 = objc_msgSend(v6, "initWithStartDate:duration:", v8);
      v10 = [v5 bundleID];
      uint64_t v11 = [v5 sessionType];
      uint64_t v12 = v11;
      if (v11 >= 5)
      {
        v15 = __biome_log_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[BMTextInputSessionEvent_v1 initWithProto:](v12);
        }

        uint64_t v13 = 4;
      }
      else
      {
        uint64_t v13 = qword_18EB36A08[(int)v11];
      }
      self = [(BMTextInputSessionEvent *)self initWithDateInterval:v9 bundleID:v10 sessionType:v13];

      v14 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMTextInputSessionEvent initWithProto:]();
      }
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMTextInputSessionEvent: unable to convert BMPBTextInputSessionType v1 enum value: %@", v4, v5, v6, v7, v8);
}

@end