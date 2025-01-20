@interface PHRecentCallDetailsItemView
+ (id)_sharedDetailDisclosureImage;
+ (id)_sharedTTYDirectImage;
+ (id)_sharedTTYRelayImage;
+ (id)_verifiedCheckmarkImage;
- (BOOL)verified;
- (CGSize)intrinsicContentSize;
- (NSString)callUUID;
- (NSString)durationAndDataText;
- (NSString)emergencyItemsText;
- (NSString)screenSharingTypeText;
- (NSString)statusText;
- (NSString)timeText;
- (PHRecentCallDetailsItemView)initWithCoder:(id)a3;
- (PHRecentCallDetailsItemView)initWithFrame:(CGRect)a3 callUUID:(id)a4 ttyType:(int64_t)a5 timeLabel:(id)a6 statusLabel:(id)a7 durationAndDataText:(id)a8 emergencyItemsText:(id)a9 verified:(BOOL)a10 screenSharingTypeText:(id)a11;
- (PHRecentCallDetailsItemViewDelegate)delegate;
- (UIImageView)ttyDetailDisclosureImageView;
- (UIImageView)verifiedBadgeView;
- (UILabel)durationAndDataLabel;
- (UILabel)emergencyItemsLabel;
- (UILabel)screenSharingLabel;
- (UILabel)statusLabel;
- (UILabel)timeLabel;
- (int64_t)ttyType;
- (void)addDurationAndDataSubview;
- (void)addEmergencyItemsSubview;
- (void)addRTTInfo;
- (void)addScreenSharingTypeSubview;
- (void)addVerifiedBadge;
- (void)handleTTYTranscriptAction:(id)a3;
- (void)loadSubviews;
- (void)loadSubviewsLayoutConstraints;
- (void)setCallUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDurationAndDataLabel:(id)a3;
- (void)setDurationAndDataText:(id)a3;
- (void)setEmergencyItemsLabel:(id)a3;
- (void)setEmergencyItemsText:(id)a3;
- (void)setScreenSharingLabel:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)setStatusText:(id)a3;
- (void)setTimeLabel:(id)a3;
- (void)setTimeText:(id)a3;
- (void)setTtyDetailDisclosureImageView:(id)a3;
- (void)setTtyType:(int64_t)a3;
- (void)setVerified:(BOOL)a3;
- (void)setVerifiedBadgeView:(id)a3;
@end

@implementation PHRecentCallDetailsItemView

