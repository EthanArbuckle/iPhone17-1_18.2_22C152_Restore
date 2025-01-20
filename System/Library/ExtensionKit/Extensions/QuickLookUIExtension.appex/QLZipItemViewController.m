@interface QLZipItemViewController
- (BOOL)canPinchToDismiss;
- (BOOL)canSwipeToDismiss;
- (DSArchiveService)archiveService;
- (NSProgress)unarchiveProgress;
- (NSString)password;
- (NSURL)archiveServiceDestionationFolderURL;
- (NSURL)unarchivedItemsFolderURL;
- (UIDocumentPasswordView)passwordView;
- (id)_archiveServiceDestionationFolderURL:(id *)a3;
- (void)_didDetermineArchiveNumberOfContainedFiles:(unint64_t)a3;
- (void)_expandArchiveContentsAtURL:(id)a3;
- (void)_hidePasswordView;
- (void)_makePasswordViewFirstResponder;
- (void)_readArchiveHeadersOfArchiveAtURL:(id)a3 passphrase:(id)a4 completionHandler:(id)a5;
- (void)_removeUnarchivingFolderAtURL:(id)a3;
- (void)_removeUnarchivingFoldersIfExist;
- (void)_showCouldNotUnarchiveAlertWithError:(id)a3;
- (void)_showInvalidPasswordAlert;
- (void)_showPasswordView;
- (void)_startUnarchivingContents;
- (void)_updateZipInformationWithZipSize:(id)a3;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)performAction;
- (void)prepareForInvalidationWithCompletionHandler:(id)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setArchiveService:(id)a3;
- (void)setArchiveServiceDestionationFolderURL:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordView:(id)a3;
- (void)setUnarchiveProgress:(id)a3;
- (void)setUnarchivedItemsFolderURL:(id)a3;
- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4;
- (void)viewDidLoad;
@end

@implementation QLZipItemViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)QLZipItemViewController;
  [(QLZipItemViewController *)&v12 viewDidLoad];
  v3 = QLLocalizedString();
  v4 = +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:v3 actionButtonView:0 informationVisible:1];
  readyToUnzipState = self->_readyToUnzipState;
  self->_readyToUnzipState = v4;

  id v6 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  v7 = +[UIColor secondaryLabelColor];
  [v6 setColor:v7];

  objc_msgSend(v6, "setFrame:", 0.0, 0.0, 32.0, 32.0);
  [v6 startAnimating];
  v8 = +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:&stru_1000250F0 actionButtonView:v6 informationVisible:1];
  unzippingState = self->_unzippingState;
  self->_unzippingState = v8;

  v10 = +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:&stru_1000250F0 actionButtonView:0 informationVisible:1];
  unableToUnzipState = self->_unableToUnzipState;
  self->_unableToUnzipState = v10;

  [(QLZipItemViewController *)self setState:self->_readyToUnzipState];
  [(QLZipItemViewController *)self _updateZipInformationWithZipSize:&off_100025EA8];
}

- (void)prepareForInvalidationWithCompletionHandler:(id)a3
{
  id v5 = a3;
  [(NSProgress *)self->_unarchiveProgress cancel];
  [(QLZipItemViewController *)self _removeUnarchivingFoldersIfExist];
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }
}

- (void)_updateZipInformationWithZipSize:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003CB0;
  v11[3] = &unk_100024A08;
  id v12 = a3;
  v13 = self;
  id v14 = a5;
  v10.receiver = self;
  v10.super_class = (Class)QLZipItemViewController;
  id v8 = v14;
  id v9 = v12;
  [(QLZipItemViewController *)&v10 loadPreviewControllerWithContents:v9 context:a4 completionHandler:v11];
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)QLZipItemViewController;
  [(QLZipItemViewController *)&v9 setAppearance:a3 animated:a4];
  [(QLZipItemViewController *)self loadViewIfNeeded];
  id v5 = [(QLZipItemViewController *)self appearance];
  if ([v5 presentationMode] == (id)1)
  {
  }
  else
  {
    id v6 = [(QLZipItemViewController *)self appearance];
    id v7 = [v6 presentationMode];

    if (v7 != (id)2)
    {
      id v8 = &OBJC_IVAR___QLZipItemViewController__unableToUnzipState;
      goto LABEL_6;
    }
  }
  id v8 = &OBJC_IVAR___QLZipItemViewController__readyToUnzipState;
LABEL_6:
  [(QLZipItemViewController *)self setState:*(void *)&self->QLDetailItemViewController_opaque[*v8]];
}

- (void)performAction
{
  [(QLZipItemViewController *)self setState:self->_unzippingState animated:1];
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004168;
  block[3] = &unk_100024A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (DSArchiveService)archiveService
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_archiveService)
  {
    uint64_t v3 = objc_opt_new();
    archiveService = v2->_archiveService;
    v2->_archiveService = (DSArchiveService *)v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_archiveService;

  return v5;
}

