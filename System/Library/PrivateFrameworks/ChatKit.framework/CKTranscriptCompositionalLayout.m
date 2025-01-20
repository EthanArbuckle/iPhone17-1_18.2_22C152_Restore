@interface CKTranscriptCompositionalLayout
+ (Class)layoutAttributesClass;
+ (double)bottomTranscriptSpaceWithLastChatItem:(id)a3;
+ (int64_t)translateLayoutIndexToEffectIndex:(int64_t)a3;
- (BOOL)_dynamicsAreEnabled;
- (BOOL)disableDynamicsWhileScrolling;
- (BOOL)hasLoadMore;
- (BOOL)isHoldingBoundsInvalidation;
- (BOOL)isInBackground;
- (BOOL)isInlineAnimatingOut;
- (BOOL)isResting;
- (BOOL)isUsingInitialLayoutAttributesForRotation;
- (BOOL)isUsingOverlayLayout;
- (BOOL)needsAdditionalBracketPaddingForChatItem:(id)a3 prevChatItem:(id)a4;
- (BOOL)nextItemIsOriginatorWithRepliesForIndex:(unint64_t)a3;
- (BOOL)nextMessageIsReplyForIndex:(unint64_t)a3;
- (BOOL)previousReplyCount:(unint64_t)a3 isOccludedForAssociatedFrame:(CGRect)a4 outMaxY:(double *)a5;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)sizeCategoryIsAccessibilitySizeCategory;
- (CGPoint)targetContentOffset;
- (CGRect)_convertScreenFrameToLocalFrame:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (CGSize)sizeForRotation;
- (CKTranscriptCompositionalLayout)initWithSectionProvider:(id)a3;
- (IMScheduledUpdater)dynamicsUpdater;
- (NSArray)associatedLayoutAttributes;
- (NSArray)decorationLayoutAttributes;
- (NSArray)layoutAttributes;
- (NSArray)oldAssociatedLayoutAttributes;
- (NSIndexSet)indicesOfChatItemsToBeInsertedWithoutFading;
- (NSIndexSet)indicesOfChatItemsToBeRemovedWithoutFading;
- (NSIndexSet)indicesOfReplyChatItemsToBeInserted;
- (NSMutableDictionary)finalParentVerticalOffsets;
- (NSMutableDictionary)initialParentLayoutAttributes;
- (NSMutableIndexSet)insertedAssociatedLayoutAttributes;
- (UIEdgeInsets)_visibleRectInsectsForMaxYAnchorLayoutAttribute:(id)a3 forVisibleBounds:(CGRect)a4;
- (_UIUpdateSequenceItemInternal)dynamicsUpdateSequenceItem;
- (double)anchorYPosition;
- (double)bezierPointForPercentage:(double)a3 anchor1:(double)a4 anchor2:(double)a5 control1:(double)a6 control2:(double)a7;
- (double)handleInvalidCaseForChatItem:(id)a3 withPrevChatItem:(id)a4;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (int64_t)effectIndexForDecorationViewAtIndex:(int64_t)a3;
- (unsigned)chatStyle;
- (void)_applyAttributeUpdatesWithTargetMap:(id)a3 layoutAttributes:(id)a4 updateBlock:(id)a5;
- (void)_applyCurrentFrameOffsetsForLayoutAttributesIfNeeded:(id)a3;
- (void)_applyHorizontalOffsetFromMapping:(id)a3 toLayoutAttributes:(id)a4;
- (void)_applyTargetFrameOffsetsForLayoutAttributesIfNeeded:(id)a3;
- (void)_configureDisplayLink;
- (void)_configureThreadGroupsForAttributes:(id)a3 outMaxYAnchorAttribute:(id *)a4 forVisibleBounds:(CGRect)a5;
- (void)_configureUpdateSequenceItem;
- (void)_dealloc;
- (void)_kickDynamicsIfNeeded;
- (void)_resetHorizontalBalloonOffsetsForLayoutAttributes:(id)a3 includeAssociatedAttributes:(BOOL)a4;
- (void)_sceneActivationStateDidChange:(id)a3;
- (void)_updateAssociatedAttributeFramesForPrimaryAttribute:(id)a3;
- (void)_updateAttributeZIndex:(id)a3 forEffect:(id)a4;
- (void)_updateCurrentBalloonOffsetForLayoutAttributes:(id)a3;
- (void)applyDynamicScrollResistanceToItemsForScrollDeltaY:(double)a3;
- (void)beginHoldingDynamicsUpdatesForKey:(id)a3;
- (void)checkDynamicsWatchdog;
- (void)clearParentInitialIndexesAndFinalOffsets;
- (void)dealloc;
- (void)displayLinkFired:(id)a3;
- (void)endHoldingDynamicsUpdatesForKey:(id)a3;
- (void)invalidateDisplayLink;
- (void)invalidateLayout;
- (void)prepareLayout;
- (void)prepareLayoutForRotisserieScrolling;
- (void)reduceMotionSettingChanged:(id)a3;
- (void)reloadData;
- (void)reloadLayout;
- (void)removeUpdateSequenceItem;
- (void)setAnchorYPosition:(double)a3;
- (void)setAssociatedLayoutAttributes:(id)a3;
- (void)setChatStyle:(unsigned __int8)a3;
- (void)setContentSize:(CGFloat)a3;
- (void)setDecorationLayoutAttributes:(id)a3;
- (void)setDisableDynamicsWhileScrolling:(BOOL)a3;
- (void)setDisplayLink:(uint64_t)a1;
- (void)setDynamicsUpdateSequenceItem:(_UIUpdateSequenceItemInternal *)a3;
- (void)setDynamicsUpdater:(id)a3;
- (void)setFinalParentVerticalOffsets:(id)a3;
- (void)setHasLoadMore:(BOOL)a3;
- (void)setHoldingBoundsInvalidation:(BOOL)a3;
- (void)setIndicesOfChatItemsToBeInsertedWithoutFading:(id)a3;
- (void)setIndicesOfChatItemsToBeRemovedWithoutFading:(id)a3;
- (void)setIndicesOfReplyChatItemsToBeInserted:(id)a3;
- (void)setInitialIndex:(unint64_t)a3 forParentOfAssociatedItemInsertedAtIndex:(unint64_t)a4;
- (void)setInitialParentLayoutAttributes:(id)a3;
- (void)setInlineAnimatingOut:(BOOL)a3;
- (void)setInsertedAssociatedLayoutAttributes:(id)a3;
- (void)setLayoutAttributes:(id)a3;
- (void)setNeedsDynamicsUpdate;
- (void)setOldAssociatedLayoutAttributes:(id)a3;
- (void)setSizeCategoryIsAccessibilitySizeCategory:(BOOL)a3;
- (void)setSizeForRotation:(CGSize)a3;
- (void)setTargetContentOffset:(CGPoint)a3;
- (void)setUseInitialLayoutAttributesForRotation:(BOOL)a3;
- (void)setUseOverlayLayout:(BOOL)a3;
- (void)setVerticalOffset:(double)a3 forParentOfAssociatedItemDeletedAtIndex:(unint64_t)a4;
- (void)sizeCategoryDidChange:(id)a3;
- (void)updateAssociatedLayoutAttributesIfNecessary;
- (void)updateAttributesForAnchorYChangeWithAttributes:(id)a3;
- (void)updateAttributesForTargetContentOffsetChangeWithAttributes:(id)a3;
- (void)updateContentSize;
- (void)updateDynamicsWatchdogForRenderedFrameWithDuration:(double)a3;
@end

@implementation CKTranscriptCompositionalLayout

+ (int64_t)translateLayoutIndexToEffectIndex:(int64_t)a3
{
  int64_t v3 = 2;
  if (a3 != 3000) {
    int64_t v3 = a3 == 1000;
  }
  if (a3 == 5000) {
    return 3;
  }
  else {
    return v3;
  }
}

- (int64_t)effectIndexForDecorationViewAtIndex:(int64_t)a3
{
  v4 = [(CKTranscriptCompositionalLayout *)self decorationLayoutAttributes];
  v5 = [v4 objectAtIndex:a3];
  int64_t v6 = +[CKTranscriptCompositionalLayout translateLayoutIndexToEffectIndex:](CKTranscriptCompositionalLayout, "translateLayoutIndexToEffectIndex:", [v5 zIndex]);

  return v6;
}

- (CKTranscriptCompositionalLayout)initWithSectionProvider:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CKTranscriptCompositionalLayout;
  int64_t v3 = [(CKTranscriptCompositionalLayout *)&v16 initWithSectionProvider:a3];
  v4 = v3;
  if (v3)
  {
    v3->_isResting = 1;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    initialParentLayoutAttributes = v4->_initialParentLayoutAttributes;
    v4->_initialParentLayoutAttributes = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    finalParentVerticalOffsets = v4->_finalParentVerticalOffsets;
    v4->_finalParentVerticalOffsets = v7;

    v4->_dynamicsUpdateSequenceItem = 0;
    uint64_t v9 = objc_opt_class();
    v10 = +[CKFullscreenEffectDecorationView decorationViewKind];
    [(CKTranscriptCompositionalLayout *)v4 registerClass:v9 forDecorationViewOfKind:v10];

    v11 = +[CKUIBehavior sharedBehaviors];
    v4->_sizeCategoryIsAccessibilitySizeCategory = [v11 isAccessibilityPreferredContentSizeCategory];

    v12 = (void *)[objc_alloc(MEMORY[0x1E4F6C3D8]) initWithTarget:v4 action:sel__kickDynamicsIfNeeded];
    [(CKTranscriptCompositionalLayout *)v4 setDynamicsUpdater:v12];
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v4 selector:sel_sizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v4 selector:sel_reduceMotionSettingChanged_ name:*MEMORY[0x1E4F43478] object:0];
  }
  return v4;
}

- (void)_sceneActivationStateDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(CKTranscriptCompositionalLayout *)self collectionView];
  int64_t v6 = [v5 window];
  id v9 = [v6 windowScene];

  id v7 = [v4 object];

  v8 = v9;
  if (v7 == v9)
  {
    [(CKTranscriptCompositionalLayout *)self _kickDynamicsIfNeeded];
    v8 = v9;
  }
}

- (BOOL)isInBackground
{
  v2 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  char v3 = [v2 isInBackground];

  return v3;
}

- (void)_configureDisplayLink
{
  if ((_UIUpdateCycleEnabled() & 1) == 0 && !self->_displayLink)
  {
    id v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_displayLinkFired_];
    char v3 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v4 addToRunLoop:v3 forMode:*MEMORY[0x1E4F1C4B0]];

    -[CKTranscriptCompositionalLayout setDisplayLink:]((uint64_t)self, v4);
  }
}

- (void)setDisplayLink:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 672), a2);
  }
}

- (void)_configureUpdateSequenceItem
{
  if (!self->_dynamicsUpdateSequenceItem)
  {
    self->_dynamicsUpdateSequenceItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem();
    _UIUpdateRequestActivate();
  }
}

uint64_t __63__CKTranscriptCompositionalLayout__configureUpdateSequenceItem__block_invoke(uint64_t a1, double a2)
{
  kdebug_trace();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4
    && (*(unsigned char *)(v4 + 527) = 1, (uint64_t v5 = *(void *)(a1 + 32)) != 0)
    && (*(double *)(v5 + 616) = a2, (uint64_t v6 = *(void *)(a1 + 32)) != 0))
  {
    *(void *)(v6 + 632) = 0x405E000000000000;
    id v7 = *(void **)(a1 + 32);
  }
  else
  {
    id v7 = 0;
  }
  v8 = [v7 _invalidationContextForRefreshingVisibleElementAttributes];
  [v7 invalidateLayoutWithContext:v8];

  id v9 = *(void **)(a1 + 32);

  return [v9 checkDynamicsWatchdog];
}

- (void)_kickDynamicsIfNeeded
{
  if ([(CKTranscriptCompositionalLayout *)self isInBackground])
  {
    [(CKTranscriptCompositionalLayout *)self invalidateDisplayLink];
  }
  else if (_UIUpdateCycleEnabled())
  {
    [(CKTranscriptCompositionalLayout *)self _configureUpdateSequenceItem];
  }
  else
  {
    [(CKTranscriptCompositionalLayout *)self _configureDisplayLink];
  }
}

- (void)beginHoldingDynamicsUpdatesForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCompositionalLayout *)self dynamicsUpdater];
  [v5 beginHoldingUpdatesForKey:v4];
}

- (void)endHoldingDynamicsUpdatesForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCompositionalLayout *)self dynamicsUpdater];
  [v5 endHoldingUpdatesForKey:v4];
}

- (void)setNeedsDynamicsUpdate
{
  id v2 = [(CKTranscriptCompositionalLayout *)self dynamicsUpdater];
  [v2 setNeedsUpdate];
}

- (void)dealloc
{
  [(CKTranscriptCompositionalLayout *)self _dealloc];
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptCompositionalLayout;
  [(CKTranscriptCompositionalLayout *)&v3 dealloc];
}

- (void)_dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  [(IMScheduledUpdater *)self->_dynamicsUpdater invalidate];

  [(CKTranscriptCompositionalLayout *)self removeUpdateSequenceItem];
}

- (void)prepareLayoutForRotisserieScrolling
{
  v203[16] = *MEMORY[0x1E4F143B8];
  id v3 = [(CKTranscriptCompositionalLayout *)self collectionView];
  v168 = self;
  id v4 = [(CKTranscriptCompositionalLayout *)self layoutAttributes];
  [v3 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat width = v204.size.width;
  double v11 = v10;
  v204.origin.CGFloat x = v5 + 0.0;
  CGFloat x = v204.origin.x;
  v204.origin.CGFloat y = v7 + 15.0;
  CGFloat y = v204.origin.y;
  v204.size.double height = v10 + -30.0;
  double height = v204.size.height;
  double MinY = CGRectGetMinY(v204);
  v205.origin.CGFloat x = x;
  v205.origin.CGFloat y = y;
  v205.size.CGFloat width = width;
  v205.size.double height = height;
  double MidY = CGRectGetMidY(v205);
  v206.origin.CGFloat x = x;
  v206.origin.CGFloat y = y;
  v206.size.CGFloat width = width;
  v206.size.double height = height;
  double MaxY = CGRectGetMaxY(v206);
  v207.origin.CGFloat x = x;
  v207.origin.CGFloat y = y;
  v207.size.CGFloat width = width;
  v207.size.double height = height;
  double v180 = CGRectGetHeight(v207);
  objc_msgSend(v3, "__ck_bottomOffset");
  double v182 = v16;
  double v18 = v17;
  v208.origin.CGFloat x = v6;
  v208.origin.CGFloat y = v8;
  v208.size.CGFloat width = width;
  v208.size.double height = v11;
  double v175 = CGRectGetMaxY(v208);
  uint64_t v19 = [v4 indexOfObjectWithOptions:2 passingTest:&__block_literal_global_167];
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v20 = v18 - v11;
  }
  else
  {
    v21 = [v4 objectAtIndexedSubscript:v19];
    CGFloat v22 = CGRectGetMaxY(v21[11]) - v11;

    double v175 = v22;
    double v20 = v22;
  }
  v209.origin.CGFloat x = v182 + 0.0;
  v209.origin.CGFloat y = v20 + 15.0;
  v209.size.CGFloat width = width;
  v209.size.double height = height;
  double v23 = CGRectGetMinY(v209);
  objc_msgSend(v3, "__ck_scrollToTopContentOffset");
  v210.origin.CGFloat x = v26 + 0.0;
  CGFloat v24 = v210.origin.x;
  v210.origin.CGFloat y = v27 + 15.0;
  CGFloat v25 = v210.origin.y;
  v210.size.CGFloat width = width;
  v210.size.double height = height;
  CGFloat v169 = CGRectGetMinY(v210);
  v211.origin.CGFloat x = v24;
  v211.origin.CGFloat y = v25;
  v211.size.CGFloat width = width;
  v211.size.double height = height;
  CGFloat v172 = CGRectGetMaxY(v211);
  BOOL v171 = [(CKTranscriptCompositionalLayout *)v168 hasLoadMore];
  uint64_t v28 = [v4 count];
  if (!v28) {
    goto LABEL_165;
  }
  unint64_t v29 = v28;
  uint64_t v164 = (uint64_t)&v164;
  MEMORY[0x1F4188790](v28);
  v31 = (char *)&v164 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v31, v30);
  v181 = v31;
  objc_msgSend(v4, "getObjects:range:", v31, 0, v29);
  unint64_t v32 = v29 - 1;
  v165 = v4;
  id v166 = v3;
  double v33 = MinY;
  unint64_t v173 = v29;
  while (1)
  {
    double v34 = *(double *)&v181[8 * v32];
    double v35 = *(double *)(*(void *)&v34 + 584);
    double v36 = *(double *)(*(void *)&v34 + 600) * 0.5;
    if (v35 - v36 < MidY) {
      break;
    }
    if (--v32 == -1) {
      goto LABEL_30;
    }
  }
  double v37 = v35 + v36;
  double v38 = 0.5;
  if (v37 >= MidY || (double v38 = (v37 - MinY) / v180, v38 < 0.0) || v38 >= 0.4)
  {
    BOOL v40 = v38 < 0.4;
    if (v38 > 0.6) {
      BOOL v40 = 1;
    }
    double v41 = 1.0;
    if (v38 > 1.0) {
      goto LABEL_22;
    }
    if (v38 <= 0.6 || !v40) {
      goto LABEL_22;
    }
    double v39 = v38 + -0.6;
  }
  else
  {
    double v39 = 0.4 - v38;
  }
  double v41 = sqrt(0.16 - v39 * v39) / 0.4;
