@interface SSUIServer
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
- (SSUICursorViewController)cursorViewController;
- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)_handleSetCursorFrameMessage:(id)a3;
- (void)_handleShowBrailleUIMessage:(id)a3;
- (void)_removeCursorViewController;
- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3;
- (void)dealloc;
- (void)setCursorViewController:(id)a3;
@end

@implementation SSUIServer

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  return @"com.apple.screensharing.accessibility";
}

- (void)dealloc
{
  [(SSUIServer *)self _removeCursorViewController];
  v3.receiver = self;
  v3.super_class = (Class)SSUIServer;
  [(SSUIServer *)&v3 dealloc];
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v9 description];
    *(_DWORD *)buf = 136315138;
    id v21 = [v11 UTF8String];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "##process message %s", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v21 = (id)a4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "messageIdentifier %lu", buf, 0xCu);
  }
  if (a4 == 9)
  {
    v12 = [(SSUIServer *)self cursorViewController];
    v13 = [v12 view];
    v14 = [v13 window];
    v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 _contextId]);

    CFStringRef v18 = @"contextId";
    v19 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  }
  else
  {
    if (a4 == 2)
    {
      [(SSUIServer *)self _handleShowBrailleUIMessage:v9];
    }
    else
    {
      if (a4 != 1) {
        sub_A7D4();
      }
      [(SSUIServer *)self _handleSetCursorFrameMessage:v9];
    }
    v16 = 0;
  }

  return v16;
}

- (void)_handleSetCursorFrameMessage:(id)a3
{
  id v4 = a3;
  v5 = [(SSUIServer *)self cursorViewController];

  if (!v5)
  {
    v6 = objc_alloc_init(SSUICursorViewController);
    [(SSUIServer *)self setCursorViewController:v6];

    v7 = +[AXUIDisplayManager sharedDisplayManager];
    v8 = [(SSUIServer *)self cursorViewController];
    [v7 addContentViewController:v8 withUserInteractionEnabled:0 forService:self];
  }
  id v9 = [(SSUIServer *)self cursorViewController];
  [v9 handleSetCursorFrameMessage:v4];
}

- (void)_handleShowBrailleUIMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(SSUIServer *)self cursorViewController];
  [v5 handleAlternateMessage:v4];
}

- (void)_removeCursorViewController
{
  objc_super v3 = [(SSUIServer *)self cursorViewController];
  [v3 setCursorHidden:1];

  id v4 = +[AXUIDisplayManager sharedDisplayManager];
  id v5 = [(SSUIServer *)self cursorViewController];
  [v4 removeContentViewController:v5 withUserInteractionEnabled:0 forService:self];

  [(SSUIServer *)self setCursorViewController:0];
}

- (void)connectionWillBeInterruptedForClientWithIdentifier:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7A98;
  block[3] = &unk_103D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4
{
  return 10000013.0;
}

- (SSUICursorViewController)cursorViewController
{
  return self->_cursorViewController;
}

- (void)setCursorViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end