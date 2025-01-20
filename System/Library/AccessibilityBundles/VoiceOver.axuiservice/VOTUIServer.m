@interface VOTUIServer
+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3;
- (BOOL)shouldPreventAutorotatingAllContentViewControllers;
- (CGRect)_handleConvertFrameMessage:(id)a3;
- (Legacy_VOTUIItemChooserController)itemChooserController;
- (NSMutableArray)externalWindowScenes;
- (NSMutableDictionary)captionPanelViewControllers;
- (NSMutableDictionary)cursorViewControllers;
- (NSMutableDictionary)rotorViewControllers;
- (NSMutableDictionary)screenCurtainViewControllers;
- (NSMutableDictionary)systemPointerRegistrants;
- (NSString)voiceOverWarningIdentifier;
- (VOTUIBrailleViewController)brailleViewController;
- (VOTUIElementVisualizationViewController)elementVisualizationViewController;
- (VOTUIMapsExplorationViewController)mapsExplorationViewController;
- (VOTUIServer)init;
- (VOTUISonificationViewController)sonificationViewController;
- (VOTUISystemPointerController)systemPointerController;
- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4;
- (id)_handleConvertFramesMessage:(id)a3;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)_addBrailleViewControllerWithOrientation:(int64_t)a3 dotNumberPositions:(id)a4 typingMode:(int64_t)a5;
- (void)_addMapsExplorationViewController;
- (void)_handleBeginSonificationPlayback:(id)a3;
- (void)_handleDisplayUIServerBasedItemChooser:(id)a3;
- (void)_handleFlashBrailleInsertedTextMessage:(id)a3;
- (void)_handleHideVoiceOverWarning:(id)a3;
- (void)_handleHighlightBrailleDotsMessage:(id)a3;
- (void)_handleHighlightMapsExplorationSegmentMessage:(id)a3;
- (void)_handleMoveSystemPointerToPointWithMessage:(id)a3;
- (void)_handlePauseSonificationPlayback:(id)a3;
- (void)_handleRegisterForSystemPointerEventsWithMessage:(id)a3 clientIdentifier:(id)a4;
- (void)_handleScreenCurtainEnabled:(BOOL)a3;
- (void)_handleSendFocusChangeToZoom:(id)a3;
- (void)_handleSetCursorFrameMessage:(id)a3;
- (void)_handleSetElementVisualizationFramesMessage:(id)a3;
- (void)_handleSetSonificationPlayheadPosition:(id)a3;
- (void)_handleShowBrailleUIMessage:(id)a3;
- (void)_handleShowMapsExplorationUIMessage:(id)a3;
- (void)_handleShowVoiceOverWarning:(id)a3;
- (void)_handleUpdateBrailleUIMessage:(id)a3;
- (void)_handleUpdateMapsExplorationCurrentCenter:(id)a3;
- (void)_handleUpdateMapsExplorationUIWithCurrentLocationMessage:(id)a3;
- (void)_handleUpdateVisualRotor:(id)a3;
- (void)_handleVoiceOverCaptionPanelEnabled:(id)a3;
- (void)_handleZoomFocusChangeNotification:(id)a3;
- (void)_removeBrailleViewController;
- (void)_removeCaptionPanelViewControllers;
- (void)_removeCursorViewControllers;
- (void)_removeElementVisualizationViewController;
- (void)_removeItemChooserController;
- (void)_removeMapsExplorationViewController;
- (void)_removeRotorViewControllers;
- (void)_removeScreenCurtainControllers;
- (void)_removeSonificationViewController;
- (void)_toggleVoiceOverCaptionPanelViewController;
- (void)_updateCursorWithFrame:(CGRect)a3 pathData:(id)a4 animate:(BOOL)a5 displayID:(id)a6;
- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3;
- (void)dealloc;
- (void)externalDisplaySceneConnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)externalDisplaySceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4;
- (void)setBrailleViewController:(id)a3;
- (void)setCaptionPanelViewControllers:(id)a3;
- (void)setCursorViewControllers:(id)a3;
- (void)setElementVisualizationViewController:(id)a3;
- (void)setExternalWindowScenes:(id)a3;
- (void)setItemChooserController:(id)a3;
- (void)setMapsExplorationViewController:(id)a3;
- (void)setRotorViewControllers:(id)a3;
- (void)setScreenCurtainViewControllers:(id)a3;
- (void)setSonificationViewController:(id)a3;
- (void)setSystemPointerController:(id)a3;
- (void)setSystemPointerRegistrants:(id)a3;
- (void)setVoiceOverWarningIdentifier:(id)a3;
- (void)systemPointerController:(id)a3 pointerDidMoveToGlobalPoint:(CGPoint)a4;
@end

@implementation VOTUIServer

