@interface DOCTagsCollectionItemContentView
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isMixed;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (DOCTag)tagValue;
- (DOCTagsCollectionItemContentView)initWithFrame:(CGRect)a3;
- (DOCTagsCollectionItemContentViewDelegate)delegate;
- (UILabel)tagNameLabel;
- (UIMenu)menuForContextMenuPresentation;
- (double)cornerRadius;
- (double)maxWidth;
- (id)_tagCollectionAppearance;
- (id)fontForTagSizing;
- (void)layoutSubviews;
- (void)removeTag:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setIsMixed:(BOOL)a3;
- (void)setMaxWidth:(double)a3;
- (void)setTagValue:(id)a3;
- (void)updateAttributedString;
- (void)updateColors;
- (void)updateForChangedTraitsAffectingFonts;
@end

@implementation DOCTagsCollectionItemContentView

- (id)_tagCollectionAppearance
{
  return +[DOCTagAppearance infoCollection];
}

- (DOCTagsCollectionItemContentView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)DOCTagsCollectionItemContentView;
  v3 = -[DOCTagsCollectionItemContentView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[DOCTagAppearance infoCollection];
    [v4 cellCornerRadius];
    -[DOCTagsCollectionItemContentView setCornerRadius:](v3, "setCornerRadius:");
    [(DOCTagsCollectionItemContentView *)v3 cornerRadius];
    -[DOCTagsCollectionItemContentView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:");
    v3->_maxWidth = -1.0;
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    tagNameLabel = v3->_tagNameLabel;
    v3->_tagNameLabel = v5;

    v7 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v3->_tagNameLabel setTextColor:v7];

    v8 = (void *)MEMORY[0x263F81708];
    v9 = [v4 labelFontStyle];
    v10 = [(DOCTagsCollectionItemContentView *)v3 traitCollection];
    v11 = [v8 preferredFontForTextStyle:v9 compatibleWithTraitCollection:v10];
    [(UILabel *)v3->_tagNameLabel setFont:v11];

    [(UILabel *)v3->_tagNameLabel setAdjustsFontForContentSizeCategory:1];
    [(DOCTagsCollectionItemContentView *)v3 addSubview:v3->_tagNameLabel];
    v12 = objc_msgSend(MEMORY[0x263F82DA0], "doc_traitsAffectingFonts");
    id v13 = (id)[(DOCTagsCollectionItemContentView *)v3 registerForTraitChanges:v12 withAction:sel_updateForChangedTraitsAffectingFonts];
  }
  return v3;
}

- (void)removeTag:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  tagValue = self->_tagValue;

  if (WeakRetained) {
    BOOL v7 = tagValue == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 tagsCollectionItem:self didDeleteTag:self->_tagValue];
  }
}

- (void)setTagValue:(id)a3
{
  v5 = (DOCTag *)a3;
  p_tagValue = &self->_tagValue;
  if (self->_tagValue != v5)
  {
    BOOL v7 = v5;
    objc_storeStrong((id *)p_tagValue, a3);
    [(DOCTagsCollectionItemContentView *)self updateColors];
    [(DOCTagsCollectionItemContentView *)self updateAttributedString];
    p_tagValue = (DOCTag **)[(DOCTagsCollectionItemContentView *)self invalidateIntrinsicContentSize];
    v5 = v7;
  }

  MEMORY[0x270F9A758](p_tagValue, v5);
}

- (void)setMaxWidth:(double)a3
{
  if (self->_maxWidth != a3)
  {
    self->_maxWidth = a3;
    [(DOCTagsCollectionItemContentView *)self invalidateIntrinsicContentSize];
  }
}

