@interface AssistantBridgeVoiceSelectionTask
- (AFEnablementConfiguration)_loadedConfiguration;
- (AFEnablementFlowConfigurationProvider)_flowConfigurationProvider;
- (AssistantBridgeVoiceSelectionTask)init;
- (NSString)_languageCode;
- (UIViewController)_loadedViewController;
- (id)_pendingVoiceSelectionCompletion;
- (void)_dismissLoadedViewController;
- (void)_executePendingVoiceSelectionCompletionAndDismissViewControllerWithVoiceSelectionRequired:(BOOL)a3 selectedVoice:(id)a4;
- (void)_loadStateWithCompletion:(id)a3;
- (void)_setLoadedConfiguration:(id)a3;
- (void)_setLoadedViewController:(id)a3;
- (void)_setPendingVoiceSelectionCompletion:(id)a3;
- (void)_voiceSelectionCancelled;
- (void)logWhetherSiriWasEnabledAfterCompleted:(BOOL)a3;
- (void)presentVoiceSelectionIfNecessaryFromViewController:(id)a3 completion:(id)a4;
- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4;
@end

@implementation AssistantBridgeVoiceSelectionTask

- (AssistantBridgeVoiceSelectionTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)AssistantBridgeVoiceSelectionTask;
  v2 = [(AssistantBridgeVoiceSelectionTask *)&v6 init];
  if (v2)
  {
    v3 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init((Class)AFEnablementFlowConfigurationProvider);
    flowConfigurationProvider = v2->_flowConfigurationProvider;
    v2->_flowConfigurationProvider = v3;
  }
  return v2;
}

- (void)presentVoiceSelectionIfNecessaryFromViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(AssistantBridgeVoiceSelectionTask *)self _setPendingVoiceSelectionCompletion:a4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_97F8;
  v8[3] = &unk_10630;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(AssistantBridgeVoiceSelectionTask *)self _loadStateWithCompletion:v8];
}

- (void)_dismissLoadedViewController
{
  id v2 = [(AssistantBridgeVoiceSelectionTask *)self _loadedViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
}

- (void)_loadStateWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = [(AssistantBridgeVoiceSelectionTask *)self _loadedConfiguration];
  if (v5)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    id v6 = [(AssistantBridgeVoiceSelectionTask *)self _languageCode];
    id v7 = [(AssistantBridgeVoiceSelectionTask *)self _flowConfigurationProvider];
    v13 = v6;
    v8 = +[NSArray arrayWithObjects:&v13 count:1];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_9A64;
    v10[3] = &unk_10680;
    v10[4] = self;
    id v11 = v6;
    v12 = v4;
    id v9 = v6;
    [v7 configurationForEnablementFlow:7 recognitionLanguageCodes:v8 completion:v10];
  }
}

- (NSString)_languageCode
{
  id v2 = +[AFPreferences sharedPreferences];
  v3 = [v2 nanoLanguageCode];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 bestSupportedLanguageCodeForLanguageCode:0];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (void)_voiceSelectionCancelled
{
}

- (void)_executePendingVoiceSelectionCompletionAndDismissViewControllerWithVoiceSelectionRequired:(BOOL)a3 selectedVoice:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  uint64_t v6 = [(AssistantBridgeVoiceSelectionTask *)self _pendingVoiceSelectionCompletion];
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, BOOL, id))(v6 + 16))(v6, v4, v8);
  }
  [(AssistantBridgeVoiceSelectionTask *)self _setPendingVoiceSelectionCompletion:0];
  [(AssistantBridgeVoiceSelectionTask *)self _dismissLoadedViewController];
}

- (void)logWhetherSiriWasEnabledAfterCompleted:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_9E88;
  v3[3] = &unk_106A8;
  v3[4] = self;
  BOOL v4 = a3;
  [(AssistantBridgeVoiceSelectionTask *)self _loadStateWithCompletion:v3];
}

- (AFEnablementFlowConfigurationProvider)_flowConfigurationProvider
{
  return self->_flowConfigurationProvider;
}

- (AFEnablementConfiguration)_loadedConfiguration
{
  return self->_loadedConfiguration;
}

- (void)_setLoadedConfiguration:(id)a3
{
}

- (UIViewController)_loadedViewController
{
  return self->_loadedViewController;
}

- (void)_setLoadedViewController:(id)a3
{
}

- (id)_pendingVoiceSelectionCompletion
{
  return self->_pendingVoiceSelectionCompletion;
}

- (void)_setPendingVoiceSelectionCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingVoiceSelectionCompletion, 0);
  objc_storeStrong((id *)&self->_loadedViewController, 0);
  objc_storeStrong((id *)&self->_loadedConfiguration, 0);

  objc_storeStrong((id *)&self->_flowConfigurationProvider, 0);
}

@end