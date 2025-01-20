@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.siri.opportune_speaking_model_service"];

  if (v5)
  {
    v6 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      v11 = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s %@ connected", (uint8_t *)&v10, 0x16u);
    }
    v7 = AFOpportuneSpeakingModelServiceInterface();
    [v4 setExportedInterface:v7];

    v8 = objc_opt_new();
    [v4 setExportedObject:v8];
    [v4 resume];
  }
  return v5 != 0;
}

@end