LABEL_22:
  *(double *)(*(void *)&v34 + 608) = v41;
  unint64_t v177 = v32;
  unint64_t v43 = v32 + 0x8000000000000000;
  *(void *)(*(void *)&v34 + 592) = *(void *)(*(void *)&v34 + 584);
  *(unsigned char *)(*(void *)&v34 + 616) = 0;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  double v182 = v34;
  id v44 = *(id *)(*(void *)&v34 + 632);
  uint64_t v45 = [v44 countByEnumeratingWithState:&v196 objects:v203 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v197;
    do
    {
      uint64_t v48 = 0;
      double v49 = v182;
      do
      {
        if (*(void *)v197 != v47)
        {
          objc_enumerationMutation(v44);
          double v49 = v182;
        }
        uint64_t v50 = *(void *)(*((void *)&v196 + 1) + 8 * v48);
        *(void *)(v50 + 608) = *(void *)(*(void *)&v49 + 608);
        *(unsigned char *)(v50 + 616) = *(unsigned char *)(*(void *)&v49 + 616);
        *(void *)(v50 + 592) = *(void *)(*(void *)&v49 + 592);
        ++v48;
      }
      while (v46 != v48);
      uint64_t v46 = [v44 countByEnumeratingWithState:&v196 objects:v203 count:16];
    }
    while (v46);
  }

  unint64_t v51 = v177;
  unint64_t v29 = v173;
  if (v43 == -1)
  {
LABEL_30:
    double v52 = *(double *)v181;
    double v53 = *(double *)(*(void *)v181 + 584);
    double v54 = 0.5;
    double v55 = *(double *)(*(void *)v181 + 600) * 0.5;
    double v56 = v53 - v55;
    if (v53 - v55 <= MidY && (double v56 = v53 + v55, v53 + v55 >= MidY)
      || (double v54 = (v56 - v33) / v180, v54 < 0.0)
      || v54 >= 0.4)
    {
      BOOL v58 = v54 < 0.4;
      if (v54 > 0.6) {
        BOOL v58 = 1;
      }
      double v59 = 1.0;
      if (v54 > 1.0) {
        goto LABEL_44;
      }
      if (v54 <= 0.6 || !v58) {
        goto LABEL_44;
      }
      double v57 = v54 + -0.6;
    }
    else
    {
      double v57 = 0.4 - v54;
    }
    double v59 = sqrt(0.16 - v57 * v57) / 0.4;
LABEL_44:
    *(double *)(*(void *)&v52 + 608) = v59;
    *(void *)(*(void *)&v52 + 592) = *(void *)(*(void *)&v52 + 584);
    *(unsigned char *)(*(void *)&v52 + 616) = 0;
    long long v194 = 0u;
    long long v195 = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    double v182 = v52;
    id v61 = *(id *)(*(void *)&v52 + 632);
    uint64_t v62 = [v61 countByEnumeratingWithState:&v192 objects:v202 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v193;
      do
      {
        uint64_t v65 = 0;
        double v66 = v182;
        do
        {
          if (*(void *)v193 != v64)
          {
            objc_enumerationMutation(v61);
            double v66 = v182;
          }
          uint64_t v67 = *(void *)(*((void *)&v192 + 1) + 8 * v65);
          *(void *)(v67 + 608) = *(void *)(*(void *)&v66 + 608);
          *(unsigned char *)(v67 + 616) = *(unsigned char *)(*(void *)&v66 + 616);
          *(void *)(v67 + 592) = *(void *)(*(void *)&v66 + 592);
          ++v65;
        }
        while (v63 != v65);
        uint64_t v63 = [v61 countByEnumeratingWithState:&v192 objects:v202 count:16];
      }
      while (v63);
    }

    unint64_t v51 = 0;
  }
  double v176 = v23;
  unint64_t v177 = v51;
  *(void *)&double v68 = v51 + 1;
  v69 = *(double **)&v182;
  if (v51 + 1 < v29)
  {
    double v70 = 0.5;
    v71 = &OBJC_IVAR___CKSendMenuViewController_plusButtonPortalView;
    *(double *)&uint64_t v72 = 0.4;
    double v170 = 0.16;
    double v167 = -0.6;
    double v73 = v182;
    while (1)
    {
      double v74 = *(double *)&v72;
      double v75 = *(double *)(*(void *)&v73 + 584);
      double v76 = *(double *)(*(void *)&v73 + 600);
      double v77 = *(double *)(*(void *)&v73 + 592);
      double v78 = *(double *)(*(void *)&v73 + 608);
      double v73 = *(double *)&v181[8 * *(void *)&v68];
      double v79 = *(double *)(*(void *)&v73 + 584);
      double v80 = *(double *)(*(void *)&v73 + 600);
      if (CKMainScreenScale_once_64 != -1)
      {
        dispatch_once(&CKMainScreenScale_once_64, &__block_literal_global_380);
        double v70 = 0.5;
      }
      double v81 = v79 - v80 * v70 - (v75 + v76 * v70);
      if (v78 >= 0.25) {
        double v82 = v78;
      }
      else {
        double v82 = 0.25;
      }
      double v83 = v76 * v82;
      double v84 = *((double *)v71 + 482);
      double v85 = 1.0;
      if (v84 == 0.0) {
        double v84 = 1.0;
      }
      double v86 = v81 + v77 + ceil(v83 * v84) / v84 * v70;
      BOOL v87 = v86 >= MaxY;
      *(double *)&uint64_t v72 = v74;
      if (v86 >= MaxY) {
        goto LABEL_90;
      }
      double v88 = (v86 - MinY) / v180;
      if (v88 >= 0.0 && v88 < v74) {
        break;
      }
      BOOL v90 = v88 < v74;
      if (v88 > 0.6) {
        BOOL v90 = 1;
      }
      if (v88 <= 1.0 && v88 > 0.6 && v90)
      {
        double v89 = v88 + v167;
        goto LABEL_73;
      }
LABEL_74:
      if (v86 < v176) {
        goto LABEL_90;
      }
      double v92 = (v86 - v176) / v180;
      if (v92 < v70) {
        double v92 = v70;
      }
      double v93 = fmin(v92, 1.0);
      if (v93 < 0.0 || v93 >= v74)
      {
        BOOL v95 = v93 < v74;
        if (v93 > 0.6) {
          BOOL v95 = 1;
        }
        double v96 = 1.0;
        if (v93 > 1.0) {
          goto LABEL_89;
        }
        if (v93 <= 0.6 || !v95) {
          goto LABEL_89;
        }
        double v94 = v93 + v167;
      }
      else
      {
        double v94 = v74 - v93;
      }
      double v96 = sqrt(v170 - v94 * v94) / v74;
LABEL_89:
      double v85 = fmin(v85 + 1.0 - v96, 1.0);
LABEL_90:
      double v179 = v68;
      if (v86 < v175 && (v86 - v176) / v180 >= 1.0) {
        BOOL v87 = 0;
      }
      *(double *)(*(void *)&v73 + 608) = v85;
      *(unsigned char *)(*(void *)&v73 + 616) = v87;
      double v98 = v81 * (1.0 - v85);
      double v99 = *((double *)v71 + 482);
      if (v99 == 0.0) {
        double v99 = 1.0;
      }
      double v100 = v86 - round(v98 * v99) / v99;
      double v101 = *(double *)(*(void *)&v73 + 608);
      if (v101 < 0.25) {
        double v101 = 0.25;
      }
      double v102 = v101 * *(double *)(*(void *)&v73 + 600);
      double v103 = *((double *)v71 + 482);
      if (v103 == 0.0) {
        double v103 = 1.0;
      }
      *(double *)(*(void *)&v73 + 592) = v100 + ceil(v102 * v103) / v103 * v70;
      long long v190 = 0u;
      long long v191 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      id v104 = *(id *)(*(void *)&v73 + 632);
      uint64_t v105 = [v104 countByEnumeratingWithState:&v188 objects:v201 count:16];
      if (v105)
      {
        uint64_t v106 = v105;
        uint64_t v107 = *(void *)v189;
        do
        {
          for (uint64_t i = 0; i != v106; ++i)
          {
            if (*(void *)v189 != v107) {
              objc_enumerationMutation(v104);
            }
            uint64_t v109 = *(void *)(*((void *)&v188 + 1) + 8 * i);
            *(double *)(v109 + 608) = v85;
            *(unsigned char *)(v109 + 616) = v87;
            *(void *)(v109 + 592) = *(void *)(*(void *)&v73 + 592);
          }
          uint64_t v106 = [v104 countByEnumeratingWithState:&v188 objects:v201 count:16];
        }
        while (v106);
      }

      *(void *)&double v68 = *(void *)&v179 + 1;
      v69 = *(double **)&v182;
      v71 = &OBJC_IVAR___CKSendMenuViewController_plusButtonPortalView;
      double v70 = 0.5;
      if (*(void *)&v179 + 1 == v173) {
        goto LABEL_107;
      }
    }
    double v89 = v74 - v88;
LABEL_73:
    double v85 = sqrt(v170 - v89 * v89) / v74;
    goto LABEL_74;
  }
LABEL_107:
  unint64_t v110 = v177;
  if (v177)
  {
    double v111 = 0.0;
    v112 = &OBJC_IVAR___CKSendMenuViewController_plusButtonPortalView;
    double v179 = 0.16;
    double v175 = -0.6;
    while (1)
    {
      double v182 = v111;
      double v113 = v69[73];
      double v114 = v69[74];
      double v115 = v69[76];
      double v116 = v69[75];
      v117 = *(double **)&v181[8 * v110 + 8 * ~*(void *)&v111];
      double v118 = v117[73];
      double v119 = v117[75];
      v120 = v117;
      if (CKMainScreenScale_once_64 != -1)
      {
        dispatch_once(&CKMainScreenScale_once_64, &__block_literal_global_380);
        v117 = v120;
      }
      double v121 = v113 - v116 * 0.5 - (v118 + v119 * 0.5);
      if (v115 >= 0.25) {
        double v122 = v115;
      }
      else {
        double v122 = 0.25;
      }
      double v123 = v116 * v122;
      double v124 = *((double *)v112 + 482);
      double v125 = 1.0;
      if (v124 == 0.0) {
        double v124 = 1.0;
      }
      double v126 = v114 + ceil(v123 * v124) / v124 * -0.5;
      double v127 = v126 - v121;
      double v128 = MinY;
      if (v126 - v121 <= MinY) {
        goto LABEL_150;
      }
      double v129 = (v127 - MinY) / v180;
      if (v129 >= 0.0 && v129 < 0.4) {
        break;
      }
      BOOL v131 = v129 < 0.4;
      if (v129 > 0.6) {
        BOOL v131 = 1;
      }
      if (v129 <= 1.0 && v129 > 0.6 && v131)
      {
        double v130 = v129 + v175;
        goto LABEL_128;
      }
LABEL_129:
      char v133 = v171;
      if (v127 > v172) {
        char v133 = 1;
      }
      if ((v133 & 1) == 0)
      {
        double v134 = fmin((v127 - v169) / v180, 0.5);
        goto LABEL_137;
      }
      if (v126 >= v176)
      {
        double v134 = (v126 - v176) / v180;
        if (v134 < 0.5) {
          double v134 = 0.5;
        }
LABEL_137:
        double v135 = 1.0;
        double v136 = fmin(v134, 1.0);
        if (v136 >= 0.0 && v136 < 0.4)
        {
          double v137 = 0.4 - v136;
          goto LABEL_148;
        }
        BOOL v138 = v136 < 0.4;
        if (v136 > 0.6) {
          BOOL v138 = 1;
        }
        if (v136 <= 1.0 && v136 > 0.6 && v138)
        {
          double v137 = v136 + v175;
LABEL_148:
          double v135 = sqrt(v179 - v137 * v137) / 0.4;
        }
        double v125 = fmin(v125 + 1.0 - v135, 1.0);
      }
LABEL_150:
      v117[76] = v125;
      BOOL v140 = v127 <= v128;
      *((unsigned char *)v117 + 616) = v127 <= v128;
      double v141 = v121 * (1.0 - v125);
      double v142 = *((double *)v112 + 482);
      if (v142 == 0.0) {
        double v142 = 1.0;
      }
      double v143 = v127 + round(v141 * v142) / v142;
      double v144 = v117[76];
      if (v144 < 0.25) {
        double v144 = 0.25;
      }
      double v145 = v144 * v117[75];
      double v146 = *((double *)v112 + 482);
      if (v146 == 0.0) {
        double v146 = 1.0;
      }
      v117[74] = v143 + ceil(v145 * v146) / v146 * -0.5;
      long long v186 = 0u;
      long long v187 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      id v147 = *((id *)v117 + 79);
      uint64_t v148 = [v147 countByEnumeratingWithState:&v184 objects:v200 count:16];
      if (v148)
      {
        uint64_t v149 = v148;
        uint64_t v150 = *(void *)v185;
        do
        {
          uint64_t v151 = 0;
          v152 = v120;
          do
          {
            if (*(void *)v185 != v150)
            {
              objc_enumerationMutation(v147);
              v152 = v120;
            }
            uint64_t v153 = *(void *)(*((void *)&v184 + 1) + 8 * v151);
            *(double *)(v153 + 608) = v125;
            *(unsigned char *)(v153 + 616) = v140;
            *(double *)(v153 + 592) = v152[74];
            ++v151;
          }
          while (v149 != v151);
          uint64_t v149 = [v147 countByEnumeratingWithState:&v184 objects:v200 count:16];
        }
        while (v149);
      }

      *(void *)&double v111 = *(void *)&v182 + 1;
      unint64_t v110 = v177;
      v69 = v120;
      v112 = &OBJC_IVAR___CKSendMenuViewController_plusButtonPortalView;
      if (*(void *)&v182 + 1 == v177) {
        goto LABEL_164;
      }
    }
    double v130 = 0.4 - v129;
LABEL_128:
    double v125 = sqrt(v179 - v130 * v130) / 0.4;
    goto LABEL_129;
  }
LABEL_164:
  id v3 = v166;
  [v166 bounds];
  double v155 = v154;
  double v157 = v156;
  double v159 = v158;
  double v161 = v160;
  id v183 = 0;
  v162 = v168;
  id v4 = v165;
  -[CKTranscriptCompositionalLayout _configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:](v168, "_configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:", v165, &v183);
  id v163 = v183;
  -[CKTranscriptCompositionalLayout _visibleRectInsectsForMaxYAnchorLayoutAttribute:forVisibleBounds:](v162, "_visibleRectInsectsForMaxYAnchorLayoutAttribute:forVisibleBounds:", v163, v155, v157, v159, v161);
  objc_msgSend(v3, "_setVisibleRectEdgeInsets:");

LABEL_165:
}

