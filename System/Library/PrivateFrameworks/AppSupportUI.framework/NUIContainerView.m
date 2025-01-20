@interface NUIContainerView
+ (BOOL)enableAPIMisuseAssertions;
+ (BOOL)isDebugBoundingBoxesEnabled;
+ (BOOL)requiresConstraintBasedLayout;
+ (Class)layerClass;
+ (id)debugVersion;
+ (void)initialize;
+ (void)setEnableAPIMisuseAssertions:(BOOL)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_isContainerView;
- (BOOL)canCancelMeasurementForCompression;
- (BOOL)hasBaselineRelativeLayoutMarginsForArrangement;
- (BOOL)isBaselineRelativeArrangement;
- (BOOL)isDebugBoundingBoxesEnabled;
- (BOOL)isInBatchUpdate;
- (BOOL)isLayoutMarginsRelativeArrangement;
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (BOOL)mustRestartMeasurement;
- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3;
- (BOOL)setNeedsInvalidation:(int64_t)a3;
- (BOOL)shouldCancelMeasurementForCompressionInAxis:(int64_t)a3;
- (CGPoint)positionAdjustmentOffsetForView:(id)a3;
- (CGRect)effectiveLayoutBounds;
- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4;
- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4;
- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3;
- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4;
- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSArray)arrangedSubviews;
- (NSArray)visibleArrangedSubviews;
- (NSDirectionalEdgeInsets)minimumSpacingAdjacentToView:(id)a3;
- (NUIContainerView)initWithArrangedSubviews:(id)a3;
- (NUIContainerView)initWithCoder:(id)a3;
- (NUIContainerView)initWithFrame:(CGRect)a3;
- (NUIContainerViewDelegate)delegate;
- (UIEdgeInsets)effectiveLayoutMargins;
- (double)_intrinsicSizeWithinSize:(double)a3;
- (id).cxx_construct;
- (id)arrangedDebugDescription;
- (id)calculateViewForFirstBaselineLayout;
- (id)calculateViewForLastBaselineLayout;
- (id)debugDescription;
- (id)debugDictionary;
- (id)debugDictionaryForVisibleArrangedSubview:(id)a3;
- (id)debugSetDelegateRespondsToSelectors;
- (id)debugSetEnabledFlags;
- (id)description;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)alignmentForView:(id)a3 inAxis:(int64_t)a4;
- (int64_t)arrangedSubviewAdditionPolicy;
- (int64_t)arrangedSubviewRemovalPolicy;
- (uint64_t)_addAsSubviewIfNeeded:(uint64_t)result;
- (uint64_t)_countHiddenArrangesSubviews;
- (uint64_t)_updateDebugBoundingBoxesIfNeeded;
- (uint64_t)_verifyInternalConsistencyWarningOnly:(uint64_t)result;
- (uint64_t)beginBatchUpdates;
- (uint64_t)endBatchUpdates;
- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize;
- (unint64_t)indexOfArrangedSubview:(id)a3;
- (void)_assertNotInLayoutPass:(uint64_t)a1;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)addArrangedSubview:(id)a3;
- (void)assertNotInLayoutPass:(BOOL)a3;
- (void)dealloc;
- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4;
- (void)intrinsicContentSizeDidInvalidateForArrangedSubview:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutArrangedSubviewsInBounds:(CGRect)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performBatchUpdates:(id)a3;
- (void)removeArrangedSubview:(id)a3;
- (void)replaceArrangedSubview:(id)a3 atIndex:(unint64_t)a4;
- (void)replaceArrangedSubviewAtIndex:(unint64_t)a3 withView:(id)a4;
- (void)setAlignment:(int64_t)a3 forView:(id)a4 inAxis:(int64_t)a5;
- (void)setArrangedSubviewAdditionPolicy:(int64_t)a3;
- (void)setArrangedSubviewRemovalPolicy:(int64_t)a3;
- (void)setArrangedSubviews:(id)a3;
- (void)setBaselineRelativeArrangement:(BOOL)a3;
- (void)setBaselineRelativeLayoutMarginsForArrangement:(BOOL)a3;
- (void)setDebugBoundingBoxesEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutMarginsRelativeArrangement:(BOOL)a3;
- (void)setMinimumSpacing:(NSDirectionalEdgeInsets)a3 adjacentToView:(id)a4;
- (void)setNeedsLayout;
- (void)setPositionAdjustmentOffset:(CGPoint)a3 forView:(id)a4;
- (void)visibilityDidChangeForArrangedSubview:(id)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation NUIContainerView

+ (BOOL)requiresConstraintBasedLayout
{
  return 0;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)performBatchUpdates:(id)a3
{
  -[NUIContainerView beginBatchUpdates]((uint64_t)self);
  (*((void (**)(id))a3 + 2))(a3);
  -[NUIContainerView endBatchUpdates]((uint64_t)self);
}

- (uint64_t)beginBatchUpdates
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 536);
    if ((~*(_DWORD *)(result + 536) & 0xF000000) == 0)
    {
      result = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot nest more than 15 calls to performBatchUpdates:"];
      uint64_t v2 = *(void *)(v1 + 536);
    }
    uint64_t v3 = (v2 + 0x1000000) & 0xF000000;
    *(void *)(v1 + 536) = v3 | v2 & 0xFFFFFFFFF0FFFFFFLL;
    if (v3 == 0x1000000)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      v4 = *(void **)(v1 + 448);
      result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v5 = result;
        uint64_t v6 = *(void *)v10;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v10 != v6) {
              objc_enumerationMutation(v4);
            }
            v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
            if ([v8 _isContainerView]) {
              -[NUIContainerView beginBatchUpdates](v8);
            }
            ++v7;
          }
          while (v5 != v7);
          result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t v5 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)endBatchUpdates
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = *(void *)(result + 536);
    *(void *)(result + 536) = (v2 + 251658240) & 0xF000000 | v2 & 0xFFFFFFFFF0FFFFFFLL;
    if (((v2 + 251658240) & 0xF000000) == 0)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      uint64_t v3 = *(void **)(result + 448);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v10;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v10 != v6) {
              objc_enumerationMutation(v3);
            }
            v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
            if ([v8 _isContainerView]) {
              -[NUIContainerView endBatchUpdates](v8);
            }
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v5);
      }
      return [v1 setNeedsInvalidation:(uint64_t)(v1[67] << 40) >> 56];
    }
  }
  return result;
}

- (BOOL)setNeedsInvalidation:(int64_t)a3
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  uint64_t v5 = *(_DWORD *)&containerFlags & 0xF000000;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0)
  {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags | ((unint64_t)a3 << 16));
  }
  else
  {
    if (a3 >= 0) {
      unint64_t v7 = a3;
    }
    else {
      unint64_t v7 = 15;
    }
    [(NUIContainerView *)self invalidateInternalStateForInvalidation:v7];
    $E75A57F832BD0FF3084D204B7E402DB5 v8 = self->_containerFlags;
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&v8 & 0xFFFFFFFFFF00FFFFLL);
    if (v7)
    {
      if (v7 == 1)
      {
        [(NUIContainerView *)self setNeedsLayout];
      }
      else
      {
        self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&v8 & 0xFFFFFEFFFF00FFFFLL);
        self->_firstBaselineView = 0;
        self->_lastBaselineView = 0;
        v9.receiver = self;
        v9.super_class = (Class)NUIContainerView;
        [(NUIContainerView *)&v9 invalidateIntrinsicContentSize];
        [(NUIContainerView *)self setNeedsLayout];
        if (v7 >= 4) {
          *(void *)&self->_containerFlags &= 0xFFFFFFFCFFFFFFFFLL;
        }
      }
      if (_NUIIsDebuggerAttached::onceToken != -1) {
        dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
      }
      if (_NUIIsDebuggerAttached::isDebugged) {
        -[NUIContainerView _verifyInternalConsistencyWarningOnly:]((uint64_t)self, 0);
      }
    }
  }
  return v5 == 0;
}

- (void)setNeedsLayout
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerView;
  [(NUIContainerView *)&v3 setNeedsLayout];
}

- (void)_assertNotInLayoutPass:(uint64_t)a1
{
  if (a1)
  {
    if (_NUIIsDebuggerAttached::onceToken != -1) {
      dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
    }
    if (_NUIIsDebuggerAttached::isDebugged && (*(unsigned char *)(a1 + 539) & 0x20) != 0)
    {
      uint64_t v2 = [NSString stringWithFormat:@"%@ called while in a layout or measurement pass.", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "callStackSymbols"), "objectAtIndex:", 1)];
      if (_NUILog::onceToken != -1) {
        dispatch_once(&_NUILog::onceToken, &__block_literal_global_2);
      }
      objc_super v3 = _NUILog::log;
      if (os_log_type_enabled((os_log_t)_NUILog::log, OS_LOG_TYPE_DEBUG)) {
        -[UIView(NUIPrivate) calculateLayoutSizeFittingSize:](v2, v3);
      }
    }
  }
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(void *)&containerFlags & 0x4000000000) == 0)
  {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags | 0x4000000000);
    [(NUIContainerView *)self ensureArrangedSubviewsAreValid];
    *(void *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  if ([(NSMutableArray *)self->_arrangedSubviews containsObject:a3])
  {
    uint64_t v7 = (*(void *)&self->_containerFlags >> 28) & 3;
    if (v7)
    {
      if (v7 == 3)
      {
        -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
      }
    }
    else
    {
      [(NUIContainerView *)self intrinsicContentSizeDidInvalidateForArrangedSubview:a3];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NUIContainerView;
    [(UIView *)&v8 _intrinsicContentSizeInvalidatedForChildView:a3];
  }
}

- (void)intrinsicContentSizeDidInvalidateForArrangedSubview:(id)a3
{
  if (a3 && ([a3 isHidden] & 1) == 0)
  {
    [(NUIContainerView *)self setNeedsInvalidation:4];
  }
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  if (fabs(a3.width) >= 0.001) {
    double width = a3.width;
  }
  else {
    double width = 3.40282347e38;
  }
  if (fabs(a3.height) >= 0.001) {
    double height = a3.height;
  }
  else {
    double height = 3.40282347e38;
  }
  [a4 effectiveAlignmentRectInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = v14 + width + v10;
  double v17 = v12 + height + v8;
  if ((*((unsigned char *)&self->_containerFlags + 5) & 0x40) != 0)
  {
    -[NUIContainerViewDelegate containerView:systemLayoutSizeFittingSize:forArrangedSubview:]([(NUIContainerView *)self delegate], "containerView:systemLayoutSizeFittingSize:forArrangedSubview:", self, a4, v16, v17);
  }
  else
  {
    double v18 = 1.79769313e308;
    double v19 = 1.79769313e308;
  }
  if (v18 == 1.79769313e308 && v19 == 1.79769313e308) {
    objc_msgSend(a4, "effectiveLayoutSizeFittingSize:", v16, v17);
  }
  if (v18 >= v16) {
    double v18 = v16;
  }
  if (v19 >= v17) {
    double v19 = v17;
  }
  double v21 = v18 - (v11 + v15);
  double v22 = v19 - (v9 + v13);
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(void *)&containerFlags & 0x2000000000000) != 0) {
    return 1;
  }
  if ((*(void *)&containerFlags & 0x300000000) == 0)
  {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags & 0xFFFFFFFCFFFFFFFFLL | 0x100000000);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [(NUIContainerView *)self visibleArrangedSubviews];
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isLayoutSizeDependentOnPerpendicularAxis])
          {
            self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&self->_containerFlags & 0xFFFFFFFCFFFFFFFFLL | 0x200000000);
            return (*(void *)&self->_containerFlags & 0x300000000) == 0x200000000;
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  return (*(void *)&self->_containerFlags & 0x300000000) == 0x200000000;
}

- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (_NUIEnableAPIMisuseAssertions) {
    goto LABEL_5;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_5:
    if ((*((unsigned char *)&self->_containerFlags + 4) & 0x80) != 0)
    {
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
      if (v9) {
        long long v10 = (__CFString *)v9;
      }
      else {
        long long v10 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 841, @"effectiveLayoutSizeFittingSize: is not reentrant");
    }
  }
  *(void *)&self->_containerFlags |= 0x8000000000uLL;
  v11.receiver = self;
  v11.super_class = (Class)NUIContainerView;
  -[UIView effectiveLayoutSizeFittingSize:](&v11, sel_effectiveLayoutSizeFittingSize_, width, height);
  *(void *)&self->_containerFlags &= ~0x8000000000uLL;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)canCancelMeasurementForCompression
{
  return (*(void *)&self->_containerFlags & 0x2000080000000) == 0x2000000000000;
}

- (BOOL)_isContainerView
{
  return 1;
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- (id).cxx_construct
{
  *((void *)self + 55) = 0;
  *((void *)self + 54) = 0;
  *((void *)self + 53) = (char *)self + 432;
  *((void *)self + 65) = 0;
  *((void *)self + 66) = 0;
  *((void *)self + 64) = 0;
  return self;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if ((*((unsigned char *)&self->_containerFlags + 4) & 0x80) != 0) {
    double v3 = [(NUIContainerView *)(uint64_t)self _intrinsicSizeWithinSize:a3.height];
  }
  else {
    -[NUIContainerView effectiveLayoutSizeFittingSize:](self, "effectiveLayoutSizeFittingSize:", a3.width, a3.height);
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

uint64_t __43__NUIContainerView_visibleArrangedSubviews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (void)setArrangedSubviews:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  unint64_t v6 = (unint64_t)containerFlags;
  if ((*(void *)&containerFlags & 0x1000000000) == 0)
  {
    unint64_t v6 = *(void *)&containerFlags & 0xFFFFFFF3FFFFFFFFLL | 0x800000000;
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)v6;
  }
  BOOL v7 = (v6 & 0xF000000) != 0 && (v6 & 0x4000000000) == 0;
  if (v7)
  {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(v6 | 0x4000000000);
    [(NUIContainerView *)self ensureArrangedSubviewsAreValid];
    *(void *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  uint64_t v23 = 0;
  v24 = (uint64_t **)&v23;
  uint64_t v25 = 0x4812000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = &unk_1AE6778DD;
  v30[0] = 0;
  v30[1] = 0;
  v29 = v30;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  arrangedSubviews = self->_arrangedSubviews;
  uint64_t v9 = [(NSMutableArray *)arrangedSubviews countByEnumeratingWithState:&v18 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(arrangedSubviews);
        }
        uint64_t v22 = 0;
        uint64_t v22 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        std::__tree<UIView *>::__emplace_unique_key_args<UIView *,UIView *&>(v24 + 6, (unint64_t *)&v22, &v22);
      }
      uint64_t v9 = [(NSMutableArray *)arrangedSubviews countByEnumeratingWithState:&v18 objects:v31 count:16];
    }
    while (v9);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __40__NUIContainerView_setArrangedSubviews___block_invoke;
  v17[3] = &unk_1E5EFF368;
  v17[4] = self;
  v17[5] = &v23;
  [a3 enumerateObjectsUsingBlock:v17];
  long long v12 = (uint64_t **)v24[6];
  long long v13 = v24 + 7;
  if (v12 != v24 + 7)
  {
    do
    {
      [(NUIContainerView *)self removeArrangedSubview:v12[4]];
      double v14 = v12[1];
      if (v14)
      {
        do
        {
          uint64_t v15 = (uint64_t **)v14;
          double v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          uint64_t v15 = (uint64_t **)v12[2];
          BOOL v7 = *v15 == (uint64_t *)v12;
          long long v12 = v15;
        }
        while (!v7);
      }
      long long v12 = v15;
    }
    while (v15 != v13);
  }
  $E75A57F832BD0FF3084D204B7E402DB5 v16 = self->_containerFlags;
  if ((*(void *)&v16 & 0x1000000000) == 0) {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&v16 & 0xFFFFFFF3FFFFFFFFLL | *(void *)&containerFlags & 0xC00000000);
  }
  _Block_object_dispose(&v23, 8);
  std::__tree<UIView *>::destroy((uint64_t)&v29, v30[0]);
}

uint64_t __40__NUIContainerView_setArrangedSubviews___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8) + 48;
  unint64_t v8 = a2;
  std::__tree<UIView *>::__erase_unique<UIView *>(v6, &v8);
  return [*(id *)(a1 + 32) insertArrangedSubview:a2 atIndex:a3];
}

uint64_t __45__NUIContainerView_initWithArrangedSubviews___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) addArrangedSubview:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)addArrangedSubview:(id)a3
{
  if (_NUIEnableAPIMisuseAssertions)
  {
    if (!a3) {
      goto LABEL_10;
    }
  }
  else
  {
    if (_NUIIsDebuggerAttached::onceToken == -1)
    {
      if (a3) {
        goto LABEL_7;
      }
    }
    else
    {
      dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
      if (a3) {
        goto LABEL_7;
      }
    }
    if (_NUIIsDebuggerAttached::isDebugged)
    {
LABEL_10:
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
      if (v7) {
        long long v8 = (__CFString *)v7;
      }
      else {
        long long v8 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 530, @"Invalid parameter not satisfying: %@", @"view != nil");
    }
  }
LABEL_7:
  uint64_t v6 = [(NSMutableArray *)self->_arrangedSubviews count];
  [(NUIContainerView *)self insertArrangedSubview:a3 atIndex:v6];
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
  id v19 = a3;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (_NUIEnableAPIMisuseAssertions)
  {
    if (a3)
    {
LABEL_12:
      if ([(NSMutableArray *)self->_arrangedSubviews count] < a4)
      {
        uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
        if (v11) {
          uint64_t v12 = (__CFString *)v11;
        }
        else {
          uint64_t v12 = @"<Unknown File>";
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 597, @"Invalid parameter not satisfying: %@", @"stackIndex <= _arrangedSubviews.count");
      }
      goto LABEL_13;
    }
    goto LABEL_47;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  if (_NUIIsDebuggerAttached::isDebugged && !a3)
  {
LABEL_47:
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
    if (v17) {
      long long v18 = (__CFString *)v17;
    }
    else {
      long long v18 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 596, @"Invalid parameter not satisfying: %@", @"view != nil");
  }
  if (_NUIEnableAPIMisuseAssertions) {
    goto LABEL_12;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  if (_NUIIsDebuggerAttached::isDebugged) {
    goto LABEL_12;
  }
LABEL_13:
  -[NUIContainerView _addAsSubviewIfNeeded:]((uint64_t)self, a3);
  uint64_t v8 = [(NSMutableArray *)self->_arrangedSubviews indexOfObject:a3];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v8;
    if (v8 == a4) {
      goto LABEL_24;
    }
    [(NSMutableArray *)self->_arrangedSubviews removeObjectAtIndex:v8];
    [(NUIContainerView *)self didRemoveArrangedSubview:a3 atIndex:v9];
    if ([(NSMutableArray *)self->_arrangedSubviews count] < a4) {
      a4 = [(NSMutableArray *)self->_arrangedSubviews count];
    }
    [(NSMutableArray *)self->_arrangedSubviews insertObject:a3 atIndex:a4];
    [(NUIContainerView *)self didInsertArrangedSubview:a3 atIndex:a4];
LABEL_23:

    self->_visibleArrangedSubviews = 0;
    [(NUIContainerView *)self setNeedsInvalidation:4];
    goto LABEL_24;
  }
  [a3 addObserver:self forKeyPath:@"hidden" options:3 context:0];
  [(NSMutableArray *)self->_arrangedSubviews insertObject:a3 atIndex:a4];
  long long v20 = &v19;
  std::__tree<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::__map_value_compare<UIView *,std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>>>::__emplace_unique_key_args<UIView *,std::piecewise_construct_t const&,std::tuple<UIView * const&>,std::tuple<>>((uint64_t **)&self->_arrangedSubviewInfo, (unint64_t *)&v19, (uint64_t)&std::piecewise_construct, &v20);
  if ((*((unsigned char *)&self->_containerFlags + 3) & 0xF) != 0 && [v19 _isContainerView]) {
    -[NUIContainerView beginBatchUpdates]((uint64_t)v19);
  }
  [(NUIContainerView *)self didInsertArrangedSubview:v19 atIndex:a4];
  if (![v19 isHidden]) {
    goto LABEL_23;
  }
  ++*(_WORD *)&self->_containerFlags;
LABEL_24:
  if (_NUIEnableAPIMisuseAssertions) {
    goto LABEL_28;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_28:
    int containerFlags = (int)self->_containerFlags;
    if (containerFlags != -[NUIContainerView _countHiddenArrangesSubviews](self))
    {
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
      if (v13) {
        double v14 = (__CFString *)v13;
      }
      else {
        double v14 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 627, @"Hidden count mismatch");
    }
  }
  if (_NUIEnableAPIMisuseAssertions) {
    goto LABEL_33;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_33:
    if ([(NSMutableArray *)self->_arrangedSubviews count] != self->_arrangedSubviewInfo.__tree_.__pair3_.__value_)
    {
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
      if (v15) {
        $E75A57F832BD0FF3084D204B7E402DB5 v16 = (__CFString *)v15;
      }
      else {
        $E75A57F832BD0FF3084D204B7E402DB5 v16 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 628, @"Info caount mismatch");
    }
  }
}

- (uint64_t)_addAsSubviewIfNeeded:(uint64_t)result
{
  if (result)
  {
    double v3 = (unsigned char *)result;
    uint64_t result = [a2 superview];
    if ((unsigned char *)result != v3)
    {
      [a2 _setHostsLayoutEngine:1];
      uint64_t result = [v3 addSubview:a2];
    }
    if ((v3[540] & 0x20) != 0)
    {
      return [a2 setHidden:0];
    }
  }
  return result;
}

- (NSDirectionalEdgeInsets)minimumSpacingAdjacentToView:(id)a3
{
  left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_12;
  }
  p_pair1 = &self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    unint64_t v5 = *((void *)left + 4);
    BOOL v6 = v5 >= (unint64_t)a3;
    if (v5 >= (unint64_t)a3) {
      uint64_t v7 = (char **)left;
    }
    else {
      uint64_t v7 = (char **)(left + 8);
    }
    if (v6) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *)left;
    }
    left = *v7;
  }
  while (*v7);
  if (p_pair1 != &self->_arrangedSubviewInfo.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3)
  {
    double v8 = *(double *)&p_pair1[7].__value_.__left_;
    double v9 = *(double *)&p_pair1[8].__value_.__left_;
    double v10 = *(double *)&p_pair1[9].__value_.__left_;
    double v11 = *(double *)&p_pair1[10].__value_.__left_;
  }
  else
  {
LABEL_12:
    double v8 = 1.79769313e308;
    double v9 = 1.79769313e308;
    double v10 = 1.79769313e308;
    double v11 = 1.79769313e308;
  }
  result.trailing = v11;
  result.bottom = v10;
  result.leading = v9;
  result.top = v8;
  return result;
}

- (NSArray)arrangedSubviews
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(void *)&containerFlags & 0x4000000000) == 0)
  {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags | 0x4000000000);
    [(NUIContainerView *)self ensureArrangedSubviewsAreValid];
    *(void *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  unint64_t v5 = (void *)[(NSMutableArray *)self->_arrangedSubviews copy];
  return (NSArray *)v5;
}

