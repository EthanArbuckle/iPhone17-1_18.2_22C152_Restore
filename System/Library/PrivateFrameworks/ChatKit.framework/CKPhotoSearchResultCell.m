@interface CKPhotoSearchResultCell
+ (id)reuseIdentifier;
- (BOOL)isLivePhoto;
- (BOOL)isSpatial;
- (BOOL)isVideo;
- (CKPhotoSearchResultCell)initWithFrame:(CGRect)a3;
- (NSString)resultIdentifier;
- (UIEdgeInsets)marginInsets;
- (UIImage)image;
- (UIImageView)durationGradientImage;
- (UIImageView)livePhotoImage;
- (UILabel)durationLabel;
- (UIView)spatialBadgeView;
- (void)_configureDurationLabelForResult:(id)a3;
- (void)_livePhotoUpdated:(id)a3;
- (void)_spatialStatusUpdated:(id)a3;
- (void)_thumbnailGenerated:(id)a3;
- (void)_videoDurationUpdated:(id)a3;
- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDurationGradientImage:(id)a3;
- (void)setDurationLabel:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsLivePhoto:(BOOL)a3;
- (void)setIsSpatial:(BOOL)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setLivePhotoImage:(id)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setResultIdentifier:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSpatialBadgeView:(id)a3;
@end

@implementation CKPhotoSearchResultCell