- (VOTUIServer)init
{
  v17.receiver = self;
  v17.super_class = (Class)VOTUIServer;
  v2 = [(VOTUIServer *)&v17 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSettings sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_63AC;
    v14[3] = &unk_3D288;
    objc_copyWeak(&v15, &location);
    id v4 = objc_loadWeakRetained(&location);
    [v3 registerUpdateBlock:v14 forRetrieveSelector:"enableVoiceOverCaptions" withListener:v4];

    objc_destroyWeak(&v15);
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_voiceOverStatusChanged" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];
    [v5 addObserver:v2 selector:"_handleZoomFocusChangeNotification:" name:UIAXZoomFocusChangedNotification object:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_63EC;
    block[3] = &unk_3D2B0;
    v6 = v2;
    v13 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v7 = +[NSMutableArray array];
    [(VOTUIServer *)v6 setExternalWindowScenes:v7];

    v8 = +[NSMutableDictionary dictionary];
    [(VOTUIServer *)v6 setCursorViewControllers:v8];

    v9 = +[NSMutableDictionary dictionary];
    [(VOTUIServer *)v6 setCaptionPanelViewControllers:v9];

    v10 = +[NSMutableDictionary dictionary];
    [(VOTUIServer *)v6 setRotorViewControllers:v10];

    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(VOTUIServer *)self _removeCursorViewControllers];
  [(VOTUIServer *)self _removeBrailleViewController];
  [(VOTUIServer *)self _removeMapsExplorationViewController];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];
  [(VOTUIServer *)self _removeCaptionPanelViewControllers];
  [(VOTUIServer *)self _removeElementVisualizationViewController];
  [(VOTUIServer *)self _removeScreenCurtainControllers];
  [(VOTUIServer *)self _removeSonificationViewController];

  v4.receiver = self;
  v4.super_class = (Class)VOTUIServer;
  [(VOTUIServer *)&v4 dealloc];
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  switch(a4)
  {
    case 1uLL:
      [(VOTUIServer *)self _handleSetCursorFrameMessage:v9];
      goto LABEL_38;
    case 2uLL:
      [(VOTUIServer *)self _handleShowBrailleUIMessage:v9];
      goto LABEL_38;
    case 3uLL:
      [(VOTUIServer *)self _handleHideBrailleUIMessage:v9];
      goto LABEL_38;
    case 4uLL:
      [(VOTUIServer *)self _handleHighlightBrailleDotsMessage:v9];
      goto LABEL_38;
    case 5uLL:
      [(VOTUIServer *)self _handleUpdateBrailleUIMessage:v9];
      goto LABEL_38;
    case 6uLL:
      [(VOTUIServer *)self _handleFlashBrailleInsertedTextMessage:v9];
      goto LABEL_38;
    case 7uLL:
      v11 = [v9 objectForKeyedSubscript:@"enabled"];
      -[VOTUIServer _handleScreenCurtainEnabled:](self, "_handleScreenCurtainEnabled:", [v11 BOOLValue]);
      goto LABEL_32;
    case 8uLL:
      [(VOTUIServer *)self _handleVoiceOverCaptionPanelEnabled:v9];
      goto LABEL_38;
    case 9uLL:
      v12 = [(VOTUIServer *)self cursorViewControllers];
      v13 = [v12 objectForKeyedSubscript:&off_40110];
      v14 = [v13 view];
      id v15 = [v14 window];
      v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v15 _contextId]);

      CFStringRef v30 = @"contextId";
      v31 = v11;
      v16 = &v31;
      objc_super v17 = &v30;
      goto LABEL_21;
    case 0xAuLL:
      [(VOTUIServer *)self _handleSetElementVisualizationFramesMessage:v9];
      goto LABEL_38;
    case 0xBuLL:
      [(VOTUIServer *)self _handleUpdateVisualRotor:v9];
      goto LABEL_38;
    case 0xCuLL:
      [(VOTUIServer *)self _handleDisplayUIServerBasedItemChooser:v9];
      goto LABEL_38;
    case 0xDuLL:
      [(VOTUIServer *)self _handleConvertFrameMessage:v9];
      CGFloat x = v33.origin.x;
      CGFloat y = v33.origin.y;
      CGFloat width = v33.size.width;
      CGFloat height = v33.size.height;
      if (CGRectIsNull(v33)) {
        goto LABEL_38;
      }
      CFStringRef v28 = @"convertedFrame";
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.CGFloat width = width;
      v34.size.CGFloat height = height;
      v11 = NSStringFromRect(v34);
      v29 = v11;
      v16 = &v29;
      objc_super v17 = &v28;
      goto LABEL_21;
    case 0xEuLL:
      v11 = [(VOTUIServer *)self _handleConvertFramesMessage:v9];
      if (![v11 count]) {
        goto LABEL_32;
      }
      CFStringRef v26 = @"convertedFramesStrings";
      v27 = v11;
      v16 = &v27;
      objc_super v17 = &v26;
LABEL_21:
      v22 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v17 count:1];

      goto LABEL_39;
    case 0xFuLL:
      [(VOTUIServer *)self _handleShowMapsExplorationUIMessage:v9];
      goto LABEL_38;
    case 0x10uLL:
      [(VOTUIServer *)self _handleHighlightMapsExplorationSegmentMessage:v9];
      goto LABEL_38;
    case 0x11uLL:
      [(VOTUIServer *)self _handleUpdateMapsExplorationCurrentCenter:v9];
      goto LABEL_38;
    case 0x12uLL:
      [(VOTUIServer *)self _handleUpdateMapsExplorationUIWithCurrentLocationMessage:v9];
      goto LABEL_38;
    case 0x13uLL:
      [(VOTUIServer *)self _handleHideMapsExplorationUIMessage:v9];
      goto LABEL_38;
    case 0x14uLL:
      [(VOTUIServer *)self _handleSendFocusChangeToZoom:v9];
      goto LABEL_38;
    case 0x15uLL:
      [(VOTUIServer *)self _handleSetSonificationPlayheadPosition:v9];
      goto LABEL_38;
    case 0x16uLL:
      [(VOTUIServer *)self _handleBeginSonificationPlayback:v9];
      goto LABEL_38;
    case 0x17uLL:
      [(VOTUIServer *)self _handlePauseSonificationPlayback:v9];
      goto LABEL_38;
    case 0x18uLL:
      v11 = +[AXUIDisplayManager sharedDisplayManager];
      v23 = [v9 objectForKeyedSubscript:@"alertText"];
      id v24 = [v11 showAlertWithText:v23 subtitleText:0 iconImage:0 type:5 priority:20 duration:self forService:AXUIAlertDisplayTimeDefaultForBanners];

LABEL_32:
      goto LABEL_38;
    case 0x19uLL:
      [(VOTUIServer *)self _handleRegisterForSystemPointerEventsWithMessage:v9 clientIdentifier:v10];
      goto LABEL_38;
    case 0x1AuLL:
      [(VOTUIServer *)self _handleMoveSystemPointerToPointWithMessage:v9];
      goto LABEL_38;
    case 0x1BuLL:
      goto LABEL_42;
    case 0x1CuLL:
      [(VOTUIServer *)self _handleToggleElementLabeler:v9];
      goto LABEL_38;
    case 0x1DuLL:
      [(VOTUIServer *)self _handleToggleQuickSettings];
      goto LABEL_38;
    default:
      if (a4 == 10000)
      {
        [(VOTUIServer *)self _handleShowVoiceOverWarning:v9];
      }
      else
      {
        if (a4 != 10001) {
LABEL_42:
        }
          abort();
        [(VOTUIServer *)self _handleHideVoiceOverWarning:v9];
      }
LABEL_38:
      v22 = 0;
LABEL_39:

      return v22;
  }
}

+ (id)possibleRequiredEntitlementsForProcessingMessageWithIdentifier:(unint64_t)a3
{
  if (a3 == 1) {
    +[NSSet setWithArray:&off_401D8];
  }
  else {
  v3 = +[NSSet setWithObject:@"com.apple.accessibility.voiceover"];
  }

  return v3;
}

- (void)systemPointerController:(id)a3 pointerDidMoveToGlobalPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(VOTUIServer *)self systemPointerRegistrants];
  v7 = [v6 objectEnumerator];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
        CFStringRef v19 = @"point";
        v22.CGFloat x = x;
        v22.CGFloat y = y;
        v13 = NSStringFromCGPoint(v22);
        v20 = v13;
        v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        [v12 sendAsynchronousMessage:v14 withIdentifier:1001 targetAccessQueue:0 completion:0];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)_handleMoveSystemPointerToPointWithMessage:(id)a3
{
  id v11 = a3;
  objc_super v4 = +[AXSettings sharedInstance];
  unsigned int v5 = [v4 laserEnabled];

  if (v5)
  {
    v6 = [v11 objectForKeyedSubscript:@"point"];
    CGPoint v7 = CGPointFromString(v6);

    id v8 = [v11 objectForKeyedSubscript:@"contextId"];
    id v9 = [v8 unsignedIntValue];

    uint64_t v10 = [(VOTUIServer *)self systemPointerController];
    objc_msgSend(v10, "movePointerToPoint:contextId:", v9, v7.x, v7.y);
  }
}

