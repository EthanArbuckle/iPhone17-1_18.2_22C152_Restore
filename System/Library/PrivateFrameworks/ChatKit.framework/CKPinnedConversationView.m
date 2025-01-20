@interface CKPinnedConversationView
+ (BOOL)_mouthRegionDetectionEnabled;
+ (CGSize)avatarViewSizeFittingSize:(CGSize)a3 layoutStyle:(int64_t)a4;
+ (UIEdgeInsets)avatarViewPadding;
+ (UIEdgeInsets)titleLabelVerticalPadding;
+ (double)_maximumAvatarViewWidthFittingSize:(CGSize)a3;
+ (double)_preferredAvatarViewDiameterForLayoutStyle:(int64_t)a3;
+ (id)_cachedMouthRegionForContact:(id)a3;
+ (id)_mouthRegionDetectionDispatchQueue;
+ (id)_mouthRegionForContactImageCache;
+ (id)_mouthRegionForContactImageCacheKeyForContact:(id)a3;
+ (id)_requiredContactKeys;
+ (int64_t)_titleIconImageTypeForConversation:(id)a3;
+ (void)_determineMouthRegionForContact:(id)a3 completion:(id)a4;
+ (void)_updateCachedMouthRegionIfNecessaryForContact:(id)a3 completion:(id)a4;
- (BOOL)_activityIsSuppressedForLayoutStyle:(int64_t)a3;
- (BOOL)_shouldShowSummaryForSatelliteMessages;
- (BOOL)isDimmed;
- (BOOL)isFilteredByFocus;
- (BOOL)isSelectedWithDarkAppearance;
- (BOOL)isSuppressingActivity;
- (BOOL)isUnreadIndicatorHidden;
- (BOOL)needsUnreadIndicatorLeadingEdgePadding;
- (BOOL)preferShortConversationName;
- (BOOL)showsLiveActivity;
- (CAFilter)dimmingFilter;
- (CGPoint)_centerPointOfFaceLandmarkRegion:(id)a3 inImageOfSize:(CGSize)a4;
- (CGRect)activityItemBoundingFrame;
- (CGRect)avatarViewFrameForSize:(CGSize)a3 layoutStyle:(int64_t)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)titleLabelSizeFittingSize:(CGSize)a3;
- (CGSize)unreadIndicatorSize;
- (CKAvatarView)avatarView;
- (CKConversation)conversation;
- (CKLabel)titleLabel;
- (CKPinnedConversationActivityView)activityView;
- (CKPinnedConversationView)init;
- (CKPinnedConversationView)initWithFrame:(CGRect)a3;
- (CKPinnedConversationViewDelegate)delegate;
- (NSArray)recentMessagesInPinnedConversations;
- (NSDirectionalEdgeInsets)unreadIndicatorMinimumPadding;
- (NSDirectionalEdgeInsets)unreadIndicatorPreferredPadding;
- (NSMutableArray)activeActivitySuppressionReasons;
- (UIImage)avatarSnapshot;
- (UIImageView)avatarSnapshotImageView;
- (UIImageView)radiantShadowImageView;
- (UIImageView)unreadIndicator;
- (VNFaceLandmarkRegion2D)avatarMouthRegion;
- (double)_unreadIndicatorLeadingEdgePadding;
- (double)activityItemTopInset;
- (id)_unreadIndicatorColor;
- (id)_unreadIndicatorImage;
- (id)presentingViewControllerForAvatarView:(id)a3;
- (int64_t)activityItemOriginationDirection;
- (int64_t)layoutStyle;
- (void)_updateAvatarMouthRegion;
- (void)_updateAvatarView;
- (void)_updateRadiantShadowAffineTranform;
- (void)_updateRadiantShadowImageView;
- (void)_updateTitleLabel;
- (void)_updateTitleLabelColor;
- (void)_updateTitleLabelFont;
- (void)_updateTitleLabelWithText:(id)a3;
- (void)_updateUnreadIndicator;
- (void)beginSuppressingActivityWithReason:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)configureAsPrototypeCell;
- (void)didEndDisplaying;
- (void)dimAvatarView;
- (void)endSuppressingActivityWithReason:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)reapplyPreviouslyDisplayedActivitySnapshot:(id)a3;
- (void)removeDimmingFilter;
- (void)setActiveActivitySuppressionReasons:(id)a3;
- (void)setActivityItemBoundingFrame:(CGRect)a3;
- (void)setActivityItemOriginationDirection:(int64_t)a3;
- (void)setActivityItemTopInset:(double)a3;
- (void)setActivityView:(id)a3;
- (void)setAvatarMouthRegion:(id)a3;
- (void)setAvatarSnapshot:(id)a3;
- (void)setAvatarSnapshotImageView:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setConversation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setDimmingFilter:(id)a3;
- (void)setIsFilteredByFocus:(BOOL)a3;
- (void)setIsFilteredByFocus:(BOOL)a3 animated:(BOOL)a4;
- (void)setIsSelectedWithDarkAppearance:(BOOL)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setNeedsUnreadIndicatorLeadingEdgePadding:(BOOL)a3;
- (void)setPreferShortConversationName:(BOOL)a3;
- (void)setRadiantShadowImageView:(id)a3;
- (void)setRecentMessagesInPinnedConversations:(id)a3;
- (void)setShowsLiveActivity:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUnreadIndicator:(id)a3;
- (void)setUnreadIndicatorHidden:(BOOL)a3;
- (void)setUnreadIndicatorHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)updateActivityViewAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation CKPinnedConversationView

- (CKPinnedConversationView)init
{
  return -[CKPinnedConversationView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (CKPinnedConversationView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKPinnedConversationView;
  v3 = -[CKPinnedConversationView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_preferShortConversationName = 1;
    v5 = objc_alloc_init(CKAvatarView);
    avatarView = v4->_avatarView;
    v4->_avatarView = v5;

    v7 = objc_alloc_init(CKLabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v7;

    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    unreadIndicator = v4->_unreadIndicator;
    v4->_unreadIndicator = v9;

    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    radiantShadowImageView = v4->_radiantShadowImageView;
    v4->_radiantShadowImageView = v11;

    v4->_activityItemTopInset = 0.0;
    [(CKPinnedConversationView *)v4 addSubview:v4->_avatarView];
    [(CKPinnedConversationView *)v4 addSubview:v4->_titleLabel];
    [(CKPinnedConversationView *)v4 addSubview:v4->_unreadIndicator];
    [(CKPinnedConversationView *)v4 addSubview:v4->_radiantShadowImageView];
    [(CKPinnedConversationView *)v4 _updateTitleLabelFont];
    [(CKPinnedConversationView *)v4 _updateTitleLabelColor];
    [(CKLabel *)v4->_titleLabel setTextAlignment:1];
    [(CKLabel *)v4->_titleLabel setAllowsDefaultTighteningForTruncation:1];
    [(UIImageView *)v4->_unreadIndicator setHidden:1];
    [(CNAvatarView *)v4->_avatarView setAsynchronousRendering:1];
    [(CKAvatarView *)v4->_avatarView setUserInteractionEnabled:0];
    [(CNAvatarView *)v4->_avatarView setShowsContactOnTap:0];
    [(CNAvatarView *)v4->_avatarView setDelegate:v4];
    [(CNAvatarView *)v4->_avatarView setThreeDTouchEnabled:0];
    [(UIImageView *)v4->_radiantShadowImageView setContentMode:2];
    [(CKPinnedConversationView *)v4 _updateRadiantShadowAffineTranform];
    [(CKPinnedConversationView *)v4 _updateRadiantShadowImageView];
    v13 = [(UIImageView *)v4->_radiantShadowImageView layer];
    [v13 setShouldRasterize:1];

    v14 = [(UIImageView *)v4->_radiantShadowImageView layer];
    [v14 setRasterizationScale:0.5];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v4 selector:sel_contentSizeCategoryChanged_ name:*MEMORY[0x1E4F43788] object:0];
  }
  return v4;
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    if ([(CKPinnedConversationView *)self _activityIsSuppressedForLayoutStyle:"_activityIsSuppressedForLayoutStyle:"]) {
      [(CKPinnedConversationView *)self beginSuppressingActivityWithReason:@"LayoutStyle" animated:0 completion:0];
    }
    else {
      [(CKPinnedConversationView *)self endSuppressingActivityWithReason:@"LayoutStyle" animated:0 completion:0];
    }
    [(CKPinnedConversationView *)self setNeedsLayout];
  }
}

- (void)setShowsLiveActivity:(BOOL)a3
{
  if (self->_showsLiveActivity != a3)
  {
    self->_showsLiveActivity = a3;
    if (a3)
    {
      v4 = objc_alloc_init(CKPinnedConversationActivityView);
      activityView = self->_activityView;
      self->_activityView = v4;

      [(CKPinnedConversationView *)self addSubview:self->_activityView];
      [(CKPinnedConversationView *)self _updateAvatarMouthRegion];
      [(CKPinnedConversationView *)self setNeedsLayout];
    }
    else
    {
      [(CKPinnedConversationActivityView *)self->_activityView removeFromSuperview];
      v6 = self->_activityView;
      self->_activityView = 0;
    }
  }
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
  [(CKPinnedConversationView *)self _updateTitleLabel];
  [(CKPinnedConversationView *)self _updateUnreadIndicator];
  [(CKPinnedConversationView *)self _updateAvatarView];

  [(CKPinnedConversationView *)self _updateAvatarMouthRegion];
}

- (void)setRecentMessagesInPinnedConversations:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  recentMessagesInPinnedConversations = self->_recentMessagesInPinnedConversations;
  self->_recentMessagesInPinnedConversations = v4;
}

