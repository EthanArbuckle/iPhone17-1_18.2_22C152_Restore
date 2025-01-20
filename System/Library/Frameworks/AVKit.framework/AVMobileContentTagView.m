@interface AVMobileContentTagView
- (AVMobileChromelessControlsStyleSheet)styleSheet;
- (AVMobileContentTag)contentTag;
- (AVMobileContentTagView)initWithContentTag:(id)a3 withStyleSheet:(id)a4;
- (CGSize)intrinsicContentSize;
- (void)_updateContentTagLabelFont;
- (void)layoutSubviews;
- (void)setContentTag:(id)a3;
- (void)setStyleSheet:(id)a3;
@end

@implementation AVMobileContentTagView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_contentTag, 0);
  objc_storeStrong((id *)&self->_contentTagViewLabel, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (AVMobileContentTag)contentTag
{
  return self->_contentTag;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)AVMobileContentTagView;
  [(AVMobileContentTagView *)&v10 layoutSubviews];
  contentView = self->_contentView;
  [(AVMobileContentTagView *)self bounds];
  -[UIView setFrame:](contentView, "setFrame:");
  contentTagViewLabel = self->_contentTagViewLabel;
  [(UIView *)self->_contentView frame];
  -[UILabel setFrame:](contentTagViewLabel, "setFrame:");
  [(AVMobileContentTag *)self->_contentTag normalizedCornerRadius];
  double v6 = v5;
  [(UILabel *)self->_contentTagViewLabel frame];
  double v8 = v7 * v6;
  v9 = [(UIView *)self->_contentView layer];
  [v9 setCornerRadius:v8];
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_contentTagViewLabel intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(AVMobileContentTag *)self->_contentTag layoutMargins];
  double v9 = v4 + v7 + v8;
  double v12 = v6 + v10 + v11;
  double v13 = v9;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)setStyleSheet:(id)a3
{
  double v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  p_styleSheet = &self->_styleSheet;
  if (self->_styleSheet != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_styleSheet, a3);
    -[AVMobileContentTagView _updateContentTagLabelFont]((uint64_t)self);
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_styleSheet, v5);
}

- (void)_updateContentTagLabelFont
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 424) placement];
    if (v2 == 1)
    {
      double v3 = *(void **)(a1 + 416);
      uint64_t v4 = [*(id *)(a1 + 432) prominentContentTagFont];
    }
    else
    {
      if (v2) {
        return;
      }
      double v3 = *(void **)(a1 + 416);
      uint64_t v4 = [*(id *)(a1 + 432) contentTagFont];
    }
    id v5 = (id)v4;
    objc_msgSend(v3, "setFont:");
  }
}

- (void)setContentTag:(id)a3
{
  id v5 = (AVMobileContentTag *)a3;
  p_contentTag = &self->_contentTag;
  if (self->_contentTag != v5)
  {
    double v12 = v5;
    objc_storeStrong((id *)&self->_contentTag, a3);
    contentTagViewLabel = self->_contentTagViewLabel;
    double v8 = [(AVMobileContentTag *)*p_contentTag title];
    [(UILabel *)contentTagViewLabel setText:v8];

    double v9 = self->_contentTagViewLabel;
    double v10 = [(AVMobileContentTag *)*p_contentTag tintColor];
    [(UILabel *)v9 setBackgroundColor:v10];

    double v11 = self->_contentTagViewLabel;
    [(AVMobileContentTag *)*p_contentTag layoutMargins];
    [(UILabel *)v11 setLayoutMargins:"setLayoutMargins:"];
    -[AVMobileContentTagView _updateContentTagLabelFont]((uint64_t)self);
    [(AVMobileContentTagView *)self setNeedsLayout];
    id v5 = v12;
  }
}

- (AVMobileContentTagView)initWithContentTag:(id)a3 withStyleSheet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AVMobileContentTagView;
  double v9 = [(AVMobileContentTagView *)&v25 init];
  double v10 = v9;
  if (v9)
  {
    p_contentTag = (id *)&v9->_contentTag;
    objc_storeStrong((id *)&v9->_contentTag, a3);
    objc_storeStrong((id *)&v10->_styleSheet, a4);
    double v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v10->_contentView;
    v10->_contentView = v12;

    [(AVMobileContentTagView *)v10 addSubview:v10->_contentView];
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    contentTagViewLabel = v10->_contentTagViewLabel;
    v10->_contentTagViewLabel = v14;

    v16 = v10->_contentTagViewLabel;
    v17 = [*p_contentTag title];
    [(UILabel *)v16 setText:v17];

    v18 = v10->_contentTagViewLabel;
    v19 = [*p_contentTag tintColor];
    [(UILabel *)v18 setBackgroundColor:v19];

    v20 = v10->_contentTagViewLabel;
    v21 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v20 setTextColor:v21];

    [(UILabel *)v10->_contentTagViewLabel setTextAlignment:1];
    [(UILabel *)v10->_contentTagViewLabel setAutoresizingMask:0];
    v22 = v10->_contentTagViewLabel;
    [*p_contentTag layoutMargins];
    [(UILabel *)v22 setLayoutMargins:"setLayoutMargins:"];
    -[AVMobileContentTagView _updateContentTagLabelFont]((uint64_t)v10);
    v23 = [(UIView *)v10->_contentView layer];
    [v23 setMasksToBounds:1];

    [(UIView *)v10->_contentView addSubview:v10->_contentTagViewLabel];
  }

  return v10;
}

@end