- (void)_handleRegisterForSystemPointerEventsWithMessage:(id)a3 clientIdentifier:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  CGPoint v7 = +[AXSettings sharedInstance];
  unsigned int v8 = [v7 laserEnabled];

  if (v8)
  {
    id v9 = [v17 objectForKeyedSubscript:@"register"];
    unsigned int v10 = [v9 BOOLValue];

    id v11 = [(VOTUIServer *)self systemPointerRegistrants];
    v12 = v11;
    if (v10)
    {
      v13 = [v11 objectForKeyedSubscript:v6];

      if (v13) {
        goto LABEL_9;
      }
      v14 = [(VOTUIServer *)self systemPointerRegistrants];

      if (!v14)
      {
        long long v15 = +[NSMutableDictionary dictionary];
        [(VOTUIServer *)self setSystemPointerRegistrants:v15];
      }
      v12 = +[AXUIClientMessenger clientMessengerWithIdentifier:v6];
      long long v16 = [(VOTUIServer *)self systemPointerRegistrants];
      [v16 setObject:v12 forKeyedSubscript:v6];
    }
    else
    {
      [v11 removeObjectForKey:v6];
    }
  }
LABEL_9:
}

- (void)_handleVoiceOverCaptionPanelEnabled:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned int v5 = [(VOTUIServer *)self captionPanelViewControllers];
  id v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      unsigned int v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 parseMessage:v4];
        }
        unsigned int v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_toggleVoiceOverCaptionPanelViewController
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3 = +[AXSettings sharedInstance];
    if ([v3 enableVoiceOverCaptions])
    {
      id v4 = [(VOTUIServer *)self screenCurtainViewControllers];

      if (!v4)
      {
        unsigned int v5 = [(VOTUIServer *)self captionPanelViewControllers];
        id v6 = [v5 allKeys];
        unsigned __int8 v7 = [v6 containsObject:&off_40110];

        if ((v7 & 1) == 0)
        {
          id v8 = objc_alloc_init(VOTUICaptionPanelViewController);
          uint64_t v9 = [(VOTUIServer *)self captionPanelViewControllers];
          [v9 setObject:v8 forKeyedSubscript:&off_40110];

          unsigned int v10 = +[AXUIDisplayManager sharedDisplayManager];
          id v11 = [(VOTUIServer *)self captionPanelViewControllers];
          long long v12 = [v11 objectForKeyedSubscript:&off_40110];
          [v10 addContentViewController:v12 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle:0 forWindowScene:0 spatialConfiguration:0 completion:0];
        }
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        obj = self->_externalWindowScenes;
        id v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v27;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v27 != v15) {
                objc_enumerationMutation(obj);
              }
              id v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              long long v18 = objc_alloc_init(VOTUICaptionPanelViewController);
              captionPanelViewControllers = self->_captionPanelViewControllers;
              v20 = [v17 screen];
              v21 = [v20 displayIdentity];
              CGPoint v22 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v21 displayID]);
              [(NSMutableDictionary *)captionPanelViewControllers setObject:v18 forKeyedSubscript:v22];

              v23 = +[AXUIDisplayManager sharedDisplayManager];
              [v23 addContentViewController:v18 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle:0 forWindowScene:v17 completion:0];
            }
            id v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v14);
        }

        return;
      }
    }
    else
    {
    }
  }
  id v24 = [(VOTUIServer *)self captionPanelViewControllers];

  if (v24)
  {
    [(VOTUIServer *)self _removeCaptionPanelViewControllers];
  }
}

- (void)_removeCaptionPanelViewControllers
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(VOTUIServer *)self captionPanelViewControllers];
  id v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        unsigned int v10 = +[AXUIDisplayManager sharedDisplayManager];
        [v10 removeContentViewController:v9 withUserInteractionEnabled:0 forService:self context:0 completion:0];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v11 = [(VOTUIServer *)self captionPanelViewControllers];
  [v11 removeAllObjects];
}

- (void)_handleSetCursorFrameMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"animate"];
  id v6 = [v5 BOOLValue];

  uint64_t v7 = [v4 objectForKey:@"frame"];
  CGRect v39 = CGRectFromString(v7);
  double x = v39.origin.x;
  double y = v39.origin.y;
  double width = v39.size.width;
  double height = v39.size.height;

  long long v12 = [v4 objectForKey:@"path"];
  long long v13 = [v4 objectForKey:@"display"];

  if (v13)
  {
    long long v14 = [(VOTUIServer *)self cursorViewControllers];
    long long v15 = [v14 allKeys];
    unsigned __int8 v16 = [v15 containsObject:v13];

    if ((v16 & 1) == 0)
    {
      id v17 = [[VOTUICursorViewController alloc] initWithAXUIService:self];
      long long v18 = [(VOTUIServer *)self cursorViewControllers];
      [v18 setObject:v17 forKeyedSubscript:v13];

      CFStringRef v19 = +[AXUIDisplayManager sharedDisplayManager];
      v20 = [(VOTUIServer *)self cursorViewControllers];
      v21 = [v20 objectForKeyedSubscript:v13];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_767C;
      v31[3] = &unk_3D2D8;
      v31[4] = self;
      double v34 = x;
      double v35 = y;
      double v36 = width;
      double v37 = height;
      id v32 = v12;
      char v38 = (char)v6;
      id v22 = v13;
      id v33 = v22;
      [v19 addContentViewController:v21 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle:0 forWindowScene:0 completion:v31];

      v23 = +[AXSettings sharedInstance];
      LODWORD(v20) = [v23 laserEnabled];

      if (v20)
      {
        id v24 = [VOTUISystemPointerController alloc];
        v25 = [(VOTUIServer *)self cursorViewControllers];
        long long v26 = [v25 objectForKeyedSubscript:v22];
        long long v27 = [v26 view];
        long long v28 = [v27 window];
        long long v29 = -[VOTUISystemPointerController initWithContextId:](v24, "initWithContextId:", [v28 _contextId]);
        [(VOTUIServer *)self setSystemPointerController:v29];

        CFStringRef v30 = [(VOTUIServer *)self systemPointerController];
        [v30 setDelegate:self];
      }
    }
    -[VOTUIServer _updateCursorWithFrame:pathData:animate:displayID:](self, "_updateCursorWithFrame:pathData:animate:displayID:", v12, v6, v13, x, y, width, height);
  }
}

