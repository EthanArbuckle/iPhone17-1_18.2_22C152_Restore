@interface CLCalloutOverlay
- (BOOL)showBackgroundPlatters;
- (CGRect)calloutFrame;
- (CGSize)calloutIconSize;
- (CLCalloutOverlay)initWithFrame:(CGRect)a3 title:(id)a4 subtitle:(id)a5 subtitle2:(id)a6 subtitleColor:(id)a7 subtitle2Color:(id)a8 image:(id)a9 imageSize:(CGSize)a10 titleFontSize:(double)a11 titleNumberOfLines:(unsigned int)a12 titleFontWeight:(double)a13 titleLineBreakMode:(int64_t)a14 showBackgroundPlatters:(BOOL)a15;
- (UIImageView)calloutImageView;
- (UILabel)secondSubtitleLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)backgroundPlatter1;
- (UIView)backgroundPlatter2;
- (UIView)mainPlatterView;
- (UIVisualEffectView)effectView;
- (void)layoutSubviews;
- (void)setBackgroundPlatter1:(id)a3;
- (void)setBackgroundPlatter2:(id)a3;
- (void)setCalloutIconSize:(CGSize)a3;
- (void)setCalloutImageView:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setMainPlatterView:(id)a3;
- (void)setSecondSubtitleLabel:(id)a3;
- (void)setShowBackgroundPlatters:(BOOL)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupBlurView:(id)a3;
- (void)setupCalloutIcon:(id)a3 withImage:(id)a4;
- (void)setupImageView:(id)a3 withImage:(id)a4 forImageSize:(CGSize)a5 withBorderWidth:(double)a6;
- (void)setupPillView:(id)a3;
- (void)setupPlatters;
- (void)setupTitleLabel:(id)a3 withText:(id)a4 withTextColor:(id)a5 numberOfLines:(unsigned int)a6 withLineBreakMode:(int64_t)a7 withFontWeight:(double)a8 withFontSize:(double)a9;
@end

@implementation CLCalloutOverlay

