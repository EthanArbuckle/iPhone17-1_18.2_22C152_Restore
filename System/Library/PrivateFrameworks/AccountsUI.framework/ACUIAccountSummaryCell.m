@interface ACUIAccountSummaryCell
+ (id)_nameForAccountSpecifier:(id)a3 withStyle:(int64_t)a4;
+ (id)_valueForCellSpecifier:(id)a3;
+ (id)specifierWithStyle:(int64_t)a3 account:(id)a4 detailControllerClass:(Class)a5 presentationStyle:(int64_t)a6;
+ (id)specifierWithStyle:(int64_t)a3 account:(id)a4 target:(id)a5 controllerLoadAction:(SEL)a6;
+ (id)specifierWithStyle:(int64_t)a3 account:(id)a4 valueText:(id)a5 detailControllerClass:(Class)a6 presentationStyle:(int64_t)a7;
+ (void)_configureSpecifier:(id)a3 forAccount:(id)a4 withStyle:(int64_t)a5 valueText:(id)a6;
- (ACUIAccountSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)_dataclassesLabel;
- (id)_enabledDataclassesTextForWidth:(double)a3;
- (id)_font;
- (id)_numberFormatter;
- (void)hideDataclass:(id)a3;
- (void)layoutSubviews;
@end

@implementation ACUIAccountSummaryCell

+ (id)specifierWithStyle:(int64_t)a3 account:(id)a4 target:(id)a5 controllerLoadAction:(SEL)a6
{
  id obj = a5;
  SEL v10 = a6;
  id v24 = a1;
  SEL v23 = a2;
  int64_t v22 = a3;
  p_id location = &location;
  id v15 = 0;
  id location = 0;
  objc_storeStrong(&location, a4);
  v13 = &v20;
  id v20 = 0;
  objc_storeStrong(&v20, obj);
  SEL v19 = v10;
  v12 = &v18;
  id v18 = (id)[v24 _nameForAccountSpecifier:location withStyle:v22];
  id v6 = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v18 target:v20 set:0 get:0 detail:0 cell:2 edit:0];
  v11 = &v17;
  id v17 = v6;
  [v6 setControllerLoadAction:v19];
  [v24 _configureSpecifier:v17 forAccount:location withStyle:v22 valueText:v15];
  id v16 = v17;
  objc_storeStrong(v11, v15);
  objc_storeStrong(v12, v15);
  objc_storeStrong(v13, v15);
  objc_storeStrong(p_location, v15);
  id v7 = v16;
  return v7;
}

+ (id)specifierWithStyle:(int64_t)a3 account:(id)a4 detailControllerClass:(Class)a5 presentationStyle:(int64_t)a6
{
  id v13 = a1;
  SEL v12 = a2;
  int64_t v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v9 = (id)[v13 specifierWithStyle:v11 account:location valueText:0 detailControllerClass:a5 presentationStyle:a6];
  objc_storeStrong(&location, 0);
  return v9;
}

+ (id)specifierWithStyle:(int64_t)a3 account:(id)a4 valueText:(id)a5 detailControllerClass:(Class)a6 presentationStyle:(int64_t)a7
{
  id v27 = a1;
  SEL v26 = a2;
  int64_t v25 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v23 = 0;
  objc_storeStrong(&v23, a5);
  Class v22 = a6;
  int64_t v21 = a7;
  id v20 = 0;
  id v19 = (id)[v27 _nameForAccountSpecifier:location withStyle:v25];
  if (a6)
  {
    if (v21)
    {
      id v11 = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v19 target:0 set:0 get:0 detail:v22 cell:2 edit:0];
      id v12 = v20;
      id v20 = v11;
    }
    else
    {
      id v9 = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v19 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
      id v10 = v20;
      id v20 = v9;

      id v15 = NSStringFromClass(v22);
      objc_msgSend(v20, "setProperty:forKey:");
    }
  }
  else
  {
    id v7 = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v19 target:0 set:0 get:0 detail:0 cell:3 edit:0];
    id v8 = v20;
    id v20 = v7;

    [v20 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
  }
  [v27 _configureSpecifier:v20 forAccount:location withStyle:v25 valueText:v23];
  id v14 = v20;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&location, 0);
  return v14;
}