- (id)_archiveServiceDestionationFolderURL:(id *)a3
{
  archiveServiceDestionationFolderURL = self->_archiveServiceDestionationFolderURL;
  if (!archiveServiceDestionationFolderURL)
  {
    id v6 = [(QLZipItemViewController *)self contents];
    id v7 = +[NSURL _QLCreateTemporaryDirectoryForOriginalFileAtURL:v6 error:a3];

    id v8 = self->_archiveServiceDestionationFolderURL;
    self->_archiveServiceDestionationFolderURL = v7;

    archiveServiceDestionationFolderURL = self->_archiveServiceDestionationFolderURL;
  }

  return archiveServiceDestionationFolderURL;
}

- (void)_startUnarchivingContents
{
  id v18 = 0;
  uint64_t v3 = [(QLZipItemViewController *)self _archiveServiceDestionationFolderURL:&v18];
  id v4 = v18;
  id v5 = v4;
  if (!v3 || v4)
  {
    v13 = [(QLZipItemViewController *)self delegate];
    [v13 previewItemViewController:self didFailWithError:v5];
  }
  else
  {
    objc_initWeak(&location, self);
    id v6 = [(QLZipItemViewController *)self contents];
    unsigned __int8 v7 = [v6 startAccessingSecurityScopedResource];

    id v8 = [(QLZipItemViewController *)self archiveService];
    objc_super v9 = [(QLZipItemViewController *)self contents];
    password = self->_password;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100004448;
    v14[3] = &unk_100024A80;
    objc_copyWeak(&v15, &location);
    unsigned __int8 v16 = v7;
    v11 = [v8 unarchiveItemAtURL:v9 passphrase:password destinationFolderURL:v3 completionHandler:v14];
    unarchiveProgress = self->_unarchiveProgress;
    self->_unarchiveProgress = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)_readArchiveHeadersOfArchiveAtURL:(id)a3 passphrase:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unsigned __int8 v11 = [v8 startAccessingSecurityScopedResource];
  id v12 = [(QLZipItemViewController *)self archiveService];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000049B8;
  v15[3] = &unk_100024AA8;
  unsigned __int8 v18 = v11;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [v12 itemDescriptorsForItemAtURL:v14 passphrase:v10 completionHandler:v15];
}

- (void)_hidePasswordView
{
  id v2 = [(QLZipItemViewController *)self passwordView];
  [v2 removeFromSuperview];
}

- (void)_showPasswordView
{
  uint64_t v3 = [(QLZipItemViewController *)self passwordView];
  id v4 = [(QLZipItemViewController *)self view];
  [v4 addSubview:v3];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(QLZipItemViewController *)self view];
  CFStringRef v13 = @"passwordView";
  id v14 = v3;
  id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  unsigned __int8 v7 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[passwordView]|" options:0 metrics:0 views:v6];
  [v5 addConstraints:v7];

  id v8 = [(QLZipItemViewController *)self view];
  CFStringRef v11 = @"passwordView";
  id v12 = v3;
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v10 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[passwordView]|" options:0 metrics:0 views:v9];
  [v8 addConstraints:v10];
}

- (void)_makePasswordViewFirstResponder
{
  id v3 = [(QLZipItemViewController *)self passwordView];
  id v2 = [v3 passwordField];
  [v2 becomeFirstResponder];
}

- (void)_expandArchiveContentsAtURL:(id)a3
{
  id v4 = a3;
  id v5 = [(QLZipItemViewController *)self delegate];
  [v5 expandContentOfPreviewItemViewController:self unarchivedItemsURL:v4];
}

- (void)_didDetermineArchiveNumberOfContainedFiles:(unint64_t)a3
{
}

- (UIDocumentPasswordView)passwordView
{
  passwordView = self->_passwordView;
  if (!passwordView)
  {
    id v4 = objc_alloc((Class)UIDocumentPasswordView);
    id v5 = [(QLZipItemViewController *)self context];
    id v6 = [v5 previewTitle];
    unsigned __int8 v7 = (UIDocumentPasswordView *)[v4 initWithDocumentName:v6];
    id v8 = self->_passwordView;
    self->_passwordView = v7;

    [(UIDocumentPasswordView *)self->_passwordView setPasswordDelegate:self];
    passwordView = self->_passwordView;
  }

  return passwordView;
}

- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4
{
  objc_storeStrong((id *)&self->_password, a3);
  id v6 = a3;
  unsigned __int8 v7 = [(QLZipItemViewController *)self contents];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005108;
  v8[3] = &unk_100024AF8;
  v8[4] = self;
  [(QLZipItemViewController *)self _readArchiveHeadersOfArchiveAtURL:v7 passphrase:v6 completionHandler:v8];
}

