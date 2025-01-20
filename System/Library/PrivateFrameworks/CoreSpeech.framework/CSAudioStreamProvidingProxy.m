@interface CSAudioStreamProvidingProxy
- (BOOL)_isHubRequest;
- (BOOL)clientRequestedSkipMonitorUpdate;
- (CSAudioRecordContext)recordContext;
- (CSAudioStream)audioStream;
- (CSAudioStreamProviding)audioStreamProviding;
- (CSAudioStreamProvidingProxy)initWithXPCConnection:(id)a3;
- (CSClientXPCConnection)xpcConnection;
- (CSTriggerInfoProviding)triggerInfoProviding;
- (NSString)accessoryId;
- (NSString)recordEventUUID;
- (unint64_t)streamClientType;
- (void)CSClientXPCConnectionReceivedClientError:(id)a3 clientError:(id)a4 client:(id)a5;
- (void)_handleAudioDeviceInfo:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleAudioStreamPrepareMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleAudioStreamRequestMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleIsNarrowband:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleIsRecordingMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handlePlaybackRouteMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleRecordDeviceInfo:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleRecordRouteMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleRecordSettings:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSetCurrentConextMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleStartAudioStreamMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleStopAudioStreamMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSupportsDuckingWithStreamHandleID:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleVoiceTriggerInfoMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_sendDelegateMessageToClient:(id)a3;
- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6;
- (void)_setAllowMixableAudioWhileRecordingIfNeeded:(BOOL)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)setAccessoryId:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamProvidingForProxy:(id)a3;
- (void)setClientRequestedSkipMonitorUpdate:(BOOL)a3;
- (void)setInitialContext:(id)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordEventUUID:(id)a3;
- (void)setStreamClientType:(unint64_t)a3;
- (void)setTriggerInfoProviding:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSAudioStreamProvidingProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryId, 0);
  objc_storeStrong((id *)&self->_recordEventUUID, 0);
  objc_storeStrong((id *)&self->_recordContext, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_destroyWeak((id *)&self->_triggerInfoProviding);
  objc_destroyWeak((id *)&self->_audioStreamProviding);
}

- (void)setClientRequestedSkipMonitorUpdate:(BOOL)a3
{
  self->_clientRequestedSkipMonitorUpdate = a3;
}

- (BOOL)clientRequestedSkipMonitorUpdate
{
  return self->_clientRequestedSkipMonitorUpdate;
}

- (void)setAccessoryId:(id)a3
{
}

- (NSString)accessoryId
{
  return self->_accessoryId;
}

- (void)setRecordEventUUID:(id)a3
{
}

- (NSString)recordEventUUID
{
  return self->_recordEventUUID;
}

- (void)setRecordContext:(id)a3
{
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setStreamClientType:(unint64_t)a3
{
  self->_streamClientType = a3;
}

- (unint64_t)streamClientType
{
  return self->_streamClientType;
}

- (void)setXpcConnection:(id)a3
{
}

- (CSClientXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  return (CSClientXPCConnection *)WeakRetained;
}

- (void)setTriggerInfoProviding:(id)a3
{
}

- (CSTriggerInfoProviding)triggerInfoProviding
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_triggerInfoProviding);
  return (CSTriggerInfoProviding *)WeakRetained;
}

- (CSAudioStreamProviding)audioStreamProviding
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
  return (CSAudioStreamProviding *)WeakRetained;
}

