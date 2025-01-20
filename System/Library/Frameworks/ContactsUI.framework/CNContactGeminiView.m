@interface CNContactGeminiView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_hasBaseline;
- (BOOL)allowsPickerActions;
- (BOOL)didCalculateLayout;
- (BOOL)doesLayoutRequireTwoLines;
- (BOOL)isUsingTwoLineLayout;
- (BOOL)shouldDisplayBadge;
- (CGSize)sizeForSingleLineLayoutFittingSize:(CGSize)a3;
- (CGSize)sizeForTwoLineLayoutFittingSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNContactGeminiView)initWithFrame:(CGRect)a3;
- (CNGeminiBadge)geminiBadge;
- (CNGeminiResult)geminiResult;
- (NSArray)activatedConstraints;
- (NSDictionary)ab_textAttributes;
- (UIColor)backgroundColor;
- (UIColor)highlightedColor;
- (UIImageView)chevronView;
- (UILabel)geminiLabel;
- (UILabel)typeLabel;
- (UILayoutGuide)geminiLabelLayoutGuide;
- (UILayoutGuide)layoutGuide;
- (id)geminiViewChevronImage;
- (id)localizedChannelUsageFromGeminiResult:(id)a3;
- (id)localizedLabelFromGeminiResult:(id)a3;
- (id)singleLineLayoutConstraints;
- (id)twoLineLayoutConstraints;
- (void)calculateLayoutIfNeeded;
- (void)layoutSubviews;
- (void)setAb_textAttributes:(id)a3;
- (void)setActivatedConstraints:(id)a3;
- (void)setAllowsPickerActions:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setChevronView:(id)a3;
- (void)setDidCalculateLayout:(BOOL)a3;
- (void)setGeminiBadge:(id)a3;
- (void)setGeminiLabel:(id)a3;
- (void)setGeminiLabelLayoutGuide:(id)a3;
- (void)setGeminiResult:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedColor:(id)a3;
- (void)setIsUsingTwoLineLayout:(BOOL)a3;
- (void)setLayoutGuide:(id)a3;
- (void)setNeedsCalculateLayout;
- (void)setTypeLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation CNContactGeminiView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_geminiLabel, 0);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_geminiBadge, 0);
  objc_storeStrong((id *)&self->_geminiLabelLayoutGuide, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_ab_textAttributes, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedColor, 0);

  objc_storeStrong((id *)&self->_geminiResult, 0);
}

- (void)setIsUsingTwoLineLayout:(BOOL)a3
{
  self->_isUsingTwoLineLayout = a3;
}

- (BOOL)isUsingTwoLineLayout
{
  return self->_isUsingTwoLineLayout;
}

- (void)setDidCalculateLayout:(BOOL)a3
{
  self->_didCalculateLayout = a3;
}

- (BOOL)didCalculateLayout
{
  return self->_didCalculateLayout;
}

