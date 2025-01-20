@interface SSUICursorViewController
+ (id)serviceBundle;
+ (id)transformImage:(id)a3 flip:(BOOL)a4 rotate:(BOOL)a5;
- (AXUIService)axuiService;
- (BOOL)_canShowWhileLocked;
- (BOOL)annotationHiddenByLocalUser;
- (BOOL)cursorHidden;
- (BOOL)flipped;
- (BOOL)rotated;
- (CGPath)cursorPath;
- (CGRect)cursorFrame;
- (NSMutableDictionary)annotationInfo;
- (SSUIAssistViewProtocol)currentView;
- (SSUICursorView)cursorView;
- (SSUICursorViewController)initWithAXUIService:(id)a3;
- (SSUICursorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SSUIPerUserMasterView)perUserView;
- (SSUISlateView)slateView;
- (UIImage)arrowImage;
- (UIImage)currentArrowImage;
- (UIImage)downArrowImage;
- (UIImage)leftarrowImage;
- (UIImage)upArrowImage;
- (int)currentColor;
- (void)_updateCursorFrameAnimated:(BOOL)a3;
- (void)_updateCursorPath;
- (void)dealloc;
- (void)doneAssisting;
- (void)handleAlternateMessage:(id)a3;
- (void)handleAnnotation:(id)a3;
- (void)handleHideAllPointers;
- (void)handlePointerAnnotation:(id)a3;
- (void)handleSetCursorFrameMessage:(id)a3;
- (void)handleShowAllPointers;
- (void)setAnnotationHiddenByLocalUser:(BOOL)a3;
- (void)setAnnotationInfo:(id)a3;
- (void)setArrowImage:(id)a3;
- (void)setAxuiService:(id)a3;
- (void)setCurrentArrowImage:(id)a3;
- (void)setCurrentColor:(int)a3;
- (void)setCurrentView:(id)a3;
- (void)setCursorFrame:(CGRect)a3;
- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setCursorHidden:(BOOL)a3;
- (void)setCursorPath:(CGPath *)a3;
- (void)setCursorPath:(CGPath *)a3 withColor:(int)a4 flipped:(BOOL)a5 rotated:(BOOL)a6;
- (void)setCursorView:(id)a3;
- (void)setDownArrowImage:(id)a3;
- (void)setFlipped:(BOOL)a3;
- (void)setFrameOriginWithPoint:(CGPoint)a3;
- (void)setLeftarrowImage:(id)a3;
- (void)setPerUserView:(id)a3;
- (void)setRotated:(BOOL)a3;
- (void)setSlateView:(id)a3;
- (void)setUpArrowImage:(id)a3;
- (void)stroke;
- (void)strokeCore:(BOOL)a3 rotate:(BOOL)a4;
- (void)tearDownViews;
- (void)viewDidLoad;
@end

@implementation SSUICursorViewController

+ (id)serviceBundle
{
  if (qword_16D20 != -1) {
    dispatch_once(&qword_16D20, &stru_10490);
  }
  v2 = (void *)qword_16D28;

  return v2;
}

+ (id)transformImage:(id)a3 flip:(BOOL)a4 rotate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v7 = (CGImage *)[a3 CGImage];
  unint64_t Width = CGImageGetWidth(v7);
  unint64_t Height = CGImageGetHeight(v7);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = malloc_type_calloc(4 * Width * Height, 1uLL, 0x100004077774924uLL);
  v12 = CGBitmapContextCreate(v11, Width, Height, 8uLL, 4 * Width, DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  if (v5)
  {
    if (v6) {
      double v13 = 1.57079633;
    }
    else {
      double v13 = -1.57079633;
    }
    CGContextTranslateCTM(v12, (double)(Width >> 1), (double)(Height >> 1));
    CGContextRotateCTM(v12, v13);
    CGContextTranslateCTM(v12, (double)-(int)(Height >> 1), (double)-(int)(Width >> 1));
  }
  else if (v6)
  {
    CGContextTranslateCTM(v12, (double)Width, 0.0);
    CGContextScaleCTM(v12, -1.0, 1.0);
  }
  v19.size.width = (double)Width;
  v19.size.height = (double)Height;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  CGContextDrawImage(v12, v19, v7);
  CGImageRef Image = CGBitmapContextCreateImage(v12);
  if (Image)
  {
    v15 = Image;
    v16 = +[UIImage imageWithCGImage:Image];
    CGImageRelease(v15);
  }
  else
  {
    v16 = 0;
  }
  CGContextRelease(v12);
  free(v11);

  return v16;
}

