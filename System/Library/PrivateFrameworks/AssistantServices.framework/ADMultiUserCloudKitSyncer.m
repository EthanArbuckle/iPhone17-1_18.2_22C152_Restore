@interface ADMultiUserCloudKitSyncer
+ (id)sharedService;
- (id)_addHomeMembershipsToDictionary:(id)a3;
- (id)_cachedAssistantData;
- (id)_generateVersion1HomeMembershipRecordKeyFromHomeID:(id)a3 homeUserID:(id)a4;
- (id)_generateVersion2HomeMembershipRecordKeyFromHomeID:(id)a3;
- (id)_homeMembershipsToDelete;
- (id)_init;
- (id)_setHomeMembershipsDeletion:(id)a3;
- (id)getAudioAppSignalsPayload;
- (id)setPersonalData:(id)a3;
- (void)_deleteHomeMemberShipsFromCloud:(unint64_t)a3;
- (void)_gatherIdentifiersForMultiUser;
- (void)_saveBackupIdentifiersAnchor:(id)a3;
- (void)_saveCachedAssistantDataAnchor:(id)a3;
- (void)_saveIdentifiersAnchor:(id)a3;
- (void)_syncIdentifiersToCloud:(unint64_t)a3 forceUpdate:(BOOL)a4;
- (void)_syncIdentifiersToCloud:(unint64_t)a3 forceUpdate:(BOOL)a4 voiceIDChangedToEnabled:(BOOL)a5;
- (void)_syncMeCard:(unint64_t)a3 anchorToSave:(id)a4;
- (void)accountDidChange:(id)a3;
- (void)assistantDataManager:(id)a3 didUpdateAssistantData:(id)a4 meCards:(id)a5 unredactedAnchor:(id)a6;
- (void)dealloc;
- (void)enabledBitsChanged:(id)a3;
- (void)markHomeMembershipsForDeletion:(id)a3;
- (void)meDeviceChanged:(id)a3;
- (void)primaryUserSharedUserIdentifierDidChangeNotification:(id)a3;
- (void)setHomeMemberships:(id)a3 homeMembershipsToDelete:(id)a4 voiceIDSetting:(BOOL)a5;
- (void)syncAudioAppSignalsPayload:(id)a3;
- (void)syncIdentifiersToCloud;
- (void)syncSyncMetadataToCloud:(id)a3;
@end

