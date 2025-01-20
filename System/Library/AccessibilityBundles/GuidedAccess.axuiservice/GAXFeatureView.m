@interface GAXFeatureView
+ (BOOL)requiresConstraintBasedLayout;
+ (GAXFeatureView)allocWithZone:(_NSZone *)a3;
+ (id)appFeatureViewWithIdentifier:(id)a3 icon:(id)a4 text:(id)a5 detailText:(id)a6 initialState:(BOOL)a7 styleProvider:(id)a8;
+ (id)hardwareFeatureViewWithIdentifier:(id)a3 icon:(id)a4 text:(id)a5 initialState:(BOOL)a6 styleProvider:(id)a7;
+ (id)optionsFeatureViewWithIdentifier:(id)a3 icon:(id)a4 text:(id)a5 styleProvider:(id)a6;
+ (id)systemFeatureViewWithIdentifier:(id)a3 icon:(id)a4 text:(id)a5 initialState:(BOOL)a6 styleProvider:(id)a7;
+ (id)timeRestrictionsFeatureViewWithInitialState:(BOOL)a3 initialDuration:(int64_t)a4 styleProvider:(id)a5;
- (BOOL)_accessibilityActivateToggleSwitch;
- (BOOL)_accessibilitySupportsActivateAction;
- (CGRect)popoverOriginRect;
- (GAXFeatureView)initWithIdentifier:(id)a3 type:(int64_t)a4 icon:(id)a5 text:(id)a6 detailText:(id)a7 initialState:(BOOL)a8 styleProvider:(id)a9;
- (GAXFeatureViewDelegate)delegate;
- (GAXIconView)iconView;
- (NSString)identifier;
- (UILabel)textLabel;
- (UISwitch)toggleSwitch;
- (id)accessibilityValue;
- (id)description;
- (int64_t)type;
- (void)_handleFeatureToggleUpInside:(id)a3;
- (void)_handleValueChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconView:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setToggleSwitch:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateMask;
@end

@implementation GAXFeatureView

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (id)accessibilityValue
{
  v2 = [(GAXFeatureView *)self toggleSwitch];
  v3 = [v2 accessibilityValue];

  return v3;
}

- (void)_handleValueChanged:(id)a3
{
  id v5 = a3;
  v4 = [(GAXFeatureView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "featureView:didChangeState:", self, objc_msgSend(v5, "isOn"));
  }
}

- (void)_handleFeatureToggleUpInside:(id)a3
{
}

- (BOOL)_accessibilityActivateToggleSwitch
{
  v3 = [(GAXFeatureView *)self toggleSwitch];
  objc_msgSend(v3, "setOn:", objc_msgSend(v3, "isOn") ^ 1);
  [(GAXFeatureView *)self _handleValueChanged:v3];

  return 1;
}

+ (GAXFeatureView)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    if (GAXUserInterfaceIdiomIsPad()) {
      _AXAssert();
    }
    v6 = objc_opt_class();
    return (GAXFeatureView *)[v6 allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___GAXFeatureView;
    return (GAXFeatureView *)objc_msgSendSuper2(&v7, "allocWithZone:", a3);
  }
}

+ (id)appFeatureViewWithIdentifier:(id)a3 icon:(id)a4 text:(id)a5 detailText:(id)a6 initialState:(BOOL)a7 styleProvider:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [objc_alloc((Class)a1) initWithIdentifier:v18 type:0 icon:v17 text:v16 detailText:v15 initialState:v8 styleProvider:v14];

  [v19 _constructViewHierarchyWithIcon:v17 text:v16 detailText:v15 initialFeatureState:v8 styleProvider:v14];
  [v19 _applyAutolayoutConstraintsWithIcon:v17 text:v16 detailText:v15 initialFeatureState:v8 styleProvider:v14];

  return v19;
}

