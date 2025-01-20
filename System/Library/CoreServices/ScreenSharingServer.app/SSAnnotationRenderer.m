@interface SSAnnotationRenderer
+ (id)sharedRenderer;
- (AXUIClient)uiClient;
- (BOOL)hideAllPointers;
- (BOOL)hidePointerForUser:(id)a3;
- (BOOL)showAllPointers;
- (BOOL)showPointerForUser:(id)a3 location:(CGPoint)a4;
- (CGPoint)convertScaledCoordinates:(CGPoint)a3;
- (NSMutableDictionary)queuedMessage;
- (SSAnnotationRenderer)init;
- (UIScreen)mainScreen;
- (void)dealloc;
- (void)drawPointerWithRect:(CGRect)a3 flags:(unsigned int)a4;
- (void)drawSafeViewSlateWithRect:(CGRect)a3 flags:(unsigned int)a4 orientation:(int64_t)a5;
- (void)handleSafeViewAnnotation:(CGPoint)a3 flags:(unsigned int)a4 orientation:(int64_t)a5;
- (void)screenDidChange:(id)a3;
- (void)setMainScreen:(id)a3;
- (void)setQueuedMessage:(id)a3;
- (void)setUiClient:(id)a3;
- (void)stopAnnotation;
@end

@implementation SSAnnotationRenderer

+ (id)sharedRenderer
{
  if (qword_10005C940 != -1) {
    dispatch_once(&qword_10005C940, &stru_100054DE8);
  }
  v2 = (void *)qword_10005C948;

  return v2;
}

- (SSAnnotationRenderer)init
{
  v14.receiver = self;
  v14.super_class = (Class)SSAnnotationRenderer;
  v2 = [(SSAnnotationRenderer *)&v14 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)AXUIClient) initWithIdentifier:@"SSAXUIClientIdentifier" serviceBundleName:@"ScreenSharing"];
    [(SSAnnotationRenderer *)v2 setUiClient:v3];
    [v3 setDelegate:v2];
    v2->assistanceState = 0;
    v4 = +[NSThread currentThread];
    v5 = +[NSThread mainThread];

    if (v4 == v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mainScreen init main", buf, 2u);
      }
      v7 = +[UIScreen mainScreen];
      [(SSAnnotationRenderer *)v2 setMainScreen:v7];
    }
    else
    {
      dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100033A68;
      v10[3] = &unk_100054E10;
      v11 = v2;
      dispatch_semaphore_t v12 = v6;
      v7 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
      dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    }
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"screenDidChange:" name:UIScreenModeDidChangeNotification object:0];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "##$finished init", buf, 2u);
    }
  }
  return v2;
}

- (BOOL)showPointerForUser:(id)a3 location:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = +[NSMutableDictionary dictionary];
  v9 = +[NSNumber numberWithUnsignedShort:2];
  [v8 setObject:v9 forKeyedSubscript:@"messageType"];

  -[SSAnnotationRenderer convertScaledCoordinates:](self, "convertScaledCoordinates:", x, y);
  double v11 = v10;
  double v13 = v12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v14 = [v7 userID];
    v15 = [v7 displayName];
    int v22 = 138413058;
    v23 = v14;
    __int16 v24 = 2112;
    v25 = v15;
    __int16 v26 = 2048;
    double v27 = v11;
    __int16 v28 = 2048;
    double v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "showPointerForUser %@ %@ at %f %f ", (uint8_t *)&v22, 0x2Au);
  }
  v16 = +[NSNumber numberWithDouble:v11];
  [v8 setObject:v16 forKeyedSubscript:@"x"];

  v17 = +[NSNumber numberWithDouble:v13];
  [v8 setObject:v17 forKeyedSubscript:@"y"];

  v18 = [v7 userID];
  [v8 setObject:v18 forKeyedSubscript:@"uniqueID"];

  v19 = [v7 displayName];
  [v8 setObject:v19 forKeyedSubscript:@"displayName"];

  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"enabled"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "going to send show message", (uint8_t *)&v22, 2u);
  }
  v20 = [(SSAnnotationRenderer *)self uiClient];
  [v20 sendAsynchronousMessage:v8 withIdentifier:1 targetAccessQueue:0 completion:&stru_100054E50];

  return 0;
}

