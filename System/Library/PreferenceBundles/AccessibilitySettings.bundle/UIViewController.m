@interface UIViewController
- (void)accessibilityPerformTripleClickAddingBlockConfirmingSOSConflicts:(id)a3 cancellationBlock:(id)a4;
- (void)accessibilityPresentMedinaPreboardAlertWithTitle:(id)a3 message:(id)a4 completionBlock:(id)a5 cancellationBlock:(id)a6;
- (void)clarityUI_presentLearnMoreViewForTopicID:(id)a3;
- (void)resetAllSettings;
@end

@implementation UIViewController

- (void)accessibilityPerformTripleClickAddingBlockConfirmingSOSConflicts:(id)a3 cancellationBlock:(id)a4
{
  v6 = (Block_layout *)a3;
  v7 = (Block_layout *)a4;
  v8 = v6;
  if (!v6)
  {
    _AXAssert();
    v8 = &__block_literal_global_438;
  }
  v9 = objc_retainBlock(v8);
  if (v7) {
    v10 = v7;
  }
  else {
    v10 = &__block_literal_global_440;
  }
  v11 = objc_retainBlock(v10);
  if (AXDeviceHasHomeButton()) {
    goto LABEL_11;
  }
  v12 = (void *)_AXSTripleClickCopyOptions();
  if ([v12 count])
  {

LABEL_11:
    v9->invoke(v9);
    goto LABEL_12;
  }
  v13 = (char *)+[SOSUtilities currentSOSTriggerMechanism];

  if (v13 != (unsigned char *)&dword_0 + 1) {
    goto LABEL_11;
  }
  v14 = settingsLocString(@"TripleClick_SOS_Conflict_Title", @"Accessibility");
  v15 = settingsLocString(@"TripleClick_SOS_Conflict_Message", @"Accessibility");
  v16 = +[UIAlertController alertControllerWithTitle:v14 message:v15 preferredStyle:1];

  v17 = settingsLocString(@"CONTINUE", @"Accessibility");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __135__UIViewController_AXTripleClickConflictAvoidance__accessibilityPerformTripleClickAddingBlockConfirmingSOSConflicts_cancellationBlock___block_invoke_3;
  v23[3] = &unk_2088D0;
  v24 = v9;
  v18 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v23];
  [v16 addAction:v18];

  v19 = settingsLocString(@"CANCEL", @"Accessibility");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __135__UIViewController_AXTripleClickConflictAvoidance__accessibilityPerformTripleClickAddingBlockConfirmingSOSConflicts_cancellationBlock___block_invoke_464;
  v21[3] = &unk_2088D0;
  v22 = v11;
  v20 = +[UIAlertAction actionWithTitle:v19 style:1 handler:v21];
  [v16 addAction:v20];

  [(UIViewController *)self presentViewController:v16 animated:1 completion:0];
LABEL_12:
}

void __135__UIViewController_AXTripleClickConflictAvoidance__accessibilityPerformTripleClickAddingBlockConfirmingSOSConflicts_cancellationBlock___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.SOS"];
  [v2 setObject:&off_2290A8 forKey:@"SOSTriggerMechanismKey"];
  [v2 setObject:&__kCFBooleanFalse forKey:@"SOSCallWithSideButtonPressesKey"];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, SOSTriggerMechanismChangedNotification, 0, 0, 1u);
}

uint64_t __135__UIViewController_AXTripleClickConflictAvoidance__accessibilityPerformTripleClickAddingBlockConfirmingSOSConflicts_cancellationBlock___block_invoke_464(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)accessibilityPresentMedinaPreboardAlertWithTitle:(id)a3 message:(id)a4 completionBlock:(id)a5 cancellationBlock:(id)a6
{
  if (a5) {
    v9 = (Block_layout *)a5;
  }
  else {
    v9 = &__block_literal_global_466;
  }
  v10 = (Block_layout *)a6;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_retainBlock(v9);
  if (v10) {
    v14 = v10;
  }
  else {
    v14 = &__block_literal_global_468;
  }
  v15 = objc_retainBlock(v14);

  v16 = +[UIAlertController alertControllerWithTitle:v12 message:v11 preferredStyle:1];

  v17 = settingsLocString(@"SECURE_INTENT_CUSTOM_SOUND_CANCEL", @"Accessibility-MedinaPreBoard");
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __141__UIViewController_AXMedinaPreboardSecureIntent__accessibilityPresentMedinaPreboardAlertWithTitle_message_completionBlock_cancellationBlock___block_invoke_3;
  v28[3] = &unk_2088D0;
  v29 = v15;
  v18 = v15;
  v19 = +[UIAlertAction actionWithTitle:v17 style:1 handler:v28];

  [v16 addAction:v19];
  v20 = settingsLocString(@"SECURE_INTENT_CUSTOM_SOUND_REBOOT", @"Accessibility-MedinaPreBoard");
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = __141__UIViewController_AXMedinaPreboardSecureIntent__accessibilityPresentMedinaPreboardAlertWithTitle_message_completionBlock_cancellationBlock___block_invoke_4;
  v26 = &unk_2088D0;
  v27 = v13;
  v21 = v13;
  v22 = +[UIAlertAction actionWithTitle:v20 style:2 handler:&v23];

  objc_msgSend(v16, "addAction:", v22, v23, v24, v25, v26);
  [(UIViewController *)self presentViewController:v16 animated:1 completion:0];
}

uint64_t __141__UIViewController_AXMedinaPreboardSecureIntent__accessibilityPresentMedinaPreboardAlertWithTitle_message_completionBlock_cancellationBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __141__UIViewController_AXMedinaPreboardSecureIntent__accessibilityPresentMedinaPreboardAlertWithTitle_message_completionBlock_cancellationBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clarityUI_presentLearnMoreViewForTopicID:(id)a3
{
  id v7 = a3;
  v4 = (void *)MGCopyAnswer();
  v5 = +[HLPHelpViewController helpViewControllerWithIdentifier:@"assistive-access" version:v4];
  if (v7) {
    [v5 setSelectedHelpTopicID:v7];
  }
  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
  [v6 setModalPresentationStyle:2];
  [(UIViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)resetAllSettings
{
  _AXSClarityUISetEnabled();
  id v2 = +[CLFSettings sharedInstance];
  [v2 deleteAllKeys];

  v3 = +[CLFPhoneFaceTimeSettings sharedInstance];
  [v3 deleteAllKeys];

  v4 = +[CLFMessagesSettings sharedInstance];
  [v4 deleteAllKeys];

  v5 = +[CLFMusicSettings sharedInstance];
  [v5 deleteAllKeys];

  id v6 = +[CLFCameraSettings sharedInstance];
  [v6 deleteAllKeys];

  id v7 = +[CLFPhotosSettings sharedInstance];
  [v7 deleteAllKeys];
}

@end