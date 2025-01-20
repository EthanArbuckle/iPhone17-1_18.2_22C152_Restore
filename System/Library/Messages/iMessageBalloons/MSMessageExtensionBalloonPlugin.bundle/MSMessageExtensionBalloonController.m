@interface MSMessageExtensionBalloonController
- (BOOL)fromMe;
- (BOOL)hasLiveView;
- (BOOL)hasSizingInfo;
- (BOOL)isInteractive;
- (BOOL)wantsBalloonGradient;
- (BOOL)wantsEdgeToEdgeLayout;
- (BOOL)wantsTranscriptGroupMonograms;
- (BOOL)wantsTranscriptTimestampDrawer;
- (BOOL)wantsTransport;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 datasource:(id)a4;
- (CKTranscriptPluginView)pluginContentView;
- (MSMessageExtensionBalloonController)initWithDataSource:(id)a3 isFromMe:(BOOL)a4;
- (MSMessageExtensionBalloonLiveViewController)liveViewController;
- (MSMessageExtensionBalloonView)balloonView;
- (MSMessageExtensionDataSource)datasource;
- (NSArray)recipients;
- (NSString)conversationID;
- (UIViewController)contentViewController;
- (UIViewController)pluginContentViewController;
- (void)clearShelfPayload;
- (void)configureWithConversationID:(id)a3 recipients:(id)a4;
- (void)datasource:(id)a3 didMoveToShelf:(BOOL)a4;
- (void)datasourcePayloadDidChange:(id)a3 updateFlags:(unint64_t)a4;
- (void)dealloc;
- (void)didFinishAnimatedBoundsChange;
- (void)performHostAppResume;
- (void)performHostAppSuspend;
- (void)pluginContentViewDidAppear;
- (void)pluginContentViewDidDissapear;
- (void)pluginContentViewWillDisappear;
- (void)setBalloonView:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setDatasource:(id)a3;
- (void)setLiveViewController:(id)a3;
- (void)setRecipients:(id)a3;
@end

@implementation MSMessageExtensionBalloonController

- (MSMessageExtensionBalloonController)initWithDataSource:(id)a3 isFromMe:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSMessageExtensionBalloonController;
  v8 = [(MSMessageExtensionBalloonController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_fromMe = a4;
    objc_storeStrong((id *)&v8->_datasource, a3);
    [(MSMessageExtensionDataSource *)v9->_datasource setBalloonControllerDelegate:v9];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [(MSMessageExtensionBalloonController *)self liveViewController];
  v4 = [(MSMessageExtensionBalloonController *)self balloonView];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2280C;
  v9[3] = &unk_3CAD8;
  id v5 = v3;
  id v10 = v5;
  id v6 = v4;
  id v11 = v6;
  id v7 = objc_retainBlock(v9);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v7[2])(v7);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }

  v8.receiver = self;
  v8.super_class = (Class)MSMessageExtensionBalloonController;
  [(MSMessageExtensionBalloonController *)&v8 dealloc];
}

- (void)configureWithConversationID:(id)a3 recipients:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MSMessageExtensionBalloonController *)self conversationID];
  v9 = (void *)v8;
  if (v6
    && v8
    && ([v6 isEqualToString:v8] & 1) == 0
    && IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      CFStringRef v12 = @"Hmm, we probably don't handle the conversationID for a chat item changing on the fly. Talk to Stephen.";
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v11, 0xCu);
    }
  }
  [(MSMessageExtensionBalloonController *)self setConversationID:v6];
  [(MSMessageExtensionBalloonController *)self setRecipients:v7];
}

- (CKTranscriptPluginView)pluginContentView
{
  balloonView = self->_balloonView;
  if (!balloonView)
  {
    if ([(MSMessageExtensionBalloonController *)self hasLiveView])
    {
      v4 = [MSMessageExtensionBalloonLiveViewController alloc];
      datasource = self->_datasource;
      BOOL v6 = [(MSMessageExtensionBalloonController *)self fromMe];
      id v7 = [(MSMessageExtensionBalloonController *)self conversationID];
      uint64_t v8 = [(MSMessageExtensionBalloonController *)self recipients];
      v9 = [(MSMessageExtensionBalloonLiveViewController *)v4 initWithDataSource:datasource fromMe:v6 conversationID:v7 recipients:v8];
      [(MSMessageExtensionBalloonController *)self setLiveViewController:v9];

      id v10 = [(MSMessageExtensionBalloonController *)self liveViewController];
      int v11 = [v10 view];
    }
    else
    {
      int v11 = -[MSMessageExtensionBalloonView initWithFrame:dataSource:fromMe:]([MSMessageExtensionBalloonView alloc], "initWithFrame:dataSource:fromMe:", self->_datasource, [(MSMessageExtensionBalloonController *)self fromMe], CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    }
    [(MSMessageExtensionBalloonController *)self setBalloonView:v11];
    [(MSMessageExtensionBalloonView *)v11 setIsInShelf:[(MSMessageExtensionDataSource *)self->_datasource payloadInShelf]];

    balloonView = self->_balloonView;
  }

  return (CKTranscriptPluginView *)balloonView;
}

- (CGSize)sizeThatFits:(CGSize)a3 datasource:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  uint64_t v8 = [v7 message];
  v9 = [v8 layout];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [(MSMessageExtensionBalloonController *)self pluginContentViewController];
    -[NSObject sizeThatFits:](v10, "sizeThatFits:", width, height);
    double width = v11;
    double height = v12;
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_7;
    }
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "This method was made just to support live layout. This may not be doing what you want", v15, 2u);
    }
  }

