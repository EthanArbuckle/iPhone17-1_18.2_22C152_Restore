@interface _ASServiceHelper
- (BOOL)isDeviceInCarDND;
- (BOOL)isDeviceInStarkMode;
- (BOOL)isDeviceLockedWithPasscode;
- (BOOL)isTimeoutSuspended;
- (BOOL)openSensitiveURL:(id)a3;
- (NSString)description;
- (_ASServiceHelper)initWithCommandClassName:(id)a3 infoDictionary:(id)a4 executionInfo:(id)a5 serviceClient:(id)a6;
- (id)_providerServiceDelegateWithErrorHandler:(id)a3;
- (id)_synchronousProviderServiceDelegateWithErrorHandler:(id)a3;
- (id)assistantLocalizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5;
- (id)endpointInfo;
- (id)instanceInfo;
- (id)peerInfoForCurrentCommand;
- (id)speechInfo;
- (void)dealloc;
- (void)dismissAssistant;
- (void)dismissAssistantWithReason:(int64_t)a3;
- (void)fetchContextsForKeys:(id)a3 includesNearbyDevices:(BOOL)a4 completion:(id)a5;
- (void)handleCommand:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)isDeviceWatchAuthenticatedWithCompletion:(id)a3;
- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3;
- (void)prepareForAudioHandoffWithCompletion:(id)a3;
@end

@implementation _ASServiceHelper

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceClient);
  objc_storeStrong((id *)&self->_commandExecutionInfo, 0);
  objc_storeStrong((id *)&self->_commandInfoDictionary, 0);
  objc_storeStrong((id *)&self->_commandClassName, 0);
}

- (id)_synchronousProviderServiceDelegateWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceClient);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = [WeakRetained synchronousProviderServiceDelegateWithErrorHandler:v4];
  }
  else
  {
    if (v4)
    {
      id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Service helper %@ is already invalidated.", self];
      v9 = +[AFError errorWithCode:104 description:v8];
      v4[2](v4, v9);
    }
    v7 = 0;
  }

  return v7;
}

- (id)_providerServiceDelegateWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceClient);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = [WeakRetained providerServiceDelegateWithErrorHandler:v4];
  }
  else
  {
    if (v4)
    {
      id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Service helper %@ is already invalidated.", self];
      v9 = +[AFError errorWithCode:104 description:v8];
      v4[2](v4, v9);
    }
    v7 = 0;
  }

  return v7;
}

- (id)speechInfo
{
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315394;
      v7 = "-[_ASServiceHelper speechInfo]";
      __int16 v8 = 2112;
      v9 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", (uint8_t *)&v6, 0x16u);
    }
  }
  v4 = [(AFCommandExecutionInfo *)self->_commandExecutionInfo speechInfo];
  return v4;
}

- (id)instanceInfo
{
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315394;
      v7 = "-[_ASServiceHelper instanceInfo]";
      __int16 v8 = 2112;
      v9 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", (uint8_t *)&v6, 0x16u);
    }
  }
  v4 = [(AFCommandExecutionInfo *)self->_commandExecutionInfo instanceInfo];
  return v4;
}

- (id)endpointInfo
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    __int16 v8 = "-[_ASServiceHelper endpointInfo]";
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s -[AFServiceHelper endpointInfo] is deprecated. Please use -[AFServiceHelper instanceInfo] as replacement.", (uint8_t *)&v7, 0xCu);
  }
  if (self->_isInvalid)
  {
    v4 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315394;
      __int16 v8 = "-[_ASServiceHelper endpointInfo]";
      __int16 v9 = 2112;
      v10 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", (uint8_t *)&v7, 0x16u);
    }
  }
  v5 = [(AFCommandExecutionInfo *)self->_commandExecutionInfo endpointInfo];
  return v5;
}

- (id)peerInfoForCurrentCommand
{
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315394;
      int v7 = "-[_ASServiceHelper peerInfoForCurrentCommand]";
      __int16 v8 = 2112;
      __int16 v9 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", (uint8_t *)&v6, 0x16u);
    }
  }
  v4 = [(AFCommandExecutionInfo *)self->_commandExecutionInfo originPeerInfo];
  return v4;
}

- (BOOL)isTimeoutSuspended
{
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[_ASServiceHelper isTimeoutSuspended]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", buf, 0x16u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v8 = 0;
  v4 = [(_ASServiceHelper *)self _synchronousProviderServiceDelegateWithErrorHandler:&stru_100014888];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A9B8;
  v6[3] = &unk_100014750;
  v6[4] = buf;
  [v4 getTimeoutSuspendedWithReply:v6];

  LOBYTE(v4) = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return (char)v4;
}

