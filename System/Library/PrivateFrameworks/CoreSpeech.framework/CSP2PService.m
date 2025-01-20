@interface CSP2PService
+ (id)sharedInstance;
- (BOOL)fileURL:(id)a3 matchesFileNamePattern:(id)a4;
- (BOOL)isHeadlessDeviceDataCollectionModeEnabled;
- (BOOL)isInternalWithoutProfile;
- (BOOL)shouldTransferVoiceTriggerLogFileWithURL:(id)a3;
- (CSADCompanionServiceProvider)adCompanionServiceProvider;
- (CSP2PService)init;
- (NSString)lastCommunicatedPeer;
- (NSString)voiceIdentificationBatchId;
- (NSString)voiceTriggerBatchId;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)sema;
- (id)_getContentsOfDirectory:(id)a3;
- (id)_sendGradingData:(id)a3 withFileName:(id)a4 toPeerId:(id)a5 withCompressedFlag:(BOOL)a6 withUncompressedDataSize:(unint64_t)a7 withBatchId:(id)a8 withRetainFileFlag:(BOOL)a9 withFilePrefix:(id)a10 withCompletion:(id)a11;
- (id)_sha1:(id)a3;
- (id)_spIdSiriDebugGradingDataRootDirectory;
- (id)_spIdSiriDebugTrainedUsersFilePathForLocale:(id)a3;
- (id)_spIdSiriDebugVTDataDirectory;
- (id)_spIdSiriDebugVoiceProfileCacheDirectoryForProfile:(id)a3 locale:(id)a4;
- (id)_spIdSiriDebugVoiceProfileRootDirectoryForProfile:(id)a3 locale:(id)a4;
- (id)_spIdSiriDebugVoiceProfileStoreRootDirectory;
- (id)_spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:(id)a3;
- (id)_speakerRecognitionAudioLogsGradingDir;
- (void)_compressFilesInDirectory:(id)a3 matchingPredicate:(id)a4 compressedFileAvailable:(id)a5;
- (void)_compressFilesInDirectory:(id)a3 matchingPredicate:(id)a4 sortedByCreationDate:(BOOL)a5 compressedFileAvailable:(id)a6;
- (void)_createDirectoryIfDoesNotExist:(id)a3;
- (void)_getHomeUserIdForSharedSiriId:(id)a3 withCompletion:(id)a4;
- (void)_processFetchVoiceProfileCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5;
- (void)_processGradingDataFetchCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5;
- (void)_processGradingDataFetchCommandWithRequest:(id)a3 ofLogType:(unint64_t)a4 fromSenderID:(id)a5 withReply:(id)a6;
- (void)_processParallelRecordingCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5;
- (void)_processRemoteHeySiriCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5;
- (void)_processReverseTransferVoiceProfileCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5;
- (void)_processVoiceProfileDeleteCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5;
- (void)_processVoiceProfileListQueryCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5;
- (void)_processVoiceProfileUpdateTriggerFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5;
- (void)_receiveParallelRecordingFromPeerId:(id)a3 recordingInfo:(id)a4 withReply:(id)a5;
- (void)_receiveVoiceGradingDataFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5;
- (void)_receiveVoiceProfileFromPeerId:(id)a3 voiceProfileInfo:(id)a4 withReply:(id)a5;
- (void)_sendAcousticGradingDataToPeerId:(id)a3;
- (void)_sendCoreSpeechGradingDataToPeerId:(id)a3;
- (void)_sendCoreSpeechGradingDataToPeerId:(id)a3 forLogType:(unint64_t)a4;
- (void)_sendCoreSpeechMagusGradingDataToPeerId:(id)a3;
- (void)_sendGeckoSpeechLogsToPeerId:(id)a3;
- (void)_sendGradingData:(id)a3 withFileName:(id)a4 toPeerId:(id)a5 withCompressedFlag:(BOOL)a6 withUncompressedDataSize:(unint64_t)a7 withBatchId:(id)a8 withRetainFileFlag:(BOOL)a9 withFilePrefix:(id)a10;
- (void)_sendVoiceProfile:(id)a3 toPeerId:(id)a4;
- (void)_sendVoiceProfileUpdateTriggerToPeerId:(id)a3 forLocale:(id)a4;
- (void)_sendVoiceTriggerGradingDataToPeerId:(id)a3;
- (void)processRemoteCommandWithPayload:(id)a3 fromPeer:(id)a4 withReply:(id)a5;
- (void)sendAcousticGradingDataToNearbyPeer;
- (void)sendCoreSpeechGradingDataToNearbyPeer;
- (void)sendGeckoSpeechLogsToCompanion;
- (void)sendVTNearMissGradingDataToCompanion;
- (void)sendVoiceProfileUpdatedMessageToNearbyPeerForLocale:(id)a3;
- (void)setAdCompanionServiceProvider:(id)a3;
- (void)setLastCommunicatedPeer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSema:(id)a3;
- (void)setVoiceIdentificationBatchId:(id)a3;
- (void)setVoiceTriggerBatchId:(id)a3;
@end

@implementation CSP2PService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sema, 0);
  objc_storeStrong((id *)&self->_voiceIdentificationBatchId, 0);
  objc_storeStrong((id *)&self->_voiceTriggerBatchId, 0);
  objc_storeStrong((id *)&self->_lastCommunicatedPeer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_adCompanionServiceProvider);
}

- (void)setSema:(id)a3
{
}

- (OS_dispatch_semaphore)sema
{
  return self->_sema;
}

- (void)setVoiceIdentificationBatchId:(id)a3
{
}

- (NSString)voiceIdentificationBatchId
{
  return self->_voiceIdentificationBatchId;
}

- (void)setVoiceTriggerBatchId:(id)a3
{
}

- (NSString)voiceTriggerBatchId
{
  return self->_voiceTriggerBatchId;
}

- (void)setLastCommunicatedPeer:(id)a3
{
}

- (NSString)lastCommunicatedPeer
{
  return self->_lastCommunicatedPeer;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAdCompanionServiceProvider:(id)a3
{
}

- (CSADCompanionServiceProvider)adCompanionServiceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
  return (CSADCompanionServiceProvider *)WeakRetained;
}

- (BOOL)fileURL:(id)a3 matchesFileNamePattern:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v16 = 0;
  id v7 = [objc_alloc((Class)NSRegularExpression) initWithPattern:v5 options:1 error:&v16];

  v8 = [v6 lastPathComponent];
  v9 = [v6 lastPathComponent];

  id v10 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v8, 16, 0, objc_msgSend(v9, "length"));
  uint64_t v12 = v11;

  BOOL v14 = v10 != (id)0x7FFFFFFFFFFFFFFFLL || v12 != 0;
  return v14;
}

- (BOOL)shouldTransferVoiceTriggerLogFileWithURL:(id)a3
{
  id v3 = a3;
  v4 = [v3 pathExtension];
  unsigned int v5 = [v4 isEqualToString:@"wav"];

  if (v5)
  {
    id v6 = [v3 path];
    id v7 = [v6 stringByReplacingOccurrencesOfString:@"wav" withString:@"json"];

    v8 = [v3 path];
    v9 = v8;
    CFStringRef v10 = @".wav";
    CFStringRef v11 = @"-synced.json";
  }
  else
  {
    uint64_t v12 = [v3 pathExtension];
    unsigned int v13 = [v12 isEqualToString:@"json"];

    if (!v13)
    {
      unsigned __int8 v17 = 0;
      goto LABEL_10;
    }
    BOOL v14 = [v3 path];
    id v7 = [v14 stringByReplacingOccurrencesOfString:@"json" withString:@"wav"];

    v8 = [v3 path];
    v9 = v8;
    CFStringRef v10 = @".json";
    CFStringRef v11 = @"-synced.wav";
  }
  v15 = [v8 stringByReplacingOccurrencesOfString:v10 withString:v11];

  uint64_t v16 = +[NSFileManager defaultManager];
  if ([v16 fileExistsAtPath:v7])
  {
    unsigned __int8 v17 = 1;
  }
  else
  {
    v18 = +[NSFileManager defaultManager];
    unsigned __int8 v17 = [v18 fileExistsAtPath:v15];
  }
LABEL_10:

  return v17;
}

- (id)_sha1:(id)a3
{
  id v3 = a3;
  CC_SHA1([v3 bytes], (CC_LONG)objc_msgSend(v3, "length"), md);
  v4 = +[NSMutableString stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

- (BOOL)isInternalWithoutProfile
{
  if (CSIsInternalBuild())
  {
    v2 = +[CSFPreferences sharedPreferences];
    unsigned int v3 = [v2 isP2PTransferEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isHeadlessDeviceDataCollectionModeEnabled
{
  if (CSIsInternalBuild()) {
    return 1;
  }
  unsigned int v3 = +[CSFPreferences sharedPreferences];
  unsigned __int8 v4 = [v3 isP2PTransferEnabled];

  return v4;
}

- (id)_getContentsOfDirectory:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[NSFileManager defaultManager];
  NSURLResourceKey v22 = NSURLNameKey;
  unsigned int v5 = +[NSArray arrayWithObjects:&v22 count:1];
  id v15 = 0;
  id v6 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v5 options:0 error:&v15];
  id v7 = v15;

  if (v7)
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
LABEL_3:
      id v9 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315650;
    unsigned __int8 v17 = "-[CSP2PService _getContentsOfDirectory:]";
    __int16 v18 = 2112;
    id v19 = v3;
    __int16 v20 = 2112;
    id v21 = v7;
    uint64_t v12 = "%s Error reading directory at %@: err: %@";
    unsigned int v13 = v8;
    uint32_t v14 = 32;
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_3;
  }
  if (![v6 count])
  {
    CFStringRef v11 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_DWORD *)buf = 136315394;
    unsigned __int8 v17 = "-[CSP2PService _getContentsOfDirectory:]";
    __int16 v18 = 2112;
    id v19 = v3;
    uint64_t v12 = "%s %@ is empty";
    unsigned int v13 = v11;
    uint32_t v14 = 22;
    goto LABEL_12;
  }
  id v9 = v6;
LABEL_6:

  return v9;
}

- (id)_spIdSiriDebugVoiceProfileCacheDirectoryForProfile:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = [(CSP2PService *)self _spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:a4];
  v8 = [v7 stringByAppendingPathComponent:@"Caches"];
  id v9 = [v8 stringByAppendingPathComponent:v6];

  return v9;
}

- (id)_spIdSiriDebugVoiceProfileRootDirectoryForProfile:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = [(CSP2PService *)self _spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:a4];
  v8 = [v7 stringByAppendingPathComponent:v6];

  return v8;
}

- (id)_spIdSiriDebugTrainedUsersFilePathForLocale:(id)a3
{
  id v3 = [(CSP2PService *)self _spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:a3];
  unsigned __int8 v4 = [v3 stringByAppendingPathComponent:@"trained_users.json"];

  return v4;
}

- (id)_spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CSP2PService *)self _spIdSiriDebugVoiceProfileStoreRootDirectory];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (id)_spIdSiriDebugVoiceProfileStoreRootDirectory
{
  v2 = [(CSP2PService *)self _spIdSiriDebugVTDataDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"VoiceProfileStore"];

  return v3;
}

- (id)_spIdSiriDebugGradingDataRootDirectory
{
  id v3 = +[CSFPreferences sharedPreferences];
  id v4 = [v3 remoteGradingDataDirectory];

  [(CSP2PService *)self _createDirectoryIfDoesNotExist:v4];
  return v4;
}

- (id)_spIdSiriDebugVTDataDirectory
{
  id v3 = +[CSFPreferences sharedPreferences];
  id v4 = [v3 remoteP2pLogDirectory];

  [(CSP2PService *)self _createDirectoryIfDoesNotExist:v4];
  return v4;
}

