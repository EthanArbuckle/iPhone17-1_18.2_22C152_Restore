@interface CEKWheelScrubberView
- ($F24F406B2B787EFB06265DBA3D28CBD5)gradientInsets;
- (BOOL)_isDirectionHorizontal;
- (BOOL)_isOrderReverse;
- (BOOL)_shouldPerformFeedback;
- (BOOL)_showSelectedItemTextOverlay;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)isDragging;
- (BOOL)isSectioned;
- (BOOL)isSuspended;
- (BOOL)selectionLoupeVisible;
- (BOOL)useSelectionLoupeShadow;
- (CEKEdgeGradientView)_edgeGradientView;
- (CEKSelectionFeedbackGenerator)_selectionFeedbackGenerator;
- (CEKWheelScrubberCollectionViewLayout)_collectionViewLayout;
- (CEKWheelScrubberView)initWithFrame:(CGRect)a3;
- (CEKWheelScrubberViewDelegate)delegate;
- (CGPoint)_contentOffsetForItemIndex:(int64_t)a3;
- (CGRect)_centerDotIndicatorFrameForCollectionViewAlignmentRect:(CGRect)a3;
- (CGRect)_centeredCellFrameForCollectionViewAlignmentRect:(CGRect)a3;
- (CGRect)_collectionViewAlignmentRectForBounds:(CGRect)a3;
- (CGRect)centeredThumbnailContentFrame;
- (CGSize)_defaultItemSize;
- (CGSize)thumbnailSize;
- (NSIndexSet)customThumbailHiddenIndices;
- (NSString)selectionText;
- (UICollectionView)_collectionView;
- (UIColor)selectedThumbnailBorderColor;
- (UIEdgeInsets)thumbnailEdgeInsets;
- (UILabel)_selectedItemTextOverlay;
- (UITapGestureRecognizer)_tapGestureRecognizer;
- (UIView)_centerDotIndicatorView;
- (UIView)_collectionViewSnapshot;
- (UIView)_selectedItemLoupe;
- (UIView)customCenteredThumbnailOverlayView;
- (double)_alphaForVisibility:(int64_t)a3;
- (double)_contentOffsetAmountForItemIndex:(int64_t)a3;
- (double)_contentOffsetIgnoringSectionHeaders:(double)a3;
- (double)_defaultItemLength;
- (double)_fractionalItemOffsetForContentOffset:(CGPoint)a3;
- (double)_fractionalItemOffsetForContentOffsetAmount:(double)a3;
- (double)desiredThumbnailCornerRadius;
- (double)selectedThumbnailBorderWidth;
- (double)selectionDotCenterTopSpacing;
- (double)thumbnailCornerRadius;
- (double)thumbnailSpacing;
- (id)cellOverlayAtIndex:(unint64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)newCenterDotIndicatorView;
- (id)selectedCellOverlay;
- (int64_t)_decelerationTargetIndex;
- (int64_t)_itemIndexUsingHysteresisForScrollingToContentOffset:(CGPoint)a3;
- (int64_t)_nominalItemIndexForFractionalItemOffset:(double)a3;
- (int64_t)cellOverlayMode;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)cornerStyle;
- (int64_t)customThumbnailVisibility;
- (int64_t)dotIndicatorBehavior;
- (int64_t)dotPlacement;
- (int64_t)layoutDirection;
- (int64_t)layoutOrder;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)selectionLoupeVisibility;
- (unint64_t)_outermostCornerMaskForItemIndex:(int64_t)a3;
- (unint64_t)defaultIndex;
- (unint64_t)globalIndexForIndexPath:(id)a3;
- (unint64_t)itemCount;
- (unint64_t)markedIndex;
- (unint64_t)numberOfSectionsBeforeItemIndex:(unint64_t)a3;
- (unint64_t)selectedIndex;
- (unint64_t)totalNumberOfItems;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)_performFeedback;
- (void)_prepareFeedback;
- (void)_scrollToIndex:(int64_t)a3 animated:(BOOL)a4 shouldOvershoot:(BOOL)a5;
- (void)_scrollViewDidInterruptDecelerating:(id)a3;
- (void)_setCollectionViewSnapshot:(id)a3;
- (void)_setDragging:(BOOL)a3;
- (void)_setSelectedIndex:(unint64_t)a3 shouldNotify:(BOOL)a4 shouldSuppressHaptic:(BOOL)a5;
- (void)_setShowTextOverlay:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_switchToIndex:(int64_t)a3 shouldOvershoot:(BOOL)a4 shouldSuppressHaptic:(BOOL)a5;
- (void)_switchToItemAtIndexOffset:(int64_t)a3 shouldOvershoot:(BOOL)a4;
- (void)_updateCollectionViewForMarkedIndexAnimated:(BOOL)a3;
- (void)_updateCornerMaskForCell:(id)a3 withItemIndex:(int64_t)a4;
- (void)_updateCustomThumbnailAlphaAnimated:(BOOL)a3;
- (void)_updateLayoutForCell:(id)a3;
- (void)_updateLayoutForVisibleCells;
- (void)_updateOverlayVisibilityAnimated:(BOOL)a3;
- (void)_updateSelectionLoupeAlphaAnimated:(BOOL)a3;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCellOverlayMode:(int64_t)a3;
- (void)setCornerStyle:(int64_t)a3;
- (void)setCustomCenteredThumbnailOverlayView:(id)a3;
- (void)setCustomThumbailHiddenIndices:(id)a3;
- (void)setCustomThumbnailVisibility:(int64_t)a3;
- (void)setCustomThumbnailVisibility:(int64_t)a3 animated:(BOOL)a4;
- (void)setDefaultIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredThumbnailCornerRadius:(double)a3;
- (void)setDotIndicatorBehavior:(int64_t)a3;
- (void)setDotPlacement:(int64_t)a3;
- (void)setGradientInsets:(id)a3;
- (void)setItemCount:(unint64_t)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setLayoutOrder:(int64_t)a3;
- (void)setMarkedIndex:(unint64_t)a3;
- (void)setMarkedIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setOpaqueGradientsWithColor:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setSelectedThumbnailBorderColor:(id)a3;
- (void)setSelectedThumbnailBorderWidth:(double)a3;
- (void)setSelectionDotCenterTopSpacing:(double)a3;
- (void)setSelectionLoupeVisibility:(int64_t)a3;
- (void)setSelectionLoupeVisibility:(int64_t)a3 animated:(BOOL)a4;
- (void)setSelectionLoupeVisible:(BOOL)a3;
- (void)setSelectionLoupeVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelectionText:(id)a3;
- (void)setSelectionText:(id)a3 animated:(BOOL)a4;
- (void)setSuspended:(BOOL)a3;
- (void)setThumbnailEdgeInsets:(UIEdgeInsets)a3;
- (void)setThumbnailSize:(CGSize)a3;
- (void)setThumbnailSpacing:(double)a3;
- (void)setTransparentGradients;
- (void)setUseSelectionLoupeShadow:(BOOL)a3;
- (void)set_decelerationTargetIndex:(int64_t)a3;
- (void)set_edgeGradientView:(id)a3;
- (void)set_showSelectedItemTextOverlay:(BOOL)a3;
- (void)switchToNextItem;
- (void)switchToPreviousItem;
- (void)updateItems;
@end

@implementation CEKWheelScrubberView

