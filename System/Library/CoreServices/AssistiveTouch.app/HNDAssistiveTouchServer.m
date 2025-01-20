@interface HNDAssistiveTouchServer
+ (id)sharedInstance;
- (AXIPCServer)server;
- (HNDAssistiveTouchServer)init;
- (SCATCursorManager)cursorManager;
- (id)_dictionaryElements;
- (id)_dictionaryElementsHandler:(id)a3;
- (id)_highlightDictionaryElementsHandler:(id)a3;
- (id)_homeHandler:(id)a3;
- (id)_lockHandler:(id)a3;
- (id)_longPressDictionaryElementHandler:(id)a3;
- (id)_pressDictionaryElementHandler:(id)a3;
- (id)_screenshotHandler:(id)a3;
- (id)_scrollDictionaryElementDownHandler:(id)a3;
- (id)_scrollDictionaryElementLeftHandler:(id)a3;
- (id)_scrollDictionaryElementRightHandler:(id)a3;
- (id)_scrollDictionaryElementToBottomHandler:(id)a3;
- (id)_scrollDictionaryElementToTopHandler:(id)a3;
- (id)_scrollDictionaryElementUpHandler:(id)a3;
- (id)_setDictionaryElementValueHandler:(id)a3;
- (id)_toggleMuteHandler:(id)a3;
- (id)_tripleHomeHandler:(id)a3;
- (id)_zoomInDictionaryElementHandler:(id)a3;
- (id)_zoomOutDictionaryElementHandler:(id)a3;
- (id)scatBackCursorUIContext;
- (id)scatBackCursorUIContextForDisplayID:(unsigned int)a3;
- (id)scatFrontCursorUIContext;
- (id)scatFrontCursorUIContextForDisplayID:(unsigned int)a3;
- (id)scatUIContext;
- (id)scatUIContextForDisplayID:(unsigned int)a3;
- (void)_enableHiddenNubbitMode:(BOOL)a3;
- (void)_enableServer:(BOOL)a3;
- (void)_highlightDictionaryElementsWithIndexes:(id)a3;
- (void)_home;
- (void)_lock;
- (void)_longPressDictionaryElementWithIndex:(unint64_t)a3;
- (void)_performAction:(int)a3 withIndex:(unint64_t)a4;
- (void)_pressDictionaryElementWithIndex:(unint64_t)a3;
- (void)_screenshot;
- (void)_scrollDictionaryElementWithIndex:(unint64_t)a3 direction:(int64_t)a4;
- (void)_scrollDictionaryElementWithIndex:(unint64_t)a3 position:(int64_t)a4;
- (void)_setDictionaryElementValueWithIndex:(unint64_t)a3 value:(id)a4;
- (void)_toggleMute;
- (void)_tripleHome;
- (void)_zoomDictionaryElementWithIndex:(unint64_t)a3 direction:(int64_t)a4;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)dealloc;
- (void)setCursorManager:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation HNDAssistiveTouchServer

- (id)_dictionaryElements
{
  v2 = +[HNDAccessibilityManager sharedManager];
  [v2 refreshElements];
  double v3 = CACurrentMediaTime();
  while ((([v2 isFetchingElements] & 1) != 0
        || [v2 willFetchElements])
       && CACurrentMediaTime() - v3 < 5.0)
    +[NSThread sleepForTimeInterval:0.25];
  v4 = [v2 elements];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100088FA4;
  v7[3] = &unk_1001AD260;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

- (void)_enableHiddenNubbitMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[HNDHandManager sharedManager];
  [v5 updateAllSettings];
  [(HNDAssistiveTouchServer *)self _enableServer:v3];
}

- (void)_highlightDictionaryElementsWithIndexes:(id)a3
{
  id v10 = a3;
  v4 = [(HNDAssistiveTouchServer *)self cursorManager];
  id v5 = +[HNDAccessibilityManager sharedManager];
  v6 = [v5 elements];
  if (v6 && [v10 count])
  {
    v7 = [v10 objectAtIndexedSubscript:0];
    id v8 = [v7 unsignedIntegerValue];

    v9 = [v6 objectAtIndexedSubscript:v8];
    [v4 updateMainCursorWithElement:v9];
  }
  else
  {
    [v4 updateMainCursorWithElement:0];
  }
}

