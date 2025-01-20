@interface _MSStickerSendManager
+ (id)sharedInstance;
- (NSString)hostBundleID;
- (_MSStickerSendManagerDelegate)delegate;
- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4;
- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 frameInRemoteView:(CGRect)a5 completionHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setHostBundleID:(id)a3;
- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5;
- (void)startDragSticker:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6;
- (void)stickerDragCanceled;
- (void)stickerDragMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 fence:(id)a7 completionHandler:(id)a8;
- (void)stickerDruidDragEndedWithMSSticker:(id)a3;
- (void)stickerDruidDragStarted;
@end

@implementation _MSStickerSendManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return v2;
}

- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 frameInRemoteView:(CGRect)a5 completionHandler:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v10 = a4;
  id v19 = a6;
  p_delegate = &self->_delegate;
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v16 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v16, "insertSticker:forceStage:frameInRemoteView:completionHandler:", v14, v10, v19, x, y, width, height);

    v17 = [[MSStickerUsageEvent alloc] initWithSticker:v14];
    [(MSStickerUsageEvent *)v17 setUsageType:0];
    [(MSStickerUsageEvent *)v17 send];
  }
  else
  {
    v17 = [[_MSMessageMediaPayload alloc] initWithSticker:v14];

    -[MSStickerUsageEvent setSourceFrame:](v17, "setSourceFrame:", x, y, width, height);
    v18 = +[_MSMessageAppContext activeExtensionContext];
    [v18 stageMediaItem:v17 skipShelf:0 forceStage:v10 completionHandler:&__block_literal_global_6];
    [v18 requestPresentationStyle:0];
  }
}

- (void)startDragSticker:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  p_delegate = &self->_delegate;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v17 = (_MSMessageMediaPayload *)objc_loadWeakRetained((id *)p_delegate);
    -[_MSMessageMediaPayload startDragSticker:frameInRemoteView:fence:completionHandler:](v17, "startDragSticker:frameInRemoteView:fence:completionHandler:", v15, v14, v13, x, y, width, height);
  }
  else
  {
    v17 = [[_MSMessageMediaPayload alloc] initWithSticker:v15];

    id v15 = +[_MSMessageAppContext activeExtensionContext];
    objc_msgSend(v15, "startDragMediaItem:frameInRemoteView:fence:completionHandler:", v17, v14, v13, x, y, width, height);
  }
}

- (void)stickerDragMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 fence:(id)a7 completionHandler:(id)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v22 = a7;
  p_delegate = &self->_delegate;
  id v18 = a8;
  id v19 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v21 = (_MSMessageMediaPayload *)objc_loadWeakRetained((id *)p_delegate);
    -[_MSMessageMediaPayload stickerDragMoved:frameInRemoteView:rotation:scale:fence:completionHandler:](v21, "stickerDragMoved:frameInRemoteView:rotation:scale:fence:completionHandler:", v19, v22, v18, x, y, width, height, a5, a6);
  }
  else
  {
    v21 = [[_MSMessageMediaPayload alloc] initWithSticker:v19];

    id v19 = +[_MSMessageAppContext activeExtensionContext];
    objc_msgSend(v19, "dragMediaItemMoved:frameInRemoteView:rotation:scale:completionHandler:", v21, v18, x, y, width, height, a5, a6);
  }
}

- (void)stickerDragCanceled
{
  id v2 = +[_MSMessageAppContext activeExtensionContext];
  [v2 dragMediaItemCanceled];
}

- (void)stickerDruidDragStarted
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = ms_defaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[_MSStickerSendManager stickerDruidDragStarted]";
    _os_log_impl(&dword_1E4A76000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  v3 = +[_MSMessageAppContext activeExtensionContext];
  [v3 stickerDruidDragStarted];
}

- (void)stickerDruidDragEndedWithMSSticker:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ms_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[_MSStickerSendManager stickerDruidDragEndedWithMSSticker:]";
    _os_log_impl(&dword_1E4A76000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 stickerDruidDragEndedWithMSSticker:v4];
  }
  else
  {
    v8 = +[_MSMessageAppContext activeExtensionContext];
    v9 = [[_MSMessageMediaPayload alloc] initWithSticker:v4];
    [v8 stickerDruidDragEndedWithPayload:v9];
  }
}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[_MSMessageAppContext activeExtensionContext];
  [v7 canShowBrowserForPluginIdentifier:v6 completion:v5];
}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[_MSMessageAppContext activeExtensionContext];
  [v9 showBrowserForPluginIdentifier:v8 style:a4 completion:v7];
}

- (_MSStickerSendManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MSStickerSendManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)hostBundleID
{
  return self->_hostBundleID;
}

- (void)setHostBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostBundleID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end