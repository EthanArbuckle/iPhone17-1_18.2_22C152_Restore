@interface ISPaneFrameView
- (FMSlidingPaneViewController)owningViewController;
- (void)layoutSubviews;
- (void)setOwningViewController:(id)a3;
@end

@implementation ISPaneFrameView

- (void)layoutSubviews
{
  v3 = [(ISPaneFrameView *)self owningViewController];
  v4.receiver = self;
  v4.super_class = (Class)ISPaneFrameView;
  [(ISPaneFrameView *)&v4 layoutSubviews];
  [(ISPaneFrameView *)self frame];
  objc_msgSend(v3, "_paneFrameChanged:");
}

- (FMSlidingPaneViewController)owningViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningViewController);
  return (FMSlidingPaneViewController *)WeakRetained;
}

- (void)setOwningViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end