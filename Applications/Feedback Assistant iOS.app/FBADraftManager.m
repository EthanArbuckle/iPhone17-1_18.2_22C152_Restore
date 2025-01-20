@interface FBADraftManager
+ (id)sharedInstance;
- (BOOL)hasOpenDraft;
- (BOOL)hasOpenModalFeedbackController;
- (BOOL)inboxLiteMode;
- (FBADraftManager)init;
- (id)appStoryboard;
- (id)draftController;
- (id)mainViewController;
- (id)modalFeedbackEditor;
- (id)rootController;
- (void)beginFeedbackForSurvey:(id)a3 contentItem:(id)a4 forTeam:(id)a5;
- (void)beginFeedbackForTeam:(id)a3 sender:(id)a4;
- (void)beginFeedbackWithDraft:(id)a3;
- (void)deleteDraftFromContentItem:(id)a3 dismissViewOnCompletion:(BOOL)a4;
- (void)reloadApp;
- (void)resetViewControllers;
- (void)respondToLaunchAction:(id)a3;
- (void)saveDraftIfNeeded;
- (void)setInboxLiteMode:(BOOL)a3;
- (void)showDraftAttachmentOptionsWithAction:(id)a3;
- (void)showModalFeedbackControllerForContentItem:(id)a3 launchAction:(id)a4;
@end

@implementation FBADraftManager

+ (id)sharedInstance
{
  if (qword_100124130 != -1) {
    dispatch_once(&qword_100124130, &stru_1000F3908);
  }
  v2 = (void *)qword_100124128;

  return v2;
}

- (FBADraftManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBADraftManager;
  result = [(FBADraftManager *)&v3 init];
  if (result) {
    result->_inboxLiteMode = 0;
  }
  return result;
}

- (void)reloadApp
{
  id v2 = [(FBADraftManager *)self mainViewController];
  [v2 reloadApp];
}

- (id)appStoryboard
{
  id v2 = [(FBADraftManager *)self rootController];
  objc_super v3 = [v2 storyboard];

  return v3;
}

- (void)respondToLaunchAction:(id)a3
{
  id v4 = a3;
  v5 = +[FBALog appHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 action];
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Responding to launch action [%{public}@]", buf, 0xCu);
  }
  [(FBADraftManager *)self resetViewControllers];
  if ([v4 showsItem]) {
    goto LABEL_12;
  }
  if ([v4 launchesSurvey])
  {
    if ([(FBADraftManager *)self hasOpenDraft])
    {
      v7 = [(FBADraftManager *)self draftController];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100039C68;
      v13[3] = &unk_1000F26D8;
      v13[4] = self;
      id v14 = v4;
      [v7 closeWithCompletion:v13];

      v8 = v14;
LABEL_18:

      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (![v4 launchesFeedback])
  {
    if (![v4 launchesBatchUI])
    {
      v9 = +[FBALog appHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000A608C(v4);
      }
      goto LABEL_13;
    }
LABEL_12:
    v9 = [(FBADraftManager *)self mainViewController];
    [v9 respondToUrlAction:v4];
LABEL_13:

    goto LABEL_14;
  }
  if (![(FBADraftManager *)self hasOpenDraft]) {
    goto LABEL_12;
  }
  if (![v4 hasAttachments])
  {
    v10 = [(FBADraftManager *)self draftController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100039CBC;
    v11[3] = &unk_1000F26D8;
    v11[4] = self;
    id v12 = v4;
    [v10 closeWithCompletion:v11];

    v8 = v12;
    goto LABEL_18;
  }
  [(FBADraftManager *)self showDraftAttachmentOptionsWithAction:v4];
LABEL_14:
}

- (void)beginFeedbackForSurvey:(id)a3 contentItem:(id)a4 forTeam:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 draftResponsesContentItemsForTeam:v10];
  if ([v11 count])
  {
    id v12 = [v11 ded_findWithBlock:&stru_1000F3948];
    v13 = +[FBALog appHandle];
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        v15 = [v9 ID];
        int v21 = 67109120;
        unsigned int v22 = [v15 intValue];
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Will edit survey with ID [%i] with form response", (uint8_t *)&v21, 8u);
      }
      [(FBADraftManager *)self beginFeedbackWithDraft:v12];
    }
    else
    {
      if (v14)
      {
        v19 = [v9 ID];
        int v21 = 67109120;
        unsigned int v22 = [v19 intValue];
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Will edit survey with ID [%i] with form item", (uint8_t *)&v21, 8u);
      }
      v20 = [v11 anyObject];
      [(FBADraftManager *)self beginFeedbackWithDraft:v20];
    }
  }
  else
  {
    unsigned int v16 = [v8 canTakeForTeam:v10];
    v17 = +[FBALog appHandle];
    id v12 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = [v9 ID];
        int v21 = 67109120;
        unsigned int v22 = [v18 intValue];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Will start draft for survey with ID [%i]", (uint8_t *)&v21, 8u);
      }
      id v12 = [(FBADraftManager *)self mainViewController];
      [v12 beginFeedbackForSurvey:v8 forTeam:v10];
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      sub_1000A611C(v9);
    }
  }
}

