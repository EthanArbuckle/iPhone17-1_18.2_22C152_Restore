@interface FKATypeaheadView
- (FKATypeaheadTextField)textField;
- (FKATypeaheadView)initWithFrame:(CGRect)a3;
- (double)platterWidth;
- (void)setTextField:(id)a3;
@end

@implementation FKATypeaheadView

- (FKATypeaheadView)initWithFrame:(CGRect)a3
{
  v54.receiver = self;
  v54.super_class = (Class)FKATypeaheadView;
  v3 = -[FKATypeaheadView initWithFrame:](&v54, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIVisualEffectView);
    v5 = [(FKATypeaheadView *)v3 platterBlurEffect];
    v6 = +[UIVibrancyEffect effectForBlurEffect:v5 style:0];
    id v7 = [v4 initWithEffect:v6];

    id v8 = v7;
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FKATypeaheadView *)v3 addSubview:v7];
    v52 = v7;
    v9 = [v7 contentView];
    v10 = objc_alloc_init(FKATypeaheadTextField);
    [(FKATypeaheadTextField *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = v10;
    v12 = [(FKATypeaheadTextField *)v10 layer];
    [v12 setCornerRadius:14.0];

    [v9 addSubview:v11];
    v13 = v11;
    [(FKATypeaheadView *)v3 setTextField:v11];
    v53 = objc_opt_new();
    v14 = [(FKATypeaheadView *)v3 contentView];
    v15 = +[NSLayoutConstraint ax_constraintsToMakeView:v8 sameDimensionsAsView:v14];
    [v53 addObjectsFromArray:v15];

    v51 = [(FKATypeaheadView *)v3 textField];
    v50 = [v51 widthAnchor];
    v49 = [v50 constraintEqualToConstant:289.0];
    v55[0] = v49;
    v48 = [(FKATypeaheadView *)v3 textField];
    v47 = [v48 heightAnchor];
    v46 = [v47 constraintEqualToConstant:36.0];
    v55[1] = v46;
    v45 = [v9 heightAnchor];
    v44 = [v45 constraintEqualToConstant:46.0];
    v55[2] = v44;
    v43 = [v9 topAnchor];
    v42 = [(FKATypeaheadView *)v3 topAnchor];
    v41 = [v43 constraintEqualToAnchor:v42 constant:68.0];
    v55[3] = v41;
    v40 = [v9 bottomAnchor];
    v39 = [(FKATypeaheadView *)v3 bottomAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:-68.0];
    v55[4] = v38;
    v37 = [v9 leadingAnchor];
    v36 = [(FKATypeaheadView *)v3 leadingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:68.0];
    v55[5] = v35;
    v33 = [v9 trailingAnchor];
    v32 = [(FKATypeaheadView *)v3 trailingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32 constant:-68.0];
    v55[6] = v31;
    v16 = v13;
    v30 = [(FKATypeaheadTextField *)v13 topAnchor];
    v29 = [v9 topAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:5.0];
    v55[7] = v28;
    v27 = [v9 bottomAnchor];
    v26 = [(FKATypeaheadTextField *)v13 bottomAnchor];
    v17 = [v27 constraintEqualToAnchor:v26 constant:5.0];
    v55[8] = v17;
    v34 = v13;
    v18 = [(FKATypeaheadTextField *)v13 leadingAnchor];
    v19 = [v9 leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:5.0];
    v55[9] = v20;
    v21 = [v9 trailingAnchor];
    v22 = [(FKATypeaheadTextField *)v16 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:5.0];
    v55[10] = v23;
    v24 = +[NSArray arrayWithObjects:v55 count:11];
    [v53 addObjectsFromArray:v24];

    +[NSLayoutConstraint activateConstraints:v53];
  }
  return v3;
}

- (double)platterWidth
{
  return 0.0;
}

- (FKATypeaheadTextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (void).cxx_destruct
{
}

@end