+ (id)hardwareFeatureViewWithIdentifier:(id)a3 icon:(id)a4 text:(id)a5 initialState:(BOOL)a6 styleProvider:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [objc_alloc((Class)a1) initWithIdentifier:v15 type:1 icon:v14 text:v13 detailText:0 initialState:v7 styleProvider:v12];

  [v16 _constructViewHierarchyWithIcon:v14 text:v13 detailText:0 initialFeatureState:v7 styleProvider:v12];
  [v16 _applyAutolayoutConstraintsWithIcon:v14 text:v13 detailText:0 initialFeatureState:v7 styleProvider:v12];

  return v16;
}

+ (id)optionsFeatureViewWithIdentifier:(id)a3 icon:(id)a4 text:(id)a5 styleProvider:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithIdentifier:v13 type:2 icon:v12 text:v11 detailText:0 initialState:0 styleProvider:v10];

  [v14 _constructViewHierarchyWithIcon:v12 text:v11 detailText:0 initialFeatureState:0 styleProvider:v10];
  [v14 _applyAutolayoutConstraintsWithIcon:v12 text:v11 detailText:0 initialFeatureState:0 styleProvider:v10];

  return v14;
}

+ (id)systemFeatureViewWithIdentifier:(id)a3 icon:(id)a4 text:(id)a5 initialState:(BOOL)a6 styleProvider:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [objc_alloc((Class)a1) initWithIdentifier:v15 type:3 icon:v14 text:v13 detailText:0 initialState:v7 styleProvider:v12];

  [v16 _constructViewHierarchyWithIcon:v14 text:v13 detailText:0 initialFeatureState:v7 styleProvider:v12];
  [v16 _applyAutolayoutConstraintsWithIcon:v14 text:v13 detailText:0 initialFeatureState:v7 styleProvider:v12];

  return v16;
}

+ (id)timeRestrictionsFeatureViewWithInitialState:(BOOL)a3 initialDuration:(int64_t)a4 styleProvider:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  if (v6)
  {
    GAXLocalizedStringForTimeDuration((double)a4 * 60.0);
    BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v8 = &stru_5E940;
  }
  v9 = GAXLocString(@"TIME_RESTRICTION_FEATURE");
  id v10 = [v7 timeRestrictionsFeatureViewTimerIcon];
  if (a4 <= 1) {
    a4 = 1;
  }
  id v11 = [[TimeRestrictionFeatureView alloc] initWithIdentifier:@"GAXProfileAppTimeoutDuration" type:4 icon:v10 text:v9 detailText:v8 initialState:v6 initialDuration:a4 styleProvider:v7];
  [(TimeRestrictionFeatureView *)v11 _constructViewHierarchyWithIcon:v10 text:v9 detailText:v8 initialFeatureState:v6 styleProvider:v7];
  [(TimeRestrictionFeatureView *)v11 _applyAutolayoutConstraintsWithIcon:v10 text:v9 detailText:v8 initialFeatureState:v6 styleProvider:v7];

  return v11;
}

- (void)updateMask
{
  id v6 = [(GAXFeatureView *)self iconView];
  v3 = [v6 maskView];
  v4 = [(GAXFeatureView *)self iconView];
  id v5 = [v4 maskView];
  [v5 frame];
  objc_msgSend(v3, "setFrame:");
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)GAXFeatureView;
  v3 = [(GAXFeatureView *)&v7 description];
  v4 = [(GAXFeatureView *)self identifier];
  id v5 = +[NSString stringWithFormat:@"%@ identifier: %@, type: %ld", v3, v4, [(GAXFeatureView *)self type]];

  return v5;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (GAXFeatureViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXFeatureViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GAXIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UISwitch)toggleSwitch
{
  return self->_toggleSwitch;
}

- (void)setToggleSwitch:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_toggleSwitch, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (GAXFeatureView)initWithIdentifier:(id)a3 type:(int64_t)a4 icon:(id)a5 text:(id)a6 detailText:(id)a7 initialState:(BOOL)a8 styleProvider:(id)a9
{
  return 0;
}

- (CGRect)popoverOriginRect
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end