- (void)layoutSubviews
{
  v102.receiver = self;
  v102.super_class = (Class)CKPhotoSearchResultCell;
  [(CKEditableSearchResultCell *)&v102 layoutSubviews];
  v3 = [(CKPhotoSearchResultCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(CKEditableSearchResultCell *)self imageView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  int v13 = [(CKPhotoSearchResultCell *)self _shouldReverseLayoutDirection];
  v14 = [(CKEditableSearchResultCell *)self imageView];
  v15 = [v14 image];

  v16 = [(CKPhotoSearchResultCell *)self livePhotoImage];

  if (v16)
  {
    v17 = [(CKPhotoSearchResultCell *)self livePhotoImage];
    [v17 sizeToFit];

    v18 = [(CKPhotoSearchResultCell *)self livePhotoImage];
    [v18 frame];
    CGFloat v20 = v19;
    double v22 = v21;
    double v24 = v23;

    double v25 = 8.0;
    if (v13)
    {
      v103.origin.x = v5;
      v103.origin.y = v7;
      v103.size.width = v9;
      v103.size.height = v11;
      double Width = CGRectGetWidth(v103);
      v104.origin.y = 8.0;
      v104.origin.x = v20;
      v104.size.width = v22;
      v104.size.height = v24;
      double v25 = Width - CGRectGetWidth(v104) + -8.0;
    }
    v27 = [(CKPhotoSearchResultCell *)self livePhotoImage];
    objc_msgSend(v27, "setFrame:", v25, 8.0, v22, v24);

    v28 = [(CKPhotoSearchResultCell *)self livePhotoImage];
    v29 = v28;
    BOOL v31 = !self->_isLivePhoto || v15 == 0;
    [v28 setHidden:v31];
  }
  uint64_t v32 = [(CKPhotoSearchResultCell *)self durationLabel];
  CGFloat rect = v11;
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(CKPhotoSearchResultCell *)self durationGradientImage];

    if (v34)
    {
      v105.origin.x = v5;
      v105.origin.y = v7;
      v105.size.width = v9;
      v105.size.height = v11;
      CGFloat v35 = CGRectGetMaxY(v105) + -25.0;
      v36 = [(CKPhotoSearchResultCell *)self durationGradientImage];
      objc_msgSend(v36, "setFrame:", v5, v35, v9, 25.0);

      v37 = [(CKPhotoSearchResultCell *)self durationLabel];
      [v37 sizeToFit];

      v38 = [(CKPhotoSearchResultCell *)self durationLabel];
      [v38 frame];
      CGFloat v39 = v11;
      CGFloat v40 = v7;
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      double v46 = v45;
      double v48 = v47;

      double v49 = v5;
      CGFloat v50 = v40;
      double v51 = v9;
      CGFloat v52 = v39;
      if (v13)
      {
        double v53 = CGRectGetMinX(*(CGRect *)&v49) + 5.0;
      }
      else
      {
        double v100 = v9;
        double v54 = v5;
        double v55 = v40;
        double v56 = v39;
        CGFloat v57 = CGRectGetMaxX(*(CGRect *)&v49) + -5.0;
        v106.origin.x = v42;
        v106.origin.y = v44;
        v106.size.width = v46;
        v106.size.height = v48;
        double v53 = v57 - CGRectGetWidth(v106);
        CGFloat v39 = v56;
        CGFloat v40 = v55;
        double v5 = v54;
        double v9 = v100;
      }
      v107.origin.x = v5;
      v107.origin.y = v40;
      v107.size.width = v9;
      v107.size.height = v39;
      CGFloat v58 = CGRectGetMaxY(v107) + -3.0;
      v108.origin.x = v53;
      v108.origin.y = v44;
      v108.size.width = v46;
      v108.size.height = v48;
      CGFloat v59 = v58 - CGRectGetHeight(v108);
      v60 = [(CKPhotoSearchResultCell *)self durationLabel];
      objc_msgSend(v60, "setFrame:", v53, v59, v46, v48);

      v61 = [(CKPhotoSearchResultCell *)self contentView];
      v62 = [(CKPhotoSearchResultCell *)self durationGradientImage];
      [v61 bringSubviewToFront:v62];

      v63 = [(CKPhotoSearchResultCell *)self contentView];
      v64 = [(CKPhotoSearchResultCell *)self durationLabel];
      [v63 bringSubviewToFront:v64];

      v65 = [(CKPhotoSearchResultCell *)self durationLabel];
      v66 = v65;
      if (v15) {
        BOOL v67 = !self->_isVideo;
      }
      else {
        BOOL v67 = 1;
      }
      objc_msgSend(v65, "setHidden:", v67, *(void *)&v100);

      v68 = [(CKPhotoSearchResultCell *)self durationGradientImage];
      v69 = v68;
      if (v15) {
        BOOL v70 = !self->_isVideo;
      }
      else {
        BOOL v70 = 1;
      }
      [v68 setHidden:v70];

      double v7 = v40;
    }
  }
  v71 = [(CKEditableSearchResultCell *)self checkmarkView];

  if (v71)
  {
    CGFloat v72 = v7;
    [(UILabel *)self->_durationLabel setHidden:1];
    [(UIImageView *)self->_durationGradientImage setHidden:1];
    v73 = [(CKPhotoSearchResultCell *)self contentView];
    v74 = [(CKEditableSearchResultCell *)self checkmarkView];
    [v73 bringSubviewToFront:v74];

    v75 = [(CKEditableSearchResultCell *)self checkmarkView];
    [v75 sizeToFit];

    v76 = [(CKEditableSearchResultCell *)self checkmarkView];
    [v76 frame];
    CGFloat v78 = v77;
    CGFloat v80 = v79;
    double v82 = v81;
    double v84 = v83;

    double v85 = 4.0;
    if ((v13 & 1) == 0)
    {
      v109.origin.x = v5;
      v109.origin.y = v72;
      v109.size.width = v9;
      v109.size.height = rect;
      double v86 = CGRectGetWidth(v109);
      v110.origin.x = v78;
      v110.origin.y = v80;
      v110.size.width = v82;
      v110.size.height = v84;
      double v85 = v86 - CGRectGetWidth(v110) + -4.0;
    }
    v111.origin.x = v5;
    v111.origin.y = v72;
    v111.size.width = v9;
    v111.size.height = rect;
    double Height = CGRectGetHeight(v111);
    v112.origin.x = v85;
    v112.origin.y = v80;
    v112.size.width = v82;
    v112.size.height = v84;
    double v88 = Height - CGRectGetHeight(v112) + -4.0;
    v89 = [(CKEditableSearchResultCell *)self checkmarkView];
    objc_msgSend(v89, "setFrame:", v85, v88, v82, v84);
  }
  v90 = [(CKPhotoSearchResultCell *)self spatialBadgeView];

  if (v90)
  {
    [(CKPhotoSearchResultCell *)self bounds];
    double v92 = v91;
    double v94 = v93;
    double v96 = v95;
    double v98 = v97;
    v99 = [(CKPhotoSearchResultCell *)self spatialBadgeView];
    objc_msgSend(v99, "setFrame:", v92, v94, v96, v98);
  }
}

