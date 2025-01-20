@interface ADSessionRemoteServerLimited
- (BOOL)_sessionRequiresConnection;
- (id)initOnQueue:(id)a3 withAccount:(id)a4 languageCode:(id)a5 connectionMode:(id)a6 sharedUserIdentifier:(id)a7 loggingSharedUserIdentifier:(id)a8 instanceContext:(id)a9;
- (void)_saCommandFailed:(id)a3;
- (void)_siriConnection:(id)a3 didEncounterIntermediateError:(id)a4;
- (void)_siriConnection:(id)a3 siriNetworkConnection:(id)a4 didEncounterError:(id)a5 siriCoreAnalysisInfo:(id)a6 siriNetworkAnalysisInfo:(id)a7;
@end

@implementation ADSessionRemoteServerLimited

- (BOOL)_sessionRequiresConnection
{
  unsigned __int8 v3 = [(ADSession *)self sessionRequiresServerConnection];
  unsigned int v4 = [(ADSession *)self sessionRequiresSync];
  if ((v3 & 1) == 0 && v4)
  {
    v5 = [(ADSession *)self _requestId];
    unsigned __int8 v3 = v5 == 0;
  }
  return v3;
}

- (void)_siriConnection:(id)a3 didEncounterIntermediateError:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  unsigned int v8 = [(ADSessionRemoteServerLimited *)self _sessionRequiresConnection];
  v9 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    CFStringRef v10 = @"not ";
    *(_DWORD *)buf = 136315650;
    v14 = "-[ADSessionRemoteServerLimited _siriConnection:didEncounterIntermediateError:]";
    __int16 v15 = 2112;
    if (v8) {
      CFStringRef v10 = &stru_10050F7D8;
    }
    CFStringRef v16 = v10;
    __int16 v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Server connection %@required for intermediate error %@", buf, 0x20u);
  }
  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)ADSessionRemoteServerLimited;
    [(ADSessionRemoteServer *)&v12 _siriConnection:v6 didEncounterIntermediateError:v7];
  }
  else
  {
    v11 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[ADSessionRemoteServerLimited _siriConnection:didEncounterIntermediateError:]";
      __int16 v15 = 2112;
      CFStringRef v16 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Ignoring intermediate error %@ from server", buf, 0x16u);
    }
  }
}

- (void)_saCommandFailed:(id)a3
{
  unsigned int v4 = (__CFString *)a3;
  unsigned int v5 = [(ADSessionRemoteServerLimited *)self _sessionRequiresConnection];
  id v6 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    CFStringRef v7 = @"not ";
    *(_DWORD *)buf = 136315650;
    v11 = "-[ADSessionRemoteServerLimited _saCommandFailed:]";
    __int16 v12 = 2112;
    if (v5) {
      CFStringRef v7 = &stru_10050F7D8;
    }
    CFStringRef v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Server connection %@required for %@", buf, 0x20u);
  }
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)ADSessionRemoteServerLimited;
    [(ADSessionRemoteServer *)&v9 _saCommandFailed:v4];
  }
  else
  {
    unsigned int v8 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[ADSessionRemoteServerLimited _saCommandFailed:]";
      __int16 v12 = 2112;
      CFStringRef v13 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Ignoring %@ from server", buf, 0x16u);
    }
  }
}

- (void)_siriConnection:(id)a3 siriNetworkConnection:(id)a4 didEncounterError:(id)a5 siriCoreAnalysisInfo:(id)a6 siriNetworkAnalysisInfo:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(ADSessionRemoteServer *)self connection];
  if ((id)v17 == v12)
  {
  }
  else
  {
    v18 = (void *)v17;
    id v19 = [(ADSessionRemoteServer *)self siriNetworkConnection];

    if (v19 != v13) {
      goto LABEL_18;
    }
  }
  v20 = [v14 domain];
  if ([v20 isEqualToString:SiriCoreSiriConnectionErrorDomain]) {
    BOOL v21 = [v14 code] == (id)4;
  }
  else {
    BOOL v21 = 0;
  }

  v22 = [v14 domain];
  if ([v22 isEqualToString:SiriNetworkNetworkConnectionErrorDomain]) {
    BOOL v23 = [v14 code] == (id)6;
  }
  else {
    BOOL v23 = 0;
  }

  if (!v21 && !v23) {
    goto LABEL_17;
  }
  unsigned int v24 = [(ADSessionRemoteServerLimited *)self _sessionRequiresConnection];
  v25 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    CFStringRef v26 = @"not ";
    if (v24) {
      CFStringRef v26 = &stru_10050F7D8;
    }
    *(_DWORD *)buf = 136315394;
    v29 = "-[ADSessionRemoteServerLimited _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:si"
          "riNetworkAnalysisInfo:]";
    __int16 v30 = 2112;
    CFStringRef v31 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s Server connection %@required for connection open timeout", buf, 0x16u);
  }
  if (v24)
  {
LABEL_17:
    v27.receiver = self;
    v27.super_class = (Class)ADSessionRemoteServerLimited;
    [(ADSessionRemoteServer *)&v27 _siriConnection:v12 siriNetworkConnection:v13 didEncounterError:v14 siriCoreAnalysisInfo:v15 siriNetworkAnalysisInfo:v16];
  }
LABEL_18:
}

- (id)initOnQueue:(id)a3 withAccount:(id)a4 languageCode:(id)a5 connectionMode:(id)a6 sharedUserIdentifier:(id)a7 loggingSharedUserIdentifier:(id)a8 instanceContext:(id)a9
{
  v15.receiver = self;
  v15.super_class = (Class)ADSessionRemoteServerLimited;
  id v9 = [(ADSessionRemoteServer *)&v15 initOnQueue:a3 withAccount:a4 languageCode:a5 connectionMode:a6 sharedUserIdentifier:a7 loggingSharedUserIdentifier:a8 instanceContext:a9];
  CFStringRef v10 = v9;
  if (v9)
  {
    [v9 setSessionType:1];
    id v11 = objc_alloc((Class)NSString);
    id v12 = +[NSNumber numberWithUnsignedInt:arc4random()];
    id v13 = [v11 initWithFormat:@"%@.%@", &off_100523918, v12];
    [v10 _setSessionId:v13];
  }
  return v10;
}

@end