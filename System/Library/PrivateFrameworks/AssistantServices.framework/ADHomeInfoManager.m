@interface ADHomeInfoManager
+ (id)sharedInfoManager;
- (ADHomeInfoManager)initWithHomeManager:(id)a3 queue:(id)a4;
- (AFHomeAccessoryInfo)currentAccessoryInfo;
- (BOOL)_allowExplicitContentSettingForUser:(id)a3 forHome:(id)a4;
- (BOOL)_hasSiriCapableDeviceInHome:(id)a3;
- (BOOL)_updateHomeUserSettings;
- (BOOL)areActivityNotificationsOffForAllHomes;
- (BOOL)hasOptedInHH2;
- (HMHome)currentHome;
- (NSUUID)accessoryLoggingSalt;
- (id)_accessoryForIdentifier:(id)a3 inHome:(id *)a4;
- (id)_accessoryInfoForAccessory:(id)a3;
- (id)_accessoryLoggingSalt;
- (id)_activityNotificationsForHomes:(id)a3;
- (id)_currentAccessory;
- (id)_currentAccessoryInfo;
- (id)_currentHome;
- (id)_currentHomeInfo;
- (id)_getAccessoryCategoryForExecutionInfo:(id)a3;
- (id)_homeManager;
- (id)_homesWithMultiUserEnabled;
- (id)_homesWithSiriCapableDevices;
- (id)_init;
- (id)_initWithContext:(id)a3;
- (id)_settingsForHomeUser:(id)a3 forHome:(id)a4;
- (id)accessoriesInHome;
- (id)accessoriesWithPersonalRequestsEnabled;
- (id)getCurrentASRLanguages;
- (id)getHomeUniqueIdentifiers;
- (id)infoForThisDevice;
- (id)preferredMediaUserInfo;
- (id)rootAfHomeInfoForThisDevice;
- (id)updatedHomeInfoForRootInfo:(id)a3;
- (void)JSCapableHomeAccessories:(id)a3;
- (void)JSCapableHomeAccessories:(id)a3 queue:(id)a4;
- (void)_checkAndDisableVoiceIDIfRequired;
- (void)_enumerateListenersUsingBlock:(id)a3;
- (void)_homeManagerUpdatedHomes:(id)a3;
- (void)_homeManagerUpdatedHomes:(id)a3 homesToDelete:(id)a4;
- (void)_logRelevantAnalyticsOnHomeUserSettingsUpdateForCurrentSettings:(id)a3 allowVoiceIdSettingValue:(int64_t)a4 isPrimaryUser:(BOOL)a5;
- (void)_onceSiriDataSharingAdjustment:(id)a3;
- (void)_propagateSiriDataSharingOptInStatus:(int64_t)a3 toAccessory:(id)a4;
- (void)_resolveSiriDataSharingStatusMismatch:(id)a3;
- (void)_setPreferredMediaUserForAccessories:(id)a3;
- (void)_setPreferredMediaUserForAccessory:(id)a3;
- (void)_siriDataSharingAdjustment:(id)a3;
- (void)_siriDataSharingOptInStatusDidChange:(id)a3;
- (void)_startAcceptingCloudSharesForMultiUserService;
- (void)_startCloudKitActivityForHomes:(id)a3 homesToDelete:(id)a4;
- (void)_startCloudSharingForMultiUserService:(id)a3;
- (void)_updateCurrentAccessoryInfoWithAccessory:(id)a3;
- (void)_updateHomeContext:(id)a3;
- (void)_updateVoiceTriggerPhrase;
- (void)accessoriesWithSiriInTheHome:(id)a3 completion:(id)a4;
- (void)accessoriesWithSiriInTheHome:(id)a3 completion:(id)a4 queue:(id)a5;
- (void)accessory:(id)a3 didUpdateSettings:(id)a4;
- (void)accessoryDidUpdateName:(id)a3;
- (void)accessoryDidUpdateSupportsThirdPartyMusic:(id)a3;
- (void)addListener:(id)a3;
- (void)availableLanguagesInTheHome:(id)a3;
- (void)currentHomeWithCompletion:(id)a3;
- (void)dealloc;
- (void)emitHomeMetricInvocationEvent;
- (void)fetchAccessoriesInRoom:(id)a3 matchingCategoryTypes:(id)a4 completion:(id)a5;
- (void)fetchMultiUserMetricsWithCompletion:(id)a3;
- (void)getAccessoryCategoryForExecutionInfo:(id)a3 completion:(id)a4;
- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)getCurrentAccessoryInfoWithCompletion:(id)a3;
- (void)getCurrentAccessoryWithCompletion:(id)a3;
- (void)getCurrentHomeMemberIds:(id)a3;
- (void)getHomeContext:(id)a3;
- (void)getHomeIdForAccessoryId:(id)a3 completion:(id)a4;
- (void)getHomeManagerWithCompletion:(id)a3;
- (void)getLocalizedAccessoryCategoryForExecutionInfo:(id)a3 completion:(id)a4;
- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)getVoiceSettingsForHomeMembers:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5;
- (void)homeDidEnableMultiUser:(id)a3;
- (void)homeDidUpdateName:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidUpdateAssistantIdentifiers:(id)a3;
- (void)homeManagerDidUpdateCurrentHome:(id)a3;
- (void)homeManagerDidUpdateDataSyncState:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)initializeHomeSiriPhraseOptions:(id)a3 completion:(id)a4;
- (void)initializeHomeSiriPhraseOptions:(id)a3 completion:(id)a4 queue:(id)a5;
- (void)isJustSiriEnabledInTheHome:(id)a3;
- (void)isJustSiriEnabledInTheHome:(id)a3 queue:(id)a4;
- (void)removeListener:(id)a3;
- (void)restartShareDeletion;
- (void)restartSharing;
- (void)setAllowHeySiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4;
- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3;
- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4;
- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4 queue:(id)a5;
- (void)setRecognizeMyVoiceEnabled:(BOOL)a3;
- (void)settingsDidUpdate:(id)a3;
- (void)settingsForMultiUserWithRefresh:(BOOL)a3 completion:(id)a4;
- (void)settingsWillUpdate:(id)a3;
- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completion:(id)a5;
- (void)startAcceptingCloudSharesForMultiUserService;
- (void)updateCurrentUserRMVSettingForHome:(id)a3 enabled:(BOOL)a4 completion:(id)a5;
- (void)updateRMVSettingForUser:(id)a3 enabled:(BOOL)a4 completion:(id)a5;
- (void)updateVoiceTriggerPhrase:(unint64_t)a3 currentAccessoryInfo:(id)a4;
- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5;
@end

@implementation ADHomeInfoManager

- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4 queue:(id)a5
{
  id v8 = a4;
  v9 = a5;
  v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[ADHomeInfoManager(VoiceActivation) setAllowJustSiriHomeKitSetting:withCompletion:queue:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004E750;
  v16[3] = &unk_10050D440;
  id v17 = v8;
  id v11 = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004E768;
  v13[3] = &unk_10050D378;
  BOOL v15 = a3;
  v13[4] = self;
  v14 = objc_retainBlock(v16);
  v12 = v14;
  dispatch_async(v9, v13);
}

- (void)isJustSiriEnabledInTheHome:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ADHomeInfoManager(VoiceActivation) isJustSiriEnabledInTheHome:queue:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004EA60;
    v9[3] = &unk_10050E188;
    v9[4] = self;
    id v10 = v6;
    dispatch_async(v7, v9);
  }
}

- (void)initializeHomeSiriPhraseOptions:(id)a3 completion:(id)a4 queue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = a5;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ADHomeInfoManager(VoiceActivation) initializeHomeSiriPhraseOptions:completion:queue:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10004EDD8;
  v22[3] = &unk_10050D440;
  id v11 = v8;
  id v23 = v11;
  v12 = objc_retainBlock(v22);
  if (!v7)
  {
    v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[ADHomeInfoManager(VoiceActivation) initializeHomeSiriPhraseOptions:completion:queue:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s home is nil", buf, 0xCu);
    }
    goto LABEL_9;
  }
  id v13 = [v7 siriPhraseOptions];
  v14 = AFSiriLogContextDaemon;
  BOOL v15 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      v16 = v14;
      id v17 = [v7 name];
      *(_DWORD *)buf = 136315394;
      v25 = "-[ADHomeInfoManager(VoiceActivation) initializeHomeSiriPhraseOptions:completion:queue:]";
      __int16 v26 = 2112;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s phraseType was set for home %@", buf, 0x16u);
    }
LABEL_9:
    ((void (*)(void *, void))v12[2])(v12, 0);
    goto LABEL_13;
  }
  if (v15)
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ADHomeInfoManager(VoiceActivation) initializeHomeSiriPhraseOptions:completion:queue:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s phraseType is unset for the home", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004EDF0;
  block[3] = &unk_10050E188;
  id v20 = v7;
  v21 = v12;
  dispatch_async(v9, block);

LABEL_13:
}

- (void)updateVoiceTriggerPhrase:(unint64_t)a3 currentAccessoryInfo:(id)a4
{
  id v6 = a4;
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v14 = v7;
    BOOL v15 = [v6 uniqueIdentifier];
    int v16 = 136315906;
    id v17 = "-[ADHomeInfoManager(VoiceActivation) updateVoiceTriggerPhrase:currentAccessoryInfo:]";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = v15;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s Endpoint = %@\n %@ %ld", (uint8_t *)&v16, 0x2Au);
  }
  id v8 = [v6 categoryType];
  unsigned __int8 v9 = [v8 isEqual:HMAccessoryCategoryTypeHomePod];

  if (v9)
  {
    id v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    id v10 = [v6 uniqueIdentifier];
    uint64_t v11 = 2;
  }
  v12 = +[VTPreferences sharedPreferences];
  id v13 = [v12 setUserPreferredVoiceTriggerPhraseType:a3 == 3 sender:self deviceType:v11 endpointId:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredMediaUserInfo, 0);
  objc_storeStrong((id *)&self->_homeContext, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_homeSharingStates, 0);
  objc_storeStrong((id *)&self->_homeUserSettings, 0);
  objc_storeStrong((id *)&self->_currentHomeInfo, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_accessoryLoggingSalt, 0);
  objc_storeStrong((id *)&self->_currentAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_currentAccessory, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (void)emitHomeMetricInvocationEvent
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FDCD4;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (id)_activityNotificationsForHomes:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "currentUser", (void)v16);
        v12 = [v11 assistantAccessControlForHome:v10];
        id v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 areActivityNotificationsEnabledForPersonalRequests]);
        v14 = [v10 uniqueIdentifier];
        [v4 setObject:v13 forKey:v14];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)updatedHomeInfoForRootInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 homeIdentifier];
  id v6 = [(HMHomeManager *)self->_homeManager homes];
  id v7 = [(ADHomeInfoManager *)self _activityNotificationsForHomes:v6];

  uint64_t v8 = [v7 objectForKey:v5];

  if (v8)
  {
    unsigned __int8 v9 = [v7 objectForKey:v5];
    unsigned __int8 v10 = [v9 BOOLValue];
  }
  else
  {
    unsigned __int8 v10 = 1;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001FE1DC;
  v13[3] = &unk_100506D60;
  unsigned __int8 v14 = v10;
  uint64_t v11 = [v4 mutatedCopyWithMutator:v13];

  return v11;
}

- (id)_getAccessoryCategoryForExecutionInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 originPeerInfo];
  id v6 = [v4 instanceInfo];
  id v7 = [v6 applicationUUID];
  if (v7
    || (id v8 = objc_alloc((Class)NSUUID),
        [v5 homeKitAccessoryIdentifier],
        unsigned __int8 v9 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v8 initWithUUIDString:v9],
        v9,
        v7))
  {
    unsigned __int8 v10 = [(ADHomeInfoManager *)self _accessoryForIdentifier:v7 inHome:0];
    uint64_t v11 = [v10 category];
  }
  else
  {
    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      BOOL v15 = "-[ADHomeInfoManager _getAccessoryCategoryForExecutionInfo:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Unable to get accessoryIdentifier from AFCommandExecutionInfo: %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)getAccessoryCategoryForExecutionInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FE434;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)getLocalizedAccessoryCategoryForExecutionInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FE600;
  block[3] = &unk_10050E1D8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)accessoriesWithSiriInTheHome:(id)a3 completion:(id)a4
{
}

- (void)accessoriesWithSiriInTheHome:(id)a3 completion:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FE764;
  block[3] = &unk_10050E1D8;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, block);
}

- (BOOL)_hasSiriCapableDeviceInHome:(id)a3
{
  [a3 accessories];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    uint64_t v7 = HMAccessoryCategoryTypeHomePod;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "siriEndpointProfile", (void)v16);
        if (v10)
        {

LABEL_13:
          BOOL v14 = 1;
          goto LABEL_14;
        }
        uint64_t v11 = [v9 category];
        id v12 = [v11 categoryType];
        unsigned __int8 v13 = [v12 isEqualToString:v7];

        if (v13) {
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      BOOL v14 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_14:

  return v14;
}

- (void)getHomeManagerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001FEBB4;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)_homesWithSiriCapableDevices
{
  id v3 = [(HMHomeManager *)self->_homeManager homes];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (-[ADHomeInfoManager _hasSiriCapableDeviceInHome:](self, "_hasSiriCapableDeviceInHome:", v10, (void)v12)) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)areActivityNotificationsOffForAllHomes
{
  id v3 = [(ADHomeInfoManager *)self _homesWithSiriCapableDevices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = -[ADHomeInfoManager _activityNotificationsForHomes:](self, "_activityNotificationsForHomes:", v3, 0);
  id v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) BOOLValue])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)rootAfHomeInfoForThisDevice
{
  v2 = [(ADHomeInfoManager *)self infoForThisDevice];
  id v3 = [v2 currentHomeIdentifier];
  id v4 = [objc_alloc((Class)AFHomeInfo) initWithHomeIdentifier:v3 activityNotificationsEnabledForPersonalRequests:1];

  return v4;
}

- (void)_startAcceptingCloudSharesForMultiUserService
{
  id v3 = [(HMHomeManager *)self->_homeManager userCloudShareManager];
  [v3 setDelegate:self];
  id v4 = +[ADCloudKitManager sharedManager];
  id v5 = v4;
  if (v4)
  {
    [v4 containerIDs];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001FEFE8;
    v7[3] = &unk_10050C610;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v8;
    [v3 registerForContainerIDs:v6 completion:v7];
  }
}

- (void)_startCloudSharingForMultiUserService:(id)a3
{
  id v4 = a3;
  if (AFIsMultiUserCompanion())
  {
    id v5 = [v4 owner];
    id v6 = [v5 uniqueIdentifier];
    id v7 = [v6 UUIDString];

    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      v25 = "-[ADHomeInfoManager _startCloudSharingForMultiUserService:]";
      __int16 v26 = 2113;
      v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s (%{private}@)", buf, 0x16u);
    }
    if (v7)
    {
      id v9 = [v4 currentUser];
      BOOL v10 = [v9 uniqueIdentifier];
      uint64_t v11 = [v10 UUIDString];

      if (([v7 isEqualToString:v11] & 1) == 0)
      {
        long long v12 = [(NSMutableDictionary *)self->_homeSharingStates objectForKey:v7];
        id v13 = [v12 integerValue];

        if ((uint64_t)v13 <= 0)
        {
          homeSharingStates = self->_homeSharingStates;
          if (!homeSharingStates)
          {
            long long v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            long long v16 = self->_homeSharingStates;
            self->_homeSharingStates = v15;

            homeSharingStates = self->_homeSharingStates;
          }
          [(NSMutableDictionary *)homeSharingStates setObject:&off_1005238E8 forKey:v7];
          uint32_t v17 = arc4random_uniform(9u);
          dispatch_time_t v18 = dispatch_time(0, (uint64_t)(((double)v17 + 6.0) * 1000000000.0));
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1001FF370;
          block[3] = &unk_10050DCB8;
          id v21 = v7;
          __int16 v22 = self;
          id v23 = v4;
          dispatch_after(v18, queue, block);
        }
      }
    }
  }
}

- (void)accessoryDidUpdateSupportsThirdPartyMusic:(id)a3
{
  id v8 = a3;
  id v4 = [(ADHomeInfoManager *)self _currentAccessory];
  id v5 = [v4 uniqueIdentifier];
  id v6 = [v8 uniqueIdentifier];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7) {
    [(ADHomeInfoManager *)self _updateCurrentAccessoryInfoWithAccessory:v8];
  }
}

- (void)accessory:(id)a3 didUpdateSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315395;
    long long v14 = "-[ADHomeInfoManager accessory:didUpdateSettings:]";
    __int16 v15 = 2113;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %{private}@", (uint8_t *)&v13, 0x16u);
  }
  id v9 = [v7 rootGroup];
  BOOL v10 = sub_1001FFD5C(@"root.general.analytics.shareSiriAnalytics", v9);

  if (v10)
  {
    uint64_t v11 = [v10 value];

    if (!v11)
    {
      long long v12 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315395;
        long long v14 = "-[ADHomeInfoManager accessory:didUpdateSettings:]";
        __int16 v15 = 2113;
        id v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Unset opt-in status detected on accessory (%{private}@).  Will attempt to propagate opt-in status.", (uint8_t *)&v13, 0x16u);
      }
      [(ADHomeInfoManager *)self _propagateSiriDataSharingOptInStatus:_AFPreferencesSiriDataSharingOptInStatus() toAccessory:v6];
    }
  }
}

- (void)accessoryDidUpdateName:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    uint64_t v11 = "-[ADHomeInfoManager accessoryDidUpdateName:]";
    __int16 v12 = 2113;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10020008C;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)homeDidEnableMultiUser:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v10 = "-[ADHomeInfoManager homeDidEnableMultiUser:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if ([v4 isMultiUserEnabled])
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100200264;
    v7[3] = &unk_10050E160;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315651;
    __int16 v15 = "-[ADHomeInfoManager home:didUpdateRoom:forAccessory:]";
    __int16 v16 = 2113;
    id v17 = v7;
    __int16 v18 = 2113;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %{private}@ %{private}@", buf, 0x20u);
  }
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002003BC;
  v12[3] = &unk_10050E160;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  dispatch_async(queue, v12);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    long long v14 = "-[ADHomeInfoManager home:didRemoveAccessory:]";
    __int16 v15 = 2113;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002005D4;
  block[3] = &unk_10050E138;
  id v12 = v5;
  id v8 = v5;
  dispatch_async(queue, block);
  id v9 = [(ADHomeInfoManager *)self _accessoryInfoForAccessory:v8];
  BOOL v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:@"ADHomeInfoAccessoryRemovedNotification" object:v9];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315395;
    BOOL v10 = "-[ADHomeInfoManager home:didAddAccessory:]";
    __int16 v11 = 2113;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %{private}@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [(ADHomeInfoManager *)self _accessoryInfoForAccessory:v5];
  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:@"ADHomeInfoAccessoryAddedNotification" object:v7];
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (AFSupportsMultiUser())
  {
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315651;
      __int16 v20 = "-[ADHomeInfoManager home:didRemoveUser:]";
      __int16 v21 = 2113;
      id v22 = v6;
      __int16 v23 = 2113;
      id v24 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Deleting user (%{private}@) home is (%{private}@)", buf, 0x20u);
    }
    id v8 = +[ADMultiUserService sharedService];
    int v9 = [v6 uniqueIdentifier];
    BOOL v10 = [v9 UUIDString];
    [v8 removeUserWithHomeUUID:v10 completion:&stru_100506CF0];

    __int16 v11 = [v5 uniqueIdentifier];
    id v12 = [v11 UUIDString];

    id v13 = [v6 uniqueIdentifier];
    long long v14 = [v13 UUIDString];

    __int16 v15 = +[ADMultiUserCloudKitSyncer sharedService];
    id v17 = v12;
    __int16 v18 = v14;
    id v16 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    [v15 markHomeMembershipsForDeletion:v16];
  }
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[ADHomeInfoManager home:didAddUser:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100200B24;
  block[3] = &unk_10050DCB8;
  id v13 = v7;
  long long v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)homeDidUpdateName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100200C34;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315138;
    id v16 = "-[ADHomeInfoManager shareManager:didReceiveShareInvitation:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Received a share URL", (uint8_t *)&v15, 0xCu);
  }
  id v11 = +[ADCloudKitManager sharedManager];
  if (v11)
  {
    id v12 = [v8 shareURL];
    id v13 = [v8 shareToken];
    long long v14 = [v8 containerID];
    [v11 acceptShare:v12 token:v13 containerID:v14];
  }
  if (v9) {
    v9[2](v9, 1, 0);
  }
}

- (void)_propagateSiriDataSharingOptInStatus:(int64_t)a3 toAccessory:(id)a4
{
  id v6 = (__CFString *)a4;
  id v7 = [(__CFString *)v6 category];
  id v8 = [v7 categoryType];
  unsigned int v9 = [v8 isEqualToString:HMAccessoryCategoryTypeHomePod];

  if (v9)
  {
    id v10 = [(__CFString *)v6 settings];
    id v11 = [v10 rootGroup];
    id v12 = sub_1001FFD5C(@"root.general.analytics.shareSiriAnalytics", v11);

    if (!v12)
    {
      __int16 v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315651;
        v29 = "-[ADHomeInfoManager _propagateSiriDataSharingOptInStatus:toAccessory:]";
        __int16 v30 = 2113;
        CFStringRef v31 = @"root.general.analytics.shareSiriAnalytics";
        __int16 v32 = 2113;
        CFStringRef v33 = v6;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Not setting (%{private}@) because the setting does not exist for accessory (%{private}@), so we won't touch it", buf, 0x20u);
      }
      [(__CFString *)v6 setDelegate:self];
      goto LABEL_18;
    }
    id v13 = [v12 value];

    long long v14 = AFSiriLogContextDaemon;
    BOOL v15 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        id v16 = v14;
        id v17 = [v12 value];
        unsigned int v18 = [v17 BOOLValue];
        CFStringRef v19 = @"Opted-Out";
        v29 = "-[ADHomeInfoManager _propagateSiriDataSharingOptInStatus:toAccessory:]";
        __int16 v30 = 2113;
        *(_DWORD *)buf = 136315907;
        CFStringRef v31 = v6;
        __int16 v32 = 2112;
        if (v18) {
          CFStringRef v19 = @"Opted-In";
        }
        CFStringRef v33 = @"root.general.analytics.shareSiriAnalytics";
        __int16 v34 = 2112;
        CFStringRef v35 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Not setting HomePod accessory (%{private}@) setting (%@) because it's already a known value of (%@)", buf, 0x2Au);
      }
      goto LABEL_18;
    }
    if (v15)
    {
      *(_DWORD *)buf = 136315395;
      v29 = "-[ADHomeInfoManager _propagateSiriDataSharingOptInStatus:toAccessory:]";
      __int16 v30 = 2113;
      CFStringRef v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s First time setting HomePod accessory (%{private}@) because the setting has not been set before", buf, 0x16u);
    }
    if (a3 == 2)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1002013DC;
      v22[3] = &unk_100507BB0;
      __int16 v23 = v6;
      uint64_t v24 = 2;
      [v12 updateValue:&off_1005238A0 completionHandler:v22];
      __int16 v21 = v23;
    }
    else
    {
      if (a3 != 1)
      {
LABEL_18:

        goto LABEL_19;
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100201290;
      v25[3] = &unk_100507BB0;
      __int16 v26 = v6;
      uint64_t v27 = 1;
      [v12 updateValue:&off_1005238D0 completionHandler:v25];
      __int16 v21 = v26;
    }

    goto LABEL_18;
  }