- (void)setUnreadIndicatorHidden:(BOOL)a3
{
}

- (void)setUnreadIndicatorHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    if (!a3)
    {
      v6 = [(CKPinnedConversationView *)self unreadIndicator];
      int v7 = [v6 isHidden];

      if (v7)
      {
        v8 = [(CKPinnedConversationView *)self unreadIndicator];
        [v8 setAlpha:0.0];

        v9 = [(CKPinnedConversationView *)self unreadIndicator];
        [v9 setHidden:0];
      }
    }
    id location = 0;
    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E4F42FF0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__CKPinnedConversationView_setUnreadIndicatorHidden_animated___block_invoke;
    v15[3] = &unk_1E5628B18;
    objc_copyWeak(&v16, &location);
    BOOL v17 = v4;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__CKPinnedConversationView_setUnreadIndicatorHidden_animated___block_invoke_2;
    v12[3] = &unk_1E562B5F8;
    objc_copyWeak(&v13, &location);
    BOOL v14 = v4;
    [v10 animateWithDuration:v15 animations:v12 completion:0.300000012];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = [(CKPinnedConversationView *)self unreadIndicator];
    [v11 setHidden:v4];
  }
}

void __62__CKPinnedConversationView_setUnreadIndicatorHidden_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained unreadIndicator];
  [v2 setAlpha:v1];
}

void __62__CKPinnedConversationView_setUnreadIndicatorHidden_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained unreadIndicator];
  [v2 setHidden:v1];
}

- (BOOL)isUnreadIndicatorHidden
{
  v2 = [(CKPinnedConversationView *)self unreadIndicator];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setIsFilteredByFocus:(BOOL)a3
{
}

- (void)setIsFilteredByFocus:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isFilteredByFocus != a3)
  {
    self->_isFilteredByFocus = a3;
    if (a3) {
      [(CKPinnedConversationView *)self beginSuppressingActivityWithReason:@"FilteredByFocus" animated:a4 completion:0];
    }
    else {
      [(CKPinnedConversationView *)self endSuppressingActivityWithReason:@"FilteredByFocus" animated:a4 completion:0];
    }
    [(CKPinnedConversationView *)self _updateUnreadIndicator];
  }
}

- (void)setAvatarSnapshot:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_avatarSnapshot != v5)
  {
    v19 = v5;
    objc_storeStrong((id *)&self->_avatarSnapshot, a3);
    avatarSnapshotImageView = self->_avatarSnapshotImageView;
    if (v19)
    {
      if (!avatarSnapshotImageView)
      {
        id v7 = objc_alloc(MEMORY[0x1E4F42AA0]);
        v8 = [(CKPinnedConversationView *)self avatarView];
        [v8 frame];
        v9 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
        v10 = self->_avatarSnapshotImageView;
        self->_avatarSnapshotImageView = v9;

        id v11 = self->_avatarSnapshotImageView;
        v12 = [(CKPinnedConversationView *)self avatarView];
        [(CKPinnedConversationView *)self insertSubview:v11 aboveSubview:v12];
      }
      id v13 = [(CKPinnedConversationView *)self avatarView];
      [v13 setHidden:1];

      BOOL v14 = [(CKPinnedConversationView *)self avatarSnapshotImageView];
      [v14 setImage:v19];
    }
    else
    {
      [(UIImageView *)avatarSnapshotImageView removeFromSuperview];
      v15 = self->_avatarSnapshotImageView;
      self->_avatarSnapshotImageView = 0;

      id v16 = [(CKPinnedConversationView *)self avatarView];
      [v16 setHidden:0];

      BOOL v14 = [(CKPinnedConversationView *)self avatarView];
      BOOL v17 = [v14 contentImage];
      v18 = [(CKPinnedConversationView *)self radiantShadowImageView];
      [v18 setImage:v17];
    }
    [(CKPinnedConversationView *)self _updateRadiantShadowImageView];
    [(CKPinnedConversationView *)self setNeedsLayout];
    v5 = v19;
  }
}

- (void)setActivityItemOriginationDirection:(int64_t)a3
{
  id v4 = [(CKPinnedConversationView *)self activityView];
  [v4 setActivityItemOriginationDirection:a3];
}

- (int64_t)activityItemOriginationDirection
{
  v2 = [(CKPinnedConversationView *)self activityView];
  int64_t v3 = [v2 activityItemOriginationDirection];

  return v3;
}

- (void)beginSuppressingActivityWithReason:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = a5;
  activeActivitySuppressionReasons = self->_activeActivitySuppressionReasons;
  if (!activeActivitySuppressionReasons)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = self->_activeActivitySuppressionReasons;
    self->_activeActivitySuppressionReasons = v10;

    activeActivitySuppressionReasons = self->_activeActivitySuppressionReasons;
  }
  [(NSMutableArray *)activeActivitySuppressionReasons addObject:v13];
  v12 = [(CKPinnedConversationView *)self activityView];
  [v12 setSuppressingActivity:1 animated:v6 completion:v8];
}

- (void)endSuppressingActivityWithReason:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  activeActivitySuppressionReasons = self->_activeActivitySuppressionReasons;
  id v9 = a5;
  [(NSMutableArray *)activeActivitySuppressionReasons removeObject:a3];
  BOOL v10 = [(NSMutableArray *)self->_activeActivitySuppressionReasons count] != 0;
  id v11 = [(CKPinnedConversationView *)self activityView];
  [v11 setSuppressingActivity:v10 animated:v5 completion:v9];
}

- (BOOL)isSuppressingActivity
{
  v2 = [(CKPinnedConversationView *)self activityView];
  char v3 = [v2 isSuppressingActivity];

  return v3;
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    if (a3) {
      [(CKPinnedConversationView *)self dimAvatarView];
    }
    else {
      [(CKPinnedConversationView *)self removeDimmingFilter];
    }
  }
}

