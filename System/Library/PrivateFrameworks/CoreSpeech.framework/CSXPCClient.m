@interface CSXPCClient
+ (id)createAudioStreamMessageWithRequest:(id)a3;
+ (id)createPrepareAudioStreamMessageWithRequest:(id)a3;
+ (id)createStartAudioStreamMessageWithOption:(id)a3;
+ (id)createStopAudioStreamMessageWithOption:(id)a3;
- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 dynamicAttribute:(unint64_t)a4 bundleID:(id)a5 error:(id *)a6;
- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4;
- (BOOL)fallbackDeactivateAudioSession:(unint64_t)a3 error:(id *)a4;
- (BOOL)isConnected;
- (BOOL)isNarrowBand;
- (BOOL)isRecording;
- (BOOL)playAlertSoundForType:(int64_t)a3;
- (BOOL)playRecordStartingAlertAndResetEndpointerWithAlertOverride:(int64_t)a3;
- (BOOL)prepareAudioProviderWithContext:(id)a3 clientType:(unint64_t)a4 error:(id *)a5;
- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5;
- (BOOL)prewarmAudioSessionWithError:(id *)a3;
- (BOOL)sendMessageAndReplySync:(id)a3 error:(id *)a4;
- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5;
- (BOOL)setCurrentContext:(id)a3 error:(id *)a4;
- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3;
- (CSAudioAlertProvidingDelegate)audioAlertProvidingDelegate;
- (CSAudioSessionProvidingDelegate)audioSessionProvidingDelegate;
- (CSAudioStream)audioStream;
- (CSAudioStreamProvidingDelegate)audioStreamProvidingDelegate;
- (CSXPCClient)initWithType:(unint64_t)a3;
- (CSXPCClientDelegate)delegate;
- (NSHashTable)audioSessionInfoObservers;
- (NSMutableSet)activationAssertions;
- (NSString)UUID;
- (OS_dispatch_queue)xpcClientQueue;
- (OS_dispatch_queue)xpcReplyQueue;
- (OS_xpc_object)xpcConnection;
- (float)averagePowerForChannel:(unint64_t)a3;
- (float)peakPowerForChannel:(unint64_t)a3;
- (id)_decodeError:(id)a3;
- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4;
- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4;
- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5;
- (id)audioChunkToEndFrom:(unint64_t)a3;
- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4;
- (id)audioDeviceInfo;
- (id)audioMetric;
- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5;
- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4;
- (id)playbackRoute;
- (id)recordDeviceInfo;
- (id)recordRoute;
- (id)recordSettings;
- (unint64_t)alertStartTime;
- (unint64_t)audioStreamId;
- (unint64_t)hostTimeFromSampleCount:(unint64_t)uint64;
- (unint64_t)sampleCountFromHostTime:(unint64_t)uint64;
- (unint64_t)xpcClientType;
- (unsigned)audioSessionIdForDeviceId:(id)a3;
- (void)_disconnect;
- (void)_handleAlertProvidingDelegateDidFinishAlertPlayback:(id)a3;
- (void)_handleAlertProvidingDelegateMessageBody:(id)a3;
- (void)_handleListenerDisconnectedError:(id)a3;
- (void)_handleListenerError:(id)a3;
- (void)_handleListenerEvent:(id)a3;
- (void)_handleListenerMessage:(id)a3;
- (void)_handleSessionInfoProvidingDelegateInterruptionNotification:(id)a3;
- (void)_handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:(id)a3;
- (void)_handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:(id)a3;
- (void)_handleSessionInfoProvidingDelegateMessageBody:(id)a3;
- (void)_handleSessionInfoProvidingDelegateRouteChangeNotification:(id)a3;
- (void)_handleSessionProvidingDelegateBeginInterruption:(id)a3;
- (void)_handleSessionProvidingDelegateBeginInterruptionWithContext:(id)a3;
- (void)_handleSessionProvidingDelegateDidChangeContext:(id)a3;
- (void)_handleSessionProvidingDelegateDidSetAudioSession:(id)a3;
- (void)_handleSessionProvidingDelegateEndInterruption:(id)a3;
- (void)_handleSessionProvidingDelegateMessageBody:(id)a3;
- (void)_handleSessionProvidingDelegateStreamHandleIdInvalidation:(id)a3;
- (void)_handleSessionProvidingDelegateWillSetAudioSession:(id)a3;
- (void)_handleStreamProvidingDelegateChunkAvailable:(id)a3;
- (void)_handleStreamProvidingDelegateChunkForTVAvailable:(id)a3;
- (void)_handleStreamProvidingDelegateDidStopUnexpectedly:(id)a3;
- (void)_handleStreamProvidingDelegateHardwareConfigChange:(id)a3;
- (void)_handleStreamProvidingDelegateMessageBody:(id)a3;
- (void)_sendMessageAsync:(id)a3 completion:(id)a4;
- (void)_sendXPCClientType;
- (void)acousticSLResultForContext:(id)a3 completion:(id)a4;
- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5;
- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5;
- (void)cancelAudioStreamHold:(id)a3;
- (void)configureAlertBehavior:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)enableMiniDucking:(BOOL)a3;
- (void)enableSmartRoutingConsideration:(BOOL)a3;
- (void)pingpong:(id)a3;
- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5;
- (void)registerObserver:(id)a3;
- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5;
- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4;
- (void)sendMessageAsync:(id)a3 completion:(id)a4;
- (void)setActivationAssertions:(id)a3;
- (void)setAnnounceCallsEnabled:(BOOL)a3 withStreamHandleID:(unint64_t)a4;
- (void)setAudioAlertDelegate:(id)a3;
- (void)setAudioAlertProvidingDelegate:(id)a3;
- (void)setAudioSessionDelegate:(id)a3;
- (void)setAudioSessionInfoObservers:(id)a3;
- (void)setAudioSessionProvidingDelegate:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamProvidingDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDuckOthersOption:(BOOL)a3;
- (void)setMeteringEnabled:(BOOL)a3;
- (void)setXpcClientQueue:(id)a3;
- (void)setXpcClientType:(unint64_t)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcReplyQueue:(id)a3;
- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
- (void)triggerInfoForContext:(id)a3 completion:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateMeters;
@end

@implementation CSXPCClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSessionInfoObservers, 0);
  objc_storeStrong((id *)&self->_activationAssertions, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_xpcClientQueue, 0);
  objc_storeStrong((id *)&self->_xpcReplyQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_audioAlertProvidingDelegate);
  objc_destroyWeak((id *)&self->_audioStreamProvidingDelegate);
  objc_destroyWeak((id *)&self->_audioSessionProvidingDelegate);
}

- (void)setXpcClientType:(unint64_t)a3
{
  self->_xpcClientType = a3;
}

- (unint64_t)xpcClientType
{
  return self->_xpcClientType;
}

- (void)setAudioSessionInfoObservers:(id)a3
{
}

- (NSHashTable)audioSessionInfoObservers
{
  return self->_audioSessionInfoObservers;
}

- (void)setActivationAssertions:(id)a3
{
}

- (NSMutableSet)activationAssertions
{
  return self->_activationAssertions;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setXpcClientQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcClientQueue
{
  return self->_xpcClientQueue;
}

- (void)setXpcReplyQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcReplyQueue
{
  return self->_xpcReplyQueue;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setDelegate:(id)a3
{
}

- (CSXPCClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSXPCClientDelegate *)WeakRetained;
}

- (void)setAudioAlertProvidingDelegate:(id)a3
{
}

- (CSAudioAlertProvidingDelegate)audioAlertProvidingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioAlertProvidingDelegate);
  return (CSAudioAlertProvidingDelegate *)WeakRetained;
}

- (void)setAudioStreamProvidingDelegate:(id)a3
{
}

- (CSAudioStreamProvidingDelegate)audioStreamProvidingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProvidingDelegate);
  return (CSAudioStreamProvidingDelegate *)WeakRetained;
}

- (void)setAudioSessionProvidingDelegate:(id)a3
{
}

- (CSAudioSessionProvidingDelegate)audioSessionProvidingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioSessionProvidingDelegate);
  return (CSAudioSessionProvidingDelegate *)WeakRetained;
}

- (void)_handleStreamProvidingDelegateHardwareConfigChange:(id)a3
{
  int64_t int64 = xpc_dictionary_get_int64(a3, "hardwareConfig");
  v5 = [(CSXPCClient *)self audioStream];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CSXPCClient *)self audioStream];
    [v7 audioStreamProvider:self didHardwareConfigurationChange:int64];
  }
}