- (NSArray)visibleArrangedSubviews
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(void *)&containerFlags & 0x4000000000) == 0)
  {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags | 0x4000000000);
    [(NUIContainerView *)self ensureArrangedSubviewsAreValid];
    *(void *)&self->_containerFlags &= ~0x4000000000uLL;
    *(_WORD *)&$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  }
  if (!*(_WORD *)&containerFlags)
  {
    p_arrangedSubviews = (NSArray **)&self->_arrangedSubviews;
    return *p_arrangedSubviews;
  }
  p_arrangedSubviews = &self->_visibleArrangedSubviews;
  if (!self->_visibleArrangedSubviews)
  {
    uint64_t v7 = (NSArray *)(id)-[NSMutableArray filteredArrayUsingPredicate:](self->_arrangedSubviews, "filteredArrayUsingPredicate:", [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_99]);
    *p_arrangedSubviews = v7;
    if (_NUIEnableAPIMisuseAssertions) {
      goto LABEL_14;
    }
    if (_NUIIsDebuggerAttached::onceToken != -1) {
      dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
    }
    if (_NUIIsDebuggerAttached::isDebugged)
    {
      uint64_t v7 = *p_arrangedSubviews;
LABEL_14:
      uint64_t v8 = [(NSArray *)v7 count];
      if (v8 != [(NSMutableArray *)self->_arrangedSubviews count] - *(_WORD *)&self->_containerFlags)
      {
        uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
        if (v9) {
          double v10 = (__CFString *)v9;
        }
        else {
          double v10 = @"<Unknown File>";
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 475, @"Mismatching visible arranged subviews count");
      }
    }
  }
  return *p_arrangedSubviews;
}

- (BOOL)isBaselineRelativeArrangement
{
  return (*((unsigned __int8 *)&self->_containerFlags + 5) >> 2) & 1;
}

- (int64_t)alignmentForView:(id)a3 inAxis:(int64_t)a4
{
  left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    return -1;
  }
  p_pair1 = (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    unint64_t v6 = *((void *)left + 4);
    BOOL v7 = v6 >= (unint64_t)a3;
    if (v6 >= (unint64_t)a3) {
      uint64_t v8 = (char **)left;
    }
    else {
      uint64_t v8 = (char **)(left + 8);
    }
    if (v7) {
      p_pair1 = (NUIContainerView *)left;
    }
    left = *v8;
  }
  while (*v8);
  if (p_pair1 != (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_
    && (unint64_t cachedTraitCollection = (unint64_t)p_pair1->super._cachedTraitCollection,
        p_unint64_t cachedTraitCollection = &p_pair1->super._cachedTraitCollection,
        cachedTraitCollection <= (unint64_t)a3))
  {
    return *((char *)p_cachedTraitCollection + a4 + 56);
  }
  else
  {
    return -1;
  }
}