- (void)_setAllowMixableAudioWhileRecordingIfNeeded:(BOOL)a3
{
  if (self->_streamClientType == 1)
  {
    BOOL v3 = a3;
    if ([(CSAudioStreamProvidingProxy *)self _isHubRequest])
    {
      v4 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v5 = @"NO";
        if (v3) {
          CFStringRef v5 = @"YES";
        }
        *(_DWORD *)buf = 136315394;
        v14 = "-[CSAudioStreamProvidingProxy _setAllowMixableAudioWhileRecordingIfNeeded:]";
        __int16 v15 = 2114;
        CFStringRef v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s setting allow mixable audio while recording to %{public}@", buf, 0x16u);
      }
      v6 = +[AVAudioSession sharedInstance];
      id v12 = 0;
      unsigned __int8 v7 = [v6 setAllowMixableAudioWhileRecording:v3 error:&v12];
      id v8 = v12;

      if ((v7 & 1) == 0)
      {
        v9 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v10 = v9;
          v11 = [v8 localizedDescription];
          *(_DWORD *)buf = 136315394;
          v14 = "-[CSAudioStreamProvidingProxy _setAllowMixableAudioWhileRecordingIfNeeded:]";
          __int16 v15 = 2114;
          CFStringRef v16 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed to setAllowMixableAudioWhileRecording : %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (void)_sendDelegateMessageToClient:(id)a3
{
  id v4 = a3;
  *(_OWORD *)keys = *(_OWORD *)off_100252D20;
  v9[0] = xpc_int64_create(5);
  id v5 = v4;
  v9[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v9, 2uLL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend(WeakRetained, "sendMessageToClient:", v6, v9[0]);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4
{
  xpc_object_t v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CSAudioStreamProvidingProxy audioStreamProvider:didHardwareConfigurationChange:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s CSAudioStreamProvidingProxy", buf, 0xCu);
  }
  *(_OWORD *)buf = *(_OWORD *)&off_10024E7E8;
  v9[0] = xpc_int64_create(4);
  v9[1] = xpc_int64_create(a4);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)buf, v9, 2uLL);
  -[CSAudioStreamProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v7, v9[0]);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  id v5 = a4;
  if (self->_streamClientType != 4)
  {
    *(_OWORD *)keys = *(_OWORD *)&off_10024E7D8;
    objc_msgSend(v5, "xpcObject", xpc_int64_create(3));
    v8[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
    xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v8, 2uLL);
    [(CSAudioStreamProvidingProxy *)self _sendDelegateMessageToClient:v6];

    for (uint64_t i = 1; i != -1; --i)
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  if (self->_streamClientType != 4)
  {
    *(_OWORD *)keys = *(_OWORD *)&off_10024E7D8;
    objc_msgSend(v5, "xpcObject", xpc_int64_create(2));
    v8[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
    xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v8, 2uLL);
    [(CSAudioStreamProvidingProxy *)self _sendDelegateMessageToClient:v6];

    for (uint64_t i = 1; i != -1; --i)
  }
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id v6 = a3;
  xpc_object_t v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CSAudioStreamProvidingProxy audioStreamProvider:didStopStreamUnexpectedly:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  id v8 = [objc_alloc((Class)CSAudioStopStreamOption) initWithStopRecordingReason:6 expectedStopHostTime:0 trailingSilenceDurationAtEndpoint:0 holdRequest:0 supportsMagus:0.0];
  [(CSAudioStreamProvidingProxy *)self _setAllowMixableAudioWhileRecordingIfNeeded:1];
  if (!self->_clientRequestedSkipMonitorUpdate)
  {
    switch(self->_streamClientType)
    {
      case 1uLL:
        if ([(CSAudioStreamProvidingProxy *)self _isHubRequest])
        {
          v9 = +[CSSiriClientBehaviorMonitor sharedInstance];
          [v9 notifyDidStopStream:v8 withEventUUID:self->_recordEventUUID];
        }
        else
        {
          v9 = +[CSAccessorySiriClientBehaviorMonitor sharedInstance];
          [v9 notifyDidStopStream:0 reason:0 withEventUUID:self->_recordEventUUID forAccessory:self->_accessoryId];
        }
        goto LABEL_12;
      case 2uLL:
        v10 = CSOpportuneSpeakBehaviorMonitor;
        goto LABEL_9;
      case 3uLL:
        v10 = CSCommandControlBehaviorMonitor;
LABEL_9:
        v9 = [(__objc2_class *)v10 sharedInstance];
        [v9 notifyDidStopStream:0];
        goto LABEL_12;
      case 4uLL:
        v9 = +[CSIntuitiveConvAudioCaptureMonitor sharedInstance];
        [v9 notifyDidStopAudioCaptureWithOption:v8 eventUUID:self->_recordEventUUID error:0];
LABEL_12:

        break;
      default:
        break;
    }
  }
  *(_OWORD *)buf = *(_OWORD *)&off_10024E7C8;
  v13[0] = xpc_int64_create(1);
  v13[1] = xpc_int64_create(a4);
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)buf, v13, 2uLL);
  -[CSAudioStreamProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v11, v13[0]);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)_handlePlaybackRouteMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  xpc_object_t v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  v9 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    xpc_object_t v11 = [WeakRetained playbackRoute];

    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (v11) {
      xpc_dictionary_set_string(reply, "playbackRoute", (const char *)[v11 UTF8String]);
    }
    xpc_connection_send_message(v7, reply);
  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      __int16 v15 = "-[CSAudioStreamProvidingProxy _handlePlaybackRouteMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Cannot handle PlaybackRoute : audioStreamProviding is nil", (uint8_t *)&v14, 0xCu);
    }
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v7 result:0 error:0];
  }
}

- (void)_handleIsNarrowband:(id)a3 messageBody:(id)a4 client:(id)a5
{
  xpc_object_t v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  v9 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = [WeakRetained isNarrowBand];

    xpc_object_t xdict = xpc_dictionary_create_reply(v8);
    xpc_dictionary_set_BOOL(xdict, "result", v11);
    xpc_connection_send_message(v7, xdict);
  }
  else
  {
    id v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v15 = "-[CSAudioStreamProvidingProxy _handleIsNarrowband:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Cannot handle IsNarrowband : audioStreamProviding is nil", buf, 0xCu);
    }
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v7 result:0 error:0];
  }
}