- (void)_handleStreamProvidingDelegateChunkForTVAvailable:(id)a3
{
  v4 = xpc_dictionary_get_dictionary(a3, "chunk");
  if (v4)
  {
    id v9 = v4;
    id v5 = [objc_alloc((Class)CSAudioChunkForTV) initWithXPCObject:v4];
    char v6 = [(CSXPCClient *)self audioStream];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(CSXPCClient *)self audioStream];
      [v8 audioStreamProvider:self audioChunkForTVAvailable:v5];
    }
    v4 = v9;
  }
}

- (void)_handleStreamProvidingDelegateChunkAvailable:(id)a3
{
  v4 = xpc_dictionary_get_dictionary(a3, "chunk");
  if (v4)
  {
    id v9 = v4;
    id v5 = [objc_alloc((Class)CSAudioChunk) initWithXPCObject:v4];
    char v6 = [(CSXPCClient *)self audioStream];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(CSXPCClient *)self audioStream];
      [v8 audioStreamProvider:self audioBufferAvailable:v5];
    }
    v4 = v9;
  }
}

- (void)_handleStreamProvidingDelegateDidStopUnexpectedly:(id)a3
{
  int64_t int64 = xpc_dictionary_get_int64(a3, "stopReason");
  id v5 = [(CSXPCClient *)self audioStream];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CSXPCClient *)self audioStream];
    [v7 audioStreamProvider:self didStopStreamUnexpectedly:int64];
  }
}

- (void)_handleStreamProvidingDelegateMessageBody:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "type");
  switch(int64)
  {
    case 1:
      [(CSXPCClient *)self _handleStreamProvidingDelegateDidStopUnexpectedly:v4];
      break;
    case 2:
      [(CSXPCClient *)self _handleStreamProvidingDelegateChunkAvailable:v4];
      break;
    case 3:
      [(CSXPCClient *)self _handleStreamProvidingDelegateChunkForTVAvailable:v4];
      break;
    case 4:
      [(CSXPCClient *)self _handleStreamProvidingDelegateHardwareConfigChange:v4];
      break;
    default:
      int64_t v6 = int64;
      id v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315394;
        id v9 = "-[CSXPCClient _handleStreamProvidingDelegateMessageBody:]";
        __int16 v10 = 2050;
        int64_t v11 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Unexpected type : %{public}lld", (uint8_t *)&v8, 0x16u);
      }
      break;
  }
}

- (void)_handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:(id)a3
{
  id v4 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v6 = self->_audioSessionInfoObservers;
  id v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:", self, 0, (void)v12);
        }
        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:(id)a3
{
  id v4 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v6 = self->_audioSessionInfoObservers;
  id v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:", self, 0, (void)v12);
        }
        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_handleSessionInfoProvidingDelegateRouteChangeNotification:(id)a3
{
  id v4 = xpc_dictionary_get_dictionary(a3, "notificationInfo");
  if (v4)
  {
    id v5 = objc_alloc((Class)NSDictionary);
    int64_t v6 = objc_msgSend(v5, "_cs_initWithXPCObject:", v4);

    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSXPCClient _handleSessionInfoProvidingDelegateRouteChangeNotification:]";
      __int16 v22 = 2114;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Received notificationInfo %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSXPCClient _handleSessionInfoProvidingDelegateRouteChangeNotification:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Failed to parse notificationInfo from raw data", buf, 0xCu);
    }
    int64_t v6 = 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = self->_audioSessionInfoObservers;
  id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v14, "audioSessionInfoProvider:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:", self, v6, (void)v15);
        }
      }
      id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)_handleSessionInfoProvidingDelegateInterruptionNotification:(id)a3
{
  id v4 = xpc_dictionary_get_dictionary(a3, "notificationInfo");
  if (v4)
  {
    id v5 = objc_alloc((Class)NSDictionary);
    int64_t v6 = objc_msgSend(v5, "_cs_initWithXPCObject:", v4);

    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSXPCClient _handleSessionInfoProvidingDelegateInterruptionNotification:]";
      __int16 v22 = 2114;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Received notificationInfo %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSXPCClient _handleSessionInfoProvidingDelegateInterruptionNotification:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Failed to parse notificationInfo from raw data", buf, 0xCu);
    }
    int64_t v6 = 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = self->_audioSessionInfoObservers;
  id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v14, "audioSessionInfoProvider:didReceiveAudioSessionInterruptionNotificationWithUserInfo:", self, v6, (void)v15);
        }
      }
      id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)_handleSessionInfoProvidingDelegateMessageBody:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "type");
  int64_t v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMessageBody:]";
    __int16 v10 = 2050;
    int64_t v11 = int64;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s SessionInfoProvidingDelegate messageType : %{public}lld", (uint8_t *)&v8, 0x16u);
  }
  switch(int64)
  {
    case 1:
      [(CSXPCClient *)self _handleSessionInfoProvidingDelegateInterruptionNotification:v4];
      break;
    case 2:
      [(CSXPCClient *)self _handleSessionInfoProvidingDelegateRouteChangeNotification:v4];
      break;
    case 3:
      [(CSXPCClient *)self _handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:v4];
      break;
    case 4:
      [(CSXPCClient *)self _handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:v4];
      break;
    default:
      id v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315394;
        uint64_t v9 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMessageBody:]";
        __int16 v10 = 2050;
        int64_t v11 = int64;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Unexpected type : %{public}lld", (uint8_t *)&v8, 0x16u);
      }
      break;
  }
}

- (void)_handleSessionProvidingDelegateDidChangeContext:(id)a3
{
  BOOL v4 = xpc_dictionary_get_BOOL(a3, "didChangeContextFlag");
  id v5 = [(CSXPCClient *)self audioSessionProvidingDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CSXPCClient *)self audioSessionProvidingDelegate];
    [v7 audioSessionProvider:self didChangeContext:v4];
  }
}

- (void)_handleSessionProvidingDelegateStreamHandleIdInvalidation:(id)a3
{
  BOOL v4 = xpc_dictionary_get_BOOL(a3, "streamHandleIdInvalidationflag");
  id v5 = [(CSXPCClient *)self audioSessionProvidingDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CSXPCClient *)self audioSessionProvidingDelegate];
    [v7 audioSessionProvider:self providerInvalidated:v4];
  }
}

- (void)_handleSessionProvidingDelegateDidSetAudioSession:(id)a3
{
  BOOL v4 = xpc_dictionary_get_BOOL(a3, "didSetAudioSessionActive");
  id v5 = [(CSXPCClient *)self audioSessionProvidingDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CSXPCClient *)self audioSessionProvidingDelegate];
    [v7 audioSessionProvider:self didSetAudioSessionActive:v4];
  }
}

- (void)_handleSessionProvidingDelegateWillSetAudioSession:(id)a3
{
  BOOL v4 = xpc_dictionary_get_BOOL(a3, "willSetAudioSessionActive");
  id v5 = [(CSXPCClient *)self audioSessionProvidingDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CSXPCClient *)self audioSessionProvidingDelegate];
    [v7 audioSessionProvider:self willSetAudioSessionActive:v4];
  }
}

- (void)_handleSessionProvidingDelegateEndInterruption:(id)a3
{
  BOOL v4 = [(CSXPCClient *)self audioSessionProvidingDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CSXPCClient *)self audioSessionProvidingDelegate];
    [v6 audioSessionProviderEndInterruption:self];
  }
}

- (void)_handleSessionProvidingDelegateBeginInterruptionWithContext:(id)a3
{
  BOOL v4 = xpc_dictionary_get_dictionary(a3, "interruptionContext");
  if (v4)
  {
    id v5 = objc_alloc((Class)NSDictionary);
    id v6 = objc_msgSend(v5, "_cs_initWithXPCObject:", v4);

    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      long long v13 = "-[CSXPCClient _handleSessionProvidingDelegateBeginInterruptionWithContext:]";
      __int16 v14 = 2114;
      long long v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s context : %{public}@", (uint8_t *)&v12, 0x16u);
    }
    int v8 = [(CSXPCClient *)self audioSessionProvidingDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      __int16 v10 = [(CSXPCClient *)self audioSessionProvidingDelegate];
      [v10 audioSessionProviderBeginInterruption:self withContext:v6];
    }
  }
  else
  {
    int64_t v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      long long v13 = "-[CSXPCClient _handleSessionProvidingDelegateBeginInterruptionWithContext:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s invalid context", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_handleSessionProvidingDelegateBeginInterruption:(id)a3
{
  BOOL v4 = [(CSXPCClient *)self audioSessionProvidingDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CSXPCClient *)self audioSessionProvidingDelegate];
    [v6 audioSessionProviderBeginInterruption:self];
  }
}

