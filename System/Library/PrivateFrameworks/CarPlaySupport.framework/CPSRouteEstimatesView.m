@interface CPSRouteEstimatesView
- (CPSLabeledValueView)arrivalTimeView;
- (CPSLabeledValueView)distanceRemainingView;
- (CPSLabeledValueView)timeRemainingView;
- (CPSRouteEstimatesView)initWithStyle:(unint64_t)a3;
- (CPSTravelEstimatesStringFormatter)travelEstimatesStringFormatter;
- (NSTimeZone)arrivalTimeZone;
- (unint64_t)timeRemainingColor;
- (void)_updateTextColors;
- (void)setArrivalTimeZone:(id)a3;
- (void)setCurrentTravelEstimates:(id)a3;
- (void)setTimeRemainingColor:(unint64_t)a3;
- (void)setTripEstimateStyle:(unint64_t)a3;
@end

@implementation CPSRouteEstimatesView

- (CPSRouteEstimatesView)initWithStyle:(unint64_t)a3
{
  v53[11] = *MEMORY[0x263EF8340];
  SEL v51 = a2;
  unint64_t v50 = a3;
  v52 = 0;
  v49.receiver = self;
  v49.super_class = (Class)CPSRouteEstimatesView;
  v52 = [(CPSRouteEstimatesView *)&v49 init];
  objc_storeStrong((id *)&v52, v52);
  if (v52)
  {
    v3 = objc_alloc_init(CPSTravelEstimatesStringFormatter);
    travelEstimatesStringFormatter = v52->_travelEstimatesStringFormatter;
    v52->_travelEstimatesStringFormatter = v3;

    [(CPSRouteEstimatesView *)v52 setTripEstimateStyle:v50];
    [(CPSRouteEstimatesView *)v52 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = objc_alloc_init(CPSLabeledValueView);
    arrivalTimeView = v52->_arrivalTimeView;
    v52->_arrivalTimeView = v5;

    [(CPSRouteEstimatesView *)v52 addSubview:v52->_arrivalTimeView];
    v7 = objc_alloc_init(CPSLabeledValueView);
    timeRemainingView = v52->_timeRemainingView;
    v52->_timeRemainingView = v7;

    [(CPSRouteEstimatesView *)v52 addSubview:v52->_timeRemainingView];
    v9 = objc_alloc_init(CPSLabeledValueView);
    distanceRemainingView = v52->_distanceRemainingView;
    v52->_distanceRemainingView = v9;

    [(CPSRouteEstimatesView *)v52 addSubview:v52->_distanceRemainingView];
    id v48 = objc_alloc_init(MEMORY[0x263F1C778]);
    [(CPSRouteEstimatesView *)v52 addLayoutGuide:v48];
    id v47 = objc_alloc_init(MEMORY[0x263F1C778]);
    [(CPSRouteEstimatesView *)v52 addLayoutGuide:v47];
    v13 = (void *)MEMORY[0x263F08938];
    id v46 = (id)[v48 leftAnchor];
    id v45 = (id)[(CPSRouteEstimatesView *)v52 leftAnchor];
    id v44 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
    v53[0] = v44;
    id v43 = (id)[v48 rightAnchor];
    id v42 = (id)[(CPSRouteEstimatesView *)v52 centerXAnchor];
    id v41 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
    v53[1] = v41;
    id v40 = (id)[v47 leftAnchor];
    id v39 = (id)[(CPSRouteEstimatesView *)v52 centerXAnchor];
    id v38 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
    v53[2] = v38;
    id v37 = (id)[v47 rightAnchor];
    id v36 = (id)[(CPSRouteEstimatesView *)v52 rightAnchor];
    id v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
    v53[3] = v35;
    id v34 = (id)[(CPSLabeledValueView *)v52->_timeRemainingView centerXAnchor];
    id v33 = (id)[(CPSRouteEstimatesView *)v52 centerXAnchor];
    id v32 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
    v53[4] = v32;
    id v31 = (id)[(CPSLabeledValueView *)v52->_arrivalTimeView centerXAnchor];
    id v30 = (id)[v48 centerXAnchor];
    id v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:constant:", -7.0);
    v53[5] = v29;
    id v28 = (id)[(CPSLabeledValueView *)v52->_distanceRemainingView centerXAnchor];
    id v27 = (id)[v47 centerXAnchor];
    id v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:constant:", 7.0);
    v53[6] = v26;
    id v25 = (id)[(CPSLabeledValueView *)v52->_timeRemainingView centerYAnchor];
    id v24 = (id)[(CPSRouteEstimatesView *)v52 centerYAnchor];
    id v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
    v53[7] = v23;
    id v22 = (id)[(CPSLabeledValueView *)v52->_arrivalTimeView centerYAnchor];
    id v21 = (id)[(CPSRouteEstimatesView *)v52 centerYAnchor];
    id v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
    v53[8] = v20;
    id v19 = (id)[(CPSLabeledValueView *)v52->_distanceRemainingView centerYAnchor];
    id v18 = (id)[(CPSRouteEstimatesView *)v52 centerYAnchor];
    id v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v53[9] = v17;
    id v16 = (id)[(CPSRouteEstimatesView *)v52 heightAnchor];
    id v15 = (id)[v16 constraintEqualToConstant:28.0];
    v53[10] = v15;
    id v14 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:11];
    objc_msgSend(v13, "activateConstraints:");

    [(CPSRouteEstimatesView *)v52 _updateTextColors];
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v48, 0);
  }
  v12 = v52;
  objc_storeStrong((id *)&v52, 0);
  return v12;
}