- (void)dimAvatarView
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v12 conversationPinningTouchdownDimEnabled])
  {
    char v3 = [(CKPinnedConversationView *)self dimmingFilter];

    if (!v3)
    {
      id v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
      [(CKPinnedConversationView *)self setDimmingFilter:v4];

      BOOL v5 = [(CKPinnedConversationView *)self dimmingFilter];
      id v6 = [MEMORY[0x1E4F428B8] colorWithWhite:0.6 alpha:1.0];
      uint64_t v7 = [v6 CGColor];
      [v5 setValue:v7 forKey:*MEMORY[0x1E4F3A148]];

      id v8 = [(CKPinnedConversationView *)self avatarView];
      id v9 = [v8 layer];
      BOOL v10 = [(CKPinnedConversationView *)self dimmingFilter];
      v13[0] = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [v9 setFilters:v11];
    }
  }
  else
  {
  }
}

- (void)removeDimmingFilter
{
  char v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 conversationPinningTouchdownDimEnabled];

  if (v4)
  {
    BOOL v5 = [(CKPinnedConversationView *)self avatarView];
    id v6 = [v5 layer];
    [v6 setFilters:0];

    [(CKPinnedConversationView *)self setDimmingFilter:0];
  }
}

- (void)setActivityItemBoundingFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_activityItemBoundingFrame = &self->_activityItemBoundingFrame;
  if (!CGRectEqualToRect(self->_activityItemBoundingFrame, a3))
  {
    p_activityItemBoundingFrame->origin.CGFloat x = x;
    p_activityItemBoundingFrame->origin.CGFloat y = y;
    p_activityItemBoundingFrame->size.CGFloat width = width;
    p_activityItemBoundingFrame->size.CGFloat height = height;
    [(CKPinnedConversationView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v155.receiver = self;
  v155.super_class = (Class)CKPinnedConversationView;
  [(CKPinnedConversationView *)&v155 layoutSubviews];
  [(CKPinnedConversationView *)self bounds];
  double v4 = v3;
  double v148 = v5;
  CGFloat rect = v3;
  double rect_24 = v6;
  double v7 = v5;
  double v9 = v8;
  double v147 = v8;
  -[CKPinnedConversationView avatarViewFrameForSize:layoutStyle:](self, "avatarViewFrameForSize:layoutStyle:", self->_layoutStyle, v5, v8);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(CKPinnedConversationView *)self avatarView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = [(CKPinnedConversationView *)self conversation];
  if ([v19 isBusinessConversation]) {
    double v20 = 0.0;
  }
  else {
    double v20 = v17 * 0.5;
  }
  v21 = [(CKPinnedConversationView *)self avatarView];
  v22 = [v21 layer];
  [v22 setCornerRadius:v20];

  v23 = [(CKPinnedConversationView *)self avatarSnapshotImageView];
  objc_msgSend(v23, "setFrame:", v11, v13, v15, v17);

  v24 = [(CKPinnedConversationView *)self activityView];
  objc_msgSend(v24, "setFrame:", v4, rect_24, v7, v9);

  v25 = [(CKPinnedConversationView *)self activityView];
  -[CKPinnedConversationView convertRect:toView:](self, "convertRect:toView:", v25, v11, v13, v15, v17);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(CKPinnedConversationView *)self activityView];
  objc_msgSend(v34, "setAvatarFrame:", v27, v29, v31, v33);

  v35 = [(CKPinnedConversationView *)self radiantShadowImageView];
  v36 = [v35 layer];
  objc_msgSend(v36, "setBounds:", 0.0, 0.0, v15, v17);

  v156.origin.CGFloat x = v11;
  v156.origin.CGFloat y = v13;
  v156.size.CGFloat width = v15;
  v156.size.CGFloat height = v17;
  double MidX = CGRectGetMidX(v156);
  CGFloat v144 = v13;
  CGFloat v145 = v11;
  v157.origin.CGFloat x = v11;
  v157.origin.CGFloat y = v13;
  double rect_8 = v17;
  double rect_16 = v15;
  v157.size.CGFloat width = v15;
  v157.size.CGFloat height = v17;
  double MidY = CGRectGetMidY(v157);
  v39 = [(CKPinnedConversationView *)self radiantShadowImageView];
  v40 = [v39 layer];
  objc_msgSend(v40, "setPosition:", MidX, MidY);

  v41 = [(CKPinnedConversationView *)self radiantShadowImageView];
  v42 = [v41 layer];
  [v42 setZPosition:-1.0];

  [(CKPinnedConversationView *)self _updateRadiantShadowAffineTranform];
  -[CKPinnedConversationView titleLabelSizeFittingSize:](self, "titleLabelSizeFittingSize:", v148, v147);
  double v44 = v43;
  double v46 = v45;
  [(id)objc_opt_class() titleLabelVerticalPadding];
  double v48 = v47;
  UIRoundToViewScale();
  double v50 = v49;
  v158.origin.CGFloat x = rect;
  v158.origin.CGFloat y = rect_24;
  v158.size.CGFloat width = v148;
  v158.size.CGFloat height = v147;
  double v51 = CGRectGetMaxY(v158) - v46 - v48;
  v52 = [(CKPinnedConversationView *)self titleLabel];
  objc_msgSend(v52, "setFrame:", v50, v51, v44, v46);

  [(CKPinnedConversationView *)self unreadIndicatorSize];
  double v54 = v53;
  double v56 = v55;
  [(CKPinnedConversationView *)self unreadIndicatorPreferredPadding];
  double v58 = v57;
  [(CKPinnedConversationView *)self unreadIndicatorMinimumPadding];
  double v60 = v59;
  int v61 = [(CKPinnedConversationView *)self _shouldReverseLayoutDirection];
  double v62 = v50;
  double v63 = v51;
  double v64 = v44;
  double v65 = v46;
  if (v61)
  {
    double v66 = v58 + CGRectGetMaxX(*(CGRect *)&v62);
    v159.size.CGFloat width = v148;
    v159.origin.CGFloat x = rect;
    v159.origin.CGFloat y = rect_24;
    v159.size.CGFloat height = v147;
    double v67 = CGRectGetMaxX(v159) - v60 - v54;
    if (v67 >= v66) {
      double v68 = v66;
    }
    else {
      double v68 = v67;
    }
  }
  else
  {
    double v69 = CGRectGetMinX(*(CGRect *)&v62) - v58 - v54;
    v160.size.CGFloat width = v148;
    v160.origin.CGFloat x = rect;
    v160.origin.CGFloat y = rect_24;
    v160.size.CGFloat height = v147;
    double v70 = v60 + CGRectGetMinX(v160);
    if (v70 >= v69) {
      double v68 = v70;
    }
    else {
      double v68 = v69;
    }
  }
  CGFloat v137 = v51;
  CGFloat v138 = v50;
  v161.origin.CGFloat x = v50;
  v161.origin.CGFloat y = v51;
  v161.size.CGFloat width = v44;
  v161.size.CGFloat height = v46;
  CGRectGetMidY(v161);
  UIRoundToViewScale();
  double v72 = v71;
  v73 = [(CKPinnedConversationView *)self unreadIndicator];
  objc_msgSend(v73, "setFrame:", v68, v72, v54, v56);

  double v74 = *MEMORY[0x1E4F1DB28];
  double v75 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v76 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v141 = v76;
  double v142 = v75;
  double v139 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v140 = *MEMORY[0x1E4F1DB28];
  double v146 = v139;
  if (!CGRectIsEmpty(self->_activityItemBoundingFrame))
  {
    int v77 = CKIsRunningInMacCatalyst();
    double v78 = 5.0;
    if (!v77) {
      double v78 = 0.0;
    }
    double v74 = self->_activityItemBoundingFrame.origin.x + 8.0;
    double v146 = self->_activityItemBoundingFrame.origin.y + v78;
    double v75 = self->_activityItemBoundingFrame.size.width + -16.0;
    double v76 = self->_activityItemBoundingFrame.size.height - v78;
  }
  CGFloat v143 = v75;
  v162.origin.CGFloat x = v145;
  v162.origin.CGFloat y = v144;
  v162.size.CGFloat width = rect_16;
  v162.size.CGFloat height = rect_8;
  double v79 = CGRectGetMinX(v162) + -8.0;
  v163.origin.CGFloat x = v145;
  v163.origin.CGFloat y = v144;
  v163.size.CGFloat width = rect_16;
  v163.size.CGFloat height = rect_8;
  CGFloat v80 = v75;
  double v81 = CGRectGetMaxX(v163) + 8.0;
  v164.size.CGFloat width = v148;
  v164.origin.CGFloat x = rect;
  v164.origin.CGFloat y = rect_24;
  v164.size.CGFloat height = v147;
  double MinY = CGRectGetMinY(v164);
  v165.origin.CGFloat y = v137;
  v165.origin.CGFloat x = v138;
  v165.size.CGFloat width = v44;
  v165.size.CGFloat height = v46;
  double v83 = v81 - v79;
  double v84 = CGRectGetMinY(v165) - MinY;
  v166.origin.CGFloat x = v74;
  v166.origin.CGFloat y = v146;
  v166.size.CGFloat width = v80;
  v166.size.CGFloat height = v76;
  CGFloat rect_24a = v84;
  if (!CGRectIsEmpty(v166))
  {
    v167.origin.CGFloat x = v79;
    v167.origin.CGFloat y = MinY;
    v167.size.CGFloat width = v81 - v79;
    v167.size.CGFloat height = v84;
    double MinX = CGRectGetMinX(v167);
    v168.origin.CGFloat x = v74;
    v168.origin.CGFloat y = v146;
    v168.size.CGFloat width = v80;
    v168.size.CGFloat height = v76;
    double v86 = CGRectGetMinX(v168);
    if (MinX < v86) {
      double MinX = v86;
    }
    v169.origin.CGFloat x = v79;
    v169.origin.CGFloat y = MinY;
    v169.size.CGFloat width = v81 - v79;
    v169.size.CGFloat height = rect_24a;
    double MaxX = CGRectGetMaxX(v169);
    v170.origin.CGFloat x = v74;
    v170.origin.CGFloat y = v146;
    v170.size.CGFloat width = v80;
    v170.size.CGFloat height = v76;
    double v88 = CGRectGetMaxX(v170);
    if (MaxX < v88) {
      double v88 = MaxX;
    }
    double v83 = v88 - MinX;
    double v79 = MinX;
    double v84 = rect_24a;
  }
  double v89 = MinY;
  if (self->_activityItemTopInset != 0.0)
  {
    v171.origin.CGFloat x = v79;
    v171.origin.CGFloat y = MinY;
    v171.size.CGFloat width = v83;
    v171.size.CGFloat height = v84;
    double v89 = CGRectGetMinY(v171) + self->_activityItemTopInset;
    v172.origin.CGFloat x = v79;
    v172.origin.CGFloat y = MinY;
    v172.size.CGFloat width = v83;
    v172.size.CGFloat height = v84;
    double v84 = CGRectGetHeight(v172) - self->_activityItemTopInset;
  }
  v90 = [(CKPinnedConversationView *)self activityView];
  objc_msgSend(v90, "setInnerContentAlignmentFrame:", v79, v89, v83, v84);

  v173.origin.CGFloat x = v145;
  v173.origin.CGFloat y = v144;
  v173.size.CGFloat width = rect_16;
  v173.size.CGFloat height = rect_8;
  double v91 = CGRectGetMinX(v173);
  v174.origin.CGFloat x = v145;
  v174.origin.CGFloat y = v144;
  v174.size.CGFloat width = rect_16;
  v174.size.CGFloat height = rect_8;
  double v92 = CGRectGetMinX(v174) - v91 - v91;
  v175.origin.CGFloat x = v145;
  v175.origin.CGFloat y = v144;
  v175.size.CGFloat width = rect_16;
  v175.size.CGFloat height = rect_8;
  double v93 = v91 + v91 + CGRectGetMaxX(v175) + 0.0 - v92;
  v176.origin.CGFloat x = v136;
  v176.origin.CGFloat y = v146;
  v176.size.CGFloat width = v143;
  v176.size.CGFloat height = v76;
  if (CGRectIsEmpty(v176))
  {
    CGFloat v94 = MinY;
  }
  else
  {
    v177.origin.CGFloat x = v92;
    v177.origin.CGFloat y = MinY;
    v177.size.CGFloat width = v93;
    v177.size.CGFloat height = rect_24a;
    double v95 = CGRectGetMinX(v177);
    v178.origin.CGFloat x = v136;
    v178.origin.CGFloat y = v146;
    v178.size.CGFloat width = v143;
    v178.size.CGFloat height = v76;
    double v96 = CGRectGetMinX(v178);
    if (v95 >= v96) {
      double v96 = v95;
    }
    double recta = v96;
    v179.origin.CGFloat x = v92;
    CGFloat v94 = MinY;
    v179.origin.CGFloat y = MinY;
    v179.size.CGFloat width = v93;
    v179.size.CGFloat height = rect_24a;
    double v97 = CGRectGetMaxX(v179);
    v180.origin.CGFloat x = v136;
    v180.origin.CGFloat y = v146;
    v180.size.CGFloat width = v143;
    v180.size.CGFloat height = v76;
    double v98 = CGRectGetMaxX(v180);
    if (v97 < v98) {
      double v98 = v97;
    }
    double v92 = recta;
    double v93 = v98 - recta;
  }
  double v100 = v139;
  double v99 = v140;
  if (self->_activityItemTopInset == 0.0)
  {
    double v102 = rect_24a;
    double v101 = v94;
  }
  else
  {
    v181.origin.CGFloat x = v92;
    v181.origin.CGFloat y = v94;
    v181.size.CGFloat width = v93;
    v181.size.CGFloat height = rect_24a;
    double v101 = CGRectGetMinY(v181) + self->_activityItemTopInset;
    v182.origin.CGFloat x = v92;
    v182.origin.CGFloat y = v94;
    v182.size.CGFloat width = v93;
    v182.size.CGFloat height = rect_24a;
    double v102 = CGRectGetHeight(v182) - self->_activityItemTopInset;
  }
  v103 = [(CKPinnedConversationView *)self activityView];
  objc_msgSend(v103, "setOuterContentAlignmentFrame:", v92, v101, v93, v102);

  v104 = [(CKPinnedConversationView *)self conversation];
  if (![v104 isAdHocGroupConversation]) {
    goto LABEL_36;
  }
  v105 = [(CKPinnedConversationView *)self avatarView];
  v106 = [v105 contacts];
  uint64_t v107 = [v106 count];

  if (v107)
  {
    v104 = [(CKPinnedConversationView *)self avatarView];
    v108 = [(CKPinnedConversationView *)self activityView];
    [v104 frameForAvatarAtIndex:0 inView:v108];
    double v99 = v109;
    double v100 = v110;
    double v141 = v112;
    double v142 = v111;

LABEL_36:
  }
  v113 = [(CKPinnedConversationView *)self activityView];
  objc_msgSend(v113, "setActivityItemOriginationSubAvatarFrame:", v99, v100, v142, v141);

  double v115 = *MEMORY[0x1E4F1DAD8];
  double v114 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v116 = *MEMORY[0x1E4F1DAD8];
  double v117 = v114;
  if (self->_avatarMouthRegion)
  {
    [(CKPinnedConversationView *)self _centerPointOfFaceLandmarkRegion:rect_16 inImageOfSize:rect_8];
    double v120 = v119;
    double v121 = v118;
    if (v119 != v115 || (double v116 = v115, v117 = v114, v118 != v114))
    {
      v122 = [(CKPinnedConversationView *)self avatarView];
      v123 = [(CKPinnedConversationView *)self activityView];
      objc_msgSend(v122, "convertPoint:toView:", v123, v120, v121);
      double v116 = v124;
      double v117 = v125;
    }
  }
  if (v116 == v115 && v117 == v114)
  {
    v183.origin.CGFloat x = v99;
    v183.origin.CGFloat y = v100;
    v183.size.CGFloat width = v142;
    v183.size.CGFloat height = v141;
    double v116 = CGRectGetMidX(v183);
    v184.origin.CGFloat x = v99;
    v184.origin.CGFloat y = v100;
    v184.size.CGFloat width = v142;
    v184.size.CGFloat height = v141;
    double v117 = CGRectGetMidY(v184);
  }
  if (v116 == v115 && v117 == v114)
  {
    v185.origin.CGFloat x = v145;
    v185.origin.CGFloat y = v144;
    v185.size.CGFloat width = rect_16;
    v185.size.CGFloat height = rect_8;
    double v126 = CGRectGetMidX(v185);
    v186.origin.CGFloat x = v145;
    v186.origin.CGFloat y = v144;
    v186.size.CGFloat width = rect_16;
    v186.size.CGFloat height = rect_8;
    double v127 = CGRectGetMidY(v186);
    v128 = [(CKPinnedConversationView *)self activityView];
    -[CKPinnedConversationView convertPoint:toView:](self, "convertPoint:toView:", v128, v126, v127);
    double v116 = v129;
    double v117 = v130;
  }
  v131 = [(CKPinnedConversationView *)self activityView];
  objc_msgSend(v131, "setActivityItemOriginationPoint:", v116, v117);

  v132 = [(CKPinnedConversationView *)self avatarView];
  v133 = [v132 layer];
  [v133 setZPosition:0.0];

  v134 = [(CKPinnedConversationView *)self radiantShadowImageView];
  v135 = [v134 layer];
  [v135 setZPosition:-1.0];
}

- (void)_updateRadiantShadowAffineTranform
{
  double v3 = [(CKPinnedConversationView *)self avatarView];
  [v3 frame];
  CGFloat v5 = v4 * 0.136363636;

  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, 0.875, 0.875);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeTranslation(&v13, 0.0, v5);
  CGAffineTransform t1 = v14;
  memset(&v12, 0, sizeof(v12));
  CGAffineTransform t2 = v13;
  CGAffineTransformConcat(&v12, &t1, &t2);
  CGAffineTransform v9 = v12;
  double v6 = [(CKPinnedConversationView *)self radiantShadowImageView];
  double v7 = [v6 layer];
  CGAffineTransform v8 = v9;
  [v7 setAffineTransform:&v8];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  objc_msgSend((id)objc_opt_class(), "avatarViewSizeFittingSize:layoutStyle:", self->_layoutStyle, a3.width, 1.79769313e308);
  double v6 = v5;
  -[CKPinnedConversationView titleLabelSizeFittingSize:](self, "titleLabelSizeFittingSize:", width, 1.79769313e308);
  double v8 = v7;
  [(id)objc_opt_class() avatarViewPadding];
  double v10 = v9;
  double v12 = v11;
  [(id)objc_opt_class() titleLabelVerticalPadding];
  double v15 = v14 + v8 + v12 + v6 + v10 + v13;
  double v16 = width;
  result.CGFloat height = v15;
  result.double width = v16;
  return result;
}