- (CEKWheelScrubberView)initWithFrame:(CGRect)a3
{
  v42.receiver = self;
  v42.super_class = (Class)CEKWheelScrubberView;
  v3 = -[CEKWheelScrubberView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    p_thumbnailSize = &v3->_thumbnailSize;
    +[CEKWheelScrubberViewCell defaultContentSize];
    *(void *)&p_thumbnailSize->width = v6;
    v4->_thumbnailSize.height = v7;
    +[CEKWheelScrubberViewCell defaultContentInsetWidth];
    v4->_thumbnailSpacing = v8 + v8;
    v4->_selectedThumbnailBorderWidth = 3.0;
    uint64_t v9 = [MEMORY[0x1E4FB1618] whiteColor];
    selectedThumbnailBorderColor = v4->_selectedThumbnailBorderColor;
    v4->_selectedThumbnailBorderColor = (UIColor *)v9;

    v4->_dotIndicatorBehavior = 0;
    v4->_dotPlacement = 0;
    v11 = objc_alloc_init(CEKWheelScrubberCollectionViewLayout);
    collectionViewLayout = v4->__collectionViewLayout;
    v4->__collectionViewLayout = v11;

    [(CEKWheelScrubberCollectionViewLayout *)v4->__collectionViewLayout setWheelScrubberDelegate:v4];
    v4->_cornerStyle = 1;
    v4->_desiredThumbnailCornerRadius = 0.0;
    id v13 = objc_alloc(MEMORY[0x1E4FB1568]);
    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v18 = objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v4->__collectionViewLayout, *MEMORY[0x1E4F1DB28], v15, v16, v17);
    collectionView = v4->__collectionView;
    v4->__collectionView = (UICollectionView *)v18;

    [(UICollectionView *)v4->__collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CEKWheelScrubberViewCellReuseIdentifier"];
    [(UICollectionView *)v4->__collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"CEKWheelScrubberSectionHeaderReuseIdentifier"];
    [(UICollectionView *)v4->__collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)v4->__collectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)v4->__collectionView setDataSource:v4];
    [(UICollectionView *)v4->__collectionView setDelegate:v4];
    v20 = v4->__collectionView;
    v21 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v20 setBackgroundColor:v21];

    [(UICollectionView *)v4->__collectionView setAllowsSelection:1];
    [(UICollectionView *)v4->__collectionView setAllowsMultipleSelection:1];
    [(UICollectionView *)v4->__collectionView _setSupportsPointerDragScrolling:1];
    [(UICollectionView *)v4->__collectionView setContentInsetAdjustmentBehavior:2];
    double v22 = *MEMORY[0x1E4FB2EF0] * 0.625 + *MEMORY[0x1E4FB2EE8] * 0.375;
    [(UICollectionView *)v4->__collectionView setHorizontalScrollDecelerationFactor:v22];
    [(UICollectionView *)v4->__collectionView setVerticalScrollDecelerationFactor:v22];
    [(CEKWheelScrubberView *)v4 addSubview:v4->__collectionView];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v14, v15, v16, v17);
    selectedItemLoupe = v4->__selectedItemLoupe;
    v4->__selectedItemLoupe = (UIView *)v23;

    v25 = v4->__selectedItemLoupe;
    v26 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v25 setBackgroundColor:v26];

    v27 = [(UIView *)v4->__selectedItemLoupe layer];
    id v28 = [(CEKWheelScrubberView *)v4 selectedThumbnailBorderColor];
    objc_msgSend(v27, "setBorderColor:", objc_msgSend(v28, "CGColor"));

    v29 = [(UIView *)v4->__selectedItemLoupe layer];
    [(CEKWheelScrubberView *)v4 selectedThumbnailBorderWidth];
    objc_msgSend(v29, "setBorderWidth:");

    v30 = [(UIView *)v4->__selectedItemLoupe layer];
    [v30 setCornerRadius:8.0];

    [(UIView *)v4->__selectedItemLoupe setUserInteractionEnabled:0];
    [(CEKWheelScrubberView *)v4 addSubview:v4->__selectedItemLoupe];
    if (v4->_dotIndicatorBehavior == 1)
    {
      uint64_t v31 = [(CEKWheelScrubberView *)v4 newCenterDotIndicatorView];
      centerDotIndicatorView = v4->__centerDotIndicatorView;
      v4->__centerDotIndicatorView = (UIView *)v31;

      [(CEKWheelScrubberView *)v4 addSubview:v4->__centerDotIndicatorView];
    }
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__handleTapGestureRecognizer_];
    tapGestureRecognizer = v4->__tapGestureRecognizer;
    v4->__tapGestureRecognizer = (UITapGestureRecognizer *)v33;

    [(UICollectionView *)v4->__collectionView addGestureRecognizer:v4->__tapGestureRecognizer];
    v4->_gradientInsets.startInset = 0.0;
    v4->_gradientInsets.endInset = 0.0;
    v35 = -[CEKEdgeGradientView initWithFrame:]([CEKEdgeGradientView alloc], "initWithFrame:", v14, v15, v16, v17);
    edgeGradientView = v4->__edgeGradientView;
    v4->__edgeGradientView = v35;

    v37 = [MEMORY[0x1E4FB1618] blackColor];
    [(CEKWheelScrubberView *)v4 setOpaqueGradientsWithColor:v37];

    if (CEKHapticsAllowed())
    {
      v38 = objc_alloc_init(CEKSelectionFeedbackGenerator);
      selectionFeedbackGenerator = v4->__selectionFeedbackGenerator;
      v4->__selectionFeedbackGenerator = v38;
    }
    v4->_selectionLoupeVisibility = 0;
    v4->_useSelectionLoupeShadow = 0;
    v4->_customThumbnailVisibility = 0;
    v4->_cellOverlayMode = 0;
    [(CEKWheelScrubberView *)v4 _updateSelectionLoupeAlphaAnimated:0];
    [(CEKWheelScrubberView *)v4 _updateCustomThumbnailAlphaAnimated:0];
    v4->__decelerationTargetIndex = 0x7FFFFFFFFFFFFFFFLL;
    v40 = v4;
  }

  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CEKWheelScrubberView;
  [(CEKWheelScrubberView *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToWillBeginDragging = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillBeginScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidScroll = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillEndScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidEndDragging = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidEndScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidTapOnSelectedCellWithFrame = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidTapOnSelectedCell = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToNumberOfSections = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToNumberOfItemsInSection = objc_opt_respondsToSelector() & 1;
  }
}

- (void)_setDragging:(BOOL)a3
{
  if (self->_dragging != a3)
  {
    BOOL v3 = a3;
    self->_dragging = a3;
    [(CEKWheelScrubberView *)self _updateSelectionLoupeAlphaAnimated:1];
    [(CEKWheelScrubberView *)self _updateCustomThumbnailAlphaAnimated:1];
    if (v3)
    {
      if (!self->_delegateFlags.respondsToWillBeginDragging) {
        return;
      }
      id v5 = [(CEKWheelScrubberView *)self delegate];
      [v5 wheelScrubberViewWillBeginDragging:self];
    }
    else
    {
      if (!self->_delegateFlags.respondsToDidEndDragging) {
        return;
      }
      id v5 = [(CEKWheelScrubberView *)self delegate];
      [v5 wheelScrubberViewDidEndDragging:self];
    }
  }
}

- (void)updateItems
{
  BOOL v3 = [(CEKWheelScrubberView *)self _collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [(CEKWheelScrubberView *)self _collectionView];
      uint64_t v7 = [v6 numberOfItemsInSection:v5];

      if (v7)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:v5];
          v10 = [(CEKWheelScrubberView *)self _collectionView];
          v11 = [v10 cellForItemAtIndexPath:v9];

          if (v11)
          {
            unint64_t v12 = [(CEKWheelScrubberView *)self globalIndexForIndexPath:v9];
            id v13 = [(CEKWheelScrubberView *)self delegate];
            [v13 wheelScrubberView:self updateCell:v11 forItemAtIndex:v12];
          }
        }
      }
      ++v5;
      double v14 = [(CEKWheelScrubberView *)self _collectionView];
      unint64_t v15 = [v14 numberOfSections];
    }
    while (v5 < v15);
  }
}

- (void)setItemCount:(unint64_t)a3
{
  if (self->_itemCount != a3)
  {
    self->_itemCount = a3;
    uint64_t v4 = [(CEKWheelScrubberView *)self _collectionView];
    [v4 reloadData];

    [(CEKWheelScrubberView *)self _updateCollectionViewForMarkedIndexAnimated:0];
  }
}

- (void)setSelectedIndex:(unint64_t)a3
{
  [(CEKWheelScrubberView *)self _setSelectedIndex:a3 shouldNotify:0 shouldSuppressHaptic:1];
  [(CEKWheelScrubberView *)self _scrollToIndex:a3 animated:0 shouldOvershoot:0];
}

- (void)_setSelectedIndex:(unint64_t)a3 shouldNotify:(BOOL)a4 shouldSuppressHaptic:(BOOL)a5
{
  if (self->_selectedIndex != a3)
  {
    BOOL v6 = a4;
    self->_selectedIndex = a3;
    if ([(CEKWheelScrubberView *)self _decelerationTargetIndex] == a3) {
      [(CEKWheelScrubberView *)self set_decelerationTargetIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    [(CEKWheelScrubberView *)self _updateSelectionLoupeAlphaAnimated:v6];
    [(CEKWheelScrubberView *)self _updateCustomThumbnailAlphaAnimated:v6];
    [(CEKWheelScrubberView *)self _updateOverlayVisibilityAnimated:v6];
    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained wheelScrubberViewDidChangeSelectedIndex:self];

      [(CEKWheelScrubberView *)self sendActionsForControlEvents:4096];
    }
    if (!a5 && [(CEKWheelScrubberView *)self _shouldPerformFeedback])
    {
      [(CEKWheelScrubberView *)self _performFeedback];
      [(CEKWheelScrubberView *)self _prepareFeedback];
    }
  }
}

- (void)setMarkedIndex:(unint64_t)a3
{
}

- (void)setMarkedIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(CEKWheelScrubberView *)self dotIndicatorBehavior] && self->_markedIndex != a3)
  {
    self->_markedIndex = a3;
    [(CEKWheelScrubberView *)self _updateCollectionViewForMarkedIndexAnimated:v4];
  }
}

- (NSString)selectionText
{
  v2 = [(CEKWheelScrubberView *)self _selectedItemTextOverlay];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSelectionText:(id)a3
{
}

- (void)setSelectionText:(id)a3 animated:(BOOL)a4
{
  uint64_t v4 = a4;
  v46[3] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  uint64_t v7 = [(CEKWheelScrubberView *)self _selectedItemTextOverlay];
  uint64_t v8 = [v7 text];
  if (v6 | v8 && ([(id)v6 isEqualToString:v8] & 1) == 0)
  {
    uint64_t v9 = [(CEKWheelScrubberView *)self _selectedItemTextOverlay];

    if (!v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4FB1930]);
      v11 = (UILabel *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      selectedItemTextOverlay = self->__selectedItemTextOverlay;
      self->__selectedItemTextOverlay = v11;

      id v13 = [MEMORY[0x1E4FB1618] blackColor];
      [v13 colorWithAlphaComponent:0.5];
      double v14 = v33 = v4;

      unint64_t v15 = [(UILabel *)self->__selectedItemTextOverlay layer];
      id v32 = v14;
      objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v32, "CGColor"));

      double v16 = [(UILabel *)self->__selectedItemTextOverlay layer];
      [v16 setCornerRadius:8.0];

      [(UILabel *)self->__selectedItemTextOverlay setUserInteractionEnabled:0];
      [(UILabel *)self->__selectedItemTextOverlay setTextAlignment:1];
      double v17 = self->__selectedItemTextOverlay;
      uint64_t v18 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      [(UILabel *)v17 setTextColor:v18];

      self->__showSelectedItemTextOverlay = 0;
      uint64_t v31 = [MEMORY[0x1E4FB1798] systemFontOfSize:*MEMORY[0x1E4FB28A8] weight:13.0 design:*MEMORY[0x1E4FB29C8]];
      v30 = [v31 fontDescriptor];
      uint64_t v20 = *MEMORY[0x1E4FB2888];
      v44[0] = *MEMORY[0x1E4FB2898];
      uint64_t v19 = v44[0];
      v44[1] = v20;
      v45[0] = &unk_1F1A0F9E8;
      v45[1] = &unk_1F1A0FA00;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
      v46[0] = v21;
      v42[0] = v19;
      v42[1] = v20;
      v43[0] = &unk_1F1A0FA18;
      v43[1] = &unk_1F1A0FA30;
      double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
      v46[1] = v22;
      v40[0] = v19;
      v40[1] = v20;
      v41[0] = &unk_1F1A0FA18;
      v41[1] = &unk_1F1A0FA48;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
      v46[2] = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];

      uint64_t v38 = *MEMORY[0x1E4FB2868];
      v39 = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      v26 = [v30 fontDescriptorByAddingAttributes:v25];

      v27 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v26 size:13.0];

      [(UILabel *)self->__selectedItemTextOverlay setFont:v27];
      uint64_t v4 = v33;
    }
    id v28 = [v7 superview];

    if (v6)
    {
      if (!v28)
      {
        v29 = [(CEKWheelScrubberView *)self _selectedItemLoupe];
        [(CEKWheelScrubberView *)self insertSubview:v7 belowSubview:v29];
      }
      [v7 setText:v6];
      [(CEKWheelScrubberView *)self _setShowTextOverlay:1 animated:v4 completion:0];
    }
    else
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __50__CEKWheelScrubberView_setSelectionText_animated___block_invoke;
      v34[3] = &unk_1E63CD790;
      id v35 = v7;
      id v36 = 0;
      BOOL v37 = v28 != 0;
      [(CEKWheelScrubberView *)self _setShowTextOverlay:0 animated:v4 completion:v34];
    }
  }
}

