@interface CPSDashboardEstimatesView
- (CPSDashboardEstimatesView)initWithFrame:(CGRect)a3;
- (CPSTravelEstimatesStringFormatter)travelEstimatesStringFormatter;
- (UILabel)distanceRemainingLabel;
- (UILabel)etaLabel;
- (UILabel)timeRemainingLabel;
- (UIStackView)stackView;
- (id)_labelFont;
- (void)layoutSubviews;
- (void)setDistanceRemainingLabel:(id)a3;
- (void)setEtaLabel:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTimeRemainingLabel:(id)a3;
- (void)setTravelEstimatesStringFormatter:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTripEstimates:(id)a3;
@end

@implementation CPSDashboardEstimatesView

- (CPSDashboardEstimatesView)initWithFrame:(CGRect)a3
{
  v39[3] = *MEMORY[0x263EF8340];
  CGRect v38 = a3;
  SEL v36 = a2;
  v37 = 0;
  v35.receiver = self;
  v35.super_class = (Class)CPSDashboardEstimatesView;
  v37 = -[CPSDashboardEstimatesView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v37, v37);
  if (v37)
  {
    v3 = objc_alloc_init(CPSTravelEstimatesStringFormatter);
    travelEstimatesStringFormatter = v37->_travelEstimatesStringFormatter;
    v37->_travelEstimatesStringFormatter = v3;

    id v34 = [(CPSDashboardEstimatesView *)v37 _labelFont];
    id v5 = objc_alloc(MEMORY[0x263F1C768]);
    v22 = (double *)MEMORY[0x263F001A8];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    etaLabel = v37->_etaLabel;
    v37->_etaLabel = (UILabel *)v6;

    v16 = v37->_etaLabel;
    id v17 = (id)[MEMORY[0x263F1C550] labelColor];
    -[UILabel setTextColor:](v16, "setTextColor:");

    [(UILabel *)v37->_etaLabel setFont:v34];
    [(UILabel *)v37->_etaLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", *v22, v22[1], v22[2], v22[3]);
    timeRemainingLabel = v37->_timeRemainingLabel;
    v37->_timeRemainingLabel = (UILabel *)v8;

    v18 = v37->_timeRemainingLabel;
    id v19 = (id)[MEMORY[0x263F1C550] labelColor];
    -[UILabel setTextColor:](v18, "setTextColor:");

    [(UILabel *)v37->_timeRemainingLabel setFont:v34];
    [(UILabel *)v37->_timeRemainingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", *v22, v22[1], v22[2], v22[3]);
    distanceRemainingLabel = v37->_distanceRemainingLabel;
    v37->_distanceRemainingLabel = (UILabel *)v10;

    v20 = v37->_distanceRemainingLabel;
    id v21 = (id)[MEMORY[0x263F1C550] labelColor];
    -[UILabel setTextColor:](v20, "setTextColor:");

    [(UILabel *)v37->_distanceRemainingLabel setFont:v34];
    [(UILabel *)v37->_distanceRemainingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F1C9B8]), "initWithFrame:", *v22, v22[1], v22[2], v22[3]);
    stackView = v37->_stackView;
    v37->_stackView = (UIStackView *)v12;

    [(UIStackView *)v37->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v37->_stackView setAxis:0];
    [(UIStackView *)v37->_stackView setSpacing:12.0];
    [(CPSDashboardEstimatesView *)v37 addSubview:v37->_stackView];
    [(UIStackView *)v37->_stackView addArrangedSubview:v37->_etaLabel];
    [(UIStackView *)v37->_stackView addArrangedSubview:v37->_timeRemainingLabel];
    [(UIStackView *)v37->_stackView addArrangedSubview:v37->_distanceRemainingLabel];
    v23 = (void *)MEMORY[0x263F08938];
    id v33 = (id)[(CPSDashboardEstimatesView *)v37 topAnchor];
    id v32 = (id)[(UIStackView *)v37->_stackView topAnchor];
    id v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
    v39[0] = v31;
    id v30 = (id)[(CPSDashboardEstimatesView *)v37 bottomAnchor];
    id v29 = (id)[(UIStackView *)v37->_stackView bottomAnchor];
    id v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
    v39[1] = v28;
    id v27 = (id)[(CPSDashboardEstimatesView *)v37 centerXAnchor];
    id v26 = (id)[(UIStackView *)v37->_stackView centerXAnchor];
    id v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
    v39[2] = v25;
    id v24 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:3];
    objc_msgSend(v23, "activateConstraints:");

    objc_storeStrong(&v34, 0);
  }
  v15 = v37;
  objc_storeStrong((id *)&v37, 0);
  return v15;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)CPSDashboardEstimatesView;
  [(CPSDashboardEstimatesView *)&v7 traitCollectionDidChange:location[0]];
  id v6 = [(CPSDashboardEstimatesView *)v9 _labelFont];
  v3 = [(CPSDashboardEstimatesView *)v9 etaLabel];
  [(UILabel *)v3 setFont:v6];

  v4 = [(CPSDashboardEstimatesView *)v9 timeRemainingLabel];
  [(UILabel *)v4 setFont:v6];

  id v5 = [(CPSDashboardEstimatesView *)v9 distanceRemainingLabel];
  [(UILabel *)v5 setFont:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  id v29 = self;
  SEL v28 = a2;
  v27.receiver = self;
  v27.super_class = (Class)CPSDashboardEstimatesView;
  [(CPSDashboardEstimatesView *)&v27 layoutSubviews];
  [(CPSDashboardEstimatesView *)v29 bounds];
  double v26 = v2;
  v13 = [(CPSDashboardEstimatesView *)v29 etaLabel];
  [(UILabel *)v13 setHidden:0];

  v14 = [(CPSDashboardEstimatesView *)v29 timeRemainingLabel];
  [(UILabel *)v14 setHidden:0];

  v15 = [(CPSDashboardEstimatesView *)v29 distanceRemainingLabel];
  [(UILabel *)v15 setHidden:0];

  v16 = [(CPSDashboardEstimatesView *)v29 etaLabel];
  [(UILabel *)v16 sizeToFit];

  id v17 = [(CPSDashboardEstimatesView *)v29 timeRemainingLabel];
  [(UILabel *)v17 sizeToFit];

  v18 = [(CPSDashboardEstimatesView *)v29 distanceRemainingLabel];
  [(UILabel *)v18 sizeToFit];

  v23 = [(CPSDashboardEstimatesView *)v29 etaLabel];
  [(UILabel *)v23 intrinsicContentSize];
  double v19 = v3 + 12.0;
  v22 = [(CPSDashboardEstimatesView *)v29 timeRemainingLabel];
  [(UILabel *)v22 intrinsicContentSize];
  double v21 = v19 + v4 + 12.0;
  v20 = [(CPSDashboardEstimatesView *)v29 distanceRemainingLabel];
  [(UILabel *)v20 intrinsicContentSize];
  double v24 = v21 + v5;

  double v25 = v24;
  if (v24 > v26)
  {
    v9 = [(CPSDashboardEstimatesView *)v29 distanceRemainingLabel];
    [(UILabel *)v9 setHidden:1];

    uint64_t v12 = [(CPSDashboardEstimatesView *)v29 etaLabel];
    [(UILabel *)v12 intrinsicContentSize];
    double v11 = v6 + 12.0;
    uint64_t v10 = [(CPSDashboardEstimatesView *)v29 timeRemainingLabel];
    [(UILabel *)v10 intrinsicContentSize];
    double v25 = v11 + v7;
  }
  if (v25 > v26)
  {
    uint64_t v8 = [(CPSDashboardEstimatesView *)v29 timeRemainingLabel];
    [(UILabel *)v8 setHidden:1];
  }
}