- (void)_home
{
  if ((sub_100040850() & 1) == 0)
  {
    id v2 = +[AXPISystemActionHelper sharedInstance];
    [v2 activateHomeButton];
  }
}

- (void)_lock
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 activateLockButton];
}

- (void)_longPressDictionaryElementWithIndex:(unint64_t)a3
{
  id v7 = +[HNDAccessibilityManager sharedManager];
  v4 = [v7 elements];
  id v5 = v4;
  if (v4 && (unint64_t)[v4 count] > a3)
  {
    v6 = [v5 objectAtIndexedSubscript:a3];
    [v6 longPress];
  }
  else
  {
    _AXLogWithFacility();
  }
}

- (void)_performAction:(int)a3 withIndex:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v10 = +[HNDAccessibilityManager sharedManager];
  v6 = [v10 elements];
  id v7 = v6;
  if (v6 && (unint64_t)[v6 count] > a4)
  {
    id v8 = [v7 objectAtIndexedSubscript:a4];
  }
  else
  {
    id v8 = sub_100089600(0);
  }
  v9 = v8;
  if (([v8 performAction:v5] & 1) == 0) {
    _AXLogWithFacility();
  }
}

- (void)_pressDictionaryElementWithIndex:(unint64_t)a3
{
  id v7 = +[HNDAccessibilityManager sharedManager];
  v4 = [v7 elements];
  uint64_t v5 = v4;
  if (v4 && (unint64_t)[v4 count] > a3)
  {
    v6 = [v5 objectAtIndexedSubscript:a3];
    [v6 press];
  }
  else
  {
    _AXLogWithFacility();
  }
}

- (void)_screenshot
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 takeScreenshot];
}

- (void)_scrollDictionaryElementWithIndex:(unint64_t)a3 direction:(int64_t)a4
{
  id v11 = +[HNDAccessibilityManager sharedManager];
  v6 = [v11 elements];
  id v7 = v6;
  if (v6 && (unint64_t)[v6 count] > a3)
  {
    id v8 = [v7 objectAtIndexedSubscript:a3];
  }
  else
  {
    id v8 = sub_100089600(kAXScrollableTrait);
  }
  v9 = v8;
  switch(a4)
  {
    case 0:
      uint64_t v10 = 2006;
      goto LABEL_11;
    case 1:
      uint64_t v10 = 2008;
      goto LABEL_11;
    case 2:
      uint64_t v10 = 2009;
      goto LABEL_11;
    case 3:
      uint64_t v10 = 2007;
LABEL_11:
      [v8 performAction:v10];
      break;
    default:
      _AXLogWithFacility();
      break;
  }
}

- (void)_scrollDictionaryElementWithIndex:(unint64_t)a3 position:(int64_t)a4
{
  v6 = +[AXElement systemWideElement];
  id v12 = [v6 currentApplication];

  id v7 = +[HNDAccessibilityManager sharedManager];
  id v8 = [v7 elements];
  v9 = v8;
  if (v8 && (unint64_t)[v8 count] > a3)
  {
    uint64_t v10 = [v9 objectAtIndexedSubscript:a3];
  }
  else
  {
    uint64_t v10 = sub_100089600(kAXScrollableTrait);
  }
  id v11 = (void *)v10;
  [v12 setAutoscrollTarget:v10];
  if (a4 == 1)
  {
    [v12 scrollToTop];
  }
  else if (a4)
  {
    _AXLogWithFacility();
  }
  else
  {
    [v12 scrollToBottom];
  }
}

- (void)_setDictionaryElementValueWithIndex:(unint64_t)a3 value:(id)a4
{
  id v5 = a4;
  id v12 = +[HNDAccessibilityManager sharedManager];
  v6 = [v12 elements];
  id v7 = v6;
  if (v6 && (unint64_t)[v6 count] > a3)
  {
    id v8 = [v7 objectAtIndexedSubscript:a3];
  }
  else
  {
    v9 = +[AXElement systemWideElement];
    uint64_t v10 = [v9 currentApplication];
    id v8 = [v10 firstResponder];
  }
  id v11 = [v8 uiElement];
  [v11 setAXAttribute:2006 withString:v5];
}