LABEL_7:
  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (UIViewController)pluginContentViewController
{
  id v3 = [(MSMessageExtensionBalloonController *)self pluginContentView];
  if ([(MSMessageExtensionBalloonController *)self hasLiveView])
  {
    v4 = [(MSMessageExtensionBalloonController *)self liveViewController];
  }
  else
  {
    v4 = 0;
  }

  return (UIViewController *)v4;
}

- (void)datasource:(id)a3 didMoveToShelf:(BOOL)a4
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(MSMessageExtensionBalloonController *)self pluginContentView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)isInteractive
{
  return [(MSMessageExtensionBalloonController *)self hasInteractiveLiveView];
}

- (BOOL)wantsTranscriptTimestampDrawer
{
  return 1;
}

- (BOOL)wantsTranscriptGroupMonograms
{
  return 1;
}

- (BOOL)wantsEdgeToEdgeLayout
{
  return 0;
}

- (BOOL)wantsBalloonGradient
{
  return 0;
}

- (BOOL)wantsTransport
{
  return 1;
}

- (BOOL)hasSizingInfo
{
  return ![(MSMessageExtensionBalloonLiveViewController *)self->_liveViewController needsResize];
}

- (void)performHostAppResume
{
  id v3 = ms_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MSMessageExtensionDataSource *)self->_datasource messageGUID];
    int v5 = 138412290;
    double v6 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "LiveBubble. performHostAppResume reloading remoteView for messageGUID: %@", (uint8_t *)&v5, 0xCu);
  }
  [(MSMessageExtensionBalloonLiveViewController *)self->_liveViewController reloadRemoteViewIsResuming:1];
}

- (void)performHostAppSuspend
{
  id v3 = ms_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MSMessageExtensionDataSource *)self->_datasource messageGUID];
    int v5 = 138412290;
    double v6 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "LiveBubble. performHostAppSuspend tearing down remoteView for messageGUID: %@", (uint8_t *)&v5, 0xCu);
  }
  [(MSMessageExtensionBalloonLiveViewController *)self->_liveViewController requestSnapshot];
  [(MSMessageExtensionBalloonLiveViewController *)self->_liveViewController tearDownRemoteView];
}

- (void)pluginContentViewDidAppear
{
  id v2 = [(MSMessageExtensionBalloonController *)self liveViewController];
  [v2 didFinishAnimatedBoundsChange];
}

- (void)pluginContentViewWillDisappear
{
  id v3 = ms_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MSMessageExtensionDataSource *)self->_datasource messageGUID];
    int v5 = 138412290;
    double v6 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "LiveBubble. pluginContentViewWillDisappear tearing down remoteView for messageGUID: %@", (uint8_t *)&v5, 0xCu);
  }
  [(MSMessageExtensionBalloonLiveViewController *)self->_liveViewController requestSnapshot];
  [(MSMessageExtensionBalloonLiveViewController *)self->_liveViewController tearDownRemoteView];
}

- (void)pluginContentViewDidDissapear
{
  self->_balloonView = 0;
  _objc_release_x1();
}

- (void)didFinishAnimatedBoundsChange
{
  id v2 = [(MSMessageExtensionBalloonController *)self liveViewController];
  [v2 didFinishAnimatedBoundsChange];
}

- (void)clearShelfPayload
{
  id v2 = [(MSMessageExtensionBalloonController *)self liveViewController];
  [v2 clearShelfPayload];
}

- (UIViewController)contentViewController
{
  return 0;
}

- (void)datasourcePayloadDidChange:(id)a3 updateFlags:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  id v7 = [(MSMessageExtensionBalloonController *)self balloonView];
  [v7 dataSourcePluginPayloadDidChange:v6 didUpdateData:v4 & 1];
}

- (BOOL)hasLiveView
{
  id v2 = [(MSMessageExtensionDataSource *)self->_datasource message];
  id v3 = [v2 layout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (MSMessageExtensionBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
}

- (MSMessageExtensionDataSource)datasource
{
  return self->_datasource;
}

- (void)setDatasource:(id)a3
{
}

- (MSMessageExtensionBalloonLiveViewController)liveViewController
{
  return self->_liveViewController;
}

- (void)setLiveViewController:(id)a3
{
}

- (BOOL)fromMe
{
  return self->_fromMe;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_liveViewController, 0);
  objc_storeStrong((id *)&self->_datasource, 0);

  objc_storeStrong((id *)&self->_balloonView, 0);
}

@end