+ (CGSize)avatarViewSizeFittingSize:(CGSize)a3 layoutStyle:(int64_t)a4
{
  objc_msgSend(a1, "_maximumAvatarViewWidthFittingSize:", a3.width, a3.height);
  double v7 = v6;
  [a1 _preferredAvatarViewDiameterForLayoutStyle:a4];
  if (v7 < v8) {
    double v8 = v7;
  }
  double v9 = v8;
  result.CGFloat height = v9;
  result.double width = v8;
  return result;
}

+ (double)_maximumAvatarViewWidthFittingSize:(CGSize)a3
{
  double width = a3.width;
  [(id)objc_opt_class() avatarViewPadding];
  return width - v4 - v5;
}

+ (double)_preferredAvatarViewDiameterForLayoutStyle:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)a3 <= 6) {
    return dbl_18F81D9D0[a3];
  }
  return result;
}

- (CGRect)avatarViewFrameForSize:(CGSize)a3 layoutStyle:(int64_t)a4
{
  objc_msgSend((id)objc_opt_class(), "avatarViewSizeFittingSize:layoutStyle:", a4, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(id)objc_opt_class() avatarViewPadding];
  double v9 = v8;
  UIRoundToViewScale();
  double v11 = v9;
  double v12 = v5;
  double v13 = v7;
  result.size.CGFloat height = v13;
  result.size.double width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGSize)titleLabelSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(UIImageView *)self->_unreadIndicator image];

  if (v6)
  {
    [(CKPinnedConversationView *)self unreadIndicatorSize];
    double v8 = v7;
    [(CKPinnedConversationView *)self unreadIndicatorMinimumPadding];
    double v11 = v10 + v8 + v9;
  }
  else
  {
    double v12 = +[CKUIBehavior sharedBehaviors];
    [v12 pinnedConversationViewTitleLabelToEdgePaddingWhenNoUnreadIndicator];
    double v11 = v13;
  }
  double v14 = width + v11 * -2.0;
  double v15 = [(CKPinnedConversationView *)self titleLabel];
  objc_msgSend(v15, "sizeThatFits:", v14, height);
  double v17 = v16;
  double v19 = v18;

  if (v14 >= v17) {
    double v20 = v17;
  }
  else {
    double v20 = v14;
  }
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)didEndDisplaying
{
  [(CKPinnedConversationActivityView *)self->_activityView resetToEmptySnapshot];

  [(CKPinnedConversationView *)self setAvatarSnapshot:0];
}

