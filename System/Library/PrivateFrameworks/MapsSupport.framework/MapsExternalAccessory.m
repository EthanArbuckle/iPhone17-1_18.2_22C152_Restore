@interface MapsExternalAccessory
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (id)sharedInstance;
- (BOOL)_isCurrentStateEqualLastPostedState;
- (BOOL)hasEngineType;
- (BOOL)isConnected;
- (BOOL)isHybridEngineType;
- (BOOL)needsFuel;
- (EAAccessory)accessory;
- (MapsExternalAccessory)init;
- (MapsExternalAccessoryState)currentState;
- (MapsExternalAccessoryState)lastPostedState;
- (id)identifier;
- (id)methodSignatureForSelector:(SEL)a3;
- (int)primaryEngineType;
- (void)_accessoryDidConnect:(id)a3;
- (void)_accessoryDidDisconnect:(id)a3;
- (void)_accessoryDidUpdate:(id)a3;
- (void)_accessoryDidUpdateVehicle:(id)a3;
- (void)_disconnectFromVehicle;
- (void)_handleFake:(id)a3;
- (void)_postNotificationIfNeeded;
- (void)_startListenForDebugTestNotifications;
- (void)_stopListenForDebugTestNotifications;
- (void)_updateFromNotificationName:(id)a3 userInfo:(id)a4;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)sendDestinationInformation:(id)a3 identifier:(id)a4;
- (void)setAccessory:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setLastPostedState:(id)a3;
@end

@implementation MapsExternalAccessory

+ (id)sharedInstance
{
  if (qword_1000A2450 != -1) {
    dispatch_once(&qword_1000A2450, &stru_100088E30);
  }
  v2 = (void *)qword_1000A2448;

  return v2;
}

- (MapsExternalAccessory)init
{
  v40.receiver = self;
  v40.super_class = (Class)MapsExternalAccessory;
  v2 = [(MapsExternalAccessory *)&v40 init];
  v2->_initialising = 1;
  v3 = sub_100005CB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(MapsExternalAccessory *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_7;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_7:

    *(_DWORD *)buf = 138543362;
    v44 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] registering for EAAccessory notifications", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v2);
  v10 = +[NSNotificationCenter defaultCenter];
  v11 = +[NSOperationQueue mainQueue];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100006A60;
  v38[3] = &unk_100088E58;
  objc_copyWeak(&v39, (id *)buf);
  v12 = [v10 addObserverForName:EAAccessoryDidConnectNotification object:0 queue:v11 usingBlock:v38];
  v42[0] = v12;
  v13 = +[NSOperationQueue mainQueue];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100006ABC;
  v36[3] = &unk_100088E58;
  objc_copyWeak(&v37, (id *)buf);
  v14 = [v10 addObserverForName:EAAccessoryVehicleDataUpdateNotification object:0 queue:v13 usingBlock:v36];
  v42[1] = v14;
  v15 = +[NSOperationQueue mainQueue];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100006B18;
  v34[3] = &unk_100088E58;
  objc_copyWeak(&v35, (id *)buf);
  v16 = [v10 addObserverForName:EAAccessoryUpdateNotification object:0 queue:v15 usingBlock:v34];
  v42[2] = v16;
  v17 = +[NSOperationQueue mainQueue];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100006B74;
  v32[3] = &unk_100088E58;
  objc_copyWeak(&v33, (id *)buf);
  v18 = [v10 addObserverForName:EAAccessoryDidDisconnectNotification object:0 queue:v17 usingBlock:v32];
  v42[3] = v18;
  uint64_t v19 = +[NSArray arrayWithObjects:v42 count:4];
  notificationObservers = v2->_notificationObservers;
  v2->_notificationObservers = (NSArray *)v19;

  v21 = +[EAAccessoryManager sharedAccessoryManager];
  [v21 registerForLocalNotifications];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v22 = [v21 connectedAccessories];
  id v23 = [v22 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v29;
    while (2)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v22);
        }
        v26 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v26 supportsCarPlay])
        {
          [(MapsExternalAccessory *)v2 setAccessory:v26];
          goto LABEL_18;
        }
      }
      id v23 = [v22 countByEnumeratingWithState:&v28 objects:v41 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  [(MapsExternalAccessory *)v2 _startListenForDebugTestNotifications];
  v2->_initialising = 0;

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);

  objc_destroyWeak((id *)buf);
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[EAAccessoryManager sharedAccessoryManager];
  [v4 unregisterForLocalNotifications];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_notificationObservers;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        v11 = +[NSNotificationCenter defaultCenter];
        [v11 removeObserver:v10];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  notificationObservers = self->_notificationObservers;
  self->_notificationObservers = 0;

  [(MapsExternalAccessory *)self _stopListenForDebugTestNotifications];
  v13.receiver = self;
  v13.super_class = (Class)MapsExternalAccessory;
  [(MapsExternalAccessory *)&v13 dealloc];
}

