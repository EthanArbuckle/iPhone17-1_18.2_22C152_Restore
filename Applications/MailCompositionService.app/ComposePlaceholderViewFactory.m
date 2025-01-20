@interface ComposePlaceholderViewFactory
- (BOOL)showSenderField;
- (ComposePlaceholderViewFactory)initWithDaemonInterface:(id)a3;
- (EFScheduler)snapshotQueue;
- (EMMessageRepository)messageRepository;
- (MFComposeWebView)webview;
- (NSMutableDictionary)contentFuturesByID;
- (id)_placeholderContentWithMessage:(id)a3;
- (id)_requestContentForActivity:(id)a3;
- (id)placeholderViewForUserActivity:(id)a3 frame:(CGRect)a4 parentMargins:(UIEdgeInsets)a5;
- (void)setContentFuturesByID:(id)a3;
- (void)setMessageRepository:(id)a3;
- (void)setShowSenderField:(BOOL)a3;
- (void)setSnapshotQueue:(id)a3;
- (void)setWebview:(id)a3;
@end

@implementation ComposePlaceholderViewFactory

- (ComposePlaceholderViewFactory)initWithDaemonInterface:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ComposePlaceholderViewFactory;
  v5 = [(ComposePlaceholderViewFactory *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 messageRepository];
    messageRepository = v5->_messageRepository;
    v5->_messageRepository = (EMMessageRepository *)v6;

    v8 = [objc_alloc((Class)MFComposeWebView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    webview = v5->_webview;
    v5->_webview = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contentFuturesByID = v5->_contentFuturesByID;
    v5->_contentFuturesByID = v10;

    uint64_t v12 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"ComposePlaceholderSnapshotQueue"];
    snapshotQueue = v5->_snapshotQueue;
    v5->_snapshotQueue = (EFScheduler *)v12;

    v14 = [v4 accountRepository];
    v15 = [v14 deliveryAccounts];
    v5->_showSenderField = (unint64_t)[v15 count] > 1;
  }
  return v5;
}

- (id)placeholderViewForUserActivity:(id)a3 frame:(CGRect)a4 parentMargins:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a3;
  v15 = [v14 userInfo];
  v16 = [v15 objectForKeyedSubscript:MSMailActivityHandoffComposeKeySubject];

  objc_super v17 = [(ComposePlaceholderViewFactory *)self _requestContentForActivity:v14];
  v18 = -[ComposePlaceholderView initWithFrame:subject:modelFuture:]([ComposePlaceholderView alloc], "initWithFrame:subject:modelFuture:", v16, v17, x, y, width, height);
  -[ComposePlaceholderView setLayoutMargins:](v18, "setLayoutMargins:", top, left, bottom, right);
  v19 = [(ComposePlaceholderViewFactory *)self snapshotQueue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000079E4;
  v23[3] = &unk_1000185D8;
  v20 = v18;
  v24 = v20;
  v25 = self;
  [v19 performBlock:v23];

  v21 = v20;
  return v21;
}

- (id)_requestContentForActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:MSMailActivityHandoffComposeKeyAutosaveID];

  v7 = [(ComposePlaceholderViewFactory *)self contentFuturesByID];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    v9 = +[EFPromise promise];
    v10 = +[EFScheduler globalAsyncScheduler];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100007C78;
    v15[3] = &unk_100018628;
    id v11 = v6;
    id v16 = v11;
    id v12 = v9;
    id v17 = v12;
    v18 = self;
    [v10 performBlock:v15];

    v8 = [v12 future];
    v13 = [(ComposePlaceholderViewFactory *)self contentFuturesByID];
    [v13 setObject:v8 forKeyedSubscript:v11];
  }

  return v8;
}

- (id)_placeholderContentWithMessage:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(ComposePlaceholderViewModel);
  [(ComposePlaceholderViewModel *)v5 setShowSenderAddress:[(ComposePlaceholderViewFactory *)self showSenderField]];
  id v6 = [v4 firstSender];
  v7 = [v6 emailAddressValue];
  v8 = [v7 simpleAddress];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v6 stringValue];
  }
  id v11 = v10;

  [(ComposePlaceholderViewModel *)v5 setSenderAddress:v11];
  id v12 = [v4 to];
  v13 = sub_100007FAC(v12);
  [(ComposePlaceholderViewModel *)v5 setToRecipients:v13];

  id v14 = [v4 cc];
  v15 = sub_100007FAC(v14);
  [(ComposePlaceholderViewModel *)v5 setCcRecipients:v15];

  id v16 = [v4 bcc];
  id v17 = sub_100007FAC(v16);
  [(ComposePlaceholderViewModel *)v5 setBccRecipients:v17];

  uint64_t v18 = [v4 bestAlternativePart];
  v19 = (void *)v18;
  if (v18) {
    CFStringRef v20 = (const __CFString *)v18;
  }
  else {
    CFStringRef v20 = &stru_100018898;
  }
  [(ComposePlaceholderViewModel *)v5 setHtmlContent:v20];

  return v5;
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (void)setMessageRepository:(id)a3
{
}

- (MFComposeWebView)webview
{
  return self->_webview;
}

- (void)setWebview:(id)a3
{
}

- (NSMutableDictionary)contentFuturesByID
{
  return self->_contentFuturesByID;
}

- (void)setContentFuturesByID:(id)a3
{
}

- (EFScheduler)snapshotQueue
{
  return self->_snapshotQueue;
}

- (void)setSnapshotQueue:(id)a3
{
}

- (BOOL)showSenderField
{
  return self->_showSenderField;
}

- (void)setShowSenderField:(BOOL)a3
{
  self->_showSenderField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_storeStrong((id *)&self->_contentFuturesByID, 0);
  objc_storeStrong((id *)&self->_webview, 0);

  objc_storeStrong((id *)&self->_messageRepository, 0);
}

@end