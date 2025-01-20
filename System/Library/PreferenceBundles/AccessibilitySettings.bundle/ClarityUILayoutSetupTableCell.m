@interface ClarityUILayoutSetupTableCell
+ (id)_visualPickerSpecifierWithLeadingButton:(id)a3 trailingButton:(id)a4 preferenceKey:(id)a5;
+ (id)visualLayoutPickerSpecifier;
- (ClarityUILayoutSetupTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)buttonTapped:(id)a3;
@end

@implementation ClarityUILayoutSetupTableCell

+ (id)visualLayoutPickerSpecifier
{
  v2 = [ClarityUILayoutSetupVisualPickerButtonConfiguration alloc];
  v3 = settingsLocString(@"LIST_LAYOUT_STACK", @"ClarityUISettings");
  v4 = [(ClarityUILayoutSetupVisualPickerButtonConfiguration *)v2 initWithTitle:v3 preferenceValue:CLFListLayoutStack];

  v5 = [ClarityUILayoutSetupVisualPickerButtonConfiguration alloc];
  v6 = settingsLocString(@"LIST_LAYOUT_GRID", @"ClarityUISettings");
  v7 = [(ClarityUILayoutSetupVisualPickerButtonConfiguration *)v5 initWithTitle:v6 preferenceValue:CLFListLayoutGrid];

  v8 = +[ClarityUILayoutSetupTableCell _visualPickerSpecifierWithLeadingButton:v4 trailingButton:v7 preferenceKey:@"ListLayout"];

  return v8;
}

+ (id)_visualPickerSpecifierWithLeadingButton:(id)a3 trailingButton:(id)a4 preferenceKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[PSSpecifier preferenceSpecifierNamed:0 target:a1 set:0 get:0 detail:a1 cell:-1 edit:0];
  v23[0] = PSCellClassKey;
  uint64_t v12 = objc_opt_class();
  v23[1] = PSKeyNameKey;
  v24[0] = v12;
  v24[1] = v8;
  v13 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v11 setProperties:v13];

  v14 = [v10 _dictionaryRepresentation];

  v15 = [v9 _dictionaryRepresentation];

  id v16 = 0;
  if (v14 && v15)
  {
    v20[1] = v15;
    CFStringRef v21 = @"ClarityUILayoutSetupVisualPickerUserInfoArray";
    v20[0] = v14;
    v17 = +[NSArray arrayWithObjects:v20 count:2];
    v22 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v11 setUserInfo:v18];

    id v16 = v11;
  }

  return v16;
}

- (ClarityUILayoutSetupTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v73.receiver = self;
  v73.super_class = (Class)ClarityUILayoutSetupTableCell;
  id v10 = [(ClarityUILayoutSetupTableCell *)&v73 initWithStyle:a3 reuseIdentifier:v8 specifier:v9];
  if (v10)
  {
    id v71 = v9;
    id v11 = [v9 userInfo];
    char v74 = 0;
    uint64_t v12 = [v11 objectForKeyedSubscript:@"ClarityUILayoutSetupVisualPickerUserInfoArray"];
    v13 = __UIAccessibilitySafeClass();

    if (v74) {
LABEL_17:
    }
      abort();
    id v72 = v8;
    if ([v13 count] == (char *)&dword_0 + 2)
    {
      id v68 = a5;
      v14 = +[NSMutableArray arrayWithCapacity:2];
      uint64_t v15 = 0;
      char v16 = 1;
      do
      {
        char v17 = v16;
        char v74 = 0;
        v18 = [v13 objectAtIndexedSubscript:v15];
        v19 = __UIAccessibilitySafeClass();

        if (v74) {
          goto LABEL_17;
        }
        char v74 = 0;
        objc_opt_class();
        v20 = [v19 objectForKeyedSubscript:@"ClarityUILayoutSetupVisualPickerButtonTitle"];
        CFStringRef v21 = __UIAccessibilityCastAsClass();

        if (v74) {
          goto LABEL_17;
        }
        char v74 = 0;
        objc_opt_class();
        v22 = [v19 objectForKeyedSubscript:@"ClarityUILayoutSetupVisualPickerButtonPreferenceValue"];
        v23 = __UIAccessibilityCastAsClass();

        if (v74) {
          goto LABEL_17;
        }
        v24 = objc_alloc_init(ClarityUILayoutSetupVisualPickerButtonConfiguration);
        [(ClarityUILayoutSetupVisualPickerButtonConfiguration *)v24 setTitle:v21];
        [(ClarityUILayoutSetupVisualPickerButtonConfiguration *)v24 setPreferenceValue:v23];
        [v14 addObject:v24];

        char v16 = 0;
        uint64_t v15 = 1;
      }
      while ((v17 & 1) != 0);
      a5 = v68;
    }
    else
    {
      v14 = 0;
    }

    if (v14)
    {
      objc_storeStrong((id *)&v10->_specifier, a5);
      v26 = [v14 objectAtIndexedSubscript:0];
      v27 = [ClarityUIIconSettingsButton alloc];
      [v26 title];
      v29 = v28 = (id *)v10;
      v69 = v26;
      v30 = [v26 preferenceValue];
      v31 = [(ClarityUIIconSettingsButton *)v27 initWithTitle:v29 preferenceValue:v30];
      id v32 = v28[15];
      v28[15] = v31;

      [v28[15] addTarget:v28 action:"buttonTapped:" forControlEvents:0x2000];
      v33 = +[CLFSettings sharedInstance];
      v67 = [v33 listLayout];

      v34 = [v26 preferenceValue];
      objc_msgSend(v28[15], "setSelected:", objc_msgSend(v67, "isEqualToString:", v34));

      v66 = [v14 objectAtIndexedSubscript:1];
      v35 = [ClarityUIIconSettingsButton alloc];
      v36 = [v66 title];
      v37 = [v66 preferenceValue];
      v38 = [(ClarityUIIconSettingsButton *)v35 initWithTitle:v36 preferenceValue:v37];
      id v39 = v28[16];
      v28[16] = v38;

      [v28[16] addTarget:v28 action:"buttonTapped:" forControlEvents:0x2000];
      objc_msgSend(v28[16], "setSelected:", objc_msgSend(v28[15], "isSelected") ^ 1);
      id v40 = objc_alloc((Class)UIStackView);
      v76[0] = v28[15];
      v76[1] = v28[16];
      v41 = +[NSArray arrayWithObjects:v76 count:2];
      v70 = v14;
      id v42 = [v40 initWithArrangedSubviews:v41];

      [v42 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v42 setDistribution:1];
      [v42 setSpacing:30.0];
      v43 = [v28 contentView];
      [v43 addSubview:v42];

      v64 = [v42 centerXAnchor];
      v65 = [v28 contentView];
      v63 = [v65 centerXAnchor];
      v62 = [v64 constraintEqualToAnchor:v63];
      v75[0] = v62;
      v61 = [v28 contentView];
      v60 = [v61 heightAnchor];
      v59 = [v42 heightAnchor];
      v58 = [v60 constraintEqualToAnchor:v59 constant:40.0];
      v75[1] = v58;
      v56 = [v42 centerYAnchor];
      v57 = [v28 contentView];
      v55 = [v57 centerYAnchor];
      v54 = [v56 constraintEqualToAnchor:v55];
      v75[2] = v54;
      v53 = [v28 contentView];
      v44 = [v53 widthAnchor];
      v45 = [v42 widthAnchor];
      v46 = [v44 constraintEqualToAnchor:v45 multiplier:1.2];
      v75[3] = v46;
      v47 = [v28 contentView];
      v48 = [v47 widthAnchor];
      v49 = [v42 widthAnchor];
      v50 = [v48 constraintGreaterThanOrEqualToAnchor:v49 constant:10.0];
      v75[4] = v50;
      v51 = +[NSArray arrayWithObjects:v75 count:5];
      +[NSLayoutConstraint activateConstraints:v51];

      id v10 = (ClarityUILayoutSetupTableCell *)v28;
      id v8 = v72;

      v25 = v28;
      v14 = v70;
    }
    else
    {
      v25 = 0;
    }
    id v9 = v71;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)buttonTapped:(id)a3
{
  v4 = (ClarityUIIconSettingsButton *)a3;
  leadingButton = v4;
  if (self->_trailingButton != v4) {
    leadingButton = self->_leadingButton;
  }
  v6 = leadingButton;
  v7 = self->_leadingButton;
  v20[0] = self->_trailingButton;
  v20[1] = v7;
  +[NSArray arrayWithObjects:v20 count:2];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "setSelected:", v6 == *(ClarityUIIconSettingsButton **)(*((void *)&v15 + 1) + 8 * (void)v12), (void)v15);
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  v13 = [(ClarityUIIconSettingsButton *)v6 preferenceValue];
  v14 = +[CLFSettings sharedInstance];
  [v14 setListLayout:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);

  objc_storeStrong((id *)&self->_leadingButton, 0);
}

@end