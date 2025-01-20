@interface WDDisplayTypeDescriptionView
+ (double)minimumHeightForStyle:(unint64_t)a3;
+ (id)_attributionTextFontForStyle:(unint64_t)a3;
+ (id)_cautionaryTextFontForStyle:(unint64_t)a3;
+ (id)_descriptionHeadingColorForStyle:(unint64_t)a3;
+ (id)_descriptionHeadingFontForStyle:(unint64_t)a3;
+ (id)_descriptionTextColorForStyle:(unint64_t)a3;
+ (id)_descriptionTextFontForStyle:(unint64_t)a3;
+ (id)_metricsForStyle:(unint64_t)a3;
- (BOOL)showAttributionText;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (WDDisplayTypeDescriptionView)initWithCoder:(id)a3;
- (WDDisplayTypeDescriptionView)initWithDisplayType:(id)a3 showAttributionText:(BOOL)a4 style:(unint64_t)a5;
- (WDDisplayTypeDescriptionView)initWithFrame:(CGRect)a3;
- (void)_setupUI;
- (void)_updateFont;
- (void)setShowAttributionText:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WDDisplayTypeDescriptionView

- (WDDisplayTypeDescriptionView)initWithDisplayType:(id)a3 showAttributionText:(BOOL)a4 style:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDDisplayTypeDescriptionView;
  v10 = -[WDDisplayTypeDescriptionView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_displayType, a3);
    v11->_showAttributionText = a4;
    v11->_style = a5;
    [(WDDisplayTypeDescriptionView *)v11 _setupUI];
  }

  return v11;
}

- (WDDisplayTypeDescriptionView)initWithFrame:(CGRect)a3
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (WDDisplayTypeDescriptionView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDDisplayTypeDescriptionView;
  return [(WDDisplayTypeDescriptionView *)&v4 initWithCoder:a3];
}

+ (double)minimumHeightForStyle:(unint64_t)a3
{
  objc_super v4 = objc_msgSend(a1, "_metricsForStyle:");
  uint64_t v5 = v4;
  double v6 = 0.0;
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_8;
    }
    v7 = [v4 objectForKeyedSubscript:@"T"];
    [v7 floatValue];
    double v6 = v8 + 0.0;
  }
  id v9 = [v5 objectForKeyedSubscript:@"D"];
  [v9 floatValue];
  float v11 = v10;

  v12 = [v5 objectForKeyedSubscript:@"M"];
  [v12 floatValue];
  float v14 = v13 + v13;

  if (v11 >= v14) {
    float v15 = v11;
  }
  else {
    float v15 = v14;
  }
  double v16 = v6 + v15;
  v17 = [v5 objectForKeyedSubscript:@"A"];
  [v17 floatValue];
  double v19 = v16 + (float)(v18 + v18);

  v20 = [v5 objectForKeyedSubscript:@"M"];
  [v20 floatValue];
  double v6 = v19 + v21;

LABEL_8:
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDDisplayTypeDescriptionView;
  [(WDDisplayTypeDescriptionView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    uint64_t v5 = [(WDDisplayTypeDescriptionView *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(WDDisplayTypeDescriptionView *)self _updateFont];
      [(WDDisplayTypeDescriptionView *)self setNeedsLayout];
    }
  }
}

- (void)_updateFont
{
  v3 = [(id)objc_opt_class() _descriptionHeadingFontForStyle:self->_style];
  [(UILabel *)self->_descriptionHeadingLabel setFont:v3];

  id v4 = [(id)objc_opt_class() _descriptionTextFontForStyle:self->_style];
  [(UILabel *)self->_descriptionLabel setFont:v4];

  uint64_t v5 = [(id)objc_opt_class() _attributionTextFontForStyle:self->_style];
  [(UITextView *)self->_attributionTextView setFont:v5];

  id v6 = [(id)objc_opt_class() _cautionaryTextFontForStyle:self->_style];
  [(UILabel *)self->_cautionaryLabel setFont:v6];
}

