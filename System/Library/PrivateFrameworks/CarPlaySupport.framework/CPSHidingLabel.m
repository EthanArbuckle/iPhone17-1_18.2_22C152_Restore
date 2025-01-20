@interface CPSHidingLabel
- (void)layoutSubviews;
@end

@implementation CPSHidingLabel

- (void)layoutSubviews
{
  v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)CPSHidingLabel;
  [(CPSHidingLabel *)&v9 layoutSubviews];
  id v7 = (id)[(CPSHidingLabel *)v11 text];
  id v6 = (id)[(CPSHidingLabel *)v11 font];
  id v5 = (id)[(CPSHidingLabel *)v11 traitCollection];
  [v5 displayScale];
  CPSSizeForText(v7, v6, 0, 1.79769313e308, v2);
  double v8 = v3;

  [(CPSHidingLabel *)v11 frame];
  [(CPSHidingLabel *)v11 setHidden:ceil(v4) < v8];
}

@end