uint64_t __70__CKTranscriptCompositionalLayout_prepareLayoutForRotisserieScrolling__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 chatItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)prepareLayout
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  double v124 = self;
  v134.receiver = self;
  v134.super_class = (Class)CKTranscriptCompositionalLayout;
  [(CKTranscriptCompositionalLayout *)&v134 prepareLayout];
  BOOL v104 = [(CKTranscriptCompositionalLayout *)self isInBackground];
  id v110 = [(CKTranscriptCompositionalLayout *)self collectionView];
  id v108 = [(CKTranscriptCompositionalLayout *)self layoutAttributes];
  if (self)
  {
    CGFloat x = self->_visibleBounds.origin.x;
    double y = self->_visibleBounds.origin.y;
    double width = self->_visibleBounds.size.width;
    CGFloat height = self->_visibleBounds.size.height;
  }
  else
  {
    double y = 0.0;
    double width = 0.0;
    CGFloat height = 0.0;
    CGFloat x = 0.0;
  }
  CGRect v140 = *(CGRect *)*(void *)&MEMORY[0x1E4F1DB28];
  double v7 = y;
  double v105 = width;
  if (CGRectEqualToRect(v140, *(CGRect *)&x))
  {
    [v110 bounds];
    double v105 = v8;
    double y = v9;
  }
  [v110 bounds];
  CGFloat v102 = v10;
  double v103 = v11;
  double v107 = v12;
  double v14 = v13;
  if (v104)
  {
    v15 = v124;
    if (v124)
    {
      v124->_double previousFrameTimestamp = 0.0;
      v15->_double currentFrameTimestamp = 0.0;
    }
    if (IMOSLoggingEnabled())
    {
      double v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "prepareLayout called while backgrounded", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      double v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = CKIsRunningInMessagesNotificationExtension();
        uint64_t v19 = @"YES";
        if (!v18) {
          uint64_t v19 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        BOOL v138 = v19;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "prepareLayout called. Is using notification extension? {%@}", buf, 0xCu);
      }
    }
  }
  BOOL v20 = [(CKTranscriptCompositionalLayout *)v124 _dynamicsAreEnabled];
  if ((v20 | [(CKTranscriptCompositionalLayout *)v124 _dynamicsAreRequiredForInlineReplyAnimation]))
  {
    double v21 = 0.0;
    if (v124 && v124->_isDisplayDrivenLayoutInvalidation)
    {
      double previousFrameTimestamp = v124->_previousFrameTimestamp;
      if (previousFrameTimestamp == 0.0
        || (double currentFrameTimestamp = v124->_currentFrameTimestamp, currentFrameTimestamp == 0.0))
      {
        double requestedFrameRate = v124->_requestedFrameRate;
        if (requestedFrameRate <= 0.0) {
          double v21 = 0.0;
        }
        else {
          double v21 = 1.0 / requestedFrameRate;
        }
      }
      else
      {
        double v21 = currentFrameTimestamp - previousFrameTimestamp;
      }
      [(CKTranscriptCompositionalLayout *)v124 updateDynamicsWatchdogForRenderedFrameWithDuration:v21];
      kdebug_trace();
      int v114 = 1;
    }
    else
    {
      int v114 = 0;
    }
    double v37 = v107 - y;
    if (v107 - y != 0.0) {
      [(CKTranscriptCompositionalLayout *)v124 _kickDynamicsIfNeeded];
    }
    double v38 = [MEMORY[0x1E4F42D90] mainScreen];
    [v38 scale];
    double v113 = v39;

    if (v37 == 0.0)
    {
      BOOL v40 = v124;
      BOOL easingUp = v124->_easingUp;
    }
    else
    {
      BOOL easingUp = v37 > 0.0;
      BOOL v40 = v124;
      if (!v124)
      {
        BOOL v116 = v37 > 0.0;
LABEL_49:
        uint64_t v115 = [v108 count];
        if (v115)
        {
          v42 = +[CKUIBehavior sharedBehaviors];
          [v42 balloonBalloonTranscriptSpace:1];
          double v109 = v43;

          uint64_t v101 = (uint64_t)&v101;
          uint64_t v44 = v115;
          MEMORY[0x1F4188790](v45);
          uint64_t v47 = (char *)&v101 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
          bzero(v47, v46);
          v112 = v47;
          objc_msgSend(v108, "getObjects:range:", v47, 0, v44);
          uint64_t v48 = 0;
          double v123 = 0;
          double v121 = vabdd_f64(v107, y);
          uint64_t v111 = 523;
          int v117 = 1;
          long double v106 = v21 / 0.0166666675;
          uint64_t v49 = v115;
          do
          {
            uint64_t v50 = v49 + ~v48;
            if (!v116) {
              uint64_t v50 = v48;
            }
            uint64_t v51 = *(void *)&v112[8 * v50];
            uint64_t v53 = *(void *)(v51 + 384);
            double v52 = *(double *)(v51 + 392);
            double v122 = *(double *)(v51 + 408);
            double v54 = *(double *)(v51 + 360);
            double v55 = *(double *)(v51 + 416);
            double v56 = *(double *)(v51 + 424);
            double v119 = v55;
            double v120 = v56;
            if (v114)
            {
              double v57 = 1.0;
              double v58 = 1.0 - v55;
              double v59 = v124;
              if (1.0 - v55 < 1.0) {
                double v57 = (1.0 - pow(1.0 - v55, v106)) / (1.0 - v58);
              }
              double v60 = v58 * v57;
              if (v60 > 1.0) {
                double v60 = 1.0;
              }
              double v52 = v52 + (v54 - v52) * v60;
            }
            else
            {
              double v59 = v124;
            }
            uint64_t v118 = v48;
            double v61 = 0.25;
            if (*((unsigned char *)&v59->super.super.super.isa + v111)) {
              double v61 = 2.0;
            }
            double v62 = vabdd_f64(v52, v54);
            double v63 = v61 / v113;
            if (v62 >= v63) {
              double v64 = v52;
            }
            else {
              double v64 = v54;
            }
            if (*(double *)(v51 + 448) >= v63)
            {
              int v117 = 0;
            }
            else
            {
              int v65 = v117;
              if (v62 >= v63) {
                int v65 = 0;
              }
              int v117 = v65;
              *(void *)(v51 + 448) = 0;
              [(CKTranscriptCompositionalLayout *)v59 _resetHorizontalBalloonOffsetsForLayoutAttributes:v51 includeAssociatedAttributes:1];
              double v59 = v124;
            }
            if (v123)
            {
              if (![(CKTranscriptCompositionalLayout *)v59 isInlineAnimatingOut])
              {
                double v66 = v123[49];
                double v67 = v123[45];
                if (v116)
                {
                  double v68 = v66 - v109 - v122;
                  if (v68 >= v64) {
                    double v68 = v64;
                  }
                  if (v66 >= v64) {
                    double v69 = v64;
                  }
                  else {
                    double v69 = v123[49];
                  }
                  if (v54 - (v67 - v109 - v122) > 0.00000011920929) {
                    double v64 = v69;
                  }
                  else {
                    double v64 = v68;
                  }
                }
                else
                {
                  CGFloat v70 = v123[48];
                  CGFloat v72 = v123[50];
                  CGFloat v71 = v123[51];
                  uint64_t v73 = *((void *)v123 + 46);
                  uint64_t v74 = *((void *)v123 + 47);
                  uint64_t v75 = *((void *)v123 + 44);
                  if (v109 + CGRectGetMaxY(*(CGRect *)(&v67 - 1)) - v54 <= 0.00000011920929)
                  {
                    v141.origin.CGFloat x = v70;
                    v141.origin.double y = v66;
                    v141.size.double width = v72;
                    v141.size.CGFloat height = v71;
                    double v76 = v109 + CGRectGetMaxY(v141);
                    if (v76 >= v64) {
                      double v64 = v76;
                    }
                  }
                  else if (v66 >= v64)
                  {
                    double v64 = v66;
                  }
                }
              }
              double v59 = v124;
            }
            if (v121 > 2.5)
            {
              if (CKMainScreenScale_once_64 != -1) {
                dispatch_once(&CKMainScreenScale_once_64, &__block_literal_global_380);
              }
              double v77 = *(double *)&CKMainScreenScale_sMainScreenScale_64;
              if (*(double *)&CKMainScreenScale_sMainScreenScale_64 == 0.0) {
                double v77 = 1.0;
              }
              double v64 = round(v64 * v77) / v77;
            }
            *(void *)(v51 + 384) = v53;
            *(double *)(v51 + 392) = v64;
            double v78 = v122;
            *(double *)(v51 + 400) = v14;
            *(double *)(v51 + 408) = v78;
            [(CKTranscriptCompositionalLayout *)v59 _updateCurrentBalloonOffsetForLayoutAttributes:v51];
            long long v128 = 0u;
            long long v129 = 0u;
            long long v126 = 0u;
            long long v127 = 0u;
            id v79 = *(id *)(v51 + 632);
            uint64_t v80 = [v79 countByEnumeratingWithState:&v126 objects:v135 count:16];
            if (v80)
            {
              uint64_t v81 = *(void *)v127;
              do
              {
                for (uint64_t i = 0; i != v80; ++i)
                {
                  if (*(void *)v127 != v81) {
                    objc_enumerationMutation(v79);
                  }
                  uint64_t v83 = *(void *)(*((void *)&v126 + 1) + 8 * i);
                  *(double *)(v83 + 392) = *(double *)(v51 + 392) + *(double *)(v83 + 360) - *(double *)(v51 + 360);
                  objc_msgSend((id)v83, "setFrame:", *(double *)(v83 + 384), *(double *)(v83 + 392), *(double *)(v83 + 400), *(double *)(v83 + 408));
                  *(void *)(v83 + 448) = *(void *)(v51 + 448);
                }
                uint64_t v80 = [v79 countByEnumeratingWithState:&v126 objects:v135 count:16];
              }
              while (v80);
            }
            BOOL v84 = v121 > 2.0;

            if (v119 != v120 && v84) {
              *(double *)(v51 + 416) = v120;
            }
            double v86 = (double *)(id)v51;

            uint64_t v48 = v118 + 1;
            double v123 = v86;
            uint64_t v49 = v115;
          }
          while (v118 + 1 != v115);
          [v110 bounds];
          double v88 = v87;
          double v90 = v89;
          double v92 = v91;
          double v94 = v93;
          id v125 = 0;
          -[CKTranscriptCompositionalLayout _configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:](v124, "_configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:", v108, &v125);
          id v95 = v125;
          -[CKTranscriptCompositionalLayout _visibleRectInsectsForMaxYAnchorLayoutAttribute:forVisibleBounds:](v124, "_visibleRectInsectsForMaxYAnchorLayoutAttribute:forVisibleBounds:", v95, v88, v90, v92, v94);
          objc_msgSend(v110, "_setVisibleRectEdgeInsets:");

          if (((v117 | v104) & 1) == 0)
          {
            double v96 = v124;
            double v97 = v105;
            if (!v114)
            {
              int v117 = 0;
              if (!v124) {
                goto LABEL_116;
              }
              goto LABEL_115;
            }
            if (v124)
            {
              double v97 = v124->_currentFrameTimestamp;
              v124->_double previousFrameTimestamp = v97;
            }
            [(CKTranscriptCompositionalLayout *)v96 checkDynamicsWatchdog];
            int v117 = 0;
LABEL_114:
            double v96 = v124;
            double v97 = v105;
            if (!v124)
            {
LABEL_116:
              if (v14 != v97)
              {
                [(CKTranscriptCompositionalLayout *)v96 updateContentSize];
                double v96 = v124;
              }
              if (v96)
              {
                double v98 = v107;
                v96->_visibleBounds.origin.CGFloat x = v102;
                v96->_visibleBounds.origin.double y = v98;
                CGFloat v99 = v103;
                v96->_visibleBounds.size.double width = v14;
                v96->_visibleBounds.size.CGFloat height = v99;
              }
              if (v96->_isResting != (v117 & 1))
              {
                v96->_isResting = v117 & 1;
                double v100 = [v110 delegate];
                [v100 collectionViewLayoutRestingDidChange:v124];
              }
              goto LABEL_123;
            }
LABEL_115:
            v96->_isDisplayDrivenLayoutInvalidation = 0;
            goto LABEL_116;
          }
        }
        else
        {
          double v86 = 0;
          int v117 = 1;
        }
        [(CKTranscriptCompositionalLayout *)v124 invalidateDisplayLink];
        goto LABEL_114;
      }
    }
    BOOL v116 = easingUp;
    v40->_BOOL easingUp = easingUp;
    goto LABEL_49;
  }
  CGFloat v24 = +[CKUIBehavior sharedBehaviors];
  int v25 = [v24 shouldUseRotisserieScrolling];

  if (v25)
  {
    [(CKTranscriptCompositionalLayout *)v124 prepareLayoutForRotisserieScrolling];
  }
  else
  {
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v26 = v108;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v130 objects:v136 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v131;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v131 != v28) {
            objc_enumerationMutation(v26);
          }
          uint64_t v30 = *(void *)(*((void *)&v130 + 1) + 8 * j);
          long long v31 = *(_OWORD *)(v30 + 352);
          uint64_t v32 = *(void *)(v30 + 376);
          *(double *)(v30 + 368) = v14;
          v30 += 384;
          *(_OWORD *)uint64_t v30 = v31;
          *(double *)(v30 + 16) = v14;
          *(void *)(v30 + 24) = v32;
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v130 objects:v136 count:16];
      }
      while (v27);
    }
  }
  double v33 = v124;
  if (v14 != v105)
  {
    [(CKTranscriptCompositionalLayout *)v124 updateContentSize];
    double v33 = v124;
  }
  if (v33)
  {
    double v34 = v107;
    v33->_visibleBounds.origin.CGFloat x = v102;
    v33->_visibleBounds.origin.double y = v34;
    CGFloat v35 = v103;
    v33->_visibleBounds.size.double width = v14;
    v33->_visibleBounds.size.CGFloat height = v35;
  }
LABEL_123:
}

- (UIEdgeInsets)_visibleRectInsectsForMaxYAnchorLayoutAttribute:(id)a3 forVisibleBounds:(CGRect)a4
{
  CGFloat x = a4.origin.x;
  double v5 = *MEMORY[0x1E4F437F8];
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  if (a3)
  {
    double v17 = *MEMORY[0x1E4F437F8];
    CGFloat y = a4.origin.y;
    CGFloat width = a4.size.width;
    CGFloat height = a4.size.height;
    double MaxY = CGRectGetMaxY(*((CGRect *)a3 + 12));
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double v13 = CGRectGetMaxY(v18) - MaxY;
    if (v13 < 0.0) {
      double v8 = v13;
    }
    double v5 = v17;
  }
  double v14 = v6;
  double v15 = v8;
  double v16 = v7;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v5;
  return result;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(CKTranscriptCompositionalLayout *)self isUsingInitialLayoutAttributesForRotation])
  {
    double v5 = [(CKTranscriptCompositionalLayout *)self layoutAttributesForItemAtIndexPath:v4];
    goto LABEL_13;
  }
  if ([v4 section] == 1)
  {
    double v6 = [(CKTranscriptCompositionalLayout *)self associatedLayoutAttributes];
    unint64_t v7 = [v6 count];
    if (v7 <= [v4 item])
    {
    }
    else
    {
      double v8 = [(CKTranscriptCompositionalLayout *)self associatedLayoutAttributes];
      double v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v4, "item"));

      if (v9)
      {
        double v10 = [(CKTranscriptCompositionalLayout *)self layoutAttributesForItemAtIndexPath:v4];
        double v5 = (void *)[v10 copy];

        [v5 setAlphaOrFilterLevel:1.0];
        double v11 = [(CKTranscriptCompositionalLayout *)self insertedAssociatedLayoutAttributes];
        int v12 = objc_msgSend(v11, "containsIndex:", objc_msgSend(v4, "row"));

        if (v12)
        {
          [v5 frame];
          objc_msgSend(v5, "setFrame:");
          double v13 = [(CKTranscriptCompositionalLayout *)self insertedAssociatedLayoutAttributes];
          objc_msgSend(v13, "removeIndex:", objc_msgSend(v4, "row"));
        }
        goto LABEL_13;
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CKTranscriptCompositionalLayout;
  double v5 = [(CKTranscriptCompositionalLayout *)&v19 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  double v14 = [(CKTranscriptCompositionalLayout *)self indicesOfChatItemsToBeInsertedWithoutFading];
  int v15 = objc_msgSend(v14, "containsIndex:", objc_msgSend(v4, "item"));

  if (v15) {
    [v5 setAlphaOrFilterLevel:1.0];
  }
  double v16 = [(CKTranscriptCompositionalLayout *)self indicesOfReplyChatItemsToBeInserted];
  int v17 = objc_msgSend(v16, "containsIndex:", objc_msgSend(v4, "item"));

  if (v17)
  {
    [v5 setInsertingReply:1];
    [v5 setAlphaOrFilterLevel:1.0];
  }
LABEL_13:

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(CKTranscriptCompositionalLayout *)self isUsingInitialLayoutAttributesForRotation])
  {
    id v5 = [(CKTranscriptCompositionalLayout *)self layoutAttributesForItemAtIndexPath:v4];
  }
  else if ([v4 section] == 1)
  {
    v16.receiver = self;
    v16.super_class = (Class)CKTranscriptCompositionalLayout;
    id v5 = [(CKTranscriptCompositionalLayout *)&v16 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
    finalParentVerticalOffsets = self->_finalParentVerticalOffsets;
    unint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "item"));
    double v8 = [(NSMutableDictionary *)finalParentVerticalOffsets objectForKey:v7];
    [v8 doubleValue];
    double v10 = v9;

    if (v10 != 0.0)
    {
      [v5 frame];
      objc_msgSend(v5, "setFrame:");
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CKTranscriptCompositionalLayout;
    id v5 = [(CKTranscriptCompositionalLayout *)&v15 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
    double v11 = [(CKTranscriptCompositionalLayout *)self indicesOfChatItemsToBeRemovedWithoutFading];
    int v12 = objc_msgSend(v11, "containsIndex:", objc_msgSend(v4, "item"));

    if (v12) {
      [v5 setAlphaOrFilterLevel:0.0];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v5;
      double v13 = [v5 chatItem];
      if ([v13 isEditedMessageHistory]) {
        [v5 setZIndex:-1000];
      }
    }
  }

  return v5;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v4 = [(CKTranscriptCompositionalLayout *)self layoutAttributes];
  id v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 shouldUseRotisserieScrolling];

  double v97 = self;
  unint64_t v7 = [(CKTranscriptCompositionalLayout *)self collectionView];
  [v7 bounds];
  double v9 = v8 * 0.5;
  double v96 = v7;
  [v7 bounds];
  double v109 = v9 + v10;
  uint64_t v11 = [v4 count];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v98 = v4;
  obuint64_t j = (char *)v11;
  if (v11)
  {
    uint64_t v11 = 0;
    double v13 = 0;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      uint64_t v107 = v14;
      uint64_t v15 = [v4 objectAtIndex:v13];
      uint64_t v16 = v15;
      if (v6)
      {
        if (!*(unsigned char *)(v15 + 616))
        {
          objc_msgSend((id)v15, "setCenter:", v109, *(double *)(v15 + 592));
          [(id)v16 setAlphaOrFilterLevel:*(double *)(v16 + 608)];
          double v17 = *(double *)(v16 + 608);
          uint64_t v99 = v11;
          if (v17 == 1.0)
          {
            CGRect v18 = (_OWORD *)MEMORY[0x1E4F39B10];
            long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
            *(_OWORD *)(v16 + 520) = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
            *(_OWORD *)(v16 + 536) = v19;
            long long v20 = v18[7];
            *(_OWORD *)(v16 + 552) = v18[6];
            *(_OWORD *)(v16 + 568) = v20;
            long long v21 = v18[1];
            *(_OWORD *)(v16 + 456) = *v18;
            *(_OWORD *)(v16 + 472) = v21;
            long long v22 = v18[3];
            *(_OWORD *)(v16 + 488) = v18[2];
            *(_OWORD *)(v16 + 504) = v22;
          }
          else
          {
            if (v17 < 0.25) {
              double v17 = 0.25;
            }
            CATransform3DMakeScale(&v123, v17, v17, 1.0);
            long long v30 = *(_OWORD *)&v123.m11;
            long long v31 = *(_OWORD *)&v123.m13;
            long long v32 = *(_OWORD *)&v123.m23;
            *(_OWORD *)(v16 + 488) = *(_OWORD *)&v123.m21;
            *(_OWORD *)(v16 + 504) = v32;
            *(_OWORD *)(v16 + 456) = v30;
            *(_OWORD *)(v16 + 472) = v31;
            long long v33 = *(_OWORD *)&v123.m31;
            long long v34 = *(_OWORD *)&v123.m33;
            long long v35 = *(_OWORD *)&v123.m43;
            *(_OWORD *)(v16 + 552) = *(_OWORD *)&v123.m41;
            *(_OWORD *)(v16 + 568) = v35;
            *(_OWORD *)(v16 + 520) = v33;
            *(_OWORD *)(v16 + 536) = v34;
          }
          long long v121 = 0u;
          long long v122 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          id v36 = *(id *)(v16 + 632);
          uint64_t v37 = [v36 countByEnumeratingWithState:&v119 objects:v126 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v120;
            do
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v120 != v39) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v41 = *(void *)(*((void *)&v119 + 1) + 8 * i);
                long long v42 = *(_OWORD *)(v16 + 568);
                long long v44 = *(_OWORD *)(v16 + 520);
                long long v43 = *(_OWORD *)(v16 + 536);
                *(_OWORD *)(v41 + 552) = *(_OWORD *)(v16 + 552);
                *(_OWORD *)(v41 + 568) = v42;
                *(_OWORD *)(v41 + 520) = v44;
                *(_OWORD *)(v41 + 536) = v43;
                long long v45 = *(_OWORD *)(v16 + 456);
                long long v46 = *(_OWORD *)(v16 + 472);
                long long v47 = *(_OWORD *)(v16 + 504);
                *(_OWORD *)(v41 + 488) = *(_OWORD *)(v16 + 488);
                *(_OWORD *)(v41 + 504) = v47;
                *(_OWORD *)(v41 + 456) = v45;
                *(_OWORD *)(v41 + 472) = v46;
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v16);
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v119 objects:v126 count:16];
            }
            while (v38);
          }

          id v4 = v98;
          uint64_t v11 = v99;
          goto LABEL_23;
        }
      }
      else
      {
        CGFloat v24 = *(double *)(v15 + 384);
        CGFloat v23 = *(double *)(v15 + 392);
        double v25 = *(double *)(v15 + 400);
        double v26 = *(double *)(v15 + 408);
        CGFloat v28 = *(double *)(v15 + 352);
        CGFloat v27 = *(double *)(v15 + 360);
        CGFloat v101 = *(double *)(v15 + 376);
        CGFloat v102 = *(double *)(v15 + 368);
        v129.origin.CGFloat x = v24;
        v129.origin.CGFloat y = v23;
        v129.size.CGFloat width = v25;
        v129.size.CGFloat height = v26;
        if (CGRectIntersectsRect(v129, a3)
          || (v130.origin.CGFloat x = v28,
              v130.origin.CGFloat y = v27,
              v130.size.CGFloat height = v101,
              v130.size.CGFloat width = v102,
              CGRectIntersectsRect(v130, a3)))
        {
          v131.origin.CGFloat x = v24;
          v131.origin.CGFloat y = v23;
          v131.size.CGFloat width = v25;
          v131.size.CGFloat height = v26;
          CGRectGetMidX(v131);
          v132.origin.CGFloat x = v24;
          v132.origin.CGFloat y = v23;
          v132.size.CGFloat width = v25;
          v132.size.CGFloat height = v26;
          objc_msgSend((id)v16, "setCenter:", v109, CGRectGetMidY(v132));
          objc_msgSend((id)v16, "setSize:", v25, v26);
LABEL_23:
          if (v107 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v29 = (uint64_t)v13;
          }
          else {
            uint64_t v29 = v107;
          }
          ++v11;
          goto LABEL_27;
        }
      }
      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      if (v107 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v29 = v107;

        goto LABEL_30;
      }
