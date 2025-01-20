@interface ADBackgroundContextCache
+ (id)_backgroundContextWithObjects:(id)a3;
- (NSDictionary)allMusicPersonalizationTokenStatuses;
- (NSDictionary)allMusicPersonalizationTokens;
- (NSString)musicPersonalizationToken;
- (NSString)preferredMediaUserHomeUserID;
- (NSString)preferredMediaUserSharedUserID;
- (SAErrorIndicatorStatus)errorIndicatorStatus;
- (SAHACurrentHome)currentHome;
- (SAHomeCommunicationAnnouncement)homeAnnouncement;
- (SALocalSearchGetNavigationStatusCompleted)localSearchGetNavigationStatusCompleted;
- (SAMPQueueState)queueState;
- (SANavStatus)navStatus;
- (SAPhoneCallState)phoneCallState;
- (SARemotePlaybackDeviceList)playbackDeviceList;
- (SAUserTokenStatus)musicPersonalizationTokenStatus;
- (id)backgroundContextWithCachedObjects;
- (void)_setDefaultToken:(id)a3 inDynamiteClientState:(id)a4;
- (void)_updateDefaultTokenInDynamiteClientState:(id)a3;
- (void)setAllMusicPersonalizationTokenStatuses:(id)a3;
- (void)setAllMusicPersonalizationTokens:(id)a3;
- (void)setCurrentHome:(id)a3;
- (void)setErrorIndicatorStatus:(id)a3;
- (void)setHomeAnnouncement:(id)a3;
- (void)setLocalSearchGetNavigationStatusCompleted:(id)a3;
- (void)setMusicPersonalizationToken:(id)a3;
- (void)setMusicPersonalizationTokenStatus:(id)a3;
- (void)setNavStatus:(id)a3;
- (void)setPhoneCallState:(id)a3;
- (void)setPlaybackDeviceList:(id)a3;
- (void)setPreferredMediaUserHomeUserID:(id)a3;
- (void)setPreferredMediaUserSharedUserID:(id)a3;
- (void)setQueueState:(id)a3;
@end

@implementation ADBackgroundContextCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAnnouncement, 0);
  objc_storeStrong((id *)&self->_playbackDeviceList, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserHomeUserID, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserSharedUserID, 0);
  objc_storeStrong((id *)&self->_allMusicPersonalizationTokenStatuses, 0);
  objc_storeStrong((id *)&self->_allMusicPersonalizationTokens, 0);
  objc_storeStrong((id *)&self->_musicPersonalizationTokenStatus, 0);
  objc_storeStrong((id *)&self->_musicPersonalizationToken, 0);
  objc_storeStrong((id *)&self->_phoneCallState, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_errorIndicatorStatus, 0);
  objc_storeStrong((id *)&self->_queueState, 0);
  objc_storeStrong((id *)&self->_localSearchGetNavigationStatusCompleted, 0);
  objc_storeStrong((id *)&self->_navStatus, 0);
}

- (void)setHomeAnnouncement:(id)a3
{
}

- (SAHomeCommunicationAnnouncement)homeAnnouncement
{
  return self->_homeAnnouncement;
}

- (void)setPlaybackDeviceList:(id)a3
{
}

- (SARemotePlaybackDeviceList)playbackDeviceList
{
  return self->_playbackDeviceList;
}

- (void)setPreferredMediaUserHomeUserID:(id)a3
{
}

- (NSString)preferredMediaUserHomeUserID
{
  return self->_preferredMediaUserHomeUserID;
}

- (void)setPreferredMediaUserSharedUserID:(id)a3
{
}

- (NSString)preferredMediaUserSharedUserID
{
  return self->_preferredMediaUserSharedUserID;
}

- (void)setAllMusicPersonalizationTokenStatuses:(id)a3
{
}

- (NSDictionary)allMusicPersonalizationTokenStatuses
{
  return self->_allMusicPersonalizationTokenStatuses;
}

- (void)setAllMusicPersonalizationTokens:(id)a3
{
}

- (NSDictionary)allMusicPersonalizationTokens
{
  return self->_allMusicPersonalizationTokens;
}

- (void)setMusicPersonalizationTokenStatus:(id)a3
{
}

- (SAUserTokenStatus)musicPersonalizationTokenStatus
{
  return self->_musicPersonalizationTokenStatus;
}

- (void)setMusicPersonalizationToken:(id)a3
{
}

- (NSString)musicPersonalizationToken
{
  return self->_musicPersonalizationToken;
}

- (void)setPhoneCallState:(id)a3
{
}

- (SAPhoneCallState)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setCurrentHome:(id)a3
{
}

- (SAHACurrentHome)currentHome
{
  return self->_currentHome;
}

