@interface VettingAcceptor
- (BOOL)cancelled;
- (BOOL)retrievingDialogShouldDisplay;
- (NSURL)url;
- (RetrievingDialog)retrievingDialog;
- (VettingAcceptor)initWithCloudKitURL:(id)a3;
- (VettingHandler)vettingHandler;
- (unint64_t)backgroundTaskID;
- (void)completeVettingWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)retrievingDialogCancelled;
- (void)setBackgroundTaskID:(unint64_t)a3;
- (void)setCancelled:(BOOL)a3;
@end

@implementation VettingAcceptor

- (VettingAcceptor)initWithCloudKitURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VettingAcceptor;
  v5 = [(VettingAcceptor *)&v13 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    url = v5->_url;
    v5->_url = v6;

    v8 = [[VettingHandler alloc] initWithCloudKitURL:v4];
    vettingHandler = v5->_vettingHandler;
    v5->_vettingHandler = v8;

    v10 = objc_alloc_init(RetrievingDialog);
    retrievingDialog = v5->_retrievingDialog;
    v5->_retrievingDialog = v10;

    [(RetrievingDialog *)v5->_retrievingDialog setDelegate:v5];
  }

  return v5;
}

- (BOOL)retrievingDialogShouldDisplay
{
  return 1;
}

- (void)retrievingDialogCancelled
{
  obj = self;
  objc_sync_enter(obj);
  [(VettingAcceptor *)obj setCancelled:1];
  objc_sync_exit(obj);
}

- (void)completeVettingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(VettingAcceptor *)self retrievingDialog];
  [v5 schedule];

  objc_initWeak(&location, self);
  v6 = [(VettingAcceptor *)self vettingHandler];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014004;
  v10[3] = &unk_100024BB0;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000144C0;
  v8[3] = &unk_1000246C0;
  objc_copyWeak(&v9, &location);
  [v6 completeVettingWithCompletionHandler:v10 willIssueCompletionOperationHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  [(RetrievingDialog *)self->_retrievingDialog abort];
  v3.receiver = self;
  v3.super_class = (Class)VettingAcceptor;
  [(VettingAcceptor *)&v3 dealloc];
}

- (unint64_t)backgroundTaskID
{
  return self->_backgroundTaskID;
}

- (void)setBackgroundTaskID:(unint64_t)a3
{
  self->_backgroundTaskID = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (VettingHandler)vettingHandler
{
  return self->_vettingHandler;
}

- (RetrievingDialog)retrievingDialog
{
  return self->_retrievingDialog;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retrievingDialog, 0);
  objc_storeStrong((id *)&self->_vettingHandler, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end