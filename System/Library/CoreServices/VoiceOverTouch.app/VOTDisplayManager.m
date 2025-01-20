@interface VOTDisplayManager
+ (id)displayManager;
- (AXUIClient)uiClient;
- (BOOL)_isSystemReadyForUI;
- (BOOL)didRegisterForPointerEvents;
- (BOOL)needToShowVOWarningBanner;
- (BOOL)shouldHideCursor;
- (BOOL)uiServerIsReady;
- (CGPath)currentCursorPath;
- (CGRect)_adjustFrameToFitScreen:(CGRect)a3;
- (CGRect)currentCursorFrame;
- (CGRect)currentSonificationPlaybackBounds;
- (NSPointerArray)pointerEventObservers;
- (NSString)clientIdentifier;
- (NSString)serviceBundleName;
- (VOTDisplayManager)init;
- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6;
- (unsigned)currentCursorContextID;
- (unsigned)currentCursorDisplayID;
- (void)_handleDidReceivePointerGlobalPoint:(CGPoint)a3;
- (void)_handleRotorDidChange:(id)a3;
- (void)_setCursorFrameForElement:(id)a3 animated:(BOOL)a4;
- (void)_updateZoom:(CGRect)a3 element:(id)a4;
- (void)beginSonificationPlaybackFromPosition:(double)a3 withDuration:(double)a4;
- (void)clearCursorFrame;
- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3;
- (void)convertFrameToCursorSpace:(CGRect)a3 displayID:(id)a4 completion:(id)a5;
- (void)convertFramesToCursorSpace:(id)a3 displayID:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)flashBrailleInsertedText:(id)a3;
- (void)hideBrailleUI;
- (void)hideMapsExplorationUI;
- (void)hideSonificationPlayhead;
- (void)highlightBrailleDots:(id)a3;
- (void)highlightMapsExplorationSegmentWithIndex:(int64_t)a3;
- (void)movePointerToPoint:(CGPoint)a3 contextId:(unsigned int)a4;
- (void)pauseSonificationPlaybackAtPosition:(double)a3;
- (void)registerForPointerEvents:(id)a3;
- (void)setCurrentCursorContextID:(unsigned int)a3;
- (void)setCurrentCursorDisplayID:(unsigned int)a3;
- (void)setCurrentCursorFrame:(CGRect)a3;
- (void)setCurrentCursorPath:(CGPath *)a3;
- (void)setCurrentSonificationPlaybackBounds:(CGRect)a3;
- (void)setCursorFrame:(CGRect)a3;
- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 withDisplayId:(unsigned int)a6 element:(id)a7 forceRefresh:(BOOL)a8;
- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 withDisplayId:(unsigned int)a6 element:(id)a7 forceRefresh:(BOOL)a8 animated:(BOOL)a9;
- (void)setCursorFrameForElement:(id)a3;
- (void)setCursorFrameForElement:(id)a3 animated:(BOOL)a4;
- (void)setDidRegisterForPointerEvents:(BOOL)a3;
- (void)setElementFrames:(id)a3;
- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5;
- (void)setNeedToShowVOWarningBanner:(BOOL)a3;
- (void)setPointerEventObservers:(id)a3;
- (void)setScreenCurtainEnabled:(BOOL)a3;
- (void)setShouldHideCursor:(BOOL)a3;
- (void)setSonificationPlayheadPosition:(double)a3;
- (void)setUiClient:(id)a3;
- (void)setUiServerIsReady:(BOOL)a3;
- (void)setVoiceOverCaptionText:(id)a3 withRange:(_NSRange)a4 language:(id)a5 voice:(id)a6;
- (void)showBrailleUIWithOrientation:(int64_t)a3 dotPositions:(id)a4 typingMode:(int64_t)a5;
- (void)showMapsExplorationUIWithCenter:(CGPoint)a3 andData:(id)a4;
- (void)showSonificationPlayheadInPlaybackBounds:(CGRect)a3 atPosition:(double)a4;
- (void)shutdown;
- (void)updateBrailleUIWithOrientation:(int64_t)a3 dotPositions:(id)a4 typingMode:(int64_t)a5;
- (void)updateMapsExplorationUIWithCurrentCenter:(CGPoint)a3;
- (void)updateMapsExplorationUIWithCurrentLocation:(CGPoint)a3;
- (void)updateVisualRotor:(id)a3;
- (void)userInterfaceClient:(id)a3 willActivateUserInterfaceServiceWithInitializationMessage:(id)a4;
@end

