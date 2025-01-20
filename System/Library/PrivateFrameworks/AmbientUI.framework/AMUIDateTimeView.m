@interface AMUIDateTimeView
+ (id)defaultDateFont;
+ (id)defaultTimeFont;
- (AMUIDateTimeView)initWithFrame:(CGRect)a3;
- (NSDate)date;
- (UIColor)textColor;
- (UIFont)dateFont;
- (UIFont)timeFont;
- (void)_updateLabels;
- (void)setDate:(id)a3;
- (void)setDateFont:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTimeFont:(id)a3;
- (void)updateConstraints;
@end

@implementation AMUIDateTimeView

- (AMUIDateTimeView)initWithFrame:(CGRect)a3
{
  v54[2] = *MEMORY[0x263EF8340];
  v52.receiver = self;
  v52.super_class = (Class)AMUIDateTimeView;
  v3 = -[AMUIDateTimeView initWithFrame:](&v52, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() defaultTimeFont];
    timeFont = v3->_timeFont;
    v3->_timeFont = (UIFont *)v4;

    uint64_t v6 = [(id)objc_opt_class() defaultDateFont];
    dateFont = v3->_dateFont;
    v3->_dateFont = (UIFont *)v6;

    id v8 = objc_alloc(MEMORY[0x263F1C768]);
    double v9 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], v10, v11, v12);
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = (UILabel *)v13;

    [(UILabel *)v3->_dateLabel setFont:v3->_dateFont];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v9, v10, v11, v12);
    timeLabel = v3->_timeLabel;
    v3->_timeLabel = (UILabel *)v15;

    [(UILabel *)v3->_timeLabel setFont:v3->_timeFont];
    id v17 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [(UILabel *)v3->_timeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 addSubview:v3->_timeLabel];
    id v18 = objc_alloc(MEMORY[0x263F1C9B8]);
    v54[0] = v3->_dateLabel;
    v54[1] = v17;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
    v20 = (void *)[v18 initWithArrangedSubviews:v19];

    [v20 setAxis:1];
    [v20 setAlignment:1];
    [v20 setSpacing:-8.0];
    [v20 setDistribution:3];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(AMUIDateTimeView *)v3 addSubview:v20];
    uint64_t v21 = [MEMORY[0x263EFF910] now];
    date = v3->_date;
    v3->_date = (NSDate *)v21;

    [(AMUIDateTimeView *)v3 _updateLabels];
    [(UILabel *)v3->_dateLabel setHidden:1];
    v23 = [(UILabel *)v3->_timeLabel centerYAnchor];
    v24 = [v17 centerYAnchor];
    uint64_t v25 = [v23 constraintEqualToAnchor:v24 constant:0.0];
    timeLabelYOffsetConstraint = v3->_timeLabelYOffsetConstraint;
    v3->_timeLabelYOffsetConstraint = (NSLayoutConstraint *)v25;

    [(AMUIDateTimeView *)v3 setNeedsUpdateConstraints];
    v42 = (void *)MEMORY[0x263F08938];
    v51 = [(AMUIDateTimeView *)v3 leadingAnchor];
    v50 = [v20 leadingAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v53[0] = v49;
    v48 = [(AMUIDateTimeView *)v3 trailingAnchor];
    v47 = [v20 trailingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v53[1] = v46;
    v45 = [(AMUIDateTimeView *)v3 topAnchor];
    v44 = [v20 topAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v53[2] = v43;
    v41 = [(AMUIDateTimeView *)v3 bottomAnchor];
    v39 = [v20 bottomAnchor];
    v38 = [v41 constraintEqualToAnchor:v39];
    v53[3] = v38;
    v37 = [(UILabel *)v3->_timeLabel centerXAnchor];
    v36 = [v17 centerXAnchor];
    v27 = [v37 constraintEqualToAnchor:v36];
    v53[4] = v27;
    v53[5] = v3->_timeLabelYOffsetConstraint;
    v40 = v17;
    v28 = [v17 widthAnchor];
    v29 = [(UILabel *)v3->_timeLabel widthAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v53[6] = v30;
    v31 = [v17 heightAnchor];
    v32 = [(UILabel *)v3->_timeLabel heightAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v53[7] = v33;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:8];
    [v42 activateConstraints:v34];
  }
  return v3;
}

+ (id)defaultDateFont
{
  if (defaultDateFont_onceToken != -1) {
    dispatch_once(&defaultDateFont_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)defaultDateFont___defaultDateFont;

  return v2;
}

void __35__AMUIDateTimeView_defaultDateFont__block_invoke()
{
  id v5 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D308]];
  v0 = [v5 fontDescriptor];
  v1 = [v0 fontDescriptorWithSymbolicTraits:2];
  v2 = (void *)MEMORY[0x263F1C658];
  [v5 pointSize];
  uint64_t v3 = objc_msgSend(v2, "fontWithDescriptor:size:", v1);
  uint64_t v4 = (void *)defaultDateFont___defaultDateFont;
  defaultDateFont___defaultDateFont = v3;
}

+ (id)defaultTimeFont
{
  if (defaultTimeFont_onceToken != -1) {
    dispatch_once(&defaultTimeFont_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)defaultTimeFont___defaultTimeFont;

  return v2;
}

uint64_t __35__AMUIDateTimeView_defaultTimeFont__block_invoke()
{
  CTFontRef v0 = CTFontCreateWithNameAndOptions(@".SFSoftNumeric-Semibold", 93.0, 0, 0x20000uLL);
  uint64_t v1 = defaultTimeFont___defaultTimeFont;
  defaultTimeFont___defaultTimeFont = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (void)setTimeFont:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() defaultTimeFont];
  }
  id v7 = v4;
  if (([(UIFont *)self->_timeFont isEqual:v4] & 1) == 0)
  {
    id v5 = (UIFont *)[v7 copy];
    timeFont = self->_timeFont;
    self->_timeFont = v5;

    [(UILabel *)self->_timeLabel setFont:self->_timeFont];
    [(AMUIDateTimeView *)self setNeedsUpdateConstraints];
  }
}

