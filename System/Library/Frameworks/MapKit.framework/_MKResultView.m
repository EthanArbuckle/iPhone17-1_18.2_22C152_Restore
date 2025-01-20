@interface _MKResultView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)alwaysUsesBusinessLayout;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)selected;
- (BOOL)showsDistance;
- (BOOL)useSpotlightVibrancy;
- (CGSize)_imageSize;
- (CGSize)intrinsicContentSize;
- (CLLocation)referenceLocation;
- (MKMapItem)mapItem;
- (NSArray)mapItems;
- (NSString)primaryLabelText;
- (NSString)secondaryLabelText;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (UIImageView)imageView;
- (_MKResultView)init;
- (_MKResultView)initWithFrame:(CGRect)a3;
- (_MKResultView)initWithFrame:(CGRect)a3 highlightsOnTouch:(BOOL)a4;
- (_MKResultView)initWithMapItem:(id)a3;
- (_MKResultView)initWithMapItems:(id)a3 primaryLabelText:(id)a4;
- (_MKResultViewDelegate)delegate;
- (_MKUILabel)nameLabel;
- (_MKUILabel)secondaryLabel;
- (_MKUILabel)tertiaryLabel;
- (double)_expectedHeightForLabels;
- (double)fallbackDistance;
- (double)preferredHeight;
- (id)_defaultPrimaryLabel;
- (id)_defaultSecondaryCategoryLabel;
- (id)_labelWithFontSize:(double)a3;
- (int)iconFormat;
- (unint64_t)_maxNameLengthForEndingString:(id)a3;
- (unint64_t)_maxSecondaryStringLengthForEndingString:(id)a3;
- (void)_cancelReferenceLocationTimer;
- (void)_commonInit;
- (void)_fireReferenceLocationTimer;
- (void)_locationApprovalDidChange;
- (void)_updateColors;
- (void)_updateFontSizing;
- (void)_updateLayoutForAddress;
- (void)_updateLayoutForBusinessOrCategory;
- (void)_updatePrimaryColors;
- (void)_updateSecondaryColors;
- (void)addLabelIfNecessary:(id)a3;
- (void)dealloc;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)setAlwaysUsesBusinessLayout:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFallbackDistance:(double)a3;
- (void)setIconFormat:(int)a3;
- (void)setImageView:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setMapItems:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNeedsUpdateConstraints;
- (void)setPrimaryLabelText:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setReferenceLocation:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSecondaryLabelText:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowsDistance:(BOOL)a3;
- (void)setTertiaryLabel:(id)a3;
- (void)setUseSpotlightVibrancy:(BOOL)a3;
- (void)updateConstraints;
- (void)updateImageView;
- (void)updateLayout;
- (void)updateSubviews;
@end

@implementation _MKResultView

- (_MKResultView)init
{
  v5.receiver = self;
  v5.super_class = (Class)_MKResultView;
  v2 = [(_MKResultView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_MKResultView *)v2 _commonInit];
  }
  return v3;
}

- (_MKResultView)initWithMapItem:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKResultView;
  objc_super v5 = -[_MKResultView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    [(_MKResultView *)v5 _commonInit];
    v10[0] = v4;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(_MKResultView *)v6 setMapItems:v7];
  }
  return v6;
}

- (_MKResultView)initWithMapItems:(id)a3 primaryLabelText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_MKResultView;
  v8 = -[_MKResultView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v9 = v8;
  if (v8)
  {
    [(_MKResultView *)v8 _commonInit];
    [(_MKResultView *)v9 setMapItems:v6];
    [(_MKResultView *)v9 setPrimaryLabelText:v7];
  }

  return v9;
}

- (_MKResultView)initWithFrame:(CGRect)a3
{
  return -[_MKResultView initWithFrame:highlightsOnTouch:](self, "initWithFrame:highlightsOnTouch:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_MKResultView)initWithFrame:(CGRect)a3 highlightsOnTouch:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_MKResultView;
  id v4 = -[_MKResultView initWithFrame:](&v7, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v5 = v4;
  if (v4) {
    [(_MKResultView *)v4 _commonInit];
  }
  return v5;
}

- (void)_commonInit
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];

  id v17 = (id)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_handleTap_];
  -[_MKResultView addGestureRecognizer:](self, "addGestureRecognizer:");
  id v4 = [MEMORY[0x1E4F428B8] clearColor];
  [(_MKResultView *)self setBackgroundColor:v4];

  [(_MKResultView *)self setOpaque:0];
  [(_MKResultView *)self setIconFormat:2];
  [(_MKResultView *)self _updateFontSizing];
  objc_super v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.Spotlight"];

  if (v7)
  {
    [(_MKResultView *)self setUseSpotlightVibrancy:1];
    v8 = [(_MKResultView *)self layer];
    [v8 setAllowsGroupBlending:0];
  }
  objc_super v9 = [MEMORY[0x1E4F428B8] blackColor];
  [(_MKResultView *)self setPrimaryTextColor:v9];

  v10 = [MEMORY[0x1E4F428B8] colorWithWhite:0.400000006 alpha:1.0];
  [(_MKResultView *)self setSecondaryTextColor:v10];

  objc_super v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel__locationApprovalDidChange name:MKLocationManagerApprovalDidChangeNotification object:0];

  [(_MKResultView *)self setShowsDistance:1];
  v12 = [MEMORY[0x1E4F1CA48] array];
  resultConstraints = self->_resultConstraints;
  self->_resultConstraints = v12;

  v14 = [(_MKResultView *)self nameLabel];
  [(_MKResultView *)self addSubview:v14];

  v15 = [(_MKResultView *)self secondaryLabel];
  [(_MKResultView *)self addSubview:v15];

  v16 = [(_MKResultView *)self tertiaryLabel];
  [(_MKResultView *)self addSubview:v16];
}

