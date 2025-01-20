@interface CKAssociatedMessageTranscriptCell
- (BOOL)failureButtonAdjustsContentAlignmentRect;
- (BOOL)parentIsFromMe;
- (CGRect)adjustedContentAlignmentRect;
- (CGRect)associatedViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4;
- (CGRect)rawAssociatedItemViewFrame;
- (CGSize)parentSize;
- (CGSize)size;
- (CKAssociatedMessageTranscriptCellDelegate)delegate;
- (CKTranscriptCollectionViewLayoutAttributes)layoutAttributes;
- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor;
- (UIEdgeInsets)stickerReactionInsetsForParent;
- (UIView)associatedItemView;
- (VKCStickerEffectView)effectView;
- (double)cumulativeAssociatedOffset;
- (double)parentRotationOffset;
- (double)swipeToReplyDelta;
- (double)swipeToReplyLayoutOffset;
- (id)debugBorderColor;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)addFilter:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)clearFilters;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)performReload:(id)a3 completion:(id)a4;
- (void)prepareForReuse;
- (void)setAssociatedItemView:(id)a3;
- (void)setCumulativeAssociatedOffset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a3;
- (void)setLayoutAttributes:(id)a3;
- (void)setParentIsFromMe:(BOOL)a3;
- (void)setParentRotationOffset:(double)a3;
- (void)setParentSize:(CGSize)a3;
- (void)setRawAssociatedItemViewFrame:(CGRect)a3;
- (void)setSize:(CGSize)a3;
- (void)setStickerReactionInsetsForParent:(UIEdgeInsets)a3;
- (void)setSwipeToReplyDelta:(double)a3;
@end

@implementation CKAssociatedMessageTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKAssociatedMessageTranscriptCell;
  [(CKTranscriptMessageContentCell *)&v15 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  if (v12)
  {
    [v12 geometryDescriptor];
  }
  else
  {
    uint64_t v14 = 0;
    memset(v13, 0, sizeof(v13));
  }
  [(CKAssociatedMessageTranscriptCell *)self setGeometryDescriptor:v13];
  [v12 size];
  -[CKAssociatedMessageTranscriptCell setSize:](self, "setSize:");
  -[CKTranscriptMessageCell setFailed:](self, "setFailed:", [v12 failed]);
  [(CKAssociatedMessageTranscriptCell *)self setNeedsLayout];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CKAssociatedMessageTranscriptCell;
  -[CKAssociatedMessageTranscriptCell hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CKAssociatedMessageTranscriptCell *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || ([(CKEditableCollectionViewCell *)self contentView],
        v6 = (CKAssociatedMessageTranscriptCell *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {

    v5 = 0;
  }

  return v5;
}

- (BOOL)failureButtonAdjustsContentAlignmentRect
{
  return 0;
}

- (void)applyLayoutAttributes:(id)a3
{
  v4 = (double *)a3;
  if (![(CKTranscriptCollectionViewLayoutAttributes *)self->_layoutAttributes isEqual:v4])
  {
    v5.receiver = self;
    v5.super_class = (Class)CKAssociatedMessageTranscriptCell;
    [(CKAssociatedMessageTranscriptCell *)&v5 applyLayoutAttributes:v4];
    [(CKAssociatedMessageTranscriptCell *)self setLayoutAttributes:v4];
    if (v4[56] > 0.0) {
      [(CKAssociatedMessageTranscriptCell *)self setNeedsLayout];
    }
  }
}

- (void)setAssociatedItemView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  p_associatedItemView = &self->_associatedItemView;
  associatedItemView = self->_associatedItemView;
  if (associatedItemView != v5)
  {
    v13 = v5;
    if (associatedItemView) {
      [(UIView *)associatedItemView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_associatedItemView, a3);
    [(UIView *)v13 frame];
    self->_rawAssociatedItemViewFrame.origin.x = v8;
    self->_rawAssociatedItemViewFrame.origin.y = v9;
    self->_rawAssociatedItemViewFrame.size.width = v10;
    self->_rawAssociatedItemViewFrame.size.height = v11;
    if (*p_associatedItemView)
    {
      id v12 = [(CKEditableCollectionViewCell *)self contentView];
      [v12 addSubview:*p_associatedItemView];
    }
    [(CKAssociatedMessageTranscriptCell *)self setNeedsLayout];
    objc_super v5 = v13;
  }
}

- (void)layoutSubviewsForAlignmentContents
{
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CKAssociatedMessageTranscriptCell *)self rawAssociatedItemViewFrame];
  double v12 = v11;
  double v14 = v13;
  [(CKAssociatedMessageTranscriptCell *)self size];
  -[CKAssociatedMessageTranscriptCell associatedViewFrame:inContainerFrame:](self, "associatedViewFrame:inContainerFrame:", v12, v14, v15, v16, v4, v6, v8, v10);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [(CKAssociatedMessageTranscriptCell *)self swipeToReplyLayoutOffset];
  if (v25 != 0.0)
  {
    [(CKAssociatedMessageTranscriptCell *)self swipeToReplyLayoutOffset];
    double v18 = v18 + v26;
  }
  v27 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  objc_msgSend(v27, "setFrame:", v18, v20, v22, v24);

  id v28 = [(CKTranscriptMessageContentCell *)self drawerLabel];
  [v28 setHidden:1];
}

- (CGRect)associatedViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if ([(CKEditableCollectionViewCell *)self orientation])
  {
    v15.origin.double x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    double x = CGRectGetMaxX(v15) - v9;
  }
  double v11 = x;
  double v12 = v10;
  double v13 = v9;
  double v14 = v8;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.double x = v11;
  return result;
}