- (void)_handleRecordSettings:(id)a3 messageBody:(id)a4 client:(id)a5
{
  xpc_object_t v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  v9 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = [WeakRetained recordSettings];

    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (v11)
    {
      v13 = objc_msgSend(v11, "_cs_xpcObject");
      xpc_dictionary_set_value(reply, "recordSettings", v13);
    }
    xpc_connection_send_message(v7, reply);
  }
  else
  {
    int v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      CFStringRef v16 = "-[CSAudioStreamProvidingProxy _handleRecordSettings:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Cannot handle RecordSettings : audioStreamProviding is nil", (uint8_t *)&v15, 0xCu);
    }
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v7 result:0 error:0];
  }
}

- (void)_handleAudioDeviceInfo:(id)a3 messageBody:(id)a4 client:(id)a5
{
  xpc_object_t v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  v9 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = [WeakRetained audioDeviceInfo];

    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (v11)
    {
      v13 = [v11 xpcObject];
      xpc_dictionary_set_value(reply, "audioDeviceInfo", v13);
    }
    if (self->_streamClientType == 1 && [(CSAudioStreamProvidingProxy *)self _isHubRequest])
    {
      int v14 = +[CSSiriClientBehaviorMonitor sharedInstance];
      id v15 = [v11 copy];
      [v14 notifyAudioDeviceInfoUpdated:v15];
    }
    xpc_connection_send_message(v7, reply);
  }
  else
  {
    CFStringRef v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      v18 = "-[CSAudioStreamProvidingProxy _handleAudioDeviceInfo:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Cannot handle AudioDeviceInfo : audioStreamProviding is nil", (uint8_t *)&v17, 0xCu);
    }
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v7 result:0 error:0];
  }
}

- (void)_handleRecordDeviceInfo:(id)a3 messageBody:(id)a4 client:(id)a5
{
  xpc_object_t v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  v9 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = [WeakRetained recordDeviceInfo];

    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (v11)
    {
      v13 = [v11 xpcObject];
      xpc_dictionary_set_value(reply, "recordDeviceInfo", v13);
    }
    xpc_connection_send_message(v7, reply);
  }
  else
  {
    int v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      CFStringRef v16 = "-[CSAudioStreamProvidingProxy _handleRecordDeviceInfo:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Cannot handle RecordDeviceInfo : audioStreamProviding is nil", (uint8_t *)&v15, 0xCu);
    }
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v7 result:0 error:0];
  }
}

- (void)_handleRecordRouteMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  xpc_object_t v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  v9 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = [WeakRetained recordRoute];

    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (v11) {
      xpc_dictionary_set_string(reply, "recordRoute", (const char *)[v11 UTF8String]);
    }
    xpc_connection_send_message(v7, reply);
  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      int v15 = "-[CSAudioStreamProvidingProxy _handleRecordRouteMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Cannot handle RecordRoute : audioStreamProviding is nil", (uint8_t *)&v14, 0xCu);
    }
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v7 result:0 error:0];
  }
}

- (void)_handleIsRecordingMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  xpc_object_t v7 = (_xpc_connection_s *)a5;
  id v8 = a3;
  v9 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    unsigned __int8 v11 = [WeakRetained isRecording];

    xpc_object_t xdict = xpc_dictionary_create_reply(v8);
    xpc_dictionary_set_BOOL(xdict, "result", v11);
    xpc_connection_send_message(v7, xdict);
  }
  else
  {
    id v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v15 = "-[CSAudioStreamProvidingProxy _handleIsRecordingMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Cannot handle IsRecording : audioStreamProviding is nil", buf, 0xCu);
    }
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v7 result:0 error:0];
  }
}

- (void)_handleVoiceTriggerInfoMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = (_xpc_connection_s *)a5;
  id v9 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  unsigned __int8 v11 = xpc_dictionary_get_dictionary(v9, "context");

  if (!v11)
  {
    id v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CSAudioStreamProvidingProxy _handleVoiceTriggerInfoMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Fail to parse recordContext", buf, 0xCu);
    }
  }
  id v13 = [objc_alloc((Class)CSAudioRecordContext) initWithXPCObject:v11];
  [(CSAudioStreamProvidingProxy *)self setRecordContext:v13];
  int v14 = +[CSVoiceTriggerEventInfoProvider sharedInstance];
  id v19 = 0;
  id v20 = 0;
  [v14 fetchVoiceTriggerInfoWithAudioContext:v13 resultVoiceTriggerInfo:&v20 resultRTSTriggerInfo:&v19];
  id v15 = v20;
  id v16 = v19;

  xpc_dictionary_set_BOOL(reply, "result", 1);
  if (v15)
  {
    int v17 = objc_msgSend(v15, "_cs_xpcObject");
    xpc_dictionary_set_value(reply, "voiceTriggerInfo", v17);
  }
  if (v16)
  {
    v18 = objc_msgSend(v16, "_cs_xpcObject");
    xpc_dictionary_set_value(reply, "rtsTriggerInfo", v18);
  }
  xpc_connection_send_message(v8, reply);
}

