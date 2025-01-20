@interface AXAssistantPauseSpeaking
- (void)performWithCompletion:(id)a3;
@end

@implementation AXAssistantPauseSpeaking

- (void)performWithCompletion:(id)a3
{
  id v3 = a3;
  if (!AXAssistantSendMissingSettingFailure(v3))
  {
    v4 = +[SpeakThisServices sharedInstance];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_3014;
    v5[3] = &unk_40F0;
    id v6 = v3;
    [v4 pauseSpeaking:v5];
  }
}

@end