LABEL_19:
}

- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  queue = self->_queue;
  __int16 v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  __int16 v23 = sub_1002016B4;
  uint64_t v24 = &unk_10050E160;
  v25 = self;
  id v10 = v8;
  id v26 = v10;
  dispatch_async(queue, &v21);
  id v11 = objc_msgSend(v10, "currentUser", v21, v22, v23, v24, v25);
  id v12 = [v11 uniqueIdentifier];
  id v13 = [v7 uniqueIdentifier];
  unsigned int v14 = [v12 isEqual:v13];

  if (v14)
  {
    BOOL v15 = [v7 assistantAccessControlForHome:v10];
    id v16 = [v15 areActivityNotificationsEnabledForPersonalRequests];
    id v17 = objc_alloc((Class)AFHomeInfo);
    unsigned int v18 = [v10 uniqueIdentifier];
    id v19 = [v17 initWithHomeIdentifier:v18 activityNotificationsEnabledForPersonalRequests:v16];

    __int16 v20 = +[NSNotificationCenter defaultCenter];
    [v20 postNotificationName:@"ADHomeInfoPersonalDomainsChangedNotification" object:v19];
  }
}

- (void)settingsWillUpdate:(id)a3
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADHomeInfoManager settingsWillUpdate:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)settingsDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADHomeInfoManager settingsDidUpdate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002019B4;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)homeManagerDidUpdateAssistantIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100201F50;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)homeManagerDidUpdateDataSyncState:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002020A8;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100202250;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002023A8;
  v8[3] = &unk_10050E160;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    BOOL v15 = "-[ADHomeInfoManager homeManager:didRemoveHome:]";
    __int16 v16 = 2113;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s home is %{private}@", buf, 0x16u);
  }
  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10020281C;
    block[3] = &unk_10050DCB8;
    id v11 = v7;
    id v12 = self;
    id v13 = v6;
    dispatch_async(queue, block);
  }
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[ADHomeInfoManager homeManager:didAddHome:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s homeManager is %@", buf, 0x16u);
  }
  if (v7)
  {
    id v9 = +[AFAnalytics sharedAnalytics];
    [v9 logEventWithType:6108 contextProvider:&stru_100506C70];

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100202C9C;
    block[3] = &unk_10050DCB8;
    id v12 = v7;
    id v13 = self;
    id v14 = v6;
    dispatch_async(queue, block);
  }
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100202F84;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_homeManagerUpdatedHomes:(id)a3 homesToDelete:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(HMHomeManager *)self->_homeManager status])
  {
    [(ADHomeInfoManager *)self _startCloudKitActivityForHomes:v8 homesToDelete:v6];
    id v7 = [(ADHomeInfoManager *)self _currentHomeInfo];
    [(ADHomeInfoManager *)self _checkAndDisableVoiceIDIfRequired];
  }
  [(ADHomeInfoManager *)self _updateHomeContext:v8];
}

- (void)_homeManagerUpdatedHomes:(id)a3
{
}

- (void)_checkAndDisableVoiceIDIfRequired
{
  if (self->_assistantRequestedToTurnOffVoiceID)
  {
    self->_assistantRequestedToTurnOffVoiceID = 0;
    [(ADHomeInfoManager *)self setRecognizeMyVoiceEnabled:0];
  }
}

- (void)_startCloudKitActivityForHomes:(id)a3 homesToDelete:(id)a4
{
  id v5 = a3;
  id v59 = a4;
  v60 = v5;
  id v6 = [v5 homes];
  id v70 = objc_alloc_init((Class)NSMutableDictionary);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v6;
  id v7 = (os_log_t *)&AFSiriLogContextDaemon;
  id v69 = [obj countByEnumeratingWithState:&v75 objects:v88 count:16];
  if (v69)
  {
    v66 = 0;
    v62 = 0;
    uint64_t v68 = *(void *)v76;
    uint64_t v8 = 2;
    uint64_t v63 = 2;
    do
    {
      for (i = 0; i != v69; i = (char *)i + 1)
      {
        if (*(void *)v76 != v68) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        unsigned int v11 = [v10 isMultiUserEnabled];
        id v12 = [v10 owner];
        id v13 = [v12 uniqueIdentifier];
        id v14 = [v13 UUIDString];

        BOOL v15 = [v10 currentUser];
        __int16 v16 = [v15 uniqueIdentifier];
        __int16 v17 = [v16 UUIDString];

        if (v17)
        {
          id v18 = [v10 uniqueIdentifier];
          id v19 = [v18 UUIDString];
          [v70 setObject:v17 forKey:v19];
        }
        unsigned int v20 = [(__CFString *)v14 isEqualToString:v17];
        os_log_t v21 = *v7;
        BOOL v22 = os_log_type_enabled(*v7, OS_LOG_TYPE_INFO);
        if (v20)
        {
          if (v22)
          {
            __int16 v23 = v21;
            uint64_t v24 = [v10 name];
            v25 = [v10 uniqueIdentifier];
            [v25 UUIDString];
            uint64_t v64 = v8;
            id v26 = v7;
            v28 = uint64_t v27 = v12;
            *(_DWORD *)buf = 136315907;
            v81 = "-[ADHomeInfoManager _startCloudKitActivityForHomes:homesToDelete:]";
            __int16 v82 = 2113;
            CFStringRef v83 = v14;
            __int16 v84 = 2113;
            v85 = v24;
            __int16 v86 = 2113;
            v87 = v28;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Owner %{private}@ accepting shares in home (%{private}@/%{private}@)", buf, 0x2Au);

            id v12 = v27;
            id v7 = v26;
            uint64_t v8 = v64;
          }
        }
        else
        {
          if (v22)
          {
            v65 = v12;
            v29 = v21;
            __int16 v30 = [v10 name];
            CFStringRef v31 = [v10 uniqueIdentifier];
            [v31 UUIDString];
            v33 = uint64_t v32 = v8;
            *(_DWORD *)buf = 136315907;
            v81 = "-[ADHomeInfoManager _startCloudKitActivityForHomes:homesToDelete:]";
            __int16 v82 = 2113;
            CFStringRef v83 = v17;
            __int16 v84 = 2113;
            v85 = v30;
            __int16 v86 = 2113;
            v87 = v33;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Sharer %{private}@ sharing in home (%{private}@/%{private}@)", buf, 0x2Au);

            uint64_t v8 = v32;
            id v7 = (os_log_t *)&AFSiriLogContextDaemon;

            id v12 = v65;
          }
          if (v11) {
            [(ADHomeInfoManager *)self _startCloudSharingForMultiUserService:v10];
          }
        }
        if (v8 != 1 && AFIsMultiUserCompanion())
        {
          __int16 v34 = v12;
          uint64_t v35 = v8;
          v36 = [v10 currentUser];
          v37 = [v36 userSettingsForHome:v10];
          v38 = [v37 settings];

          if ([v10 isMultiUserEnabled])
          {
            v39 = [v38 rootGroup];
            v40 = sub_1001FFD5C(@"root.siri.identifyVoice", v39);

            if (v40)
            {
              v41 = [v40 value];
              uint64_t v63 = [v41 BOOLValue];

              v62 = v40;
            }
            else
            {
              v62 = 0;
            }
          }
          uint64_t v8 = v35;
          id v12 = v34;
          if (v63 == 1)
          {
            uint64_t v8 = 1;
          }
          else if (!v63)
          {
            uint64_t v8 = 0;
            uint64_t v63 = 0;
          }
          v66 = v38;
        }
      }
      id v69 = [obj countByEnumeratingWithState:&v75 objects:v88 count:16];
    }
    while (v69);
  }
  else
  {
    v66 = 0;
    v62 = 0;
    uint64_t v8 = 2;
  }
  uint64_t v42 = v8;

  id v43 = objc_alloc_init((Class)NSMutableDictionary);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v44 = v59;
  id v45 = [v44 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v72;
    do
    {
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(void *)v72 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v71 + 1) + 8 * (void)j);
        v50 = [v49 currentUser];
        v51 = [v50 uniqueIdentifier];
        v52 = [v51 UUIDString];

        v53 = [v49 uniqueIdentifier];
        v54 = [v53 UUIDString];

        [v43 setObject:v52 forKey:v54];
        [v70 removeObjectForKey:v54];
      }
      id v46 = [v44 countByEnumeratingWithState:&v71 objects:v79 count:16];
    }
    while (v46);
  }

  v55 = +[ADMultiUserCloudKitSyncer sharedService];
  [v55 setHomeMemberships:v70 homeMembershipsToDelete:v43 voiceIDSetting:v42 == 1];

  if (AFIsMultiUserCompanion() && v42 != 2)
  {
    v56 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v57 = @"NO";
      if (v42 == 1) {
        CFStringRef v57 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      v81 = "-[ADHomeInfoManager _startCloudKitActivityForHomes:homesToDelete:]";
      __int16 v82 = 2112;
      CFStringRef v83 = v57;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s voiceSettingOn value is (%@)", buf, 0x16u);
    }
    v58 = +[ADPreferences sharedPreferences];
    [v58 setMultiUserVoiceIdentification:v42 == 1];
  }
}

- (void)fetchAccessoriesInRoom:(id)a3 matchingCategoryTypes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v39 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    id v30 = v9;
    +[NSMutableArray array];
    v38 = v37 = self;
    [(ADHomeInfoManager *)self _currentHome];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v29 = long long v52 = 0u;
    id obj = [v29 rooms];
    id v34 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v34)
    {
      id v32 = v8;
      uint64_t v33 = *(void *)v50;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v50 != v33) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if (v8)
          {
            id v13 = [*(id *)(*((void *)&v49 + 1) + 8 * i) name];
            unsigned int v14 = [v8 isEqual:v13];

            if (!v14) {
              continue;
            }
          }
          uint64_t v35 = i;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v36 = [v12 accessories];
          id v15 = [v36 countByEnumeratingWithState:&v45 objects:v54 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v40 = *(void *)v46;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v46 != v40) {
                  objc_enumerationMutation(v36);
                }
                id v18 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
                long long v41 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                long long v44 = 0u;
                id v19 = v39;
                id v20 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
                if (v20)
                {
                  id v21 = v20;
                  uint64_t v22 = *(void *)v42;
                  while (2)
                  {
                    for (k = 0; k != v21; k = (char *)k + 1)
                    {
                      if (*(void *)v42 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * (void)k);
                      v25 = [v18 category];
                      id v26 = [v25 categoryType];
                      LODWORD(v24) = [v26 isEqual:v24];

                      if (v24)
                      {
                        uint64_t v27 = [(ADHomeInfoManager *)v37 _accessoryInfoForAccessory:v18];
                        [v38 addObject:v27];

                        goto LABEL_24;
                      }
                    }
                    id v21 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
                    if (v21) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_24:
              }
              id v16 = [v36 countByEnumeratingWithState:&v45 objects:v54 count:16];
            }
            while (v16);
          }

          id v8 = v32;
          i = v35;
        }
        id v34 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v34);
    }

    id v28 = [v38 copy];
    id v10 = v30;
    (*((void (**)(id, void, id))v30 + 2))(v30, 0, v28);
  }
}

