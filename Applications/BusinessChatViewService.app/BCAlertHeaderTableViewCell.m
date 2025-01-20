@interface BCAlertHeaderTableViewCell
+ (double)heightForBusinessItem:(id)a3 forWidth:(double)a4;
+ (id)reuseIdentifier;
- (BCAlertHeaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)mainImageView;
- (void)updateContentViewUsingBusinessItem:(id)a3 brandedHeaderDelegate:(id)a4;
@end

@implementation BCAlertHeaderTableViewCell

- (BCAlertHeaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BCAlertHeaderTableViewCell;
  v4 = [(BCAlertHeaderTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(BCAlertHeaderTableViewCell *)v4 setSelectionStyle:0];
  }
  return v5;
}

+ (id)reuseIdentifier
{
  return @"BCAlertHeaderTableViewCellReuseIdentifier";
}

+ (double)heightForBusinessItem:(id)a3 forWidth:(double)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = [BCAlertHeaderTableViewCell alloc];
    objc_super v7 = [(id)objc_opt_class() reuseIdentifier];
    v8 = [(BCAlertHeaderTableViewCell *)v6 initWithStyle:0 reuseIdentifier:v7];

    [(BCAlertHeaderTableViewCell *)v8 updateContentViewUsingBusinessItem:v5 brandedHeaderDelegate:0];
    [(BCAlertHeaderTableViewCell *)v8 layoutMargins];
    double v12 = v11;
    double v13 = v9;
    double v15 = v14 + v10;
    if (v14 + v10 >= a4) {
      double v15 = 0.0;
    }
    LODWORD(v9) = 1148846080;
    LODWORD(v10) = 1112014848;
    -[BCAlertHeaderTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v8, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a4 - v15, 0.0, v9, v10);
    double v17 = v13 + v12 + v16;
  }
  else
  {
    v18 = sub_100007F6C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      v21 = "+[BCAlertHeaderTableViewCell heightForBusinessItem:forWidth:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Cannot update content view for nil BCSBusinessItem", (uint8_t *)&v20, 0xCu);
    }

    double v17 = 0.0;
  }

  return v17;
}

- (void)updateContentViewUsingBusinessItem:(id)a3 brandedHeaderDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = +[UIColor colorNamed:@"CellBackgroundColor"];
    [(BCAlertHeaderTableViewCell *)self setBackgroundColor:v8];

    double v9 = [(BCAlertHeaderTableViewCell *)self contentView];
    double v10 = [v9 subviews];
    [v10 makeObjectsPerformSelector:"removeFromSuperview"];

    v30 = [v6 makeBrandedHeaderViewController];
    [v30 setDelegate:v7];
    [v30 view];
    double v11 = v36 = v7;
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v12 = [(BCAlertHeaderTableViewCell *)self contentView];
    [v12 addSubview:v11];

    v34 = [v11 leadingAnchor];
    v35 = [(BCAlertHeaderTableViewCell *)self contentView];
    v33 = [v35 layoutMarginsGuide];
    v32 = [v33 leadingAnchor];
    v31 = [v34 constraintEqualToAnchor:v32];
    v38[0] = v31;
    v28 = [v11 trailingAnchor];
    v29 = [(BCAlertHeaderTableViewCell *)self contentView];
    v27 = [v29 layoutMarginsGuide];
    v26 = [v27 trailingAnchor];
    v25 = [v28 constraintEqualToAnchor:v26];
    v38[1] = v25;
    v23 = [v11 topAnchor];
    v24 = [(BCAlertHeaderTableViewCell *)self contentView];
    double v13 = [v24 layoutMarginsGuide];
    double v14 = [v13 topAnchor];
    double v15 = [v23 constraintEqualToAnchor:v14];
    v38[2] = v15;
    [v11 bottomAnchor];
    double v16 = v37 = v6;
    double v17 = [(BCAlertHeaderTableViewCell *)self contentView];
    v18 = [v17 layoutMarginsGuide];
    v19 = [v18 bottomAnchor];
    int v20 = [v16 constraintEqualToAnchor:v19];
    v38[3] = v20;
    v21 = +[NSArray arrayWithObjects:v38 count:4];
    +[NSLayoutConstraint activateConstraints:v21];

    v22 = v30;
    id v6 = v37;

    id v7 = v36;
  }
  else
  {
    v22 = sub_100007F6C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[BCAlertHeaderTableViewCell updateContentViewUsingBusinessItem:brandedHeaderDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Cannot update content view for nil BCSBusinessItem", buf, 0xCu);
    }
  }
}

- (UIImageView)mainImageView
{
  return self->_mainImageView;
}

- (void).cxx_destruct
{
}

@end