@implementation VOTDisplayManager

- (void)setShouldHideCursor:(BOOL)a3
{
  if (self->_shouldHideCursor != a3)
  {
    self->_shouldHideCursor = a3;
    [(VOTDisplayManager *)self currentCursorFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(VOTDisplayManager *)self currentCursorPath];
    uint64_t v13 = [(VOTDisplayManager *)self currentCursorContextID];
    uint64_t v14 = [(VOTDisplayManager *)self currentCursorDisplayID];
    -[VOTDisplayManager setCursorFrame:withPath:withContextId:withDisplayId:element:forceRefresh:](self, "setCursorFrame:withPath:withContextId:withDisplayId:element:forceRefresh:", v12, v13, v14, 0, 1, v5, v7, v9, v11);
  }
}

+ (id)displayManager
{
  if ((id)objc_opt_class() == a1
    && (AXInPreboardScenario() & 1) == 0
    && (AXInCheckerBoardScenario() & 1) == 0
    && (AXDeviceIsAudioAccessory() & 1) == 0
    && qword_1001EB8D0 != -1)
  {
    dispatch_once(&qword_1001EB8D0, &stru_1001B4018);
  }
  v2 = (void *)qword_1001EB8D8;

  return v2;
}

- (VOTDisplayManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)VOTDisplayManager;
  v2 = [(VOTDisplayManager *)&v13 init];
  if (v2)
  {
    v3 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
    lock = v2->_lock;
    v2->_lock = v3;

    id v5 = objc_alloc((Class)AXUIClient);
    double v6 = [(VOTDisplayManager *)v2 clientIdentifier];
    double v7 = [(VOTDisplayManager *)v2 serviceBundleName];
    id v8 = [v5 initWithIdentifier:v6 serviceBundleName:v7];

    [(VOTDisplayManager *)v2 setUiClient:v8];
    [v8 setDelegate:v2];
    double v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_handleRotorDidChange:" name:@"VOTRotorChangedNotification" object:0];

    dispatch_queue_t v10 = dispatch_queue_create("display-queue", 0);
    displayQueue = v2->_displayQueue;
    v2->_displayQueue = (OS_dispatch_queue *)v10;

    [(VOTDisplayManager *)v2 setUiServerIsReady:0];
    [(VOTDisplayManager *)v2 setNeedToShowVOWarningBanner:0];
  }
  return v2;
}

- (NSString)clientIdentifier
{
  return (NSString *)@"VOTAXUIClientIdentifier";
}

- (NSString)serviceBundleName
{
  return (NSString *)@"VoiceOver";
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"VOTRotorChangedNotification" object:0];

  currentCursorPath = self->_currentCursorPath;
  if (currentCursorPath)
  {
    CFRelease(currentCursorPath);
    self->_currentCursorPath = 0;
  }
  displayQueue = self->_displayQueue;
  self->_displayQueue = 0;

  double v6 = [(VOTDisplayManager *)self uiClient];
  [v6 setDelegate:0];

  v7.receiver = self;
  v7.super_class = (Class)VOTDisplayManager;
  [(VOTDisplayManager *)&v7 dealloc];
}

- (void)shutdown
{
  self->_displayShutdown = 1;
}

- (void)clearCursorFrame
{
}

- (void)setCursorFrameForElement:(id)a3
{
}

- (void)setCursorFrameForElement:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  displayQueue = self->_displayQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003EDA8;
  block[3] = &unk_1001B4040;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(displayQueue, block);
}