+ (id)_sharedTTYDirectImage
{
  if (_sharedTTYDirectImage_onceToken != -1) {
    dispatch_once(&_sharedTTYDirectImage_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)__PHRecentsDetails_TTYDirectCall;

  return v2;
}

void __52__PHRecentCallDetailsItemView__sharedTTYDirectImage__block_invoke(id a1)
{
  id v4 = +[UIImage tpImageForSymbolType:29 textStyle:UIFontTextStyleCaption1 scale:1 isStaticSize:0];
  v1 = +[UIColor colorWithWhite:0.800000012 alpha:1.0];
  uint64_t v2 = [v4 _flatImageWithColor:v1];
  v3 = (void *)__PHRecentsDetails_TTYDirectCall;
  __PHRecentsDetails_TTYDirectCall = v2;
}

+ (id)_sharedTTYRelayImage
{
  if (_sharedTTYRelayImage_onceToken != -1) {
    dispatch_once(&_sharedTTYRelayImage_onceToken, &__block_literal_global_43);
  }
  uint64_t v2 = (void *)__PHRecentsDetails_TTYRelayCall;

  return v2;
}

void __51__PHRecentCallDetailsItemView__sharedTTYRelayImage__block_invoke(id a1)
{
  id v4 = +[UIImage tpImageForSymbolType:29 textStyle:UIFontTextStyleCaption1 scale:1 isStaticSize:0];
  v1 = +[UIColor colorWithWhite:0.800000012 alpha:1.0];
  uint64_t v2 = [v4 _flatImageWithColor:v1];
  v3 = (void *)__PHRecentsDetails_TTYRelayCall;
  __PHRecentsDetails_TTYRelayCall = v2;
}

+ (id)_sharedDetailDisclosureImage
{
  if (_sharedDetailDisclosureImage_onceToken != -1) {
    dispatch_once(&_sharedDetailDisclosureImage_onceToken, &__block_literal_global_45_0);
  }
  uint64_t v2 = (void *)__PHRecentsDetails_DetailDisclosureImage;

  return v2;
}

void __59__PHRecentCallDetailsItemView__sharedDetailDisclosureImage__block_invoke(id a1)
{
  id v4 = +[UIImage tpImageForSymbolType:37 textStyle:UIFontTextStyleCaption1 scale:1 isStaticSize:0];
  v1 = +[UIColor colorWithWhite:0.800000012 alpha:1.0];
  uint64_t v2 = [v4 _flatImageWithColor:v1];
  v3 = (void *)__PHRecentsDetails_DetailDisclosureImage;
  __PHRecentsDetails_DetailDisclosureImage = v2;
}

+ (id)_verifiedCheckmarkImage
{
  if (_verifiedCheckmarkImage_onceToken != -1) {
    dispatch_once(&_verifiedCheckmarkImage_onceToken, &__block_literal_global_47_0);
  }
  uint64_t v2 = (void *)__PHRecentsDetails_VerifiedCheckmarkImage;

  return v2;
}

void __54__PHRecentCallDetailsItemView__verifiedCheckmarkImage__block_invoke(id a1)
{
  id v4 = +[UIImage tpImageForSymbolType:36 textStyle:UIFontTextStyleCaption1 scale:1 isStaticSize:0];
  v1 = +[UIColor colorWithWhite:0.800000012 alpha:1.0];
  uint64_t v2 = [v4 _flatImageWithColor:v1];
  v3 = (void *)__PHRecentsDetails_VerifiedCheckmarkImage;
  __PHRecentsDetails_VerifiedCheckmarkImage = v2;
}

- (PHRecentCallDetailsItemView)initWithFrame:(CGRect)a3 callUUID:(id)a4 ttyType:(int64_t)a5 timeLabel:(id)a6 statusLabel:(id)a7 durationAndDataText:(id)a8 emergencyItemsText:(id)a9 verified:(BOOL)a10 screenSharingTypeText:(id)a11
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v21 = a4;
  id v22 = a6;
  id v23 = a7;
  id v30 = a8;
  id v29 = a9;
  id v28 = a11;
  v31.receiver = self;
  v31.super_class = (Class)PHRecentCallDetailsItemView;
  v24 = -[PHRecentCallDetailsItemView initWithFrame:](&v31, "initWithFrame:", x, y, width, height);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_callUUID, a4);
    v25->_ttyType = a5;
    objc_storeStrong((id *)&v25->_timeText, a6);
    objc_storeStrong((id *)&v25->_statusText, a7);
    objc_storeStrong((id *)&v25->_durationAndDataText, a8);
    objc_storeStrong((id *)&v25->_emergencyItemsText, a9);
    v25->_verified = a10;
    objc_storeStrong((id *)&v25->_screenSharingTypeText, a11);
    [(PHRecentCallDetailsItemView *)v25 loadSubviews];
  }

  return v25;
}