- (void)_handleStopAudioStreamMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (!v11)
  {
    id v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[CSAudioStreamProvidingProxy _handleStopAudioStreamMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Cannot handle stopAudioStream : audioStreamProviding is nil", buf, 0xCu);
    }
    uint64_t v16 = CSErrorDomain;
    uint64_t v17 = 1401;
    goto LABEL_11;
  }
  id v12 = [(CSAudioStreamProvidingProxy *)self audioStream];

  if (!v12)
  {
    v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[CSAudioStreamProvidingProxy _handleStopAudioStreamMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Cannot handle stopAudioStream : audioStream is nil", buf, 0xCu);
    }
    uint64_t v16 = CSErrorDomain;
    uint64_t v17 = 1402;
LABEL_11:
    id v13 = +[NSError errorWithDomain:v16 code:v17 userInfo:0];
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v10 result:0 error:v13];
    goto LABEL_24;
  }
  id v13 = xpc_dictionary_get_dictionary(v9, "stopAudioStreamOption");
  if (v13) {
    id v14 = [objc_alloc((Class)CSAudioStopStreamOption) initWithXPCObject:v13];
  }
  else {
    id v14 = 0;
  }
  [(CSAudioStreamProvidingProxy *)self _setAllowMixableAudioWhileRecordingIfNeeded:1];
  if (!self->_clientRequestedSkipMonitorUpdate)
  {
    switch(self->_streamClientType)
    {
      case 1uLL:
        if ([(CSAudioStreamProvidingProxy *)self _isHubRequest])
        {
          id v19 = +[CSSiriClientBehaviorMonitor sharedInstance];
          [v19 notifyWillStopStream:v14 reason:0 withEventUUID:self->_recordEventUUID];
        }
        else
        {
          id v19 = +[CSAccessorySiriClientBehaviorMonitor sharedInstance];
          [v19 notifyWillStopStream:0 reason:0 forAccessory:self->_accessoryId];
        }
        goto LABEL_22;
      case 2uLL:
        id v20 = CSOpportuneSpeakBehaviorMonitor;
        goto LABEL_19;
      case 3uLL:
        id v20 = CSCommandControlBehaviorMonitor;
LABEL_19:
        id v19 = [(__objc2_class *)v20 sharedInstance];
        [v19 notifyWillStopStream:0];
        goto LABEL_22;
      case 4uLL:
        id v19 = +[CSIntuitiveConvAudioCaptureMonitor sharedInstance];
        [v19 notifyWillStopAudioCaptureWithReason:0];
LABEL_22:

        break;
      default:
        break;
    }
  }
  v21 = [(CSAudioStreamProvidingProxy *)self audioStream];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100020C34;
  v23[3] = &unk_10024E7A8;
  v23[4] = self;
  id v24 = v14;
  id v25 = v8;
  id v26 = v10;
  id v22 = v14;
  [v21 stopAudioStreamWithOption:v22 completion:v23];

LABEL_24:
}

- (void)_handleStartAudioStreamMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = xpc_dictionary_get_dictionary(a4, "startAudioStreamOption");
  if (!v10)
  {
    v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CSAudioStreamProvidingProxy _handleStartAudioStreamMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Cannot handle startAudioStream : given audio stream option is nil", buf, 0xCu);
    }
    uint64_t v19 = CSErrorDomain;
    uint64_t v20 = 114;
    goto LABEL_17;
  }
  unsigned __int8 v11 = [(CSAudioStreamProvidingProxy *)self audioStream];

  if (!v11)
  {
    v21 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CSAudioStreamProvidingProxy _handleStartAudioStreamMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Cannot handle startAudioStream : audioStream is nil", buf, 0xCu);
    }
    uint64_t v19 = CSErrorDomain;
    uint64_t v20 = 1402;
    goto LABEL_17;
  }
  id v12 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (!v12)
  {
    id v22 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CSAudioStreamProvidingProxy _handleStartAudioStreamMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Cannot handle startAudioStream : audioStreamProviding is nil", buf, 0xCu);
    }
    uint64_t v19 = CSErrorDomain;
    uint64_t v20 = 1401;
