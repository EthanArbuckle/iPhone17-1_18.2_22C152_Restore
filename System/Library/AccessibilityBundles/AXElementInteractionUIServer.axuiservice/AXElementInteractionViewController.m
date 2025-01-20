@interface AXElementInteractionViewController
- (AXElementInteractionCursorView)cursorView;
- (void)_updateCursorPath;
- (void)loadView;
- (void)setCursorFrame:(CGRect)a3;
- (void)setCursorHidden:(BOOL)a3;
- (void)setCursorPath:(CGPath *)a3;
- (void)setCursorView:(id)a3;
@end

@implementation AXElementInteractionViewController

- (void)setCursorFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(AXElementInteractionViewController *)self view];
  v9 = [v8 window];
  objc_msgSend(v9, "_convertRectFromSceneReferenceSpace:", x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v18 = [(AXElementInteractionViewController *)self view];
  objc_msgSend(v18, "convertRect:fromView:", 0, v11, v13, v15, v17);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  +[AXElementInteractionCursorView resizeFrameForDisplay:](AXElementInteractionCursorView, "resizeFrameForDisplay:", v20, v22, v24, v26);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  id v35 = [(AXElementInteractionViewController *)self cursorView];
  objc_msgSend(v35, "setCursorFrame:", v28, v30, v32, v34);
}

- (void)setCursorPath:(CGPath *)a3
{
  cursorPath = self->_cursorPath;
  if (a3) {
    v5 = (CGPath *)CFRetain(a3);
  }
  else {
    v5 = 0;
  }
  self->_cursorPath = v5;
  if (cursorPath) {
    CFRelease(cursorPath);
  }

  [(AXElementInteractionViewController *)self _updateCursorPath];
}

- (void)_updateCursorPath
{
  if (self->_cursorPath)
  {
    v3 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:");
    UIAccessibilitySceneReferencePathToScreenPath();
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    v4 = [(AXElementInteractionViewController *)self view];
    UIAccessibilityPathForAccessibilityPath();
    id v5 = objc_claimAutoreleasedReturnValue();
    id v6 = [v5 CGPath];

    v7 = [(AXElementInteractionViewController *)self cursorView];
    [v7 setPath:v6];
  }
}

- (void)setCursorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AXElementInteractionViewController *)self view];
  [v4 setHidden:v3];
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)AXElementInteractionViewController;
  [(AXElementInteractionViewController *)&v12 loadView];
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(AXElementInteractionViewController *)self setView:v7];

  id v8 = -[AXElementInteractionCursorView initWithFrame:]([AXElementInteractionCursorView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(AXElementInteractionViewController *)self setCursorView:v8];

  v9 = [(AXElementInteractionViewController *)self view];
  double v10 = [(AXElementInteractionViewController *)self cursorView];
  [v9 addSubview:v10];

  double v11 = [(AXElementInteractionViewController *)self cursorView];
  NSLog(@"load view: %@", v11);
}

- (AXElementInteractionCursorView)cursorView
{
  return self->_cursorView;
}

- (void)setCursorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end