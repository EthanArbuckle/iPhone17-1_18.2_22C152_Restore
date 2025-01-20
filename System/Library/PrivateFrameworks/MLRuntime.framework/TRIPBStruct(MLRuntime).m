@interface TRIPBStruct(MLRuntime)
- (id)mlr_arrayWithTRIPBListValue:()MLRuntime;
- (id)mlr_dictionaryRepresentation;
- (id)mlr_objectForTRIPBValue:()MLRuntime;
@end

@implementation TRIPBStruct(MLRuntime)

- (id)mlr_arrayWithTRIPBListValue:()MLRuntime
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = objc_msgSend(v4, "valuesArray", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "mlr_objectForTRIPBValue:", *(void *)(*((void *)&v13 + 1) + 8 * i));
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)mlr_objectForTRIPBValue:()MLRuntime
{
  id v4 = a3;
  switch([v4 kindOneOfCase])
  {
    case 1u:
      uint64_t v5 = [MEMORY[0x263EFF9D0] null];
      goto LABEL_7;
    case 2u:
      uint64_t v7 = NSNumber;
      [v4 numberValue];
      uint64_t v5 = objc_msgSend(v7, "numberWithDouble:");
      goto LABEL_7;
    case 3u:
      uint64_t v5 = [v4 stringValue];
      goto LABEL_7;
    case 4u:
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
LABEL_7:
      v6 = (void *)v5;
      break;
    case 5u:
      uint64_t v8 = [v4 structValue];
      uint64_t v9 = objc_msgSend(v8, "mlr_dictionaryRepresentation");
      goto LABEL_10;
    case 6u:
      uint64_t v8 = [v4 listValue];
      uint64_t v9 = objc_msgSend(a1, "mlr_arrayWithTRIPBListValue:", v8);
LABEL_10:
      v6 = (void *)v9;

      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)mlr_dictionaryRepresentation
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [a1 fields];
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * v6);
        uint64_t v8 = [a1 fields];
        uint64_t v9 = [v8 objectForKeyedSubscript:v7];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v13 = (void *)MEMORY[0x263EFF940];
          uint64_t v14 = *MEMORY[0x263EFF4A0];
          uint64_t v27 = *MEMORY[0x263F08320];
          long long v15 = [NSString stringWithFormat:@"value class=%@, key=%@", objc_opt_class(), v7];
          v28 = v15;
          long long v16 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          id v17 = [v13 exceptionWithName:v14 reason:@"Unexpected type in TRIPBStruct" userInfo:v16];

          objc_exception_throw(v17);
        }
        v10 = objc_msgSend(a1, "mlr_objectForTRIPBValue:", v9);
        if (v10)
        {
          [v2 setObject:v10 forKeyedSubscript:v7];
        }
        else
        {
          v11 = [MEMORY[0x263F3A438] coreChannel];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v24 = v7;
            __int16 v25 = 2112;
            v26 = v9;
            _os_log_error_impl(&dword_21C376000, v11, OS_LOG_TYPE_ERROR, "Nil obj in TRIPBStruct key%@, value=%@", buf, 0x16u);
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v4);
  }

  return v2;
}

@end