- (void)setActivatedConstraints:(id)a3
{
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setChevronView:(id)a3
{
}

- (UIImageView)chevronView
{
  return self->_chevronView;
}

- (void)setGeminiLabel:(id)a3
{
}

- (UILabel)geminiLabel
{
  return self->_geminiLabel;
}

- (void)setTypeLabel:(id)a3
{
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setGeminiBadge:(id)a3
{
}

- (CNGeminiBadge)geminiBadge
{
  return self->_geminiBadge;
}

- (void)setGeminiLabelLayoutGuide:(id)a3
{
}

- (UILayoutGuide)geminiLabelLayoutGuide
{
  return self->_geminiLabelLayoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (NSDictionary)ab_textAttributes
{
  return self->_ab_textAttributes;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)highlightedColor
{
  return self->_highlightedColor;
}

- (CNGeminiResult)geminiResult
{
  return self->_geminiResult;
}

- (void)setAllowsPickerActions:(BOOL)a3
{
  self->_allowsPickerActions = a3;
}

- (BOOL)allowsPickerActions
{
  return self->_allowsPickerActions;
}

- (BOOL)_hasBaseline
{
  v2 = [(CNContactGeminiView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 3;

  return v3;
}

- (id)geminiViewChevronImage
{
  BOOL v3 = [(CNContactGeminiView *)self geminiResult];
  uint64_t v4 = [v3 usage];

  v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = [(CNContactGeminiView *)self backgroundColor];
  if (v4 == 4) {
    objc_msgSend(v5, "cnui_symbolImageForUnknownNumberContactCardChevronWithColor:", v6);
  }
  else {
  v7 = objc_msgSend(v5, "cnui_symbolImageForDynamicallySizedContactCardChevronWithColor:", v6);
  }

  return v7;
}

- (void)setGeminiResult:(id)a3
{
  id v29 = a3;
  v5 = [(CNContactGeminiView *)self chevronView];
  int v6 = [v5 isHidden];

  v7 = [(CNContactGeminiView *)self geminiBadge];
  int v8 = [v7 isHidden];

  v9 = self->_geminiResult;
  objc_storeStrong((id *)&self->_geminiResult, a3);
  v10 = [(CNContactGeminiView *)self localizedChannelUsageFromGeminiResult:v29];
  if ([(CNContactGeminiView *)self shouldDisplayBadge])
  {
    v11 = [v29 channel];
    v12 = [v11 localizedBadgeLabel];
  }
  else
  {
    v12 = @"-";
  }
  v13 = [(CNContactGeminiView *)self localizedLabelFromGeminiResult:v29];
  v14 = [(CNContactGeminiView *)self typeLabel];
  [v14 setText:v10];

  uint64_t v15 = [(CNContactGeminiView *)self shouldDisplayBadge] ^ 1;
  v16 = [(CNContactGeminiView *)self geminiBadge];
  [v16 setHidden:v15];

  v17 = [(CNContactGeminiView *)self geminiBadge];
  [v17 setText:v12];

  v18 = [(CNContactGeminiView *)self geminiLabel];
  [v18 setText:v13];

  v19 = [(CNContactGeminiView *)self backgroundColor];
  v20 = [(CNContactGeminiView *)self geminiBadge];
  [v20 setTextColor:v19];

  v21 = [(CNContactGeminiView *)self geminiViewChevronImage];
  v22 = [(CNContactGeminiView *)self chevronView];
  [v22 setImage:v21];

  uint64_t v23 = [(CNContactGeminiView *)self shouldDisplayChevron] ^ 1;
  v24 = [(CNContactGeminiView *)self chevronView];
  [v24 setHidden:v23];

  if (v9 != self->_geminiResult)
  {
    [(CNContactGeminiView *)self setNeedsCalculateLayout];
    [(CNContactGeminiView *)self bounds];
    if (v25 > 0.0) {
      [(CNContactGeminiView *)self calculateLayoutIfNeeded];
    }
  }
  v26 = [(CNContactGeminiView *)self chevronView];
  if (v6 == [v26 isHidden])
  {
    v27 = [(CNContactGeminiView *)self geminiBadge];
    int v28 = [v27 isHidden];

    if (v8 == v28) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  [(CNContactGeminiView *)self setNeedsUpdateConstraints];
LABEL_11:
}

- (id)localizedLabelFromGeminiResult:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 channel];
  int v5 = [v4 isAvailable];

  int v6 = CNContactsUIBundle();
  v7 = v6;
  if (v5) {
    int v8 = @"PREFERRED_LINE_CONTACT_HEADER_VALUE-%@";
  }
  else {
    int v8 = @"PREFERRED_LINE_CONTACT_HEADER_VALUE_UNAVAILBLE-%@";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_1ED8AC728 table:@"Localized-GEMINI"];

  v10 = NSString;
  v11 = [v3 channel];

  v12 = [v11 localizedLabel];
  v13 = objc_msgSend(v10, "stringWithFormat:", v9, v12);

  return v13;
}

- (id)localizedChannelUsageFromGeminiResult:(id)a3
{
  uint64_t v3 = [a3 usage];
  switch(v3)
  {
    case 4:
      uint64_t v4 = CNContactsUIBundle();
      int v5 = v4;
      int v6 = @"PREFERRED_LINE_CONTACT_HEADER_UNKNOWN_CONTACT_SIM_LINE";
      break;
    case 2:
      uint64_t v4 = CNContactsUIBundle();
      int v5 = v4;
      int v6 = @"PREFERRED_LINE_CONTACT_HEADER_LAST_USED_LABEL";
      break;
    case 1:
      uint64_t v4 = CNContactsUIBundle();
      int v5 = v4;
      int v6 = @"PREFERRED_LINE_CONTACT_HEADER_ALWAYS_USE_LABEL";
      break;
    default:
      uint64_t v4 = CNContactsUIBundle();
      int v5 = v4;
      int v6 = @"PREFERRED_LINE_CONTACT_HEADER_DEFAULT_LABEL";
      break;
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_1ED8AC728 table:@"Localized-GEMINI"];

  return v7;
}

- (id)twoLineLayoutConstraints
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = (void *)MEMORY[0x1E4F28DC8];
  int v5 = [(CNContactGeminiView *)self layoutGuide];
  int v6 = [v4 constraintWithItem:self attribute:8 relatedBy:0 toItem:v5 attribute:8 multiplier:1.0 constant:0.0];
  [v3 addObject:v6];

  v7 = (void *)MEMORY[0x1E4F28DC8];
  int v8 = [(CNContactGeminiView *)self layoutGuide];
  v9 = [v7 constraintWithItem:self attribute:9 relatedBy:0 toItem:v8 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v9];

  v10 = (void *)MEMORY[0x1E4F28DC8];
  v11 = [(CNContactGeminiView *)self geminiLabelLayoutGuide];
  v12 = [(CNContactGeminiView *)self geminiLabel];
  v13 = [v10 constraintWithItem:v11 attribute:8 relatedBy:1 toItem:v12 attribute:8 multiplier:1.0 constant:0.0];
  [v3 addObject:v13];

  if ([(CNContactGeminiView *)self shouldDisplayBadge])
  {
    v14 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v15 = [(CNContactGeminiView *)self geminiLabelLayoutGuide];
    v16 = [(CNContactGeminiView *)self geminiBadge];
    v17 = [v14 constraintWithItem:v15 attribute:8 relatedBy:1 toItem:v16 attribute:8 multiplier:1.0 constant:0.0];
    [v3 addObject:v17];
  }
  v18 = (void *)MEMORY[0x1E4F28DC8];
  v19 = [(CNContactGeminiView *)self geminiLabelLayoutGuide];
  v20 = [v18 constraintWithItem:v19 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v20];

  v21 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [(CNContactGeminiView *)self typeLabel];
  uint64_t v23 = [v21 constraintWithItem:self attribute:3 relatedBy:0 toItem:v22 attribute:3 multiplier:1.0 constant:0.0];
  [v3 addObject:v23];

  v24 = (void *)MEMORY[0x1E4F28DC8];
  double v25 = [(CNContactGeminiView *)self geminiLabel];
  v26 = [(CNContactGeminiView *)self typeLabel];
  v27 = [v24 constraintWithItem:v25 attribute:3 relatedBy:0 toItem:v26 attribute:4 multiplier:1.0 constant:5.0];
  [v3 addObject:v27];

  int v28 = (void *)MEMORY[0x1E4F28DC8];
  id v29 = [(CNContactGeminiView *)self geminiLabel];
  v30 = [v28 constraintWithItem:v29 attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:0.0];
  [v3 addObject:v30];

  if ([(CNContactGeminiView *)self shouldDisplayChevron])
  {
    v31 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(CNContactGeminiView *)self chevronView];
    v33 = [v31 constraintWithItem:self attribute:10 relatedBy:0 toItem:v32 attribute:10 multiplier:1.0 constant:0.0];
    [v3 addObject:v33];
  }
  if ([(CNContactGeminiView *)self shouldDisplayBadge])
  {
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(CNContactGeminiView *)self geminiBadge];
    v36 = [(CNContactGeminiView *)self geminiLabel];
    v37 = [v34 constraintWithItem:v35 attribute:10 relatedBy:0 toItem:v36 attribute:10 multiplier:1.0 constant:0.0];
    [v3 addObject:v37];
  }
  v38 = (void *)MEMORY[0x1E4F28DC8];
  v39 = [(CNContactGeminiView *)self layoutGuide];
  uint64_t v40 = [(CNContactGeminiView *)self typeLabel];
  v41 = [v38 constraintWithItem:v39 attribute:5 relatedBy:-1 toItem:v40 attribute:5 multiplier:1.0 constant:0.0];
  [v3 addObject:v41];

  v42 = (void *)MEMORY[0x1E4F28DC8];
  v43 = [(CNContactGeminiView *)self typeLabel];
  v44 = [v42 constraintWithItem:self attribute:9 relatedBy:0 toItem:v43 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v44];

  LOBYTE(v40) = [(CNContactGeminiView *)self shouldDisplayChevron];
  v45 = (void *)MEMORY[0x1E4F28DC8];
  v46 = [(CNContactGeminiView *)self layoutGuide];
  if (v40) {
    [(CNContactGeminiView *)self chevronView];
  }
  else {
  v47 = [(CNContactGeminiView *)self typeLabel];
  }
  v48 = [v45 constraintWithItem:v46 attribute:6 relatedBy:1 toItem:v47 attribute:6 multiplier:1.0 constant:0.0];
  [v3 addObject:v48];

  v49 = (void *)MEMORY[0x1E4F28DC8];
  v50 = [(CNContactGeminiView *)self typeLabel];
  v51 = [v49 constraintWithItem:self attribute:5 relatedBy:-1 toItem:v50 attribute:5 multiplier:1.0 constant:0.0];
  [v3 addObject:v51];

  if ([(CNContactGeminiView *)self shouldDisplayBadge]) {
    [(CNContactGeminiView *)self geminiBadge];
  }
  else {
  v52 = [(CNContactGeminiView *)self geminiLabel];
  }
  v53 = (void *)MEMORY[0x1E4F28DC8];
  v54 = [(CNContactGeminiView *)self layoutGuide];
  v55 = [v53 constraintWithItem:v54 attribute:5 relatedBy:-1 toItem:v52 attribute:5 multiplier:1.0 constant:0.0];
  [v3 addObject:v55];

  if (![(CNContactGeminiView *)self shouldDisplayChevron])
  {
    v56 = (void *)MEMORY[0x1E4F28DC8];
    v57 = [(CNContactGeminiView *)self layoutGuide];
    v58 = [(CNContactGeminiView *)self geminiLabel];
    v59 = [v56 constraintWithItem:v57 attribute:6 relatedBy:1 toItem:v58 attribute:6 multiplier:1.0 constant:0.0];
    [v3 addObject:v59];
  }
  BOOL v60 = [(CNContactGeminiView *)self shouldDisplayBadge];
  v61 = (void *)MEMORY[0x1E4F28DC8];
  if (v60)
  {
    v62 = [(CNContactGeminiView *)self geminiBadge];
    v63 = [v61 constraintWithItem:self attribute:5 relatedBy:-1 toItem:v62 attribute:5 multiplier:1.0 constant:0.0];
    [v3 addObject:v63];

    v64 = (void *)MEMORY[0x1E4F28DC8];
    v65 = [(CNContactGeminiView *)self geminiBadge];
    v66 = [(CNContactGeminiView *)self geminiLabel];
    v67 = [v64 constraintWithItem:v65 attribute:6 relatedBy:0 toItem:v66 attribute:5 multiplier:1.0 constant:-6.0];
    [v3 addObject:v67];

    v68 = (void *)MEMORY[0x1E4F28DC8];
    v69 = [(CNContactGeminiView *)self geminiLabelLayoutGuide];
    [(CNContactGeminiView *)self geminiBadge];
  }
  else
  {
    v70 = [(CNContactGeminiView *)self geminiLabel];
    v71 = [v61 constraintWithItem:self attribute:5 relatedBy:-1 toItem:v70 attribute:5 multiplier:1.0 constant:0.0];
    [v3 addObject:v71];

    v68 = (void *)MEMORY[0x1E4F28DC8];
    v69 = [(CNContactGeminiView *)self geminiLabelLayoutGuide];
    [(CNContactGeminiView *)self geminiLabel];
  v72 = };
  v73 = [v68 constraintWithItem:v69 attribute:5 relatedBy:0 toItem:v72 attribute:5 multiplier:1.0 constant:0.0];
  [v3 addObject:v73];

  v74 = (void *)MEMORY[0x1E4F28DC8];
  v75 = [(CNContactGeminiView *)self geminiLabelLayoutGuide];
  v76 = [(CNContactGeminiView *)self geminiLabel];
  v77 = [v74 constraintWithItem:v75 attribute:6 relatedBy:0 toItem:v76 attribute:6 multiplier:1.0 constant:0.0];
  [v3 addObject:v77];

  BOOL v78 = [(CNContactGeminiView *)self shouldDisplayChevron];
  v79 = (void *)MEMORY[0x1E4F28DC8];
  if (v78)
  {
    v80 = [(CNContactGeminiView *)self chevronView];
    v81 = [v79 constraintWithItem:v80 attribute:6 relatedBy:-1 toItem:self attribute:6 multiplier:1.0 constant:0.0];
    [v3 addObject:v81];

    v82 = (void *)MEMORY[0x1E4F28DC8];
    v83 = [(CNContactGeminiView *)self typeLabel];
    v84 = [(CNContactGeminiView *)self chevronView];
    v85 = [v82 constraintWithItem:v83 attribute:6 relatedBy:-1 toItem:v84 attribute:5 multiplier:1.0 constant:-4.0];
    [v3 addObject:v85];

    v86 = (void *)MEMORY[0x1E4F28DC8];
    v87 = [(CNContactGeminiView *)self geminiLabel];
    v88 = [(CNContactGeminiView *)self chevronView];
    v89 = [v86 constraintWithItem:v87 attribute:6 relatedBy:-1 toItem:v88 attribute:5 multiplier:1.0 constant:-4.0];
    [v3 addObject:v89];
  }
  else
  {
    v90 = [(CNContactGeminiView *)self typeLabel];
    v91 = [v79 constraintWithItem:v90 attribute:6 relatedBy:-1 toItem:self attribute:6 multiplier:1.0 constant:0.0];
    [v3 addObject:v91];

    v92 = (void *)MEMORY[0x1E4F28DC8];
    v87 = [(CNContactGeminiView *)self geminiLabel];
    v88 = [v92 constraintWithItem:v87 attribute:6 relatedBy:-1 toItem:self attribute:6 multiplier:1.0 constant:0.0];
    [v3 addObject:v88];
  }

  return v3;
}

- (id)singleLineLayoutConstraints
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNContactGeminiView *)self shouldDisplayChevron]) {
    [(CNContactGeminiView *)self chevronView];
  }
  else {
  uint64_t v4 = [(CNContactGeminiView *)self geminiLabel];
  }
  int v5 = (void *)MEMORY[0x1E4F28DC8];
  int v6 = [(CNContactGeminiView *)self layoutGuide];
  v7 = [v5 constraintWithItem:self attribute:8 relatedBy:0 toItem:v6 attribute:8 multiplier:1.0 constant:0.0];
  [v3 addObject:v7];

  int v8 = (void *)MEMORY[0x1E4F28DC8];
  v9 = [(CNContactGeminiView *)self layoutGuide];
  v10 = [(CNContactGeminiView *)self typeLabel];
  v11 = [v8 constraintWithItem:v9 attribute:5 relatedBy:0 toItem:v10 attribute:5 multiplier:1.0 constant:0.0];
  [v3 addObject:v11];

  v12 = (void *)MEMORY[0x1E4F28DC8];
  v13 = [(CNContactGeminiView *)self layoutGuide];
  v14 = [v12 constraintWithItem:v13 attribute:6 relatedBy:0 toItem:v4 attribute:6 multiplier:1.0 constant:0.0];
  [v3 addObject:v14];

  uint64_t v15 = (void *)MEMORY[0x1E4F28DC8];
  v16 = [(CNContactGeminiView *)self layoutGuide];
  v17 = [v15 constraintWithItem:self attribute:9 relatedBy:0 toItem:v16 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v17];

  v18 = (void *)MEMORY[0x1E4F28DC8];
  v19 = [(CNContactGeminiView *)self typeLabel];
  v20 = [v18 constraintWithItem:self attribute:8 relatedBy:0 toItem:v19 attribute:8 multiplier:1.0 constant:0.0];
  [v3 addObject:v20];

  v21 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [(CNContactGeminiView *)self geminiLabel];
  uint64_t v23 = [v21 constraintWithItem:self attribute:8 relatedBy:0 toItem:v22 attribute:8 multiplier:1.0 constant:0.0];
  [v3 addObject:v23];

  v24 = (void *)MEMORY[0x1E4F28DC8];
  double v25 = [(CNContactGeminiView *)self typeLabel];
  v26 = [v24 constraintWithItem:self attribute:10 relatedBy:0 toItem:v25 attribute:10 multiplier:1.0 constant:0.0];
  [v3 addObject:v26];

  v27 = (void *)MEMORY[0x1E4F28DC8];
  int v28 = [(CNContactGeminiView *)self geminiLabel];
  id v29 = [v27 constraintWithItem:self attribute:10 relatedBy:0 toItem:v28 attribute:10 multiplier:1.0 constant:0.0];
  [v3 addObject:v29];

  if ([(CNContactGeminiView *)self shouldDisplayChevron])
  {
    v30 = (void *)MEMORY[0x1E4F28DC8];
    v31 = [(CNContactGeminiView *)self chevronView];
    v32 = [v30 constraintWithItem:self attribute:10 relatedBy:0 toItem:v31 attribute:10 multiplier:1.0 constant:0.0];
    [v3 addObject:v32];
  }
  if ([(CNContactGeminiView *)self shouldDisplayBadge])
  {
    v33 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [(CNContactGeminiView *)self typeLabel];
    v35 = [(CNContactGeminiView *)self geminiBadge];
    v36 = [v33 constraintWithItem:v34 attribute:10 relatedBy:0 toItem:v35 attribute:10 multiplier:1.0 constant:0.0];
    [v3 addObject:v36];
  }
  v37 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [(CNContactGeminiView *)self typeLabel];
  v39 = [v37 constraintWithItem:self attribute:5 relatedBy:-1 toItem:v38 attribute:5 multiplier:1.0 constant:0.0];
  [v3 addObject:v39];

  LODWORD(v38) = [(CNContactGeminiView *)self shouldDisplayBadge];
  uint64_t v40 = (void *)MEMORY[0x1E4F28DC8];
  v41 = [(CNContactGeminiView *)self typeLabel];
  if (v38)
  {
    v42 = [(CNContactGeminiView *)self geminiBadge];
    v43 = [v40 constraintWithItem:v41 attribute:6 relatedBy:0 toItem:v42 attribute:5 multiplier:1.0 constant:-6.0];
    [v3 addObject:v43];

    uint64_t v40 = (void *)MEMORY[0x1E4F28DC8];
    v41 = [(CNContactGeminiView *)self geminiBadge];
  }
  v44 = [(CNContactGeminiView *)self geminiLabel];
  v45 = [v40 constraintWithItem:v41 attribute:6 relatedBy:0 toItem:v44 attribute:5 multiplier:1.0 constant:-6.0];
  [v3 addObject:v45];

  if ([(CNContactGeminiView *)self shouldDisplayChevron])
  {
    v46 = (void *)MEMORY[0x1E4F28DC8];
    v47 = [(CNContactGeminiView *)self chevronView];
    v48 = [(CNContactGeminiView *)self geminiLabel];
    v49 = [v46 constraintWithItem:v47 attribute:5 relatedBy:0 toItem:v48 attribute:6 multiplier:1.0 constant:4.0];
    [v3 addObject:v49];
  }
  v50 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:6 relatedBy:1 toItem:v4 attribute:6 multiplier:1.0 constant:0.0];
  [v3 addObject:v50];

  return v3;
}