- (void)_setCursorFrameForElement:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!self->_displayShutdown)
  {
    id v30 = v6;
    if (v6)
    {
      [v6 updateFrame];
      if ([v30 path])
      {
        [v30 updatePaths];
        id v7 = [v30 path];
      }
      else
      {
        id v7 = 0;
      }
      [v30 frame];
      double x = v12;
      double y = v13;
      double width = v14;
      double height = v15;
      if (AXDeviceHasJindo())
      {
        v16 = [v30 uiElement];
        unsigned int v17 = [v16 BOOLWithAXAttribute:2229];

        if (v17)
        {
          if (y < 36.6666667)
          {
            double v18 = 36.6666667 - y + 2.5;
            double x = x + 0.0;
            double y = y + v18;
            double height = height - v18;
          }
        }
      }
      id v6 = v30;
    }
    else
    {
      id v7 = 0;
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
    }
    id v19 = [v6 windowContextId];
    v20 = [v30 uiElement];
    v21 = [v20 numberWithAXAttribute:2123];
    id v22 = [v21 unsignedIntValue];

    if (v19)
    {
      v23 = +[VOTElement systemWideElement];
      v24 = v23;
      if (v22 > 1) {
        objc_msgSend(v23, "convertFrame:fromContextId:fromDisplayId:", v19, v22, x, y, width, height);
      }
      else {
        objc_msgSend(v23, "convertRect:fromContextId:", v19, x, y, width, height);
      }
      double x = v25;
      double y = v26;
      double width = v27;
      double height = v28;

      if (v7)
      {
        v29 = +[VOTElement systemWideElement];
        id v7 = [v29 convertPath:v7 fromContextId:v19 fromDisplayId:v22];
      }
    }
    -[VOTDisplayManager setCursorFrame:withPath:withContextId:withDisplayId:element:forceRefresh:animated:](self, "setCursorFrame:withPath:withContextId:withDisplayId:element:forceRefresh:animated:", v7, v19, v22, v30, 0, v4, x, y, width, height);
    id v6 = v30;
  }
}

- (void)setCursorFrame:(CGRect)a3
{
}

- (void)_updateZoom:(CGRect)a3 element:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (_AXSZoomTouchEnabled())
  {
    if ([v9 doesHaveTraits:kAXKeyboardKeyTrait]) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    if ([v9 doesHaveAllTraits:kAXTextEntryTrait | kAXIsEditingTrait])
    {
      [v9 textCursorFrame];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      id v19 = +[ZoomServices sharedInstance];
      objc_msgSend(v19, "notifyZoomFocusDidChangeWithType:rect:contextId:displayId:", v10, objc_msgSend(v9, "windowContextId"), objc_msgSend(v9, "displayId"), v12, v14, v16, v18);
LABEL_15:

      goto LABEL_16;
    }
    if (AXDeviceIsPhoneIdiom())
    {
      if (width <= 250.0 || [v9 doesHaveTraits:kAXButtonTrait])
      {
        if (width <= 100.0 && height <= 100.0) {
          goto LABEL_14;
        }
        AX_CGRectGetCenter();
        double x = v20 + -2.5;
        double y = v21 + -2.5;
      }
      double width = 5.0;
      double height = 5.0;
    }
LABEL_14:
    id v22 = [v9 uiElement];
    v23 = [v22 numberWithAXAttribute:2123];
    id v24 = [v23 unsignedIntValue];

    id v19 = [(VOTDisplayManager *)self uiClient];
    v30[0] = @"FocusChangeFrameKey";
    v32.origin.double x = x;
    v32.origin.double y = y;
    v32.size.double width = width;
    v32.size.double height = height;
    double v25 = NSStringFromRect(v32);
    v31[0] = v25;
    v30[1] = @"FocusChangeTypeKey";
    double v26 = +[NSNumber numberWithInteger:v10];
    v31[1] = v26;
    v30[2] = @"display";
    double v27 = +[NSNumber numberWithUnsignedInt:v24];
    v31[2] = v27;
    double v28 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
    v29 = +[AXAccessQueue mainAccessQueue];
    [v19 sendAsynchronousMessage:v28 withIdentifier:20 targetAccessQueue:v29 completion:0];

    goto LABEL_15;
  }
LABEL_16:
}

- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 withDisplayId:(unsigned int)a6 element:(id)a7 forceRefresh:(BOOL)a8
{
}

- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 withDisplayId:(unsigned int)a6 element:(id)a7 forceRefresh:(BOOL)a8 animated:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a7;
  v39.origin.double x = CGRectZero.origin.x;
  v39.origin.double y = CGRectZero.origin.y;
  v39.size.double width = CGRectZero.size.width;
  v39.size.double height = CGRectZero.size.height;
  v42.origin.double x = x;
  v42.origin.double y = y;
  v42.size.double width = width;
  v42.size.double height = height;
  BOOL v20 = CGRectEqualToRect(v39, v42);
  if (v11 == 1 && !v20)
  {
    -[VOTDisplayManager _adjustFrameToFitScreen:](self, "_adjustFrameToFitScreen:", x, y, width, height);
    double x = v21;
    double y = v22;
    double width = v23;
    double height = v24;
  }
  [(NSLock *)self->_lock lock];
  if (v10) {
    goto LABEL_8;
  }
  [(VOTDisplayManager *)self currentCursorFrame];
  v43.origin.double x = v25;
  v43.origin.double y = v26;
  v43.size.double width = v27;
  v43.size.double height = v28;
  v40.origin.double x = x;
  v40.origin.double y = y;
  v40.size.double width = width;
  v40.size.double height = height;
  BOOL v29 = CGRectEqualToRect(v40, v43);
  if (a4 || !v29 || [(VOTDisplayManager *)self currentCursorPath])
  {
LABEL_8:
    -[VOTDisplayManager setCurrentCursorFrame:](self, "setCurrentCursorFrame:", x, y, width, height);
    [(VOTDisplayManager *)self setCurrentCursorContextID:v12];
    [(VOTDisplayManager *)self setCurrentCursorDisplayID:v11];
    [(VOTDisplayManager *)self setCurrentCursorPath:a4];
    [(NSLock *)self->_lock unlock];
    if ([(VOTDisplayManager *)self shouldHideCursor])
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10003F5DC;
      v38[3] = &unk_1001B33B8;
      v38[4] = self;
      id v30 = objc_retainBlock(v38);
      ((void (*)(void))v30[2])();
    }
    else
    {
      v31 = +[NSMutableDictionary dictionary];
      NSRect v32 = +[NSNumber numberWithBool:v9];
      [v31 setObject:v32 forKeyedSubscript:@"animate"];

      v41.origin.double x = x;
      v41.origin.double y = y;
      v41.size.double width = width;
      v41.size.double height = height;
      v33 = NSStringFromRect(v41);
      [v31 setObject:v33 forKeyedSubscript:@"frame"];

      if (a4)
      {
        uint64_t v34 = AX_CGPathCopyDataRepresentation();
        if (v34)
        {
          v35 = (const void *)v34;
          [v31 setObject:v34 forKeyedSubscript:@"path"];
          CFRelease(v35);
        }
      }
      v36 = +[NSNumber numberWithUnsignedInt:v11];
      [v31 setObject:v36 forKeyedSubscript:@"display"];

      v37 = [(VOTDisplayManager *)self uiClient];
      [v37 sendAsynchronousMessage:v31 withIdentifier:1 targetAccessQueue:0 completion:0];
    }
    -[VOTDisplayManager _updateZoom:element:](self, "_updateZoom:element:", v19, x, y, width, height);
  }
  else
  {
    [(NSLock *)self->_lock unlock];
  }
}

- (CGRect)_adjustFrameToFitScreen:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v5 = a3.origin.x + a3.size.width;
  double v6 = a3.origin.y + a3.size.height;
  double v7 = fabs(a3.origin.x) + 1.0;
  if (x > 0.0) {
    double v7 = 0.0;
  }
  double v8 = a3.size.width - v7;
  double v9 = fabs(a3.origin.y) + 1.0;
  if (a3.origin.y > 0.0) {
    double v9 = 0.0;
  }
  double v10 = a3.size.height - v9;
  if (sub_100052614())
  {
    if (v5 >= *((double *)&xmmword_1001EBE30 + 1)) {
      double v11 = v8 + -1.0;
    }
    else {
      double v11 = v8;
    }
    if (v6 >= *(double *)&xmmword_1001EBE30) {
      double v12 = v10 + -1.0;
    }
    else {
      double v12 = v10;
    }
  }
  else
  {
    if (v5 <= *(double *)&xmmword_1001EBE30) {
      double v11 = v8 + -1.0;
    }
    else {
      double v11 = v8;
    }
    if (v6 <= *((double *)&xmmword_1001EBE30 + 1)) {
      double v12 = v10 + -1.0;
    }
    else {
      double v12 = v10;
    }
  }
  double v13 = 1.0;
  if (y <= 0.0) {
    double v14 = 1.0;
  }
  else {
    double v14 = y;
  }
  if (x > 0.0) {
    double v13 = x;
  }
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)setElementFrames:(id)a3
{
  id v8 = a3;
  BOOL v4 = +[NSMutableArray array];
  double v5 = +[NSMutableArray array];
  if ([v8 count])
  {
    unint64_t v6 = 0;
    do
    {
      double v7 = +[NSString stringWithFormat:@"%ld", v6];
      [v4 addObject:v7];

      [v5 addObject:&stru_1001B7888];
      ++v6;
    }
    while ((unint64_t)[v8 count] > v6);
  }
  [(VOTDisplayManager *)self setElementFrames:v8 labels:v4 uiClasses:v5];
}

- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [(VOTDisplayManager *)self uiClient];
  v13[0] = @"elementVisualizationFrames";
  v13[1] = @"elementVisualizationFrameLabels";
  v14[0] = v10;
  v14[1] = v9;
  v13[2] = @"elementVisualizationUIClasses";
  v14[2] = v8;
  double v12 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  [v11 sendAsynchronousMessage:v12 withIdentifier:10 targetAccessQueue:0 completion:0];
}

- (void)convertFrameToCursorSpace:(CGRect)a3 displayID:(id)a4 completion:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a5;
  id v12 = a4;
  double v13 = [(VOTDisplayManager *)self uiClient];
  v19[0] = @"frame";
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v14 = NSStringFromRect(v21);
  v19[1] = @"display";
  v20[0] = v14;
  v20[1] = v12;
  double v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003FB14;
  v17[3] = &unk_1001B4068;
  id v18 = v11;
  id v16 = v11;
  [v13 sendAsynchronousMessage:v15 withIdentifier:13 targetAccessQueue:0 completion:v17];
}

- (void)convertFramesToCursorSpace:(id)a3 displayID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VOTDisplayManager *)self uiClient];
  v16[0] = @"frames";
  v16[1] = @"display";
  v17[0] = v10;
  v17[1] = v9;
  id v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003FD10;
  void v14[3] = &unk_1001B4068;
  id v15 = v8;
  id v13 = v8;
  [v11 sendAsynchronousMessage:v12 withIdentifier:14 targetAccessQueue:0 completion:v14];
}

- (void)_handleRotorDidChange:(id)a3
{
  BOOL v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:@"kVOTRotorChangedNotificationNewRotor"];
  unsigned int v6 = [v5 intValue];

  [(VOTDisplayManager *)self setShouldHideCursor:v6 == 61];
}

- (void)updateVisualRotor:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTDisplayManager *)self uiClient];
  [v5 sendAsynchronousMessage:v4 withIdentifier:11 targetAccessQueue:0 completion:0];
}

- (void)showBrailleUIWithOrientation:(int64_t)a3 dotPositions:(id)a4 typingMode:(int64_t)a5
{
  id v8 = a4;
  id v9 = +[ZoomServices sharedInstance];
  [v9 notifyZoomWillShowBrailleInputUI];

  id v10 = [(VOTDisplayManager *)self uiClient];
  v15[0] = @"brailleOrientation";
  id v11 = +[NSNumber numberWithLong:a3];
  v16[0] = v11;
  v15[1] = @"brailleDotPositions";
  id v12 = sub_10003FFF4(v8);

  v16[1] = v12;
  v15[2] = @"brailleTypingMode";
  id v13 = +[NSNumber numberWithInteger:a5];
  void v16[2] = v13;
  double v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v10 sendAsynchronousMessage:v14 withIdentifier:2 targetAccessQueue:0 completion:0];
}

- (void)hideBrailleUI
{
  v3 = +[ZoomServices sharedInstance];
  [v3 notifyZoomWillHideBrailleInputUI];

  id v4 = [(VOTDisplayManager *)self uiClient];
  [v4 sendAsynchronousMessage:0 withIdentifier:3 targetAccessQueue:0 completion:0];
}

- (void)updateBrailleUIWithOrientation:(int64_t)a3 dotPositions:(id)a4 typingMode:(int64_t)a5
{
  id v8 = a4;
  id v9 = [(VOTDisplayManager *)self uiClient];
  v14[0] = @"brailleOrientation";
  id v10 = +[NSNumber numberWithLong:a3];
  v15[0] = v10;
  v14[1] = @"brailleDotPositions";
  id v11 = sub_10003FFF4(v8);

  v15[1] = v11;
  v14[2] = @"brailleTypingMode";
  id v12 = +[NSNumber numberWithInteger:a5];
  v15[2] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  [v9 sendAsynchronousMessage:v13 withIdentifier:5 targetAccessQueue:0 completion:0];
}