- (double)swipeToReplyLayoutOffset
{
  uint64_t v3 = [(CKAssociatedMessageTranscriptCell *)self layoutAttributes];
  double v4 = (void *)v3;
  if (!v3 || (double v5 = *(double *)(v3 + 448), v5 <= 0.0))
  {
    [(CKAssociatedMessageTranscriptCell *)self swipeToReplyDelta];
    double v5 = v6;
  }

  return v5;
}

- (void)performReload:(id)a3 completion:(id)a4
{
  double v6 = (void (**)(void))a3;
  double v7 = (void (**)(id, uint64_t))a4;
  CGFloat v8 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  if (v6) {
    v6[2](v6);
  }
  [(CKAssociatedMessageTranscriptCell *)self setNeedsLayout];
  [(CKAssociatedMessageTranscriptCell *)self layoutIfNeeded];
  double v17 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  [v17 frame];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v28.origin.double x = v10;
  v28.origin.CGFloat y = v12;
  v28.size.CGFloat width = v14;
  v28.size.CGFloat height = v16;
  v29.origin.double x = v19;
  v29.origin.CGFloat y = v21;
  v29.size.CGFloat width = v23;
  v29.size.CGFloat height = v25;
  if (CGRectEqualToRect(v28, v29))
  {
    if (v7) {
      v7[2](v7, 1);
    }
  }
  else
  {
    double v26 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
    objc_msgSend(v26, "setFrame:", v10, v12, v14, v16);

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __62__CKAssociatedMessageTranscriptCell_performReload_completion___block_invoke;
    v27[3] = &unk_1E5621968;
    v27[4] = self;
    *(CGFloat *)&v27[5] = v19;
    *(CGFloat *)&v27[6] = v21;
    *(CGFloat *)&v27[7] = v23;
    *(CGFloat *)&v27[8] = v25;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v27 options:v7 animations:0.25 completion:0.0];
  }
}

void __62__CKAssociatedMessageTranscriptCell_performReload_completion___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) associatedItemView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKAssociatedMessageTranscriptCell;
  [(CKTranscriptCell *)&v4 prepareForReuse];
  [(CKAssociatedMessageTranscriptCell *)self clearFilters];
  [(CKAssociatedMessageTranscriptCell *)self setLayoutAttributes:0];
  [(CKAssociatedMessageTranscriptCell *)self setCumulativeAssociatedOffset:0.0];
  -[CKAssociatedMessageTranscriptCell setParentSize:](self, "setParentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [(CKAssociatedMessageTranscriptCell *)self setParentRotationOffset:0.0];
  double v3 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  [v3 removeFromSuperview];

  [(CKAssociatedMessageTranscriptCell *)self setAssociatedItemView:0];
  [(CKAssociatedMessageTranscriptCell *)self setDelegate:0];
}

- (void)addFilter:(id)a3
{
  id v6 = a3;
  double v7 = [v6 balloonFilters];

  if (v7)
  {
    CGFloat v8 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
    double v9 = [v8 layer];
    double v10 = [v9 filters];
    if (v10)
    {
      double v18 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
      double v17 = [v18 layer];
      double v3 = [v17 filters];
      objc_super v4 = [v6 balloonFilters];
      [v3 arrayByAddingObjectsFromArray:v4];
    }
    else
    {
      [v6 balloonFilters];
    double v11 = };
    double v12 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
    double v13 = [v12 layer];
    [v13 setFilters:v11];

    if (v10)
    {

      double v11 = v18;
    }
  }
  [v6 contentAlpha];
  double v15 = v14;
  double v16 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  [v16 setAlpha:v15];

  v19.receiver = self;
  v19.super_class = (Class)CKAssociatedMessageTranscriptCell;
  [(CKEditableCollectionViewCell *)&v19 addFilter:v6];
}