- (void)updateConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactGeminiView;
  [(CNContactGeminiView *)&v6 updateConstraints];
  uint64_t v3 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v4 = [(CNContactGeminiView *)self activatedConstraints];
  [v3 deactivateConstraints:v4];

  if ([(CNContactGeminiView *)self isUsingTwoLineLayout]) {
    [(CNContactGeminiView *)self twoLineLayoutConstraints];
  }
  else {
  int v5 = [(CNContactGeminiView *)self singleLineLayoutConstraints];
  }
  [(CNContactGeminiView *)self setActivatedConstraints:v5];
  [MEMORY[0x1E4F28DC8] activateConstraints:v5];
}

- (BOOL)doesLayoutRequireTwoLines
{
  uint64_t v3 = [(CNContactGeminiView *)self typeLabel];
  [(CNContactGeminiView *)self bounds];
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  double v7 = v6;

  int v8 = [(CNContactGeminiView *)self geminiBadge];
  [(CNContactGeminiView *)self bounds];
  objc_msgSend(v8, "sizeThatFits:", v9, v10);
  double v12 = v11;

  v13 = [(CNContactGeminiView *)self geminiLabel];
  [(CNContactGeminiView *)self bounds];
  objc_msgSend(v13, "sizeThatFits:", v14, v15);
  double v17 = v16;

  double v18 = v7 + 12.0 + v12 + v17;
  if ([(CNContactGeminiView *)self shouldDisplayChevron])
  {
    v19 = [(CNContactGeminiView *)self chevronView];
    [(CNContactGeminiView *)self bounds];
    objc_msgSend(v19, "sizeThatFits:", v20, v21);
    double v18 = v18 + v22 + 4.0;
  }
  [(CNContactGeminiView *)self bounds];
  return v18 >= v23;
}

