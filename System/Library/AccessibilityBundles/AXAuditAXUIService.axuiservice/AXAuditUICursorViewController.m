@interface AXAuditUICursorViewController
- (AXAuditUICursorView)cursorView;
- (AXAuditUICursorViewController)initWithAXUIService:(id)a3;
- (AXUIService)axuiService;
- (BOOL)_canShowWhileLocked;
- (CGPath)cursorPath;
- (CGRect)cursorFrame;
- (unint64_t)highlightStyle;
- (void)_updateCursorFrame;
- (void)_updateCursorPath;
- (void)setAxuiService:(id)a3;
- (void)setCursorFrame:(CGRect)a3;
- (void)setCursorHidden:(BOOL)a3;
- (void)setCursorPath:(CGPath *)a3;
- (void)setCursorView:(id)a3;
- (void)setHighlightStyle:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation AXAuditUICursorViewController

- (AXAuditUICursorViewController)initWithAXUIService:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXAuditUICursorViewController;
  result = [(AXAuditUICursorViewController *)&v5 initWithNibName:0 bundle:0];
  if (result) {
    result->_axuiService = (AXUIService *)a3;
  }
  return result;
}

- (void)setHighlightStyle:(unint64_t)a3
{
  self->_highlightStyle = a3;
  id v4 = [(AXAuditUICursorViewController *)self cursorView];
  [v4 setHighlightStyle:a3];
}

- (void)setCursorFrame:(CGRect)a3
{
  self->_cursorFrame.origin.x = round(a3.origin.x);
  self->_cursorFrame.origin.y = round(a3.origin.y);
  self->_cursorFrame.size.width = round(a3.size.width);
  self->_cursorFrame.size.height = round(a3.size.height);
  [(AXAuditUICursorViewController *)self _updateCursorFrame];
}

- (void)_updateCursorFrame
{
  [(AXAuditUICursorViewController *)self cursorFrame];
  +[AXAuditUICursorView resizeFrameForDisplay:](AXAuditUICursorView, "resizeFrameForDisplay:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(AXAuditUICursorViewController *)self view];
  v12 = [v11 window];
  objc_msgSend(v12, "_convertRectFromSceneReferenceSpace:", v4, v6, v8, v10);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v21 = [(AXAuditUICursorViewController *)self cursorView];
  objc_msgSend(v21, "resizeFrameForWindow:", v14, v16, v18, v20);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  v30 = [(AXAuditUICursorViewController *)self view];
  objc_msgSend(v30, "convertRect:fromView:", 0, v23, v25, v27, v29);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  id v39 = [(AXAuditUICursorViewController *)self cursorView];
  objc_msgSend(v39, "setCursorFrame:", v32, v34, v36, v38);
}

- (void)setCursorPath:(CGPath *)a3
{
  self->_cursorPath = a3;
  [(AXAuditUICursorViewController *)self _updateCursorPath];
}

- (void)_updateCursorPath
{
  if ([(AXAuditUICursorViewController *)self cursorPath])
  {
    double v3 = +[UIBezierPath bezierPathWithCGPath:[(AXAuditUICursorViewController *)self cursorPath]];
    UIAccessibilitySceneReferencePathToScreenPath();
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    double v4 = [(AXAuditUICursorViewController *)self view];
    UIAccessibilityPathForAccessibilityPath();
    id v5 = objc_claimAutoreleasedReturnValue();
    id v6 = [v5 CGPath];

    double v7 = [(AXAuditUICursorViewController *)self cursorView];
    [v7 setPath:v6];
  }
  else
  {
    id v8 = [(AXAuditUICursorViewController *)self cursorView];
    [v8 setPath:0];
  }
}

- (void)setCursorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AXAuditUICursorViewController *)self view];
  [v4 setHidden:v3];
}

- (void)viewDidLoad
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(AXAuditUICursorViewController *)self setView:v7];

  id v8 = -[AXAuditUICursorView initWithFrame:]([AXAuditUICursorView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(AXAuditUICursorViewController *)self setCursorView:v8];

  double v9 = [(AXAuditUICursorViewController *)self view];
  double v10 = [(AXAuditUICursorViewController *)self cursorView];
  [v9 addSubview:v10];

  v11.receiver = self;
  v11.super_class = (Class)AXAuditUICursorViewController;
  [(AXAuditUICursorViewController *)&v11 viewDidLoad];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXUIService)axuiService
{
  return self->_axuiService;
}

- (void)setAxuiService:(id)a3
{
  self->_axuiService = (AXUIService *)a3;
}

- (unint64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (AXAuditUICursorView)cursorView
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

- (CGPath)cursorPath
{
  return self->_cursorPath;
}

- (void).cxx_destruct
{
}

@end