- (void)_createDirectoryIfDoesNotExist:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = v4;
  char v17 = 0;
  if (v3)
  {
    unsigned int v6 = [v4 fileExistsAtPath:v3 isDirectory:&v17];
    if (v6) {
      BOOL v7 = v17 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (v17) {
        unsigned int v8 = 0;
      }
      else {
        unsigned int v8 = v6;
      }
      if (v8 == 1)
      {
        id v9 = CSLogCategorySpkrId;
        if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v19 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
          __int16 v20 = 2112;
          id v21 = v3;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Direntry with same name exists, this will be removed: %@", buf, 0x16u);
        }
        [v5 removeItemAtPath:v3 error:0];
      }
      CFStringRef v10 = CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v19 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
        __int16 v20 = 2112;
        id v21 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Creating Directory : %@", buf, 0x16u);
      }
      id v16 = 0;
      [v5 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v16];
      id v11 = v16;
      if (v11)
      {
        uint64_t v12 = (void *)CSLogCategorySpkrId;
        if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v13 = v12;
          uint32_t v14 = [v11 localizedDescription];
          *(_DWORD *)buf = 136315394;
          id v19 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
          __int16 v20 = 2112;
          id v21 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Creating Directory failed : %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    id v15 = CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s path is nil - Bailing out", buf, 0xCu);
    }
  }
}

- (id)_speakerRecognitionAudioLogsGradingDir
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F8A54;
  block[3] = &unk_100253AE0;
  block[4] = self;
  if (qword_1002A3A10 != -1) {
    dispatch_once(&qword_1002A3A10, block);
  }
  return (id)qword_1002A3A08;
}

- (void)_sendAcousticGradingDataToPeerId:(id)a3
{
  id v4 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000F8CB4;
  v16[3] = &unk_100251850;
  v16[4] = self;
  unsigned int v5 = +[NSPredicate predicateWithBlock:v16];
  unsigned int v6 = +[NSUUID UUID];
  BOOL v7 = [v6 UUIDString];

  unsigned int v8 = +[CSFPreferences sharedPreferences];
  id v9 = [v8 assistantAudioFileLogDirectory];
  CFStringRef v10 = +[NSURL URLWithString:v9];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F8E2C;
  v13[3] = &unk_1002518A0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v4;
  id v11 = v4;
  id v12 = v7;
  [(CSP2PService *)self _compressFilesInDirectory:v10 matchingPredicate:v5 compressedFileAvailable:v13];
}

- (void)_sendVoiceProfileUpdateTriggerToPeerId:(id)a3 forLocale:(id)a4
{
  id v6 = a3;
  v16[0] = @"CSP2P_PeerIdentifier_Key";
  v16[1] = @"CSP2P_VoiceProfileLocale_Key";
  v17[0] = v6;
  v17[1] = a4;
  id v7 = a4;
  unsigned int v8 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14[0] = @"CSP2P_CommandType_Key";
  v14[1] = @"CSP2P_CommandDict_Key";
  v15[0] = @"com.apple.siridebug.command.voiceprofile.update.trigger";
  v15[1] = v8;
  v14[2] = @"type";
  v15[2] = @"corespeech";
  id v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000F9404;
  v12[3] = &unk_1002519D0;
  id v13 = v6;
  id v11 = v6;
  [WeakRetained sendMessageWithPayload:v9 toPeer:v11 withReply:v12];
}

- (void)_processVoiceProfileUpdateTriggerFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!CSIsHorseman())
  {
    if (!v7 || !v8)
    {
      id v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
        __int16 v27 = 2112;
        id v28 = v7;
        __int16 v29 = 2112;
        id v30 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command - %@ %@", buf, 0x20u);
        if (!v9) {
          goto LABEL_26;
        }
      }
      else if (!v9)
      {
        goto LABEL_26;
      }
      uint64_t v11 = 3;
      goto LABEL_16;
    }
    uint64_t v12 = _IDSCopyIDForDeviceUniqueID();
    if (v12)
    {
      id v13 = (void *)v12;
      id v14 = [v8 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];

      if (v14)
      {
        id v15 = [v8 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];
        id v16 = [v8 objectForKeyedSubscript:@"CSP2P_VoiceProfileTransferCompleted_Key"];
        unsigned int v17 = [v16 BOOLValue];

        if (v17)
        {
          __int16 v18 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.siri.SiriDebug.VoiceProfileSyncTrigger", v13, v15];
          +[CSSiriDebugConnection launchSiriDebugAppWithMessage:v18];
        }
        if (v9) {
          (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
        }
      }
      else
      {
        NSURLResourceKey v22 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
          __int16 v27 = 2112;
          id v28 = v8;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command with locale nil - %@", buf, 0x16u);
          if (!v9) {
            goto LABEL_25;
          }
        }
        else if (!v9)
        {
          goto LABEL_25;
        }
        id v15 = +[NSError errorWithDomain:@"CoreSpeech" code:3 userInfo:0];
        (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v15);
      }

      goto LABEL_25;
    }
    __int16 v20 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v23 = v20;
      id v24 = objc_retainBlock(v9);
      *(_DWORD *)buf = 136315906;
      v26 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      id v30 = v24;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s ERR: unknown IDS peer with passed Identifier %@, %@ %@", buf, 0x2Au);

      if (!v9) {
        goto LABEL_20;
      }
    }
    else if (!v9)
    {
LABEL_20:
      id v13 = 0;
      goto LABEL_25;
    }
    id v21 = +[NSError errorWithDomain:@"CoreSpeech" code:2 userInfo:0];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v21);

    goto LABEL_20;
  }
  CFStringRef v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s ERR: Rejecting command %@ sent to Horseman device", buf, 0x16u);
    if (!v9) {
      goto LABEL_26;
    }
    goto LABEL_4;
  }
  if (v9)
  {
LABEL_4:
    uint64_t v11 = 2;
LABEL_16:
    id v13 = +[NSError errorWithDomain:@"CoreSpeech" code:v11 userInfo:0];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
LABEL_25:
  }
LABEL_26:
}

- (void)_processReverseTransferVoiceProfileCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!CSIsHorseman())
  {
    if (!v8 || !v9)
    {
      id v16 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v83 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
        __int16 v84 = 2112;
        size_t v85 = (size_t)v8;
        __int16 v86 = 2112;
        id v87 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command - %@ %@", buf, 0x20u);
        if (!v10) {
          goto LABEL_77;
        }
      }
      else if (!v10)
      {
        goto LABEL_77;
      }
      uint64_t v12 = 3;
      goto LABEL_14;
    }
    id v13 = (void *)_IDSCopyIDForDeviceUniqueID();
    if (v13)
    {
      id v14 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];

      if (v14)
      {
        id v15 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"];
        if (v15)
        {

          goto LABEL_23;
        }
        id v21 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSiriProfileId_Key"];

        if (v21)
        {
LABEL_23:
          __int16 v20 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];
          NSURLResourceKey v22 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"];
          if (!v22)
          {
            NSURLResourceKey v22 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSiriProfileId_Key"];
          }
          v23 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileTransferCompleted_Key"];
          unsigned int v24 = [v23 BOOLValue];

          if (v24)
          {
            v25 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.siri.SiriDebug.VoiceProfileAddedTrigger", v22, v20];
            +[CSSiriDebugConnection launchSiriDebugAppWithMessage:v25];
            if (v10) {
              (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
            }
            goto LABEL_38;
          }
          v26 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRelativeFilePath_Key"];

          if (!v26)
          {
            v39 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v83 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              __int16 v84 = 2112;
              size_t v85 = (size_t)v9;
              _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command with relative path nil - %@", buf, 0x16u);
              if (!v10) {
                goto LABEL_74;
              }
            }
            else if (!v10)
            {
LABEL_74:

              goto LABEL_75;
            }
            v25 = +[NSError errorWithDomain:@"CoreSpeech" code:3 userInfo:0];
            (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v25);
LABEL_38:

            goto LABEL_74;
          }
          uint64_t v27 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRelativeFilePath_Key"];
          v70 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileData_Key"];
          v71 = v22;
          v72 = [(CSP2PService *)self _spIdSiriDebugVoiceProfileCacheDirectoryForProfile:v22 locale:v20];
          v69 = (void *)v27;
          id v28 = [v72 stringByAppendingPathComponent:v27];
          __int16 v29 = +[NSFileManager defaultManager];
          id v30 = [v28 stringByDeletingLastPathComponent];
          id v75 = 0;
          LOBYTE(v27) = [v29 createDirectoryAtPath:v30 withIntermediateDirectories:1 attributes:0 error:&v75];
          id v73 = v75;

          if ((v27 & 1) == 0)
          {
            v33 = v28;
            v41 = CSLogContextFacilityCoreSpeech;
            v35 = v73;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v83 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              __int16 v84 = 2112;
              size_t v85 = (size_t)v73;
              v36 = "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: Creating directory failed with error %@";
              v37 = v41;
              uint32_t v38 = 22;
              goto LABEL_45;
            }
LABEL_46:
            v42 = v69;
            v43 = v70;
            if (!v10)
            {
LABEL_73:

              NSURLResourceKey v22 = v71;
              goto LABEL_74;
            }
            id v44 = +[NSError errorWithDomain:@"CoreSpeech" code:4 userInfo:0];
            (*((void (**)(id, void, id))v10 + 2))(v10, 0, v44);
LABEL_72:

            goto LABEL_73;
          }
          __int16 v31 = +[NSFileManager defaultManager];
          unsigned int v32 = [v31 fileExistsAtPath:v28];

          v33 = v28;
          if (v32)
          {
            v34 = CSLogContextFacilityCoreSpeech;
            v35 = v73;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v83 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              __int16 v84 = 2112;
              size_t v85 = (size_t)v33;
              __int16 v86 = 2112;
              id v87 = v13;
              v36 = "%s Ignoring sync of existing file %@ from %@";
              v37 = v34;
              uint32_t v38 = 32;
LABEL_45:
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
              goto LABEL_46;
            }
            goto LABEL_46;
          }
          v45 = [v9 objectForKeyedSubscript:@"CSP2P_IsDataCompressed_Key"];
          int v46 = [v45 BOOLValue];

          v47 = v73;
          if (v46)
          {
            v43 = v70;
            size_t v48 = (size_t)[v70 length];
            src_buffer = (uint8_t *)[v70 bytes];
            v49 = [v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"];

            v50 = v33;
            if (v49)
            {
              [v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"];
              v52 = size_t v51 = v48;
              size_t v53 = (size_t)[v52 integerValue];

              size_t v48 = v51;
            }
            else
            {
              size_t v53 = 3 * v48;
            }
            v59 = (uint8_t *)malloc_type_malloc(v53, 0x100004077774924uLL);
            if (!v59)
            {
              v66 = CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v83 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
                __int16 v84 = 2048;
                size_t v85 = v53;
                _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%s ERR: Failed to allocate buffer of size %zu, bailing out", buf, 0x16u);
              }
              v42 = v69;
              if (!v10)
              {
                id v44 = 0;
                goto LABEL_70;
              }
              CFStringRef v80 = @"CSP2P_VoiceProfileStatus_Key";
              v81 = &off_10025DFC0;
              v65 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
              v67 = +[NSError errorWithDomain:@"CoreSpeech" code:10 userInfo:0];
              (*((void (**)(id, void *, void *))v10 + 2))(v10, v65, v67);

              id v44 = 0;
LABEL_69:

LABEL_70:
              v33 = v50;
              v35 = v73;
              goto LABEL_72;
            }
            v60 = v59;
            id v44 = +[NSData dataWithBytes:v59 length:compression_decode_buffer(v59, v53, src_buffer, v48, 0, COMPRESSION_LZFSE)];
            free(v60);
            v33 = v50;
            v47 = v73;
          }
          else
          {
            v56 = (void *)CSLogContextFacilityCoreSpeech;
            v43 = v70;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              v57 = v56;
              v58 = [v9 objectForKeyedSubscript:@"CSP2P_PeerIdentifier_Key"];
              *(_DWORD *)buf = 136315650;
              v83 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              __int16 v84 = 2112;
              size_t v85 = (size_t)v33;
              __int16 v86 = 2112;
              id v87 = v58;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%s Uncompressed file %@ sent by peer %@", buf, 0x20u);
            }
            id v44 = v70;
          }
          id v74 = v47;
          unsigned __int8 v61 = [v44 writeToFile:v33 options:0 error:&v74];
          id v73 = v74;

          if (v61)
          {
            if (v10)
            {
              v50 = v33;
              CFStringRef v76 = @"CSP2P_VoiceProfileStatus_Key";
              v77 = &off_10025DFA8;
              v62 = &v77;
              v63 = &v76;
LABEL_68:
              v65 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v63 count:1];
              (*((void (**)(id, void *, id))v10 + 2))(v10, v65, v73);
              v42 = v69;
              goto LABEL_69;
            }
          }
          else
          {
            v64 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v83 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              __int16 v84 = 2112;
              size_t v85 = (size_t)v33;
              __int16 v86 = 2112;
              id v87 = v73;
              _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%s Writing to file(%@) failed!. Err=%@", buf, 0x20u);
            }
            if (v10)
            {
              v50 = v33;
              CFStringRef v78 = @"CSP2P_VoiceProfileStatus_Key";
              v79 = &off_10025DFC0;
              v62 = &v79;
              v63 = &v78;
              goto LABEL_68;
            }
          }
          v35 = v73;
          v42 = v69;
          goto LABEL_72;
        }
        id v19 = CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136315394;
        v83 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
        __int16 v84 = 2112;
        size_t v85 = (size_t)v9;
        v40 = "%s ERR: received malformed command with profileId nil - %@";
      }
      else
      {
        id v19 = CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
LABEL_19:
          if (!v10) {
            goto LABEL_76;
          }
          uint64_t v18 = 3;
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136315394;
        v83 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
        __int16 v84 = 2112;
        size_t v85 = (size_t)v9;
        v40 = "%s ERR: received malformed command with locale nil - %@";
      }
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v40, buf, 0x16u);
      goto LABEL_19;
    }
    unsigned int v17 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v54 = v17;
      id v55 = objc_retainBlock(v10);
      *(_DWORD *)buf = 136315906;
      v83 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
      __int16 v84 = 2112;
      size_t v85 = (size_t)v8;
      __int16 v86 = 2112;
      id v87 = v55;
      __int16 v88 = 2112;
      id v89 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%s ERR: unknown IDS peer with passed Identifier %@, %@ %@", buf, 0x2Au);

      if (v10) {
        goto LABEL_17;
      }
    }
    else if (v10)
    {
LABEL_17:
      uint64_t v18 = 2;
LABEL_21:
      __int16 v20 = +[NSError errorWithDomain:@"CoreSpeech" code:v18 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v20);
LABEL_75:

      goto LABEL_76;
    }
    id v13 = 0;
    goto LABEL_76;
  }
  uint64_t v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v83 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
    __int16 v84 = 2112;
    size_t v85 = (size_t)v8;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s ERR: Rejecting command %@ sent to Horseman device", buf, 0x16u);
    if (!v10) {
      goto LABEL_77;
    }
    goto LABEL_4;
  }
  if (v10)
  {
LABEL_4:
    uint64_t v12 = 2;
LABEL_14:
    id v13 = +[NSError errorWithDomain:@"CoreSpeech" code:v12 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
LABEL_76:
  }
LABEL_77:
}

