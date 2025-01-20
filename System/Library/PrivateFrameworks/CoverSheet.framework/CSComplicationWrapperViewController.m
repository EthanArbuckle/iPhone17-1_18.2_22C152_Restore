@interface CSComplicationWrapperViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isHighlighted;
- (CHUISWidgetHostViewController)widgetHostViewController;
- (CSComplicationWrapperViewController)initWithWidgetHostViewController:(id)a3;
- (UIView)dimmingView;
- (void)dealloc;
- (void)setDimmingView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CSComplicationWrapperViewController

- (CSComplicationWrapperViewController)initWithWidgetHostViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSComplicationWrapperViewController;
  v6 = [(CSComplicationWrapperViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_widgetHostViewController, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(CHUISWidgetHostViewController *)self->_widgetHostViewController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSComplicationWrapperViewController;
  [(CSComplicationWrapperViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CSComplicationWrapperViewController;
  [(CSComplicationWrapperViewController *)&v3 viewDidLoad];
  [(CSComplicationWrapperViewController *)self bs_addChildViewController:self->_widgetHostViewController];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    BOOL v3 = a3;
    self->_highlighted = a3;
    if (!self->_dimmingView)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
      v6 = [(CSComplicationWrapperViewController *)self view];
      [v6 bounds];
      v7 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      dimmingView = self->_dimmingView;
      self->_dimmingView = v7;

      [(UIView *)self->_dimmingView setAutoresizingMask:18];
      objc_super v9 = self->_dimmingView;
      v10 = [MEMORY[0x1E4F428B8] blackColor];
      [(UIView *)v9 setBackgroundColor:v10];

      [(UIView *)self->_dimmingView setAlpha:0.600000024];
      v11 = [(CSComplicationWrapperViewController *)self view];
      [v11 addSubview:self->_dimmingView];
    }
    v12 = self->_dimmingView;
    if (v3)
    {
      v13 = [(CHUISWidgetHostViewController *)self->_widgetHostViewController snapshotView];
      [(UIView *)v12 setMaskView:v13];
    }
    else
    {
      [(UIView *)self->_dimmingView setMaskView:0];
    }
    v14 = self->_dimmingView;
    [(UIView *)v14 setHidden:!v3];
  }
}

- (CHUISWidgetHostViewController)widgetHostViewController
{
  return self->_widgetHostViewController;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);

  objc_storeStrong((id *)&self->_widgetHostViewController, 0);
}

@end