- (void)_handleSessionProvidingDelegateMessageBody:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "type");
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    char v9 = "-[CSXPCClient _handleSessionProvidingDelegateMessageBody:]";
    __int16 v10 = 2050;
    int64_t v11 = int64;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s SessionProvidingDelegate messageType : %{public}lld", (uint8_t *)&v8, 0x16u);
  }
  switch(int64)
  {
    case 1:
      [(CSXPCClient *)self _handleSessionProvidingDelegateWillSetAudioSession:v4];
      break;
    case 2:
      [(CSXPCClient *)self _handleSessionProvidingDelegateBeginInterruption:v4];
      break;
    case 3:
      [(CSXPCClient *)self _handleSessionProvidingDelegateBeginInterruptionWithContext:v4];
      break;
    case 4:
      [(CSXPCClient *)self _handleSessionProvidingDelegateEndInterruption:v4];
      break;
    case 5:
      [(CSXPCClient *)self _handleSessionProvidingDelegateDidSetAudioSession:v4];
      break;
    case 10:
      [(CSXPCClient *)self _handleSessionProvidingDelegateStreamHandleIdInvalidation:v4];
      break;
    case 11:
      [(CSXPCClient *)self _handleSessionProvidingDelegateDidChangeContext:v4];
      break;
    default:
      id v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315394;
        char v9 = "-[CSXPCClient _handleSessionProvidingDelegateMessageBody:]";
        __int16 v10 = 2050;
        int64_t v11 = int64;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Unexpected type : %{public}lld", (uint8_t *)&v8, 0x16u);
      }
      break;
  }
}

- (void)_handleAlertProvidingDelegateDidFinishAlertPlayback:(id)a3
{
  xpc_object_t xdict = a3;
  int int64 = xpc_dictionary_get_int64(xdict, "didFinishAlertPlayback");
  if (xpc_dictionary_get_string(xdict, "errorDomain"))
  {
    string = xpc_dictionary_get_string(xdict, "errorDomain");
    int64_t v6 = xpc_dictionary_get_int64(xdict, "errorCode");
    id v7 = +[NSString stringWithUTF8String:string];
    int v8 = +[NSError errorWithDomain:v7 code:v6 userInfo:0];
  }
  else
  {
    int v8 = 0;
  }
  char v9 = [(CSXPCClient *)self audioAlertProvidingDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    int64_t v11 = [(CSXPCClient *)self audioAlertProvidingDelegate];
    [v11 audioAlertProvidingDidFinishAlertPlayback:self ofType:int64 error:v8];
  }
}

- (void)_handleAlertProvidingDelegateMessageBody:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "type");
  int64_t v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    char v9 = "-[CSXPCClient _handleAlertProvidingDelegateMessageBody:]";
    __int16 v10 = 2050;
    int64_t v11 = int64;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s AlertProvidingDelegate messageType : %{public}lld", (uint8_t *)&v8, 0x16u);
  }
  if (int64 == 1)
  {
    [(CSXPCClient *)self _handleAlertProvidingDelegateDidFinishAlertPlayback:v4];
  }
  else
  {
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      char v9 = "-[CSXPCClient _handleAlertProvidingDelegateMessageBody:]";
      __int16 v10 = 2050;
      int64_t v11 = int64;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Unexpected type : %{public}lld", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_handleListenerDisconnectedError:(id)a3
{
  id v4 = [(CSXPCClient *)self audioStream];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int64_t v6 = [(CSXPCClient *)self audioStream];
    [v6 audioStreamProvider:self didStopStreamUnexpectedly:1];
  }
  id v7 = [(CSXPCClient *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained CSXPCClient:self didDisconnect:1];
  }
}

- (void)_handleListenerError:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (!v4)
  {
    __int16 v10 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v12 = 136315394;
    long long v13 = "-[CSXPCClient _handleListenerError:]";
    __int16 v14 = 2050;
    long long v15 = 0;
    char v8 = "%s cannot handle error : error = %{public}p";
    goto LABEL_15;
  }
  if (v4 != &_xpc_error_connection_invalid && v4 != &_xpc_error_connection_interrupted)
  {
    string = xpc_dictionary_get_string(v4, _xpc_error_key_description);
    __int16 v10 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v12 = 136315394;
    long long v13 = "-[CSXPCClient _handleListenerError:]";
    __int16 v14 = 2082;
    long long v15 = string;
    char v8 = "%s connection error: %{public}s";
LABEL_15:
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, 0x16u);
    goto LABEL_13;
  }
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    long long v13 = "-[CSXPCClient _handleListenerError:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Listener connection disconnected", (uint8_t *)&v12, 0xCu);
  }
  [(CSXPCClient *)self _handleListenerDisconnectedError:v5];
LABEL_13:
}

- (void)_handleListenerMessage:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    int64_t int64 = xpc_dictionary_get_int64(v4, "type");
    id v7 = xpc_dictionary_get_dictionary(v5, "body");
    switch(int64)
    {
      case 3:
        [(CSXPCClient *)self _handleSessionProvidingDelegateMessageBody:v7];
        break;
      case 5:
        [(CSXPCClient *)self _handleStreamProvidingDelegateMessageBody:v7];
        break;
      case 7:
        [(CSXPCClient *)self _handleAlertProvidingDelegateMessageBody:v7];
        break;
      case 11:
        [(CSXPCClient *)self _handleSessionInfoProvidingDelegateMessageBody:v7];
        break;
      default:
        char v9 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          int v10 = 136315394;
          int64_t v11 = "-[CSXPCClient _handleListenerMessage:]";
          __int16 v12 = 2050;
          int64_t v13 = int64;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Unexpected message type : %{public}lld", (uint8_t *)&v10, 0x16u);
        }
        break;
    }
  }
  else
  {
    char v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      int64_t v11 = "-[CSXPCClient _handleListenerMessage:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Cannot handle nil message", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_handleListenerEvent:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    xpc_type_t type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      [(CSXPCClient *)self _handleListenerMessage:v5];
      goto LABEL_11;
    }
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      [(CSXPCClient *)self _handleListenerError:v5];
      goto LABEL_11;
    }
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      int64_t v13 = "-[CSXPCClient _handleListenerEvent:]";
      char v8 = "%s ignore unknown types of message ";
      char v9 = v7;
      uint32_t v10 = 12;
LABEL_8:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    int64_t v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      int64_t v13 = "-[CSXPCClient _handleListenerEvent:]";
      __int16 v14 = 2050;
      uint64_t v15 = 0;
      char v8 = "%s cannot handle event : event = %{public}p";
      char v9 = v11;
      uint32_t v10 = 22;
      goto LABEL_8;
    }
  }
LABEL_11:
}

- (BOOL)sendMessageAndReplySync:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100043514;
  v20 = sub_100043524;
  id v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004352C;
  v11[3] = &unk_100252408;
  id v8 = v6;
  id v12 = v8;
  int64_t v13 = self;
  __int16 v14 = &v22;
  uint64_t v15 = &v16;
  dispatch_async_and_wait(xpcClientQueue, v11);
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v9 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (id)_decodeError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    string = (void *)xpc_dictionary_get_string(v3, "resultErrorDomain");
    if (string)
    {
      int64_t int64 = xpc_dictionary_get_int64(v4, "resultErrorCode");
      id v7 = +[NSString stringWithUTF8String:string];
      string = +[NSError errorWithDomain:v7 code:int64 userInfo:0];
    }
  }
  else
  {
    string = 0;
  }

  return string;
}

- (void)_sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcClientQueue);
  if (v6 && (xpcConnection = self->_xpcConnection) != 0)
  {
    xpcReplyQueue = self->_xpcReplyQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004380C;
    v11[3] = &unk_10024F2D8;
    void v11[4] = self;
    id v12 = v7;
    xpc_connection_send_message_with_reply(xpcConnection, v6, xpcReplyQueue, v11);
  }
  else if (v7)
  {
    uint32_t v10 = +[NSError errorWithDomain:CSErrorDomain code:1252 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000439AC;
  block[3] = &unk_100253280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcClientQueue, block);
}

