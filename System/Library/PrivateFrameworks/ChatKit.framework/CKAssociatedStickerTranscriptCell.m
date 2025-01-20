@interface CKAssociatedStickerTranscriptCell
- (BOOL)gestureRecognizersEnabled;
- (BOOL)isReaction;
- (CKAssociatedStickerTranscriptCell)initWithFrame:(CGRect)a3;
- (IMSticker)sticker;
- (NSString)chatItemGUID;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)rotation;
- (int64_t)cachedStickerReactionRandomizationSource;
- (int64_t)stickerReactionIndex;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)doubleTapGestureRecognized:(id)a3;
- (void)layoutSubviewsForAlignmentContents;
- (void)layoutSubviewsForDrawer;
- (void)longPressGestureRecognized:(id)a3;
- (void)performDroppedWiggle:(id)a3;
- (void)performHide:(id)a3;
- (void)performInsertion:(id)a3;
- (void)performReload:(id)a3 completion:(id)a4;
- (void)performReveal:(id)a3;
- (void)performRevealAnimated:(BOOL)a3 completion:(id)a4;
- (void)performWiggleAnimationIfNeeded;
- (void)prepareForReuse;
- (void)setAssociatedItemView:(id)a3;
- (void)setCachedStickerReactionRandomizationSource:(int64_t)a3;
- (void)setChatItemGUID:(id)a3;
- (void)setGestureRecognizersEnabled:(BOOL)a3;
- (void)setIsReaction:(BOOL)a3;
- (void)setSticker:(id)a3;
- (void)setStickerReactionIndex:(int64_t)a3;
- (void)setStickerViewHidden:(BOOL)a3;
@end

@implementation CKAssociatedStickerTranscriptCell

- (void)performDroppedWiggle:(id)a3
{
  v21[7] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F39BD8];
  id v4 = a3;
  v5 = [v3 animationWithKeyPath:@"transform.rotation.z"];
  [v5 setValues:&unk_1EDF15A28];
  v6 = [v5 values];
  double v7 = 1.0 / (double)(unint64_t)[v6 count];

  v8 = [NSNumber numberWithDouble:v7];
  v21[0] = v8;
  v9 = [NSNumber numberWithDouble:v7 + v7];
  v21[1] = v9;
  v10 = [NSNumber numberWithDouble:v7 * 3.0];
  v21[2] = v10;
  v11 = [NSNumber numberWithDouble:v7 * 4.0];
  v21[3] = v11;
  v12 = [NSNumber numberWithDouble:v7 * 5.0];
  v21[4] = v12;
  v13 = [NSNumber numberWithDouble:v7 * 6.0];
  v21[5] = v13;
  v14 = [NSNumber numberWithDouble:v7 * 7.0];
  v21[6] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:7];
  [v5 setKeyTimes:v15];

  v16 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v5 setTimingFunction:v16];

  [v5 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [v5 setDuration:0.6];
  [v5 setRemovedOnCompletion:1];
  [v5 setFillMode:*MEMORY[0x1E4F39FA0]];
  LODWORD(v17) = 1.0;
  [v5 setSpeed:v17];
  v18 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  v19 = [v18 layer];
  [v19 addAnimation:v5 forKey:@"transform.rotation.z"];

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.6];
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v4];

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKAssociatedStickerTranscriptCell;
  id v12 = a3;
  [(CKAssociatedMessageTranscriptCell *)&v15 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = objc_msgSend(v12, "sticker", v15.receiver, v15.super_class);
  [(CKAssociatedStickerTranscriptCell *)self setSticker:v13];

  -[CKAssociatedStickerTranscriptCell setGestureRecognizersEnabled:](self, "setGestureRecognizersEnabled:", [v12 isFromMe] ^ 1);
  -[CKAssociatedStickerTranscriptCell setIsReaction:](self, "setIsReaction:", [v12 isReaction]);
  -[CKAssociatedStickerTranscriptCell setStickerReactionIndex:](self, "setStickerReactionIndex:", [v12 stickerReactionIndex]);
  v14 = [v12 guid];

  [(CKAssociatedStickerTranscriptCell *)self setChatItemGUID:v14];
}

- (CKAssociatedStickerTranscriptCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKAssociatedStickerTranscriptCell;
  v3 = -[CKTranscriptMessageContentCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v3 action:sel_longPressGestureRecognized_];
    longPressGestureRecognizer = v3->_longPressGestureRecognizer;
    v3->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v4;

    [(UILongPressGestureRecognizer *)v3->_longPressGestureRecognizer setMinimumPressDuration:0.5];
    [(UILongPressGestureRecognizer *)v3->_longPressGestureRecognizer setDelaysTouchesBegan:1];
    [(UILongPressGestureRecognizer *)v3->_longPressGestureRecognizer _setRequiresQuietImpulse:1];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel_doubleTapGestureRecognized_];
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = (UITapGestureRecognizer *)v6;

    [(UITapGestureRecognizer *)v3->_tapGestureRecognizer setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)v3->_tapGestureRecognizer setNumberOfTapsRequired:2];
  }
  return v3;
}

- (void)setAssociatedItemView:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];

  if (v5 != v4)
  {
    uint64_t v6 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];

    if (v6)
    {
      double v7 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
      v8 = [(CKAssociatedStickerTranscriptCell *)self longPressGestureRecognizer];
      [v7 removeGestureRecognizer:v8];

      objc_super v9 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
      v10 = [(CKAssociatedStickerTranscriptCell *)self tapGestureRecognizer];
      [v9 removeGestureRecognizer:v10];
    }
    v20.receiver = self;
    v20.super_class = (Class)CKAssociatedStickerTranscriptCell;
    [(CKAssociatedMessageTranscriptCell *)&v20 setAssociatedItemView:v4];
    if (v4)
    {
      [v4 setHidden:0];
      v11 = [v4 layer];
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      v19[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      v19[5] = v12;
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      v19[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      v19[7] = v13;
      long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      v19[0] = *MEMORY[0x1E4F39B10];
      v19[1] = v14;
      long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      v19[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      v19[3] = v15;
      [v11 setTransform:v19];

      v16 = [v4 layer];
      [v16 removeAllAnimations];

      double v17 = [(CKAssociatedStickerTranscriptCell *)self longPressGestureRecognizer];
      [v4 addGestureRecognizer:v17];

      v18 = [(CKAssociatedStickerTranscriptCell *)self tapGestureRecognizer];
      [v4 addGestureRecognizer:v18];

      [(CKAssociatedStickerTranscriptCell *)self setGestureRecognizersEnabled:1];
    }
  }
}

- (void)setGestureRecognizersEnabled:(BOOL)a3
{
  if (self->_gestureRecognizersEnabled != a3)
  {
    BOOL v3 = a3;
    self->_BOOL gestureRecognizersEnabled = a3;
    id v5 = [(CKAssociatedStickerTranscriptCell *)self longPressGestureRecognizer];
    [v5 setEnabled:v3];

    BOOL gestureRecognizersEnabled = self->_gestureRecognizersEnabled;
    id v7 = [(CKAssociatedStickerTranscriptCell *)self tapGestureRecognizer];
    [v7 setEnabled:gestureRecognizersEnabled];
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKAssociatedStickerTranscriptCell;
  [(CKAssociatedMessageTranscriptCell *)&v4 prepareForReuse];
  BOOL v3 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  [v3 setHidden:0];

  [(CKAssociatedStickerTranscriptCell *)self setGestureRecognizersEnabled:1];
  [(CKAssociatedStickerTranscriptCell *)self setSticker:0];
}

- (double)rotation
{
  int64_t v2 = [(CKAssociatedStickerTranscriptCell *)self cachedStickerReactionRandomizationSource];

  +[CKAssociatedMessageChatItem rotationForGUIDHash:v2];
  return result;
}

- (void)setChatItemGUID:(id)a3
{
  self->_cachedStickerReactionRandomizationSource = 0;
  objc_super v4 = (NSString *)[a3 copy];
  chatItemGUID = self->_chatItemGUID;
  self->_chatItemGUID = v4;
}

- (int64_t)cachedStickerReactionRandomizationSource
{
  int64_t result = self->_cachedStickerReactionRandomizationSource;
  if (!result)
  {
    objc_super v4 = [(CKAssociatedStickerTranscriptCell *)self chatItemGUID];
    self->_cachedStickerReactionRandomizationSource = [v4 hash];

    return self->_cachedStickerReactionRandomizationSource;
  }
  return result;
}

- (void)layoutSubviewsForAlignmentContents
{
  BOOL v3 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  objc_super v4 = [v3 layer];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v74 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v75 = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v76 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v77 = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v70 = *MEMORY[0x1E4F39B10];
  long long v71 = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v72 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v73 = v8;
  [v4 setTransform:&v70];

  v69.receiver = self;
  v69.super_class = (Class)CKAssociatedStickerTranscriptCell;
  [(CKAssociatedMessageTranscriptCell *)&v69 layoutSubviewsForAlignmentContents];
  objc_super v9 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  LODWORD(v9) = [(CKAssociatedStickerTranscriptCell *)self isReaction];
  [(CKAssociatedMessageTranscriptCell *)self adjustedContentAlignmentRect];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(CKAssociatedMessageTranscriptCell *)self size];
  +[CKAssociatedMessageChatItem adjustedParentFrameForPositioning:forItemSize:](CKAssociatedStickerChatItem, "adjustedParentFrameForPositioning:forItemSize:", v17, v19, v21, v23, v24, v25);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  if (v9)
  {
    int64_t v34 = [(CKAssociatedStickerTranscriptCell *)self stickerReactionIndex];
    BOOL v35 = [(CKAssociatedMessageTranscriptCell *)self parentIsFromMe];
    [(CKAssociatedMessageTranscriptCell *)self stickerReactionInsetsForParent];
    +[CKAssociatedMessageChatItem locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:](CKAssociatedMessageChatItem, "locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:", v34, v35, v27, v29, v31, v33, v36, v37, v38, v39);
    double v41 = v40;
    [(CKAssociatedMessageTranscriptCell *)self cumulativeAssociatedOffset];
    double v43 = v41 + v42;
    [(CKAssociatedMessageTranscriptCell *)self swipeToReplyLayoutOffset];
    double v45 = v43 + v44;
    *(void *)&long long v73 = 0;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v70 = 0u;
    [(CKAssociatedMessageTranscriptCell *)self geometryDescriptor];
    [(CKAssociatedStickerTranscriptCell *)self rotation];
    *(void *)&long long v73 = v46;
    *((void *)&v72 + 1) = 0x3FF0000000000000;
    *(void *)&long long v70 = 12;
    v67[0] = v70;
    v67[1] = v71;
    v67[2] = v72;
    uint64_t v68 = v46;
    [(CKAssociatedMessageTranscriptCell *)self setGeometryDescriptor:v67];
  }
  else
  {
    [(CKAssociatedMessageTranscriptCell *)self size];
    double v64 = v15;
    double v47 = v13;
    double v48 = v11;
    double v50 = v49;
    double v52 = v51;
    [(CKAssociatedMessageTranscriptCell *)self geometryDescriptor];
    double v53 = v50;
    double v11 = v48;
    double v13 = v47;
    double v15 = v64;
    +[CKAssociatedMessageChatItem horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:](CKAssociatedStickerChatItem, "horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", v66, v53, v52, v27, v29, v31, v33);
    double v55 = v54;
    [(CKAssociatedMessageTranscriptCell *)self cumulativeAssociatedOffset];
    double v57 = v56;
    [(CKAssociatedMessageTranscriptCell *)self swipeToReplyLayoutOffset];
    double v45 = v55 + v57 + v58;
  }
  v59 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  [(CKAssociatedMessageTranscriptCell *)self parentSize];
  double v61 = v60;
  double v63 = v62;
  [(CKAssociatedMessageTranscriptCell *)self geometryDescriptor];
  +[CKAssociatedMessageChatItem applyTransformToView:viewFrame:parentSize:forGeometryDescriptor:](CKAssociatedMessageChatItem, "applyTransformToView:viewFrame:parentSize:forGeometryDescriptor:", v59, v65, v45, v11, v13, v15, v61, v63);
}

- (void)layoutSubviewsForDrawer
{
  if ([(CKEditableCollectionViewCell *)self orientation] == 2
    || [(CKTranscriptMessageCell *)self wantsContactImageLayout])
  {
    v3.receiver = self;
    v3.super_class = (Class)CKAssociatedStickerTranscriptCell;
    [(CKTranscriptMessageContentCell *)&v3 layoutSubviewsForDrawer];
  }
}

- (void)performHide:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  objc_msgSend(v5, "ck_performHideAnimated:completion:", 1, v4);
}