uint64_t __50__CEKWheelScrubberView_setSelectionText_animated___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setText:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 removeFromSuperview];
  }
  return result;
}

- (void)_setShowTextOverlay:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v8 = (void (**)(id, uint64_t))a5;
  if ([(CEKWheelScrubberView *)self _showSelectedItemTextOverlay] == v6)
  {
    if (v8) {
      v8[2](v8, 1);
    }
  }
  else
  {
    [(CEKWheelScrubberView *)self set_showSelectedItemTextOverlay:v6];
    uint64_t v9 = [(CEKWheelScrubberView *)self _selectedItemTextOverlay];
    double v10 = 0.0;
    if (v6) {
      double v11 = 1.0;
    }
    else {
      double v11 = 0.0;
    }
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __64__CEKWheelScrubberView__setShowTextOverlay_animated_completion___block_invoke;
    uint64_t v19 = &unk_1E63CD5A0;
    id v12 = v9;
    id v20 = v12;
    double v21 = v11;
    id v13 = _Block_copy(&v16);
    double v14 = v13;
    if (v5)
    {
      if (v6) {
        double v15 = 0.0;
      }
      else {
        double v15 = 1.0;
      }
      if (!v6) {
        double v10 = 0.33;
      }
      objc_msgSend(v12, "setAlpha:", v15, v16, v17, v18, v19);
      [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v14 options:v8 animations:0.33 completion:v10];
    }
    else
    {
      (*((void (**)(void *))v13 + 2))(v13);
      if (v8) {
        v8[2](v8, 1);
      }
    }
  }
}

uint64_t __64__CEKWheelScrubberView__setShowTextOverlay_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)setCornerStyle:(int64_t)a3
{
  if (self->_cornerStyle != a3)
  {
    self->_cornerStyle = a3;
    id v3 = [(CEKWheelScrubberView *)self _collectionView];
    [v3 reloadData];
  }
}

- (void)setSelectionLoupeVisibility:(int64_t)a3
{
}

- (void)setSelectionLoupeVisibility:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_selectionLoupeVisibility != a3)
  {
    self->_selectionLoupeVisibility = a3;
    [(CEKWheelScrubberView *)self _updateSelectionLoupeAlphaAnimated:a4];
  }
}

- (BOOL)selectionLoupeVisible
{
  return [(CEKWheelScrubberView *)self selectionLoupeVisibility] == 0;
}

- (void)setSelectionLoupeVisible:(BOOL)a3
{
}

- (void)setSelectionLoupeVisible:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setUseSelectionLoupeShadow:(BOOL)a3
{
  BOOL v3 = a3;
  self->_useSelectionLoupeShadow = a3;
  BOOL v5 = [(UIView *)self->__selectedItemLoupe layer];
  BOOL v6 = v5;
  LODWORD(v7) = 1058642330;
  if (!v3) {
    *(float *)&double v7 = 0.0;
  }
  [v5 setShadowOpacity:v7];

  id v8 = [(UIView *)self->__selectedItemLoupe layer];
  objc_msgSend(v8, "setShadowOffset:", 0.0, 0.0);
}

- (void)setCustomCenteredThumbnailOverlayView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  customCenteredThumbnailOverlayView = self->_customCenteredThumbnailOverlayView;
  if (customCenteredThumbnailOverlayView != v5)
  {
    id v8 = v5;
    double v7 = [(UIView *)customCenteredThumbnailOverlayView superview];

    if (v7 == self) {
      [(UIView *)self->_customCenteredThumbnailOverlayView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_customCenteredThumbnailOverlayView, a3);
    [(CEKWheelScrubberView *)self addSubview:v8];
    customCenteredThumbnailOverlayView = (UIView *)[(CEKWheelScrubberView *)self setNeedsLayout];
    BOOL v5 = v8;
  }
  MEMORY[0x1F41817F8](customCenteredThumbnailOverlayView, v5);
}

- (void)setCustomThumbnailVisibility:(int64_t)a3
{
}

- (void)setCustomThumbnailVisibility:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_customThumbnailVisibility != a3)
  {
    self->_customThumbnailVisibility = a3;
    [(CEKWheelScrubberView *)self _updateCustomThumbnailAlphaAnimated:a4];
  }
}

- (void)setCustomThumbailHiddenIndices:(id)a3
{
  id v5 = a3;
  uint64_t customThumbailHiddenIndices = (uint64_t)self->_customThumbailHiddenIndices;
  if ((id)customThumbailHiddenIndices != v5)
  {
    id v7 = v5;
    uint64_t customThumbailHiddenIndices = [(id)customThumbailHiddenIndices isEqual:v5];
    id v5 = v7;
    if ((customThumbailHiddenIndices & 1) == 0)
    {
      objc_storeStrong((id *)&self->_customThumbailHiddenIndices, a3);
      uint64_t customThumbailHiddenIndices = [(CEKWheelScrubberView *)self _updateCustomThumbnailAlphaAnimated:0];
      id v5 = v7;
    }
  }
  MEMORY[0x1F41817F8](customThumbailHiddenIndices, v5);
}

- (void)_updateCollectionViewForMarkedIndexAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CEKWheelScrubberView *)self dotIndicatorBehavior])
  {
    unint64_t v5 = [(CEKWheelScrubberView *)self markedIndex];
    BOOL v6 = [(CEKWheelScrubberView *)self _collectionView];
    id v7 = [v6 indexPathsForSelectedItems];
    unint64_t v8 = [(CEKWheelScrubberView *)self itemCount];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 >= v8)
    {
      if (![(CEKWheelScrubberView *)self itemCount])
      {
        double v10 = 0;
LABEL_12:
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __68__CEKWheelScrubberView__updateCollectionViewForMarkedIndexAnimated___block_invoke;
        v13[3] = &unk_1E63CD7B8;
        id v14 = v10;
        id v15 = v6;
        BOOL v16 = v3;
        id v11 = v6;
        id v12 = v10;
        [v7 enumerateObjectsUsingBlock:v13];

        return;
      }
      unint64_t v9 = [(CEKWheelScrubberView *)self defaultIndex];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v5 = 0;
      }
      else {
        unint64_t v5 = v9;
      }
    }
    double v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v5 inSection:0];
    if (v10)
    {
      if (([v7 containsObject:v10] & 1) == 0) {
        [v6 selectItemAtIndexPath:v10 animated:v3 scrollPosition:0];
      }
    }
    goto LABEL_12;
  }
}

uint64_t __68__CEKWheelScrubberView__updateCollectionViewForMarkedIndexAnimated___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) != a2) {
    return [*(id *)(result + 40) deselectItemAtIndexPath:a2 animated:*(unsigned __int8 *)(result + 48)];
  }
  return result;
}

- (id)selectedCellOverlay
{
  return [(CEKWheelScrubberView *)self cellOverlayAtIndex:self->_selectedIndex];
}

- (id)cellOverlayAtIndex:(unint64_t)a3
{
  if (self->_cellOverlayMode == 1)
  {
    uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForItem:self->_selectedIndex inSection:0];
    unint64_t v5 = [(CEKWheelScrubberView *)self _collectionView];
    BOOL v6 = [v5 cellForItemAtIndexPath:v4];

    id v7 = [v6 overlayView];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (BOOL)isSectioned
{
  if (!self->_delegateFlags.respondsToNumberOfSections) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = (unint64_t)[WeakRetained wheelScrubberViewNumberOfSections:self] > 1;

  return v4;
}

- (unint64_t)totalNumberOfItems
{
  if (![(UICollectionView *)self->__collectionView numberOfSections]) {
    return 0;
  }
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  do
    v4 += [(UICollectionView *)self->__collectionView numberOfItemsInSection:v3++];
  while (v3 < [(UICollectionView *)self->__collectionView numberOfSections]);
  return v4;
}

- (unint64_t)globalIndexForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    do
      v6 += [(UICollectionView *)self->__collectionView numberOfItemsInSection:v5++];
    while (v5 < [v4 section]);
  }
  else
  {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [v4 row] + v6;

  return v7;
}

- (void)setTransparentGradients
{
  id v3 = [(CEKWheelScrubberView *)self _edgeGradientView];
  [v3 setEdgeGradientStyleMask];
  [(CEKWheelScrubberView *)self setMaskView:v3];
}

- (void)setOpaqueGradientsWithColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CEKWheelScrubberView *)self _edgeGradientView];
  [v5 setCustomEdgeGradientStyleWithColor:v4];

  [(CEKWheelScrubberView *)self setMaskView:0];
  [(CEKWheelScrubberView *)self addSubview:v5];
}

- (int64_t)layoutOrder
{
  v2 = [(CEKWheelScrubberView *)self _collectionViewLayout];
  int64_t v3 = [v2 layoutOrder];

  return v3;
}

- (void)setLayoutOrder:(int64_t)a3
{
  id v4 = [(CEKWheelScrubberView *)self _collectionViewLayout];
  [v4 setLayoutOrder:a3];
}

- (int64_t)layoutDirection
{
  v2 = [(CEKWheelScrubberView *)self _collectionViewLayout];
  int64_t v3 = [v2 layoutDirection];

  return v3;
}

- (void)setLayoutDirection:(int64_t)a3
{
  id v4 = [(CEKWheelScrubberView *)self _collectionViewLayout];
  [v4 setLayoutDirection:a3];
}

- (void)setDotIndicatorBehavior:(int64_t)a3
{
  if (self->_dotIndicatorBehavior != a3)
  {
    self->_dotIndicatorBehavior = a3;
    if (a3 == 1)
    {
      id v4 = [(CEKWheelScrubberView *)self newCenterDotIndicatorView];
      centerDotIndicatorView = self->__centerDotIndicatorView;
      self->__centerDotIndicatorView = v4;

      [(CEKWheelScrubberView *)self addSubview:self->__centerDotIndicatorView];
    }
    else
    {
      [(UIView *)self->__centerDotIndicatorView removeFromSuperview];
      uint64_t v6 = self->__centerDotIndicatorView;
      self->__centerDotIndicatorView = 0;
    }
    [(CEKWheelScrubberView *)self setNeedsLayout];
  }
}

- (id)newCenterDotIndicatorView
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  int64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  +[CEKWheelScrubberUtilities dotIndicatorDiameter];
  double v5 = v4;
  uint64_t v6 = +[CEKWheelScrubberUtilities dotIndicatorBackgroundColor];
  [v3 setBackgroundColor:v6];
  unint64_t v7 = [v3 layer];
  [v7 setCornerRadius:v5 * 0.5];

  return v3;
}

- (void)setDotPlacement:(int64_t)a3
{
  if (self->_dotPlacement != a3)
  {
    self->_dotPlacement = a3;
    [(CEKWheelScrubberView *)self setNeedsLayout];
  }
}

- (void)_updateLayoutForVisibleCells
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(CEKWheelScrubberView *)self _collectionView];
  double v4 = [v3 visibleCells];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CEKWheelScrubberView _updateLayoutForCell:](self, "_updateLayoutForCell:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_updateLayoutForCell:(id)a3
{
  id v5 = a3;
  [(CEKWheelScrubberView *)self thumbnailSpacing];
  [v5 setContentInsetWidth:v4 * 0.5];
  [(CEKWheelScrubberView *)self selectionDotCenterTopSpacing];
  objc_msgSend(v5, "setSelectionDotCenterTopSpacing:");
  objc_msgSend(v5, "setDotPlacement:", -[CEKWheelScrubberView dotPlacement](self, "dotPlacement"));
}

- (void)setSelectedThumbnailBorderWidth:(double)a3
{
  if (self->_selectedThumbnailBorderWidth != a3)
  {
    self->_selectedThumbnailBorderWidth = a3;
    id v5 = [(CEKWheelScrubberView *)self _selectedItemLoupe];
    uint64_t v6 = [v5 layer];
    [v6 setBorderWidth:a3];

    [(CEKWheelScrubberView *)self setNeedsLayout];
  }
}

- (void)setSelectedThumbnailBorderColor:(id)a3
{
  id v8 = a3;
  if ((-[UIColor isEqual:](self->_selectedThumbnailBorderColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedThumbnailBorderColor, a3);
    uint64_t v5 = [v8 CGColor];
    uint64_t v6 = [(CEKWheelScrubberView *)self _selectedItemLoupe];
    uint64_t v7 = [v6 layer];
    [v7 setBorderColor:v5];
  }
}

- (void)setThumbnailSize:(CGSize)a3
{
  if (self->_thumbnailSize.width != a3.width || self->_thumbnailSize.height != a3.height)
  {
    self->_thumbnailSize = a3;
    [(CEKWheelScrubberView *)self setNeedsLayout];
    collectionViewLayout = self->__collectionViewLayout;
    [(CEKWheelScrubberCollectionViewLayout *)collectionViewLayout invalidateLayout];
  }
}

- (void)setThumbnailSpacing:(double)a3
{
  if (self->_thumbnailSpacing != a3)
  {
    self->_thumbnailSpacing = a3;
    [(CEKWheelScrubberView *)self setNeedsLayout];
    collectionViewLayout = self->__collectionViewLayout;
    [(CEKWheelScrubberCollectionViewLayout *)collectionViewLayout invalidateLayout];
  }
}

- (void)setThumbnailEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_thumbnailEdgeInsets.left != a3.left
    || self->_thumbnailEdgeInsets.top != a3.top
    || self->_thumbnailEdgeInsets.right != a3.right
    || self->_thumbnailEdgeInsets.bottom != a3.bottom)
  {
    self->_thumbnailEdgeInsets = a3;
    [(CEKWheelScrubberView *)self setNeedsLayout];
  }
}

- (double)thumbnailCornerRadius
{
  int64_t v3 = [(CEKWheelScrubberView *)self cornerStyle];
  if (v3 == 2)
  {
    [(CEKWheelScrubberView *)self desiredThumbnailCornerRadius];
    if (v6 == 0.0) {
      return 8.0;
    }
  }
  else
  {
    double result = 0.0;
    if (v3 != 1) {
      return result;
    }
    [(CEKWheelScrubberView *)self desiredThumbnailCornerRadius];
    if (v5 == 0.0) {
      return 5.0;
    }
  }
  [(CEKWheelScrubberView *)self desiredThumbnailCornerRadius];
  return result;
}

- (void)setGradientInsets:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  p_gradientInsets = &self->_gradientInsets;
  if (!CEKEdgeInsetsEqualToInsets(a3.var0, a3.var1, self->_gradientInsets.startInset, self->_gradientInsets.endInset))
  {
    p_gradientInsets->startInset = var0;
    p_gradientInsets->endInset = var1;
    [(CEKWheelScrubberView *)self setNeedsLayout];
  }
}

- (void)setSelectionDotCenterTopSpacing:(double)a3
{
  if (self->_selectionDotCenterTopSpacing != a3)
  {
    self->_selectionDotCenterTopSpacing = a3;
    [(CEKWheelScrubberView *)self _updateLayoutForVisibleCells];
  }
}

- (BOOL)_isDirectionHorizontal
{
  return [(CEKWheelScrubberView *)self layoutDirection] == 0;
}

- (BOOL)_isOrderReverse
{
  return [(CEKWheelScrubberView *)self layoutOrder] == 1;
}

- (CGRect)centeredThumbnailContentFrame
{
  [(CEKWheelScrubberView *)self bounds];
  -[CEKWheelScrubberView _collectionViewAlignmentRectForBounds:](self, "_collectionViewAlignmentRectForBounds:");
  -[CEKWheelScrubberView _centeredCellFrameForCollectionViewAlignmentRect:](self, "_centeredCellFrameForCollectionViewAlignmentRect:");
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(CEKWheelScrubberView *)self thumbnailSpacing];
  double v12 = v11 * 0.5;
  uint64_t v13 = v4;
  uint64_t v14 = v6;
  uint64_t v15 = v8;
  uint64_t v16 = v10;
  return CGRectInset(*(CGRect *)&v13, v12, v12);
}

- (CGRect)_collectionViewAlignmentRectForBounds:(CGRect)a3
{
  -[CEKWheelScrubberView alignmentRectForFrame:](self, "alignmentRectForFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(CEKWheelScrubberView *)self _defaultItemSize];
  double v13 = v12;
  CGFloat v15 = v14;
  BOOL v16 = [(CEKWheelScrubberView *)self _isDirectionHorizontal];
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  double MinX = CGRectGetMinX(v29);
  CGFloat v18 = v5;
  CGFloat v19 = v7;
  CGFloat v20 = v9;
  CGFloat v21 = v11;
  if (v16)
  {
    double MinY = CGRectGetMinY(*(CGRect *)&v18);
    v30.origin.x = v5;
    v30.origin.y = v7;
    v30.size.width = v9;
    v30.size.height = v11;
    CGRectGetHeight(v30);
    UIRoundToViewScale();
    double v24 = MinY + v23;
  }
  else
  {
    CGRectGetWidth(*(CGRect *)&v18);
    UIRoundToViewScale();
    double MinX = MinX + v25;
    v31.origin.x = v5;
    v31.origin.y = v7;
    v31.size.width = v9;
    v31.size.height = v11;
    double v24 = CGRectGetMinY(v31);
    CGFloat v15 = v11;
    CGFloat v9 = v13;
  }
  double v26 = MinX;
  double v27 = v9;
  double v28 = v15;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v24;
  result.origin.x = v26;
  return result;
}

- (CGRect)_centeredCellFrameForCollectionViewAlignmentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CEKWheelScrubberView *)self _defaultItemSize];
  double v8 = v7;
  double v10 = v9;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRectGetMidX(v18);
  UIRoundToViewScale();
  double v12 = v11;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRectGetMidY(v19);
  UIRoundToViewScale();
  double v14 = v13;
  double v15 = v12;
  double v16 = v8;
  double v17 = v10;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)_centerDotIndicatorFrameForCollectionViewAlignmentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  +[CEKWheelScrubberUtilities dotIndicatorDiameter];
  double v9 = v8;
  int64_t v10 = [(CEKWheelScrubberView *)self dotPlacement];
  if (v10 == 2)
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRectGetMaxX(v22);
    [(CEKWheelScrubberView *)self selectedThumbnailBorderWidth];
    [(CEKWheelScrubberView *)self selectionDotCenterTopSpacing];
    UIRoundToViewScale();
    double v11 = v14;
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGRectGetMidY(v23);
    goto LABEL_7;
  }
  if (v10 == 1)
  {
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    CGRectGetMinX(v24);
    [(CEKWheelScrubberView *)self selectedThumbnailBorderWidth];
    [(CEKWheelScrubberView *)self selectionDotCenterTopSpacing];
    UIRoundToViewScale();
    double v11 = v15;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGRectGetMidY(v25);
    goto LABEL_7;
  }
  double v11 = 0.0;
  double v12 = 0.0;
  if (!v10)
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRectGetMidX(v20);
    UIRoundToViewScale();
    double v11 = v13;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRectGetMinY(v21);
    [(CEKWheelScrubberView *)self selectedThumbnailBorderWidth];
    [(CEKWheelScrubberView *)self selectionDotCenterTopSpacing];
