@interface ComposeServiceRemoteViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (ComposeServiceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_sheetPresentationControllerUserActivityForTearOff:(id)a3;
- (void)_addAttachmentData:(id)a3 itemProvider:(id)a4 mimeType:(id)a5 fileName:(id)a6 hostIdentifier:(id)a7;
- (void)_firstDraw:(id)a3;
- (void)_hostApplicationDidEnterBackground;
- (void)_hostApplicationWillEnterForeground;
- (void)_sheetPresentationControllerDidTearOff:(id)a3;
- (void)_willAppearInRemoteViewController;
- (void)addAttachmentWithData:(id)a3 mimeType:(id)a4 fileName:(id)a5 hostIdentifier:(id)a6;
- (void)addAttachmentWithItemProvider:(id)a3 mimeType:(id)a4 filename:(id)a5 hostIdentifier:(id)a6;
- (void)addAttachmentWithPlaceholderData:(id)a3;
- (void)autosaveWithReply:(id)a3;
- (void)commitCompositionValuesWithReply:(id)a3;
- (void)dealloc;
- (void)donateShareInteractionToDuet;
- (void)framesForAttachmentsWithIdentifiers:(id)a3 withReply:(id)a4;
- (void)loadView;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)securityScopeForURL:(id)a3 withReply:(id)a4;
- (void)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 withReply:(id)a7;
- (void)setCompositionValues:(id)a3;
- (void)setContentVisible:(BOOL)a3;
- (void)setUICustomizationData:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation ComposeServiceRemoteViewController

- (ComposeServiceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ComposeServiceRemoteViewController;
  v8 = [(ComposeServiceRemoteViewController *)&v21 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    id v9 = [objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:1];
    uint64_t v10 = +[MFAttachmentManager defaultManager];
    attachmentManager = v8->_attachmentManager;
    v8->_attachmentManager = (MFAttachmentComposeManager *)v10;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = (MFAttachmentComposeManager *)objc_alloc_init((Class)MFAttachmentComposeManager);
      v13 = v8->_attachmentManager;
      v8->_attachmentManager = v12;
    }
    v14 = [[ComposeNavigationController alloc] initWithComposition:v9 mailComposeControllerOptions:2];
    navigationController = v8->_navigationController;
    v8->_navigationController = v14;

    [(ComposeNavigationController *)v8->_navigationController setMailComposeDelegate:v8];
    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v8 selector:"_firstDraw:" name:MFMailComposeViewFirstDraw object:0];

    [(ComposeServiceRemoteViewController *)v8 addChildViewController:v8->_navigationController];
    +[NSURLProtocol registerClass:objc_opt_class()];
    +[MailAccount reloadAccounts];
    v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138412546;
      v23 = v19;
      __int16 v24 = 2048;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#CompositionServices <%@:%p> initialized", buf, 0x16u);
    }
  }

  return v8;
}

- (void)dealloc
{
  v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412546;
    v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#CompositionServices <%@:%p> deallocating", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)ComposeServiceRemoteViewController;
  [(ComposeServiceRemoteViewController *)&v6 dealloc];
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)ComposeServiceRemoteViewController;
  [(ComposeServiceRemoteViewController *)&v7 loadView];
  v3 = [(ComposeServiceRemoteViewController *)self view];
  [v3 setAutoresizingMask:18];

  v4 = [(ComposeServiceRemoteViewController *)self view];
  v5 = [(ComposeNavigationController *)self->_navigationController view];
  [v4 addSubview:v5];

  objc_super v6 = [(ComposeNavigationController *)self->_navigationController _mailComposeView];
  [v6 setIsForEditing:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ComposeServiceRemoteViewController;
  [(ComposeServiceRemoteViewController *)&v7 viewDidAppear:a3];
  v4 = [(ComposeServiceRemoteViewController *)self view];
  v5 = [v4 window];
  objc_super v6 = [v5 _rootSheetPresentationController];

  [v6 _setAllowsTearOff:1];
  [v6 setPrefersGrabberVisible:[UIDevice mf_isPad]];
  [v6 setDelegate:self];
}

