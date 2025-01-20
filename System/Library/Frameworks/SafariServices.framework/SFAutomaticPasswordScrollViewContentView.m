@interface SFAutomaticPasswordScrollViewContentView
- (SFAutomaticPasswordScrollViewContentViewLayoutObserver)layoutObserver;
- (void)layoutSubviews;
- (void)setLayoutObserver:(id)a3;
@end

@implementation SFAutomaticPasswordScrollViewContentView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SFAutomaticPasswordScrollViewContentView;
  [(SFAutomaticPasswordScrollViewContentView *)&v4 layoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutObserver);
  [WeakRetained automaticPasswordScrollContentViewDidLayout:self];
}

- (SFAutomaticPasswordScrollViewContentViewLayoutObserver)layoutObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutObserver);

  return (SFAutomaticPasswordScrollViewContentViewLayoutObserver *)WeakRetained;
}

- (void)setLayoutObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end