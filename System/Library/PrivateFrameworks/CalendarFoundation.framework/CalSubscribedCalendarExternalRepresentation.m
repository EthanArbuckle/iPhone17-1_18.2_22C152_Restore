@interface CalSubscribedCalendarExternalRepresentation
+ (id)dictionaryWithExternalRepresentationData:(id)a3;
+ (id)externalRepresentationDataWithDictionary:(id)a3;
+ (id)lastHolidayLanguageFromDictionary:(id)a3;
+ (id)lastHolidayRegionFromDictionary:(id)a3;
+ (id)logHandle;
+ (int)migrationVersionFromDictionary:(id)a3;
+ (unint64_t)subscribedCalendarRefreshFlagsFromDictionary:(id)a3;
+ (void)setLastHolidayLanguage:(id)a3 inDictionary:(id)a4;
+ (void)setLastHolidayRegion:(id)a3 inDictionary:(id)a4;
+ (void)setMigrationVersion:(int)a3 inDictionary:(id)a4;
+ (void)setSubscribedCalendarRefreshFlags:(unint64_t)a3 inDictionary:(id)a4;
@end

@implementation CalSubscribedCalendarExternalRepresentation

+ (id)logHandle
{
  if (logHandle_onceToken_0 != -1) {
    dispatch_once(&logHandle_onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)logHandle_logHandle_0;

  return v2;
}

uint64_t __56__CalSubscribedCalendarExternalRepresentation_logHandle__block_invoke()
{
  logHandle_logHandle_0 = (uint64_t)os_log_create("com.apple.calendar.foundation", "SubscribedCalendarExternalDataRepresentation");

  return MEMORY[0x1F41817F8]();
}

+ (id)externalRepresentationDataWithDictionary:(id)a3
{
  id v14 = 0;
  v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v14];
  id v5 = v14;
  if (!v4)
  {
    v6 = [a1 logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[CalSubscribedCalendarExternalRepresentation externalRepresentationDataWithDictionary:]((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  return v4;
}

+ (id)dictionaryWithExternalRepresentationData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v16 = 0;
    id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:1 format:0 error:&v16];
    id v6 = v16;
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_10;
      }
      uint64_t v7 = [a1 logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = objc_opt_class();
        +[CalSubscribedCalendarExternalRepresentation dictionaryWithExternalRepresentationData:v7];
      }
    }
    else
    {
      id v5 = [a1 logHandle];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[CalSubscribedCalendarExternalRepresentation dictionaryWithExternalRepresentationData:]((uint64_t)v6, v5, v9, v10, v11, v12, v13, v14);
      }
    }

    id v5 = 0;
LABEL_10:

    if (v5) {
      goto LABEL_12;
    }
  }
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
LABEL_12:

  return v5;
}

+ (unint64_t)subscribedCalendarRefreshFlagsFromDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"SCRefreshFlags"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v4 = (int)[v3 intValue];
  }
  else {
    unint64_t v4 = 4;
  }

  return v4;
}

+ (void)setSubscribedCalendarRefreshFlags:(unint64_t)a3 inDictionary:(id)a4
{
  id v5 = NSNumber;
  id v6 = a4;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [v6 setValue:v7 forKey:@"SCRefreshFlags"];
}

+ (id)lastHolidayLanguageFromDictionary:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"LastLanguage"];
}

+ (void)setLastHolidayLanguage:(id)a3 inDictionary:(id)a4
{
}

+ (id)lastHolidayRegionFromDictionary:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"LastRegion"];
}

+ (void)setLastHolidayRegion:(id)a3 inDictionary:(id)a4
{
}

+ (int)migrationVersionFromDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"migrationVersion"];
  int v4 = [v3 intValue];

  return v4;
}

+ (void)setMigrationVersion:(int)a3 inDictionary:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = NSNumber;
  id v6 = a4;
  id v7 = [v5 numberWithInt:v4];
  [v6 setObject:v7 forKeyedSubscript:@"migrationVersion"];
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
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "Got unexpected data type (%{public}@) after deserializing subscribed calendar external representation data", buf, 0xCu);
}

@end