LABEL_17:
    id v23 = +[NSError errorWithDomain:v19 code:v20 userInfo:0];
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v9 result:0 error:v23];
    goto LABEL_24;
  }
  id v13 = [objc_alloc((Class)CSAudioStartStreamOption) initWithXPCObject:v10];
  [(CSAudioStreamProvidingProxy *)self _setAllowMixableAudioWhileRecordingIfNeeded:1];
  id v14 = +[NSUUID UUID];
  id v15 = [v14 UUIDString];
  recordEventUUID = self->_recordEventUUID;
  self->_recordEventUUID = v15;

  if (!self->_clientRequestedSkipMonitorUpdate)
  {
    switch(self->_streamClientType)
    {
      case 1uLL:
        if ([(CSAudioStreamProvidingProxy *)self _isHubRequest])
        {
          uint64_t v17 = +[CSSiriClientBehaviorMonitor sharedInstance];
          [v17 notifyWillStartStreamWithContext:self->_recordContext option:v13 withEventUUID:self->_recordEventUUID];
        }
        else
        {
          uint64_t v17 = +[CSAccessorySiriClientBehaviorMonitor sharedInstance];
          [v17 notifyWillStartStreamWithContext:self->_recordContext option:v13 forAccessory:self->_accessoryId];
        }
        goto LABEL_22;
      case 2uLL:
        uint64_t v17 = +[CSOpportuneSpeakBehaviorMonitor sharedInstance];
        recordContext = self->_recordContext;
        id v25 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];
        id v26 = [v25 UUID];
        id v27 = [v13 copy];
        [v17 notifyWillStartStreamWithContext:recordContext audioProviderUUID:v26 option:v27];

        goto LABEL_21;
      case 3uLL:
        uint64_t v17 = +[CSCommandControlBehaviorMonitor sharedInstance];
        v28 = self->_recordContext;
        id v25 = [v13 copy];
        [v17 notifyWillStartStreamWithContext:v28 option:v25];
        goto LABEL_21;
      case 4uLL:
        uint64_t v17 = +[CSIntuitiveConvAudioCaptureMonitor sharedInstance];
        v29 = self->_recordContext;
        id v25 = [v13 copy];
        [v17 notifyWillStartAudioCaptureWithContext:v29 option:v25];
LABEL_21:

LABEL_22:
        break;
      default:
        break;
    }
  }
  v30 = [(CSAudioStreamProvidingProxy *)self audioStream];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100021270;
  v31[3] = &unk_10024E7A8;
  v31[4] = self;
  id v32 = v13;
  id v33 = v8;
  id v34 = v9;
  id v23 = v13;
  [v30 startAudioStreamWithOption:v23 completion:v31];

LABEL_24:
}

- (void)_handleAudioStreamPrepareMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = xpc_dictionary_get_dictionary(a4, "audioStreamRequest");
  unsigned __int8 v11 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (v11)
  {
    if (v10)
    {
      id v12 = [objc_alloc((Class)CSAudioStreamRequest) initWithXPCObject:v10];
    }
    else
    {
      id v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[CSAudioStreamProvidingProxy _handleAudioStreamPrepareMessage:messageBody:client:]";
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Given audioStreamRequest is nil, use default audioStreamRequest", buf, 0xCu);
      }
      id v15 = [(CSAudioStreamProvidingProxy *)self audioStream];
      id v12 = [v15 streamRequest];
    }
    self->_clientRequestedSkipMonitorUpdate = [v12 requestSkipClientMonitorUpdate];
    uint64_t v16 = [(CSAudioStreamProvidingProxy *)self audioStream];

    if (v16)
    {
      uint64_t v17 = [(CSAudioStreamProvidingProxy *)self audioStream];
      id v29 = 0;
      unint64_t v18 = (unint64_t)[v17 prepareAudioStreamSyncWithRequest:v12 error:&v29];
      id v19 = v29;

      if (self->_streamClientType != 1 || ![(CSAudioStreamProvidingProxy *)self _isHubRequest]) {
        goto LABEL_23;
      }
      uint64_t v20 = +[CSSiriClientBehaviorMonitor sharedInstance];
      v21 = [(CSAudioStreamProvidingProxy *)self audioStream];
      [v20 notifyPreparedSiriClientAudioStream:v21 successfully:v18];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
      id v23 = (objc_class *)objc_opt_class();
      id v24 = NSStringFromClass(v23);
      id v28 = 0;
      uint64_t v20 = [WeakRetained audioStreamWithRequest:v12 streamName:v24 error:&v28];
      id v19 = v28;

      unint64_t v18 = v20 != 0;
      if (v20)
      {
        [v20 setDelegate:self];
        [(CSAudioStreamProvidingProxy *)self setAudioStream:v20];
      }
      else
      {
        id v25 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          id v26 = v25;
          id v27 = [v19 localizedDescription];
          *(_DWORD *)buf = 136315394;
          v31 = "-[CSAudioStreamProvidingProxy _handleAudioStreamPrepareMessage:messageBody:client:]";
          __int16 v32 = 2114;
          id v33 = v27;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s Getting audio stream has failed : %{public}@", buf, 0x16u);
        }
      }
      if (self->_streamClientType != 1 || ![(CSAudioStreamProvidingProxy *)self _isHubRequest]) {
        goto LABEL_22;
      }
      v21 = +[CSSiriClientBehaviorMonitor sharedInstance];
      [v21 notifyFetchedSiriClientAudioStream:v20 successfully:v20 != 0];
    }