- (BOOL)fallbackDeactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  *(_OWORD *)keys = *(_OWORD *)off_10024F2C0;
  values[0] = xpc_int64_create(1);
  values[1] = xpc_int64_create(a3);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)off_100252D20;
  v14[0] = xpc_int64_create(17);
  id v8 = v7;
  v14[1] = v8;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)v15, v14, 2uLL);
  BOOL v10 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v9, a4, v14[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)

  return v10;
}

- (unint64_t)sampleCountFromHostTime:(unint64_t)uint64
{
  *(_OWORD *)keys = *(_OWORD *)off_10024F2B0;
  values[0] = xpc_int64_create(2);
  values[1] = xpc_uint64_create(uint64);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)uint64_t v24 = *(_OWORD *)off_100252D20;
  v23[0] = xpc_int64_create(14);
  id v6 = v5;
  v23[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v24, v23, 2uLL);
  id v8 = v7;
  if (!v7)
  {
    int64_t v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSXPCClient sampleCountFromHostTime:]";
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = uint64;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s No message for sampleCountFromHostTime request with hostTime %{public}llu", buf, 0x16u);
    }
    goto LABEL_7;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v20 = sub_100043514;
  id v21 = sub_100043524;
  id v22 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100043D9C;
  v15[3] = &unk_1002521E0;
  v15[4] = self;
  long long v17 = buf;
  id v16 = v7;
  unint64_t v18 = uint64;
  dispatch_async_and_wait(xpcClientQueue, v15);
  uint64_t v10 = *(void *)(*(void *)&buf[8] + 40);
  if (v10) {
    uint64_t int64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(*(void *)&buf[8] + 40), "replySampleCount");
  }

  _Block_object_dispose(buf, 8);
  if (!v10) {
LABEL_7:
  }
    uint64_t int64 = 0;

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)

  return uint64;
}

- (unint64_t)hostTimeFromSampleCount:(unint64_t)uint64
{
  *(_OWORD *)keys = *(_OWORD *)off_10024F2A0;
  values[0] = xpc_int64_create(1);
  values[1] = xpc_uint64_create(uint64);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)uint64_t v24 = *(_OWORD *)off_100252D20;
  v23[0] = xpc_int64_create(14);
  id v6 = v5;
  v23[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v24, v23, 2uLL);
  id v8 = v7;
  if (!v7)
  {
    int64_t v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSXPCClient hostTimeFromSampleCount:]";
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = uint64;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s No message for hostTimeFromSampleCount request with sampleCount %{public}llu", buf, 0x16u);
    }
    goto LABEL_7;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v20 = sub_100043514;
  id v21 = sub_100043524;
  id v22 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100044190;
  v15[3] = &unk_1002521E0;
  v15[4] = self;
  long long v17 = buf;
  id v16 = v7;
  unint64_t v18 = uint64;
  dispatch_async_and_wait(xpcClientQueue, v15);
  uint64_t v10 = *(void *)(*(void *)&buf[8] + 40);
  if (v10) {
    uint64_t int64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(*(void *)&buf[8] + 40), "replyHostTime");
  }

  _Block_object_dispose(buf, 8);
  if (!v10) {
LABEL_7:
  }
    uint64_t int64 = 0;

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)

  return uint64;
}

- (unsigned)audioSessionIdForDeviceId:(id)a3
{
  id v4 = a3;
  keys = "type";
  xpc_object_t values = xpc_int64_create(1);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  if (v4) {
    xpc_dictionary_set_string(v5, "deviceID", (const char *)[v4 UTF8String]);
  }
  *(_OWORD *)v26 = *(_OWORD *)off_100252D20;
  v25[0] = xpc_int64_create(10);
  id v6 = v5;
  v25[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v26, v25, 2uLL);
  id v8 = v7;
  if (!v7)
  {
    int64_t v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSXPCClient audioSessionIdForDeviceId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s No message!!", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_11;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100043514;
  v23 = sub_100043524;
  id v24 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000445E0;
  block[3] = &unk_1002523B8;
  block[4] = self;
  p_long long buf = &buf;
  id v16 = v7;
  dispatch_async_and_wait(xpcClientQueue, block);
  uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
  if (v10)
  {
    LODWORD(self) = xpc_dictionary_get_uint64(*(xpc_object_t *)(*((void *)&buf + 1) + 40), "sessionID");
  }
  else
  {
    id v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)unint64_t v18 = 136315138;
      v19 = "-[CSXPCClient audioSessionIdForDeviceId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s NO reply!!!", v18, 0xCu);
    }
  }

  _Block_object_dispose(&buf, 8);
  if (!v10) {
LABEL_11:
  }
    LODWORD(self) = 0;

  for (uint64_t i = 1; i != -1; --i)
  return self;
}

- (void)unregisterObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_audioSessionInfoObservers, "removeObject:");
  }
}

- (void)registerObserver:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_audioSessionInfoObservers, "addObject:");
  }
}

- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5
{
  xpc_object_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    xpc_object_t v7 = "-[CSXPCClient attachTandemStream:toPrimaryStream:completion:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }
}

- (void)setAnnounceCallsEnabled:(BOOL)a3 withStreamHandleID:(unint64_t)a4
{
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSXPCClient setAnnounceCallsEnabled:withStreamHandleID:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)isRecording
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    int v5 = "-[CSXPCClient isRecording]";
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (void)cancelAudioStreamHold:(id)a3
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    int v5 = "-[CSXPCClient cancelAudioStreamHold:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v4, 0xCu);
  }
}

- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4
{
  int v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    xpc_object_t v7 = "-[CSXPCClient holdAudioStreamWithDescription:option:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4
{
  int v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSXPCClient saveRecordingBufferToEndFrom:toURL:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v5, 0xCu);
  }
}

- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    xpc_object_t v7 = "-[CSXPCClient saveRecordingBufferFrom:to:toURL:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }
}

- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4
{
  int v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    xpc_object_t v7 = "-[CSXPCClient audioChunkToEndFrom:channelIdx:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (id)audioChunkToEndFrom:(unint64_t)a3
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSXPCClient audioChunkToEndFrom:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSXPCClient audioChunkFrom:to:channelIdx:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4
{
  int v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    int v7 = "-[CSXPCClient audioChunkFrom:to:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (unint64_t)audioStreamId
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    int v5 = "-[CSXPCClient audioStreamId]";
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (id)playbackRoute
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(11);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)v23 = *(_OWORD *)off_100252D20;
  v22[0] = xpc_int64_create(4);
  id v4 = v3;
  v22[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100043514;
  v20 = sub_100043524;
  id v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000450D4;
  block[3] = &unk_1002523B8;
  id v7 = v5;
  id v13 = v7;
  __int16 v14 = self;
  uint64_t v15 = &v16;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (void *)v17[5];
  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_get_value(v8, "playbackRoute");

    if (v9)
    {
      xpc_object_t v9 = +[NSString stringWithUTF8String:xpc_dictionary_get_string((xpc_object_t)v17[5], "playbackRoute")];
    }
  }
  else
  {
    xpc_object_t v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  for (uint64_t i = 1; i != -1; --i)

  return v9;
}

- (BOOL)isNarrowBand
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(10);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)v23 = *(_OWORD *)off_100252D20;
  v22[0] = xpc_int64_create(4);
  id v4 = v3;
  v22[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100043514;
  v20 = sub_100043524;
  id v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045330;
  block[3] = &unk_1002523B8;
  id v7 = v5;
  id v13 = v7;
  __int16 v14 = self;
  uint64_t v15 = &v16;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (void *)v17[5];
  if (v8) {
    BOOL v9 = xpc_dictionary_get_BOOL(v8, "result");
  }
  else {
    BOOL v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  for (uint64_t i = 1; i != -1; --i)

  return v9;
}

- (id)recordSettings
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(9);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)char v25 = *(_OWORD *)off_100252D20;
  v24[0] = xpc_int64_create(4);
  id v4 = v3;
  v24[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v25, v24, 2uLL);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100043514;
  id v22 = sub_100043524;
  id v23 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000455F4;
  block[3] = &unk_1002523B8;
  id v7 = v5;
  id v15 = v7;
  uint64_t v16 = self;
  long long v17 = &v18;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (void *)v19[5];
  if (!v8) {
    goto LABEL_5;
  }
  BOOL v9 = xpc_dictionary_get_value(v8, "recordSettings");

  if (v9)
  {
    uint64_t v10 = xpc_dictionary_get_value((xpc_object_t)v19[5], "recordSettings");
    if (v10)
    {
      id v11 = objc_alloc((Class)NSDictionary);
      BOOL v9 = objc_msgSend(v11, "_cs_initWithXPCObject:", v10);

      goto LABEL_6;
    }
LABEL_5:
    BOOL v9 = 0;
  }
