@interface MRUViewServiceRoutingHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUViewServiceRoutingHeaderView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (NSString)title;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIView)separatorView;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateVisualStyling;
@end

@implementation MRUViewServiceRoutingHeaderView

- (MRUViewServiceRoutingHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)MRUViewServiceRoutingHeaderView;
  v7 = -[MRUViewServiceRoutingHeaderView initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", x, y, width, height);
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v8;

    [(UIImageView *)v7->_imageView setContentMode:1];
    [(MRUViewServiceRoutingHeaderView *)v7 addSubview:v7->_imageView];
    id v10 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v15;

    [(UILabel *)v7->_titleLabel setNumberOfLines:1];
    [(UILabel *)v7->_titleLabel setTextAlignment:1];
    [(MRUViewServiceRoutingHeaderView *)v7 addSubview:v7->_titleLabel];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v11, v12, v13, v14);
    separatorView = v7->_separatorView;
    v7->_separatorView = (UIView *)v17;

    v19 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v7->_separatorView setBackgroundColor:v19];

    [(MRUViewServiceRoutingHeaderView *)v7 addSubview:v7->_separatorView];
    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v7 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRUViewServiceRoutingHeaderView *)v7 updateContentSizeCategory];
  }
  return v7;
}

- (void)layoutSubviews
{
  v43[1] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)MRUViewServiceRoutingHeaderView;
  [(MRUViewServiceRoutingHeaderView *)&v42 layoutSubviews];
  [(MRUViewServiceRoutingHeaderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(MRUViewServiceRoutingHeaderView *)self traitCollection];
  [v11 displayScale];
  double v13 = 1.0 / v12;

  v44.origin.double x = v4;
  v44.origin.double y = v6;
  v44.size.double width = v8;
  v44.size.double height = v10;
  double MinX = CGRectGetMinX(v44);
  v45.origin.double x = v4;
  v45.origin.double y = v6;
  v45.size.double width = v8;
  v45.size.double height = v10;
  CGFloat v15 = CGRectGetMaxY(v45) - v13;
  v46.origin.double x = v4;
  v46.origin.double y = v6;
  v46.size.double width = v8;
  v46.size.double height = v10;
  -[UIView setFrame:](self->_separatorView, "setFrame:", MinX, v15, CGRectGetWidth(v46), v13);
  UIRectInset();
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v21 = v20;
  double v23 = v22;
  if (self->_title)
  {
    [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:0];
  }
  else
  {
    v24 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:3 scale:17.0];
    v25 = (void *)MEMORY[0x1E4FB1830];
    v26 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    v43[0] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    v28 = [v25 configurationWithPaletteColors:v27];
    v29 = [v24 configurationByApplyingConfiguration:v28];
    [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v29];
  }
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v21, v23);
  v47.origin.double x = v17;
  v47.origin.double y = v19;
  v47.size.double width = v21;
  v47.size.double height = v23;
  CGRectGetMinY(v47);
  UIRectCenteredXInRect();
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  UIRectInset();
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v34, v36);
  MRUSizeCeilToViewScale(self);
  double v39 = v38;
  v48.origin.double x = v31;
  v48.origin.double y = v33;
  v48.size.double width = v35;
  v48.size.double height = v37;
  double v40 = CGRectGetMinX(v48);
  v49.origin.double x = v31;
  v49.origin.double y = v33;
  v49.size.double width = v35;
  v49.size.double height = v37;
  double MinY = CGRectGetMinY(v49);
  v50.origin.double x = v31;
  v50.origin.double y = v33;
  v50.size.double width = v35;
  v50.size.double height = v37;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v40, MinY, CGRectGetWidth(v50), v39);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v6 = [(MRUViewServiceRoutingHeaderView *)self traitCollection];
  [v6 displayScale];
  double v8 = 1.0 / v7;

  double v9 = v8 + 18.0 + 9.0 + 13.0;
  double v10 = height - v9;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, v10);
  double v12 = v10 - v11;
  double v13 = v9 + v11;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, v12);
  MRUSizeCeilToViewScale(self);
  double v15 = v13 + v14;
  double v16 = width;
  result.double height = v15;
  result.double width = v16;
  return result;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  double v5 = (NSString *)[v4 copy];
  title = self->_title;
  self->_title = v5;

  [(UILabel *)self->_titleLabel setText:v4];

  [(MRUViewServiceRoutingHeaderView *)self setNeedsLayout];
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  [(UIImageView *)self->_imageView setImage:v5];

  [(MRUViewServiceRoutingHeaderView *)self setNeedsLayout];
}

- (void)setStylingProvider:(id)a3
{
  id v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    double v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUViewServiceRoutingHeaderView *)self updateVisualStyling];
    id v5 = v7;
  }
}

- (void)updateVisualStyling
{
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_titleLabel];
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_imageView];
  stylingProvider = self->_stylingProvider;
  separatorView = self->_separatorView;

  [(MRUVisualStylingProvider *)stylingProvider applyStyle:4 toView:separatorView];
}

- (void)updateContentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_titleFont");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_titleLabel setFont:v3];
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end