- (void)fetchMultiUserMetricsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADHomeInfoManager fetchMultiUserMetricsWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  id v6 = objc_alloc_init((Class)SISchemaMultiUserSetup);
  id v7 = dispatch_group_create();
  id v8 = [(HMHomeManager *)self->_homeManager createMultiuserSettingsMessenger];
  if (v8)
  {
    dispatch_group_enter(v7);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100203E70;
    v18[3] = &unk_100506C50;
    p_long long buf = &buf;
    __int16 v23 = v24;
    id v21 = v4;
    v18[4] = self;
    id v19 = v6;
    id v20 = v7;
    [v8 sendFetchMultiuserSettingsRequest:v18];
  }
  else
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315138;
      id v26 = "-[ADHomeInfoManager fetchMultiUserMetricsWithCompletion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Could not create HMMultiuserSettingsMessenger to HomeKit. Still sending remaining metrics", v25, 0xCu);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002040E8;
  v13[3] = &unk_10050A400;
  id v16 = &buf;
  __int16 v17 = v24;
  id v14 = v6;
  id v15 = v4;
  id v10 = v4;
  id v11 = v6;
  id v12 = objc_retainBlock(v13);
  dispatch_group_notify(v7, (dispatch_queue_t)self->_queue, v12);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)_enumerateListenersUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_listeners;
    id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100204648;
    v7[3] = &unk_10050E160;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002046FC;
    v7[3] = &unk_10050E160;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getCurrentAccessoryInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002047AC;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (AFHomeAccessoryInfo)currentAccessoryInfo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1002048F8;
  long long v10 = sub_100204908;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100204910;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AFHomeAccessoryInfo *)v3;
}

- (NSUUID)accessoryLoggingSalt
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1002048F8;
  long long v10 = sub_100204908;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100204A4C;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSUUID *)v3;
}

- (id)_accessoryLoggingSalt
{
  accessoryLoggingSalt = self->_accessoryLoggingSalt;
  if (!accessoryLoggingSalt)
  {
    id v4 = [(ADHomeInfoManager *)self _currentHome];
    id v5 = [v4 uniqueIdentifier];
    uint64_t v6 = (NSUUID *)[v5 copy];
    id v7 = self->_accessoryLoggingSalt;
    self->_accessoryLoggingSalt = v6;

    accessoryLoggingSalt = self->_accessoryLoggingSalt;
  }
  return accessoryLoggingSalt;
}

- (void)_updateCurrentAccessoryInfoWithAccessory:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_4;
  }
  id v5 = [(ADHomeInfoManager *)self _currentAccessory];
  uint64_t v6 = [v5 uniqueIdentifier];
  id v7 = [v4 uniqueIdentifier];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = [(ADHomeInfoManager *)self _accessoryInfoForAccessory:v4];
  }
  else
  {
LABEL_4:
    id v9 = 0;
  }
  long long v10 = self->_currentAccessoryInfo;
  id v11 = v9;
  long long v12 = v11;
  if (v10 == v11)
  {
  }
  else
  {
    if (v11 && v10)
    {
      unsigned __int8 v13 = [(AFHomeAccessoryInfo *)v10 isEqual:v11];

      if (v13) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    id v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      currentAccessoryInfo = self->_currentAccessoryInfo;
      *(_DWORD *)long long buf = 136315650;
      id v21 = "-[ADHomeInfoManager _updateCurrentAccessoryInfoWithAccessory:]";
      __int16 v22 = 2112;
      __int16 v23 = currentAccessoryInfo;
      __int16 v24 = 2112;
      v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s currentAccessoryInfo: %@ -> %@", buf, 0x20u);
    }
    id v16 = (AFHomeAccessoryInfo *)[(AFHomeAccessoryInfo *)v12 copy];
    __int16 v17 = self->_currentAccessoryInfo;
    self->_currentAccessoryInfo = v16;

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100204D30;
    v18[3] = &unk_100506C28;
    v18[4] = self;
    id v19 = v12;
    [(ADHomeInfoManager *)self _enumerateListenersUsingBlock:v18];
  }
LABEL_15:
}

- (id)_accessoryInfoForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 category];
  uint64_t v6 = [v5 categoryType];
  uint64_t v7 = HMAccessoryCategoryTypeSpeaker;
  if ([v6 isEqual:HMAccessoryCategoryTypeSpeaker])
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    id v9 = [v4 category];
    long long v10 = [v9 categoryType];
    unsigned __int8 v8 = [v10 isEqual:HMAccessoryCategoryTypeAudioReceiver];
  }
  id v11 = [v4 category];
  id v12 = [v11 categoryType];
  if (([v12 isEqualToString:v7] & 1) != 0
    || ([v12 isEqualToString:HMAccessoryCategoryTypeHomePod] & 1) != 0
    || ([v12 isEqualToString:HMAccessoryCategoryTypeAudioReceiver] & 1) != 0)
  {
    uint64_t v13 = 32;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeThermostat])
  {
    uint64_t v13 = 6;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeAppleTV])
  {
    uint64_t v13 = 33;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeTelevision])
  {
    uint64_t v13 = 38;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeLightbulb])
  {
    uint64_t v13 = 1;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeDoorLock])
  {
    uint64_t v13 = 2;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeIPCamera])
  {
    uint64_t v13 = 3;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeGarageDoorOpener])
  {
    uint64_t v13 = 4;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeOutlet])
  {
    uint64_t v13 = 5;
  }
  else if (([v12 isEqualToString:HMAccessoryCategoryTypeFan] & 1) != 0 {
         || ([v12 isEqualToString:HMAccessoryCategoryTypeFan] & 1) != 0)
  }
  {
    uint64_t v13 = 7;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeSecuritySystem])
  {
    uint64_t v13 = 17;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeSwitch])
  {
    uint64_t v13 = 26;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeAirPurifier])
  {
    uint64_t v13 = 27;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeAirPort])
  {
    uint64_t v13 = 34;
  }
  else if ([v12 isEqualToString:HMAccessoryCategoryTypeFaucet])
  {
    uint64_t v13 = 37;
  }
  else
  {
    uint64_t v13 = 0;
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100205124;
  v17[3] = &unk_100506C00;
  unsigned __int8 v21 = v8;
  id v19 = self;
  uint64_t v20 = v13;
  id v18 = v4;
  id v14 = v4;
  id v15 = +[AFHomeAccessoryInfo newWithBuilder:v17];

  return v15;
}

- (id)_currentAccessoryInfo
{
  currentAccessoryInfo = self->_currentAccessoryInfo;
  if (!currentAccessoryInfo)
  {
    id v4 = [(ADHomeInfoManager *)self _currentAccessory];
    currentAccessoryInfo = self->_currentAccessoryInfo;
  }
  id v5 = [(AFHomeAccessoryInfo *)currentAccessoryInfo copy];
  return v5;
}

- (id)_currentAccessory
{
  return self->_currentAccessory;
}

- (id)_accessoryForIdentifier:(id)a3 inHome:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (!v6)
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Unable to look up for accessory in home because the identifier is nil.", buf, 0xCu);
    }
    id v11 = 0;
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_52;
  }
  id v49 = v6;
  unsigned __int8 v8 = [(ADHomeInfoManager *)self _homeManager];
  if ([v8 isDataSyncInProgress])
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Unable to look up for accessory in home because home manager is still syncing data.", buf, 0xCu);
    }
    long long v10 = 0;
    id v11 = 0;
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_51;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v48 = v8;
  uint64_t v13 = [v8 homes];
  id v44 = [v13 countByEnumeratingWithState:&v54 objects:v67 count:16];
  long long v10 = 0;
  if (!v44)
  {
    id v35 = 0;
    goto LABEL_47;
  }
  uint64_t v14 = *(void *)v55;
  long long v46 = v13;
  long long v47 = a4;
  uint64_t v43 = *(void *)v55;
LABEL_15:
  uint64_t v15 = 0;
  while (2)
  {
    if (*(void *)v55 != v14) {
      objc_enumerationMutation(v13);
    }
    uint64_t v45 = v15;
    id v16 = *(void **)(*((void *)&v54 + 1) + 8 * v15);
    __int16 v17 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v18 = v17;
      id v19 = [v16 description];
      *(_DWORD *)long long buf = 136315395;
      id v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
      __int16 v60 = 2113;
      v61 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s home:%{private}@", buf, 0x16u);
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v20 = v16;
    unsigned __int8 v21 = objc_msgSend(v16, "accessories", v43);
    id v22 = [v21 countByEnumeratingWithState:&v50 objects:v66 count:16];
    if (!v22)
    {
      id v25 = v49;
      goto LABEL_39;
    }
    id v23 = v22;
    uint64_t v24 = *(void *)v51;
    id v25 = v49;
    while (2)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v51 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v27 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v28 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = v28;
          id v30 = [v27 description];
          *(_DWORD *)long long buf = 136315395;
          id v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
          __int16 v60 = 2113;
          v61 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s accessory:%{private}@", buf, 0x16u);
        }
        CFStringRef v31 = [v27 uniqueIdentifier];
        if ([v31 isEqual:v25])
        {
        }
        else
        {
          id v32 = [v27 uuid];
          unsigned int v33 = [v32 isEqual:v25];

          if (!v33)
          {
            id v25 = v49;
            continue;
          }
        }
        id v34 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          id v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s found accessory", buf, 0xCu);
        }
        id v35 = v27;
        id v36 = v20;

        id v25 = v49;
        if (v35)
        {
          long long v10 = v21;
          a4 = v47;
          goto LABEL_45;
        }
        long long v10 = v36;
      }
      id v23 = [v21 countByEnumeratingWithState:&v50 objects:v66 count:16];
      if (v23) {
        continue;
      }
      break;
    }
LABEL_39:

    if (!+[AFFeatureFlags isRemoraEnabled]
      || ([v20 accessoryWithUniqueIdentifier:v25], (uint64_t v37 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v15 = v45 + 1;
      uint64_t v13 = v46;
      a4 = v47;
      uint64_t v14 = v43;
      if ((id)(v45 + 1) != v44) {
        continue;
      }
      id v35 = 0;
      id v44 = [v46 countByEnumeratingWithState:&v54 objects:v67 count:16];
      if (!v44) {
        goto LABEL_47;
      }
      goto LABEL_15;
    }
    break;
  }
  id v35 = (id)v37;
  uint64_t v40 = AFSiriLogContextDaemon;
  a4 = v47;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    long long v41 = v40;
    long long v42 = [v35 description];
    *(_DWORD *)long long buf = 136315395;
    id v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
    __int16 v60 = 2113;
    v61 = v42;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s accessory:%{private}@", buf, 0x16u);

    uint64_t v40 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s found accessory", buf, 0xCu);
  }
  id v36 = v20;
