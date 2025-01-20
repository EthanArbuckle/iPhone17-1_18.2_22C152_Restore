@interface MAResultView
+ (BOOL)requiresConstraintBasedLayout;
+ (double)preferredHeightForMapItem:(id)a3;
+ (id)_majorFont;
+ (id)_minorFont;
+ (id)primaryColor;
+ (id)secondaryColor;
+ (id)tertiaryColor;
+ (void)_configureLabel:(id)a3 withFont:(id)a4 textColor:(id)a5;
- (BOOL)_showOpenStateLabel;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isAccessibilityElement;
- (BOOL)isBottomKeylineHidden;
- (BOOL)isDisplayForSAR;
- (BOOL)isDisplayForSingleResult;
- (BOOL)isLocationDetailPreferred;
- (CGSize)intrinsicContentSize;
- (CLLocation)referenceLocation;
- (MAResultView)initWithFrame:(CGRect)a3;
- (SALocalSearchMapItem)mapItem;
- (double)fallbackDistance;
- (double)preferredHeight;
- (id)_distanceString;
- (id)blockOnButtonTappedForSARResult;
- (int)displayFormat;
- (void)_buttonTapped;
- (void)_updateDetailLine1;
- (void)_updateDetailLine2HidingReviews:(BOOL)a3 hidingRating:(BOOL)a4;
- (void)_updateHorizontalCompressionResistanceForLabels;
- (void)_updateImage;
- (void)_updateImageViewVisibility;
- (void)_updateSubviews;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setBlockOnButtonTappedForSARResult:(id)a3;
- (void)setDisplayFormat:(int)a3;
- (void)setFallbackDistance:(double)a3;
- (void)setHideBottomKeyline:(BOOL)a3;
- (void)setLocationDetailPreferred:(BOOL)a3;
- (void)setMapItem:(id)a3;
- (void)setReferenceLocation:(id)a3;
@end

@implementation MAResultView

+ (id)primaryColor
{
  return +[UIColor siriui_platterTextColor];
}

+ (id)secondaryColor
{
  return +[UIColor siriui_semiTransparentTextColor];
}

+ (id)tertiaryColor
{
  return +[UIColor labelColor];
}

