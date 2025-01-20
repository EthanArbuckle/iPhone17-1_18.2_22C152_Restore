@interface ADAceDomainSignalRequestHandler
- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation ADAceDomainSignalRequestHandler

- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(void))a4;
  id v9 = a5;
  if (v8) {
    v8[2](v8);
  }
  v10 = objc_msgSend(v7, "_ad_preheatableServiceDomainForDomainSignalRequest");
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    v14 = "-[ADAceDomainSignalRequestHandler handleSiriRequest:deliveryHandler:completionHandler:]";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v13, 0x20u);
  }
  if (v10)
  {
    v12 = +[ADCommandCenter sharedCommandCenter];
    [v12 preheatServicesForDomain:v10];
  }
  objc_msgSend(v7, "_ad_handleAceDomainSignalRequestWithCompletionHandler:", v9);
}

@end