LABEL_6:

  _Block_object_dispose(&v18, 8);
  for (uint64_t i = 1; i != -1; --i)

  return v9;
}

- (id)audioDeviceInfo
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(12);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)id v22 = *(_OWORD *)off_100252D20;
  v21[0] = xpc_int64_create(4);
  id v4 = v3;
  v21[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v22, v21, 2uLL);
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100043514;
  v19 = sub_100043524;
  id v20 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004582C;
  block[3] = &unk_1002523B8;
  id v12 = v5;
  id v13 = self;
  __int16 v14 = &v15;
  id v7 = v5;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (id)v16[5];

  uint64_t v9 = 1;
  _Block_object_dispose(&v15, 8);

  do
  while (v9 != -1);

  return v8;
}

- (id)recordDeviceInfo
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(8);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)id v24 = *(_OWORD *)off_100252D20;
  v23[0] = xpc_int64_create(4);
  id v4 = v3;
  v23[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v24, v23, 2uLL);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_100043514;
  id v21 = sub_100043524;
  id v22 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045B50;
  block[3] = &unk_1002523B8;
  id v7 = v5;
  id v14 = v7;
  uint64_t v15 = self;
  uint64_t v16 = &v17;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (void *)v18[5];
  if (!v8) {
    goto LABEL_5;
  }
  xpc_dictionary_get_value(v8, "recordDeviceInfo");
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    uint64_t v10 = xpc_dictionary_get_value((xpc_object_t)v18[5], "recordDeviceInfo");
    if (v10)
    {
      id v9 = [objc_alloc((Class)CSFAudioRecordDeviceInfo) initWithXPCObject:v10];

      goto LABEL_6;
    }
LABEL_5:
    id v9 = 0;
  }
LABEL_6:

  _Block_object_dispose(&v17, 8);
  for (uint64_t i = 1; i != -1; --i)

  return v9;
}

- (id)recordRoute
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(7);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)id v23 = *(_OWORD *)off_100252D20;
  v22[0] = xpc_int64_create(4);
  id v4 = v3;
  v22[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100043514;
  id v20 = sub_100043524;
  id v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045DFC;
  block[3] = &unk_1002523B8;
  id v7 = v5;
  id v13 = v7;
  id v14 = self;
  uint64_t v15 = &v16;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (void *)v17[5];
  if (v8)
  {
    id v9 = xpc_dictionary_get_value(v8, "recordRoute");

    if (v9)
    {
      id v9 = +[NSString stringWithUTF8String:xpc_dictionary_get_string((xpc_object_t)v17[5], "recordRoute")];
    }
  }
  else
  {
    id v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  for (uint64_t i = 1; i != -1; --i)

  return v9;
}

- (void)triggerInfoForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10004648C;
  v31[3] = &unk_10024F270;
  id v7 = a4;
  id v32 = v7;
  id v8 = objc_retainBlock(v31);
  *(_OWORD *)keys = *(_OWORD *)off_10024F290;
  values[0] = xpc_int64_create(100);
  values[1] = [v6 xpcObject];
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v43 = *(_OWORD *)off_100252D20;
  v42[0] = xpc_int64_create(4);
  id v10 = v9;
  v42[1] = v10;
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)v43, v42, 2uLL);
  id v12 = CSLogContextFacilityCoreSpeech;
  if (v11)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSXPCClient triggerInfoForContext:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Sending VoiceTriggerInfo request", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v38 = 0x3032000000;
    v39 = sub_100043514;
    v40 = sub_100043524;
    id v41 = 0;
    xpcClientQueue = self->_xpcClientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000464A4;
    block[3] = &unk_1002523B8;
    void block[4] = self;
    p_long long buf = &buf;
    id v29 = v11;
    dispatch_async_and_wait(xpcClientQueue, block);
    id v14 = *(void **)(*((void *)&buf + 1) + 40);
    if (!v14 || !xpc_dictionary_get_BOOL(v14, "result"))
    {
      id v22 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v33 = 136315138;
        v34 = "-[CSXPCClient triggerInfoForContext:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Failed to get VoiceTriggerInfo request", v33, 0xCu);
      }
      ((void (*)(void *, void, void))v8[2])(v8, 0, 0);
      goto LABEL_27;
    }
    v27 = xpc_dictionary_get_dictionary(*(xpc_object_t *)(*((void *)&buf + 1) + 40), "voiceTriggerInfo");
    uint64_t v15 = xpc_dictionary_get_dictionary(*(xpc_object_t *)(*((void *)&buf + 1) + 40), "rtsTriggerInfo");
    if (v27)
    {
      id v16 = objc_alloc((Class)NSDictionary);
      uint64_t v17 = objc_msgSend(v16, "_cs_initWithXPCObject:", v27);

      uint64_t v18 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v33 = 136315394;
        v34 = "-[CSXPCClient triggerInfoForContext:completion:]";
        __int16 v35 = 2114;
        v36 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Received VoiceTriggerInfo %{public}@", v33, 0x16u);
      }
      if (v15)
      {
LABEL_10:
        id v19 = objc_alloc((Class)NSDictionary);
        id v20 = objc_msgSend(v19, "_cs_initWithXPCObject:", v15);

        id v21 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v33 = 136315394;
          v34 = "-[CSXPCClient triggerInfoForContext:completion:]";
          __int16 v35 = 2114;
          v36 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Received rtsTriggerInfo %{public}@", v33, 0x16u);
        }
LABEL_26:
        ((void (*)(void *, void *, void *))v8[2])(v8, v17, v20);

LABEL_27:
        _Block_object_dispose(&buf, 8);

        goto LABEL_28;
      }
    }
    else
    {
      if ([v6 isVoiceTriggered])
      {
        id v23 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v33 = 136315138;
          v34 = "-[CSXPCClient triggerInfoForContext:completion:]";
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Failed to parse VoiceTriggerInfo from raw data", v33, 0xCu);
        }
      }
      uint64_t v17 = 0;
      if (v15) {
        goto LABEL_10;
      }
    }
    if ([v6 isRTSTriggered])
    {
      id v24 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v33 = 136315138;
        v34 = "-[CSXPCClient triggerInfoForContext:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Failed to parse rtsTriggerInfo from raw data", v33, 0xCu);
      }
    }
    id v20 = 0;
    goto LABEL_26;
  }
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSXPCClient triggerInfoForContext:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Message not valid", (uint8_t *)&buf, 0xCu);
  }
  ((void (*)(void *, void, void))v8[2])(v8, 0, 0);
LABEL_28:

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)
}

- (void)acousticSLResultForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000467FC;
  v20[3] = &unk_10024F248;
  id v7 = a4;
  id v21 = v7;
  id v8 = objc_retainBlock(v20);
  long long keys = *(_OWORD *)off_10024F290;
  values[0] = xpc_int64_create(101);
  values[1] = [v6 xpcObject];
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)&keys, values, 2uLL);
  long long v25 = *(_OWORD *)off_100252D20;
  v24[0] = xpc_int64_create(4);
  id v10 = v9;
  v24[1] = v10;
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)&v25, v24, 2uLL);
  id v12 = CSLogContextFacilityCoreSpeech;
  if (v11)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v23 = "-[CSXPCClient acousticSLResultForContext:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Sending AcousticSLResult request", buf, 0xCu);
    }
    xpcClientQueue = self->_xpcClientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100046814;
    block[3] = &unk_100252D38;
    void block[4] = self;
    id v17 = v11;
    id v19 = v8;
    id v18 = v6;
    dispatch_async(xpcClientQueue, block);
  }
  else
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v23 = "-[CSXPCClient acousticSLResultForContext:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Message not valid", buf, 0xCu);
    }
    ((void (*)(void *, void))v8[2])(v8, 0);
  }

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)
}

- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100046CD0;
  v12[3] = &unk_100253100;
  id v9 = a5;
  id v13 = v9;
  id v10 = objc_retainBlock(v12);
  if (a3)
  {
    xpc_object_t v11 = +[CSXPCClient createStopAudioStreamMessageWithOption:v8];
    [(CSXPCClient *)self sendMessageAsync:v11 completion:v10];
  }
  else
  {
    xpc_object_t v11 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    ((void (*)(void *, void, void *))v10[2])(v10, 0, v11);
  }
}

- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100046E1C;
  v12[3] = &unk_100253100;
  id v9 = a5;
  id v13 = v9;
  id v10 = objc_retainBlock(v12);
  if (a3 && v8)
  {
    xpc_object_t v11 = +[CSXPCClient createStartAudioStreamMessageWithOption:v8];
    [(CSXPCClient *)self sendMessageAsync:v11 completion:v10];
  }
  else
  {
    xpc_object_t v11 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    ((void (*)(void *, void, void *))v10[2])(v10, 0, v11);
  }
}

- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3
{
  long long keys = "type";
  xpc_object_t values = xpc_int64_create(102);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)id v12 = *(_OWORD *)off_100252D20;
  v11[0] = xpc_int64_create(4);
  id v6 = v5;
  v11[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v12, v11, 2uLL);
  BOOL v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, a3, v11[0]);

  for (uint64_t i = 1; i != -1; --i)
  return v8;
}

- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100047190;
  v16[3] = &unk_100253100;
  id v10 = a5;
  id v17 = v10;
  xpc_object_t v11 = objc_retainBlock(v16);
  id v12 = CSLogContextFacilityCoreSpeech;
  if (v8 && v9)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      id v14 = [v8 name];
      *(_DWORD *)long long buf = 136315394;
      id v19 = "-[CSXPCClient prepareAudioStream:request:completion:]";
      __int16 v20 = 2114;
      id v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s PrepareAudioStream %{public}@", buf, 0x16u);
    }
    uint64_t v15 = +[CSXPCClient createPrepareAudioStreamMessageWithRequest:v9];
    [(CSXPCClient *)self sendMessageAsync:v15 completion:v11];
  }
  else
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v19 = "-[CSXPCClient prepareAudioStream:request:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Invalid message: stream is nil or request is nil", buf, 0xCu);
    }
    uint64_t v15 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    ((void (*)(void *, void, void *))v11[2])(v11, 0, v15);
  }
}

- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  xpc_object_t v11 = CSLogContextFacilityCoreSpeech;
  if (!v8 || !v9)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSXPCClient prepareAudioStreamSync:request:error:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Invalid message: stream is nil or request is nil", buf, 0xCu);
      if (a5) {
        goto LABEL_10;
      }
    }
    else if (a5)
    {
LABEL_10:
      +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
      BOOL v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    BOOL v20 = 0;
    goto LABEL_20;
  }
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = [v8 name];
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSXPCClient prepareAudioStreamSync:request:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s PrepareAudioStream %{public}@", buf, 0x16u);
  }
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F210;
  values[0] = xpc_int64_create(3);
  values[1] = [v10 xpcObject];
  xpc_object_t v14 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v45 = *(_OWORD *)off_100252D20;
  v44[0] = xpc_int64_create(4);
  id v15 = v14;
  v44[1] = v15;
  xpc_object_t v16 = xpc_dictionary_create((const char *const *)v45, v44, 2uLL);
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v41 = sub_100043514;
  v42 = sub_100043524;
  id v43 = 0;
  uint64_t v34 = 0;
  __int16 v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_100043514;
  uint64_t v38 = sub_100043524;
  id v39 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  v28 = sub_1000475A8;
  id v29 = &unk_100252408;
  id v18 = v16;
  id v30 = v18;
  v31 = self;
  id v32 = buf;
  v33 = &v34;
  dispatch_async_and_wait(xpcClientQueue, &v26);
  id v19 = *(void **)(*(void *)&buf[8] + 40);
  if (!v19)
  {
    BOOL v20 = 0;
    if (!a5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  BOOL v20 = xpc_dictionary_get_BOOL(v19, "result");
  uint64_t v21 = -[CSXPCClient _decodeError:](self, "_decodeError:", *(void *)(*(void *)&buf[8] + 40), v26, v27, v28, v29);
  id v22 = (void *)v35[5];
  v35[5] = v21;

  if (a5) {
LABEL_12:
  }
    *a5 = (id) v35[5];
LABEL_13:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(buf, 8);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)

LABEL_20:
  return v20;
}

- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  xpc_object_t v23[2] = sub_100047920;
  v23[3] = &unk_10024F1C8;
  id v10 = a5;
  id v24 = v10;
  xpc_object_t v11 = objc_retainBlock(v23);
  if (v8)
  {
    uint64_t v12 = +[CSXPCClient createPrepareAudioStreamMessageWithRequest:v8];
    if (v12)
    {
      id v13 = (void *)v12;
      xpc_object_t v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        v26 = "-[CSXPCClient audioStreamWithRequest:streamName:completion:]";
        __int16 v27 = 2114;
        id v28 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s audioStreamWithRequest for stream %{public}@", buf, 0x16u);
      }
      xpcClientQueue = self->_xpcClientQueue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100047938;
      v18[3] = &unk_10024FF18;
      uint8_t v18[4] = self;
      id v16 = v13;
      id v19 = v16;
      id v20 = v9;
      id v21 = v8;
      id v22 = v11;
      dispatch_async(xpcClientQueue, v18);
    }
    else
    {
      id v17 = +[NSError errorWithDomain:CSErrorDomain code:1253 userInfo:0];
      ((void (*)(void *, void, void *))v11[2])(v11, 0, v17);

      id v16 = 0;
    }
  }
  else
  {
    id v16 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    ((void (*)(void *, void, id))v11[2])(v11, 0, v16);
  }
}

- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    *(_OWORD *)long long keys = *(_OWORD *)off_10024F210;
    values[0] = xpc_int64_create(2);
    values[1] = [v8 xpcObject];
    xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    *(_OWORD *)v48 = *(_OWORD *)off_100252D20;
    v47[0] = xpc_int64_create(4);
    id v11 = v10;
    v47[1] = v11;
    xpc_object_t v12 = xpc_dictionary_create((const char *const *)v48, v47, 2uLL);
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = sub_100043514;
    id v41 = sub_100043524;
    id v42 = 0;
    if (v12)
    {
      id v13 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[CSXPCClient audioStreamWithRequest:streamName:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s audioStreamWithRequest for stream %{public}@", buf, 0x16u);
      }
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v44 = sub_100043514;
      v45 = sub_100043524;
      id v46 = 0;
      xpcClientQueue = self->_xpcClientQueue;
      id v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472;
      v31 = sub_10004802C;
      id v32 = &unk_100252408;
      v33 = self;
      __int16 v35 = buf;
      id v34 = v12;
      uint64_t v36 = &v37;
      dispatch_async_and_wait(xpcClientQueue, &v29);
      id v15 = *(void **)(*(void *)&buf[8] + 40);
      if (v15
        && (BOOL v16 = xpc_dictionary_get_BOOL(v15, "result"),
            -[CSXPCClient _decodeError:](self, "_decodeError:", *(void *)(*(void *)&buf[8] + 40), v29, v30, v31, v32, v33), uint64_t v17 = objc_claimAutoreleasedReturnValue(), v18 = (void *)v38[5], v38[5] = v17, v18, v16))
      {
        id v19 = [objc_alloc((Class)CSAudioStream) initWithAudioStreamProvider:self streamName:v9 streamRequest:v8];
        audioStream = self->_audioStream;
        p_audioStream = (id *)&self->_audioStream;
        id *p_audioStream = v19;

        id v22 = *p_audioStream;
      }
      else
      {
        id v22 = 0;
      }

      _Block_object_dispose(buf, 8);
      if (!a5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v24 = +[NSError errorWithDomain:CSErrorDomain code:1253 userInfo:0];
      long long v25 = (void *)v38[5];
      v38[5] = v24;

      id v22 = 0;
      if (!a5) {
        goto LABEL_15;
      }
    }
    *a5 = (id) v38[5];
LABEL_15:
    id v23 = v22;
    _Block_object_dispose(&v37, 8);

    for (uint64_t i = 1; i != -1; --i)
    for (uint64_t j = 1; j != -1; --j)

    goto LABEL_19;
  }
  if (*a5)
  {
    +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    id v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = 0;
  }
LABEL_19:

  return v23;
}

