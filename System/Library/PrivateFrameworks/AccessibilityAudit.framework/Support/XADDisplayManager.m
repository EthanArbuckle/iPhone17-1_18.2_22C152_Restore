@interface XADDisplayManager
+ (id)sharedManager;
- (AXUIClient)_uiClient;
- (BOOL)_forceRefreshOnNextUpdate;
- (BOOL)_shouldHideCursor;
- (CGPath)_currentCursorPath;
- (CGRect)_currentCursorFrame;
- (NSLock)_lock;
- (XADDisplayManager)init;
- (unsigned)_currentCursorContextID;
- (void)dealloc;
- (void)hideVisualsSynchronously;
- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 element:(id)a6 forceRefresh:(BOOL)a7;
- (void)setCursorFrameForElement:(id)a3;
- (void)setCursorStyle:(unint64_t)a3;
- (void)set_currentCursorContextID:(unsigned int)a3;
- (void)set_currentCursorFrame:(CGRect)a3;
- (void)set_currentCursorPath:(CGPath *)a3;
- (void)set_forceRefreshOnNextUpdate:(BOOL)a3;
- (void)set_lock:(id)a3;
- (void)set_shouldHideCursor:(BOOL)a3;
- (void)set_uiClient:(id)a3;
@end

@implementation XADDisplayManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AE9C;
  block[3] = &unk_100018870;
  block[4] = a1;
  if (qword_10001E2E0 != -1) {
    dispatch_once(&qword_10001E2E0, block);
  }
  v2 = (void *)qword_10001E2D8;

  return v2;
}

- (XADDisplayManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)XADDisplayManager;
  v2 = [(XADDisplayManager *)&v8 init];
  if (v2)
  {
    v3 = (AXUIClient *)[objc_alloc((Class)AXUIClient) initWithIdentifier:@"AXAuditAXUIClientIdentifier" serviceBundleName:@"AXAuditAXUIService"];
    uiClient = v2->__uiClient;
    v2->__uiClient = v3;

    [(AXUIClient *)v2->__uiClient setDelegate:v2];
    uint64_t v5 = objc_opt_new();
    lock = v2->__lock;
    v2->__lock = (NSLock *)v5;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)XADDisplayManager;
  [(XADDisplayManager *)&v2 dealloc];
}

- (void)setCursorStyle:(unint64_t)a3
{
  CFStringRef v7 = @"frameStyle";
  v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  objc_super v8 = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  v6 = [(XADDisplayManager *)self _uiClient];
  [v6 sendAsynchronousMessage:v5 withIdentifier:2 targetAccessQueue:0 completion:0];

  [(XADDisplayManager *)self set_forceRefreshOnNextUpdate:1];
}

- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 element:(id)a6 forceRefresh:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v15 = CGRectZero.origin.y;
  CGFloat v16 = CGRectZero.size.width;
  CGFloat v17 = CGRectZero.size.height;
  v46.origin.double x = CGRectZero.origin.x;
  v46.origin.double y = v15;
  v46.size.double width = v16;
  v46.size.double height = v17;
  v51.origin.double x = x;
  v51.origin.double y = y;
  v51.size.double width = width;
  v51.size.double height = height;
  if (!CGRectEqualToRect(v46, v51))
  {
    -[XADDisplayManager _adjustFrameToFitScreen:](self, "_adjustFrameToFitScreen:", x, y, width, height);
    double x = v18;
    double y = v19;
    double width = v20;
    double height = v21;
  }
  v22 = [(XADDisplayManager *)self _lock];
  [v22 lock];

  if (v7) {
    goto LABEL_4;
  }
  [(XADDisplayManager *)self _currentCursorFrame];
  v52.origin.double x = v27;
  v52.origin.double y = v28;
  v52.size.double width = v29;
  v52.size.double height = v30;
  v48.origin.double x = x;
  v48.origin.double y = y;
  v48.size.double width = width;
  v48.size.double height = height;
  BOOL v31 = CGRectEqualToRect(v48, v52);
  if (a4 || !v31)
  {
LABEL_4:
    -[XADDisplayManager set_currentCursorFrame:](self, "set_currentCursorFrame:", x, y, width, height);
    [(XADDisplayManager *)self set_currentCursorContextID:v8];
    [(XADDisplayManager *)self set_currentCursorPath:a4];
    v23 = [(XADDisplayManager *)self _lock];
    [v23 unlock];

    if ([(XADDisplayManager *)self _shouldHideCursor])
    {
      CFStringRef v43 = @"frame";
      v47.origin.double x = CGRectZero.origin.x;
      v47.origin.double y = v15;
      v47.size.double width = v16;
      v47.size.double height = v17;
      v24 = NSStringFromRect(v47);
      v44 = v24;
      v25 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];

      v26 = [(XADDisplayManager *)self _uiClient];
      [v26 sendAsynchronousMessage:v25 withIdentifier:1 targetAccessQueue:0 completion:0];
    }
    else
    {
      if (a4 && (uint64_t v32 = AX_CGPathCopyDataRepresentation()) != 0)
      {
        v33 = (const void *)v32;
        v41[0] = @"frame";
        v49.origin.double x = x;
        v49.origin.double y = y;
        v49.size.double width = width;
        v49.size.double height = height;
        v34 = NSStringFromRect(v49);
        v41[1] = @"path";
        v42[0] = v34;
        v42[1] = v33;
        v35 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];

        CFRelease(v33);
      }
      else
      {
        CFStringRef v39 = @"frame";
        v50.origin.double x = x;
        v50.origin.double y = y;
        v50.size.double width = width;
        v50.size.double height = height;
        v36 = NSStringFromRect(v50);
        v40 = v36;
        v35 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      }
      v37 = [(XADDisplayManager *)self _uiClient];
      [v37 sendAsynchronousMessage:v35 withIdentifier:1 targetAccessQueue:0 completion:0];
    }
  }
  else
  {
    id v38 = [(XADDisplayManager *)self _lock];
    [v38 unlock];
  }
}