- (void)beginFeedbackWithDraft:(id)a3
{
  id v4 = a3;
  if ([v4 itemType] == (id)1)
  {
    v5 = [(FBADraftManager *)self mainViewController];
    [v5 beginFeedbackWithDraftItem:v4];
  }
  else
  {
    v5 = +[FBALog appHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000A61B0(v4);
    }
  }
}

- (void)beginFeedbackForTeam:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBADraftManager *)self mainViewController];
  [v8 beginBugForTeam:v7 sender:v6];
}

- (void)deleteDraftFromContentItem:(id)a3 dismissViewOnCompletion:(BOOL)a4
{
  id v6 = a3;
  id v7 = _os_activity_create((void *)&_mh_execute_header, "Destroying Form Response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A1AC;
  block[3] = &unk_1000F3998;
  BOOL v12 = a4;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  os_activity_apply(v7, block);
}

- (BOOL)hasOpenDraft
{
  objc_super v3 = [(FBADraftManager *)self draftController];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(FBADraftManager *)self hasOpenModalFeedbackController];
  }

  return v4;
}

- (BOOL)hasOpenModalFeedbackController
{
  id v2 = [(FBADraftManager *)self rootController];
  objc_super v3 = [v2 presentedViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v3 topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)resetViewControllers
{
  id v2 = [(FBADraftManager *)self rootController];
  [v2 resetViewControllers:1];
}

- (void)showModalFeedbackControllerForContentItem:(id)a3 launchAction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBADraftManager *)self appStoryboard];
  id v12 = [v8 instantiateViewControllerWithIdentifier:@"iFBAFollowupViewController"];

  [v12 setContentItem:v7];
  [v12 setLaunchAction:v6];

  id v9 = [v12 navigationItem];
  [v9 setRightBarButtonItem:0];

  id v10 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v12];
  [v10 setModalInPresentation:1];
  v11 = [(FBADraftManager *)self rootController];
  [v11 presentViewController:v10 animated:1 completion:0];
}

- (void)showDraftAttachmentOptionsWithAction:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"DRAFT_ALREADY_OPEN_ALERT_TITLE" value:&stru_1000F6658 table:0];
  id v7 = +[UIAlertController alertControllerWithTitle:v6 message:0 preferredStyle:1];

  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"CANCEL" value:&stru_1000F6658 table:0];
  int v21 = +[UIAlertAction actionWithTitle:v9 style:1 handler:&stru_1000F39B8];

  [v7 addAction:v21];
  id v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"DRAFT_ALREADY_OPEN_ALERT_ADD_CHOICE" value:&stru_1000F6658 table:0];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003A968;
  v24[3] = &unk_1000F2818;
  v24[4] = self;
  id v12 = v4;
  id v25 = v12;
  v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v24];

  [v7 addAction:v13];
  BOOL v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"DRAFT_ALREADY_OPEN_ALERT_NEW_CHOICE" value:&stru_1000F6658 table:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003A9D4;
  v22[3] = &unk_1000F2818;
  v22[4] = self;
  id v23 = v12;
  id v16 = v12;
  v17 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v22];

  [v7 addAction:v17];
  v18 = +[iFBAConstants tintColor];
  v19 = [v7 view];
  [v19 setTintColor:v18];

  v20 = [(FBADraftManager *)self draftController];
  [v20 presentViewController:v7 animated:1 completion:0];
}