- (void)layoutSubviews
{
  [(CNContactGeminiView *)self calculateLayoutIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)CNContactGeminiView;
  [(CNContactGeminiView *)&v3 layoutSubviews];
}

- (void)calculateLayoutIfNeeded
{
  if (![(CNContactGeminiView *)self didCalculateLayout])
  {
    uint64_t v3 = [(CNContactGeminiView *)self geminiResult];
    if (v3)
    {
      double v4 = (void *)v3;
      [(CNContactGeminiView *)self bounds];
      double v6 = v5;

      if (v6 > 0.0)
      {
        BOOL v7 = [(CNContactGeminiView *)self isUsingTwoLineLayout];
        [(CNContactGeminiView *)self setIsUsingTwoLineLayout:[(CNContactGeminiView *)self doesLayoutRequireTwoLines]];
        [(CNContactGeminiView *)self setDidCalculateLayout:1];
        if (v7 != [(CNContactGeminiView *)self isUsingTwoLineLayout])
        {
          [(CNContactGeminiView *)self setNeedsUpdateConstraints];
          [(CNContactGeminiView *)self updateConstraintsIfNeeded];
        }
      }
    }
  }
}

- (void)setNeedsCalculateLayout
{
}

- (void)setAb_textAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_ab_textAttributes, a3);
  id v5 = a3;
  double v6 = [(CNContactGeminiView *)self typeLabel];
  objc_msgSend(v6, "setAb_textAttributes:", v5);

  id v7 = [(CNContactGeminiView *)self geminiLabel];
  objc_msgSend(v7, "setAb_textAttributes:", v5);
}

