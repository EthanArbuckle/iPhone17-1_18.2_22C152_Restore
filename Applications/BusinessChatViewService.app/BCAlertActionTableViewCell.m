@interface BCAlertActionTableViewCell
+ (double)heightForActionItem:(id)a3 forWidth:(double)a4;
+ (id)reuseIdentifierForItem:(id)a3;
- (BCAlertActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)mainImageView;
- (UILabel)subTitleLabel;
- (UILabel)titleLabel;
- (void)loadContentView;
@end

@implementation BCAlertActionTableViewCell

- (BCAlertActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BCAlertActionTableViewCell;
  v4 = [(BCAlertActionTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(BCAlertActionTableViewCell *)v4 loadContentView];
  }
  return v5;
}

+ (id)reuseIdentifierForItem:(id)a3
{
  v3 = [a3 subTitle];
  id v4 = [v3 length];
  v5 = @"CellWithTitleSubTitleAndIcon";
  if (!v4) {
    v5 = @"CellWithTitleAndIcon";
  }
  v6 = v5;

  return v6;
}

+ (double)heightForActionItem:(id)a3 forWidth:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [(id)objc_opt_class() reuseIdentifierForItem:v6];
  id v9 = [v7 initWithStyle:0 reuseIdentifier:v8];

  v10 = [v6 title];
  v11 = [v9 titleLabel];
  [v11 setText:v10];

  v12 = [v6 subTitle];
  v13 = [v9 subTitleLabel];
  [v13 setText:v12];

  v14 = [v6 icon];

  v15 = [v9 mainImageView];
  [v15 setImage:v14];

  LODWORD(v16) = 1148846080;
  LODWORD(v17) = 1112014848;
  [v9 systemLayoutSizeFittingSize:a4 withHorizontalFittingPriority:0.0 verticalFittingPriority:v16 v17];
  double v19 = v18;
  [v9 layoutMargins];
  double v21 = v19 + v20;
  [v9 layoutMargins];
  double v23 = v21 + v22;

  return v23;
}

