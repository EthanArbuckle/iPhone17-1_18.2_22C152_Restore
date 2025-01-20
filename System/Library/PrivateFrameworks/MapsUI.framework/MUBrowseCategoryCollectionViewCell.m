@interface MUBrowseCategoryCollectionViewCell
+ (id)reuseIdentifier;
- (CGSize)preferredSize;
- (MUBrowseCategoryCollectionViewCell)initWithFrame:(CGRect)a3;
- (MUBrowseCategoryItem)browseItem;
- (NSLayoutConstraint)titleLabelTopConstraint;
- (UIFont)preferredTitleLabelFont;
- (UIImageView)highlightedImageView;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)prepareForReuse;
- (void)setBrowseItem:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedImageView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPreferredSize:(CGSize)a3;
- (void)setPreferredTitleLabelFont:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelTextColor:(id)a3;
- (void)setTitleLabelTopConstraint:(id)a3;
@end

@implementation MUBrowseCategoryCollectionViewCell

+ (id)reuseIdentifier
{
  return @"MKVenuesBrowseCollectionViewCellIdentifier";
}

- (MUBrowseCategoryCollectionViewCell)initWithFrame:(CGRect)a3
{
  v65[4] = *MEMORY[0x1E4F143B8];
  v62.receiver = self;
  v62.super_class = (Class)MUBrowseCategoryCollectionViewCell;
  v3 = -[MUBrowseCategoryCollectionViewCell initWithFrame:](&v62, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUBrowseCategoryCollectionViewCell *)v3 setAccessibilityIdentifier:@"VenuesBrowseCategoryCollectionViewCell"];
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v4->_imageView;
    v4->_imageView = v5;

    [(UIImageView *)v4->_imageView setContentMode:1];
    [(UIImageView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_imageView setAccessibilityIdentifier:@"VenuesBrowseCategoryImage"];
    v7 = [(MUBrowseCategoryCollectionViewCell *)v4 contentView];
    [v7 addSubview:v4->_imageView];

    v47 = (void *)MEMORY[0x1E4F28DC8];
    v56 = [(UIImageView *)v4->_imageView centerXAnchor];
    v59 = [(MUBrowseCategoryCollectionViewCell *)v4 contentView];
    v53 = [v59 centerXAnchor];
    v50 = [v56 constraintEqualToAnchor:v53];
    v65[0] = v50;
    v45 = [(UIImageView *)v4->_imageView topAnchor];
    v8 = [(MUBrowseCategoryCollectionViewCell *)v4 contentView];
    v9 = [v8 topAnchor];
    v10 = [v45 constraintEqualToAnchor:v9];
    v65[1] = v10;
    v11 = [(UIImageView *)v4->_imageView widthAnchor];
    v12 = [v11 constraintEqualToConstant:40.0];
    v65[2] = v12;
    v13 = [(UIImageView *)v4->_imageView heightAnchor];
    v14 = [v13 constraintEqualToConstant:40.0];
    v65[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:4];
    [v47 activateConstraints:v15];

    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    highlightedImageView = v4->_highlightedImageView;
    v4->_highlightedImageView = v16;

    [(UIImageView *)v4->_highlightedImageView setContentMode:1];
    [(UIImageView *)v4->_highlightedImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [(MUBrowseCategoryCollectionViewCell *)v4 imageView];
    [v18 addSubview:v4->_highlightedImageView];

    v46 = (void *)MEMORY[0x1E4F28DC8];
    v60 = [(UIImageView *)v4->_highlightedImageView topAnchor];
    v57 = [(UIImageView *)v4->_imageView topAnchor];
    v54 = [v60 constraintEqualToAnchor:v57];
    v64[0] = v54;
    v51 = [(UIImageView *)v4->_highlightedImageView bottomAnchor];
    v48 = [(UIImageView *)v4->_imageView bottomAnchor];
    v44 = [v51 constraintEqualToAnchor:v48];
    v64[1] = v44;
    v19 = [(UIImageView *)v4->_highlightedImageView leadingAnchor];
    v20 = [(UIImageView *)v4->_imageView leadingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v64[2] = v21;
    v22 = [(UIImageView *)v4->_highlightedImageView trailingAnchor];
    v23 = [(UIImageView *)v4->_imageView trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v64[3] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];
    [v46 activateConstraints:v25];

    [(UIImageView *)v4->_highlightedImageView setAlpha:0.0];
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v26;

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setLineBreakMode:4];
    LODWORD(v28) = 1144750080;
    [(UILabel *)v4->_titleLabel setContentHuggingPriority:1 forAxis:v28];
    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:@"VenuesBrowseCategoryTitle"];
    v29 = [(MUBrowseCategoryCollectionViewCell *)v4 contentView];
    [v29 addSubview:v4->_titleLabel];

    v30 = [(UILabel *)v4->_titleLabel firstBaselineAnchor];
    v31 = [(UIImageView *)v4->_imageView bottomAnchor];
    uint64_t v32 = [v30 constraintEqualToAnchor:v31 constant:16.0];
    titleLabelTopConstraint = v4->_titleLabelTopConstraint;
    v4->_titleLabelTopConstraint = (NSLayoutConstraint *)v32;

    v49 = (void *)MEMORY[0x1E4F28DC8];
    v58 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v61 = [(MUBrowseCategoryCollectionViewCell *)v4 contentView];
    v55 = [v61 leadingAnchor];
    v52 = [v58 constraintEqualToAnchor:v55];
    v63[0] = v52;
    v34 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v35 = [(MUBrowseCategoryCollectionViewCell *)v4 contentView];
    v36 = [v35 trailingAnchor];
    v37 = [v34 constraintEqualToAnchor:v36];
    v63[1] = v37;
    v63[2] = v4->_titleLabelTopConstraint;
    v38 = [(UILabel *)v4->_titleLabel lastBaselineAnchor];
    v39 = [(MUBrowseCategoryCollectionViewCell *)v4 contentView];
    v40 = [v39 bottomAnchor];
    v41 = [v38 constraintEqualToAnchor:v40];
    v63[3] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:4];
    [v49 activateConstraints:v42];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MUBrowseCategoryCollectionViewCell;
  [(MUBrowseCategoryCollectionViewCell *)&v3 prepareForReuse];
  [(MUBrowseCategoryCollectionViewCell *)self setBrowseItem:0];
}