- (void)_toggleMute
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 toggleMute];
}

- (void)_tripleHome
{
  id v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 activateTripleClick];
}

- (void)_zoomDictionaryElementWithIndex:(unint64_t)a3 direction:(int64_t)a4
{
  id v11 = +[HNDAccessibilityManager sharedManager];
  v6 = [v11 elements];
  id v7 = v6;
  if (v6 && (unint64_t)[v6 count] > a3)
  {
    id v8 = [v7 objectAtIndexedSubscript:a3];
  }
  else
  {
    id v8 = sub_100089600(0);
  }
  v9 = v8;
  if (a4 == 1)
  {
    uint64_t v10 = 2002;
    goto LABEL_9;
  }
  if (!a4)
  {
    uint64_t v10 = 2001;
LABEL_9:
    [v8 performAction:v10 withValue:0];
    goto LABEL_11;
  }
  _AXLogWithFacility();
LABEL_11:
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  id v5 = [(HNDAssistiveTouchServer *)self cursorManager];
  [v5 updateMainCursorWithElement:0];
}

- (id)scatUIContext
{
  id v2 = +[HNDHandManager sharedManager];
  BOOL v3 = [v2 mainDisplayManager];
  v4 = [v3 scannerContentView];

  return v4;
}

- (id)scatBackCursorUIContext
{
  id v2 = +[HNDHandManager sharedManager];
  BOOL v3 = [v2 mainDisplayManager];
  v4 = [v3 scannerBackCursorView];

  return v4;
}

- (id)scatFrontCursorUIContext
{
  id v2 = +[HNDHandManager sharedManager];
  BOOL v3 = [v2 mainDisplayManager];
  v4 = [v3 scannerFrontCursorView];

  return v4;
}

- (id)scatUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[HNDHandManager sharedManager];
  id v5 = [v4 displayManagerForDisplayId:v3];
  v6 = [v5 scannerContentView];

  return v6;
}

- (id)scatFrontCursorUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[HNDHandManager sharedManager];
  id v5 = [v4 displayManagerForDisplayId:v3];
  v6 = [v5 scannerFrontCursorView];

  return v6;
}

- (id)scatBackCursorUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[HNDHandManager sharedManager];
  id v5 = [v4 displayManagerForDisplayId:v3];
  v6 = [v5 scannerBackCursorView];

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = +[HNDAccessibilityManager sharedManager];
  [v3 removeObserver:self];

  [(HNDAssistiveTouchServer *)self _enableHiddenNubbitMode:0];
  v4.receiver = self;
  v4.super_class = (Class)HNDAssistiveTouchServer;
  [(HNDAssistiveTouchServer *)&v4 dealloc];
}

- (HNDAssistiveTouchServer)init
{
  v15.receiver = self;
  v15.super_class = (Class)HNDAssistiveTouchServer;
  id v2 = [(HNDAssistiveTouchServer *)&v15 init];
  if (v2)
  {
    uint64_t v3 = +[AXSettings sharedInstance];
    -[HNDAssistiveTouchServer _enableHiddenNubbitMode:](v2, "_enableHiddenNubbitMode:", [v3 assistiveTouchInternalOnlyHiddenNubbitModeEnabled]);
    objc_initWeak(&location, v2);
    objc_super v4 = +[AXSettings sharedInstance];
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_10008A26C;
    id v12 = &unk_1001AAA68;
    objc_copyWeak(&v13, &location);
    [v4 registerUpdateBlock:&v9 forRetrieveSelector:"assistiveTouchInternalOnlyHiddenNubbitModeEnabled" withListener:v2];

    objc_destroyWeak(&v13);
    id v5 = [SCATCursorManager alloc];
    v6 = -[SCATCursorManager initWithDisplaySource:](v5, "initWithDisplaySource:", v2, v9, v10, v11, v12);
    [(HNDAssistiveTouchServer *)v2 setCursorManager:v6];
    id v7 = +[HNDAccessibilityManager sharedManager];
    [v7 addObserver:v2];

    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001F0B10 != -1) {
    dispatch_once(&qword_1001F0B10, &stru_1001AD280);
  }
  id v2 = (void *)qword_1001F0B08;

  return v2;
}

