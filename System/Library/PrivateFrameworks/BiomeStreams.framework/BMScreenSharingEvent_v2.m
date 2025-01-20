@interface BMScreenSharingEvent_v2
- (BMScreenSharingEvent_v2)initWithProto:(id)a3;
@end

@implementation BMScreenSharingEvent_v2

- (BMScreenSharingEvent_v2)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMIntentEvent_v12 initWithProto:]();
      }
      v10 = 0;
      goto LABEL_15;
    }
    v5 = v4;
    uint64_t v6 = [v5 isStart];
    uint64_t v7 = [v5 type];
    if (v7 != 1)
    {
      uint64_t v8 = v7;
      if (v7 == 2)
      {
        uint64_t v9 = 1;
LABEL_14:
        v13.receiver = self;
        v13.super_class = (Class)BMScreenSharingEvent_v2;
        self = [(BMScreenSharingEvent *)&v13 initWithIsStart:v6 type:v9];
        v10 = self;
LABEL_15:

        goto LABEL_16;
      }
      v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[BMScreenSharingEvent_v2 initWithProto:](v8);
      }
    }
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMScreenSharingEvent: unable to convert BMPBScreenSharingEventType v2 enum value: %@", v4, v5, v6, v7, v8);
}

@end