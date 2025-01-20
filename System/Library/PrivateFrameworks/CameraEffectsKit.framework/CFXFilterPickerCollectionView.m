@interface CFXFilterPickerCollectionView
- (BOOL)enableInfiniteHorizontalScrolling;
- (void)layoutSubviews;
- (void)setEnableInfiniteHorizontalScrolling:(BOOL)a3;
@end

@implementation CFXFilterPickerCollectionView

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CFXFilterPickerCollectionView;
  [(JTCollectionView *)&v13 layoutSubviews];
  if ([(CFXFilterPickerCollectionView *)self enableInfiniteHorizontalScrolling])
  {
    [(CFXFilterPickerCollectionView *)self contentSize];
    double v4 = v3;
    [(CFXFilterPickerCollectionView *)self contentOffset];
    long double v6 = v5;
    double v8 = v7;
    [(CFXFilterPickerCollectionView *)self bounds];
    CGFloat Width = CGRectGetWidth(v14);
    BOOL v10 = v6 < Width * 0.25;
    double v11 = v4 - Width - Width * 0.25;
    if (v10 || v6 > v11) {
      -[CFXFilterPickerCollectionView setContentOffset:](self, "setContentOffset:", floor(v4 / 3.0 + fmod(v6, v4 / 3.0)), v8);
    }
  }
}

- (BOOL)enableInfiniteHorizontalScrolling
{
  return self->_enableInfiniteHorizontalScrolling;
}

- (void)setEnableInfiniteHorizontalScrolling:(BOOL)a3
{
  self->_enableInfiniteHorizontalScrolling = a3;
}

@end