- (void)_enableServer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HNDAssistiveTouchServer *)self server];
  id v6 = v5;
  if (v3)
  {
    if (!v5)
    {
      id v7 = objc_alloc((Class)AXIPCServer);
      id v6 = [v7 initWithServiceName:AXAssistiveTouchServerServiceName perPidService:0];
      [v6 setHandlerWithTarget:self selector:"_dictionaryElementsHandler:" forKey:6000];
      [v6 setHandlerWithTarget:self selector:"_highlightDictionaryElementsHandler:" forKey:6001];
      [v6 setHandlerWithTarget:self selector:"_homeHandler:" forKey:6002];
      [v6 setHandlerWithTarget:self selector:"_lockHandler:" forKey:6003];
      [v6 setHandlerWithTarget:self selector:"_longPressDictionaryElementHandler:" forKey:6004];
      [v6 setHandlerWithTarget:self selector:"_pressDictionaryElementHandler:" forKey:6005];
      [v6 setHandlerWithTarget:self selector:"_screenshotHandler:" forKey:6006];
      [v6 setHandlerWithTarget:self selector:"_scrollDictionaryElementDownHandler:" forKey:6007];
      [v6 setHandlerWithTarget:self selector:"_scrollDictionaryElementLeftHandler:" forKey:6008];
      [v6 setHandlerWithTarget:self selector:"_scrollDictionaryElementRightHandler:" forKey:6009];
      [v6 setHandlerWithTarget:self selector:"_scrollDictionaryElementToBottomHandler:" forKey:6010];
      [v6 setHandlerWithTarget:self selector:"_scrollDictionaryElementToTopHandler:" forKey:6011];
      [v6 setHandlerWithTarget:self selector:"_scrollDictionaryElementUpHandler:" forKey:6012];
      [v6 setHandlerWithTarget:self selector:"_setDictionaryElementValueHandler:" forKey:6013];
      [v6 setHandlerWithTarget:self selector:"_toggleMuteHandler:" forKey:6014];
      [v6 setHandlerWithTarget:self selector:"_tripleHomeHandler:" forKey:6015];
      [v6 setHandlerWithTarget:self selector:"_zoomInDictionaryElementHandler:" forKey:6016];
      [v6 setHandlerWithTarget:self selector:"_zoomOutDictionaryElementHandler:" forKey:6017];
      [(HNDAssistiveTouchServer *)self setServer:v6];
    }
    if (([v6 isRunning] & 1) == 0)
    {
      id v17 = 0;
      unsigned __int8 v8 = [v6 startServerWithError:&v17];
      id v9 = v17;
      uint64_t v10 = v9;
      if (v8)
      {
        CFStringRef v14 = @"Started AssistiveTouch message server";
      }
      else
      {
        CFStringRef v14 = @"AssistiveTouch could not start its message server: %@";
        id v15 = v9;
      }
      LOBYTE(v13) = 1;
      _AXLogWithFacility();
    }
    id v12 = +[HNDAccessibilityManager sharedManager];
    goto LABEL_14;
  }
  if ([v5 isRunning])
  {
    id v16 = 0;
    [v6 stopServerWithError:&v16];
    id v11 = v16;
    _AXLogWithFacility();
  }
  if (v6)
  {
    [v6 removeAllHandlersForTarget:self];
    [(HNDAssistiveTouchServer *)self setServer:0];
LABEL_14:
  }
}

- (id)_dictionaryElementsHandler:(id)a3
{
  BOOL v3 = [(HNDAssistiveTouchServer *)self _dictionaryElements];
  uint64_t v7 = AXAssistiveTouchPayloadKeyDictionaryElements;
  unsigned __int8 v8 = v3;
  objc_super v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v5 = [objc_alloc((Class)AXIPCMessage) initWithKey:6000 payload:v4];

  return v5;
}