LABEL_27:
      ++v13;

      uint64_t v14 = v29;
      if (v13 == obj) {
        goto LABEL_30;
      }
    }
  }
  uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_30:
  uint64_t v103 = v29;
  uint64_t v100 = v11;
  uint64_t v48 = [(CKTranscriptCompositionalLayout *)v97 associatedLayoutAttributes];
  id v108 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v48, "count"));
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id obja = v48;
  uint64_t v49 = [obja countByEnumeratingWithState:&v115 objects:v125 count:16];
  if (!v49) {
    goto LABEL_49;
  }
  uint64_t v50 = v49;
  uint64_t v51 = *(void *)v116;
  int v104 = v6;
  do
  {
    for (uint64_t j = 0; j != v50; ++j)
    {
      if (*(void *)v116 != v51) {
        objc_enumerationMutation(obja);
      }
      uint64_t v53 = *(void *)(*((void *)&v115 + 1) + 8 * j);
      if (v6)
      {
        if (*(unsigned char *)(v53 + 616)) {
          continue;
        }
        CGFloat v54 = *(double *)(v53 + 384);
        CGFloat v55 = *(double *)(v53 + 392);
        CGFloat v56 = *(double *)(v53 + 400);
        CGFloat v57 = *(double *)(v53 + 408);
        v133.origin.CGFloat x = v54;
        v133.origin.CGFloat y = v55;
        v133.size.CGFloat width = v56;
        v133.size.CGFloat height = v57;
        CGRectGetMidX(v133);
        v134.origin.CGFloat x = v54;
        v134.origin.CGFloat y = v55;
        v134.size.CGFloat width = v56;
        v134.size.CGFloat height = v57;
        double MidY = CGRectGetMidY(v134);
        uint64_t v59 = [v12 objectForKeyedSubscript:v53];
        CGFloat v60 = *(double *)(v59 + 384);
        CGFloat v61 = *(double *)(v59 + 392);
        CGFloat v62 = *(double *)(v59 + 400);
        CGFloat v63 = *(double *)(v59 + 408);
        v135.origin.CGFloat x = v60;
        v135.origin.CGFloat y = v61;
        v135.size.CGFloat width = v62;
        v135.size.CGFloat height = v63;
        CGRectGetMidX(v135);
        v136.origin.CGFloat x = v60;
        v136.origin.CGFloat y = v61;
        v136.size.CGFloat width = v62;
        v136.size.CGFloat height = v63;
        objc_msgSend((id)v53, "setCenter:", v109, *(double *)(v59 + 592) - (CGRectGetMidY(v136) - MidY) * *(double *)(v53 + 608));
        [(id)v53 setAlphaOrFilterLevel:*(double *)(v53 + 608)];
        double v64 = *(double *)(v53 + 608);
        if (v64 == 1.0)
        {
          int v65 = (_OWORD *)MEMORY[0x1E4F39B10];
          long long v66 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
          *(_OWORD *)(v53 + 520) = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
          *(_OWORD *)(v53 + 536) = v66;
          long long v67 = v65[7];
          *(_OWORD *)(v53 + 552) = v65[6];
          *(_OWORD *)(v53 + 568) = v67;
          long long v68 = v65[1];
          *(_OWORD *)(v53 + 456) = *v65;
          *(_OWORD *)(v53 + 472) = v68;
          long long v69 = v65[3];
          *(_OWORD *)(v53 + 488) = v65[2];
          *(_OWORD *)(v53 + 504) = v69;
        }
        else
        {
          if (v64 < 0.25) {
            double v64 = 0.25;
          }
          CATransform3DMakeScale(&v123, v64, v64, 1.0);
          long long v78 = *(_OWORD *)&v123.m11;
          long long v79 = *(_OWORD *)&v123.m13;
          long long v80 = *(_OWORD *)&v123.m23;
          *(_OWORD *)(v53 + 488) = *(_OWORD *)&v123.m21;
          *(_OWORD *)(v53 + 504) = v80;
          *(_OWORD *)(v53 + 456) = v78;
          *(_OWORD *)(v53 + 472) = v79;
          long long v81 = *(_OWORD *)&v123.m31;
          long long v82 = *(_OWORD *)&v123.m33;
          long long v83 = *(_OWORD *)&v123.m43;
          *(_OWORD *)(v53 + 552) = *(_OWORD *)&v123.m41;
          *(_OWORD *)(v53 + 568) = v83;
          *(_OWORD *)(v53 + 520) = v81;
          *(_OWORD *)(v53 + 536) = v82;
        }

        int v6 = v104;
        goto LABEL_46;
      }
      CGFloat v71 = *(double *)(v53 + 384);
      CGFloat v70 = *(double *)(v53 + 392);
      double v72 = *(double *)(v53 + 400);
      double v73 = *(double *)(v53 + 408);
      CGFloat v74 = *(double *)(v53 + 352);
      CGFloat v75 = *(double *)(v53 + 360);
      CGFloat v76 = *(double *)(v53 + 368);
      CGFloat v77 = *(double *)(v53 + 376);
      v137.origin.CGFloat x = v71;
      v137.origin.CGFloat y = v70;
      v137.size.CGFloat width = v72;
      v137.size.CGFloat height = v73;
      if (!CGRectIntersectsRect(v137, a3))
      {
        v138.origin.CGFloat x = v74;
        v138.origin.CGFloat y = v75;
        v138.size.CGFloat width = v76;
        v138.size.CGFloat height = v77;
        if (!CGRectIntersectsRect(v138, a3)) {
          continue;
        }
      }
      v139.origin.CGFloat x = v71;
      v139.origin.CGFloat y = v70;
      v139.size.CGFloat width = v72;
      v139.size.CGFloat height = v73;
      CGRectGetMidX(v139);
      v140.origin.CGFloat x = v71;
      v140.origin.CGFloat y = v70;
      v140.size.CGFloat width = v72;
      v140.size.CGFloat height = v73;
      objc_msgSend((id)v53, "setCenter:", v109, CGRectGetMidY(v140));
      objc_msgSend((id)v53, "setSize:", v72, v73);
LABEL_46:
      [v108 addObject:v53];
      continue;
    }
    uint64_t v50 = [obja countByEnumeratingWithState:&v115 objects:v125 count:16];
  }
  while (v50);
LABEL_49:

  BOOL v84 = [(CKTranscriptCompositionalLayout *)v97 decorationLayoutAttributes];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  uint64_t v85 = [v84 countByEnumeratingWithState:&v111 objects:v124 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v112;
    do
    {
      for (uint64_t k = 0; k != v86; ++k)
      {
        if (*(void *)v112 != v87) {
          objc_enumerationMutation(v84);
        }
        double v89 = *(void **)(*((void *)&v111 + 1) + 8 * k);
        double v90 = [(CKTranscriptCompositionalLayout *)v97 collectionView];
        [v90 bounds];
        objc_msgSend(v89, "setFrame:");
      }
      uint64_t v86 = [v84 countByEnumeratingWithState:&v111 objects:v124 count:16];
    }
    while (v86);
  }
  if (v103 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v91 = 0;
    double v92 = v98;
  }
  else
  {
    double v92 = v98;
    double v91 = objc_msgSend(v98, "subarrayWithRange:", v103, v100);
  }
  if (v108)
  {
    uint64_t v93 = [v91 arrayByAddingObjectsFromArray:v108];

    double v91 = (void *)v93;
  }
  if (v84)
  {
    uint64_t v94 = [v91 arrayByAddingObjectsFromArray:v84];

    double v91 = (void *)v94;
  }

  return v91;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCompositionalLayout *)self layoutAttributes];
  int v6 = [(CKTranscriptCompositionalLayout *)self associatedLayoutAttributes];
  if ([v4 section]) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v5;
  }
  id v8 = v7;
  if ([v8 count] && (unint64_t v9 = objc_msgSend(v4, "item"), v9 < objc_msgSend(v8, "count")))
  {
    double v10 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v4, "item"));
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v5 = a4;
  int v6 = [(CKTranscriptCompositionalLayout *)self decorationLayoutAttributes];
  uint64_t v7 = [v5 section];

  id v8 = [v6 objectAtIndex:v7];

  return v8;
}

- (CGSize)collectionViewContentSize
{
  if (self)
  {
    double width = self->_contentSize.width;
    double height = self->_contentSize.height;
  }
  else
  {
    double height = 0.0;
    double width = 0.0;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)applyDynamicScrollResistanceToItemsForScrollDeltaY:(double)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(CKTranscriptCompositionalLayout *)self layoutAttributes];
  uint64_t v5 = [v4 count];
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (void *)((char *)v10 - v6);
  bzero((char *)v10 - v6, v8);
  objc_msgSend(v4, "getObjects:range:", v7, 0, v5);
  for (; v5; --v5)
  {
    uint64_t v9 = *v7++;
    *(double *)(v9 + 392) = *(double *)(v9 + 392) + a3;
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  kdebug_trace();
  if ([(CKTranscriptCompositionalLayout *)self isHoldingBoundsInvalidation]) {
    return 0;
  }
  size_t v8 = [(CKTranscriptCompositionalLayout *)self collectionView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [(CKTranscriptCompositionalLayout *)self collectionView];
  uint64_t v16 = [v15 delegate];
  double v17 = [v16 currentEffectForCollectionView:v15 layout:self];
  if ([(CKTranscriptCompositionalLayout *)self _dynamicsAreEnabled])
  {
    double v18 = y - v12;
    if (y - v12 != 0.0)
    {
      self->_cumulativeDisplayDrivenDynamicsRunTime = 0.0;
      [(CKTranscriptCompositionalLayout *)self applyDynamicScrollResistanceToItemsForScrollDeltaY:v18];
      [(CKTranscriptCompositionalLayout *)self _kickDynamicsIfNeeded];
    }
  }
  if (v17
    || (+[CKUIBehavior sharedBehaviors],
        long long v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = [v19 shouldUseRotisserieScrolling],
        v19,
        (v20 & 1) != 0)
    || v14 != width
    || v10 != x)
  {
    kdebug_trace();
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_dynamicsAreEnabled
{
  id v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 shouldUseDynamicScrolling];

  if (!v4 || [(CKTranscriptCompositionalLayout *)self isInBackground]) {
    return 0;
  }
  uint64_t v6 = [(CKTranscriptCompositionalLayout *)self collectionView];
  BOOL v5 = ([v6 dynamicsDisabled] & 1) == 0
    && ([(IMScheduledUpdater *)self->_dynamicsUpdater isHoldingUpdates] & 1) == 0
    && (![(CKTranscriptCompositionalLayout *)self disableDynamicsWhileScrolling]
     || ![(CKTranscriptCompositionalLayout *)self isResting]);

  return v5;
}

- (void)reloadData
{
  [(CKTranscriptCompositionalLayout *)self setLayoutAttributes:0];
  id v3 = [(CKTranscriptCompositionalLayout *)self associatedLayoutAttributes];
  [(CKTranscriptCompositionalLayout *)self setOldAssociatedLayoutAttributes:v3];

  [(CKTranscriptCompositionalLayout *)self setAssociatedLayoutAttributes:0];

  [(CKTranscriptCompositionalLayout *)self setDecorationLayoutAttributes:0];
}

- (void)updateAssociatedLayoutAttributesIfNecessary
{
  id v2 = [(CKTranscriptCompositionalLayout *)self layoutAttributes];
}

- (void)invalidateDisplayLink
{
  if (self)
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    -[CKTranscriptCompositionalLayout setDisplayLink:]((uint64_t)self, 0);
    self->_double previousFrameTimestamp = 0.0;
    self->_double currentFrameTimestamp = 0.0;
    self->_cumulativeDisplayDrivenDynamicsRunTime = 0.0;
  }
  else
  {
    [0 invalidate];
    -[CKTranscriptCompositionalLayout setDisplayLink:](0, 0);
  }

  [(CKTranscriptCompositionalLayout *)self removeUpdateSequenceItem];
}

- (void)updateDynamicsWatchdogForRenderedFrameWithDuration:(double)a3
{
  if (a3 <= 2.0)
  {
    if (a3 > 0.0) {
      self->_cumulativeDisplayDrivenDynamicsRunTime = self->_cumulativeDisplayDrivenDynamicsRunTime + a3;
    }
  }
  else
  {
    int v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptCompositionalLayout updateDynamicsWatchdogForRenderedFrameWithDuration:](v4, a3);
    }
  }
}

- (void)checkDynamicsWatchdog
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134218240;
  uint64_t v4 = v2;
  __int16 v5 = 2048;
  uint64_t v6 = 0x4024000000000000;
  _os_log_fault_impl(&dword_18EF18000, a2, OS_LOG_TYPE_FAULT, "Display driven transcriptDynamics has been running for %.2f seconds, which is more than > %.2f, invoking displayLink watchdog", (uint8_t *)&v3, 0x16u);
}

- (void)removeUpdateSequenceItem
{
  if (_UIUpdateCycleEnabled() && self->_dynamicsUpdateSequenceItem)
  {
    _UIUpdateSequenceRemoveItem();
    self->_dynamicsUpdateSequenceItem = 0;
    MEMORY[0x1F4102FE8](&CKDynamicsUpdateRequest, 1310721);
  }
}

- (void)reloadLayout
{
  [(CKTranscriptCompositionalLayout *)self reloadData];

  [(CKTranscriptCompositionalLayout *)self invalidateLayout];
}