@implementation ADMultiUserCloudKitSyncer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMeCards, 0);
  objc_storeStrong((id *)&self->_cachedBackupIdentifiersAnchor, 0);
  objc_storeStrong((id *)&self->_cachedIdentifiersAnchor, 0);
  objc_storeStrong((id *)&self->_cachedAssistantDataAnchor, 0);
  objc_storeStrong((id *)&self->_cachedAssistantData, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_iCloudAltDSID, 0);
  objc_storeStrong((id *)&self->_sharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_homeMembershipsToDelete, 0);
  objc_storeStrong((id *)&self->_homeMemberships, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_syncIdentifiersToCloud:(unint64_t)a3 forceUpdate:(BOOL)a4 voiceIDChangedToEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (a3)
  {
    v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s retryCount = %ld", buf, 0x16u);
    }
    if (a3 >= 0x10)
    {
      v10 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
        v11 = "%s Underlying CloudKit infra not ready. Bailing.";
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
        return;
      }
      return;
    }
  }
  v12 = +[ADPreferences sharedPreferences];
  if ([v12 multiUserIsOnboardingDevice])
  {

    goto LABEL_12;
  }
  BOOL v13 = !self->_meIsMeDevice;

  if (!v13)
  {
LABEL_12:
    uint64_t v122 = 0;
    v123 = &v122;
    uint64_t v124 = 0x2020000000;
    BOOL meIsMeDevice = self->_meIsMeDevice;
    v106 = +[ACAccountStore defaultStore];
    v14 = +[ADAccount activeAccount];
    v15 = [v14 assistantIdentifier];
    assistantIdentifier = self->_assistantIdentifier;
    self->_assistantIdentifier = v15;

    v17 = +[ADAccount activeAccount];
    v108 = [v17 loggingAssistantIdentifier];

    v18 = +[ADAccount activeAccount];
    v105 = [v18 speechIdentifier];

    v19 = +[ADPreferences sharedPreferences];
    v111 = [v19 sharedUserIdentifier];
    v110 = v19;
    v109 = [v19 loggingSharedUserIdentifier];
    v20 = objc_msgSend(v106, "aa_primaryAppleAccount");
    objc_msgSend(v20, "aa_altDSID");
    v104 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v21 = [v110 productTypePrefix];
    SiriCoreUserAgentStringCreate();
    v103 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v22 = +[ADAccount activeAccount];
    v107 = [v22 aceHost];

    v101 = [(ADMultiUserCloudKitSyncer *)self getAudioAppSignalsPayload];
    v102 = [v110 syncMetadata];
    v23 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    if (!v111 || !v109)
    {
      v35 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s Shared UserID unavailable", buf, 0xCu);
      }
      goto LABEL_108;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v141 = sub_10026A60C;
    v142 = sub_10026A61C;
    CFStringRef v24 = (const __CFString *)self->_assistantIdentifier;
    CFStringRef v25 = &stru_10050F7D8;
    if (!v24) {
      CFStringRef v24 = &stru_10050F7D8;
    }
    CFStringRef v26 = v108;
    if (!v108) {
      CFStringRef v26 = &stru_10050F7D8;
    }
    v139[0] = v24;
    v139[1] = v26;
    if (v105) {
      CFStringRef v27 = v105;
    }
    else {
      CFStringRef v27 = &stru_10050F7D8;
    }
    v139[2] = v27;
    v139[3] = v111;
    CFStringRef v28 = v103;
    if (!v103) {
      CFStringRef v28 = &stru_10050F7D8;
    }
    v139[4] = v109;
    v139[5] = v28;
    CFStringRef v29 = v107;
    if (!v107) {
      CFStringRef v29 = &stru_10050F7D8;
    }
    if (v104) {
      CFStringRef v25 = v104;
    }
    v139[6] = v29;
    v139[7] = v25;
    v30 = v102;
    if (!v102) {
      v30 = &__NSDictionary0__struct;
    }
    v139[8] = v30;
    v31 = +[NSArray arrayWithObjects:v139 count:9];
    sub_1001FD1D8(v31);
    id v143 = (id)objc_claimAutoreleasedReturnValue();

    v32 = v123;
    uint64_t v33 = 88;
    if (!*((unsigned char *)v123 + 24)) {
      uint64_t v33 = 96;
    }
    id v100 = *(id *)((char *)&self->super.isa + v33);
    if (*((unsigned char *)v32 + 24))
    {
      v34 = +[ADPreferences sharedPreferences];
      [v34 multiUserSyncerIdentifiersAnchor];
    }
    else
    {
      v34 = +[ADPreferences sharedPreferences];
      [v34 multiUserSyncerBackupIdentifiersAnchor];
    v99 = };

    v36 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      uint64_t v37 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)v131 = 136315906;
      v132 = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
      __int16 v133 = 2112;
      v134 = v99;
      __int16 v135 = 2112;
      id v136 = v100;
      __int16 v137 = 2112;
      uint64_t v138 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s saved anchor:%@\tcached anchor:%@\tnew anchor:%@", v131, 0x2Au);
    }
    if (!a4)
    {
      int meWasMeDevice = self->_meWasMeDevice;
      uint64_t v39 = *(void *)(*(void *)&buf[8] + 40);
      if (v100)
      {
        if ([v100 isEqualToString:v39]
          && *((unsigned __int8 *)v123 + 24) == meWasMeDevice)
        {
          v40 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v131 = 136315138;
            v132 = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s Identifiers anchor unchanged from last sync. Bailing.", v131, 0xCu);
          }
          goto LABEL_107;
        }
      }
      else if ([v99 isEqualToString:v39] {
             && *((unsigned __int8 *)v123 + 24) == meWasMeDevice)
      }
      {
        v41 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v131 = 136315138;
          v132 = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s Identifiers anchor unchanged from last sync. Bailing.", v131, 0xCu);
          int meWasMeDevice = *((unsigned __int8 *)v123 + 24);
        }
        v42 = (NSString *)*(id *)(*(void *)&buf[8] + 40);
        if (meWasMeDevice)
        {
          cachedIdentifiersAnchor = self->_cachedIdentifiersAnchor;
          self->_cachedIdentifiersAnchor = v42;
        }
        else
        {
          cachedIdentifiersAnchor = self->_cachedBackupIdentifiersAnchor;
          self->_cachedBackupIdentifiersAnchor = v42;
        }

        goto LABEL_107;
      }
    }
    v44 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v131 = 136315138;
      v132 = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s ", v131, 0xCu);
    }
    id v45 = objc_alloc_init((Class)NSMutableDictionary);
    int v46 = *((unsigned __int8 *)v123 + 24);
    v47 = AFSiriLogContextDaemon;
    BOOL v48 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v46)
    {
      if (v48)
      {
        *(_DWORD *)v131 = 136315138;
        v132 = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s Device is MeDevice. Syncing Identifiers", v131, 0xCu);
      }
      idsIdentifier = self->_idsIdentifier;
      if (!idsIdentifier)
      {
        v89 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v131 = 136315138;
          v132 = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "%s IDS Identifier unavailable", v131, 0xCu);
        }
        goto LABEL_106;
      }
      [v45 setObject:idsIdentifier forKey:@"meDeviceIDSIdentifier"];
      if (v103) {
        [v45 setObject:v103 forKey:@"meProductPrefix"];
      }
      v50 = @"meDeviceAssistantID";
      v51 = @"meDeviceLoggingAssistantID";
      v52 = @"meDeviceSpeechID";
      v53 = @"meDeviceSharedUserID";
      v54 = @"meDeviceLoggingSharedUserID";
      v55 = @"meDeviceiCloudAltDSID";
      v56 = @"meDeviceACEHost";
      v57 = @"meDeviceVoiceIDChangedToEnabledTimestamp";
      if (v101
        && +[AFFeatureFlags isAudioAppPredictionOnHomePodEnabled])
      {
        [v45 setObject:v101 forKey:@"meDeviceAudioAppSignals"];
      }
      if (v102) {
        [v45 setObject:v102 forKey:@"meDeviceSyncMetadata"];
      }
      if (v104) {
        [v45 setObject:v104 forKey:@"meDeviceiCloudAltDSID"];
      }
      v129[0] = @"meDeviceAssistantID";
      v58 = self->_assistantIdentifier;
      v59 = v58;
      if (!v58)
      {
        v59 = +[NSNull null];
      }
      v130[0] = v59;
      v130[1] = &off_100523A68;
      v129[1] = @"meDeviceSyncMetadataCapability";
      v129[2] = @"meDevicePeerToPeerHandoffCapability";
      v130[2] = &off_100523A68;
      v60 = +[NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:3];
      if (!v58) {

      }
      [v45 setObject:v60 forKey:@"meDeviceCapabilities"];
      CFStringRef v90 = @"meDeviceiCloudAltDSID";
      v92 = @"meDeviceVoiceIDChangedToEnabledTimestamp";
      v94 = @"meDeviceACEHost";
      v95 = @"meDeviceLoggingSharedUserID";
      v96 = @"meDeviceSharedUserID";
      v97 = @"meDeviceSpeechID";
      v93 = @"meDeviceLoggingAssistantID";
      v98 = @"meDeviceAssistantID";
    }
    else
    {
      if (v48)
      {
        *(_DWORD *)v131 = 136315138;
        v132 = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s Device is NOT MeDevice. Syncing Backup Identifiers", v131, 0xCu);
      }
      v98 = @"backupAssistantID";
      v61 = @"backupAssistantID";
      v93 = @"backupLoggingAssistantID";
      v62 = @"backupLoggingAssistantID";
      v97 = @"backupSpeechID";
      v63 = @"backupSpeechID";
      v96 = @"backupSharedUserID";
      v64 = @"backupSharedUserID";
      v95 = @"backupLoggingSharedUserID";
      v65 = @"backupLoggingSharedUserID";
      v94 = @"backupDeviceACEHost";
      v66 = @"backupDeviceACEHost";
      CFStringRef v90 = 0;
      v92 = 0;
    }
    v67 = self->_assistantIdentifier;
    v68 = v67;
    if (!v67)
    {
      v68 = +[NSNull null];
    }
    objc_msgSend(v45, "setObject:forKey:", v68, v98, v90);
    if (!v67) {

    }
    if (v108) {
      [v45 setObject:v108 forKey:v93];
    }
    if (v105)
    {
      [v45 setObject:v105 forKey:v97];
    }
    else
    {
      v69 = +[NSNull null];
      [v45 setObject:v69 forKey:v97];
    }
    [v45 setObject:v111 forKey:v96];
    [v45 setObject:v109 forKey:v95];
    if (v107) {
      [v45 setObject:v107 forKey:v94];
    }
    if (v46 && v5)
    {
      v70 = +[NSDate date];
      [v70 timeIntervalSince1970];
      double v72 = v71;

      v127 = v111;
      v73 = +[NSNumber numberWithDouble:v72];
      v128 = v73;
      v74 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];

      [v45 setObject:v74 forKey:v92];
    }
    if (*((unsigned char *)v123 + 24)) {
      CFStringRef v75 = @"1";
    }
    else {
      CFStringRef v75 = @"0";
    }
    [v45 setObject:v75 forKey:@"meDevice"];
    v76 = [(ADMultiUserCloudKitSyncer *)self _addHomeMembershipsToDictionary:v45];

    id v77 = [(ADMultiUserCloudKitSyncer *)self setPersonalData:v76];
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id v78 = v76;
    id v79 = [v78 countByEnumeratingWithState:&v118 objects:v126 count:16];
    if (v79)
    {
      uint64_t v80 = *(void *)v119;
      do
      {
        for (i = 0; i != v79; i = (char *)i + 1)
        {
          if (*(void *)v119 != v80) {
            objc_enumerationMutation(v78);
          }
          v82 = *(void **)(*((void *)&v118 + 1) + 8 * i);
          v83 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
          {
            v84 = [v78 valueForKey:v82];
            *(_DWORD *)v131 = 136315651;
            v132 = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
            __int16 v133 = 2112;
            v134 = v82;
            __int16 v135 = 2113;
            id v136 = v84;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "%s identifier key (%@), value (%{private}@)", v131, 0x20u);
          }
        }
        id v79 = [v78 countByEnumeratingWithState:&v118 objects:v126 count:16];
      }
      while (v79);
    }

    id v85 = objc_alloc_init((Class)NSMutableArray);
    id v86 = [(ADMultiUserCloudKitSyncer *)self _setHomeMembershipsDeletion:v85];
    v87 = +[ADCloudKitManager sharedManager];
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_10026A624;
    v113[3] = &unk_100508498;
    v113[4] = self;
    id v45 = v78;
    id v114 = v45;
    v116 = &v122;
    v117 = buf;
    id v88 = v85;
    id v115 = v88;
    [v87 addDictionaryToSharedStore:v45 recordKeysForDeletion:v88 completion:v113];

