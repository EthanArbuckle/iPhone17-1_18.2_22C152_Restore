@interface AKBAATimeProvider
+ (id)sharedInstance;
- (BOOL)_useEpochTimestamp;
- (BOOL)_useIDSDate;
- (double)_serverTimeAdjustment;
- (double)_systemEpochTime;
- (double)_timeIntervalWithAdjustment;
- (id)adjustedDeviceTime;
- (int64_t)clientServerTimeDiffInMS;
- (void)addServerAdjustment:(id)a3;
@end

@implementation AKBAATimeProvider

+ (id)sharedInstance
{
  if (qword_100272638 != -1) {
    dispatch_once(&qword_100272638, &stru_10022B148);
  }
  v2 = (void *)qword_100272640;

  return v2;
}

- (double)_systemEpochTime
{
  v2 = +[NSDate date];
  [v2 timeIntervalSince1970];
  double v4 = v3;

  return v4;
}

- (id)adjustedDeviceTime
{
  [(AKBAATimeProvider *)self _timeIntervalWithAdjustment];
  double v4 = v3;
  if ([(AKBAATimeProvider *)self _useEpochTimestamp])
  {
    v5 = +[NSNumber numberWithDouble:floor(v4 * 1000.0)];
    [v5 stringValue];
  }
  else
  {
    v5 = +[NSDate dateWithTimeIntervalSince1970:v4];
    objc_msgSend(v5, "ak_serverFriendlyString");
  v6 = };

  return v6;
}

- (double)_timeIntervalWithAdjustment
{
  if ([(AKBAATimeProvider *)self _useIDSDate])
  {
    double v3 = +[IDSCurrentServerTime sharedInstance];
    [v3 currentServerTimeInterval];
    double v5 = v4;

    return v5;
  }
  else
  {
    [(AKBAATimeProvider *)self _serverTimeAdjustment];
    double v8 = v7;
    [(AKBAATimeProvider *)self _systemEpochTime];
    return v8 + v9;
  }
}

- (int64_t)clientServerTimeDiffInMS
{
  double v3 = +[IDSCurrentServerTime sharedInstance];
  [v3 currentServerTimeInterval];
  double v5 = v4;

  [(AKBAATimeProvider *)self _systemEpochTime];
  return (uint64_t)(v6 - v5);
}

- (BOOL)_useIDSDate
{
  v2 = +[AKURLBag sharedBag];
  double v3 = [v2 baaConfiguration];
  double v4 = [v3 valueForKey:@"use-ids-time"];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (double)_serverTimeAdjustment
{
  v2 = +[AKConfiguration sharedConfiguration];
  double v3 = [v2 configurationValueForKey:@"_AKServerTimeAdjustmentKey"];
  double v4 = (double)(uint64_t)[v3 integerValue];

  return v4;
}

- (void)addServerAdjustment:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    if (![v4 caseInsensitiveCompare:@"clear"])
    {
      double v8 = +[AKConfiguration sharedConfiguration];
      [v8 setConfigurationValue:0 forKey:@"_AKServerTimeAdjustmentKey"];
LABEL_10:

      id v4 = v13;
      goto LABEL_11;
    }
    if ([(AKBAATimeProvider *)self _useEpochTimestamp])
    {
      unsigned __int8 v5 = objc_msgSend(v13, "ak_numberObject");
      [v5 doubleValue];
      uint64_t v7 = (uint64_t)v6;
    }
    else
    {
      unsigned __int8 v5 = +[NSDate ak_dateFromString:v13];
      id v4 = v13;
      if (!v5) {
        goto LABEL_11;
      }
      [v5 timeIntervalSince1970];
      uint64_t v7 = 1000 * (uint64_t)v9;
    }

    id v4 = v13;
    if (v7 >= 1704067200000)
    {
      [(AKBAATimeProvider *)self _systemEpochTime];
      unint64_t v11 = llround((double)(v7 / 0x3E8uLL) - v10);
      double v8 = +[AKConfiguration sharedConfiguration];
      v12 = +[NSNumber numberWithLongLong:v11];
      [v8 setConfigurationValue:v12 forKey:@"_AKServerTimeAdjustmentKey"];

      goto LABEL_10;
    }
  }
LABEL_11:
}

- (BOOL)_useEpochTimestamp
{
  v2 = +[AKURLBag sharedBag];
  double v3 = [v2 baaConfiguration];
  id v4 = [v3 valueForKey:@"use-epoch-time"];
  if ([v4 BOOLValue])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    double v6 = +[AKConfiguration sharedConfiguration];
    uint64_t v7 = [v6 configurationValueForKey:@"_AKUseEpochTimestamp"];
    unsigned __int8 v5 = [v7 BOOLValue];
  }
  return v5;
}

@end