- (void)setInitialIndex:(unint64_t)a3 forParentOfAssociatedItemInsertedAtIndex:(unint64_t)a4
{
  layoutAttributes = self->_layoutAttributes;
  if (layoutAttributes && [(NSArray *)layoutAttributes count] > a3)
  {
    initialParentLayoutAttributes = self->_initialParentLayoutAttributes;
    id v10 = [(NSArray *)self->_layoutAttributes objectAtIndex:a3];
    double v9 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)initialParentLayoutAttributes setObject:v10 forKey:v9];
  }
}

- (void)setVerticalOffset:(double)a3 forParentOfAssociatedItemDeletedAtIndex:(unint64_t)a4
{
  finalParentVerticalOffsets = self->_finalParentVerticalOffsets;
  id v7 = [NSNumber numberWithDouble:a3];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)finalParentVerticalOffsets setObject:v7 forKey:v6];
}

- (void)clearParentInitialIndexesAndFinalOffsets
{
  [(NSMutableDictionary *)self->_initialParentLayoutAttributes removeAllObjects];
  finalParentVerticalOffsets = self->_finalParentVerticalOffsets;

  [(NSMutableDictionary *)finalParentVerticalOffsets removeAllObjects];
}

- (NSArray)layoutAttributes
{
  uint64_t v2 = self;
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  p_layoutAttributes = &self->_layoutAttributes;
  layoutAttributes = self->_layoutAttributes;
  if (!layoutAttributes)
  {
    location = (id *)p_layoutAttributes;
    __int16 v5 = [(CKTranscriptCompositionalLayout *)v2 collectionView];
    uint64_t v6 = [v5 delegate];
    long long v120 = [v6 currentEffectForCollectionView:v5 layout:v2];
    id v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v8 = [v7 isDiffableTranscriptDataSourceEnabled];

    if (v8) {
      uint64_t v9 = [v5 numberOfItemsInSection:0];
    }
    else {
      uint64_t v9 = [v6 collectionView:v5 numberOfItemsInSection:0];
    }
    uint64_t v10 = v9;
    id v113 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
    CATransform3D v123 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v108 = v5;
    long long v118 = v6;
    id v125 = v2;
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v122 = *MEMORY[0x1E4F1C3A8];
      uint64_t v109 = v10;
      do
      {
        double v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:0];
        double v13 = [MEMORY[0x1E4F28D58] indexPathForRow:v11 inSection:0];
        v131.receiver = v2;
        v131.super_class = (Class)CKTranscriptCompositionalLayout;
        uint64_t v14 = [(CKTranscriptCompositionalLayout *)&v131 layoutAttributesForItemAtIndexPath:v13];

        uint64_t v15 = [v118 collectionView:v5 layout:v2 chatItemForItemAtIndexPath:v12];
        uint64_t v16 = (void *)v15;
        if (v14)
        {
          [(id)v14 setChatItem:v15];
          long long v121 = v16;
          [(id)v14 frame];
          *(void *)(v14 + 352) = v17;
          *(void *)(v14 + 360) = v18;
          *(void *)(v14 + 368) = v19;
          *(void *)(v14 + 376) = v20;
          [(id)v14 frame];
          *(void *)(v14 + 384) = v21;
          *(void *)(v14 + 392) = v22;
          *(void *)(v14 + 400) = v23;
          *(void *)(v14 + 408) = v24;
          [(id)v14 center];
          *(void *)(v14 + 592) = v25;
          [(id)v14 center];
          *(void *)(v14 + 584) = v26;
          *(void *)(v14 + 608) = 0x3FF0000000000000;
          *(unsigned char *)(v14 + 616) = 0;
          [(id)v14 frame];
          *(void *)(v14 + 600) = v27;
          [v113 addObject:v14];
          if (!v11)
          {
            objc_opt_class();
            [(CKTranscriptCompositionalLayout *)v2 setHasLoadMore:objc_opt_isKindOfClass() & 1];
          }
          id v28 = v16;
          objc_opt_class();
          id v29 = v28;
          if (objc_opt_isKindOfClass())
          {
            long long v30 = [v28 previousPluginChatItem];
            long long v31 = v30;
            id v29 = v28;
            if (v30)
            {
              id v29 = v30;
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v29 isAppearing]) {
            [(id)v14 setAlphaOrFilterLevel:0.0];
          }
          id v119 = v29;
          [(CKTranscriptCompositionalLayout *)v2 _updateAttributeZIndex:v14 forEffect:v120];
          long long v32 = [v28 visibleAssociatedMessageChatItems];
          long long v33 = +[CKPrintController sharedInstance];
          char v34 = [v33 isPrinting];

          obuint64_t j = 0;
          if (v32 && (v34 & 1) == 0)
          {
            long long v111 = v12;
            id v112 = v28;
            uint64_t v110 = v14;
            uint64_t v116 = v11;
            obuint64_t j = [MEMORY[0x1E4F1CA48] array];
            long long v127 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            long long v130 = 0u;
            long long v114 = v32;
            id v35 = v32;
            uint64_t v36 = [v35 countByEnumeratingWithState:&v127 objects:v132 count:16];
            uint64_t v37 = v123;
            if (v36)
            {
              uint64_t v38 = v36;
              uint64_t v39 = *(void *)v128;
              do
              {
                for (uint64_t i = 0; i != v38; ++i)
                {
                  if (*(void *)v128 != v39) {
                    objc_enumerationMutation(v35);
                  }
                  uint64_t v41 = *(void **)(*((void *)&v127 + 1) + 8 * i);
                  uint64_t v42 = [(NSArray *)v37 count];
                  long long v43 = [MEMORY[0x1E4F28D58] indexPathForItem:v42 inSection:1];
                  v126.receiver = v2;
                  v126.super_class = (Class)CKTranscriptCompositionalLayout;
                  long long v44 = [(CKTranscriptCompositionalLayout *)&v126 layoutAttributesForItemAtIndexPath:v43];
                  long long v45 = v2;
                  long long v46 = v44;
                  if (v44)
                  {
                    [v44 setChatItem:v41];
                    initialParentLayoutAttributes = v45->_initialParentLayoutAttributes;
                    uint64_t v48 = [NSNumber numberWithUnsignedInteger:v42];
                    uint64_t v49 = [(NSMutableDictionary *)initialParentLayoutAttributes objectForKey:v48];
                    uint64_t v50 = (void *)v46[80];
                    v46[80] = v49;

                    [obj addObject:v46];
                    [(NSArray *)v37 addObject:v46];
                  }
                  else
                  {
                    uint64_t v51 = IMLogHandleForCategory();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315650;
                      CGRect v134 = "-[CKTranscriptCompositionalLayout layoutAttributes]";
                      __int16 v135 = 2112;
                      CGRect v136 = v43;
                      __int16 v137 = 2112;
                      id v138 = v41;
                      _os_log_error_impl(&dword_18EF18000, v51, OS_LOG_TYPE_ERROR, "%s (associatedLayoutAttributes) got nil attribute for %@ item %@", buf, 0x20u);
                    }

                    double v52 = [MEMORY[0x1E4F1CA00] exceptionWithName:v122, @"CKTranscriptCompositionalLayout's super implementation is out of sync with CKTranscriptCompositionalLayout. Got nil layout attributes for associated item. If allowed to continue, this would be a fatal crash. Please file a radar.", 0 reason userInfo];
                    IMLogSimulateCrashForException();

                    uint64_t v37 = v123;
                  }

                  uint64_t v2 = v125;
                }
                uint64_t v38 = [v35 countByEnumeratingWithState:&v127 objects:v132 count:16];
              }
              while (v38);
            }

            __int16 v5 = v108;
            uint64_t v10 = v109;
            long long v32 = v114;
            uint64_t v11 = v116;
            uint64_t v14 = v110;
            double v12 = v111;
            id v28 = v112;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v53 = v14;
            CGFloat v54 = v5;
            CGFloat v55 = v12;
            CGFloat v56 = [v28 messageHighlightChatItem];
            if (v56)
            {
              uint64_t v117 = v11;
              uint64_t v57 = [(NSArray *)v123 count];
              double v58 = [MEMORY[0x1E4F28D58] indexPathForItem:v57 inSection:1];
              uint64_t v59 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:"layoutAttributesForCellWithIndexPath:"];
              CGFloat v60 = v59;
              if (v59)
              {
                long long v115 = v32;
                [v59 setChatItem:v56];
                CGFloat v61 = v2->_initialParentLayoutAttributes;
                CGFloat v62 = [NSNumber numberWithUnsignedInteger:v57];
                uint64_t v63 = [(NSMutableDictionary *)v61 objectForKey:v62];
                double v64 = (void *)v60[80];
                v60[80] = v63;

                [(NSArray *)v123 addObject:v60];
                int v65 = obj;
                if (!obj)
                {
                  int v65 = [MEMORY[0x1E4F1CA48] array];
                }
                obuint64_t j = v65;
                [v65 addObject:v60];
                long long v66 = v121;
                long long v32 = v115;
              }
              else
              {
                CGFloat v70 = IMLogHandleForCategory();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  CGRect v134 = "-[CKTranscriptCompositionalLayout layoutAttributes]";
                  __int16 v135 = 2112;
                  CGRect v136 = v58;
                  __int16 v137 = 2112;
                  id v138 = v28;
                  _os_log_error_impl(&dword_18EF18000, v70, OS_LOG_TYPE_ERROR, "%s (highlightChatItem) got nil attribute for %@ item %@", buf, 0x20u);
                }

                CGFloat v71 = [MEMORY[0x1E4F1CA00] exceptionWithName:v122, @"CKTranscriptCompositionalLayout's super implementation is out of sync with CKTranscriptCompositionalLayout. Got nil layout attributes for highlight item. If allowed to continue, this would be a fatal crash. Please file a radar.", 0 reason userInfo];
                IMLogSimulateCrashForException();

                long long v66 = v121;
              }

              uint64_t v10 = v109;
              uint64_t v11 = v117;
            }
            else
            {
              long long v66 = v121;
            }

            double v12 = v55;
            __int16 v5 = v54;
            uint64_t v14 = v53;
          }
          else
          {
            long long v66 = v121;
          }
          double v72 = obj;
          if (obj)
          {
            objc_storeStrong((id *)(v14 + 632), obj);
            [(CKTranscriptCompositionalLayout *)v2 _updateAssociatedAttributeFramesForPrimaryAttribute:v14];
            double v72 = obj;
          }

          long long v69 = v119;
        }
        else
        {
          long long v67 = (void *)v15;
          long long v68 = IMLogHandleForCategory();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            CGRect v134 = "-[CKTranscriptCompositionalLayout layoutAttributes]";
            __int16 v135 = 2112;
            CGRect v136 = v12;
            __int16 v137 = 2112;
            id v138 = v67;
            _os_log_error_impl(&dword_18EF18000, v68, OS_LOG_TYPE_ERROR, "%s (compAttributes) got nil attribute for %@ item %@", buf, 0x20u);
          }

          long long v69 = [MEMORY[0x1E4F1CA00] exceptionWithName:v122, @"CKTranscriptCompositionalLayout's super implementation is out of sync with CKTranscriptCompositionalLayout. Got nil layout attributes. If allowed to continue, this would be a fatal crash. Please file a radar.", 0 reason userInfo];
          IMLogSimulateCrashForException();
          long long v66 = v67;
        }

        ++v11;
      }
      while (v11 != v10);
    }
    -[CKTranscriptCompositionalLayout _configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:](v2, "_configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:", v113, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v73 = v120;
    if (!v2->_decorationLayoutAttributes && v120)
    {
      CGFloat v74 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v75 = [v120 layerCount];
      unsigned int v76 = [v120 shouldDrawOverNavigationBar];
      if (v75) {
        uint64_t v77 = v76;
      }
      else {
        uint64_t v77 = 0;
      }
      uint64_t v78 = v75 - v77;
      if (v75 != v77)
      {
        uint64_t v79 = 0;
        do
        {
          if ([v73 effectViewClass])
          {
            long long v80 = (void *)MEMORY[0x1E4F428A0];
            long long v81 = +[CKFullscreenEffectDecorationView decorationViewKind];
            long long v82 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v79];
            long long v83 = [v80 layoutAttributesForDecorationViewOfKind:v81 withIndexPath:v82];

            uint64_t v2 = v125;
            BOOL v84 = [(CKTranscriptCompositionalLayout *)v125 collectionView];
            [v84 bounds];
            double v86 = v85;
            double v88 = v87;
            double v90 = v89;
            double v92 = v91;

            objc_msgSend(v83, "setFrame:", v86, v88, v90, v92);
            char v93 = [v120 isForegroundEffect];
            if (v78 - 1 == v79) {
              uint64_t v94 = 3000;
            }
            else {
              uint64_t v94 = 1000;
            }
            if (!v79) {
              uint64_t v94 = -2000;
            }
            if (v93) {
              uint64_t v95 = 3000;
            }
            else {
              uint64_t v95 = v94;
            }
            [v83 setZIndex:v95];
            [(NSArray *)v74 addObject:v83];

            double v73 = v120;
          }
          ++v79;
        }
        while (v78 != v79);
      }
      decorationLayoutAttributes = v2->_decorationLayoutAttributes;
      v2->_decorationLayoutAttributes = v74;

      __int16 v5 = v108;
    }
    objc_storeStrong(location, v113);
    double v97 = [(CKTranscriptCompositionalLayout *)v2 oldAssociatedLayoutAttributes];
    if (v97) {
      [(CKTranscriptCompositionalLayout *)v2 oldAssociatedLayoutAttributes];
    }
    else {
    double v98 = [MEMORY[0x1E4F1C978] array];
    }

    uint64_t v99 = v123;
    if (!v123)
    {
      uint64_t v99 = [MEMORY[0x1E4F1CA48] array];
    }
    uint64_t v100 = [(NSArray *)v99 differenceFromArray:v98 withOptions:0 usingEquivalenceTest:&__block_literal_global_126_0];
    IMIndexesFromOrderedCollectionDifference();
    id v101 = 0;
    id v102 = 0;
    uint64_t v103 = (void *)[v101 mutableCopy];
    [(CKTranscriptCompositionalLayout *)v125 setInsertedAssociatedLayoutAttributes:v103];

    [(CKTranscriptCompositionalLayout *)v125 setOldAssociatedLayoutAttributes:0];
    associatedLayoutAttributes = v125->_associatedLayoutAttributes;
    v125->_associatedLayoutAttributes = v99;
    double v105 = v99;

    [(CKTranscriptCompositionalLayout *)v125 updateContentSize];
    [(CKTranscriptCompositionalLayout *)v125 _applyTargetFrameOffsetsForLayoutAttributesIfNeeded:*location];
    [(CKTranscriptCompositionalLayout *)v125 _applyCurrentFrameOffsetsForLayoutAttributesIfNeeded:*location];

    layoutAttributes = (NSArray *)*location;
  }

  return layoutAttributes;
}

uint64_t __51__CKTranscriptCompositionalLayout_layoutAttributes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  __int16 v5 = [a2 chatItem];
  uint64_t v6 = [v4 chatItem];

  uint64_t v7 = [v5 isEqual:v6];
  return v7;
}

- (void)_updateAttributeZIndex:(id)a3 forEffect:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = [v20 chatItem];
  if ([v6 layerCount])
  {
    id v8 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v6 triggeringChatItem];
      char v10 = [v8 isEqual:v9];

      if (v10)
      {
        uint64_t v11 = 4000;
LABEL_7:
        [v20 setZIndex:v11];
        goto LABEL_8;
      }
      if ([v8 isFromMe])
      {
        uint64_t v11 = 2000;
        goto LABEL_7;
      }
    }
LABEL_8:
  }
  if ([v7 isEditedMessageHistory]) {
    [v20 setZIndex:-1000];
  }
  double v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v13 = [v12 isExpressiveTextEnabled];

  if (v13)
  {
    uint64_t v14 = [(CKTranscriptCompositionalLayout *)self collectionView];
    uint64_t v15 = [v14 delegate];

    uint64_t v16 = [v20 indexPath];
    int v17 = [v15 collectionViewLayout:self hasPlayingOrPausedTextEffectForChatItem:v7 indexPath:v16];

    if (v17)
    {
      uint64_t v18 = [v20 zIndex];
      if (v18 <= 3000) {
        uint64_t v19 = 3000;
      }
      else {
        uint64_t v19 = v18;
      }
      [v20 setZIndex:v19];
    }
  }
}