- (id)_labelWithFontSize:(double)a3
{
  id v4 = objc_alloc_init(_MKUILabel);
  objc_super v5 = [MEMORY[0x1E4F42A30] systemFontOfSize:a3];
  [(_MKUILabel *)v4 setFont:v5];

  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  [(_MKUILabel *)v4 setBackgroundColor:v6];

  [(_MKUILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1132068864;
  [(UIView *)v4 _mapkit_setContentCompressionResistancePriority:0 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [(UIView *)v4 _mapkit_setContentCompressionResistancePriority:1 forAxis:v8];

  return v4;
}

- (_MKUILabel)nameLabel
{
  nameLabel = self->_nameLabel;
  if (!nameLabel)
  {
    id v4 = [(_MKResultView *)self _labelWithFontSize:18.0];
    objc_super v5 = self->_nameLabel;
    self->_nameLabel = v4;

    nameLabel = self->_nameLabel;
  }

  return nameLabel;
}

- (_MKUILabel)secondaryLabel
{
  secondaryLabel = self->_secondaryLabel;
  if (!secondaryLabel)
  {
    id v4 = [(_MKResultView *)self _labelWithFontSize:13.0];
    objc_super v5 = self->_secondaryLabel;
    self->_secondaryLabel = v4;

    secondaryLabel = self->_secondaryLabel;
  }

  return secondaryLabel;
}

- (_MKUILabel)tertiaryLabel
{
  tertiaryLabel = self->_tertiaryLabel;
  if (!tertiaryLabel)
  {
    id v4 = [(_MKResultView *)self _labelWithFontSize:13.0];
    objc_super v5 = self->_tertiaryLabel;
    self->_tertiaryLabel = v4;

    tertiaryLabel = self->_tertiaryLabel;
  }

  return tertiaryLabel;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(_MKResultView *)self _updateColors];
  }
}

- (BOOL)showsDistance
{
  return self->_showsDistance;
}

- (void)setShowsDistance:(BOOL)a3
{
  if (self->_showsDistance != a3)
  {
    self->_showsDistance = a3;
    locManager = self->_locManager;
    if (a3)
    {
      if (locManager)
      {
        [(MKLocationManager *)locManager startLocationUpdateWithObserver:self];
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __34___MKResultView_setShowsDistance___block_invoke;
        block[3] = &unk_1E54B8188;
        block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    else
    {
      [(MKLocationManager *)locManager stopLocationUpdateWithObserver:self];
    }
  }
}

- (void)_updateColors
{
  [(_MKResultView *)self _updatePrimaryColors];

  [(_MKResultView *)self _updateSecondaryColors];
}

- (void)_updatePrimaryColors
{
  if (self->_selected) {
    [MEMORY[0x1E4F428B8] whiteColor];
  }
  else {
  id v4 = [(_MKResultView *)self primaryTextColor];
  }
  v3 = [(_MKResultView *)self nameLabel];
  [v3 setTextColor:v4];
}

- (void)_updateSecondaryColors
{
  if (self->_selected)
  {
    id v7 = [MEMORY[0x1E4F428B8] whiteColor];
    v3 = [(_MKResultView *)self secondaryLabel];
    [v3 setTextColor:v7];
  }
  else
  {
    id v4 = [(_MKResultView *)self secondaryTextColor];
    objc_super v5 = [(_MKResultView *)self secondaryLabel];
    [v5 setTextColor:v4];

    id v7 = [(_MKResultView *)self secondaryTextColor];
  }
  id v6 = [(_MKResultView *)self tertiaryLabel];
  [v6 setTextColor:v7];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43788] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:MKLocationManagerApprovalDidChangeNotification object:0];

  [(MKLocationManager *)self->_locManager stopLocationUpdateWithObserver:self];
  v5.receiver = self;
  v5.super_class = (Class)_MKResultView;
  [(_MKResultView *)&v5 dealloc];
}

- (void)_updateFontSizing
{
  v3 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  id v4 = [(_MKResultView *)self nameLabel];
  [v4 setFont:v3];

  uint64_t v5 = *MEMORY[0x1E4F43880];
  id v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
  id v7 = [(_MKResultView *)self secondaryLabel];
  [v7 setFont:v6];

  id v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v5];
  double v8 = [(_MKResultView *)self tertiaryLabel];
  [v8 setFont:v9];
}

- (void)setIconFormat:(int)a3
{
  if (self->_iconFormat != a3)
  {
    self->_iconFormat = a3;
    [(_MKResultView *)self updateLayout];
  }
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)updateImageView
{
  v3 = +[MKSystemController sharedInstance];
  [v3 screenScale];
  double v5 = v4;

  id v6 = objc_alloc(MEMORY[0x1E4F42AA0]);
  id v9 = [(_MKResultView *)self mapItem];
  id v7 = +[MKIconManager imageForMapItem:v9 size:4 forScale:[(_MKResultView *)self iconFormat] format:v5];
  double v8 = (void *)[v6 initWithImage:v7];
  [(_MKResultView *)self setImageView:v8];
}

