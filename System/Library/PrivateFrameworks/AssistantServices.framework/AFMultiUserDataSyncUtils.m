@interface AFMultiUserDataSyncUtils
+ (id)audioAppSignalsDataKey;
+ (id)audioAppSignalsLastSyncTimestampKey;
+ (id)audioAppSignalsTimestampKey;
+ (id)localTime;
+ (id)retrieveAudioAppSignals;
+ (id)suiteName;
+ (void)storeAudioAppSignals:(id)a3;
@end

@implementation AFMultiUserDataSyncUtils

+ (id)localTime
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v5 = [v3 secondsFromGMTForDate:v2];
  double v6 = (double)([v4 secondsFromGMTForDate:v2] - v5);
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v2 sinceDate:v6];

  return v7;
}

+ (id)retrieveAudioAppSignals
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v4 = [a1 suiteName];
  uint64_t v5 = (void *)[v3 initWithSuiteName:v4];

  double v6 = [a1 localTime];
  v7 = [v6 description];
  v8 = [a1 audioAppSignalsLastSyncTimestampKey];
  [v5 setObject:v7 forKey:v8];

  v9 = [a1 audioAppSignalsDataKey];
  v10 = [v5 dataForKey:v9];

  return v10;
}

+ (void)storeAudioAppSignals:(id)a3
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F1CB18];
    id v5 = a3;
    id v6 = [v4 alloc];
    v7 = [a1 suiteName];
    id v12 = (id)[v6 initWithSuiteName:v7];

    v8 = [a1 audioAppSignalsDataKey];
    [v12 setObject:v5 forKey:v8];

    v9 = [a1 localTime];
    v10 = [v9 description];
    v11 = [a1 audioAppSignalsTimestampKey];
    [v12 setObject:v10 forKey:v11];
  }
}

+ (id)audioAppSignalsLastSyncTimestampKey
{
  return @"SiriInferenceAudioSignalsLastSyncTimestamp";
}

+ (id)audioAppSignalsTimestampKey
{
  return @"SiriInferenceAudioSignalsTimestamp";
}

+ (id)audioAppSignalsDataKey
{
  return @"SiriInferenceAudioSignals";
}

+ (id)suiteName
{
  return @"com.apple.assistant";
}

@end