- (CLCalloutOverlay)initWithFrame:(CGRect)a3 title:(id)a4 subtitle:(id)a5 subtitle2:(id)a6 subtitleColor:(id)a7 subtitle2Color:(id)a8 image:(id)a9 imageSize:(CGSize)a10 titleFontSize:(double)a11 titleNumberOfLines:(unsigned int)a12 titleFontWeight:(double)a13 titleLineBreakMode:(int64_t)a14 showBackgroundPlatters:(BOOL)a15
{
  double height = a10.height;
  double width = a10.width;
  double v24 = a3.size.height;
  double v25 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v174 = a4;
  id v177 = a5;
  id v176 = a6;
  id v172 = a7;
  id v173 = a8;
  id v175 = a9;
  v182.receiver = self;
  v182.super_class = (Class)CLCalloutOverlay;
  v29 = [(CLCalloutOverlay *)&v182 initWithAnnotation:0 reuseIdentifier:@"CalloutOverlay"];
  v30 = v29;
  if (v29)
  {
    -[CLCalloutOverlay setFrame:](v29, "setFrame:", x, y, v25, v24);
    id v31 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(CLCalloutOverlay *)v30 setMainPlatterView:v31];

    [(CLCalloutOverlay *)v30 setShowBackgroundPlatters:a15];
    id v32 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(CLCalloutOverlay *)v30 setTitleLabel:v32];

    [(CLCalloutOverlay *)v30 setSubtitleLabel:0];
    [(CLCalloutOverlay *)v30 setSecondSubtitleLabel:0];
    v171 = +[UIColor labelColor];
    -[CLCalloutOverlay setCalloutIconSize:](v30, "setCalloutIconSize:", width, height);
    v33 = [(CLCalloutOverlay *)v30 titleLabel];
    [(CLCalloutOverlay *)v30 setupTitleLabel:v33 withText:v174 withTextColor:v171 numberOfLines:a12 withLineBreakMode:a14 withFontWeight:a13 withFontSize:a11];

    if (v177)
    {
      id v34 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [(CLCalloutOverlay *)v30 setSubtitleLabel:v34];

      v35 = [(CLCalloutOverlay *)v30 subtitleLabel];
      [(CLCalloutOverlay *)v30 setupTitleLabel:v35 withText:v177 withTextColor:v172 numberOfLines:a12 withLineBreakMode:a14 withFontWeight:a13 withFontSize:a11];

      v36 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v37 = [(CLCalloutOverlay *)v30 subtitleLabel];
      [v36 addSubview:v37];
    }
    if (v176)
    {
      id v38 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [(CLCalloutOverlay *)v30 setSecondSubtitleLabel:v38];

      v39 = [(CLCalloutOverlay *)v30 secondSubtitleLabel];
      [(CLCalloutOverlay *)v30 setupTitleLabel:v39 withText:v176 withTextColor:v173 numberOfLines:a12 withLineBreakMode:a14 withFontWeight:a13 withFontSize:a11];

      v40 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v41 = [(CLCalloutOverlay *)v30 secondSubtitleLabel];
      [v40 addSubview:v41];
    }
    v42 = [(CLCalloutOverlay *)v30 mainPlatterView];
    v43 = [(CLCalloutOverlay *)v30 titleLabel];
    [v42 addSubview:v43];

    v44 = [(CLCalloutOverlay *)v30 mainPlatterView];
    [(CLCalloutOverlay *)v30 addSubview:v44];

    id v45 = objc_alloc_init((Class)UIImageView);
    [(CLCalloutOverlay *)v30 setCalloutImageView:v45];

    v46 = [(CLCalloutOverlay *)v30 calloutImageView];
    [(CLCalloutOverlay *)v30 setupCalloutIcon:v46 withImage:v175];

    v47 = [(CLCalloutOverlay *)v30 mainPlatterView];
    v48 = [(CLCalloutOverlay *)v30 calloutImageView];
    [v47 addSubview:v48];

    v159 = [(CLCalloutOverlay *)v30 mainPlatterView];
    v180 = [v159 centerXAnchor];
    v157 = [(CLCalloutOverlay *)v30 safeAreaLayoutGuide];
    v155 = [v157 centerXAnchor];
    v153 = objc_msgSend(v180, "constraintEqualToAnchor:");
    v184[0] = v153;
    v163 = [(CLCalloutOverlay *)v30 mainPlatterView];
    v178 = [v163 centerYAnchor];
    v151 = [(CLCalloutOverlay *)v30 safeAreaLayoutGuide];
    v149 = [v151 centerYAnchor];
    v147 = objc_msgSend(v178, "constraintEqualToAnchor:");
    v184[1] = v147;
    v145 = [(CLCalloutOverlay *)v30 mainPlatterView];
    v169 = [v145 widthAnchor];
    v143 = [(CLCalloutOverlay *)v30 safeAreaLayoutGuide];
    v141 = [v143 widthAnchor];
    v117 = objc_msgSend(v169, "constraintGreaterThanOrEqualToAnchor:multiplier:", 0.4);
    v184[2] = v117;
    v139 = [(CLCalloutOverlay *)v30 mainPlatterView];
    v167 = [v139 widthAnchor];
    v137 = [(CLCalloutOverlay *)v30 safeAreaLayoutGuide];
    v135 = [v137 widthAnchor];
    v133 = objc_msgSend(v167, "constraintLessThanOrEqualToAnchor:multiplier:", 0.6);
    v184[3] = v133;
    v131 = [(CLCalloutOverlay *)v30 calloutImageView];
    v129 = [v131 widthAnchor];
    v161 = [v129 constraintEqualToConstant:width];
    v184[4] = v161;
    v127 = [(CLCalloutOverlay *)v30 calloutImageView];
    v125 = [v127 heightAnchor];
    v123 = [v125 constraintEqualToConstant:height];
    v184[5] = v123;
    v121 = [(CLCalloutOverlay *)v30 calloutImageView];
    v165 = [v121 topAnchor];
    v119 = [(CLCalloutOverlay *)v30 mainPlatterView];
    v49 = [v119 topAnchor];
    v50 = [v165 constraintEqualToAnchor:v49 constant:5.0];
    v184[6] = v50;
    v51 = [(CLCalloutOverlay *)v30 calloutImageView];
    v52 = [v51 centerXAnchor];
    v53 = [(CLCalloutOverlay *)v30 mainPlatterView];
    v54 = [v53 centerXAnchor];
    v55 = [v52 constraintEqualToAnchor:v54];
    v184[7] = v55;
    v56 = +[NSArray arrayWithObjects:v184 count:8];
    +[NSLayoutConstraint activateConstraints:v56];

    if ([(CLCalloutOverlay *)v30 showBackgroundPlatters])
    {
      v170 = +[UIBlurEffect effectWithStyle:1];
      id v181 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v170];
      id v179 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v170];
      [(CLCalloutOverlay *)v30 setupBlurView:v181];
      v57 = [v181 layer];
      LODWORD(v58) = 1.0;
      [v57 setOpacity:v58];

      [(CLCalloutOverlay *)v30 addSubview:v181];
      [(CLCalloutOverlay *)v30 setupBlurView:v179];
      v59 = [v179 layer];
      LODWORD(v60) = 1.0;
      [v59 setOpacity:v60];

      [(CLCalloutOverlay *)v30 addSubview:v179];
      id v61 = objc_alloc_init((Class)UIView);
      [(CLCalloutOverlay *)v30 setBackgroundPlatter1:v61];

      v62 = [(CLCalloutOverlay *)v30 backgroundPlatter1];
      [(CLCalloutOverlay *)v30 addSubview:v62];

      id v63 = objc_alloc_init((Class)UIView);
      [(CLCalloutOverlay *)v30 setBackgroundPlatter2:v63];

      v64 = [(CLCalloutOverlay *)v30 backgroundPlatter2];
      [(CLCalloutOverlay *)v30 addSubview:v64];

      [(CLCalloutOverlay *)v30 setupPlatters];
      v116 = [(CLCalloutOverlay *)v30 backgroundPlatter1];
      v168 = [v116 heightAnchor];
      v115 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v114 = [v115 heightAnchor];
      v113 = objc_msgSend(v168, "constraintEqualToAnchor:");
      v183[0] = v113;
      v138 = [(CLCalloutOverlay *)v30 backgroundPlatter1];
      v166 = [v138 widthAnchor];
      v112 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v111 = [v112 widthAnchor];
      v136 = objc_msgSend(v166, "constraintEqualToAnchor:multiplier:", 0.9);
      v183[1] = v136;
      v110 = [(CLCalloutOverlay *)v30 backgroundPlatter1];
      v164 = [v110 centerXAnchor];
      v109 = [(CLCalloutOverlay *)v30 safeAreaLayoutGuide];
      v108 = [v109 centerXAnchor];
      v107 = objc_msgSend(v164, "constraintEqualToAnchor:");
      v183[2] = v107;
      v134 = [(CLCalloutOverlay *)v30 backgroundPlatter1];
      v162 = [v134 topAnchor];
      v106 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v105 = [v106 topAnchor];
      v104 = objc_msgSend(v162, "constraintEqualToAnchor:constant:", 5.0);
      v183[3] = v104;
      v103 = [(CLCalloutOverlay *)v30 backgroundPlatter2];
      v160 = [v103 heightAnchor];
      v132 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v130 = [v132 heightAnchor];
      v102 = objc_msgSend(v160, "constraintEqualToAnchor:");
      v183[4] = v102;
      v101 = [(CLCalloutOverlay *)v30 backgroundPlatter2];
      v158 = [v101 widthAnchor];
      v100 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v128 = [v100 widthAnchor];
      v99 = objc_msgSend(v158, "constraintEqualToAnchor:multiplier:", 0.8);
      v183[5] = v99;
      v98 = [(CLCalloutOverlay *)v30 backgroundPlatter2];
      v156 = [v98 centerXAnchor];
      v126 = [(CLCalloutOverlay *)v30 safeAreaLayoutGuide];
      v97 = [v126 centerXAnchor];
      v96 = objc_msgSend(v156, "constraintEqualToAnchor:");
      v183[6] = v96;
      v95 = [(CLCalloutOverlay *)v30 backgroundPlatter2];
      v154 = [v95 topAnchor];
      v94 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v93 = [v94 topAnchor];
      v124 = objc_msgSend(v154, "constraintEqualToAnchor:constant:", 10.0);
      v183[7] = v124;
      v152 = [v181 heightAnchor];
      v92 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v91 = [v92 heightAnchor];
      v90 = objc_msgSend(v152, "constraintEqualToAnchor:");
      v183[8] = v90;
      v150 = [v181 widthAnchor];
      v122 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v89 = [v122 widthAnchor];
      v88 = objc_msgSend(v150, "constraintEqualToAnchor:multiplier:", 0.9);
      v183[9] = v88;
      v148 = [v181 centerXAnchor];
      v120 = [(CLCalloutOverlay *)v30 safeAreaLayoutGuide];
      v87 = [v120 centerXAnchor];
      v86 = objc_msgSend(v148, "constraintEqualToAnchor:");
      v183[10] = v86;
      v146 = [v181 topAnchor];
      v85 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v84 = [v85 topAnchor];
      v83 = objc_msgSend(v146, "constraintEqualToAnchor:constant:", 5.0);
      v183[11] = v83;
      v144 = [v179 heightAnchor];
      v82 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v81 = [v82 heightAnchor];
      v80 = objc_msgSend(v144, "constraintEqualToAnchor:");
      v183[12] = v80;
      v142 = [v179 widthAnchor];
      v79 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v118 = [v79 widthAnchor];
      v78 = objc_msgSend(v142, "constraintEqualToAnchor:multiplier:", 0.8);
      v183[13] = v78;
      v140 = [v179 centerXAnchor];
      v65 = [(CLCalloutOverlay *)v30 safeAreaLayoutGuide];
      v66 = [v65 centerXAnchor];
      v67 = [v140 constraintEqualToAnchor:v66];
      v183[14] = v67;
      v68 = [v179 topAnchor];
      v69 = [(CLCalloutOverlay *)v30 mainPlatterView];
      v70 = [v69 topAnchor];
      v71 = [v68 constraintEqualToAnchor:v70 constant:10.0];
      v183[15] = v71;
      v72 = +[NSArray arrayWithObjects:v183 count:16];
      +[NSLayoutConstraint activateConstraints:v72];

      [(CLCalloutOverlay *)v30 bringSubviewToFront:v179];
      v73 = [(CLCalloutOverlay *)v30 backgroundPlatter2];
      [(CLCalloutOverlay *)v30 bringSubviewToFront:v73];

      [(CLCalloutOverlay *)v30 bringSubviewToFront:v181];
      v74 = [(CLCalloutOverlay *)v30 backgroundPlatter1];
      [(CLCalloutOverlay *)v30 bringSubviewToFront:v74];
    }
    v75 = [(CLCalloutOverlay *)v30 mainPlatterView];
    [(CLCalloutOverlay *)v30 bringSubviewToFront:v75];

    v76 = [(CLCalloutOverlay *)v30 calloutImageView];
    [(CLCalloutOverlay *)v30 bringSubviewToFront:v76];
  }
  return v30;
}

