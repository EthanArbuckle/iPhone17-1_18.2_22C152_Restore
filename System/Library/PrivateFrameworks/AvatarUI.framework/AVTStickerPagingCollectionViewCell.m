@interface AVTStickerPagingCollectionViewCell
+ (id)cellIdentifier;
- (UIEdgeInsets)additionalContentInsets;
- (UIView)pageContentView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAdditionalContentInsets:(UIEdgeInsets)a3;
- (void)setPageContentView:(id)a3;
@end

@implementation AVTStickerPagingCollectionViewCell

+ (id)cellIdentifier
{
  return @"AVTStickerPagerCollectionViewCell";
}

- (void)setPageContentView:(id)a3
{
  v5 = (UIView *)a3;
  pageContentView = self->_pageContentView;
  if (pageContentView != v5)
  {
    v11 = v5;
    v7 = [(UIView *)pageContentView superview];
    v8 = [(AVTStickerPagingCollectionViewCell *)self contentView];

    if (v7 == v8) {
      [(UIView *)self->_pageContentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_pageContentView, a3);
    v5 = v11;
    if (v11)
    {
      [(UIView *)v11 removeFromSuperview];
      v9 = [(AVTStickerPagingCollectionViewCell *)self contentView];
      [v9 bounds];
      -[UIView setFrame:](v11, "setFrame:");

      [(UIView *)v11 setAutoresizingMask:18];
      v10 = [(AVTStickerPagingCollectionViewCell *)self contentView];
      [v10 addSubview:v11];

      pageContentView = (UIView *)[(AVTStickerPagingCollectionViewCell *)self setNeedsLayout];
      v5 = v11;
    }
  }
  MEMORY[0x270F9A758](pageContentView, v5);
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)AVTStickerPagingCollectionViewCell;
  [(AVTStickerPagingCollectionViewCell *)&v21 layoutSubviews];
  v3 = [(AVTStickerPagingCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(AVTStickerPagingCollectionViewCell *)self additionalContentInsets];
  double v13 = v5 + v12;
  double v15 = v7 + v14;
  double v17 = v9 - (v12 + v16);
  double v19 = v11 - (v14 + v18);
  v20 = [(AVTStickerPagingCollectionViewCell *)self pageContentView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
}

- (void)prepareForReuse
{
  v10.receiver = self;
  v10.super_class = (Class)AVTStickerPagingCollectionViewCell;
  [(AVTStickerPagingCollectionViewCell *)&v10 prepareForReuse];
  uint64_t v3 = [(AVTStickerPagingCollectionViewCell *)self pageContentView];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = [(AVTStickerPagingCollectionViewCell *)self pageContentView];
    double v6 = [v5 superview];
    double v7 = [(AVTStickerPagingCollectionViewCell *)self contentView];

    if (v6 == v7)
    {
      double v8 = [(AVTStickerPagingCollectionViewCell *)self pageContentView];
      [v8 removeFromSuperview];
    }
  }
  pageContentView = self->_pageContentView;
  self->_pageContentView = 0;
}

- (UIView)pageContentView
{
  return self->_pageContentView;
}

- (UIEdgeInsets)additionalContentInsets
{
  double top = self->_additionalContentInsets.top;
  double left = self->_additionalContentInsets.left;
  double bottom = self->_additionalContentInsets.bottom;
  double right = self->_additionalContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAdditionalContentInsets:(UIEdgeInsets)a3
{
  self->_additionalContentInsets = a3;
}

- (void).cxx_destruct
{
}

@end