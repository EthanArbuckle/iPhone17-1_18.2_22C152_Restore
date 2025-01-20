@interface SRTipKitSignalEmitter
+ (void)_checkAndEmitBluetoothInvocationSourcePerVehicle:(id)a3 forRequestOptions:(id)a4 btManager:(id)a5;
+ (void)_checkAndEmitCarPlayInvocationSourcePerVehicle:(id)a3 forRequestOptions:(id)a4 accessoryManager:(id)a5;
+ (void)_checkAndEmitHSSignalsWithSource:(id)a3 forRequestOptions:(id)a4;
+ (void)checkAndEmitSignalsForRequestOptions:(id)a3;
@end

@implementation SRTipKitSignalEmitter

+ (void)checkAndEmitSignalsForRequestOptions:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027B18;
  v7[3] = &unk_100142DC0;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (void)_checkAndEmitHSSignalsWithSource:(id)a3 forRequestOptions:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v5 isForStark])
  {
    if ([v5 requestSource] == (id)8 || objc_msgSend(v5, "requestSource") == (id)44)
    {
      CFStringRef v6 = @"com.apple.siri.hs.on.carplay";
LABEL_8:
      id v7 = [objc_alloc((Class)BMDiscoverabilitySignalEvent) initWithIdentifier:v6 bundleID:@"com.apple.siri" context:0];
      [v8 sendEvent:v7];

      goto LABEL_9;
    }
    if ([v5 requestSource] == (id)10 || objc_msgSend(v5, "requestSource") == (id)43)
    {
      CFStringRef v6 = @"com.apple.siri.button.on.carplay";
      goto LABEL_8;
    }
  }
LABEL_9:
}

+ (void)_checkAndEmitCarPlayInvocationSourcePerVehicle:(id)a3 forRequestOptions:(id)a4 accessoryManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 connectedAccessories];
  id v10 = objc_alloc_init((Class)NSData);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v31;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v16, "supportsCarPlay", (void)v30))
        {
          v17 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            v18 = v17;
            v19 = [v16 certSerial];
            *(_DWORD *)buf = 136315394;
            v35 = "+[SRTipKitSignalEmitter _checkAndEmitCarPlayInvocationSourcePerVehicle:forRequestOptions:accessoryManager:]";
            __int16 v36 = 2112;
            CFStringRef v37 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s #tipKitSignalEmitter certSerial %@", buf, 0x16u);
          }
          uint64_t v20 = [v16 certSerial];

          id v10 = (id)v20;
          goto LABEL_13;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  id v21 = objc_alloc_init((Class)NSMutableDictionary);
  [v21 setValue:v10 forKey:@"certSerial"];
  unsigned __int8 v22 = [v8 isForEyesFree];
  CFStringRef v23 = @"YES";
  if ((v22 & 1) == 0)
  {
    if (objc_msgSend(v8, "isForBluetoothCar", @"YES")) {
      CFStringRef v23 = @"YES";
    }
    else {
      CFStringRef v23 = @"NO";
    }
  }
  [v21 setValue:v23 forKey:@"isBluetoothCar"];
  if ([v8 isForStark]) {
    CFStringRef v24 = @"YES";
  }
  else {
    CFStringRef v24 = @"NO";
  }
  [v21 setValue:v24 forKey:@"isCarPlay"];
  if ([v8 isForStark])
  {
    uint64_t v25 = (uint64_t)[v8 requestSource];
    if (v25 > 11)
    {
      switch(v25)
      {
        case 44:
          goto LABEL_29;
        case 43:
          CFStringRef v26 = @"com.apple.siri.steering.wheel";
          goto LABEL_36;
        case 12:
LABEL_29:
          CFStringRef v26 = @"com.apple.siri.hs.on.jarvis";
          goto LABEL_36;
      }
    }
    else
    {
      switch(v25)
      {
        case 2:
          CFStringRef v26 = @"com.apple.siri.lock.button";
          goto LABEL_36;
        case 8:
          CFStringRef v26 = @"com.apple.siri.hs.on.carplay";
          goto LABEL_36;
        case 10:
          CFStringRef v26 = @"com.apple.siri.button.on.carplay";
LABEL_36:
          v28 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v35 = "+[SRTipKitSignalEmitter _checkAndEmitCarPlayInvocationSourcePerVehicle:forRequestOptions:accessoryManager:]";
            __int16 v36 = 2112;
            CFStringRef v37 = v26;
            __int16 v38 = 2112;
            id v39 = v21;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s #tipKitSignalEmitter activation source: %@ userInfo: %@", buf, 0x20u);
          }
          id v29 = [objc_alloc((Class)BMDiscoverabilitySignalEvent) initWithIdentifier:v26 bundleID:@"com.apple.siri" context:0 userInfo:v21];
          [v7 sendEvent:v29];

          goto LABEL_39;
      }
    }
    v27 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B7894(v27, v8);
    }
    CFStringRef v26 = &stru_1001463E0;
    goto LABEL_36;
  }
LABEL_39:
}

+ (void)_checkAndEmitBluetoothInvocationSourcePerVehicle:(id)a3 forRequestOptions:(id)a4 btManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = [v9 connectedDevices];
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v16, "ac_isEyesFree") & 1) != 0
          || objc_msgSend(v16, "ac_isBluetoothVehicle"))
        {
          uint64_t v17 = [v16 address];

          id v13 = (void *)v17;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v12);
  }
  else
  {
    id v13 = 0;
  }

  if ((([v8 isForEyesFree] & 1) != 0 || objc_msgSend(v8, "isForBluetoothCar"))&& v13)
  {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    [v18 setValue:v13 forKey:@"btAddress"];
    [v18 setValue:@"YES" forKey:@"isBluetoothCar"];
    [v18 setValue:@"NO" forKey:@"isCarPlay"];
    uint64_t v19 = (uint64_t)[v8 requestSource];
    CFStringRef v20 = &stru_1001463E0;
    if (v19 > 7)
    {
      if (v19 == 8)
      {
        CFStringRef v20 = @"com.apple.siri.hs.on.bt";
      }
      else
      {
        if (v19 != 43)
        {
LABEL_24:
          id v21 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
            sub_1000B7928(v21, v8);
          }
          goto LABEL_28;
        }
        CFStringRef v20 = @"com.apple.siri.steering.wheel";
      }
    }
    else
    {
      if (v19 != 2)
      {
        if (v19 == 5) {
          CFStringRef v20 = @"com.apple.siri.bt.headset";
        }
        goto LABEL_24;
      }
      CFStringRef v20 = @"com.apple.siri.lock.button";
    }
LABEL_28:
    unsigned __int8 v22 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v29 = "+[SRTipKitSignalEmitter _checkAndEmitBluetoothInvocationSourcePerVehicle:forRequestOptions:btManager:]";
      __int16 v30 = 2112;
      CFStringRef v31 = v20;
      __int16 v32 = 2112;
      id v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s #tipKitSignalEmitter bluetooth car activation source: %@ userInfo: %@", buf, 0x20u);
    }
    id v23 = [objc_alloc((Class)BMDiscoverabilitySignalEvent) initWithIdentifier:v20 bundleID:@"com.apple.siri" context:0 userInfo:v18];
    [v7 sendEvent:v23];
  }
}

@end