@interface CalExchangeCalendarItemExternalRepresentation
+ (id)dictionaryWithExternalRepresentationData:(id)a3;
+ (id)externalRepresentationDataWithDictionary:(id)a3;
+ (id)logHandle;
@end

@implementation CalExchangeCalendarItemExternalRepresentation

+ (id)logHandle
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)logHandle_logHandle;
  return v2;
}

uint64_t __58__CalExchangeCalendarItemExternalRepresentation_logHandle__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.database", "CalExchangeCalendarItemExternalRepresentation");
  uint64_t v1 = logHandle_logHandle;
  logHandle_logHandle = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)externalRepresentationDataWithDictionary:(id)a3
{
  id v15 = 0;
  v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:&v15];
  id v5 = v15;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [a1 logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CalExchangeCalendarItemExternalRepresentation externalRepresentationDataWithDictionary:]((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return v4;
}

+ (id)dictionaryWithExternalRepresentationData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = 0;
    goto LABEL_12;
  }
  id v16 = 0;
  id v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v16];
  id v6 = v16;
  if (!v5)
  {
    id v5 = [a1 logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CalExchangeCalendarItemExternalRepresentation dictionaryWithExternalRepresentationData:]((uint64_t)v6, v5, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [a1 logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      +[CalExchangeCalendarItemExternalRepresentation dictionaryWithExternalRepresentationData:v7];
    }

LABEL_10:
    id v5 = 0;
  }

LABEL_12:
  return v5;
}

+ (void)externalRepresentationDataWithDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)dictionaryWithExternalRepresentationData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)dictionaryWithExternalRepresentationData:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)dictionaryWithExternalRepresentationData:(os_log_t)log .cold.3(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A8E81000, log, OS_LOG_TYPE_ERROR, "Got unexpected data type (%{public}@) after deserializing Exchange calendar item external representation data", buf, 0xCu);
}

@end