- (BOOL)setCurrentContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    *(_OWORD *)long long keys = *(_OWORD *)off_10024F290;
    values[0] = xpc_int64_create(1);
    values[1] = [v6 xpcObject];
    xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    *(_OWORD *)v40 = *(_OWORD *)off_100252D20;
    v39[0] = xpc_int64_create(4);
    id v8 = v7;
    v39[1] = v8;
    xpc_object_t v9 = xpc_dictionary_create((const char *const *)v40, v39, 2uLL);
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = sub_100043514;
    uint64_t v37 = sub_100043524;
    id v38 = 0;
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = sub_100043514;
    v31 = sub_100043524;
    id v32 = 0;
    xpcClientQueue = self->_xpcClientQueue;
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    id v21 = sub_100048408;
    id v22 = &unk_100252408;
    id v11 = v9;
    id v23 = v11;
    uint64_t v24 = self;
    long long v25 = &v33;
    v26 = &v27;
    dispatch_async_and_wait(xpcClientQueue, &v19);
    xpc_object_t v12 = (void *)v34[5];
    if (v12)
    {
      BOOL v13 = xpc_dictionary_get_BOOL(v12, "result");
      uint64_t v14 = -[CSXPCClient _decodeError:](self, "_decodeError:", v34[5], v19, v20, v21, v22);
      id v15 = (void *)v28[5];
      v28[5] = v14;

      if (!a4)
      {
LABEL_9:

        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&v33, 8);

        for (uint64_t i = 1; i != -1; --i)
        for (uint64_t j = 1; j != -1; --j)

        goto LABEL_13;
      }
    }
    else
    {
      BOOL v13 = 0;
      if (!a4) {
        goto LABEL_9;
      }
    }
    *a4 = (id) v28[5];
    goto LABEL_9;
  }
  if (a4)
  {
    +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    BOOL v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_13:

  return v13;
}

- (id)audioMetric
{
  long long keys = "type";
  xpc_object_t values = xpc_int64_create(1);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)id v22 = *(_OWORD *)off_100252D20;
  v21[0] = xpc_int64_create(9);
  id v4 = v3;
  v21[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v22, v21, 2uLL);
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100043514;
  id v19 = sub_100043524;
  id v20 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000486A4;
  block[3] = &unk_1002523B8;
  id v12 = v5;
  BOOL v13 = self;
  uint64_t v14 = &v15;
  id v7 = v5;
  dispatch_async_and_wait(xpcClientQueue, block);
  id v8 = (id)v16[5];

  uint64_t v9 = 1;
  _Block_object_dispose(&v15, 8);

  do
  while (v9 != -1);

  return v8;
}

- (float)averagePowerForChannel:(unint64_t)a3
{
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F1B0;
  values[0] = xpc_int64_create(4);
  values[1] = xpc_uint64_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v23 = *(_OWORD *)off_100252D20;
  uint64_t v6 = 1;
  v22[0] = xpc_int64_create(8);
  id v7 = v5;
  v22[1] = v7;
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  uint64_t v18 = 0;
  id v19 = (float *)&v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048B5C;
  block[3] = &unk_1002523B8;
  id v15 = v8;
  BOOL v16 = self;
  uint64_t v17 = &v18;
  id v10 = v8;
  dispatch_async_and_wait(xpcClientQueue, block);
  float v11 = v19[6];

  _Block_object_dispose(&v18, 8);
  do

  while (v6 != -1);
  for (uint64_t i = 1; i != -1; --i)

  return v11;
}

- (float)peakPowerForChannel:(unint64_t)a3
{
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F1B0;
  values[0] = xpc_int64_create(3);
  values[1] = xpc_uint64_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v23 = *(_OWORD *)off_100252D20;
  uint64_t v6 = 1;
  v22[0] = xpc_int64_create(8);
  id v7 = v5;
  v22[1] = v7;
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  uint64_t v18 = 0;
  id v19 = (float *)&v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048E9C;
  block[3] = &unk_1002523B8;
  id v15 = v8;
  BOOL v16 = self;
  uint64_t v17 = &v18;
  id v10 = v8;
  dispatch_async_and_wait(xpcClientQueue, block);
  float v11 = v19[6];

  _Block_object_dispose(&v18, 8);
  do

  while (v6 != -1);
  for (uint64_t i = 1; i != -1; --i)

  return v11;
}

- (void)updateMeters
{
  long long keys = "type";
  xpc_object_t values = xpc_int64_create(2);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)xpc_object_t v8 = *(_OWORD *)off_100252D20;
  uint64_t v4 = 1;
  v7[0] = xpc_int64_create(8);
  id v5 = v3;
  v7[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v8, v7, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v6, 0, v7[0]);

  do
  while (v4 != -1);
}

- (void)setMeteringEnabled:(BOOL)a3
{
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F1A0;
  values[0] = xpc_int64_create(1);
  values[1] = xpc_BOOL_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)float v11 = *(_OWORD *)off_100252D20;
  uint64_t v6 = 1;
  v10[0] = xpc_int64_create(8);
  id v7 = v5;
  v10[1] = v7;
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v8, 0, v10[0]);

  do
  while (v6 != -1);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)configureAlertBehavior:(id)a3
{
  id v4 = a3;
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F190;
  values[0] = xpc_int64_create(5);
  objc_msgSend(v4, "_cs_xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)float v11 = *(_OWORD *)off_100252D20;
  v10[0] = xpc_int64_create(6);
  id v6 = v5;
  v10[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0, v10[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)
}

- (unint64_t)alertStartTime
{
  long long keys = "type";
  xpc_object_t values = xpc_int64_create(4);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)off_100252D20;
  v19[0] = xpc_int64_create(6);
  id v4 = v3;
  v19[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)v20, v19, 2uLL);
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049520;
  block[3] = &unk_1002523B8;
  id v12 = v5;
  BOOL v13 = self;
  uint64_t v14 = &v15;
  id v7 = v5;
  dispatch_async_and_wait(xpcClientQueue, block);
  unint64_t v8 = v16[3];

  uint64_t v9 = 1;
  _Block_object_dispose(&v15, 8);
  do

  while (v9 != -1);
  return v8;
}

- (BOOL)playRecordStartingAlertAndResetEndpointerWithAlertOverride:(int64_t)a3
{
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F180;
  values[0] = xpc_int64_create(3);
  values[1] = xpc_int64_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)BOOL v13 = *(_OWORD *)off_100252D20;
  v12[0] = xpc_int64_create(6);
  id v6 = v5;
  v12[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v13, v12, 2uLL);
  BOOL v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, 0, v12[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)

  return v8;
}

- (BOOL)playAlertSoundForType:(int64_t)a3
{
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F170;
  values[0] = xpc_int64_create(2);
  values[1] = xpc_int64_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)BOOL v13 = *(_OWORD *)off_100252D20;
  v12[0] = xpc_int64_create(6);
  id v6 = v5;
  v12[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v13, v12, 2uLL);
  BOOL v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, 0, v12[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)

  return v8;
}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  id v8 = a3;
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F158;
  id v22 = "forceSetAlert";
  values[0] = xpc_int64_create(1);
  values[1] = xpc_int64_create(a4);
  xpc_object_t values[2] = xpc_BOOL_create(a5);
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  if (v8)
  {
    id v10 = [v8 path];

    if (v10)
    {
      id v11 = [v8 path];
      xpc_dictionary_set_string(v9, "soundPath", (const char *)[v11 UTF8String]);
    }
  }
  *(_OWORD *)id v19 = *(_OWORD *)off_100252D20;
  v18[0] = xpc_int64_create(6);
  id v12 = v9;
  v18[1] = v12;
  xpc_object_t v13 = xpc_dictionary_create((const char *const *)v19, v18, 2uLL);
  BOOL v14 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v13, 0, v18[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 2; j != -1; --j)

  return v14;
}

- (void)setAudioAlertDelegate:(id)a3
{
}

- (void)setAudioSessionDelegate:(id)a3
{
}

