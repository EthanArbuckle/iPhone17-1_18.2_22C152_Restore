@interface MFComposeScrollView
- (BOOL)_scrollsToMakeFirstResponderVisible;
- (BOOL)shouldScrollToFirstResponder;
- (BOOL)subviewsDisabled;
- (MFComposeScrollView)initWithFrame:(CGRect)a3;
- (void)beginBlockingScroll;
- (void)didAddSubview:(id)a3;
- (void)disableSubview:(id)a3;
- (void)enableSubview:(id)a3;
- (void)endBlockingScroll;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setShouldScrollToFirstResponder:(BOOL)a3;
- (void)setSubviewsDisabled:(BOOL)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation MFComposeScrollView

- (MFComposeScrollView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFComposeScrollView;
  v3 = -[MFComposeScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:3];
    disabledSubviews = v3->_disabledSubviews;
    v3->_disabledSubviews = (NSMutableSet *)v4;

    v3->_shouldScrollToFirstResponder = 1;
    [(MFComposeScrollView *)v3 setPreservesSuperviewLayoutMargins:1];
    [(MFComposeScrollView *)v3 setInsetsLayoutMarginsFromSafeArea:0];
  }
  return v3;
}

- (void)setSubviewsDisabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_subviewsDisabled != a3)
  {
    self->_subviewsDisabled = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(MFComposeScrollView *)self subviews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
          if (self->_subviewsDisabled) {
            [(MFComposeScrollView *)self disableSubview:v8];
          }
          else {
            [(MFComposeScrollView *)self enableSubview:v8];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)disableSubview:(id)a3
{
  id v4 = a3;
  if ([v4 isUserInteractionEnabled])
  {
    [(NSMutableSet *)self->_disabledSubviews addObject:v4];
    [v4 setUserInteractionEnabled:0];
  }
}

- (void)enableSubview:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_disabledSubviews, "containsObject:"))
  {
    [(NSMutableSet *)self->_disabledSubviews removeObject:v4];
    [v4 setUserInteractionEnabled:1];
  }
}

- (void)didAddSubview:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeScrollView;
  [(MFComposeScrollView *)&v5 didAddSubview:v4];
  if (self->_subviewsDisabled) {
    [(MFComposeScrollView *)self disableSubview:v4];
  }
}

- (void)willRemoveSubview:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeScrollView;
  [(MFComposeScrollView *)&v5 willRemoveSubview:v4];
  if (self->_subviewsDisabled) {
    [(MFComposeScrollView *)self enableSubview:v4];
  }
}

- (void)beginBlockingScroll
{
}

- (void)endBlockingScroll
{
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  if (!self->_scrollBlocked)
  {
    v4.receiver = self;
    v4.super_class = (Class)MFComposeScrollView;
    -[MFComposeScrollView setContentOffset:animated:](&v4, sel_setContentOffset_animated_, a4, a3.x, a3.y);
  }
}

- (BOOL)_scrollsToMakeFirstResponderVisible
{
  return self->_shouldScrollToFirstResponder;
}

- (BOOL)subviewsDisabled
{
  return self->_subviewsDisabled;
}

- (BOOL)shouldScrollToFirstResponder
{
  return self->_shouldScrollToFirstResponder;
}

- (void)setShouldScrollToFirstResponder:(BOOL)a3
{
  self->_shouldScrollToFirstResponder = a3;
}

- (void).cxx_destruct
{
}

@end