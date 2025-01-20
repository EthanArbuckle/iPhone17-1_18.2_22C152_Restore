@interface CALNTriggeredEventNotificationSourceClientIdentifierUtilities
+ (id)_characterSetForEncodingIdentifierComponents;
+ (id)alarmIDForSourceClientIdentifier:(id)a3;
+ (id)eventIDForSourceClientIdentifier:(id)a3;
+ (id)sourceClientIdentifierForEventID:(id)a3 alarmID:(id)a4;
+ (void)eventID:(id *)a3 andAlarmID:(id *)a4 fromSourceClientIdentifier:(id)a5;
@end

@implementation CALNTriggeredEventNotificationSourceClientIdentifierUtilities

+ (id)_characterSetForEncodingIdentifierComponents
{
  if (_characterSetForEncodingIdentifierComponents_onceToken != -1) {
    dispatch_once(&_characterSetForEncodingIdentifierComponents_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)_characterSetForEncodingIdentifierComponents_characterSet;
  return v2;
}

void __109__CALNTriggeredEventNotificationSourceClientIdentifierUtilities__characterSetForEncodingIdentifierComponents__block_invoke()
{
  id v3 = [@";" stringByAppendingString:@"%"];
  v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v3];
  uint64_t v1 = [v0 invertedSet];
  v2 = (void *)_characterSetForEncodingIdentifierComponents_characterSet;
  _characterSetForEncodingIdentifierComponents_characterSet = v1;
}

+ (id)sourceClientIdentifierForEventID:(id)a3 alarmID:(id)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 _characterSetForEncodingIdentifierComponents];
  v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = &stru_26D3B3198;
  }
  v11 = v10;

  if (v6)
  {
    v12 = [a1 _characterSetForEncodingIdentifierComponents];
    uint64_t v13 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v12];
    v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = &stru_26D3B3198;
    }
    v16 = v15;

    v20[0] = v11;
    v20[1] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    v18 = [v17 componentsJoinedByString:@";"];
  }
  else
  {
    v18 = v11;
  }

  return v18;
}

+ (id)alarmIDForSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  id v12 = 0;
  [a1 eventID:&v12 andAlarmID:&v11 fromSourceClientIdentifier:v4];
  id v5 = v12;
  id v6 = v11;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities alarmIDForSourceClientIdentifier:]((uint64_t)v4, v9);
    }
  }
  return v7;
}

+ (id)eventIDForSourceClientIdentifier:(id)a3
{
  id v5 = 0;
  id v6 = 0;
  [a1 eventID:&v6 andAlarmID:&v5 fromSourceClientIdentifier:a3];
  id v3 = v6;

  return v3;
}

+ (void)eventID:(id *)a3 andAlarmID:(id *)a4 fromSourceClientIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = [v7 componentsSeparatedByString:@";"];
  *a3 = 0;
  *a4 = 0;
  if ([v8 count])
  {
    v9 = [v8 objectAtIndexedSubscript:0];
    v10 = [v9 stringByRemovingPercentEncoding];
    if ([v8 count] == 2
      && ([v8 objectAtIndexedSubscript:1], (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v12 = v11;
      uint64_t v13 = [v11 stringByRemovingPercentEncoding];
      *a3 = v10;
      if (v13)
      {
        id v14 = v13;
        *a4 = v14;
      }
    }
    else
    {
      id v12 = 0;
      *a3 = v10;
    }
  }
  else
  {
    v15 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:andAlarmID:fromSourceClientIdentifier:]((uint64_t)v7, v15);
    }
  }
}

+ (void)alarmIDForSourceClientIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2216BB000, a2, OS_LOG_TYPE_DEBUG, "Could not get alarm ID for source client identifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)eventID:(uint64_t)a1 andAlarmID:(NSObject *)a2 fromSourceClientIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Invalid sourceClientIdentifier (%{public}@). Could not find at least one component.", (uint8_t *)&v2, 0xCu);
}

@end