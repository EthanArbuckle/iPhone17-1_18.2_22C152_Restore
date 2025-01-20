@interface WKRotatingPopover
- (CGPoint)presentationPoint;
- (UIPopoverController)popoverController;
- (WKContentView)view;
- (WKRotatingPopover)initWithView:(id)a3;
- (WKRotatingPopoverDelegate)dismissionDelegate;
- (id).cxx_construct;
- (unint64_t)popoverArrowDirections;
- (void)dealloc;
- (void)didRotate:(id)a3;
- (void)dismissPopoverAnimated:(BOOL)a3;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)presentPopoverAnimated:(BOOL)a3;
- (void)setDismissionDelegate:(id)a3;
- (void)setPopoverController:(id)a3;
- (void)setPresentationPoint:(CGPoint)a3;
- (void)willRotate:(id)a3;
@end

@implementation WKRotatingPopover

- (WKRotatingPopover)initWithView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WKRotatingPopover;
  v4 = [(WKRotatingPopover *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_view = (WKContentView *)a3;
    -[WKRotatingPopover setPresentationPoint:](v4, "setPresentationPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel_willRotate_ name:*MEMORY[0x1E4F43F40] object:0];
    [v6 addObserver:v5 selector:sel_didRotate_ name:*MEMORY[0x1E4F43F10] object:0];
  }
  return v5;
}

- (void)dealloc
{
  self->_view = 0;
  [self->_popoverController.m_ptr dismissPopoverAnimated:1];
  [self->_popoverController.m_ptr setDelegate:0];
  [(WKRotatingPopover *)self setPopoverController:0];
  v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43F40] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43F10] object:0];
  v4.receiver = self;
  v4.super_class = (Class)WKRotatingPopover;
  [(WKRotatingPopover *)&v4 dealloc];
}

- (UIPopoverController)popoverController
{
  return (UIPopoverController *)self->_popoverController.m_ptr;
}

- (void)setPopoverController:(id)a3
{
  id m_ptr = self->_popoverController.m_ptr;
  if (m_ptr != a3)
  {
    id v5 = a3;
    [m_ptr setDelegate:0];
    if (v5) {
      CFRetain(v5);
    }
    v6 = self->_popoverController.m_ptr;
    self->_popoverController.id m_ptr = v5;
    if (v6)
    {
      CFRelease(v6);
      id v5 = self->_popoverController.m_ptr;
    }
    [v5 setDelegate:self];
  }
}

- (unint64_t)popoverArrowDirections
{
  return 15;
}

- (void)presentPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(WKRotatingPopover *)self popoverArrowDirections];
  [(WKRotatingPopover *)self presentationPoint];
  view = self->_view;
  if (v8 == *MEMORY[0x1E4F1DAD8] && v6 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    [(WKContentView *)view focusedElementInformation];
    WebCore::IntRect::operator CGRect();
    double v14 = v19;
    double v16 = v20;
    CGFloat v17 = v21;
    CGFloat v18 = v22;
  }
  else
  {
    uint64_t v10 = [(WKContentView *)view page];
    uint64_t v11 = 744;
    if (!*(unsigned char *)(v10 + 929)) {
      uint64_t v11 = 712;
    }
    double v12 = *(double *)(v10 + v11);
    [(WKRotatingPopover *)self presentationPoint];
    double v14 = v12 * v13;
    [(WKRotatingPopover *)self presentationPoint];
    double v16 = v12 * v15;
    CGFloat v17 = 1.0;
    CGFloat v18 = 1.0;
  }
  [(WKContentView *)self->_view bounds];
  v33.origin.x = v23;
  v33.origin.y = v24;
  v33.size.width = v25;
  v33.size.height = v26;
  v30.origin.x = v14;
  v30.origin.y = v16;
  v30.size.width = v17;
  v30.size.height = v18;
  if (CGRectIntersectsRect(v30, v33))
  {
    id m_ptr = self->_popoverController.m_ptr;
    v31.origin.x = v14;
    v31.origin.y = v16;
    v31.size.width = v17;
    v31.size.height = v18;
    CGRect v32 = CGRectIntegral(v31);
    v28 = self->_view;
    objc_msgSend(m_ptr, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v28, v5, v3, v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  }
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
}

- (void)willRotate:(id)a3
{
  self->_isRotating = 1;
  [self->_popoverController.m_ptr dismissPopoverAnimated:0];
}

- (void)didRotate:(id)a3
{
  self->_isRotating = 0;
  [(WKRotatingPopover *)self presentPopoverAnimated:0];
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  if (!self->_isRotating) {
    [(WKRotatingPopoverDelegate *)self->_dismissionDelegate popoverWasDismissed:self];
  }
}

- (WKContentView)view
{
  return self->_view;
}

- (CGPoint)presentationPoint
{
  double x = self->_presentationPoint.x;
  double y = self->_presentationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPresentationPoint:(CGPoint)a3
{
  self->_presentationPoint = a3;
}

- (WKRotatingPopoverDelegate)dismissionDelegate
{
  return self->_dismissionDelegate;
}

- (void)setDismissionDelegate:(id)a3
{
  self->_dismissionDelegate = (WKRotatingPopoverDelegate *)a3;
}

- (void).cxx_destruct
{
  id m_ptr = self->_popoverController.m_ptr;
  self->_popoverController.id m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  return self;
}

@end