- (MAResultView)initWithFrame:(CGRect)a3
{
  v149.receiver = self;
  v149.super_class = (Class)MAResultView;
  v3 = -[MAResultView initWithFrame:](&v149, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[MAResultView primaryColor];
    v148 = +[MAResultView secondaryColor];
    uint64_t v5 = +[MAResultView _majorFont];
    v6 = +[MAResultView _minorFont];
    v7 = (_MKUILabel *)objc_alloc_init((Class)_MKUILabel);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = v7;

    v9 = (_MKUILabel *)objc_alloc_init((Class)_MKUILabel);
    detailLine1aLabel = v3->_detailLine1aLabel;
    v3->_detailLine1aLabel = v9;

    v11 = (_MKUILabel *)objc_alloc_init((Class)_MKUILabel);
    detailLine1bLabel = v3->_detailLine1bLabel;
    v3->_detailLine1bLabel = v11;

    v13 = (MKTransitInfoLabelView *)objc_alloc_init((Class)MKTransitInfoLabelView);
    detailLine2Label = v3->_detailLine2Label;
    v3->_detailLine2Label = v13;

    uint64_t v15 = v5;
    v147 = (void *)v5;
    +[MAResultView _configureLabel:v3->_nameLabel withFont:v5 textColor:v4];
    +[MAResultView _configureLabel:v3->_detailLine1aLabel withFont:v6 textColor:v4];
    v16 = (void *)v4;
    +[MAResultView _configureLabel:v3->_detailLine1bLabel withFont:v6 textColor:v4];
    v146 = v6;
    +[MAResultView _configureLabel:v3->_detailLine2Label withFont:v6 textColor:v148];
    [(MAResultView *)v3 _updateHorizontalCompressionResistanceForLabels];
    LODWORD(v17) = 1144750080;
    [(_MKUILabel *)v3->_detailLine1aLabel _mapkit_setContentHuggingPriority:0 forAxis:v17];
    LODWORD(v18) = 1144733696;
    [(_MKUILabel *)v3->_detailLine1bLabel _mapkit_setContentHuggingPriority:0 forAxis:v18];
    v19 = (MKVibrantLabel *)[objc_alloc((Class)MKVibrantLabel) initWithStyle:1];
    vibrantLabel = v3->_vibrantLabel;
    v3->_vibrantLabel = v19;

    +[MAResultView _configureLabel:v3->_vibrantLabel withFont:v6 textColor:v148];
    [(MAResultView *)v3 addSubview:v3->_vibrantLabel];
    v21 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v21;

    v23 = [(UIImageView *)v3->_imageView layer];
    [v23 setCornerRadius:8.0];

    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v24) = 1148829696;
    [(UIImageView *)v3->_imageView _mapkit_setContentHuggingPriority:0 forAxis:v24];
    v25 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    button = v3->_button;
    v3->_button = v25;

    [(UIButton *)v3->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v3->_button setHidden:1];
    v27 = [(UIButton *)v3->_button layer];
    [v27 setCornerRadius:7.5];

    v28 = [(UIButton *)v3->_button layer];
    [v28 setBorderWidth:1.0];

    id v145 = v16;
    id v29 = [v145 CGColor];
    v30 = [(UIButton *)v3->_button layer];
    [v30 setBorderColor:v29];

    v31 = v3->_button;
    v32 = +[UIColor clearColor];
    [(UIButton *)v31 _mapkit_setBackgroundColor:v32];

    v153[0] = NSFontAttributeName;
    v153[1] = NSForegroundColorAttributeName;
    v154[0] = v15;
    v154[1] = v145;
    v144 = +[NSDictionary dictionaryWithObjects:v154 forKeys:v153 count:2];
    id v33 = objc_alloc((Class)NSAttributedString);
    v34 = +[NSBundle _ma_bundle];
    v35 = [v34 siriUILocalizedStringForKey:@"GO"];

    id v143 = [v33 initWithString:v35 attributes:v144];
    [(UIButton *)v3->_button _mapkit_setAttributedTitle:v143];
    [(UIButton *)v3->_button _mapkit_setTarget:v3 action:"_buttonTapped"];
    uint64_t v36 = +[SiriUIKeyline keyline];
    bottomKeyline = v3->_bottomKeyline;
    v3->_bottomKeyline = (SiriUIKeyline *)v36;

    [(SiriUIKeyline *)v3->_bottomKeyline setTranslatesAutoresizingMaskIntoConstraints:0];
    v38 = +[UIColor clearColor];
    [(MAResultView *)v3 _mapkit_setBackgroundColor:v38];

    [(MAResultView *)v3 setOpaque:0];
    [(MAResultView *)v3 addSubview:v3->_nameLabel];
    [(MAResultView *)v3 addSubview:v3->_detailLine1aLabel];
    [(MAResultView *)v3 addSubview:v3->_detailLine1bLabel];
    [(MAResultView *)v3 addSubview:v3->_detailLine2Label];
    [(MAResultView *)v3 addSubview:v3->_imageView];
    [(MAResultView *)v3 addSubview:v3->_button];
    [(MAResultView *)v3 addSubview:v3->_bottomKeyline];
    v39 = objc_opt_new();
    v40 = [(_MKUILabel *)v3->_nameLabel leadingAnchor];
    v41 = [(MAResultView *)v3 leadingAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:15.0];
    [v39 addObject:v42];

    v43 = [(UIImageView *)v3->_imageView leadingAnchor];
    v44 = [(_MKUILabel *)v3->_nameLabel trailingAnchor];
    v45 = [v43 constraintGreaterThanOrEqualToAnchor:v44 constant:15.0];
    [v39 addObject:v45];

    v46 = [(MAResultView *)v3 trailingAnchor];
    v47 = [(UIImageView *)v3->_imageView trailingAnchor];
    v48 = [v46 constraintEqualToAnchor:v47 constant:15.0];
    [v39 addObject:v48];

    v49 = [(_MKUILabel *)v3->_detailLine1aLabel leadingAnchor];
    v50 = [(MAResultView *)v3 leadingAnchor];
    v51 = [v49 constraintEqualToAnchor:v50 constant:15.0];
    [v39 addObject:v51];

    v52 = [(_MKUILabel *)v3->_detailLine1bLabel leadingAnchor];
    v53 = [(_MKUILabel *)v3->_detailLine1aLabel trailingAnchor];
    v54 = [v52 constraintEqualToAnchor:v53 constant:0.0];
    [v39 addObject:v54];

    v55 = [(UIImageView *)v3->_imageView leadingAnchor];
    v56 = [(_MKUILabel *)v3->_detailLine1bLabel trailingAnchor];
    v57 = [v55 constraintGreaterThanOrEqualToAnchor:v56 constant:15.0];
    [v39 addObject:v57];

    v58 = [(MKTransitInfoLabelView *)v3->_detailLine2Label leadingAnchor];
    v59 = [(MAResultView *)v3 leadingAnchor];
    v60 = [v58 constraintEqualToAnchor:v59 constant:15.0];
    [v39 addObject:v60];

    v61 = [(UIImageView *)v3->_imageView leadingAnchor];
    v62 = [(MKTransitInfoLabelView *)v3->_detailLine2Label trailingAnchor];
    v63 = [v61 constraintGreaterThanOrEqualToAnchor:v62 constant:15.0];
    [v39 addObject:v63];

    v64 = [(SiriUIKeyline *)v3->_bottomKeyline leadingAnchor];
    v65 = [(MAResultView *)v3 leadingAnchor];
    v66 = [v64 constraintEqualToAnchor:v65 constant:15.0];
    [v39 addObject:v66];

    v67 = [(MAResultView *)v3 trailingAnchor];
    v68 = [(SiriUIKeyline *)v3->_bottomKeyline trailingAnchor];
    v69 = [v67 constraintEqualToAnchor:v68 constant:15.0];
    [v39 addObject:v69];

    objc_msgSend(v147, "_mapkit_scaledValueForValue:", 21.0);
    double v71 = v70;
    objc_msgSend(v6, "_mapkit_scaledValueForValue:", 21.0);
    double v73 = v72;
    objc_msgSend(v6, "_mapkit_scaledValueForValue:", 21.0);
    double v75 = v74;
    objc_msgSend(v6, "_mapkit_scaledValueForValue:", 21.0);
    double v77 = v76;
    v78 = [(_MKUILabel *)v3->_nameLabel firstBaselineAnchor];
    v79 = [(MAResultView *)v3 topAnchor];
    v80 = [v78 constraintEqualToAnchor:v79 constant:v71];
    [v39 addObject:v80];

    v81 = [(_MKUILabel *)v3->_detailLine1aLabel firstBaselineAnchor];
    v82 = [(_MKUILabel *)v3->_nameLabel lastBaselineAnchor];
    v83 = [v81 constraintEqualToAnchor:v82 constant:v73];
    v152[0] = v83;
    v84 = [(_MKUILabel *)v3->_detailLine1bLabel firstBaselineAnchor];
    v85 = [(_MKUILabel *)v3->_nameLabel lastBaselineAnchor];
    v86 = [v84 constraintEqualToAnchor:v85 constant:v73];
    v152[1] = v86;
    uint64_t v87 = +[NSArray arrayWithObjects:v152 count:2];
    baselineConstraintsDetailLine1ToName = v3->_baselineConstraintsDetailLine1ToName;
    v3->_baselineConstraintsDetailLine1ToName = (NSArray *)v87;

    v89 = [(MKTransitInfoLabelView *)v3->_detailLine2Label firstBaselineAnchor];
    v90 = [(_MKUILabel *)v3->_detailLine1aLabel lastBaselineAnchor];
    v91 = [v89 constraintEqualToAnchor:v90 constant:v75];
    v151[0] = v91;
    v92 = [(MKTransitInfoLabelView *)v3->_detailLine2Label firstBaselineAnchor];
    v93 = [(_MKUILabel *)v3->_detailLine1bLabel lastBaselineAnchor];
    v94 = [v92 constraintEqualToAnchor:v93 constant:v75];
    v151[1] = v94;
    uint64_t v95 = +[NSArray arrayWithObjects:v151 count:2];
    baselineConstraintsDetailLine2ToLine1 = v3->_baselineConstraintsDetailLine2ToLine1;
    v3->_baselineConstraintsDetailLine2ToLine1 = (NSArray *)v95;

    v97 = [(MAResultView *)v3 bottomAnchor];
    v98 = [(MKTransitInfoLabelView *)v3->_detailLine2Label lastBaselineAnchor];
    v99 = [v97 constraintEqualToAnchor:v98 constant:v77];

    LODWORD(v100) = 1148829696;
    [v99 setPriority:v100];
    [v39 addObject:v99];
    v101 = [(SiriUIKeyline *)v3->_bottomKeyline bottomAnchor];
    v102 = [(MAResultView *)v3 bottomAnchor];
    v103 = [v101 constraintEqualToAnchor:v102 constant:0.0];
    [v39 addObject:v103];

    v104 = [(UIImageView *)v3->_imageView centerYAnchor];
    v105 = [(MAResultView *)v3 centerYAnchor];
    v106 = [v104 constraintEqualToAnchor:v105];
    [v39 addObject:v106];

    v107 = [(UIImageView *)v3->_imageView widthAnchor];
    v108 = [v107 constraintEqualToConstant:64.0];
    [v39 addObject:v108];

    v109 = [(UIImageView *)v3->_imageView heightAnchor];
    v110 = [(UIImageView *)v3->_imageView widthAnchor];
    v111 = [v109 constraintEqualToAnchor:v110];
    [v39 addObject:v111];

    v112 = [(UIButton *)v3->_button widthAnchor];
    v113 = [(UIImageView *)v3->_imageView widthAnchor];
    v114 = [v112 constraintEqualToAnchor:v113];
    [v39 addObject:v114];

    v115 = [(UIButton *)v3->_button heightAnchor];
    v116 = [(UIButton *)v3->_button widthAnchor];
    v117 = [v115 constraintEqualToAnchor:v116];
    [v39 addObject:v117];

    v118 = [(UIButton *)v3->_button centerXAnchor];
    v119 = [(UIImageView *)v3->_imageView centerXAnchor];
    v120 = [v118 constraintEqualToAnchor:v119];
    [v39 addObject:v120];

    v121 = [(UIButton *)v3->_button centerYAnchor];
    v122 = [(UIImageView *)v3->_imageView centerYAnchor];
    v123 = [v121 constraintEqualToAnchor:v122];
    [v39 addObject:v123];

    v124 = [(MKVibrantLabel *)v3->_vibrantLabel leadingAnchor];
    v125 = [(MAResultView *)v3 leadingAnchor];
    v126 = [v124 constraintEqualToAnchor:v125 constant:15.0];
    [v39 addObject:v126];

    v127 = [(UIImageView *)v3->_imageView leadingAnchor];
    v128 = [(MKVibrantLabel *)v3->_vibrantLabel trailingAnchor];
    v129 = [v127 constraintGreaterThanOrEqualToAnchor:v128 constant:15.0];
    [v39 addObject:v129];

    v130 = [(MAResultView *)v3 bottomAnchor];
    v131 = [(MKVibrantLabel *)v3->_vibrantLabel lastBaselineAnchor];
    v132 = [v130 constraintEqualToAnchor:v131 constant:v77];

    LODWORD(v133) = 1148829696;
    [v132 setPriority:v133];
    [v39 addObject:v132];
    v134 = [(MKVibrantLabel *)v3->_vibrantLabel firstBaselineAnchor];
    v135 = [(_MKUILabel *)v3->_detailLine1aLabel lastBaselineAnchor];
    v136 = [v134 constraintEqualToAnchor:v135 constant:v75];
    v150[0] = v136;
    v137 = [(MKVibrantLabel *)v3->_vibrantLabel firstBaselineAnchor];
    v138 = [(_MKUILabel *)v3->_detailLine1bLabel lastBaselineAnchor];
    v139 = [v137 constraintEqualToAnchor:v138 constant:v75];
    v150[1] = v139;
    uint64_t v140 = +[NSArray arrayWithObjects:v150 count:2];
    baselineConstraintsVibrantToLine1 = v3->_baselineConstraintsVibrantToLine1;
    v3->_baselineConstraintsVibrantToLine1 = (NSArray *)v140;

    +[NSLayoutConstraint activateConstraints:v39];
  }
  return v3;
}