- (void)_updateAssociatedAttributeFramesForPrimaryAttribute:(id)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  __int16 v5 = [(CKTranscriptCompositionalLayout *)self collectionView];
  [v5 bounds];
  double v7 = v6;
  uint64_t v95 = v5;
  [v5 marginInsets];
  double v103 = v9;
  double v104 = v8;
  id v10 = v4[82];
  [v4 frame];
  double v102 = v11;
  double v13 = v12;
  double rect = v14;
  double v16 = v15;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v17 = v4[79];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v117 objects:v122 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = 0;
    uint64_t v99 = 0;
    uint64_t v21 = *(void *)v118;
    double v22 = *MEMORY[0x1E4F1DB28];
    CGFloat v97 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v105 = *MEMORY[0x1E4F1DAD8];
    double v100 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v101 = v13;
    id v98 = v17;
    while (1)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v118 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v24 = *(void *)(*((void *)&v117 + 1) + 8 * i);
        uint64_t v25 = [(id)v24 chatItem];
        [v25 size];
        double v27 = v26;
        [v25 contentInsets];
        uint64_t v116 = 0;
        double v30 = v27 + v104 + v28 + v103 + v29;
        memset(&v115, 0, sizeof(v115));
        if (!v25) {
          goto LABEL_18;
        }
        [v25 geometryDescriptor];
        if (*(void *)&v115.a == 11)
        {
          v124.origin.double x = v102;
          v124.origin.double y = v13;
          v124.size.double width = rect;
          v124.size.double height = v16;
          double MaxY = CGRectGetMaxY(v124);
          CGFloat v61 = +[CKUIBehavior sharedBehaviors];
          [v61 messageHighlightTranscriptBalloonRelativePosition];
          double v58 = MaxY - v62;

          double v32 = v105;
          goto LABEL_32;
        }
        if (*(void *)&v115.a == 10)
        {
          objc_opt_class();
          double v31 = v100;
          double v32 = v105;
          if (objc_opt_isKindOfClass())
          {
            id v96 = v20;
            id v33 = v10;
            char v34 = [v33 layoutRecipe];
            [v33 size];
            double v37 = rect / v35;
            if (v35 == 0.0) {
              double v37 = 0.0;
            }
            double v38 = v16 / v36;
            if (v36 == 0.0) {
              double v38 = 0.0;
            }
            double v39 = fmin(v37, v38);
            double v40 = v35 * v39;
            double v41 = v36 * v39 * -0.5;
            if ([v33 transcriptOrientation])
            {
              if ([v33 transcriptOrientation] == 2)
              {
                double v42 = v40 * -0.5;
              }
              else
              {
                double v41 = v100;
                double v42 = v105;
              }
            }
            else
            {
              double v42 = v40 * 0.5;
            }
            memset(&v113, 0, sizeof(v113));
            [v34 rotation];
            CGAffineTransformMakeRotation(&v113, v63 * 3.14159265 / 180.0);
            double v64 = v113.tx + v41 * v113.c + v113.a * v42 - v42;
            CGFloat v65 = v113.ty + v41 * v113.d + v113.b * v42 - v41;
            long long v66 = +[CKUIBehavior sharedBehaviors];
            [v66 messageAcknowledgmentTranscriptOrganicBalloonAdditionalOffset];
            double v68 = v67;
            double v70 = v69;

            double v31 = v70 - v65;
            if ([v33 transcriptOrientation])
            {
              if ([v33 transcriptOrientation] == 2)
              {
                double v32 = v64 + v68;
              }
              else
              {
                double v31 = v100;
                double v32 = v105;
              }
            }
            else
            {
              double v32 = v64 - v68;
            }
            id v17 = v98;

            double v13 = v101;
            id v20 = v96;
          }
          v125.origin.double x = v22;
          v125.origin.double y = v97;
          v125.size.double width = v7;
          v125.size.double height = v30;
          double v71 = v13 - CGRectGetHeight(v125);
          double v72 = +[CKUIBehavior sharedBehaviors];
          [v72 messageAcknowledgmentTranscriptBalloonRelativePosition];
          double v58 = v71 - v73 - v31;
        }
        else
        {
LABEL_18:
          objc_msgSend(v25, "adjustedParentFrameForPositioning:", v102, v13, rect, v16);
          double v44 = v43;
          double v46 = v45;
          double v48 = v47;
          double v50 = v49;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v25 isReaction])
          {
            uint64_t v51 = [v10 itemIsFromMe];
            [v10 stickerReactionInsets];
            uint64_t v52 = v51;
            id v17 = v98;
            +[CKAssociatedMessageChatItem locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:](CKAssociatedMessageChatItem, "locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:", v99, v52, v44, v46, v48, v50, v53, v54, v55, v56);
            double v58 = v57;
            [v25 setStickerReactionIndex:v99++];
          }
          else
          {
            CGAffineTransform v113 = v115;
            uint64_t v114 = v116;
            +[CKAssociatedMessageChatItem verticalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:](CKAssociatedMessageChatItem, "verticalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", &v113, v7, v30, v44, v46, v48, v50);
            double v58 = v59;
          }
          double v32 = v105;
          double v13 = v101;
        }
LABEL_32:
        objc_msgSend((id)v24, "setFrame:", v22, v58, v7, v30);
        *(double *)(v24 + 384) = v22;
        *(double *)(v24 + 392) = v58;
        *(double *)(v24 + 400) = v7;
        *(double *)(v24 + 408) = v30;
        *(double *)(v24 + 352) = v22;
        *(double *)(v24 + 360) = v58;
        *(double *)(v24 + 368) = v7;
        *(double *)(v24 + 376) = v30;
        v126.origin.double x = v22;
        v126.origin.double y = v58;
        v126.size.double width = v7;
        v126.size.double height = v30;
        double MidX = CGRectGetMidX(v126);
        v127.origin.double x = v22;
        v127.origin.double y = v58;
        v127.size.double width = v7;
        v127.size.double height = v30;
        double MidY = CGRectGetMidY(v127);
        objc_msgSend((id)v24, "setCenter:", MidX, MidY);
        *(double *)(v24 + 584) = MidY;
        *(double *)(v24 + 592) = MidY;
        *(void *)(v24 + 608) = v4[76];
        *(unsigned char *)(v24 + 616) = *((unsigned char *)v4 + 616);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v20) {
            id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v20 addObject:v24];
        }
        else
        {
          objc_msgSend((id)v24, "setZIndex:", objc_msgSend(v4, "zIndex") + 1);
        }
        [v10 size];
        double v77 = v76;
        double v79 = v78;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v80 = [v10 layoutRecipe];
          long long v81 = v80;
          double v82 = rect / v77;
          if (v77 == 0.0) {
            double v82 = 0.0;
          }
          double v83 = v16 / v79;
          if (v79 == 0.0) {
            double v83 = 0.0;
          }
          double v84 = fmin(v82, v83);
          double v85 = v77 * v84;
          double v79 = v79 * v84;
          [v80 offset];
          double v77 = v85 + v86;
        }
        objc_msgSend((id)v24, "setParentChatItemSize:", v77, v79);
        [(id)v24 setParentRotationOffset:v32];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v117 objects:v122 count:16];
      if (!v19)
      {

        if (v20)
        {
          id v17 = [v20 sortedArrayUsingComparator:&__block_literal_global_132_1];
          v111[0] = MEMORY[0x1E4F143A8];
          v111[1] = 3221225472;
          v111[2] = __87__CKTranscriptCompositionalLayout__updateAssociatedAttributeFramesForPrimaryAttribute___block_invoke_2;
          v111[3] = &unk_1E56297F0;
          id v112 = v4;
          [v17 enumerateObjectsUsingBlock:v111];

          goto LABEL_48;
        }
        goto LABEL_49;
      }
    }
  }
  id v20 = 0;
LABEL_48:

LABEL_49:
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v87 = v4[79];
  uint64_t v88 = [v87 countByEnumeratingWithState:&v107 objects:v121 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v108;
    do
    {
      for (uint64_t j = 0; j != v89; ++j)
      {
        if (*(void *)v108 != v90) {
          objc_enumerationMutation(v87);
        }
        uint64_t v92 = *(void *)(*((void *)&v107 + 1) + 8 * j);
        char v93 = *(void **)(v92 + 640);
        if (v93)
        {
          [v93 frame];
          *(double *)(v92 + 624) = v13 - v94;
        }
      }
      uint64_t v89 = [v87 countByEnumeratingWithState:&v107 objects:v121 count:16];
    }
    while (v89);
  }
}

uint64_t __87__CKTranscriptCompositionalLayout__updateAssociatedAttributeFramesForPrimaryAttribute___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  __int16 v5 = [a2 chatItem];
  double v6 = [v4 chatItem];

  double v7 = [v5 time];
  double v8 = [v6 time];
  uint64_t v9 = [v7 compare:v8];

  return v9;
}

void __87__CKTranscriptCompositionalLayout__updateAssociatedAttributeFramesForPrimaryAttribute___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  __int16 v5 = *(void **)(a1 + 32);
  id v9 = a2;
  uint64_t v6 = a3 + [v5 zIndex] + 2;
  uint64_t v7 = [*(id *)(a1 + 32) zIndex];
  if (v6 >= v7 + 999) {
    uint64_t v8 = v7 + 999;
  }
  else {
    uint64_t v8 = v6;
  }
  [v9 setZIndex:v8];
}

- (void)_configureThreadGroupsForAttributes:(id)a3 outMaxYAnchorAttribute:(id *)a4 forVisibleBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (![(CKTranscriptCompositionalLayout *)self isUsingOverlayLayout])
  {
    uint64_t v66 = 0;
    double v67 = &v66;
    uint64_t v68 = 0x3032000000;
    double v69 = __Block_byref_object_copy__48;
    double v70 = __Block_byref_object_dispose__48;
    id v71 = 0;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x3032000000;
    v64[3] = __Block_byref_object_copy__48;
    v64[4] = __Block_byref_object_dispose__48;
    id v65 = 0;
    uint64_t v58 = 0;
    double v59 = (id *)&v58;
    uint64_t v60 = 0x3032000000;
    CGFloat v61 = __Block_byref_object_copy__48;
    double v62 = __Block_byref_object_dispose__48;
    id v63 = 0;
    uint64_t v52 = 0;
    double v53 = &v52;
    uint64_t v54 = 0x3032000000;
    double v55 = __Block_byref_object_copy__48;
    double v56 = __Block_byref_object_dispose__48;
    id v57 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __111__CKTranscriptCompositionalLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke;
    aBlock[3] = &unk_1E5629818;
    aBlock[4] = &v66;
    aBlock[5] = &v58;
    aBlock[6] = v64;
    double v38 = (void (**)(void *, id *, id))_Block_copy(aBlock);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __111__CKTranscriptCompositionalLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke_2;
    v50[3] = &unk_1E5629840;
    v50[4] = &v66;
    v50[5] = &v58;
    *(CGFloat *)&v50[7] = x;
    *(CGFloat *)&v50[8] = y;
    *(CGFloat *)&v50[9] = width;
    *(CGFloat *)&v50[10] = height;
    v50[6] = &v52;
    double v42 = (void (**)(void))_Block_copy(v50);
    unsigned int v41 = [(CKTranscriptCompositionalLayout *)self chatStyle];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v72 count:16];
    if (v11)
    {
      id v37 = v10;
      uint64_t v43 = *(void *)v47;
      do
      {
        uint64_t v44 = v11;
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v47 != v43) {
            objc_enumerationMutation(obj);
          }
          double v13 = *(id **)(*((void *)&v46 + 1) + 8 * i);
          double v14 = [obj lastObject];

          id v15 = v13[82];
          objc_opt_class();
          int isKindOfClass = objc_opt_isKindOfClass();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() | isKindOfClass))
          {
            id v17 = [v15 IMChatItem];
            objc_opt_class();
            int v18 = objc_opt_isKindOfClass();
            int v19 = [v17 itemIsThreadOriginator];
            int v20 = isKindOfClass ^ 1;
            int v21 = ([v17 itemIsReplyContextPreview] | v19 & v20) & (v18 ^ 1);
            double v22 = (void *)v67[5];
            if (v22 || !v21)
            {
              if ([v22 count])
              {
                int v40 = v21;
                uint64_t v23 = [v17 threadGroupIdentifier];
                int v24 = IMMessageThreadIdentifierOriginatorGUIDAndPartMatch();
                int v25 = [v17 isFromMe];
                int v26 = [v17 itemIsReply];
                if (v41 == 45) {
                  char v27 = v25;
                }
                else {
                  char v27 = 1;
                }
                double v39 = (void *)v23;
                if (v27) {
                  BOOL v28 = 0;
                }
                else {
                  BOOL v28 = [v15 contiguousType] == 2
                }
                     || [v15 contiguousType] == 3;
                int v29 = v24 ^ 1 | [v15 itemIsReplyContextPreview] | v28;
                id v10 = v37;
                if ((v29 & 1) == 0)
                {
                  [(id)v67[5] addObject:v13];
                  objc_storeStrong(v59 + 5, v13);
                }
                BOOL v30 = [v15 chatItemReplyLineContiguousTypeForChatStyle:v41] != 0;
                if (!v26 || (v30 & ~v25 & v20) != 0)
                {
                  if ((unint64_t)[(id)v67[5] count] >= 2) {
                    v42[2]();
                  }
                  id v31 = v59[5];
                  v59[5] = 0;

                  double v32 = (void *)v67[5];
                  v67[5] = 0;

                  if (v13 != v14 && v26 | v40) {
                    v38[2](v38, v13, v15);
                  }
                }
              }
            }
            else
            {
              v38[2](v38, v13, v15);
            }
          }
          if ([(id)v67[5] count])
          {
            objc_opt_class();
            int v33 = objc_opt_isKindOfClass();
            objc_opt_class();
            if ((v33 & ~objc_opt_isKindOfClass() & 1) != 0 || v13 == v14)
            {
              v42[2]();
              id v34 = v59[5];
              v59[5] = 0;

              double v35 = (void *)v67[5];
              v67[5] = 0;
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v72 count:16];
      }
      while (v11);
    }

    if (a4) {
      *a4 = (id) v53[5];
    }

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v58, 8);

    _Block_object_dispose(v64, 8);
    _Block_object_dispose(&v66, 8);
  }
}

void __111__CKTranscriptCompositionalLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = *(void *)(a1[4] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  [*(id *)(*(void *)(a1[4] + 8) + 40) addObject:v5];
  uint64_t v10 = *(void *)(a1[5] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  id v16 = [v6 IMChatItem];

  uint64_t v13 = [v16 threadGroupIdentifier];
  uint64_t v14 = *(void *)(a1[6] + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

void __111__CKTranscriptCompositionalLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  while (1)
  {
    int v3 = v2;
    uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastObject];

    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastObject];
    if (v4)
    {
      id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastObject];
      id v6 = v5[82];
    }
    else
    {
      id v6 = 0;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeLastObject];
    if (v2 == *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastObject];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    if (!v2) {
      goto LABEL_11;
    }
  }

LABEL_11:
  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastObject];
  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  if (v10 == v11) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeLastObject];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count])
  {
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) copy];
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v14 = *(void **)(v13 + 648);
    *(void *)(v13 + 648) = v12;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
LABEL_16:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        if (CGRectIntersectsRect(*(CGRect *)(*(void *)(*((void *)&v23 + 1) + 8 * v19) + 384), *(CGRect *)(a1 + 56)))
        {
          break;
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v17) {
            goto LABEL_16;
          }
          goto LABEL_27;
        }
      }

      uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
      if (*(void *)(v20 + 40))
      {
        double MaxY = CGRectGetMaxY(*(CGRect *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 384));
        if (MaxY <= CGRectGetMaxY(*(CGRect *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 384))) {
          return;
        }
        uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
      }
      id v22 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v15 = *(id *)(v20 + 40);
      *(void *)(v20 + 40) = v22;
    }
LABEL_27:
  }
}

- (void)updateContentSize
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v3 = [(NSArray *)self->_layoutAttributes lastObject];
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v3)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000;
    int v29 = __Block_byref_object_copy__48;
    BOOL v30 = __Block_byref_object_dispose__48;
    id v31 = 0;
    id v6 = [(CKTranscriptCompositionalLayout *)self associatedLayoutAttributes];
    id v31 = [v6 firstObject];

    uint64_t v7 = [(CKTranscriptCompositionalLayout *)self associatedLayoutAttributes];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __52__CKTranscriptCompositionalLayout_updateContentSize__block_invoke;
    v26[3] = &unk_1E5629868;
    v26[4] = &buf;
    [v7 enumerateObjectsUsingBlock:v26];

    double MaxY = CGRectGetMaxY(v3[11]);
    id v9 = *(CGRect **)(*((void *)&buf + 1) + 40);
    if (v9)
    {
      double v10 = CGRectGetMaxY(v9[11]);
      if (MaxY < v10) {
        double MaxY = v10;
      }
    }
    uint64_t v11 = [(CKTranscriptCompositionalLayout *)self collectionView];
    uint64_t v12 = [v11 traitCollection];
    [v12 displayScale];
    double v14 = v13;
    if (v13 == 0.0)
    {
      if (CKMainScreenScale_once_64 != -1) {
        dispatch_once(&CKMainScreenScale_once_64, &__block_literal_global_380);
      }
      if (*(double *)&CKMainScreenScale_sMainScreenScale_64 == 0.0) {
        double v14 = 1.0;
      }
      else {
        double v14 = *(double *)&CKMainScreenScale_sMainScreenScale_64;
      }
    }

    id v15 = [(CKTranscriptCompositionalLayout *)self collectionView];
    [v15 bounds];
    double v17 = v16;

    [(CKTranscriptCompositionalLayout *)self sizeForRotation];
    if (v19 == v4 && v18 == v5)
    {
      double v4 = v17;
    }
    else
    {
      [(CKTranscriptCompositionalLayout *)self sizeForRotation];
      double v4 = v20;
    }
    int v21 = [(CGRect *)v3 chatItem];
    [(id)objc_opt_class() bottomTranscriptSpaceWithLastChatItem:v21];
    double v23 = v22;

    _Block_object_dispose(&buf, 8);
    double v5 = ceil(MaxY * v14) / v14 + v23;
  }
  if (IMOSLoggingEnabled())
  {
    long long v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v33.CGFloat width = v4;
      v33.CGFloat height = v5;
      long long v25 = NSStringFromCGSize(v33);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "Updating content size to: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  [(CKTranscriptCompositionalLayout *)(double *)self setContentSize:v5];
}