- (void)setNeedsUpdateConstraints
{
  v2.receiver = self;
  v2.super_class = (Class)_MKResultView;
  [(_MKResultView *)&v2 setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v103[4] = *MEMORY[0x1E4F143B8];
  [(_MKResultView *)self removeConstraints:self->_resultConstraints];
  [(NSMutableArray *)self->_resultConstraints removeAllObjects];
  v3 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v4 = [v3 userInterfaceLayoutDirection];

  uint64_t v5 = 1;
  if (v4 == 1) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v95 = v6;
  if (v4 != 1) {
    uint64_t v5 = 2;
  }
  uint64_t v92 = v4;
  uint64_t v93 = v5;
  [(_MKResultView *)self _imageSize];
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(_MKResultView *)self secondaryLabel];
  v12 = [v11 attributedText];
  uint64_t v96 = [v12 length];

  v13 = [(_MKResultView *)self tertiaryLabel];
  v14 = [v13 text];
  uint64_t v94 = [v14 length];

  resultConstraints = self->_resultConstraints;
  v16 = (void *)MEMORY[0x1E4F28DC8];
  id v17 = [(_MKResultView *)self nameLabel];
  v18 = [v16 constraintWithItem:v17 attribute:7 relatedBy:-1 toItem:self attribute:7 multiplier:1.0 constant:-(v8 + 45.0)];
  [(NSMutableArray *)resultConstraints addObject:v18];

  int layoutType = self->_layoutType;
  if (layoutType != 2)
  {
    if (layoutType == 1)
    {
      v48 = self->_resultConstraints;
      v59 = (void *)MEMORY[0x1E4F28DC8];
      v20 = [(_MKResultView *)self nameLabel];
      uint64_t v60 = [(_MKResultView *)self imageView];
      v50 = (void *)v60;
      if (v60) {
        v56 = (_MKResultView *)v60;
      }
      else {
        v56 = self;
      }
      double v51 = 1.0;
      double v58 = 0.0;
      v52 = v59;
      v53 = v20;
      uint64_t v54 = 10;
      uint64_t v55 = 0;
      uint64_t v57 = 10;
      goto LABEL_19;
    }
    if (layoutType) {
      goto LABEL_21;
    }
  }
  v20 = [(_MKResultView *)self nameLabel];
  if (v96)
  {
    v21 = self->_resultConstraints;
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(_MKResultView *)self secondaryLabel];
    v24 = [v22 constraintWithItem:v23 attribute:7 relatedBy:-1 toItem:self attribute:7 multiplier:1.0 constant:-(v8 + 45.0)];
    [(NSMutableArray *)v21 addObject:v24];

    uint64_t v25 = [(_MKResultView *)self secondaryLabel];

    v20 = (void *)v25;
  }
  v26 = self->_resultConstraints;
  v27 = (void *)MEMORY[0x1E4F28DC8];
  v28 = [(_MKResultView *)self nameLabel];
  v29 = [(_MKResultView *)self nameLabel];
  v30 = [v29 font];
  [v30 _scaledValueForValue:24.0];
  v32 = [v27 constraintWithItem:v28 attribute:12 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:round(v31)];
  [(NSMutableArray *)v26 addObject:v32];

  if (v96)
  {
    v33 = self->_resultConstraints;
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(_MKResultView *)self secondaryLabel];
    v36 = [(_MKResultView *)self nameLabel];
    v37 = [(_MKResultView *)self secondaryLabel];
    v38 = [v37 font];
    [v38 _scaledValueForValue:20.0];
    v40 = [v34 constraintWithItem:v35 attribute:12 relatedBy:0 toItem:v36 attribute:11 multiplier:1.0 constant:round(v39)];
    [(NSMutableArray *)v33 addObject:v40];
  }
  if (!v94) {
    goto LABEL_20;
  }
  v41 = self->_resultConstraints;
  v42 = (void *)MEMORY[0x1E4F28DC8];
  v43 = [(_MKResultView *)self tertiaryLabel];
  v44 = [(_MKResultView *)self tertiaryLabel];
  v45 = [v44 font];
  [v45 _scaledValueForValue:17.0];
  v47 = [v42 constraintWithItem:v43 attribute:11 relatedBy:0 toItem:v20 attribute:11 multiplier:1.0 constant:round(v46)];
  [(NSMutableArray *)v41 addObject:v47];

  v48 = self->_resultConstraints;
  v49 = (void *)MEMORY[0x1E4F28DC8];
  v50 = [(_MKResultView *)self tertiaryLabel];
  double v51 = 1.0;
  v52 = v49;
  v53 = v50;
  uint64_t v54 = 7;
  uint64_t v55 = -1;
  v56 = self;
  uint64_t v57 = 7;
  double v58 = -(v8 + 45.0);
LABEL_19:
  v61 = [v52 constraintWithItem:v53 attribute:v54 relatedBy:v55 toItem:v56 attribute:v57 multiplier:v51 constant:v58];
  [(NSMutableArray *)v48 addObject:v61];