- (void)_videoDurationUpdated:(id)a3
{
  id v7 = [a3 object];
  double v4 = [v7 identifier];
  double v5 = [(CKPhotoSearchResultCell *)self resultIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    [(CKPhotoSearchResultCell *)self setIsVideo:1];
    [(CKPhotoSearchResultCell *)self setIsLivePhoto:0];
    [(CKPhotoSearchResultCell *)self _configureDurationLabelForResult:v7];
  }
}

- (CKPhotoSearchResultCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)CKPhotoSearchResultCell;
  id v7 = -[CKPhotoSearchResultCell initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", x, y, width, height);
    [v8 setContentMode:2];
    [v8 setClipsToBounds:1];
    [(CKEditableSearchResultCell *)v7 setImageView:v8];
    double v9 = [(CKPhotoSearchResultCell *)v7 contentView];
    [v9 addSubview:v8];

    double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__thumbnailGenerated_ name:@"CKSearchThumbnailDidChange" object:0];

    double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel__livePhotoUpdated_ name:@"CKSearchLivePhotoStatusDidChange" object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel__videoDurationUpdated_ name:@"CKSearchVideoDurationDidChange" object:0];

    int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v7 selector:sel__spatialStatusUpdated_ name:@"CKSearchSpatialStatusDidChange" object:0];
  }
  return v7;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)CKPhotoSearchResultCell;
  [(CKEditableSearchResultCell *)&v6 prepareForReuse];
  [(CKPhotoSearchResultCell *)self setIsLivePhoto:0];
  [(CKPhotoSearchResultCell *)self setIsVideo:0];
  [(CKPhotoSearchResultCell *)self setIsSpatial:0];
  if (self->_durationLabel)
  {
    v3 = [(CKPhotoSearchResultCell *)self durationLabel];
    [v3 setHidden:1];
  }
  if (self->_durationGradientImage)
  {
    double v4 = [(CKPhotoSearchResultCell *)self durationGradientImage];
    [v4 setHidden:1];
  }
  double v5 = [(CKEditableSearchResultCell *)self imageView];
  [v5 setImage:0];

  [(CKPhotoSearchResultCell *)self setResultIdentifier:0];
}

- (void)setIsLivePhoto:(BOOL)a3
{
  if (self->_isLivePhoto != a3)
  {
    self->_isLivePhoto = a3;
    double v5 = [(CKPhotoSearchResultCell *)self livePhotoImage];
    id v19 = v5;
    if (a3)
    {

      if (!v19)
      {
        objc_super v6 = [MEMORY[0x1E4F42A98] configurationWithScale:3];
        id v7 = [MEMORY[0x1E4F42A80] systemImageNamed:@"livephoto"];
        double v8 = [v7 imageWithSymbolConfiguration:v6];

        double v9 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v8];
        double v10 = [MEMORY[0x1E4F428B8] whiteColor];
        [v9 setTintColor:v10];

        double v11 = [(CKPhotoSearchResultCell *)self contentView];
        [v11 addSubview:v9];

        [(CKPhotoSearchResultCell *)self setLivePhotoImage:v9];
        v12 = [v9 layer];
        id v13 = [MEMORY[0x1E4F428B8] blackColor];
        objc_msgSend(v12, "setShadowColor:", objc_msgSend(v13, "CGColor"));

        v14 = [v9 layer];
        LODWORD(v15) = *(_DWORD *)"333?";
        [v14 setShadowOpacity:v15];

        v16 = [v9 layer];
        objc_msgSend(v16, "setShadowOffset:", 0.0, 1.0);

        v17 = [v9 layer];
        [v17 setShadowRadius:4.0];

        [(CKPhotoSearchResultCell *)self setNeedsLayout];
      }
      double v5 = [(CKPhotoSearchResultCell *)self livePhotoImage];
      id v19 = v5;
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v18 = 1;
    }
    [v5 setHidden:v18];
  }
}