- (void)setScreenCurtainEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VOTDisplayManager *)self _isSystemReadyForUI])
  {
    id v5 = [(VOTDisplayManager *)self uiClient];
    CFStringRef v8 = @"enabled";
    unsigned int v6 = +[NSNumber numberWithBool:v3];
    id v9 = v6;
    double v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [v5 sendAsynchronousMessage:v7 withIdentifier:7 targetAccessQueue:0 completion:0];
  }
}

- (void)flashBrailleInsertedText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(VOTDisplayManager *)self uiClient];
    CFStringRef v7 = @"brailleInsertedText";
    id v8 = v4;
    unsigned int v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    [v5 sendAsynchronousMessage:v6 withIdentifier:6 targetAccessQueue:0 completion:0];
  }
}

- (void)highlightBrailleDots:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTDisplayManager *)self uiClient];
  CFStringRef v7 = @"brailleDotNumbers";
  id v8 = v4;
  unsigned int v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  [v5 sendAsynchronousMessage:v6 withIdentifier:4 targetAccessQueue:0 completion:0];
}

- (void)showMapsExplorationUIWithCenter:(CGPoint)a3 andData:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(VOTDisplayManager *)self uiClient];
  v14[0] = @"mapsExplorationCenter";
  id v9 = +[NSNumber numberWithDouble:x];
  v13[0] = v9;
  id v10 = +[NSNumber numberWithDouble:y];
  v13[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v13 count:2];
  v14[1] = @"mapsExplorationData";
  v15[0] = v11;
  v15[1] = v7;
  id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  [v8 sendAsynchronousMessage:v12 withIdentifier:15 targetAccessQueue:0 completion:0];
}

- (void)hideMapsExplorationUI
{
  id v2 = [(VOTDisplayManager *)self uiClient];
  [v2 sendAsynchronousMessage:0 withIdentifier:19 targetAccessQueue:0 completion:0];
}

- (void)updateMapsExplorationUIWithCurrentCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(VOTDisplayManager *)self uiClient];
  CFStringRef v11 = @"mapsExplorationCenter";
  unsigned int v6 = +[NSNumber numberWithDouble:x];
  v10[0] = v6;
  id v7 = +[NSNumber numberWithDouble:y];
  v10[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v10 count:2];
  id v12 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v5 sendAsynchronousMessage:v9 withIdentifier:17 targetAccessQueue:0 completion:0];
}

- (void)updateMapsExplorationUIWithCurrentLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(VOTDisplayManager *)self uiClient];
  CFStringRef v11 = @"mapsExplorationCurrentLocation";
  unsigned int v6 = +[NSNumber numberWithDouble:x];
  v10[0] = v6;
  id v7 = +[NSNumber numberWithDouble:y];
  v10[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v10 count:2];
  id v12 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v5 sendAsynchronousMessage:v9 withIdentifier:18 targetAccessQueue:0 completion:0];
}

- (void)highlightMapsExplorationSegmentWithIndex:(int64_t)a3
{
  id v4 = [(VOTDisplayManager *)self uiClient];
  CFStringRef v7 = @"mapsExplorationIndex";
  id v5 = +[NSNumber numberWithInteger:a3];
  id v8 = v5;
  unsigned int v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 sendAsynchronousMessage:v6 withIdentifier:16 targetAccessQueue:0 completion:0];
}

- (BOOL)_isSystemReadyForUI
{
  if (!self->_systemReadyForUI)
  {
    BOOL v3 = +[VOTSpringBoardConnection defaultConnection];
    if (![v3 isConnected] || (AXInPreboardScenario() & 1) != 0)
    {
LABEL_7:

      return self->_systemReadyForUI;
    }
    char v4 = AXInCheckerBoardScenario();

    if ((v4 & 1) == 0)
    {
      self->_systemReadyForUI = 1;
      BOOL v3 = VOTLogCommon();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned int v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "System ready for VoiceOver visuals", v6, 2u);
      }
      goto LABEL_7;
    }
  }
  return self->_systemReadyForUI;
}

- (void)setVoiceOverCaptionText:(id)a3 withRange:(_NSRange)a4 language:(id)a5 voice:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100040C24;
  v18[3] = &unk_1001B4090;
  id v19 = a3;
  BOOL v20 = self;
  NSUInteger v23 = location;
  NSUInteger v24 = length;
  id v21 = a5;
  id v22 = a6;
  id v11 = v22;
  id v12 = v21;
  id v13 = v19;
  double v14 = objc_retainBlock(v18);
  ((void (*)(void *, uint64_t, uint64_t, uint64_t))v14[2])(v14, v15, v16, v17);
}

