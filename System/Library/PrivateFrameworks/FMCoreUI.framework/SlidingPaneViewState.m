@interface SlidingPaneViewState
- (BOOL)shouldNotifyOfPaneSizeChanges;
- (ISPaneFrameView)paneView;
- (NSLayoutConstraint)paneHorizontalPositionConstraint;
- (NSLayoutConstraint)paneVerticalPositionConstraint;
- (SlidingPaneViewState)initWithViewController:(id)a3 edge:(unint64_t)a4;
- (UIViewController)paneViewController;
- (UIVisualEffectView)visualEffectView;
- (unint64_t)edge;
- (void)dealloc;
- (void)setEdge:(unint64_t)a3;
- (void)setPaneHorizontalPositionConstraint:(id)a3;
- (void)setPaneVerticalPositionConstraint:(id)a3;
- (void)setPaneView:(id)a3;
- (void)setPaneViewController:(id)a3;
- (void)setShouldNotifyOfPaneSizeChanges:(BOOL)a3;
- (void)setVisualEffectView:(id)a3;
@end

@implementation SlidingPaneViewState

- (SlidingPaneViewState)initWithViewController:(id)a3 edge:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SlidingPaneViewState;
  v7 = [(SlidingPaneViewState *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(SlidingPaneViewState *)v7 setPaneViewController:v6];
    [(SlidingPaneViewState *)v8 setEdge:a4];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(SlidingPaneViewState *)self paneView];
  [v3 removeFromSuperview];

  v4.receiver = self;
  v4.super_class = (Class)SlidingPaneViewState;
  [(SlidingPaneViewState *)&v4 dealloc];
}

- (UIViewController)paneViewController
{
  return self->_paneViewController;
}

- (void)setPaneViewController:(id)a3
{
}

- (ISPaneFrameView)paneView
{
  return self->_paneView;
}

- (void)setPaneView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (NSLayoutConstraint)paneVerticalPositionConstraint
{
  return self->_paneVerticalPositionConstraint;
}

- (void)setPaneVerticalPositionConstraint:(id)a3
{
}

- (NSLayoutConstraint)paneHorizontalPositionConstraint
{
  return self->_paneHorizontalPositionConstraint;
}

- (void)setPaneHorizontalPositionConstraint:(id)a3
{
}

- (BOOL)shouldNotifyOfPaneSizeChanges
{
  return self->_shouldNotifyOfPaneSizeChanges;
}

- (void)setShouldNotifyOfPaneSizeChanges:(BOOL)a3
{
  self->_shouldNotifyOfPaneSizeChanges = a3;
}

- (unint64_t)edge
{
  return self->_edge;
}

- (void)setEdge:(unint64_t)a3
{
  self->_edge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paneHorizontalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_paneVerticalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_paneView, 0);
  objc_storeStrong((id *)&self->_paneViewController, 0);
}

@end