- (void)loadContentView
{
  v3 = [(BCAlertActionTableViewCell *)self contentView];
  id v88 = objc_alloc_init((Class)UILayoutGuide);
  [v3 addLayoutGuide:];
  id v4 = objc_alloc_init((Class)UIImageView);
  objc_storeStrong((id *)&self->_mainImageView, v4);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v4];
  id v87 = objc_alloc_init((Class)UILayoutGuide);
  [v3 addLayoutGuide:];
  id v5 = objc_alloc_init((Class)UILabel);
  objc_storeStrong((id *)&self->_titleLabel, v5);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v5];
  id v6 = [(BCAlertActionTableViewCell *)self reuseIdentifier];
  unsigned int v7 = [v6 isEqualToString:@"CellWithTitleSubTitleAndIcon"];

  if (v7)
  {
    id v8 = objc_alloc_init((Class)UILabel);
    objc_storeStrong((id *)&self->_subTitleLabel, v8);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:v8];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = +[UIFont systemFontOfSize:20.0];
  v10 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleTitle3];
  v11 = [v10 scaledFontForFont:v9];
  [v5 setFont:v11];

  [v5 setAdjustsFontForContentSizeCategory:1];
  v12 = +[UIColor _systemBlueColor2];
  [v5 setTextColor:v12];

  [v5 setNumberOfLines:2];
  [v5 setLineBreakMode:4];
  v83 = v5;
  v98 = v8;
  if (v8)
  {
    uint64_t v13 = +[UIFont systemFontOfSize:13.0];

    v14 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleCaption1];
    v15 = [v14 scaledFontForFont:v13];
    [v8 setFont:v15];

    [v8 setAdjustsFontForContentSizeCategory:1];
    double v16 = +[UIColor secondaryLabelColor];
    [v8 setTextColor:v16];

    [v8 setNumberOfLines:2];
    [v8 setLineBreakMode:4];
    v82 = (void *)v13;
  }
  else
  {
    v82 = v9;
  }
  double v17 = +[UIColor colorNamed:@"AlertActionIconColor"];
  [v4 setTintColor:v17];

  double v18 = +[UIColor colorNamed:@"CellBackgroundColor"];
  [(BCAlertActionTableViewCell *)self setBackgroundColor:v18];

  v99 = objc_opt_new();
  v95 = [v88 leadingAnchor];
  v92 = [v3 leadingAnchor];
  v89 = [v95 constraintEqualToAnchor:v92 constant:16.0];
  v104[0] = v89;
  v79 = [v88 centerYAnchor];
  v85 = [v3 layoutMarginsGuide];
  v76 = [v85 centerYAnchor];
  v74 = [v79 constraintEqualToAnchor:v76];
  v104[1] = v74;
  v72 = [v88 topAnchor];
  v70 = [v3 topAnchor];
  v68 = [v72 constraintGreaterThanOrEqualToAnchor:v70];
  v104[2] = v68;
  v67 = [v88 bottomAnchor];
  v66 = [v3 bottomAnchor];
  v65 = [v67 constraintLessThanOrEqualToAnchor:v66];
  v104[3] = v65;
  v64 = [v88 widthAnchor];
  v63 = [v64 constraintEqualToConstant:44.0];
  v104[4] = v63;
  v62 = [v88 heightAnchor];
  v61 = [v62 constraintEqualToConstant:44.0];
  v104[5] = v61;
  v60 = [v4 centerXAnchor];
  v59 = [v88 centerXAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v104[6] = v58;
  double v19 = [v4 centerYAnchor];
  double v20 = [v88 centerYAnchor];
  double v21 = [v19 constraintEqualToAnchor:v20];
  v104[7] = v21;
  double v22 = [v4 widthAnchor];
  double v23 = [v22 constraintEqualToConstant:24.0];
  v104[8] = v23;
  v84 = v4;
  v24 = [v4 heightAnchor];
  v25 = [v24 constraintEqualToConstant:24.0];
  v104[9] = v25;
  +[NSArray arrayWithObjects:v104 count:10];
  v27 = v26 = v3;
  [v99 addObjectsFromArray:v27];

  v96 = [v87 leadingAnchor];
  v93 = [v88 trailingAnchor];
  v90 = [v96 constraintEqualToAnchor:v93 constant:16.0];
  v103[0] = v90;
  v77 = [v87 trailingAnchor];
  v80 = [v26 layoutMarginsGuide];
  v75 = [v80 trailingAnchor];
  v73 = [v77 constraintEqualToAnchor:v75];
  v103[1] = v73;
  v69 = [v87 centerYAnchor];
  v71 = [v26 layoutMarginsGuide];
  v28 = [v71 centerYAnchor];
  v29 = [v69 constraintEqualToAnchor:v28];
  v103[2] = v29;
  v30 = [v87 topAnchor];
  v31 = [v26 topAnchor];
  v32 = [v30 constraintGreaterThanOrEqualToAnchor:v31];
  v103[3] = v32;
  v33 = [v87 bottomAnchor];
  v86 = v26;
  v34 = [v26 bottomAnchor];
  v35 = [v33 constraintLessThanOrEqualToAnchor:v34];
  v103[4] = v35;
  v36 = +[NSArray arrayWithObjects:v103 count:5];
  [v99 addObjectsFromArray:v36];

  v37 = [v83 leadingAnchor];
  v94 = [v87 leadingAnchor];
  v97 = v37;
  uint64_t v38 = [v37 constraintEqualToAnchor:v94];
  v91 = (void *)v38;
  if (v98)
  {
    v102[0] = v38;
    v39 = [v83 trailingAnchor];
    v40 = [v87 trailingAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v102[1] = v41;
    v42 = [v83 topAnchor];
    v43 = [v87 topAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    v102[2] = v44;
    v45 = +[NSArray arrayWithObjects:v102 count:3];
    [v99 addObjectsFromArray:v45];

    v46 = [v98 leadingAnchor];
    v94 = [v87 leadingAnchor];
    v97 = v46;
    v91 = [v46 constraintEqualToAnchor:v94];
    v101[0] = v91;
    v47 = [v98 trailingAnchor];
    v78 = [v87 trailingAnchor];
    v81 = v47;
    v48 = [v47 constraintEqualToAnchor:v78];
    v101[1] = v48;
    v49 = [v98 topAnchor];
    v50 = [v83 bottomAnchor];
    v51 = [v49 constraintEqualToAnchor:v50 constant:0.0];
    v101[2] = v51;
    v52 = [v98 bottomAnchor];
    v53 = [v87 bottomAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    v101[3] = v54;
    v55 = v101;
  }
  else
  {
    v100[0] = v38;
    v56 = [v83 trailingAnchor];
    v78 = [v87 trailingAnchor];
    v81 = v56;
    v48 = [v56 constraintEqualToAnchor:v78];
    v100[1] = v48;
    v49 = [v83 topAnchor];
    v50 = [v87 topAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    v100[2] = v51;
    v52 = [v83 bottomAnchor];
    v53 = [v87 bottomAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    v100[3] = v54;
    v55 = v100;
  }
  v57 = +[NSArray arrayWithObjects:v55 count:4];
  [v99 addObjectsFromArray:v57];

  +[NSLayoutConstraint activateConstraints:v99];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (UIImageView)mainImageView
{
  return self->_mainImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainImageView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end