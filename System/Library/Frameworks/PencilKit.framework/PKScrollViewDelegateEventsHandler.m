@interface PKScrollViewDelegateEventsHandler
- (id)scrollViewDidEndScrollingAnimationHandler;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)setScrollViewDidEndScrollingAnimationHandler:(id)a3;
@end

@implementation PKScrollViewDelegateEventsHandler

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v6 = a3;
  v4 = [(PKScrollViewDelegateEventsHandler *)self scrollViewDidEndScrollingAnimationHandler];

  if (v4)
  {
    v5 = [(PKScrollViewDelegateEventsHandler *)self scrollViewDidEndScrollingAnimationHandler];
    ((void (**)(void, PKScrollViewDelegateEventsHandler *, id))v5)[2](v5, self, v6);
  }
}

- (id)scrollViewDidEndScrollingAnimationHandler
{
  return self->_scrollViewDidEndScrollingAnimationHandler;
}

- (void)setScrollViewDidEndScrollingAnimationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end