- (SSUICursorViewController)initWithAXUIService:(id)a3
{
  result = [(SSUICursorViewController *)self initWithNibName:0 bundle:0];
  if (result) {
    result->_axuiService = (AXUIService *)a3;
  }
  return result;
}

- (SSUICursorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)SSUICursorViewController;
  v4 = [(SSUICursorViewController *)&v19 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    BOOL v5 = +[SSUICursorViewController serviceBundle];
    BOOL v6 = +[UIImage imageNamed:@"arrow" inBundle:v5 compatibleWithTraitCollection:0];
    [(SSUICursorViewController *)v4 setArrowImage:v6];
    [(SSUICursorViewController *)v4 setCurrentArrowImage:v6];

    v7 = [(SSUICursorViewController *)v4 arrowImage];
    v8 = +[SSUICursorViewController transformImage:v7 flip:1 rotate:0];
    [(SSUICursorViewController *)v4 setLeftarrowImage:v8];

    v9 = [(SSUICursorViewController *)v4 arrowImage];
    v10 = +[SSUICursorViewController transformImage:v9 flip:1 rotate:1];
    [(SSUICursorViewController *)v4 setUpArrowImage:v10];

    v11 = [(SSUICursorViewController *)v4 arrowImage];
    v12 = +[SSUICursorViewController transformImage:v11 flip:0 rotate:1];
    [(SSUICursorViewController *)v4 setDownArrowImage:v12];

    arrowCGImageRef Image = v4->arrowImage;
    v14 = [(SSUICursorViewController *)v4 cursorView];
    [v14 setImage:arrowImage];

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    blinker = v4->blinker;
    v4->blinker = (OS_dispatch_semaphore *)v15;

    v17 = +[NSMutableDictionary dictionary];
    [(SSUICursorViewController *)v4 setAnnotationInfo:v17];
  }
  return v4;
}

- (void)dealloc
{
  [(SSUICursorViewController *)self tearDownViews];
  cursorPath = self->_cursorPath;
  if (cursorPath)
  {
    CFRelease(cursorPath);
    self->_cursorPath = 0;
  }
  [(SSUICursorViewController *)self setArrowImage:0];
  [(SSUICursorViewController *)self setLeftarrowImage:0];
  [(SSUICursorViewController *)self setUpArrowImage:0];
  [(SSUICursorViewController *)self setDownArrowImage:0];
  [(SSUICursorViewController *)self setCurrentArrowImage:0];
  v4.receiver = self;
  v4.super_class = (Class)SSUICursorViewController;
  [(SSUICursorViewController *)&v4 dealloc];
}

- (void)handleSetCursorFrameMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKey:@"messageType"];
  unsigned int v6 = [v5 unsignedShortValue];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "## handleSetCursorFrameMessage incoming message %@", (uint8_t *)&v7, 0xCu);
  }
  switch(v6)
  {
    case 1u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SS kSSSafeViewAnnotationCmd", (uint8_t *)&v7, 2u);
      }
      [(SSUICursorViewController *)self handleAnnotation:v4];
      break;
    case 2u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SS kSSPointerAnnotationCmd", (uint8_t *)&v7, 2u);
      }
      [(SSUICursorViewController *)self handlePointerAnnotation:v4];
      break;
    case 3u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SS  kSSHideAllPointersCmd", (uint8_t *)&v7, 2u);
      }
      [(SSUICursorViewController *)self handleHideAllPointers];
      break;
    case 4u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SS kSSShowAllPointersCmd", (uint8_t *)&v7, 2u);
      }
      [(SSUICursorViewController *)self handleShowAllPointers];
      break;
    case 5u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SS kSSDoneAssistingCmd", (uint8_t *)&v7, 2u);
      }
      [(SSUICursorViewController *)self doneAssisting];
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SS unknown annotation cmd", (uint8_t *)&v7, 2u);
      }
      break;
  }
}