- (void)_updateCursorWithFrame:(CGRect)a3 pathData:(id)a4 animate:(BOOL)a5 displayID:(id)a6
{
  BOOL v37 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a6;
  id v38 = v12;
  if (v12) {
    long long v14 = (const void *)AX_CGPathCreateWithDataRepresentation();
  }
  else {
    long long v14 = 0;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v15 = [(VOTUIServer *)self cursorViewControllers];
  unsigned __int8 v16 = [v15 allKeys];

  id v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(id *)(*((void *)&v39 + 1) + 8 * i);
        id v22 = [(VOTUIServer *)self cursorViewControllers];
        v23 = [v22 objectForKeyedSubscript:v21];
        [v23 setCursorHidden:v21 != v13];
      }
      id v18 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v18);
  }

  v44.origin.double x = CGRectZero.origin.x;
  v44.origin.double y = CGRectZero.origin.y;
  v44.size.double width = CGRectZero.size.width;
  v44.size.double height = CGRectZero.size.height;
  v45.origin.double x = x;
  v45.origin.double y = y;
  v45.size.double width = width;
  v45.size.double height = height;
  BOOL v24 = CGRectEqualToRect(v44, v45);
  v25 = [(VOTUIServer *)self cursorViewControllers];
  long long v26 = [v25 objectForKeyedSubscript:v13];
  long long v27 = v26;
  if (v24 && v14 == 0)
  {
    [v26 setCursorHidden:1];

    CFStringRef v30 = v38;
  }
  else
  {
    unsigned int v29 = [v26 cursorHidden];

    CFStringRef v30 = v38;
    if (v29)
    {
      v31 = [(VOTUIServer *)self cursorViewControllers];
      id v32 = [v31 objectForKeyedSubscript:v13];
      [v32 setCursorHidden:0];
    }
    id v33 = [(VOTUIServer *)self cursorViewControllers];
    double v34 = [v33 objectForKeyedSubscript:v13];
    objc_msgSend(v34, "setCursorFrame:animated:", v37, x, y, width, height);

    double v35 = [(VOTUIServer *)self cursorViewControllers];
    double v36 = [v35 objectForKeyedSubscript:v13];
    [v36 setCursorPath:v14];

    if (v14) {
      CFRelease(v14);
    }
  }
}

- (void)_handleSetElementVisualizationFramesMessage:(id)a3
{
  id v4 = a3;
  id v13 = [v4 objectForKey:@"elementVisualizationFrames"];
  id v5 = [v4 objectForKey:@"elementVisualizationFrameLabels"];
  id v6 = [v4 objectForKey:@"elementVisualizationUIClasses"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v13 count]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = [(VOTUIServer *)self elementVisualizationViewController];

    if (!v7)
    {
      id v8 = objc_alloc_init(VOTUIElementVisualizationViewController);
      [(VOTUIServer *)self setElementVisualizationViewController:v8];

      uint64_t v9 = +[AXUIDisplayManager sharedDisplayManager];
      unsigned int v10 = [(VOTUIServer *)self elementVisualizationViewController];
      [v9 addContentViewController:v10 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle:0 forWindowScene:0 completion:0];
    }
    id v11 = [(VOTUIServer *)self elementVisualizationViewController];
    [v11 setElementFrames:v13 labels:v5 uiClasses:v6];
  }
  else
  {
    id v12 = [(VOTUIServer *)self elementVisualizationViewController];

    if (v12) {
      [(VOTUIServer *)self _removeElementVisualizationViewController];
    }
  }
}

- (void)_handleShowVoiceOverWarning:(id)a3
{
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = AXLocStringKeyForHomeButtonAndExclusiveModel();
  id v5 = [v9 localizedStringForKey:v4 value:&stru_3F588 table:@"VoiceOverUIService"];
  id v6 = [(VOTUIServer *)self voiceOverWarningIdentifier];

  if (!v6)
  {
    uint64_t v7 = +[AXUIDisplayManager sharedDisplayManager];
    id v8 = [v7 showAlertWithText:v5 subtitleText:0 iconImage:0 type:4 priority:20 duration:self forService:AXUIAlertDisplayTimeForever];
    [(VOTUIServer *)self setVoiceOverWarningIdentifier:v8];
  }
}

- (void)_handleHideVoiceOverWarning:(id)a3
{
  id v4 = [(VOTUIServer *)self voiceOverWarningIdentifier];

  if (v4)
  {
    id v5 = +[AXUIDisplayManager sharedDisplayManager];
    id v6 = [(VOTUIServer *)self voiceOverWarningIdentifier];
    [v5 hideAlertWithIdentifier:v6 forService:self];

    [(VOTUIServer *)self setVoiceOverWarningIdentifier:0];
  }
}

- (void)_handleUpdateVisualRotor:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTUIServer *)self rotorViewControllers];
  id v6 = [v5 allKeys];
  unsigned __int8 v7 = [v6 containsObject:&off_40110];

  if ((v7 & 1) == 0)
  {
    id v8 = objc_alloc_init(VOTUIRotorViewController);
    id v9 = [(VOTUIServer *)self rotorViewControllers];
    [v9 setObject:v8 forKeyedSubscript:&off_40110];

    unsigned int v10 = +[AXUIDisplayManager sharedDisplayManager];
    id v11 = [(VOTUIServer *)self rotorViewControllers];
    id v12 = [v11 objectForKeyedSubscript:&off_40110];
    [v10 addContentViewController:v12 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle:0 forWindowScene:0 spatialConfiguration:0 completion:0];
  }
  if ([(NSMutableArray *)self->_externalWindowScenes count])
  {
    id v30 = v4;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = [(VOTUIServer *)self cursorViewControllers];
    long long v14 = [v13 allKeys];

    id obj = v14;
    id v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v33;
      id v18 = &off_40110;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v21 = [(VOTUIServer *)self cursorViewControllers];
          id v22 = [v21 objectForKeyedSubscript:v20];
          v23 = [v22 view];
          id v24 = [v23 isHidden];

          if ((v24 & 1) == 0)
          {
            v25 = v20;

            id v18 = v25;
          }
          long long v26 = [(VOTUIServer *)self rotorViewControllers];
          long long v27 = [v26 objectForKeyedSubscript:v20];
          [v27 setRotorHidden:v24];
        }
        id v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }
    else
    {
      id v18 = &off_40110;
    }

    id v4 = v30;
  }
  else
  {
    id v18 = &off_40110;
  }
  long long v28 = [(VOTUIServer *)self rotorViewControllers];
  unsigned int v29 = [v28 objectForKeyedSubscript:v18];
  [v29 updateVisualRotor:v4];
}

