@interface AXDeviceRemoteScreenUIServiceObjc
+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3;
+ (id)sharedInstance;
- (BOOL)shouldPreventAutorotatingAllContentViewControllers;
- (_TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService)service;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3;
- (void)setService:(id)a3;
@end

@implementation AXDeviceRemoteScreenUIServiceObjc

+ (id)sharedInstance
{
  if (qword_CC20 != -1) {
    dispatch_once(&qword_CC20, &stru_8408);
  }
  v2 = (void *)qword_CC18;

  return v2;
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  v12 = [(AXDeviceRemoteScreenUIServiceObjc *)self service];
  v13 = [v12 processMessage:v11 withIdentifier:a4 fromClientWithIdentifier:v10 error:a6];

  return v13;
}

+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3
{
  return +[AXDeviceRemoteScreenUIService possibleRequiredEntitlementsForProcessingMessageWithIdentifier:a3];
}

- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = AXLogTwiceRemoteScreen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[AXDeviceRemoteScreenUIServiceObjc connectionWillBeInterruptedForClientWithIdentifier:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[TWICE]: %s, %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = [(AXDeviceRemoteScreenUIServiceObjc *)self service];
  [v6 clientConnectionWasInterrupted];
}

- (BOOL)shouldPreventAutorotatingAllContentViewControllers
{
  return 1;
}

- (_TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end