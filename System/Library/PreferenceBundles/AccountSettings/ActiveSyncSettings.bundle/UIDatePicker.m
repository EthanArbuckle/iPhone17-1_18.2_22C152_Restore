@interface UIDatePicker
+ (id)as_newConfiguredPicker;
- (double)as_preferredHeight;
- (void)as_installConstraints;
@end

@implementation UIDatePicker

+ (id)as_newConfiguredPicker
{
  id v2 = objc_alloc_init((Class)UIDatePicker);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = +[NSDate distantFuture];
  [v2 setMaximumDate:v3];

  v4 = +[NSDate date];
  [v2 setMinimumDate:v4];

  [v2 setDatePickerMode:2];
  v5 = +[NSTimeZone systemTimeZone];
  [v2 setTimeZone:v5];

  [v2 setMinuteInterval:30];
  [v2 setPreferredDatePickerStyle:3];

  return v2;
}

- (void)as_installConstraints
{
  v3 = [(UIDatePicker *)self superview];
  v4 = [v3 topAnchor];

  v5 = [(UIDatePicker *)self superview];
  v6 = [v5 layoutMarginsGuide];

  if (v6 && v4)
  {
    v7 = [(UIDatePicker *)self widthAnchor];
    v8 = [v6 widthAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:16.0];

    LODWORD(v10) = 1144750080;
    v25 = v9;
    [v9 setPriority:v10];
    v11 = [(UIDatePicker *)self widthAnchor];
    v12 = [v6 widthAnchor];
    v13 = [v11 constraintLessThanOrEqualToAnchor:v12 constant:16.0];

    v24 = v13;
    LODWORD(v14) = 1148846080;
    [v13 setPriority:v14];
    v15 = [(UIDatePicker *)self widthAnchor];
    v16 = [v15 constraintLessThanOrEqualToConstant:390.0];

    LODWORD(v17) = 1148846080;
    [v16 setPriority:v17];
    v26[0] = v9;
    v26[1] = v13;
    v26[2] = v16;
    v18 = [(UIDatePicker *)self topAnchor];
    v19 = [v18 constraintEqualToAnchor:v4 constant:4.0];
    v26[3] = v19;
    v20 = [(UIDatePicker *)self centerXAnchor];
    v21 = [v6 centerXAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v26[4] = v22;
    v23 = +[NSArray arrayWithObjects:v26 count:5];
    +[NSLayoutConstraint activateConstraints:v23];
  }
}

- (double)as_preferredHeight
{
  v3 = [(UIDatePicker *)self superview];
  v4 = [v3 layoutMarginsGuide];
  [v4 layoutFrame];
  CGFloat v5 = CGRectGetWidth(v10) + 16.0;

  LODWORD(v6) = 1144750080;
  LODWORD(v7) = 1112014848;
  -[UIDatePicker systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, 0.0, v6, v7);
  return v8 + 8.0;
}

@end