LABEL_7:
    UIRoundToViewScale();
    double v12 = v16;
  }
  double v17 = v11;
  double v18 = v9;
  double v19 = v9;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)layoutSubviews
{
  v99.receiver = self;
  v99.super_class = (Class)CEKWheelScrubberView;
  [(CEKWheelScrubberView *)&v99 layoutSubviews];
  [(CEKWheelScrubberView *)self bounds];
  double x = v100.origin.x;
  double y = v100.origin.y;
  double width = v100.size.width;
  double height = v100.size.height;
  if (!CGRectIsEmpty(v100))
  {
    double v7 = [(CEKWheelScrubberView *)self _collectionView];
    double v8 = [(CEKWheelScrubberView *)self _collectionViewLayout];
    double v9 = [(CEKWheelScrubberView *)self _selectedItemLoupe];
    int64_t v10 = [(CEKWheelScrubberView *)self _selectedItemTextOverlay];
    -[CEKWheelScrubberView alignmentRectForFrame:](self, "alignmentRectForFrame:", x, y, width, height);
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v88 = v17;
    -[CEKWheelScrubberView _collectionViewAlignmentRectForBounds:](self, "_collectionViewAlignmentRectForBounds:", x, y, width, height);
    double v94 = v19;
    double v95 = v18;
    double v92 = v21;
    double v93 = v20;
    -[CEKWheelScrubberView _centeredCellFrameForCollectionViewAlignmentRect:](self, "_centeredCellFrameForCollectionViewAlignmentRect:");
    CGFloat v23 = v22;
    CGFloat v97 = v25;
    CGFloat v98 = v24;
    CGFloat rect = v26;
    double selectionDotCenterTopSpacing = self->_selectionDotCenterTopSpacing;
    CGFloat v89 = v22;
    if ([(CEKWheelScrubberView *)self _isDirectionHorizontal])
    {
      double v90 = selectionDotCenterTopSpacing + 5.0;
      v101.origin.double x = v23;
      v101.origin.double y = v98;
      v101.size.double width = v97;
      v101.size.double height = rect;
      double MinX = CGRectGetMinX(v101);
      v102.origin.double x = v12;
      v102.origin.double y = v14;
      v102.size.double width = v16;
      v102.size.double height = v88;
      double v28 = MinX - CGRectGetMinX(v102);
      v103.origin.double x = v12;
      v103.origin.double y = v14;
      v103.size.double width = v16;
      double v29 = v28;
      v103.size.double height = v88;
      double v30 = CGRectGetWidth(v103);
      v104.origin.double x = v23;
      v104.origin.double y = v98;
      v104.size.double width = v97;
      v104.size.double height = rect;
      double v31 = v30 - CGRectGetMaxX(v104);
      double v32 = -v90;
      double v33 = 19.0;
      double v34 = -19.0;
      double v35 = 0.0;
      double v36 = 0.0;
    }
    else
    {
      v105.origin.double x = v23;
      v105.origin.double y = v98;
      v105.size.double width = v97;
      v105.size.double height = rect;
      double MinY = CGRectGetMinY(v105);
      v106.origin.double x = v12;
      v106.origin.double y = v14;
      v106.size.double width = v16;
      v106.size.double height = v88;
      double v90 = MinY - CGRectGetMinY(v106);
      v107.origin.double x = v12;
      v107.origin.double y = v14;
      v107.size.double width = v16;
      v107.size.double height = v88;
      double v37 = CGRectGetHeight(v107);
      v108.origin.double x = v23;
      v108.origin.double y = v98;
      v108.size.double width = v97;
      v108.size.double height = rect;
      double v33 = v37 - CGRectGetMaxY(v108);
      int64_t v38 = [(CEKWheelScrubberView *)self dotPlacement];
      if (v38 == 1) {
        double v31 = 19.0;
      }
      else {
        double v31 = self->_selectionDotCenterTopSpacing + 5.0;
      }
      if (v38 == 1) {
        double v29 = self->_selectionDotCenterTopSpacing + 5.0;
      }
      else {
        double v29 = 19.0;
      }
      double v35 = -v29;
      double v36 = -v31;
      double v32 = 0.0;
      double v34 = 0.0;
    }
    double v39 = v95 + v35;
    double v40 = v94 + v32;
    double v41 = v93 - (v35 + v36);
    double v42 = v92 - (v32 + v34);
    [v7 bounds];
    double v44 = v43;
    objc_msgSend(v7, "setFrame:", v39, v40, v41, v42);
    objc_msgSend(v8, "setContentInsets:", v90, v29, v33, v31);
    v45 = [(CEKWheelScrubberView *)self _edgeGradientView];
    objc_msgSend(v45, "setFrame:", v39, v40, v41, v42);

    LODWORD(v45) = [(CEKWheelScrubberView *)self _isDirectionHorizontal];
    v46 = [(CEKWheelScrubberView *)self _edgeGradientView];
    [v46 setGradientDirection:v45 ^ 1];

    v47 = [(CEKWheelScrubberView *)self _edgeGradientView];
    [v47 frame];
    double v49 = v48;
    double v51 = v50;

    if (v45) {
      double v51 = v49;
    }
    [(CEKWheelScrubberView *)self gradientInsets];
    double v53 = v52;
    [(CEKWheelScrubberView *)self gradientInsets];
    double v55 = v54;
    v56 = [(CEKWheelScrubberView *)self _edgeGradientView];
    objc_msgSend(v56, "setGradientDimensions:", v53, v51 * 0.07, v51 * 0.07, v55);

    [(CEKWheelScrubberView *)self thumbnailSpacing];
    double v58 = v57 * 0.5;
    [(CEKWheelScrubberView *)self selectedThumbnailBorderWidth];
    CGFloat v60 = v58 - v59;
    [(CEKWheelScrubberView *)self selectedThumbnailBorderWidth];
    CGFloat v62 = v58 - v61;
    v109.origin.double x = v89;
    v109.size.double width = v97;
    v109.origin.double y = v98;
    v109.size.double height = rect;
    CGRect v110 = CGRectInset(v109, v60, v62);
    double v63 = v110.origin.x;
    double v64 = v110.origin.y;
    double v65 = v110.size.width;
    double v66 = v110.size.height;
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(v10, "setFrame:", v63, v64, v65, v66);
    v67 = [(CEKWheelScrubberView *)self customCenteredThumbnailOverlayView];

    if (v67)
    {
      [(CEKWheelScrubberView *)self centeredThumbnailContentFrame];
      double v69 = v68;
      double v71 = v70;
      double v73 = v72;
      double v75 = v74;
      v76 = [(CEKWheelScrubberView *)self customCenteredThumbnailOverlayView];
      objc_msgSend(v76, "setFrame:", v69, v71, v73, v75);
    }
    v77 = [(CEKWheelScrubberView *)self _centerDotIndicatorView];

    if (v77)
    {
      -[CEKWheelScrubberView _centerDotIndicatorFrameForCollectionViewAlignmentRect:](self, "_centerDotIndicatorFrameForCollectionViewAlignmentRect:", v95, v94, v93, v92);
      double v79 = v78;
      double v81 = v80;
      double v83 = v82;
      double v85 = v84;
      v86 = [(CEKWheelScrubberView *)self _centerDotIndicatorView];
      objc_msgSend(v86, "setFrame:", v79, v81, v83, v85);
    }
    if (v44 <= 0.0) {
      [(CEKWheelScrubberView *)self _scrollToIndex:[(CEKWheelScrubberView *)self selectedIndex] animated:0 shouldOvershoot:0];
    }
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (![(CEKWheelScrubberView *)self isSectioned]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v5 = [WeakRetained wheelScrubberViewNumberOfSections:self];

  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if ([(CEKWheelScrubberView *)self isSectioned]
    && self->_delegateFlags.respondsToNumberOfItemsInSection)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v7 = [WeakRetained wheelScrubberView:self numberOfItemsInSection:a4];

    return v7;
  }
  else
  {
    return [(CEKWheelScrubberView *)self itemCount];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"CEKWheelScrubberViewCellReuseIdentifier" forIndexPath:v6];
  unint64_t v8 = [(CEKWheelScrubberView *)self globalIndexForIndexPath:v6];

  double v9 = [(CEKWheelScrubberView *)self delegate];
  [v9 wheelScrubberView:self updateCell:v7 forItemAtIndex:v8];

  [(CEKWheelScrubberView *)self _updateLayoutForCell:v7];
  [(CEKWheelScrubberView *)self _updateCornerMaskForCell:v7 withItemIndex:v8];
  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4FB2770];
  if ([a4 isEqualToString:*MEMORY[0x1E4FB2770]])
  {
    int64_t v10 = [v7 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"CEKWheelScrubberSectionHeaderReuseIdentifier" forIndexPath:v8];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (void)_updateCornerMaskForCell:(id)a3 withItemIndex:(int64_t)a4
{
  id v11 = a3;
  int64_t v6 = [(CEKWheelScrubberView *)self cornerStyle];
  if (v6 == 1)
  {
    unint64_t v7 = [(CEKWheelScrubberView *)self _outermostCornerMaskForItemIndex:a4];
  }
  else if (v6 == 2)
  {
    unint64_t v7 = 15;
  }
  else
  {
    unint64_t v7 = 0;
  }
  id v8 = [v11 itemView];
  uint64_t v9 = [v8 layer];

  if (v7) {
    [(CEKWheelScrubberView *)self thumbnailCornerRadius];
  }
  else {
    double v10 = 0.0;
  }
  [v9 setCornerRadius:v10];
  [v9 setMaskedCorners:v7];
}

- (unint64_t)_outermostCornerMaskForItemIndex:(int64_t)a3
{
  int64_t v5 = [(CEKWheelScrubberView *)self layoutDirection];
  int64_t v6 = v5;
  if (a3)
  {
    unint64_t v7 = [(CEKWheelScrubberView *)self itemCount] - 1;
    unint64_t v8 = 12;
    if (!v6) {
      unint64_t v8 = 10;
    }
    if (v7 == a3) {
      return v8;
    }
    else {
      return 0;
    }
  }
  else if (v5)
  {
    return 3;
  }
  else
  {
    return 5;
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  if ([(CEKWheelScrubberView *)self cellOverlayMode] == 1)
  {
    unint64_t v8 = [(CEKWheelScrubberView *)self globalIndexForIndexPath:v7];
    if (v8 == [(CEKWheelScrubberView *)self selectedIndex])
    {
      id v9 = v16;
      uint64_t v10 = [v9 overlayView];
      if (v10)
      {
        id v11 = (void *)v10;
        CGFloat v12 = [v9 overlayView];
        [v12 alpha];
        double v14 = v13;

        if (v14 == 0.0)
        {
          double v15 = [v9 overlayView];
          [v15 setAlpha:1.0];
        }
      }
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(CEKWheelScrubberView *)self _prepareFeedback];
  [(CEKWheelScrubberView *)self _setDragging:1];
  if (self->_delegateFlags.respondsToWillBeginScrolling)
  {
    id v4 = [(CEKWheelScrubberView *)self delegate];
    [v4 wheelScrubberViewWillBeginScrolling:self];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v8 = a3;
  if (self->_delegateFlags.respondsToDidScroll)
  {
    id v4 = [(CEKWheelScrubberView *)self delegate];
    [v4 wheelScrubberViewDidScroll:self];
  }
  int v5 = [v8 isDragging];
  int v6 = [v8 isDecelerating];
  char v7 = [v8 _isAnimatingScroll];
  [v8 contentOffset];
  if ((v5 | v6) == 1 && (v7 & 1) == 0) {
    -[CEKWheelScrubberView _setSelectedIndex:shouldNotify:shouldSuppressHaptic:](self, "_setSelectedIndex:shouldNotify:shouldSuppressHaptic:", -[CEKWheelScrubberView _itemIndexUsingHysteresisForScrollingToContentOffset:](self, "_itemIndexUsingHysteresisForScrollingToContentOffset:"), 1, 0);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  if ([(CEKWheelScrubberView *)self _isDirectionHorizontal]) {
    double v9 = x;
  }
  else {
    double v9 = y;
  }
  if (fabs(v9) >= 0.05) {
    int64_t v10 = -[CEKWheelScrubberView _itemIndexUsingHysteresisForScrollingToContentOffset:](self, "_itemIndexUsingHysteresisForScrollingToContentOffset:", a5->x, a5->y);
  }
  else {
    int64_t v10 = [(CEKWheelScrubberView *)self selectedIndex];
  }
  int64_t v11 = v10;
  unint64_t v12 = [(CEKWheelScrubberView *)self totalNumberOfItems];
  BOOL v13 = [(CEKWheelScrubberView *)self _isOrderReverse];
  if ((uint64_t)(v11 - v12 + 1) >= 0) {
    uint64_t v14 = v11 - v12 + 1;
  }
  else {
    uint64_t v14 = ~(v11 - v12);
  }
  if (v13) {
    int64_t v11 = v14;
  }
  [(CEKWheelScrubberView *)self _contentOffsetForItemIndex:v11];
  a5->double x = v15;
  a5->double y = v16;
  if (v11 != [(CEKWheelScrubberView *)self selectedIndex]) {
    [(CEKWheelScrubberView *)self set_decelerationTargetIndex:v11];
  }
  if (self->_delegateFlags.respondsToWillEndScrolling)
  {
    id v17 = [(CEKWheelScrubberView *)self delegate];
    objc_msgSend(v17, "wheelScrubberViewWillEndScrolling:withVelocity:targetContentOffset:", self, a5, x, y);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(CEKWheelScrubberView *)self set_decelerationTargetIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  [(CEKWheelScrubberView *)self _setDragging:0];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v5 = a3;
  if (self->_delegateFlags.respondsToDidEndScrolling)
  {
    id v4 = [(CEKWheelScrubberView *)self delegate];
    [v4 wheelScrubberViewDidEndScrolling:self];
  }
  if (([v5 isDragging] & 1) == 0) {
    [(CEKWheelScrubberView *)self _scrollToIndex:[(CEKWheelScrubberView *)self selectedIndex] animated:1 shouldOvershoot:0];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(CEKWheelScrubberView *)self set_decelerationTargetIndex:0x7FFFFFFFFFFFFFFFLL];
  [(CEKWheelScrubberView *)self _updateSelectionLoupeAlphaAnimated:1];
  [(CEKWheelScrubberView *)self _updateCustomThumbnailAlphaAnimated:1];
  if (self->_delegateFlags.respondsToDidEndScrolling)
  {
    id v4 = [(CEKWheelScrubberView *)self delegate];
    [v4 wheelScrubberViewDidEndScrolling:self];
  }
}

- (void)_scrollViewDidInterruptDecelerating:(id)a3
{
  [(CEKWheelScrubberView *)self set_decelerationTargetIndex:0x7FFFFFFFFFFFFFFFLL];
  [(CEKWheelScrubberView *)self _updateSelectionLoupeAlphaAnimated:1];
  [(CEKWheelScrubberView *)self _updateCustomThumbnailAlphaAnimated:1];
}

- (CGSize)_defaultItemSize
{
  [(CEKWheelScrubberView *)self thumbnailSize];
  double v4 = v3;
  double v6 = v5;
  [(CEKWheelScrubberView *)self thumbnailSpacing];
  double v8 = v4 + v7;
  [(CEKWheelScrubberView *)self thumbnailSpacing];
  double v10 = v6 + v9;
  double v11 = v8;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (double)_defaultItemLength
{
  [(CEKWheelScrubberView *)self _defaultItemSize];
  double v4 = v3;
  double v6 = v5;
  if ([(CEKWheelScrubberView *)self _isDirectionHorizontal]) {
    return v4;
  }
  else {
    return v6;
  }
}

- (CGPoint)_contentOffsetForItemIndex:(int64_t)a3
{
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(CEKWheelScrubberView *)self _contentOffsetAmountForItemIndex:a3];
  double v7 = v6;
  BOOL v8 = [(CEKWheelScrubberView *)self _isDirectionHorizontal];
  if (v8) {
    double v9 = v5;
  }
  else {
    double v9 = v7;
  }
  if (v8) {
    double v10 = v7;
  }
  else {
    double v10 = v4;
  }
  result.double y = v9;
  result.double x = v10;
  return result;
}

- (double)_contentOffsetAmountForItemIndex:(int64_t)a3
{
  [(CEKWheelScrubberView *)self _defaultItemLength];
  double v6 = v5;
  double v7 = (double)[(CEKWheelScrubberView *)self numberOfSectionsBeforeItemIndex:a3];
  +[CEKWheelScrubberSectionDividerView dividerViewWidth];
  return v8 * v7 + (double)a3 * v6;
}

- (double)_fractionalItemOffsetForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(CEKWheelScrubberView *)self _isDirectionHorizontal]) {
    double v6 = x;
  }
  else {
    double v6 = y;
  }
  [(CEKWheelScrubberView *)self _fractionalItemOffsetForContentOffsetAmount:v6];
  return result;
}

- (double)_fractionalItemOffsetForContentOffsetAmount:(double)a3
{
  [(CEKWheelScrubberView *)self _defaultItemLength];
  double v6 = v5;
  [(CEKWheelScrubberView *)self _contentOffsetIgnoringSectionHeaders:a3];
  double v8 = v7 / v6;
  double v9 = (double)([(CEKWheelScrubberView *)self totalNumberOfItems] - 1);
  return CEKClamp(v8, 0.0, v9);
}

- (unint64_t)numberOfSectionsBeforeItemIndex:(unint64_t)a3
{
  if (![(UICollectionView *)self->__collectionView numberOfSections]) {
    return 0;
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  while (1)
  {
    v6 += [(UICollectionView *)self->__collectionView numberOfItemsInSection:v5];
    if (v6 > a3) {
      break;
    }
    if (++v5 >= [(UICollectionView *)self->__collectionView numberOfSections]) {
      return 0;
    }
  }
  return v5;
}

- (double)_contentOffsetIgnoringSectionHeaders:(double)a3
{
  [(CEKWheelScrubberView *)self _defaultItemLength];
  double v6 = v5;
  +[CEKWheelScrubberSectionDividerView dividerViewWidth];
  double v8 = v7;
  if (![(UICollectionView *)self->__collectionView numberOfSections]) {
    return a3;
  }
  unint64_t v9 = 0;
  double v10 = v6 * -0.5;
  double v11 = v8 * 0.5;
  double v12 = a3;
  do
  {
    double v13 = v10
        + v6
        * (double)[(UICollectionView *)self->__collectionView numberOfItemsInSection:v9];
    if (v13 > a3) {
      break;
    }
    double v14 = v11 + v13;
    if (v14 > a3) {
      return v12 - (a3 - (v14 - v11));
    }
    double v10 = v11 + v14;
    if (v11 + v14 > a3) {
      return v12 + v10 - a3;
    }
    double v12 = v12 - v8;
    ++v9;
  }
  while (v9 < [(UICollectionView *)self->__collectionView numberOfSections]);
  return v12;
}

- (int64_t)_nominalItemIndexForFractionalItemOffset:(double)a3
{
  return (uint64_t)CEKClamp((double)(uint64_t)round(a3), 0.0, (double)([(CEKWheelScrubberView *)self totalNumberOfItems] - 1));
}

- (int64_t)_itemIndexUsingHysteresisForScrollingToContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = (double)[(CEKWheelScrubberView *)self selectedIndex];
  -[CEKWheelScrubberView _fractionalItemOffsetForContentOffset:](self, "_fractionalItemOffsetForContentOffset:", x, y);
  int64_t v8 = [(CEKWheelScrubberView *)self _nominalItemIndexForFractionalItemOffset:v7 + dbl_1BEE74830[v7 > v6]];
  unint64_t v9 = [(CEKWheelScrubberView *)self totalNumberOfItems];
  if (![(CEKWheelScrubberView *)self _isOrderReverse]) {
    return v8;
  }
  if ((uint64_t)(v8 - v9 + 1) >= 0) {
    return v8 - v9 + 1;
  }
  return ~(v8 - v9);
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  id v28 = a3;
  if ([v28 state] == 3)
  {
    double v4 = [(CEKWheelScrubberView *)self _collectionView];
    [v28 locationInView:v4];
    double v5 = objc_msgSend(v4, "indexPathForItemAtPoint:");
    if (v5)
    {
      unint64_t v6 = [(CEKWheelScrubberView *)self globalIndexForIndexPath:v5];
      if (v6 == [(CEKWheelScrubberView *)self selectedIndex])
      {
        if (self->_delegateFlags.respondsToDidTapOnSelectedCell
          || self->_delegateFlags.respondsToDidTapOnSelectedCellWithFrame)
        {
          double v7 = [(CEKWheelScrubberView *)self _collectionView];
          int64_t v8 = [v7 layoutAttributesForItemAtIndexPath:v5];

          [(CEKWheelScrubberView *)self thumbnailSpacing];
          CGFloat v10 = v9 * 0.5;
          [v8 frame];
          CGRect v31 = CGRectInset(v30, v10, v10);
          double x = v31.origin.x;
          double y = v31.origin.y;
          double width = v31.size.width;
          double height = v31.size.height;
          CGFloat v15 = [(CEKWheelScrubberView *)self _collectionView];
          objc_msgSend(v15, "convertRect:toView:", self, x, y, width, height);
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;

          if (self->_delegateFlags.respondsToDidTapOnSelectedCellWithFrame)
          {
            double v24 = [(CEKWheelScrubberView *)self delegate];
            objc_msgSend(v24, "wheelScrubberView:didTapOnSelectedCellWithFrame:", self, v17, v19, v21, v23);
          }
          if (self->_delegateFlags.respondsToDidTapOnSelectedCell)
          {
            double v25 = [(CEKWheelScrubberView *)self _collectionView];
            double v26 = [v25 cellForItemAtIndexPath:v5];

            double v27 = [(CEKWheelScrubberView *)self delegate];
            objc_msgSend(v27, "wheelScrubberView:didTapOnSelectedCell:withFrame:", self, v26, v17, v19, v21, v23);
          }
        }
      }
      else
      {
        [(CEKWheelScrubberView *)self _switchToIndex:v6 shouldOvershoot:0 shouldSuppressHaptic:1];
      }
    }
  }
}

- (void)_switchToIndex:(int64_t)a3 shouldOvershoot:(BOOL)a4 shouldSuppressHaptic:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(CEKWheelScrubberView *)self _prepareFeedback];
  [(CEKWheelScrubberView *)self _setSelectedIndex:a3 shouldNotify:1 shouldSuppressHaptic:v5];
  [(CEKWheelScrubberView *)self _scrollToIndex:a3 animated:1 shouldOvershoot:v6];
}

- (void)_scrollToIndex:(int64_t)a3 animated:(BOOL)a4 shouldOvershoot:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v29 = [(CEKWheelScrubberView *)self _collectionView];
  double v9 = [(CEKWheelScrubberView *)self _collectionViewLayout];
  uint64_t v10 = [v9 layoutOrder];

  unint64_t v11 = [(CEKWheelScrubberView *)self totalNumberOfItems];
  if ((uint64_t)(a3 - v11 + 1) >= 0) {
    int64_t v12 = a3 - v11 + 1;
  }
  else {
    int64_t v12 = ~(a3 - v11);
  }
  if (v10 == 1) {
    int64_t v13 = v12;
  }
  else {
    int64_t v13 = a3;
  }
  [(CEKWheelScrubberView *)self _contentOffsetForItemIndex:v13];
  double v15 = v14;
  double v17 = v16;
  if (v6 && v5)
  {
    [v29 contentOffset];
    double v19 = v18;
    double v21 = v20;
    [(CEKWheelScrubberView *)self _defaultItemLength];
    double v23 = v22;
    double v24 = v22 * 0.14;
    if ([(CEKWheelScrubberView *)self _isDirectionHorizontal])
    {
      if (v15 <= v19 + v23)
      {
        if (v15 < v19 - v23) {
          double v15 = v15 - v24;
        }
      }
      else
      {
        double v15 = v15 + v24;
      }
    }
    else if (v17 <= v21 + v23)
    {
      if (v17 < v21 - v23) {
        double v17 = v17 - v24;
      }
    }
    else
    {
      double v17 = v17 + v24;
    }
  }
  BOOL v25 = [(CEKWheelScrubberView *)self _isDirectionHorizontal];
  [v29 contentOffset];
  if (v25)
  {
    if (v26 == v15) {
      goto LABEL_25;
    }
  }
  else if (v27 == v17)
  {
    goto LABEL_25;
  }
  objc_msgSend(v29, "setContentOffset:animated:", v6, v15, v17);
  if (v6 && self->_delegateFlags.respondsToWillBeginScrolling)
  {
    id v28 = [(CEKWheelScrubberView *)self delegate];
    [v28 wheelScrubberViewWillBeginScrolling:self];
  }
LABEL_25:
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    BOOL v3 = a3;
    self->_suspended = a3;
    BOOL v5 = [(CEKWheelScrubberView *)self _collectionView];
    if (v3)
    {
      [(CEKWheelScrubberView *)self setSelectedIndex:[(CEKWheelScrubberView *)self selectedIndex]];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__CEKWheelScrubberView_setSuspended___block_invoke;
      block[3] = &unk_1E63CD6C8;
      block[4] = self;
      id v24 = v5;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      BOOL v6 = [(CEKWheelScrubberView *)self _collectionViewSnapshot];
      [(CEKWheelScrubberView *)self _setCollectionViewSnapshot:0];
      double v7 = [(CEKWheelScrubberView *)self _collectionView];
      [v7 setHidden:0];

      if (v6)
      {
        [v5 setUserInteractionEnabled:0];
        [MEMORY[0x1E4F39CF8] begin];
        int64_t v8 = (void *)MEMORY[0x1E4F39CF8];
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        double v19 = __37__CEKWheelScrubberView_setSuspended___block_invoke_2;
        double v20 = &unk_1E63CD6C8;
        id v9 = v6;
        id v21 = v9;
        id v22 = v5;
        [v8 setCompletionBlock:&v17];
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F39B48], "animationWithKeyPath:", @"opacity", v17, v18, v19, v20);
        LODWORD(v11) = 1.0;
        LODWORD(v12) = 1.0;
        LODWORD(v13) = 1.0;
        double v14 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v11 :0.0 :v12 :v13];
        [v10 setTimingFunction:v14];

        [v10 setDuration:0.33];
        [v10 setFromValue:&unk_1F1A0FA60];
        [v10 setToValue:&unk_1F1A0FA00];
        double v15 = [v9 layer];
        [v15 addAnimation:v10 forKey:@"fadeOutAnimation"];

        double v16 = [v9 layer];
        [v16 setOpacity:0.0];

        [MEMORY[0x1E4F39CF8] commit];
      }
    }
  }
}