- (void)handleAnnotation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKey:@"animate"];
  id v6 = [v5 BOOLValue];

  int v7 = [v4 objectForKey:@"frame"];
  CGRect v47 = CGRectFromString(v7);
  double x = v47.origin.x;
  double y = v47.origin.y;
  double width = v47.size.width;
  double height = v47.size.height;

  v12 = [v4 objectForKey:@"path"];
  if (v12) {
    double v13 = (const void *)AX_CGPathCreateWithDataRepresentation();
  }
  else {
    double v13 = 0;
  }
  v48.origin.double x = CGRectZero.origin.x;
  v48.origin.double y = CGRectZero.origin.y;
  v48.size.double width = CGRectZero.size.width;
  v48.size.double height = CGRectZero.size.height;
  v49.origin.double x = x;
  v49.origin.double y = y;
  v49.size.double width = width;
  v49.size.double height = height;
  if (CGRectEqualToRect(v48, v49) && v13 == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SS handleSetCursorFrameMessage hidden", buf, 2u);
    }
    [(SSUICursorViewController *)self setCursorHidden:1];
    v22 = [(SSUICursorViewController *)self slateView];
    [v22 wipeSlate];

    goto LABEL_32;
  }
  if ([(SSUICursorViewController *)self cursorHidden]) {
    [(SSUICursorViewController *)self setCursorHidden:0];
  }
  dispatch_semaphore_t v15 = [v4 objectForKey:@"flags"];
  id v16 = [v15 unsignedIntValue];

  int v17 = v16 & 7;
  switch(v17)
  {
    case 3:
      v18 = [(SSUICursorViewController *)self slateView];
      [v18 setHidden:0];

      objc_super v19 = [(SSUICursorViewController *)self cursorView];
      [v19 setHidden:1];

      v20 = [(SSUICursorViewController *)self perUserView];
      [v20 setHidden:1];

      uint64_t v21 = [(SSUICursorViewController *)self slateView];
      break;
    case 5:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v45 = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "handleSetCursorFrameMessage per user", v45, 2u);
      }
      v27 = [(SSUICursorViewController *)self slateView];
      [v27 setHidden:1];

      v28 = [(SSUICursorViewController *)self cursorView];
      [v28 setHidden:1];

      v29 = [(SSUICursorViewController *)self perUserView];
      [v29 setHidden:0];

      uint64_t v21 = [(SSUICursorViewController *)self perUserView];
      break;
    case 2:
      v23 = [(SSUICursorViewController *)self slateView];
      [v23 wipeSlate];

      v24 = [(SSUICursorViewController *)self slateView];
      [v24 setHidden:1];

      v25 = [(SSUICursorViewController *)self cursorView];
      [v25 setHidden:0];

      v26 = [(SSUICursorViewController *)self perUserView];
      [v26 setHidden:1];

      uint64_t v21 = [(SSUICursorViewController *)self cursorView];
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_A78C();
      }
      goto LABEL_22;
  }
  v30 = (void *)v21;
  [(SSUICursorViewController *)self setCurrentView:v21];

LABEL_22:
  v31 = [(SSUICursorViewController *)self currentView];
  [v31 setEventFlags:v16];

  v32 = [(SSUICursorViewController *)self currentView];
  objc_msgSend(v32, "hotspotAdjustmentForCursorFrame:", x, y, width, height);
  double v34 = v33;
  double v36 = v35;

  double v37 = x + v34;
  if (v17 == 3)
  {
    v38 = [v4 objectForKey:@"orientation"];
    id v39 = [v38 integerValue];

    v40 = [(SSUICursorViewController *)self slateView];
    [v40 setCurrentOrientation:v39];

    v41 = [(SSUICursorViewController *)self slateView];
    v42 = v41;
    if ((v16 & 0x80000000) != 0)
    {
      [v41 startPeriodicUpdate];

      v43 = [(SSUICursorViewController *)self slateView];
      objc_msgSend(v43, "addPoint:", v37, y + v36);
    }
    else
    {
      [v41 stopPeriodicUpdate];

      v43 = [(SSUICursorViewController *)self slateView];
      [v43 drawCompletedPath];
    }
  }
  else
  {
    if (v17 != 5)
    {
      -[SSUICursorViewController setCursorFrame:animated:](self, "setCursorFrame:animated:", v6, v37, y + v36, width, height);
      [(SSUICursorViewController *)self setCursorPath:v13 withColor:v16 & 0x70 flipped:(v16 >> 29) & 1 rotated:(v16 >> 28) & 1];
      if (!v13) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    v44 = [(SSUICursorViewController *)self perUserView];
    objc_msgSend(v44, "setCursorFrame:animated:", v6, v37, y + v36, width, height);

    v43 = [(SSUICursorViewController *)self perUserView];
    [v43 setUserData:v4];
  }

  if (v13) {
LABEL_31:
  }
    CFRelease(v13);
LABEL_32:
}