- (BOOL)hidePointerForUser:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v4 userID];
    dispatch_semaphore_t v6 = [v4 displayName];
    int v12 = 138412546;
    double v13 = v5;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "hidePointerForUser %@ %@", (uint8_t *)&v12, 0x16u);
  }
  id v7 = +[NSMutableDictionary dictionary];
  v8 = +[NSNumber numberWithUnsignedShort:2];
  [v7 setObject:v8 forKeyedSubscript:@"messageType"];

  v9 = [v4 userID];
  [v7 setObject:v9 forKeyedSubscript:@"uniqueID"];

  [v7 setObject:&__kCFBooleanFalse forKeyedSubscript:@"enabled"];
  double v10 = [(SSAnnotationRenderer *)self uiClient];
  [v10 sendAsynchronousMessage:v7 withIdentifier:1 targetAccessQueue:0 completion:0];

  return 0;
}

- (BOOL)hideAllPointers
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "hideAllPointers", v7, 2u);
  }
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithUnsignedShort:3];
  [v3 setObject:v4 forKeyedSubscript:@"messageType"];

  v5 = [(SSAnnotationRenderer *)self uiClient];
  [v5 sendAsynchronousMessage:v3 withIdentifier:1 targetAccessQueue:0 completion:0];

  return 0;
}

- (BOOL)showAllPointers
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "showAllPointers", v7, 2u);
  }
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithUnsignedShort:4];
  [v3 setObject:v4 forKeyedSubscript:@"messageType"];

  v5 = [(SSAnnotationRenderer *)self uiClient];
  [v5 sendAsynchronousMessage:v3 withIdentifier:1 targetAccessQueue:0 completion:0];

  return 0;
}

- (void)stopAnnotation
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_semaphore_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "stopAnnotation", v6, 2u);
  }
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithUnsignedShort:5];
  [v3 setObject:v4 forKeyedSubscript:@"messageType"];

  v5 = [(SSAnnotationRenderer *)self uiClient];
  [v5 sendAsynchronousMessage:v3 withIdentifier:1 targetAccessQueue:0 completion:0];
}

- (CGPoint)convertScaledCoordinates:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  dispatch_semaphore_t v6 = [(SSAnnotationRenderer *)self mainScreen];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v38.origin.double x = v8;
  v38.origin.double y = v10;
  v38.size.width = v12;
  v38.size.height = v14;
  v15 = NSStringFromRect(v38);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v15 UTF8String];
    v17 = [(SSAnnotationRenderer *)self mainScreen];
    [v17 scale];
    uint64_t v19 = v18;
    v20 = [(SSAnnotationRenderer *)self mainScreen];
    v21 = [v20 currentMode];
    [v21 size];
    uint64_t v23 = v22;
    __int16 v24 = [(SSAnnotationRenderer *)self mainScreen];
    v25 = [v24 currentMode];
    [v25 size];
    int v29 = 136315906;
    id v30 = v16;
    __int16 v31 = 2048;
    uint64_t v32 = v19;
    __int16 v33 = 2048;
    uint64_t v34 = v23;
    __int16 v35 = 2048;
    uint64_t v36 = v26;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screenRect: %s, scale: %f, modesize: (%f, %f)", (uint8_t *)&v29, 0x2Au);
  }
  double v27 = floor(x * (v12 + -1.0));
  double v28 = floor(y * (v14 + -1.0));
  result.double y = v28;
  result.double x = v27;
  return result;
}