void __37__CEKWheelScrubberView_setSuspended___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSuspended])
  {
    id v4 = [*(id *)(a1 + 40) snapshotView];
    [*(id *)(a1 + 40) frame];
    objc_msgSend(v4, "setFrame:");
    [*(id *)(a1 + 32) insertSubview:v4 aboveSubview:*(void *)(a1 + 40)];
    id v2 = [*(id *)(a1 + 32) _collectionViewSnapshot];
    [v2 removeFromSuperview];

    [*(id *)(a1 + 32) _setCollectionViewSnapshot:v4];
    BOOL v3 = [*(id *)(a1 + 32) _collectionView];
    [v3 setHidden:1];
  }
}

uint64_t __37__CEKWheelScrubberView_setSuspended___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = *(void **)(a1 + 40);
  return [v2 setUserInteractionEnabled:1];
}

- (void)switchToNextItem
{
}

- (void)switchToPreviousItem
{
}

- (void)_switchToItemAtIndexOffset:(int64_t)a3 shouldOvershoot:(BOOL)a4
{
  int64_t v6 = [(CEKWheelScrubberView *)self totalNumberOfItems];
  int64_t v7 = [(CEKWheelScrubberView *)self selectedIndex] + a3;
  if (v7 >= 0 && v7 < v6)
  {
    -[CEKWheelScrubberView _switchToIndex:shouldOvershoot:shouldSuppressHaptic:](self, "_switchToIndex:shouldOvershoot:shouldSuppressHaptic:");
  }
}

