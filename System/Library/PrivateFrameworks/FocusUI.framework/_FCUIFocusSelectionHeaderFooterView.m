@interface _FCUIFocusSelectionHeaderFooterView
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)preferredContentSizeCategory;
- (_FCUIFocusSelectionHeaderFooterView)initWithText:(id)a3;
- (id)_attributedTextForText:(id)a3;
- (id)_labelFont;
- (void)_configureLabel:(id)a3;
- (void)_configureLabelIfNecessary;
- (void)_layoutSubviewsInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4;
- (void)_setNeedsTextAttributesUpdate;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForLabel:(id)a3;
- (void)_updateTextAttributesIfNecessary;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
@end

@implementation _FCUIFocusSelectionHeaderFooterView

- (_FCUIFocusSelectionHeaderFooterView)initWithText:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_FCUIFocusSelectionHeaderFooterView;
  v5 = [(_FCUIFocusSelectionHeaderFooterView *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(_FCUIFocusSelectionHeaderFooterView *)v5 setAdjustsFontForContentSizeCategory:1];
    [(_FCUIFocusSelectionHeaderFooterView *)v6 _configureLabelIfNecessary];
    v7 = [(_FCUIFocusSelectionHeaderFooterView *)v6 _attributedTextForText:v4];
    label = v6->_label;
    if (v7) {
      [(UILabel *)label setAttributedText:v7];
    }
    else {
      [(UILabel *)label setText:v4];
    }
  }
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  long long v6 = *MEMORY[0x263F001B0];
  BSRectWithSize();
  -[_FCUIFocusSelectionHeaderFooterView _layoutSubviewsInBounds:measuringOnly:](self, "_layoutSubviewsInBounds:measuringOnly:", &v6);
  double v5 = *((double *)&v6 + 1);
  double v4 = *(double *)&v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_FCUIFocusSelectionHeaderFooterView;
  [(_FCUIFocusSelectionHeaderFooterView *)&v3 layoutSubviews];
  [(_FCUIFocusSelectionHeaderFooterView *)self _updateTextAttributesIfNecessary];
  [(_FCUIFocusSelectionHeaderFooterView *)self bounds];
  -[_FCUIFocusSelectionHeaderFooterView _layoutSubviewsInBounds:measuringOnly:](self, "_layoutSubviewsInBounds:measuringOnly:", 0);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    [(_FCUIFocusSelectionHeaderFooterView *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  objc_super v3 = [(_FCUIFocusSelectionHeaderFooterView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);

  if (v5) {
    [(_FCUIFocusSelectionHeaderFooterView *)self _setNeedsTextAttributesUpdate];
  }
  return v5 != NSOrderedSame;
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  v17[1] = *MEMORY[0x263EF8340];
  if (a3) {
    [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  v7 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  uint64_t v16 = *MEMORY[0x263F817A0];
  uint64_t v14 = *MEMORY[0x263F81850];
  v8 = [NSNumber numberWithDouble:a5];
  v15 = v8;
  v9 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v9;
  objc_super v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v11 = [v7 fontDescriptorByAddingAttributes:v10];

  v12 = [MEMORY[0x263F81708] fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (id)_attributedTextForText:(id)a3
{
  return 0;
}

- (void)_layoutSubviewsInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4
{
}

- (id)_labelFont
{
  v2 = objc_opt_class();
  uint64_t v3 = *MEMORY[0x263F835F0];
  double v4 = *MEMORY[0x263F81838];
  return (id)[v2 _preferredFont:1 textStyle:v3 weight:0 additionalTraits:v4];
}

- (void)_updateTextAttributesForLabel:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    NSComparisonResult v5 = [(_FCUIFocusSelectionHeaderFooterView *)self _labelFont];
    [v4 setFont:v5];

    [(_FCUIFocusSelectionHeaderFooterView *)self setNeedsLayout];
  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_preferredContentSizeCategory == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = 0;

  [(_FCUIFocusSelectionHeaderFooterView *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  uint64_t v3 = [(_FCUIFocusSelectionHeaderFooterView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  label = self->_label;
  [(_FCUIFocusSelectionHeaderFooterView *)self _updateTextAttributesForLabel:label];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(_FCUIFocusSelectionHeaderFooterView *)self _needsTextAttributesUpdate])
  {
    [(_FCUIFocusSelectionHeaderFooterView *)self _updateTextAttributes];
  }
}

- (void)_configureLabel:(id)a3
{
  if (a3)
  {
    [(UILabel *)self->_label setNumberOfLines:0];
    [(UILabel *)self->_label setTextAlignment:1];
    label = self->_label;
    id v5 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)label setTextColor:v5];
  }
}

- (void)_configureLabelIfNecessary
{
  if (!self->_label)
  {
    uint64_t v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    label = self->_label;
    self->_label = v3;

    [(_FCUIFocusSelectionHeaderFooterView *)self _configureLabel:self->_label];
    [(_FCUIFocusSelectionHeaderFooterView *)self addSubview:self->_label];
    id v5 = self->_label;
    [(_FCUIFocusSelectionHeaderFooterView *)self _updateTextAttributesForLabel:v5];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end