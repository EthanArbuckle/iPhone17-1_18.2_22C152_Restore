@interface AXCACCustomCommandEditorServiceViewController
- (AXCACCustomCommandEditorServiceViewController)init;
- (CACCustomCommandEditorViewController)editor;
- (UINavigationController)editorNavigationController;
- (int64_t)preferredStatusBarStyle;
- (void)_dismiss;
- (void)_saveCommandItem;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didCancelEditingCustomCommandForEditor:(id)a3;
- (void)didFinishEditingCustomCommandForEditor:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AXCACCustomCommandEditorServiceViewController

- (AXCACCustomCommandEditorServiceViewController)init
{
  v20.receiver = self;
  v20.super_class = (Class)AXCACCustomCommandEditorServiceViewController;
  v2 = [(AXCACCustomCommandEditorServiceViewController *)&v20 init];
  if (v2)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v3 = (void *)qword_10002E738;
    uint64_t v29 = qword_10002E738;
    if (!qword_10002E738)
    {
      v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      v23 = sub_100002C7C;
      v24 = &unk_100024770;
      v25 = &v26;
      sub_100002C7C((uint64_t)&v21);
      v3 = (void *)v27[3];
    }
    v4 = v3;
    _Block_object_dispose(&v26, 8);
    id v5 = objc_alloc_init(v4);
    [v5 setDelegate:v2];
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v6 = (void *)qword_10002E748;
    uint64_t v29 = qword_10002E748;
    if (!qword_10002E748)
    {
      v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      v23 = sub_100002E48;
      v24 = &unk_100024770;
      v25 = &v26;
      sub_100002E48((uint64_t)&v21);
      v6 = (void *)v27[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v26, 8);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v8 = (void *)qword_10002E750;
    uint64_t v29 = qword_10002E750;
    if (!qword_10002E750)
    {
      v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      v23 = sub_100002EA0;
      v24 = &unk_100024770;
      v25 = &v26;
      sub_100002EA0((uint64_t)&v21);
      v8 = (void *)v27[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v26, 8);
    v10 = [v9 sharedPreferences];
    v11 = [v10 bestLocaleIdentifier];
    id v12 = [v7 newCommandItemWithLocale:v11 scope:@"com.apple.speech.SystemWideScope"];
    [v5 setCommandItem:v12];

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"CommandAndControlCustomCommandEditor.new.command" value:&stru_100024F38 table:@"AXUIViewService"];
    [v5 setTitle:v14];

    editor = v2->_editor;
    v2->_editor = (CACCustomCommandEditorViewController *)v5;
    id v16 = v5;

    v17 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v2->_editor];
    editorNavigationController = v2->_editorNavigationController;
    v2->_editorNavigationController = v17;
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AXCACCustomCommandEditorServiceViewController;
  [(AXCACCustomCommandEditorServiceViewController *)&v10 viewDidAppear:a3];
  v4 = [(AXCACCustomCommandEditorServiceViewController *)self view];
  id v5 = [v4 window];
  v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  id v7 = [(AXCACCustomCommandEditorServiceViewController *)self editorNavigationController];
  v8 = [v7 presentationController];
  [v8 setDelegate:self];

  id v9 = [(AXCACCustomCommandEditorServiceViewController *)self editorNavigationController];
  [(AXCACCustomCommandEditorServiceViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)_saveCommandItem
{
  v3 = [(AXCACCustomCommandEditorServiceViewController *)self editor];
  v4 = [v3 commandItem];

  id v5 = [v4 dictionaryForSavingToPreferences];
  if (v5)
  {
    v6 = [v4 identifier];

    if (v6)
    {
      v23[0] = kAXCACCustomCommandIdentifierKey;
      id v7 = [v4 identifier];
      v23[1] = kAXCACCustomCommandDictionaryKey;
      v24[0] = v7;
      v24[1] = v5;
      v8 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
      UIAccessibilityPostNotification(0x7ECu, v8);
    }
    else
    {
      uint64_t v19 = 0;
      objc_super v20 = &v19;
      uint64_t v21 = 0x2020000000;
      id v9 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))off_10002E758;
      uint64_t v22 = off_10002E758;
      if (!off_10002E758)
      {
        v15 = _NSConcreteStackBlock;
        uint64_t v16 = 3221225472;
        v17 = sub_100002EF8;
        v18 = &unk_100024770;
        objc_super v10 = (void *)sub_100002CD4();
        v20[3] = (uint64_t)dlsym(v10, "CACLogPreferences");
        off_10002E758 = (_UNKNOWN *)v20[3];
        id v9 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v9)
      {
        sub_100013028();
        __break(1u);
      }
      id v7 = v9(v11, v12, v13, v14);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10001304C((uint64_t)v5, v7);
      }
    }
  }
  [(AXCACCustomCommandEditorServiceViewController *)self _dismiss];
}