- (void)dealloc
{
  imageDownloadTask = self->_imageDownloadTask;
  if (imageDownloadTask)
  {
    [(NSURLSessionDataTask *)imageDownloadTask cancel];
    uint64_t v4 = self->_imageDownloadTask;
    self->_imageDownloadTask = 0;
  }
  if (self->_notificationHandler)
  {
    uint64_t v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self->_notificationHandler];

    id notificationHandler = self->_notificationHandler;
    self->_id notificationHandler = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)MAResultView;
  [(MAResultView *)&v7 dealloc];
}

- (void)_updateHorizontalCompressionResistanceForLabels
{
  detailLine1aLabel = self->_detailLine1aLabel;
  v3 = self->_detailLine1bLabel;
  v6 = detailLine1aLabel;
  LODWORD(v4) = 1148829696;
  [(_MKUILabel *)v6 _mapkit_setContentCompressionResistancePriority:0 forAxis:v4];
  LODWORD(v5) = 1148813312;
  [(_MKUILabel *)v3 _mapkit_setContentCompressionResistancePriority:0 forAxis:v5];
}

+ (id)_majorFont
{
  return +[UIFont siriui_mediumWeightBodySizeFont];
}

+ (id)_minorFont
{
  return +[UIFont siriui_lightWeightBodySubtextSizeFont];
}