- (void)setIsVideo:(BOOL)a3
{
  if (self->_isVideo != a3)
  {
    self->_isVideo = a3;
    double v5 = [(CKPhotoSearchResultCell *)self durationLabel];
    objc_super v6 = v5;
    if (a3)
    {

      if (!v6)
      {
        id v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
        durationLabel = self->_durationLabel;
        self->_durationLabel = v7;

        double v9 = self->_durationLabel;
        double v10 = [MEMORY[0x1E4F428B8] clearColor];
        [(UILabel *)v9 setBackgroundColor:v10];

        double v11 = self->_durationLabel;
        v12 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
        [(UILabel *)v11 setFont:v12];

        id v13 = self->_durationLabel;
        v14 = [MEMORY[0x1E4F428B8] whiteColor];
        [(UILabel *)v13 setTextColor:v14];

        [(UILabel *)self->_durationLabel setTextAlignment:4];
        double v15 = [(CKPhotoSearchResultCell *)self contentView];
        [v15 addSubview:self->_durationLabel];

        [(CKPhotoSearchResultCell *)self setNeedsLayout];
      }
      v16 = [(CKPhotoSearchResultCell *)self durationGradientImage];

      if (!v16)
      {
        v17 = [MEMORY[0x1E4F42A80] ckImageNamed:@"CKAssetsSceneBadgeBannerGradient"];
        uint64_t v18 = objc_msgSend(v17, "resizableImageWithCapInsets:resizingMode:", 0, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));

        id v19 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v18];
        durationGradientImage = self->_durationGradientImage;
        self->_durationGradientImage = v19;
        double v21 = v19;

        double v22 = [(CKPhotoSearchResultCell *)self contentView];
        [v22 addSubview:v21];

        [(CKPhotoSearchResultCell *)self setNeedsLayout];
      }
      double v23 = [(CKPhotoSearchResultCell *)self durationLabel];
      [v23 setHidden:0];

      double v24 = [(CKPhotoSearchResultCell *)self durationGradientImage];
      id v26 = v24;
      uint64_t v25 = 0;
    }
    else
    {
      [v5 setHidden:1];

      double v24 = [(CKPhotoSearchResultCell *)self durationGradientImage];
      id v26 = v24;
      uint64_t v25 = 1;
    }
    [v24 setHidden:v25];
  }
}