- (void)clearFilters
{
  double v3 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  objc_super v4 = [v3 layer];
  [v4 setFilters:0];

  id v5 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  [v5 setAlpha:1.0];

  v6.receiver = self;
  v6.super_class = (Class)CKAssociatedMessageTranscriptCell;
  [(CKEditableCollectionViewCell *)&v6 clearFilters];
}

- (CGRect)adjustedContentAlignmentRect
{
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CKAssociatedMessageTranscriptCell *)self parentSize];
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [(CKEditableCollectionViewCell *)self orientation];

  +[CKAssociatedMessageChatItem adjustContentAlignmentRect:forChatItemSize:transcriptOrientation:](CKAssociatedMessageChatItem, "adjustContentAlignmentRect:forChatItemSize:transcriptOrientation:", v15, v4, v6, v8, v10, v12, v14);
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.double x = v16;
  return result;
}

- (id)debugBorderColor
{
  return (id)[MEMORY[0x1E4F428B8] purpleColor];
}

- (CKAssociatedMessageTranscriptCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAssociatedMessageTranscriptCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)associatedItemView
{
  return self->_associatedItemView;
}

- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor
{
  long long v3 = *(_OWORD *)&self[19].scale;
  *(_OWORD *)&retstr->layoutIntent = *(_OWORD *)&self[19].xScalar;
  *(_OWORD *)&retstr->parentPreviewWidth = v3;
  *(_OWORD *)&retstr->yScalar = *(_OWORD *)&self[20].layoutIntent;
  retstr->rotation = self[20].parentPreviewWidth;
  return self;
}

- (void)setGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a3
{
  long long v4 = *(_OWORD *)&a3->parentPreviewWidth;
  long long v3 = *(_OWORD *)&a3->yScalar;
  long long v5 = *(_OWORD *)&a3->layoutIntent;
  self->_geometryDescriptor.rotation = a3->rotation;
  *(_OWORD *)&self->_geometryDescriptor.parentPreviewWidth = v4;
  *(_OWORD *)&self->_geometryDescriptor.yScalar = v3;
  *(_OWORD *)&self->_geometryDescriptor.layoutIntent = v5;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)parentSize
{
  double width = self->_parentSize.width;
  double height = self->_parentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setParentSize:(CGSize)a3
{
  self->_parentSize = a3;
}

- (BOOL)parentIsFromMe
{
  return self->_parentIsFromMe;
}

- (void)setParentIsFromMe:(BOOL)a3
{
  self->_parentIsFromMe = a3;
}

- (UIEdgeInsets)stickerReactionInsetsForParent
{
  double top = self->_stickerReactionInsetsForParent.top;
  double left = self->_stickerReactionInsetsForParent.left;
  double bottom = self->_stickerReactionInsetsForParent.bottom;
  double right = self->_stickerReactionInsetsForParent.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setStickerReactionInsetsForParent:(UIEdgeInsets)a3
{
  self->_stickerReactionInsetsForParent = a3;
}

- (double)parentRotationOffset
{
  return self->_parentRotationOffset;
}

- (void)setParentRotationOffset:(double)a3
{
  self->_parentRotationOffset = a3;
}

- (double)cumulativeAssociatedOffset
{
  return self->_cumulativeAssociatedOffset;
}

- (void)setCumulativeAssociatedOffset:(double)a3
{
  self->_cumulativeAssociatedOffset = a3;
}

- (double)swipeToReplyDelta
{
  return self->_swipeToReplyDelta;
}

- (void)setSwipeToReplyDelta:(double)a3
{
  self->_swipeToReplyDelta = a3;
}

- (VKCStickerEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (CKTranscriptCollectionViewLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
}

- (CGRect)rawAssociatedItemViewFrame
{
  double x = self->_rawAssociatedItemViewFrame.origin.x;
  double y = self->_rawAssociatedItemViewFrame.origin.y;
  double width = self->_rawAssociatedItemViewFrame.size.width;
  double height = self->_rawAssociatedItemViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRawAssociatedItemViewFrame:(CGRect)a3
{
  self->_rawAssociatedItemViewFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_associatedItemView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end