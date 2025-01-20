@interface DOCLargeTagView
- (DOCLargeTagView)initWithFrame:(CGRect)a3;
- (DOCTag)tagValue;
- (DOCTagCheckmarkView)checkmarkView;
- (DOCTagDotView)tagDotView;
- (UILabel)tagNameLabel;
- (int64_t)selectionType;
- (void)_updateBackgroundColor;
- (void)_updateSelectionIndications;
- (void)layoutSubviews;
- (void)setSelectionType:(int64_t)a3;
- (void)setTagValue:(id)a3;
- (void)updateBackground;
@end

@implementation DOCLargeTagView

- (DOCLargeTagView)initWithFrame:(CGRect)a3
{
  v75[9] = *MEMORY[0x263EF8340];
  v74.receiver = self;
  v74.super_class = (Class)DOCLargeTagView;
  v3 = -[DOCLargeTagView initWithFrame:](&v74, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[DOCTagAppearance pickerList];
    [v4 cellCornerRadius];
    -[DOCLargeTagView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:");

    [(DOCLargeTagView *)v3 updateBackground];
    v5 = [[DOCTagDotView alloc] initWithDefaultTagDimension:1 adjustsSizeForContentSizeCategory:DOCDefaultTagDimension()];
    tagDotView = v3->_tagDotView;
    v3->_tagDotView = v5;

    v7 = objc_alloc_init(DOCTagCheckmarkView);
    checkmarkView = v3->_checkmarkView;
    v3->_checkmarkView = v7;

    [(DOCTagCheckmarkView *)v3->_checkmarkView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DOCTagCheckmarkView *)v3->_checkmarkView setHidden:1];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    tagNameLabel = v3->_tagNameLabel;
    v3->_tagNameLabel = v9;

    [(UILabel *)v3->_tagNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = (void *)MEMORY[0x263F81708];
    v12 = +[DOCTagAppearance pickerList];
    v13 = [v12 titleTextStyle];
    v14 = [(DOCLargeTagView *)v3 traitCollection];
    v15 = [v11 preferredFontForTextStyle:v13 compatibleWithTraitCollection:v14];
    [(UILabel *)v3->_tagNameLabel setFont:v15];

    [(UILabel *)v3->_tagNameLabel setAdjustsFontForContentSizeCategory:1];
    v16 = [(DOCLargeTagView *)v3 tagDotView];
    [(DOCLargeTagView *)v3 addSubview:v16];

    v17 = [(DOCLargeTagView *)v3 tagNameLabel];
    [(DOCLargeTagView *)v3 addSubview:v17];

    v18 = [(DOCLargeTagView *)v3 checkmarkView];
    [(DOCLargeTagView *)v3 addSubview:v18];

    v19 = +[DOCTagAppearance pickerList];
    [v19 cellInteriorLayoutMargins];
    [(DOCLargeTagView *)v3 setDirectionalLayoutMargins:"setDirectionalLayoutMargins:"];

    v55 = (void *)MEMORY[0x263F08938];
    v72 = [(DOCLargeTagView *)v3 leadingAnchor];
    v73 = [(DOCLargeTagView *)v3 tagDotView];
    v70 = [v73 leadingAnchor];
    v71 = +[DOCTagAppearance pickerList];
    objc_msgSend(v71, "spacing_leadingEdgeToDot");
    v69 = [v72 constraintEqualToAnchor:v70 constant:-v20];
    v75[0] = v69;
    v68 = [(DOCLargeTagView *)v3 tagDotView];
    v66 = [v68 trailingAnchor];
    v67 = [(DOCLargeTagView *)v3 tagNameLabel];
    v64 = [v67 leadingAnchor];
    v65 = +[DOCTagAppearance pickerList];
    objc_msgSend(v65, "spacing_dotToTitle");
    v63 = [v66 constraintEqualToAnchor:v64 constant:-v21];
    v75[1] = v63;
    v62 = [(DOCLargeTagView *)v3 tagNameLabel];
    v60 = [v62 trailingAnchor];
    v61 = [(DOCLargeTagView *)v3 checkmarkView];
    v58 = [v61 leadingAnchor];
    v59 = +[DOCTagAppearance pickerList];
    objc_msgSend(v59, "spacing_titleToCheckmark");
    v57 = [v60 constraintLessThanOrEqualToAnchor:v58 constant:-v22];
    v75[2] = v57;
    v56 = [(DOCLargeTagView *)v3 checkmarkView];
    v54 = [v56 trailingAnchor];
    v52 = [(DOCLargeTagView *)v3 trailingAnchor];
    v53 = +[DOCTagAppearance pickerList];
    objc_msgSend(v53, "spacing_trailingEdgeToCheckmark");
    v51 = [v54 constraintEqualToAnchor:v52 constant:-v23];
    v75[3] = v51;
    v50 = [(DOCLargeTagView *)v3 tagNameLabel];
    v48 = [v50 firstBaselineAnchor];
    v49 = [(DOCLargeTagView *)v3 layoutMarginsGuide];
    v47 = [v49 topAnchor];
    v46 = [v48 constraintEqualToSystemSpacingBelowAnchor:v47 multiplier:0.979591837];
    v75[4] = v46;
    v45 = [(DOCLargeTagView *)v3 layoutMarginsGuide];
    v43 = [v45 bottomAnchor];
    v44 = [(DOCLargeTagView *)v3 tagNameLabel];
    v42 = [v44 lastBaselineAnchor];
    v41 = [v43 constraintEqualToSystemSpacingBelowAnchor:v42 multiplier:1.12];
    v75[5] = v41;
    v40 = [(DOCLargeTagView *)v3 tagDotView];
    v38 = [v40 centerYAnchor];
    v39 = [(DOCLargeTagView *)v3 tagNameLabel];
    v37 = [v39 centerYAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v75[6] = v36;
    v35 = [(DOCLargeTagView *)v3 checkmarkView];
    v34 = [v35 centerYAnchor];
    v24 = [(DOCLargeTagView *)v3 tagNameLabel];
    v25 = [v24 centerYAnchor];
    v26 = [v34 constraintEqualToAnchor:v25];
    v75[7] = v26;
    v27 = [(DOCLargeTagView *)v3 checkmarkView];
    v28 = [v27 heightAnchor];
    v29 = [(DOCLargeTagView *)v3 tagDotView];
    v30 = [v29 heightAnchor];
    v31 = [v28 constraintLessThanOrEqualToAnchor:v30 multiplier:1.25];
    v75[8] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:9];
    [v55 activateConstraints:v32];
  }
  return v3;
}

- (void)setTagValue:(id)a3
{
  v5 = (DOCTag *)a3;
  p_tagValue = (id *)&self->_tagValue;
  if (self->_tagValue != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_tagValue, a3);
    id v7 = *p_tagValue;
    v8 = [(DOCLargeTagView *)self tagDotView];
    [v8 setItemTag:v7];

    id v9 = *p_tagValue;
    v10 = [(DOCLargeTagView *)self checkmarkView];
    [v10 setItemTag:v9];

    v11 = [*p_tagValue displayName];
    v12 = [(DOCLargeTagView *)self tagNameLabel];
    [v12 setText:v11];

    [(DOCLargeTagView *)self updateBackground];
    v5 = v13;
  }
}