- (id)_highlightDictionaryElementsHandler:(id)a3
{
  objc_super v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndexes];

  [(HNDAssistiveTouchServer *)self _highlightDictionaryElementsWithIndexes:v5];
  return 0;
}

- (id)_homeHandler:(id)a3
{
  return 0;
}

- (id)_lockHandler:(id)a3
{
  return 0;
}

- (id)_longPressDictionaryElementHandler:(id)a3
{
  objc_super v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex];
  id v6 = [v5 unsignedIntegerValue];

  [(HNDAssistiveTouchServer *)self _longPressDictionaryElementWithIndex:v6];
  return 0;
}

- (id)_pressDictionaryElementHandler:(id)a3
{
  objc_super v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex];
  id v6 = [v5 unsignedIntegerValue];

  [(HNDAssistiveTouchServer *)self _pressDictionaryElementWithIndex:v6];
  return 0;
}

- (id)_screenshotHandler:(id)a3
{
  return 0;
}

- (id)_scrollDictionaryElementDownHandler:(id)a3
{
  objc_super v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex];
  id v6 = [v5 unsignedIntegerValue];

  [(HNDAssistiveTouchServer *)self _scrollDictionaryElementWithIndex:v6 direction:0];
  return 0;
}

- (id)_scrollDictionaryElementLeftHandler:(id)a3
{
  objc_super v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex];
  id v6 = [v5 unsignedIntegerValue];

  [(HNDAssistiveTouchServer *)self _scrollDictionaryElementWithIndex:v6 direction:1];
  return 0;
}

- (id)_scrollDictionaryElementRightHandler:(id)a3
{
  objc_super v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex];
  id v6 = [v5 unsignedIntegerValue];

  [(HNDAssistiveTouchServer *)self _scrollDictionaryElementWithIndex:v6 direction:2];
  return 0;
}

- (id)_scrollDictionaryElementToBottomHandler:(id)a3
{
  objc_super v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex];
  id v6 = [v5 unsignedIntegerValue];

  [(HNDAssistiveTouchServer *)self _scrollDictionaryElementWithIndex:v6 position:0];
  return 0;
}

- (id)_scrollDictionaryElementToTopHandler:(id)a3
{
  objc_super v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex];
  id v6 = [v5 unsignedIntegerValue];

  [(HNDAssistiveTouchServer *)self _scrollDictionaryElementWithIndex:v6 position:1];
  return 0;
}

- (id)_scrollDictionaryElementUpHandler:(id)a3
{
  objc_super v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex];
  id v6 = [v5 unsignedIntegerValue];

  [(HNDAssistiveTouchServer *)self _scrollDictionaryElementWithIndex:v6 direction:3];
  return 0;
}

- (id)_setDictionaryElementValueHandler:(id)a3
{
  id v4 = a3;
  id v5 = [v4 payload];
  id v6 = [v5 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex];
  id v7 = [v6 unsignedIntegerValue];

  unsigned __int8 v8 = [v4 payload];

  id v9 = [v8 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementValue];

  [(HNDAssistiveTouchServer *)self _setDictionaryElementValueWithIndex:v7 value:v9];
  return 0;
}

- (id)_toggleMuteHandler:(id)a3
{
  return 0;
}

- (id)_tripleHomeHandler:(id)a3
{
  return 0;
}

- (id)_zoomInDictionaryElementHandler:(id)a3
{
  id v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex];
  id v6 = [v5 unsignedIntegerValue];

  [(HNDAssistiveTouchServer *)self _zoomDictionaryElementWithIndex:v6 direction:0];
  return 0;
}

- (id)_zoomOutDictionaryElementHandler:(id)a3
{
  id v4 = [a3 payload];
  id v5 = [v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex];
  id v6 = [v5 unsignedIntegerValue];

  [(HNDAssistiveTouchServer *)self _zoomDictionaryElementWithIndex:v6 direction:1];
  return 0;
}

- (SCATCursorManager)cursorManager
{
  return self->_cursorManager;
}

- (void)setCursorManager:(id)a3
{
}

- (AXIPCServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong((id *)&self->_cursorManager, 0);
}

@end