@interface EventKitTCCFullAccessNotificationUIExtensionViewController
- (EventKitTCCUIFactory)tccUIFactory;
- (UILabel)descriptionLabel;
- (UILabel)eventCountLabel;
- (UIView)calendarView;
- (void)setCalendarView:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setEventCountLabel:(id)a3;
- (void)setTccUIFactory:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation EventKitTCCFullAccessNotificationUIExtensionViewController

- (void)viewDidLoad
{
  v93.receiver = self;
  v93.super_class = (Class)EventKitTCCFullAccessNotificationUIExtensionViewController;
  [(EventKitTCCFullAccessNotificationUIExtensionViewController *)&v93 viewDidLoad];
  v3 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self extensionContext];
  v4 = [v3 inputItems];
  v5 = [v4 firstObject];

  v91 = v5;
  v6 = [v5 userInfo];
  v7 = [v6 valueForKey:kTCCNotificationExtensionClientDataKey];

  v90 = v7;
  v89 = [v7 valueForKey:kEventKitTCCUIFullAccessNotificationClientBundleIDKey];
  id v8 = [objc_alloc((Class)EventKitTCCUIFactory) initWithBundleIdentifier:v89];
  [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self setTccUIFactory:v8];

  -[EventKitTCCFullAccessNotificationUIExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, 800.0);
  id v9 = objc_alloc_init((Class)UILabel);
  p_descriptionLabel = &self->_descriptionLabel;
  objc_storeStrong((id *)&self->_descriptionLabel, v9);
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setNumberOfLines:0];
  v87 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:0];
  v10 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", 0.0);
  [v9 setFont:v10];

  [v9 setTextAlignment:1];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"Calendar events may include additional data, such as locations, email addresses, or notes.", &stru_100004150, 0 value table];
  [v9 setText:v12];

  [v9 setLineBreakStrategy:1];
  v13 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
  v88 = v9;
  [v13 addSubview:v9];

  id v14 = [(EventKitTCCUIFactory *)self->_tccUIFactory countEventsInTheNextYear];
  v15 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self tccUIFactory];
  v92 = [v15 previewViewController];

  if ((int)v14 >= 1 && v92)
  {
    v16 = (UILabel *)objc_alloc_init((Class)UILabel);
    eventCountLabel = self->_eventCountLabel;
    self->_eventCountLabel = v16;
    v18 = v16;

    [(UILabel *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v18 setNumberOfLines:0];
    v19 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:0];
    UIFontDescriptorAttributeName v98 = UIFontDescriptorTraitsAttribute;
    UIFontDescriptorTraitKey v96 = UIFontWeightTrait;
    v20 = +[NSNumber numberWithDouble:UIFontWeightSemibold];
    v97 = v20;
    v21 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
    v99 = v21;
    v22 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    uint64_t v77 = [v19 fontDescriptorByAddingAttributes:v22];

    v23 = +[UIFont fontWithDescriptor:v77 size:0.0];
    [(UILabel *)v18 setFont:v23];

    v76 = v18;
    [(UILabel *)v18 setTextAlignment:1];
    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"x_events" value:&stru_100004150 table:0];
    v26 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v14);
    [(UILabel *)v18 setText:v26];

    [(UILabel *)v18 setLineBreakStrategy:1];
    v27 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    [v27 addSubview:v18];

    [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self addChildViewController:v92];
    v28 = [v92 view];
    calendarView = self->_calendarView;
    self->_calendarView = v28;

    v30 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    [v30 addSubview:self->_calendarView];

    [v92 didMoveToParentViewController:self];
    [(UIView *)self->_calendarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_calendarView setClipsToBounds:0];
    v73 = [(UIView *)self->_calendarView topAnchor];
    v72 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    uint64_t v74 = [v72 topAnchor];
    uint64_t v75 = [v73 constraintEqualToAnchor:v74];
    v95[0] = v75;
    v31 = [(UIView *)self->_calendarView leadingAnchor];
    v84 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    [v84 leadingAnchor];
    v83 = v85 = v31;
    v82 = objc_msgSend(v31, "constraintEqualToAnchor:");
    v95[1] = v82;
    v32 = [(UIView *)self->_calendarView trailingAnchor];
    v70 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    v80 = [v70 trailingAnchor];
    v81 = v32;
    uint64_t v68 = objc_msgSend(v32, "constraintEqualToAnchor:");
    v95[2] = v68;
    v63 = [(UIView *)self->_calendarView bottomAnchor];
    v79 = [(UILabel *)self->_eventCountLabel topAnchor];
    v78 = objc_msgSend(v63, "constraintEqualToAnchor:constant:", -16.0);
    v95[3] = v78;
    v59 = [(UILabel *)self->_eventCountLabel bottomAnchor];
    v71 = [(UILabel *)*p_descriptionLabel topAnchor];
    v69 = [v59 constraintEqualToAnchor:v71 constant:-4.0];
    v95[4] = v69;
    v66 = [(UILabel *)self->_eventCountLabel leadingAnchor];
    v67 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    v65 = [v67 leadingAnchor];
    v64 = [v66 constraintEqualToAnchor:v65 constant:16.0];
    v95[5] = v64;
    v61 = [(UILabel *)self->_eventCountLabel trailingAnchor];
    v62 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    v60 = [v62 trailingAnchor];
    v58 = [v61 constraintEqualToAnchor:v60 constant:-16.0];
    v95[6] = v58;
    v56 = [(UILabel *)*p_descriptionLabel bottomAnchor];
    v57 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    v55 = [v57 bottomAnchor];
    v33 = [v56 constraintEqualToAnchor:v55 constant:-12.0];
    v95[7] = v33;
    v34 = [(UILabel *)*p_descriptionLabel leadingAnchor];
    v35 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    v36 = [v35 leadingAnchor];
    v37 = [v34 constraintEqualToAnchor:v36 constant:16.0];
    v95[8] = v37;
    v38 = [(UILabel *)*p_descriptionLabel trailingAnchor];
    v39 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    v40 = [v39 trailingAnchor];
    v41 = [v38 constraintEqualToAnchor:v40 constant:-16.0];
    v95[9] = v41;
    v42 = +[NSArray arrayWithObjects:v95 count:10];
    +[NSLayoutConstraint activateConstraints:v42];

    v43 = v72;
    v44 = v59;

    v45 = v73;
    v46 = v63;

    v47 = (void *)v74;
    v48 = (void *)v68;

    v49 = v70;
    v50 = (void *)v77;

    v51 = (void *)v75;
  }
  else
  {
    v50 = [(UILabel *)*p_descriptionLabel topAnchor];
    v45 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    v43 = [v45 topAnchor];
    v47 = [v50 constraintEqualToAnchor:v43];
    v94[0] = v47;
    v51 = [(UILabel *)*p_descriptionLabel bottomAnchor];
    v85 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    v84 = [v85 bottomAnchor];
    v83 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", -12.0);
    v94[1] = v83;
    uint64_t v52 = [(UILabel *)*p_descriptionLabel leadingAnchor];
    v81 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    uint64_t v53 = [v81 leadingAnchor];
    v82 = (void *)v52;
    v54 = (void *)v52;
    v49 = (void *)v53;
    v80 = [v54 constraintEqualToAnchor:v53 constant:16.0];
    v94[2] = v80;
    v48 = [(UILabel *)*p_descriptionLabel trailingAnchor];
    v46 = [(EventKitTCCFullAccessNotificationUIExtensionViewController *)self view];
    v79 = [v46 trailingAnchor];
    v78 = objc_msgSend(v48, "constraintEqualToAnchor:constant:", -16.0);
    v94[3] = v78;
    v44 = +[NSArray arrayWithObjects:v94 count:4];
    +[NSLayoutConstraint activateConstraints:v44];
  }
}

- (void)viewDidLayoutSubviews
{
  [(UILabel *)self->_descriptionLabel intrinsicContentSize];
  double v4 = v3 + 12.0;
  eventCountLabel = self->_eventCountLabel;
  if (eventCountLabel && self->_calendarView)
  {
    [(UILabel *)eventCountLabel intrinsicContentSize];
    double v7 = v6;
    [(UIView *)self->_calendarView intrinsicContentSize];
    double v4 = v4 + v7 + v8 + 20.0;
  }

  -[EventKitTCCFullAccessNotificationUIExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v4);
}

- (UIView)calendarView
{
  return self->_calendarView;
}

- (void)setCalendarView:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UILabel)eventCountLabel
{
  return self->_eventCountLabel;
}

- (void)setEventCountLabel:(id)a3
{
}

- (EventKitTCCUIFactory)tccUIFactory
{
  return self->_tccUIFactory;
}

- (void)setTccUIFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccUIFactory, 0);
  objc_storeStrong((id *)&self->_eventCountLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_storeStrong((id *)&self->_calendarView, 0);
}

@end