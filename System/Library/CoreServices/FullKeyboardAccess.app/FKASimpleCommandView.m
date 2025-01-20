@interface FKASimpleCommandView
- (FKASimpleCommandView)initWithKeyChordString:(id)a3;
@end

@implementation FKASimpleCommandView

- (FKASimpleCommandView)initWithKeyChordString:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FKASimpleCommandView;
  v5 = [(FKASimpleCommandView *)&v17 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)UIVisualEffectView);
    v7 = [(FKASimpleCommandView *)v5 platterBlurEffect];
    v8 = +[UIVibrancyEffect effectForBlurEffect:v7 style:0];
    id v9 = [v6 initWithEffect:v8];

    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FKASimpleCommandView *)v5 addSubview:v9];
    v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    v11 = objc_opt_new();
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 setFont:v10];
    [v11 setText:v4];
    [v11 setTextAlignment:1];
    [v11 setNumberOfLines:1];
    v12 = [v9 contentView];
    [v12 addSubview:v11];

    v13 = +[NSMutableArray array];
    v14 = [v9 contentView];
    v15 = +[NSLayoutConstraint ax_constraintsToMakeView:v5 sameDimensionsAsView:v14];
    [v13 addObjectsFromArray:v15];

    +[NSLayoutConstraint activateConstraints:v13];
  }

  return v5;
}

@end