void __52__CKTranscriptCompositionalLayout_updateContentSize__block_invoke(uint64_t a1, void *a2)
{
  double v5 = a2;
  double MaxY = CGRectGetMaxY(v5[11]);
  if (MaxY > CGRectGetMaxY(*(CGRect *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 352))) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (void)setContentSize:(CGFloat)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v17.CGFloat width = a2;
        v17.CGFloat height = a3;
        uint64_t v7 = NSStringFromCGSize(v17);
        int v12 = 136315394;
        double v13 = "-[CKTranscriptCompositionalLayout setContentSize:]";
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Calling %s with size: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    if (a1[89] != a2 || a1[90] != a3)
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Content size has changed, we will call the delegate's collectionViewLayout:sizeDidChange:", (uint8_t *)&v12, 2u);
        }
      }
      a1[89] = a2;
      a1[90] = a3;
      double v10 = [a1 collectionView];
      uint64_t v11 = [v10 delegate];

      objc_msgSend(v11, "collectionViewLayout:sizeDidChange:", a1, a1[89], a1[90]);
    }
  }
}

+ (double)bottomTranscriptSpaceWithLastChatItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = +[CKUIBehavior sharedBehaviors];
    [v4 unavailabilityIndicatorBottomTranscriptSpace];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v4 = +[CKUIBehavior sharedBehaviors];
      [v4 notifyAnywayBottomTranscriptSpace];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v4 = +[CKUIBehavior sharedBehaviors];
        [v4 satelliteAvailabilityIndicatorBottomTranscriptSpace];
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        uint64_t v7 = +[CKUIBehavior sharedBehaviors];
        double v4 = v7;
        if (isKindOfClass) {
          [v7 satelliteSuppressedNotificationBottomTranscriptSpace];
        }
        else {
          [v7 bottomTranscriptSpace];
        }
      }
    }
  }
  double v8 = v5;

  return v8;
}

- (void)updateAttributesForAnchorYChangeWithAttributes:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(CKTranscriptCompositionalLayout *)self collectionView];
  [v5 bounds];
  double v7 = v6;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    id v9 = 0;
    uint64_t v10 = *(void *)v35;
    double v31 = 0.00499999989;
    do
    {
      uint64_t v11 = 0;
      int v12 = v9;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(double **)(*((void *)&v34 + 1) + 8 * v11);
        objc_msgSend(v13, "setFrame:", v13[48], v13[49], v13[50], v13[51], *(void *)&v31);
        __int16 v14 = [v13 chatItem];
        uint64_t v15 = [v14 attachmentContiguousType] & 0xFE;
        if (v12) {
          BOOL v16 = v15 == 2;
        }
        else {
          BOOL v16 = 0;
        }
        int v17 = v16;
        if (!v12 && v15 == 2 && IMOSLoggingEnabled())
        {
          double v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Chat item is contiguous type middle/end, but it does not have a previous chat item to inherit target easing from! Possible chat item misconfiguration", buf, 2u);
          }
        }
        if (v17)
        {
          double v19 = v12[53];
        }
        else
        {
          double v20 = 0.00999999978;
          if ([v14 transcriptOrientation])
          {
            if ([v14 transcriptOrientation] == 1) {
              double v20 = v31;
            }
            else {
              double v20 = 0.0;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            double v20 = v20 + 0.0500000007;
          }
          [v13 bounds];
          double v22 = v21;
          [v13 center];
          double v24 = v23;
          [(CKTranscriptCompositionalLayout *)self anchorYPosition];
          double v26 = vabdd_f64(v24, v25);
          double v27 = 0.0;
          for (uint64_t i = -1; i != 2; ++i)
          {
            double v29 = (v26 + v22 * (double)i * 0.5) / v7;
            if (v29 > 1.0) {
              double v29 = 1.0;
            }
            [(CKTranscriptCompositionalLayout *)self bezierPointForPercentage:fmax(v29, 0.0) anchor1:v20 anchor2:v20 + 0.75 control1:v20 + 0.75 control2:v20 + 0.75];
            double v27 = v27 + v30;
          }
          double v19 = v27 / 3.0;
        }
        v13[53] = v19;
        id v9 = v13;

        ++v11;
        int v12 = v9;
      }
      while (v11 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v8);
  }
}

- (void)updateAttributesForTargetContentOffsetChangeWithAttributes:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(CKTranscriptCompositionalLayout *)self collectionView];
  [v5 bounds];
  double v7 = v6;

  [(CKTranscriptCompositionalLayout *)self anchorYPosition];
  double v39 = v8;
  [(CKTranscriptCompositionalLayout *)self targetContentOffset];
  double v10 = v9;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v4;
  uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v11)
  {
    int v12 = 0;
    uint64_t v13 = *(void *)v42;
    double v14 = v7 + v10 - (v39 + v7);
    if (v10 < v39) {
      double v14 = v39 - v7 - v10;
    }
    if (v14 >= v7 * 0.5) {
      double v15 = v14;
    }
    else {
      double v15 = v7 * 0.5;
    }
    while (1)
    {
      uint64_t v16 = 0;
      int v17 = v12;
      do
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        double v18 = *(double **)(*((void *)&v41 + 1) + 8 * v16);
        objc_msgSend(v18, "setFrame:", v18[48], v18[49], v18[50], v18[51]);
        [v18 center];
        double v20 = v19;
        double v21 = [v18 chatItem];
        uint64_t v22 = [v21 attachmentContiguousType] & 0xFE;
        if (v17) {
          BOOL v23 = v22 == 2;
        }
        else {
          BOOL v23 = 0;
        }
        int v24 = v23;
        if (!v17 && v22 == 2 && IMOSLoggingEnabled())
        {
          double v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Chat item is contiguous type middle/end, but it does not have a previous chat item to inherit target easing from! Possible chat item misconfiguration", buf, 2u);
          }
        }
        if (v24)
        {
          double v26 = v17[53];
        }
        else
        {
          if (fabs(v20 - v39) <= v7) {
            goto LABEL_35;
          }
          double v27 = 0.00999999978;
          if ([v21 transcriptOrientation])
          {
            if ([v21 transcriptOrientation] == 1) {
              double v27 = 0.00499999989;
            }
            else {
              double v27 = 0.0;
            }
          }
          [v18 bounds];
          double v29 = v28;
          [v18 center];
          double v31 = vabdd_f64(v30, v39);
          double v32 = v27 + 0.75;
          double v33 = v27 + 0.899999976;
          uint64_t v34 = -1;
          double v35 = 0.0;
          do
          {
            double v36 = (v31 + v29 * (double)v34 * 0.5 - v7) / v15;
            if (v36 > 1.0) {
              double v36 = 1.0;
            }
            [(CKTranscriptCompositionalLayout *)self bezierPointForPercentage:fmax(v36, 0.0) anchor1:v32 anchor2:v33 control1:v32 control2:v32];
            double v35 = v35 + v37;
            ++v34;
          }
          while (v34 != 2);
          double v26 = v35 / 3.0;
        }
        v18[53] = v26;
LABEL_35:
        int v12 = v18;

        ++v16;
        int v17 = v12;
      }
      while (v16 != v11);
      uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (!v11)
      {

        break;
      }
    }
  }
}

- (void)setAnchorYPosition:(double)a3
{
  if (self->_anchorYPosition != a3)
  {
    self->_anchorYPosition = a3;
    id v4 = [(CKTranscriptCompositionalLayout *)self layoutAttributes];
    [(CKTranscriptCompositionalLayout *)self updateAttributesForAnchorYChangeWithAttributes:v4];

    id v5 = [(CKTranscriptCompositionalLayout *)self associatedLayoutAttributes];
    [(CKTranscriptCompositionalLayout *)self updateAttributesForAnchorYChangeWithAttributes:v5];
  }
}

- (void)setTargetContentOffset:(CGPoint)a3
{
  if (a3.x != self->_targetContentOffset.x || a3.y != self->_targetContentOffset.y)
  {
    id v5 = [(CKTranscriptCompositionalLayout *)self layoutAttributes];
    [(CKTranscriptCompositionalLayout *)self updateAttributesForTargetContentOffsetChangeWithAttributes:v5];

    id v6 = [(CKTranscriptCompositionalLayout *)self associatedLayoutAttributes];
    [(CKTranscriptCompositionalLayout *)self updateAttributesForTargetContentOffsetChangeWithAttributes:v6];
  }
}

- (double)bezierPointForPercentage:(double)a3 anchor1:(double)a4 anchor2:(double)a5 control1:(double)a6 control2:(double)a7
{
  return a3 * a3 * 3.0 * (a4 + a6 * -2.0 + a7) + pow(a3, 3.0) * (a5 + (a6 - a7) * 3.0 - a4) + a3 * 3.0 * (a6 - a4) + a4;
}

- (void)displayLinkFired:(id)a3
{
  id v7 = a3;
  kdebug_trace();
  if ((_UIUpdateCycleEnabled() & 1) == 0)
  {
    if (self)
    {
      self->_isDisplayDrivenLayoutInvalidation = 1;
      [v7 timestamp];
      self->_double currentFrameTimestamp = v4;
      [v7 preferredFrameRateRange];
      self->_double requestedFrameRate = v5;
    }
    else
    {
      [v7 timestamp];
      [v7 preferredFrameRateRange];
    }
    kdebug_trace();
    id v6 = [(CKTranscriptCompositionalLayout *)self _invalidationContextForRefreshingVisibleElementAttributes];
    [(CKTranscriptCompositionalLayout *)self invalidateLayoutWithContext:v6];

    [(CKTranscriptCompositionalLayout *)self checkDynamicsWatchdog];
  }
}

- (double)handleInvalidCaseForChatItem:(id)a3 withPrevChatItem:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Transcript: %@ shouldn't follow %@", (uint8_t *)&v12, 0x16u);
    }
  }
  double v8 = +[CKUIBehavior sharedBehaviors];
  [v8 smallTranscriptSpace];
  double v10 = v9;

  return v10;
}

- (BOOL)nextItemIsOriginatorWithRepliesForIndex:(unint64_t)a3
{
  unint64_t v4 = a3 + 1;
  id v5 = self->_layoutAttributes;
  if (v4 >= [(NSArray *)v5 count])
  {
    BOOL v8 = 0;
  }
  else
  {
    id v6 = [(NSArray *)v5 objectAtIndex:v4];
    id v7 = [v6 chatItem];
    objc_opt_class();
    BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
      && [v7 itemIsThreadOriginator]
      && [(CKTranscriptCompositionalLayout *)self nextMessageIsReplyForIndex:v4];
  }
  return v8;
}

- (BOOL)nextMessageIsReplyForIndex:(unint64_t)a3
{
  unint64_t v4 = self->_layoutAttributes;
  unint64_t v5 = a3 + 1;
  if (v5 >= [(NSArray *)v4 count])
  {
LABEL_4:
    char v8 = 0;
  }
  else
  {
    while (1)
    {
      id v6 = [(NSArray *)v4 objectAtIndex:v5];
      id v7 = [v6 chatItem];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if (++v5 >= [(NSArray *)v4 count]) {
        goto LABEL_4;
      }
    }
    char v8 = [v7 itemIsReply];
  }
  return v8;
}

- (BOOL)previousReplyCount:(unint64_t)a3 isOccludedForAssociatedFrame:(CGRect)a4 outMaxY:(double *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v11 = self->_layoutAttributes;
  int v12 = [(NSArray *)v11 objectAtIndex:a3];
  id v13 = [v12 chatItem];

  if ([v13 itemIsReply]) {
    BOOL v14 = (uint64_t)(a3 - 1) < 1;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
LABEL_7:
    LOBYTE(v17) = 0;
  }
  else
  {
    while (1)
    {
      id v15 = [(NSArray *)v11 objectAtIndex:--a3];
      uint64_t v16 = [v15 chatItem];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if ((uint64_t)a3 <= 1) {
        goto LABEL_7;
      }
    }
    unint64_t v18 = [v16 replyCount];
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v26);
    [v15 frame];
    double MaxX = CGRectGetMaxX(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v28);
    [v15 frame];
    double MaxY = CGRectGetMaxY(v29);
    BOOL v24 = MinX <= MaxX && v18 > 1;
    BOOL v17 = MinY <= MaxY && v24;
    if (v17)
    {
      [v15 frame];
      *a5 = CGRectGetMaxY(v30);
    }
  }
  return v17;
}

- (BOOL)needsAdditionalBracketPaddingForChatItem:(id)a3 prevChatItem:(id)a4
{
  id v5 = a3;
  if (([a4 itemIsFromMe] & 1) != 0 || !objc_msgSend(v5, "itemIsFromMe"))
  {
    BOOL v10 = 0;
  }
  else
  {
    [v5 size];
    double v7 = v6;
    char v8 = +[CKUIBehavior sharedBehaviors];
    [v8 textBalloonMinHeight];
    BOOL v10 = v7 <= v9;
  }
  return v10;
}

- (void)_applyAttributeUpdatesWithTargetMap:(id)a3 layoutAttributes:(id)a4 updateBlock:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v8 = a4;
  double v9 = (void (**)(id, uint64_t, void))a5;
  double v59 = self;
  BOOL v10 = [(CKTranscriptCompositionalLayout *)self collectionView];
  [v10 frame];
  double v12 = v11;

  id v13 = [(CKTranscriptCompositionalLayout *)self collectionView];
  [v13 _visibleRectEdgeInsets];
  double v15 = v14;
  double v17 = v16;

  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  obuint64_t j = v8;
  uint64_t v18 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v18)
  {
    char v19 = 0;
    double v20 = v12 - (v15 + v17);
    uint64_t v21 = *(void *)v73;
    double v22 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v73 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        double v25 = objc_msgSend(*(id *)(v24 + 656), "IMChatItem", v58);
        CGRect v26 = [v25 guid];
        CGRect v27 = [v62 objectForKey:v26];

        if (v27)
        {
          [v27 CGRectValue];
          double x = v79.origin.x;
          double y = v79.origin.y;
          double width = v79.size.width;
          double height = v79.size.height;
          if (CGRectGetMaxY(v79) < 0.0)
          {
            [v60 addObject:v24];
            goto LABEL_16;
          }
          double v32 = [(CKTranscriptCompositionalLayout *)v59 collectionView];
          [v32 frame];
          BOOL v34 = y - v33 > v20;

          if (v34)
          {
            [v58 addObject:v24];
            goto LABEL_16;
          }
          -[CKTranscriptCompositionalLayout _convertScreenFrameToLocalFrame:](v59, "_convertScreenFrameToLocalFrame:", x, y, width, height);
          double v36 = v35;
          double v37 = *(double *)(v24 + 392);
          v9[2](v9, v24, 0);
          double v22 = v36 - v37;
        }
        else
        {
          if ((v19 & 1) == 0)
          {
            [v60 addObject:v24];
            char v19 = 0;
            goto LABEL_16;
          }
          ((void (*)(void (**)(id, uint64_t, void), uint64_t, uint64_t, double, double, double, double))v9[2])(v9, v24, 1, *(double *)(v24 + 384), v22 + *(double *)(v24 + 392), *(double *)(v24 + 400), *(double *)(v24 + 408));
        }
        char v19 = 1;
LABEL_16:
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
    }
    while (v18);
  }

  double v38 = +[CKUIBehavior sharedBehaviors];
  [v38 smallTranscriptSpace];
  double v40 = v39;

  long long v41 = [(CKTranscriptCompositionalLayout *)v59 collectionView];
  long long v42 = [v41 superview];
  long long v43 = [(CKTranscriptCompositionalLayout *)v59 collectionView];
  objc_msgSend(v42, "convertPoint:toView:", v43, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  uint64_t v45 = v44;

  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  v71[3] = v45;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __100__CKTranscriptCompositionalLayout__applyAttributeUpdatesWithTargetMap_layoutAttributes_updateBlock___block_invoke;
  v67[3] = &unk_1E5629890;
  double v69 = v71;
  double v70 = v40;
  uint64_t v46 = v9;
  id v68 = v46;
  [v60 enumerateObjectsWithOptions:2 usingBlock:v67];
  long long v47 = [(CKTranscriptCompositionalLayout *)v59 collectionView];
  [v47 bounds];
  double MaxY = CGRectGetMaxY(v80);

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v49 = v58;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v63 objects:v76 count:16];
  if (v50)
  {
    uint64_t v51 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v64 != v51) {
          objc_enumerationMutation(v49);
        }
        double v53 = *(double **)(*((void *)&v63 + 1) + 8 * j);
        double v54 = v53[48];
        double v55 = v53[50];
        double v56 = v53[51];
        v81.origin.double x = v54;
        v81.origin.double y = MaxY;
        v81.size.double width = v55;
        v81.size.double height = v56;
        double v57 = CGRectGetMaxY(v81);
        ((void (*)(void (**)(id, uint64_t, void), double *, void, double, double, double, double))v46[2])(v46, v53, 0, v54, MaxY, v55, v56);
        double MaxY = v40 + v57;
      }
      uint64_t v50 = [v49 countByEnumeratingWithState:&v63 objects:v76 count:16];
    }
    while (v50);
  }

  [(CKTranscriptCompositionalLayout *)v59 _kickDynamicsIfNeeded];
  _Block_object_dispose(v71, 8);
}

void __100__CKTranscriptCompositionalLayout__applyAttributeUpdatesWithTargetMap_layoutAttributes_updateBlock___block_invoke(uint64_t a1, double *a2)
{
  double v3 = a2[48];
  CGFloat v4 = a2[49];
  CGFloat v5 = a2[50];
  CGFloat v6 = a2[51];
  double v7 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v8 = a2;
  v10.origin.double x = v3;
  v10.origin.double y = v4;
  v10.size.double width = v5;
  v10.size.double height = v6;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7 - CGRectGetHeight(v10) - *(double *)(a1 + 48);
  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v3);
}

- (CGRect)_convertScreenFrameToLocalFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(CKTranscriptCompositionalLayout *)self collectionView];
  double v9 = [v8 superview];
  CGRect v10 = [(CKTranscriptCompositionalLayout *)self collectionView];
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)_applyTargetFrameOffsetsForLayoutAttributesIfNeeded:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(CKTranscriptCompositionalLayout *)self collectionView];
  CGFloat v6 = [v5 delegate];

  double v7 = [v6 overrideTargetFrameMapForLayout:self];
  if (v7)
  {
    BOOL v8 = [(CKTranscriptCompositionalLayout *)self isInlineAnimatingOut];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__CKTranscriptCompositionalLayout__applyTargetFrameOffsetsForLayoutAttributesIfNeeded___block_invoke;
    aBlock[3] = &__block_descriptor_33_e89_v52__0__CKTranscriptCollectionViewLayoutAttributes_8_CGRect__CGPoint_dd__CGSize_dd__16B48l;
    BOOL v11 = v8;
    double v9 = _Block_copy(aBlock);
    [(CKTranscriptCompositionalLayout *)self _applyAttributeUpdatesWithTargetMap:v7 layoutAttributes:v4 updateBlock:v9];
  }
}

void __87__CKTranscriptCompositionalLayout__applyTargetFrameOffsetsForLayoutAttributesIfNeeded___block_invoke(uint64_t a1, void *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  uint64_t v15 = *((void *)v13 + 48);
  double v14 = *((double *)v13 + 49);
  long long v34 = *((_OWORD *)v13 + 25);
  v37.origin.double x = a4;
  v37.origin.double y = a5;
  v37.size.double width = a6;
  v37.size.double height = a7;
  CGRectGetMidX(v37);
  v38.origin.double x = a4;
  v38.origin.double y = a5;
  v38.size.double width = a6;
  v38.size.double height = a7;
  CGFloat MidY = CGRectGetMidY(v38);
  *((void *)v13 + 44) = v15;
  *((CGFloat *)v13 + 45) = a5;
  *((_OWORD *)v13 + 23) = v34;
  *((CGFloat *)v13 + 73) = MidY;
  if (*(unsigned char *)(a1 + 32) && a3) {
    [v13 setAlpha:0.0];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  CGRect v29 = v13;
  id v17 = *((id *)v13 + 79);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    double v20 = a5 - v14;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        CGFloat v24 = *(double *)(v23 + 384);
        CGFloat v25 = *(double *)(v23 + 400);
        CGFloat v26 = *(double *)(v23 + 408);
        CGFloat v27 = v20 + *(double *)(v23 + 392);
        v39.origin.double x = v24;
        v39.origin.double y = v27;
        v39.size.double width = v25;
        v39.size.double height = v26;
        CGRectGetMidX(v39);
        v40.origin.double x = v24;
        v40.origin.double y = v27;
        v40.size.double width = v25;
        v40.size.double height = v26;
        CGFloat v28 = CGRectGetMidY(v40);
        *(CGFloat *)(v23 + 352) = v24;
        *(CGFloat *)(v23 + 360) = v27;
        *(CGFloat *)(v23 + 368) = v25;
        *(CGFloat *)(v23 + 376) = v26;
        *(CGFloat *)(v23 + 584) = v28;
        if (*(void *)(v23 + 640)) {
          *(double *)(v23 + 624) = v20 + *(double *)(v23 + 624);
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v19);
  }
}

- (void)_applyCurrentFrameOffsetsForLayoutAttributesIfNeeded:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v5 = [(CKTranscriptCompositionalLayout *)self collectionView];
  CGFloat v6 = [v5 delegate];

  double v7 = [v6 overrideCurrentFrameMapForLayout:self];
  BOOL v8 = [v6 balloonOffsetMapForLayout:self resetsOffsetMapAfterUse:1];
  if (v7)
  {
    uint64_t v44 = v7;
    [(CKTranscriptCompositionalLayout *)self _applyAttributeUpdatesWithTargetMap:v7 layoutAttributes:v4 updateBlock:&__block_literal_global_148];
    double v9 = [(CKTranscriptCompositionalLayout *)self collectionView];
    [v9 frame];
    double v11 = v10;

    if (self) {
      double height = self->_contentSize.height;
    }
    else {
      double height = 0.0;
    }
    double v13 = 0.5;
    if (height >= v11) {
      double v14 = v11;
    }
    else {
      double v14 = v11 * 0.5;
    }
    uint64_t v15 = [(CKTranscriptCompositionalLayout *)self collectionView];
    double v16 = [v15 superview];
    id v17 = [(CKTranscriptCompositionalLayout *)self collectionView];
    objc_msgSend(v16, "convertPoint:toView:", v17, 0.0, v14);
    double v47 = v18;

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v45 = v4;
    obuint64_t j = v4;
    uint64_t v19 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v53 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          [(id)v23 bounds];
          double v25 = v24;
          [(id)v23 center];
          double v27 = vabdd_f64(v26, v47);
          uint64_t v28 = -1;
          double v29 = 0.0;
          do
          {
            double v30 = (v27 + v25 * (double)v28 * v13) / v11;
            if (v30 > 1.0) {
              double v30 = 1.0;
            }
            double v31 = v11;
            double v32 = fmax(v30, 0.0);
            BOOL v33 = [(CKTranscriptCompositionalLayout *)self isInlineAnimatingOut];
            double v34 = -0.0500000007;
            if (!v33) {
              double v34 = 0.0;
            }
            double v35 = v34 + 0.889999986;
            double v36 = v34 + 0.824999988;
            double v37 = v32;
            double v11 = v31;
            double v13 = 0.5;
            [(CKTranscriptCompositionalLayout *)self bezierPointForPercentage:v37 anchor1:v35 anchor2:v36 control1:v36 control2:v36];
            double v29 = v29 + v38;
            ++v28;
          }
          while (v28 != 2);
          *(double *)(v23 + 416) = v29 / 3.0;
          *(double *)(v23 + 424) = v29 / 3.0;
          [(CKTranscriptCompositionalLayout *)self _applyHorizontalOffsetFromMapping:v8 toLayoutAttributes:v23];
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v39 = *(id *)(v23 + 632);
          uint64_t v40 = [v39 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v49;
            do
            {
              for (uint64_t j = 0; j != v41; ++j)
              {
                if (*(void *)v49 != v42) {
                  objc_enumerationMutation(v39);
                }
                [(CKTranscriptCompositionalLayout *)self _applyHorizontalOffsetFromMapping:v8 toLayoutAttributes:*(void *)(*((void *)&v48 + 1) + 8 * j)];
              }
              uint64_t v41 = [v39 countByEnumeratingWithState:&v48 objects:v56 count:16];
            }
            while (v41);
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v20);
    }

    [(CKTranscriptCompositionalLayout *)self _kickDynamicsIfNeeded];
    id v4 = v45;
    double v7 = v44;
  }
}

void __88__CKTranscriptCompositionalLayout__applyCurrentFrameOffsetsForLayoutAttributesIfNeeded___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  uint64_t v12 = *((void *)v10 + 48);
  double v11 = *((double *)v10 + 49);
  long long v32 = *((_OWORD *)v10 + 25);
  v35.origin.double x = a1;
  v35.origin.double y = a2;
  v35.size.double width = a3;
  v35.size.double height = a4;
  double MidX = CGRectGetMidX(v35);
  v36.origin.double x = a1;
  v36.origin.double y = a2;
  v36.size.double width = a3;
  v36.size.double height = a4;
  double MidY = CGRectGetMidY(v36);
  *((void *)v10 + 48) = v12;
  *((CGFloat *)v10 + 49) = a2;
  *((_OWORD *)v10 + 25) = v32;
  objc_msgSend(v10, "setCenter:", MidX, MidY);
  *((double *)v10 + 74) = MidY;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = *((id *)v10 + 79);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    double v18 = a2 - v11;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        CGFloat v22 = *(double *)(v21 + 384);
        CGFloat v23 = *(double *)(v21 + 400);
        CGFloat v24 = *(double *)(v21 + 408);
        CGFloat v25 = v18 + *(double *)(v21 + 392);
        v37.origin.double x = v22;
        v37.origin.double y = v25;
        v37.size.double width = v23;
        v37.size.double height = v24;
        double v26 = CGRectGetMidX(v37);
        v38.origin.double x = v22;
        v38.origin.double y = v25;
        v38.size.double width = v23;
        v38.size.double height = v24;
        double v27 = CGRectGetMidY(v38);
        *(CGFloat *)(v21 + 384) = v22;
        *(CGFloat *)(v21 + 392) = v25;
        *(CGFloat *)(v21 + 400) = v23;
        *(CGFloat *)(v21 + 408) = v24;
        objc_msgSend((id)v21, "setCenter:", v26, v27, (void)v28);
        *(double *)(v21 + 592) = v27;
        if (*(void *)(v21 + 640)) {
          *(double *)(v21 + 624) = v18 + *(double *)(v21 + 624);
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v17);
  }
}

- (void)_applyHorizontalOffsetFromMapping:(id)a3 toLayoutAttributes:(id)a4
{
  CGFloat v5 = (void *)*((void *)a4 + 82);
  CGFloat v6 = (double *)a4;
  id v7 = a3;
  BOOL v8 = [v5 IMChatItem];
  id v14 = [v8 guid];

  double v9 = [v7 objectForKey:v14];

  [v9 floatValue];
  double v11 = v10;
  BOOL v12 = v10 == 0.0;
  double v13 = 0.0;
  if (!v12) {
    double v13 = v11;
  }
  v6[55] = v13;
  v6[56] = v13;
}

- (void)_updateCurrentBalloonOffsetForLayoutAttributes:(id)a3
{
  double v3 = (double *)a3;
  double v4 = v3[73] - v3[74];
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  double v5 = fmax(v4, 1.0);
  if (v5 >= 2.0)
  {
    double v13 = v3;
    [v3 center];
    double v8 = v7 - v13[74];
    if (v8 < 0.0) {
      double v8 = -v8;
    }
    double v9 = v8 / v5;
    float v10 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v10, "curveValueForSwipeWithVelocity:t:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v9);
    double v12 = v11;

    double v3 = v13;
    double v6 = fmax(v12 * v13[55], 0.0);
  }
  else
  {
    double v6 = v3[56] + -6.0;
  }
  v3[56] = v6;
}

- (void)_resetHorizontalBalloonOffsetsForLayoutAttributes:(id)a3 includeAssociatedAttributes:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *((void *)a3 + 55) = 0;
  if (a4)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *((id *)a3 + 79);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          *(void *)(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 440) = 0;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)invalidateLayout
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptCompositionalLayout;
  [(CKTranscriptCompositionalLayout *)&v4 invalidateLayout];
  double v3 = [(CKTranscriptCompositionalLayout *)self collectionView];
  [v3 setNeedsScrollIntentEnforced];
}

- (void)sizeCategoryDidChange:(id)a3
{
  objc_super v4 = +[CKUIBehavior sharedBehaviors];
  uint64_t v5 = [v4 isAccessibilityPreferredContentSizeCategory];

  if (v5 != [(CKTranscriptCompositionalLayout *)self sizeCategoryIsAccessibilitySizeCategory])
  {
    [(CKTranscriptCompositionalLayout *)self setLayoutAttributes:0];
    [(CKTranscriptCompositionalLayout *)self invalidateLayout];
    [(CKTranscriptCompositionalLayout *)self setSizeCategoryIsAccessibilitySizeCategory:v5];
  }
}

- (void)reduceMotionSettingChanged:(id)a3
{
  [(CKTranscriptCompositionalLayout *)self setLayoutAttributes:0];

  [(CKTranscriptCompositionalLayout *)self invalidateLayout];
}

- (double)anchorYPosition
{
  return self->_anchorYPosition;
}

- (CGPoint)targetContentOffset
{
  double x = self->_targetContentOffset.x;
  double y = self->_targetContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isHoldingBoundsInvalidation
{
  return self->_holdingBoundsInvalidation;
}

- (void)setHoldingBoundsInvalidation:(BOOL)a3
{
  self->_holdingBoundsInvalidation = a3;
}

- (BOOL)isUsingInitialLayoutAttributesForRotation
{
  return self->_useInitialLayoutAttributesForRotation;
}

- (void)setUseInitialLayoutAttributesForRotation:(BOOL)a3
{
  self->_useInitialLayoutAttributesForRotation = a3;
}

- (BOOL)isUsingOverlayLayout
{
  return self->_useOverlayLayout;
}

- (void)setUseOverlayLayout:(BOOL)a3
{
  self->_useOverlayLayout = a3;
}

- (BOOL)isInlineAnimatingOut
{
  return self->_inlineAnimatingOut;
}

- (void)setInlineAnimatingOut:(BOOL)a3
{
  self->_inlineAnimatingOut = a3;
}

- (unsigned)chatStyle
{
  return self->_chatStyle;
}

- (void)setChatStyle:(unsigned __int8)a3
{
  self->_chatStyle = a3;
}

- (BOOL)isResting
{
  return self->_isResting;
}

- (CGSize)sizeForRotation
{
  double width = self->_sizeForRotation.width;
  double height = self->_sizeForRotation.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSizeForRotation:(CGSize)a3
{
  self->_sizeForRotation = a3;
}

- (NSIndexSet)indicesOfChatItemsToBeRemovedWithoutFading
{
  return self->_indicesOfChatItemsToBeRemovedWithoutFading;
}

- (void)setIndicesOfChatItemsToBeRemovedWithoutFading:(id)a3
{
}

- (NSIndexSet)indicesOfChatItemsToBeInsertedWithoutFading
{
  return self->_indicesOfChatItemsToBeInsertedWithoutFading;
}

- (void)setIndicesOfChatItemsToBeInsertedWithoutFading:(id)a3
{
}

- (NSIndexSet)indicesOfReplyChatItemsToBeInserted
{
  return self->_indicesOfReplyChatItemsToBeInserted;
}

- (void)setIndicesOfReplyChatItemsToBeInserted:(id)a3
{
}

- (BOOL)disableDynamicsWhileScrolling
{
  return self->_disableDynamicsWhileScrolling;
}

- (void)setDisableDynamicsWhileScrolling:(BOOL)a3
{
  self->_disableDynamicsWhileScrolling = a3;
}

- (void)setLayoutAttributes:(id)a3
{
}

- (NSArray)associatedLayoutAttributes
{
  return self->_associatedLayoutAttributes;
}

- (void)setAssociatedLayoutAttributes:(id)a3
{
}

- (NSArray)decorationLayoutAttributes
{
  return self->_decorationLayoutAttributes;
}

- (void)setDecorationLayoutAttributes:(id)a3
{
}

- (NSArray)oldAssociatedLayoutAttributes
{
  return self->_oldAssociatedLayoutAttributes;
}

- (void)setOldAssociatedLayoutAttributes:(id)a3
{
}

- (NSMutableIndexSet)insertedAssociatedLayoutAttributes
{
  return self->_insertedAssociatedLayoutAttributes;
}

- (void)setInsertedAssociatedLayoutAttributes:(id)a3
{
}

- (BOOL)hasLoadMore
{
  return self->_hasLoadMore;
}

- (void)setHasLoadMore:(BOOL)a3
{
  self->_hasLoadMore = a3;
}

- (NSMutableDictionary)initialParentLayoutAttributes
{
  return self->_initialParentLayoutAttributes;
}

- (void)setInitialParentLayoutAttributes:(id)a3
{
}

- (NSMutableDictionary)finalParentVerticalOffsets
{
  return self->_finalParentVerticalOffsets;
}

- (void)setFinalParentVerticalOffsets:(id)a3
{
}

- (BOOL)sizeCategoryIsAccessibilitySizeCategory
{
  return self->_sizeCategoryIsAccessibilitySizeCategory;
}

- (void)setSizeCategoryIsAccessibilitySizeCategory:(BOOL)a3
{
  self->_sizeCategoryIsAccessibilitySizeCategordouble y = a3;
}

- (IMScheduledUpdater)dynamicsUpdater
{
  return self->_dynamicsUpdater;
}

- (void)setDynamicsUpdater:(id)a3
{
}

- (_UIUpdateSequenceItemInternal)dynamicsUpdateSequenceItem
{
  return self->_dynamicsUpdateSequenceItem;
}

- (void)setDynamicsUpdateSequenceItem:(_UIUpdateSequenceItemInternal *)a3
{
  self->_dynamicsUpdateSequenceItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_dynamicsUpdater, 0);
  objc_storeStrong((id *)&self->_finalParentVerticalOffsets, 0);
  objc_storeStrong((id *)&self->_initialParentLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_insertedAssociatedLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_oldAssociatedLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_decorationLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_associatedLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_indicesOfReplyChatItemsToBeInserted, 0);
  objc_storeStrong((id *)&self->_indicesOfChatItemsToBeInsertedWithoutFading, 0);

  objc_storeStrong((id *)&self->_indicesOfChatItemsToBeRemovedWithoutFading, 0);
}

- (void)updateDynamicsWatchdogForRenderedFrameWithDuration:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  double v3 = a2;
  __int16 v4 = 2048;
  uint64_t v5 = 0x4000000000000000;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Frame took %.2f seconds which is longer than our threshhold %.2f seconds, ignoring this frame's duration from the watchdog calculation.", (uint8_t *)&v2, 0x16u);
}

@end