- (void)showSonificationPlayheadInPlaybackBounds:(CGRect)a3 atPosition:(double)a4
{
  -[VOTDisplayManager setCurrentSonificationPlaybackBounds:](self, "setCurrentSonificationPlaybackBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  [(VOTDisplayManager *)self setSonificationPlayheadPosition:a4];
}

- (void)setSonificationPlayheadPosition:(double)a3
{
  v9[0] = @"sonificationPlaybackBounds";
  [(VOTDisplayManager *)self currentSonificationPlaybackBounds];
  id v5 = NSStringFromRect(v11);
  v9[1] = @"sonificationPlayheadProgress";
  v10[0] = v5;
  unsigned int v6 = +[NSNumber numberWithDouble:a3];
  v10[1] = v6;
  CFStringRef v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v8 = [(VOTDisplayManager *)self uiClient];
  [v8 sendAsynchronousMessage:v7 withIdentifier:21 targetAccessQueue:0 completion:0];
}

- (void)beginSonificationPlaybackFromPosition:(double)a3 withDuration:(double)a4
{
  if (a3 > 1.0) {
    a3 = 1.0;
  }
  if (a3 >= 0.0) {
    double v6 = a3;
  }
  else {
    double v6 = 0.0;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  v15[0] = @"sonificationPlayheadProgress";
  id v8 = +[NSNumber numberWithDouble:v6];
  v16[0] = v8;
  v15[1] = @"sonificationPlaybackBounds";
  [(VOTDisplayManager *)self currentSonificationPlaybackBounds];
  id v9 = NSStringFromRect(v17);
  v16[1] = v9;
  void v15[2] = @"sonificationNormalizedPlayheadPosition";
  id v10 = +[NSNumber numberWithDouble:v6];
  void v16[2] = v10;
  void v15[3] = @"sonificationDuration";
  NSRect v11 = +[NSNumber numberWithDouble:a4];
  void v16[3] = v11;
  v15[4] = @"sonificationPlaybackStartTime";
  id v12 = +[NSNumber numberWithDouble:Current];
  v16[4] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];

  double v14 = [(VOTDisplayManager *)self uiClient];
  [v14 sendAsynchronousMessage:v13 withIdentifier:22 targetAccessQueue:0 completion:0];
}

- (void)pauseSonificationPlaybackAtPosition:(double)a3
{
  v9[0] = @"sonificationPlaybackBounds";
  [(VOTDisplayManager *)self currentSonificationPlaybackBounds];
  id v5 = NSStringFromRect(v11);
  v9[1] = @"sonificationPlayheadProgress";
  v10[0] = v5;
  double v6 = +[NSNumber numberWithDouble:a3];
  v10[1] = v6;
  CFStringRef v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v8 = [(VOTDisplayManager *)self uiClient];
  [v8 sendAsynchronousMessage:v7 withIdentifier:23 targetAccessQueue:0 completion:0];
}

- (void)hideSonificationPlayhead
{
  v6[0] = @"sonificationPlaybackBounds";
  [(VOTDisplayManager *)self currentSonificationPlaybackBounds];
  BOOL v3 = NSStringFromRect(v8);
  v6[1] = @"sonificationPlayheadProgress";
  v7[0] = v3;
  v7[1] = &off_1001C50E0;
  char v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  id v5 = [(VOTDisplayManager *)self uiClient];
  [v5 sendAsynchronousMessage:v4 withIdentifier:21 targetAccessQueue:0 completion:0];
}

- (void)movePointerToPoint:(CGPoint)a3 contextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  NSRect v8 = +[AXSettings sharedInstance];
  unsigned int v9 = [v8 laserEnabled];

  if (v9)
  {
    id v10 = [(VOTDisplayManager *)self uiClient];
    v14[0] = @"point";
    v16.CGFloat x = x;
    v16.CGFloat y = y;
    NSRect v11 = NSStringFromCGPoint(v16);
    v14[1] = @"contextId";
    v15[0] = v11;
    id v12 = +[NSNumber numberWithUnsignedInt:v4];
    v15[1] = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v10 sendAsynchronousMessage:v13 withIdentifier:26 targetAccessQueue:0 completion:0];
  }
}