- (BOOL)shouldDisplayBadge
{
  v2 = [(CNContactGeminiView *)self geminiResult];
  uint64_t v3 = [v2 channel];
  char v4 = [v3 isAvailable];

  return v4;
}

- (CGSize)sizeForTwoLineLayoutFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(CNContactGeminiView *)self typeLabel];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v33 = v9;

  uint64_t v10 = MEMORY[0x1E4F1DB30];
  double v11 = *MEMORY[0x1E4F1DB30];
  if ([(CNContactGeminiView *)self shouldDisplayBadge])
  {
    double v12 = [(CNContactGeminiView *)self geminiBadge];
    objc_msgSend(v12, "sizeThatFits:", width, height);
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v16 = *(double *)(v10 + 8);
    double v14 = v11;
  }
  double v17 = [(CNContactGeminiView *)self geminiLabel];
  objc_msgSend(v17, "sizeThatFits:", width, height);
  double v19 = v18;
  double v21 = v20;

  if ([(CNContactGeminiView *)self shouldDisplayChevron])
  {
    double v22 = [(CNContactGeminiView *)self chevronView];
    objc_msgSend(v22, "sizeThatFits:", width, height);
    double v11 = v23;
  }
  BOOL v24 = [(CNContactGeminiView *)self shouldDisplayBadge];
  double v25 = v14 + 6.0;
  if (!v24) {
    double v25 = -0.0;
  }
  double v26 = v19 + v25;
  if (v8 >= v26) {
    double v27 = v8;
  }
  else {
    double v27 = v26;
  }
  BOOL v28 = [(CNContactGeminiView *)self shouldDisplayChevron];
  double v29 = v11 + 4.0;
  if (!v28) {
    double v29 = -0.0;
  }
  double v30 = v29 + v27;
  if (v16 >= v21) {
    double v31 = v16;
  }
  else {
    double v31 = v21;
  }
  double v32 = v33 + v31 + 5.0;
  if (width < v30) {
    double v30 = width;
  }
  result.double height = v32;
  result.double width = v30;
  return result;
}

- (CGSize)sizeForSingleLineLayoutFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(CNContactGeminiView *)self typeLabel];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v31 = v7;
  double v9 = v8;

  uint64_t v10 = MEMORY[0x1E4F1DB30];
  double v11 = *MEMORY[0x1E4F1DB30];
  if ([(CNContactGeminiView *)self shouldDisplayBadge])
  {
    double v12 = [(CNContactGeminiView *)self geminiBadge];
    objc_msgSend(v12, "sizeThatFits:", width, height);
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v16 = *(double *)(v10 + 8);
    double v14 = v11;
  }
  double v17 = [(CNContactGeminiView *)self geminiLabel];
  objc_msgSend(v17, "sizeThatFits:", width, height);
  double v19 = v18;
  double v21 = v20;

  if ([(CNContactGeminiView *)self shouldDisplayChevron])
  {
    double v22 = [(CNContactGeminiView *)self chevronView];
    objc_msgSend(v22, "sizeThatFits:", width, height);
    double v11 = v23;
  }
  BOOL v24 = [(CNContactGeminiView *)self shouldDisplayBadge];
  double v25 = 6.0;
  if (v24) {
    double v25 = v14 + 6.0 + 6.0;
  }
  double v26 = v31 + v19 + v25;
  BOOL v27 = [(CNContactGeminiView *)self shouldDisplayChevron];
  double v28 = v11 + 4.0;
  if (!v27) {
    double v28 = -0.0;
  }
  double v29 = v28 + v26;
  if (v9 >= v21) {
    double v30 = v9;
  }
  else {
    double v30 = v21;
  }
  if (v16 >= v30) {
    double v30 = v16;
  }
  if (width < v29) {
    double v29 = width;
  }
  result.double height = v30;
  result.double width = v29;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(CNContactGeminiView *)self isUsingTwoLineLayout])
  {
    -[CNContactGeminiView sizeForTwoLineLayoutFittingSize:](self, "sizeForTwoLineLayoutFittingSize:", width, height);
  }
  else
  {
    -[CNContactGeminiView sizeForSingleLineLayoutFittingSize:](self, "sizeForSingleLineLayoutFittingSize:", width, height);
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  id v5 = a3;
  id v6 = [(CNContactGeminiView *)self geminiViewChevronImage];
  id v8 = [(CNContactGeminiView *)self geminiBadge];
  double v7 = [v8 _textEncapsulation];
  [v7 setColor:v5];
}