- (CGRect)_handleConvertFrameMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"frame"];
  CGRect v25 = CGRectFromString(v5);
  double x = v25.origin.x;
  double y = v25.origin.y;
  double width = v25.size.width;
  double height = v25.size.height;

  unsigned int v10 = [v4 objectForKey:@"display"];

  id v11 = [(VOTUIServer *)self cursorViewControllers];
  id v12 = [v11 objectForKeyedSubscript:v10];
  objc_msgSend(v12, "convertFrameToCursorSpace:", x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (id)_handleConvertFramesMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"frames"];
  id v6 = [v4 objectForKey:@"display"];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        CGRect v35 = CGRectFromString((NSString *)*(void *)(*((void *)&v29 + 1) + 8 * i));
        double x = v35.origin.x;
        double y = v35.origin.y;
        double width = v35.size.width;
        double height = v35.size.height;
        double v17 = [(VOTUIServer *)self cursorViewControllers];
        double v18 = [v17 objectForKeyedSubscript:v6];
        objc_msgSend(v18, "convertFrameToCursorSpace:", x, y, width, height);
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;

        v36.origin.double x = v20;
        v36.origin.double y = v22;
        v36.size.double width = v24;
        v36.size.double height = v26;
        if (!CGRectIsNull(v36))
        {
          v37.origin.double x = v20;
          v37.origin.double y = v22;
          v37.size.double width = v24;
          v37.size.double height = v26;
          long long v27 = NSStringFromCGRect(v37);
          [v7 addObject:v27];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)_handleShowMapsExplorationUIMessage:(id)a3
{
  id v4 = a3;
  [(VOTUIServer *)self _addMapsExplorationViewController];
  id v13 = [v4 objectForKeyedSubscript:@"mapsExplorationCenter"];
  id v5 = [(VOTUIServer *)self mapsExplorationViewController];
  id v6 = [v13 firstObject];
  [v6 floatValue];
  double v8 = v7;
  id v9 = [v13 objectAtIndex:1];
  [v9 floatValue];
  double v11 = v10;
  id v12 = [v4 objectForKeyedSubscript:@"mapsExplorationData"];

  objc_msgSend(v5, "updateUIWithCenter:andExplorationSegments:", v12, v8, v11);
}

- (void)_handleUpdateMapsExplorationCurrentCenter:(id)a3
{
  id v10 = [a3 objectForKeyedSubscript:@"mapsExplorationCenter"];
  id v4 = [(VOTUIServer *)self mapsExplorationViewController];
  id v5 = [v10 firstObject];
  [v5 floatValue];
  double v7 = v6;
  double v8 = [v10 objectAtIndex:1];
  [v8 floatValue];
  objc_msgSend(v4, "updateUIWithCenter:", v7, v9);
}

- (void)_handleUpdateMapsExplorationUIWithCurrentLocationMessage:(id)a3
{
  id v10 = [a3 objectForKeyedSubscript:@"mapsExplorationCurrentLocation"];
  id v4 = [(VOTUIServer *)self mapsExplorationViewController];
  id v5 = [v10 firstObject];
  [v5 floatValue];
  double v7 = v6;
  double v8 = [v10 objectAtIndex:1];
  [v8 floatValue];
  objc_msgSend(v4, "updateUIWithCurrentLocation:", v7, v9);
}

- (void)_handleHighlightMapsExplorationSegmentMessage:(id)a3
{
  id v4 = a3;
  id v6 = [(VOTUIServer *)self mapsExplorationViewController];
  id v5 = [v4 objectForKeyedSubscript:@"mapsExplorationIndex"];

  objc_msgSend(v6, "highlightExplorationSegmentWithIndex:", (int)objc_msgSend(v5, "intValue"));
}

- (void)_handleShowBrailleUIMessage:(id)a3
{
  id v4 = a3;
  id v9 = [v4 objectForKeyedSubscript:@"brailleOrientation"];
  uint64_t v5 = (int)[v9 intValue];
  id v6 = [v4 objectForKeyedSubscript:@"brailleDotPositions"];
  double v7 = sub_86CC(v6);
  double v8 = [v4 objectForKeyedSubscript:@"brailleTypingMode"];

  -[VOTUIServer _addBrailleViewControllerWithOrientation:dotNumberPositions:typingMode:](self, "_addBrailleViewControllerWithOrientation:dotNumberPositions:typingMode:", v5, v7, (int)[v8 intValue]);
}

- (void)_handleHighlightBrailleDotsMessage:(id)a3
{
  id v4 = a3;
  id v6 = [(VOTUIServer *)self brailleViewController];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"brailleDotNumbers"];

  [v6 highlightBrailleDots:v5];
}

- (void)_handleUpdateBrailleUIMessage:(id)a3
{
  id v4 = a3;
  id v10 = [(VOTUIServer *)self brailleViewController];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"brailleOrientation"];
  uint64_t v6 = (int)[v5 intValue];
  double v7 = [v4 objectForKeyedSubscript:@"brailleDotPositions"];
  double v8 = sub_86CC(v7);
  id v9 = [v4 objectForKeyedSubscript:@"brailleTypingMode"];

  objc_msgSend(v10, "setOrientation:dotNumberPositions:typingMode:", v6, v8, (int)objc_msgSend(v9, "intValue"));
}

- (void)_handleSendFocusChangeToZoom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"FocusChangeFrameKey"];
  CGRect v41 = CGRectFromString(v5);
  double x = v41.origin.x;
  double y = v41.origin.y;
  double width = v41.size.width;
  double height = v41.size.height;

  id v10 = [v4 objectForKeyedSubscript:@"FocusChangeTypeKey"];
  id v11 = [v10 integerValue];

  id v39 = [v4 objectForKeyedSubscript:@"display"];

  id v12 = [(VOTUIServer *)self cursorViewControllers];
  id v13 = [v12 objectForKeyedSubscript:v39];
  objc_msgSend(v13, "convertFrameToCursorSpace:", x, y, width, height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  CGFloat v22 = [(VOTUIServer *)self cursorViewControllers];
  double v23 = [v22 objectForKeyedSubscript:v39];
  CGFloat v24 = [v23 view];
  double v25 = [(VOTUIServer *)self cursorViewControllers];
  CGFloat v26 = [v25 objectForKeyedSubscript:v39];
  long long v27 = [v26 cursorView];
  objc_msgSend(v24, "convertRect:toView:", v27, v15, v17, v19, v21);
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;

  CGRect v36 = [(VOTUIServer *)self cursorViewControllers];
  CGRect v37 = [v36 objectForKeyedSubscript:v39];
  id v38 = [v37 cursorView];
  v42.origin.double x = v29;
  v42.origin.double y = v31;
  v42.size.double width = v33;
  v42.size.double height = v35;
  UIAccessibilityZoomFocusChanged((UIAccessibilityZoomType)v11, v42, v38);
}