- (void)_sendVoiceProfile:(id)a3 toPeerId:(id)a4
{
  id v5 = a3;
  id v52 = a4;
  id v6 = +[CSFPreferences sharedPreferences];
  id v7 = [v6 baseDir];
  id v8 = [v7 stringByAppendingPathComponent:@"Caches/VoiceTrigger/SATUpdate"];

  id v9 = [v5 siriProfileId];
  id v10 = +[NSString stringWithFormat:@"_%d_%d_%@", 2, 1, v9];
  uint64_t v11 = [v8 stringByAppendingString:v10];

  uint64_t v12 = [v5 locale];
  id v13 = [v11 stringByAppendingPathComponent:v12];

  id v14 = +[NSFileManager defaultManager];
  id v65 = 0;
  id v15 = [v14 contentsOfDirectoryAtPath:v13 error:&v65];
  id v16 = v65;

  if (!v16 && [v15 count]) {
    goto LABEL_24;
  }

  unsigned int v17 = [v5 siriProfileId];
  uint64_t v18 = +[NSString stringWithFormat:@"_%d_%d_%@", 5, 1, v17];
  id v19 = [v8 stringByAppendingString:v18];

  __int16 v20 = [v5 locale];
  id v13 = [v19 stringByAppendingPathComponent:v20];

  id v21 = +[NSFileManager defaultManager];
  id v64 = 0;
  uint64_t v22 = [v21 contentsOfDirectoryAtPath:v13 error:&v64];
  id v23 = v64;

  id v15 = (void *)v22;
  if (!v23)
  {
LABEL_24:
    if ([v15 count])
    {
      v47 = v15;
      size_t v48 = v8;
      unsigned int v24 = [v13 stringByAppendingPathComponent:@"td/audio"];
      v25 = [v13 stringByAppendingPathComponent:@"tdti/audio"];
      uint64_t v26 = [v13 stringByAppendingPathComponent:@"ti/audio"];
      v69[0] = v13;
      v69[1] = v24;
      v69[2] = v25;
      v69[3] = v26;
      int v46 = (void *)v26;
      uint64_t v27 = +[NSArray arrayWithObjects:v69 count:4];
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_1000FAC68;
      v63[3] = &unk_100251850;
      v63[4] = self;
      v50 = +[NSPredicate predicateWithBlock:v63];
      id v28 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = v28;
        id v30 = [v5 profileID];
        *(_DWORD *)buf = 136315394;
        v71 = "-[CSP2PService _sendVoiceProfile:toPeerId:]";
        __int16 v72 = 2114;
        id v73 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileFetchCmd: Transferring voice profile %{public}@", buf, 0x16u);
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id obj = v27;
      id v31 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v32; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v60 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v35 = *(void *)(*((void *)&v59 + 1) + 8 * i);
            v36 = +[NSURL fileURLWithPath:v35];
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472;
            v55[2] = sub_1000FAD1C;
            v55[3] = &unk_1002519F8;
            v55[4] = v35;
            id v56 = v5;
            id v57 = v52;
            v58 = self;
            [(CSP2PService *)self _compressFilesInDirectory:v36 matchingPredicate:v50 compressedFileAvailable:v55];
          }
          id v32 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
        }
        while (v32);
      }

      id v37 = objc_alloc((Class)NSMutableDictionary);
      uint32_t v38 = [v5 profileID];
      v39 = [v5 locale];
      id v40 = objc_msgSend(v37, "initWithObjectsAndKeys:", v52, @"CSP2P_PeerIdentifier_Key", v38, @"CSP2P_VoiceProfileProfileId_Key", v39, @"CSP2P_VoiceProfileLocale_Key", &__kCFBooleanTrue, @"CSP2P_VoiceProfileTransferCompleted_Key", 0);

      v66[0] = @"CSP2P_CommandType_Key";
      v66[1] = @"CSP2P_CommandDict_Key";
      v67[0] = @"com.apple.siridebug.command.reverse.transfer.voiceprofile";
      v67[1] = v40;
      v66[2] = @"type";
      v67[2] = @"corespeech";
      v41 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
      v42 = [v5 siriProfileId];

      if (v42)
      {
        v43 = [v5 siriProfileId];
        [v40 setObject:v43 forKey:@"CSP2P_VoiceProfileSiriProfileId_Key"];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1000FB1E0;
      v53[3] = &unk_1002519D0;
      id v54 = v5;
      [WeakRetained sendMessageWithPayload:v41 toPeer:v52 withReply:v53];

      id v23 = 0;
      id v8 = v48;
      id v15 = v47;
      goto LABEL_21;
    }
    id v23 = 0;
  }
  v45 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v71 = "-[CSP2PService _sendVoiceProfile:toPeerId:]";
    __int16 v72 = 2112;
    id v73 = v13;
    __int16 v74 = 2112;
    id v75 = v23;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%s Cannot read contents of directory: %@, err: %@", buf, 0x20u);
  }
LABEL_21:
}

- (void)_processFetchVoiceProfileCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);

  if (!WeakRetained)
  {
    uint64_t v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v30 = 136315138;
      *(void *)&v30[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Cannot send data across when _adCompanionServiceProvider is nil - returning", v30, 0xCu);
    }
    if (!v10) {
      goto LABEL_24;
    }
    uint64_t v19 = 9;
LABEL_22:
    uint64_t v12 = +[NSError errorWithDomain:@"CoreSpeech" code:v19 userInfo:0];
    v10[2](v10, 0, v12);
    goto LABEL_23;
  }
  if ((CSIsHorseman() & 1) == 0)
  {
    __int16 v20 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v30 = 136315394;
      *(void *)&v30[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
      *(_WORD *)&v30[12] = 2112;
      *(void *)&v30[14] = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s ERR: Rejecting command %@ sent to non Horseman device", v30, 0x16u);
      if (!v10) {
        goto LABEL_24;
      }
    }
    else if (!v10)
    {
      goto LABEL_24;
    }
    uint64_t v19 = 2;
    goto LABEL_22;
  }
  if (v8 && v9)
  {
    uint64_t v12 = (void *)_IDSCopyIDForDeviceUniqueID();
    if (v12)
    {
      id v13 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];

      if (v13)
      {
        id v14 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"];

        if (v14)
        {
          id v15 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"];
          id v16 = +[SSRVoiceProfileManager sharedInstance];
          unsigned int v17 = [v16 voiceProfileForId:v15];
          if (v17)
          {
            if (v10) {
              v10[2](v10, 0, 0);
            }
            [(CSP2PService *)self _sendVoiceProfile:v17 toPeerId:v8];
            goto LABEL_39;
          }
          uint64_t v26 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v30 = 136315394;
            *(void *)&v30[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
            *(_WORD *)&v30[12] = 2112;
            *(void *)&v30[14] = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s ERR: Failed to find voice profile with identifier - %@", v30, 0x16u);
            if (!v10) {
              goto LABEL_39;
            }
          }
          else if (!v10)
          {
LABEL_39:

            goto LABEL_40;
          }
          uint64_t v27 = +[NSError errorWithDomain:@"CoreSpeech" code:11 userInfo:0];
          v10[2](v10, 0, v27);

          goto LABEL_39;
        }
        unsigned int v24 = CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
LABEL_31:
          if (v10)
          {
LABEL_32:
            uint64_t v23 = 3;
            goto LABEL_33;
          }
LABEL_23:

          goto LABEL_24;
        }
        *(_DWORD *)id v30 = 136315394;
        *(void *)&v30[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
        *(_WORD *)&v30[12] = 2112;
        *(void *)&v30[14] = v9;
        v25 = "%s ERR: received malformed command with profileId nil - %@";
      }
      else
      {
        unsigned int v24 = CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        *(_DWORD *)id v30 = 136315394;
        *(void *)&v30[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
        *(_WORD *)&v30[12] = 2112;
        *(void *)&v30[14] = v9;
        v25 = "%s ERR: received malformed command with locale nil - %@";
      }
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v25, v30, 0x16u);
      if (!v10) {
        goto LABEL_23;
      }
      goto LABEL_32;
    }
    uint64_t v22 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v28 = v22;
      __int16 v29 = objc_retainBlock(v10);
      *(_DWORD *)id v30 = 136315906;
      *(void *)&v30[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
      *(_WORD *)&v30[12] = 2112;
      *(void *)&v30[14] = v8;
      *(_WORD *)&v30[22] = 2112;
      id v31 = v29;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s ERR: unknown IDS peer with passed Identifier %@, %@ %@", v30, 0x2Au);

      if (v10) {
        goto LABEL_27;
      }
    }
    else if (v10)
    {
LABEL_27:
      uint64_t v23 = 2;
LABEL_33:
      id v15 = +[NSError errorWithDomain:@"CoreSpeech", v23, 0, *(_OWORD *)v30, *(void *)&v30[16] code userInfo];
      v10[2](v10, 0, v15);
LABEL_40:

      goto LABEL_23;
    }
    uint64_t v12 = 0;
    goto LABEL_23;
  }
  id v21 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v30 = 136315650;
    *(void *)&v30[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
    *(_WORD *)&v30[12] = 2112;
    *(void *)&v30[14] = v8;
    *(_WORD *)&v30[22] = 2112;
    id v31 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command - %@ %@", v30, 0x20u);
    if (!v10) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  if (v10)
  {
LABEL_21:
    uint64_t v19 = 3;
    goto LABEL_22;
  }
LABEL_24:
}

