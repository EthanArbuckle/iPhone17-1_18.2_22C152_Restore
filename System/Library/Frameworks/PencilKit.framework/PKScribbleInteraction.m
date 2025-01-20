@interface PKScribbleInteraction
- (PKScribbleInteractionDelegate)delegate;
- (PKScribbleInteractionElementSource)elementSource;
- (UIView)view;
- (id)scribbleInteractionWrapper;
- (void)didMoveToView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementSource:(id)a3;
@end

@implementation PKScribbleInteraction

- (void)setDelegate:(id)a3
{
}

- (void)didMoveToView:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (void)setElementSource:(id)a3
{
}

- (id)scribbleInteractionWrapper
{
  cachedWrapper = self->_cachedWrapper;
  if (!cachedWrapper)
  {
    v4 = (PKScribbleInteractionWrapper *)-[PKScribbleInteractionWrapper initWithScribbleInteraction:]((id *)[PKScribbleInteractionWrapper alloc], self);
    v5 = self->_cachedWrapper;
    self->_cachedWrapper = v4;

    cachedWrapper = self->_cachedWrapper;
  }

  return cachedWrapper;
}

- (PKScribbleInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKScribbleInteractionDelegate *)WeakRetained;
}

- (PKScribbleInteractionElementSource)elementSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementSource);

  return (PKScribbleInteractionElementSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);

  objc_storeStrong((id *)&self->_cachedWrapper, 0);
}

@end