- (void)setDateFont:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() defaultDateFont];
  }
  id v7 = v4;
  if (([(UIFont *)self->_dateFont isEqual:v4] & 1) == 0)
  {
    id v5 = (UIFont *)[v7 copy];
    dateFont = self->_dateFont;
    self->_dateFont = v5;

    [(UILabel *)self->_dateLabel setFont:self->_dateFont];
  }
}

- (void)setDate:(id)a3
{
  id v6 = a3;
  if ((-[NSDate isEqual:](self->_date, "isEqual:") & 1) == 0)
  {
    id v4 = (NSDate *)[v6 copy];
    date = self->_date;
    self->_date = v4;

    [(AMUIDateTimeView *)self _updateLabels];
  }
}

- (void)setTextColor:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (UIColor *)[v6 copy];
    textColor = self->_textColor;
    self->_textColor = v4;

    [(AMUIDateTimeView *)self _updateLabels];
  }
}

- (void)updateConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)AMUIDateTimeView;
  [(AMUIDateTimeView *)&v6 updateConstraints];
  [(UIFont *)self->_timeFont lineHeight];
  double v4 = v3;
  [(UIFont *)self->_timeFont ascender];
  [(NSLayoutConstraint *)self->_timeLabelYOffsetConstraint setConstant:-(v4 - v5)];
}

- (void)_updateLabels
{
  double v3 = (void *)MEMORY[0x263F29C30];
  double v4 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  id v14 = [v3 formatterForDateAsTimeNoAMPMWithLocale:v4];

  [v14 setTimeZone:0];
  double v5 = [v14 stringFromDate:self->_date];
  if (self->_date) {
    objc_super v6 = v5;
  }
  else {
    objc_super v6 = &stru_26FBC9C48;
  }
  [(UILabel *)self->_timeLabel setText:v6];
  [(UILabel *)self->_timeLabel setTextColor:self->_textColor];
  id v7 = objc_alloc_init(MEMORY[0x263F08790]);
  [v7 setTimeZone:0];
  id v8 = (void *)MEMORY[0x263F08790];
  double v9 = [MEMORY[0x263EFF960] currentLocale];
  double v10 = [v8 dateFormatFromTemplate:@"EEEd" options:0 locale:v9];
  [v7 setDateFormat:v10];

  double v11 = [v7 stringFromDate:self->_date];
  double v12 = [v11 uppercaseString];

  if (self->_date) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = &stru_26FBC9C48;
  }
  [(UILabel *)self->_dateLabel setText:v13];
  [(UILabel *)self->_dateLabel setTextColor:self->_textColor];
}

- (UIFont)timeFont
{
  return self->_timeFont;
}

- (UIFont)dateFont
{
  return self->_dateFont;
}

- (NSDate)date
{
  return self->_date;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dateFont, 0);
  objc_storeStrong((id *)&self->_timeFont, 0);
  objc_storeStrong((id *)&self->_timeLabelYOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);

  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end