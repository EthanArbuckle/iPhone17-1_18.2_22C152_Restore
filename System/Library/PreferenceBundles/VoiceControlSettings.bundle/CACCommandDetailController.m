@interface CACCommandDetailController
- (CACSpokenCommandItem)commandItem;
- (id)_attributedStringDescriptionForCommandIdentifier:(id)a3 textViewWidth:(double)a4;
- (id)_commandConfirmationRequired:(id)a3;
- (id)_commandEnabled:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_setCommandConfirmationRequired:(id)a3 specifier:(id)a4;
- (void)_setCommandEnabled:(id)a3 specifier:(id)a4;
- (void)setCommandItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation CACCommandDetailController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v6];
    v7 = settingsLocString(@"COMMAND_ENABLED", @"CommandAndControlSettings");
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"_setCommandEnabled:specifier:" get:"_commandEnabled:" detail:0 cell:6 edit:0];

    [v5 addObject:v8];
    v9 = settingsLocString(@"COMMAND_CONFIRMATION_REQUIRED", @"CommandAndControlSettings");
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"_setCommandConfirmationRequired:specifier:" get:"_commandConfirmationRequired:" detail:0 cell:6 edit:0];

    [v5 addObject:v10];
    v11 = +[PSSpecifier groupSpecifierWithName:0];
    [v5 addObject:v11];
    v12 = +[PSSpecifier preferenceSpecifierNamed:&stru_4EAE0 target:0 set:0 get:0 detail:0 cell:4 edit:0];
    CFStringRef v16 = @"CACSpecifierIsAlternateKey";
    v17 = &off_4FC58;
    v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v12 setProperties:v13];

    [v5 addObject:v12];
    v14 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CACCommandDetailController;
  [(CACCommandDetailController *)&v6 viewDidLoad];
  uint64_t v3 = [(CACCommandDetailController *)self specifier];
  v4 = [v3 propertyForKey:@"CACCommandItem"];
  commandItem = self->_commandItem;
  self->_commandItem = v4;

  [(CACCommandDetailController *)self reloadSpecifiers];
}

- (void)_setCommandEnabled:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  objc_super v6 = [(CACCommandDetailController *)self commandItem];
  [v6 setIsEnabled:v5];

  id v7 = [(CACCommandDetailController *)self commandItem];
  [v7 saveToPreferences];
}

- (id)_commandEnabled:(id)a3
{
  uint64_t v3 = [(CACCommandDetailController *)self commandItem];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isEnabled]);

  return v4;
}

- (void)_setCommandConfirmationRequired:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  objc_super v6 = [(CACCommandDetailController *)self commandItem];
  [v6 setIsConfirmationRequired:v5];

  id v7 = [(CACCommandDetailController *)self commandItem];
  [v7 saveToPreferences];
}

- (id)_commandConfirmationRequired:(id)a3
{
  uint64_t v3 = [(CACCommandDetailController *)self commandItem];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isConfirmationRequired]);

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CACCommandDetailController;
  id v7 = a4;
  v8 = [(CACCommandDetailController *)&v20 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = -[CACCommandDetailController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7, v20.receiver, v20.super_class);

  v10 = [v9 properties];
  v11 = [v10 valueForKey:@"CACSpecifierIsAlternateKey"];
  unsigned int v12 = [v11 BOOLValue];

  if (v12)
  {
    v13 = +[UIColor clearColor];
    [v8 setBackgroundColor:v13];

    objc_msgSend(v8, "setSeparatorInset:", 0.0, -10000.0, 0.0, 10000.0);
    v14 = [v8 textLabel];
    [v14 setNumberOfLines:0];
    v15 = [(CACCommandDetailController *)self commandItem];
    CFStringRef v16 = [v15 identifier];
    [v6 frame];
    v18 = [(CACCommandDetailController *)self _attributedStringDescriptionForCommandIdentifier:v16 textViewWidth:v17 + -5.0];
    [v14 setAttributedText:v18];
  }

  return v8;
}