- (void)performWiggleAnimationIfNeeded
{
  v1 = [a1 uniqueID];
  OUTLINED_FUNCTION_10(&dword_18EF18000, v2, v3, "CKAssociatedStickerTranscriptCell: Starting wobble for %@", v4, v5, v6, v7, 2u);
}

void __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_3(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained sticker];

  if (v4
    && ([v4 uniqueID],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 32) uniqueID],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqual:v6],
        v6,
        v5,
        v7))
  {
    +[CKAssociatedStickerChatItem removeDroppedSticker:*(void *)(a1 + 32)];
    long long v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_2((id *)(a1 + 32));
    }
  }
  else
  {
    long long v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_1(a1, v4, v8);
    }
  }
}

- (void)performReveal:(id)a3
{
}

- (void)performRevealAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  objc_msgSend(v7, "ck_performRevealAnimated:completion:", v4, v6);
}

- (void)performReload:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = (void (**)(id, uint64_t))a4;
  long long v8 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v8 center];
  double v33 = v17;
  double v31 = v18;
  if (v6) {
    v6[2](v6);
  }
  [(CKAssociatedStickerTranscriptCell *)self setNeedsLayout];
  [(CKAssociatedStickerTranscriptCell *)self layoutIfNeeded];
  [v8 bounds];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  [v8 center];
  double v32 = v27;
  double v30 = v28;
  v42.origin.x = v10;
  v42.origin.y = v12;
  v42.size.width = v14;
  v42.size.height = v16;
  v43.origin.x = v20;
  v43.origin.y = v22;
  v43.size.width = v24;
  v43.size.height = v26;
  if (CGRectEqualToRect(v42, v43) || v33 == v32 && v31 == v30)
  {
    if (v7) {
      v7[2](v7, 1);
    }
  }
  else
  {
    objc_msgSend(v8, "setBounds:", v10, v12, v14, v16);
    objc_msgSend(v8, "setCenter:", v33, v31);
    double v29 = (void *)MEMORY[0x1E4F42FF0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __62__CKAssociatedStickerTranscriptCell_performReload_completion___block_invoke;
    v34[3] = &unk_1E5621D50;
    id v35 = v8;
    CGFloat v36 = v20;
    CGFloat v37 = v22;
    CGFloat v38 = v24;
    CGFloat v39 = v26;
    double v40 = v32;
    double v41 = v30;
    [v29 animateWithDuration:0 delay:v34 options:v7 animations:0.25 completion:0.0];
  }
}