- (void)setHighlightedColor:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNContactGeminiView;
  -[CNContactGeminiView setHighlighted:](&v17, sel_setHighlighted_);
  id v5 = [(CNContactGeminiView *)self typeLabel];
  [v5 setHighlighted:v3];

  id v6 = [(CNContactGeminiView *)self geminiLabel];
  [v6 setHighlighted:v3];

  double v7 = [(CNContactGeminiView *)self chevronView];
  [v7 setHighlighted:v3];

  id v8 = [(CNContactGeminiView *)self typeLabel];
  double v9 = v8;
  if (v3)
  {
    [v8 setAlpha:0.5];

    uint64_t v10 = [(CNContactGeminiView *)self geminiLabel];
    [v10 setAlpha:0.5];

    double v11 = [(CNContactGeminiView *)self geminiBadge];
    [v11 setAlpha:0.5];

    double v12 = [(CNContactGeminiView *)self chevronView];
    double v13 = v12;
    double v14 = 0.5;
  }
  else
  {
    [v8 setAlpha:1.0];

    double v15 = [(CNContactGeminiView *)self geminiLabel];
    [v15 setAlpha:1.0];

    double v16 = [(CNContactGeminiView *)self geminiBadge];
    [v16 setAlpha:1.0];

    double v12 = [(CNContactGeminiView *)self chevronView];
    double v13 = v12;
    double v14 = 1.0;
  }
  [v12 setAlpha:v14];
}

