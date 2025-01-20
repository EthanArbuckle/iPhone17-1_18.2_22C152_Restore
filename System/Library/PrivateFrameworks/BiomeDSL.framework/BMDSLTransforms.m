@interface BMDSLTransforms
+ (id)allowedClasses;
+ (id)allowedTransforms;
+ (id)arrayTuplesToDictionary:(id)a3;
+ (id)durationForEventWithTimestamp:(id)a3 isStart:(id)a4 key:(id)a5 keyName:(id)a6 startEventsState:(id)a7 metadata:(id)a8;
+ (id)durationForEventWithTimestamp:(id)a3 isStart:(id)a4 key:(id)a5 startEventsState:(id)a6;
+ (id)firstEventOfDayWithEvent:(id)a3 timestamp:(id)a4 lastTimestampBuffer:(id)a5 dayStartOffset:(id)a6;
@end

@implementation BMDSLTransforms

+ (id)arrayTuplesToDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", 0, (void)v15);
        v12 = [v10 objectAtIndexedSubscript:1];
        [v4 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v4 copy];
  return v13;
}

+ (id)durationForEventWithTimestamp:(id)a3 isStart:(id)a4 key:(id)a5 startEventsState:(id)a6
{
  return +[BMDSLTransforms durationForEventWithTimestamp:a3 isStart:a4 key:a5 keyName:@"key" startEventsState:a6 metadata:0];
}

+ (id)durationForEventWithTimestamp:(id)a3 isStart:(id)a4 key:(id)a5 keyName:(id)a6 startEventsState:(id)a7 metadata:(id)a8
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v15)
  {
    int v19 = [v14 BOOLValue];
    uint64_t v20 = [v17 objectForKeyedSubscript:v15];

    if (v19)
    {
      if (v20)
      {
        v21 = __biome_log_for_category();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[BMDSLTransforms durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:]();
        }
      }
      [v17 setObject:v13 forKeyedSubscript:v15];
      goto LABEL_17;
    }
    if (v20)
    {
      [v13 doubleValue];
      double v24 = v23;
      v25 = [v17 objectForKeyedSubscript:v15];
      [v25 doubleValue];
      double v27 = v24 - v26;

      if (v27 >= 0.0)
      {
        [v17 removeObjectForKey:v15];
        if (v18)
        {
          v36[0] = v15;
          v35[0] = v16;
          v35[1] = @"duration";
          v30 = [MEMORY[0x1E4F28ED0] numberWithDouble:v27];
          v35[2] = @"metadata";
          v36[1] = v30;
          v36[2] = v18;
          v31 = (void *)MEMORY[0x1E4F1C9E8];
          v32 = v36;
          v33 = v35;
          uint64_t v34 = 3;
        }
        else
        {
          v37[0] = v16;
          v37[1] = @"duration";
          v38[0] = v15;
          v30 = [MEMORY[0x1E4F28ED0] numberWithDouble:v27];
          v38[1] = v30;
          v31 = (void *)MEMORY[0x1E4F1C9E8];
          v32 = v38;
          v33 = v37;
          uint64_t v34 = 2;
        }
        v28 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:v34];

        goto LABEL_18;
      }
      v22 = __biome_log_for_category();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[BMDSLTransforms durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:].cold.4();
      }
    }
    else
    {
      v22 = __biome_log_for_category();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[BMDSLTransforms durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:]();
      }
    }
  }
  else
  {
    v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[BMDSLTransforms durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:]();
    }
  }

LABEL_17:
  v28 = 0;
LABEL_18:

  return v28;
}

+ (id)firstEventOfDayWithEvent:(id)a3 timestamp:(id)a4 lastTimestampBuffer:(id)a5 dayStartOffset:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v12 integerValue] < 0 || objc_msgSend(v12, "integerValue") >= 86400)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[BMDSLTransforms firstEventOfDayWithEvent:timestamp:lastTimestampBuffer:dayStartOffset:]((uint64_t)v12);
    }
    id v13 = 0;
  }
  else
  {
    id v14 = [v11 objectForKeyedSubscript:@"lastTimestamp"];
    [v11 setObject:v10 forKeyedSubscript:@"lastTimestamp"];
    if (v14)
    {
      id v15 = (void *)MEMORY[0x1E4F1C9C8];
      [v10 doubleValue];
      double v17 = v16;
      [v12 doubleValue];
      int v19 = [v15 dateWithTimeIntervalSinceReferenceDate:v17 - v18];
      uint64_t v20 = (void *)MEMORY[0x1E4F1C9C8];
      [v14 doubleValue];
      double v22 = v21;
      [v12 doubleValue];
      double v24 = [v20 dateWithTimeIntervalSinceReferenceDate:v22 - v23];
      v25 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      if ([v25 isDate:v19 inSameDayAsDate:v24]) {
        id v13 = 0;
      }
      else {
        id v13 = v9;
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  return v13;
}

+ (id)allowedTransforms
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F0B36958];
  return v2;
}

+ (id)allowedClasses
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F0B36970];
  return v2;
}

+ (void)durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3086000, v0, v1, "Duration transform: key is nil.", v2, v3, v4, v5, v6);
}

+ (void)durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3086000, v0, v1, "Duration transform: unexpected starting event.", v2, v3, v4, v5, v6);
}

+ (void)durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3086000, v0, v1, "Duration transform: unexpected non-starting event.", v2, v3, v4, v5, v6);
}

+ (void)durationForEventWithTimestamp:isStart:key:keyName:startEventsState:metadata:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3086000, v0, v1, "Duration transform: dropping invalid duration (<0).", v2, v3, v4, v5, v6);
}

+ (void)firstEventOfDayWithEvent:(uint64_t)a1 timestamp:lastTimestampBuffer:dayStartOffset:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B3086000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Invalid dayStartOffset %@. It should be greater than or equal to 0 and less than 86400.", (uint8_t *)&v1, 0xCu);
}

@end