- (void)setLayoutMarginsRelativeArrangement:(BOOL)a3
{
  BOOL v3 = a3;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if (((((*(void *)&containerFlags & 0x80000000000) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 0x80000000000;
    if (!v3) {
      uint64_t v6 = 0;
    }
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags & 0xFFFFF7FFFFFFFFFFLL | v6);
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (NUIContainerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NUIContainerView;
  BOOL v3 = -[NUIContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3) {
    _NUIContainerViewCommonInit(v3);
  }
  return v4;
}

- (NUIContainerView)initWithArrangedSubviews:(id)a3
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v12.receiver = self;
  v12.super_class = (Class)NUIContainerView;
  uint64_t v8 = -[NUIContainerView initWithFrame:](&v12, sel_initWithFrame_, v4, v5, v6, v7);
  uint64_t v9 = v8;
  if (v8)
  {
    _NUIContainerViewCommonInit(v8);
    if (a3)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45__NUIContainerView_initWithArrangedSubviews___block_invoke;
      v11[3] = &unk_1E5EFF340;
      v11[4] = a3;
      v11[5] = v9;
      [(NUIContainerView *)v9 performBatchUpdates:v11];
    }
  }
  return v9;
}

- (void)setDebugBoundingBoxesEnabled:(BOOL)a3
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if (((((*(void *)&containerFlags & 0x20000000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x20000000000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags & 0xFFFFFDFFFFFFFFFFLL | v4);
    [(NUIContainerView *)self setNeedsLayout];
  }
}

+ (BOOL)isDebugBoundingBoxesEnabled
{
  return debugBoundingBoxes;
}

- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4
{
  if ((*((unsigned char *)&self->_containerFlags + 4) & 0x80) != 0) {
    double v4 = [(NUIContainerView *)(uint64_t)self _intrinsicSizeWithinSize:a3.height];
  }
  else {
    -[NUIContainerView effectiveLayoutSizeFittingSize:](self, "effectiveLayoutSizeFittingSize:", a4, a3.width, a3.height);
  }
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (double)_intrinsicSizeWithinSize:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  *(unsigned char *)(a1 + 408) = [(id)a1 effectiveUserInterfaceLayoutDirection] == 1;
  unint64_t v6 = *(void *)(a1 + 536);
  uint64_t v7 = ((v6 >> 28) & 3) << 28;
  uint64_t v8 = 0x10000000;
  if (((v6 >> 28) & 3) != 0) {
    uint64_t v8 = ((v6 >> 28) & 3) << 28;
  }
  *(void *)(a1 + 536) = v8 | v6 & 0xFFFFFFFFCFFFFFFFLL;
  id v9 = (id)[(id)a1 delegate];
  double v10 = v9;
  unint64_t v11 = *(void *)(a1 + 536);
  if ((v11 & 0x1000000000000) != 0)
  {
    objc_msgSend(v9, "containerView:willMeasureArrangedSubviewsFittingSize:forReason:", a1, 0, a2, a3);
    unint64_t v11 = *(void *)(a1 + 536);
  }
  uint64_t v12 = v11 & 0x30000000;
  if (((v11 >> 28) & 2) == 0) {
    uint64_t v12 = 0x20000000;
  }
  unint64_t v13 = v12 | v11 & 0xFFFFFFFFCFFFFFFFLL;
  *(void *)(a1 + 536) = v13;
  if (fabs(a2) < 0.001) {
    a2 = 3.40282347e38;
  }
  if (fabs(a3) < 0.001) {
    a3 = 3.40282347e38;
  }
  if ((v11 & 0x180000000000) != 0)
  {
    [(id)a1 effectiveLayoutMargins];
    double v16 = v14 + v15;
    a2 = a2 - (v14 + v15);
    double v19 = v17 + v18;
    a3 = a3 - (v17 + v18);
    unint64_t v13 = *(void *)(a1 + 536);
  }
  else
  {
    double v16 = *(double *)(MEMORY[0x1E4F437F8] + 8) + *(double *)(MEMORY[0x1E4F437F8] + 24);
    double v19 = *MEMORY[0x1E4F437F8] + *(double *)(MEMORY[0x1E4F437F8] + 16);
  }
  *(void *)(a1 + 536) = v13 & 0xFFFFFFFF3FFFFFFFLL;
  objc_msgSend((id)a1, "calculateArrangedSizeFittingSize:", a2, a3);
  if ((*(void *)(a1 + 536) & 0x180000000000) != 0) {
    double v22 = v19;
  }
  else {
    double v22 = -0.0;
  }
  double v23 = v21 + v22;
  if ((*(void *)(a1 + 536) & 0x180000000000) != 0) {
    double v24 = v16;
  }
  else {
    double v24 = -0.0;
  }
  double v25 = v20 + v24;
  if (v20 + v24 < 0.0 || v23 < 0.0)
  {
    if (*MEMORY[0x1E4F1DB30] > v25) {
      double v25 = *MEMORY[0x1E4F1DB30];
    }
    LODWORD(v26) = 1;
  }
  else
  {
    uint64_t v26 = *(void *)&v20 >> 63;
  }
  [(id)a1 _currentScreenScale];
  if (v27 == 1.0)
  {
    double v28 = floor(v25);
    double v29 = ceil(v25);
    if (v25 - v28 >= 0.001) {
      double v30 = v29;
    }
    else {
      double v30 = v28;
    }
  }
  else
  {
    double v31 = floor(v25 * v27);
    double v32 = ceil(v25 * v27);
    if (v25 * v27 - v31 < 0.001) {
      double v32 = v31;
    }
    double v30 = v32 / v27;
  }
  *(void *)(a1 + 536) = *(void *)(a1 + 536) & 0xFFFFFFFFCFFFFFFFLL | v7;

  if (v26) {
    [(id)a1 setCurrentEffectiveLayoutSizeFittingSizeShouldNotBeCached];
  }
  return v30;
}

- (void)layoutSubviews
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NUIContainerView *)self delegate];
  v17.receiver = self;
  v17.super_class = (Class)NUIContainerView;
  [(NUIContainerView *)&v17 layoutSubviews];
  self->_isRTL = [(NUIContainerView *)self effectiveUserInterfaceLayoutDirection] == 1;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  uint64_t v5 = ((*(unint64_t *)&containerFlags >> 28) & 3) << 28;
  uint64_t v6 = 0x10000000;
  if (((*(unint64_t *)&containerFlags >> 28) & 3) != 0) {
    uint64_t v6 = ((*(unint64_t *)&containerFlags >> 28) & 3) << 28;
  }
  $E75A57F832BD0FF3084D204B7E402DB5 v7 = ($E75A57F832BD0FF3084D204B7E402DB5)(v6 | *(void *)&containerFlags & 0xFFFFFFFFCFFFFFFFLL);
  self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = v7;
  if ((*(void *)&containerFlags & 0x1000000000000) != 0)
  {
    [(NUIContainerView *)self bounds];
    -[NUIContainerViewDelegate containerView:willMeasureArrangedSubviewsFittingSize:forReason:](v3, "containerView:willMeasureArrangedSubviewsFittingSize:forReason:", self, 1, v8, v9);
    $E75A57F832BD0FF3084D204B7E402DB5 v7 = self->_containerFlags;
  }
  self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(unint64_t *)&v7 | 0x30000000);
  [(NUIContainerView *)self effectiveLayoutBounds];
  CGFloat v12 = v11;
  CGFloat v13 = v10;
  *(void *)&self->_containerFlags &= 0xFFFFFFFF3FFFFFFFLL;
  if (v11 <= 0.0 || v10 <= 0.0)
  {
    if (_NUIIsDebuggerAttached::onceToken != -1) {
      dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
    }
    if (_NUIIsDebuggerAttached::isDebugged)
    {
      if (_NUILog::onceToken != -1) {
        dispatch_once(&_NUILog::onceToken, &__block_literal_global_2);
      }
      double v14 = _NUILog::log;
      if (os_log_type_enabled((os_log_t)_NUILog::log, OS_LOG_TYPE_INFO))
      {
        v23.double width = v12;
        v23.double height = v13;
        double v15 = NSStringFromCGSize(v23);
        *(_DWORD *)buf = 138412546;
        double v19 = v15;
        __int16 v20 = 2112;
        double v21 = self;
        _os_log_impl(&dword_1AE653000, v14, OS_LOG_TYPE_INFO, "Skipping layout in size %@ for view: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    [(NUIContainerView *)self layoutArrangedSubviewsInBounds:"layoutArrangedSubviewsInBounds:"];
  }
  $E75A57F832BD0FF3084D204B7E402DB5 v16 = self->_containerFlags;
  self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&v16 & 0xFFFFFFFFCFFFFFFFLL | v5);
  if ((*(void *)&v16 & 0x4000000000000) != 0) {
    [(NUIContainerViewDelegate *)v3 containerViewDidLayoutArrangedSubviews:self];
  }

  -[NUIContainerView _updateDebugBoundingBoxesIfNeeded]((uint64_t)self);
}

- (NUIContainerViewDelegate)delegate
{
  return (NUIContainerViewDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (CGRect)effectiveLayoutBounds
{
  [(NUIContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ((*((unsigned char *)&self->_containerFlags + 5) & 0x18) != 0)
  {
    [(NUIContainerView *)self effectiveLayoutMargins];
    double v4 = v4 + v11;
    double v6 = v6 + v12;
    double v8 = v8 - (v11 + v13);
    double v10 = v10 - (v12 + v14);
  }
  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (uint64_t)_updateDebugBoundingBoxesIfNeeded
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void ***)(result + 512);
    double v3 = *(void ***)(result + 520);
    if (v2 != v3)
    {
      do
      {
        double v4 = *v2++;
        CGRect result = [v4 removeFromSuperlayer];
      }
      while (v2 != v3);
      uint64_t v2 = *(void ***)(v1 + 512);
    }
    *(void *)(v1 + 520) = v2;
    if ((*(unsigned char *)(v1 + 541) & 2) != 0)
    {
      double v5 = (void *)[MEMORY[0x1E4F39BE8] layer];
      objc_msgSend((id)objc_msgSend((id)v1, "layer"), "bounds");
      objc_msgSend(v5, "setFrame:");
      objc_msgSend(v5, "setBorderColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F428B8], "purpleColor"), "colorWithAlphaComponent:"), "CGColor"));
      [v5 setBorderWidth:1.0];
      objc_msgSend((id)objc_msgSend((id)v1, "layer"), "insertSublayer:atIndex:", v5, 0);
      double v6 = (void **)(v1 + 512);
      double v7 = *(void **)(v1 + 520);
      unint64_t v8 = *(void *)(v1 + 528);
      if ((unint64_t)v7 >= v8)
      {
        uint64_t v10 = ((char *)v7 - (unsigned char *)*v6) >> 3;
        if ((unint64_t)(v10 + 1) >> 61) {
          goto LABEL_119;
        }
        uint64_t v11 = v8 - (void)*v6;
        uint64_t v12 = v11 >> 2;
        if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
          uint64_t v12 = v10 + 1;
        }
        if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v12;
        }
        if (v13) {
          double v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(v1 + 528, v13);
        }
        else {
          double v14 = 0;
        }
        double v15 = &v14[8 * v10];
        double v16 = &v14[8 * v13];
        *(void *)double v15 = v5;
        double v9 = v15 + 8;
        double v18 = (char *)*v6;
        double v17 = *(char **)(v1 + 520);
        if (v17 != *v6)
        {
          do
          {
            uint64_t v19 = *((void *)v17 - 1);
            v17 -= 8;
            *((void *)v15 - 1) = v19;
            v15 -= 8;
          }
          while (v17 != v18);
          double v17 = (char *)*v6;
        }
        *double v6 = v15;
        *(void *)(v1 + 520) = v9;
        *(void *)(v1 + 528) = v16;
        if (v17) {
          operator delete(v17);
        }
      }
      else
      {
        *double v7 = v5;
        double v9 = v7 + 1;
      }
      *(void *)(v1 + 520) = v9;
      if ((*(unsigned char *)(v1 + 541) & 0x18) == 0) {
        goto LABEL_41;
      }
      [(id)v1 effectiveLayoutBounds];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      [(id)v1 bounds];
      v128.origin.x = v28;
      v128.origin.y = v29;
      v128.size.double width = v30;
      v128.size.double height = v31;
      v127.origin.x = v21;
      v127.origin.y = v23;
      v127.size.double width = v25;
      v127.size.double height = v27;
      if (CGRectEqualToRect(v127, v128))
      {
LABEL_41:
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        id obj = (id)[(id)v1 subviews];
        CGRect result = [obj countByEnumeratingWithState:&v121 objects:v125 count:16];
        uint64_t v47 = result;
        if (result)
        {
          uint64_t v120 = *(void *)v122;
          v48 = (double *)MEMORY[0x1E4F437F8];
          double v118 = 0.400000006;
          do
          {
            uint64_t v49 = 0;
            do
            {
              if (*(void *)v122 != v120) {
                objc_enumerationMutation(obj);
              }
              v50 = *(void **)(*((void *)&v121 + 1) + 8 * v49);
              if (objc_msgSend((id)objc_msgSend((id)v1, "visibleArrangedSubviews", *(void *)&v118), "indexOfObject:", v50) != 0x7FFFFFFFFFFFFFFFLL)
              {
                v51 = (void *)[MEMORY[0x1E4F39BE8] layer];
                [v50 frame];
                double v53 = v52;
                double v55 = v54;
                double v57 = v56;
                double v59 = v58;
                objc_msgSend(v51, "setFrame:");
                if ([v50 _wantsConstraintBasedLayout]) {
                  v60 = (void *)[MEMORY[0x1E4F428B8] redColor];
                }
                else {
                  v60 = (void *)[MEMORY[0x1E4F428B8] orangeColor];
                }
                v61 = v60;
                objc_msgSend(v51, "setBorderColor:", objc_msgSend((id)objc_msgSend(v60, "colorWithAlphaComponent:", 0.699999988), "CGColor"));
                [v51 setBorderWidth:1.0];
                objc_msgSend((id)objc_msgSend((id)v1, "layer"), "insertSublayer:above:", v51, objc_msgSend(v50, "layer"));
                v62 = (void **)(v1 + 512);
                v63 = *(void **)(v1 + 520);
                unint64_t v64 = *(void *)(v1 + 528);
                if ((unint64_t)v63 >= v64)
                {
                  uint64_t v66 = ((char *)v63 - (unsigned char *)*v62) >> 3;
                  if ((unint64_t)(v66 + 1) >> 61) {
                    abort();
                  }
                  uint64_t v67 = v64 - (void)*v62;
                  uint64_t v68 = v67 >> 2;
                  if (v67 >> 2 <= (unint64_t)(v66 + 1)) {
                    uint64_t v68 = v66 + 1;
                  }
                  if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v69 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v69 = v68;
                  }
                  if (v69) {
                    v70 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(v1 + 528, v69);
                  }
                  else {
                    v70 = 0;
                  }
                  v71 = &v70[8 * v66];
                  *(void *)v71 = v51;
                  v65 = v71 + 8;
                  v73 = (char *)*v62;
                  v72 = *(char **)(v1 + 520);
                  if (v72 != *v62)
                  {
                    do
                    {
                      uint64_t v74 = *((void *)v72 - 1);
                      v72 -= 8;
                      *((void *)v71 - 1) = v74;
                      v71 -= 8;
                    }
                    while (v72 != v73);
                    v72 = (char *)*v62;
                  }
                  *v62 = v71;
                  *(void *)(v1 + 520) = v65;
                  *(void *)(v1 + 528) = &v70[8 * v69];
                  if (v72) {
                    operator delete(v72);
                  }
                }
                else
                {
                  void *v63 = v51;
                  v65 = v63 + 1;
                }
                *(void *)(v1 + 520) = v65;
                [v50 effectiveAlignmentRectInsets];
                double v78 = v75;
                double v80 = v79;
                double v81 = v76;
                double v82 = v77;
                if (v79 != v48[1] || v75 != *v48 || v77 != v48[3] || v76 != v48[2])
                {
                  v86 = (void *)[MEMORY[0x1E4F39BE8] layer];
                  objc_msgSend(v86, "setFrame:", v53 + v80, v55 + v78, v57 - (v80 + v82), v59 - (v78 + v81));
                  objc_msgSend(v86, "setBorderColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F428B8], "brownColor"), "colorWithAlphaComponent:", 0.699999988), "CGColor"));
                  [v86 setBorderWidth:1.0];
                  objc_msgSend((id)objc_msgSend((id)v1, "layer"), "insertSublayer:below:", v86, v51);
                  v87 = (void **)(v1 + 512);
                  v88 = *(void **)(v1 + 520);
                  unint64_t v89 = *(void *)(v1 + 528);
                  if ((unint64_t)v88 >= v89)
                  {
                    uint64_t v91 = ((char *)v88 - (unsigned char *)*v87) >> 3;
                    if ((unint64_t)(v91 + 1) >> 61) {
                      abort();
                    }
                    uint64_t v92 = v89 - (void)*v87;
                    uint64_t v93 = v92 >> 2;
                    if (v92 >> 2 <= (unint64_t)(v91 + 1)) {
                      uint64_t v93 = v91 + 1;
                    }
                    if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF8) {
                      unint64_t v94 = 0x1FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v94 = v93;
                    }
                    if (v94) {
                      v95 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(v1 + 528, v94);
                    }
                    else {
                      v95 = 0;
                    }
                    v96 = &v95[8 * v91];
                    *(void *)v96 = v86;
                    v90 = v96 + 8;
                    v98 = (char *)*v87;
                    v97 = *(char **)(v1 + 520);
                    if (v97 != *v87)
                    {
                      do
                      {
                        uint64_t v99 = *((void *)v97 - 1);
                        v97 -= 8;
                        *((void *)v96 - 1) = v99;
                        v96 -= 8;
                      }
                      while (v97 != v98);
                      v97 = (char *)*v87;
                    }
                    *v87 = v96;
                    *(void *)(v1 + 520) = v90;
                    *(void *)(v1 + 528) = &v95[8 * v94];
                    if (v97) {
                      operator delete(v97);
                    }
                  }
                  else
                  {
                    void *v88 = v86;
                    v90 = v88 + 1;
                  }
                  *(void *)(v1 + 520) = v90;
                }
                if ([(id)v1 needsBaselineDebugBoundingBoxesForArrangedSubview:v50])
                {
                  [v50 effectiveFirstBaselineOffsetFromTop];
                  double v101 = v100;
                  [v50 effectiveBaselineOffsetFromBottom];
                  double v103 = v102;
                  if (v101 != 0.0 || v102 != 0.0)
                  {
                    v104 = (void *)[MEMORY[0x1E4F39BE8] layer];
                    objc_msgSend(v104, "setFrame:", v53 + 0.0, v55 + v101, v57, v59 - (v101 + v103 + -1.0));
                    objc_msgSend(v104, "setBorderColor:", objc_msgSend((id)objc_msgSend(v61, "colorWithAlphaComponent:", v118), "CGColor"));
                    [v104 setBorderWidth:1.0];
                    objc_msgSend((id)objc_msgSend((id)v1, "layer"), "insertSublayer:above:", v104, v51);
                    v105 = (void **)(v1 + 512);
                    v106 = *(void **)(v1 + 520);
                    unint64_t v107 = *(void *)(v1 + 528);
                    if ((unint64_t)v106 >= v107)
                    {
                      uint64_t v109 = ((char *)v106 - (unsigned char *)*v105) >> 3;
                      if ((unint64_t)(v109 + 1) >> 61) {
                        abort();
                      }
                      uint64_t v110 = v107 - (void)*v105;
                      uint64_t v111 = v110 >> 2;
                      if (v110 >> 2 <= (unint64_t)(v109 + 1)) {
                        uint64_t v111 = v109 + 1;
                      }
                      if ((unint64_t)v110 >= 0x7FFFFFFFFFFFFFF8) {
                        unint64_t v112 = 0x1FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v112 = v111;
                      }
                      if (v112) {
                        v113 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(v1 + 528, v112);
                      }
                      else {
                        v113 = 0;
                      }
                      v114 = &v113[8 * v109];
                      *(void *)v114 = v104;
                      v108 = v114 + 8;
                      v116 = (char *)*v105;
                      v115 = *(char **)(v1 + 520);
                      if (v115 != *v105)
                      {
                        do
                        {
                          uint64_t v117 = *((void *)v115 - 1);
                          v115 -= 8;
                          *((void *)v114 - 1) = v117;
                          v114 -= 8;
                        }
                        while (v115 != v116);
                        v115 = (char *)*v105;
                      }
                      *v105 = v114;
                      *(void *)(v1 + 520) = v108;
                      *(void *)(v1 + 528) = &v113[8 * v112];
                      if (v115) {
                        operator delete(v115);
                      }
                    }
                    else
                    {
                      void *v106 = v104;
                      v108 = v106 + 1;
                    }
                    *(void *)(v1 + 520) = v108;
                  }
                }
              }
              ++v49;
            }
            while (v49 != v47);
            CGRect result = [obj countByEnumeratingWithState:&v121 objects:v125 count:16];
            uint64_t v47 = result;
          }
          while (result);
        }
        return result;
      }
      double v32 = (void *)[MEMORY[0x1E4F39BE8] layer];
      objc_msgSend(v32, "setFrame:", v21, v23, v25, v27);
      objc_msgSend(v32, "setBorderColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F428B8], "purpleColor"), "colorWithAlphaComponent:", 0.400000006), "CGColor"));
      [v32 setBorderWidth:1.0];
      objc_msgSend((id)objc_msgSend((id)v1, "layer"), "insertSublayer:atIndex:", v32, 1);
      v33 = (void **)(v1 + 512);
      v34 = *(void **)(v1 + 520);
      unint64_t v35 = *(void *)(v1 + 528);
      if ((unint64_t)v34 < v35)
      {
        void *v34 = v32;
        v36 = v34 + 1;
LABEL_40:
        *(void *)(v1 + 520) = v36;
        goto LABEL_41;
      }
      uint64_t v37 = ((char *)v34 - (unsigned char *)*v33) >> 3;
      if (!((unint64_t)(v37 + 1) >> 61))
      {
        uint64_t v38 = v35 - (void)*v33;
        uint64_t v39 = v38 >> 2;
        if (v38 >> 2 <= (unint64_t)(v37 + 1)) {
          uint64_t v39 = v37 + 1;
        }
        if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v40 = v39;
        }
        if (v40) {
          v41 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(v1 + 528, v40);
        }
        else {
          v41 = 0;
        }
        v42 = &v41[8 * v37];
        v43 = &v41[8 * v40];
        *(void *)v42 = v32;
        v36 = v42 + 8;
        v45 = (char *)*v33;
        v44 = *(char **)(v1 + 520);
        if (v44 != *v33)
        {
          do
          {
            uint64_t v46 = *((void *)v44 - 1);
            v44 -= 8;
            *((void *)v42 - 1) = v46;
            v42 -= 8;
          }
          while (v44 != v45);
          v44 = (char *)*v33;
        }
        *v33 = v42;
        *(void *)(v1 + 520) = v36;
        *(void *)(v1 + 528) = v43;
        if (v44) {
          operator delete(v44);
        }
        goto LABEL_40;
      }
LABEL_119:
      abort();
    }
  }
  return result;
}

- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [a3 effectiveAlignmentRectInsets];
  if (v11 != *(double *)(MEMORY[0x1E4F437F8] + 8)
    || v10 != *MEMORY[0x1E4F437F8]
    || v13 != *(double *)(MEMORY[0x1E4F437F8] + 24)
    || v12 != *(double *)(MEMORY[0x1E4F437F8] + 16))
  {
    double x = x - v11;
    double y = y - v10;
    double width = width - (-v13 - v11);
    double height = height - (-v12 - v10);
  }
  [(NUIContainerView *)self _currentScreenScale];
  double v18 = v17;
  if ((*((unsigned char *)&self->_containerFlags + 5) & 0x80) != 0)
  {
    v55.origin.double x = x;
    v55.origin.double y = y;
    v55.size.double width = width;
    v55.size.double height = height;
    double v19 = NUIRectRoundToScale(v55, v18);
    -[NUIContainerViewDelegate containerView:layoutFrameForArrangedSubview:withProposedFrame:]([(NUIContainerView *)self delegate], "containerView:layoutFrameForArrangedSubview:withProposedFrame:", self, a3, v19, v20, v21, v22);
    double x = v23;
    double y = v24;
    double width = v25;
    double height = v26;
  }
  left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_25;
  }
  p_pair1 = &self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    unint64_t v29 = *((void *)left + 4);
    BOOL v30 = v29 >= (unint64_t)a3;
    if (v29 >= (unint64_t)a3) {
      CGFloat v31 = (char **)left;
    }
    else {
      CGFloat v31 = (char **)(left + 8);
    }
    if (v30) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *)left;
    }
    left = *v31;
  }
  while (*v31);
  if (p_pair1 != &self->_arrangedSubviewInfo.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3)
  {
    double x = x + *(double *)&p_pair1[5].__value_.__left_;
    double y = y + *(double *)&p_pair1[6].__value_.__left_;
  }
  else
  {
LABEL_25:
    if (_NUILog::onceToken != -1) {
      dispatch_once(&_NUILog::onceToken, &__block_literal_global_2);
    }
    double v32 = _NUILog::log;
    if (os_log_type_enabled((os_log_t)_NUILog::log, OS_LOG_TYPE_ERROR)) {
      -[NUIContainerView(NUISubclassHelpers) layoutFrameForArrangedSubview:withProposedContentFrame:]((uint64_t)a3, v32);
    }
  }
  v56.origin.double x = x;
  v56.origin.double y = y;
  v56.size.double width = width;
  v56.size.double height = height;
  double v33 = NUIRectRoundToScale(v56, v18);
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  if (self->_isRTL)
  {
    [(NUIContainerView *)self effectiveLayoutBounds];
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    v57.origin.double x = v33;
    v57.origin.double y = v35;
    v57.size.double width = v37;
    v57.size.double height = v39;
    double MinX = CGRectGetMinX(v57);
    v58.origin.double x = v41;
    v58.origin.double y = v43;
    v58.size.double width = v45;
    v58.size.double height = v47;
    double v54 = MinX - CGRectGetMinX(v58);
    v59.origin.double x = v41;
    v59.origin.double y = v43;
    v59.size.double width = v45;
    v59.size.double height = v47;
    double MaxX = CGRectGetMaxX(v59);
    v60.origin.double x = v33;
    v60.origin.double y = v35;
    v60.size.double width = v37;
    v60.size.double height = v39;
    double v33 = MaxX - (v54 + CGRectGetWidth(v60));
  }
  double v49 = v33;
  double v50 = v35;
  double v51 = v37;
  double v52 = v39;
  result.size.double height = v52;
  result.size.double width = v51;
  result.origin.double y = v50;
  result.origin.double x = v49;
  return result;
}

