@interface ADHomeDataSharingRepromptManager
+ (id)sharedManager;
- (ADHomeDataSharingRepromptManager)initWithPropagationDelay:(unint64_t)a3;
- (void)_clearPropagationStatusFromLocalStorage;
- (void)_homeKitDataSyncHasFinished:(id)a3;
- (void)_kickOffInitialPropagationWithCompletion:(id)a3;
- (void)_loadStoredPropagationStatus;
- (void)_propagateDataSharingStatusToAccessoriesWithPropagationEvent:(int64_t)a3 propagationReason:(id)a4 completion:(id)a5;
- (void)_propagateSiriDataSharingToAccessory:(id)a3 home:(id)a4 homeManager:(id)a5 propagationEvent:(int64_t)a6 propagationReason:(id)a7 completion:(id)a8;
- (void)_propagateToAllHomeAccessoriesAfterReprompt:(int64_t)a3 completion:(id)a4;
- (void)_writePropagationStatusToLocalStorage;
- (void)propagateDataSharingStatusToAccessoriesWithCompletion:(id)a3;
- (void)propagateToAllHomeAccessoriesAfterReprompt:(int64_t)a3 source:(int64_t)a4 reason:(id)a5 completion:(id)a6;
- (void)removeAccessoryFromPropagationList:(id)a3;
@end

@implementation ADHomeDataSharingRepromptManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventIdentifier, 0);
  objc_storeStrong((id *)&self->_homeAccessorySiriDataSharingLogger, 0);
  objc_storeStrong((id *)&self->_accessoryIdsThatNeedPropagation, 0);
  objc_storeStrong((id *)&self->_targetHomeKitOptInStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)removeAccessoryFromPropagationList:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100060C24;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_clearPropagationStatusFromLocalStorage
{
  id v2 = +[AFPreferences sharedPreferences];
  [v2 setHomeAccessoriesRepromptStatus:0];
}

- (void)_writePropagationStatusToLocalStorage
{
  if (!self->_logEventIdentifier)
  {
    v3 = +[NSUUID UUID];
    id v4 = [v3 UUIDString];
    logEventIdentifier = self->_logEventIdentifier;
    self->_logEventIdentifier = v4;
  }
  v11[0] = @"Target HomeKit Siri Data Sharing status";
  v11[1] = @"Accessories that need propagation";
  accessoryIdsThatNeedPropagation = self->_accessoryIdsThatNeedPropagation;
  v12[0] = self->_targetHomeKitOptInStatus;
  v12[1] = accessoryIdsThatNeedPropagation;
  v11[2] = @"Retry counter";
  v7 = +[NSNumber numberWithInt:self->_retryCounter];
  v11[3] = @"Log Event Identifier";
  id v8 = self->_logEventIdentifier;
  v12[2] = v7;
  v12[3] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  v10 = +[AFPreferences sharedPreferences];
  [v10 setHomeAccessoriesRepromptStatus:v9];
}

- (void)_loadStoredPropagationStatus
{
  v3 = +[AFPreferences sharedPreferences];
  id v8 = [v3 getHomeAccessoriesRepromptStatus];

  id v4 = [v8 valueForKey:@"Target HomeKit Siri Data Sharing status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_targetHomeKitOptInStatus, v4);
  }
  v5 = [v8 valueForKey:@"Accessories that need propagation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_accessoryIdsThatNeedPropagation, v5);
  }
  id v6 = [v8 valueForKey:@"Retry counter"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self->_retryCounter = [v6 intValue];
  }
  v7 = [v8 valueForKey:@"Log Event Identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_logEventIdentifier, v7);
  }
}