LABEL_20:
LABEL_21:
  v62 = [(_MKResultView *)self imageView];

  if (v62)
  {
    v102[0] = @"LabelsLeftMargin";
    v102[1] = @"ImageTopInset";
    v103[0] = &unk_1ED97E030;
    v103[1] = &unk_1ED97E040;
    v102[2] = @"imageWidth";
    v63 = [NSNumber numberWithDouble:v8];
    v103[2] = v63;
    v102[3] = @"imageHeight";
    v64 = [NSNumber numberWithDouble:v10];
    v103[3] = v64;
    v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:4];

    v66 = self->_resultConstraints;
    v67 = (void *)MEMORY[0x1E4F28DC8];
    v100 = @"imageView";
    v68 = [(_MKResultView *)self imageView];
    v101 = v68;
    v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
    v70 = [v67 constraintsWithVisualFormat:@"H:|-LabelsLeftMargin-[imageView(==imageWidth)]" options:0 metrics:v65 views:v69];
    [(NSMutableArray *)v66 addObjectsFromArray:v70];

    v71 = self->_resultConstraints;
    v72 = (void *)MEMORY[0x1E4F28DC8];
    v98 = @"imageView";
    v73 = [(_MKResultView *)self imageView];
    v99 = v73;
    v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    v75 = [v72 constraintsWithVisualFormat:@"V:|-ImageTopInset-[imageView(==imageHeight)]" options:0 metrics:v65 views:v74];
    [(NSMutableArray *)v71 addObjectsFromArray:v75];

    v76 = self->_resultConstraints;
    v77 = (void *)MEMORY[0x1E4F28DC8];
    v78 = [(_MKResultView *)self nameLabel];
    v79 = [(_MKResultView *)self imageView];
    if (v92 == 1) {
      double v80 = -15.0;
    }
    else {
      double v80 = 15.0;
    }
    v81 = [v77 constraintWithItem:v78 attribute:v95 relatedBy:0 toItem:v79 attribute:v93 multiplier:1.0 constant:v80];
    [(NSMutableArray *)v76 addObject:v81];

    if ((self->_layoutType | 2) == 2)
    {
      if (v96)
      {
        v82 = self->_resultConstraints;
        v83 = (void *)MEMORY[0x1E4F28DC8];
        v84 = [(_MKResultView *)self secondaryLabel];
        v85 = [(_MKResultView *)self imageView];
        v86 = [v83 constraintWithItem:v84 attribute:v95 relatedBy:0 toItem:v85 attribute:v93 multiplier:1.0 constant:v80];
        [(NSMutableArray *)v82 addObject:v86];
      }
      if (v94)
      {
        v87 = self->_resultConstraints;
        v88 = (void *)MEMORY[0x1E4F28DC8];
        v89 = [(_MKResultView *)self tertiaryLabel];
        v90 = [(_MKResultView *)self imageView];
        v91 = [v88 constraintWithItem:v89 attribute:v95 relatedBy:0 toItem:v90 attribute:v93 multiplier:1.0 constant:v80];
        [(NSMutableArray *)v87 addObject:v91];
      }
    }
  }
  [(_MKResultView *)self addConstraints:self->_resultConstraints];
  v97.receiver = self;
  v97.super_class = (Class)_MKResultView;
  [(_MKResultView *)&v97 updateConstraints];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_MKResultView;
  [(_MKResultView *)&v6 layoutSubviews];
  if ([(NSArray *)self->_mapItems count])
  {
    v3 = [(_MKResultView *)self nameLabel];
    uint64_t v4 = [v3 text];
    uint64_t v5 = [v4 length];

    if (!v5) {
      [(_MKResultView *)self updateSubviews];
    }
  }
}