+ (id)_nameForAccountSpecifier:(id)a3 withStyle:(int64_t)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v16 = a4;
  id v15 = 0;
  if (a4 == 1 || v16 == 2)
  {
    if (_os_feature_enabled_impl())
    {
      id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v4 = (id)[v13 localizedStringForKey:@"ACCOUNT_SETTINGS" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v5 = v15;
      id v15 = v4;
    }
    else
    {
      id v12 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v6 = (id)[v12 localizedStringForKey:@"ACCOUNT_INFO" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v7 = v15;
      id v15 = v6;
    }
  }
  else
  {
    id v8 = (id)[location[0] accountPropertyForKey:@"ACUIAccountSimpleDisplayName"];
    id v9 = v15;
    id v15 = v8;

    if (!v15)
    {
      id v15 = (id)[location[0] accountPropertyForKey:@"fullname"];
    }
    if (!v15)
    {
      id v15 = (id)[location[0] accountDescription];
    }
  }
  if (!v15) {
    objc_storeStrong(&v15, @"?");
  }
  id v11 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v11;
}

+ (void)_configureSpecifier:(id)a3 forAccount:(id)a4 withStyle:(int64_t)a5 valueText:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v18 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  int64_t v15 = a5;
  id v14 = 0;
  objc_storeStrong(&v14, a6);
  id v13 = (id)[v16 identifier];
  if (v15 == 1 || v15 == 2)
  {
    objc_storeWeak((id *)((char *)location[0] + (int)*MEMORY[0x1E4F92F48]), v18);
    *(void *)((char *)location[0] + (int)*MEMORY[0x1E4F92F38]) = sel__valueForCellSpecifier_;
    objc_storeStrong(&v13, @"ACCOUNT_INFO");
  }
  [location[0] setProperty:v16 forKey:@"account"];
  id v8 = location[0];
  id v9 = (id)[NSNumber numberWithInteger:v15];
  objc_msgSend(v8, "setProperty:forKey:");

  if (v14) {
    [location[0] setProperty:v14 forKey:@"ACUIAccountSummaryValue"];
  }
  [location[0] setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  [location[0] setProperty:v13 forKey:*MEMORY[0x1E4F93188]];
  id v6 = location[0];
  id v19 = @"account";
  v20[0] = v16;
  id v7 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  objc_msgSend(v6, "setUserInfo:");

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

+ (id)_valueForCellSpecifier:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[location[0] propertyForKey:@"ACUIAccountSummaryValue"];
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v5 = (id)[location[0] propertyForKey:@"account"];
    id v8 = (id)[v5 displayUsername];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  v3 = v8;
  return v3;
}

- (ACUIAccountSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  int64_t v25 = self;
  SEL v24 = a2;
  int64_t v23 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v5 = v25;
  int64_t v25 = 0;
  v20.receiver = v5;
  v20.super_class = (Class)ACUIAccountSummaryCell;
  int64_t v25 = [(PSTableCell *)&v20 initWithStyle:v23 reuseIdentifier:location specifier:v21];
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    id v6 = (ACAccount *)(id)[v21 propertyForKey:@"account"];
    account = v25->_account;
    v25->_account = v6;

    id v17 = (id)[v21 propertyForKey:@"ACUIAccountSummaryStyle"];
    uint64_t v8 = [v17 integerValue];
    v25->_style = v8;

    id v9 = (NSSet *)(id)[(ACAccount *)v25->_account enabledDataclasses];
    enabledDataclasses = v25->_enabledDataclasses;
    v25->_enabledDataclasses = v9;

    id v18 = [(ACAccount *)v25->_account accountType];
    id v11 = (NSSet *)(id)[(ACAccountType *)v18 supportedDataclasses];
    supportedDataclasses = v25->_supportedDataclasses;
    v25->_supportedDataclasses = v11;

    id v13 = (NSString *)(id)[v21 propertyForKey:@"ACUIAccountSummaryValue"];
    desiredValue = v25->_desiredValue;
    v25->_desiredValue = v13;
  }
  id v16 = v25;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v16;
}