LABEL_45:

  long long v10 = v36;
  uint64_t v13 = v46;
LABEL_47:

  v38 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315907;
    id v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
    __int16 v60 = 2112;
    v61 = v49;
    __int16 v62 = 2113;
    id v63 = v35;
    __int16 v64 = 2113;
    v65 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%s %@ -> %{private}@ (%{private}@)", buf, 0x2Au);
    if (a4) {
LABEL_49:
    }
      *a4 = v10;
  }
  else if (a4)
  {
    goto LABEL_49;
  }
  id v11 = v35;
  unsigned __int8 v8 = v48;
LABEL_51:

  uint64_t v7 = v49;
LABEL_52:

  return v11;
}

- (id)getCurrentASRLanguages
{
  v2 = +[ADPreferences sharedPreferences];
  id v3 = [v2 languageCode];

  id v4 = +[ADCommandCenter sharedCommandCenter];
  id v5 = [v4 _assetManager];
  id v6 = [v5 assetsAvailableStatusForLanguage:v3];

  if (AFIsSpeechAssetAvailableFromUodStatus()) {
    id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v3, 0);
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)getHomeContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100205C00;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)JSCapableHomeAccessories:(id)a3
{
}

- (void)JSCapableHomeAccessories:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100205CE8;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (id)getHomeUniqueIdentifiers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1002048F8;
  id v11 = sub_100204908;
  id v12 = +[NSMutableArray array];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100206014;
  v6[3] = &unk_10050D5F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)accessoriesInHome
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1002048F8;
  id v11 = sub_100204908;
  id v12 = +[NSMutableArray array];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10020626C;
  v6[3] = &unk_10050D5F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)accessoriesWithPersonalRequestsEnabled
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1002048F8;
  id v11 = sub_100204908;
  id v12 = +[NSMutableArray array];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100206618;
  v6[3] = &unk_10050D5F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setRecognizeMyVoiceEnabled:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100206954;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)restartShareDeletion
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100206EB0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)restartSharing
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020727C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100207330;
  v7[3] = &unk_100506BB0;
  id v8 = a4;
  id v6 = v8;
  [(ADHomeInfoManager *)self getAccessoryInfoForAccessoryWithUUID:a3 completionHandler:v7];
}

- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v4 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:44 userInfo:0];
  if (v5) {
    (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v4);
  }
}

- (void)getCurrentAccessoryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100207480;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_onceSiriDataSharingAdjustment:(id)a3
{
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100207A18;
  v34[3] = &unk_10050CB48;
  v34[4] = self;
  id v4 = a3;
  id v35 = v4;
  id v5 = objc_retainBlock(v34);
  id v6 = +[ADPreferences sharedPreferences];
  if ([v6 siriDataSharingHomePodSetupDeviceIsValid]) {
    int v7 = 1;
  }
  else {
    int v7 = _AFPreferencesHomePodAdjustedOptIn2021WithContext();
  }

  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v8;
    id v10 = [(ADHomeInfoManager *)self _currentAccessory];
    id v11 = [v10 uniqueIdentifier];
    *(_DWORD *)long long buf = 136315651;
    uint64_t v37 = "-[ADHomeInfoManager _onceSiriDataSharingAdjustment:]";
    __int16 v38 = 2113;
    uint64_t v39 = (uint64_t)v11;
    __int16 v40 = 1024;
    LODWORD(v41) = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Current status of accessory %{private}@ is: %d", buf, 0x1Cu);
  }
  if (!v7)
  {
    uint64_t v14 = [(ADHomeInfoManager *)self _currentAccessory];
    id v13 = [v14 settings];

    uint64_t v15 = [v13 rootGroup];
    id v16 = sub_1001FFD5C(@"root.general.analytics.shareSiriAnalytics", v15);

    __int16 v17 = [(ADHomeInfoManager *)self _homeManager];
    if ([v17 hasOptedToHH2])
    {
    }
    else
    {
      char IsHomePodInHH2Mode = _AFPreferencesIsHomePodInHH2Mode();

      if ((IsHomePodInHH2Mode & 1) == 0)
      {
        if (v16)
        {
          [v16 updateValue:&off_1005238A0 completionHandler:v5];
        }
        else
        {
          unint64_t v20 = ++qword_100585ED0;
          unsigned __int8 v21 = (void *)AFSiriLogContextDaemon;
          BOOL v22 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
          if (v20 > 0x13)
          {
            if (v22)
            {
              id v25 = v21;
              id v26 = [(ADHomeInfoManager *)self _currentAccessory];
              uint64_t v27 = [v26 uniqueIdentifier];
              *(_DWORD *)long long buf = 136315395;
              uint64_t v37 = "-[ADHomeInfoManager _onceSiriDataSharingAdjustment:]";
              __int16 v38 = 2113;
              uint64_t v39 = (uint64_t)v27;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Error setting siriDataSharing for accessory %{private}@ in HomeKit. siriDataSharing is nil.  Maximum retries reached", buf, 0x16u);
            }
          }
          else
          {
            if (v22)
            {
              uint64_t v28 = v21;
              uint64_t v29 = [(ADHomeInfoManager *)self _currentAccessory];
              id v30 = [v29 uniqueIdentifier];
              *(_DWORD *)long long buf = 136315651;
              uint64_t v37 = "-[ADHomeInfoManager _onceSiriDataSharingAdjustment:]";
              __int16 v38 = 2113;
              uint64_t v39 = (uint64_t)v30;
              __int16 v40 = 2048;
              uint64_t v41 = qword_100585ED0;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s Error setting siriDataSharing for accessory %{private}@ in HomeKit. siriDataSharing is nil. Scheduling retry %lu", buf, 0x20u);
            }
            dispatch_time_t v23 = dispatch_time(0, 30000000000);
            queue = self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100207C18;
            block[3] = &unk_10050E160;
            void block[4] = self;
            id v32 = v4;
            dispatch_after(v23, queue, block);
          }
        }
        goto LABEL_15;
      }
    }
    ((void (*)(void *, void))v5[2])(v5, 0);
LABEL_15:

    goto LABEL_16;
  }
  if ((_AFPreferencesSiriDataSharingHomeAccessoryMigrated() & 1) == 0
    && +[AFFeatureFlags isSiriDataSharingRepromptEnabled])
  {
    uint64_t v12 = _AFPreferencesSiriDataSharingLegacyOptInStatusWithContext();
    if ((unint64_t)(v12 - 1) <= 1)
    {
      id v13 = +[ADPreferences sharedPreferences];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100207AD4;
      v33[3] = &unk_10050BB58;
      v33[4] = v12;
      [v13 setSiriDataSharingOptInStatus:v12 propagateToHomeAccessories:0 source:11 reason:@"Migration upon upgrade" completion:v33];
LABEL_16:

      goto LABEL_17;
    }
    id v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315395;
      uint64_t v37 = "-[ADHomeInfoManager _onceSiriDataSharingAdjustment:]";
      __int16 v38 = 2049;
      uint64_t v39 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Only Opt-In and Opt-Out should be migrated to %{private}ld", buf, 0x16u);
    }
    _AFPreferencesSetSiriDataSharingHomeAccessoryMigrated();
  }
LABEL_17:
}

- (void)_siriDataSharingAdjustment:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100208290;
  v5[3] = &unk_10050E160;
  v5[4] = self;
  id v6 = a3;
  uint64_t v3 = qword_100585EC8;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_100585EC8, v5);
  }
}

- (void)setAllowHeySiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3
{
}

- (void)initializeHomeSiriPhraseOptions:(id)a3 completion:(id)a4
{
}

- (void)isJustSiriEnabledInTheHome:(id)a3
{
}

- (void)_updateVoiceTriggerPhrase
{
  uint64_t v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    id v8 = "-[ADHomeInfoManager _updateVoiceTriggerPhrase]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v7, 0xCu);
  }
  if (self->_currentAccessory)
  {
    currentHome = self->_currentHome;
    if (currentHome)
    {
      id v5 = [(HMHome *)currentHome siriPhraseOptions];
      id v6 = [(ADHomeInfoManager *)self _currentAccessoryInfo];
      [(ADHomeInfoManager *)self updateVoiceTriggerPhrase:v5 currentAccessoryInfo:v6];
    }
  }
}

- (void)availableLanguagesInTheHome:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v10 = "-[ADHomeInfoManager availableLanguagesInTheHome:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002084F4;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
LABEL_4:
}

- (void)getHomeIdForAccessoryId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100208924;
      block[3] = &unk_10050E1D8;
      void block[4] = self;
      id v11 = v6;
      id v12 = v8;
      dispatch_async(queue, block);
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)getVoiceSettingsForHomeMembers:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100208A44;
    v6[3] = &unk_100506B88;
    id v7 = v4;
    [(ADHomeInfoManager *)self settingsForMultiUserWithRefresh:0 completion:v6];
  }
}

- (void)settingsForMultiUserWithRefresh:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100208C68;
    block[3] = &unk_10050D378;
    void block[4] = self;
    BOOL v11 = a3;
    id v10 = v6;
    dispatch_async(queue, block);
  }
}

- (void)getCurrentHomeMemberIds:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100208DF0;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_setPreferredMediaUserForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315395;
    id v26 = "-[ADHomeInfoManager _setPreferredMediaUserForAccessory:]";
    __int16 v27 = 2113;
    uint64_t v28 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s accessory = %{private}@", buf, 0x16u);
  }
  id v6 = [v4 preferredMediaUser];
  id v7 = [v6 uniqueIdentifier];
  id v8 = [v7 UUIDString];

  if (v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [(ADHomeInfoManager *)self _currentHome];
  id v10 = [v9 owner];
  BOOL v11 = [v10 uniqueIdentifier];
  id v8 = [v11 UUIDString];

  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315395;
    id v26 = "-[ADHomeInfoManager _setPreferredMediaUserForAccessory:]";
    __int16 v27 = 2113;
    uint64_t v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s preferredMediaUser is not available, falling back to use home owner (%{private}@) as default", buf, 0x16u);
  }
  if (v8)
  {
LABEL_7:
    id v13 = [(ADHomeInfoManager *)self _currentAccessory];
    uint64_t v14 = [v4 uniqueIdentifier];
    uint64_t v15 = [v13 uniqueIdentifier];
    if ([v14 isEqual:v15])
    {
      id v16 = [v4 category];
      __int16 v17 = [v16 categoryType];
      unsigned int v18 = [v17 isEqualToString:HMAccessoryCategoryTypeHomePod];

      if (v18)
      {
        id v19 = +[ADMultiUserService sharedService];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10020943C;
        v23[3] = &unk_100507CB8;
        v23[4] = self;
        uint64_t v24 = v8;
        [v19 getSharedUserIdForHomeUserId:v24 completion:v23];

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
    }
    unint64_t v20 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      id v26 = "-[ADHomeInfoManager _setPreferredMediaUserForAccessory:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s Unknown accessory type, ignoring", buf, 0xCu);
    }
    goto LABEL_13;
  }
  unsigned __int8 v21 = (void *)AFSiriLogContextDaemon;
  if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  id v8 = v21;
  BOOL v22 = [(ADHomeInfoManager *)self _currentHome];
  *(_DWORD *)long long buf = 136315651;
  id v26 = "-[ADHomeInfoManager _setPreferredMediaUserForAccessory:]";
  __int16 v27 = 2113;
  uint64_t v28 = v22;
  __int16 v29 = 2113;
  id v30 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Unable to determine preferredMediaUser at this time for current home (%{private}@), home owner not available. Not setting preferredMediaUser for accessory (%{private}@)", buf, 0x20u);

