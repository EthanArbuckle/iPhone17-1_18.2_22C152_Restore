@interface CPSHairlineView
+ (id)grayHairlineViewAlongAxis:(int64_t)a3;
- (CPSHairlineView)initWithAxis:(int64_t)a3 color:(id)a4;
- (NSLayoutConstraint)strokeThicknessConstraint;
- (int64_t)axis;
- (void)_updateStrokeThickness;
- (void)setAxis:(int64_t)a3;
- (void)setStrokeThicknessConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSHairlineView

+ (id)grayHairlineViewAlongAxis:(int64_t)a3
{
  id v4 = objc_alloc((Class)a1);
  id v5 = (id)[MEMORY[0x263F1C550] colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.0];
  id v6 = (id)objc_msgSend(v4, "initWithAxis:color:", a3);

  return v6;
}

- (CPSHairlineView)initWithAxis:(int64_t)a3 color:(id)a4
{
  v18 = self;
  SEL v17 = a2;
  int64_t v16 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v4 = v18;
  v18 = 0;
  v18 = [(CPSHairlineView *)v4 init];
  objc_storeStrong((id *)&v18, v18);
  if (v18)
  {
    [(CPSHairlineView *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1148846080;
    [(CPSHairlineView *)v18 setContentHuggingPriority:v16 forAxis:v5];
    [(CPSHairlineView *)v18 setBackgroundColor:location];
    [(CPSHairlineView *)v18 setAxis:v16];
    char v12 = 0;
    char v10 = 0;
    if (v16)
    {
      id v11 = (id)[(CPSHairlineView *)v18 widthAnchor];
      char v10 = 1;
      id v6 = v11;
    }
    else
    {
      id v13 = (id)[(CPSHairlineView *)v18 heightAnchor];
      char v12 = 1;
      id v6 = v13;
    }
    id v14 = v6;
    if (v10) {

    }
    if (v12) {
    id v9 = (id)[v14 constraintEqualToConstant:1.0];
    }
    [(CPSHairlineView *)v18 setStrokeThicknessConstraint:v9];
    [(CPSHairlineView *)v18 addConstraint:v9];
    [(CPSHairlineView *)v18 _updateStrokeThickness];
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v14, 0);
  }
  v8 = v18;
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v18, 0);
  return v8;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSHairlineView *)v4 _updateStrokeThickness];
  objc_storeStrong(location, 0);
}

- (void)_updateStrokeThickness
{
  id v5 = (id)[(CPSHairlineView *)self traitCollection];
  [v5 displayScale];
  double v6 = v2;

  if (v6 > 0.0)
  {
    UIRoundToScale();
    double v7 = v3;
    id v4 = [(CPSHairlineView *)self strokeThicknessConstraint];
    [(NSLayoutConstraint *)v4 setConstant:v7];
  }
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (NSLayoutConstraint)strokeThicknessConstraint
{
  return self->_strokeThicknessConstraint;
}

- (void)setStrokeThicknessConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end