- (void)handlePointerAnnotation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"enabled"];
  unsigned int v6 = [v5 BOOLValue];

  int v7 = [v4 objectForKeyedSubscript:@"uniqueID"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v44 = 138412290;
    id v45 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "## handlePointerAnnotation incoming dict %@", (uint8_t *)&v44, 0xCu);
  }
  id v8 = self;
  objc_sync_enter(v8);
  v9 = [(SSUICursorViewController *)v8 annotationInfo];
  v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    v11 = [v10 objectForKeyedSubscript:@"enabled"];
    unsigned int v12 = [v11 BOOLValue];

    [v10 addEntriesFromDictionary:v4];
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"needsUpdate"];
    double v13 = [v10 objectForKeyedSubscript:@"x"];
    [v13 doubleValue];
    uint64_t v15 = v14;
    id v16 = [v10 objectForKeyedSubscript:@"y"];
    [v16 doubleValue];
    uint64_t v18 = v17;

    if (v6)
    {
      if (v12)
      {
        [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:@"showTransition"];
        id v19 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v7 UTF8String];
          id v21 = [v10 objectForKeyedSubscript:@"displayName"];
          id v22 = [v21 UTF8String];
          int v44 = 136315906;
          id v45 = v20;
          __int16 v46 = 2080;
          id v47 = v22;
          __int16 v48 = 2048;
          uint64_t v49 = v15;
          __int16 v50 = 2048;
          uint64_t v51 = v18;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "##move %s for user %s to %f %f", (uint8_t *)&v44, 0x2Au);
        }
      }
      else
      {
        [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"enabled"];
        [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"showTransition"];
        id v27 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = [v7 UTF8String];
          id v29 = [v10 objectForKeyedSubscript:@"displayName"];
          id v30 = [v29 UTF8String];
          int v44 = 136315906;
          id v45 = v28;
          __int16 v46 = 2080;
          id v47 = v30;
          __int16 v48 = 2048;
          uint64_t v49 = v15;
          __int16 v50 = 2048;
          uint64_t v51 = v18;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "show %s for user %s at %f %f", (uint8_t *)&v44, 0x2Au);
        }
      }
LABEL_23:

LABEL_24:
      v31 = [(SSUICursorViewController *)v8 annotationInfo];
      [v31 setObject:v10 forKeyedSubscript:v7];

      goto LABEL_25;
    }
    if (v12)
    {
      [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:@"enabled"];
      [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"showTransition"];
      id v23 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v7 UTF8String];
        int v44 = 136315138;
        id v45 = v24;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "hide %s", (uint8_t *)&v44, 0xCu);
      }
      goto LABEL_23;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v44) = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pointer already hidden", (uint8_t *)&v44, 2u);
    }
  }
  else
  {
    if (v6)
    {
      v10 = +[NSMutableDictionary dictionary];
      [v10 addEntriesFromDictionary:v4];
      [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"needsUpdate"];
      [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"enabled"];
      [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"showTransition"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v44 = 138412290;
        id v45 = v7;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "##added %@", (uint8_t *)&v44, 0xCu);
      }
      goto LABEL_24;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v44 = 138412290;
      id v45 = v7;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "tried to hide annotation for unknown user: %@", (uint8_t *)&v44, 0xCu);
    }
    id v25 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [(SSUICursorViewController *)v8 annotationInfo];
      int v44 = 138412290;
      id v45 = v26;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "known users: %@", (uint8_t *)&v44, 0xCu);
    }
    v10 = 0;
  }
LABEL_25:
  objc_sync_exit(v8);

  unsigned __int8 v32 = [(SSUICursorViewController *)v8 annotationHiddenByLocalUser];
  BOOL v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v32)
  {
    if (v33)
    {
      LOWORD(v44) = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "hidden by local user", (uint8_t *)&v44, 2u);
    }
  }
  else
  {
    if (v33)
    {
      LOWORD(v44) = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "showing", (uint8_t *)&v44, 2u);
    }
    double v34 = [v10 objectForKeyedSubscript:@"flags"];
    unsigned int v35 = [v34 unsignedIntValue];

    double v36 = +[NSNumber numberWithUnsignedInt:v35 & 0xFFFFFFF8 | 5];
    [v10 setObject:v36 forKeyedSubscript:@"flags"];

    double v37 = [v10 objectForKeyedSubscript:@"x"];
    [v37 floatValue];
    float v39 = v38;
    v40 = [v10 objectForKeyedSubscript:@"y"];
    [v40 floatValue];
    float v42 = v41;

    v52.origin.double x = v39;
    v52.origin.double y = v42;
    v52.size.double width = 96.0;
    v52.size.double height = 64.0;
    v43 = NSStringFromCGRect(v52);
    [v10 setObject:v43 forKeyedSubscript:@"frame"];

    [(SSUICursorViewController *)v8 handleAnnotation:v10];
  }
}