- (void)drawPointerWithRect:(CGRect)a3 flags:(unsigned int)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "drawSafeViewPointerWithRect", buf, 2u);
  }
  CGFloat v10 = +[NSMutableDictionary dictionary];
  double v11 = +[NSNumber numberWithUnsignedShort:1];
  [v10 setObject:v11 forKeyedSubscript:@"messageType"];

  [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:@"animate"];
  v28.origin.CGFloat x = CGRectZero.origin.x;
  v28.origin.CGFloat y = CGRectZero.origin.y;
  v28.size.CGFloat width = CGRectZero.size.width;
  v28.size.CGFloat height = CGRectZero.size.height;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  BOOL v12 = CGRectEqualToRect(v28, v31);
  if (a4) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v12;
  }
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v14 = "SS going to hide the data";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
  }
  else
  {
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    CGPathRef v15 = CGPathCreateWithRect(v29, &CGAffineTransformIdentity);
    if (v15)
    {
      id v16 = (const void *)AX_CGPathCopyDataRepresentation();
      CFRelease(v15);
      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v14 = "SS did not get path data";
      goto LABEL_13;
    }
  }
  id v16 = 0;
LABEL_15:
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  v17 = NSStringFromRect(v30);
  [v10 setObject:v17 forKeyedSubscript:@"frame"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v17 UTF8String];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "rect: %s", buf, 0xCu);
  }
  if (v16)
  {
    [v10 setObject:v16 forKeyedSubscript:@"path"];
    CFRelease(v16);
  }
  uint64_t v19 = +[NSNumber numberWithUnsignedInteger:a4];
  [v10 setObject:v19 forKeyedSubscript:@"flags"];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v17 UTF8String];
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "rect: %s, flags: %x", buf, 0x12u);
  }
  int v21 = 0;
  if ((a4 & 0x80000000) != 0)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    BOOL v27 = 0;
    atomic_compare_exchange_strong(&self->assistanceState, (unsigned int *)&v21, 1u);
    BOOL v27 = v21 == 0;
    uint64_t v23 = [(SSAnnotationRenderer *)self uiClient];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100034928;
    v25[3] = &unk_100054E78;
    v25[4] = self;
    v25[5] = buf;
    [v23 sendAsynchronousMessage:v10 withIdentifier:2 targetAccessQueue:0 completion:v25];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    atomic_compare_exchange_strong(&self->assistanceState, (unsigned int *)&v21, 1u);
    if (v21)
    {
      [(SSAnnotationRenderer *)self setQueuedMessage:v10];
    }
    else
    {
      uint64_t v22 = [(SSAnnotationRenderer *)self uiClient];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10003494C;
      v24[3] = &unk_100054EC8;
      v24[4] = self;
      [v22 sendAsynchronousMessage:v10 withIdentifier:1 targetAccessQueue:0 completion:v24];
    }
  }
}

- (void)handleSafeViewAnnotation:(CGPoint)a3 flags:(unsigned int)a4 orientation:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  if (!a4 && a3.x == 0.0 && a3.y == 0.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SS hide ptr", (uint8_t *)v27, 2u);
    }
    double v10 = CGRectZero.origin.x;
    double v11 = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    double v14 = self;
    uint64_t v15 = 0;