- (void)_willAppearInRemoteViewController
{
  v3 = [(ComposeServiceRemoteViewController *)self _remoteViewControllerProxy];
  v4 = [(ComposeNavigationController *)self->_navigationController _mailComposeController];
  [v4 setRemoteViewControllerProxy:v3];

  v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [(ComposeServiceRemoteViewController *)self _hostApplicationBundleIdentifier];
    int v7 = 134218242;
    v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#CompositionServices %p: will appear in host %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_hostApplicationDidEnterBackground
{
  v3 = [(ComposeNavigationController *)self->_navigationController _mailComposeController];
  [v3 hostApplicationDidEnterBackground];

  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    objc_super v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#CompositionServices %p: host did enter background", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_hostApplicationWillEnterForeground
{
  v3 = [(ComposeNavigationController *)self->_navigationController _mailComposeController];
  [v3 hostApplicationWillEnterForeground];

  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    objc_super v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#CompositionServices %p: host will enter foreground", (uint8_t *)&v5, 0xCu);
  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  int v7 = (__CFString *)a5;
  v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = " and error: ";
    if (!v7) {
      __int16 v9 = "";
    }
    *(_DWORD *)v15 = 134218754;
    *(void *)&v15[4] = self;
    *(_WORD *)&v15[12] = 2048;
    *(void *)&v15[14] = a4;
    CFStringRef v10 = &stru_100018898;
    if (v7) {
      CFStringRef v10 = v7;
    }
    *(_WORD *)&v15[22] = 2080;
    v16 = v9;
    __int16 v17 = 2112;
    CFStringRef v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#CompositionServices %p: Composition finished with result %ld%s%@", v15, 0x2Au);
  }

  if (a4 == 2)
  {
    v11 = [(ComposeNavigationController *)self->_navigationController _mailComposeController];
    v12 = [v11 compositionContext];
    unsigned int v13 = [v12 hasDuetDonationContext];

    if (v13) {
      [(ComposeServiceRemoteViewController *)self donateShareInteractionToDuet];
    }
  }
  v14 = [(ComposeServiceRemoteViewController *)self _remoteViewControllerProxy];
  [v14 serviceCompositionFinishedWithResult:a4 error:v7];
}

- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  v12 = MFLogGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 134217984;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#CompositionServices %p: Composition requests send", (uint8_t *)&v14, 0xCu);
  }

  [(ComposeServiceRemoteViewController *)self _hostAuditToken];
  if (UIAuditTokenTaskHasEntitlement())
  {
    unsigned int v13 = [(ComposeServiceRemoteViewController *)self _remoteViewControllerProxy];
    [v13 serviceCompositionRequestsSendWithBody:v9 recipients:v10 completion:v11];
  }
  else
  {
    v11[2](v11, 1);
  }
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  int v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    v8 = [v4 ef_publicDescription];
    int v9 = 138412802;
    id v10 = v7;
    __int16 v11 = 2048;
    v12 = self;
    __int16 v13 = 2114;
    int v14 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#CompositionServices <%@:%p> %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_firstDraw:(id)a3
{
  id v7 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  int v5 = [v7 name];
  [v4 removeObserver:self name:v5 object:0];

  objc_super v6 = [(ComposeServiceRemoteViewController *)self _remoteViewControllerProxy];
  [v6 bodyFinishedDrawing];
}

- (void)setCompositionValues:(id)a3
{
  id v8 = a3;
  id v4 = objc_alloc((Class)_MFMailCompositionContext);
  int v5 = [(ComposeServiceRemoteViewController *)self _hostApplicationBundleIdentifier];
  objc_super v6 = (_MFMailCompositionContext *)[v4 initWithCompositionValueRepresentation:v8 hostApplicationBundleIdentifier:v5];
  compositionContext = self->_compositionContext;
  self->_compositionContext = v6;
}

- (void)setUICustomizationData:(id)a3
{
}