- (PHRecentCallDetailsItemView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHRecentCallDetailsItemView;
  v3 = [(PHRecentCallDetailsItemView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(PHRecentCallDetailsItemView *)v3 loadSubviews];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(PHRecentCallDetailsItemView *)self statusLabel];
  [v3 intrinsicContentSize];
  double v5 = v4;

  if (self->_durationAndDataLabel)
  {
    objc_super v6 = [(PHRecentCallDetailsItemView *)self statusLabel];
    [v6 intrinsicContentSize];
    double v8 = v7;
    v9 = [(PHRecentCallDetailsItemView *)self durationAndDataLabel];
    [v9 intrinsicContentSize];
    double v5 = v8 + v10;
  }
  if (self->_screenSharingLabel)
  {
    v11 = [(PHRecentCallDetailsItemView *)self screenSharingLabel];
    [v11 intrinsicContentSize];
    double v5 = v5 + v12;
  }
  double v13 = UIViewNoIntrinsicMetric;
  double v14 = v5;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)loadSubviews
{
  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  timeLabel = self->_timeLabel;
  self->_timeLabel = v3;

  double v5 = +[UIFont preferredCaption1Font];
  [(UILabel *)self->_timeLabel setFont:v5];

  [(UILabel *)self->_timeLabel setTextAlignment:4];
  [(UILabel *)self->_timeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_timeLabel setContentMode:4];
  objc_super v6 = [(PHRecentCallDetailsItemView *)self timeText];
  [(UILabel *)self->_timeLabel setText:v6];

  [(UILabel *)self->_timeLabel setAdjustsFontForContentSizeCategory:1];
  LODWORD(v7) = 1148846080;
  [(UILabel *)self->_timeLabel setContentCompressionResistancePriority:0 forAxis:v7];
  [(PHRecentCallDetailsItemView *)self addSubview:self->_timeLabel];
  double v8 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  statusLabel = self->_statusLabel;
  self->_statusLabel = v8;

  double v10 = +[UIFont preferredCaption1BoldFont];
  [(UILabel *)self->_statusLabel setFont:v10];

  [(UILabel *)self->_statusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_statusLabel setContentMode:4];
  v11 = [(PHRecentCallDetailsItemView *)self statusText];
  [(UILabel *)self->_statusLabel setText:v11];

  [(UILabel *)self->_statusLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_statusLabel setNumberOfLines:0];
  [(PHRecentCallDetailsItemView *)self addSubview:self->_statusLabel];
  double v12 = [(PHRecentCallDetailsItemView *)self emergencyItemsText];

  if (v12) {
    [(PHRecentCallDetailsItemView *)self addEmergencyItemsSubview];
  }
  double v13 = [(PHRecentCallDetailsItemView *)self screenSharingTypeText];

  if (v13) {
    [(PHRecentCallDetailsItemView *)self addScreenSharingTypeSubview];
  }
  double v14 = [(PHRecentCallDetailsItemView *)self durationAndDataText];

  if (v14) {
    [(PHRecentCallDetailsItemView *)self addDurationAndDataSubview];
  }
  if ([(PHRecentCallDetailsItemView *)self verified]) {
    [(PHRecentCallDetailsItemView *)self addVerifiedBadge];
  }
  if ([(PHRecentCallDetailsItemView *)self ttyType]) {
    [(PHRecentCallDetailsItemView *)self addRTTInfo];
  }

  [(PHRecentCallDetailsItemView *)self loadSubviewsLayoutConstraints];
}