- (void)_getHomeUserIdForSharedSiriId:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1000FBDB8;
  id v31 = sub_1000FBDC8;
  id v32 = 0;
  id v7 = objc_alloc_init((Class)CSDispatchGroup);
  id v8 = objc_alloc_init((Class)AFMultiUserConnection);
  id v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSP2PService _getHomeUserIdForSharedSiriId:withCompletion:]";
    __int16 v37 = 2114;
    id v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Fetching homeUserId for siriProfileId %{public}@", buf, 0x16u);
  }
  [v7 enter];
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  __int16 v20 = sub_1000FBDD0;
  id v21 = &unk_1002519A8;
  id v10 = v8;
  id v22 = v10;
  uint64_t v26 = &v27;
  id v11 = v5;
  id v23 = v11;
  id v12 = v7;
  id v24 = v12;
  id v13 = v6;
  id v25 = v13;
  [v10 getHomeUserIdForSharedUserId:v11 completion:&v18];
  if (objc_msgSend(v12, "waitWithTimeout:", dispatch_time(0, 100000000)))
  {
    id v14 = +[NSString stringWithFormat:@"homeUserId query for siriProfileId %@ timedout !", v11, v18, v19, v20, v21, v22, v23, v24];
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    v34 = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v16 = +[NSError errorWithDomain:CSErrorDomain code:701 userInfo:v15];

    unsigned int v17 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CSP2PService _getHomeUserIdForSharedSiriId:withCompletion:]";
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
      if (!v13) {
        goto LABEL_7;
      }
    }
    else if (!v13)
    {
LABEL_7:

      goto LABEL_8;
    }
    (*((void (**)(id, uint64_t, void *))v13 + 2))(v13, v28[5], v16);
    goto LABEL_7;
  }
LABEL_8:

  _Block_object_dispose(&v27, 8);
}

- (void)_processVoiceProfileListQueryCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if ((CSIsHorseman() & 1) == 0)
  {
    v43 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      __int16 v68 = 2112;
      id v69 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s ERR: Rejecting command %@ sent to non Horseman device", buf, 0x16u);
      if (!v9) {
        goto LABEL_49;
      }
    }
    else if (!v9)
    {
      goto LABEL_49;
    }
    uint64_t v44 = 2;
LABEL_39:
    id v10 = +[NSError errorWithDomain:@"CoreSpeech" code:v44 userInfo:0];
    v9[2](v9, 0, v10);
    goto LABEL_48;
  }
  if (!v7 || !v8)
  {
    v45 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v67 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      __int16 v68 = 2112;
      id v69 = v7;
      __int16 v70 = 2112;
      id v71 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command - %@ %@", buf, 0x20u);
      if (!v9) {
        goto LABEL_49;
      }
    }
    else if (!v9)
    {
      goto LABEL_49;
    }
    uint64_t v44 = 3;
    goto LABEL_39;
  }
  id v10 = (void *)_IDSCopyIDForDeviceUniqueID();
  if (!v10)
  {
    int v46 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v49 = v46;
      v50 = objc_retainBlock(v9);
      *(_DWORD *)buf = 136315906;
      v67 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      __int16 v68 = 2112;
      id v69 = v7;
      __int16 v70 = 2112;
      id v71 = v50;
      __int16 v72 = 2112;
      id v73 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%s ERR: unknown IDS peer with passed Identifier %@, %@ %@", buf, 0x2Au);

      if (v9) {
        goto LABEL_42;
      }
    }
    else if (v9)
    {
LABEL_42:
      uint64_t v47 = 2;
      goto LABEL_46;
    }
    id v10 = 0;
    goto LABEL_48;
  }
  id v11 = [v8 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];

  if (!v11)
  {
    size_t v48 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      __int16 v68 = 2112;
      id v69 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command with locale nil - %@", buf, 0x16u);
      if (!v9) {
        goto LABEL_48;
      }
    }
    else if (!v9)
    {
      goto LABEL_48;
    }
    uint64_t v47 = 3;
LABEL_46:
    id v12 = +[NSError errorWithDomain:@"CoreSpeech" code:v47 userInfo:0];
    v9[2](v9, 0, v12);
    goto LABEL_47;
  }
  id v12 = [v8 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];
  id v13 = +[SSRVoiceProfileManager sharedInstance];
  id v14 = [v13 provisionedVoiceProfilesForLocale:v12];

  if (!v9) {
    goto LABEL_32;
  }
  id v52 = v12;
  size_t v53 = v10;
  id v54 = v9;
  id v55 = v8;
  id v56 = v7;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  size_t v51 = v14;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (!v17) {
    goto LABEL_31;
  }
  id v18 = v17;
  uint64_t v19 = *(void *)v62;
  uint64_t v58 = SSRSpeakerRecognitionSiriAppDomain;
  do
  {
    for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v62 != v19) {
        objc_enumerationMutation(v16);
      }
      id v21 = *(void **)(*((void *)&v61 + 1) + 8 * i);
      id v22 = objc_alloc_init((Class)NSMutableDictionary);
      id v23 = [v21 sharedSiriId];

      if (v23)
      {
        id v24 = [v21 sharedSiriId];
        [v22 setObject:v24 forKeyedSubscript:@"CSP2P_VoiceProfileSiriProfileId_Key"];
      }
      id v25 = [v21 profileId];

      if (v25)
      {
        uint64_t v26 = [v21 profileId];
        [v22 setObject:v26 forKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"];
      }
      uint64_t v27 = [v21 appDomain];

      if (v27)
      {
        id v28 = [v21 appDomain];
        [v22 setObject:v28 forKeyedSubscript:@"CSP2P_VoiceProfileAppDomain_Key"];
      }
      uint64_t v29 = [v21 dateAdded];

      if (v29)
      {
        id v30 = objc_alloc_init((Class)NSDateFormatter);
        [v30 setDateFormat:@"yyyyMMddHHmmss"];
        id v31 = [v21 dateAdded];
        id v32 = [v30 stringFromDate:v31];
        [v22 setObject:v32 forKeyedSubscript:@"CSP2P_VoiceProfileOnboardTimeStamp_Key"];
      }
      NSErrorUserInfoKey v33 = [v21 homeId];

      if (v33)
      {
        v34 = [v21 homeId];
        [v22 setObject:v34 forKeyedSubscript:@"CSP2P_VoiceProfileHomeUserId_Key"];
      }
      else
      {
        uint64_t v35 = [v21 appDomain];
        unsigned int v36 = [v35 isEqualToString:v58];

        if (!v36) {
          goto LABEL_25;
        }
        __int16 v37 = [v21 sharedSiriId];
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_1000FC744;
        v59[3] = &unk_100251980;
        id v60 = v22;
        [(CSP2PService *)self _getHomeUserIdForSharedSiriId:v37 withCompletion:v59];

        v34 = v60;
      }

LABEL_25:
      id v38 = [v21 userName];

      if (v38)
      {
        v39 = [v21 userName];
        [v22 setObject:v39 forKeyedSubscript:@"CSP2P_VoiceProfileSpeakerName_Key"];
      }
      id v40 = [v21 languageCode];

      if (v40)
      {
        v41 = [v21 languageCode];
        [v22 setObject:v41 forKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];
      }
      [v15 addObject:v22];
    }
    id v18 = [v16 countByEnumeratingWithState:&v61 objects:v65 count:16];
  }
  while (v18);
LABEL_31:

  id v42 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v15, @"voiceprofiles", 0);
  id v9 = v54;
  ((void (**)(id, id, void *))v54)[2](v54, v42, 0);

  id v8 = v55;
  id v7 = v56;
  id v12 = v52;
  id v10 = v53;
  id v14 = v51;
LABEL_32:

LABEL_47:
LABEL_48:

LABEL_49:
}

- (void)_processGradingDataFetchCommandWithRequest:(id)a3 ofLogType:(unint64_t)a4 fromSenderID:(id)a5 withReply:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);

  if (WeakRetained)
  {
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
    switch(a4)
    {
      case 0uLL:
        [(CSP2PService *)self _sendVoiceTriggerGradingDataToPeerId:v9];
        [(CSP2PService *)self _sendCoreSpeechGradingDataToPeerId:v9];
        [(CSP2PService *)self _sendCoreSpeechMagusGradingDataToPeerId:v9];
        [(CSP2PService *)self _sendAcousticGradingDataToPeerId:v9];
        goto LABEL_6;
      case 1uLL:
        [(CSP2PService *)self _sendVoiceTriggerGradingDataToPeerId:v9];
        break;
      case 2uLL:
        [(CSP2PService *)self _sendCoreSpeechGradingDataToPeerId:v9];
        break;
      case 3uLL:
        [(CSP2PService *)self _sendCoreSpeechMagusGradingDataToPeerId:v9];
        break;
      case 4uLL:
        [(CSP2PService *)self _sendAcousticGradingDataToPeerId:v9];
        break;
      case 5uLL:
LABEL_6:
        [(CSP2PService *)self _sendGeckoSpeechLogsToPeerId:v9];
        break;
      case 6uLL:
        id v14 = self;
        id v15 = v9;
        uint64_t v16 = 1;
        goto LABEL_19;
      case 7uLL:
        id v14 = self;
        id v15 = v9;
        uint64_t v16 = 2;
        goto LABEL_19;
      case 8uLL:
        goto LABEL_18;
      case 9uLL:
        [(CSP2PService *)self _sendVoiceTriggerGradingDataToPeerId:v9];
LABEL_18:
        id v14 = self;
        id v15 = v9;
        uint64_t v16 = 3;
LABEL_19:
        [(CSP2PService *)v14 _sendCoreSpeechGradingDataToPeerId:v15 forLogType:v16];
        break;
      default:
        break;
    }
  }
  else
  {
    id v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      id v18 = "-[CSP2PService _processGradingDataFetchCommandWithRequest:ofLogType:fromSenderID:withReply:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Cannot send data across when _adCompanionServiceProvider is nil - returning", (uint8_t *)&v17, 0xCu);
    }
    if (v10)
    {
      id v13 = +[NSError errorWithDomain:@"CoreSpeech" code:3 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    }
  }
}

- (void)_processGradingDataFetchCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
}

- (void)_processVoiceProfileDeleteCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FCAB8;
  block[3] = &unk_100253280;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, block);
}