- (BOOL)_shouldPerformFeedback
{
  return 1;
}

- (void)_prepareFeedback
{
  if ([(CEKWheelScrubberView *)self _shouldPerformFeedback])
  {
    selectionFeedbackGenerator = self->__selectionFeedbackGenerator;
    [(CEKSelectionFeedbackGenerator *)selectionFeedbackGenerator prepareFeedback];
  }
}

- (void)_performFeedback
{
  if ([(CEKWheelScrubberView *)self _shouldPerformFeedback])
  {
    selectionFeedbackGenerator = self->__selectionFeedbackGenerator;
    [(CEKSelectionFeedbackGenerator *)selectionFeedbackGenerator performFeedback];
  }
}

- (double)_alphaForVisibility:(int64_t)a3
{
  if (a3 == 3)
  {
    BOOL v4 = ![(CEKWheelScrubberView *)self isDragging];
    double result = 1.0;
LABEL_5:
    if (!v4) {
      return 0.0;
    }
    return result;
  }
  if (a3 != 2)
  {
    double result = 1.0;
    BOOL v4 = a3 == 0;
    goto LABEL_5;
  }
  BOOL v5 = [(CEKWheelScrubberView *)self isDragging];
  double result = 0.0;
  if (v5) {
    return 1.0;
  }
  return result;
}