- (void)handleHideAllPointers
{
  if ([(SSUICursorViewController *)self annotationHiddenByLocalUser])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ignore hideAllPointers command", v4, 2u);
    }
  }
  else
  {
    [(SSUICursorViewController *)self setAnnotationHiddenByLocalUser:1];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "local user hid all annotation pointers", buf, 2u);
    }
    v3 = [(SSUICursorViewController *)self perUserView];
    [v3 hideAllPointers];
  }
}

- (void)handleShowAllPointers
{
  if ([(SSUICursorViewController *)self annotationHiddenByLocalUser])
  {
    [(SSUICursorViewController *)self setAnnotationHiddenByLocalUser:0];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "local unhid all annotation pointers", buf, 2u);
    }
    v3 = [(SSUICursorViewController *)self perUserView];
    [v3 showAllPointers];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ignore showAllPointers command", v4, 2u);
  }
}

- (void)doneAssisting
{
  id v2 = [(SSUICursorViewController *)self perUserView];
  [v2 clearUserData];
}

- (void)handleAlternateMessage:(id)a3
{
  id v4 = [a3 objectForKey:@"flags"];
  unsigned __int8 v5 = [v4 unsignedIntValue];

  if ((v5 & 7) == 3)
  {
    id v6 = [(SSUICursorViewController *)self slateView];
    [v6 wipeSlate];
  }
  else
  {
    [(SSUICursorViewController *)self stroke];
  }
}

- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4
{
  self->_cursorFrame = a3;
  [(SSUICursorViewController *)self _updateCursorFrameAnimated:a4];
}

- (void)setFrameOriginWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(SSUICursorViewController *)self cursorView];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;

  id v11 = [(SSUICursorViewController *)self cursorView];
  objc_msgSend(v11, "setFrame:", x, y, v8, v10);
}