- (void)setupPlatters
{
  id v5 = [(CLCalloutOverlay *)self mainPlatterView];
  -[CLCalloutOverlay setupPillView:](self, "setupPillView:");

  if ([(CLCalloutOverlay *)self showBackgroundPlatters])
  {
    id v6 = [(CLCalloutOverlay *)self backgroundPlatter1];
    -[CLCalloutOverlay setupPillView:](self, "setupPillView:");

    id v7 = +[UIColor colorNamed:@"UpperPlatterBackgroundColor"];
    v3 = [(CLCalloutOverlay *)self backgroundPlatter1];
    [v3 setBackgroundColor:v7];

    id v8 = [(CLCalloutOverlay *)self backgroundPlatter2];
    -[CLCalloutOverlay setupPillView:](self, "setupPillView:");

    id v9 = +[UIColor colorNamed:@"LowerPlatterBackgroundColor"];
    v4 = [(CLCalloutOverlay *)self backgroundPlatter2];
    [v4 setBackgroundColor:v9];
  }
}

- (void)setupPillView:(id)a3
{
  id v16 = a3;
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = +[UIColor colorNamed:@"PillBackgroundColor"];
  id v4 = [v3 cgColor];
  id v5 = [v16 layer];
  [v5 setBackgroundColor:v4];

  id v6 = [v3 cgColor];
  id v7 = [v16 layer];
  [v7 setBorderColor:v6];

  id v8 = [v16 layer];
  [v8 setCornerRadius:10.0];

  id v9 = +[UIColor colorNamed:@"PillShadowColor"];
  id v10 = [v9 cgColor];
  v11 = [v16 layer];
  [v11 setShadowColor:v10];

  v12 = [v16 layer];
  objc_msgSend(v12, "setShadowOffset:", 0.0, 0.0);

  v13 = [v16 layer];
  [v13 setShadowRadius:2.0];

  v14 = [v16 layer];
  LODWORD(v15) = 1.0;
  [v14 setShadowOpacity:v15];
}