- (void)setPrimaryTextColor:(id)a3
{
  id v6 = a3;
  if ((-[UIColor isEqual:](self->_primaryTextColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryTextColor, a3);
    uint64_t v5 = [(_MKResultView *)self nameLabel];
    [v5 setTextColor:v6];
  }
}

- (void)setSecondaryTextColor:(id)a3
{
  id v7 = a3;
  if ((-[UIColor isEqual:](self->_secondaryTextColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryTextColor, a3);
    uint64_t v5 = [(_MKResultView *)self secondaryLabel];
    [v5 setTextColor:v7];

    id v6 = [(_MKResultView *)self tertiaryLabel];
    [v6 setTextColor:v7];
  }
}

- (CGSize)_imageSize
{
  v3 = [(_MKResultView *)self imageView];
  uint64_t v4 = [v3 image];
  if (v4)
  {
    uint64_t v5 = [(_MKResultView *)self imageView];
    id v6 = [v5 image];
    [v6 size];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0x404E000000000000;
    uint64_t v10 = 0x404E000000000000;
  }

  double v11 = *(double *)&v8;
  double v12 = *(double *)&v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)preferredHeight
{
  [(_MKResultView *)self _imageSize];
  double v4 = v3 + 20.0;
  int layoutType = self->_layoutType;
  if (layoutType != 2)
  {
    if (layoutType == 1) {
      return v4;
    }
    if (layoutType) {
      return 0.0;
    }
  }
  [(_MKResultView *)self _expectedHeightForLabels];
  double v7 = v6 + 10.0;
  if (v7 > v4) {
    return v7;
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)_MKResultView;
  [(_MKResultView *)&v13 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(_MKResultView *)self superview];

  if (v7)
  {
    uint64_t v8 = [(_MKResultView *)self superview];
    [v8 bounds];
    double v4 = v9;

    [(_MKResultView *)self preferredHeight];
    double v6 = v10;
  }
  double v11 = v4;
  double v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)addLabelIfNecessary:(id)a3
{
  double v12 = (_MKUILabel *)a3;
  double v4 = self;
  double v5 = v12;
  double v6 = v4;
  if (v4->_secondaryLabel == v12 || v4->_tertiaryLabel == v12)
  {
    BOOL v7 = [(_MKResultView *)v4 useSpotlightVibrancy];
    double v5 = v12;
    if (v7)
    {
      [(_MKUILabel *)v12 setAlpha:0.375];
      uint64_t v8 = *MEMORY[0x1E4F3A250];
      double v9 = [(_MKUILabel *)v12 layer];
      [v9 setCompositingFilter:v8];

      double v5 = v12;
    }
  }
  double v10 = [(_MKUILabel *)v5 text];
  uint64_t v11 = [v10 length];

  if (v11) {
    [(_MKResultView *)v6 addSubview:v12];
  }
}

- (void)_updateLayoutForBusinessOrCategory
{
  double v3 = [(_MKResultView *)self secondaryLabel];
  [(_MKResultView *)self addLabelIfNecessary:v3];

  double v4 = [(_MKResultView *)self tertiaryLabel];
  [(_MKResultView *)self addLabelIfNecessary:v4];

  id v5 = [(_MKResultView *)self nameLabel];
  [v5 setNumberOfLines:1];
}

- (void)_updateLayoutForAddress
{
  double v3 = [(_MKResultView *)self secondaryLabel];
  [v3 removeFromSuperview];

  id v4 = [(_MKResultView *)self tertiaryLabel];
  [v4 removeFromSuperview];
}

- (id)_defaultPrimaryLabel
{
  int layoutType = self->_layoutType;
  if (layoutType == 2)
  {
    double v6 = 0;
  }
  else
  {
    if (layoutType == 1)
    {
      id v4 = [(_MKResultView *)self mapItem];
      uint64_t v5 = [v4 _addressFormattedAsSinglelineAddress];
    }
    else
    {
      BOOL v7 = [(_MKResultView *)self mapItem];
      int v8 = [v7 _hasTransitDisplayName];

      double v9 = [(_MKResultView *)self mapItem];
      id v4 = v9;
      if (v8) {
        [v9 _transitDisplayName];
      }
      else {
      uint64_t v5 = [v9 name];
      }
    }
    double v6 = (void *)v5;
  }

  return v6;
}

- (unint64_t)_maxSecondaryStringLengthForEndingString:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"%@%@", @"W", a3];
  uint64_t v23 = *MEMORY[0x1E4F42508];
  uint64_t v5 = [(_MKResultView *)self secondaryLabel];
  double v6 = [v5 font];
  v24[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  id v8 = objc_alloc_init(MEMORY[0x1E4F42688]);
  double v9 = [(_MKResultView *)self secondaryLabel];
  [v9 minimumScaleFactor];
  objc_msgSend(v8, "setMinimumScaleFactor:");

  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v7, v8, 1.79769313e308, 1.79769313e308);
  double v11 = v10;
  double v12 = [(_MKResultView *)self secondaryLabel];
  [v12 bounds];
  double v14 = v13 + v13;

  if (v11 <= v14)
  {
    do
    {
      v15 = [NSString stringWithFormat:@"%@%@", @"W", v4];

      objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 0, v7, v8, 1.79769313e308, 1.79769313e308);
      double v17 = v16;
      v18 = [(_MKResultView *)self secondaryLabel];
      [v18 bounds];
      double v20 = v19 + v19;

      id v4 = v15;
    }
    while (v17 <= v20);
  }
  else
  {
    v15 = v4;
  }
  unint64_t v21 = [v15 length];

  return v21;
}

- (unint64_t)_maxNameLengthForEndingString:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_MKResultView *)self _maxSecondaryStringLengthForEndingString:v4];
  uint64_t v6 = [v4 length];

  return v5 - v6;
}

- (id)_defaultSecondaryCategoryLabel
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSArray *)self->_mapItems count];
  uint64_t v4 = _MKLocalizedStringFromThisBundle(@"MKRESULTVIEW_AND_X_OTHERS");
  _MKLocalizedStringFromThisBundle(@"MKRESULTVIEW_SEPARATOR_COMMA");
  v27 = v26 = (void *)v4;
  unint64_t v5 = [(_MKResultView *)self _maxNameLengthForEndingString:v4];
  uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithCapacity:v3];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_mapItems;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    double v9 = 0;
    uint64_t v10 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        double v12 = [*(id *)(*((void *)&v29 + 1) + 8 * i) name];
        if (([v6 containsObject:v12] & 1) == 0)
        {
          if ([v9 length])
          {
            double v13 = NSString;
            uint64_t v14 = _MKLocalizedStringFromThisBundle(@"MKRESULTVIEW_NAME_STRING");
            objc_msgSend(v13, "stringWithFormat:", v14, v9, v27, v12);
            id v15 = (id)objc_claimAutoreleasedReturnValue();

            double v9 = (void *)v14;
          }
          else
          {
            id v15 = v12;
          }

          --v3;
          [v6 addObject:v12];
          double v9 = v15;
        }
        unint64_t v16 = [v9 length];

        if (v16 > v5 && v3 >= 3)
        {

          double v17 = v26;
          goto LABEL_19;
        }
      }
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v9 = 0;
  }

  double v17 = v26;
  if (v3 >= 3)
  {
LABEL_19:
    v18 = NSString;
    double v19 = [NSNumber numberWithUnsignedInteger:v3];
    double v20 = objc_msgSend(v18, "stringWithFormat:", v17, v19);

    unint64_t v21 = NSString;
    v22 = _MKLocalizedStringFromThisBundle(@"MKRESULTVIEW_NAMES_OTHERS_STRING");
    uint64_t v23 = objc_msgSend(v21, "stringWithFormat:", v22, v9, v20);

    double v9 = (void *)v23;
  }
  id v24 = v9;

  return v24;
}