- (void)setTitleLabelTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(MUBrowseCategoryCollectionViewCell *)self titleLabel];
  [v5 setTextColor:v4];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [(MUBrowseCategoryCollectionViewCell *)self preferredSize];
  double v6 = v5;
  v7 = [(MUBrowseCategoryCollectionViewCell *)self titleLabel];
  [v7 setPreferredMaxLayoutWidth:v6];

  v8 = [(MUBrowseCategoryCollectionViewCell *)self preferredTitleLabelFont];
  v9 = [(MUBrowseCategoryCollectionViewCell *)self titleLabel];
  [v9 setFont:v8];

  v10 = [(MUBrowseCategoryCollectionViewCell *)self titleLabel];
  v11 = [v10 font];
  objc_msgSend(v11, "_mapkit_scaledValueForValue:", 16.0);
  double v13 = v12;
  v14 = [(MUBrowseCategoryCollectionViewCell *)self titleLabelTopConstraint];
  [v14 setConstant:v13];

  v19.receiver = self;
  v19.super_class = (Class)MUBrowseCategoryCollectionViewCell;
  v15 = [(MUBrowseCategoryCollectionViewCell *)&v19 preferredLayoutAttributesFittingAttributes:v4];

  [v15 frame];
  CGRectGetWidth(v21);
  [(MUBrowseCategoryCollectionViewCell *)self preferredSize];
  [v15 frame];
  CGRectGetHeight(v22);
  [(MUBrowseCategoryCollectionViewCell *)self preferredSize];
  [v15 frame];
  double v17 = v16;
  [v15 frame];
  [v15 setFrame:v17];
  return v15;
}

- (void)setBrowseItem:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  double v5 = (MUBrowseCategoryItem *)a3;
  if (self->_browseItem != v5)
  {
    objc_storeStrong((id *)&self->_browseItem, a3);
    double v6 = [(MUBrowseCategoryItem *)v5 image];
    v7 = [(MUBrowseCategoryCollectionViewCell *)self imageView];
    [v7 setImage:v6];

    v8 = [(MUBrowseCategoryCollectionViewCell *)self highlightedImageView];
    [v8 setImage:0];

    v9 = [(MUBrowseCategoryItem *)v5 title];
    if ([v9 length])
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4FB0848]);
      [v10 setAlignment:1];
      id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v15 = *MEMORY[0x1E4FB0738];
      v16[0] = v10;
      double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      double v13 = (void *)[v11 initWithString:v9 attributes:v12];
    }
    else
    {
      double v13 = 0;
    }
    v14 = [(MUBrowseCategoryCollectionViewCell *)self titleLabel];
    [v14 setAttributedText:v13];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MUBrowseCategoryCollectionViewCell;
  -[MUBrowseCategoryCollectionViewCell setHighlighted:](&v14, sel_setHighlighted_);
  double v5 = [(MUBrowseCategoryCollectionViewCell *)self highlightedImageView];
  double v6 = [v5 image];

  if (!v6)
  {
    v7 = [(MUBrowseCategoryCollectionViewCell *)self imageView];
    v8 = [v7 image];
    v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.150000006];
    id v10 = [v8 _flatImageWithColor:v9];
    id v11 = [(MUBrowseCategoryCollectionViewCell *)self highlightedImageView];
    [v11 setImage:v10];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__MUBrowseCategoryCollectionViewCell_setHighlighted___block_invoke;
  v12[3] = &unk_1E574EFF8;
  v12[4] = self;
  BOOL v13 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v12 animations:0.100000001];
}

void __53__MUBrowseCategoryCollectionViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) highlightedImageView];
  [v2 setAlpha:v1];
}

- (MUBrowseCategoryItem)browseItem
{
  return self->_browseItem;
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (UIFont)preferredTitleLabelFont
{
  return self->_preferredTitleLabelFont;
}

- (void)setPreferredTitleLabelFont:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)highlightedImageView
{
  return self->_highlightedImageView;
}

- (void)setHighlightedImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTopConstraint
{
  return self->_titleLabelTopConstraint;
}

- (void)setTitleLabelTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_highlightedImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_preferredTitleLabelFont, 0);
  objc_storeStrong((id *)&self->_browseItem, 0);
}

@end