LABEL_22:
LABEL_23:
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v9 result:v18 error:v19];

    goto LABEL_24;
  }
  id v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[CSAudioStreamProvidingProxy _handleAudioStreamPrepareMessage:messageBody:client:]";
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Cannot handle PrepareRequest throught XPC : audioStreamProviding is nil", buf, 0xCu);
  }
  id v12 = +[NSError errorWithDomain:CSErrorDomain code:1401 userInfo:0];
  [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v9 result:0 error:v12];
LABEL_24:
}

- (void)_handleAudioStreamRequestMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = xpc_dictionary_get_dictionary(a4, "audioStreamRequest");
  if (v10)
  {
    unsigned __int8 v11 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

    if (v11)
    {
      id v12 = [objc_alloc((Class)CSAudioStreamRequest) initWithXPCObject:v10];
      self->_clientRequestedSkipMonitorUpdate = [v12 requestSkipClientMonitorUpdate];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      id v27 = 0;
      uint64_t v16 = [WeakRetained audioStreamWithRequest:v12 streamName:v15 error:&v27];
      id v17 = v27;

      if (v16)
      {
        [v16 setDelegate:self];
        [(CSAudioStreamProvidingProxy *)self setAudioStream:v16];
      }
      else
      {
        id v22 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          id v25 = v22;
          id v26 = [v17 localizedDescription];
          *(_DWORD *)buf = 136315394;
          id v29 = "-[CSAudioStreamProvidingProxy _handleAudioStreamRequestMessage:messageBody:client:]";
          __int16 v30 = 2114;
          v31 = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Getting audio stream has failed : %{public}@", buf, 0x16u);
        }
      }
      [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v9 result:v16 != 0 error:v17];
      unint64_t streamClientType = self->_streamClientType;
      if (streamClientType == 4)
      {
        id v24 = +[CSIntuitiveConvAudioCaptureMonitor sharedInstance];
        [v24 notifyFetchedAudioStream:v16 successfully:v16 != 0];
      }
      else
      {
        if (streamClientType != 1 || ![(CSAudioStreamProvidingProxy *)self _isHubRequest]) {
          goto LABEL_20;
        }
        id v24 = +[CSSiriClientBehaviorMonitor sharedInstance];
        [v24 notifyFetchedSiriClientAudioStream:v16 successfully:v16 != 0];
      }

LABEL_20:
      goto LABEL_21;
    }
    v21 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[CSAudioStreamProvidingProxy _handleAudioStreamRequestMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Cannot handle AudioStreamRequest throught XPC : audioStreamProviding is nil", buf, 0xCu);
    }
    uint64_t v19 = CSErrorDomain;
    uint64_t v20 = 1401;
  }
  else
  {
    unint64_t v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[CSAudioStreamProvidingProxy _handleAudioStreamRequestMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Cannot handle AudioStreamRequest throught XPC : given audioStreamRequest is nil", buf, 0xCu);
    }
    uint64_t v19 = CSErrorDomain;
    uint64_t v20 = 114;
  }
  id v12 = +[NSError errorWithDomain:v19 code:v20 userInfo:0];
  [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v9 result:0 error:v12];
LABEL_21:
}

- (void)_handleSetCurrentConextMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (v11)
  {
    id v12 = xpc_dictionary_get_dictionary(v9, "context");
    if (v12)
    {
      id v13 = [objc_alloc((Class)CSAudioRecordContext) initWithXPCObject:v12];
      [(CSAudioStreamProvidingProxy *)self setRecordContext:v13];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
      id v19 = 0;
      id v15 = [WeakRetained setCurrentContext:v13 error:&v19];
      id v16 = v19;

      [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v10 result:v15 error:v16];
    }
    else
    {
      unint64_t v18 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[CSAudioStreamProvidingProxy _handleSetCurrentConextMessage:messageBody:client:]";
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Cannot handle setCurrentContext throught XPC : given context is nil", buf, 0xCu);
      }
      id v13 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
      [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v10 result:0 error:v13];
    }
  }
  else
  {
    id v17 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSAudioStreamProvidingProxy _handleSetCurrentConextMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Cannot handle setCurrentContext throught XPC : audioStreamProviding is nil", buf, 0xCu);
    }
    id v12 = +[NSError errorWithDomain:CSErrorDomain code:1401 userInfo:0];
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v10 result:0 error:v12];
  }
}