- (void)hideDataclass:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(NSSet *)v7->_enabledDataclasses containsObject:location[0]])
  {
    id v5 = (id)[(NSSet *)v7->_enabledDataclasses mutableCopy];
    [v5 removeObject:location[0]];
    uint64_t v3 = [v5 copy];
    enabledDataclasses = v7->_enabledDataclasses;
    v7->_enabledDataclasses = (NSSet *)v3;

    [(ACUIAccountSummaryCell *)v7 setNeedsLayout];
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  v95 = self;
  SEL v94 = a2;
  v93.receiver = self;
  v93.super_class = (Class)ACUIAccountSummaryCell;
  [(PSTableCell *)&v93 layoutSubviews];
  char v92 = ([(ACUIAccountSummaryCell *)v95 _shouldReverseLayoutDirection] ^ 1) & 1;
  if (v95->_style && v95->_style != 2)
  {
    if (v95->_style == 1)
    {
      if (v95->_desiredValue)
      {
        desiredValue = v95->_desiredValue;
        id v64 = (id)[(ACUIAccountSummaryCell *)v95 detailTextLabel];
        [v64 setText:desiredValue];
      }
      else
      {
        id v62 = [(ACAccount *)v95->_account displayUsername];
        id v61 = (id)[(ACUIAccountSummaryCell *)v95 detailTextLabel];
        [v61 setText:v62];
      }
    }
    else
    {
      id v91 = [(PSTableCell *)v95 titleLabel];
      id v90 = [(PSTableCell *)v95 valueLabel];
      char v88 = 0;
      char v86 = 0;
      BOOL v60 = 0;
      if (v90)
      {
        id v89 = (id)[v90 text];
        char v88 = 1;
        BOOL v60 = 0;
        if (v89)
        {
          id v87 = (id)[v90 text];
          char v86 = 1;
          BOOL v60 = [v87 length] != 0;
        }
      }
      if (v86) {

      }
      if (v88) {
      if (v60)
      }
      {
        id v59 = (id)[(ACUIAccountSummaryCell *)v95 contentView];
        [v59 bounds];
        uint64_t v82 = v2;
        uint64_t v83 = v3;
        double v84 = v4;
        uint64_t v85 = v5;

        [v90 sizeToFit];
        [v90 frame];
        double v79 = v6;
        unint64_t v80 = v7;
        *(void *)&long long v81 = v8;
        *((void *)&v81 + 1) = v9;
        if (v92) {
          double v58 = v84 - *(double *)&v81;
        }
        else {
          double v58 = 0.0;
        }
        double v79 = v58;
        objc_msgSend(v90, "setFrame:", __PAIR128__(v80, *(unint64_t *)&v58), v81);
        [v91 frame];
        *(void *)&long long v77 = v10;
        *((void *)&v77 + 1) = v11;
        *((void *)&v78 + 1) = v12;
        double v76 = v13;
        *(double *)&long long v78 = v84 - *(double *)&v81 - 30.0;
        if ((v92 & 1) == 0) {
          *(double *)&long long v77 = *(double *)&v77 + v76 - *(double *)&v78;
        }
        objc_msgSend(v91, "setFrame:", v77, v78);
      }
      id v75 = [(ACUIAccountSummaryCell *)v95 _dataclassesLabel];
      if (!v95->_useCustomDetailsText)
      {
        if (v92)
        {
          id v55 = (id)[(ACUIAccountSummaryCell *)v95 contentView];
          [v55 bounds];
          double v56 = v14;
          [v91 frame];
          double v74 = v56 + v15;

          id v57 = [(PSTableCell *)v95 valueLabel];
          [v57 frame];
          double v73 = v16;
        }
        else
        {
          id v51 = (id)[(ACUIAccountSummaryCell *)v95 contentView];
          [v51 bounds];
          double v50 = v17;
          id v49 = (id)[(ACUIAccountSummaryCell *)v95 contentView];
          [v49 bounds];
          double v48 = v18;
          [v91 frame];
          double v74 = v50 + v48 - UIRectGetMaxX(v19, v20, v21);

          id v54 = (id)[(ACUIAccountSummaryCell *)v95 contentView];
          [v54 bounds];
          double v53 = v22;
          id v52 = [(PSTableCell *)v95 valueLabel];
          [v52 frame];
          double v73 = v53 - UIRectGetMaxX(v23, v24, v25);
        }
        double v26 = v73;
        if (v73 > 0.0)
        {
          double v26 = v73;
          double v74 = v73;
        }
        id v46 = (id)[(ACUIAccountSummaryCell *)v95 traitCollection];
        v45 = (NSString *)(id)[v46 preferredContentSizeCategory];
        BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v45);

        if (IsAccessibilityCategory)
        {
          id v44 = (id)[(ACUIAccountSummaryCell *)v95 contentView];
          [v44 bounds];
          double v74 = v27;
        }
        v42 = [(ACAccount *)v95->_account accountType];
        id v41 = (id)[(ACAccountType *)v42 supportedDataclasses];
        BOOL v43 = [v41 count] != 0;

        if (v43)
        {
          id v39 = [(ACUIAccountSummaryCell *)v95 _enabledDataclassesTextForWidth:v74];
          -[UILabel setText:](v95->_dataclassesLabel, "setText:");
        }
        else
        {
          v40 = [(ACAccount *)v95->_account username];
          -[UILabel setText:](v95->_dataclassesLabel, "setText:");
        }
      }
      [v91 frame];
      v72.origin.double x = v28;
      v72.size.width = v29;
      v72.size.height = v30;
      [v75 sizeToFit];
      [v75 frame];
      double v70 = v31;
      double v71 = v32;
      [(ACUIAccountSummaryCell *)v95 bounds];
      v72.origin.y = CGRound((v33 - (v72.size.height + v71 + 2.0)) / 2.0);
      objc_msgSend(v91, "setFrame:", v72.origin.x, v72.origin.y, v72.size.width, v72.size.height);
      char v68 = 0;
      char v66 = 0;
      if (v92)
      {
        double x = v72.origin.x;
      }
      else
      {
        id v69 = (id)[v75 superview];
        char v68 = 1;
        [v69 bounds];
        double v37 = v34 - v70;
        id v67 = (id)[(ACUIAccountSummaryCell *)v95 contentView];
        char v66 = 1;
        [v67 bounds];
        double MaxX = CGRectGetMaxX(v96);
        double x = v37 - (MaxX - CGRectGetMaxX(v72));
      }
      if (v66) {

      }
      if (v68) {
      objc_msgSend(v75, "setFrame:", x, v72.origin.y + v72.size.height + 2.0, v70, v71, &v75);
      }
      objc_storeStrong(location, 0);
      objc_storeStrong(&v90, 0);
      objc_storeStrong(&v91, 0);
    }
  }
  else
  {
    id v65 = (id)[(ACUIAccountSummaryCell *)v95 detailTextLabel];
    [v65 setText:0];
  }
}

