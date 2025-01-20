@interface BMSemanticLocationEvent_v1
- (BMSemanticLocationEvent_v1)initWithProto:(id)a3;
@end

@implementation BMSemanticLocationEvent_v1

- (BMSemanticLocationEvent_v1)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = typeFromBMPBSemanticLocationUserSpecificPlaceType([v5 userSpecificPlaceType]);
      uint64_t v7 = [v5 placeType];
      uint64_t v8 = v7;
      if (v7 >= 4)
      {
        v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMSemanticLocationEvent_v1 initWithProto:](v8);
        }

        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = v7;
      }
      self = [(BMSemanticLocationEvent *)self initWithUserSpecificPlaceType:v6 placeType:v9 starting:[v5 starting]];
      v10 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMSemanticLocationEvent initWithProto:]();
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
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSemanticLocationEvent: unable to convert BMPBSemanticLocationPlaceType v1 enum value: %@", v4, v5, v6, v7, v8);
}

@end