- (void)setErrorIndicatorStatus:(id)a3
{
}

- (SAErrorIndicatorStatus)errorIndicatorStatus
{
  return self->_errorIndicatorStatus;
}

- (void)setQueueState:(id)a3
{
}

- (SAMPQueueState)queueState
{
  return self->_queueState;
}

- (void)setLocalSearchGetNavigationStatusCompleted:(id)a3
{
}

- (SALocalSearchGetNavigationStatusCompleted)localSearchGetNavigationStatusCompleted
{
  return self->_localSearchGetNavigationStatusCompleted;
}

- (void)setNavStatus:(id)a3
{
}

- (SANavStatus)navStatus
{
  return self->_navStatus;
}

- (id)backgroundContextWithCachedObjects
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = v3;
  if (self->_navStatus) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_localSearchGetNavigationStatusCompleted) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_queueState) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_errorIndicatorStatus) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_currentHome) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_phoneCallState) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_playbackDeviceList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_homeAnnouncement) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_musicPersonalizationToken
    || self->_musicPersonalizationTokenStatus
    || [(NSDictionary *)self->_allMusicPersonalizationTokens count]
    || [(NSDictionary *)self->_allMusicPersonalizationTokenStatuses count])
  {
    id v5 = objc_alloc_init((Class)SADynamiteClientState);
    [(ADBackgroundContextCache *)self _updateDefaultTokenInDynamiteClientState:v5];
    v6 = +[NSMutableDictionary dictionary];
    v7 = +[NSMutableSet set];
    if ([(NSDictionary *)self->_allMusicPersonalizationTokens count])
    {
      allMusicPersonalizationTokens = self->_allMusicPersonalizationTokens;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100227764;
      v27[3] = &unk_1005075E0;
      id v28 = v7;
      id v29 = v6;
      [(NSDictionary *)allMusicPersonalizationTokens enumerateKeysAndObjectsUsingBlock:v27];
    }
    if ([(NSDictionary *)self->_allMusicPersonalizationTokenStatuses count])
    {
      allMusicPersonalizationTokenStatuses = self->_allMusicPersonalizationTokenStatuses;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100227808;
      v24[3] = &unk_100507608;
      id v25 = v6;
      id v26 = v7;
      [(NSDictionary *)allMusicPersonalizationTokenStatuses enumerateKeysAndObjectsUsingBlock:v24];
    }
    v10 = +[ADMultiUserService sharedService];
    v11 = [v10 getSyncableSharedUserIdsForSharedUserIds:v7];

    if ([v6 count])
    {
      v12 = +[ADMultiUserService sharedService];
      id v13 = [v12 countVoiceProfiles];

      if (v13)
      {
        id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
        v18 = _NSConcreteStackBlock;
        uint64_t v19 = 3221225472;
        v20 = sub_1002278D4;
        v21 = &unk_100507630;
        id v22 = v11;
        id v23 = v14;
        id v15 = v14;
        [v6 enumerateKeysAndObjectsUsingBlock:&v18];
        objc_msgSend(v5, "setInContextUsersStates:", v15, v18, v19, v20, v21);
      }
    }
    [v4 addObject:v5];
  }
  v16 = +[ADBackgroundContextCache _backgroundContextWithObjects:v4];

  return v16;
}

- (void)_updateDefaultTokenInDynamiteClientState:(id)a3
{
  id v4 = a3;
  musicPersonalizationToken = self->_musicPersonalizationToken;
  if (*(_OWORD *)&self->_musicPersonalizationToken != 0)
  {
    v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      v8 = "-[ADBackgroundContextCache _updateDefaultTokenInDynamiteClientState:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Using default musicPersonalizationToken since we didn't find one for preferredMediaUserSharedUserID or it wasn't set", (uint8_t *)&v7, 0xCu);
      musicPersonalizationToken = self->_musicPersonalizationToken;
    }
    [(ADBackgroundContextCache *)self _setDefaultToken:musicPersonalizationToken inDynamiteClientState:v4];
  }
}

- (void)_setDefaultToken:(id)a3 inDynamiteClientState:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  [v8 setUserToken:v6];
  id v7 = objc_alloc_init((Class)SAUserState);
  [v7 setUserToken:v6];

  if (self->_musicPersonalizationTokenStatus)
  {
    objc_msgSend(v8, "setUserTokenStatus:");
    [v7 setUserTokenStatus:self->_musicPersonalizationTokenStatus];
  }
  [v8 setDefaultUserState:v7];
}

+ (id)_backgroundContextWithObjects:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SASetBackgroundContext);
  if ([v3 count]) {
    [v4 setObjects:v3];
  }

  return v4;
}

@end