LABEL_106:
LABEL_107:

    _Block_object_dispose(buf, 8);
LABEL_108:

    _Block_object_dispose(&v122, 8);
    return;
  }
  v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[ADMultiUserCloudKitSyncer _syncIdentifiersToCloud:forceUpdate:voiceIDChangedToEnabled:]";
    v11 = "%s Not the onboarding device and not the meDevice. Bailing.";
    goto LABEL_39;
  }
}

- (void)_syncIdentifiersToCloud:(unint64_t)a3 forceUpdate:(BOOL)a4
{
}

- (id)_setHomeMembershipsDeletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ADMultiUserCloudKitSyncer *)self _homeMembershipsToDelete];
  id v6 = [v5 count];

  v7 = AFSiriLogContextDaemon;
  BOOL v8 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v9 = v7;
      v10 = [(ADMultiUserCloudKitSyncer *)self _homeMembershipsToDelete];
      *(_DWORD *)buf = 136315395;
      CFStringRef v28 = "-[ADMultiUserCloudKitSyncer _setHomeMembershipsDeletion:]";
      __int16 v29 = 2113;
      v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Home memberships marked for deletion (%{private}@)", buf, 0x16u);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v11 = [(ADMultiUserCloudKitSyncer *)self _homeMembershipsToDelete];
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v17 = [(ADMultiUserCloudKitSyncer *)self _homeMembershipsToDelete];
          v18 = [v17 objectForKey:v16];

          v19 = [(ADMultiUserCloudKitSyncer *)self _generateVersion1HomeMembershipRecordKeyFromHomeID:v16 homeUserID:v18];
          [v4 addObject:v19];
          v20 = [(ADMultiUserCloudKitSyncer *)self _generateVersion2HomeMembershipRecordKeyFromHomeID:v16];
          [v4 addObject:v20];
        }
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
  }
  else if (v8)
  {
    *(_DWORD *)buf = 136315138;
    CFStringRef v28 = "-[ADMultiUserCloudKitSyncer _setHomeMembershipsDeletion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s No home memberships to delete", buf, 0xCu);
  }
  return v4;
}