- (void)registerForPointerEvents:(id)a3
{
  id v10 = a3;
  uint64_t v4 = +[AXSettings sharedInstance];
  unsigned int v5 = [v4 laserEnabled];

  if (v5)
  {
    if (![(VOTDisplayManager *)self didRegisterForPointerEvents])
    {
      [(VOTDisplayManager *)self setDidRegisterForPointerEvents:1];
      double v6 = [(VOTDisplayManager *)self uiClient];
      [v6 sendAsynchronousMessage:&off_1001C70A0 withIdentifier:25 targetAccessQueue:0 completion:0];
    }
    CFStringRef v7 = [(VOTDisplayManager *)self pointerEventObservers];

    if (!v7)
    {
      NSRect v8 = +[NSPointerArray weakObjectsPointerArray];
      [(VOTDisplayManager *)self setPointerEventObservers:v8];
    }
    unsigned int v9 = [(VOTDisplayManager *)self pointerEventObservers];
    [v9 addPointer:v10];
  }
}

- (void)_handleDidReceivePointerGlobalPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v5 = [(VOTDisplayManager *)self pointerEventObservers];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      unsigned int v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "pointerDidMoveToGlobalPoint:", x, y);
        unsigned int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)userInterfaceClient:(id)a3 willActivateUserInterfaceServiceWithInitializationMessage:(id)a4
{
}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6
{
  if (a5 == 1001)
  {
    id v7 = [a4 objectForKeyedSubscript:@"point"];
    CGPoint v8 = CGPointFromString(v7);

    -[VOTDisplayManager _handleDidReceivePointerGlobalPoint:](self, "_handleDidReceivePointerGlobalPoint:", v8.x, v8.y);
  }
  return 0;
}

- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3
{
}

- (CGRect)currentCursorFrame
{
  double x = self->_currentCursorFrame.origin.x;
  double y = self->_currentCursorFrame.origin.y;
  double width = self->_currentCursorFrame.size.width;
  double height = self->_currentCursorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentCursorFrame:(CGRect)a3
{
  self->_currentCursorFrame = a3;
}

- (unsigned)currentCursorContextID
{
  return self->_currentCursorContextID;
}

- (void)setCurrentCursorContextID:(unsigned int)a3
{
  self->_currentCursorContextID = a3;
}

- (unsigned)currentCursorDisplayID
{
  return self->_currentCursorDisplayID;
}

- (void)setCurrentCursorDisplayID:(unsigned int)a3
{
  self->_currentCursorDisplayID = a3;
}

- (CGPath)currentCursorPath
{
  return self->_currentCursorPath;
}

- (void)setCurrentCursorPath:(CGPath *)a3
{
}

- (BOOL)shouldHideCursor
{
  return self->_shouldHideCursor;
}

- (AXUIClient)uiClient
{
  return self->_uiClient;
}

- (void)setUiClient:(id)a3
{
}

- (BOOL)uiServerIsReady
{
  return self->_uiServerIsReady;
}

- (void)setUiServerIsReady:(BOOL)a3
{
  self->_uiServerIsReaddouble y = a3;
}

- (BOOL)needToShowVOWarningBanner
{
  return self->_needToShowVOWarningBanner;
}

- (void)setNeedToShowVOWarningBanner:(BOOL)a3
{
  self->_needToShowVOWarningBanner = a3;
}

- (CGRect)currentSonificationPlaybackBounds
{
  double x = self->_currentSonificationPlaybackBounds.origin.x;
  double y = self->_currentSonificationPlaybackBounds.origin.y;
  double width = self->_currentSonificationPlaybackBounds.size.width;
  double height = self->_currentSonificationPlaybackBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentSonificationPlaybackBounds:(CGRect)a3
{
  self->_currentSonificationPlaybackBounds = a3;
}

- (BOOL)didRegisterForPointerEvents
{
  return self->_didRegisterForPointerEvents;
}

- (void)setDidRegisterForPointerEvents:(BOOL)a3
{
  self->_didRegisterForPointerEvents = a3;
}

- (NSPointerArray)pointerEventObservers
{
  return self->_pointerEventObservers;
}

- (void)setPointerEventObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerEventObservers, 0);
  objc_storeStrong((id *)&self->_uiClient, 0);
  objc_storeStrong((id *)&self->_displayQueue, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end