LABEL_25:
    -[SSAnnotationRenderer drawPointerWithRect:flags:](v14, "drawPointerWithRect:flags:", v15, v10, v11, width, height);
    return;
  }
  id v16 = [(SSAnnotationRenderer *)self mainScreen];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;

  unint64_t v21 = a5 & 0xFFFFFFFFFFFFFFFELL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v27[0] = 67109120;
    v27[1] = v21 == 2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "landscape:%d", (uint8_t *)v27, 8u);
  }
  if (v21 == 2) {
    double v22 = v18;
  }
  else {
    double v22 = v20;
  }
  if (v21 != 2) {
    double v20 = v18;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "new coords", (uint8_t *)v27, 2u);
  }
  double v23 = floor(x * (v20 + -1.0) / 100.0);
  double v24 = floor(y * (v22 + -1.0) / 100.0);
  if ((v6 & 7) != 3)
  {
    if (v18 >= 768.0) {
      int v26 = 66;
    }
    else {
      int v26 = 44;
    }
    double width = (double)v26;
    double v10 = v23 - (double)v26;
    double v11 = v24 - (double)(v26 >> 1);
    double v14 = self;
    double height = (double)v26;
    uint64_t v15 = v6;
    goto LABEL_25;
  }
  if (v18 >= 768.0) {
    int v25 = 33;
  }
  else {
    int v25 = 22;
  }
  -[SSAnnotationRenderer drawSafeViewSlateWithRect:flags:orientation:](self, "drawSafeViewSlateWithRect:flags:orientation:", v6, a5, v23 - (double)v25, v24 - (double)(v25 >> 1), (double)v25, (double)v25);
}

- (void)drawSafeViewSlateWithRect:(CGRect)a3 flags:(unsigned int)a4 orientation:(int64_t)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BOOL v12 = +[NSMutableDictionary dictionary];
  BOOL v13 = +[NSNumber numberWithUnsignedShort:1];
  [v12 setObject:v13 forKeyedSubscript:@"messageType"];

  [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:@"animate"];
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGPathRef v14 = CGPathCreateWithRect(v29, &CGAffineTransformIdentity);
  if (v14)
  {
    CGPathRef v15 = v14;
    id v16 = (const void *)AX_CGPathCopyDataRepresentation();
    CFRelease(v15);
  }
  else
  {
    id v16 = 0;
  }
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double v17 = NSStringFromRect(v30);
  [v12 setObject:v17 forKeyedSubscript:@"frame"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315394;
    id v26 = [v17 UTF8String];
    __int16 v27 = 1024;
    unsigned int v28 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "rect: %s, flags: %x", (uint8_t *)&v25, 0x12u);
  }
  if (v16)
  {
    [v12 setObject:v16 forKeyedSubscript:@"path"];
    CFRelease(v16);
  }
  double v18 = +[NSNumber numberWithUnsignedInteger:a4];
  [v12 setObject:v18 forKeyedSubscript:@"flags"];

  double v19 = +[NSNumber numberWithInteger:a5];
  [v12 setObject:v19 forKeyedSubscript:@"orientation"];

  double v20 = [(SSAnnotationRenderer *)self uiClient];
  unint64_t v21 = v20;
  if ((a4 & 0x20000000) != 0)
  {
    double v22 = &stru_100054EE8;
    double v23 = v12;
    uint64_t v24 = 2;
  }
  else
  {
    double v22 = &stru_100054F08;
    double v23 = v12;
    uint64_t v24 = 1;
  }
  [v20 sendAsynchronousMessage:v23 withIdentifier:v24 targetAccessQueue:0 completion:v22];
}

- (void)screenDidChange:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screenDidChange", v5, 2u);
  }
  id v4 = +[UIScreen mainScreen];
  [(SSAnnotationRenderer *)self setMainScreen:v4];
}

- (void)dealloc
{
  [(SSAnnotationRenderer *)self setUiClient:0];
  [(SSAnnotationRenderer *)self setQueuedMessage:0];
  [(SSAnnotationRenderer *)self setMainScreen:0];
  v3.receiver = self;
  v3.super_class = (Class)SSAnnotationRenderer;
  [(SSAnnotationRenderer *)&v3 dealloc];
}

- (AXUIClient)uiClient
{
  return self->_uiClient;
}

- (void)setUiClient:(id)a3
{
}

- (NSMutableDictionary)queuedMessage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueuedMessage:(id)a3
{
}

- (UIScreen)mainScreen
{
  return (UIScreen *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMainScreen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainScreen, 0);
  objc_storeStrong((id *)&self->_queuedMessage, 0);

  objc_storeStrong((id *)&self->_uiClient, 0);
}

@end