- (void)prepareForReuse
{
  [(CKPinnedConversationView *)self setAvatarSnapshot:0];
  [(CKPinnedConversationActivityView *)self->_activityView resetToEmptySnapshot];
  activeActivitySuppressionReasons = self->_activeActivitySuppressionReasons;

  [(NSMutableArray *)activeActivitySuppressionReasons removeAllObjects];
}

+ (UIEdgeInsets)avatarViewPadding
{
  int v2 = CKIsRunningInMacCatalyst();
  double v3 = 10.0;
  double v4 = 8.0;
  if (v2) {
    double v4 = 10.0;
  }
  else {
    double v3 = 5.0;
  }
  double v5 = 0.0;
  double v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (void)setNeedsUnreadIndicatorLeadingEdgePadding:(BOOL)a3
{
  if (self->_needsUnreadIndicatorLeadingEdgePadding != a3)
  {
    self->_needsUnreadIndicatorLeadingEdgePadding = a3;
    [(CKPinnedConversationView *)self setNeedsLayout];
  }
}

- (double)_unreadIndicatorLeadingEdgePadding
{
  if (!self->_needsUnreadIndicatorLeadingEdgePadding) {
    return 0.0;
  }
  int v2 = +[CKUIBehavior sharedBehaviors];
  [v2 conversationListCellHighlightViewToUnreadIndicatorPadding];
  double v4 = v3;

  return v4;
}

+ (UIEdgeInsets)titleLabelVerticalPadding
{
  int v2 = +[CKUIBehavior sharedBehaviors];
  [v2 conversationListPinnedCellTitleLabelVerticalPadding];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)unreadIndicatorSize
{
  int v2 = +[CKUIBehavior sharedBehaviors];
  [v2 unreadIndicatorImageViewSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (NSDirectionalEdgeInsets)unreadIndicatorPreferredPadding
{
  [(CKPinnedConversationView *)self _unreadIndicatorLeadingEdgePadding];
  double v3 = v2;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 3.0;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v3;
  result.top = v4;
  return result;
}

- (NSDirectionalEdgeInsets)unreadIndicatorMinimumPadding
{
  [(CKPinnedConversationView *)self _unreadIndicatorLeadingEdgePadding];
  double v3 = v2;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 1.0;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v3;
  result.top = v4;
  return result;
}

- (void)updateActivityViewAnimated:(BOOL)a3 completion:(id)a4
{
  if (self->_activityView)
  {
    BOOL v4 = a3;
    id v6 = a4;
    id v13 = [(CKPinnedConversationView *)self conversation];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v8 = [WeakRetained previousPinnedConversationActivitySnapshotForConversation:v13];

    if (v13)
    {
      double v9 = [CKPinnedConversationActivitySnapshot alloc];
      double v10 = [(CKPinnedConversationView *)self recentMessagesInPinnedConversations];
      double v11 = [(CKPinnedConversationActivitySnapshot *)v9 initWithConversation:v13 recentMessagesInPinnedConversations:v10 previousSnapshot:v8];
    }
    else
    {
      double v11 = +[CKPinnedConversationActivitySnapshot emptySnapshot];
    }
    [(CKPinnedConversationActivityView *)self->_activityView applySnapshot:v11 animated:v4 completion:v6];

    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 pinnedConversationView:self didUpdateWithActivitySnapshot:v11];

    if ([v13 isAdHocGroupConversation]) {
      [(CKPinnedConversationView *)self _updateAvatarView];
    }
  }
}

- (void)reapplyPreviouslyDisplayedActivitySnapshot:(id)a3
{
  if (a3) {
    [(CKPinnedConversationActivityView *)self->_activityView applySnapshot:a3 animated:0 completion:0];
  }
}

- (void)setPreferShortConversationName:(BOOL)a3
{
  if (self->_preferShortConversationName != a3)
  {
    self->_preferShortConversationName = a3;
    [(CKPinnedConversationView *)self _updateTitleLabel];
  }
}

- (void)_updateTitleLabelWithText:(id)a3
{
  id v4 = a3;
  id v5 = [(CKPinnedConversationView *)self titleLabel];
  [v5 setText:v4];
}

+ (int64_t)_titleIconImageTypeForConversation:(id)a3
{
  return [a3 shouldShowVerifiedCheckmark];
}

- (void)_updateTitleLabel
{
  id v4 = [(CKConversation *)self->_conversation pinnedConversationDisplayNamePreferringShortName:[(CKPinnedConversationView *)self preferShortConversationName]];
  [(CKPinnedConversationView *)self _updateTitleLabelWithText:v4];
  double v3 = [(CKPinnedConversationView *)self titleLabel];
  objc_msgSend(v3, "setTitleIconImageType:", +[CKPinnedConversationView _titleIconImageTypeForConversation:](CKPinnedConversationView, "_titleIconImageTypeForConversation:", self->_conversation));
}

- (void)_updateTitleLabelFont
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  id v5 = [v3 conversationListPinnedConversationNameFont];

  id v4 = [(CKPinnedConversationView *)self titleLabel];
  [v4 setFont:v5];
}

- (void)setIsSelectedWithDarkAppearance:(BOOL)a3
{
  if (self->_isSelectedWithDarkAppearance != a3)
  {
    self->_isSelectedWithDarkAppearance = a3;
    [(CKPinnedConversationView *)self _updateTitleLabelColor];
    [(CKPinnedConversationView *)self _updateUnreadIndicator];
  }
}

- (void)_updateTitleLabelColor
{
  BOOL v3 = [(CKPinnedConversationView *)self isSelectedWithDarkAppearance];
  id v4 = +[CKUIBehavior sharedBehaviors];
  id v5 = [v4 theme];
  id v6 = v5;
  if (v3) {
    [v5 conversationListPinnedConversationNameSelectedColor];
  }
  else {
  id v7 = [v5 conversationListPinnedConversationNameColor];
  }

  [(CKLabel *)self->_titleLabel setColor:v7];
}

- (void)_updateUnreadIndicator
{
  id v10 = [(CKPinnedConversationView *)self _unreadIndicatorImage];
  BOOL v3 = [(CKPinnedConversationView *)self unreadIndicator];
  id v4 = v3;
  if (v10)
  {
    [v3 setImage:v10];

    id v5 = [(CKPinnedConversationView *)self _unreadIndicatorColor];
    id v6 = [(CKPinnedConversationView *)self unreadIndicator];
    [v6 setTintColor:v5];

    id v7 = [(CKPinnedConversationView *)self unreadIndicator];
    double v8 = v7;
    uint64_t v9 = 0;
  }
  else
  {
    [v3 setImage:0];

    id v7 = [(CKPinnedConversationView *)self unreadIndicator];
    double v8 = v7;
    uint64_t v9 = 1;
  }
  [v7 setHidden:v9];
}

- (id)_unreadIndicatorImage
{
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isCarrierPigeonEnabled];

  if (v4) {
    BOOL v5 = [(CKPinnedConversationView *)self _shouldShowSummaryForSatelliteMessages];
  }
  else {
    BOOL v5 = 0;
  }
  BOOL v6 = [(CKConversation *)self->_conversation hasUnreadMessages];
  if ([(CKPinnedConversationView *)self isFilteredByFocus])
  {
    id v7 = +[CKUIBehavior sharedBehaviors];
    uint64_t v8 = [v7 pinnedConversationFilteredByFocusIndicatorImage];
LABEL_8:
    uint64_t v9 = (void *)v8;

    goto LABEL_10;
  }
  if (v6 || v5)
  {
    id v7 = +[CKUIBehavior sharedBehaviors];
    uint64_t v8 = [v7 unreadIndicatorUntintedImage];
    goto LABEL_8;
  }
  uint64_t v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)_shouldShowSummaryForSatelliteMessages
{
  BOOL v3 = [MEMORY[0x1E4F6BC48] sharedInstance];
  int v4 = [v3 isSatelliteConnectionActive];

  if (v4)
  {
    BOOL v5 = [(CKPinnedConversationView *)self conversation];

    if (v5)
    {
      BOOL v6 = [(CKPinnedConversationView *)self conversation];
      id v7 = [v6 chat];

      if ([v7 pendingIncomingSatelliteMessageCount]) {
        LODWORD(v5) = [v7 isDownloadingPendingSatelliteMessages] ^ 1;
      }
      else {
        LOBYTE(v5) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (id)_unreadIndicatorColor
{
  if ([(CKPinnedConversationView *)self isFilteredByFocus])
  {
    BOOL v3 = +[CKUIBehavior sharedBehaviors];
    int v4 = [v3 theme];
    uint64_t v5 = [v4 conversationListPinnedConversationFilteredByFocusIndicatorColor];
  }
  else
  {
    BOOL v6 = [(CKPinnedConversationView *)self isSelectedWithDarkAppearance];
    BOOL v3 = +[CKUIBehavior sharedBehaviors];
    id v7 = [v3 theme];
    int v4 = v7;
    if (v6) {
      [v7 readSelectedIndicatorColor];
    }
    else {
    uint64_t v5 = [v7 unreadIndicatorColor];
    }
  }
  uint64_t v8 = (void *)v5;

  return v8;
}

- (BOOL)_activityIsSuppressedForLayoutStyle:(int64_t)a3
{
  return a3 == 4;
}

- (void)configureAsPrototypeCell
{
}

- (void)_updateAvatarMouthRegion
{
  if ([(id)objc_opt_class() _mouthRegionDetectionEnabled])
  {
    BOOL v3 = [(CKPinnedConversationView *)self conversation];
    if ([(CKPinnedConversationView *)self showsLiveActivity]
      && [v3 recipientCount] == 1)
    {
      int v4 = [v3 recipient];
      uint64_t v5 = [(id)objc_opt_class() _requiredContactKeys];
      BOOL v6 = [v4 cnContactWithKeys:v5];
      id v7 = [(id)objc_opt_class() _cachedMouthRegionForContact:v6];
      avatarMouthRegion = self->_avatarMouthRegion;
      self->_avatarMouthRegion = v7;

      uint64_t v9 = [(id)objc_opt_class() _mouthRegionForContactImageCacheKeyForContact:v6];
      id location = 0;
      objc_initWeak(&location, self);
      id v10 = objc_opt_class();
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      double v16 = __52__CKPinnedConversationView__updateAvatarMouthRegion__block_invoke;
      double v17 = &unk_1E562B620;
      objc_copyWeak(&v20, &location);
      id v11 = v6;
      id v18 = v11;
      id v12 = v9;
      id v19 = v12;
      [v10 _updateCachedMouthRegionIfNecessaryForContact:v11 completion:&v14];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    else
    {
      id v13 = self->_avatarMouthRegion;
      self->_avatarMouthRegion = 0;
    }
    [(CKPinnedConversationView *)self setNeedsLayout];
  }
}

void __52__CKPinnedConversationView__updateAvatarMouthRegion__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  BOOL v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = [WeakRetained avatarView];
  BOOL v6 = [v5 contacts];
  uint64_t v7 = [v6 count];

  if (v7 == 1)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v9 = [(id)objc_opt_class() _mouthRegionForContactImageCacheKeyForContact:*(void *)(a1 + 32)];

    if ([v9 isEqualToString:*(void *)(a1 + 40)])
    {
      id v10 = objc_loadWeakRetained((id *)(a1 + 48));
      [v10 setAvatarMouthRegion:v12];

      id v11 = objc_loadWeakRetained(v3);
      [v11 setNeedsLayout];
    }
  }
}

- (void)_updateAvatarView
{
  id v16 = [(CKPinnedConversationView *)self conversation];
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v3 avatarViewAllowsStaleRendering])
  {
    BOOL v4 = [(CNAvatarView *)self->_avatarView isDisplayingContent];

    if (v4) {
      [(CNAvatarView *)self->_avatarView setAllowStaleRendering:1];
    }
  }
  else
  {
  }
  uint64_t v5 = [v16 chat];
  BOOL v6 = [v5 chatIdentifier];
  [(CKAvatarView *)self->_avatarView _ck_setContextToken:v6];

  uint64_t v7 = [MEMORY[0x1E4F1BB38] maxContactAvatars];
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v9 = [v16 conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:v7];
  uint64_t v10 = [(CKPinnedConversationActivityView *)self->_activityView displayedContacts];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = v8;
  }
  id v13 = v12;

  uint64_t v14 = objc_msgSend(v9, "ck_contactInstancesMatchingContacts:", v13);

  id v15 = [(CNAvatarView *)self->_avatarView updateViewWithGroupIdentity:v9 maskingContacts:v14];
  -[CNAvatarView setStyle:](self->_avatarView, "setStyle:", [v16 shouldHaveRoundRectAvatar]);
  [(CKPinnedConversationView *)self setNeedsLayout];
}