- (CNContactGeminiView)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)CNContactGeminiView;
  BOOL v3 = -[CNContactGeminiView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    typeLabel = v3->_typeLabel;
    v3->_typeLabel = (UILabel *)v9;

    [(UILabel *)v3->_typeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_typeLabel setTextAlignment:1];
    [(UILabel *)v3->_typeLabel setNumberOfLines:1];
    LODWORD(v11) = 1144750080;
    [(UILabel *)v3->_typeLabel setContentCompressionResistancePriority:0 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(UILabel *)v3->_typeLabel setContentCompressionResistancePriority:1 forAxis:v12];
    [(CNContactGeminiView *)v3 addSubview:v3->_typeLabel];
    uint64_t v13 = +[CNGeminiBadge geminiBadgeWithText:@"-"];
    geminiBadge = v3->_geminiBadge;
    v3->_geminiBadge = (CNGeminiBadge *)v13;

    [(CNContactGeminiView *)v3 addSubview:v3->_geminiBadge];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    geminiLabel = v3->_geminiLabel;
    v3->_geminiLabel = (UILabel *)v15;

    [(UILabel *)v3->_geminiLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_geminiLabel setTextAlignment:1];
    [(UILabel *)v3->_geminiLabel setNumberOfLines:1];
    LODWORD(v17) = 1132068864;
    [(UILabel *)v3->_geminiLabel setContentCompressionResistancePriority:0 forAxis:v17];
    LODWORD(v18) = 1144750080;
    [(UILabel *)v3->_geminiLabel setContentHuggingPriority:0 forAxis:v18];
    LODWORD(v19) = 1148846080;
    [(UILabel *)v3->_geminiLabel setContentCompressionResistancePriority:1 forAxis:v19];
    [(CNContactGeminiView *)v3 addSubview:v3->_geminiLabel];
    double v20 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_symbolImageForContactCardChevron");
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v20];
    chevronView = v3->_chevronView;
    v3->_chevronView = (UIImageView *)v21;

    [(UIImageView *)v3->_chevronView setContentMode:4];
    [(UIImageView *)v3->_chevronView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v23) = 1148846080;
    [(UIImageView *)v3->_chevronView setContentCompressionResistancePriority:0 forAxis:v23];
    LODWORD(v24) = 1144750080;
    [(UIImageView *)v3->_chevronView setContentHuggingPriority:0 forAxis:v24];
    [(CNContactGeminiView *)v3 addSubview:v3->_chevronView];
    double v25 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    layoutGuide = v3->_layoutGuide;
    v3->_layoutGuide = v25;

    [(CNContactGeminiView *)v3 addLayoutGuide:v3->_layoutGuide];
    BOOL v27 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    geminiLabelLayoutGuide = v3->_geminiLabelLayoutGuide;
    v3->_geminiLabelLayoutGuide = v27;

    [(CNContactGeminiView *)v3 addLayoutGuide:v3->_geminiLabelLayoutGuide];
    double v29 = v3;
  }
  return v3;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end