- (void)updateTripEstimates:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v3 = [(CPSDashboardEstimatesView *)v23 travelEstimatesStringFormatter];
  id v21 = [(CPSTravelEstimatesStringFormatter *)v3 generateTravelEstimatesStringsForTravelEstimates:location[0]];

  double v4 = NSString;
  id v6 = (id)[v21 arrivalTimeString];
  id v5 = CPSLocalizedStringForKey(@"ETA");
  id v20 = (id)objc_msgSend(v4, "stringWithFormat:", v6, v5);

  double v7 = [(CPSDashboardEstimatesView *)v23 etaLabel];
  [(UILabel *)v7 setText:v20];

  uint64_t v8 = NSString;
  id v10 = (id)[v21 timeRemainingString];
  id v9 = (id)[v21 localizedTimeRemainingUnit];
  id v19 = (id)[v8 stringWithFormat:@"%@ %@", v10, v9];

  double v11 = [(CPSDashboardEstimatesView *)v23 timeRemainingLabel];
  [(UILabel *)v11 setText:v19];

  uint64_t v12 = NSString;
  id v14 = (id)[v21 distanceRemainingString];
  id v13 = (id)[v21 localizedDistanceRemainingUnit];
  id v18 = (id)[v12 stringWithFormat:@"%@ %@", v14, v13];

  v15 = [(CPSDashboardEstimatesView *)v23 distanceRemainingLabel];
  [(UILabel *)v15 setText:v18];

  id v17 = (id)objc_msgSend(MEMORY[0x263EFCAC0], "timeRemainingColorForColor:", objc_msgSend(location[0], "timeRemainingColor"));
  v16 = [(CPSDashboardEstimatesView *)v23 timeRemainingLabel];
  [(UILabel *)v16 setTextColor:v17];

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (id)_labelFont
{
  v18[1] = *MEMORY[0x263EF8340];
  v14[2] = self;
  v14[1] = (id)a2;
  id v6 = (void *)MEMORY[0x263F1C660];
  uint64_t v5 = *MEMORY[0x263F1D280];
  id v7 = (id)[(CPSDashboardEstimatesView *)self traitCollection];
  v14[0] = (id)objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5);

  uint64_t v17 = *MEMORY[0x263F1D350];
  id v8 = (id)[NSNumber numberWithDouble:*MEMORY[0x263F1D340]];
  v18[0] = v8;
  id v13 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, &v17);

  id v9 = v14[0];
  uint64_t v15 = *MEMORY[0x263F1D210];
  id v16 = v13;
  id v10 = (id)[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v2 = (id)objc_msgSend(v9, "fontDescriptorByAddingAttributes:");
  id v3 = v14[0];
  v14[0] = v2;

  id v12 = (id)[MEMORY[0x263F1C658] fontWithDescriptor:v14[0] size:0.0];
  id v11 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);

  return v11;
}

- (UILabel)etaLabel
{
  return self->_etaLabel;
}

- (void)setEtaLabel:(id)a3
{
}

- (UILabel)timeRemainingLabel
{
  return self->_timeRemainingLabel;
}

- (void)setTimeRemainingLabel:(id)a3
{
}

- (UILabel)distanceRemainingLabel
{
  return self->_distanceRemainingLabel;
}

- (void)setDistanceRemainingLabel:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (CPSTravelEstimatesStringFormatter)travelEstimatesStringFormatter
{
  return self->_travelEstimatesStringFormatter;
}

- (void)setTravelEstimatesStringFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end