- (void)_setupUI
{
  id v57 = [(id)objc_opt_class() _metricsForStyle:self->_style];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_style == 1)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    descriptionHeadingLabel = self->_descriptionHeadingLabel;
    self->_descriptionHeadingLabel = v4;

    id v6 = WDBundle();
    v7 = [v6 localizedStringForKey:@"DESCRIPTION_HEADING" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    [(UILabel *)self->_descriptionHeadingLabel setText:v7];

    char v8 = [(id)objc_opt_class() _descriptionHeadingColorForStyle:self->_style];
    [(UILabel *)self->_descriptionHeadingLabel setTextColor:v8];

    [(UILabel *)self->_descriptionHeadingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v9 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)self->_descriptionHeadingLabel setBackgroundColor:v9];

    [(WDDisplayTypeDescriptionView *)self addSubview:self->_descriptionHeadingLabel];
    [v3 setObject:self->_descriptionHeadingLabel forKeyedSubscript:@"_descriptionHeadingLabel"];
    float v10 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_descriptionHeadingLabel]|" options:0 metrics:0 views:v3];
    [(WDDisplayTypeDescriptionView *)self addConstraints:v10];
  }
  float v11 = [(HKDisplayType *)self->_displayType localization];
  v12 = [v11 summaryForPairedWatch];
  if ([v12 length]) {
    char v13 = [MEMORY[0x263F0A980] hasPairedWatch];
  }
  else {
    char v13 = 0;
  }

  float v14 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v14;

  [(UILabel *)self->_descriptionLabel setNumberOfLines:0];
  double v16 = [(id)objc_opt_class() _descriptionTextColorForStyle:self->_style];
  [(UILabel *)self->_descriptionLabel setTextColor:v16];

  v17 = [(HKDisplayType *)self->_displayType localization];
  float v18 = v17;
  if (v13) {
    [v17 summaryForPairedWatch];
  }
  else {
  double v19 = [v17 summary];
  }
  [(UILabel *)self->_descriptionLabel setText:v19];

  [(UILabel *)self->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = [MEMORY[0x263F1C550] clearColor];
  [(UILabel *)self->_descriptionLabel setBackgroundColor:v20];

  [(WDDisplayTypeDescriptionView *)self addSubview:self->_descriptionLabel];
  [v3 setObject:self->_descriptionLabel forKeyedSubscript:@"_descriptionLabel"];
  float v21 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_descriptionLabel]|" options:0 metrics:0 views:v3];
  [(WDDisplayTypeDescriptionView *)self addConstraints:v21];

  v22 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"V:|"];
  v23 = v22;
  if (self->_style == 1) {
    [v22 appendString:@"-T-[_descriptionHeadingLabel]"];
  }
  v24 = [(HKDisplayType *)self->_displayType detailImage];
  v25 = v24;
  if (v24)
  {
    [v24 size];
    double v28 = v27 / v26;
    v29 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v25];
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WDDisplayTypeDescriptionView *)self addSubview:v29];
    [v3 setValue:v29 forKey:@"imageView"];
    v30 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-P-[imageView]-P-|" options:0 metrics:v57 views:v3];
    [(WDDisplayTypeDescriptionView *)self addConstraints:v30];

    [v23 appendString:@"-M-[imageView]-M-[_descriptionLabel]"];
    v31 = [MEMORY[0x263F08938] constraintWithItem:v29 attribute:8 relatedBy:0 toItem:v29 attribute:7 multiplier:v28 constant:0.0];
    LODWORD(v32) = 1144750080;
    [v31 setPriority:v32];
    [v29 addConstraint:v31];
  }
  else
  {
    [v23 appendString:@"-M-[_descriptionLabel]"];
  }
  v33 = [(HKDisplayType *)self->_displayType presentation];
  v34 = [v33 summaryAttribution];
  v35 = [v34 attribution];
  if ([v35 length])
  {
    BOOL v36 = [(WDDisplayTypeDescriptionView *)self showAttributionText];

    if (!v36) {
      goto LABEL_19;
    }
    id v37 = objc_alloc(MEMORY[0x263F463D0]);
    v38 = [(HKDisplayType *)self->_displayType presentation];
    v39 = [v38 summaryAttribution];
    v40 = [v39 attribution];
    [(HKDisplayType *)self->_displayType presentation];
    v56 = v25;
    v42 = id v41 = v3;
    v43 = [v42 summaryAttribution];
    v44 = (UITextView *)objc_msgSend(v37, "initWithAttributedText:selectable:", v40, objc_msgSend(v43, "hasLink"));
    attributionTextView = self->_attributionTextView;
    self->_attributionTextView = v44;

    id v3 = v41;
    v25 = v56;

    [(UITextView *)self->_attributionTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)self->_attributionTextView setDelegate:self];
    [(WDDisplayTypeDescriptionView *)self addSubview:self->_attributionTextView];
    [v23 appendString:@"-A-[_attributionTextView]"];
    [v3 setValue:self->_attributionTextView forKey:@"_attributionTextView"];
    v33 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_attributionTextView]|" options:0 metrics:v57 views:v3];
    [(WDDisplayTypeDescriptionView *)self addConstraints:v33];
  }
  else
  {
  }