- (void)_updateRadiantShadowImageView
{
  BOOL v3 = [(CKConversation *)self->_conversation isAdHocGroupConversation];
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = +[CKUIBehavior sharedBehaviors];
    BOOL v6 = [v5 pinnedAdHocConversationRadiantShadowImage];

    uint64_t v7 = +[CKUIBehavior sharedBehaviors];
    id v8 = [v7 theme];
    uint64_t v9 = [v8 conversationListPinnedAdHocConversationRadiantShadowColor];

    double v10 = 1.0;
  }
  else
  {
    avatarSnapshot = self->_avatarSnapshot;
    if (avatarSnapshot)
    {
      BOOL v6 = avatarSnapshot;
    }
    else
    {
      id v12 = [(CKPinnedConversationView *)self avatarView];
      BOOL v6 = [v12 contentImage];
    }
    uint64_t v9 = 0;
    double v10 = 0.3;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v14 setValue:@"low" forKeyPath:*MEMORY[0x1E4F3A1D0]];
  [v14 setValue:&unk_1EDF17528 forKeyPath:*MEMORY[0x1E4F3A1D8]];
  uint64_t v15 = MEMORY[0x1E4F1CC28];
  [v14 setValue:MEMORY[0x1E4F1CC28] forKeyPath:*MEMORY[0x1E4F3A1A0]];
  [v14 setValue:v15 forKeyPath:*MEMORY[0x1E4F3A1B8]];
  [v14 setValue:v15 forKeyPath:*MEMORY[0x1E4F3A170]];
  [v14 setValue:v15 forKeyPath:*MEMORY[0x1E4F3A1B0]];
  [v13 addObject:v14];
  if (!v4)
  {
    id v16 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
    [v16 setValue:&unk_1EDF17538 forKeyPath:*MEMORY[0x1E4F3A100]];
    [v13 addObject:v16];

    double v17 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
    v21[0] = xmmword_18F81D990;
    v21[1] = xmmword_18F81D9A0;
    v21[2] = xmmword_18F81D9B0;
    v21[3] = xmmword_18F81D9C0;
    v21[4] = xmmword_18F81CC20;
    id v18 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v21];
    [v17 setValue:v18 forKey:*MEMORY[0x1E4F3A168]];
    [v13 addObject:v17];
  }
  [(UIImageView *)self->_radiantShadowImageView setAlpha:v10];
  [(UIImageView *)self->_radiantShadowImageView setImage:v6];
  [(UIImageView *)self->_radiantShadowImageView setTintColor:v9];
  id v19 = (void *)[v13 copy];
  id v20 = [(UIImageView *)self->_radiantShadowImageView layer];
  [v20 setFilters:v19];
}