- (double)_expectedHeightForLabels
{
  uint64_t v4 = [(_MKResultView *)self nameLabel];
  unint64_t v5 = [v4 font];
  [v5 _scaledValueForValue:24.0];
  double v7 = round(v6) + 0.0;

  uint64_t v8 = [(_MKResultView *)self secondaryLabel];
  double v9 = [v8 attributedText];
  if ([v9 length])
  {
    objc_super v2 = [(_MKResultView *)self secondaryLabel];
    uint64_t v10 = [v2 font];
    [v10 _scaledValueForValue:20.0];
    double v7 = v7 + round(v11);
  }
  NSUInteger v12 = [(NSArray *)self->_mapItems count];
  if (v12 >= 2)
  {
    uint64_t v8 = [(_MKResultView *)self secondaryLabel];
    objc_super v2 = [v8 attributedText];
    if ([v2 length])
    {

LABEL_9:
      unint64_t v16 = [(_MKResultView *)self tertiaryLabel];
      double v17 = [v16 font];
      [v17 _scaledValueForValue:17.0];
      double v7 = v7 + round(v18);

      return v7;
    }
  }
  double v13 = [(_MKResultView *)self tertiaryLabel];
  uint64_t v14 = [v13 text];
  uint64_t v15 = [v14 length];

  if (v12 >= 2)
  {
  }
  if (v15) {
    goto LABEL_9;
  }
  return v7;
}

- (void)updateSubviews
{
  int layoutType = self->_layoutType;
  uint64_t v4 = [(_MKResultView *)self mapItem];
  unint64_t v5 = [(_MKResultView *)self _defaultPrimaryLabel];
  unint64_t v6 = 0x1E4F28000uLL;
  if (layoutType == 2)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    NSUInteger v12 = [(_MKResultView *)self _defaultSecondaryCategoryLabel];
    uint64_t v10 = (void *)[v11 initWithString:v12];
    id v13 = 0;
  }
  else
  {
    if ([v4 _hasTransitLabels])
    {
      double v7 = [[MKTransitInfoLabelView alloc] initWithMapItem:v4];
      uint64_t v8 = [(_MKResultView *)self secondaryLabel];
      double v9 = [v8 font];
      [(MKTransitInfoLabelView *)v7 setFont:v9];

      uint64_t v10 = [(MKTransitInfoLabelView *)v7 attributedText];
    }
    else
    {
      double v7 = [v4 _addressFormattedAsShortenedAddress];
      if (v7)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v15 = [v4 _addressFormattedAsShortenedAddress];
        uint64_t v10 = (void *)[v14 initWithString:v15];
      }
      else
      {
        uint64_t v10 = 0;
      }
    }

    if (![v4 _hasMUID])
    {
      id v13 = 0;
      goto LABEL_14;
    }
    unint64_t v16 = v5;
    NSUInteger v12 = [[_MKLocalizedHoursBuilder alloc] initWithMapItem:v4 localizedHoursStringOptions:0];
    double v17 = NSString;
    double v18 = _MKLocalizedStringFromThisBundle(@"Hours %@");
    double v19 = [(_MKLocalizedHoursBuilder *)v12 localizedOperatingHours];
    double v20 = objc_msgSend(v17, "stringWithFormat:", v18, v19);

    id v13 = 0;
    if ([v4 _hasBusinessHours]) {
      id v13 = v20;
    }

    unint64_t v5 = v16;
    unint64_t v6 = 0x1E4F28000;
  }

LABEL_14:
  if ([(MKLocationManager *)self->_locManager isLocationServicesAvailable]) {
    BOOL v21 = layoutType == 2;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21 || ![(_MKResultView *)self showsDistance]) {
    goto LABEL_23;
  }
  v22 = [(_MKResultView *)self referenceLocation];

  if (v22)
  {
    uint64_t v23 = [v4 placemark];
    id v24 = [v23 location];

    uint64_t v25 = [(_MKResultView *)self referenceLocation];
    [v24 distanceFromLocation:v25];
    double v27 = v26;

    v28 = objc_msgSend(NSString, "_mapkit_localizedDistanceStringWithMeters:abbreviated:", v27, 0);

    goto LABEL_24;
  }
  [(_MKResultView *)self fallbackDistance];
  if (v29 <= 0.0)
  {
LABEL_23:
    v28 = 0;
  }
  else
  {
    long long v30 = NSString;
    [(_MKResultView *)self fallbackDistance];
    v28 = objc_msgSend(v30, "_mapkit_localizedDistanceStringWithMeters:abbreviated:", v31, 0);
  }