- (UIEdgeInsets)effectiveLayoutMargins
{
  if ((*((unsigned char *)&self->_containerFlags + 5) & 1) == 0)
  {
    [(NUIContainerView *)self layoutMargins];
    double v5 = v4;
    CGFloat v6 = v3;
    double v8 = v7;
    double v10 = v9;
    if (v3 <= -1048576.0)
    {
      if (v3 == -1.79769313e308) {
        double v11 = 1.0;
      }
      else {
        double v11 = (v3 + 1048576.0) * -0.00390625;
      }
      objc_msgSend(-[NSArray firstObject](-[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews"), "firstObject"), "systemSpacingToSuperView:edge:baselineRelative:multiplier:", self, 2, (*(void *)&self->_containerFlags >> 42) & 1, v11);
      CGFloat v6 = v12;
    }
    if (v10 <= -1048576.0)
    {
      if (v10 == -1.79769313e308) {
        double v13 = 1.0;
      }
      else {
        double v13 = (v10 + 1048576.0) * -0.00390625;
      }
      objc_msgSend(-[NSArray firstObject](-[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews"), "firstObject"), "systemSpacingToSuperView:edge:baselineRelative:multiplier:", self, 2, (*(void *)&self->_containerFlags >> 42) & 1, v13);
      double v10 = v14;
    }
    if (v5 <= -1048576.0)
    {
      if (v5 == -1.79769313e308) {
        double v16 = 1.0;
      }
      else {
        double v16 = (v5 + 1048576.0) * -0.00390625;
      }
      id v15 = [(NUIContainerView *)self viewForFirstBaselineLayout];
      [v15 systemSpacingToSuperView:self edge:1 baselineRelative:(*(void *)&self->_containerFlags >> 42) & 1 multiplier:v16];
      double v5 = v17;
      if ((*((unsigned char *)&self->_containerFlags + 5) & 4) == 0)
      {
LABEL_21:
        if (v8 <= -1048576.0)
        {
          if (v8 == -1.79769313e308) {
            double v20 = 1.0;
          }
          else {
            double v20 = (v8 + 1048576.0) * -0.00390625;
          }
          id v19 = [(NUIContainerView *)self viewForLastBaselineLayout];
          [v19 systemSpacingToSuperView:self edge:4 baselineRelative:(*(void *)&self->_containerFlags >> 42) & 1 multiplier:v20];
          double v8 = v21;
          if ((*((unsigned char *)&self->_containerFlags + 5) & 4) == 0) {
            goto LABEL_29;
          }
        }
        else
        {
          if ((*((unsigned char *)&self->_containerFlags + 5) & 0x10) == 0)
          {
LABEL_29:
            self->_effectiveLayoutMargins.double top = v5;
            self->_effectiveLayoutMargins.double left = v6;
            self->_effectiveLayoutMargins.double bottom = v8;
            self->_effectiveLayoutMargins.double right = v10;
            *(void *)&self->_containerFlags |= 0x10000000000uLL;
            goto LABEL_30;
          }
          id v19 = [(NUIContainerView *)self viewForLastBaselineLayout];
        }
        [v19 effectiveBaselineOffsetFromBottom];
        double v8 = v8 - v22;
        goto LABEL_29;
      }
    }
    else
    {
      if ((*((unsigned char *)&self->_containerFlags + 5) & 0x10) == 0) {
        goto LABEL_21;
      }
      id v15 = [(NUIContainerView *)self viewForFirstBaselineLayout];
    }
    [v15 effectiveFirstBaselineOffsetFromTop];
    double v5 = v5 - v18;
    goto LABEL_21;
  }
LABEL_30:
  double top = self->_effectiveLayoutMargins.top;
  double left = self->_effectiveLayoutMargins.left;
  double bottom = self->_effectiveLayoutMargins.bottom;
  double right = self->_effectiveLayoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)mustRestartMeasurement
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(void *)&containerFlags & 0x200000000000) != 0) {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags & 0xFFFFDFFFFFFFFFFFLL);
  }
  return (*(unint64_t *)&containerFlags >> 45) & 1;
}

- (id)viewForLastBaselineLayout
{
  id result = self->_lastBaselineView;
  if (!result)
  {
    id result = [(NUIContainerView *)self calculateViewForLastBaselineLayout];
    self->_lastBaselineView = (UIView *)result;
  }
  return result;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    double v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"NUIContainerViewDebug");
    debugBoundingBoxes = [v3 BOOLValue];
    _NUIEnableAPIMisuseAssertions = (int)[v3 intValue] > 1;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"hidden"])
  {
    double v11 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
    if ((objc_msgSend(v11, "isEqual:", objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8])) & 1) == 0)
    {
      $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
      if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(void *)&containerFlags & 0x4000000000) == 0)
      {
        self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags | 0x4000000000);
        [(NUIContainerView *)self ensureArrangedSubviewsAreValid];
        *(void *)&self->_containerFlags &= ~0x4000000000uLL;
      }
      if ([(NSMutableArray *)self->_arrangedSubviews containsObject:a4])
      {
        [(NUIContainerView *)self visibilityDidChangeForArrangedSubview:a4];
      }
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NUIContainerView;
    [(NUIContainerView *)&v14 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerView;
  [(NUIContainerView *)&v3 layoutMarginsDidChange];
  if ((*((unsigned char *)&self->_containerFlags + 5) & 0x18) != 0) {
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (void)setAlignment:(int64_t)a3 forView:(id)a4 inAxis:(int64_t)a5
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(void *)&containerFlags & 0x4000000000) == 0)
  {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags | 0x4000000000);
    [(NUIContainerView *)self ensureArrangedSubviewsAreValid];
    *(void *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  double left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_18;
  }
  p_pair1 = (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    unint64_t v13 = *((void *)left + 4);
    BOOL v14 = v13 >= (unint64_t)a4;
    if (v13 >= (unint64_t)a4) {
      id v15 = (char **)left;
    }
    else {
      id v15 = (char **)(left + 8);
    }
    if (v14) {
      p_pair1 = (NUIContainerView *)left;
    }
    double left = *v15;
  }
  while (*v15);
  if (p_pair1 != (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_
    && (unint64_t cachedTraitCollection = (unint64_t)p_pair1->super._cachedTraitCollection,
        p_unint64_t cachedTraitCollection = &p_pair1->super._cachedTraitCollection,
        cachedTraitCollection <= (unint64_t)a4))
  {
    double v18 = (char *)p_cachedTraitCollection + a5;
    uint64_t v20 = v18[56];
    id v19 = v18 + 56;
    if (v20 != a3)
    {
      *id v19 = a3;
      [(NUIContainerView *)self setNeedsInvalidation:4];
    }
  }
  else
  {
LABEL_18:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"View is not an arranged subviews %@.", a4 format];
  }
}