- (void)_receiveVoiceProfileFromPeerId:(id)a3 voiceProfileInfo:(id)a4 withReply:(id)a5
{
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v9 = a4;
  id v10 = a5;
  v100 = v8;
  if (!v8 || !v9)
  {
    uint64_t v29 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = v29;
      id v31 = objc_retainBlock(v10);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v130 = v100;
      *(_WORD *)v131 = 2112;
      *(void *)&v131[2] = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: received malformed command - %@ %@ %@", buf, 0x2Au);
    }
    if (v10) {
      goto LABEL_26;
    }
    goto LABEL_28;
  }
  id v11 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileData_Key"];
  if (v11)
  {
    id v12 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileFileName_Key"];
    if (v12)
    {
      id v13 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSpeakerName_Key"];
      if (v13)
      {
        id v14 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];
        if (v14)
        {
          id v15 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileDataType_Key"];
          if (v15)
          {
            id v16 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileTotalSegments_Key"];
            if (v16)
            {
              id v17 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSegment_Key"];

              if (v17)
              {
                id v18 = (void *)CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v19 = v18;
                  __int16 v20 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSegment_Key"];
                  id v21 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileTotalSegments_Key"];
                  *(_DWORD *)buf = 136315906;
                  *(void *)&uint8_t buf[4] = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v20;
                  *(_WORD *)&buf[22] = 2112;
                  v130 = v21;
                  *(_WORD *)v131 = 2112;
                  *(void *)&v131[2] = v100;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: Received VoiceProfile Segment (%@/%@) from peerId %@", buf, 0x2Au);
                }
                id v22 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileData_Key"];
                size_t v23 = (size_t)[v22 length];

                id v24 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileData_Key"];
                id v25 = (const uint8_t *)[v24 bytes];

                uint64_t v26 = [v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"];

                if (v26)
                {
                  uint64_t v27 = [v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"];
                  size_t v28 = (size_t)[v27 integerValue];
                }
                else
                {
                  size_t v28 = 3 * v23;
                }
                id v42 = (uint8_t *)malloc_type_malloc(v28, 0x100004077774924uLL);
                v43 = v42;
                if (!v42)
                {
                  __int16 v88 = CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)&uint8_t buf[4] = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    *(_WORD *)&buf[12] = 2048;
                    *(void *)&buf[14] = v28;
                    _os_log_error_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "%s ERR: Failed to allocate buffer of size %zu, bailing out", buf, 0x16u);
                    if (!v10) {
                      goto LABEL_28;
                    }
                  }
                  else if (!v10)
                  {
                    goto LABEL_28;
                  }
                  CFStringRef v127 = @"CSP2P_VoiceProfileStatus_Key";
                  v128 = &off_10025DFC0;
                  v41 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
                  id v89 = +[NSError errorWithDomain:@"CoreSpeech" code:10 userInfo:0];
                  (*((void (**)(id, void *, void *))v10 + 2))(v10, v41, v89);

                  goto LABEL_27;
                }
                v41 = +[NSData dataWithBytes:v42 length:compression_decode_buffer(v42, v28, v25, v23, 0, COMPRESSION_LZFSE)];
                free(v43);
                *(void *)buf = 0;
                *(void *)&buf[8] = buf;
                *(void *)&buf[16] = 0x3032000000;
                v130 = sub_1000FBDB8;
                *(void *)v131 = sub_1000FBDC8;
                *(void *)&v131[8] = 0;
                uint64_t v44 = +[NSFileManager defaultManager];
                v45 = [v44 temporaryDirectory];
                v97 = [v45 URLByAppendingPathComponent:@"CoreSpeechCache"];

                int v46 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];
                uint64_t v47 = [v97 URLByAppendingPathComponent:v46];

                size_t v48 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"];
                v49 = [v47 URLByAppendingPathComponent:v48];

                id v98 = v49;
                v50 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileDataType_Key"];
                v99 = [v98 URLByAppendingPathComponent:v50];

                size_t v51 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSegment_Key"];
                LODWORD(v49) = [v51 integerValue] == (id)1;

                if (v49)
                {
                  dword_1002A3A00 = 0;
                  id v52 = +[NSFileManager defaultManager];
                  size_t v53 = [v99 path];
                  uint64_t v54 = *(void *)&buf[8];
                  id obj = *(id *)(*(void *)&buf[8] + 40);
                  unsigned __int8 v55 = [v52 removeItemAtPath:v53 error:&obj];
                  objc_storeStrong((id *)(v54 + 40), obj);

                  if ((v55 & 1) == 0)
                  {
                    id v56 = CSLogContextFacilityCoreSpeech;
                    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                    {
                      id v57 = [v99 path];
                      uint64_t v58 = *(void *)(*(void *)&buf[8] + 40);
                      *(_DWORD *)v121 = 136315650;
                      v122 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                      __int16 v123 = 2112;
                      v124 = v57;
                      __int16 v125 = 2112;
                      uint64_t v126 = v58;
                      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: Failed to delete the directory %@ with error %@", v121, 0x20u);
                    }
                  }
                }
                long long v59 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSegment_Key"];
                id v60 = [v59 integerValue];
                BOOL v61 = v60 == (id)(dword_1002A3A00 + 1);

                if (!v61)
                {
                  v90 = CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                  {
                    v91 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSegment_Key"];
                    *(_DWORD *)v121 = 136315650;
                    v122 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    __int16 v123 = 2112;
                    v124 = v91;
                    __int16 v125 = 1024;
                    LODWORD(v126) = dword_1002A3A00 + 1;
                    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: received VoiceProfileSegment %@, expected %d", v121, 0x1Cu);
                  }
                  if (!v10) {
                    goto LABEL_65;
                  }
                  CFStringRef v119 = @"CSP2P_VoiceProfileStatus_Key";
                  v120 = &off_10025DFC0;
                  __int16 v72 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
                  id v75 = +[NSError errorWithDomain:@"CoreSpeech" code:4 userInfo:0];
                  (*((void (**)(id, void *, id))v10 + 2))(v10, v72, v75);
                  goto LABEL_63;
                }
                long long v62 = +[NSFileManager defaultManager];
                long long v63 = [v99 path];
                uint64_t v64 = *(void *)&buf[8];
                id v105 = *(id *)(*(void *)&buf[8] + 40);
                unsigned __int8 v65 = [v62 createDirectoryAtPath:v63 withIntermediateDirectories:1 attributes:0 error:&v105];
                objc_storeStrong((id *)(v64 + 40), v105);

                if ((v65 & 1) == 0)
                {
                  v92 = CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                  {
                    v93 = *(void **)(*(void *)&buf[8] + 40);
                    *(_DWORD *)v121 = 136315394;
                    v122 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    __int16 v123 = 2112;
                    v124 = v93;
                    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: Creating directory failed with error %@", v121, 0x16u);
                  }
                  if (!v10) {
                    goto LABEL_65;
                  }
                  CFStringRef v117 = @"CSP2P_VoiceProfileStatus_Key";
                  v118 = &off_10025DFC0;
                  __int16 v72 = +[NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
                  id v75 = +[NSError errorWithDomain:@"CoreSpeech" code:4 userInfo:0];
                  (*((void (**)(id, void *, id))v10 + 2))(v10, v72, v75);
                  goto LABEL_63;
                }
                v66 = [v99 URLByAppendingPathComponent:@"audio"];

                v67 = [v66 path];
                [(CSP2PService *)self _createDirectoryIfDoesNotExist:v67];

                __int16 v68 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileFileName_Key"];
                v99 = [v66 URLByAppendingPathComponent:v68];

                if (([v41 writeToURL:v99 atomically:0] & 1) == 0)
                {
                  v94 = CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v121 = 136315138;
                    v122 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: Writing to file failed!!!", v121, 0xCu);
                  }
                  if (!v10) {
                    goto LABEL_65;
                  }
                  CFStringRef v115 = @"CSP2P_VoiceProfileStatus_Key";
                  v116 = &off_10025DFC0;
                  __int16 v72 = +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
                  id v75 = +[NSError errorWithDomain:@"CoreSpeech" code:4 userInfo:0];
                  (*((void (**)(id, void *, id))v10 + 2))(v10, v72, v75);
                  goto LABEL_63;
                }
                ++dword_1002A3A00;
                id v69 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileTotalSegments_Key"];
                id v70 = [v69 integerValue];
                BOOL v71 = v70 == (id)dword_1002A3A00;

                if (!v71)
                {
                  if (!v10) {
                    goto LABEL_65;
                  }
                  CFStringRef v107 = @"CSP2P_VoiceProfileStatus_Key";
                  v108 = &off_10025DFD8;
                  __int16 v72 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
                  (*((void (**)(id, void *, void))v10 + 2))(v10, v72, 0);
LABEL_64:

LABEL_65:
                  _Block_object_dispose(buf, 8);

                  goto LABEL_27;
                }
                dword_1002A3A00 = 0;
                __int16 v72 = +[SSRVoiceProfileManager sharedInstance];
                id v73 = +[SSRVoiceProfileManager sharedInstance];
                __int16 v74 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];
                id v75 = [v73 newVoiceProfileWithLocale:v74 withAppDomain:SSRSpeakerRecognitionSiriDebugAppDomain];

                id v76 = objc_alloc((Class)SSRVoiceProfileRetrainingContext);
                uint64_t v113 = SSRVoiceRetrainingVoiceProfileKey;
                id v114 = v75;
                v77 = +[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
                uint64_t v78 = *(void *)&buf[8];
                id v104 = *(id *)(*(void *)&buf[8] + 40);
                id v79 = [v76 initWithVoiceRetrainingContext:v77 error:&v104];
                objc_storeStrong((id *)(v78 + 40), v104);

                if (*(void *)(*(void *)&buf[8] + 40)) {
                  goto LABEL_44;
                }
                CFStringRef v80 = [v98 URLByAppendingPathComponent:@"tdti"];
                v96 = [v80 URLByAppendingPathComponent:@"audio"];

                v81 = [(CSP2PService *)self _getContentsOfDirectory:v96];
                v82 = dispatch_group_create();
                dispatch_group_enter(v82);
                v101[0] = _NSConcreteStackBlock;
                v101[1] = 3221225472;
                v101[2] = sub_1000FE08C;
                v101[3] = &unk_100251958;
                v103 = buf;
                v83 = v82;
                v102 = v83;
                [v72 addUtterances:v81 toProfile:v75 withContext:v79 withCompletion:v101];
                dispatch_time_t v84 = dispatch_time(0, 8000000000);
                dispatch_group_wait(v83, v84);
                if (!*(void *)(*(void *)&buf[8] + 40))
                {
                  size_t v85 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSpeakerName_Key"];
                  id v86 = [v72 updateVoiceProfile:v75 withUserName:v85];
                }
                if (*(void *)(*(void *)&buf[8] + 40))
                {
LABEL_44:
                  if (!v10)
                  {
LABEL_47:

LABEL_63:
                    goto LABEL_64;
                  }
                  CFStringRef v109 = @"CSP2P_VoiceProfileStatus_Key";
                  v110 = &off_10025DFC0;
                  id v87 = +[NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
                  (*((void (**)(id, void *, void))v10 + 2))(v10, v87, *(void *)(*(void *)&buf[8] + 40));
                }
                else
                {
                  notify_post("com.apple.siri.corespeech.voiceprofilelist.change");
                  if (!v10) {
                    goto LABEL_47;
                  }
                  v111[0] = @"CSP2P_VoiceProfileStatus_Key";
                  v111[1] = @"CSP2P_VoiceProfileProfileId_Key";
                  v112[0] = &off_10025DFA8;
                  id v87 = [v75 profileID];
                  v112[1] = v87;
                  v95 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:2];
                  (*((void (**)(id, void *, void))v10 + 2))(v10, v95, 0);
                }
                goto LABEL_47;
              }
              goto LABEL_23;
            }
          }
        }
      }
    }
  }
LABEL_23:
  id v32 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    NSErrorUserInfoKey v33 = v32;
    v34 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileData_Key"];
    uint64_t v35 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileFileName_Key"];
    unsigned int v36 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSpeakerName_Key"];
    __int16 v37 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];
    id v38 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileDataType_Key"];
    v39 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileTotalSegments_Key"];
    id v40 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSegment_Key"];
    *(_DWORD *)buf = 136316930;
    *(void *)&uint8_t buf[4] = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v34;
    *(_WORD *)&buf[22] = 2112;
    v130 = v35;
    *(_WORD *)v131 = 2112;
    *(void *)&v131[2] = v36;
    *(_WORD *)&v131[10] = 2112;
    *(void *)&v131[12] = v37;
    __int16 v132 = 2112;
    v133 = v38;
    __int16 v134 = 2112;
    v135 = v39;
    __int16 v136 = 2112;
    v137 = v40;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: received malformed command: CSP2P_VoiceProfileData_Key: %@CSP2P_VoiceProfileFileName_Key: %@CSP2P_VoiceProfileSpeakerName_Key: %@CSP2P_VoiceProfileLocale_Key: %@CSP2P_VoiceProfileDataType_Key: %@CSP2P_VoiceProfileTotalSegments_Key: %@CSP2P_VoiceProfileSegment_Key: %@", buf, 0x52u);
  }
  if (v10)
  {
LABEL_26:
    v41 = +[NSError errorWithDomain:@"CoreSpeech" code:3 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v41);
LABEL_27:
  }
LABEL_28:
}

- (void)_receiveVoiceGradingDataFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if (v8 && v9)
  {
    id v11 = (void *)_IDSCopyIDForDeviceUniqueID();
    if (v11)
    {
      uint64_t v12 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceDataToBeGraded_Key"];
      if (v12)
      {
        id v13 = (void *)v12;
        id v14 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceFileNameToBeGraded_Key"];

        if (v14)
        {
          id v15 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceDataToBeGraded_Key"];
          id v16 = [(CSP2PService *)self _spIdSiriDebugGradingDataRootDirectory];
          id v17 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceFileNameToBeGraded_Key"];
          id v18 = +[NSString stringWithFormat:@"%@_%@", v11, v17];

          uint64_t v19 = [v16 stringByAppendingPathComponent:v18];
          __int16 v20 = +[NSFileManager defaultManager];
          id v79 = (void *)v19;
          LODWORD(v19) = [v20 fileExistsAtPath:v19];

          id v21 = CSLogContextFacilityCoreSpeech;
          BOOL v22 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
          if (v19)
          {
            if (v22)
            {
              size_t v23 = v21;
              id v24 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceFileNameToBeGraded_Key"];
              *(_DWORD *)buf = 136315650;
              v91 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
              __int16 v92 = 2112;
              size_t v93 = (size_t)v24;
              __int16 v94 = 2112;
              id v95 = v11;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s Ignoring sync of existing file %@ from %@", buf, 0x20u);
            }
            id v25 = v79;
            if (!v10) {
              goto LABEL_67;
            }
            uint64_t v78 = v18;
            CFStringRef v88 = @"CSP2P_GradingDataTransferStatus_Key";
            id v89 = &off_10025DFA8;
            uint64_t v26 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
            v10[2](v10, v26, 0);
LABEL_66:

            id v18 = v78;
LABEL_67:

            goto LABEL_68;
          }
          if (v22)
          {
            *(_DWORD *)buf = 136315650;
            v91 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
            __int16 v92 = 2112;
            size_t v93 = (size_t)v18;
            __int16 v94 = 2112;
            id v95 = v11;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Syncing audio file - %@ from %@", buf, 0x20u);
          }
          uint64_t v35 = [v9 objectForKeyedSubscript:@"CSP2P_IsDataCompressed_Key"];
          unsigned __int8 v36 = [v35 BOOLValue];

          v77 = v16;
          uint64_t v78 = v18;
          if ((v36 & 1) == 0)
          {
            id v42 = (void *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              v43 = v42;
              uint64_t v44 = [v9 objectForKeyedSubscript:@"CSP2P_PeerIdentifier_Key"];
              *(_DWORD *)buf = 136315650;
              v91 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
              __int16 v92 = 2112;
              size_t v93 = (size_t)v79;
              __int16 v94 = 2112;
              id v95 = v44;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s Uncompressed file %@ sent by peer %@", buf, 0x20u);
            }
            id v45 = v15;
            goto LABEL_36;
          }
          size_t v37 = (size_t)[v15 length];
          id v38 = (const uint8_t *)[v15 bytes];
          v39 = [v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"];

          if (v39)
          {
            id v40 = [v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"];
            size_t v41 = (size_t)[v40 integerValue];
          }
          else
          {
            size_t v41 = 3 * v37;
          }
          int v46 = (uint8_t *)malloc_type_malloc(v41, 0x100004077774924uLL);
          if (v46)
          {
            uint64_t v47 = v46;
            id v45 = +[NSData dataWithBytes:v46 length:compression_decode_buffer(v46, v41, v38, v37, 0, COMPRESSION_LZFSE)];
            free(v47);
            id v16 = v77;
LABEL_36:
            id v81 = 0;
            id v25 = v79;
            unsigned int v48 = [v45 writeToFile:v79 options:0 error:&v81];
            id v76 = v81;
            if (v48)
            {
              id v75 = v45;
              v49 = [v79 pathExtension];
              v50 = v79;
              unsigned int v51 = [v49 isEqualToString:@"wav"];

              if (v51)
              {
                id v52 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceFileNameToBeGraded_Key"];
                uint64_t v74 = [v52 stringByReplacingOccurrencesOfString:@".wav" withString:&stru_100254530];

                uint64_t v53 = [v9 objectForKeyedSubscript:@"CSP2P_GradingBatchTransferID_Key"];
                uint64_t v54 = [v79 lastPathComponent];
                unsigned int v55 = [v54 containsString:@"-almost"];

                if (v55)
                {
                  id v56 = (objc_class *)v53;
                  if (v53
                    && (voiceTriggerBatchId = self->_voiceTriggerBatchId) != 0
                    && [(NSString *)voiceTriggerBatchId isEqualToString:v53])
                  {
                    uint64_t v58 = (void *)v74;
                    +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.siri.SiriDebug.RemoteNearMissGradingTrigger", @"suppressnotification", v74];
                  }
                  else
                  {
                    uint64_t v58 = (void *)v74;
                    +[NSString stringWithFormat:@"%@.%@", @"com.apple.siri.SiriDebug.RemoteNearMissGradingTrigger", v74, v73];
                  unsigned __int8 v65 = };
                  uint64_t v66 = 32;
                }
                else
                {
                  id v56 = (objc_class *)v53;
                  if (v53
                    && (voiceIdentificationBatchId = self->_voiceIdentificationBatchId) != 0
                    && [(NSString *)voiceIdentificationBatchId isEqualToString:v53])
                  {
                    uint64_t v58 = (void *)v74;
                    +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.siri.SiriDebug.SpeakerVoiceGradingTrigger", @"suppressnotification", v74];
                  }
                  else
                  {
                    uint64_t v58 = (void *)v74;
                    +[NSString stringWithFormat:@"%@.%@", @"com.apple.siri.SiriDebug.SpeakerVoiceGradingTrigger", v74, v73];
                  unsigned __int8 v65 = };
                  uint64_t v66 = 40;
                }
                v67 = *(Class *)((char *)&self->super.isa + v66);
                *(Class *)((char *)&self->super.isa + v66) = v56;
                __int16 v68 = v56;

                +[CSSiriDebugConnection launchSiriDebugAppWithMessage:v65];
                v50 = v79;
              }
              id v69 = +[NSFileManager defaultManager];
              id v70 = +[NSDictionary dictionaryWithObject:NSFileProtectionCompleteUntilFirstUserAuthentication forKey:NSFileProtectionKey];
              id v80 = 0;
              [v69 setAttributes:v70 ofItemAtPath:v50 error:&v80];
              id v71 = v80;

              uint64_t v26 = v76;
              if (v71)
              {
                __int16 v72 = CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v91 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
                  __int16 v92 = 2112;
                  size_t v93 = (size_t)v79;
                  __int16 v94 = 2112;
                  id v95 = v76;
                  _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%s Error setting remoteP2Plog file to NSFileProtectionCompleteUntilFirstUserAuthentication. file=%@ Err=%@", buf, 0x20u);
                }
              }

              id v16 = v77;
              id v25 = v79;
              id v45 = v75;
              if (!v10) {
                goto LABEL_65;
              }
            }
            else
            {
              long long v59 = CSLogContextFacilityCoreSpeech;
              uint64_t v26 = v76;
              if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v91 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
                __int16 v92 = 2112;
                size_t v93 = (size_t)v79;
                __int16 v94 = 2112;
                id v95 = v76;
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%s Writing to file(%@) failed!. Err=%@", buf, 0x20u);
              }
              if (!v10) {
                goto LABEL_65;
              }
              CFStringRef v84 = @"CSP2P_GradingDataTransferStatus_Key";
              size_t v85 = &off_10025DFD8;
              id v60 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
              ((void (**)(id, void *, id))v10)[2](v10, v60, v76);
            }
            CFStringRef v82 = @"CSP2P_GradingDataTransferStatus_Key";
            v83 = &off_10025DFA8;
            long long v62 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
            ((void (**)(id, void *, void *))v10)[2](v10, v62, v26);
            goto LABEL_64;
          }
          BOOL v61 = CSLogContextFacilityCoreSpeech;
          id v16 = v77;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v91 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
            __int16 v92 = 2048;
            size_t v93 = v41;
            _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%s ERR: Failed to allocate buffer of size %zu, bailing out", buf, 0x16u);
            if (v10) {
              goto LABEL_49;
            }
          }
          else if (v10)
          {
LABEL_49:
            CFStringRef v86 = @"CSP2P_VoiceProfileStatus_Key";
            id v87 = &off_10025DFC0;
            long long v62 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
            long long v63 = +[NSError errorWithDomain:@"CoreSpeech" code:10 userInfo:0];
            ((void (**)(id, void *, void *))v10)[2](v10, v62, v63);

            id v45 = 0;
            uint64_t v26 = 0;
            id v25 = v79;
LABEL_64:

LABEL_65:
            goto LABEL_66;
          }
          id v45 = 0;
          uint64_t v26 = 0;
          id v25 = v79;
          goto LABEL_65;
        }
      }
      id v30 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v91 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
        __int16 v92 = 2112;
        size_t v93 = (size_t)v9;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s received malformed command - %@", buf, 0x16u);
      }
      if (!v10) {
        goto LABEL_69;
      }
      uint64_t v31 = 3;
LABEL_23:
      id v15 = +[NSError errorWithDomain:@"CoreSpeech" code:v31 userInfo:0];
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v15);
LABEL_68:

      goto LABEL_69;
    }
    id v32 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      NSErrorUserInfoKey v33 = v32;
      v34 = objc_retainBlock(v10);
      *(_DWORD *)buf = 136315906;
      v91 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
      __int16 v92 = 2112;
      size_t v93 = (size_t)v8;
      __int16 v94 = 2112;
      id v95 = v9;
      __int16 v96 = 2112;
      id v97 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s unknown IDS peer with passed Identifier %@, %@ %@", buf, 0x2Au);
    }
    if (v10)
    {
      uint64_t v31 = 2;
      goto LABEL_23;
    }
    id v11 = 0;
LABEL_69:

    goto LABEL_70;
  }
  uint64_t v27 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    size_t v28 = v27;
    uint64_t v29 = objc_retainBlock(v10);
    *(_DWORD *)buf = 136315906;
    v91 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
    __int16 v92 = 2112;
    size_t v93 = (size_t)v9;
    __int16 v94 = 2112;
    id v95 = v8;
    __int16 v96 = 2112;
    id v97 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s received malformed command - %@ %@ %@", buf, 0x2Au);
  }
  if (v10)
  {
    id v11 = +[NSError errorWithDomain:@"CoreSpeech" code:3 userInfo:0];
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v11);
    goto LABEL_69;
  }
LABEL_70:
}