- (void)setSelectionType:(int64_t)a3
{
  if (self->_selectionType != a3)
  {
    self->_selectionType = a3;
    [(DOCLargeTagView *)self updateBackground];
  }
}

- (void)updateBackground
{
  [(DOCLargeTagView *)self _updateBackgroundColor];

  [(DOCLargeTagView *)self _updateSelectionIndications];
}

- (void)_updateBackgroundColor
{
  int64_t v3 = [(DOCLargeTagView *)self selectionType];
  if (v3 == 2)
  {
    id v9 = +[DOCTagAppearance pickerList];
    v4 = [(DOCLargeTagView *)self tagValue];
    v5 = v9;
    v6 = v4;
    uint64_t v7 = 0;
LABEL_6:
    v8 = [v5 backgroundColorForTag:v6 selected:v7];
    [(DOCLargeTagView *)self setBackgroundColor:v8];

    return;
  }
  if (v3 != 1)
  {
    if (v3) {
      return;
    }
    id v9 = +[DOCTagAppearance pickerList];
    v4 = [(DOCLargeTagView *)self tagValue];
    v5 = v9;
    v6 = v4;
    uint64_t v7 = 1;
    goto LABEL_6;
  }

  [(DOCLargeTagView *)self setBackgroundColor:0];
}

- (void)_updateSelectionIndications
{
  BOOL v3 = [(DOCLargeTagView *)self selectionType] == 2;
  v4 = [(DOCLargeTagView *)self checkmarkView];
  [v4 setHidden:v3];

  v5 = +[DOCTagAppearance renderingAppearance];
  LODWORD(v4) = [v5 outlineTagsToIndicateMixedState];

  int64_t v6 = [(DOCLargeTagView *)self selectionType];
  if (v4)
  {
    id v11 = [(DOCLargeTagView *)self tagDotView];
    [v11 setRenderedTagVariant:v6 == 1];
  }
  else
  {
    uint64_t v7 = [(DOCLargeTagView *)self layer];
    id v11 = v7;
    if (v6 == 1)
    {
      [v7 setBorderWidth:2.0];

      id v11 = [(DOCLargeTagView *)self tagValue];
      id v8 = [v11 tagBackgroundColor];
      uint64_t v9 = [v8 CGColor];
      v10 = [(DOCLargeTagView *)self layer];
      [v10 setBorderColor:v9];
    }
    else
    {
      [v7 setBorderWidth:0.0];
    }
  }
}

- (void)layoutSubviews
{
  [(DOCLargeTagView *)self updateBackground];
  v3.receiver = self;
  v3.super_class = (Class)DOCLargeTagView;
  [(DOCLargeTagView *)&v3 layoutSubviews];
}

- (DOCTag)tagValue
{
  return self->_tagValue;
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (DOCTagDotView)tagDotView
{
  return self->_tagDotView;
}

- (UILabel)tagNameLabel
{
  return self->_tagNameLabel;
}

- (DOCTagCheckmarkView)checkmarkView
{
  return self->_checkmarkView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_tagNameLabel, 0);
  objc_storeStrong((id *)&self->_tagDotView, 0);

  objc_storeStrong((id *)&self->_tagValue, 0);
}

@end