- (void)setArrangedSubviewRemovalPolicy:(int64_t)a3
{
  self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&self->_containerFlags & 0xFFFFFFE3FFFFFFFFLL | ((unint64_t)(a3 & 3) << 34) | 0x1000000000);
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  BOOL v3 = a3;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if (((((*(void *)&containerFlags & 0x40000000000) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 0x40000000000;
    if (!v3) {
      uint64_t v6 = 0;
    }
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags & 0xFFFFFBFFFFFFFFFFLL | v6);
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (void)setDelegate:(id)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_delegate != a3)
  {
    objc_storeWeak((id *)&self->_delegate, a3);
    char v5 = objc_opt_respondsToSelector();
    uint64_t v6 = 0x400000000000;
    if ((v5 & 1) == 0) {
      uint64_t v6 = 0;
    }
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&self->_containerFlags & 0xFFFFBFFFFFFFFFFFLL | v6);
    char v7 = objc_opt_respondsToSelector();
    uint64_t v8 = 0x800000000000;
    if ((v7 & 1) == 0) {
      uint64_t v8 = 0;
    }
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&self->_containerFlags & 0xFFFF7FFFFFFFFFFFLL | v8);
    char v9 = objc_opt_respondsToSelector();
    uint64_t v10 = 0x1000000000000;
    if ((v9 & 1) == 0) {
      uint64_t v10 = 0;
    }
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&self->_containerFlags & 0xFFFEFFFFFFFFFFFFLL | v10);
    char v11 = objc_opt_respondsToSelector();
    uint64_t v12 = 0x2000000000000;
    if ((v11 & 1) == 0) {
      uint64_t v12 = 0;
    }
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&self->_containerFlags & 0xFFFDFFFFFFFFFFFFLL | v12);
    char v13 = objc_opt_respondsToSelector();
    uint64_t v14 = 0x4000000000000;
    if ((v13 & 1) == 0) {
      uint64_t v14 = 0;
    }
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&self->_containerFlags & 0xFFFBFFFFFFFFFFFFLL | v14);
    [(NUIContainerView *)self setNeedsInvalidation:4];
  }
}

- (void)visibilityDidChangeForArrangedSubview:(id)a3
{
  if ([a3 isHidden]) {
    __int16 v5 = 1;
  }
  else {
    __int16 v5 = -1;
  }
  *(_WORD *)&self->_int containerFlags = *(_DWORD *)&self->_containerFlags + v5;

  self->_visibleArrangedSubviews = 0;
  [(NUIContainerView *)self setNeedsInvalidation:4];
  if (_NUIEnableAPIMisuseAssertions) {
    goto LABEL_8;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_8:
    int containerFlags = (int)self->_containerFlags;
    if (containerFlags != -[NUIContainerView _countHiddenArrangesSubviews](self))
    {
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
      if (v7) {
        uint64_t v8 = (__CFString *)v7;
      }
      else {
        uint64_t v8 = @"<Unknown File>";
      }
      char v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:v8 lineNumber:1399 description:@"Hidden count mismatch"];
    }
  }
}

- (void)invalidateIntrinsicContentSize
{
}

- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3
{
  if ((*((unsigned char *)&self->_containerFlags + 5) & 0x10) == 0) {
    return 0;
  }
  if ([(NUIContainerView *)self viewForFirstBaselineLayout] == a3) {
    return 1;
  }
  return [(NUIContainerView *)self viewForLastBaselineLayout] == a3;
}

- (NUIContainerView)initWithCoder:(id)a3
{
  __int16 v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v5 raise:v6, @"-%@ %@ not yet supported.", v8, NSStringFromSelector(a2) format];
  double v9 = *MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  return -[NUIContainerView initWithFrame:](self, "initWithFrame:", v9, v10, v11, v12);
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_storeWeak((id *)&self->_delegate, 0);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  arrangedSubviews = self->_arrangedSubviews;
  uint64_t v4 = [(NSMutableArray *)arrangedSubviews countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(arrangedSubviews);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) removeObserver:self forKeyPath:@"hidden"];
      }
      uint64_t v5 = [(NSMutableArray *)arrangedSubviews countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  self->_arrangedSubviews = 0;
  self->_visibleArrangedSubviews = 0;
  self->_debugBoundingBoxLayers.var0 = self->_debugBoundingBoxLayers.__begin_;
  v8.receiver = self;
  v8.super_class = (Class)NUIContainerView;
  [(NUIContainerView *)&v8 dealloc];
}

- (uint64_t)_verifyInternalConsistencyWarningOnly:(uint64_t)result
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[MEMORY[0x1E4F28BD0] setWithArray:*(void *)(result + 448)];
    uint64_t v5 = (void *)[MEMORY[0x1E4F28E78] string];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v4);
          }
          long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v10 superview] == v3)
          {
            if ((unint64_t)[v4 countForObject:v10] >= 2) {
              [v5 appendFormat:@"View is represented %lu times: %@\n", objc_msgSend(v4, "countForObject:", v10), v10];
            }
          }
          else
          {
            [v5 appendFormat:@"View is not a subview: %@\n", v10, v12];
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    if (![v5 length]) {
      return 1;
    }
    if (!a2)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@", v5 format];
      return 0;
    }
    if (_NUILog::onceToken != -1) {
      dispatch_once(&_NUILog::onceToken, &__block_literal_global_2);
    }
    long long v11 = _NUILog::log;
    id result = os_log_type_enabled((os_log_t)_NUILog::log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      -[UIView(NUIPrivate) calculateLayoutSizeFittingSize:]((uint64_t)v5, v11);
      return 0;
    }
  }
  return result;
}

- (int64_t)arrangedSubviewRemovalPolicy
{
  return (*(void *)&self->_containerFlags >> 34) & 3;
}

- (void)setArrangedSubviewAdditionPolicy:(int64_t)a3
{
  self->_int containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&self->_containerFlags & 0xFFFFFFDFFFFFFFFFLL | ((unint64_t)(a3 & 1) << 37));
}

- (int64_t)arrangedSubviewAdditionPolicy
{
  return (*(void *)&self->_containerFlags >> 37) & 1;
}

- (uint64_t)_countHiddenArrangesSubviews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a1[67];
  if ((v2 & 0xF000000) != 0 && (v2 & 0x4000000000) == 0)
  {
    a1[67] = v2 | 0x4000000000;
    [a1 ensureArrangedSubviewsAreValid];
    a1[67] &= ~0x4000000000uLL;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = (void *)a1[56];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  LODWORD(v7) = 0;
  uint64_t v8 = *(void *)v12;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v7 = v7 + [*(id *)(*((void *)&v11 + 1) + 8 * i) isHidden];
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v6);
  return v7;
}

- (void)willRemoveSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUIContainerView;
  -[NUIContainerView willRemoveSubview:](&v5, sel_willRemoveSubview_);
  if (self->_arrangedSubviews) {
    [(NUIContainerView *)self removeArrangedSubview:a3];
  }
}

- (void)removeArrangedSubview:(id)a3
{
  id v15 = a3;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  uint64_t v6 = [(NSMutableArray *)self->_arrangedSubviews indexOfObject:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    [a3 removeObserver:self forKeyPath:@"hidden"];
    [(NSMutableArray *)self->_arrangedSubviews removeObjectAtIndex:v7];
    std::__tree<UIView *>::__erase_unique<UIView *>((uint64_t)&self->_arrangedSubviewInfo, (unint64_t *)&v15);
    if ((*((unsigned char *)&self->_containerFlags + 3) & 0xF) != 0 && [v15 _isContainerView]) {
      -[NUIContainerView endBatchUpdates]((uint64_t)v15);
    }
    [(NUIContainerView *)self didRemoveArrangedSubview:v15 atIndex:v7];
    if ([v15 isHidden])
    {
      $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&self->_containerFlags & 0xFFFFFFFFFFFF0000 | (unsigned __int16)(*(void *)&self->_containerFlags - 1));
      self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = containerFlags;
    }
    else
    {

      self->_visibleArrangedSubviews = 0;
      [(NUIContainerView *)self setNeedsInvalidation:4];
      $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
    }
    uint64_t v9 = (*(unint64_t *)&containerFlags >> 34) & 3;
    if (v9 == 2)
    {
      [v15 removeFromSuperview];
    }
    else if (v9 == 1)
    {
      [v15 setHidden:1];
    }
  }
  if (_NUIEnableAPIMisuseAssertions) {
    goto LABEL_16;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_16:
    int v10 = (int)self->_containerFlags;
    if (v10 != -[NUIContainerView _countHiddenArrangesSubviews](self))
    {
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
      if (v11) {
        long long v12 = (__CFString *)v11;
      }
      else {
        long long v12 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 572, @"Hidden count mismatch");
    }
  }
  if (_NUIEnableAPIMisuseAssertions) {
    goto LABEL_21;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_21:
    if ([(NSMutableArray *)self->_arrangedSubviews count] != self->_arrangedSubviewInfo.__tree_.__pair3_.__value_)
    {
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
      if (v13) {
        long long v14 = (__CFString *)v13;
      }
      else {
        long long v14 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 573, @"Info count mismatch");
    }
  }
}

- (void)replaceArrangedSubviewAtIndex:(unint64_t)a3 withView:(id)a4
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (_NUIEnableAPIMisuseAssertions)
  {
    if (a4)
    {
LABEL_11:
      if ([(NSMutableArray *)self->_arrangedSubviews count] <= a3)
      {
        uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
        if (v13) {
          long long v14 = (__CFString *)v13;
        }
        else {
          long long v14 = @"<Unknown File>";
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 635, @"Invalid parameter not satisfying: %@", @"index < _arrangedSubviews.count");
      }
      goto LABEL_12;
    }
    goto LABEL_45;
  }
  if (_NUIIsDebuggerAttached::onceToken == -1)
  {
    if (a4) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
    if (a4) {
      goto LABEL_7;
    }
  }
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_45:
    uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
    if (v19) {
      uint64_t v20 = (__CFString *)v19;
    }
    else {
      uint64_t v20 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v20, 634, @"Invalid parameter not satisfying: %@", @"newView != nil");
  }