- (void)fetchContextsForKeys:(id)a3 includesNearbyDevices:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (self->_isInvalid)
  {
    v10 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[_ASServiceHelper fetchContextsForKeys:includesNearbyDevices:completion:]";
      __int16 v18 = 2112;
      v19 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", buf, 0x16u);
    }
  }
  v11 = [(_ASServiceHelper *)self _providerServiceDelegateWithErrorHandler:&stru_100014840];
  v12 = [(AFCommandExecutionInfo *)self->_commandExecutionInfo requestID];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000AC08;
  v14[3] = &unk_100014868;
  id v15 = v9;
  id v13 = v9;
  [v11 fetchContextsForKeys:v8 forRequestID:v12 includesNearbyDevices:v6 completion:v14];
}

- (void)prepareForAudioHandoffWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_isInvalid)
  {
    v5 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[_ASServiceHelper prepareForAudioHandoffWithCompletion:]";
      __int16 v15 = 2112;
      v16 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", buf, 0x16u);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000AE70;
  v11[3] = &unk_100014568;
  id v6 = v4;
  id v12 = v6;
  int v7 = [(_ASServiceHelper *)self _providerServiceDelegateWithErrorHandler:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000AF58;
  v9[3] = &unk_1000147D8;
  id v10 = v6;
  id v8 = v6;
  [v7 prepareForAudioHandoffWithCompletion:v9];
}

- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_isInvalid)
  {
    v5 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[_ASServiceHelper prepareForAudioHandoffFailedWithCompletion:]";
      __int16 v15 = 2112;
      v16 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", buf, 0x16u);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000B1D4;
  v11[3] = &unk_100014568;
  id v6 = v4;
  id v12 = v6;
  int v7 = [(_ASServiceHelper *)self _providerServiceDelegateWithErrorHandler:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B2AC;
  v9[3] = &unk_100014590;
  id v10 = v6;
  id v8 = v6;
  [v7 prepareForAudioHandoffFailedWithCompletion:v9];
}

- (void)handleCommand:(id)a3 completion:(id)a4
{
  id v6 = (_ASServiceHelper *)a3;
  id v7 = a4;
  if (self->_isInvalid)
  {
    id v8 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[_ASServiceHelper handleCommand:completion:]";
      __int16 v25 = 2112;
      v26 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", buf, 0x16u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      commandClassName = self->_commandClassName;
      commandInfoDictionary = self->_commandInfoDictionary;
      commandExecutionInfo = self->_commandExecutionInfo;
      *(_DWORD *)buf = 136316162;
      v24 = "-[_ASServiceHelper handleCommand:completion:]";
      __int16 v25 = 2112;
      v26 = v6;
      __int16 v27 = 2112;
      v28 = commandClassName;
      __int16 v29 = 2112;
      v30 = commandInfoDictionary;
      __int16 v31 = 2112;
      v32 = commandExecutionInfo;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Sending %@ during the execution of %@ %@ with info %@.", buf, 0x34u);
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000B628;
    v21[3] = &unk_100014568;
    id v13 = v7;
    id v22 = v13;
    v14 = [(_ASServiceHelper *)self _providerServiceDelegateWithErrorHandler:v21];
    __int16 v15 = self->_commandExecutionInfo;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000B648;
    v17[3] = &unk_100014820;
    __int16 v18 = v6;
    v19 = self;
    id v20 = v13;
    [v14 handleCommand:v18 executionInfo:v15 completion:v17];

    v16 = v22;
    goto LABEL_10;
  }
  if (v7)
  {
    v16 = +[AFError errorWithCode:11];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
LABEL_10:
  }
}

- (BOOL)isDeviceInStarkMode
{
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[_ASServiceHelper isDeviceInStarkMode]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", buf, 0x16u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v8 = 0;
  id v4 = [(_ASServiceHelper *)self _synchronousProviderServiceDelegateWithErrorHandler:&stru_1000147F8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B8F4;
  v6[3] = &unk_100014750;
  v6[4] = buf;
  [v4 getStarkModeWithReply:v6];

  LOBYTE(v4) = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return (char)v4;
}

- (void)isDeviceWatchAuthenticatedWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_isInvalid)
  {
    v5 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[_ASServiceHelper isDeviceWatchAuthenticatedWithCompletion:]";
      __int16 v12 = 2112;
      id v13 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", buf, 0x16u);
    }
  }
  id v6 = [(_ASServiceHelper *)self _providerServiceDelegateWithErrorHandler:&stru_1000147B0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000BB08;
  v8[3] = &unk_1000147D8;
  id v9 = v4;
  id v7 = v4;
  [v6 getWatchAuthenticatedWithReply:v8];
}

- (BOOL)isDeviceInCarDND
{
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[_ASServiceHelper isDeviceInCarDND]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", buf, 0x16u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v8 = 0;
  id v4 = [(_ASServiceHelper *)self _synchronousProviderServiceDelegateWithErrorHandler:&stru_100014790];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000BD44;
  v6[3] = &unk_100014750;
  v6[4] = buf;
  [v4 getCarDNDModeWithReply:v6];

  LOBYTE(v4) = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return (char)v4;
}

