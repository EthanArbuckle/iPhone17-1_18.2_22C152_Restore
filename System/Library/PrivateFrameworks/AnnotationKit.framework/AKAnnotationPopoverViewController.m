@interface AKAnnotationPopoverViewController
- (AKAnnotation)annotation;
- (AKAnnotationEditorDelegate)delegate;
- (AKAnnotationPopoverViewController)init;
- (AKAnnotationTheme)annotationTheme;
- (AKPageController)annotationPageController;
- (BOOL)canPresentInPosition:(int)a3;
- (BOOL)editsOnLaunch;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGRect)p_containerFrameForView:(id)a3;
- (CGRect)presentationRect;
- (UIView)presentationView;
- (int)position;
- (int)willPresentInPosition:(CGRect)a3 view:(id)a4;
- (void)dealloc;
- (void)didHide;
- (void)didReceiveMemoryWarning;
- (void)didShow;
- (void)hide;
- (void)presentFromRect:(CGRect)a3 view:(id)a4;
- (void)setAnnotation:(id)a3;
- (void)setAnnotationPageController:(id)a3;
- (void)setAnnotationTheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditsOnLaunch:(BOOL)a3;
- (void)setPosition:(int)a3;
- (void)setPresentationRect:(CGRect)a3;
- (void)setPresentationView:(id)a3;
- (void)viewDidLoad;
- (void)willHide;
- (void)willShow;
@end

@implementation AKAnnotationPopoverViewController

- (AKAnnotationPopoverViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)AKAnnotationPopoverViewController;
  result = [(AKAnnotationPopoverViewController *)&v4 init];
  if (result)
  {
    CGSize v3 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    result->_presentationRect.origin = (CGPoint)*MEMORY[0x263F001A0];
    result->_presentationRect.size = v3;
  }
  return result;
}