- (void)setIsSpatial:(BOOL)a3
{
  if (self->_isSpatial != a3)
  {
    BOOL v3 = a3;
    self->_isSpatial = a3;
    double v5 = [(CKPhotoSearchResultCell *)self spatialBadgeView];
    objc_super v6 = v5;
    if (v3)
    {

      if (!v6)
      {
        id v8 = +[CKMonoskiBadgeViewFactory badgeViewWithSupportsGradient:1];
        [(CKPhotoSearchResultCell *)self addSubview:v8];
        [(CKPhotoSearchResultCell *)self setSpatialBadgeView:v8];
      }
    }
    else
    {

      if (v6)
      {
        id v7 = [(CKPhotoSearchResultCell *)self spatialBadgeView];
        [v7 removeFromSuperview];

        [(CKPhotoSearchResultCell *)self setSpatialBadgeView:0];
      }
    }
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKPhotoSearchResultCell;
  [(CKPhotoSearchResultCell *)&v4 dealloc];
}

+ (id)reuseIdentifier
{
  return @"PhotoSearchCell";
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v36 = a3;
  id v7 = [v36 identifier];
  [(CKPhotoSearchResultCell *)self setResultIdentifier:v7];

  id v8 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  char v9 = [v8 hasCachedPreviewForQueryResult:v36];

  double v10 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  double v11 = v10;
  if ((v9 & 1) == 0)
  {
    [v10 generatePreviewForQueryResult:v36];
    v12 = 0;
    goto LABEL_6;
  }
  v12 = [v10 cachedPreviewForQueryResult:v36];

  if (v12)
  {
    id v13 = [(CKEditableSearchResultCell *)self imageView];
    [v13 setImage:v12];

    if (CKIsRunningInMacCatalyst())
    {
      v14 = [(CKEditableSearchResultCell *)self imageView];
      [v14 setContentMode:2];

      double v11 = [(CKEditableSearchResultCell *)self imageView];
      [v11 setClipsToBounds:1];
LABEL_6:
    }
  }
  double v15 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  uint64_t v16 = [v15 queryResultHasLivePhoto:v36];

  [(CKPhotoSearchResultCell *)self setIsLivePhoto:v16];
  if (v16)
  {
    [(CKPhotoSearchResultCell *)self setIsVideo:0];
  }
  else
  {
    v17 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
    uint64_t v18 = [v17 queryResultIsVideo:v36];

    [(CKPhotoSearchResultCell *)self setIsVideo:v18];
    if (v18) {
      [(CKPhotoSearchResultCell *)self _configureDurationLabelForResult:v36];
    }
  }
  id v19 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  uint64_t v20 = [v19 queryResultIsSpatial:v36];

  [(CKPhotoSearchResultCell *)self setIsSpatial:v20];
  int v21 = CKIsRunningInMacCatalyst();
  if (a5 == 1 || v21)
  {
    uint64_t v25 = +[CKUIBehavior sharedBehaviors];
    [v25 searchPhotosCellZKWAndDetailsCornerRadius];
    double v27 = v26;

    v28 = [(CKEditableSearchResultCell *)self imageView];
    v29 = [v28 layer];
    [v29 setCornerRadius:v27];

    v30 = [(CKPhotoSearchResultCell *)self livePhotoImage];
    BOOL v31 = [v30 layer];
    [v31 setCornerRadius:v27];

    uint64_t v32 = [(CKPhotoSearchResultCell *)self durationGradientImage];
    v33 = [v32 layer];
    [v33 setMasksToBounds:1];

    v34 = [(CKPhotoSearchResultCell *)self durationGradientImage];
    CGFloat v35 = [v34 layer];
    [v35 setCornerRadius:v27];

    double v22 = [(CKPhotoSearchResultCell *)self durationLabel];
    double v23 = [v22 layer];
    [v23 setCornerRadius:v27];
  }
  else
  {
    if (CKIsRunningInMacCatalyst()) {
      goto LABEL_17;
    }
    double v22 = [(CKEditableSearchResultCell *)self imageView];
    double v23 = [v22 layer];
    double v24 = +[CKUIBehavior sharedBehaviors];
    [v24 searchPhotosCellCornerRadius];
    objc_msgSend(v23, "setCornerRadius:");
  }
LABEL_17:
}

- (void)_thumbnailGenerated:(id)a3
{
  id v12 = [a3 object];
  objc_super v4 = [v12 identifier];
  double v5 = [(CKPhotoSearchResultCell *)self resultIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
    id v8 = [v7 cachedPreviewForQueryResult:v12];

    if (v8)
    {
      char v9 = [(CKEditableSearchResultCell *)self imageView];
      [v9 setImage:v8];

      if (CKIsRunningInMacCatalyst())
      {
        double v10 = [(CKEditableSearchResultCell *)self imageView];
        [v10 setContentMode:2];

        double v11 = [(CKEditableSearchResultCell *)self imageView];
        [v11 setClipsToBounds:1];
      }
      [(CKPhotoSearchResultCell *)self setNeedsLayout];
    }
  }
}

- (void)_livePhotoUpdated:(id)a3
{
  id v9 = [a3 object];
  objc_super v4 = [v9 identifier];
  double v5 = [(CKPhotoSearchResultCell *)self resultIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
    uint64_t v8 = [v7 queryResultHasLivePhoto:v9];

    [(CKPhotoSearchResultCell *)self setIsLivePhoto:v8];
    [(CKPhotoSearchResultCell *)self setIsVideo:0];
  }
}

- (void)_configureDurationLabelForResult:(id)a3
{
  id v4 = a3;
  if (_configureDurationLabelForResult___pred_CMTimeGetSecondsCoreMedia != -1) {
    dispatch_once(&_configureDurationLabelForResult___pred_CMTimeGetSecondsCoreMedia, &__block_literal_global_267);
  }
  long long v13 = 0uLL;
  uint64_t v14 = 0;
  double v5 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  int v6 = v5;
  if (v5)
  {
    [v5 durationForVideoResult:v4];
  }
  else
  {
    long long v13 = 0uLL;
    uint64_t v14 = 0;
  }

  if (BYTE12(v13))
  {
    long long v11 = v13;
    uint64_t v12 = v14;
    id v7 = [MEMORY[0x1E4F42BC0] timeStringForSeconds:(int)rint(_configureDurationLabelForResult___CMTimeGetSeconds(&v11)) forceFullWidthComponents:0 isElapsed:1];
    uint64_t v8 = [(CKPhotoSearchResultCell *)self durationLabel];
    [v8 setText:v7];

    id v9 = [(CKPhotoSearchResultCell *)self durationLabel];
    [v9 setHidden:0];

    double v10 = [(CKPhotoSearchResultCell *)self durationGradientImage];
    [v10 setHidden:0];
  }
  else
  {
    [(UILabel *)self->_durationLabel setHidden:1];
    [(UIImageView *)self->_durationGradientImage setHidden:1];
  }
  [(CKPhotoSearchResultCell *)self setNeedsLayout];
}

void *__60__CKPhotoSearchResultCell__configureDurationLabelForResult___block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("CMTimeGetSeconds", @"CoreMedia");
  _configureDurationLabelForResult___CMTimeGetSeconds = result;
  return result;
}