- (void)_receiveParallelRecordingFromPeerId:(id)a3 recordingInfo:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (v8 && v9)
  {
    id v11 = (void *)_IDSCopyIDForDeviceUniqueID();
    if (v11)
    {
      uint64_t v12 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRecordedData_Key"];
      if (v12)
      {
        id v13 = (void *)v12;
        uint64_t v14 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRemoteFileName_Key"];
        if (v14)
        {
          id v15 = (void *)v14;
          uint64_t v16 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];
          if (v16)
          {
            id v17 = (void *)v16;
            uint64_t v18 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"];
            if (v18)
            {
              uint64_t v19 = (void *)v18;
              __int16 v20 = [v9 objectForKeyedSubscript:@"CSP2P_IsDataCompressed_Key"];

              if (v20)
              {
                id v21 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRecordedData_Key"];
                BOOL v22 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"];
                uint64_t v23 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"];
                id v24 = [(CSP2PService *)self _spIdSiriDebugVoiceProfileRootDirectoryForProfile:v22 locale:v23];

                id v70 = v24;
                id v25 = [v24 stringByAppendingPathComponent:@"remote"];
                uint64_t v26 = +[NSFileManager defaultManager];
                id v72 = 0;
                LOBYTE(v23) = [v26 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v72];
                id v27 = v72;

                if ((v23 & 1) == 0)
                {
                  id v45 = CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    CFStringRef v82 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                    __int16 v83 = 2112;
                    size_t v84 = (size_t)v27;
                    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: Creating directory failed with error %@", buf, 0x16u);
                  }
                  if (!v10)
                  {
                    uint64_t v47 = v70;
LABEL_65:

                    goto LABEL_32;
                  }
                  int v46 = +[NSError errorWithDomain:@"CoreSpeech" code:4 userInfo:0];
                  v10[2](v10, 0, v46);
                  uint64_t v47 = v70;
LABEL_64:

                  goto LABEL_65;
                }
                size_t v28 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRemoteFileName_Key"];
                uint64_t v29 = +[NSString stringWithFormat:@"%@_%@", v11, v28];

                __int16 v68 = (void *)v29;
                uint64_t v30 = [v25 stringByAppendingPathComponent:v29];
                uint64_t v31 = +[NSFileManager defaultManager];
                id v69 = (void *)v30;
                LODWORD(v30) = [v31 fileExistsAtPath:v30];

                id v32 = CSLogContextFacilityCoreSpeech;
                BOOL v33 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
                if (v30)
                {
                  if (v33)
                  {
                    v34 = v32;
                    uint64_t v35 = [v9 objectForKeyedSubscript:@"CSP2P_VoiceFileNameToBeGraded_Key"];
                    *(_DWORD *)buf = 136315650;
                    CFStringRef v82 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                    __int16 v83 = 2112;
                    size_t v84 = (size_t)v35;
                    __int16 v85 = 2112;
                    id v86 = v11;
                    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s Ignoring sync of existing file %@ from %@", buf, 0x20u);
                  }
                  if (!v10)
                  {
                    uint64_t v47 = v70;
                    int v46 = v68;
LABEL_63:

                    goto LABEL_64;
                  }
                  CFStringRef v79 = @"CSP2P_GradingDataTransferStatus_Key";
                  id v80 = &off_10025DFA8;
                  id v36 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
                  ((void (**)(id, id, void *))v10)[2](v10, v36, 0);
LABEL_62:
                  uint64_t v47 = v70;
                  int v46 = v68;

                  goto LABEL_63;
                }
                if (v33)
                {
                  *(_DWORD *)buf = 136315650;
                  CFStringRef v82 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                  __int16 v83 = 2112;
                  size_t v84 = (size_t)v68;
                  __int16 v85 = 2112;
                  id v86 = v11;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s Syncing parallel recorded audio file - %@ from %@", buf, 0x20u);
                }
                unsigned int v48 = [v9 objectForKeyedSubscript:@"CSP2P_IsDataCompressed_Key"];
                unsigned __int8 v49 = [v48 BOOLValue];

                if ((v49 & 1) == 0)
                {
                  uint64_t v54 = (void *)CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v55 = v54;
                    id v56 = [v9 objectForKeyedSubscript:@"CSP2P_PeerIdentifier_Key"];
                    *(_DWORD *)buf = 136315650;
                    CFStringRef v82 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                    __int16 v83 = 2112;
                    size_t v84 = (size_t)v69;
                    __int16 v85 = 2112;
                    id v86 = v56;
                    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%s Uncompressed file %@ sent by peer %@", buf, 0x20u);
                  }
                  id v36 = v21;
LABEL_52:
                  id v71 = v27;
                  unsigned __int8 v59 = [v36 writeToFile:v69 options:0 error:&v71];
                  id v60 = v71;

                  if (v59)
                  {
                    if (v10)
                    {
                      CFStringRef v73 = @"CSP2P_VoiceProfileStatus_Key";
                      uint64_t v74 = &off_10025DFA8;
                      BOOL v61 = &v74;
                      long long v62 = &v73;
LABEL_59:
                      uint64_t v64 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v62 count:1];
                      ((void (**)(id, void *, void *))v10)[2](v10, v64, v60);
                      id v27 = v60;
LABEL_60:

                      goto LABEL_62;
                    }
                  }
                  else
                  {
                    long long v63 = CSLogContextFacilityCoreSpeech;
                    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315650;
                      CFStringRef v82 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                      __int16 v83 = 2112;
                      size_t v84 = (size_t)v69;
                      __int16 v85 = 2112;
                      id v86 = v60;
                      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%s Writing to file(%@) failed!. Err=%@", buf, 0x20u);
                    }
                    if (v10)
                    {
                      CFStringRef v75 = @"CSP2P_VoiceProfileStatus_Key";
                      id v76 = &off_10025DFC0;
                      BOOL v61 = &v76;
                      long long v62 = &v75;
                      goto LABEL_59;
                    }
                  }
                  id v27 = v60;
                  goto LABEL_62;
                }
                size_t v50 = (size_t)[v21 length];
                src_buffer = (uint8_t *)[v21 bytes];
                unsigned int v51 = [v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"];

                if (v51)
                {
                  id v52 = [v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"];
                  size_t v53 = (size_t)[v52 integerValue];
                }
                else
                {
                  size_t v53 = 3 * v50;
                }
                id v57 = (uint8_t *)malloc_type_malloc(v53, 0x100004077774924uLL);
                if (v57)
                {
                  uint64_t v58 = v57;
                  id v36 = +[NSData dataWithBytes:v57 length:compression_decode_buffer(v57, v53, src_buffer, v50, 0, COMPRESSION_LZFSE)];
                  free(v58);
                  goto LABEL_52;
                }
                unsigned __int8 v65 = CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  CFStringRef v82 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                  __int16 v83 = 2048;
                  size_t v84 = v53;
                  _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%s ERR: Failed to allocate buffer of size %zu, bailing out", buf, 0x16u);
                  if (v10) {
                    goto LABEL_68;
                  }
                }
                else if (v10)
                {
LABEL_68:
                  CFStringRef v77 = @"CSP2P_VoiceProfileStatus_Key";
                  uint64_t v78 = &off_10025DFC0;
                  uint64_t v64 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
                  uint64_t v66 = +[NSError errorWithDomain:@"CoreSpeech" code:10 userInfo:0];
                  ((void (**)(id, void *, void *))v10)[2](v10, v64, v66);

                  id v36 = 0;
                  goto LABEL_60;
                }
                id v36 = 0;
                goto LABEL_62;
              }
              goto LABEL_27;
            }
          }
        }
      }
LABEL_27:
      uint64_t v44 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        CFStringRef v82 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
        __int16 v83 = 2112;
        size_t v84 = (size_t)v9;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: received malformed command - %@", buf, 0x16u);
      }
      if (!v10) {
        goto LABEL_33;
      }
      uint64_t v43 = 3;
      goto LABEL_31;
    }
    id v40 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      size_t v41 = v40;
      id v42 = objc_retainBlock(v10);
      *(_DWORD *)buf = 136315906;
      CFStringRef v82 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
      __int16 v83 = 2112;
      size_t v84 = (size_t)v8;
      __int16 v85 = 2112;
      id v86 = v9;
      __int16 v87 = 2112;
      id v88 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: unknown IDS peer with passed Identifier %@, %@ %@", buf, 0x2Au);
    }
    if (v10)
    {
      uint64_t v43 = 2;
LABEL_31:
      id v21 = +[NSError errorWithDomain:@"CoreSpeech" code:v43 userInfo:0];
      v10[2](v10, 0, v21);
LABEL_32:

      goto LABEL_33;
    }
    id v11 = 0;
LABEL_33:

    goto LABEL_34;
  }
  size_t v37 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v38 = v37;
    v39 = objc_retainBlock(v10);
    *(_DWORD *)buf = 136315906;
    CFStringRef v82 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
    __int16 v83 = 2112;
    size_t v84 = (size_t)v9;
    __int16 v85 = 2112;
    id v86 = v8;
    __int16 v87 = 2112;
    id v88 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: received malformed command - %@ %@ %@", buf, 0x2Au);
  }
  if (v10)
  {
    id v11 = +[NSError errorWithDomain:@"CoreSpeech" code:3 userInfo:0];
    v10[2](v10, 0, v11);
    goto LABEL_33;
  }
LABEL_34:
}

- (id)_sendGradingData:(id)a3 withFileName:(id)a4 toPeerId:(id)a5 withCompressedFlag:(BOOL)a6 withUncompressedDataSize:(unint64_t)a7 withBatchId:(id)a8 withRetainFileFlag:(BOOL)a9 withFilePrefix:(id)a10 withCompletion:(id)a11
{
  BOOL v53 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a10;
  id v20 = a11;
  if (v15 && v16 && v17)
  {
    unint64_t v51 = a7;
    unsigned __int8 v49 = +[NSUUID UUID];
    id v21 = [v16 stringByDeletingLastPathComponent];
    id v52 = v18;
    size_t v50 = v20;
    if ([(CSP2PService *)self isInternalWithoutProfile])
    {
      id v22 = [v16 lastPathComponent];
    }
    else
    {
      id v26 = objc_alloc((Class)NSMutableString);
      id v27 = [v16 lastPathComponent];
      id v22 = [v26 initWithString:v27];

      uint64_t v62 = 0;
      id v28 = [objc_alloc((Class)NSRegularExpression) initWithPattern:@"[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}" options:1 error:&v62];
      id v30 = objc_msgSend(v28, "rangeOfFirstMatchInString:options:range:", v22, 16, 0, objc_msgSend(v22, "length"));
      if (v30 != (id)0x7FFFFFFFFFFFFFFFLL || v29)
      {
        uint64_t v47 = objc_msgSend(v22, "substringWithRange:", v30, v29);
        [v47 dataUsingEncoding:4];
        v32 = uint64_t v31 = v21;
        BOOL v33 = [(CSP2PService *)self _sha1:v32];

        id v21 = v31;
        objc_msgSend(v28, "replaceMatchesInString:options:range:withTemplate:", v22, 16, 0, objc_msgSend(v22, "length"), v33);
      }
    }
    unsigned int v48 = v21;
    v34 = +[NSString stringWithFormat:@"%@%@", v19, v22];
    uint64_t v35 = [v21 stringByAppendingPathComponent:v34];

    v65[0] = @"CSP2P_VoiceFileNameToBeGraded_Key";
    id v36 = [v35 lastPathComponent];
    v66[0] = v36;
    v65[1] = @"CSP2P_IsDataCompressed_Key";
    size_t v37 = +[NSNumber numberWithBool:v53];
    v66[1] = v37;
    v66[2] = v15;
    v65[2] = @"CSP2P_VoiceDataToBeGraded_Key";
    v65[3] = @"CSP2P_PeerIdentifier_Key";
    void v66[3] = v17;
    v65[4] = @"CSP2P_UncompressedDataSize_Key";
    id v38 = +[NSNumber numberWithUnsignedLong:v51];
    v65[5] = @"CSP2P_GradingBatchTransferID_Key";
    v66[4] = v38;
    v66[5] = v52;
    id v54 = v15;
    v39 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:6];

    v63[0] = @"CSP2P_CommandType_Key";
    v63[1] = @"CSP2P_CommandDict_Key";
    v64[0] = @"com.apple.siridebug.command.transfer.voicegradingdata";
    v64[1] = v39;
    v63[2] = @"type";
    v64[2] = @"corespeech";
    id v40 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_1000FFD20;
    v56[3] = &unk_100251930;
    id v57 = v35;
    BOOL v61 = a9;
    id v58 = v16;
    id v60 = v50;
    id v42 = v49;
    id v59 = v42;
    id v43 = v35;
    [WeakRetained sendMessageWithPayload:v40 toPeer:v17 withReply:v56];

    uint64_t v44 = v59;
    id v45 = v42;
    id v20 = v50;
    id v25 = v45;

    id v15 = v54;
    id v18 = v52;

    goto LABEL_21;
  }
  uint64_t v23 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v24 = @"peerId";
    if (v17) {
      CFStringRef v24 = @"unknown";
    }
    if (!v16) {
      CFStringRef v24 = @"fileName";
    }
    if (!v15) {
      CFStringRef v24 = @"fileData";
    }
    *(_DWORD *)buf = 136315394;
    __int16 v68 = "-[CSP2PService _sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchId:"
          "withRetainFileFlag:withFilePrefix:withCompletion:]";
    __int16 v69 = 2112;
    CFStringRef v70 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s %@ is nil - Bailing out", buf, 0x16u);
  }
  if (v20)
  {
    id v22 = +[NSError errorWithDomain:@"CoreSpeech" code:3 userInfo:0];
    (*((void (**)(id, void, id))v20 + 2))(v20, 0, v22);
    id v25 = 0;
LABEL_21:

    goto LABEL_22;
  }
  id v25 = 0;
LABEL_22:

  return v25;
}

- (void)_sendGradingData:(id)a3 withFileName:(id)a4 toPeerId:(id)a5 withCompressedFlag:(BOOL)a6 withUncompressedDataSize:(unint64_t)a7 withBatchId:(id)a8 withRetainFileFlag:(BOOL)a9 withFilePrefix:(id)a10
{
  LOBYTE(v11) = a9;
  id v10 = [(CSP2PService *)self _sendGradingData:a3 withFileName:a4 toPeerId:a5 withCompressedFlag:a6 withUncompressedDataSize:a7 withBatchId:a8 withRetainFileFlag:v11 withFilePrefix:a10 withCompletion:0];
}

- (void)_sendCoreSpeechMagusGradingDataToPeerId:(id)a3
{
  id v4 = a3;
  if (CSIsInternalBuild())
  {
    id v5 = +[NSPredicate predicateWithBlock:&stru_100251908];
    id v6 = +[NSUUID UUID];
    id v7 = [v6 UUIDString];

    id v8 = +[CSFPreferences sharedPreferences];
    id v9 = [v8 mhLogDirectory];
    id v10 = +[NSURL URLWithString:v9];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001001DC;
    v12[3] = &unk_1002518A0;
    void v12[4] = self;
    id v13 = v7;
    id v14 = v4;
    id v11 = v7;
    [(CSP2PService *)self _compressFilesInDirectory:v10 matchingPredicate:v5 compressedFileAvailable:v12];
  }
}