- (void)dealloc
{
  [(AKAnnotationPopoverViewController *)self releaseOutlets];
  v3.receiver = self;
  v3.super_class = (Class)AKAnnotationPopoverViewController;
  [(AKAnnotationPopoverViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AKAnnotationPopoverViewController;
  [(AKAnnotationPopoverViewController *)&v4 viewDidLoad];
  objc_super v3 = [(AKAnnotationPopoverViewController *)self view];
  [v3 setUserInteractionEnabled:1];
}

- (void)didReceiveMemoryWarning
{
  [(AKAnnotationPopoverViewController *)self releaseOutlets];
  v3.receiver = self;
  v3.super_class = (Class)AKAnnotationPopoverViewController;
  [(AKAnnotationPopoverViewController *)&v3 didReceiveMemoryWarning];
}

- (BOOL)canPresentInPosition:(int)a3
{
  return a3 == 0;
}

- (CGRect)p_containerFrameForView:(id)a3
{
  id v4 = a3;
  v5 = [(AKAnnotationPopoverViewController *)self traitCollection];
  v6 = [MEMORY[0x263F1CB00] traitCollectionWithVerticalSizeClass:1];
  int v7 = [v5 containsTraitsInCollection:v6];

  if (v7) {
    double v8 = 12.0;
  }
  else {
    double v8 = 44.0;
  }
  [v4 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  CGRect result = CGRectInset(v19, 20.0, 20.0);
  double v17 = v8 + result.origin.y;
  double v18 = result.size.height - v8;
  result.size.height = v18;
  result.origin.y = v17;
  return result;
}

- (int)willPresentInPosition:(CGRect)a3 view:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  CGFloat v10 = [(AKAnnotationPopoverViewController *)self view];
  [v10 bounds];
  CGFloat v29 = v12;
  CGFloat v30 = v11;
  CGFloat v27 = v14;
  CGFloat v28 = v13;

  [(AKAnnotationPopoverViewController *)self p_containerFrameForView:v9];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v31.origin.CGFloat x = v16;
  v31.origin.CGFloat y = v18;
  v31.size.CGFloat width = v20;
  v31.size.CGFloat height = v22;
  double MinY = CGRectGetMinY(v31);
  v32.origin.CGFloat y = v29;
  v32.origin.CGFloat x = v30;
  v32.size.CGFloat height = v27;
  v32.size.CGFloat width = v28;
  CGFloat v24 = MinY + CGRectGetHeight(v32) + 2.0;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGRectGetMinX(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRectGetWidth(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  if (CGRectGetMinY(v35) >= v24) {
    return 0;
  }
  int v25 = 1;
  if (![(AKAnnotationPopoverViewController *)self canPresentInPosition:1]) {
    return 0;
  }
  return v25;
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  id v5 = a4;
  [(AKAnnotationPopoverViewController *)self setPresentationView:v5];
  v6 = [(AKAnnotationPopoverViewController *)self view];
  [v6 setAlpha:0.0];

  int v7 = [(AKAnnotationPopoverViewController *)self view];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat rect = v12;
  CGFloat v15 = v14;

  [(AKAnnotationPopoverViewController *)self p_containerFrameForView:v5];
  CGFloat x = v57.origin.x;
  CGFloat y = v57.origin.y;
  CGFloat width = v57.size.width;
  CGFloat height = v57.size.height;
  double MinX = CGRectGetMinX(v57);
  v58.origin.CGFloat x = v9;
  v58.origin.CGFloat y = v11;
  v58.size.CGFloat width = v13;
  v58.size.CGFloat height = v15;
  double v51 = CGRectGetWidth(v58);
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.CGFloat width = width;
  v59.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v59);
  v60.origin.CGFloat x = v9;
  v60.origin.CGFloat y = v11;
  v60.size.CGFloat width = v13;
  v60.size.CGFloat height = v15;
  double v49 = CGRectGetWidth(v60);
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v61);
  CGFloat v46 = v9;
  v62.origin.CGFloat x = v9;
  v62.origin.CGFloat y = v11;
  v62.size.CGFloat width = rect;
  v62.size.CGFloat height = v15;
  double v21 = MinY + CGRectGetHeight(v62) + 2.0;
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  CGFloat v44 = width;
  CGFloat v45 = height;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v63);
  double v48 = CGRectGetMinX(a3);
  double v47 = CGRectGetWidth(a3);
  double v23 = CGRectGetMinY(a3);
  if (v23 < v21 && [(AKAnnotationPopoverViewController *)self canPresentInPosition:1])
  {
    [(AKAnnotationPopoverViewController *)self setPosition:1];
    double v23 = CGRectGetMaxY(a3);
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = v44;
    v64.size.CGFloat height = height;
    double v21 = CGRectGetMinY(v64) + 2.0;
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = v44;
    v65.size.CGFloat height = height;
    double v24 = CGRectGetMaxY(v65);
    v66.origin.CGFloat y = v11;
    v66.origin.CGFloat x = v46;
    v66.size.CGFloat width = rect;
    v66.size.CGFloat height = v15;
    double MaxY = v24 - CGRectGetHeight(v66);
  }
  else
  {
    -[AKAnnotationPopoverViewController setPosition:](self, "setPosition:", 0, *(void *)&v44, *(void *)&height);
  }
  double v25 = v48 + v47 * 0.5;
  double v26 = MaxX - (v49 * 0.5 + 2.0);
  if (v25 <= v26) {
    double v26 = v48 + v47 * 0.5;
  }
  if (v25 >= MinX + v51 * 0.5 + 2.0) {
    double v27 = v26;
  }
  else {
    double v27 = MinX + v51 * 0.5 + 2.0;
  }
  if (v23 <= MaxY + -2.0) {
    double v28 = v23;
  }
  else {
    double v28 = MaxY + -2.0;
  }
  if (v23 >= v21) {
    double v29 = v28;
  }
  else {
    double v29 = v21;
  }
  -[AKAnnotationPopoverViewController setPresentationRect:](self, "setPresentationRect:", v27 + -1.0, v29 + -1.0, 2.0, 2.0, *(void *)&v44, *(void *)&v45);
  int v30 = [(AKAnnotationPopoverViewController *)self position];
  CGRect v31 = [(AKAnnotationPopoverViewController *)self view];
  CGRect v32 = [v31 layer];
  CGRect v33 = v32;
  double v34 = 0.0;
  if (v30 != 1) {
    double v34 = 1.0;
  }
  objc_msgSend(v32, "setAnchorPoint:", 0.5, v34);

  CGRect v35 = [(AKAnnotationPopoverViewController *)self view];
  objc_msgSend(v35, "setCenter:", v27, v29);

  v36 = [(AKAnnotationPopoverViewController *)self view];
  [v36 frame];
  CGRect v68 = CGRectIntegral(v67);
  double v37 = v68.origin.x;
  double v38 = v68.origin.y;
  double v39 = v68.size.width;
  double v40 = v68.size.height;
  v41 = [(AKAnnotationPopoverViewController *)self view];
  objc_msgSend(v41, "setFrame:", v37, v38, v39, v40);

  v42 = [(AKAnnotationPopoverViewController *)self view];
  [v5 addSubview:v42];

  v43 = [(AKAnnotationPopoverViewController *)self view];
  [v43 setUserInteractionEnabled:0];

  [(AKAnnotationPopoverViewController *)self willShow];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = sub_2376B1B10;
  v56[3] = &unk_264CDAE40;
  v56[4] = self;
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = sub_2376B1B58;
  v55[3] = &unk_264CDB020;
  v55[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v56 animations:v55 completion:0.15];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAnnotationPopoverViewController *)self view];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v14 = [(AKAnnotationPopoverViewController *)self view];
  [v4 locationInView:v14];
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v21.origin.CGFloat x = v7;
  v21.origin.CGFloat y = v9;
  v21.size.CGFloat width = v11;
  v21.size.CGFloat height = v13;
  v20.CGFloat x = v16;
  v20.CGFloat y = v18;
  LOBYTE(v4) = !CGRectContainsPoint(v21, v20);

  return (char)v4;
}

- (void)willShow
{
  id v3 = [(AKAnnotationPopoverViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 willShowAnnotationEditor:self];
  }
}

