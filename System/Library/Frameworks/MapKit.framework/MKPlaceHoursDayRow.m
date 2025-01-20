@interface MKPlaceHoursDayRow
- (MKPlaceHoursDayRow)initWithBusinessHours:(id)a3 frame:(CGRect)a4;
- (MKPlaceHoursView)hoursView;
- (NSLayoutConstraint)topAnchorToTopLabelBaseline;
- (void)_setUpConstraints;
- (void)_setUpViewsForPlaceHoursDayRow;
- (void)hoursViewDidUpdate:(id)a3;
- (void)setHoursView:(id)a3;
- (void)setTopAnchorToTopLabelBaseline:(id)a3;
@end

@implementation MKPlaceHoursDayRow

- (MKPlaceHoursDayRow)initWithBusinessHours:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKPlaceHoursDayRow;
  id v10 = -[MKPlaceSectionItemView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = [[MKPlaceHoursView alloc] initWithBusinessHours:v9];
    v12 = (void *)*((void *)v10 + 57);
    *((void *)v10 + 57) = v11;

    [*((id *)v10 + 57) setHoursDelegate:v10];
    [v10 _setUpViewsForPlaceHoursDayRow];
  }

  return (MKPlaceHoursDayRow *)v10;
}

- (void)_setUpViewsForPlaceHoursDayRow
{
  [(MKPlaceHoursDayRow *)self setPreservesSuperviewLayoutMargins:1];
  [(MKPlaceHoursDayRow *)self setClipsToBounds:0];
  [*(id *)&self->super._selected setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKPlaceHoursDayRow *)self addSubview:*(void *)&self->super._selected];

  [(MKPlaceHoursDayRow *)self _setUpConstraints];
}

- (void)_setUpConstraints
{
  id v21 = (id)objc_opt_new();
  v3 = [*(id *)&self->super._selected topLabel];
  v4 = [v3 font];
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 8.0);
  double v6 = v5;

  v7 = [(MKPlaceHoursDayRow *)self topAnchor];
  v8 = [*(id *)&self->super._selected topLabel];
  id v9 = [v8 firstBaselineAnchor];
  id v10 = [v7 constraintEqualToAnchor:v9 constant:-v6];
  hoursView = self->_hoursView;
  self->_hoursView = v10;

  [v21 addObject:self->_hoursView];
  v12 = [(MKPlaceHoursDayRow *)self bottomAnchor];
  v13 = [*(id *)&self->super._selected bottomAnchor];
  objc_super v14 = [v12 constraintEqualToAnchor:v13 constant:0.0];
  [v21 addObject:v14];

  v15 = [(MKPlaceHoursDayRow *)self leftAnchor];
  v16 = [*(id *)&self->super._selected leftAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:0.0];
  [v21 addObject:v17];

  v18 = [(MKPlaceHoursDayRow *)self rightAnchor];
  v19 = [*(id *)&self->super._selected rightAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:0.0];
  [v21 addObject:v20];

  [MEMORY[0x1E4F28DC8] activateConstraints:v21];
}

- (void)hoursViewDidUpdate:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (*(id *)&self->super._selected == a3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC8];
    v18[0] = self->_hoursView;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v4 deactivateConstraints:v5];

    double v6 = [*(id *)&self->super._selected topLabel];
    v7 = [v6 font];
    objc_msgSend(v7, "_mapkit_scaledValueForValue:", 8.0);
    double v9 = v8;

    id v10 = [(MKPlaceHoursDayRow *)self topAnchor];
    v11 = [*(id *)&self->super._selected topLabel];
    v12 = [v11 firstBaselineAnchor];
    v13 = [v10 constraintEqualToAnchor:v12 constant:-v9];
    hoursView = self->_hoursView;
    self->_hoursView = v13;

    v15 = (void *)MEMORY[0x1E4F28DC8];
    v17 = self->_hoursView;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [v15 activateConstraints:v16];
  }
}

- (MKPlaceHoursView)hoursView
{
  return *(MKPlaceHoursView **)&self->super._selected;
}

- (void)setHoursView:(id)a3
{
}

- (NSLayoutConstraint)topAnchorToTopLabelBaseline
{
  return (NSLayoutConstraint *)self->_hoursView;
}

- (void)setTopAnchorToTopLabelBaseline:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoursView, 0);

  objc_storeStrong((id *)&self->super._selected, 0);
}

@end