- (void)_deleteHomeMemberShipsFromCloud:(unint64_t)a3
{
  if (a3 < 0x10)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = [(ADMultiUserCloudKitSyncer *)self _setHomeMembershipsDeletion:v6];
    BOOL v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315651;
      uint64_t v16 = "-[ADMultiUserCloudKitSyncer _deleteHomeMemberShipsFromCloud:]";
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      __int16 v19 = 2113;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Retry count (%ld) for home membership records set for deletion (%{private}@)", buf, 0x20u);
    }
    if ([v6 count])
    {
      unint64_t v9 = a3 + 1;
      v10 = +[ADCloudKitManager sharedManager];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10026B048;
      v12[3] = &unk_100508448;
      unint64_t v14 = v9;
      v12[4] = self;
      id v13 = v6;
      [v10 deleteRecordFromSharedStore:v13 completion:v12];
    }
    else
    {
      v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v16 = "-[ADMultiUserCloudKitSyncer _deleteHomeMemberShipsFromCloud:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s No home memberships to delete", buf, 0xCu);
      }
    }
  }
  else
  {
    v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[ADMultiUserCloudKitSyncer _deleteHomeMemberShipsFromCloud:]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Failed to delete home memberships", buf, 0xCu);
    }
  }
}

- (id)_addHomeMembershipsToDictionary:(id)a3
{
  id v4 = a3;
  id v21 = objc_alloc_init((Class)NSMutableDictionary);
  [v21 addEntriesFromDictionary:v4];
  if ([(NSDictionary *)self->_homeMemberships count])
  {
    id v20 = v4;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obj = self->_homeMemberships;
    id v5 = [(NSDictionary *)obj countByEnumeratingWithState:&v24 objects:v38 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v25;
      do
      {
        BOOL v8 = 0;
        id v22 = v6;
        do
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v8);
          v10 = [(NSMutableDictionary *)self->_homeMembershipsToDelete objectForKey:v9];
          if (v10)
          {
            v11 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315651;
              __int16 v29 = "-[ADMultiUserCloudKitSyncer _addHomeMembershipsToDictionary:]";
              __int16 v30 = 2113;
              uint64_t v31 = v9;
              __int16 v32 = 2113;
              uint64_t v33 = v10;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Not adding membership to sync (%{private}@)/(%{private}@) because it's marked for deletion", buf, 0x20u);
            }
          }
          else
          {
            uint64_t v12 = v7;
            id v13 = [(NSDictionary *)self->_homeMemberships objectForKey:v9];
            unint64_t v14 = +[NSDictionary dictionaryWithObject:v13 forKey:v9];
            v15 = [(ADMultiUserCloudKitSyncer *)self _generateVersion1HomeMembershipRecordKeyFromHomeID:v9 homeUserID:v13];
            [v21 setObject:v14 forKey:v15];
            uint64_t v16 = [(ADMultiUserCloudKitSyncer *)self _generateVersion2HomeMembershipRecordKeyFromHomeID:v9];
            [v21 setObject:v14 forKey:v16];
            __int16 v17 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136316163;
              __int16 v29 = "-[ADMultiUserCloudKitSyncer _addHomeMembershipsToDictionary:]";
              __int16 v30 = 2113;
              uint64_t v31 = v9;
              __int16 v32 = 2113;
              uint64_t v33 = v13;
              __int16 v34 = 2112;
              v35 = v15;
              __int16 v36 = 2112;
              uint64_t v37 = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Adding membership to sync (%{private}@)/(%{private}@) with V1 Key %@, V2 Key %@", buf, 0x34u);
            }

            uint64_t v7 = v12;
            id v6 = v22;
          }

          BOOL v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSDictionary *)obj countByEnumeratingWithState:&v24 objects:v38 count:16];
      }
      while (v6);
    }

    id v4 = v20;
  }
  else
  {
    unint64_t v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v29 = "-[ADMultiUserCloudKitSyncer _addHomeMembershipsToDictionary:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s No Home memberships?", buf, 0xCu);
    }
  }

  return v21;
}

