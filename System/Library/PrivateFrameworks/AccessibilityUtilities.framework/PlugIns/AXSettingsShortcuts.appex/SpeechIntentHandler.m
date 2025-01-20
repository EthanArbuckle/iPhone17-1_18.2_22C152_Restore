@interface SpeechIntentHandler
- (void)handleStartSpeakScreen:(id)a3 completion:(id)a4;
@end

@implementation SpeechIntentHandler

- (void)handleStartSpeakScreen:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, AXStartSpeakScreenIntentResponse *))a4;
  v7 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SpeakScreenIntentHandler: Handling intent %@", (uint8_t *)&v10, 0xCu);
  }

  _AXSSetSpeakThisEnabled();
  v8 = +[SpeakThisServices sharedInstance];
  [v8 speakThisWithOptions:12 errorHandler:0];

  v9 = [[AXStartSpeakScreenIntentResponse alloc] initWithCode:4 userActivity:0];
  v6[2](v6, v9);
}

@end