- (void)addAttachmentWithPlaceholderData:(id)a3
{
  id v4 = a3;
  int v5 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:v4];
  compositionContext = self->_compositionContext;
  if (!compositionContext)
  {
    id v7 = (_MFMailCompositionContext *)[objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:0];
    id v8 = self->_compositionContext;
    self->_compositionContext = v7;

    compositionContext = self->_compositionContext;
  }
  int v9 = [v5 fileName];
  id v10 = [v5 contentID];
  __int16 v11 = [(_MFMailCompositionContext *)compositionContext addAttachmentData:v4 mimeType:0 fileName:v9 contentID:v10];

  [v11 setIsPlaceholder:1];
  [v11 setPlaceholder:v5];
  v12 = [(_MFMailCompositionContext *)self->_compositionContext attachmentContext];
  __int16 v13 = [v5 contentID];
  [v12 setHostIdentifier:v13 forAttachment:v11];

  if (!self->_attachmentIdentifiersMap)
  {
    int v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    attachmentIdentifiersMap = self->_attachmentIdentifiersMap;
    self->_attachmentIdentifiersMap = v14;
  }
  v16 = MFLogGeneral();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = [v11 contentID];
    CFStringRef v18 = [v11 url];
    int v22 = 134218498;
    v23 = self;
    __int16 v24 = 2112;
    v25 = v17;
    __int16 v26 = 2112;
    v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#CompositionServices %p: Mapping attachment with remote identifier %@ to local identifier %@", (uint8_t *)&v22, 0x20u);
  }
  v19 = [v11 contentID];

  if (v19)
  {
    v20 = self->_attachmentIdentifiersMap;
    objc_super v21 = [v11 contentID];
    [(NSMutableDictionary *)v20 setObject:v11 forKey:v21];
  }
}

- (void)addAttachmentWithData:(id)a3 mimeType:(id)a4 fileName:(id)a5 hostIdentifier:(id)a6
{
}

- (void)addAttachmentWithItemProvider:(id)a3 mimeType:(id)a4 filename:(id)a5 hostIdentifier:(id)a6
{
}

- (void)_addAttachmentData:(id)a3 itemProvider:(id)a4 mimeType:(id)a5 fileName:(id)a6 hostIdentifier:(id)a7
{
  unint64_t v13 = (unint64_t)a3;
  unint64_t v14 = (unint64_t)a4;
  id v33 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!(v13 | v14))
  {
    v32 = +[NSAssertionHandler currentHandler];
    [v32 handleFailureInMethod:a2, self, @"ComposeServiceRemoteViewController.m", 199, @"Invalid parameter not satisfying: %@", @"data || itemProvider" object file lineNumber description];
  }
  __int16 v17 = MFLogGeneral();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v35 = self;
    __int16 v36 = 2048;
    unint64_t v37 = v13;
    __int16 v38 = 2048;
    unint64_t v39 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#CompositionServices %p: creating attachment for data:%p itemProvider:%p", buf, 0x20u);
  }

  if (!self->_compositionContext)
  {
    CFStringRef v18 = (_MFMailCompositionContext *)[objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:0];
    compositionContext = self->_compositionContext;
    self->_compositionContext = v18;
  }
  if (v13)
  {
    uint64_t v20 = [(_MFMailCompositionContext *)self->_compositionContext addAttachmentData:v13 mimeType:v33 fileName:v15];
LABEL_11:
    objc_super v21 = (void *)v20;
    goto LABEL_12;
  }
  if (v14)
  {
    uint64_t v20 = [(_MFMailCompositionContext *)self->_compositionContext addAttachmentDataItemProvider:v14 mimeType:v33 filename:v15 contentID:0];
    goto LABEL_11;
  }
  objc_super v21 = 0;
LABEL_12:
  int v22 = [(_MFMailCompositionContext *)self->_compositionContext attachmentContext];
  [v22 setHostIdentifier:v16 forAttachment:v21];

  v23 = [v21 contentID];
  [(_MFMailCompositionContext *)self->_compositionContext setContentVariationAttachmentCID:v23];

  if (!self->_attachmentIdentifiersMap)
  {
    __int16 v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    attachmentIdentifiersMap = self->_attachmentIdentifiersMap;
    self->_attachmentIdentifiersMap = v24;
  }
  __int16 v26 = MFLogGeneral();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = [v21 contentID];
    v28 = [v21 url];
    *(_DWORD *)buf = 134218498;
    v35 = self;
    __int16 v36 = 2112;
    unint64_t v37 = (unint64_t)v27;
    __int16 v38 = 2112;
    unint64_t v39 = (unint64_t)v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "#CompositionServices %p: Mapping attachment with remote identifier %@ to local identifier %@", buf, 0x20u);
  }
  v29 = [v21 contentID];

  if (v29)
  {
    v30 = self->_attachmentIdentifiersMap;
    v31 = [v21 contentID];
    [(NSMutableDictionary *)v30 setObject:v21 forKey:v31];
  }
}