- (void)_handleSupportsDuckingWithStreamHandleID:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(CSAudioStreamProvidingProxy *)self audioStreamProviding];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audioStreamProviding);
    id v15 = 0;
    id v11 = [WeakRetained supportsDuckingOnCurrentRouteWithError:&v15];
    id v12 = v15;

    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v7 result:v11 error:v12];
  }
  else
  {
    id v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[CSAudioStreamProvidingProxy _handleSupportsDuckingWithStreamHandleID:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Cannot handle setCurrentContext throught XPC : audioStreamProviding is nil", buf, 0xCu);
    }
    uint64_t v14 = +[NSError errorWithDomain:CSErrorDomain code:1401 userInfo:0];
    [(CSAudioStreamProvidingProxy *)self _sendReply:v8 client:v7 result:0 error:v14];
    id v12 = v7;
    id v7 = v8;
    id v8 = (id)v14;
  }
}

- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t int64 = xpc_dictionary_get_int64(v9, "type");
  switch(int64)
  {
    case 1:
      [(CSAudioStreamProvidingProxy *)self _handleSetCurrentConextMessage:v8 messageBody:v9 client:v10];
      break;
    case 2:
      [(CSAudioStreamProvidingProxy *)self _handleAudioStreamRequestMessage:v8 messageBody:v9 client:v10];
      break;
    case 3:
      [(CSAudioStreamProvidingProxy *)self _handleAudioStreamPrepareMessage:v8 messageBody:v9 client:v10];
      break;
    case 4:
      [(CSAudioStreamProvidingProxy *)self _handleStartAudioStreamMessage:v8 messageBody:v9 client:v10];
      break;
    case 5:
      [(CSAudioStreamProvidingProxy *)self _handleStopAudioStreamMessage:v8 messageBody:v9 client:v10];
      break;
    case 6:
      [(CSAudioStreamProvidingProxy *)self _handleIsRecordingMessage:v8 messageBody:v9 client:v10];
      break;
    case 7:
      [(CSAudioStreamProvidingProxy *)self _handleRecordRouteMessage:v8 messageBody:v9 client:v10];
      break;
    case 8:
      [(CSAudioStreamProvidingProxy *)self _handleRecordDeviceInfo:v8 messageBody:v9 client:v10];
      break;
    case 9:
      [(CSAudioStreamProvidingProxy *)self _handleRecordSettings:v8 messageBody:v9 client:v10];
      break;
    case 10:
      [(CSAudioStreamProvidingProxy *)self _handleIsNarrowband:v8 messageBody:v9 client:v10];
      break;
    case 11:
      [(CSAudioStreamProvidingProxy *)self _handlePlaybackRouteMessage:v8 messageBody:v9 client:v10];
      break;
    case 12:
      [(CSAudioStreamProvidingProxy *)self _handleAudioDeviceInfo:v8 messageBody:v9 client:v10];
      break;
    default:
      int64_t v12 = int64;
      if (int64 == 100)
      {
        [(CSAudioStreamProvidingProxy *)self _handleVoiceTriggerInfoMessage:v8 messageBody:v9 client:v10];
      }
      else if (int64 == 102)
      {
        [(CSAudioStreamProvidingProxy *)self _handleSupportsDuckingWithStreamHandleID:v8 messageBody:v9 client:v10];
      }
      else
      {
        id v13 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136315394;
          id v15 = "-[CSAudioStreamProvidingProxy handleXPCMessage:messageBody:client:]";
          __int16 v16 = 2050;
          int64_t v17 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Unknown body type : %{public}lld", (uint8_t *)&v14, 0x16u);
        }
      }
      break;
  }
}

