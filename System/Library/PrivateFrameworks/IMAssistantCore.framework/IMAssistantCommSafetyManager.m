@interface IMAssistantCommSafetyManager
- (BOOL)checksForSensitivityOnReceive;
- (BOOL)checksForSensitivityOnSend;
- (IMAssistantCommSafetyManager)initWithCommSafetyRequestsManager:(id)a3 commSafetySettingsManager:(id)a4;
- (IMCommSafetyRequestsManager)commSafetyRequestsManager;
- (IMCommSafetySettingsManager)commSafetySettingsManager;
- (void)isSensitiveContent:(id)a3 withChatID:(id)a4 completionHandler:(id)a5;
@end

@implementation IMAssistantCommSafetyManager

- (IMAssistantCommSafetyManager)initWithCommSafetyRequestsManager:(id)a3 commSafetySettingsManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMAssistantCommSafetyManager;
  v9 = [(IMAssistantCommSafetyManager *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_commSafetyRequestsManager, a3);
    objc_storeStrong((id *)&v10->_commSafetySettingsManager, a4);
    v11 = v10;
  }

  return v10;
}

- (void)isSensitiveContent:(id)a3 withChatID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IMAssistantCommSafetyManager *)self commSafetyRequestsManager];
  [v11 isSensitiveContent:v10 withChatID:v9 completionHandler:v8];
}

- (BOOL)checksForSensitivityOnSend
{
  v2 = [(IMAssistantCommSafetyManager *)self commSafetySettingsManager];
  char v3 = [v2 checksForSensitivityOnSend];

  return v3;
}

- (BOOL)checksForSensitivityOnReceive
{
  v2 = [(IMAssistantCommSafetyManager *)self commSafetySettingsManager];
  char v3 = [v2 checksForSensitivityOnReceive];

  return v3;
}

- (IMCommSafetyRequestsManager)commSafetyRequestsManager
{
  return self->_commSafetyRequestsManager;
}

- (IMCommSafetySettingsManager)commSafetySettingsManager
{
  return self->_commSafetySettingsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commSafetySettingsManager, 0);

  objc_storeStrong((id *)&self->_commSafetyRequestsManager, 0);
}

@end