- (void)enableMiniDucking:(BOOL)a3
{
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F148;
  values[0] = xpc_int64_create(6);
  values[1] = xpc_BOOL_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_100252D20;
  v10[0] = xpc_int64_create(2);
  id v6 = v5;
  v10[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0, v10[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)
}

- (void)enableSmartRoutingConsideration:(BOOL)a3
{
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F138;
  values[0] = xpc_int64_create(9);
  values[1] = xpc_BOOL_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_100252D20;
  v10[0] = xpc_int64_create(2);
  id v6 = v5;
  v10[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0, v10[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)
}

- (void)setDuckOthersOption:(BOOL)a3
{
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F128;
  values[0] = xpc_int64_create(5);
  values[1] = xpc_BOOL_create(a3);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_100252D20;
  v10[0] = xpc_int64_create(2);
  id v6 = v5;
  v10[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0, v10[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F118;
  values[0] = xpc_int64_create(3);
  values[1] = xpc_int64_create(a3);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)off_100252D20;
  v14[0] = xpc_int64_create(2);
  id v8 = v7;
  v14[1] = v8;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)v15, v14, 2uLL);
  BOOL v10 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v9, a4, v14[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 1; j != -1; --j)

  return v10;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 dynamicAttribute:(unint64_t)a4 bundleID:(id)a5 error:(id *)a6
{
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F0F8;
  long long v23 = *(_OWORD *)off_10024F108;
  if (a5) {
    xpc_object_t v10 = xpc_string_create((const char *)[a5 UTF8String]);
  }
  else {
    xpc_object_t v10 = 0;
  }
  values[0] = xpc_int64_create(2);
  values[1] = xpc_int64_create(a3);
  xpc_object_t values[2] = xpc_int64_create(a4);
  id v11 = v10;
  xpc_object_t values[3] = v11;
  xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)off_100252D20;
  v19[0] = xpc_int64_create(2);
  id v13 = v12;
  v19[1] = v13;
  xpc_object_t v14 = xpc_dictionary_create((const char *const *)v20, v19, 2uLL);
  BOOL v15 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v14, a6, v19[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 3; j != -1; --j)

  return v15;
}

- (BOOL)prewarmAudioSessionWithError:(id *)a3
{
  long long keys = "type";
  xpc_object_t values = xpc_int64_create(1);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)xpc_object_t v12 = *(_OWORD *)off_100252D20;
  v11[0] = xpc_int64_create(2);
  id v6 = v5;
  v11[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v12, v11, 2uLL);
  BOOL v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, a3, v11[0]);

  for (uint64_t i = 1; i != -1; --i)
  return v8;
}

- (void)pingpong:(id)a3
{
  xpc_object_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  xpc_object_t v9 = sub_10004A308;
  xpc_object_t v10 = &unk_100253100;
  id v11 = a3;
  id v4 = v11;
  xpc_object_t v5 = objc_retainBlock(&v7);
  long long keys = "type";
  xpc_object_t values = xpc_int64_create(1);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v6, v5, v7, v8, v9, v10);
}

- (BOOL)prepareAudioProviderWithContext:(id)a3 clientType:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  xpc_object_t v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSXPCClient prepareAudioProviderWithContext:clientType:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Prepare Audio Provider with Context : %{public}@", buf, 0x16u);
  }
  *(_OWORD *)long long buf = *(_OWORD *)off_10024F0E0;
  *(void *)&buf[16] = "clientType";
  values[0] = xpc_int64_create(1);
  values[1] = [v8 xpcObject];
  xpc_object_t values[2] = xpc_uint64_create(a4);
  xpc_object_t v10 = xpc_dictionary_create((const char *const *)buf, values, 3uLL);
  *(_OWORD *)long long keys = *(_OWORD *)off_100252D20;
  v17[0] = xpc_int64_create(13);
  id v11 = v10;
  v17[1] = v11;
  xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, v17, 2uLL);
  BOOL v13 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v12, a5, v17[0]);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 2; j != -1; --j)

  return v13;
}

- (void)_sendXPCClientType
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcClientQueue);
  xpc_object_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t xpcClientType = self->_xpcClientType;
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSXPCClient _sendXPCClientType]";
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = xpcClientType;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Sending XPCClientType : %{public}d", buf, 0x12u);
  }
  long long keys = "xpcClientType";
  xpc_object_t values = xpc_int64_create(self->_xpcClientType);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)long long buf = *(_OWORD *)off_100252D20;
  v9[0] = xpc_int64_create(15);
  id v6 = v5;
  v9[1] = v6;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)buf, v9, 2uLL);
  -[CSXPCClient _sendMessageAsync:completion:](self, "_sendMessageAsync:completion:", v7, 0, v9[0]);

  for (uint64_t i = 1; i != -1; --i)
}

- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4
{
  xpc_object_t v5 = a4;
  if (v5)
  {
    uint64_t v6 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)[a3 UTF8String], 0, v5);
  }
  else
  {
    uint64_t v6 = +[CSUtils getSerialQueueWithQOS:33 name:a3 fixedPriority:kCSDefaultSerialQueueFixedPriority];
  }
  xpc_object_t v7 = (void *)v6;

  return v7;
}

- (void)dealloc
{
  [(CSXPCClient *)self _disconnect];
  v3.receiver = self;
  v3.super_class = (Class)CSXPCClient;
  [(CSXPCClient *)&v3 dealloc];
}

- (void)_disconnect
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    xpc_connection_set_event_handler(xpcConnection, &stru_10024F0C0);
    xpc_connection_cancel(self->_xpcConnection);
    id v4 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
}

- (void)disconnect
{
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A7FC;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(xpcClientQueue, block);
}

- (void)connect
{
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A878;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(xpcClientQueue, block);
}

- (BOOL)isConnected
{
  uint64_t v6 = 0;
  xpc_object_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004AB28;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(xpcClientQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CSXPCClient)initWithType:(unint64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CSXPCClient;
  id v4 = [(CSXPCClient *)&v18 init];
  if (v4)
  {
    CSLogInitIfNeeded();
    if (+[CSUtils supportsDispatchWorkloop])
    {
      xpc_object_t v5 = 0;
    }
    else
    {
      xpc_object_t v5 = +[CSUtils rootQueueWithFixedPriority:kCSDefaultSerialQueueFixedPriority];
    }
    uint64_t v6 = [(CSXPCClient *)v4 _getSerialQueueWithName:@"CSXPCClient Reply Queue" targetQueue:v5];
    xpcReplyQueue = v4->_xpcReplyQueue;
    v4->_xpcReplyQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [(CSXPCClient *)v4 _getSerialQueueWithName:@"CSXPCClient connection Queue" targetQueue:v5];
    xpcClientQueue = v4->_xpcClientQueue;
    v4->_xpcClientQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = +[NSMutableSet set];
    activationAssertions = v4->_activationAssertions;
    v4->_activationAssertions = (NSMutableSet *)v10;

    uint64_t v12 = +[NSHashTable weakObjectsHashTable];
    audioSessionInfoObservers = v4->_audioSessionInfoObservers;
    v4->_audioSessionInfoObservers = (NSHashTable *)v12;

    v4->_unint64_t xpcClientType = a3;
    xpc_object_t v14 = +[NSUUID UUID];
    uint64_t v15 = [v14 UUIDString];
    UUID = v4->_UUID;
    v4->_UUID = (NSString *)v15;
  }
  return v4;
}

+ (id)createStopAudioStreamMessageWithOption:(id)a3
{
  id v3 = a3;
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F230;
  values[0] = xpc_int64_create(5);
  values[1] = [v3 xpcObject];
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_100252D20;
  v10[0] = xpc_int64_create(4);
  id v5 = v4;
  v10[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (uint64_t i = 1; i != -1; --i)

  for (uint64_t j = 1; j != -1; --j)
  return v6;
}

+ (id)createStartAudioStreamMessageWithOption:(id)a3
{
  id v3 = a3;
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F220;
  values[0] = xpc_int64_create(4);
  values[1] = [v3 xpcObject];
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_100252D20;
  v10[0] = xpc_int64_create(4);
  id v5 = v4;
  v10[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (uint64_t i = 1; i != -1; --i)

  for (uint64_t j = 1; j != -1; --j)
  return v6;
}

+ (id)createPrepareAudioStreamMessageWithRequest:(id)a3
{
  id v3 = a3;
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F210;
  values[0] = xpc_int64_create(3);
  values[1] = [v3 xpcObject];
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_100252D20;
  v10[0] = xpc_int64_create(4);
  id v5 = v4;
  v10[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (uint64_t i = 1; i != -1; --i)

  for (uint64_t j = 1; j != -1; --j)
  return v6;
}

+ (id)createAudioStreamMessageWithRequest:(id)a3
{
  id v3 = a3;
  *(_OWORD *)long long keys = *(_OWORD *)off_10024F210;
  values[0] = xpc_int64_create(2);
  values[1] = [v3 xpcObject];
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)id v11 = *(_OWORD *)off_100252D20;
  v10[0] = xpc_int64_create(4);
  id v5 = v4;
  v10[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (uint64_t i = 1; i != -1; --i)

  for (uint64_t j = 1; j != -1; --j)
  return v6;
}

@end