- (BOOL)isConnected
{
  v3 = [(MapsExternalAccessory *)self accessory];
  if (v3)
  {
    v4 = [(MapsExternalAccessory *)self currentState];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)sendDestinationInformation:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MapsExternalAccessory *)self accessory];
  [v8 sendDestinationInformation:v7 identifier:v6];
}

- (void)_startListenForDebugTestNotifications
{
  if (qword_1000A2460 != -1) {
    dispatch_once(&qword_1000A2460, &stru_100088E78);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)qword_1000A2458;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v8 = *(const __CFString **)(*((void *)&v10 + 1) + 8 * i);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000071A4, v8, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_stopListenForDebugTestNotifications
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)qword_1000A2458;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v8 = *(const __CFString **)(*((void *)&v10 + 1) + 8 * (void)v7);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v8, 0);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_handleFake:(id)a3
{
  id v23 = a3;
  +[MapsCarEngineState prepareForUse];
  if (qword_1000A2468 != -1) {
    dispatch_once(&qword_1000A2468, &stru_100088E98);
  }
  id v4 = [v23 componentsSeparatedByString:@"."];
  id v5 = [v4 lastObject];

  if ([v23 hasPrefix:@"com.apple.maps.FakeExternalAccessory.engine.type"])
  {
    uint64_t v6 = EAVehicleInfoEngineTypeBitmaskKey;
    id v7 = [(id)qword_1000A2470 objectForKeyedSubscript:EAVehicleInfoEngineTypeBitmaskKey];
    unsigned int v8 = [v7 longLongValue];

    v9 = +[NSNumber numberWithUnsignedInt:sub_100004C20(v5) | v8];
    [(id)qword_1000A2470 setObject:v9 forKeyedSubscript:v6];
  }
  else
  {
    if ([v23 hasPrefix:@"com.apple.maps.FakeExternalAccessory.engine.low"])
    {
      long long v10 = (void *)qword_1000A2470;
      long long v11 = (void *)qword_1000A2430;
      long long v12 = +[NSNumber numberWithUnsignedInt:sub_100004C20(v5)];
      long long v13 = [v11 objectForKeyedSubscript:v12];
      [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:v13];

      long long v14 = (void *)qword_1000A2470;
      long long v15 = (void *)qword_1000A2428;
      v9 = +[NSNumber numberWithUnsignedInt:sub_100004C20(v5)];
      long long v16 = [v15 objectForKeyedSubscript:v9];
      long long v17 = &off_100090570;
    }
    else
    {
      if (![v23 hasPrefix:@"com.apple.maps.FakeExternalAccessory.engine.full"]) {
        goto LABEL_11;
      }
      v18 = (void *)qword_1000A2470;
      uint64_t v19 = (void *)qword_1000A2430;
      v20 = +[NSNumber numberWithUnsignedInt:sub_100004C20(v5)];
      v21 = [v19 objectForKeyedSubscript:v20];
      [v18 setObject:&__kCFBooleanFalse forKeyedSubscript:v21];

      long long v14 = (void *)qword_1000A2470;
      v22 = (void *)qword_1000A2428;
      v9 = +[NSNumber numberWithUnsignedInt:sub_100004C20(v5)];
      long long v16 = [v22 objectForKeyedSubscript:v9];
      long long v17 = &off_100090588;
    }
    [v14 setObject:v17 forKeyedSubscript:v16];
  }
LABEL_11:
  [(MapsExternalAccessory *)self _updateFromNotificationName:@"Fake Update" userInfo:qword_1000A2470];
}