- (id)_generateVersion2HomeMembershipRecordKeyFromHomeID:(id)a3
{
  id v3 = a3;
  id v4 = [@"*^&9&J#AzPm" dataUsingEncoding:4];
  id v5 = [v3 dataUsingEncoding:4];

  id v6 = AFSecurityDigestData();
  id v7 = 0;
  if (v7)
  {
    BOOL v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[ADMultiUserCloudKitSyncer _generateVersion2HomeMembershipRecordKeyFromHomeID:]";
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Failed to generate home membership record key due to error: %@", buf, 0x16u);
    }
    uint64_t v9 = 0;
  }
  else
  {
    v10 = +[NSString hexStringFromData:v6];
    uint64_t v9 = +[NSString stringWithFormat:@"%@%@%@", @"v2_sharedDeviceHomeUserUUIDPrefix", @"+", v10];
  }
  return v9;
}

- (id)_generateVersion1HomeMembershipRecordKeyFromHomeID:(id)a3 homeUserID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [@"*^&9&J#AzPm" dataUsingEncoding:4];
  BOOL v8 = +[NSString stringWithFormat:@"%@%@%@", v6, @"+", v5];

  uint64_t v9 = [v8 dataUsingEncoding:4];

  v10 = AFSecurityDigestData();
  id v11 = 0;
  if (v11)
  {
    uint64_t v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v17 = "-[ADMultiUserCloudKitSyncer _generateVersion1HomeMembershipRecordKeyFromHomeID:homeUserID:]";
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Failed to generate home membership record key due to error: %@", buf, 0x16u);
    }
    id v13 = 0;
  }
  else
  {
    __int16 v14 = +[NSString hexStringFromData:v10];
    id v13 = +[NSString stringWithFormat:@"%@%@%@", @"sharedDeviceHomeUserUUIDPrefix", @"+", v14];
  }
  return v13;
}

