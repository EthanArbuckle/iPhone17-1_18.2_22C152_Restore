@interface BEScrollView
- (BOOL)_subclassHandlesAsyncScrollEvent;
- (id)_actingParentScrollView;
- (id)delegateFromSuperclass;
- (void)_asynchronouslyHandleScrollEvent:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation BEScrollView

- (void)setDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BEScrollView;
  id v4 = a3;
  [(BEScrollView *)&v7 setDelegate:v4];
  *(unsigned char *)&self->_beScrollViewFlags = *(unsigned char *)&self->_beScrollViewFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  char v5 = objc_opt_respondsToSelector();

  if (v5) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_beScrollViewFlags = *(unsigned char *)&self->_beScrollViewFlags & 0xFD | v6;
}

- (id)delegateFromSuperclass
{
  v4.receiver = self;
  v4.super_class = (Class)BEScrollView;
  v2 = [(BEScrollView *)&v4 delegate];

  return v2;
}

- (BOOL)_subclassHandlesAsyncScrollEvent
{
  return *(unsigned char *)&self->_beScrollViewFlags & 1;
}

- (void)_asynchronouslyHandleScrollEvent:(id)a3 completion:(id)a4
{
  id v10 = a3;
  char v6 = (void (**)(id, void))a4;
  unint64_t v7 = [v10 phase] - 2;
  if (v7 >= 4)
  {
    v6[2](v6, [(BEScrollView *)self isScrollEnabled] ^ 1);
  }
  else
  {
    v8 = -[BEScrollViewScrollUpdate initWithScrollEvent:phase:]([BEScrollViewScrollUpdate alloc], v10, v7);
    v9 = [(BEScrollView *)self delegateFromSuperclass];
    [v9 scrollView:self handleScrollUpdate:v8 completion:v6];
  }
}

- (id)_actingParentScrollView
{
  v3 = [(BEScrollView *)self delegateFromSuperclass];
  objc_super v4 = v3;
  if ((*(unsigned char *)&self->_beScrollViewFlags & 2) == 0
    || ([v3 parentScrollViewForScrollView:self],
        (char v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)BEScrollView;
    char v5 = [(BEScrollView *)&v7 _actingParentScrollView];
  }

  return v5;
}

@end