- (void)_dismiss
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000025A4;
  v2[3] = &unk_100024748;
  v2[4] = self;
  [(AXCACCustomCommandEditorServiceViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  v8 = [v6 userInfo];
  id v9 = [v8 objectForKeyedSubscript:AXCACCommandEditorTextToInsertKey];

  objc_super v10 = [v6 userInfo];
  uint64_t v11 = [v10 objectForKeyedSubscript:AXCACCommandEditorGestureKey];

  uint64_t v12 = [v6 userInfo];
  uint64_t v13 = [v12 objectForKeyedSubscript:AXCACCommandEditorUserActionFlowKey];

  uint64_t v14 = [v6 userInfo];
  v15 = [v14 objectForKeyedSubscript:AXCACCommandEditorShortcutWorkflowKey];

  uint64_t v16 = [v6 userInfo];
  uint64_t v17 = [v16 objectForKeyedSubscript:AXCACCommandEditorPasteboardKey];

  if (!v9 && !v11 && !v13)
  {
    v18 = sub_100002AE4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100013250(v6, v18);
    }
  }
  uint64_t v19 = [(AXCACCustomCommandEditorServiceViewController *)self editor];
  objc_super v20 = [v19 commandItem];

  v35 = (void *)v13;
  if (v9)
  {
    if (![v9 length])
    {
      uint64_t v21 = sub_100002AE4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10001320C(v21);
      }
    }
    uint64_t v22 = (void *)v17;
    [v20 setCustomType:@"PasteText"];
    [v20 setCustomTextToInsert:v9];
    goto LABEL_30;
  }
  if (v11)
  {
    uint64_t v22 = (void *)v17;
    v34 = v15;
    id v37 = 0;
    v23 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v37];
    id v24 = v37;
    if (v23)
    {
      [v20 setCustomType:@"RunGesture"];
      [v20 setCustomGesture:v23];
LABEL_29:

      v15 = v34;
      goto LABEL_30;
    }
    v27 = sub_100002AE4();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1000131A4();
    }
    goto LABEL_28;
  }
  if (v13)
  {
    v34 = v15;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2050000000;
    v25 = (void *)qword_10002E768;
    uint64_t v42 = qword_10002E768;
    if (!qword_10002E768)
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100002F98;
      v38[3] = &unk_100024770;
      v38[4] = &v39;
      sub_100002F98((uint64_t)v38);
      v25 = (void *)v40[3];
    }
    uint64_t v22 = (void *)v17;
    id v26 = v25;
    _Block_object_dispose(&v39, 8);
    id v36 = 0;
    v23 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v26 fromData:v35 error:&v36];
    id v24 = v36;
    if (v23)
    {
      [v20 setCustomType:@"RunUserActionFlow"];
      [v20 setCustomUserActionFlow:v23];
      goto LABEL_29;
    }
    v27 = sub_100002AE4();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10001313C();
    }
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v22 = (void *)v17;
  if (v15)
  {
    uint64_t v28 = +[AXSiriShortcutsManager sharedManager];
    uint64_t v29 = [v28 shortcutForIdentifier:v15];

    if (v29)
    {
      [v20 setCustomType:@"RunShortcutsWorkflow"];
      [v20 setCustomShortcutsWorkflowIdentifier:v15];
    }
    else
    {
      v33 = sub_100002AE4();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1000130C4((uint64_t)v15, v33);
      }
    }
  }
LABEL_30:
  v30 = [v6 userInfo];
  v31 = [v30 objectForKeyedSubscript:AXCACCommandEditorApplicationIdentifiersToNamesKey];

  v32 = [(AXCACCustomCommandEditorServiceViewController *)self editor];
  [v32 setApplicationIdentifiersToNames:v31];

  if (v7) {
    v7[2](v7);
  }
}

- (void)didFinishEditingCustomCommandForEditor:(id)a3
{
}

- (void)didCancelEditingCustomCommandForEditor:(id)a3
{
}

- (UINavigationController)editorNavigationController
{
  return self->_editorNavigationController;
}

- (CACCustomCommandEditorViewController)editor
{
  return self->_editor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editor, 0);

  objc_storeStrong((id *)&self->_editorNavigationController, 0);
}

@end