- (void)_saveBackupIdentifiersAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_cachedBackupIdentifiersAnchor, a3);
  id v4 = a3;
  id v5 = +[ADPreferences sharedPreferences];
  [v5 setMultiUserSyncerBackupIdentifiersAnchor:v4];
}

- (void)_saveIdentifiersAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_cachedIdentifiersAnchor, a3);
  id v4 = a3;
  id v5 = +[ADPreferences sharedPreferences];
  [v5 setMultiUserSyncerIdentifiersAnchor:v4];
}

- (void)_saveCachedAssistantDataAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAssistantDataAnchor, a3);
  id v4 = a3;
  id v5 = +[ADPreferences sharedPreferences];
  [v5 setMultiUserSyncerSADAnchor:v4];
}

- (id)setPersonalData:(id)a3
{
  id v4 = a3;
  cachedAssistantData = self->_cachedAssistantData;
  if (cachedAssistantData)
  {
    cachedAssistantDataAnchor = self->_cachedAssistantDataAnchor;
    if (cachedAssistantDataAnchor)
    {
      id v7 = [(SASetAssistantData *)cachedAssistantData anchor];
      unsigned __int8 v8 = [(NSString *)cachedAssistantDataAnchor isEqualToString:v7];

      if (v8)
      {
        id v9 = 0;
        goto LABEL_45;
      }
    }
    if (self->_meIsMeDevice)
    {
      v10 = [(SASetAssistantData *)self->_cachedAssistantData countryCode];
      if (v10) {
        [v4 setObject:v10 forKey:@"meCountryCode"];
      }
      uint64_t v11 = [(SASetAssistantData *)self->_cachedAssistantData parentalRestrictions];
      if (v11) {
        [v4 setObject:v11 forKey:@"meParentalRestrictions"];
      }
      uint64_t v12 = [(SASetAssistantData *)self->_cachedAssistantData preferredLanguage];
      if (v12) {
        [v4 setObject:v12 forKey:@"mePreferredLanguage"];
      }
      id v13 = [(SASetAssistantData *)self->_cachedAssistantData region];
      if (v13) {
        [v4 setObject:v13 forKey:@"meRegion"];
      }
      v38 = (void *)v11;
      __int16 v14 = [(SASetAssistantData *)self->_cachedAssistantData temperatureUnit];
      if (v14) {
        [v4 setObject:v14 forKey:@"meTemperatureUnit"];
      }
      id v15 = [(SASetAssistantData *)self->_cachedAssistantData ttsVoice];
      uint64_t v16 = v15;
      if (v15)
      {
        uint64_t v37 = v10;
        __int16 v17 = [v15 dictionary];
        id v40 = 0;
        __int16 v18 = +[NSPropertyListSerialization dataWithPropertyList:v17 format:200 options:0 error:&v40];
        id v19 = v40;

        if (v19 || !v18)
        {
          id v22 = AFSiriLogContextDaemonAce;
          if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v42 = "-[ADMultiUserCloudKitSyncer setPersonalData:]";
            __int16 v43 = 2112;
            id v44 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Unable to serialize TTSVoice object with error (%@)", buf, 0x16u);
          }
        }
        else
        {
          [v4 setObject:v18 forKey:@"meTTSVoice"];
        }

        v10 = v37;
      }
      long long v23 = [(SASetAssistantData *)self->_cachedAssistantData twentyFourHourTimeDisplay];
      if (v23)
      {
        [v4 setObject:v23 forKey:@"twentyFourHourTimeDisplay"];
      }
      else
      {
        long long v24 = AFSiriLogContextDaemonAce;
        if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v42 = "-[ADMultiUserCloudKitSyncer setPersonalData:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%s twentyFourHourDisplay is nil, syncing -1 to communal devices to represent nil", buf, 0xCu);
        }
        long long v25 = +[NSNumber numberWithInteger:-1];
        [v4 setObject:v25 forKey:@"twentyFourHourTimeDisplay"];
      }
      long long v26 = @"meCard";
      long long v27 = +[ADPreferences sharedPreferences];
      CFStringRef v28 = [v27 languageCode];

      if (v28)
      {
        [v4 setObject:v28 forKey:@"siriLanguage"];
      }
      else
      {
        __int16 v29 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v42 = "-[ADMultiUserCloudKitSyncer setPersonalData:]";
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s siriLanguage is nil. Skip adding to cloud.", buf, 0xCu);
        }
      }

      id v20 = @"meCard";
    }
    else
    {
      id v20 = @"backupMeCard";
      id v21 = @"backupMeCard";
    }
    if ([(NSArray *)self->_cachedMeCards count])
    {
      __int16 v30 = [(NSArray *)self->_cachedMeCards objectAtIndex:0];
      uint64_t v31 = v30;
      if (v30)
      {
        __int16 v32 = [v30 dictionary];
        id v39 = 0;
        uint64_t v33 = +[NSPropertyListSerialization dataWithPropertyList:v32 format:200 options:0 error:&v39];
        id v34 = v39;

        if (v34 || !v33)
        {
          v35 = AFSiriLogContextDaemonAce;
          if (os_log_type_enabled(AFSiriLogContextDaemonAce, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v42 = "-[ADMultiUserCloudKitSyncer setPersonalData:]";
            __int16 v43 = 2112;
            id v44 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s Unable to serialize meCard with error (%@)", buf, 0x16u);
          }
        }
        else
        {
          [v4 setObject:v33 forKey:v20];
        }
      }
    }
  }
  id v9 = v4;