- (BOOL)isDeviceLockedWithPasscode
{
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[_ASServiceHelper isDeviceLockedWithPasscode]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", buf, 0x16u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v8 = 0;
  id v4 = [(_ASServiceHelper *)self _synchronousProviderServiceDelegateWithErrorHandler:&stru_100014770];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000BF80;
  v6[3] = &unk_100014750;
  v6[4] = buf;
  [v4 getLockStateWithReply:v6];

  LOBYTE(v4) = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return (char)v4;
}

- (id)assistantLocalizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[ASLocalization sharedLocalization];
  v11 = [v10 localizedStringForKey:v9 table:v8 bundle:v7];

  return v11;
}

- (void)dismissAssistantWithReason:(int64_t)a3
{
  if (self->_isInvalid)
  {
    v5 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315394;
      id v8 = "-[_ASServiceHelper dismissAssistantWithReason:]";
      __int16 v9 = 2112;
      id v10 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", (uint8_t *)&v7, 0x16u);
    }
  }
  id v6 = [(_ASServiceHelper *)self _providerServiceDelegateWithErrorHandler:0];
  [v6 dismissAssistantWithReason:a3];
}

- (void)dismissAssistant
{
  if (self->_isInvalid)
  {
    v3 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315394;
      id v6 = "-[_ASServiceHelper dismissAssistant]";
      __int16 v7 = 2112;
      id v8 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", (uint8_t *)&v5, 0x16u);
    }
  }
  id v4 = [(_ASServiceHelper *)self _providerServiceDelegateWithErrorHandler:0];
  [v4 dismissAssistant];
}

- (BOOL)openSensitiveURL:(id)a3
{
  id v4 = a3;
  int v5 = AFSiriLogContextService;
  if (self->_isInvalid && os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[_ASServiceHelper openSensitiveURL:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s Attempting to access %@ after it has been invalidated.", buf, 0x16u);
    int v5 = AFSiriLogContextService;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[_ASServiceHelper openSensitiveURL:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Trying to open URL %@", buf, 0x16u);
  }
  if (v4)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v17 = 0;
    id v6 = [(_ASServiceHelper *)self _synchronousProviderServiceDelegateWithErrorHandler:&stru_100014728];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000C530;
    v11[3] = &unk_100014750;
    void v11[4] = buf;
    [v6 openURL:v4 reply:v11];

    __int16 v7 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      *(_DWORD *)__int16 v12 = 136315394;
      id v13 = "-[_ASServiceHelper openSensitiveURL:]";
      __int16 v14 = 2112;
      CFStringRef v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Success opening URL? %@", v12, 0x16u);
    }
    BOOL v9 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)invalidate
{
  v3 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "-[_ASServiceHelper invalidate]";
    __int16 v6 = 2112;
    __int16 v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v4, 0x16u);
  }
  self->_isInvalid = 1;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  v10.receiver = self;
  v10.super_class = (Class)_ASServiceHelper;
  int v4 = [(_ASServiceHelper *)&v10 description];
  long long v9 = *(_OWORD *)&self->_commandClassName;
  commandExecutionInfo = self->_commandExecutionInfo;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceClient);
  id v7 = [v3 initWithFormat:@"%@ {commandClass = %@, commandInfo = %@, executionInfo = %@, serviceClient = %@}", v4, v9, commandExecutionInfo, WeakRetained];

  return (NSString *)v7;
}

- (void)dealloc
{
  id v3 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v6 = "-[_ASServiceHelper dealloc]";
    __int16 v7 = 2112;
    CFStringRef v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)_ASServiceHelper;
  [(_ASServiceHelper *)&v4 dealloc];
}

- (_ASServiceHelper)initWithCommandClassName:(id)a3 infoDictionary:(id)a4 executionInfo:(id)a5 serviceClient:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_ASServiceHelper;
  __int16 v14 = [(_ASServiceHelper *)&v24 init];
  CFStringRef v15 = v14;
  if (v14)
  {
    v14->_isInvalid = 0;
    v16 = (NSString *)[v10 copy];
    commandClassName = v15->_commandClassName;
    v15->_commandClassName = v16;

    __int16 v18 = (NSDictionary *)[v11 copy];
    commandInfoDictionary = v15->_commandInfoDictionary;
    v15->_commandInfoDictionary = v18;

    id v20 = (AFCommandExecutionInfo *)[v12 copy];
    commandExecutionInfo = v15->_commandExecutionInfo;
    v15->_commandExecutionInfo = v20;

    objc_storeWeak((id *)&v15->_serviceClient, v13);
    id v22 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[_ASServiceHelper initWithCommandClassName:infoDictionary:executionInfo:serviceClient:]";
      __int16 v27 = 2112;
      v28 = v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }
  }

  return v15;
}

@end