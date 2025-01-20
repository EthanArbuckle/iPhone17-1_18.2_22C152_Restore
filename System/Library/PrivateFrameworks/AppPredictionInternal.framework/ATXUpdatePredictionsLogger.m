@interface ATXUpdatePredictionsLogger
- (ATXUpdatePredictionsLogger)init;
- (ATXUpdatePredictionsLogger)initWithUserDefaults:(id)a3 petLogger:(id)a4;
- (NSDate)now;
- (double)_normalizeCountPer24HoursWithStartDate:(id)a3 endDate:(id)a4 count:(unint64_t)a5;
- (id)_countDictionaryDefaultsKeyForClient:(unint64_t)a3;
- (id)_countDictionaryForClient:(unint64_t)a3;
- (id)_lastLogDate;
- (id)_protobufForTriggerType:(int)a3 client:(unint64_t)a4;
- (id)_stringForATXUpdatePredictionsClient:(unint64_t)a3;
- (int)_clientTypeForUpdatePredictionsClient:(unint64_t)a3;
- (int)_triggerTypeForUpdatePredictionsReason:(unint64_t)a3;
- (void)_incrementCountInDictionary:(id)a3 forTriggerType:(int)a4;
- (void)_logPredictionUpdatesForClient:(unint64_t)a3 lastLogDate:(id)a4 now:(id)a5;
- (void)_resetCountDictionariesForAllClients;
- (void)_setCountDictionary:(id)a3 forClient:(unint64_t)a4;
- (void)_setLastLogDate:(id)a3;
- (void)countPredictionUpdateWithReason:(unint64_t)a3 client:(unint64_t)a4;
- (void)flushCountedPredictionUpdatesToLogger;
- (void)setNow:(id)a3;
@end

@implementation ATXUpdatePredictionsLogger

- (ATXUpdatePredictionsLogger)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v5 = objc_opt_new();
  v6 = [(ATXUpdatePredictionsLogger *)self initWithUserDefaults:v4 petLogger:v5];

  return v6;
}

- (ATXUpdatePredictionsLogger)initWithUserDefaults:(id)a3 petLogger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXUpdatePredictionsLogger;
  v9 = [(ATXUpdatePredictionsLogger *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v10->_petLogger, a4);
  }

  return v10;
}

- (void)countPredictionUpdateWithReason:(unint64_t)a3 client:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v7 = [MEMORY[0x1E4F93B10] isClassCLocked];
  if (a3 != 22 && (v7 & 1) == 0)
  {
    pthread_mutex_lock(&lock_1);
    id v8 = [(ATXUpdatePredictionsLogger *)self _countDictionaryForClient:a4];
    [(ATXUpdatePredictionsLogger *)self _incrementCountInDictionary:v8 forTriggerType:[(ATXUpdatePredictionsLogger *)self _triggerTypeForUpdatePredictionsReason:a3]];
    [(ATXUpdatePredictionsLogger *)self _incrementCountInDictionary:v8 forTriggerType:7];
    [(ATXUpdatePredictionsLogger *)self _setCountDictionary:v8 forClient:a4];
    v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = [(ATXUpdatePredictionsLogger *)self _stringForATXUpdatePredictionsClient:a4];
      v11 = +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:a3];
      int v12 = 138412802;
      v13 = v10;
      __int16 v14 = 2112;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_debug_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEBUG, "ATXUpdatePredictionsLogger: update for client %@ with reason %@ and countDictionary %@", (uint8_t *)&v12, 0x20u);
    }
    pthread_mutex_unlock(&lock_1);
  }
}

- (void)flushCountedPredictionUpdatesToLogger
{
}

- (void)_logPredictionUpdatesForClient:(unint64_t)a3 lastLogDate:(id)a4 now:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(ATXUpdatePredictionsLogger *)self _countDictionaryForClient:a3];
  uint64_t v11 = 0;
  *(void *)&long long v12 = 138412802;
  long long v20 = v12;
  do
  {
    v13 = -[ATXUpdatePredictionsLogger _protobufForTriggerType:client:](self, "_protobufForTriggerType:client:", v11, a3, v20);
    __int16 v14 = [v10 objectForKey:off_1E68B56D8[v11]];
    -[ATXUpdatePredictionsLogger _normalizeCountPer24HoursWithStartDate:endDate:count:](self, "_normalizeCountPer24HoursWithStartDate:endDate:count:", v8, v9, [v14 unsignedIntegerValue]);
    double v16 = v15;
    v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = [(ATXUpdatePredictionsLogger *)self _stringForATXUpdatePredictionsClient:a3];
      v19 = off_1E68B56D8[v11];
      *(_DWORD *)buf = v20;
      id v22 = v18;
      __int16 v23 = 2112;
      v24 = v19;
      __int16 v25 = 2048;
      double v26 = v16;
      _os_log_debug_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEBUG, "ATXUpdatePredictionsLogger: logging for client %@ trigger type %@ count %f", buf, 0x20u);
    }
    [(ATXPETEventTracker2Protocol *)self->_petLogger trackDistributionForMessage:v13 value:v16];

    ++v11;
  }
  while (v11 != 8);
}

