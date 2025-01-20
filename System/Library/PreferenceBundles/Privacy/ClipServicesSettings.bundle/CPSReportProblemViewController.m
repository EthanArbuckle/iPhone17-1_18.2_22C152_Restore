@interface CPSReportProblemViewController
- (CPSReportProblemViewController)init;
- (CPSReportProblemViewController)initWithClipBundleIdentifier:(id)a3 itemIdentifier:(unint64_t)a4;
- (CPSReportProblemViewController)initWithCoder:(id)a3;
- (CPSReportProblemViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (CPSReportProblemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CPSReportProblemViewController)initWithRootViewController:(id)a3;
- (id)finishAction;
- (void)setFinishAction:(id)a3;
- (void)setUpConcernsViewController;
- (void)showAlertForError:(id)a3 withTitle:(id)a4 message:(id)a5 completion:(id)a6;
- (void)showConcernDetailVCWithProblemType:(id)a3;
- (void)showVisitAppSupportForDeveloperURL:(id)a3 problemType:(id)a4;
- (void)signInToAppStoreIfNeededWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation CPSReportProblemViewController

- (CPSReportProblemViewController)initWithClipBundleIdentifier:(id)a3 itemIdentifier:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPSReportProblemViewController;
  v8 = [(CPSReportProblemViewController *)&v13 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = [[CPSReportProblemModel alloc] initWithBundleIdentifier:v7 itemIdentifier:a4];
    model = v8->_model;
    v8->_model = v9;

    objc_storeStrong((id *)&v8->_clipBundleIdentifier, a3);
    v11 = v8;
  }

  return v8;
}

- (CPSReportProblemViewController)init
{
  id v2 = +[NSException exceptionWithName:NSGenericException reason:@"-init: is not available." userInfo:0];
  objc_exception_throw(v2);
}

- (CPSReportProblemViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = +[NSException exceptionWithName:NSGenericException reason:@"-initWithCoder: is not available." userInfo:0];
  objc_exception_throw(v4);
}

- (CPSReportProblemViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  id v4 = +[NSException exceptionWithName:NSGenericException reason:@"-initWithNavigationBarClass: is not available." userInfo:0];
  objc_exception_throw(v4);
}

- (CPSReportProblemViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  id v4 = +[NSException exceptionWithName:NSGenericException reason:@"-initWithRootViewController: is not available." userInfo:0];
  objc_exception_throw(v4);
}

- (CPSReportProblemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSException exceptionWithName:NSGenericException reason:@"-initWithNibName: is not available." userInfo:0];
  objc_exception_throw(v7);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CPSReportProblemViewController;
  [(CPSReportProblemViewController *)&v3 viewDidLoad];
  [(CPSReportProblemViewController *)self setUpConcernsViewController];
  [(CPSReportProblemViewController *)self pushViewController:self->_concernsVC animated:0];
}

- (void)setUpConcernsViewController
{
  objc_super v3 = [[CPSReportProblemConcernsViewController alloc] initWithStyle:1];
  concernsVC = self->_concernsVC;
  self->_concernsVC = v3;

  id v5 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v5];
  id v7 = [(CPSReportProblemConcernsViewController *)self->_concernsVC navigationItem];
  [v7 setRightBarButtonItem:v6];

  [v5 startAnimating];
  model = self->_model;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_796C;
  v15[3] = &unk_14818;
  v15[4] = self;
  id v9 = v5;
  id v16 = v9;
  [(CPSReportProblemModel *)model fetchAMSDataWithCompletion:v15];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_7AC8;
  v12[3] = &unk_14840;
  objc_copyWeak(&v13, &location);
  [(CPSReportProblemConcernsViewController *)self->_concernsVC setSelectAction:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_7D00;
  v10[3] = &unk_14868;
  objc_copyWeak(&v11, &location);
  [(CPSReportProblemConcernsViewController *)self->_concernsVC setCancelAction:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)signInToAppStoreIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = +[ACAccountStore ams_sharedAccountStore];
  id v6 = objc_msgSend(v5, "ams_activeiTunesAccount");

  if (v6)
  {
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    id v7 = objc_alloc((Class)AMSUIAuthenticateTask);
    v8 = +[ACAccountStore ams_sharedAccountStore];
    id v9 = objc_msgSend(v8, "ams_activeiTunesAccount");
    id v10 = [v7 initWithAccount:v9 presentingViewController:self options:0];

    id v11 = [v10 performAuthentication];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_7ED0;
    v12[3] = &unk_14890;
    id v13 = v4;
    [v11 addFinishBlock:v12];
  }
}

- (void)showConcernDetailVCWithProblemType:(id)a3
{
  id v4 = a3;
  id v5 = [[CPSReportProblemConcernDetailViewController alloc] initWithProblemType:v4];
  objc_initWeak(&location, v5);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_80C4;
  id v13 = &unk_148E0;
  objc_copyWeak(&v16, &location);
  v14 = self;
  id v6 = v4;
  id v15 = v6;
  [(CPSReportProblemConcernDetailViewController *)v5 setSendAction:&v10];
  -[CPSReportProblemViewController pushViewController:animated:](self, "pushViewController:animated:", v5, 1, v10, v11, v12, v13, v14);
  id v7 = +[CPSAnalyticsLogger sharedLogger];
  clipBundleIdentifier = self->_clipBundleIdentifier;
  id v9 = [v6 label];
  [v7 recordReportProblemStepCompletedWithBundleID:clipBundleIdentifier problemLabel:v9 event:4];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)showVisitAppSupportForDeveloperURL:(id)a3 problemType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(CPSReportProblemVisitAppSupportViewController);
  objc_initWeak(&location, self);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_8538;
  v17 = &unk_14930;
  objc_copyWeak(&v20, &location);
  id v9 = v7;
  id v18 = v9;
  id v10 = v6;
  id v19 = v10;
  [(CPSReportProblemVisitAppSupportViewController *)v8 setFinishAction:&v14];
  -[CPSReportProblemViewController pushViewController:animated:](self, "pushViewController:animated:", v8, 1, v14, v15, v16, v17);
  uint64_t v11 = +[CPSAnalyticsLogger sharedLogger];
  clipBundleIdentifier = self->_clipBundleIdentifier;
  id v13 = [v9 label];
  [v11 recordReportProblemStepCompletedWithBundleID:clipBundleIdentifier problemLabel:v13 event:2];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)showAlertForError:(id)a3 withTitle:(id)a4 message:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = +[UIAlertController alertControllerWithTitle:a4 message:a5 preferredStyle:1];
  uint64_t v11 = _CPSLocalizedString();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_87E4;
  v14[3] = &unk_14958;
  id v15 = v9;
  id v12 = v9;
  id v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v14];
  [v10 addAction:v13];

  [(CPSReportProblemViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (id)finishAction
{
  return self->_finishAction;
}

- (void)setFinishAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishAction, 0);
  objc_storeStrong((id *)&self->_clipBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_concernsVC, 0);
}

@end