+ (void)_configureLabel:(id)a3 withFont:(id)a4 textColor:(id)a5
{
  id v7 = a5;
  id v10 = a3;
  [v10 setFont:a4];
  [v10 setTextColor:v7];

  v8 = +[UIColor clearColor];
  [v10 setBackgroundColor:v8];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setTextAlignment:4];
  LODWORD(v9) = 1148829696;
  objc_msgSend(v10, "_mapkit_setContentHuggingPriority:forAxis:", 1, v9);
}

- (void)_buttonTapped
{
  if ([(MAResultView *)self isDisplayForSAR])
  {
    v3 = [(MAResultView *)self blockOnButtonTappedForSARResult];

    if (v3)
    {
      double v5 = [(MAResultView *)self blockOnButtonTappedForSARResult];
      double v4 = [(MAResultView *)self mapItem];
      v5[2](v5, v4);
    }
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v5 = +[UIColor siriui_highlightColor];
  [(MAResultView *)self setBackgroundColor:v5];

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MAResultView;
  [(MAResultView *)&v6 endTrackingWithTouch:a3 withEvent:a4];
  double v5 = +[UIColor clearColor];
  [(MAResultView *)self setBackgroundColor:v5];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MAResultView;
  [(MAResultView *)&v5 cancelTrackingWithEvent:a3];
  double v4 = +[UIColor clearColor];
  [(MAResultView *)self setBackgroundColor:v4];
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (double)preferredHeightForMapItem:(id)a3
{
  v3 = +[MAResultView _majorFont];
  double v4 = +[MAResultView _minorFont];
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 21.0);
  double v6 = v5;
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 21.0);
  double v8 = v7;
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 21.0);
  double v10 = v9;
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 21.0);
  double v12 = v6 + v8 + v10 + v11;

  return v12;
}

