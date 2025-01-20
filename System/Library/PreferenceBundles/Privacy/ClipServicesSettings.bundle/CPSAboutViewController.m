@interface CPSAboutViewController
- (CPSAboutViewController)init;
- (OBTextWelcomeController)textController;
- (void)donePressed;
- (void)setTextController:(id)a3;
@end

@implementation CPSAboutViewController

- (CPSAboutViewController)init
{
  v32.receiver = self;
  v32.super_class = (Class)CPSAboutViewController;
  v2 = [(CPSAboutViewController *)&v32 init];
  if (v2)
  {
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2050000000;
    v3 = (void *)qword_1A228;
    uint64_t v37 = qword_1A228;
    if (!qword_1A228)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_A060;
      v33[3] = &unk_14790;
      v33[4] = &v34;
      sub_A060((uint64_t)v33);
      v3 = (void *)v35[3];
    }
    v4 = v3;
    _Block_object_dispose(&v34, 8);
    id v5 = [v4 alloc];
    v6 = _CPSLocalizedString();
    id v7 = [v5 initWithTitle:v6 detailText:0 symbolName:0];
    [(CPSAboutViewController *)v2 setTextController:v7];

    v8 = [(CPSAboutViewController *)v2 textController];
    v9 = sub_9F38(@"APP_CLIPS_LEARN_MORE");
    [v8 addSectionWithHeader:0 content:v9];

    v10 = [(CPSAboutViewController *)v2 textController];
    v11 = sub_9F38(@"LOCATION_CONFIRMATION_TITLE");
    v12 = sub_9F38(@"LOCATION_CONFIRMATION_SECTION");
    [v10 addSectionWithHeader:v11 content:v12];

    v13 = [(CPSAboutViewController *)v2 textController];
    v14 = sub_9F38(@"NOTIFICATIONS_TITLE");
    v15 = sub_9F38(@"NOTIFICATIONS_SECTION");
    [v13 addSectionWithHeader:v14 content:v15];

    v16 = [(CPSAboutViewController *)v2 textController];
    v17 = sub_9F38(@"MANAGE_TITLE");
    v18 = sub_9F38(@"MANAGE_SECTION");
    [v16 addSectionWithHeader:v17 content:v18];

    v19 = [(CPSAboutViewController *)v2 textController];
    v20 = sub_9F38(@"SHARING_TITLE");
    v21 = sub_9F38(@"SHARING_SECTION");
    [v19 addSectionWithHeader:v20 content:v21];

    v22 = [(CPSAboutViewController *)v2 textController];
    v23 = sub_9F38(@"RETENTION_TITLE");
    v24 = sub_9F38(@"RETENTION_SECTION");
    [v22 addSectionWithHeader:v23 content:v24];

    v25 = [(CPSAboutViewController *)v2 textController];
    v38 = v25;
    v26 = +[NSArray arrayWithObjects:&v38 count:1];
    [(CPSAboutViewController *)v2 setViewControllers:v26];

    id v27 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v2 action:"donePressed"];
    v28 = [(CPSAboutViewController *)v2 textController];
    v29 = [v28 navigationItem];
    [v29 setRightBarButtonItem:v27];

    v30 = v2;
  }

  return v2;
}

- (void)donePressed
{
  id v3 = [(CPSAboutViewController *)self textController];
  v2 = [v3 presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (OBTextWelcomeController)textController
{
  return self->_textController;
}

- (void)setTextController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end