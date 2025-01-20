@interface CSDiscoveryItemViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isScreenOn;
- (BOOL)isVisible;
- (CSDiscoveryItemViewController)initWithPlatterDiscoveryView:(id)a3 firstDidAppearCompletion:(id)a4;
- (PLPlatterDiscoveryView)platterDiscoveryView;
- (id)firstDidAppearCompletion;
- (void)_callFirstDidAppearCompletionIfNecessary;
- (void)loadView;
- (void)setFirstDidAppearCompletion:(id)a3;
- (void)setPlatterDiscoveryView:(id)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CSDiscoveryItemViewController

- (CSDiscoveryItemViewController)initWithPlatterDiscoveryView:(id)a3 firstDidAppearCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSDiscoveryItemViewController;
  v9 = [(CSDiscoveryItemViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_platterDiscoveryView, a3);
    uint64_t v11 = MEMORY[0x1D9487300](v8);
    id firstDidAppearCompletion = v10->_firstDidAppearCompletion;
    v10->_id firstDidAppearCompletion = (id)v11;
  }
  return v10;
}

- (void)loadView
{
  [(CSDiscoveryItemViewController *)self setView:self->_platterDiscoveryView];
  uint64_t v3 = [(PLPlatterDiscoveryView *)self->_platterDiscoveryView overrideUserInterfaceStyle];

  [(CSDiscoveryItemViewController *)self setOverrideUserInterfaceStyle:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSDiscoveryItemViewController;
  [(CSDiscoveryItemViewController *)&v4 viewDidAppear:a3];
  self->_visible = 1;
  [(CSDiscoveryItemViewController *)self _callFirstDidAppearCompletionIfNecessary];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSDiscoveryItemViewController;
  [(CSDiscoveryItemViewController *)&v4 viewDidDisappear:a3];
  self->_visible = 0;
}

- (void)setScreenOn:(BOOL)a3
{
  if (self->_screenOn != a3)
  {
    self->_screenOn = a3;
    [(CSDiscoveryItemViewController *)self _callFirstDidAppearCompletionIfNecessary];
  }
}

- (void)_callFirstDidAppearCompletionIfNecessary
{
  if (self->_visible && self->_screenOn)
  {
    id firstDidAppearCompletion = (void (**)(id, SEL))self->_firstDidAppearCompletion;
    if (firstDidAppearCompletion)
    {
      firstDidAppearCompletion[2](firstDidAppearCompletion, a2);
      id v4 = self->_firstDidAppearCompletion;
      self->_id firstDidAppearCompletion = 0;
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (PLPlatterDiscoveryView)platterDiscoveryView
{
  return self->_platterDiscoveryView;
}

- (void)setPlatterDiscoveryView:(id)a3
{
}

- (id)firstDidAppearCompletion
{
  return self->_firstDidAppearCompletion;
}

- (void)setFirstDidAppearCompletion:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstDidAppearCompletion, 0);

  objc_storeStrong((id *)&self->_platterDiscoveryView, 0);
}

@end