LABEL_19:
  v46 = [(HKDisplayType *)self->_displayType localization];
  v47 = [v46 cautionaryText];
  uint64_t v48 = [v47 length];

  if (v48)
  {
    v49 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    cautionaryLabel = self->_cautionaryLabel;
    self->_cautionaryLabel = v49;

    [(UILabel *)self->_cautionaryLabel setNumberOfLines:0];
    v51 = [(HKDisplayType *)self->_displayType localization];
    v52 = [v51 cautionaryText];
    [(UILabel *)self->_cautionaryLabel setText:v52];

    [(UILabel *)self->_cautionaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v53 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)self->_cautionaryLabel setBackgroundColor:v53];

    [(WDDisplayTypeDescriptionView *)self addSubview:self->_cautionaryLabel];
    [v23 appendString:@"-A-[_cautionaryLabel]-M-|"];
    [v3 setValue:self->_cautionaryLabel forKey:@"_cautionaryLabel"];
    v54 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_cautionaryLabel]|" options:0 metrics:v57 views:v3];
    [(WDDisplayTypeDescriptionView *)self addConstraints:v54];
  }
  else
  {
    [v23 appendString:@"-M-|"];
  }
  v55 = [MEMORY[0x263F08938] constraintsWithVisualFormat:v23 options:0 metrics:v57 views:v3];
  [(WDDisplayTypeDescriptionView *)self addConstraints:v55];

  [(WDDisplayTypeDescriptionView *)self _updateFont];
}

+ (id)_metricsForStyle:(unint64_t)a3
{
  if (a3) {
    return &unk_26D2FD6F0;
  }
  else {
    return &unk_26D2FD6C8;
  }
}

+ (id)_descriptionHeadingFontForStyle:(unint64_t)a3
{
  id v3 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
  id v4 = [v3 fontDescriptor];
  uint64_t v5 = objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v4, "symbolicTraits") | 2);
  id v6 = [MEMORY[0x263F1C658] fontWithDescriptor:v5 size:0.0];

  return v6;
}

+ (id)_descriptionHeadingColorForStyle:(unint64_t)a3
{
  if (a3 == 1)
  {
    a1 = [MEMORY[0x263F1C550] secondaryLabelColor];
  }
  else if (!a3)
  {
    a1 = [MEMORY[0x263F1C550] labelColor];
  }

  return a1;
}

+ (id)_descriptionTextFontForStyle:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = (void *)MEMORY[0x263F1D280];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1D260];
  }
  objc_msgSend(MEMORY[0x263F1C658], "preferredFontForTextStyle:", *v5, v3);
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return a1;
}

+ (id)_descriptionTextColorForStyle:(unint64_t)a3
{
  if (a3 == 1)
  {
    a1 = [MEMORY[0x263F1C550] secondaryLabelColor];
  }
  else if (!a3)
  {
    a1 = [MEMORY[0x263F1C550] labelColor];
  }

  return a1;
}

+ (id)_attributionTextFontForStyle:(unint64_t)a3
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
}

+ (id)_cautionaryTextFontForStyle:(unint64_t)a3
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D278]];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  char v8 = [v7 scheme];
  int v9 = [v8 isEqualToString:@"bridge"];

  if (!a6 && v9)
  {
    float v10 = [MEMORY[0x263F01880] defaultWorkspace];
    [v10 openSensitiveURL:v7 withOptions:0];
  }
  return v9 ^ 1;
}

- (BOOL)showAttributionText
{
  return self->_showAttributionText;
}

- (void)setShowAttributionText:(BOOL)a3
{
  self->_showAttributionText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cautionaryLabel, 0);
  objc_storeStrong((id *)&self->_attributionTextView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_descriptionHeadingLabel, 0);

  objc_storeStrong((id *)&self->_displayType, 0);
}

@end