- (id)_attributedStringDescriptionForCommandIdentifier:(id)a3 textViewWidth:(double)a4
{
  v104[0] = kSRCSCommandDescriptionsSectionTitleValue;
  id v86 = a3;
  v88 = +[UIFontMetrics defaultMetrics];
  v84 = +[UIFont _opticalBoldSystemFontOfSize:16.0];
  v82 = [v88 scaledFontForFont:v84];
  v105[0] = v82;
  v104[1] = kSRCSCommandDescriptionsSectionSubTitleValue;
  v81 = +[UIFontMetrics defaultMetrics];
  v79 = +[UIFont _opticalBoldSystemFontOfSize:16.0];
  v78 = [v81 scaledFontForFont:v79];
  v105[1] = v78;
  v104[2] = kSRCSCommandDescriptionsSectionDescValue;
  v76 = +[UIFontMetrics defaultMetrics];
  v74 = +[UIFont systemFontOfSize:16.0];
  v72 = [v76 scaledFontForFont:v74];
  v105[2] = v72;
  v104[3] = kSRCSCommandDescriptionsSectionDescBoldValue;
  id v5 = +[UIFontMetrics defaultMetrics];
  id v6 = +[UIFont _opticalBoldSystemFontOfSize:16.0];
  id v7 = [v5 scaledFontForFont:v6];
  v105[3] = v7;
  v104[4] = kSRCSCommandDescriptionsPuncCommentValue;
  v8 = +[UIFontMetrics defaultMetrics];
  v9 = +[UIFont systemFontOfSize:16.0];
  v10 = [v8 scaledFontForFont:v9];
  v105[4] = v10;
  v104[5] = kSRCSCommandDescriptionsPuncDividerValue;
  v11 = +[UIFontMetrics defaultMetrics];
  unsigned int v12 = +[UIFont systemFontOfSize:8.0];
  v13 = [v11 scaledFontForFont:v12];
  v105[5] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:6];

  v85 = +[CACPreferences sharedPreferences];
  v83 = [v85 bestLocaleIdentifier];
  v15 = +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities];
  CFStringRef v16 = [v15 commandStringsTableForLocaleIdentifier:v83];

  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_69FC;
  v90[3] = &unk_4DA28;
  id v91 = v16;
  id v92 = v14;
  id v17 = v14;
  v89 = v17;
  id v18 = v16;
  v19 = [v18 mutableAttributedStringCommandDescriptionForCommandIdentifier:v86 calculateDisplayedAttributedStringWidthBlock:v90];

  objc_super v20 = objc_msgSend(v19, "attribute:atIndex:longestEffectiveRange:inRange:", kSRCSCommandDescriptionsMaxParameterLengthPlaceholderAttributeName, 0, 0, 0, objc_msgSend(v19, "length"));
  [v20 floatValue];
  float v22 = v21;

  objc_msgSend(v19, "removeAttribute:range:", kSRCSCommandDescriptionsMaxParameterLengthPlaceholderAttributeName, 0, objc_msgSend(v19, "length"));
  v23 = objc_msgSend(v19, "attribute:atIndex:longestEffectiveRange:inRange:", kSRCSCommandDescriptionsMaxEmbeddedCommandLengthPlaceholderAttributeName, 0, 0, 0, objc_msgSend(v19, "length"));
  [v23 floatValue];
  uint64_t v25 = (uint64_t)v24;

  objc_msgSend(v19, "removeAttribute:range:", kSRCSCommandDescriptionsMaxEmbeddedCommandLengthPlaceholderAttributeName, 0, objc_msgSend(v19, "length"));
  uint64_t v26 = (uint64_t)(a4 * 0.3);
  if (a4 * 0.3 <= (double)v25) {
    uint64_t v26 = v25;
  }
  uint64_t v27 = v26 + 20;
  if ((double)v27 + 20.0 >= a4 * 0.7) {
    double v28 = a4 * 0.7;
  }
  else {
    double v28 = (double)v27 + 20.0;
  }
  uint64_t v70 = (uint64_t)v22;
  v29 = [v18 mutableAttributedStringByReplacingPlaceholderAttribute:kSRCSCommandDescriptionsFontPlaceholderAttributeName withAttributeName:NSFontAttributeName inAttributedString:v19 withValueTable:v17];

  v102[0] = kSRCSCommandDescriptionsSectionTitleValue;
  v30 = +[UIColor labelColor];
  v103[0] = v30;
  v102[1] = kSRCSCommandDescriptionsSectionSubTitleValue;
  v31 = +[UIColor secondaryLabelColor];
  v103[1] = v31;
  v102[2] = kSRCSCommandDescriptionsSectionDescValue;
  v32 = +[UIColor labelColor];
  v103[2] = v32;
  v102[3] = kSRCSCommandDescriptionsPuncCommentValue;
  v33 = +[UIColor secondaryLabelColor];
  v103[3] = v33;
  v102[4] = kSRCSCommandDescriptionsPuncDividerValue;
  v34 = +[UIColor separatorColor];
  v103[4] = v34;
  v35 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:5];

  v36 = [v18 mutableAttributedStringByReplacingPlaceholderAttribute:kSRCSCommandDescriptionsColorPlaceholderAttributeName withAttributeName:NSForegroundColorAttributeName inAttributedString:v29 withValueTable:v35];

  v37 = [v18 mutableAttributedStringByReplacingPlaceholderAttribute:kSRCSCommandDescriptionsStrikethroughColorPlaceholderAttributeName withAttributeName:NSStrikethroughColorAttributeName inAttributedString:v36 withValueTable:v35];

  v100[0] = kSRCSCommandDescriptionsSectionDescValue;
  v100[1] = kSRCSCommandDescriptionsPuncDividerValue;
  v101[0] = &off_4FC58;
  v101[1] = &off_4FC58;
  v80 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:2];
  v77 = [v18 mutableAttributedStringByReplacingPlaceholderAttribute:kSRCSCommandDescriptionsStrikethroughStylePlaceholderAttributeName withAttributeName:NSStrikethroughStyleAttributeName inAttributedString:v37 withValueTable:v80];

  v38 = [v89 objectForKey:kSRCSCommandDescriptionsSectionDescValue];
  [v38 pointSize];
  double v40 = v39;

  v41 = +[NSParagraphStyle defaultParagraphStyle];
  id v87 = [v41 mutableCopy];

  [v87 setParagraphSpacing:v40 * 0.5];
  [v87 setParagraphSpacingBefore:v40 * 0.75];
  v42 = +[NSParagraphStyle defaultParagraphStyle];
  id v75 = [v42 mutableCopy];

  [v75 setParagraphSpacing:v40 * 0.5];
  v43 = +[NSParagraphStyle defaultParagraphStyle];
  id v44 = [v43 mutableCopy];

  v73 = v44;
  [v44 setFirstLineHeadIndent:20.0];
  [v44 setHeadIndent:32.0];
  [v44 setParagraphSpacing:v40 * 0.3];
  double v45 = (double)v70 + 20.0 + 10.0;
  v46 = +[NSParagraphStyle defaultParagraphStyle];
  id v47 = [v46 mutableCopy];

  [v47 setFirstLineHeadIndent:20.0];
  id v48 = [objc_alloc((Class)NSTextTab) initWithTextAlignment:0 location:&__NSDictionary0__struct options:v45];
  id v99 = v48;
  v49 = +[NSArray arrayWithObjects:&v99 count:1];
  [v47 setTabStops:v49];

  [v47 setHeadIndent:v45];
  v50 = v47;
  [v47 setParagraphSpacing:v40 * 0.3];
  v51 = +[NSParagraphStyle defaultParagraphStyle];
  id v52 = [v51 mutableCopy];

  v71 = v52;
  [v52 setFirstLineHeadIndent:20.0];
  id v53 = [objc_alloc((Class)NSTextTab) initWithTextAlignment:0 location:&__NSDictionary0__struct options:v28];
  id v98 = v53;
  v54 = +[NSArray arrayWithObjects:&v98 count:1];
  [v52 setTabStops:v54];

  [v52 setHeadIndent:v28];
  [v52 setParagraphSpacing:v40 * 0.1];
  v55 = +[NSParagraphStyle defaultParagraphStyle];
  id v56 = [v55 mutableCopy];

  [v56 setFirstLineHeadIndent:20.0];
  id v57 = [objc_alloc((Class)NSTextTab) initWithTextAlignment:0 location:&__NSDictionary0__struct options:v28];
  id v97 = v57;
  v58 = +[NSArray arrayWithObjects:&v97 count:1];
  [v56 setTabStops:v58];

  [v56 setHeadIndent:v28];
  [v56 setParagraphSpacing:v40 * 0.25];
  [v56 setParagraphSpacingBefore:v40 * 0.1];
  v59 = +[NSParagraphStyle defaultParagraphStyle];
  id v60 = [v59 mutableCopy];

  [v60 setFirstLineHeadIndent:20.0];
  id v61 = [objc_alloc((Class)NSTextTab) initWithTextAlignment:0 location:&__NSDictionary0__struct options:v28];
  id v96 = v61;
  v62 = +[NSArray arrayWithObjects:&v96 count:1];
  [v60 setTabStops:v62];

  v63 = +[NSParagraphStyle defaultParagraphStyle];
  id v64 = [v63 mutableCopy];

  [v64 setFirstLineHeadIndent:15.0];
  id v65 = [objc_alloc((Class)NSTextTab) initWithTextAlignment:2 location:&__NSDictionary0__struct options:a4 + -20.0];
  id v95 = v65;
  v66 = +[NSArray arrayWithObjects:&v95 count:1];
  [v64 setTabStops:v66];

  [v64 setAlignment:1];
  v93[0] = kSRCSCommandDescriptionsSectionTitleValue;
  v93[1] = kSRCSCommandDescriptionsSectionSubTitleValue;
  v94[0] = v87;
  v94[1] = v56;
  v93[2] = kSRCSCommandDescriptionsSectionDescValue;
  v93[3] = kSRCSCommandDescriptionsPuncDividerValue;
  v94[2] = v75;
  v94[3] = v64;
  v93[4] = kSRCSCommandDescriptionsVariantValue;
  v93[5] = kSRCSCommandDescriptionsParameterValue;
  v94[4] = v73;
  v94[5] = v50;
  v93[6] = kSRCSCommandDescriptionsItemValue;
  v93[7] = kSRCSCommandDescriptionsHeaderValue;
  v94[6] = v71;
  v94[7] = v60;
  v67 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:8];
  id v69 = [v18 mutableAttributedStringByReplacingPlaceholderAttribute:kSRCSCommandDescriptionsParagraphPlaceholderAttributeName withAttributeName:NSParagraphStyleAttributeName inAttributedString:v77 withValueTable:v67];

  return v69;
}

- (CACSpokenCommandItem)commandItem
{
  return self->_commandItem;
}

- (void)setCommandItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end