- (void)_spatialStatusUpdated:(id)a3
{
  id v9 = [a3 object];
  id v4 = [v9 identifier];
  double v5 = [(CKPhotoSearchResultCell *)self resultIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
    uint64_t v8 = [v7 queryResultIsSpatial:v9];

    [(CKPhotoSearchResultCell *)self setIsSpatial:v8];
  }
}

- (void)setSelected:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKPhotoSearchResultCell;
  [(CKEditableSearchResultCell *)&v3 setSelected:a3];
}

- (UIEdgeInsets)marginInsets
{
  double top = self->marginInsets.top;
  double left = self->marginInsets.left;
  double bottom = self->marginInsets.bottom;
  double right = self->marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIImageView)livePhotoImage
{
  return self->_livePhotoImage;
}

- (void)setLivePhotoImage:(id)a3
{
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (void)setDurationLabel:(id)a3
{
}

- (UIImageView)durationGradientImage
{
  return self->_durationGradientImage;
}

- (void)setDurationGradientImage:(id)a3
{
}

- (BOOL)isLivePhoto
{
  return self->_isLivePhoto;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)isSpatial
{
  return self->_isSpatial;
}

- (UIView)spatialBadgeView
{
  return self->_spatialBadgeView;
}

- (void)setSpatialBadgeView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialBadgeView, 0);
  objc_storeStrong((id *)&self->_durationGradientImage, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_livePhotoImage, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end