- (double)preferredHeight
{
  v3 = objc_opt_class();
  mapItem = self->_mapItem;

  [v3 preferredHeightForMapItem:mapItem];
  return result;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(MAResultView *)self superview];

  double v4 = UIViewNoIntrinsicMetric;
  if (v3)
  {
    [(MAResultView *)self preferredHeight];
    double v4 = v5;
  }
  double v6 = UIViewNoIntrinsicMetric;
  result.height = v4;
  result.width = v6;
  return result;
}

- (void)_updateSubviews
{
  v3 = [(SALocalSearchMapItem *)self->_mapItem label];
  [(_MKUILabel *)self->_nameLabel setText:v3];

  unsigned int v4 = [(SALocalSearchMapItem *)self->_mapItem needsAttribution];
  uint64_t v5 = v4 ^ 1;
  if (v4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [(MKMapItem *)self->_placeDataMapItem _hasUserRatingScore] ^ 1;
  }
  [(MAResultView *)self _updateDetailLine2HidingReviews:v5 hidingRating:v6];
  [(MAResultView *)self _updateDetailLine1];
  [(MAResultView *)self _updateHorizontalCompressionResistanceForLabels];
  [(MAResultView *)self _updateImage];
  [(UIButton *)self->_button setHidden:[(MAResultView *)self isDisplayForSAR] ^ 1];
  [(SiriUIKeyline *)self->_bottomKeyline setHidden:self->_hideBottomKeyline];
  int IsRTL = SiriLanguageIsRTL();
  detailLine1aLabel = self->_detailLine1aLabel;
  v20[0] = self->_nameLabel;
  v20[1] = detailLine1aLabel;
  if (IsRTL) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  detailLine2Label = self->_detailLine2Label;
  v20[2] = self->_detailLine1bLabel;
  v20[3] = detailLine2Label;
  double v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4, 0);
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) setTextAlignment:v9];
      }
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v13);
  }

  [(MAResultView *)self _mapkit_setNeedsLayout];
}

- (void)_updateDetailLine2HidingReviews:(BOOL)a3 hidingRating:(BOOL)a4
{
  uint64_t v6 = +[MKMapItem mapItemWithLocalSearchMapItem:](MKMapItem, "mapItemWithLocalSearchMapItem:", self->_mapItem, a4);
  if ([v6 _hasTransit])
  {
    [(MKTransitInfoLabelView *)self->_detailLine2Label setMapItem:v6];
  }
  else
  {
    double v7 = +[MAResultView tertiaryColor];
    double v8 = +[MAResultView _minorFont];
    if (a3)
    {
      uint64_t v9 = 0;
    }
    else
    {
      placeDataMapItem = self->_placeDataMapItem;
      double v11 = [(MAResultView *)self mk_theme];
      uint64_t v9 = +[MKRatingStringBuilder ratingAndReviewSummaryAttributedStringForMapItem:placeDataMapItem textColor:v7 font:v8 theme:v11];
    }
    NSAttributedStringKey v23 = NSFontAttributeName;
    double v24 = v8;
    id v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v13 = +[MKRatingStringBuilder priceLabelStringFromMapItem:self->_placeDataMapItem];
    id v14 = objc_alloc_init((Class)NSMutableAttributedString);
    if ([v9 length]) {
      [v14 appendAttributedString:v9];
    }
    if ([v13 length])
    {
      id v15 = [objc_alloc((Class)NSAttributedString) initWithString:v13];
      if ([v14 length])
      {
        id v16 = [objc_alloc((Class)NSAttributedString) initWithString:@" · " attributes:v12];
        [v14 appendAttributedString:v16];
      }
      [v14 appendAttributedString:v15];
    }
    if (![v14 length])
    {
      long long v17 = [(MAResultView *)self mapItem];
      unsigned int v18 = [v17 isBusinessLocation];

      if (v18)
      {
        id v22 = objc_alloc((Class)NSMutableAttributedString);
        long long v19 = +[NSBundle _ma_bundle];
        v20 = [v19 siriUILocalizedStringForKey:@"No Reviews"];

        id v21 = [v22 initWithString:v20];
        id v14 = v21;
      }
    }
    [(MKVibrantLabel *)self->_vibrantLabel setAttributedText:v14];
  }
}