- (void)strokeCore:(BOOL)a3 rotate:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_63B0;
  v4[3] = &unk_10530;
  BOOL v5 = a4;
  BOOL v6 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)stroke
{
  v3 = [(SSUICursorViewController *)self currentView];
  id v4 = [(SSUICursorViewController *)self cursorView];

  if (v3 == v4 && !self->counter)
  {
    BOOL v5 = dispatch_get_global_queue(-32768, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6954;
    block[3] = &unk_103D8;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (void)_updateCursorFrameAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  +[SSUICursorView resizeFrameForDisplay:](SSUICursorView, "resizeFrameForDisplay:", self->_cursorFrame.origin.x, self->_cursorFrame.origin.y, self->_cursorFrame.size.width, self->_cursorFrame.size.height);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(SSUICursorViewController *)self view];
  uint64_t v14 = [v13 window];
  objc_msgSend(v14, "_convertRectFromSceneReferenceSpace:", v6, v8, v10, v12);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  id v23 = [(SSUICursorViewController *)self cursorView];
  objc_msgSend(v23, "resizeFrameForWindow:", v16, v18, v20, v22);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  unsigned __int8 v32 = [(SSUICursorViewController *)self view];
  objc_msgSend(v32, "convertRect:fromView:", 0, v25, v27, v29, v31);
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  id v41 = [(SSUICursorViewController *)self cursorView];
  objc_msgSend(v41, "setCursorFrame:animated:", v3, v34, v36, v38, v40);
}

- (void)setCursorPath:(CGPath *)a3
{
  cursorPath = self->_cursorPath;
  if (a3) {
    double v5 = (CGPath *)CFRetain(a3);
  }
  else {
    double v5 = 0;
  }
  self->_cursorPath = v5;
  if (cursorPath) {
    CFRelease(cursorPath);
  }
  [(SSUICursorViewController *)self _updateCursorPath];
  double v6 = [(SSUICursorViewController *)self currentArrowImage];
  double v7 = [(SSUICursorViewController *)self cursorView];
  [v7 setImage:v6];

  double x = self->_cursorFrame.origin.x;
  double y = self->_cursorFrame.origin.y;
  double width = self->_cursorFrame.size.width;
  double height = self->_cursorFrame.size.height;
  id v12 = [(SSUICursorViewController *)self cursorView];
  objc_msgSend(v12, "setFrame:", x, y, width, height);
}

- (void)setCursorPath:(CGPath *)a3 withColor:(int)a4 flipped:(BOOL)a5 rotated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  if ([(SSUICursorViewController *)self currentColor] != a4)
  {
    HIDWORD(v12) = v8;
    LODWORD(v12) = v8 - 16;
    unsigned int v11 = v12 >> 4;
    if (v11 > 4) {
      CFStringRef v13 = @"arrow";
    }
    else {
      CFStringRef v13 = off_10550[v11];
    }
    uint64_t v14 = +[SSUICursorViewController serviceBundle];
    double v15 = +[UIImage imageNamed:v13 inBundle:v14 compatibleWithTraitCollection:0];
    [(SSUICursorViewController *)self setArrowImage:v15];

    double v16 = [(SSUICursorViewController *)self arrowImage];
    double v17 = +[SSUICursorViewController transformImage:v16 flip:1 rotate:0];
    [(SSUICursorViewController *)self setLeftarrowImage:v17];

    double v18 = [(SSUICursorViewController *)self arrowImage];
    double v19 = +[SSUICursorViewController transformImage:v18 flip:1 rotate:1];
    [(SSUICursorViewController *)self setUpArrowImage:v19];

    double v20 = [(SSUICursorViewController *)self arrowImage];
    double v21 = +[SSUICursorViewController transformImage:v20 flip:0 rotate:1];
    [(SSUICursorViewController *)self setDownArrowImage:v21];

    [(SSUICursorViewController *)self setCurrentColor:v8];
    goto LABEL_9;
  }
  if ([(SSUICursorViewController *)self flipped] != v7
    || [(SSUICursorViewController *)self rotated] != v6)
  {
LABEL_9:
    if (v7)
    {
      if (v6) {
        [(SSUICursorViewController *)self upArrowImage];
      }
      else {
        [(SSUICursorViewController *)self leftarrowImage];
      }
    }
    else if (v6)
    {
      [(SSUICursorViewController *)self downArrowImage];
    }
    else
    {
      [(SSUICursorViewController *)self arrowImage];
    uint64_t v22 = };
    id v23 = (void *)v22;
    [(SSUICursorViewController *)self setCurrentArrowImage:v22];

    [(SSUICursorViewController *)self setFlipped:v7];
    [(SSUICursorViewController *)self setRotated:v6];
  }

  [(SSUICursorViewController *)self setCursorPath:a3];
}

- (void)_updateCursorPath
{
  if (self->_cursorPath)
  {
    BOOL v3 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:");
    UIAccessibilitySceneReferencePathToScreenPath();
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = [(SSUICursorViewController *)self view];
    UIAccessibilityPathForAccessibilityPath();
    id v5 = objc_claimAutoreleasedReturnValue();
    id v6 = [v5 CGPath];

    BOOL v7 = [(SSUICursorViewController *)self cursorView];
    [v7 setPath:v6];
  }
  else
  {
    id v8 = [(SSUICursorViewController *)self cursorView];
    [v8 setPath:0];
  }
}

- (BOOL)cursorHidden
{
  id v2 = [(SSUICursorViewController *)self view];
  unsigned __int8 v3 = [v2 isHidden];

  return v3;
}

- (void)setCursorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SSUICursorViewController *)self view];
  [v4 setHidden:v3];
}