- (void)layoutSubviews
{
  v3 = +[DOCTagAppearance infoCollection];
  [(DOCTagsCollectionItemContentView *)self updateColors];
  v21.receiver = self;
  v21.super_class = (Class)DOCTagsCollectionItemContentView;
  [(DOCTagsCollectionItemContentView *)&v21 layoutSubviews];
  [(DOCTagsCollectionItemContentView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 cellContentInsets];
  double v13 = v5 + v12;
  double v15 = v9 - (v12 + v14);
  double v17 = v7 + v16;
  double v19 = v11 - (v16 + v18);
  v20 = [(DOCTagsCollectionItemContentView *)self tagNameLabel];
  objc_msgSend(v20, "setFrame:", v13, v17, v15, v19);
}

- (CGSize)intrinsicContentSize
{
  v3 = +[DOCTagAppearance infoCollection];
  [v3 cellContentInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(DOCTagsCollectionItemContentView *)self tagNameLabel];
  [v12 intrinsicContentSize];
  double v14 = v13;
  double v16 = v15;

  double v17 = v7 + v11 + v14;
  double maxWidth = self->_maxWidth;
  if (v17 > maxWidth && maxWidth > -1.0) {
    double v17 = self->_maxWidth;
  }
  double v20 = v5 + v9 + v16;
  result.height = v20;
  result.width = v17;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = +[DOCTagAppearance infoCollection];
  [v6 cellContentInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = [(DOCTagsCollectionItemContentView *)self tagNameLabel];
  objc_msgSend(v15, "systemLayoutSizeFittingSize:", width, height);
  double v17 = v16;
  double v19 = v18;

  double v20 = v10 + v14 + v17;
  double maxWidth = self->_maxWidth;
  if (v20 > maxWidth && maxWidth > -1.0) {
    double v20 = self->_maxWidth;
  }
  double v23 = v8 + v12 + v19;
  result.double height = v23;
  result.double width = v20;
  return result;
}

- (void)setIsMixed:(BOOL)a3
{
  if (self->_isMixed != a3)
  {
    self->_isMixed = a3;
    [(DOCTagsCollectionItemContentView *)self updateColors];
    [(DOCTagsCollectionItemContentView *)self updateAttributedString];
  }
}

- (void)updateColors
{
  if ([(DOCTagsCollectionItemContentView *)self isMixed])
  {
    v3 = [MEMORY[0x263F825C8] clearColor];
    [(DOCTagsCollectionItemContentView *)self setBackgroundColor:v3];

    double v4 = [(DOCTagsCollectionItemContentView *)self tagValue];
    id v5 = [v4 tagBackgroundColor];
    uint64_t v6 = [v5 CGColor];
    double v7 = [(DOCTagsCollectionItemContentView *)self layer];
    [v7 setBorderColor:v6];

    double v8 = [(DOCTagsCollectionItemContentView *)self layer];
    double v9 = 1.0;
  }
  else
  {
    double v10 = [(DOCTagsCollectionItemContentView *)self tagValue];
    double v11 = [v10 tagBackgroundColor];
    [(DOCTagsCollectionItemContentView *)self setBackgroundColor:v11];

    id v12 = [MEMORY[0x263F825C8] clearColor];
    uint64_t v13 = [v12 CGColor];
    double v14 = [(DOCTagsCollectionItemContentView *)self layer];
    [v14 setBorderColor:v13];

    double v8 = [(DOCTagsCollectionItemContentView *)self layer];
    double v9 = 0.0;
  }
  id v15 = v8;
  [v8 setBorderWidth:v9];
}

- (id)fontForTagSizing
{
  v2 = [(DOCTagsCollectionItemContentView *)self tagNameLabel];
  v3 = [v2 font];
  double v4 = [v3 _fontAdjustedForCurrentContentSizeCategory];

  return v4;
}

- (void)updateAttributedString
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v18 = *MEMORY[0x263F814F0];
  v3 = [(DOCTagsCollectionItemContentView *)self fontForTagSizing];
  v19[0] = v3;
  double v4 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  if ([(DOCTagsCollectionItemContentView *)self isMixed])
  {
    id v5 = +[DOCTagAppearance renderingAppearance];
    LODWORD(v6) = [v5 outlineTagsToIndicateMixedState];

    uint64_t v6 = v6;
  }
  else
  {
    uint64_t v6 = 0;
  }
  double v7 = [(DOCTagsCollectionItemContentView *)self fontForTagSizing];
  [v7 capHeight];
  double v9 = v8 + 0.0;

  double v10 = [(DOCTagsCollectionItemContentView *)self tagValue];
  double v11 = [v10 displayName];

  id v12 = [(DOCTagsCollectionItemContentView *)self tagValue];
  uint64_t v13 = +[DOCTagStringRenderingRequest requestForTag:v12 tagDimension:v11 text:v4 textAttributes:v6 variant:v9];

  [v13 setAllowUnsizedSymbolImages:1];
  double v14 = +[DOCTagAppearance infoCollection];
  [v14 tagToLabelSpacing];
  objc_msgSend(v13, "setTagToTitleSpacing:");

  objc_msgSend(v13, "setLayoutDirection:", -[DOCTagsCollectionItemContentView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"));
  [v13 setClearTagRenderingMode:1];
  id v15 = [(DOCTagsCollectionItemContentView *)self tagNameLabel];
  double v16 = +[DOCTagRenderer shared];
  double v17 = [v16 renderAttributedStringWithRequest:v13];
  [v15 setAttributedText:v17];
}

- (void)updateForChangedTraitsAffectingFonts
{
  [(DOCTagsCollectionItemContentView *)self updateAttributedString];

  [(DOCTagsCollectionItemContentView *)self setNeedsLayout];
}

- (UIMenu)menuForContextMenuPresentation
{
  v17[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v2 = [MEMORY[0x263F827E8] systemImageNamed:@"tag.slash"];
  v3 = (void *)MEMORY[0x263F823D0];
  double v4 = _DocumentManagerBundle();
  id v5 = [v4 localizedStringForKey:@"Remove Tag" value:@"Remove Tag" table:@"Localizable"];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __66__DOCTagsCollectionItemContentView_menuForContextMenuPresentation__block_invoke;
  double v14 = &unk_2648FB8D0;
  objc_copyWeak(&v15, &location);
  uint64_t v6 = [v3 actionWithTitle:v5 image:v2 identifier:0 handler:&v11];

  objc_msgSend(v6, "setAttributes:", 2, v11, v12, v13, v14);
  double v7 = (void *)MEMORY[0x263F82940];
  v17[0] = v6;
  double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  double v9 = [v7 menuWithTitle:&stru_26DF49380 image:0 identifier:0 options:1 children:v8];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return (UIMenu *)v9;
}

void __66__DOCTagsCollectionItemContentView_menuForContextMenuPresentation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeTag:0];
}

- (DOCTag)tagValue
{
  return self->_tagValue;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (BOOL)isMixed
{
  return self->_isMixed;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (DOCTagsCollectionItemContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DOCTagsCollectionItemContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)tagNameLabel
{
  return self->_tagNameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagNameLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_tagValue, 0);
}

@end