LABEL_7:
  if (_NUIEnableAPIMisuseAssertions) {
    goto LABEL_11;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  if (_NUIIsDebuggerAttached::isDebugged) {
    goto LABEL_11;
  }
LABEL_12:
  id v8 = (id)[(NSMutableArray *)self->_arrangedSubviews objectAtIndex:a3];
  id v22 = v8;
  if (v8 != a4)
  {
    uint64_t v9 = v8;
    -[NUIContainerView _addAsSubviewIfNeeded:]((uint64_t)self, a4);
    [v9 removeObserver:self forKeyPath:@"hidden"];
    [a4 addObserver:self forKeyPath:@"hidden" options:3 context:0];
    [(NSMutableArray *)self->_arrangedSubviews replaceObjectAtIndex:a3 withObject:a4];
    std::__tree<UIView *>::__erase_unique<UIView *>((uint64_t)&self->_arrangedSubviewInfo, (unint64_t *)&v22);
    [(NUIContainerView *)self didRemoveArrangedSubview:v22 atIndex:a3];
    id v21 = a4;
    double v23 = &v21;
    std::__tree<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::__map_value_compare<UIView *,std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>>>::__emplace_unique_key_args<UIView *,std::piecewise_construct_t const&,std::tuple<UIView * const&>,std::tuple<>>((uint64_t **)&self->_arrangedSubviewInfo, (unint64_t *)&v21, (uint64_t)&std::piecewise_construct, &v23);
    [(NUIContainerView *)self didInsertArrangedSubview:a4 atIndex:a3];
    int v10 = [v22 isHidden];
    if (v10 != [a4 isHidden])
    {
      if ([a4 isHidden]) {
        __int16 v11 = 1;
      }
      else {
        __int16 v11 = -1;
      }
      *(_WORD *)&self->_int containerFlags = *(_DWORD *)&self->_containerFlags + v11;
    }
    if (![v22 isHidden] || (objc_msgSend(a4, "isHidden") & 1) == 0)
    {

      self->_visibleArrangedSubviews = 0;
      [(NUIContainerView *)self setNeedsInvalidation:4];
    }
  }
  if (_NUIEnableAPIMisuseAssertions) {
    goto LABEL_25;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_25:
    int containerFlags = (int)self->_containerFlags;
    if (containerFlags != -[NUIContainerView _countHiddenArrangesSubviews](self))
    {
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
      if (v15) {
        uint64_t v16 = (__CFString *)v15;
      }
      else {
        uint64_t v16 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 659, @"Hidden count mismatch");
    }
  }
  if (_NUIEnableAPIMisuseAssertions) {
    goto LABEL_30;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_30:
    if ([(NSMutableArray *)self->_arrangedSubviews count] != self->_arrangedSubviewInfo.__tree_.__pair3_.__value_)
    {
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
      if (v17) {
        uint64_t v18 = (__CFString *)v17;
      }
      else {
        uint64_t v18 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 660, @"Info caount mismatch");
    }
  }
}

- (void)replaceArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
}

- (unint64_t)indexOfArrangedSubview:(id)a3
{
  if (_NUIEnableAPIMisuseAssertions)
  {
    if (!a3) {
      goto LABEL_10;
    }
  }
  else
  {
    if (_NUIIsDebuggerAttached::onceToken == -1)
    {
      if (a3) {
        goto LABEL_7;
      }
    }
    else
    {
      dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
      if (a3) {
        goto LABEL_7;
      }
    }
    if (_NUIIsDebuggerAttached::isDebugged)
    {
LABEL_10:
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm"];
      if (v8) {
        uint64_t v9 = (__CFString *)v8;
      }
      else {
        uint64_t v9 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 670, @"Invalid parameter not satisfying: %@", @"view != nil");
    }
  }
LABEL_7:
  arrangedSubviews = self->_arrangedSubviews;
  return [(NSMutableArray *)arrangedSubviews indexOfObject:a3];
}

- (BOOL)isLayoutMarginsRelativeArrangement
{
  return (*((unsigned __int8 *)&self->_containerFlags + 5) >> 3) & 1;
}

- (void)setBaselineRelativeLayoutMarginsForArrangement:(BOOL)a3
{
  BOOL v3 = a3;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if (((((*(void *)&containerFlags & 0x100000000000) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 0x100000000000;
    if (!v3) {
      uint64_t v6 = 0;
    }
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags & 0xFFFFEFFFFFFFFFFFLL | v6);
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (BOOL)hasBaselineRelativeLayoutMarginsForArrangement
{
  return (*((unsigned __int8 *)&self->_containerFlags + 5) >> 4) & 1;
}

- (CGPoint)positionAdjustmentOffsetForView:(id)a3
{
  double left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  uint64_t v4 = (double *)MEMORY[0x1E4F1DAD8];
  if (left)
  {
    p_pair1 = (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_;
    do
    {
      unint64_t v6 = *((void *)left + 4);
      BOOL v7 = v6 >= (unint64_t)a3;
      if (v6 >= (unint64_t)a3) {
        uint64_t v8 = (char **)left;
      }
      else {
        uint64_t v8 = (char **)(left + 8);
      }
      if (v7) {
        p_pair1 = (NUIContainerView *)left;
      }
      double left = *v8;
    }
    while (*v8);
    uint64_t v9 = (double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (p_pair1 != (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_)
    {
      BOOL v10 = p_pair1->super._cachedTraitCollection > a3;
      p_swiftAnimationInfo = (double *)&p_pair1->super._swiftAnimationInfo;
      p_traitChangeRegistrdouble y = (double *)&p_pair1->super._traitChangeRegistry;
      if (!v10)
      {
        uint64_t v4 = p_swiftAnimationInfo;
        uint64_t v9 = p_traitChangeRegistry;
      }
    }
  }
  else
  {
    uint64_t v9 = (double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v13 = *v9;
  double v14 = *v4;
  result.double y = v13;
  result.double x = v14;
  return result;
}

- (void)setPositionAdjustmentOffset:(CGPoint)a3 forView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(void *)&containerFlags & 0x4000000000) == 0)
  {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags | 0x4000000000);
    [(NUIContainerView *)self ensureArrangedSubviewsAreValid];
    *(void *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  double left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_18;
  }
  p_pair1 = &self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    unint64_t v12 = *((void *)left + 4);
    BOOL v13 = v12 >= (unint64_t)a4;
    if (v12 >= (unint64_t)a4) {
      double v14 = (char **)left;
    }
    else {
      double v14 = (char **)(left + 8);
    }
    if (v13) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *)left;
    }
    double left = *v14;
  }
  while (*v14);
  if (p_pair1 != &self->_arrangedSubviewInfo.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a4)
  {
    if (*(double *)&p_pair1[5].__value_.__left_ != x || *(double *)&p_pair1[6].__value_.__left_ != y)
    {
      *(double *)&p_pair1[5].__value_.__left_ = x;
      *(double *)&p_pair1[6].__value_.__left_ = y;
      [(NUIContainerView *)self setNeedsInvalidation:1];
    }
  }
  else
  {
LABEL_18:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"View is not an arranged subviews %@.", a4 format];
  }
}

- (void)setMinimumSpacing:(NSDirectionalEdgeInsets)a3 adjacentToView:(id)a4
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(void *)&containerFlags & 0x4000000000) == 0)
  {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags | 0x4000000000);
    [(NUIContainerView *)self ensureArrangedSubviewsAreValid];
    *(void *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  double left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_18;
  }
  p_pair1 = &self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    unint64_t v14 = *((void *)left + 4);
    BOOL v15 = v14 >= (unint64_t)a4;
    if (v14 >= (unint64_t)a4) {
      uint64_t v16 = (char **)left;
    }
    else {
      uint64_t v16 = (char **)(left + 8);
    }
    if (v15) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *)left;
    }
    double left = *v16;
  }
  while (*v16);
  if (p_pair1 != &self->_arrangedSubviewInfo.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a4)
  {
    double v17 = *(double *)&p_pair1[7].__value_.__left_;
    if (*(double *)&p_pair1[8].__value_.__left_ != leading
      || v17 != top
      || *(double *)&p_pair1[10].__value_.__left_ != trailing
      || *(double *)&p_pair1[9].__value_.__left_ != bottom)
    {
      *(double *)&p_pair1[7].__value_.__left_ = top;
      *(double *)&p_pair1[8].__value_.__left_ = leading;
      *(double *)&p_pair1[9].__value_.__left_ = bottom;
      *(double *)&p_pair1[10].__value_.__left_ = trailing;
      -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2, v17);
    }
  }
  else
  {
LABEL_18:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"View is not an arranged subviews %@.", a4 format];
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  if (a5 == 1000.0) {
    uint64_t v5 = (a4 == 1000.0) | 2;
  }
  else {
    uint64_t v5 = a4 == 1000.0;
  }
  -[NUIContainerView _layoutSizeThatFits:fixedAxes:](self, "_layoutSizeThatFits:fixedAxes:", v5, a3.width, a3.height);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  id result = self->_firstBaselineView;
  if (!result)
  {
    id result = [(NUIContainerView *)self calculateViewForFirstBaselineLayout];
    self->_firstBaselineView = (UIView *)result;
  }
  return result;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)NUIContainerView;
  id v3 = [(NUIContainerView *)&v11 description];
  uint64_t v4 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);
  visibleArrangedSubviews = self->_visibleArrangedSubviews;
  double v6 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v7 = [(NSMutableArray *)self->_arrangedSubviews count];
  if (visibleArrangedSubviews) {
    uint64_t v8 = objc_msgSend(v6, "stringWithFormat:", @"arrangedSubviews = %lu[%lu];",
  }
           v7,
           [(NSArray *)self->_visibleArrangedSubviews count]);
  else {
    uint64_t v8 = objc_msgSend(v6, "stringWithFormat:", @"arrangedSubviews = %lu[-];", v7, v10);
  }
  return (id)[v4 stringByAppendingFormat:@" %@>", v8];
}

- (id)debugDescription
{
  id v3 = [(NUIContainerView *)self description];
  return (id)[(id)objc_msgSend(v3 substringToIndex:objc_msgSend(v3, "length") - 1), "stringByAppendingFormat:", @" %@>", -[NUIContainerView arrangedDebugDescription](self, "arrangedDebugDescription")];
}

- (BOOL)shouldCancelMeasurementForCompressionInAxis:(int64_t)a3
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(void *)&containerFlags & 0x2000000000000) != 0)
  {
    if (!(*(void *)&self->_containerFlags & 0xC0000000 | a3)
      || (LOBYTE(v4) = 0, a3 == 1) && (*(_DWORD *)&containerFlags & 0x80000000) == 0)
    {
      unint64_t v7 = *(unint64_t *)&containerFlags >> 28;
      self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags & 0xFFFFFFFFCFFFFFFFLL | 0x10000000);
      int v4 = [(NUIContainerViewDelegate *)[(NUIContainerView *)self delegate] containerView:self shouldRestartMeasurementDueToCompressionInAxis:a3 forReason:((*(unint64_t *)&containerFlags >> 28) & 3) == 3];
      $E75A57F832BD0FF3084D204B7E402DB5 v8 = self->_containerFlags;
      unint64_t v9 = *(void *)&v8 & 0xFFFFDFFFCFFFFFFFLL | ((v7 & 3) << 28);
      BOOL v10 = (v4 | (*(unint64_t *)&v8 >> 45) & 1) == 0;
      uint64_t v11 = 0x200000000000;
      if (v10) {
        uint64_t v11 = 0;
      }
      $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(v11 | v9);
    }
    unint64_t v12 = *(_DWORD *)&containerFlags >> 30;
    unint64_t v13 = 1;
    if (a3) {
      unint64_t v13 = 2;
    }
    if (v12 <= v13) {
      unint64_t v12 = v13;
    }
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags & 0xFFFFFFFF3FFFFFFFLL | (v12 << 30));
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  p_debugBoundingBoxLayers = &self->_debugBoundingBoxLayers;
  begin = self->_debugBoundingBoxLayers.__begin_;
  if (begin)
  {
    p_debugBoundingBoxLayers->var0 = begin;
    operator delete(begin);
  }
  double left = self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  std::__tree<UIView *>::destroy((uint64_t)&self->_arrangedSubviewInfo, left);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  [(UIView *)self effectiveFirstBaselineOffsetFromContentTop];
  double v5 = v4;
  [(UIView *)self effectiveBaselineOffsetFromContentBottom];
  double v7 = 2.22507386e-308;
  if ((NUIContainerView *)self->_firstBaselineView == self) {
    double v8 = 2.22507386e-308;
  }
  else {
    double v8 = v5;
  }
  if ((NUIContainerView *)self->_lastBaselineView != self) {
    double v7 = v6;
  }
  double v9 = v8;
  result.var1 = v7;
  result.var0 = v9;
  return result;
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  [v4 raise:v5, @"-[%@ %@] not implemented.", v7, NSStringFromSelector(a2) format];
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (id)calculateViewForFirstBaselineLayout
{
  id result = [(NSArray *)[(NUIContainerView *)self visibleArrangedSubviews] firstObject];
  if (!result) {
    return self;
  }
  return result;
}