- (void)viewDidLoad
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(SSUICursorViewController *)self setView:v7];

  id v8 = -[SSUICursorView initWithFrame:]([SSUICursorView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(SSUICursorViewController *)self setCursorView:v8];

  double v9 = [SSUISlateView alloc];
  double v10 = +[UIScreen mainScreen];
  [v10 bounds];
  unsigned int v11 = -[SSUISlateView initWithFrame:](v9, "initWithFrame:");
  [(SSUICursorViewController *)self setSlateView:v11];

  unint64_t v12 = [SSUIPerUserMasterView alloc];
  CFStringRef v13 = +[UIScreen mainScreen];
  [v13 bounds];
  uint64_t v14 = -[SSUIPerUserMasterView initWithFrame:](v12, "initWithFrame:");
  [(SSUICursorViewController *)self setPerUserView:v14];

  double v15 = [(SSUICursorViewController *)self view];
  double v16 = [(SSUICursorViewController *)self cursorView];
  [v15 addSubview:v16];

  double v17 = [(SSUICursorViewController *)self view];
  double v18 = [(SSUICursorViewController *)self slateView];
  [v17 addSubview:v18];

  double v19 = [(SSUICursorViewController *)self view];
  double v20 = [(SSUICursorViewController *)self perUserView];
  [v19 addSubview:v20];

  double v21 = [(SSUICursorViewController *)self cursorView];
  [(SSUICursorViewController *)self setCurrentView:v21];

  v22.receiver = self;
  v22.super_class = (Class)SSUICursorViewController;
  [(SSUICursorViewController *)&v22 viewDidLoad];
}

- (void)tearDownViews
{
  id v3 = [(SSUICursorViewController *)self view];

  if (v3)
  {
    [(SSUICursorViewController *)self setCurrentView:0];
    id v4 = [(SSUICursorViewController *)self cursorView];
    [v4 removeFromSuperview];

    [(SSUICursorViewController *)self setCursorView:0];
    id v5 = [(SSUICursorViewController *)self slateView];
    [v5 removeFromSuperview];

    [(SSUICursorViewController *)self setSlateView:0];
    id v6 = [(SSUICursorViewController *)self perUserView];
    [v6 removeFromSuperview];

    [(SSUICursorViewController *)self setPerUserView:0];
    [(SSUICursorViewController *)self setView:0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIImage)arrowImage
{
  return (UIImage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setArrowImage:(id)a3
{
}

- (UIImage)leftarrowImage
{
  return (UIImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLeftarrowImage:(id)a3
{
}

- (UIImage)upArrowImage
{
  return (UIImage *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUpArrowImage:(id)a3
{
}

- (UIImage)downArrowImage
{
  return (UIImage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDownArrowImage:(id)a3
{
}

- (UIImage)currentArrowImage
{
  return (UIImage *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentArrowImage:(id)a3
{
}

- (int)currentColor
{
  return self->currentColor;
}

- (void)setCurrentColor:(int)a3
{
  self->currentColor = a3;
}

- (AXUIService)axuiService
{
  return self->_axuiService;
}

- (void)setAxuiService:(id)a3
{
  self->_axuiService = (AXUIService *)a3;
}

- (BOOL)annotationHiddenByLocalUser
{
  return self->_annotationHiddenByLocalUser;
}

- (void)setAnnotationHiddenByLocalUser:(BOOL)a3
{
  self->_annotationHiddenByLocalUser = a3;
}

- (NSMutableDictionary)annotationInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAnnotationInfo:(id)a3
{
}

- (SSUIAssistViewProtocol)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(id)a3
{
}

- (SSUICursorView)cursorView
{
  return self->_cursorView;
}

- (void)setCursorView:(id)a3
{
}

- (SSUISlateView)slateView
{
  return self->_slateView;
}

- (void)setSlateView:(id)a3
{
}

- (SSUIPerUserMasterView)perUserView
{
  return self->_perUserView;
}

- (void)setPerUserView:(id)a3
{
}

- (CGRect)cursorFrame
{
  double x = self->_cursorFrame.origin.x;
  double y = self->_cursorFrame.origin.y;
  double width = self->_cursorFrame.size.width;
  double height = self->_cursorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCursorFrame:(CGRect)a3
{
  self->_cursorFrame = a3;
}

- (CGPath)cursorPath
{
  return self->_cursorPath;
}

- (BOOL)flipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

- (BOOL)rotated
{
  return self->_rotated;
}

- (void)setRotated:(BOOL)a3
{
  self->_rotated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perUserView, 0);
  objc_storeStrong((id *)&self->_slateView, 0);
  objc_storeStrong((id *)&self->_cursorView, 0);
  objc_storeStrong((id *)&self->_currentView, 0);
  objc_storeStrong((id *)&self->_annotationInfo, 0);
  objc_storeStrong((id *)&self->currentArrowImage, 0);
  objc_storeStrong((id *)&self->downArrowImage, 0);
  objc_storeStrong((id *)&self->upArrowImage, 0);
  objc_storeStrong((id *)&self->leftarrowImage, 0);
  objc_storeStrong((id *)&self->arrowImage, 0);

  objc_storeStrong((id *)&self->blinker, 0);
}

@end