LABEL_45:

  return v9;
}

- (void)assistantDataManager:(id)a3 didUpdateAssistantData:(id)a4 meCards:(id)a5 unredactedAnchor:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = [a4 copy];
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10026C374;
  v16[3] = &unk_10050DC68;
  v16[4] = self;
  id v17 = v11;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(queue, v16);
}

- (void)_syncMeCard:(unint64_t)a3 anchorToSave:(id)a4
{
  id v6 = a4;
  id v7 = +[ADPreferences sharedPreferences];
  if ([v7 multiUserIsOnboardingDevice])
  {
  }
  else
  {
    BOOL meIsMeDevice = self->_meIsMeDevice;

    if (!meIsMeDevice) {
      goto LABEL_8;
    }
  }
  if (a3 < 0x10)
  {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    id v11 = [(ADMultiUserCloudKitSyncer *)self setPersonalData:v10];
    uint64_t v12 = +[ADCloudKitManager sharedManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10026C800;
    v13[3] = &unk_10050CB48;
    v13[4] = self;
    id v14 = v6;
    [v12 addDictionaryToSharedStore:v10 completion:v13];
  }
  else
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[ADMultiUserCloudKitSyncer _syncMeCard:anchorToSave:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Failed to Sync MeCard.", buf, 0xCu);
    }
  }
LABEL_8:
}

- (id)_cachedAssistantData
{
  return self->_cachedAssistantData;
}

- (void)meDeviceChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10026CA58;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)primaryUserSharedUserIdentifierDidChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026CDA4;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_gatherIdentifiersForMultiUser
{
}

- (void)accountDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026CF40;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)enabledBitsChanged:(id)a3
{
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADMultiUserCloudKitSyncer enabledBitsChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026D18C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)syncSyncMetadataToCloud:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026D2F8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)syncIdentifiersToCloud
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026D388;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setHomeMemberships:(id)a3 homeMembershipsToDelete:(id)a4 voiceIDSetting:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10026D46C;
    v11[3] = &unk_10050CAD0;
    id v12 = v8;
    id v13 = self;
    BOOL v15 = a5;
    id v14 = v9;
    dispatch_async(queue, v11);
  }
}

- (void)markHomeMembershipsForDeletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10026D92C;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)syncAudioAppSignalsPayload:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026DB34;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)getAudioAppSignalsPayload
{
  if (+[AFFeatureFlags isAudioAppPredictionOnHomePodEnabled])
  {
    v2 = +[AFMultiUserDataSyncUtils retrieveAudioAppSignals];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_homeMembershipsToDelete
{
  homeMembershipsToDelete = self->_homeMembershipsToDelete;
  if (!homeMembershipsToDelete)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v5 = self->_homeMembershipsToDelete;
    self->_homeMembershipsToDelete = v4;

    homeMembershipsToDelete = self->_homeMembershipsToDelete;
  }
  return homeMembershipsToDelete;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ADMultiUserCloudKitSyncer;
  [(ADMultiUserCloudKitSyncer *)&v4 dealloc];
}

- (id)_init
{
  v23.receiver = self;
  v23.super_class = (Class)ADMultiUserCloudKitSyncer;
  v2 = [(ADMultiUserCloudKitSyncer *)&v23 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MultiUserCloudKitSyncerQueue", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = +[ADPreferences sharedPreferences];
    uint64_t v7 = [v6 sharedUserIdentifier];
    sharedUserIdentifier = v2->_sharedUserIdentifier;
    v2->_sharedUserIdentifier = (NSString *)v7;

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"enabledBitsChanged:" name:@"ADPreferencesEnabledBitsDidChangeNotification" object:0];
    [v9 addObserver:v2 selector:"primaryUserSharedUserIdentifierDidChangeNotification:" name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:0];
    [v9 addObserver:v2 selector:"accountDidChange:" name:@"ADActiveAccountIdentifierDidChangeNotification" object:0];
    [v9 addObserver:v2 selector:"syncIdentifiersToCloud" name:@"ADDeviceUsedForHomePodSetupNotification" object:0];
    id v10 = +[ADAssistantDataManager sharedDataManager];
    [v10 addObserver:v2];
    [v10 requestAssistantDataUpdateHighPriority:0];
    v2->_int meWasMeDevice = [v6 isMultiUserSyncerMeDevice];
    if (+[AFFeatureFlags isAudioAppPredictionOnHomePodEnabled](AFFeatureFlags, "isAudioAppPredictionOnHomePodEnabled"))[v9 addObserver:v2 selector:"syncAudioAppSignalsPayload:" name:@"ADAudioAppSignalsDidChangeNotification" object:0]; {
    if (!AFIsMultiUserCompanion())
    }
      goto LABEL_12;
    id v11 = +[ADMultiUserMeDevice sharedInstance];
    [v9 addObserver:v2 selector:"syncSyncMetadataToCloud:" name:@"ADSyncMetadataUpdatedNotification" object:0];
    [v9 addObserver:v2 selector:"meDeviceChanged:" name:@"ADMultiUserMeDeviceChangedNotification" object:0];
    id v12 = [v11 isMeDevice];
    v2->_BOOL meIsMeDevice = [v12 BOOLValue];

    uint64_t v13 = [v11 meDeviceIDSIdentifier];
    idsIdentifier = v2->_idsIdentifier;
    v2->_idsIdentifier = (NSString *)v13;

    BOOL meIsMeDevice = v2->_meIsMeDevice;
    uint64_t v16 = AFSiriLogContextDaemon;
    BOOL v17 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (meIsMeDevice)
    {
      if (v17)
      {
        id v18 = v2->_idsIdentifier;
        *(_DWORD *)buf = 136315394;
        long long v25 = "-[ADMultiUserCloudKitSyncer _init]";
        __int16 v26 = 2112;
        long long v27 = v18;
        id v19 = "%s meDevice with IDS identifier %@";
        id v20 = v16;
        uint32_t v21 = 22;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
      }
    }
    else if (v17)
    {
      *(_DWORD *)buf = 136315138;
      long long v25 = "-[ADMultiUserCloudKitSyncer _init]";
      id v19 = "%s NOT meDevice";
      id v20 = v16;
      uint32_t v21 = 12;
      goto LABEL_10;
    }

LABEL_12:
  }
  return v2;
}

+ (id)sharedService
{
  if (AFIsMultiUserCompanion())
  {
    if (qword_100586070 != -1) {
      dispatch_once(&qword_100586070, &stru_1005083F8);
    }
    id v2 = (id)qword_100586068;
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

@end