- (void)_handleZoomFocusChangeNotification:(id)a3
{
  id v20 = a3;
  v3 = [v20 userInfo];
  id v4 = [v3 objectForKey:@"type"];
  uint64_t v5 = (char *)[v4 integerValue];

  if ((unint64_t)(v5 - 1) <= 1)
  {
    uint64_t v6 = [v20 userInfo];
    double v7 = [v6 objectForKey:@"window"];

    AXUIRectForZoomFocusChangeNotification();
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = +[ZoomServices sharedInstance];
    id v17 = [v7 _contextId];
    double v18 = [v7 screen];
    double v19 = [v18 displayIdentity];
    objc_msgSend(v16, "notifyZoomFocusDidChangeWithType:rect:contextId:keyboardFrame:displayId:", v5, v17, objc_msgSend(v19, "displayID"), v9, v11, v13, v15, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  }
}

- (void)_handleSetSonificationPlayheadPosition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VOTUIServer *)self sonificationViewController];

  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(VOTUISonificationViewController);
    [(VOTUIServer *)self setSonificationViewController:v6];

    double v7 = +[AXUIDisplayManager sharedDisplayManager];
    double v8 = [(VOTUIServer *)self sonificationViewController];
    [v7 addContentViewController:v8 withUserInteractionEnabled:0 forService:self];
  }
  double v9 = [v4 objectForKeyedSubscript:@"sonificationPlaybackBounds"];
  CGRect v30 = CGRectFromString(v9);
  double x = v30.origin.x;
  double y = v30.origin.y;
  double width = v30.size.width;
  double height = v30.size.height;

  double v14 = [v4 objectForKeyedSubscript:@"sonificationPlayheadProgress"];

  [v14 doubleValue];
  double v16 = v15;

  id v17 = [(VOTUIServer *)self sonificationViewController];
  objc_msgSend(v17, "convertFrameToViewSpace:", x, y, width, height);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  CGFloat v26 = [(VOTUIServer *)self sonificationViewController];
  [v26 setPlayheadHidden:v16 < 0.0];

  long long v27 = [(VOTUIServer *)self sonificationViewController];
  objc_msgSend(v27, "setPlaybackBounds:", v19, v21, v23, v25);

  id v28 = [(VOTUIServer *)self sonificationViewController];
  [v28 setPlayheadProgress:v16];
}

- (void)_handleBeginSonificationPlayback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VOTUIServer *)self sonificationViewController];

  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(VOTUISonificationViewController);
    [(VOTUIServer *)self setSonificationViewController:v6];

    double v7 = +[AXUIDisplayManager sharedDisplayManager];
    double v8 = [(VOTUIServer *)self sonificationViewController];
    [v7 addContentViewController:v8 withUserInteractionEnabled:0 forService:self];
  }
  double v9 = [v4 objectForKeyedSubscript:@"sonificationPlaybackBounds"];
  CGRect v39 = CGRectFromString(v9);
  double x = v39.origin.x;
  double y = v39.origin.y;
  double width = v39.size.width;
  double height = v39.size.height;

  double v14 = [v4 objectForKeyedSubscript:@"sonificationPlayheadProgress"];
  [v14 doubleValue];
  double v16 = v15;

  id v17 = [(VOTUIServer *)self sonificationViewController];
  objc_msgSend(v17, "convertFrameToViewSpace:", x, y, width, height);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  CGFloat v26 = [v4 objectForKeyedSubscript:@"sonificationDuration"];
  [v26 doubleValue];
  double v28 = v27;

  CGFloat v29 = [v4 objectForKeyedSubscript:@"sonificationPlaybackStartTime"];
  [v29 doubleValue];
  double v31 = v30;

  double v32 = [v4 objectForKeyedSubscript:@"sonificationNormalizedPlayheadPosition"];

  [v32 doubleValue];
  double v34 = v33;

  CGFloat v35 = [(VOTUIServer *)self sonificationViewController];
  [v35 setPlayheadProgress:v16];

  CGRect v36 = [(VOTUIServer *)self sonificationViewController];
  objc_msgSend(v36, "setPlaybackBounds:", v19, v21, v23, v25);

  id v37 = [(VOTUIServer *)self sonificationViewController];
  [v37 resumePlaybackFromPosition:v34 startTime:v31 totalDuration:v28];
}

- (void)_handlePauseSonificationPlayback:(id)a3
{
  id v3 = [(VOTUIServer *)self sonificationViewController];
  [v3 pausePlayback];
}

- (void)_handleDisplayUIServerBasedItemChooser:(id)a3
{
  id v9 = [a3 objectForKeyedSubscript:@"items"];
  id v4 = [(VOTUIServer *)self itemChooserController];
  if (v9)
  {

    if (!v4)
    {
      uint64_t v5 = objc_alloc_init(Legacy_VOTUIItemChooserController);
      [(VOTUIServer *)self setItemChooserController:v5];

      uint64_t v6 = [(VOTUIServer *)self itemChooserController];
      [v6 setDelegate:self];

      double v7 = +[AXUIDisplayManager sharedDisplayManager];
      double v8 = [(VOTUIServer *)self itemChooserController];
      [v7 addContentViewController:v8 withUserInteractionEnabled:1 forService:self];
    }
    id v4 = [(VOTUIServer *)self itemChooserController];
    [v4 showItemChooser:v9];
  }
  else
  {
    [v4 hideItemChooser:0];
  }
}

- (void)_handleScreenCurtainEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    [(VOTUIServer *)self _removeScreenCurtainControllers];
    goto LABEL_12;
  }
  uint64_t v5 = [(VOTUIServer *)self screenCurtainViewControllers];

  if (v5)
  {
LABEL_12:
    int v22 = 0;
    goto LABEL_13;
  }
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  [(VOTUIServer *)self setScreenCurtainViewControllers:v6];

  _UIAccessibilityBlockPostingOfNotification();
  double v7 = objc_alloc_init(VOTUIScreenCurtainViewController);
  double v8 = [(VOTUIServer *)self screenCurtainViewControllers];
  [v8 setObject:v7 forKeyedSubscript:&off_40110];

  id v9 = +[AXUIDisplayManager sharedDisplayManager];
  double v10 = [(VOTUIServer *)self screenCurtainViewControllers];
  double v11 = [v10 objectForKeyedSubscript:&off_40110];
  [v9 addContentViewController:v11 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTScreenCurtainSceneClientIdentifier" context:0 userInterfaceStyle:0 forWindowScene:0 completion:0];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = self->_externalWindowScenes;
  id v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v30 = *(void *)v36;
    do
    {
      double v14 = 0;
      do
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v14);
        double v16 = objc_alloc_init(VOTUIScreenCurtainViewController);
        screenCurtainViewControllers = self->_screenCurtainViewControllers;
        double v18 = [v15 screen];
        double v19 = [v18 displayIdentity];
        double v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v19 displayID]);
        [(NSMutableDictionary *)screenCurtainViewControllers setObject:v16 forKeyedSubscript:v20];

        double v21 = +[AXUIDisplayManager sharedDisplayManager];
        [v21 addContentViewController:v16 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTScreenCurtainSceneClientIdentifier" context:0 userInterfaceStyle:0 forWindowScene:v15 completion:0];

        double v14 = (char *)v14 + 1;
      }
      while (v13 != v14);
      id v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v13);
  }

  int v22 = 1;