- (void)commitCompositionValuesWithReply:(id)a3
{
  dispatch_block_t block = a3;
  if (self->_compositionContext)
  {
    id v4 = [(ComposeNavigationController *)self->_navigationController _mailComposeController];
    [v4 setCompositionContext:self->_compositionContext];

    compositionContext = self->_compositionContext;
    self->_compositionContext = 0;
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setContentVisible:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = "NO";
    if (v3) {
      objc_super v6 = "YES";
    }
    int v7 = 134218242;
    id v8 = self;
    __int16 v9 = 2080;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#CompositionServices %p: Setting content visible: %s", (uint8_t *)&v7, 0x16u);
  }

  [(ComposeNavigationController *)self->_navigationController setContentVisible:v3];
}

- (void)framesForAttachmentsWithIdentifiers:(id)a3 withReply:(id)a4
{
  id v19 = a3;
  CFStringRef v18 = (void (**)(id, void *))a4;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x2020000000;
  unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  objc_super v6 = +[UIApplication sharedApplication];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100009BD8;
  v24[3] = &unk_100018690;
  v24[4] = &v25;
  id v7 = [v6 beginBackgroundTaskWithExpirationHandler:v24];

  v26[3] = (uint64_t)v7;
  id v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v31 = self;
    __int16 v32 = 2112;
    id v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#CompositionServices %p: Requested attachment frames for remote identifiers %@", buf, 0x16u);
  }

  if ([v19 count] && (objc_opt_class(), _ArrayContainsKindOfObjects()))
  {
    __int16 v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v19 count]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v19;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v15 = [(NSMutableDictionary *)self->_attachmentIdentifiersMap objectForKeyedSubscript:v14];
          if (v15)
          {
            [(ComposeNavigationController *)self->_navigationController frameForAttachmentWithIdentifier:v15];
            id v16 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:");
            [v9 setObject:v16 forKey:v14];
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v20 objects:v29 count:16];
      }
      while (v11);
    }

    v18[2](v18, v9);
  }
  else
  {
    v18[2](v18, 0);
  }
  __int16 v17 = +[UIApplication sharedApplication];
  [v17 endBackgroundTask:v26[3]];

  _Block_object_dispose(&v25, 8);
}

- (void)autosaveWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  int v5 = +[UIApplication sharedApplication];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009E04;
  v12[3] = &unk_100018690;
  v12[4] = &v13;
  id v6 = [v5 beginBackgroundTaskWithExpirationHandler:v12];

  v14[3] = (uint64_t)v6;
  navigationController = self->_navigationController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009EA8;
  v9[3] = &unk_1000186B8;
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  id v11 = &v13;
  [(ComposeNavigationController *)navigationController autosaveWithHandler:v9];

  _Block_object_dispose(&v13, 8);
}

- (void)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 withReply:(id)a7
{
  id v12 = a7;
  navigationController = self->_navigationController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000A0BC;
  v15[3] = &unk_100018560;
  id v16 = v12;
  id v14 = v12;
  [(ComposeNavigationController *)navigationController serializedPlaceholderForFileName:a3 fileSize:a4 mimeType:a5 contentID:a6 withHandler:v15];
}

- (void)securityScopeForURL:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  navigationController = self->_navigationController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A194;
  v9[3] = &unk_100018560;
  id v10 = v6;
  id v8 = v6;
  [(ComposeNavigationController *)navigationController securityScopeForURL:a3 withHandler:v9];
}

