@interface ETBrowserViewController
- (Class)canvasViewControllerClass;
- (DTSCanvasViewController)canvasViewController;
- (ETBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4;
- (void)canvasViewController:(id)a3 sendMessage:(id)a4;
- (void)dataSource:(id)a3 didReceiveSessionMessage:(id)a4;
- (void)dismiss;
- (void)setBalloonPluginDataSource:(id)a3;
- (void)viewDidLoad;
@end

@implementation ETBrowserViewController

- (ETBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ETBrowserViewController;
  v8 = [(ETBrowserViewController *)&v11 initWithBalloonPlugin:a3 dataSource:v7];
  v9 = v8;
  if (v7 && v8) {
    objc_storeStrong((id *)&v8->_dataSource, a4);
  }

  return v9;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)ETBrowserViewController;
  [(ETBrowserViewController *)&v10 viewDidLoad];
  v3 = [(ETBrowserViewController *)self view];
  v4 = [(ETBrowserViewController *)self canvasViewController];
  [(ETBrowserViewController *)self addChildViewController:v4];
  v5 = [v4 view];
  [v3 addSubview:v5];

  [v4 didMoveToParentViewController:self];
  [v4 setSendDelegate:self];
  [v4 setDataSource:self->_dataSource];
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      dataSource = self->_dataSource;
      v8 = [(ETBalloonPluginDataSource *)dataSource allPayloads];
      id v9 = [v8 count];
      *(_DWORD *)buf = 138412546;
      v12 = dataSource;
      __int16 v13 = 2048;
      id v14 = v9;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Data source: %@, incoming message count: %lu.", buf, 0x16u);
    }
  }
}

- (void)setBalloonPluginDataSource:(id)a3
{
  v4 = (ETBalloonPluginDataSource *)a3;
  v8.receiver = self;
  v8.super_class = (Class)ETBrowserViewController;
  [(ETBrowserViewController *)&v8 setBalloonPluginDataSource:v4];
  dataSource = self->_dataSource;
  self->_dataSource = v4;
  v6 = v4;

  id v7 = [(ETBrowserViewController *)self canvasViewController];
  [v7 setDataSource:self->_dataSource];
}

- (void)canvasViewController:(id)a3 sendMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v7 archive];
  id v9 = objc_alloc_init((Class)CKBrowserItemPayload);
  [v9 setData:v8];
  [v9 setShouldExpire:1];
  unsigned int v10 = [v7 messageType];
  if (v10 != 8)
  {
LABEL_4:
    BOOL v14 = v10 != 8;
    v15 = [(ETBalloonPluginDataSource *)self->_dataSource pluginPayload];
    v16 = [v15 attachments];
    id v17 = [v16 count];

    if (v17) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = v14;
    }
    if (!v18
      || ([(ETBalloonPluginDataSource *)self->_dataSource messageGUID],
          v19 = objc_claimAutoreleasedReturnValue(),
          BOOL v20 = v19 == 0,
          v19,
          v20))
    {
      if (IMOSLoggingEnabled())
      {
        v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          LOWORD(v30) = 0;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Sending non-session message.", (uint8_t *)&v30, 2u);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = [(ETBalloonPluginDataSource *)self->_dataSource allPayloads];
          id v23 = [v22 count];
          v24 = [(ETBalloonPluginDataSource *)self->_dataSource messageGUID];
          int v30 = 134218242;
          id v31 = v23;
          __int16 v32 = 2112;
          v33 = v24;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Sending breadbrumb with session message count: %lu, message GUID: %@)", (uint8_t *)&v30, 0x16u);
        }
      }
      [v9 setUpdate:1];
      v25 = +[NSBundle bundleForClass:objc_opt_class()];
      v26 = [v25 localizedStringForKey:@"DT_BREADCRUMB_TEXT" value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];
      [v9 setBreadcrumbText:v26];
    }
    v28 = [(ETBrowserViewController *)self sendDelegate];
    [v28 commitPayload:v9];

    goto LABEL_19;
  }
  uint64_t v11 = [v7 mediaURL];
  v12 = (void *)v11;
  if (v11)
  {
    uint64_t v34 = v11;
    __int16 v13 = +[NSArray arrayWithObjects:&v34 count:1];
    [v9 setAttachments:v13];

    goto LABEL_4;
  }
  if (IMOSLoggingEnabled())
  {
    v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Video message can't be sent because it is missing video attachment.", (uint8_t *)&v30, 2u);
    }
  }
LABEL_19:
}

- (void)dismiss
{
  id v2 = [(ETBrowserViewController *)self sendDelegate];
  [v2 dismiss];
}

- (void)dataSource:(id)a3 didReceiveSessionMessage:(id)a4
{
  id v5 = a4;
  id v6 = [(ETBrowserViewController *)self canvasViewController];
  [v6 addUnplayedMessage:v5];
}

- (Class)canvasViewControllerClass
{
  return (Class)objc_opt_class();
}

- (DTSCanvasViewController)canvasViewController
{
  canvasViewController = self->_canvasViewController;
  if (!canvasViewController)
  {
    v4 = (DTSCanvasViewController *)objc_alloc_init([(ETBrowserViewController *)self canvasViewControllerClass]);
    id v5 = self->_canvasViewController;
    self->_canvasViewController = v4;

    canvasViewController = self->_canvasViewController;
  }

  return canvasViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasViewController, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end