LABEL_13:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v23 = [(VOTUIServer *)self screenCurtainViewControllers];
  double v24 = [v23 allValues];

  id v25 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      double v28 = 0;
      do
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * (void)v28) setEnabled:v3 animate:1];
        double v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v26);
  }

  if (v22) {
    _UIAccessibilityUnblockPostingOfNotification();
  }
}

- (void)_handleFlashBrailleInsertedTextMessage:(id)a3
{
  id v4 = a3;
  id v6 = [(VOTUIServer *)self brailleViewController];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"brailleInsertedText"];

  [v6 flashInsertedText:v5];
}

- (void)_removeScreenCurtainControllers
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(VOTUIServer *)self screenCurtainViewControllers];
  id v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 setEnabled:0 animate:1];
        double v10 = +[AXUIDisplayManager sharedDisplayManager];
        [v10 removeContentViewController:v9 withUserInteractionEnabled:0 forService:self context:0 completion:0];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(VOTUIServer *)self setScreenCurtainViewControllers:0];
}

- (void)_removeCursorViewControllers
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(VOTUIServer *)self cursorViewControllers];
  id v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v11 + 1) + 8 * (void)v8);
        [v9 setCursorHidden:1];
        double v10 = +[AXUIDisplayManager sharedDisplayManager];
        [v10 removeContentViewController:v9 withUserInteractionEnabled:0 forService:self context:0 completion:0];

        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(VOTUIServer *)self setCursorViewControllers:0];
}

- (void)_removeElementVisualizationViewController
{
  BOOL v3 = [(VOTUIServer *)self elementVisualizationViewController];
  [v3 setFramesHidden:1];

  id v4 = +[AXUIDisplayManager sharedDisplayManager];
  id v5 = [(VOTUIServer *)self elementVisualizationViewController];
  [v4 removeContentViewController:v5 withUserInteractionEnabled:0 forService:self];

  [(VOTUIServer *)self setElementVisualizationViewController:0];
}

- (void)_removeItemChooserController
{
  BOOL v3 = [(VOTUIServer *)self itemChooserController];

  if (v3)
  {
    id v4 = +[AXUIDisplayManager sharedDisplayManager];
    id v5 = [(VOTUIServer *)self itemChooserController];
    [v4 removeContentViewController:v5 withUserInteractionEnabled:0 forService:self];

    id v6 = [(VOTUIServer *)self itemChooserController];
    [v6 setDelegate:0];

    [(VOTUIServer *)self setItemChooserController:0];
  }
}

- (void)_removeRotorViewControllers
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(VOTUIServer *)self rotorViewControllers];
  id v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        double v10 = +[AXUIDisplayManager sharedDisplayManager];
        [v10 removeContentViewController:v9 withUserInteractionEnabled:0 forService:self context:0 completion:0];

        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_removeSonificationViewController
{
  BOOL v3 = [(VOTUIServer *)self sonificationViewController];

  if (v3)
  {
    id v4 = +[AXUIDisplayManager sharedDisplayManager];
    id v5 = [(VOTUIServer *)self sonificationViewController];
    [v4 removeContentViewController:v5 withUserInteractionEnabled:0 forService:self];

    [(VOTUIServer *)self setSonificationViewController:0];
  }
}

- (void)_addMapsExplorationViewController
{
  BOOL v3 = [(VOTUIServer *)self mapsExplorationViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init(VOTUIMapsExplorationViewController);
    [(VOTUIServer *)self setMapsExplorationViewController:v4];

    id v6 = +[AXUIDisplayManager sharedDisplayManager];
    id v5 = [(VOTUIServer *)self mapsExplorationViewController];
    [v6 addContentViewController:v5 withUserInteractionEnabled:0 forService:self];
  }
}