uint64_t __62__CKAssociatedStickerTranscriptCell_performReload_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 72);
  double v4 = *(double *)(a1 + 80);

  return objc_msgSend(v2, "setCenter:", v3, v4);
}

- (void)setStickerViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  [v4 setHidden:v3];
}

- (void)doubleTapGestureRecognized:(id)a3
{
  id v4 = [(CKAssociatedMessageTranscriptCell *)self delegate];
  [v4 associatedMessageTranscriptCellDoubleTapped:self];
}

- (void)longPressGestureRecognized:(id)a3
{
  if ([a3 state] == 1)
  {
    id v4 = [(CKAssociatedMessageTranscriptCell *)self delegate];
    [v4 associatedMessageTranscriptCellLongTouched:self];
  }
}

- (void)performInsertion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (BOOL)gestureRecognizersEnabled
{
  return self->_gestureRecognizersEnabled;
}

- (IMSticker)sticker
{
  return self->_sticker;
}

- (void)setSticker:(id)a3
{
}

- (BOOL)isReaction
{
  return self->_isReaction;
}

- (void)setIsReaction:(BOOL)a3
{
  self->_isReaction = a3;
}

- (int64_t)stickerReactionIndex
{
  return self->_stickerReactionIndex;
}

- (void)setStickerReactionIndex:(int64_t)a3
{
  self->_stickerReactionIndex = a3;
}

- (NSString)chatItemGUID
{
  return self->_chatItemGUID;
}

- (void)setCachedStickerReactionRandomizationSource:(int64_t)a3
{
  self->_cachedStickerReactionRandomizationSource = a3;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_chatItemGUID, 0);

  objc_storeStrong((id *)&self->_sticker, 0);
}

void __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) uniqueID];
  id v6 = [a2 uniqueID];
  int v7 = 138412546;
  long long v8 = v5;
  __int16 v9 = 2112;
  double v10 = v6;
  _os_log_debug_impl(&dword_18EF18000, a3, OS_LOG_TYPE_DEBUG, "CKAssociatedStickerTranscriptCell: did not remove dropped sticker because sticker changed!:  %@ vs %@", (uint8_t *)&v7, 0x16u);
}

void __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_2(id *a1)
{
  v1 = [*a1 uniqueID];
  OUTLINED_FUNCTION_10(&dword_18EF18000, v2, v3, "CKAssociatedStickerTranscriptCell: removeDroppedSticker:  %@", v4, v5, v6, v7, 2u);
}

void __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) uniqueID];
  OUTLINED_FUNCTION_10(&dword_18EF18000, v2, v3, "CKAssociatedStickerTranscriptCell: Finished wobble for %@", v4, v5, v6, v7, 2u);
}

@end