- (void)setupTitleLabel:(id)a3 withText:(id)a4 withTextColor:(id)a5 numberOfLines:(unsigned int)a6 withLineBreakMode:(int64_t)a7 withFontWeight:(double)a8 withFontSize:(double)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v18 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v23 = NSKernAttributeName;
  double v24 = &off_100010670;
  v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v20 = [v18 initWithString:v16 attributes:v19];

  [v15 setTextColor:v17];
  [v15 setAttributedText:v20];
  [v15 setTextAlignment:1];
  v21 = +[UIFontDescriptor _preferredFontDescriptorWithTextStyle:UIFontTextStyleBody design:UIFontDescriptorSystemDesignDefault weight:a8];
  v22 = +[UIFont fontWithDescriptor:v21 size:a9];
  [v15 setFont:v22];

  [v15 setNumberOfLines:a6];
  [v15 setLineBreakMode:a7];
}

- (void)setupCalloutIcon:(id)a3 withImage:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setImage:v5];
  [v6 setContentMode:1];
  [v6 setClipsToBounds:1];
}

- (void)setupImageView:(id)a3 withImage:(id)a4 forImageSize:(CGSize)a5 withBorderWidth:(double)a6
{
  double height = a5.height;
  id v15 = a3;
  id v9 = a4;
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 setImage:v9];
  id v10 = [v15 layer];
  [v10 setBorderWidth:a6];

  id v11 = +[UIColor whiteColor];
  id v12 = [v11 CGColor];
  v13 = [v15 layer];
  [v13 setBorderColor:v12];

  v14 = [v15 layer];
  [v14 setCornerRadius:height * 0.5];

  [v15 setContentMode:1];
  [v15 setClipsToBounds:1];
}