LABEL_14:
LABEL_15:
}

- (void)_setPreferredMediaUserForAccessories:(id)a3
{
  id v4 = a3;
  id v19 = self;
  id v5 = [(ADHomeInfoManager *)self _currentAccessory];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v23;
    uint64_t v20 = HMAccessoryCategoryTypeHomePod;
    *(void *)&long long v7 = 136315394;
    long long v18 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "uniqueIdentifier", v18);
        id v13 = [v5 uniqueIdentifier];
        if ([v12 isEqual:v13])
        {
          uint64_t v14 = [v11 category];
          uint64_t v15 = [v14 categoryType];
          unsigned int v16 = [v15 isEqualToString:v20];

          if (v16)
          {
            __int16 v17 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = v18;
              __int16 v27 = "-[ADHomeInfoManager _setPreferredMediaUserForAccessories:]";
              __int16 v28 = 2112;
              __int16 v29 = v11;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s HomePod = %@", buf, 0x16u);
            }
            [v11 setDelegate:v19];
            [(ADHomeInfoManager *)v19 _setPreferredMediaUserForAccessory:v11];
          }
        }
        else
        {
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v8);
  }
}

- (id)preferredMediaUserInfo
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1002048F8;
  id v10 = sub_100204908;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100209A8C;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)infoForThisDevice
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1002048F8;
  id v10 = sub_100204908;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100209BC8;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_homesWithMultiUserEnabled
{
  if (AFIsMultiUserCompanion())
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v24 = "-[ADHomeInfoManager _homesWithMultiUserEnabled]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    id v5 = self->_homeManager;
    if (![(HMHomeManager *)v5 status])
    {
      uint64_t v6 = [(HMHomeManager *)v5 homes];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v20;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ([v11 isMultiUserEnabled])
            {
              id v12 = [v11 owner];
              id v13 = [v12 uniqueIdentifier];
              uint64_t v14 = [v13 UUIDString];

              if (v14)
              {
                uint64_t v15 = [v11 uniqueIdentifier];
                unsigned int v16 = [v15 UUIDString];

                [v4 setObject:v14 forKey:v16];
              }
            }
          }
          id v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }
        while (v8);
      }
    }
    __int16 v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      long long v24 = "-[ADHomeInfoManager _homesWithMultiUserEnabled]";
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s (%@)", buf, 0x16u);
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)_updateHomeUserSettings
{
  v2 = self;
  id v3 = [(ADHomeInfoManager *)self _homeManager];
  id v4 = [v3 homes];

  if (!v2->_homeUserSettings)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    homeUserSettings = v2->_homeUserSettings;
    v2->_homeUserSettings = v5;
  }
  uint64_t v91 = +[ADMultiUserService sharedService];
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = v4;
  id v94 = [obj countByEnumeratingWithState:&v116 objects:v127 count:16];
  if (v94)
  {
    int v102 = 0;
    char v7 = 0;
    uint64_t v97 = 2;
    uint64_t v93 = *(void *)v117;
    p_isa = (id *)&v2->super.isa;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v117 != v93) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(HMHome **)(*((void *)&v116 + 1) + 8 * v8);
      if (!AFSupportsMultiUser() || v9 == v2->_currentHome)
      {
        id v10 = [(HMHome *)v9 owner];
        id v11 = [v10 uniqueIdentifier];
        id v12 = [v11 UUIDString];

        if (!v12)
        {
          __int16 v82 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315138;
            v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
            _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%s Home is not present", buf, 0xCu);
          }
          CFStringRef v83 = obj;

          BOOL v84 = 0;
          v85 = (void *)v91;
          goto LABEL_110;
        }
        uint64_t v96 = v8;
        v100 = +[NSMutableDictionary dictionary];
        v103 = +[NSMutableDictionary dictionary];
        id v13 = [(NSMutableDictionary *)v2->_homeUserSettings objectForKey:v12];
        uint64_t v14 = [(NSMutableDictionary *)v13 objectForKey:@"allowVoiceID"];
        id v110 = [v14 integerValue];
        uint64_t v15 = v13;
        if (v13)
        {
          unsigned int v16 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 136315651;
            v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
            __int16 v123 = 2113;
            v124 = v13;
            __int16 v125 = 2112;
            v126 = v9;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s primaryUser previous settings %{private}@ for home (%@)", buf, 0x20u);
          }
          [v100 setObject:v14 forKey:v12];
        }
        v107 = v14;
        __int16 v17 = [(HMHome *)v9 owner];
        long long v18 = [(ADHomeInfoManager *)v2 _settingsForHomeUser:v17 forHome:v9];

        long long v19 = [(NSMutableDictionary *)v18 objectForKey:@"allowVoiceID"];
        id v20 = [v19 integerValue];
        long long v21 = v19;
        [v103 setObject:v19 forKey:v12];
        long long v22 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136315651;
          v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
          __int16 v123 = 2113;
          v124 = v18;
          __int16 v125 = 2112;
          v126 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s primaryUser new settings %{private}@ for home (%@)", buf, 0x20u);
        }
        v105 = v9;
        if (([(NSMutableDictionary *)v15 isEqualToDictionary:v18] & 1) == 0)
        {
          if (AFIsMultiUserCompanion())
          {
            long long v23 = [(HMHome *)v9 currentUser];
            long long v24 = [v23 uniqueIdentifier];
            __int16 v25 = [v24 UUIDString];
            unsigned int v26 = [(NSMutableDictionary *)v12 isEqualToString:v25];

            if (v26)
            {
              if (v20 == (id)1)
              {
                __int16 v27 = AFSiriLogContextDaemon;
                uint64_t v9 = v105;
                id v28 = v110;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 136315395;
                  v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
                  __int16 v123 = 2113;
                  v124 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Voice ID setting is ON for %{private}@", buf, 0x16u);
                }
                uint64_t v97 = 1;
                int v29 = v102;
              }
              else
              {
                uint64_t v30 = v97;
                if (!v20) {
                  uint64_t v30 = 0;
                }
                uint64_t v97 = v30;
                int v29 = v102;
                uint64_t v9 = v105;
                id v28 = v110;
              }
              if (v28) {
                BOOL v31 = 0;
              }
              else {
                BOOL v31 = v20 == (id)1;
              }
              int v32 = v31;
              int v102 = v32 | v29;
            }
            else
            {
              uint64_t v9 = v105;
            }
          }
          unsigned int v33 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315138;
            v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s #multi-user _updateHomeUserSettings- MultiUserSetupHomepodUserAddedToHome primary user", buf, 0xCu);
          }
          char v7 = 1;
          [(ADHomeInfoManager *)v2 _logRelevantAnalyticsOnHomeUserSettingsUpdateForCurrentSettings:v18 allowVoiceIdSettingValue:v20 isPrimaryUser:1];
        }
        id v34 = v2->_homeUserSettings;
        id v35 = [(NSMutableDictionary *)v18 mutableCopy];
        v95 = v12;
        [(NSMutableDictionary *)v34 setObject:v35 forKey:v12];

        id v36 = [(HMHome *)v9 users];
        long long v112 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v99 = v36;
        id v104 = [v36 countByEnumeratingWithState:&v112 objects:v120 count:16];
        if (v104)
        {
          uint64_t v101 = *(void *)v113;
          uint64_t v37 = v107;
          __int16 v38 = v15;
          while (1)
          {
            uint64_t v39 = 0;
            __int16 v40 = v18;
            uint64_t v41 = v37;
            long long v42 = v38;
            do
            {
              if (*(void *)v113 != v101) {
                objc_enumerationMutation(v99);
              }
              uint64_t v43 = *(void **)(*((void *)&v112 + 1) + 8 * (void)v39);
              id v44 = [v43 uniqueIdentifier];
              uint64_t v45 = [v44 UUIDString];

              long long v46 = [p_isa[8] objectForKey:v45];

              long long v47 = [(NSMutableDictionary *)v46 objectForKey:@"allowVoiceID"];

              id v48 = [v47 integerValue];
              v111 = v46;
              if (v46)
              {
                id v49 = AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 136315651;
                  v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
                  __int16 v123 = 2113;
                  v124 = v111;
                  __int16 v125 = 2112;
                  v126 = v105;
                  _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "%s Secondary user previous settings %{private}@ for home (%@)", buf, 0x20u);
                }
                [v100 setObject:v47 forKey:v45];
              }
              v108 = v47;
              long long v18 = [p_isa _settingsForHomeUser:v43 forHome:v105];

              long long v50 = [(NSMutableDictionary *)v18 objectForKey:@"allowVoiceID"];

              id v51 = [v50 integerValue];
              [v103 setObject:v50 forKey:v45];
              long long v52 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 136315651;
                v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
                __int16 v123 = 2113;
                v124 = v18;
                __int16 v125 = 2112;
                v126 = v105;
                _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%s Secondary user new settings %{private}@ for home (%@)", buf, 0x20u);
              }
              if (([(NSMutableDictionary *)v111 isEqualToDictionary:v18] & 1) == 0)
              {
                if (AFIsMultiUserCompanion())
                {
                  v98 = v50;
                  long long v53 = [(HMHome *)v105 currentUser];
                  long long v54 = [v53 uniqueIdentifier];
                  long long v55 = [v54 UUIDString];
                  unsigned int v56 = [(NSMutableDictionary *)v45 isEqualToString:v55];

                  if (v56)
                  {
                    if (v51)
                    {
                      long long v50 = v98;
                      if (v51 == (id)1)
                      {
                        long long v57 = AFSiriLogContextDaemon;
                        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)long long buf = 136315395;
                          v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
                          __int16 v123 = 2113;
                          v124 = v45;
                          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "%s Voice ID setting is ON for %{private}@", buf, 0x16u);
                        }
                        uint64_t v97 = 1;
                      }
                      goto LABEL_59;
                    }
                    uint64_t v97 = 0;
                  }
                  long long v50 = v98;
                }
LABEL_59:
                v58 = AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 136315138;
                  v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%s #multi-user _updateHomeUserSettings- MultiUserSetupHomepodUserAddedToHome secondary user", buf, 0xCu);
                }
                [p_isa _logRelevantAnalyticsOnHomeUserSettingsUpdateForCurrentSettings:v18 allowVoiceIdSettingValue:v51 isPrimaryUser:0];
                if (v48) {
                  BOOL v59 = 0;
                }
                else {
                  BOOL v59 = v51 == (id)1;
                }
                int v60 = v59;
                v102 |= v60;
                char v7 = 1;
              }
              id v61 = p_isa[8];
              id v62 = [(NSMutableDictionary *)v18 mutableCopy];
              [v61 setObject:v62 forKey:v45];

              uint64_t v39 = (char *)v39 + 1;
              long long v21 = v50;
              id v63 = v50;
              __int16 v40 = v18;
              uint64_t v37 = v108;
              __int16 v38 = v111;
              uint64_t v41 = v108;
              long long v42 = v111;
            }
            while (v104 != v39);
            long long v21 = v63;
            id v104 = [v99 countByEnumeratingWithState:&v112 objects:v120 count:16];
            if (!v104) {
              goto LABEL_72;
            }
          }
        }
        uint64_t v37 = v107;
        __int16 v38 = v15;