- (id)_countDictionaryDefaultsKeyForClient:(unint64_t)a3
{
  id v3 = [(ATXUpdatePredictionsLogger *)self _stringForATXUpdatePredictionsClient:a3];
  v4 = (void *)[[NSString alloc] initWithFormat:@"%@-%@", @"ATXUpdatePredictionsLoggerCountsDictionary", v3];

  return v4;
}

- (id)_countDictionaryForClient:(unint64_t)a3
{
  v4 = [(ATXUpdatePredictionsLogger *)self _countDictionaryDefaultsKeyForClient:a3];
  v5 = [(NSUserDefaults *)self->_userDefaults objectForKey:v4];
  id v6 = (id)[v5 mutableCopy];

  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  return v6;
}

- (void)_incrementCountInDictionary:(id)a3 forTriggerType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v9 = v5;
  if (v4 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v5 = v9;
  }
  else
  {
    id v6 = off_1E68B56D8[(int)v4];
  }
  char v7 = [v5 objectForKey:v6];
  if (!v7) {
    char v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:0];
  }
  id v8 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + 1);
  [v9 setObject:v8 forKey:v6];
}

- (void)_setCountDictionary:(id)a3 forClient:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(ATXUpdatePredictionsLogger *)self _countDictionaryDefaultsKeyForClient:a4];
  [(NSUserDefaults *)self->_userDefaults setObject:v6 forKey:v7];
}

- (void)_resetCountDictionariesForAllClients
{
  uint64_t v3 = MEMORY[0x1E4F1CC08];
  [(ATXUpdatePredictionsLogger *)self _setCountDictionary:MEMORY[0x1E4F1CC08] forClient:0];
  [(ATXUpdatePredictionsLogger *)self _setCountDictionary:v3 forClient:1];
}

- (double)_normalizeCountPer24HoursWithStartDate:(id)a3 endDate:(id)a4 count:(unint64_t)a5
{
  [a4 timeIntervalSinceDate:a3];
  return (double)a5 / (v6 / 86400.0);
}

- (id)_lastLogDate
{
  return [(NSUserDefaults *)self->_userDefaults objectForKey:@"ATXUpdatePredictionsLoggerLastLogDate"];
}

- (void)_setLastLogDate:(id)a3
{
}

- (id)_protobufForTriggerType:(int)a3 client:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_opt_new();
  [v7 setTriggerType:v5];
  objc_msgSend(v7, "setClientType:", -[ATXUpdatePredictionsLogger _clientTypeForUpdatePredictionsClient:](self, "_clientTypeForUpdatePredictionsClient:", a4));
  return v7;
}

- (int)_triggerTypeForUpdatePredictionsReason:(unint64_t)a3
{
  int result = 0;
  switch(a3)
  {
    case 0uLL:
    case 0x16uLL:
    case 0x17uLL:
      uint64_t v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ATXUpdatePredictionsLogger _triggerTypeForUpdatePredictionsReason:](a3, v5, v6, v7, v8, v9, v10, v11);
      }

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"stringForConsumerType called with invalid ATXEngagementType value of %lu", a3);
      goto LABEL_2;
    case 1uLL:
      int result = 1;
      break;
    case 2uLL:
      int result = 2;
      break;
    case 3uLL:
      int result = 3;
      break;
    case 5uLL:
      int result = 4;
      break;
    case 6uLL:
      int result = 5;
      break;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
LABEL_2:
      int result = 6;
      break;
    default:
      return result;
  }
  return result;
}

- (int)_clientTypeForUpdatePredictionsClient:(unint64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ATXUpdatePredictionsLogger _clientTypeForUpdatePredictionsClient:](a3, v5, v6, v7, v8, v9, v10, v11);
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"_clientTypeForUpdatePredictionsClient called with invalid ATXUpdatePredictionsClient value of %lu", a3);
  return 0x7FFFFFFF;
}

- (id)_stringForATXUpdatePredictionsClient:(unint64_t)a3
{
  if (!a3) {
    return @"AppPredictions";
  }
  if (a3 == 1) {
    return @"ActionPredictions";
  }
  uint64_t v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ATXUpdatePredictionsLogger _stringForATXUpdatePredictionsClient:](a3, v5, v6, v7, v8, v9, v10, v11);
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"stringForATXUpdatePredictionsClient called with invalid ATXUpdatePredictionsClient value of %lu", a3);
  return @"Error";
}

- (NSDate)now
{
  now = self->_now;
  if (now) {
    uint64_t v3 = now;
  }
  else {
    uint64_t v3 = (NSDate *)objc_opt_new();
  }
  return v3;
}

- (void)setNow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_petLogger, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)_triggerTypeForUpdatePredictionsReason:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_clientTypeForUpdatePredictionsClient:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_stringForATXUpdatePredictionsClient:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end