+ (id)_requiredContactKeys
{
  v5[2] = *MEMORY[0x1E4F143B8];
  if ([a1 _mouthRegionDetectionEnabled])
  {
    uint64_t v2 = *MEMORY[0x1E4F1AF98];
    v5[0] = *MEMORY[0x1E4F1AE30];
    v5[1] = v2;
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  }
  else
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  return 0;
}

+ (id)_mouthRegionForContactImageCache
{
  if (_mouthRegionForContactImageCache_onceToken != -1) {
    dispatch_once(&_mouthRegionForContactImageCache_onceToken, &__block_literal_global_230);
  }
  uint64_t v2 = (void *)_mouthRegionForContactImageCache_mouthRegionCache;

  return v2;
}

void __60__CKPinnedConversationView__mouthRegionForContactImageCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  uint64_t v1 = (void *)_mouthRegionForContactImageCache_mouthRegionCache;
  _mouthRegionForContactImageCache_mouthRegionCache = (uint64_t)v0;
}

+ (id)_mouthRegionDetectionDispatchQueue
{
  if (_mouthRegionDetectionDispatchQueue_onceToken != -1) {
    dispatch_once(&_mouthRegionDetectionDispatchQueue_onceToken, &__block_literal_global_82_0);
  }
  uint64_t v2 = (void *)_mouthRegionDetectionDispatchQueue_queue;

  return v2;
}

void __62__CKPinnedConversationView__mouthRegionDetectionDispatchQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.messages.mouth-region-detection", v2);
  uint64_t v1 = (void *)_mouthRegionDetectionDispatchQueue_queue;
  _mouthRegionDetectionDispatchQueue_queue = (uint64_t)v0;
}

+ (id)_mouthRegionForContactImageCacheKeyForContact:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 imageHash];
  uint64_t v5 = [v4 base64EncodedStringWithOptions:0];

  if (![v5 length])
  {
    uint64_t v6 = [v3 identifier];

    uint64_t v5 = (void *)v6;
  }

  return v5;
}