- (void)_updateDetailLine1
{
  unsigned int v3 = [(MAResultView *)self isDisplayForSAR];
  [(_MKUILabel *)self->_detailLine1aLabel setText:0];
  [(_MKUILabel *)self->_detailLine1bLabel setText:0];
  unsigned int v4 = 0;
  if (v3)
  {
    unsigned int v4 = [(MKMapItem *)self->_placeDataMapItem _ma_detourText];
  }
  if ([(MAResultView *)self isLocationDetailPreferred]
    || ([(MAResultView *)self mapItem],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isBusinessLocation],
        v5,
        (v6 & 1) == 0))
  {
    double v7 = [(MKMapItem *)self->_placeDataMapItem _addressFormattedAsShortenedAddress];
    if (![v7 length])
    {
      uint64_t v8 = [(SALocalSearchMapItem *)self->_mapItem locationDetailLabel];

      double v7 = (void *)v8;
    }
  }
  else if ([(MKMapItem *)self->_placeDataMapItem _hasLocalizedCategoryNamesForType:0])
  {
    double v7 = [(MKMapItem *)self->_placeDataMapItem _firstLocalizedCategoryName];
  }
  else
  {
    double v7 = 0;
  }
  uint64_t v9 = [(MAResultView *)self _distanceString];
  if (!self->_localizedHoursBuilder)
  {
    double v10 = (_MKLocalizedHoursBuilder *)[objc_alloc((Class)_MKLocalizedHoursBuilder) initWithMapItem:self->_placeDataMapItem localizedHoursStringOptions:1];
    localizedHoursBuilder = self->_localizedHoursBuilder;
    self->_localizedHoursBuilder = v10;
  }
  v42 = v7;
  v43 = v4;
  if (v3)
  {
    id v12 = objc_opt_new();
    if ([v4 length]) {
      [v12 addObject:v4];
    }
    if ([v9 length]) {
      [v12 addObject:v9];
    }
    if ([v12 count])
    {
      id v13 = [v12 componentsJoinedByString:@" · "];
      if ([v7 length])
      {
        id v14 = +[NSString stringWithFormat:@"%@%@", v13, @" · "];
        [(_MKUILabel *)self->_detailLine1aLabel setText:v14];
      }
      else
      {
        [(_MKUILabel *)self->_detailLine1aLabel setText:v13];
      }
    }
    v41 = v12;
    [(_MKUILabel *)self->_detailLine1bLabel setText:v7];
    v40 = 0;
  }
  else
  {
    if ([(MAResultView *)self _showOpenStateLabel])
    {
      id v15 = [(_MKLocalizedHoursBuilder *)self->_localizedHoursBuilder localizedOperatingHours];
    }
    else
    {
      id v15 = 0;
    }
    id v16 = objc_opt_new();
    [(_MKUILabel *)self->_detailLine1aLabel setText:v7];
    if ([v9 length]) {
      [v16 addObject:v9];
    }
    if ([v15 length]) {
      [v16 addObject:v15];
    }
    if ([v16 count])
    {
      long long v17 = [v16 componentsJoinedByString:@" · "];
      if ([v7 length])
      {
        unsigned int v18 = +[NSString stringWithFormat:@"%@%@", @" · ", v17];
        [(_MKUILabel *)self->_detailLine1bLabel setText:v18];
      }
      else
      {
        [(_MKUILabel *)self->_detailLine1bLabel setText:v17];
      }
    }
    v40 = v15;
    v41 = v16;
    if ([v15 length])
    {
      long long v19 = [(_MKUILabel *)self->_detailLine1bLabel text];
      id v20 = [v19 rangeOfString:v15];
      uint64_t v22 = v21;

      if (v20 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        NSAttributedStringKey v23 = [(_MKUILabel *)self->_detailLine1bLabel attributedText];
        id v24 = [v23 mutableCopy];

        v25 = [(_MKLocalizedHoursBuilder *)self->_localizedHoursBuilder hoursStateLabelColor];
        NSAttributedStringKey v50 = NSForegroundColorAttributeName;
        v51 = v25;
        v26 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        objc_msgSend(v24, "addAttributes:range:", v26, v20, v22);

        [(_MKUILabel *)self->_detailLine1bLabel setAttributedText:v24];
      }
    }
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  detailLine1bLabel = self->_detailLine1bLabel;
  v48[0] = self->_detailLine1aLabel;
  v48[1] = detailLine1bLabel;
  v28 = +[NSArray arrayWithObjects:v48 count:2];
  id v29 = [v28 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v45;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = *(_MKUILabel **)(*((void *)&v44 + 1) + 8 * i);
        v34 = [(_MKUILabel *)v33 text];
        BOOL v35 = [v34 length] != 0;

        BOOL v36 = v33 != self->_detailLine1aLabel;
        v37 = [(NSArray *)self->_baselineConstraintsDetailLine1ToName objectAtIndexedSubscript:v36];
        [v37 setActive:v35];

        v38 = [(NSArray *)self->_baselineConstraintsDetailLine2ToLine1 objectAtIndexedSubscript:v36];
        [v38 setActive:v35];

        v39 = [(NSArray *)self->_baselineConstraintsVibrantToLine1 objectAtIndexedSubscript:v36];
        [v39 setActive:v35];
      }
      id v30 = [v28 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v30);
  }
}