- (void)_showInvalidPasswordAlert
{
  id v3 = [(QLZipItemViewController *)self passwordView];
  id v4 = [v3 passwordField];
  [v4 setText:&stru_1000250F0];

  id v5 = QLLocalizedStringFromTable();
  id v6 = +[UIAlertController alertControllerWithTitle:v5 message:&stru_1000250F0 preferredStyle:1];

  unsigned __int8 v7 = QLLocalizedStringWithDefaultValue();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005554;
  v12[3] = &unk_100024B20;
  v12[4] = self;
  id v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v12];

  [v6 addAction:v8];
  id v9 = [(QLZipItemViewController *)self view];
  id v10 = [v9 window];
  CFStringRef v11 = [v10 rootViewController];
  [v11 presentViewController:v6 animated:1 completion:0];
}

- (void)_showCouldNotUnarchiveAlertWithError:(id)a3
{
  id v4 = a3;
  id v5 = QLLocalizedStringFromTable();
  id v6 = [(QLZipItemViewController *)self context];
  unsigned __int8 v7 = [v6 item];
  id v8 = [v7 previewItemTitle];
  id v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v8);
  id v10 = [v4 localizedDescription];

  CFStringRef v11 = +[UIAlertController alertControllerWithTitle:v9 message:v10 preferredStyle:1];

  id v12 = QLLocalizedStringWithDefaultValue();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000575C;
  v17[3] = &unk_100024B20;
  v17[4] = self;
  CFStringRef v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v17];

  [v11 addAction:v13];
  id v14 = [(QLZipItemViewController *)self view];
  id v15 = [v14 window];
  id v16 = [v15 rootViewController];
  [v16 presentViewController:v11 animated:1 completion:0];
}

- (void)_removeUnarchivingFoldersIfExist
{
  if (self->_archiveServiceDestionationFolderURL)
  {
    -[QLZipItemViewController _removeUnarchivingFolderAtURL:](self, "_removeUnarchivingFolderAtURL:");
    archiveServiceDestionationFolderURL = self->_archiveServiceDestionationFolderURL;
    self->_archiveServiceDestionationFolderURL = 0;
  }
  if (self->_unarchivedItemsFolderURL)
  {
    -[QLZipItemViewController _removeUnarchivingFolderAtURL:](self, "_removeUnarchivingFolderAtURL:");
    unarchivedItemsFolderURL = self->_unarchivedItemsFolderURL;
    self->_unarchivedItemsFolderURL = 0;
  }
}

- (void)_removeUnarchivingFolderAtURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 path];
  id v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v3 startAccessingSecurityScopedResource];
  if (v4 && [v5 fileExistsAtPath:v4])
  {
    id v14 = 0;
    unsigned __int8 v7 = [v5 removeItemAtPath:v4 error:&v14];
    id v8 = v14;
    id v9 = _qlsLogHandle;
    if (v7)
    {
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        id v9 = _qlsLogHandle;
      }
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      id v16 = v3;
      id v10 = "Successfully removed unarchiving folder at URL: %@ #PreviewItem";
      CFStringRef v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 12;
    }
    else
    {
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        id v9 = _qlsLogHandle;
      }
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412546;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = v8;
      id v10 = "Cannot remove unarchiving folder at URL: %@ with error: %@ #PreviewItem";
      CFStringRef v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
    }
    _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
LABEL_13:
  }
  if (v6) {
    [v3 stopAccessingSecurityScopedResource];
  }
}

- (void)setArchiveService:(id)a3
{
}

- (void)setPasswordView:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSURL)unarchivedItemsFolderURL
{
  return self->_unarchivedItemsFolderURL;
}

- (void)setUnarchivedItemsFolderURL:(id)a3
{
}

- (NSURL)archiveServiceDestionationFolderURL
{
  return self->_archiveServiceDestionationFolderURL;
}

- (void)setArchiveServiceDestionationFolderURL:(id)a3
{
}

- (NSProgress)unarchiveProgress
{
  return self->_unarchiveProgress;
}

- (void)setUnarchiveProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unarchiveProgress, 0);
  objc_storeStrong((id *)&self->_archiveServiceDestionationFolderURL, 0);
  objc_storeStrong((id *)&self->_unarchivedItemsFolderURL, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_passwordView, 0);
  objc_storeStrong((id *)&self->_archiveService, 0);
  objc_storeStrong((id *)&self->_unableToUnzipState, 0);
  objc_storeStrong((id *)&self->_unzippingState, 0);

  objc_storeStrong((id *)&self->_readyToUnzipState, 0);
}

@end