- (void)saveDraftIfNeeded
{
  unsigned int v3 = [(FBADraftManager *)self hasOpenDraft];
  id v4 = +[FBALog appHandle];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FBA has open draft", buf, 2u);
    }

    id v6 = [(FBADraftManager *)self draftController];
    v5 = [v6 draftingController];

    id v7 = [v5 formResponse];
    if (v5)
    {
      if ([v5 isSubmitting])
      {
        id v8 = +[FBALog appHandle];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v9 = "FBA is submitting, no need to save draft.";
          id v10 = v8;
          os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
          uint32_t v12 = 2;
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
      if (v7)
      {
        v13 = [v7 ID];
        id v14 = [v13 intValue];

        unsigned int v15 = [v5 isDirty];
        id v16 = +[FBALog appHandle];
        id v8 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FBA has dirty draft response", buf, 2u);
          }

          v17 = +[UIApplication sharedApplication];
          *(void *)buf = 0;
          v32 = buf;
          uint64_t v33 = 0x2020000000;
          uint64_t v34 = 0;
          v18 = +[UIApplication sharedApplication];
          v19 = +[NSString stringWithFormat:@"save-%d", v14];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10003AEDC;
          v27[3] = &unk_1000F39E0;
          int v30 = (int)v14;
          id v20 = v17;
          id v28 = v20;
          v29 = buf;
          id v21 = [v18 beginBackgroundTaskWithName:v19 expirationHandler:v27];

          *((void *)v32 + 3) = v21;
          unsigned int v22 = +[FBKData sharedInstance];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10003AF58;
          v23[3] = &unk_1000F3A08;
          id v8 = v20;
          v24 = v8;
          id v25 = buf;
          int v26 = (int)v14;
          [v22 saveFormResponse:v7 completion:v23];

          _Block_object_dispose(buf, 8);
          goto LABEL_20;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v14;
          id v9 = "FR [%d] is not dirty, nothing to save";
          id v10 = v8;
          os_log_type_t v11 = OS_LOG_TYPE_INFO;
          uint32_t v12 = 8;
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    id v8 = +[FBALog appHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000A62AC(v8);
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "No open draft, nothing to save", buf, 2u);
  }
LABEL_21:
}

- (id)draftController
{
  return [(FBADraftManager *)self modalFeedbackEditor];
}

- (id)modalFeedbackEditor
{
  id v2 = [(FBADraftManager *)self mainViewController];
  unsigned int v3 = [v2 presentedViewController];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 viewControllers];
      v5 = [v4 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_6;
      }
    }
  }
  v5 = 0;
LABEL_6:
  id v6 = +[FBALog appHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000A636C((uint64_t)v5, v6);
  }

  return v5;
}

- (id)mainViewController
{
  id v2 = [(FBADraftManager *)self rootController];
  unsigned int v3 = [v2 viewControllerForColumn:0];

  id v4 = [v3 viewControllers];
  v5 = [v4 ded_findWithBlock:&stru_1000F3A28];

  return v5;
}

- (id)rootController
{
  id v2 = +[UIApplication sharedApplication];
  unsigned int v3 = [v2 delegate];
  id v4 = [v3 window];
  v5 = [v4 rootViewController];

  return v5;
}

- (BOOL)inboxLiteMode
{
  return self->_inboxLiteMode;
}

- (void)setInboxLiteMode:(BOOL)a3
{
  self->_inboxLiteMode = a3;
}

@end