@interface VOTUICursorViewController
- (AXUIService)axuiService;
- (BOOL)_canShowWhileLocked;
- (BOOL)cursorHidden;
- (CGPath)cursorPath;
- (CGRect)convertFrameToCursorSpace:(CGRect)a3;
- (CGRect)cursorFrame;
- (VOTUICursorView)cursorView;
- (VOTUICursorViewController)initWithAXUIService:(id)a3;
- (void)_updateCursorFrameAnimated:(BOOL)a3;
- (void)_updateCursorPath;
- (void)dealloc;
- (void)setAxuiService:(id)a3;
- (void)setCursorFrame:(CGRect)a3;
- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setCursorHidden:(BOOL)a3;
- (void)setCursorPath:(CGPath *)a3;
- (void)setCursorView:(id)a3;
- (void)viewDidLoad;
@end

@implementation VOTUICursorViewController

- (VOTUICursorViewController)initWithAXUIService:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VOTUICursorViewController;
  v5 = [(VOTUICursorViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_axuiService, v4);
  }

  return v6;
}

- (void)dealloc
{
  cursorPath = self->_cursorPath;
  if (cursorPath)
  {
    CFRelease(cursorPath);
    self->_cursorPath = 0;
  }
  [(VOTUICursorViewController *)self setCursorView:0];
  [(VOTUICursorViewController *)self setView:0];
  v4.receiver = self;
  v4.super_class = (Class)VOTUICursorViewController;
  [(VOTUICursorViewController *)&v4 dealloc];
}

- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4
{
  self->_cursorFrame = a3;
  [(VOTUICursorViewController *)self _updateCursorFrameAnimated:a4];
}

- (void)_updateCursorFrameAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[VOTUICursorViewController convertFrameToCursorSpace:](self, "convertFrameToCursorSpace:", self->_cursorFrame.origin.x, self->_cursorFrame.origin.y, self->_cursorFrame.size.width, self->_cursorFrame.size.height);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(VOTUICursorViewController *)self cursorView];
  objc_msgSend(v13, "setCursorFrame:animated:", v3, v6, v8, v10, v12);
}

- (CGRect)convertFrameToCursorSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(VOTUICursorViewController *)self view];
  double v9 = [v8 window];
  objc_msgSend(v9, "_convertRectFromSceneReferenceSpace:", x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  +[VOTUICursorView resizeFrameForDisplay:](VOTUICursorView, "resizeFrameForDisplay:", v11, v13, v15, v17);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [(VOTUICursorViewController *)self cursorView];
  objc_msgSend(v26, "resizeFrameForWindow:", v19, v21, v23, v25);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  v35 = [(VOTUICursorViewController *)self view];
  objc_msgSend(v35, "convertRect:fromView:", 0, v28, v30, v32, v34);
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;

  double v44 = v37;
  double v45 = v39;
  double v46 = v41;
  double v47 = v43;
  result.size.double height = v47;
  result.size.double width = v46;
  result.origin.double y = v45;
  result.origin.double x = v44;
  return result;
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

  [(VOTUICursorViewController *)self _updateCursorPath];
}

- (void)_updateCursorPath
{
  if (self->_cursorPath)
  {
    BOOL v3 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:");
    objc_super v4 = [(VOTUICursorViewController *)self view];
    UIAccessibilitySceneReferencePathToScreenPathWithView();
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    double v5 = [(VOTUICursorViewController *)self view];
    UIAccessibilityPathForAccessibilityPath();
    id v6 = objc_claimAutoreleasedReturnValue();
    id v7 = [v6 CGPath];

    double v8 = [(VOTUICursorViewController *)self cursorView];
    [v8 setPath:v7];
  }
  else
  {
    id v9 = [(VOTUICursorViewController *)self cursorView];
    [v9 setPath:0];
  }
}

- (BOOL)cursorHidden
{
  v2 = [(VOTUICursorViewController *)self view];
  unsigned __int8 v3 = [v2 isHidden];

  return v3;
}

- (void)setCursorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VOTUICursorViewController *)self view];
  [v4 setHidden:v3];
}

- (void)viewDidLoad
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(VOTUICursorViewController *)self setView:v7];

  double v8 = -[VOTUICursorView initWithFrame:]([VOTUICursorView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(VOTUICursorViewController *)self setCursorView:v8];

  id v9 = [(VOTUICursorViewController *)self view];
  double v10 = [(VOTUICursorViewController *)self cursorView];
  [v9 addSubview:v10];

  v11.receiver = self;
  v11.super_class = (Class)VOTUICursorViewController;
  [(VOTUICursorViewController *)&v11 viewDidLoad];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXUIService)axuiService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axuiService);

  return (AXUIService *)WeakRetained;
}

- (void)setAxuiService:(id)a3
{
}

- (VOTUICursorView)cursorView
{
  return self->_cursorView;
}

- (void)setCursorView:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cursorView, 0);

  objc_destroyWeak((id *)&self->_axuiService);
}

@end