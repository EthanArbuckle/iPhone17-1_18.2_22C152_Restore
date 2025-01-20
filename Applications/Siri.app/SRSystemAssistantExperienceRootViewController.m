@interface SRSystemAssistantExperienceRootViewController
- (BOOL)_canShowWhileLocked;
- (SRSystemAssistantExperienceRootViewController)initWithContainerView:(id)a3;
- (SiriSharedUISystemAssistantExperienceContainerView)containerView;
- (void)loadView;
@end

@implementation SRSystemAssistantExperienceRootViewController

- (SRSystemAssistantExperienceRootViewController)initWithContainerView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRSystemAssistantExperienceRootViewController;
  v6 = [(SRSystemAssistantExperienceRootViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_containerView, a3);
  }

  return v7;
}

- (void)loadView
{
  id v5 = [objc_alloc((Class)AFUITouchPassThroughView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  containerView = self->_containerView;
  [v5 bounds];
  -[SiriSharedUISystemAssistantExperienceContainerView setFrame:](containerView, "setFrame:");
  [(SiriSharedUISystemAssistantExperienceContainerView *)self->_containerView setAutoresizingMask:18];
  [v5 addSubview:self->_containerView];
  v4 = +[UIColor clearColor];
  [v5 setBackgroundColor:v4];

  [v5 setOpaque:0];
  [(SRSystemAssistantExperienceRootViewController *)self setView:v5];
}

- (BOOL)_canShowWhileLocked
{
  v2 = +[SRUIFCachedPreferences sharedInstance];
  unsigned __int8 v3 = [v2 isSiriSafeForLockScreen];

  return v3;
}

- (SiriSharedUISystemAssistantExperienceContainerView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
}

@end