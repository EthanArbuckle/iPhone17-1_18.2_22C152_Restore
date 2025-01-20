@interface ToggleSoundDetectionIntentHandler
- (void)handleToggleSoundDetection:(id)a3 completion:(id)a4;
- (void)resolveOperationForToggleSoundDetection:(id)a3 withCompletion:(id)a4;
@end

@implementation ToggleSoundDetectionIntentHandler

- (void)handleToggleSoundDetection:(id)a3 completion:(id)a4
{
  v5 = (__CFString *)a3;
  v6 = (void (**)(id, AXToggleSoundDetectionIntentResponse *))a4;
  v7 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    CFStringRef v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "ToggleSoundDetectionIntentHandler: Handling intent %@", (uint8_t *)&v16, 0xCu);
  }

  if ([(__CFString *)v5 operation] == (id)1)
  {
    v8 = +[AXSDSettings sharedInstance];
    BOOL v9 = [v8 soundDetectionState] != (id)2;
  }
  else
  {
    BOOL v9 = [(__CFString *)v5 operation] == (id)2;
  }
  v10 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    CFStringRef v11 = @"NO";
    if (v9) {
      CFStringRef v11 = @"YES";
    }
    int v16 = 138412290;
    CFStringRef v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "SoundDetectionIntentHandler. Turning Sound Detection %@", (uint8_t *)&v16, 0xCu);
  }

  v12 = +[AXSDSettings sharedInstance];
  v13 = v12;
  if (v9) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  [v12 setSoundDetectionState:v14];

  v15 = [[AXToggleSoundDetectionIntentResponse alloc] initWithCode:4 userActivity:0];
  v6[2](v6, v15);
}

- (void)resolveOperationForToggleSoundDetection:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXSoundDetectionOperationResolutionResult successWithResolvedSoundDetectionOperation:](AXSoundDetectionOperationResolutionResult, "successWithResolvedSoundDetectionOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

@end