- (void)donateShareInteractionToDuet
{
  id v3 = objc_alloc_init((Class)_CDInteraction);
  id v4 = [(ComposeServiceRemoteViewController *)self _hostApplicationBundleIdentifier];
  [v3 setBundleId:v4];

  [v3 setTargetBundleId:UIActivityTypeMail];
  [v3 setDirection:1];
  [v3 setMechanism:13];
  int v5 = +[NSDate date];
  [v3 setEndDate:v5];

  id v6 = [(ComposeNavigationController *)self->_navigationController _mailComposeController];
  id v7 = [v6 toRecipients];
  id v8 = [v7 ef_compactMap:&stru_1000186F8];

  if (v8) {
    [v3 setRecipients:v8];
  }
  __int16 v9 = [(ComposeNavigationController *)self->_navigationController _mailComposeController];
  id v10 = [v9 compositionContext];
  id v11 = [v10 UTITypes];
  uint64_t v37 = [v11 ef_map:&stru_100018738];

  id v12 = [(ComposeNavigationController *)self->_navigationController _mailComposeController];
  uint64_t v13 = [v12 compositionContext];
  id v14 = [v13 photoIDs];
  uint64_t v15 = [v14 ef_map:&stru_100018758];

  id v16 = [(ComposeNavigationController *)self->_navigationController _mailComposeController];
  __int16 v17 = [v16 compositionContext];
  CFStringRef v18 = [v17 cloudPhotoIDs];
  uint64_t v19 = [v18 ef_map:&stru_100018778];

  long long v20 = [(ComposeNavigationController *)self->_navigationController _mailComposeController];
  long long v21 = [v20 compositionContext];
  long long v22 = [v21 contentURLs];
  long long v23 = [v22 ef_map:&stru_100018798];

  __int16 v24 = [(ComposeNavigationController *)self->_navigationController _mailComposeController];
  uint64_t v25 = [v24 compositionContext];
  __int16 v26 = [v25 contentText];
  uint64_t v27 = [v26 ef_map:&stru_1000187B8];

  if (v15 | v19)
  {
    if (v15) {
      unint64_t v28 = (void *)v15;
    }
    else {
      unint64_t v28 = &__NSArray0__struct;
    }
    if (v19) {
      v29 = (void *)v19;
    }
    else {
      v29 = &__NSArray0__struct;
    }
    v30 = [v28 arrayByAddingObjectsFromArray:v29, v37];
  }
  else
  {
    if (v27) {
      v31 = v27;
    }
    else {
      v31 = &__NSArray0__struct;
    }
    if (v23) {
      __int16 v32 = v23;
    }
    else {
      __int16 v32 = &__NSArray0__struct;
    }
    id v33 = [v31 arrayByAddingObjectsFromArray:v32, v37];
    if (v38) {
      v34 = v38;
    }
    else {
      v34 = &__NSArray0__struct;
    }
    v30 = [v34 arrayByAddingObjectsFromArray:v33];
  }
  [v3 setAttachments:v30];
  id v40 = v3;
  v35 = +[NSArray arrayWithObjects:&v40 count:1];
  __int16 v36 = +[_CDInteractionRecorder interactionRecorder];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10000AAFC;
  v39[3] = &unk_1000187E0;
  v39[4] = self;
  [v36 recordInteractions:v35 completionHandler:v39];
}

- (id)_sheetPresentationControllerUserActivityForTearOff:(id)a3
{
  [(ComposeNavigationController *)self->_navigationController _mailComposeController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = nullsub_1;
  v7[3] = &unk_100018808;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  [v4 autosaveWithHandler:v7];
  int v5 = [(ComposeNavigationController *)self->_navigationController userActivityForRestoration];

  return v5;
}

- (void)_sheetPresentationControllerDidTearOff:(id)a3
{
  id v3 = [(ComposeServiceRemoteViewController *)self _remoteViewControllerProxy];
  [v3 serviceCompositionFinishedWithResult:1 error:0];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return ![(ComposeNavigationController *)self->_navigationController isDirty];
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  [(ComposeNavigationController *)self->_navigationController _mailComposeController];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AE60;
  block[3] = &unk_100018830;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface mf_mailComposeRemoteHostInterface];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface mf_mailComposeRemoteServiceInterface];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_compositionContext, 0);

  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end