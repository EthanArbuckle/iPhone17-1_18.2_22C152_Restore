@interface SFSaveToFilesActivity
- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_managesOwnPresentation;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)saveToFilesOperationShouldDismissViewControllerAfterCompletion:(id)a3;
- (BOOL)saveToFilesOperationSupportsDownloads:(id)a3;
- (BOOL)supportsDownloads;
- (SFSaveToFilesActivity)initWithActivityItemProviderCollection:(id)a3 customizationController:(id)a4;
- (id)activityType;
- (id)customizationControllerForSaveToFilesOperation:(id)a3;
- (void)saveToFilesOperation:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)saveToFilesOperation:(id)a3 presentViewController:(id)a4;
- (void)setSupportsDownloads:(BOOL)a3;
@end

@implementation SFSaveToFilesActivity

- (SFSaveToFilesActivity)initWithActivityItemProviderCollection:(id)a3 customizationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFSaveToFilesActivity;
  v8 = [(UIActivity *)&v13 init];
  if (v8)
  {
    v9 = [[_SFSaveToFilesOperation alloc] initWithActivityItemProviderCollection:v6];
    operation = v8->_operation;
    v8->_operation = v9;

    [(_SFSaveToFilesOperation *)v8->_operation setDelegate:v8];
    objc_storeStrong((id *)&v8->_customizationController, a4);
    v11 = v8;
  }

  return v8;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F43610];
}

- (BOOL)_managesOwnPresentation
{
  return 1;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  self->_presentAnimated = a4;
  p_presenterViewController = &self->_presenterViewController;
  id v8 = a5;
  objc_storeWeak((id *)p_presenterViewController, a3);
  v9 = (void *)MEMORY[0x1AD0C36A0](v8);

  id presentationCompletionHandler = self->_presentationCompletionHandler;
  self->_id presentationCompletionHandler = v9;

  [(_SFSaveToFilesOperation *)self->_operation start];
  return 1;
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(void))a5;
  if (v8)
  {
    v10 = (UIViewController *)v8;
LABEL_4:
    [(UIViewController *)v10 dismissViewControllerAnimated:v6 completion:v9];

    BOOL v11 = 1;
    goto LABEL_5;
  }
  v10 = self->_presentedViewController;
  if (v10) {
    goto LABEL_4;
  }
  if (v9) {
    v9[2](v9);
  }
  BOOL v11 = 0;
LABEL_5:

  return v11;
}

- (void)saveToFilesOperation:(id)a3 presentViewController:(id)a4
{
  objc_storeStrong((id *)&self->_presentedViewController, a4);
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);
  [WeakRetained presentViewController:v8 animated:self->_presentAnimated completion:self->_presentationCompletionHandler];

  id presentationCompletionHandler = self->_presentationCompletionHandler;
  self->_id presentationCompletionHandler = 0;
}

- (void)saveToFilesOperation:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  operation = self->_operation;
  self->_operation = 0;

  id presentationCompletionHandler = self->_presentationCompletionHandler;
  self->_id presentationCompletionHandler = 0;

  [(_SFActivity *)self activityDidFinish:v4];
}

- (BOOL)saveToFilesOperationSupportsDownloads:(id)a3
{
  return self->_supportsDownloads;
}

- (id)customizationControllerForSaveToFilesOperation:(id)a3
{
  return self->_customizationController;
}

- (BOOL)saveToFilesOperationShouldDismissViewControllerAfterCompletion:(id)a3
{
  return 0;
}

- (BOOL)supportsDownloads
{
  return self->_supportsDownloads;
}

- (void)setSupportsDownloads:(BOOL)a3
{
  self->_supportsDownloads = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_customizationController, 0);
  objc_storeStrong(&self->_presentationCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_presenterViewController);

  objc_storeStrong((id *)&self->_operation, 0);
}

@end