- (void)didShow
{
  id v3 = [(AKAnnotationPopoverViewController *)self delegate];
  if (!self->mHideOnTouchGestureRecognizer)
  {
    id v4 = [AKTouchOutsideViewGestureRecognizer alloc];
    id v5 = [(AKAnnotationPopoverViewController *)self view];
    double v6 = [(AKTouchOutsideViewGestureRecognizer *)v4 initWithTarget:self action:sel_hide watchView:v5];
    mHideOnTouchGestureRecognizer = self->mHideOnTouchGestureRecognizer;
    self->mHideOnTouchGestureRecognizer = v6;

    double v8 = [(AKAnnotationPopoverViewController *)self view];
    CGFloat v9 = [v8 superview];
    [v9 addGestureRecognizer:self->mHideOnTouchGestureRecognizer];
  }
  if (!self->mObserver)
  {
    double v10 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v11 = qword_268923D58;
    double v12 = [MEMORY[0x263F08A48] mainQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_2376B1EA0;
    v17[3] = &unk_264CDBBD0;
    v17[4] = self;
    CGFloat v13 = [v10 addObserverForName:v11 object:0 queue:v12 usingBlock:v17];
    id mObserver = self->mObserver;
    self->id mObserver = v13;
  }
  if (objc_opt_respondsToSelector()) {
    [v3 didShowAnnotationEditor:self];
  }
  double v15 = [MEMORY[0x263F1C7B0] sharedMenuController];
  int v16 = [v15 isMenuVisible];

  if (v16) {
    [(AKAnnotationPopoverViewController *)self hide];
  }
}

- (void)willHide
{
  uint64_t v3 = [(AKAnnotationPopoverViewController *)self delegate];
  mHideOnTouchGestureRecognizer = self->mHideOnTouchGestureRecognizer;
  id v9 = (id)v3;
  if (mHideOnTouchGestureRecognizer)
  {
    id v5 = [(AKTouchOutsideViewGestureRecognizer *)mHideOnTouchGestureRecognizer view];
    [v5 removeGestureRecognizer:self->mHideOnTouchGestureRecognizer];

    double v6 = self->mHideOnTouchGestureRecognizer;
    self->mHideOnTouchGestureRecognizer = 0;

    uint64_t v3 = (uint64_t)v9;
  }
  if (self->mObserver)
  {
    CGFloat v7 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v3);
    [v7 removeObserver:self->mObserver name:qword_268923D58 object:0];

    id mObserver = self->mObserver;
    self->id mObserver = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v9 willHideAnnotationEditor:self];
  }
}

- (void)didHide
{
  id v5 = [(AKAnnotationPopoverViewController *)self delegate];
  uint64_t v3 = self;
  if (objc_opt_respondsToSelector()) {
    [v5 didHideAnnotationEditor:v3];
  }
  -[AKAnnotationPopoverViewController setPresentationRect:](v3, "setPresentationRect:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  [(AKAnnotationPopoverViewController *)v3 setPresentationView:0];
  id v4 = self;
}

- (void)hide
{
  if (self->mHideOnTouchGestureRecognizer)
  {
    [(AKAnnotationPopoverViewController *)self willHide];
    uint64_t v3 = [(AKAnnotationPopoverViewController *)self view];
    [v3 setUserInteractionEnabled:0];

    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2376B214C;
    v5[3] = &unk_264CDAE40;
    v5[4] = self;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = sub_2376B2194;
    v4[3] = &unk_264CDB020;
    v4[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v5 animations:v4 completion:0.15];
    [(AKAnnotationPopoverViewController *)self didHide];
  }
}

- (AKAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
}

- (AKPageController)annotationPageController
{
  return self->mAnnotationPageController;
}

- (void)setAnnotationPageController:(id)a3
{
}

- (AKAnnotationTheme)annotationTheme
{
  return self->mAnnotationTheme;
}

- (void)setAnnotationTheme:(id)a3
{
}

- (int)position
{
  return self->mPosition;
}

- (void)setPosition:(int)a3
{
  self->mPosition = a3;
}

- (CGRect)presentationRect
{
  double x = self->_presentationRect.origin.x;
  double y = self->_presentationRect.origin.y;
  double width = self->_presentationRect.size.width;
  double height = self->_presentationRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
  self->_presentationRect = a3;
}

- (UIView)presentationView
{
  return self->_presentationView;
}

- (void)setPresentationView:(id)a3
{
}

- (BOOL)editsOnLaunch
{
  return self->_editsOnLaunch;
}

- (void)setEditsOnLaunch:(BOOL)a3
{
  self->_editsOnLaunch = a3;
}

- (AKAnnotationEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKAnnotationEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_storeStrong(&self->mObserver, 0);
  objc_storeStrong((id *)&self->mAnnotationTheme, 0);
  objc_storeStrong((id *)&self->mAnnotationPageController, 0);
  objc_storeStrong((id *)&self->mAnnotation, 0);

  objc_storeStrong((id *)&self->mHideOnTouchGestureRecognizer, 0);
}

@end