- (void)setupBlurView:(id)a3
{
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [v4 layer];
  [v3 setCornerRadius:10.0];

  [v4 setClipsToBounds:1];
}

- (void)layoutSubviews
{
  v3 = [(CLCalloutOverlay *)self mainPlatterView];

  if (v3)
  {
    id v4 = [(CLCalloutOverlay *)self titleLabel];
    [v4 intrinsicContentSize];
    double v6 = v5;

    [(CLCalloutOverlay *)self calloutIconSize];
    double v8 = v7;
    v69 = [(CLCalloutOverlay *)self titleLabel];
    v66 = [v69 topAnchor];
    double v60 = [(CLCalloutOverlay *)self calloutImageView];
    v51 = [v60 bottomAnchor];
    v57 = objc_msgSend(v66, "constraintEqualToAnchor:constant:", 0.0);
    v76[0] = v57;
    v48 = [(CLCalloutOverlay *)self titleLabel];
    id v63 = [v48 leadingAnchor];
    v54 = [(CLCalloutOverlay *)self mainPlatterView];
    id v9 = [v54 leadingAnchor];
    uint64_t v10 = [v63 constraintEqualToAnchor:v9 constant:7.5];
    v76[1] = v10;
    id v11 = [(CLCalloutOverlay *)self titleLabel];
    id v12 = [v11 trailingAnchor];
    v13 = [(CLCalloutOverlay *)self mainPlatterView];
    v14 = [v13 trailingAnchor];
    id v15 = [v12 constraintEqualToAnchor:v14 constant:-7.5];
    v76[2] = v15;
    id v16 = +[NSArray arrayWithObjects:v76 count:3];
    +[NSLayoutConstraint activateConstraints:v16];

    id v17 = [(CLCalloutOverlay *)self subtitleLabel];
    LOBYTE(v10) = v17 == 0;

    double v18 = v6 + 5.0 + 8.0 + v8;
    if ((v10 & 1) == 0)
    {
      v19 = [(CLCalloutOverlay *)self subtitleLabel];
      [v19 intrinsicContentSize];
      double v21 = v20;

      v70 = [(CLCalloutOverlay *)self subtitleLabel];
      v67 = [v70 topAnchor];
      id v61 = [(CLCalloutOverlay *)self titleLabel];
      double v58 = [v61 bottomAnchor];
      v55 = objc_msgSend(v67, "constraintEqualToAnchor:constant:", 0.0);
      v75[0] = v55;
      v52 = [(CLCalloutOverlay *)self subtitleLabel];
      v64 = [v52 leadingAnchor];
      v49 = [(CLCalloutOverlay *)self mainPlatterView];
      v22 = [v49 leadingAnchor];
      NSAttributedStringKey v23 = [v64 constraintEqualToAnchor:v22 constant:7.5];
      v75[1] = v23;
      double v24 = [(CLCalloutOverlay *)self subtitleLabel];
      double v25 = [v24 trailingAnchor];
      v26 = [(CLCalloutOverlay *)self mainPlatterView];
      v27 = [v26 trailingAnchor];
      v28 = [v25 constraintEqualToAnchor:v27 constant:-7.5];
      v75[2] = v28;
      v29 = +[NSArray arrayWithObjects:v75 count:3];
      +[NSLayoutConstraint activateConstraints:v29];

      double v18 = v18 + v21;
    }
    v30 = [(CLCalloutOverlay *)self secondSubtitleLabel];
    BOOL v31 = v30 == 0;

    if (!v31)
    {
      id v32 = [(CLCalloutOverlay *)self secondSubtitleLabel];
      [v32 intrinsicContentSize];
      double v34 = v33;

      v71 = [(CLCalloutOverlay *)self secondSubtitleLabel];
      v68 = [v71 topAnchor];
      v53 = [(CLCalloutOverlay *)self subtitleLabel];
      v62 = [v53 bottomAnchor];
      v50 = objc_msgSend(v68, "constraintEqualToAnchor:constant:", 0.0);
      v74[0] = v50;
      v59 = [(CLCalloutOverlay *)self secondSubtitleLabel];
      v65 = [v59 leadingAnchor];
      v56 = [(CLCalloutOverlay *)self mainPlatterView];
      v35 = [v56 leadingAnchor];
      v36 = [v65 constraintEqualToAnchor:v35 constant:7.5];
      v74[1] = v36;
      v37 = [(CLCalloutOverlay *)self secondSubtitleLabel];
      id v38 = [v37 trailingAnchor];
      v39 = [(CLCalloutOverlay *)self mainPlatterView];
      v40 = [v39 trailingAnchor];
      v41 = [v38 constraintEqualToAnchor:v40 constant:-7.5];
      v74[2] = v41;
      v42 = +[NSArray arrayWithObjects:v74 count:3];
      +[NSLayoutConstraint activateConstraints:v42];

      double v18 = v18 + v34;
    }
    v43 = [(CLCalloutOverlay *)self mainPlatterView];
    v44 = [v43 heightAnchor];
    id v45 = [v44 constraintEqualToConstant:v18];
    v73 = v45;
    v46 = +[NSArray arrayWithObjects:&v73 count:1];
    +[NSLayoutConstraint activateConstraints:v46];

    v47 = [(CLCalloutOverlay *)self mainPlatterView];
    objc_msgSend(v47, "setFrame:", 0.0, 0.0, 0.0, v18);

    [(CLCalloutOverlay *)self setupPlatters];
  }
  v72.receiver = self;
  v72.super_class = (Class)CLCalloutOverlay;
  [(CLCalloutOverlay *)&v72 layoutSubviews];
}