LABEL_24:
  primaryLabelText = v5;
  if ([(NSString *)self->_primaryLabelText length]) {
    primaryLabelText = self->_primaryLabelText;
  }
  v33 = [(_MKResultView *)self nameLabel];
  [v33 setText:primaryLabelText];

  if ([(NSString *)self->_secondaryLabelText length])
  {
    uint64_t v34 = (void *)[objc_alloc(*(Class *)(v6 + 2840)) initWithString:self->_secondaryLabelText];
    v35 = [(_MKResultView *)self secondaryLabel];
    [v35 setAttributedText:v34];
  }
  else if (layoutType != 2 && -[_MKResultView showsDistance](self, "showsDistance") && [v28 length])
  {
    if ([v10 length])
    {
      v63 = v5;
      v36 = NSString;
      v37 = _MKLocalizedStringFromThisBundle(@"RESULTVIEW_CITY_DISTANCE_TEXT");
      v38 = [v10 string];
      double v39 = objc_msgSend(v36, "stringWithFormat:", v37, v28, v38);

      v40 = [v10 string];
      uint64_t v41 = [v39 rangeOfString:v40];
      unint64_t v43 = v42;

      v62 = v39;
      v44 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v39];
      if (v43)
      {
        unint64_t v45 = 0;
        do
        {
          uint64_t v64 = 0;
          uint64_t v65 = 0;
          double v46 = [v10 attributesAtIndex:v45 effectiveRange:&v64];
          objc_msgSend(v44, "addAttributes:range:", v46, v45 + v41, v65);
          v45 += v65;
        }
        while (v45 < v43);
      }
      v47 = [(_MKResultView *)self secondaryLabel];
      [v47 setAttributedText:v44];

      unint64_t v5 = v63;
    }
    else
    {
      if (v28) {
        uint64_t v60 = (void *)[objc_alloc(*(Class *)(v6 + 2840)) initWithString:v28];
      }
      else {
        uint64_t v60 = 0;
      }
      v61 = [(_MKResultView *)self secondaryLabel];
      [v61 setAttributedText:v60];

      if (v28) {
    }
      }
  }
  else
  {
    v48 = [(_MKResultView *)self secondaryLabel];
    [v48 setAttributedText:v10];
  }
  uint64_t v49 = [v13 length];
  v50 = [(_MKResultView *)self tertiaryLabel];
  double v51 = v50;
  if (v49) {
    id v52 = v13;
  }
  else {
    id v52 = 0;
  }
  [v50 setText:v52];

  int v53 = self->_layoutType;
  switch(v53)
  {
    case 0:
      uint64_t v55 = [(_MKResultView *)self nameLabel];
      [v55 setNumberOfLines:1];

      uint64_t v54 = [(_MKResultView *)self secondaryLabel];
      v56 = v54;
      uint64_t v57 = 1;
LABEL_47:
      [v54 setNumberOfLines:v57];

      int v53 = self->_layoutType;
      break;
    case 2:
      double v58 = [(_MKResultView *)self tertiaryLabel];
      [v58 setText:0];

      v59 = [(_MKResultView *)self nameLabel];
      [v59 setNumberOfLines:1];

      uint64_t v54 = [(_MKResultView *)self secondaryLabel];
      goto LABEL_46;
    case 1:
      uint64_t v54 = [(_MKResultView *)self nameLabel];
LABEL_46:
      v56 = v54;
      uint64_t v57 = 2;
      goto LABEL_47;
  }
  if (!v53 || v53 == 2)
  {
    [(_MKResultView *)self _updateLayoutForBusinessOrCategory];
  }
  else if (v53 == 1)
  {
    [(_MKResultView *)self _updateLayoutForAddress];
  }
  [(UIView *)self _mapkit_setNeedsLayout];
}

- (void)updateLayout
{
  [(_MKResultView *)self updateImageView];
  [(_MKResultView *)self updateSubviews];
  [(_MKResultView *)self invalidateIntrinsicContentSize];

  [(_MKResultView *)self setNeedsUpdateConstraints];
}

- (MKMapItem)mapItem
{
  return (MKMapItem *)[(NSArray *)self->_mapItems firstObject];
}

- (void)setMapItem:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_MKResultView *)self mapItem];
  if ((id)v5 == v4)
  {
  }
  else
  {
    unint64_t v6 = (void *)v5;
    double v7 = [(_MKResultView *)self mapItem];
    char v8 = [v7 isEqual:v4];

    if ((v8 & 1) == 0)
    {
      if (v4)
      {
        v10[0] = v4;
        double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      }
      else
      {
        double v9 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)&self->_mapItems, v9);
      if (v4) {

      }
      self->_int layoutType = [v4 _hasMUID] ^ 1;
      [(_MKResultView *)self updateLayout];
    }
  }
}

- (NSArray)mapItems
{
  return self->_mapItems;
}

