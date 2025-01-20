@interface ADAlarmTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4;
@end

@implementation ADAlarmTransformer

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    v15 = "-[ADAlarmTransformer aceCommandForSiriResponse:responseError:forRequestCommand:]";
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Got alarm response %@ for request %@", (uint8_t *)&v14, 0x20u);
  }
  if (v8)
  {
    objc_msgSend(v9, "ad_aceResponseCommandGenericErrorRepresentation");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v9, "_ad_alarmResponseForResponse:", v7);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = objc_alloc_init((Class)SACommandFailed);
  }
  v12 = v11;

  return v12;
}

- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4
{
}

@end