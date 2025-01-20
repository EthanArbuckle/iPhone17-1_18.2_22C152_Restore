@interface PhotosUIServiceUserSafetyViewController
- (BSAction)action;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)finish:(BOOL)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setAction:(id)a3;
- (void)viewDidLoad;
@end

@implementation PhotosUIServiceUserSafetyViewController

- (void).cxx_destruct
{
}

- (void)setAction:(id)a3
{
}

- (BSAction)action
{
  return self->_action;
}

- (void)finish:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004190;
  v3[3] = &unk_100008198;
  v3[4] = self;
  BOOL v4 = a3;
  [(PhotosUIServiceUserSafetyViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PhotosUIServiceUserSafetyViewController;
  [(PhotosUIServiceUserSafetyViewController *)&v10 viewDidLoad];
  objc_initWeak(&location, self);
  BOOL v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  v6 = sub_10000438C;
  v7 = &unk_1000081E8;
  objc_copyWeak(&v8, &location);
  v3 = +[PXSharingUserSafetyController interventionViewControllerWithAction:&v4];
  -[PhotosUIServiceUserSafetyViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v9 = a4;
  v6 = [a3 actions];
  v7 = [v6 anyObject];
  [(PhotosUIServiceUserSafetyViewController *)self setAction:v7];

  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    id v8 = v9;
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v9 = a4;
  uint64_t v5 = [(PhotosUIServiceUserSafetyViewController *)self view];
  v6 = [v5 window];
  v7 = [v6 _rootSheetPresentationController];
  [v7 _setShouldScaleDownBehindDescendantSheets:0];

  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    id v8 = v9;
  }
}

@end