- (void)_sendGeckoSpeechLogsToPeerId:(id)a3
{
  id v4 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_100100A54;
  v16[3] = &unk_100251850;
  v16[4] = self;
  id v5 = +[NSPredicate predicateWithBlock:v16];
  id v6 = +[NSUUID UUID];
  id v7 = [v6 UUIDString];

  id v8 = +[CSFPreferences sharedPreferences];
  id v9 = [v8 geckoAudioLogDirectory];
  id v10 = +[NSURL URLWithString:v9];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100100AC8;
  v13[3] = &unk_1002518A0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v4;
  id v11 = v4;
  id v12 = v7;
  [(CSP2PService *)self _compressFilesInDirectory:v10 matchingPredicate:v5 sortedByCreationDate:1 compressedFileAvailable:v13];
}

- (void)_sendCoreSpeechGradingDataToPeerId:(id)a3 forLogType:(unint64_t)a4
{
  id v6 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001010AC;
  v18[3] = &unk_1002518C8;
  v18[4] = self;
  v18[5] = a4;
  id v7 = +[NSPredicate predicateWithBlock:v18];
  id v8 = +[NSUUID UUID];
  id v9 = [v8 UUIDString];

  id v10 = +[CSFPreferences sharedPreferences];
  id v11 = [v10 assistantAudioFileLogDirectory];
  id v12 = +[NSURL URLWithString:v11];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10010128C;
  void v15[3] = &unk_1002518A0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v6;
  id v13 = v6;
  id v14 = v9;
  [(CSP2PService *)self _compressFilesInDirectory:v12 matchingPredicate:v7 compressedFileAvailable:v15];
}

- (void)_sendCoreSpeechGradingDataToPeerId:(id)a3
{
}

- (void)_sendVoiceTriggerGradingDataToPeerId:(id)a3
{
  id v4 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_100101878;
  v16[3] = &unk_100251850;
  v16[4] = self;
  id v5 = +[NSPredicate predicateWithBlock:v16];
  id v6 = +[NSUUID UUID];
  id v7 = [v6 UUIDString];

  id v8 = +[CSFPreferences sharedPreferences];
  id v9 = [v8 voiceTriggerAudioLogDirectory];
  id v10 = +[NSURL URLWithString:v9];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100101944;
  v13[3] = &unk_1002518A0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v4;
  id v11 = v4;
  id v12 = v7;
  [(CSP2PService *)self _compressFilesInDirectory:v10 matchingPredicate:v5 compressedFileAvailable:v13];
}

- (void)_compressFilesInDirectory:(id)a3 matchingPredicate:(id)a4 sortedByCreationDate:(BOOL)a5 compressedFileAvailable:(id)a6
{
  BOOL v7 = a5;
  id v42 = a3;
  id v40 = a4;
  id v43 = (void (**)(id, void *, id, id, id, BOOL, void))a6;
  id v9 = +[NSFileManager defaultManager];
  NSURLResourceKey v10 = NSURLIsDirectoryKey;
  v68[0] = NSURLNameKey;
  v68[1] = NSURLIsDirectoryKey;
  id v11 = +[NSArray arrayWithObjects:v68 count:2];
  id v54 = 0;
  size_t v41 = [v9 contentsOfDirectoryAtURL:v42 includingPropertiesForKeys:v11 options:0 error:&v54];
  id v12 = v54;

  if (!v12)
  {
    if (v40)
    {
      objc_msgSend(v41, "filteredArrayUsingPredicate:");
      id v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v39 = v41;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    unsigned __int8 v65 = sub_1000FBDB8;
    uint64_t v66 = sub_1000FBDC8;
    id v67 = 0;
    if (v7)
    {
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1001024DC;
      v53[3] = &unk_100251828;
      void v53[4] = buf;
      id v14 = [v39 sortedArrayUsingComparator:v53];
    }
    else
    {
      id v14 = v39;
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v14;
    id v15 = [obj countByEnumeratingWithState:&v49 objects:v63 count:16];
    id v12 = 0;
    if (!v15)
    {
LABEL_36:

      _Block_object_dispose(buf, 8);
      goto LABEL_37;
    }
    uint64_t v45 = *(void *)v50;
LABEL_12:
    id v46 = v15;
    id v16 = 0;
    id v17 = v12;
    while (1)
    {
      if (*(void *)v50 != v45) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v16);
      id v47 = 0;
      id v48 = 0;
      objc_msgSend(v18, "getResourceValue:forKey:error:", &v48, v10, &v47, v39);
      id v19 = v48;
      id v12 = v47;

      if (v12)
      {
        id v20 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)unsigned int v55 = 136315650;
          id v56 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
          __int16 v57 = 2112;
          id v58 = v18;
          __int16 v59 = 2112;
          id v60 = v12;
          id v21 = v20;
          id v22 = "%s Could not determine if [%@] is a directory or not. Err=%@";
          uint32_t v23 = 32;
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, v55, v23);
        }
      }
      else
      {
        if (![v19 BOOLValue])
        {
          id v25 = [v18 path];
          id v26 = +[NSData dataWithContentsOfFile:v25];

          id v27 = [v26 length];
          id v28 = v26;
          uint64_t v29 = (const uint8_t *)[v28 bytes];
          id v30 = (uint8_t *)malloc_type_malloc((size_t)v27, 0x100004077774924uLL);
          uint64_t v31 = v30;
          if (v30)
          {
            size_t v32 = compression_encode_buffer(v30, (size_t)v27, v29, (size_t)v27, 0, COMPRESSION_LZFSE);
            if (v32)
            {
              id v33 = +[NSData dataWithBytes:v31 length:v32];
              free(v31);
              id v34 = (id)v32;
            }
            else
            {
              id v36 = CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)unsigned int v55 = 136315650;
                id v56 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
                __int16 v57 = 2112;
                id v58 = v18;
                __int16 v59 = 2048;
                id v60 = v27;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s _compressFilesInDirectory: Compression failed for file %@ (%lu) - Sending Uncompressed", v55, 0x20u);
              }
              free(v31);
              id v33 = v28;
              id v34 = v27;
            }
            size_t v37 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)unsigned int v55 = 136315906;
              id v56 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
              __int16 v57 = 2112;
              id v58 = v18;
              __int16 v59 = 2048;
              id v60 = v27;
              __int16 v61 = 2048;
              id v62 = v34;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s _compressFilesInDirectory: File %@ compressed from %ld to %ld ", v55, 0x2Au);
            }
            id v38 = [v18 path];
            v43[2](v43, v38, v33, v27, v34, v32 != 0, 0);

            NSURLResourceKey v10 = NSURLIsDirectoryKey;
          }
          else
          {
            uint64_t v35 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)unsigned int v55 = 136315650;
              id v56 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
              __int16 v57 = 2112;
              id v58 = v18;
              __int16 v59 = 2048;
              id v60 = v27;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s _compressFilesInDirectory: Malloc failed for file %@ (%lu) - Discarding", v55, 0x20u);
            }
          }

          goto LABEL_34;
        }
        CFStringRef v24 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)unsigned int v55 = 136315394;
          id v56 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
          __int16 v57 = 2112;
          id v58 = v18;
          id v21 = v24;
          id v22 = "%s Found dir: %@. Skipping compression";
          uint32_t v23 = 22;
          goto LABEL_21;
        }
      }
LABEL_34:

      id v16 = (char *)v16 + 1;
      id v17 = v12;
      if (v46 == v16)
      {
        id v15 = [obj countByEnumeratingWithState:&v49 objects:v63 count:16];
        if (!v15) {
          goto LABEL_36;
        }
        goto LABEL_12;
      }
    }
  }
  id v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v42;
    *(_WORD *)&buf[22] = 2112;
    unsigned __int8 v65 = (uint64_t (*)(uint64_t, uint64_t))v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Cannot read contents of directory: %@, err: %@", buf, 0x20u);
  }
LABEL_37:
}

- (void)_compressFilesInDirectory:(id)a3 matchingPredicate:(id)a4 compressedFileAvailable:(id)a5
{
}

- (void)_processParallelRecordingCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
  id v6 = (void (**)(id, void *, void))a5;
  BOOL v7 = [a3 objectForKeyedSubscript:@"CSP2P_RemoteRecordingStart_Key"];
  id v8 = [v7 unsignedIntegerValue];

  if (v8 == (id)1)
  {
    CFStringRef v14 = @"CSP2P_RemoteRecordingStatus_Key";
    id v15 = &off_10025DF78;
    id v9 = &v15;
    NSURLResourceKey v10 = &v14;
  }
  else
  {
    CFStringRef v12 = @"CSP2P_RemoteRecordingStatus_Key";
    id v13 = &off_10025DF90;
    id v9 = &v13;
    NSURLResourceKey v10 = &v12;
  }
  id v11 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v10 count:1];
  v6[2](v6, v11, 0);
}

- (void)_processRemoteHeySiriCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
  id v6 = (void (**)(id, void *, void))a5;
  BOOL v7 = [a3 objectForKeyedSubscript:@"CSP2P_RemoteHeySiriEnable_Key"];
  unsigned int v8 = [v7 BOOLValue];

  id v9 = CSLogContextFacilityCoreSpeech;
  BOOL v10 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[CSP2PService _processRemoteHeySiriCommandWithRequest:fromSenderID:withReply:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s CSP2P_RemoteHeySiriCmd: ENABLE HeySiri: Not Implemented Yet: ", buf, 0xCu);
    }
    CFStringRef v16 = @"CSP2P_RemoteHeySiriStatus_Key";
    id v17 = &off_10025DF78;
    id v11 = &v17;
    CFStringRef v12 = &v16;
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[CSP2PService _processRemoteHeySiriCommandWithRequest:fromSenderID:withReply:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s CSP2P_RemoteHeySiriCmd: DISABLE HeySiri: Not Implemented Yet: ", buf, 0xCu);
    }
    CFStringRef v14 = @"CSP2P_RemoteHeySiriStatus_Key";
    id v15 = &off_10025DF90;
    id v11 = &v15;
    CFStringRef v12 = &v14;
  }
  id v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v12, 1, v14, v15, v16, v17);
  v6[2](v6, v13, 0);
}

- (void)sendGeckoSpeechLogsToCompanion
{
  if (self->_lastCommunicatedPeer && CSIsHorseman())
  {
    if ([(CSP2PService *)self isHeadlessDeviceDataCollectionModeEnabled])
    {
      dispatch_time_t v3 = dispatch_time(0, 100000000);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100102A88;
      block[3] = &unk_100253AE0;
      void block[4] = self;
      dispatch_after(v3, queue, block);
    }
  }
}

- (void)sendAcousticGradingDataToNearbyPeer
{
  if (self->_lastCommunicatedPeer && CSIsHorseman())
  {
    if ([(CSP2PService *)self isHeadlessDeviceDataCollectionModeEnabled])
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100102BEC;
      block[3] = &unk_100253AE0;
      void block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

- (void)sendVoiceProfileUpdatedMessageToNearbyPeerForLocale:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100102D50;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)sendVTNearMissGradingDataToCompanion
{
  if (self->_lastCommunicatedPeer && CSIsHorseman())
  {
    if ([(CSP2PService *)self isHeadlessDeviceDataCollectionModeEnabled])
    {
      dispatch_time_t v3 = dispatch_time(0, 100000000);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100102EE4;
      block[3] = &unk_100253AE0;
      void block[4] = self;
      dispatch_after(v3, queue, block);
    }
  }
}

- (void)sendCoreSpeechGradingDataToNearbyPeer
{
  if (self->_lastCommunicatedPeer && CSIsHorseman())
  {
    if ([(CSP2PService *)self isHeadlessDeviceDataCollectionModeEnabled])
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100103048;
      block[3] = &unk_100253AE0;
      void block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

- (void)processRemoteCommandWithPayload:(id)a3 fromPeer:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001031F8;
  void v15[3] = &unk_100252D38;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (CSP2PService)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSP2PService;
  v2 = [(CSP2PService *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.corespeech.p2psvc", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(6);
    sema = v2->_sema;
    v2->_sema = (OS_dispatch_semaphore *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1002A39F0 != -1) {
    dispatch_once(&qword_1002A39F0, &stru_100251800);
  }
  v2 = (void *)qword_1002A39F8;
  return v2;
}

@end