- (void)hideVisualsSynchronously
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  CFStringRef v11 = @"frame";
  v13.origin.double x = CGRectZero.origin.x;
  v13.origin.double y = CGRectZero.origin.y;
  v13.size.double width = CGRectZero.size.width;
  v13.size.double height = CGRectZero.size.height;
  uint64_t v5 = NSStringFromRect(v13);
  v12 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  BOOL v7 = [(XADDisplayManager *)self _uiClient];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B57C;
  v9[3] = &unk_100018AB8;
  dispatch_semaphore_t v10 = v3;
  uint64_t v8 = v3;
  [v7 sendAsynchronousMessage:v6 withIdentifier:1 targetAccessQueue:0 completion:v9];

  dispatch_semaphore_wait(v8, v4);
}

- (void)setCursorFrameForElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 clearCachedFrame:1 cachedVisibleFrame:1];
    v6 = [v5 uiElement];
    [v6 updateCache:2003];

    if ([v5 path])
    {
      BOOL v7 = [v5 uiElement];
      [v7 updateCache:2042];
    }
    [v5 frame];
    double x = v8;
    double y = v10;
    double width = v12;
    double height = v14;
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  id v16 = v5;
  CGFloat v17 = [v16 uiElement];
  double v18 = [v17 numberWithAXAttribute:2021];
  id v19 = [v18 unsignedIntValue];

  if (!v19)
  {
    uint64_t v20 = [v16 elementForAttribute:5002];
    if (v20)
    {
      double v21 = (void *)v20;
      do
      {
        v22 = [v21 uiElement];
        v23 = [v22 numberWithAXAttribute:2021];
        id v19 = [v23 unsignedIntValue];

        if (v19) {
          break;
        }
        uint64_t v24 = [v21 elementForAttribute:5002];

        double v21 = (void *)v24;
      }
      while (v24);
    }
    else
    {
      id v19 = 0;
    }
  }

  v25 = [v16 uiElement];
  unsigned int v26 = [v25 BOOLWithAXAttribute:2098];

  if (v26)
  {
    CGFloat v27 = +[AXElement systemWideElement];
    double valuePtr = x;
    double v33 = y;
    double v34 = width;
    double v35 = height;
    AXValueRef v28 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
    CGFloat v29 = [v27 uiElement];
    CGFloat v30 = +[NSNumber numberWithUnsignedInteger:v19];
    BOOL v31 = (const __AXValue *)objc_msgSend(v29, "objectWithAXAttribute:parameter:", 91505, +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v28, v30, 0));

    if (v31) {
      AXValueGetValue(v31, kAXValueTypeCGRect, &valuePtr);
    }
    if (v28) {
      CFRelease(v28);
    }
    double x = valuePtr;
    double y = v33;
    double width = v34;
    double height = v35;
  }
  -[XADDisplayManager setCursorFrame:withPath:withContextId:element:forceRefresh:](self, "setCursorFrame:withPath:withContextId:element:forceRefresh:", [v16 path], v19, v16, -[XADDisplayManager _forceRefreshOnNextUpdate](self, "_forceRefreshOnNextUpdate"), x, y, width, height);
  [(XADDisplayManager *)self set_forceRefreshOnNextUpdate:0];
}

- (NSLock)_lock
{
  return self->__lock;
}

- (void)set_lock:(id)a3
{
}

- (AXUIClient)_uiClient
{
  return self->__uiClient;
}

- (void)set_uiClient:(id)a3
{
}

- (BOOL)_shouldHideCursor
{
  return self->__shouldHideCursor;
}

- (void)set_shouldHideCursor:(BOOL)a3
{
  self->__shouldHideCursor = a3;
}

- (CGRect)_currentCursorFrame
{
  double x = self->__currentCursorFrame.origin.x;
  double y = self->__currentCursorFrame.origin.y;
  double width = self->__currentCursorFrame.size.width;
  double height = self->__currentCursorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_currentCursorFrame:(CGRect)a3
{
  self->__currentCursorFrame = a3;
}

- (CGPath)_currentCursorPath
{
  return self->__currentCursorPath;
}

- (void)set_currentCursorPath:(CGPath *)a3
{
}

- (unsigned)_currentCursorContextID
{
  return self->__currentCursorContextID;
}

- (void)set_currentCursorContextID:(unsigned int)a3
{
  self->__currentCursorContextID = a3;
}

- (BOOL)_forceRefreshOnNextUpdate
{
  return self->__forceRefreshOnNextUpdate;
}

- (void)set_forceRefreshOnNextUpdate:(BOOL)a3
{
  self->__forceRefreshOnNextUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__uiClient, 0);

  objc_storeStrong((id *)&self->__lock, 0);
}

@end