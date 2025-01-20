@interface _CPUIImageRowCellImageTitleItem
- (CGSize)preferredSize;
- (_CPUIImageRowCellImageTitleItem)initWithFrame:(CGRect)a3;
- (_CPUIOutsetHighlightButton)button;
- (_CPUITopAlignedLabel)label;
- (void)configureWithArtwork:(id)a3 title:(id)a4 imageSize:(double)a5 fallbackImage:(id)a6;
- (void)setButton:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPreferredSize:(CGSize)a3;
@end

@implementation _CPUIImageRowCellImageTitleItem

- (_CPUIImageRowCellImageTitleItem)initWithFrame:(CGRect)a3
{
  v27[4] = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)_CPUIImageRowCellImageTitleItem;
  v3 = -[_CPUIImageRowCellImageTitleItem initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    [v4 _setCornerRadius:6.0];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 setContentHorizontalAlignment:3];
    [v4 setContentVerticalAlignment:3];
    v5 = [v4 imageView];
    [v5 setContentMode:2];

    v6 = [v4 imageView];
    [v6 setClipsToBounds:1];

    v7 = [v4 imageView];
    [v7 _setContinuousCornerRadius:4.0];

    [(_CPUIImageRowCellImageTitleItem *)v3 setButton:v4];
    v8 = [(_CPUIImageRowCellImageTitleItem *)v3 button];
    [v8 setAccessibilityIdentifier:@"CPListImageRowItemImage"];

    [(_CPUIImageRowCellImageTitleItem *)v3 addSubview:v4];
    v20 = (void *)MEMORY[0x263F08938];
    v25 = [v4 widthAnchor];
    v24 = [(_CPUIImageRowCellImageTitleItem *)v3 widthAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v27[0] = v23;
    v22 = [v4 heightAnchor];
    v21 = [v4 widthAnchor];
    v9 = [v22 constraintEqualToAnchor:v21];
    v27[1] = v9;
    v10 = [v4 topAnchor];
    v11 = [(_CPUIImageRowCellImageTitleItem *)v3 topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v27[2] = v12;
    v13 = [v4 leadingAnchor];
    v14 = [(_CPUIImageRowCellImageTitleItem *)v3 leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v27[3] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
    [v20 activateConstraints:v16];

    LODWORD(v17) = 1148846080;
    [(_CPUIImageRowCellImageTitleItem *)v3 setContentCompressionResistancePriority:0 forAxis:v17];
    LODWORD(v18) = 1148846080;
    [(_CPUIImageRowCellImageTitleItem *)v3 setContentHuggingPriority:0 forAxis:v18];
  }
  return v3;
}

- (void)configureWithArtwork:(id)a3 title:(id)a4 imageSize:(double)a5 fallbackImage:(id)a6
{
  v55[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(_CPUIImageRowCellImageTitleItem *)self button];
  v14 = [v13 artworkCatalog];

  if (!v14
    || ([v14 isEqual:v10] & 1) == 0
    && ([v14 isArtworkVisuallyIdenticalToCatalog:v10] & 1) == 0)
  {
    v15 = [(_CPUIImageRowCellImageTitleItem *)self button];
    [v15 setImage:v12 forState:0];

    objc_msgSend(v10, "setFittingSize:", a5, a5);
    v16 = [(_CPUIImageRowCellImageTitleItem *)self traitCollection];
    [v16 displayScale];
    objc_msgSend(v10, "setDestinationScale:");

    double v17 = (objc_class *)objc_opt_class();
    double v18 = NSStringFromClass(v17);
    [v10 setCacheIdentifier:v18 forCacheReference:self];

    v19 = [(_CPUIImageRowCellImageTitleItem *)self button];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __86___CPUIImageRowCellImageTitleItem_configureWithArtwork_title_imageSize_fallbackImage___block_invoke;
    v52[3] = &unk_26482D508;
    id v53 = v12;
    [v10 setDestination:v19 configurationBlock:v52];
  }
  uint64_t v20 = [v11 length];
  v21 = [(_CPUIImageRowCellImageTitleItem *)self label];
  v22 = v21;
  if (v20)
  {

    if (!v22)
    {
      v23 = (_CPUITopAlignedLabel *)objc_opt_new();
      label = self->_label;
      self->_label = v23;

      [(_CPUITopAlignedLabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
      [(_CPUITopAlignedLabel *)self->_label setNumberOfLines:2];
      v25 = [MEMORY[0x263F81708] systemFontOfSize:10.0 weight:*MEMORY[0x263F81838]];
      [(_CPUITopAlignedLabel *)self->_label setFont:v25];

      objc_super v26 = [MEMORY[0x263F825C8] labelColor];
      [(_CPUITopAlignedLabel *)self->_label setTextColor:v26];

      LODWORD(v27) = 1036831949;
      [(_CPUITopAlignedLabel *)self->_label _setHyphenationFactor:v27];
      v28 = [(_CPUIImageRowCellImageTitleItem *)self label];
      [(_CPUIImageRowCellImageTitleItem *)self addSubview:v28];

      v44 = (void *)MEMORY[0x263F08938];
      v49 = [(_CPUITopAlignedLabel *)self->_label leadingAnchor];
      v50 = [(_CPUIImageRowCellImageTitleItem *)self button];
      v48 = [v50 leadingAnchor];
      v47 = [v49 constraintEqualToAnchor:v48];
      v55[0] = v47;
      v45 = [(_CPUITopAlignedLabel *)self->_label trailingAnchor];
      v46 = [(_CPUIImageRowCellImageTitleItem *)self button];
      v43 = [v46 trailingAnchor];
      v42 = [v45 constraintEqualToAnchor:v43];
      v55[1] = v42;
      v41 = [(_CPUITopAlignedLabel *)self->_label bottomAnchor];
      v40 = [(_CPUIImageRowCellImageTitleItem *)self bottomAnchor];
      v29 = [v41 constraintEqualToAnchor:v40];
      v55[2] = v29;
      v30 = [(_CPUITopAlignedLabel *)self->_label topAnchor];
      v31 = [(_CPUIImageRowCellImageTitleItem *)self button];
      [v31 bottomAnchor];
      v51 = v14;
      v33 = id v32 = v12;
      v34 = [v30 constraintEqualToAnchor:v33 constant:4.0];
      v55[3] = v34;
      v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:4];
      [v44 activateConstraints:v35];

      id v12 = v32;
      v14 = v51;
    }
    v36 = [(_CPUIImageRowCellImageTitleItem *)self label];
    [v36 setText:v11];

    v37 = [(_CPUIImageRowCellImageTitleItem *)self label];
    [v37 setAccessibilityIdentifier:@"CPListImageRowItemImageTitle"];

    id v54 = v11;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
    v39 = [(_CPUIImageRowCellImageTitleItem *)self button];
    [v39 setAccessibilityUserInputLabels:v38];
  }
  else
  {
    [v21 removeFromSuperview];

    [(_CPUIImageRowCellImageTitleItem *)self setLabel:0];
    v38 = [(_CPUIImageRowCellImageTitleItem *)self button];
    [v38 setAccessibilityUserInputLabels:MEMORY[0x263EFFA68]];
  }

  [(_CPUIImageRowCellImageTitleItem *)self invalidateIntrinsicContentSize];
}

- (_CPUIOutsetHighlightButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (_CPUITopAlignedLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end