- (id)calculateViewForLastBaselineLayout
{
  id result = [(NSArray *)[(NUIContainerView *)self visibleArrangedSubviews] lastObject];
  if (!result) {
    return self;
  }
  return result;
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  double v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  [v4 raise:v5, @"-[%@ %@] not implemented.", v7, NSStringFromSelector(a2) format];
}

- (BOOL)isInBatchUpdate
{
  return (*((unsigned char *)&self->_containerFlags + 3) & 0xF) != 0;
}

- (void)assertNotInLayoutPass:(BOOL)a3
{
}

+ (BOOL)enableAPIMisuseAssertions
{
  return _NUIEnableAPIMisuseAssertions;
}

+ (void)setEnableAPIMisuseAssertions:(BOOL)a3
{
  _NUIEnableAPIMisuseAssertions = a3;
}

- (BOOL)isDebugBoundingBoxesEnabled
{
  return (*((unsigned __int8 *)&self->_containerFlags + 5) >> 1) & 1;
}

- (id)debugDictionary
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:objc_opt_class() forKey:@"class"];
  double v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v5 = [(NUIContainerView *)self visibleArrangedSubviews];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addObject:", -[NUIContainerView debugDictionaryForVisibleArrangedSubview:](self, "debugDictionaryForVisibleArrangedSubview:", *(void *)(*((void *)&v39 + 1) + 8 * i)));
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v6);
  }
  [v3 setObject:v4 forKeyedSubscript:@"visibleArrangedSubviews"];
  double v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  BOOL v10 = [(NUIContainerView *)self arrangedSubviews];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v10);
        }
        unint64_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        if ([v14 _wantsConstraintBasedLayout]) {
          [v9 addObject:v14];
        }
      }
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v11);
  }
  if ([v9 count]) {
    [v3 setObject:v9 forKeyedSubscript:@"arrangedSubviewsWantingAutolayout"];
  }
  id v15 = [(UIView *)self debugSizeCacheDict];
  if ([v15 count]) {
    [v3 setObject:v15 forKeyedSubscript:@"cachedSizes"];
  }
  if ((*((unsigned char *)&self->_containerFlags + 5) & 0x18) != 0)
  {
    [(NUIContainerView *)self layoutMargins];
    v34[0] = v16;
    v34[1] = v17;
    v34[2] = v18;
    v34[3] = v19;
    uint64_t v20 = [MEMORY[0x1E4F29238] value:v34 withObjCType:"{UIEdgeInsets=dddd}"];
    if ((*(void *)&self->_containerFlags & 0x100000000000) != 0) {
      id v21 = @"baselineLayoutMargins";
    }
    else {
      id v21 = @"layoutMargins";
    }
    [v3 setObject:v20 forKeyedSubscript:v21];
  }
  if ([(NUIContainerView *)self delegate])
  {
    id v22 = (void *)MEMORY[0x1E4F1CA60];
    v45[0] = @"delegate";
    double v23 = [(NUIContainerView *)self delegate];
    v45[1] = @"respondsTo";
    v46[0] = v23;
    id v24 = [(NUIContainerView *)self debugSetDelegateRespondsToSelectors];
    uint64_t v44 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
    v46[1] = objc_msgSend(v24, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v44, 1));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v22, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v46, v45, 2)), @"delegate");
  }
  uint64_t v25 = *((unsigned char *)&self->_containerFlags + 3) & 0xF;
  if ((*((unsigned char *)&self->_containerFlags + 3) & 0xF) != 0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v25), @"batchDepth");
  }
  id v26 = [(NUIContainerView *)self debugSetEnabledFlags];
  if ([v26 count])
  {
    uint64_t v43 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v26, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v43, 1)), @"flags");
  }
  firstBaselineView = (NUIContainerView *)self->_firstBaselineView;
  if (firstBaselineView)
  {
    if (firstBaselineView == self) {
      CGFloat v28 = (UIView *)@"self";
    }
    else {
      CGFloat v28 = self->_firstBaselineView;
    }
    [v3 setObject:v28 forKeyedSubscript:@"cachedFirstBaselineView"];
  }
  else
  {
    unint64_t v29 = [(NUIContainerView *)self calculateViewForFirstBaselineLayout];
    if (v29 != self) {
      [v3 setObject:v29 forKeyedSubscript:@"firstBaselineView"];
    }
  }
  lastBaselineView = (NUIContainerView *)self->_lastBaselineView;
  if (lastBaselineView)
  {
    if (lastBaselineView == self) {
      CGFloat v31 = (UIView *)@"self";
    }
    else {
      CGFloat v31 = self->_lastBaselineView;
    }
    [v3 setObject:v31 forKeyedSubscript:@"cachedLastBaselineView"];
  }
  else
  {
    double v32 = [(NUIContainerView *)self calculateViewForLastBaselineLayout];
    if (v32 != self) {
      [v3 setObject:v32 forKeyedSubscript:@"lastBaselineView"];
    }
  }
  -[NUIContainerView _verifyInternalConsistencyWarningOnly:]((uint64_t)self, 0);
  return (id)[v3 copy];
}

- (id)arrangedDebugDescription
{
  id v3 = (void *)[MEMORY[0x1E4F28E78] string];
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(void *)&containerFlags & 0x180000000000) != 0)
  {
    [(NUIContainerView *)self layoutMargins];
    [v3 appendFormat:@" layoutMarginsRelative = {%f, %f, %f, %f};", v5, v6, v7, v8];
    $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  }
  if ((*(void *)&containerFlags & 0x40000000000) != 0) {
    [v3 appendString:@" baselineRelative = YES;"];
  }
  return v3;
}

+ (id)debugVersion
{
  return @"AppSupportUI-42.2 (UIKit)";
}

- (id)debugDictionaryForVisibleArrangedSubview:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:a3 forKey:@"view"];
  NSUInteger v6 = [(NSArray *)[(NUIContainerView *)self arrangedSubviews] indexOfObject:a3];
  if (v6 != -[NSArray indexOfObject:](-[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews"), "indexOfObject:", a3))objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v6), @"index"); {
  uint64_t v7 = (void *)[a3 debugSizeCacheDict];
  }
  if ([v7 count]) {
    [v5 setObject:v7 forKeyedSubscript:@"cachedSizes"];
  }
  double v33 = v5;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(void *)&containerFlags & 0x4000000000) == 0)
  {
    self->_$E75A57F832BD0FF3084D204B7E402DB5 containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(void *)&containerFlags | 0x4000000000);
    [(NUIContainerView *)self ensureArrangedSubviewsAreValid];
    *(void *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  double left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_22;
  }
  p_pair1 = (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    unint64_t v12 = *((void *)left + 4);
    BOOL v13 = v12 >= (unint64_t)a3;
    if (v12 >= (unint64_t)a3) {
      unint64_t v14 = (char **)left;
    }
    else {
      unint64_t v14 = (char **)(left + 8);
    }
    if (v13) {
      p_pair1 = (NUIContainerView *)left;
    }
    double left = *v14;
  }
  while (*v14);
  if (p_pair1 == (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_
    || p_pair1->super._cachedTraitCollection > a3)
  {
LABEL_22:
    p_pair1 = (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_;
  }
  id v15 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v16 = 0;
  p_unint64_t cachedTraitCollection = &p_pair1->super._cachedTraitCollection;
  uint64_t v18 = @"horizonral";
  char v19 = 1;
  do
  {
    char v20 = v19;
    uint64_t v21 = *((char *)p_cachedTraitCollection + v16 + 56);
    if (v21 != -1)
    {
      if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
        dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_439);
      }
      uint64_t v22 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v21));
      if (!v22) {
        uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v21);
      }
      [v15 setObject:v22 forKeyedSubscript:v18];
    }
    char v19 = 0;
    uint64_t v18 = @"vertical";
    uint64_t v16 = 1;
  }
  while ((v20 & 1) != 0);
  if ([v15 count]) {
    [v33 setObject:v15 forKeyedSubscript:@"alignment"];
  }
  [(NUIContainerView *)self minimumSpacingAdjacentToView:a3];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  CGFloat v31 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (v24 < 1.79769313e308) {
    [v31 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&v24), @"top" forKeyedSubscript];
  }
  if (v26 < 1.79769313e308) {
    [v31 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&v26), @"leading" forKeyedSubscript];
  }
  if (v28 < 1.79769313e308) {
    [v31 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&v28), @"bottom" forKeyedSubscript];
  }
  if (v30 < 1.79769313e308) {
    [v31 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&v30), @"trailing" forKeyedSubscript];
  }
  if ([v31 count]) {
    [v33 setObject:v31 forKeyedSubscript:@"minimumSpacing"];
  }
  return v33;
}

- (id)debugSetDelegateRespondsToSelectors
{
  id v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(void *)&containerFlags & 0x400000000000) != 0)
  {
    [v3 addObject:NSStringFromSelector(sel_containerView_systemLayoutSizeFittingSize_forArrangedSubview_)];
    $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
    if ((*(void *)&containerFlags & 0x800000000000) == 0)
    {
LABEL_3:
      if ((*(void *)&containerFlags & 0x1000000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(void *)&containerFlags & 0x800000000000) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:NSStringFromSelector(sel_containerView_layoutFrameForArrangedSubview_withProposedFrame_)];
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(void *)&containerFlags & 0x1000000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&containerFlags & 0x2000000000000) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v3 addObject:NSStringFromSelector(sel_containerView_shouldRestartMeasurementDueToCompressionInAxis_forReason_)];
    if ((*(void *)&self->_containerFlags & 0x4000000000000) == 0) {
      return v3;
    }
    goto LABEL_6;
  }
LABEL_10:
  [v3 addObject:NSStringFromSelector(sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_)];
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(void *)&containerFlags & 0x2000000000000) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((*(void *)&containerFlags & 0x4000000000000) != 0) {
LABEL_6:
  }
    [v3 addObject:NSStringFromSelector(sel_containerViewDidLayoutArrangedSubviews_)];
  return v3;
}

- (id)debugSetEnabledFlags
{
  id v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  double v4 = v3;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  if ((*(void *)&containerFlags & 0x20000000000) != 0)
  {
    [v3 addObject:@"debugBoundingBoxes"];
    $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  }
  if ((*(void *)&containerFlags & 0x40000000000) != 0)
  {
    [v4 addObject:@"baselineRelative"];
    $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  }
  if ((int)(*(_DWORD *)&containerFlags << 8) >> 24 >= 1)
  {
    [v4 addObject:@"delayedInvalidation"];
    $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  }
  if ((*(_DWORD *)&containerFlags & 0x30000000) != 0)
  {
    [v4 addObject:@"inLayoutPass"];
    $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  }
  if ((*(_DWORD *)&containerFlags & 0xC0000000) != 0)
  {
    [v4 addObject:@"inMeasurementPass"];
    $E75A57F832BD0FF3084D204B7E402DB5 containerFlags = self->_containerFlags;
  }
  if ((*(void *)&containerFlags & 0x200000000000) != 0) {
    [v4 addObject:@"mustRestartMeasurement"];
  }
  return v4;
}

@end