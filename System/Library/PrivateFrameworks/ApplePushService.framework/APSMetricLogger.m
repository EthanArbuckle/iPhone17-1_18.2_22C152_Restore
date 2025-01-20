@interface APSMetricLogger
+ (unsigned)dualChannelStateFrom:(id)a3 isPiggyBacking:(BOOL)a4;
+ (unsigned)sslErrorFromErrorCode:(int64_t)a3;
+ (void)connectionConnectedWithDuration:(id)a3 interface:(int64_t)a4 linkQuality:(id)a5 dualChannelState:(unsigned int)a6 dnsResolutionTimeMilliseconds:(id)a7 tlsHandshakeTimeMilliseconds:(id)a8;
+ (void)connectionDisconnected:(int64_t)a3 linkQuality:(id)a4 reason:(unsigned int)a5;
+ (void)connectionEncounteredSSLError:(unsigned int)a3 interface:(int64_t)a4;
+ (void)filterSent:(id)a3 connectionType:(int64_t)a4;
@end

@implementation APSMetricLogger

+ (void)filterSent:(id)a3 connectionType:(int64_t)a4
{
  id v5 = a3;
  v6 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.APSD", kAPSPushFilterSentMetricName];
  v7 = +[NSMutableDictionary dictionary];
  v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 topicGroupChange]);
  if (v8) {
    CFDictionarySetValue(v7, @"changeType", v8);
  }

  v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 reason]);
  if (v9) {
    CFDictionarySetValue(v7, @"reason", v9);
  }

  v10 = +[NSNumber numberWithInteger:a4];
  if (v10) {
    CFDictionarySetValue(v7, @"connectionType", v10);
  }

  v11 = [v5 triggeringTopic];
  if (v11) {
    CFDictionarySetValue(v7, @"triggeringTopic", v11);
  }

  v12 = +[APSLog courier];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending filter event to CA: %@", buf, 0xCu);
  }

  AnalyticsSendEvent();
}

+ (void)connectionConnectedWithDuration:(id)a3 interface:(int64_t)a4 linkQuality:(id)a5 dualChannelState:(unsigned int)a6 dnsResolutionTimeMilliseconds:(id)a7 tlsHandshakeTimeMilliseconds:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  v17 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.APSD", kAPSPushConnectionConnectedMetricName];
  v18 = +[NSMutableDictionary dictionary];
  v19 = v18;
  if (v15) {
    CFDictionarySetValue(v18, @"dnsResolutionTimeMilliseconds", v15);
  }
  if (v16) {
    CFDictionarySetValue(v19, @"tlsHandshakeTimeMilliseconds", v16);
  }
  if (v13) {
    CFDictionarySetValue(v19, @"connectDuration", v13);
  }
  if (v14) {
    CFDictionarySetValue(v19, @"linkQuality", v14);
  }
  v20 = +[NSNumber numberWithUnsignedInt:v10];
  if (v20) {
    CFDictionarySetValue(v19, @"dualChannelState", v20);
  }

  v21 = +[NSNumber numberWithInteger:a4];
  if (v21) {
    CFDictionarySetValue(v19, @"interface", v21);
  }

  v22 = +[APSLog courier];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v19;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending filter event to CA: %@", buf, 0xCu);
  }

  AnalyticsSendEvent();
}

+ (void)connectionDisconnected:(int64_t)a3 linkQuality:(id)a4 reason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  v8 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.APSD", kAPSPushConnectionDisconnectedMetricName];
  v9 = +[NSMutableDictionary dictionary];
  uint64_t v10 = +[NSNumber numberWithUnsignedInt:v5];
  if (v10) {
    CFDictionarySetValue(v9, @"disconnectReason", v10);
  }

  if (v7) {
    CFDictionarySetValue(v9, @"linkQuality", v7);
  }
  v11 = +[NSNumber numberWithInteger:a3];
  if (v11) {
    CFDictionarySetValue(v9, @"interface", v11);
  }

  v12 = +[APSLog courier];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending disconnect event to CA: %@", buf, 0xCu);
  }

  AnalyticsSendEvent();
}

+ (void)connectionEncounteredSSLError:(unsigned int)a3 interface:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.APSD", kAPSPushConnectionSSLError];
  id v7 = +[NSMutableDictionary dictionary];
  v8 = +[NSNumber numberWithUnsignedInt:v5];
  if (v8) {
    CFDictionarySetValue(v7, @"sslError", v8);
  }

  v9 = +[NSNumber numberWithInteger:a4];
  if (v9) {
    CFDictionarySetValue(v7, @"interface", v9);
  }

  uint64_t v10 = +[APSLog courier];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending disconnect event to CA: %@", buf, 0xCu);
  }

  AnalyticsSendEvent();
}

+ (unsigned)dualChannelStateFrom:(id)a3 isPiggyBacking:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ([v5 isConnectedOnInterface:0]
      && ![v6 isConnectedOnInterface:1])
    {
      unsigned int v7 = 2;
    }
    else if (([v6 isConnectedOnInterface:0] & 1) != 0 {
           || ([v6 isConnectedOnInterface:1] & 1) == 0)
    }
    {
      if ((unint64_t)[v6 countConnectedInterfaces] >= 2 && v4)
      {
        unsigned int v7 = 4;
      }
      else if ((unint64_t)[v6 countConnectedInterfaces] < 2 || v4)
      {
        unsigned int v7 = 1;
      }
      else
      {
        unsigned int v7 = 5;
      }
    }
    else
    {
      unsigned int v7 = 3;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

+ (unsigned)sslErrorFromErrorCode:(int64_t)a3
{
  return 0;
}

@end