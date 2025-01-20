@interface SFNanoDomainContainerView
+ (double)defaultHeight;
+ (double)defaultHeightInsideQuickboard;
+ (double)defaultTopOffset;
- (_SFBrowserView)browserView;
- (double)maximumHeight;
- (id)platterTapAction;
- (void)setBrowserView:(id)a3;
- (void)setMaximumHeight:(double)a3;
- (void)setPlatterTapAction:(id)a3;
@end

@implementation SFNanoDomainContainerView

+ (double)defaultTopOffset
{
  return 0.0;
}

+ (double)defaultHeight
{
  return 0.0;
}

+ (double)defaultHeightInsideQuickboard
{
  return 0.0;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

- (_SFBrowserView)browserView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserView);

  return (_SFBrowserView *)WeakRetained;
}

- (void)setBrowserView:(id)a3
{
}

- (id)platterTapAction
{
  return self->_platterTapAction;
}

- (void)setPlatterTapAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_platterTapAction, 0);

  objc_destroyWeak((id *)&self->_browserView);
}

@end