- (void)setMapItems:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  if (self->_mapItems != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_mapItems, a3);
    if ([(NSArray *)self->_mapItems count] >= 2)
    {
      self->_int layoutType = 2;
    }
    else
    {
      unint64_t v6 = [(_MKResultView *)self mapItem];
      self->_int layoutType = [v6 _hasMUID] ^ 1;
    }
    [(_MKResultView *)self updateLayout];
    uint64_t v5 = v7;
  }
}

- (NSString)primaryLabelText
{
  return self->_primaryLabelText;
}

- (void)setPrimaryLabelText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_primaryLabelText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_primaryLabelText, a3);
    [(_MKResultView *)self updateSubviews];
  }
}

- (NSString)secondaryLabelText
{
  return self->_secondaryLabelText;
}

- (void)setSecondaryLabelText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_secondaryLabelText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_secondaryLabelText, a3);
    [(_MKResultView *)self updateSubviews];
  }
}

- (void)setImageView:(id)a3
{
  p_imageView = &self->_imageView;
  id v6 = a3;
  if (([v6 isEqual:*p_imageView] & 1) == 0)
  {
    [(UIImageView *)*p_imageView removeFromSuperview];
    objc_storeStrong((id *)&self->_imageView, a3);
    [(UIImageView *)*p_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKResultView *)self addSubview:*p_imageView];
    [(_MKResultView *)self updateSubviews];
    [(_MKResultView *)self setNeedsUpdateConstraints];
  }
}

- (CLLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (void)_fireReferenceLocationTimer
{
  [(_MKResultView *)self setReferenceLocation:0];

  [(_MKResultView *)self _cancelReferenceLocationTimer];
}

- (void)_cancelReferenceLocationTimer
{
  [(NSTimer *)self->_refLocationTimer invalidate];
  refLocationTimer = self->_refLocationTimer;
  self->_refLocationTimer = 0;
}

- (void)setReferenceLocation:(id)a3
{
  id v5 = (CLLocation *)a3;
  if (v5 && (referenceLocation = self->_referenceLocation) != 0)
  {
    [(CLLocation *)referenceLocation coordinate];
    [(CLLocation *)v5 coordinate];
    CLLocationCoordinate2DGetDistanceFrom();
    BOOL v8 = v7 <= 100.0;
  }
  else
  {
    BOOL v8 = 0;
  }
  p_referenceLocation = &self->_referenceLocation;
  if (self->_referenceLocation != v5 && !v8)
  {
    objc_storeStrong((id *)p_referenceLocation, a3);
    [(_MKResultView *)self updateSubviews];
    [(_MKResultView *)self updateConstraints];
    if (*p_referenceLocation)
    {
      [(_MKResultView *)self _cancelReferenceLocationTimer];
      uint64_t v10 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__fireReferenceLocationTimer selector:0 userInfo:0 repeats:480.0];
      refLocationTimer = self->_refLocationTimer;
      self->_refLocationTimer = v10;
    }
  }
}

- (void)handleTap:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(_MKResultView *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(_MKResultView *)self delegate];
      [v6 resultViewWasSelected:self];
    }
  }
}

- (void)_locationApprovalDidChange
{
  if ([(_MKResultView *)self showsDistance]
    && [(MKLocationManager *)self->_locManager isLocationServicesAvailable])
  {
    locManager = self->_locManager;
    [(MKLocationManager *)locManager startLocationUpdateWithObserver:self];
  }
  else
  {
    [(MKLocationManager *)self->_locManager stopLocationUpdateWithObserver:self];
    [(_MKResultView *)self setReferenceLocation:0];
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v12 = a3;
  id v4 = [v12 lastLocation];
  [v4 horizontalAccuracy];
  if (v5 > 0.0)
  {
    id v6 = [v12 lastLocation];
    [v6 horizontalAccuracy];
    double v8 = v7;
    [v12 distanceFilter];
    double v10 = v9;

    id v11 = v12;
    if (v8 >= v10) {
      goto LABEL_5;
    }
    id v4 = [v12 lastLocation];
    [(_MKResultView *)self setReferenceLocation:v4];
  }

  id v11 = v12;
LABEL_5:
}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)setNameLabel:(id)a3
{
}

- (void)setSecondaryLabel:(id)a3
{
}

- (void)setTertiaryLabel:(id)a3
{
}

- (BOOL)alwaysUsesBusinessLayout
{
  return self->_alwaysUsesBusinessLayout;
}

- (void)setAlwaysUsesBusinessLayout:(BOOL)a3
{
  self->_alwaysUsesBusinessLayout = a3;
}

- (_MKResultViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MKResultViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)fallbackDistance
{
  return self->_fallbackDistance;
}

- (void)setFallbackDistance:(double)a3
{
  self->_fallbackDistance = a3;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)useSpotlightVibrancy
{
  return self->_useSpotlightVibrancy;
}

- (void)setUseSpotlightVibrancy:(BOOL)a3
{
  self->_useSpotlightVibrancy = a3;
}

- (int)iconFormat
{
  return self->_iconFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_refLocationTimer, 0);
  objc_storeStrong((id *)&self->_secondaryLabelText, 0);
  objc_storeStrong((id *)&self->_primaryLabelText, 0);
  objc_storeStrong((id *)&self->_locManager, 0);
  objc_storeStrong((id *)&self->_resultConstraints, 0);
  objc_storeStrong((id *)&self->delegate, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);

  objc_storeStrong((id *)&self->_mapItems, 0);
}

@end