- (BOOL)_showOpenStateLabel
{
  return ((unint64_t)[(_MKLocalizedHoursBuilder *)self->_localizedHoursBuilder geoMapItemOpeningHourOptions] & 0x64) != 0;
}

- (void)_updateImage
{
  [(NSURLSessionDataTask *)self->_imageDownloadTask cancel];
  imageDownloadTask = self->_imageDownloadTask;
  self->_imageDownloadTask = 0;

  [(UIImageView *)self->_imageView setImage:0];
  if ([(MAResultView *)self isDisplayForSAR])
  {
    [(MAResultView *)self _updateImageViewVisibility];
  }
  else
  {
    unsigned int v4 = +[MKSystemController sharedInstance];
    [v4 screenScale];
    double v6 = v5;

    double v7 = [(MKMapItem *)self->_placeDataMapItem _geoMapItem];
    uint64_t v8 = [v7 _photos];
    uint64_t v9 = objc_msgSend(v8, "_geo_firstPhotoOfAtLeastSize:", v6 * 64.0, v6 * 64.0);

    if (v9)
    {
      id v10 = objc_alloc((Class)NSURLRequest);
      double v11 = [v9 url];
      id v12 = [v10 initWithURL:v11 cachePolicy:2 timeoutInterval:5.0];

      id v13 = +[NSURLSession sharedSession];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10FDC;
      v16[3] = &unk_3D210;
      v16[4] = self;
      id v14 = [v13 dataTaskWithRequest:v12 completionHandler:v16];
      id v15 = self->_imageDownloadTask;
      self->_imageDownloadTask = v14;

      [(NSURLSessionDataTask *)self->_imageDownloadTask resume];
    }
    else
    {
      [(MAResultView *)self _updateImageViewVisibility];
    }
  }
}

- (void)_updateImageViewVisibility
{
  uint64_t v3 = [(UIImageView *)self->_imageView image];
  if (v3)
  {
    unsigned int v4 = (void *)v3;
    BOOL v5 = [(MAResultView *)self isDisplayForSAR];
  }
  else
  {
    BOOL v5 = 1;
  }
  [(UIImageView *)self->_imageView setHidden:v5];

  [(MAResultView *)self _mapkit_setNeedsLayout];
}

- (id)_distanceString
{
  uint64_t v3 = [(MAResultView *)self mapItem];
  unsigned __int8 v4 = [v3 isCurrentLocation];

  if (v4)
  {
    BOOL v5 = 0;
    goto LABEL_12;
  }
  double v6 = [(MAResultView *)self mapItem];
  double v7 = [v6 distance];

  if (v7)
  {
    uint64_t v8 = [v7 localizedDistanceString];
  }
  else
  {
    uint64_t v9 = [(MAResultView *)self referenceLocation];

    if (v9)
    {
      id v10 = [(MAResultView *)self mapItem];
      double v11 = [v10 location];
      id v12 = [v11 clRepresentation];

      id v13 = [(MAResultView *)self referenceLocation];
      [v12 distanceFromLocation:v13];
      double v15 = v14;

      BOOL v5 = +[SADistance localizedStringForDistanceInMeters:0 forCity:v15];

      goto LABEL_11;
    }
    [(MAResultView *)self fallbackDistance];
    if (v16 <= 0.0)
    {
      BOOL v5 = 0;
      goto LABEL_11;
    }
    [(MAResultView *)self fallbackDistance];
    uint64_t v8 = +[SADistance localizedStringForDistanceInMeters:forCity:](SADistance, "localizedStringForDistanceInMeters:forCity:", 0);
  }
  BOOL v5 = (void *)v8;
LABEL_11:

LABEL_12:

  return v5;
}