LABEL_72:
        v109 = v37;
        __int16 v64 = [(HMHome *)v105 currentUser];
        v65 = [v64 uniqueIdentifier];
        v66 = [v65 UUIDString];

        v67 = [(HMHome *)v105 currentUser];
        v2 = (ADHomeInfoManager *)p_isa;
        [v67 setDelegate:p_isa];

        uint64_t v68 = [(HMHome *)v105 currentUser];
        id v69 = [p_isa _settingsForHomeUser:v68 forHome:v105];

        id v70 = [p_isa[8] objectForKey:v66];

        if (v70)
        {
          long long v71 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 136315651;
            v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
            __int16 v123 = 2113;
            v124 = v70;
            __int16 v125 = 2112;
            v126 = v105;
            _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "%s currentUserSettings %{private}@ for home (%@)", buf, 0x20u);
          }
        }
        long long v72 = [v69 objectForKey:@"allowVoiceID"];
        id v73 = [v72 integerValue];

        long long v74 = [(NSMutableDictionary *)v70 objectForKey:@"allowVoiceID"];
        id v75 = [v74 integerValue];

        if ([(NSMutableDictionary *)v70 isEqualToDictionary:v69])
        {
          uint64_t v8 = v96;
        }
        else
        {
          if (AFIsMultiUserCompanion())
          {
            if (v73 == (id)1)
            {
              long long v76 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 136315395;
                v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
                __int16 v123 = 2113;
                v124 = v66;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "%s Voice ID setting is ON for current user %{private}@", buf, 0x16u);
              }
              uint64_t v77 = 1;
            }
            else
            {
              uint64_t v77 = v97;
              if (!v73) {
                uint64_t v77 = 0;
              }
            }
            uint64_t v97 = v77;
            BOOL v79 = v73 == (id)1 && v75 == 0;
            v102 |= v79;
          }
          uint64_t v8 = v96;
          char v7 = 1;
          [p_isa _logRelevantAnalyticsOnHomeUserSettingsUpdateForCurrentSettings:v69 allowVoiceIdSettingValue:v73 isPrimaryUser:1];
        }
        id v80 = p_isa[8];
        id v81 = [v69 mutableCopy];
        [v80 setObject:v81 forKey:v66];
      }
      if ((id)++v8 == v94)
      {
        id v94 = [obj countByEnumeratingWithState:&v116 objects:v127 count:16];
        if (!v94) {
          goto LABEL_100;
        }
        goto LABEL_5;
      }
    }
  }
  LOBYTE(v102) = 0;
  char v7 = 0;
  uint64_t v97 = 2;
LABEL_100:

  if (AFIsMultiUserCompanion())
  {
    if (v97 != 2)
    {
      __int16 v86 = +[ADPreferences sharedPreferences];
      [v86 setMultiUserVoiceIdentification:v97 == 1];

      if (v102)
      {
        v87 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "%s Start sharing", buf, 0xCu);
        }
        [(ADHomeInfoManager *)v2 restartSharing];
      }
    }
  }
  if (v7)
  {
    v88 = AFSiriLogContextDaemon;
    BOOL v84 = 1;
    v85 = (void *)v91;
    CFStringRef v83 = obj;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v89 = v2->_homeUserSettings;
      *(_DWORD *)long long buf = 136315394;
      v122 = "-[ADHomeInfoManager _updateHomeUserSettings]";
      __int16 v123 = 2112;
      v124 = v89;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "%s Settings (%@)", buf, 0x16u);
    }
  }
  else
  {
    BOOL v84 = 0;
    v85 = (void *)v91;
    CFStringRef v83 = obj;
  }
LABEL_110:

  return v84;
}

- (id)_settingsForHomeUser:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 userSettingsForHome:v7];
  uint64_t v9 = [v8 settings];

  [v6 setDelegate:self];
  [v9 setDelegate:self];
  if ([v7 isMultiUserEnabled]
    && ([v9 rootGroup],
        id v10 = objc_claimAutoreleasedReturnValue(),
        sub_1001FFD5C(@"root.siri.identifyVoice", v10),
        id v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    id v12 = [v11 value];
    uint64_t v13 = [v12 BOOLValue];
  }
  else
  {
    uint64_t v13 = 2;
  }
  BOOL v14 = [(ADHomeInfoManager *)self _allowExplicitContentSettingForUser:v6 forHome:v7];
  uint64_t v15 = [v6 assistantAccessControlForHome:v7];
  unsigned int v16 = [(ADHomeInfoManager *)self _currentAccessory];
  __int16 v17 = sub_10020AED8(v15, v16);

  id v18 = [v17 personalDomainsIsEnabled];
  uint64_t v19 = [v17 securePersonalDomainsRequireAuth] ^ 1;
  id v20 = objc_alloc((Class)NSDictionary);
  long long v21 = +[NSNumber numberWithBool:v18];
  long long v22 = +[NSNumber numberWithBool:v19];
  long long v23 = +[NSNumber numberWithInteger:v13];
  long long v24 = +[NSNumber numberWithBool:v14];
  id v25 = objc_msgSend(v20, "initWithObjectsAndKeys:", v21, @"personalDomainsIsEnabled", v22, @"allowUnauthenticatedRequests", v23, @"allowVoiceID", v24, @"allowExplicitContent", 0);

  return v25;
}

- (BOOL)_allowExplicitContentSettingForUser:(id)a3 forHome:(id)a4
{
  id v4 = +[MCProfileConnection sharedConnection];
  BOOL v5 = [v4 effectiveBoolValueForSetting:MCFeatureExplicitContentAllowed] == 1;

  return v5;
}

- (void)_resolveSiriDataSharingStatusMismatch:(id)a3
{
  if (AFIsHorseman() && !_AFPreferencesSiriDataSharingOptInStatus())
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      long long v22 = "-[ADHomeInfoManager _resolveSiriDataSharingStatusMismatch:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Siri Data Sharing status is unspecified on this device, check if there's a mismatch between this and HomeKit accessory's setting and recover", (uint8_t *)&v21, 0xCu);
    }
    BOOL v5 = [(ADHomeInfoManager *)self _currentAccessory];
    id v6 = [v5 settings];

    id v7 = [v6 rootGroup];
    uint64_t v8 = sub_1001FFD5C(@"root.general.analytics.shareSiriAnalytics", v7);

    if (v8)
    {
      uint64_t v9 = [v8 value];

      if (v9)
      {
        id v10 = [v8 value];
        unsigned int v11 = [v10 BOOLValue];

        if (v11)
        {
          id v12 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            int v21 = 136315138;
            long long v22 = "-[ADHomeInfoManager _resolveSiriDataSharingStatusMismatch:]";
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Accessory setting thinks this HomePod is Opted-In, but HomePod is in unspecified state, resolving mismatch", (uint8_t *)&v21, 0xCu);
          }
          uint64_t v13 = +[ADPreferences sharedPreferences];
          BOOL v14 = v13;
          uint64_t v15 = 1;
LABEL_20:
          [v13 setSiriDataSharingOptInStatus:v15 propagateToHomeAccessories:0 source:4 reason:@"resolveSiriDataSharingStatusMismatch" completion:0];

          goto LABEL_21;
        }
        id v18 = [v8 value];
        int v19 = [v18 BOOLValue];

        if ((v19 & 1) == 0)
        {
          id v20 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            int v21 = 136315138;
            long long v22 = "-[ADHomeInfoManager _resolveSiriDataSharingStatusMismatch:]";
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Accessory setting thinks this HomePod is Opted-Out, but HomePod is in unspecified state, resolving mismatch", (uint8_t *)&v21, 0xCu);
          }
          uint64_t v13 = +[ADPreferences sharedPreferences];
          BOOL v14 = v13;
          uint64_t v15 = 2;
          goto LABEL_20;
        }
LABEL_21:

        return;
      }
      unsigned int v16 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      int v21 = 136315394;
      long long v22 = "-[ADHomeInfoManager _resolveSiriDataSharingStatusMismatch:]";
      __int16 v23 = 2112;
      CFStringRef v24 = @"root.general.analytics.shareSiriAnalytics";
      __int16 v17 = "%s %@ value is null, no recovery needed";
    }
    else
    {
      unsigned int v16 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      int v21 = 136315394;
      long long v22 = "-[ADHomeInfoManager _resolveSiriDataSharingStatusMismatch:]";
      __int16 v23 = 2112;
      CFStringRef v24 = @"root.general.analytics.shareSiriAnalytics";
      __int16 v17 = "%s %@ setting does not exist on this HomePod, no recovery needed";
    }
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v21, 0x16u);
    goto LABEL_21;
  }
}

- (void)_siriDataSharingOptInStatusDidChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v9 = "-[ADHomeInfoManager _siriDataSharingOptInStatusDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (AFIsMultiUserCompanion())
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10020B85C;
    block[3] = &unk_10050E138;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_logRelevantAnalyticsOnHomeUserSettingsUpdateForCurrentSettings:(id)a3 allowVoiceIdSettingValue:(int64_t)a4 isPrimaryUser:(BOOL)a5
{
  BOOL v5 = a5;
  if (AFIsHorseman())
  {
    if (v5) {
      CFStringRef v7 = @"owner";
    }
    else {
      CFStringRef v7 = @"participant";
    }
    v14[0] = @"user";
    v14[1] = @"date";
    v15[0] = v7;
    uint64_t v8 = +[NSDate date];
    uint64_t v9 = +[NSDateFormatter localizedStringFromDate:v8 dateStyle:1 timeStyle:4];
    v15[1] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

    if (!a3)
    {
      unsigned int v11 = +[AFAnalytics sharedAnalytics];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10020BCB0;
      v12[3] = &unk_10050E0C8;
      id v13 = v10;
      [v11 logEventWithType:6110 contextProvider:v12];
    }
  }
}

- (id)_currentHomeInfo
{
  if (!self->_currentHomeInfo)
  {
    id v3 = [(ADHomeInfoManager *)self _currentHome];
    id v4 = [(ADHomeInfoManager *)self _currentAccessory];
    BOOL v5 = [v3 owner];
    id v6 = [v5 assistantAccessControlForHome:v3];
    sub_10020AED8(v6, v4);
    CFStringRef v7 = (ADHomeInfo *)objc_claimAutoreleasedReturnValue();
    currentHomeInfo = self->_currentHomeInfo;
    self->_currentHomeInfo = v7;

    uint64_t v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v10 = self->_currentHomeInfo;
      int v16 = 136315907;
      __int16 v17 = "-[ADHomeInfoManager _currentHomeInfo]";
      __int16 v18 = 2113;
      int v19 = v3;
      __int16 v20 = 2113;
      int v21 = v5;
      __int16 v22 = 2113;
      __int16 v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s home (%{private}@) owner (%{private}@) %{private}@", (uint8_t *)&v16, 0x2Au);
    }
    if (AFIsHorseman())
    {
      unsigned int v11 = self->_currentHomeInfo;
      id v12 = [v3 uniqueIdentifier];
      [(ADHomeInfo *)v11 setCurrentHomeIdentifier:v12];
    }
    if (self->_currentHomeInfo)
    {
      [(ADHomeInfoManager *)self _updateHomeUserSettings];
      id v13 = +[NSNotificationCenter defaultCenter];
      [v13 postNotificationName:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
    }
    goto LABEL_12;
  }
  if (AFIsMultiUserCompanion()
    && [(ADHomeInfoManager *)self _updateHomeUserSettings])
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
LABEL_12:
  }
  BOOL v14 = self->_currentHomeInfo;
  return v14;
}