- (void)loadSubviewsLayoutConstraints
{
  v3 = [(PHRecentCallDetailsItemView *)self timeLabel];
  double v4 = [v3 leadingAnchor];
  double v5 = [(PHRecentCallDetailsItemView *)self leadingAnchor];
  objc_super v6 = [v4 constraintEqualToAnchor:v5];
  [v6 setActive:1];

  double v7 = [(PHRecentCallDetailsItemView *)self statusLabel];
  double v8 = [v7 leadingAnchor];
  v9 = [(PHRecentCallDetailsItemView *)self timeLabel];
  double v10 = [v9 trailingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10 constant:8.0];
  [v11 setActive:1];

  if (![(PHRecentCallDetailsItemView *)self verified]
    && ![(PHRecentCallDetailsItemView *)self ttyType])
  {
    double v12 = [(PHRecentCallDetailsItemView *)self statusLabel];
    double v13 = [v12 trailingAnchor];
    double v14 = [(PHRecentCallDetailsItemView *)self trailingAnchor];
    v15 = [v13 constraintLessThanOrEqualToAnchor:v14];
    [v15 setActive:1];
  }
  v16 = [(PHRecentCallDetailsItemView *)self timeLabel];
  v17 = [v16 topAnchor];
  v18 = [(PHRecentCallDetailsItemView *)self topAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = [(PHRecentCallDetailsItemView *)self statusLabel];
  id v21 = [v20 topAnchor];
  id v22 = [(PHRecentCallDetailsItemView *)self topAnchor];
  id v23 = [v21 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  durationAndDataLabel = self->_durationAndDataLabel;
  id v28 = [(PHRecentCallDetailsItemView *)self bottomAnchor];
  if (durationAndDataLabel)
  {
    v25 = [(UILabel *)self->_durationAndDataLabel bottomAnchor];
    v26 = [v28 constraintEqualToAnchor:v25];
    [v26 setActive:1];
  }
  else
  {
    v25 = [(PHRecentCallDetailsItemView *)self statusLabel];
    v26 = [v25 bottomAnchor];
    v27 = [v28 constraintEqualToAnchor:v26];
    [v27 setActive:1];
  }
}

- (void)handleTTYTranscriptAction:(id)a3
{
  id v5 = [(PHRecentCallDetailsItemView *)self delegate];
  double v4 = [(PHRecentCallDetailsItemView *)self callUUID];
  [v5 presentConversationForUUID:v4];
}

- (void)addVerifiedBadge
{
  id v3 = objc_alloc((Class)UIImageView);
  double v4 = +[PHRecentCallDetailsItemView _verifiedCheckmarkImage];
  id v5 = (UIImageView *)[v3 initWithImage:v4];
  verifiedBadgeView = self->_verifiedBadgeView;
  self->_verifiedBadgeView = v5;

  double v7 = +[UIColor dynamicTertiaryLabelColor];
  [(UIImageView *)self->_verifiedBadgeView setTintColor:v7];

  [(UIImageView *)self->_verifiedBadgeView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v8) = 1148846080;
  [(UIImageView *)self->_verifiedBadgeView setContentCompressionResistancePriority:0 forAxis:v8];
  [(PHRecentCallDetailsItemView *)self addSubview:self->_verifiedBadgeView];
  v9 = [(UIImageView *)self->_verifiedBadgeView leadingAnchor];
  double v10 = [(PHRecentCallDetailsItemView *)self statusLabel];
  v11 = [v10 trailingAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11 constant:4.0];
  [v12 setActive:1];

  double v13 = [(UIImageView *)self->_verifiedBadgeView trailingAnchor];
  double v14 = [(PHRecentCallDetailsItemView *)self trailingAnchor];
  v15 = [v13 constraintLessThanOrEqualToAnchor:v14];
  [v15 setActive:1];

  id v19 = [(UIImageView *)self->_verifiedBadgeView centerYAnchor];
  v16 = [(PHRecentCallDetailsItemView *)self timeLabel];
  v17 = [v16 centerYAnchor];
  v18 = [v19 constraintEqualToAnchor:v17];
  [v18 setActive:1];
}

- (void)addRTTInfo
{
  if ((id)[(PHRecentCallDetailsItemView *)self ttyType] == (id)1) {
    +[PHRecentCallDetailsItemView _sharedTTYDirectImage];
  }
  else {
  id v33 = +[PHRecentCallDetailsItemView _sharedTTYRelayImage];
  }
  id v3 = [objc_alloc((Class)UIImageView) initWithImage:v33];
  double v4 = +[UIColor dynamicTertiaryLabelColor];
  [v3 setTintColor:v4];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v5) = 1148846080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v5];
  [(PHRecentCallDetailsItemView *)self addSubview:v3];
  id v6 = objc_alloc((Class)UIImageView);
  double v7 = +[PHRecentCallDetailsItemView _sharedDetailDisclosureImage];
  double v8 = (UIImageView *)[v6 initWithImage:v7];
  ttyDetailDisclosureImageView = self->_ttyDetailDisclosureImageView;
  self->_ttyDetailDisclosureImageView = v8;

  double v10 = +[UIColor dynamicTertiaryLabelColor];
  [(UIImageView *)self->_ttyDetailDisclosureImageView setTintColor:v10];

  [(UIImageView *)self->_ttyDetailDisclosureImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v11) = 1148846080;
  [(UIImageView *)self->_ttyDetailDisclosureImageView setContentCompressionResistancePriority:0 forAxis:v11];
  [(PHRecentCallDetailsItemView *)self addSubview:self->_ttyDetailDisclosureImageView];
  double v12 = [(UIImageView *)self->_ttyDetailDisclosureImageView centerYAnchor];
  double v13 = [(PHRecentCallDetailsItemView *)self timeLabel];
  double v14 = [v13 centerYAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [v3 centerYAnchor];
  v17 = [(PHRecentCallDetailsItemView *)self timeLabel];
  v18 = [v17 centerYAnchor];
  id v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = [v3 trailingAnchor];
  id v21 = [(UIImageView *)self->_ttyDetailDisclosureImageView leadingAnchor];
  id v22 = [v20 constraintEqualToAnchor:v21 constant:-4.0];
  [v22 setActive:1];

  id v23 = [(UIImageView *)self->_verifiedBadgeView trailingAnchor];
  v24 = [v3 leadingAnchor];
  v25 = [v23 constraintLessThanOrEqualToAnchor:v24];
  [v25 setActive:1];

  v26 = [(UILabel *)self->_statusLabel trailingAnchor];
  v27 = [v3 leadingAnchor];
  id v28 = [v26 constraintLessThanOrEqualToAnchor:v27];
  [v28 setActive:1];

  id v29 = [(UIImageView *)self->_ttyDetailDisclosureImageView trailingAnchor];
  id v30 = [(PHRecentCallDetailsItemView *)self trailingAnchor];
  objc_super v31 = [v29 constraintEqualToAnchor:v30 constant:-15.0];
  [v31 setActive:1];

  id v32 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTTYTranscriptAction:"];
  [v32 setNumberOfTapsRequired:1];
  [(PHRecentCallDetailsItemView *)self addGestureRecognizer:v32];
}

- (void)addEmergencyItemsSubview
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  emergencyItemsLabel = self->_emergencyItemsLabel;
  self->_emergencyItemsLabel = v3;

  double v5 = +[UIFont preferredCaption1Font];
  [(UILabel *)self->_emergencyItemsLabel setFont:v5];

  id v6 = +[UIColor dynamicSecondaryLabelColor];
  [(UILabel *)self->_emergencyItemsLabel setTextColor:v6];

  double v7 = [(PHRecentCallDetailsItemView *)self emergencyItemsText];
  [(UILabel *)self->_emergencyItemsLabel setText:v7];

  [(UILabel *)self->_emergencyItemsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_emergencyItemsLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_emergencyItemsLabel setNumberOfLines:0];
  [(PHRecentCallDetailsItemView *)self addSubview:self->_emergencyItemsLabel];
  double v8 = [(UILabel *)self->_emergencyItemsLabel leadingAnchor];
  v9 = [(UILabel *)self->_statusLabel leadingAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  double v11 = [(UILabel *)self->_emergencyItemsLabel trailingAnchor];
  double v12 = [(PHRecentCallDetailsItemView *)self trailingAnchor];
  double v13 = [v11 constraintLessThanOrEqualToAnchor:v12];
  [v13 setActive:1];

  id v16 = [(UILabel *)self->_emergencyItemsLabel topAnchor];
  double v14 = [(UILabel *)self->_statusLabel bottomAnchor];
  v15 = [v16 constraintEqualToAnchor:v14 constant:4.0];
  [v15 setActive:1];
}

- (void)addDurationAndDataSubview
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  durationAndDataLabel = self->_durationAndDataLabel;
  self->_durationAndDataLabel = v3;

  double v5 = +[UIFont preferredCaption1Font];
  [(UILabel *)self->_durationAndDataLabel setFont:v5];

  id v6 = +[UIColor dynamicSecondaryLabelColor];
  [(UILabel *)self->_durationAndDataLabel setTextColor:v6];

  double v7 = [(PHRecentCallDetailsItemView *)self durationAndDataText];
  [(UILabel *)self->_durationAndDataLabel setText:v7];

  [(UILabel *)self->_durationAndDataLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_durationAndDataLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_durationAndDataLabel setNumberOfLines:0];
  [(PHRecentCallDetailsItemView *)self addSubview:self->_durationAndDataLabel];
  uint64_t v8 = 48;
  if (self->_emergencyItemsLabel)
  {
    v9 = [(UILabel *)self->_durationAndDataLabel leadingAnchor];
  }
  else
  {
    uint64_t v8 = 128;
    screenSharingLabel = self->_screenSharingLabel;
    v9 = [(UILabel *)self->_durationAndDataLabel leadingAnchor];
    if (!screenSharingLabel) {
      uint64_t v8 = 64;
    }
  }
  double v11 = [*(id *)((char *)&self->super.super.super.isa + v8) leadingAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  double v13 = [(UILabel *)self->_durationAndDataLabel topAnchor];
  double v14 = [*(id *)((char *)&self->super.super.super.isa + v8) bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:4.0];
  [v15 setActive:1];

  id v18 = [(UILabel *)self->_durationAndDataLabel trailingAnchor];
  id v16 = [(PHRecentCallDetailsItemView *)self trailingAnchor];
  v17 = [v18 constraintLessThanOrEqualToAnchor:v16];
  [v17 setActive:1];
}

- (void)addScreenSharingTypeSubview
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  screenSharingLabel = self->_screenSharingLabel;
  self->_screenSharingLabel = v3;

  double v5 = +[UIFont preferredCaption1Font];
  [(UILabel *)self->_screenSharingLabel setFont:v5];

  id v6 = +[UIColor dynamicSecondaryLabelColor];
  [(UILabel *)self->_screenSharingLabel setTextColor:v6];

  double v7 = [(PHRecentCallDetailsItemView *)self screenSharingTypeText];
  [(UILabel *)self->_screenSharingLabel setText:v7];

  [(UILabel *)self->_screenSharingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_screenSharingLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_screenSharingLabel setNumberOfLines:2];
  [(PHRecentCallDetailsItemView *)self addSubview:self->_screenSharingLabel];
  uint64_t v8 = 32;
  durationAndDataLabel = self->_durationAndDataLabel;
  double v10 = [(UILabel *)self->_screenSharingLabel leadingAnchor];
  if (!durationAndDataLabel) {
    uint64_t v8 = 64;
  }
  double v11 = [*(id *)((char *)&self->super.super.super.isa + v8) leadingAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  double v13 = [(UILabel *)self->_screenSharingLabel topAnchor];
  double v14 = [*(id *)((char *)&self->super.super.super.isa + v8) bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:4.0];
  [v15 setActive:1];

  id v18 = [(UILabel *)self->_screenSharingLabel trailingAnchor];
  id v16 = [(PHRecentCallDetailsItemView *)self trailingAnchor];
  v17 = [v18 constraintLessThanOrEqualToAnchor:v16];
  [v17 setActive:1];
}

- (PHRecentCallDetailsItemViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHRecentCallDetailsItemViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
}

- (UILabel)durationAndDataLabel
{
  return self->_durationAndDataLabel;
}

- (void)setDurationAndDataLabel:(id)a3
{
}

- (NSString)durationAndDataText
{
  return self->_durationAndDataText;
}

- (void)setDurationAndDataText:(id)a3
{
}

- (UILabel)emergencyItemsLabel
{
  return self->_emergencyItemsLabel;
}

- (void)setEmergencyItemsLabel:(id)a3
{
}

- (NSString)emergencyItemsText
{
  return self->_emergencyItemsText;
}

- (void)setEmergencyItemsText:(id)a3
{
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (NSString)timeText
{
  return self->_timeText;
}

- (void)setTimeText:(id)a3
{
}

- (UIImageView)ttyDetailDisclosureImageView
{
  return self->_ttyDetailDisclosureImageView;
}

- (void)setTtyDetailDisclosureImageView:(id)a3
{
}

- (UIImageView)verifiedBadgeView
{
  return self->_verifiedBadgeView;
}

- (void)setVerifiedBadgeView:(id)a3
{
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (void)setTtyType:(int64_t)a3
{
  self->_ttyType = a3;
}

- (NSString)screenSharingTypeText
{
  return self->_screenSharingTypeText;
}

- (UILabel)screenSharingLabel
{
  return self->_screenSharingLabel;
}

- (void)setScreenSharingLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenSharingLabel, 0);
  objc_storeStrong((id *)&self->_screenSharingTypeText, 0);
  objc_storeStrong((id *)&self->_verifiedBadgeView, 0);
  objc_storeStrong((id *)&self->_ttyDetailDisclosureImageView, 0);
  objc_storeStrong((id *)&self->_timeText, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_emergencyItemsText, 0);
  objc_storeStrong((id *)&self->_emergencyItemsLabel, 0);
  objc_storeStrong((id *)&self->_durationAndDataText, 0);
  objc_storeStrong((id *)&self->_durationAndDataLabel, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end