- (void)setHideBottomKeyline:(BOOL)a3
{
  if (self->_hideBottomKeyline != a3)
  {
    self->_hideBottomKeyline = a3;
    -[SiriUIKeyline setHidden:](self->_bottomKeyline, "setHidden:");
  }
}

- (void)setMapItem:(id)a3
{
  BOOL v5 = (SALocalSearchMapItem *)a3;
  p_mapItem = &self->_mapItem;
  mapItem = self->_mapItem;
  if (mapItem != v5 && ([(SALocalSearchMapItem *)mapItem isEqual:v5] & 1) == 0)
  {
    if (self->_notificationHandler)
    {
      uint64_t v8 = +[NSNotificationCenter defaultCenter];
      [v8 removeObserver:self->_notificationHandler];

      id notificationHandler = self->_notificationHandler;
      self->_id notificationHandler = 0;
    }
    objc_storeStrong((id *)&self->_mapItem, a3);
    id v10 = +[MKMapItem mapItemWithLocalSearchMapItem:*p_mapItem];
    placeDataMapItem = self->_placeDataMapItem;
    self->_placeDataMapItem = v10;

    if ([(SALocalSearchMapItem *)*p_mapItem needsAttribution])
    {
      objc_initWeak(&location, self);
      id v12 = +[NSNotificationCenter defaultCenter];
      id v13 = self->_placeDataMapItem;
      double v14 = +[NSOperationQueue mainQueue];
      uint64_t v15 = _MKMapItemDidResolveAttributionNotification;
      unsigned int v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      id v20 = sub_1151C;
      uint64_t v21 = &unk_3D238;
      objc_copyWeak(&v22, &location);
      double v16 = [v12 addObserverForName:v15 object:v13 queue:v14 usingBlock:&v18];
      id v17 = self->_notificationHandler;
      self->_id notificationHandler = v16;

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    [(MAResultView *)self _updateSubviews];
  }
}

- (void)setReferenceLocation:(id)a3
{
  BOOL v5 = (CLLocation *)a3;
  referenceLocation = self->_referenceLocation;
  if (referenceLocation != v5 && ([(CLLocation *)referenceLocation isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_referenceLocation, a3);
    [(MAResultView *)self _updateSubviews];
  }

  _objc_release_x1();
}

- (void)setLocationDetailPreferred:(BOOL)a3
{
  if (self->_locationDetailPreferred != a3)
  {
    self->_locationDetailPreferred = a3;
    [(MAResultView *)self _updateSubviews];
  }
}

- (void)setDisplayFormat:(int)a3
{
  if (self->_displayFormat != a3)
  {
    self->_displayFormat = a3;
    [(MAResultView *)self _updateSubviews];
  }
}

- (BOOL)isDisplayForSAR
{
  return [(MAResultView *)self displayFormat] == 1;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (SALocalSearchMapItem)mapItem
{
  return self->_mapItem;
}

- (CLLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (double)fallbackDistance
{
  return self->_fallbackDistance;
}

- (void)setFallbackDistance:(double)a3
{
  self->_fallbackDistance = a3;
}

- (BOOL)isBottomKeylineHidden
{
  return self->_hideBottomKeyline;
}

- (BOOL)isLocationDetailPreferred
{
  return self->_locationDetailPreferred;
}

- (int)displayFormat
{
  return self->_displayFormat;
}

- (id)blockOnButtonTappedForSARResult
{
  return self->_blockOnButtonTappedForSARResult;
}

- (void)setBlockOnButtonTappedForSARResult:(id)a3
{
}

- (BOOL)isDisplayForSingleResult
{
  return self->_displayForSingleResult;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_blockOnButtonTappedForSARResult, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_imageDownloadTask, 0);
  objc_storeStrong((id *)&self->_baselineConstraintsVibrantToLine1, 0);
  objc_storeStrong((id *)&self->_baselineConstraintsDetailLine2ToLine1, 0);
  objc_storeStrong((id *)&self->_baselineConstraintsDetailLine1ToName, 0);
  objc_storeStrong((id *)&self->_localizedHoursBuilder, 0);
  objc_storeStrong((id *)&self->_bottomKeyline, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_vibrantLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_detailLine2Label, 0);
  objc_storeStrong((id *)&self->_detailLine1bLabel, 0);
  objc_storeStrong((id *)&self->_detailLine1aLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_placeDataMapItem, 0);

  objc_storeStrong(&self->_notificationHandler, 0);
}

@end