- (void)_homeKitDataSyncHasFinished:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061178;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_propagateSiriDataSharingToAccessory:(id)a3 home:(id)a4 homeManager:(id)a5 propagationEvent:(int64_t)a6 propagationReason:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (self->_targetHomeKitOptInStatus)
  {
    v19 = [v14 uniqueIdentifier];
    v20 = [v19 UUIDString];

    [(ADHomeAccessorySiriDataSharingLogger *)self->_homeAccessorySiriDataSharingLogger logSiriDataSharingPropagationAccessoryIdentifier:v20 propagationEvent:a6 propagationReason:v17 associatedLogEventIdentifier:self->_logEventIdentifier];
    v21 = [v14 category];
    v22 = [v21 categoryType];
    unsigned int v23 = [v22 isEqual:HMAccessoryCategoryTypeHomePod];

    if (v23)
    {
      id v24 = [v14 settings];
      v25 = [v24 rootGroup];
      v26 = sub_1001FFD5C(@"root.general.analytics.shareSiriAnalytics", v25);

      if (v26)
      {
        targetHomeKitOptInStatus = self->_targetHomeKitOptInStatus;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100061944;
        v38[3] = &unk_10050D440;
        id v39 = v18;
        [v26 updateValue:targetHomeKitOptInStatus completionHandler:v38];
        v28 = v39;
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      v33 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315395;
        v41 = "-[ADHomeDataSharingRepromptManager _propagateSiriDataSharingToAccessory:home:homeManager:propagationEvent:"
              "propagationReason:completion:]";
        __int16 v42 = 2113;
        id v43 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s Siri Data Sharing setting not found when attempting propagation to accessory %{private}@", buf, 0x16u);
        if (v18) {
          goto LABEL_12;
        }
      }
      else if (v18)
      {
LABEL_12:
        CFStringRef v34 = @"Siri Data Sharing setting is not found on HomePod.";
LABEL_16:
        v28 = +[AFError errorWithCode:47 description:v34];
        (*((void (**)(id, void *))v18 + 2))(v18, v28);
        v26 = 0;
        goto LABEL_17;
      }
LABEL_26:
      v26 = 0;
      goto LABEL_18;
    }
    id v24 = objc_msgSend(objc_alloc((Class)HMSettingBooleanValue), "initWithBoolValue:", -[NSNumber BOOLValue](self->_targetHomeKitOptInStatus, "BOOLValue"));
    uint64_t v30 = [v16 createAccessorySettingsController];
    if (v30)
    {
      v26 = (void *)v30;
      v31 = [v15 uniqueIdentifier];
      v32 = [v14 uniqueIdentifier];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10006195C;
      v36[3] = &unk_10050D440;
      id v37 = v18;
      [v26 updateAccessorySettingWithHomeIdentifier:v31 accessoryIdentifier:v32 keyPath:@"root.general.analytics.shareSiriAnalytics" settingValue:v24 completionHandler:v36];

      v28 = v37;
      goto LABEL_17;
    }
    v35 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315395;
      v41 = "-[ADHomeDataSharingRepromptManager _propagateSiriDataSharingToAccessory:home:homeManager:propagationEvent:pr"
            "opagationReason:completion:]";
      __int16 v42 = 2113;
      id v43 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s Nil HMAccessorySettingsController when attempting propagation to accessory %{private}@", buf, 0x16u);
      if (!v18) {
        goto LABEL_26;
      }
    }
    else if (!v18)
    {
      goto LABEL_26;
    }
    CFStringRef v34 = @"HMAccessorySettingsController is unexpectedly nil.";
    goto LABEL_16;
  }
  v29 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315395;
    v41 = "-[ADHomeDataSharingRepromptManager _propagateSiriDataSharingToAccessory:home:homeManager:propagationEvent:prop"
          "agationReason:completion:]";
    __int16 v42 = 2113;
    id v43 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Siri Data Sharing value to propagate to accessory is unexpectedly nil.  Cancelling propagation attempt to accessory %{private}@.", buf, 0x16u);
    if (!v18) {
      goto LABEL_20;
    }
    goto LABEL_7;
  }
  if (v18)
  {
LABEL_7:
    v20 = +[AFError errorWithCode:47 description:@"Siri Data Sharing value to propagate is unexpectedly nil."];
    (*((void (**)(id, void *))v18 + 2))(v18, v20);
LABEL_19:
  }
LABEL_20:
}