- (void)_accessoryDidConnect:(id)a3
{
  id v4 = a3;
  id v6 = [v4 name];
  id v5 = [v4 userInfo];

  [(MapsExternalAccessory *)self _updateFromNotificationName:v6 userInfo:v5];
}

- (void)_accessoryDidUpdateVehicle:(id)a3
{
  id v4 = a3;
  id v6 = [v4 name];
  id v5 = [v4 userInfo];

  [(MapsExternalAccessory *)self _updateFromNotificationName:v6 userInfo:v5];
}

- (void)_accessoryDidUpdate:(id)a3
{
  id v4 = a3;
  id v6 = [v4 name];
  id v5 = [v4 userInfo];

  [(MapsExternalAccessory *)self _updateFromNotificationName:v6 userInfo:v5];
}

- (void)_accessoryDidDisconnect:(id)a3
{
  id v4 = [a3 userInfo];
  id v8 = [v4 objectForKeyedSubscript:EAAccessoryKey];

  id v5 = [(MapsExternalAccessory *)self accessory];
  if (v5 == v8)
  {

    goto LABEL_5;
  }
  id v6 = [(MapsExternalAccessory *)self accessory];
  unsigned int v7 = [v6 isEqual:v8];

  if (v7) {
LABEL_5:
  }
    [(MapsExternalAccessory *)self _disconnectFromVehicle];
}

- (id)identifier
{
  if (GEOConfigGetBOOL())
  {
    id v3 = @"CarDisplaySim";
  }
  else
  {
    id v3 = [(EAAccessory *)self->_accessory serialNumber];
  }

  return v3;
}

- (void)setAccessory:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_accessory, a3);
  id v6 = sub_100005CB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "updating accessory: %@", (uint8_t *)&v8, 0xCu);
  }

  if (v5)
  {
    unsigned int v7 = [[MapsExternalAccessoryState alloc] initWithAccessory:v5];
    [(MapsExternalAccessory *)self setCurrentState:v7];
  }
  else
  {
    [(MapsExternalAccessory *)self setCurrentState:0];
  }
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
  id v4 = sub_100005CB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(MapsExternalAccessory *)self accessory];
    id v6 = [(MapsExternalAccessory *)self currentState];
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    long long v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "state updated for accessory: %@\n currentState=%@", (uint8_t *)&v7, 0x16u);
  }
  [(MapsExternalAccessory *)self _postNotificationIfNeeded];
}

- (BOOL)hasEngineType
{
  v2 = [(MapsExternalAccessory *)self currentState];
  BOOL v3 = [v2 engineType] != 0;

  return v3;
}

- (BOOL)needsFuel
{
  if ([(MapsExternalAccessory *)self lowRangeWarning])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [(MapsExternalAccessory *)self currentState];
    id v5 = [v4 engineStates];
    id v6 = [v5 objectEnumerator];

    id v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) lowRangeWarning])
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        id v3 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return (char)v3;
}