- (CGRect)calloutFrame
{
  v2 = [(CLCalloutOverlay *)self mainPlatterView];
  [v2 visibleBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (UIImageView)calloutImageView
{
  return self->_calloutImageView;
}

- (void)setCalloutImageView:(id)a3
{
}

- (UIView)mainPlatterView
{
  return self->_mainPlatterView;
}

- (void)setMainPlatterView:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)secondSubtitleLabel
{
  return self->_secondSubtitleLabel;
}

- (void)setSecondSubtitleLabel:(id)a3
{
}

- (CGSize)calloutIconSize
{
  double width = self->_calloutIconSize.width;
  double height = self->_calloutIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCalloutIconSize:(CGSize)a3
{
  self->_calloutIconSize = a3;
}

- (BOOL)showBackgroundPlatters
{
  return self->_showBackgroundPlatters;
}

- (void)setShowBackgroundPlatters:(BOOL)a3
{
  self->_showBackgroundPlatters = a3;
}

- (UIView)backgroundPlatter1
{
  return self->_backgroundPlatter1;
}

- (void)setBackgroundPlatter1:(id)a3
{
}

- (UIView)backgroundPlatter2
{
  return self->_backgroundPlatter2;
}

- (void)setBackgroundPlatter2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundPlatter2, 0);
  objc_storeStrong((id *)&self->_backgroundPlatter1, 0);
  objc_storeStrong((id *)&self->_secondSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_mainPlatterView, 0);

  objc_storeStrong((id *)&self->_calloutImageView, 0);
}

@end