- (void)CSClientXPCConnectionReceivedClientError:(id)a3 clientError:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[CSAudioStreamProvidingProxy CSClientXPCConnectionReceivedClientError:clientError:client:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s CSAudioStreamProvidingProxy has received xpc disconnection", buf, 0xCu);
  }
  int64_t v12 = [(CSAudioStreamProvidingProxy *)self audioStream];

  if (v12)
  {
    id v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[CSAudioStreamProvidingProxy CSClientXPCConnectionReceivedClientError:clientError:client:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Trying to stop audio stream on CSAudioStreamProvidingProxy", buf, 0xCu);
    }
    BOOL clientRequestedSkipMonitorUpdate = self->_clientRequestedSkipMonitorUpdate;
    id v15 = [(CSAudioStreamProvidingProxy *)self audioStream];
    unsigned __int8 v16 = [v15 isStreaming];

    BOOL v17 = clientRequestedSkipMonitorUpdate;
    if ((v16 & 1) == 0)
    {
      unint64_t v18 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v18;
        uint64_t v20 = [(CSAudioStreamProvidingProxy *)self audioStream];
        v21 = [v20 name];
        *(_DWORD *)buf = 136315394;
        v31 = "-[CSAudioStreamProvidingProxy CSClientXPCConnectionReceivedClientError:clientError:client:]";
        __int16 v32 = 2114;
        id v33 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s audioStream %{public}@ already stopped streaming, we will skip monitor notification in this case", buf, 0x16u);
      }
      BOOL v17 = 1;
    }
    id v22 = [objc_alloc((Class)CSAudioStopStreamOption) initWithStopRecordingReason:5 expectedStopHostTime:0 trailingSilenceDurationAtEndpoint:0 holdRequest:0 supportsMagus:0.0];
    [(CSAudioStreamProvidingProxy *)self _setAllowMixableAudioWhileRecordingIfNeeded:1];
    if (!v17)
    {
      switch(self->_streamClientType)
      {
        case 1uLL:
          if ([(CSAudioStreamProvidingProxy *)self _isHubRequest])
          {
            id v23 = +[CSSiriClientBehaviorMonitor sharedInstance];
            [v23 notifyWillStopStream:0 reason:1 withEventUUID:self->_recordEventUUID];
          }
          else
          {
            id v23 = +[CSAccessorySiriClientBehaviorMonitor sharedInstance];
            [v23 notifyWillStopStream:0 reason:1 forAccessory:self->_accessoryId];
          }
          goto LABEL_19;
        case 2uLL:
          id v24 = CSOpportuneSpeakBehaviorMonitor;
          goto LABEL_16;
        case 3uLL:
          id v24 = CSCommandControlBehaviorMonitor;
LABEL_16:
          id v23 = [(__objc2_class *)v24 sharedInstance];
          [v23 notifyWillStopStream:0];
          goto LABEL_19;
        case 4uLL:
          id v23 = +[CSIntuitiveConvAudioCaptureMonitor sharedInstance];
          [v23 notifyWillStopAudioCaptureWithReason:1];
LABEL_19:

          break;
        default:
          break;
      }
    }
    id v25 = [(CSAudioStreamProvidingProxy *)self audioStream];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000226B8;
    v27[3] = &unk_10024E780;
    BOOL v29 = v17;
    v27[4] = self;
    id v28 = v22;
    id v26 = v22;
    [v25 stopAudioStreamWithOption:0 completion:v27];
  }
}

- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6
{
  connection = (_xpc_connection_s *)a4;
  id v9 = a6;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_BOOL(reply, "result", a5);
  if (v9)
  {
    id v11 = [v9 domain];
    xpc_dictionary_set_string(reply, "resultErrorDomain", (const char *)[v11 UTF8String]);

    xpc_dictionary_set_int64(reply, "resultErrorCode", (int64_t)[v9 code]);
  }
  xpc_connection_send_message(connection, reply);
}

- (BOOL)_isHubRequest
{
  return self->_accessoryId == 0;
}

- (void)setInitialContext:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    [(CSAudioStreamProvidingProxy *)self setRecordContext:v6];
    if ([v6 type] == (id)17 || objc_msgSend(v6, "type") == (id)18)
    {
      id v4 = [v6 deviceId];
      accessoryId = self->_accessoryId;
      self->_accessoryId = v4;
    }
  }
}

- (void)setAudioStreamProvidingForProxy:(id)a3
{
  p_audioStreamProviding = &self->_audioStreamProviding;
  id v5 = a3;
  objc_storeWeak((id *)p_audioStreamProviding, v5);
  id v6 = [(CSAudioStreamProvidingProxy *)self audioStream];
  id v7 = [v6 streamProvider];

  if (v7 != v5)
  {
    id v8 = [(CSAudioStreamProvidingProxy *)self audioStream];
    unsigned int v9 = [v8 isStreaming];

    if (v9)
    {
      id v10 = +[CSDiagnosticReporter sharedInstance];
      [v10 submitAudioIssueReport:kCSDiagnosticReporterAudioStreamDeallocDuringStreaming];

      id v11 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
      {
        int64_t v12 = v11;
        id v13 = [(CSAudioStreamProvidingProxy *)self audioStream];
        int v14 = [v13 name];
        int v15 = 136315394;
        unsigned __int8 v16 = "-[CSAudioStreamProvidingProxy setAudioStreamProvidingForProxy:]";
        __int16 v17 = 2114;
        unint64_t v18 = v14;
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s Audio steam %{public}@ is still streaming when we get new streamProvider", (uint8_t *)&v15, 0x16u);
      }
    }
    [(CSAudioStreamProvidingProxy *)self setAudioStream:0];
  }
}

- (CSAudioStreamProvidingProxy)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSAudioStreamProvidingProxy;
  id v5 = [(CSAudioStreamProvidingProxy *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(CSAudioStreamProvidingProxy *)v5 setXpcConnection:v4];
  }

  return v6;
}

@end