- (void)_addBrailleViewControllerWithOrientation:(int64_t)a3 dotNumberPositions:(id)a4 typingMode:(int64_t)a5
{
  id v8 = a4;
  uint64_t v9 = [(VOTUIServer *)self brailleViewController];

  if (v9)
  {
    id v11 = [(VOTUIServer *)self brailleViewController];
    [v11 setOrientation:a3 dotNumberPositions:v8 typingMode:a5];
  }
  else
  {
    double v10 = [[VOTUIBrailleViewController alloc] initWithOrientation:a3 dotNumberPositions:v8 typingMode:a5];

    [(VOTUIServer *)self setBrailleViewController:v10];
    id v11 = +[AXUIDisplayManager sharedDisplayManager];
    id v8 = [(VOTUIServer *)self brailleViewController];
    [v11 addContentViewController:v8 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXZoomSceneClientIdentifier"];
  }
}

- (void)_removeBrailleViewController
{
  BOOL v3 = +[AXUIDisplayManager sharedDisplayManager];
  id v4 = [(VOTUIServer *)self brailleViewController];
  [v3 removeContentViewController:v4 withUserInteractionEnabled:0 forService:self];

  [(VOTUIServer *)self setBrailleViewController:0];
}

- (void)_removeMapsExplorationViewController
{
  BOOL v3 = +[AXUIDisplayManager sharedDisplayManager];
  id v4 = [(VOTUIServer *)self mapsExplorationViewController];
  [v3 removeContentViewController:v4 withUserInteractionEnabled:0 forService:self];

  [(VOTUIServer *)self setMapsExplorationViewController:0];
}

- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9F94;
  block[3] = &unk_3D2B0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4
{
  id v5 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = [(VOTUIServer *)self cursorViewControllers];
  uint64_t v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v37;
    while (2)
    {
      id v11 = 0;
      do
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        if (*(id *)(*((void *)&v36 + 1) + 8 * (void)v11) == v5)
        {

          goto LABEL_29;
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v12 = [(VOTUIServer *)self screenCurtainViewControllers];
  long long v13 = [v12 allValues];

  id v14 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v33;
    while (2)
    {
      id v17 = 0;
      do
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        if (*(id *)(*((void *)&v32 + 1) + 8 * (void)v17) == v5)
        {

          double v26 = 10000020.0;
          goto LABEL_31;
        }
        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v18 = [(VOTUIServer *)self itemChooserController];

  if (v18 == v5)
  {
    double v26 = UIHUDWindowLevel;
  }
  else
  {
    id v19 = [(VOTUIServer *)self brailleViewController];

    if (v19 == v5)
    {
      double v26 = 10000017.0;
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      double v20 = [(VOTUIServer *)self captionPanelViewControllers];
      double v21 = [v20 allValues];

      id v22 = [v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v29;
        while (2)
        {
          id v25 = 0;
          do
          {
            if (*(void *)v29 != v24) {
              objc_enumerationMutation(v21);
            }
            if (*(id *)(*((void *)&v28 + 1) + 8 * (void)v25) == v5)
            {

              double v26 = 10000014.0;
              goto LABEL_31;
            }
            id v25 = (char *)v25 + 1;
          }
          while (v23 != v25);
          id v23 = [v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

LABEL_29:
      double v26 = 10000013.0;
    }
  }
LABEL_31:

  return v26;
}

- (void)externalDisplaySceneConnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  id v29 = a3;
  id v5 = [(VOTUIServer *)self cursorViewControllers];
  id v6 = [v29 screen];
  uint64_t v7 = [v6 displayIdentity];
  id v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v7 displayID]);
  id v9 = [v5 objectForKeyedSubscript:v8];

  if (!v9)
  {
    uint64_t v10 = [(VOTUIServer *)self externalWindowScenes];
    [v10 addObject:v29];

    id v11 = [[VOTUICursorViewController alloc] initWithAXUIService:self];
    long long v12 = [(VOTUIServer *)self cursorViewControllers];
    long long v13 = [v29 screen];
    id v14 = [v13 displayIdentity];
    id v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 displayID]);
    [v12 setObject:v11 forKeyedSubscript:v15];

    uint64_t v16 = +[AXUIDisplayManager sharedDisplayManager];
    [v16 addContentViewController:v11 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle:0 forWindowScene:v29 completion:0];

    id v17 = objc_alloc_init(VOTUICaptionPanelViewController);
    id v18 = [(VOTUIServer *)self captionPanelViewControllers];
    id v19 = [v29 screen];
    double v20 = [v19 displayIdentity];
    double v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v20 displayID]);
    [v18 setObject:v17 forKeyedSubscript:v21];

    id v22 = +[AXUIDisplayManager sharedDisplayManager];
    [v22 addContentViewController:v17 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle:0 forWindowScene:v29 completion:0];

    id v23 = objc_alloc_init(VOTUIRotorViewController);
    uint64_t v24 = [(VOTUIServer *)self rotorViewControllers];
    id v25 = [v29 screen];
    double v26 = [v25 displayIdentity];
    uint64_t v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v26 displayID]);
    [v24 setObject:v23 forKeyedSubscript:v27];

    long long v28 = +[AXUIDisplayManager sharedDisplayManager];
    [v28 addContentViewController:v23 withUserInteractionEnabled:0 forService:self forSceneClientIdentifier:@"kAXVOTMainSceneClientIdentifier" context:0 userInterfaceStyle:0 forWindowScene:v29 completion:0];
  }
}

- (void)externalDisplaySceneDisconnected:(id)a3 forSceneClientIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VOTUIServer *)self externalWindowScenes];
  [v6 removeObject:v5];

  uint64_t v7 = [(VOTUIServer *)self cursorViewControllers];
  id v8 = [v5 screen];
  id v9 = [v8 displayIdentity];
  uint64_t v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 displayID]);
  [v7 removeObjectForKey:v10];

  id v14 = [(VOTUIServer *)self captionPanelViewControllers];
  id v11 = [v5 screen];

  long long v12 = [v11 displayIdentity];
  long long v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 displayID]);
  [v14 removeObjectForKey:v13];
}

- (BOOL)shouldPreventAutorotatingAllContentViewControllers
{
  v2 = [(VOTUIServer *)self brailleViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSMutableDictionary)cursorViewControllers
{
  return self->_cursorViewControllers;
}

- (void)setCursorViewControllers:(id)a3
{
}

- (VOTUIElementVisualizationViewController)elementVisualizationViewController
{
  return self->_elementVisualizationViewController;
}

- (void)setElementVisualizationViewController:(id)a3
{
}

- (NSMutableDictionary)screenCurtainViewControllers
{
  return self->_screenCurtainViewControllers;
}

- (void)setScreenCurtainViewControllers:(id)a3
{
}

- (VOTUIBrailleViewController)brailleViewController
{
  return self->_brailleViewController;
}

- (void)setBrailleViewController:(id)a3
{
}

- (VOTUIMapsExplorationViewController)mapsExplorationViewController
{
  return self->_mapsExplorationViewController;
}

- (void)setMapsExplorationViewController:(id)a3
{
}

- (NSMutableDictionary)captionPanelViewControllers
{
  return self->_captionPanelViewControllers;
}

- (void)setCaptionPanelViewControllers:(id)a3
{
}

- (NSMutableDictionary)rotorViewControllers
{
  return self->_rotorViewControllers;
}

- (void)setRotorViewControllers:(id)a3
{
}

- (VOTUISonificationViewController)sonificationViewController
{
  return self->_sonificationViewController;
}

- (void)setSonificationViewController:(id)a3
{
}

- (Legacy_VOTUIItemChooserController)itemChooserController
{
  return self->_itemChooserController;
}

- (void)setItemChooserController:(id)a3
{
}

- (NSString)voiceOverWarningIdentifier
{
  return self->_voiceOverWarningIdentifier;
}

- (void)setVoiceOverWarningIdentifier:(id)a3
{
}

- (VOTUISystemPointerController)systemPointerController
{
  return self->_systemPointerController;
}

- (void)setSystemPointerController:(id)a3
{
}

- (NSMutableDictionary)systemPointerRegistrants
{
  return self->_systemPointerRegistrants;
}

- (void)setSystemPointerRegistrants:(id)a3
{
}

- (NSMutableArray)externalWindowScenes
{
  return self->_externalWindowScenes;
}

- (void)setExternalWindowScenes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalWindowScenes, 0);
  objc_storeStrong((id *)&self->_systemPointerRegistrants, 0);
  objc_storeStrong((id *)&self->_systemPointerController, 0);
  objc_storeStrong((id *)&self->_voiceOverWarningIdentifier, 0);
  objc_storeStrong((id *)&self->_itemChooserController, 0);
  objc_storeStrong((id *)&self->_sonificationViewController, 0);
  objc_storeStrong((id *)&self->_rotorViewControllers, 0);
  objc_storeStrong((id *)&self->_captionPanelViewControllers, 0);
  objc_storeStrong((id *)&self->_mapsExplorationViewController, 0);
  objc_storeStrong((id *)&self->_brailleViewController, 0);
  objc_storeStrong((id *)&self->_screenCurtainViewControllers, 0);
  objc_storeStrong((id *)&self->_elementVisualizationViewController, 0);

  objc_storeStrong((id *)&self->_cursorViewControllers, 0);
}

@end