+ (id)_cachedMouthRegionForContact:(id)a3
{
  BOOL v4 = [a1 _mouthRegionForContactImageCacheKeyForContact:a3];
  uint64_t v5 = [a1 _mouthRegionForContactImageCache];
  uint64_t v6 = [v5 objectForKey:v4];
  MEMORY[0x192FBA860](@"VNFaceLandmarkRegion2D", @"Vision");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (void)_updateCachedMouthRegionIfNecessaryForContact:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _mouthRegionForContactImageCacheKeyForContact:v6];
  uint64_t v9 = [a1 _mouthRegionForContactImageCache];
  double v10 = [v9 objectForKey:v8];
  if (v10)
  {
    MEMORY[0x192FBA860](@"VNFaceLandmarkRegion2D", @"Vision");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v7;
      id v12 = v10;
    }
    else
    {
      id v11 = v7;
      id v12 = 0;
    }
    (*((void (**)(id, void *, void))v7 + 2))(v11, v12, 0);
  }
  else
  {
    id v13 = [a1 _mouthRegionDetectionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke;
    block[3] = &unk_1E562B698;
    id v19 = a1;
    id v15 = v6;
    id v16 = v9;
    id v17 = v8;
    id v18 = v7;
    dispatch_async(v13, block);
  }
}

void __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke_2;
  v4[3] = &unk_1E562B670;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 _determineMouthRegionForContact:v3 completion:v4];
}

void __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke_3;
  block[3] = &unk_1E562B648;
  id v11 = v5;
  id v12 = a1[4];
  id v13 = a1[5];
  id v7 = a1[6];
  id v14 = v6;
  id v15 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  id v4 = v3;
  [*(id *)(a1 + 40) setObject:v3 forKey:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

+ (void)_determineMouthRegionForContact:(id)a3 completion:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void, id))a4;
  id v7 = objc_alloc_init((Class)MEMORY[0x192FBA860](@"VNDetectFaceLandmarksRequest", @"Vision"));
  [v7 setRevision:3];
  [v7 setConstellation:2];
  id v8 = [v5 thumbnailImageData];
  id v9 = objc_msgSend(objc_alloc((Class)MEMORY[0x192FBA860](@"VNImageRequestHandler", @"Vision")), "initWithData:orientation:options:", v8, 4, MEMORY[0x1E4F1CC08]);
  if (_IMWillLog())
  {
    v25 = [v5 identifier];
    _IMAlwaysLog();
  }
  v40[0] = v7;
  double v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v40, 1, v25);
  id v38 = 0;
  int v11 = [v9 performRequests:v10 error:&v38];
  id v12 = v38;

  if (_IMWillLog())
  {
    double v26 = [v5 identifier];
    _IMAlwaysLog();
  }
  if (v11)
  {
    double v30 = v9;
    double v31 = v8;
    double v32 = v6;
    double v33 = v5;
    id v13 = [v7 results];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          MEMORY[0x192FBA860](@"VNFaceObservation", @"Vision");
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v14 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v17);
    }

    if ([v14 count] == 1)
    {
      double v21 = [v14 firstObject];
      v22 = [v21 landmarks];
      v23 = [v22 outerLips];
      int v24 = _IMWillLog();
      id v6 = v32;
      id v5 = v33;
      if (v23)
      {
        if (v24)
        {
          double v27 = [v33 identifier];
          _IMAlwaysLog();
        }
        ((void (**)(id, void *, id))v32)[2](v32, v23, 0);
      }
      else
      {
        if (v24)
        {
          double v29 = [v33 identifier];
          _IMAlwaysLog();
        }
        v32[2](v32, 0, 0);
      }
    }
    else
    {
      id v6 = v32;
      id v5 = v33;
      if (_IMWillLog())
      {
        double v28 = [v33 identifier];
        _IMAlwaysLog();
      }
      v32[2](v32, 0, 0);
    }

    id v9 = v30;
    id v8 = v31;
  }
  else
  {
    _IMWarn();
    v6[2](v6, 0, v12);
  }
}

- (CGPoint)_centerPointOfFaceLandmarkRegion:(id)a3 inImageOfSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "pointsInImageOfSize:", width, height);
  uint64_t v8 = [v6 pointCount];
  if (v7 && v8 >= 1)
  {
    uint64_t v9 = 0;
    float64x2_t v10 = 0uLL;
    do
      float64x2_t v10 = vaddq_f64(v10, *(float64x2_t *)(v7 + 16 * v9++));
    while (v8 != v9);
    float64x2_t v11 = vdivq_f64(v10, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v8), 0));
  }
  else
  {
    float64x2_t v11 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
  }
  float64x2_t v14 = v11;

  double v13 = v14.f64[1];
  double v12 = v14.f64[0];
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

+ (BOOL)_mouthRegionDetectionEnabled
{
  if (_mouthRegionDetectionEnabled_onceToken != -1) {
    dispatch_once(&_mouthRegionDetectionEnabled_onceToken, &__block_literal_global_120_2);
  }
  return _mouthRegionDetectionEnabled_mouthRegionDetectionEnabled;
}

uint64_t __56__CKPinnedConversationView__mouthRegionDetectionEnabled__block_invoke()
{
  uint64_t result = IMGetCachedDomainBoolForKeyWithDefaultValue();
  _mouthRegionDetectionEnabled_mouthRegionDetectionEnabled = result;
  return result;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (NSArray)recentMessagesInPinnedConversations
{
  return self->_recentMessagesInPinnedConversations;
}

- (BOOL)showsLiveActivity
{
  return self->_showsLiveActivity;
}

- (BOOL)preferShortConversationName
{
  return self->_preferShortConversationName;
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (UIImage)avatarSnapshot
{
  return self->_avatarSnapshot;
}

- (CKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)unreadIndicator
{
  return self->_unreadIndicator;
}

- (void)setUnreadIndicator:(id)a3
{
}

- (UIImageView)radiantShadowImageView
{
  return self->_radiantShadowImageView;
}

- (void)setRadiantShadowImageView:(id)a3
{
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)needsUnreadIndicatorLeadingEdgePadding
{
  return self->_needsUnreadIndicatorLeadingEdgePadding;
}

- (BOOL)isSelectedWithDarkAppearance
{
  return self->_isSelectedWithDarkAppearance;
}

- (CGRect)activityItemBoundingFrame
{
  double x = self->_activityItemBoundingFrame.origin.x;
  double y = self->_activityItemBoundingFrame.origin.y;
  double width = self->_activityItemBoundingFrame.size.width;
  double height = self->_activityItemBoundingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)activityItemTopInset
{
  return self->_activityItemTopInset;
}

- (void)setActivityItemTopInset:(double)a3
{
  self->_activityItemTopInset = a3;
}

- (BOOL)isFilteredByFocus
{
  return self->_isFilteredByFocus;
}

- (CKPinnedConversationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKPinnedConversationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CAFilter)dimmingFilter
{
  return self->_dimmingFilter;
}

- (void)setDimmingFilter:(id)a3
{
}

- (CKPinnedConversationActivityView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
}

- (UIImageView)avatarSnapshotImageView
{
  return self->_avatarSnapshotImageView;
}

- (void)setAvatarSnapshotImageView:(id)a3
{
}

- (VNFaceLandmarkRegion2D)avatarMouthRegion
{
  return self->_avatarMouthRegion;
}

- (void)setAvatarMouthRegion:(id)a3
{
}

- (NSMutableArray)activeActivitySuppressionReasons
{
  return self->_activeActivitySuppressionReasons;
}

- (void)setActiveActivitySuppressionReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeActivitySuppressionReasons, 0);
  objc_storeStrong((id *)&self->_avatarMouthRegion, 0);
  objc_storeStrong((id *)&self->_avatarSnapshotImageView, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_dimmingFilter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radiantShadowImageView, 0);
  objc_storeStrong((id *)&self->_unreadIndicator, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_avatarSnapshot, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_recentMessagesInPinnedConversations, 0);

  objc_storeStrong((id *)&self->_conversation, 0);
}

@end