- (BOOL)isHybridEngineType
{
  v2 = [(MapsExternalAccessory *)self engineStates];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (int)primaryEngineType
{
  if ([(MapsExternalAccessory *)self engineTypes]) {
    return 1;
  }
  if (([(MapsExternalAccessory *)self engineTypes] & 0x100) != 0) {
    return 2;
  }
  if (([(MapsExternalAccessory *)self engineTypes] & 0x1000000) != 0) {
    return 8;
  }
  return ([(MapsExternalAccessory *)self engineTypes] >> 14) & 4;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
  {
    id v5 = [(MapsExternalAccessory *)self currentState];
    [v4 invokeWithTarget:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MapsExternalAccessory;
    [(MapsExternalAccessory *)&v6 forwardInvocation:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = objc_opt_class();

  return [v4 instanceMethodSignatureForSelector:a3];
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MapsExternalAccessory;
  id v4 = objc_msgSendSuper2(&v6, "instanceMethodSignatureForSelector:");
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }

  return v4;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  BOOL v3 = [a1 instanceMethodSignatureForSelector:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_updateFromNotificationName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_100005CB4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = [(MapsExternalAccessory *)self accessory];
    long long v10 = [v9 name];
    int v14 = 138412802;
    long long v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "notified of update to accessory: %@ notification=%@ userInfo=%@", (uint8_t *)&v14, 0x20u);
  }
  long long v11 = [v7 objectForKeyedSubscript:EAAccessoryKey];

  if (v11)
  {
    long long v12 = [v7 objectForKeyedSubscript:EAAccessoryKey];
    if ([v12 supportsCarPlay]) {
      [(MapsExternalAccessory *)self setAccessory:v12];
    }
  }
  else
  {
    long long v13 = [(MapsExternalAccessory *)self currentState];
    [v13 updateWithInfo:v7];

    [(MapsExternalAccessory *)self _postNotificationIfNeeded];
  }
}

- (BOOL)_isCurrentStateEqualLastPostedState
{
  uint64_t v3 = [(MapsExternalAccessory *)self lastPostedState];
  uint64_t v4 = [(MapsExternalAccessory *)self currentState];
  if (v3 | v4) {
    unsigned __int8 v5 = [(id)v3 isEqual:v4];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (void)_postNotificationIfNeeded
{
  if (self->_initialising)
  {
    uint64_t v3 = sub_100005CB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "suppressing notification while initialising MapsExternalAccessory", buf, 2u);
    }
    goto LABEL_17;
  }
  unsigned int v4 = [(MapsExternalAccessory *)self _isCurrentStateEqualLastPostedState];
  unsigned __int8 v5 = sub_100005CB4();
  id v6 = v5;
  if (!v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [(MapsExternalAccessory *)self lastPostedState];
      int v8 = [(MapsExternalAccessory *)self currentState];
      *(_DWORD *)buf = 138412546;
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "posting notification\n lastPostedState=%@\n currentState=%@", buf, 0x16u);
    }
    __int16 v9 = sub_100005CB4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [(MapsExternalAccessory *)self lastPostedState];
      if (v10)
      {
        long long v11 = (void *)v10;
        long long v12 = [(MapsExternalAccessory *)self currentState];

        if (!v12)
        {
LABEL_16:
          uint64_t v3 = +[NSNotificationCenter defaultCenter];
          [v3 postNotificationName:@"MapsExternalAccessoryUpdatedNotification" object:self userInfo:0];
LABEL_17:

          id v6 = [(MapsExternalAccessory *)self currentState];
          id v16 = [v6 copy];
          [(MapsExternalAccessory *)self setLastPostedState:v16];

          goto LABEL_18;
        }
        long long v13 = [(MapsExternalAccessory *)self currentState];
        int v14 = [(MapsExternalAccessory *)self lastPostedState];
        id v17 = 0;
        [v13 isEqualToState:v14 changedKeys:&v17];
        __int16 v9 = v17;

        long long v15 = sub_100005CB4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v9;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "changedKeys=%@", buf, 0xCu);
        }
      }
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "no need to post notification (no change)", buf, 2u);
  }
LABEL_18:
}

- (void)_disconnectFromVehicle
{
  uint64_t v3 = sub_100005CB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "disconnecting from vehicle", v4, 2u);
  }

  [(MapsExternalAccessory *)self setAccessory:0];
}

- (EAAccessory)accessory
{
  return self->_accessory;
}

- (MapsExternalAccessoryState)currentState
{
  return self->_currentState;
}

- (MapsExternalAccessoryState)lastPostedState
{
  return self->_lastPostedState;
}

- (void)setLastPostedState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPostedState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_accessory, 0);

  objc_storeStrong((id *)&self->_notificationObservers, 0);
}

@end