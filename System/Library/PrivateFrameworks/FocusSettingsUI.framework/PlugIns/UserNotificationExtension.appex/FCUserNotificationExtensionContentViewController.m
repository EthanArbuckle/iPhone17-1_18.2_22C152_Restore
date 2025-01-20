@interface FCUserNotificationExtensionContentViewController
+ (id)_deviceViewBackgroundColor;
+ (id)_elementColor;
+ (id)_footnoteColor;
+ (id)_pillView;
- (void)_setUpViews;
- (void)configureWithCompletion:(id)a3;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation FCUserNotificationExtensionContentViewController

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [(FCUserNotificationExtensionContentViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)FCUserNotificationExtensionContentViewController;
  [(FCUserNotificationExtensionContentViewController *)&v5 viewDidLoad];
  [(FCUserNotificationExtensionContentViewController *)self _setUpViews];
  -[FCUserNotificationExtensionContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, 250.0);
  id v3 = [(FCUserNotificationExtensionContentViewController *)self view];
  v4 = +[UIColor systemBackgroundColor];
  [v3 setBackgroundColor:v4];
}

- (void)_setUpViews
{
  v2 = [(FCUserNotificationExtensionContentViewController *)self view];
  id v3 = objc_alloc_init((Class)UIView);
  v4 = [(id)objc_opt_class() _deviceViewBackgroundColor];
  [v3 setBackgroundColor:v4];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 _setContinuousCornerRadius:30.0];
  objc_super v5 = [v3 layer];
  [v5 setMasksToBounds:1];

  id v6 = objc_alloc_init((Class)UIImageView);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = +[UIImage systemImageNamed:@"person.crop.circle"];
  v8 = [v7 imageWithRenderingMode:2];
  [v6 setImage:v8];

  v9 = [(id)objc_opt_class() _elementColor];
  [v6 setTintColor:v9];

  v10 = +[UIImageSymbolConfiguration configurationWithScale:1];
  v11 = +[UIImage systemImageNamed:@"moon.fill" withConfiguration:v10];
  v113 = +[NSTextAttachment textAttachmentWithImage:v11];

  id v12 = objc_alloc_init((Class)NSMutableAttributedString);
  v13 = +[NSAttributedString attributedStringWithAttachment:v113];
  [v12 appendAttributedString:v13];

  id v14 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v115 = NSKernAttributeName;
  v116 = &off_1000041F0;
  v15 = +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
  id v16 = [v14 initWithString:@"​ " attributes:v15];
  [v12 appendAttributedString:v16];

  id v17 = objc_alloc((Class)NSAttributedString);
  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"NOTIFICATIONS_ALLOWED" value:&stru_1000041A8 table:0];
  id v20 = [v17 initWithString:v19];
  v112 = v12;
  [v12 appendAttributedString:v20];

  id v21 = objc_alloc_init((Class)UILabel);
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v21 setAttributedText:v12];
  v22 = [(id)objc_opt_class() _footnoteColor];
  [v21 setTextColor:v22];

  v23 = +[UIFont systemFontOfSize:10.0];
  [v21 setFont:v23];

  [v21 setTextAlignment:1];
  [v21 setNumberOfLines:0];
  v24 = [(id)objc_opt_class() _pillView];
  v25 = [(id)objc_opt_class() _pillView];
  v26 = [(id)objc_opt_class() _pillView];
  [v3 addSubview:v6];
  [v3 addSubview:v21];
  [v3 addSubview:v24];
  [v3 addSubview:v25];
  [v3 addSubview:v26];
  [v2 addSubview:v3];
  v111 = [v3 centerXAnchor];
  v110 = [v2 centerXAnchor];
  v109 = [v111 constraintEqualToAnchor:v110];
  v114[0] = v109;
  v108 = [v3 topAnchor];
  v107 = [v2 topAnchor];
  v106 = [v108 constraintEqualToAnchor:v107 constant:20.0];
  v114[1] = v106;
  v105 = [v3 bottomAnchor];
  v104 = [v2 bottomAnchor];
  v103 = [v105 constraintEqualToAnchor:v104 constant:30.0];
  v114[2] = v103;
  v102 = [v3 widthAnchor];
  v101 = [v102 constraintLessThanOrEqualToConstant:220.0];
  v114[3] = v101;
  v100 = [v3 leadingAnchor];
  v99 = [v2 leadingAnchor];
  v98 = [v100 constraintGreaterThanOrEqualToAnchor:v99];
  v114[4] = v98;
  v97 = [v3 trailingAnchor];
  v73 = v2;
  v96 = [v2 trailingAnchor];
  v94 = [v97 constraintLessThanOrEqualToAnchor:v96];
  v114[5] = v94;
  v93 = [v6 centerXAnchor];
  v92 = [v3 centerXAnchor];
  v91 = [v93 constraintEqualToAnchor:v92];
  v114[6] = v91;
  v90 = [v6 topAnchor];
  v89 = [v3 topAnchor];
  v88 = [v90 constraintEqualToAnchor:v89 constant:16.0];
  v114[7] = v88;
  v87 = [v6 widthAnchor];
  v86 = [v87 constraintEqualToConstant:34.0];
  v114[8] = v86;
  v84 = [v6 widthAnchor];
  v95 = v6;
  v83 = [v6 heightAnchor];
  v82 = [v84 constraintEqualToAnchor:v83];
  v114[9] = v82;
  v81 = [v24 leadingAnchor];
  v80 = [v3 leadingAnchor];
  v79 = [v81 constraintEqualToAnchor:v80 constant:20.0];
  v114[10] = v79;
  v77 = [v24 topAnchor];
  v76 = [v6 bottomAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:16.0];
  v114[11] = v75;
  v74 = [v24 widthAnchor];
  v72 = [v25 widthAnchor];
  v71 = [v74 constraintEqualToAnchor:v72 constant:-20.0];
  v114[12] = v71;
  v70 = [v24 heightAnchor];
  v69 = [v70 constraintEqualToConstant:26.0];
  v114[13] = v69;
  v67 = [v25 leadingAnchor];
  v85 = v24;
  v66 = [v24 leadingAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v114[14] = v65;
  v63 = [v25 topAnchor];
  v62 = [v24 bottomAnchor];
  v61 = [v63 constraintEqualToAnchor:v62 constant:4.0];
  v114[15] = v61;
  v59 = [v25 widthAnchor];
  v27 = v26;
  v58 = [v26 widthAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:-10.0];
  v114[16] = v57;
  v78 = v25;
  v56 = [v25 heightAnchor];
  v55 = [v56 constraintEqualToConstant:26.0];
  v114[17] = v55;
  v54 = [v26 trailingAnchor];
  v53 = [v3 trailingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53 constant:-20.0];
  v114[18] = v52;
  v51 = [v26 topAnchor];
  v50 = [v25 bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:8.0];
  v114[19] = v49;
  v48 = [v26 widthAnchor];
  v47 = [v3 widthAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 multiplier:0.52];
  v114[20] = v46;
  v60 = v26;
  v45 = [v26 heightAnchor];
  v44 = [v45 constraintEqualToConstant:26.0];
  v114[21] = v44;
  v43 = [v21 centerXAnchor];
  v42 = [v3 centerXAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v114[22] = v41;
  v40 = [v21 bottomAnchor];
  v39 = [v2 bottomAnchor];
  v38 = [v40 constraintEqualToAnchor:v39 constant:-15.0];
  v114[23] = v38;
  v28 = [v21 leadingAnchor];
  v68 = v3;
  v29 = [v3 leadingAnchor];
  v30 = [v28 constraintGreaterThanOrEqualToAnchor:v29 constant:14.0];
  v114[24] = v30;
  v64 = v21;
  v31 = [v21 trailingAnchor];
  v32 = [v3 trailingAnchor];
  v33 = [v31 constraintLessThanOrEqualToAnchor:v32 constant:-14.0];
  v114[25] = v33;
  v34 = [v21 topAnchor];
  v35 = [v27 bottomAnchor];
  v36 = [v34 constraintGreaterThanOrEqualToAnchor:v35];
  v114[26] = v36;
  v37 = +[NSArray arrayWithObjects:v114 count:27];
  +[NSLayoutConstraint activateConstraints:v37];
}

+ (id)_pillView
{
  id v3 = objc_alloc_init((Class)UIView);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [a1 _elementColor];
  [v3 setBackgroundColor:v4];

  [v3 _setCornerRadius:13.0];
  return v3;
}

+ (id)_footnoteColor
{
  return +[UIColor systemIndigoColor];
}

+ (id)_elementColor
{
  return +[UIColor quaternaryLabelColor];
}

+ (id)_deviceViewBackgroundColor
{
  return +[UIColor tertiarySystemFillColor];
}

- (void)configureWithCompletion:(id)a3
{
}

@end