- (void)_updateTextColors
{
  v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)objc_msgSend(MEMORY[0x263EFCAC0], "timeRemainingColorForColor:", -[CPSRouteEstimatesView timeRemainingColor](self, "timeRemainingColor"));
  v3 = [(CPSRouteEstimatesView *)v10 timeRemainingView];
  v2 = [(CPSLabeledValueView *)v3 label];
  [(UILabel *)v2 setTextColor:v9[0]];

  v5 = [(CPSRouteEstimatesView *)v10 timeRemainingView];
  v4 = [(CPSLabeledValueView *)v5 valueText];
  [(UILabel *)v4 setTextColor:v9[0]];

  id v8 = (id)[MEMORY[0x263F1C550] labelColor];
  v6 = [(CPSRouteEstimatesView *)v10 distanceRemainingView];
  [(CPSLabeledValueView *)v6 setTextColor:v8];

  v7 = [(CPSRouteEstimatesView *)v10 arrivalTimeView];
  [(CPSLabeledValueView *)v7 setTextColor:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
}

- (void)setTripEstimateStyle:(unint64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(CPSRouteEstimatesView *)self setOverrideUserInterfaceStyle:v3];
  [(CPSRouteEstimatesView *)self _updateTextColors];
}

- (NSTimeZone)arrivalTimeZone
{
  v4 = [(CPSRouteEstimatesView *)self travelEstimatesStringFormatter];
  uint64_t v3 = [(CPSTravelEstimatesStringFormatter *)v4 arrivalTimeFormatter];
  v5 = [(NSDateFormatter *)v3 timeZone];

  return v5;
}

- (void)setArrivalTimeZone:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(CPSRouteEstimatesView *)v6 travelEstimatesStringFormatter];
  uint64_t v3 = [(CPSTravelEstimatesStringFormatter *)v4 arrivalTimeFormatter];
  [(NSDateFormatter *)v3 setTimeZone:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setTimeRemainingColor:(unint64_t)a3
{
  if (a3 != self->_timeRemainingColor)
  {
    self->_timeRemainingColor = a3;
    [(CPSRouteEstimatesView *)self _updateTextColors];
  }
}

- (void)setCurrentTravelEstimates:(id)a3
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [(CPSRouteEstimatesView *)v24 travelEstimatesStringFormatter];
  id v22 = [(CPSTravelEstimatesStringFormatter *)v3 generateTravelEstimatesStringsForTravelEstimates:location[0]];

  v6 = [(CPSRouteEstimatesView *)v24 arrivalTimeView];
  v5 = [(CPSLabeledValueView *)v6 valueText];
  id v4 = (id)[v22 arrivalTimeString];
  -[UILabel setText:](v5, "setText:");

  v9 = [(CPSRouteEstimatesView *)v24 arrivalTimeView];
  id v8 = [(CPSLabeledValueView *)v9 label];
  id v7 = (id)[v22 localizedArrivalString];
  -[UILabel setText:](v8, "setText:");

  v12 = [(CPSRouteEstimatesView *)v24 timeRemainingView];
  v11 = [(CPSLabeledValueView *)v12 valueText];
  id v10 = (id)[v22 timeRemainingString];
  -[UILabel setText:](v11, "setText:");

  id v15 = [(CPSRouteEstimatesView *)v24 timeRemainingView];
  id v14 = [(CPSLabeledValueView *)v15 label];
  id v13 = (id)[v22 localizedTimeRemainingUnit];
  -[UILabel setText:](v14, "setText:");

  id v18 = [(CPSRouteEstimatesView *)v24 distanceRemainingView];
  id v17 = [(CPSLabeledValueView *)v18 valueText];
  id v16 = (id)[v22 distanceRemainingString];
  -[UILabel setText:](v17, "setText:");

  id v21 = [(CPSRouteEstimatesView *)v24 distanceRemainingView];
  id v20 = [(CPSLabeledValueView *)v21 label];
  id v19 = (id)[v22 localizedDistanceRemainingUnit];
  -[UILabel setText:](v20, "setText:");

  -[CPSRouteEstimatesView setTimeRemainingColor:](v24, "setTimeRemainingColor:", [location[0] timeRemainingColor]);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (CPSLabeledValueView)timeRemainingView
{
  return self->_timeRemainingView;
}

- (CPSLabeledValueView)arrivalTimeView
{
  return self->_arrivalTimeView;
}

- (CPSLabeledValueView)distanceRemainingView
{
  return self->_distanceRemainingView;
}

- (CPSTravelEstimatesStringFormatter)travelEstimatesStringFormatter
{
  return self->_travelEstimatesStringFormatter;
}

- (unint64_t)timeRemainingColor
{
  return self->_timeRemainingColor;
}

- (void).cxx_destruct
{
}

@end