- (id)_dataclassesLabel
{
  if (!self->_dataclassesLabel)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v3 = (UILabel *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    dataclassesLabel = self->_dataclassesLabel;
    self->_dataclassesLabel = v3;

    id v8 = (id)[MEMORY[0x1E4F428B8] secondaryLabelColor];
    -[UILabel setTextColor:](self->_dataclassesLabel, "setTextColor:");

    [(UILabel *)self->_dataclassesLabel setBackgroundColor:0];
    [(UILabel *)self->_dataclassesLabel setOpaque:0];
    [(ACUIAccountSummaryCell *)self addSubview:self->_dataclassesLabel];
  }
  id v7 = [(ACUIAccountSummaryCell *)self _font];
  -[UILabel setFont:](self->_dataclassesLabel, "setFont:");

  uint64_t v5 = self->_dataclassesLabel;
  return v5;
}

- (id)_enabledDataclassesTextForWidth:(double)a3
{
  v143[1] = *MEMORY[0x1E4F143B8];
  v128 = self;
  SEL v127 = a2;
  double v126 = a3;
  id v125 = 0;
  if (![(NSSet *)self->_enabledDataclasses count])
  {
    id v101 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v3 = (id)[v101 localizedStringForKey:@"INACTIVE" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v4 = v125;
    id v125 = v3;

LABEL_73:
    double v25 = NSString;
    id v27 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v26 = (id)[v27 localizedStringForKey:@"COMBINED_STRING" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v129 = (id)[v25 stringWithFormat:v125];

    int v117 = 1;
    goto LABEL_74;
  }
  id v124 = (id)[MEMORY[0x1E4F1CA48] array];
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17B38]])
  {
    id v100 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17B38] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v124, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17AD8]])
  {
    id v99 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17AD8] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v124, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17A90]])
  {
    id v98 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17A90] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v124, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17A80]])
  {
    id v97 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17A80] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v124, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17A70]])
  {
    id v96 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17A70] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v124, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17B08]])
  {
    id v95 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17B08] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v124, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17AE8]])
  {
    id v94 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17AE8] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v124, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17B00]])
  {
    id v93 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17B00] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v124, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17AF8]])
  {
    id location = (id)[MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.news"];
    id v91 = (id)[location appState];
    char v121 = 0;
    BOOL v92 = 0;
    if (([v91 isRestricted] & 1) == 0)
    {
      id v122 = (id)[location appState];
      char v121 = 1;
      BOOL v92 = ([v122 isInstalled] & 1) == 1;
    }
    if (v121) {

    }
    if (v92)
    {
      id v90 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17AF8] withSuffix:@"LABEL" forAccount:v128->_account];
      objc_msgSend(v124, "addObject:");
    }
    objc_storeStrong(&location, 0);
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17AB8]])
  {
    uint64_t v131 = 0;
    id v87 = (id)[MEMORY[0x1E4F42948] currentDevice];
    uint64_t v88 = [v87 userInterfaceIdiom];

    uint64_t v131 = v88;
    BOOL v89 = 1;
    if (v88 != 1) {
      BOOL v89 = v131 == 5;
    }
    if (!v89)
    {
      id v85 = v124;
      id v86 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17AB8] withSuffix:@"LABEL" forAccount:v128->_account];
      objc_msgSend(v85, "addObject:");
    }
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17AE0]]
    || [(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17B18]])
  {
    id v83 = v124;
    id v84 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17AE0] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v83, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17B20]])
  {
    uint64_t v130 = 0;
    id v80 = (id)[MEMORY[0x1E4F42948] currentDevice];
    uint64_t v81 = [v80 userInterfaceIdiom];

    uint64_t v130 = v81;
    BOOL v82 = 1;
    if (v81 != 1) {
      BOOL v82 = v130 == 5;
    }
    if (!v82)
    {
      id v78 = v124;
      id v79 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17B20] withSuffix:@"LABEL" forAccount:v128->_account];
      objc_msgSend(v78, "addObject:");
    }
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17A98]]
    && [(NSSet *)v128->_supportedDataclasses count] == 1)
  {
    id v76 = v124;
    id v77 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17A98] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v76, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17AB0]])
  {
    id v74 = v124;
    id v75 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17AB0] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v74, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17A68]])
  {
    id v72 = v124;
    id v73 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17A68] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v72, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17AF0]])
  {
    id v70 = v124;
    id v71 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17AF0] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v70, "addObject:");
  }
  if ([(NSSet *)v128->_enabledDataclasses containsObject:*MEMORY[0x1E4F17B30]])
  {
    id v68 = v124;
    id v69 = +[ACUILocalization localizedStringForDataclass:*MEMORY[0x1E4F17B30] withSuffix:@"LABEL" forAccount:v128->_account];
    objc_msgSend(v68, "addObject:");
  }
  if ([v124 count])
  {
    id v64 = v124;
    id v66 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v65 = (id)[v66 localizedStringForKey:@"MIDDLE_SEPARATOR" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v7 = (id)objc_msgSend(v64, "componentsJoinedByString:");
    id v8 = v125;
    id v125 = v7;
  }
  else
  {
    id v67 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = (id)[v67 localizedStringForKey:@"INACTIVE" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v6 = v125;
    id v125 = v5;
  }
  double v119 = 0.0;
  uint64_t v120 = 0;
  id v61 = v125;
  uint64_t v142 = *MEMORY[0x1E4F42508];
  id v63 = [(ACUIAccountSummaryCell *)v128 _font];
  v143[0] = v63;
  id v62 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v143 forKeys:&v142 count:1];
  objc_msgSend(v61, "sizeWithAttributes:");
  double v119 = v9;
  uint64_t v120 = v10;

  double v118 = v119;
  if (v119 >= v126)
  {
    double v115 = 0.0;
    uint64_t v116 = 0;
    id v60 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v59 = (id)[v60 localizedStringForKey:@"MIDDLE_SEPARATOR" value:&stru_1F39EF5C0 table:@"Localizable"];
    uint64_t v140 = *MEMORY[0x1E4F42508];
    id v58 = [(ACUIAccountSummaryCell *)v128 _font];
    id v141 = v58;
    id v57 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
    objc_msgSend(v59, "sizeWithAttributes:");
    double v115 = v11;
    uint64_t v116 = v12;

    double v114 = v115;
    double v113 = 0.0;
    v111 = 0;
    id v110 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v124, "count"));
    for (unint64_t i = 0; i < [v124 count]; ++i)
    {
      double v108 = 0.0;
      uint64_t v109 = 0;
      id v55 = (id)[v124 objectAtIndexedSubscript:i];
      uint64_t v138 = *MEMORY[0x1E4F42508];
      id v54 = [(ACUIAccountSummaryCell *)v128 _font];
      id v139 = v54;
      id v53 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
      objc_msgSend(v55, "sizeWithAttributes:");
      double v108 = v13;
      uint64_t v109 = v14;

      double v107 = v108;
      id v56 = (id)[NSNumber numberWithDouble:v108];
      objc_msgSend(v110, "addObject:");

      if (i) {
        double v107 = v107 + v114;
      }
      if (v113 + v107 >= v126) {
        break;
      }
      double v113 = v113 + v107;
      ++v111;
    }
    if ((unint64_t)v111 < [v124 count])
    {
      id v44 = [(ACUIAccountSummaryCell *)v128 _numberFormatter];
      id v43 = (id)[MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
      objc_msgSend(v44, "setLocale:");

      id v45 = [(ACUIAccountSummaryCell *)v128 _numberFormatter];
      objc_msgSend(v45, "setNumberStyle:");

      id v47 = [(ACUIAccountSummaryCell *)v128 _numberFormatter];
      id v46 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v124, "count") - (void)v111);
      id v106 = (id)objc_msgSend(v47, "stringFromNumber:");

      double v48 = NSString;
      id v50 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v49 = (id)[v50 localizedStringForKey:@"AND_N_MORE" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v105 = (id)[v48 stringWithFormat:v106];

      double v103 = 0.0;
      uint64_t v104 = 0;
      uint64_t v136 = *MEMORY[0x1E4F42508];
      id v52 = [(ACUIAccountSummaryCell *)v128 _font];
      id v137 = v52;
      id v51 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
      objc_msgSend(v105, "sizeWithAttributes:");
      double v103 = v15;
      uint64_t v104 = v16;

      while (1)
      {
        BOOL v42 = 0;
        if (v113 + v103 > v126) {
          BOOL v42 = v111 != 0;
        }
        if (!v42) {
          break;
        }
        --v111;
        id v41 = (id)[v110 objectAtIndex:v113 + v103];
        [v41 floatValue];
        double v113 = v113 - v17;
      }
      objc_storeStrong(&v105, 0);
      objc_storeStrong(&v106, 0);
    }
    uint64_t v133 = 0;
    v132 = v111;
    uint64_t v134 = 0;
    v135 = v111;
    v102[1] = 0;
    v102[2] = v111;
    id v39 = (id)objc_msgSend(v124, "subarrayWithRange:", 0, v111);
    id v38 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v37 = (id)[v38 localizedStringForKey:@"MIDDLE_SEPARATOR" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v18 = (id)objc_msgSend(v39, "componentsJoinedByString:");
    id v19 = v125;
    id v125 = v18;

    unint64_t v40 = (unint64_t)v111;
    if (v40 < [v124 count])
    {
      id v29 = [(ACUIAccountSummaryCell *)v128 _numberFormatter];
      id v28 = (id)[MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
      objc_msgSend(v29, "setLocale:");

      id v30 = [(ACUIAccountSummaryCell *)v128 _numberFormatter];
      [v30 setNumberStyle:1];

      id v33 = [(ACUIAccountSummaryCell *)v128 _numberFormatter];
      double v31 = NSNumber;
      uint64_t v20 = [v124 count];
      id v32 = (id)[v31 numberWithUnsignedInteger:v20 - (void)v111];
      v102[0] = (id)objc_msgSend(v33, "stringFromNumber:");

      id v34 = v125;
      id v36 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v35 = (id)[v36 localizedStringForKey:@"AND_N_MORE" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v21 = (id)[v34 stringByAppendingFormat:v102[0]];
      id v22 = v125;
      id v125 = v21;

      objc_storeStrong(v102, 0);
    }
    objc_storeStrong(&v110, 0);
    int v117 = 0;
  }
  else
  {
    id v129 = v125;
    int v117 = 1;
  }
  objc_storeStrong(&v124, 0);
  if (!v117) {
    goto LABEL_73;
  }
LABEL_74:
  objc_storeStrong(&v125, 0);
  double v23 = v129;
  return v23;
}

- (id)_font
{
  id v4 = (id)[MEMORY[0x1E4F42B58] subtitleCellConfiguration];
  id v3 = (id)[v4 secondaryTextProperties];
  id v5 = (id)[v3 font];

  return v5;
}

- (id)_numberFormatter
{
  if (!__ACUINumberFormatter)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v3 = (void *)__ACUINumberFormatter;
    __ACUINumberFormatter = (uint64_t)v2;
  }
  id v4 = (void *)__ACUINumberFormatter;
  return v4;
}

- (void).cxx_destruct
{
}

@end