- (id)_currentHome
{
  currentHome = self->_currentHome;
  if (!currentHome)
  {
    id v4 = [(ADHomeInfoManager *)self _homeManager];
    if ([v4 isDataSyncInProgress])
    {
      BOOL v5 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v35 = "-[ADHomeInfoManager _currentHome]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Home manager is still syncing", buf, 0xCu);
      }
      goto LABEL_28;
    }
    if ((AFIsHorseman() & 1) != 0 || AFIsATV())
    {
      id v6 = [(ADHomeInfoManager *)self _currentAccessory];
      CFStringRef v7 = [v6 home];
      uint64_t v8 = self->_currentHome;
      self->_currentHome = v7;

      uint64_t v9 = self->_currentHome;
      if (!v9)
      {
        id v10 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          id v35 = "-[ADHomeInfoManager _currentHome]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Unable to get current accessory, trying current home.", buf, 0xCu);
        }
        unsigned int v11 = [(ADHomeInfoManager *)self _homeManager];
        id v12 = [v11 currentHome];
        id v13 = self->_currentHome;
        self->_currentHome = v12;

        uint64_t v9 = self->_currentHome;
      }
      [(HMHome *)v9 setDelegate:self];
      BOOL v14 = [(HMHome *)self->_currentHome owner];
      [v14 setDelegate:self];
      [(HMHome *)self->_currentHome setDelegate:self];
      uint64_t v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v16 = self->_currentHome;
        *(_DWORD *)long long buf = 136315651;
        id v35 = "-[ADHomeInfoManager _currentHome]";
        __int16 v36 = 2113;
        uint64_t v37 = v14;
        __int16 v38 = 2113;
        uint64_t v39 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Home owner %{private}@ home %{private}@", buf, 0x20u);
      }
      if (AFIsHorseman())
      {
        __int16 v17 = [v6 settings];
        [v17 setDelegate:self];
        if (self->_currentHome) {
          -[ADHomeInfoManager _siriDataSharingAdjustment:](self, "_siriDataSharingAdjustment:");
        }
      }
    }
    else
    {
      __int16 v18 = [v4 primaryHome];
      int v19 = self->_currentHome;
      self->_currentHome = v18;

      [(HMHome *)self->_currentHome setDelegate:self];
      id v6 = [v4 homes];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v20 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v30;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(v6);
            }
            CFStringRef v24 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            [v24 setDelegate:self];
            id v25 = [v24 currentUser];
            [v25 setDelegate:self];
            unsigned int v26 = [v25 userSettingsForHome:v24];
            __int16 v27 = [v26 settings];

            [v27 setDelegate:self];
          }
          id v21 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v21);
      }
      if (!self->_currentHome) {
        goto LABEL_27;
      }
      BOOL v14 = +[NSNotificationCenter defaultCenter];
      [v14 postNotificationName:@"ADHomeInfoCurrentHomeIsReady" object:0];
    }

LABEL_27:
LABEL_28:

    currentHome = self->_currentHome;
  }
  return currentHome;
}

- (void)currentHomeWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10020C338;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_updateHomeContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v71 = "-[ADHomeInfoManager _updateHomeContext:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  long long v47 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = v4;
  CFStringRef v7 = [v6 homes];
  id v8 = [v7 count];
  uint64_t v9 = +[NSMutableArray arrayWithCapacity:v8];
  long long v50 = +[NSMutableArray arrayWithCapacity:v8];
  id v48 = v6;
  id v10 = [v6 currentHome];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v62 objects:buf count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v63;
    uint64_t v14 = SAHAEntityTypeHOMEValue;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v63 != v13) {
          objc_enumerationMutation(obj);
        }
        int v16 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v17 = objc_alloc_init((Class)SAHAEntity);
        [v17 setEntityType:v14];
        __int16 v18 = [v16 name];
        [v17 setName:v18];

        int v19 = [v16 assistantIdentifier];
        id v20 = +[NSURL URLWithString:v19];
        [v17 setIdentifier:v20];

        [v9 addObject:v17];
        id v21 = [v16 uniqueIdentifier];
        uint64_t v22 = [v10 uniqueIdentifier];
        LODWORD(v20) = [v21 isEqual:v22];

        if (v20) {
          [v50 addObject:v17];
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v62 objects:buf count:16];
    }
    while (v12);
  }

  id v23 = objc_alloc_init((Class)SASetHomeContext);
  id v24 = [v9 copy];
  [v23 setEntities:v24];

  id v25 = [v50 copy];
  [v23 setCurrentHomes:v25];

  unsigned int v26 = +[ADPreferences sharedPreferences];
  objc_msgSend(v23, "setByPassServerFlow:", objc_msgSend(v26, "homeAutomationServerFlowBypassed"));

  __int16 v27 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v68 = 136315138;
    id v69 = "createHomeContext";
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Created homeContext", v68, 0xCu);
  }

  id v28 = v47;
  objc_storeStrong((id *)&v47->_homeContext, v23);
  homeManager = v47->_homeManager;
  if (homeManager)
  {
    id v46 = v23;
    [(HMHomeManager *)homeManager homes];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    id obja = [v49 countByEnumeratingWithState:&v58 objects:v67 count:16];
    unsigned __int8 v30 = 0;
    if (obja)
    {
      uint64_t v51 = *(void *)v59;
      uint64_t v31 = HMAccessoryCategoryTypeHomePod;
      uint64_t v32 = HMAccessoryCategoryTypeAppleTV;
      do
      {
        for (j = 0; j != obja; j = (char *)j + 1)
        {
          if (*(void *)v59 != v51) {
            objc_enumerationMutation(v49);
          }
          id v34 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v35 = [v34 accessories];
          id v36 = [v35 countByEnumeratingWithState:&v54 objects:v66 count:16];
          if (v36)
          {
            id v37 = v36;
            uint64_t v38 = *(void *)v55;
            do
            {
              for (k = 0; k != v37; k = (char *)k + 1)
              {
                if (*(void *)v55 != v38) {
                  objc_enumerationMutation(v35);
                }
                __int16 v40 = [*(id *)(*((void *)&v54 + 1) + 8 * (void)k) category];
                uint64_t v41 = [v40 categoryType];

                if (v30 & 1) != 0 || ([v41 isEqualToString:v31]) {
                  unsigned __int8 v30 = 1;
                }
                else {
                  unsigned __int8 v30 = [v41 isEqualToString:v32];
                }
              }
              id v37 = [v35 countByEnumeratingWithState:&v54 objects:v66 count:16];
            }
            while (v37);
          }
        }
        id obja = [v49 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (obja);
    }
    long long v42 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      long long v71 = "-[ADHomeInfoManager _updateHomeContext:]";
      __int16 v72 = 1024;
      int v73 = v30 & 1;
      _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%s hasATVOrHomePod=%d", buf, 0x12u);
    }
    uint64_t v43 = +[ADPreferences sharedPreferences];
    [v43 setHasATVOrHomePodInHome:v30 & 1];

    id v23 = v46;
    id v28 = v47;
  }
  if (v28->isATVOnly && [(ADHomeInfoManager *)v28 _updateHomeUserSettings])
  {
    id v44 = +[NSNotificationCenter defaultCenter];
    [v44 postNotificationName:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
  }
  uint64_t v45 = +[NSNotificationCenter defaultCenter];
  [v45 postNotificationName:@"ADHomeInfoHomeContextDidChangeNotification" object:v23];
}

- (void)dealloc
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    CFStringRef v7 = "-[ADHomeInfoManager dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ADHomeInfoManager;
  [(ADHomeInfoManager *)&v5 dealloc];
}

- (id)_homeManager
{
  homeManager = self->_homeManager;
  if (!homeManager)
  {
    id v4 = (HMHomeManager *)[objc_alloc((Class)HMHomeManager) initWithOptions:32888];
    objc_super v5 = self->_homeManager;
    self->_homeManager = v4;

    [(HMHomeManager *)self->_homeManager setDelegate:self];
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v7 = self->_homeManager;
      int v9 = 136315394;
      id v10 = "-[ADHomeInfoManager _homeManager]";
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s homeManager = %@", (uint8_t *)&v9, 0x16u);
    }
    homeManager = self->_homeManager;
  }
  return homeManager;
}

- (void)startAcceptingCloudSharesForMultiUserService
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020CC28;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)hasOptedInHH2
{
  v2 = [(ADHomeInfoManager *)self _homeManager];
  unsigned __int8 v3 = [v2 hasOptedToHH2];

  return v3;
}

- (ADHomeInfoManager)initWithHomeManager:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ADHomeInfoManager;
  int v9 = [(ADHomeInfoManager *)&v17 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_homeManager, a3);
    uint64_t v11 = +[AFInstanceContext defaultContext];
    instanceContext = v10->_instanceContext;
    v10->_instanceContext = (AFInstanceContext *)v11;

    uint64_t v13 = +[NSHashTable weakObjectsHashTable];
    listeners = v10->_listeners;
    v10->_listeners = (NSHashTable *)v13;

    uint64_t v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v10 selector:"_siriDataSharingOptInStatusDidChange:" name:@"ADPreferencesSiriDataSharingOptInStatusDidChangeNotification" object:0];
  }
  return v10;
}

- (void)updateCurrentUserRMVSettingForHome:(id)a3 enabled:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    int v19 = "-[ADHomeInfoManager updateCurrentUserRMVSettingForHome:enabled:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_10020CEC8;
  v14[3] = &unk_10050C840;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  BOOL v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(queue, v14);
}

- (void)updateRMVSettingForUser:(id)a3 enabled:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    int v19 = "-[ADHomeInfoManager updateRMVSettingForUser:enabled:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_10020D58C;
  v14[3] = &unk_10050C840;
  id v15 = v8;
  id v16 = v9;
  v14[4] = self;
  BOOL v17 = a4;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v14);
}

- (id)_initWithContext:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ADHomeInfoManager;
  objc_super v5 = [(ADHomeInfoManager *)&v19 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("ADHomeInfoManager", v6);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    id v9 = v5->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10020DCA8;
    block[3] = &unk_10050E160;
    BOOL v17 = v5;
    id v18 = v4;
    dispatch_async(v9, block);
    id v10 = v5->_queue;
    uint64_t v11 = +[ADQueueMonitor sharedMonitor];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_10020DEE0;
    v14[3] = &unk_10050C458;
    id v15 = v10;
    id v12 = v10;
    [v11 addQueue:v12 heartBeatInterval:v14 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return v5;
}

- (id)_init
{
  unsigned __int8 v3 = +[AFInstanceContext defaultContext];
  id v4 = [(ADHomeInfoManager *)self _initWithContext:v3];

  return v4;
}

+ (id)sharedInfoManager
{
  if (qword_100585EC0 != -1) {
    dispatch_once(&qword_100585EC0, &stru_100506B40);
  }
  v2 = (void *)qword_100585EB8;
  return v2;
}

@end