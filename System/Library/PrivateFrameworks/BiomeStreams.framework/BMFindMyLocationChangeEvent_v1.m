@interface BMFindMyLocationChangeEvent_v1
- (BMFindMyLocationChangeEvent_v1)initWithProto:(id)a3;
@end

@implementation BMFindMyLocationChangeEvent_v1

- (BMFindMyLocationChangeEvent_v1)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [v5 idsHandle];
      uint64_t v7 = [v5 locationChangeType];
      uint64_t v8 = v7;
      if (v7 >= 4)
      {
        v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMFindMyLocationChangeEvent_v1 initWithProto:](v8);
        }

        uint64_t v9 = 3;
      }
      else
      {
        uint64_t v9 = qword_18EB369B0[(int)v7];
      }
      uint64_t v12 = activityTypeWithState([v5 activityState]);
      v13 = NSNumber;
      [v5 latitude];
      v14 = objc_msgSend(v13, "numberWithDouble:");
      v15 = NSNumber;
      [v5 longitude];
      v16 = objc_msgSend(v15, "numberWithDouble:");
      v17 = [v5 name];
      self = [(BMFindMyLocationChangeEvent *)self initWithIDSHandle:v6 locationChangeType:v9 motionActivityState:v12 latitude:v14 longitude:v16 name:v17];

      v10 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMFindMyLocationChangeEvent initWithProto:]();
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
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMFindMyLocationChangeEvent: unable to convert BMPBFindMyLocationChangeType v1 enum value: %@", v4, v5, v6, v7, v8);
}

@end