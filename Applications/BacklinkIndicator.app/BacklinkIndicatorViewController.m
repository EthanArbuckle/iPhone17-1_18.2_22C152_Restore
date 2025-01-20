@interface BacklinkIndicatorViewController
- (BacklinkIndicatorViewController)init;
- (BacklinkIndicatorViewControllerDelegate)delegate;
- (NPNotePreviewProvider)previewProvider;
- (NSUserActivity)userActivity;
- (UIImageView)imageView;
- (void)_updateUI;
- (void)actionButtonTapped;
- (void)setDelegate:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPreviewProvider:(id)a3;
- (void)setUserActivity:(id)a3;
- (void)viewDidLoad;
- (void)willAnimatePictureInPictureStop;
@end

@implementation BacklinkIndicatorViewController

- (BacklinkIndicatorViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)BacklinkIndicatorViewController;
  v2 = [(BacklinkIndicatorViewController *)&v8 initWithNibName:0 bundle:0];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)qword_10000E688;
    uint64_t v13 = qword_10000E688;
    if (!qword_10000E688)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000038EC;
      v9[3] = &unk_100008328;
      v9[4] = &v10;
      sub_1000038EC((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = [v4 shared];
    previewProvider = v2->_previewProvider;
    v2->_previewProvider = (NPNotePreviewProvider *)v5;
  }
  return v2;
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)BacklinkIndicatorViewController;
  [(BacklinkIndicatorViewController *)&v30 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  id v4 = [(BacklinkIndicatorViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc_init((Class)UIImageView);
  [(BacklinkIndicatorViewController *)self setImageView:v5];

  v6 = [(BacklinkIndicatorViewController *)self imageView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(BacklinkIndicatorViewController *)self view];
  objc_super v8 = [(BacklinkIndicatorViewController *)self imageView];
  [v7 addSubview:v8];

  v29 = [(BacklinkIndicatorViewController *)self imageView];
  v27 = [v29 topAnchor];
  v28 = [(BacklinkIndicatorViewController *)self view];
  v26 = [v28 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v31[0] = v25;
  v24 = [(BacklinkIndicatorViewController *)self imageView];
  v22 = [v24 leadingAnchor];
  v23 = [(BacklinkIndicatorViewController *)self view];
  v21 = [v23 leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v31[1] = v20;
  v19 = [(BacklinkIndicatorViewController *)self imageView];
  v18 = [v19 trailingAnchor];
  v9 = [(BacklinkIndicatorViewController *)self view];
  uint64_t v10 = [v9 trailingAnchor];
  v11 = [v18 constraintEqualToAnchor:v10];
  v31[2] = v11;
  uint64_t v12 = [(BacklinkIndicatorViewController *)self imageView];
  uint64_t v13 = [v12 bottomAnchor];
  v14 = [(BacklinkIndicatorViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v31[3] = v16;
  v17 = +[NSArray arrayWithObjects:v31 count:4];
  +[NSLayoutConstraint activateConstraints:v17];

  [(BacklinkIndicatorViewController *)self _updateUI];
}

- (void)setUserActivity:(id)a3
{
  id v5 = (NSUserActivity *)a3;
  p_userActivity = &self->_userActivity;
  if (self->_userActivity != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_userActivity, a3);
    p_userActivity = (NSUserActivity **)[(BacklinkIndicatorViewController *)self _updateUI];
    id v5 = v7;
  }

  _objc_release_x1(p_userActivity, v5);
}

- (void)_updateUI
{
  v3 = [(BacklinkIndicatorViewController *)self viewIfLoaded];

  if (v3)
  {
    id v4 = [(BacklinkIndicatorViewController *)self userActivity];

    if (v4)
    {
      id v5 = [(BacklinkIndicatorViewController *)self previewProvider];
      v6 = [(BacklinkIndicatorViewController *)self userActivity];
      id v18 = 0;
      v7 = [v5 previewForUserActivity:v6 error:&v18];
      id v8 = v18;

      if (v8)
      {
        v9 = sub_100001BE0();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100003D20(self, (uint64_t)v8, v9);
        }
      }
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v10 = (void *)qword_10000E698;
      uint64_t v22 = qword_10000E698;
      if (!qword_10000E698)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v24 = sub_100003AB0;
        v25 = &unk_100008328;
        v26 = &v19;
        v11 = (void *)sub_100003944();
        uint64_t v12 = dlsym(v11, "NPNotePreviewKeyPreview");
        *(void *)(v26[1] + 24) = v12;
        qword_10000E698 = *(void *)(v26[1] + 24);
        uint64_t v10 = (void *)v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v10) {
        sub_100003CA8();
      }
      uint64_t v13 = [v7 objectForKey:*v10];
      if (!v13)
      {
        v14 = sub_100001BE0();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = [(BacklinkIndicatorViewController *)self userActivity];
          v16 = [v15 _syLoggableDescription];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "found no preview for user activity: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    v17 = [(BacklinkIndicatorViewController *)self imageView];
    [v17 setImage:v13];
  }
}

- (void)actionButtonTapped
{
  v3 = [(BacklinkIndicatorViewController *)self delegate];

  if (v3)
  {
    id v4 = [(BacklinkIndicatorViewController *)self delegate];
    [v4 backlinkIndicatorViewControllerDidReceiveTap:self];
  }
}

- (void)willAnimatePictureInPictureStop
{
  v3 = [(BacklinkIndicatorViewController *)self delegate];

  if (v3)
  {
    id v4 = [(BacklinkIndicatorViewController *)self delegate];
    [v4 backlinkIndicatorViewControllerWillDismiss:self];
  }
}

- (BacklinkIndicatorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BacklinkIndicatorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (NPNotePreviewProvider)previewProvider
{
  return self->_previewProvider;
}

- (void)setPreviewProvider:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_previewProvider, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end