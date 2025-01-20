@interface AXAuditUIServer
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
- (AXAuditUICursorViewController)cursorViewController;
- (AXAuditUIServer)init;
- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (unint64_t)_highlightStyle;
- (void)_handleSetCursorFrameMessage:(id)a3;
- (void)_handleSetCursorFrameStyleMessage:(id)a3;
- (void)_removeCursorViewController;
- (void)dealloc;
- (void)setCursorViewController:(id)a3;
- (void)set_highlightStyle:(unint64_t)a3;
@end

@implementation AXAuditUIServer

- (AXAuditUIServer)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXAuditUIServer;
  return [(AXAuditUIServer *)&v3 init];
}

- (void)dealloc
{
  [(AXAuditUIServer *)self _removeCursorViewController];
  v3.receiver = self;
  v3.super_class = (Class)AXAuditUIServer;
  [(AXAuditUIServer *)&v3 dealloc];
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  if (a4 == 2)
  {
    [(AXAuditUIServer *)self _handleSetCursorFrameStyleMessage:v9];
  }
  else
  {
    if (a4 != 1) {
      abort();
    }
    [(AXAuditUIServer *)self _handleSetCursorFrameMessage:v9];
  }

  return 0;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  return @"com.apple.accessibility.axauditd";
}

- (void)_handleSetCursorFrameStyleMessage:(id)a3
{
  id v8 = [a3 objectForKey:@"frameStyle"];
  -[AXAuditUIServer set_highlightStyle:](self, "set_highlightStyle:", [v8 integerValue]);
  v4 = [(AXAuditUIServer *)self cursorViewController];

  if (v4)
  {
    unint64_t v5 = [(AXAuditUIServer *)self _highlightStyle];
    v6 = [(AXAuditUIServer *)self cursorViewController];
    [v6 setHighlightStyle:v5];
  }
  v7 = [(AXAuditUIServer *)self cursorViewController];
  objc_msgSend(v7, "setHighlightStyle:", objc_msgSend(v8, "integerValue"));
}

- (void)_handleSetCursorFrameMessage:(id)a3
{
  id v21 = a3;
  v4 = [v21 objectForKey:@"frame"];
  unint64_t v5 = v4;
  if (v4)
  {
    CGRect v23 = CGRectFromString(v4);
    double x = v23.origin.x;
    double y = v23.origin.y;
    double width = v23.size.width;
    double height = v23.size.height;
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  id v10 = [v21 objectForKey:@"path"];
  if (v10) {
    v11 = (const void *)AX_CGPathCreateWithDataRepresentation();
  }
  else {
    v11 = 0;
  }
  v24.origin.double x = CGRectZero.origin.x;
  v24.origin.double y = CGRectZero.origin.y;
  v24.size.double width = CGRectZero.size.width;
  v24.size.double height = CGRectZero.size.height;
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  BOOL v12 = CGRectEqualToRect(v24, v25);
  v13 = [(AXAuditUIServer *)self cursorViewController];
  v14 = v13;
  if (v12 && v11 == 0)
  {

    if (v14) {
      [(AXAuditUIServer *)self _removeCursorViewController];
    }
  }
  else
  {

    if (!v14)
    {
      v16 = objc_alloc_init(AXAuditUICursorViewController);
      [(AXAuditUIServer *)self setCursorViewController:v16];

      v17 = +[AXUIDisplayManager sharedDisplayManager];
      v18 = [(AXAuditUIServer *)self cursorViewController];
      [v17 addContentViewController:v18 withUserInteractionEnabled:0 forService:self];
    }
    v19 = [(AXAuditUIServer *)self cursorViewController];
    objc_msgSend(v19, "setCursorFrame:", x, y, width, height);
    [v19 setCursorPath:v11];
    objc_msgSend(v19, "setHighlightStyle:", -[AXAuditUIServer _highlightStyle](self, "_highlightStyle"));
    if (v11) {
      CFRelease(v11);
    }
    v20 = [(AXAuditUIServer *)self cursorViewController];
    [v20 setCursorHidden:0];
  }
}

- (void)_removeCursorViewController
{
  objc_super v3 = [(AXAuditUIServer *)self cursorViewController];
  [v3 setCursorHidden:1];

  v4 = +[AXUIDisplayManager sharedDisplayManager];
  unint64_t v5 = [(AXAuditUIServer *)self cursorViewController];
  [v4 removeContentViewController:v5 withUserInteractionEnabled:0 forService:self];

  [(AXAuditUIServer *)self setCursorViewController:0];
}

- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4
{
  return 10000013.0;
}

- (AXAuditUICursorViewController)cursorViewController
{
  return self->_cursorViewController;
}

- (void)setCursorViewController:(id)a3
{
}

- (unint64_t)_highlightStyle
{
  return self->__highlightStyle;
}

- (void)set_highlightStyle:(unint64_t)a3
{
  self->__highlightStyle = a3;
}

- (void).cxx_destruct
{
}

@end