- (void)_propagateDataSharingStatusToAccessoriesWithPropagationEvent:(int64_t)a3 propagationReason:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  targetHomeKitOptInStatus = self->_targetHomeKitOptInStatus;
  if (!targetHomeKitOptInStatus || (accessoryIdsThatNeedPropagation = self->_accessoryIdsThatNeedPropagation) == 0)
  {
    [(ADHomeDataSharingRepromptManager *)self _loadStoredPropagationStatus];
    targetHomeKitOptInStatus = self->_targetHomeKitOptInStatus;
    if (!targetHomeKitOptInStatus || (accessoryIdsThatNeedPropagation = self->_accessoryIdsThatNeedPropagation) == 0)
    {
      id v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[ADHomeDataSharingRepromptManager _propagateDataSharingStatusToAccessoriesWithPropagationEvent:propagatio"
              "nReason:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Required propgation information is not available.  Cancelling Siri Data Sharing propagation to home accessories.", buf, 0xCu);
        if (!v9) {
          goto LABEL_11;
        }
      }
      else if (!v9)
      {
        goto LABEL_11;
      }
      id v15 = +[AFError errorWithCode:47 description:@"Required propagation information is not available."];
      v9[2](v9, v15);

      goto LABEL_11;
    }
  }
  v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315651;
    v22 = "-[ADHomeDataSharingRepromptManager _propagateDataSharingStatusToAccessoriesWithPropagationEvent:propagationRea"
          "son:completion:]";
    __int16 v23 = 2113;
    id v24 = targetHomeKitOptInStatus;
    __int16 v25 = 2113;
    v26 = accessoryIdsThatNeedPropagation;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Will propagate Siri Data Sharing opt-in status=%{private}@ to accessoriesIds=%{private}@", buf, 0x20u);
  }
  v13 = +[ADHomeInfoManager sharedInfoManager];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100061BD0;
  v16[3] = &unk_1004FF6F8;
  v16[4] = self;
  int64_t v19 = a3;
  id v17 = v8;
  int v20 = 6;
  id v18 = v9;
  [v13 getHomeManagerWithCompletion:v16];

LABEL_11:
}

- (void)propagateDataSharingStatusToAccessoriesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100062834;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_kickOffInitialPropagationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[ADHomeDataSharingRepromptManager _kickOffInitialPropagationWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Starting Siri Data Sharing propagation to all HomePods and SideKicks.", buf, 0xCu);
  }
  id v6 = +[ADHomeInfoManager sharedInfoManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100062D38;
  v8[3] = &unk_1004FF680;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getHomeManagerWithCompletion:v8];
}

- (void)_propagateToAllHomeAccessoriesAfterReprompt:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  sub_10027537C(0);
  if (a3 == 1) {
    id v7 = &off_100523438;
  }
  else {
    id v7 = &off_100523450;
  }
  objc_storeStrong((id *)&self->_targetHomeKitOptInStatus, v7);
  id v8 = +[ADHomeInfoManager sharedInfoManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000631E0;
  v10[3] = &unk_1004FF680;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 getHomeManagerWithCompletion:v10];
}

- (void)propagateToAllHomeAccessoriesAfterReprompt:(int64_t)a3 source:(int64_t)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315395;
    v22 = "-[ADHomeDataSharingRepromptManager propagateToAllHomeAccessoriesAfterReprompt:source:reason:completion:]";
    __int16 v23 = 2049;
    int64_t v24 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Will propagate Siri Data Sharing opt-in status=%{private}ld to home accessories.", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063628;
  block[3] = &unk_10050BC30;
  int64_t v19 = a3;
  int64_t v20 = a4;
  block[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(queue, block);
}

- (ADHomeDataSharingRepromptManager)initWithPropagationDelay:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ADHomeDataSharingRepromptManager;
  id v4 = [(ADHomeDataSharingRepromptManager *)&v12 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("ADHomeDataSharingRepromptManager", v5);

    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    id v8 = [[ADHomeAccessorySiriDataSharingLogger alloc] initWithTargetQueue:v4->_queue];
    homeAccessorySiriDataSharingLogger = v4->_homeAccessorySiriDataSharingLogger;
    v4->_homeAccessorySiriDataSharingLogger = v8;

    v4->_propagationDelayInSeconds = a3;
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v4 selector:"_homeKitDataSyncHasFinished:" name:@"ADHomeInfoCurrentHomeIsReady" object:0];
  }
  return v4;
}

+ (id)sharedManager
{
  if (qword_100585730 != -1) {
    dispatch_once(&qword_100585730, &stru_1004FF658);
  }
  id v2 = (void *)qword_100585728;
  return v2;
}

@end