- (void)_updateSelectionLoupeAlphaAnimated:(BOOL)a3
{
  if ([(CEKWheelScrubberView *)self _decelerationTargetIndex] == 0x7FFFFFFFFFFFFFFFLL
    || (double v5 = 1.0, [(CEKWheelScrubberView *)self selectionLoupeVisibility] != 2))
  {
    [(CEKWheelScrubberView *)self _alphaForVisibility:[(CEKWheelScrubberView *)self selectionLoupeVisibility]];
    double v5 = v6;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CEKWheelScrubberView__updateSelectionLoupeAlphaAnimated___block_invoke;
  v10[3] = &unk_1E63CD5A0;
  v10[4] = self;
  *(double *)&v10[5] = v5;
  int64_t v7 = _Block_copy(v10);
  int64_t v8 = v7;
  if (a3)
  {
    double v9 = 0.5;
    if (v5 > 0.0) {
      double v9 = 0.25;
    }
    [MEMORY[0x1E4FB1EB0] animateWithDuration:(unint64_t)(v5 <= 0.0) << 17 delay:v7 options:0 animations:v9 completion:0.0];
  }
  else
  {
    (*((void (**)(void *))v7 + 2))(v7);
  }
}

void __59__CEKWheelScrubberView__updateSelectionLoupeAlphaAnimated___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _selectedItemLoupe];
  [v2 setAlpha:v1];
}

- (void)_updateCustomThumbnailAlphaAnimated:(BOOL)a3
{
  double v5 = [(CEKWheelScrubberView *)self customThumbailHiddenIndices];
  char v6 = objc_msgSend(v5, "containsIndex:", -[CEKWheelScrubberView selectedIndex](self, "selectedIndex"));

  uint64_t v7 = 0;
  if ((v6 & 1) == 0
    && ([(CEKWheelScrubberView *)self _decelerationTargetIndex] == 0x7FFFFFFFFFFFFFFFLL
     || [(CEKWheelScrubberView *)self customThumbnailVisibility] != 3))
  {
    [(CEKWheelScrubberView *)self _alphaForVisibility:[(CEKWheelScrubberView *)self customThumbnailVisibility]];
    uint64_t v7 = v8;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__CEKWheelScrubberView__updateCustomThumbnailAlphaAnimated___block_invoke;
  v11[3] = &unk_1E63CD5A0;
  v11[4] = self;
  v11[5] = v7;
  double v9 = _Block_copy(v11);
  uint64_t v10 = v9;
  if (a3) {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 animations:0.25];
  }
  else {
    (*((void (**)(void *))v9 + 2))(v9);
  }
}

void __60__CEKWheelScrubberView__updateCustomThumbnailAlphaAnimated___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) customCenteredThumbnailOverlayView];
  [v2 setAlpha:v1];
}

- (void)_updateOverlayVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CEKWheelScrubberView *)self cellOverlayMode] == 1)
  {
    if (v3) {
      double v5 = 0.25;
    }
    else {
      double v5 = 0.0;
    }
    char v6 = [(CEKWheelScrubberView *)self _collectionView];
    uint64_t v7 = [v6 indexPathsForVisibleItems];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke;
    v8[3] = &unk_1E63CD7E0;
    v8[4] = self;
    *(double *)&v8[5] = v5;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

void __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 _collectionView];
  char v6 = [v5 cellForItemAtIndexPath:v4];

  uint64_t v7 = [*(id *)(a1 + 32) globalIndexForIndexPath:v4];
  if (v7 == [*(id *)(a1 + 32) selectedIndex])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
    double v9 = *(double *)(a1 + 40);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke_2;
    double v23 = &unk_1E63CD380;
    uint64_t v10 = &v24;
    id v24 = v6;
    double v11 = &v20;
LABEL_5:
    objc_msgSend(v8, "animateWithDuration:animations:", v11, v9, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);

    goto LABEL_6;
  }
  double v12 = [v6 overlayView];
  [v12 alpha];
  double v14 = v13;

  if (v14 > 0.0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
    double v9 = *(double *)(a1 + 40);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke_3;
    uint64_t v18 = &unk_1E63CD380;
    uint64_t v10 = &v19;
    id v19 = v6;
    double v11 = &v15;
    goto LABEL_5;
  }
LABEL_6:
}

void __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overlayView];
  [v1 setAlpha:1.0];
}

void __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overlayView];
  [v1 setAlpha:0.0];
}

- (CEKWheelScrubberViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CEKWheelScrubberViewDelegate *)WeakRetained;
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (unint64_t)defaultIndex
{
  return self->_defaultIndex;
}

- (void)setDefaultIndex:(unint64_t)a3
{
  self->_defaultIndedouble x = a3;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (unint64_t)markedIndex
{
  return self->_markedIndex;
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (int64_t)selectionLoupeVisibility
{
  return self->_selectionLoupeVisibility;
}

- (BOOL)useSelectionLoupeShadow
{
  return self->_useSelectionLoupeShadow;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)thumbnailSpacing
{
  return self->_thumbnailSpacing;
}

- (UIEdgeInsets)thumbnailEdgeInsets
{
  double top = self->_thumbnailEdgeInsets.top;
  double left = self->_thumbnailEdgeInsets.left;
  double bottom = self->_thumbnailEdgeInsets.bottom;
  double right = self->_thumbnailEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)desiredThumbnailCornerRadius
{
  return self->_desiredThumbnailCornerRadius;
}

- (void)setDesiredThumbnailCornerRadius:(double)a3
{
  self->_desiredThumbnailCornerRadius = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)gradientInsets
{
  double startInset = self->_gradientInsets.startInset;
  double endInset = self->_gradientInsets.endInset;
  result.double var1 = endInset;
  result.double var0 = startInset;
  return result;
}

- (double)selectedThumbnailBorderWidth
{
  return self->_selectedThumbnailBorderWidth;
}

- (UIColor)selectedThumbnailBorderColor
{
  return self->_selectedThumbnailBorderColor;
}

- (double)selectionDotCenterTopSpacing
{
  return self->_selectionDotCenterTopSpacing;
}

- (int64_t)dotIndicatorBehavior
{
  return self->_dotIndicatorBehavior;
}

- (int64_t)dotPlacement
{
  return self->_dotPlacement;
}

- (UIView)customCenteredThumbnailOverlayView
{
  return self->_customCenteredThumbnailOverlayView;
}

- (int64_t)customThumbnailVisibility
{
  return self->_customThumbnailVisibility;
}

- (NSIndexSet)customThumbailHiddenIndices
{
  return self->_customThumbailHiddenIndices;
}

- (int64_t)cellOverlayMode
{
  return self->_cellOverlayMode;
}

- (void)setCellOverlayMode:(int64_t)a3
{
  self->_cellOverlayMode = a3;
}

- (CEKWheelScrubberCollectionViewLayout)_collectionViewLayout
{
  return self->__collectionViewLayout;
}

- (UICollectionView)_collectionView
{
  return self->__collectionView;
}

- (UIView)_selectedItemLoupe
{
  return self->__selectedItemLoupe;
}

- (UILabel)_selectedItemTextOverlay
{
  return self->__selectedItemTextOverlay;
}

- (BOOL)_showSelectedItemTextOverlay
{
  return self->__showSelectedItemTextOverlay;
}

- (void)set_showSelectedItemTextOverlay:(BOOL)a3
{
  self->__showSelectedItemTextOverladouble y = a3;
}

- (UIView)_centerDotIndicatorView
{
  return self->__centerDotIndicatorView;
}

- (CEKEdgeGradientView)_edgeGradientView
{
  return self->__edgeGradientView;
}

- (void)set_edgeGradientView:(id)a3
{
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (CEKSelectionFeedbackGenerator)_selectionFeedbackGenerator
{
  return self->__selectionFeedbackGenerator;
}

- (UIView)_collectionViewSnapshot
{
  return self->__collectionViewSnapshot;
}

- (void)_setCollectionViewSnapshot:(id)a3
{
}

- (int64_t)_decelerationTargetIndex
{
  return self->__decelerationTargetIndex;
}

- (void)set_decelerationTargetIndex:(int64_t)a3
{
  self->__decelerationTargetIndedouble x = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__collectionViewSnapshot, 0);
  objc_storeStrong((id *)&self->__selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__edgeGradientView, 0);
  objc_storeStrong((id *)&self->__centerDotIndicatorView, 0);
  objc_storeStrong((id *)&self->__selectedItemTextOverlay, 0);
  objc_storeStrong((id *)&self->__selectedItemLoupe, 0);
  objc_storeStrong((id *)&self->__collectionView, 0);
  objc_storeStrong((id *)&self->__collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_customThumbailHiddenIndices, 0);
  objc_storeStrong((id *)&self->_customCenteredThumbnailOverlayView, 0);
  objc_storeStrong((id *)&self->_selectedThumbnailBorderColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end