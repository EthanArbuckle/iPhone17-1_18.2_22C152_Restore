@interface SettingsICPLHeaderCell
- (SettingsICPLHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation SettingsICPLHeaderCell

- (SettingsICPLHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v60.receiver = self;
  v60.super_class = (Class)SettingsICPLHeaderCell;
  result = [(SettingsICPLHeaderCell *)&v60 initWithStyle:a3 reuseIdentifier:a4];
  if (result)
  {
    v59 = result;
    [(SettingsICPLHeaderCell *)result setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(SettingsICPLHeaderCell *)v59 titleLabel];
    [v5 setHidden:1];

    v6 = [(SettingsICPLHeaderCell *)v59 detailTextLabel];
    [v6 setHidden:1];

    id v7 = objc_alloc_init((Class)UIStackView);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setAxis:1];
    [v7 setAlignment:3];
    [v7 setSpacing:10.0];
    v8 = [(SettingsICPLHeaderCell *)v59 contentView];
    [v8 addSubview:v7];

    v54 = [v7 topAnchor];
    v56 = [(SettingsICPLHeaderCell *)v59 contentView];
    v52 = [v56 topAnchor];
    v51 = [v54 constraintEqualToAnchor:v52 constant:25.0];
    v61[0] = v51;
    v49 = [v7 leadingAnchor];
    v50 = [(SettingsICPLHeaderCell *)v59 contentView];
    v48 = [v50 leadingAnchor];
    v9 = [v49 constraintEqualToAnchor:v48 constant:25.0];
    v61[1] = v9;
    v58 = v7;
    v10 = [v7 trailingAnchor];
    v11 = [(SettingsICPLHeaderCell *)v59 contentView];
    v12 = [v11 trailingAnchor];
    v13 = [v10 constraintEqualToAnchor:v12 constant:-25.0];
    v61[2] = v13;
    v14 = [v7 bottomAnchor];
    v15 = [(SettingsICPLHeaderCell *)v59 contentView];
    v16 = [v15 bottomAnchor];
    v17 = [v14 constraintEqualToAnchor:v16 constant:-15.0];
    v61[3] = v17;
    v18 = +[NSArray arrayWithObjects:v61 count:4];
    +[NSLayoutConstraint activateConstraints:v18];

    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v57 = +[UIImage imageNamed:@"Photos" inBundle:v19];

    id v20 = [objc_alloc((Class)UIImageView) initWithImage:v57];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20 setContentMode:4];
    v21 = [v20 layer];
    [v21 setMasksToBounds:1];

    v22 = +[UIColor systemExtraLightGrayColor];
    id v23 = [v22 cgColor];
    v24 = [v20 layer];
    [v24 setBorderColor:v23];

    v25 = [v20 layer];
    [v25 setBorderWidth:1.0];

    v26 = [v20 layer];
    [v26 setCornerRadius:13.0];

    [v58 addArrangedSubview:v20];
    id v27 = objc_alloc_init((Class)UILabel);
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = +[NSBundle bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"SETTINGS_ICLOUDPHOTOS_HEADER_TITLE" value:&stru_29018 table:@"Photos"];
    [v27 setText:v29];

    v30 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    v31 = [v30 fontDescriptor];
    v55 = [v31 fontDescriptorWithSymbolicTraits:2];

    v32 = +[UIFont fontWithDescriptor:v55 size:0.0];
    [v27 setFont:v32];

    v33 = +[UIColor labelColor];
    [v27 setTextColor:v33];

    [v27 setTextAlignment:1];
    [v27 setNumberOfLines:0];
    [v58 addArrangedSubview:v27];
    v34 = +[NSBundle bundleForClass:objc_opt_class()];
    v53 = [v34 localizedStringForKey:@"SETTINGS_ICLOUDPHOTOS_HEADER_DESCRIPTION_LEARN_MORE" value:&stru_29018 table:@"Photos"];

    id v35 = objc_alloc((Class)NSMutableAttributedString);
    v36 = +[NSBundle bundleForClass:objc_opt_class()];
    v37 = [v36 localizedStringForKey:@"SETTINGS_ICLOUDPHOTOS_HEADER_DESCRIPTION_LEARN_MORE" value:&stru_29018 table:@"Photos"];
    id v38 = [v35 initWithString:v37];

    objc_msgSend(v38, "addAttribute:value:range:", NSLinkAttributeName, @"https://support.apple.com/HT204264", 0, objc_msgSend(v53, "length"));
    id v39 = objc_alloc((Class)NSMutableAttributedString);
    v40 = +[NSBundle bundleForClass:objc_opt_class()];
    v41 = [v40 localizedStringForKey:@"SETTINGS_ICLOUDPHOTOS_HEADER_DESCRIPTION" value:&stru_29018 table:@"Photos"];
    id v42 = [v39 initWithString:v41];

    id v43 = [objc_alloc((Class)NSMutableAttributedString) initWithString:@" "];
    [v42 appendAttributedString:v43];

    [v42 appendAttributedString:v38];
    id v44 = objc_alloc_init((Class)UITextView);
    [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v44 setAttributedText:v42];
    [v44 setSelectable:1];
    [v44 setEditable:0];
    [v44 _setInteractiveTextSelectionDisabled:1];
    [v44 setScrollEnabled:0];
    v45 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [v44 setFont:v45];

    v46 = +[UIColor labelColor];
    [v44 setTextColor:v46];

    [v44 setTextAlignment:1];
    v47 = +[UIColor clearColor];
    [v44 setBackgroundColor:v47];

    [v58 addArrangedSubview:v44];
    [v58 setCustomSpacing:v27 afterView:4.0];

    return v59;
  }
  return result;
}

@end