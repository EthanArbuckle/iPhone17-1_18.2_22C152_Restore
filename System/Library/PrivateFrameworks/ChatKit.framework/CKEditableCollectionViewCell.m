@interface CKEditableCollectionViewCell
+ (Class)_contentViewClass;
- (BOOL)_ck_isEditing;
- (BOOL)isAnimatingInDarkEffect;
- (BOOL)isInReplyContext;
- (BOOL)shouldReturnActualVEV;
- (BOOL)wantsDrawerLayout;
- (CGRect)contentAlignmentRect;
- (NSString)description;
- (UIEdgeInsets)_horizontalSafeAreaInsets;
- (UIEdgeInsets)contentAlignmentInsets;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)marginInsets;
- (UIImageView)checkmark;
- (char)orientation;
- (double)associatedItemOffset;
- (double)drawerPercentRevealed;
- (id)contentView;
- (int64_t)editingStyle;
- (void)_animateVisibility:(BOOL)a3 completion:(id)a4;
- (void)_ck_setEditing:(BOOL)a3;
- (void)_ck_setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateVisibility:(BOOL)a3;
- (void)layoutSubviews;
- (void)performHide:(id)a3;
- (void)performInsertion:(id)a3;
- (void)performReload:(id)a3 completion:(id)a4;
- (void)performRemoval:(id)a3;
- (void)performReveal:(id)a3;
- (void)performRevealAnimated:(BOOL)a3 completion:(id)a4;
- (void)setAssociatedItemOffset:(double)a3;
- (void)setCheckmark:(id)a3;
- (void)setContentAlignmentRect:(CGRect)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDrawerPercentRevealed:(double)a3;
- (void)setEditingStyle:(int64_t)a3;
- (void)setEffect:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsAnimatingInDarkEffect:(BOOL)a3;
- (void)setIsInReplyContext:(BOOL)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setOrientation:(char)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShouldReturnActualVEV:(BOOL)a3;
- (void)setWantsDrawerLayout:(BOOL)a3;
- (void)updateCheckmarkImage;
@end

@implementation CKEditableCollectionViewCell

+ (Class)_contentViewClass
{
  v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 transcriptCellsNeedVibrancy];

  if (v4)
  {
    v5 = objc_opt_class();
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKEditableCollectionViewCell;
    v5 = objc_msgSendSuper2(&v7, sel__contentViewClass);
  }

  return (Class)v5;
}

- (void)setEffect:(id)a3
{
  id v7 = a3;
  self->_shouldReturnActualVEV = 1;
  int v4 = [(CKEditableCollectionViewCell *)self contentView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(CKEditableCollectionViewCell *)self contentView];
    [v6 setEffect:v7];
  }
  self->_shouldReturnActualVEV = 0;
}

- (id)contentView
{
  v7.receiver = self;
  v7.super_class = (Class)CKEditableCollectionViewCell;
  v3 = [(CKEditableCollectionViewCell *)&v7 contentView];
  int v4 = +[CKUIBehavior sharedBehaviors];
  if (![v4 transcriptCellsNeedVibrancy]) {
    goto LABEL_5;
  }
  BOOL shouldReturnActualVEV = self->_shouldReturnActualVEV;

  if (!shouldReturnActualVEV)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 contentView];
      v3 = int v4 = v3;
LABEL_5:
    }
  }

  return v3;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKEditableCollectionViewCell;
  int v4 = [(CKEditableCollectionViewCell *)&v8 description];
  [(CKEditableCollectionViewCell *)self contentAlignmentInsets];
  v5 = NSStringFromUIEdgeInsets(v10);
  v6 = [v3 stringWithFormat:@"%@ contentAlignmentInsets:%@", v4, v5];

  return (NSString *)v6;
}

- (void)layoutSubviews
{
  v61.receiver = self;
  v61.super_class = (Class)CKEditableCollectionViewCell;
  [(CKEditableCollectionViewCell *)&v61 layoutSubviews];
  v3 = [(CKEditableCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F42FF0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[CKEditableCollectionViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  v13 = [(CKEditableCollectionViewCell *)self checkmark];
  v14 = v13;
  if (!v13) {
    goto LABEL_19;
  }
  double v59 = v9;
  double v57 = v5;
  [v13 sizeToFit];
  [v14 bounds];
  double v16 = v15;
  double rect = v17;
  double v18 = v7 + v11 * 0.5 - v17 * 0.5;
  v19 = [(CKEditableCollectionViewCell *)self traitCollection];
  [v19 displayScale];
  double v21 = round(v20 * v18) / v20;
  v22 = [(CKEditableCollectionViewCell *)self traitCollection];
  [v22 displayScale];
  double v24 = round(v16 * v23) / v23;

  double v58 = v21;
  if ([(CKEditableCollectionViewCell *)self _ck_isEditing])
  {
    v25 = +[CKUIBehavior sharedBehaviors];
    if ([v25 forceMinTranscriptMarginInsets])
    {
      v26 = +[CKUIBehavior sharedBehaviors];
      [v26 minTranscriptMarginInsets];
      double v28 = v27;
      double v30 = v29;
    }
    else
    {
      [(CKEditableCollectionViewCell *)self marginInsets];
      double v28 = v38;
      double v30 = v39;
    }

    v40 = +[CKUIBehavior sharedBehaviors];
    [v40 editingCheckmarkLeadingPadding];
    double v42 = v41;
    double v31 = 0.0;
    v62.origin.x = 0.0;
    v62.origin.y = v21;
    v62.size.width = v24;
    v62.size.height = rect;
    double v43 = v42 + CGRectGetWidth(v62);
    v44 = +[CKUIBehavior sharedBehaviors];
    [v44 editingCheckmarkTrailingPadding];
    double v46 = v45;

    if (v12 == 1) {
      double v47 = v30;
    }
    else {
      double v47 = v28;
    }
    double v34 = v43 - v47 + v46;
    v35 = +[CKUIBehavior sharedBehaviors];
    [v35 editingCheckmarkLeadingPadding];
    if (v12 == 1)
    {
      double v37 = v59 - v48 - v24;
      double v32 = 0.0;
      double v33 = 0.0;
    }
    else
    {
      double v37 = v48;
      double v32 = v34;
      double v33 = 0.0;
      double v34 = 0.0;
    }
    goto LABEL_15;
  }
  double v31 = *MEMORY[0x1E4F437F8];
  double v32 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v33 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v34 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  if (v12 == 1)
  {
    v35 = +[CKUIBehavior sharedBehaviors];
    [v35 editingCheckmarkLeadingPadding];
    double v37 = v59 + v36;
LABEL_15:

    goto LABEL_16;
  }
  v63.origin.x = 0.0;
  v63.origin.y = v58;
  v63.size.width = v24;
  v63.size.height = rect;
  double v37 = -CGRectGetMaxX(v63);
LABEL_16:
  double v7 = v7 + v31;
  double v9 = v59 - (v32 + v34);
  double v49 = v31 + v33;
  double v5 = v57 + v32;
  double v11 = v11 - v49;
  [(CKEditableCollectionViewCell *)self _horizontalSafeAreaInsets];
  double v52 = -v51;
  if (v12 != 1) {
    double v52 = v50;
  }
  objc_msgSend(v14, "setFrame:", v37 + v52, v58, v24, rect);
LABEL_19:
  [(CKEditableCollectionViewCell *)self contentAlignmentInsets];
  -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v5 + v56, v7 + v53, v9 - (v56 + v54), v11 - (v53 + v55));
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKEditableCollectionViewCell;
  [(CKEditableCollectionViewCell *)&v4 setSelected:a3];
  if ([(CKEditableCollectionViewCell *)self _ck_isEditing]) {
    [(CKEditableCollectionViewCell *)self updateCheckmarkImage];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKEditableCollectionViewCell;
  [(CKEditableCollectionViewCell *)&v4 setHighlighted:a3];
  if ([(CKEditableCollectionViewCell *)self _ck_isEditing]) {
    [(CKEditableCollectionViewCell *)self updateCheckmarkImage];
  }
}

- (void)_ck_setEditing:(BOOL)a3
{
}

- (void)_ck_setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(CKEditableCollectionViewCell *)self checkmark];
  if (v7 || ![(CKEditableCollectionViewCell *)self editingStyle])
  {
    double v8 = [(CKEditableCollectionViewCell *)self checkmark];
    if (v8) {
      BOOL v9 = [(CKEditableCollectionViewCell *)self editingStyle] == 0;
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  if (self->__ck_editing != v5 || v9 && v5)
  {
    if (v5 && [(CKEditableCollectionViewCell *)self editingStyle])
    {
      id v11 = objc_alloc(MEMORY[0x1E4F42AA0]);
      uint64_t v12 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CKEditableCollectionViewCell *)self addSubview:v12];
      [(CKEditableCollectionViewCell *)self setCheckmark:v12];
      objc_msgSend(v12, "setHidden:", -[CKEditableCollectionViewCell editingStyle](self, "editingStyle") != 2);
      [(CKEditableCollectionViewCell *)self updateCheckmarkImage];
    }
    if (v4)
    {
      [(CKEditableCollectionViewCell *)self setNeedsLayout];
      [(CKEditableCollectionViewCell *)self layoutIfNeeded];
    }
    self->__ck_editing = v5;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__CKEditableCollectionViewCell__ck_setEditing_animated___block_invoke;
    aBlock[3] = &unk_1E5620C40;
    aBlock[4] = self;
    v13 = (void (**)(void))_Block_copy(aBlock);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__CKEditableCollectionViewCell__ck_setEditing_animated___block_invoke_2;
    v15[3] = &unk_1E56287B0;
    BOOL v16 = v5;
    v15[4] = self;
    v14 = (void (**)(void *, uint64_t))_Block_copy(v15);
    if (v4)
    {
      [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v13 options:v14 animations:0.300000012 completion:0.0];
    }
    else
    {
      v13[2](v13);
      v14[2](v14, 1);
    }
  }
}

uint64_t __56__CKEditableCollectionViewCell__ck_setEditing_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

void __56__CKEditableCollectionViewCell__ck_setEditing_animated___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40) || ![*(id *)(a1 + 32) editingStyle])
  {
    id v2 = [*(id *)(a1 + 32) checkmark];
    [v2 removeFromSuperview];
    [*(id *)(a1 + 32) setCheckmark:0];
  }
}

- (void)setEditingStyle:(int64_t)a3
{
  self->_editingStyle = a3;
  BOOL v4 = [(CKEditableCollectionViewCell *)self _ck_isEditing];

  [(CKEditableCollectionViewCell *)self _ck_setEditing:v4];
}

- (UIEdgeInsets)contentAlignmentInsets
{
  CGFloat v2 = self->_contentInsets.top + self->_marginInsets.top;
  CGFloat v3 = self->_contentInsets.left + self->_marginInsets.left;
  CGFloat v4 = self->_contentInsets.bottom + self->_marginInsets.bottom;
  CGFloat v5 = self->_contentInsets.right + self->_marginInsets.right;
  [(CKEditableCollectionViewCell *)self _horizontalSafeAreaInsets];
  double v7 = v2 + v6;
  double v9 = v3 + v8;
  double v11 = v4 + v10;
  double v13 = v5 + v12;
  result.right = v13;
  result.bottom = v11;
  result.left = v9;
  result.top = v7;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(CKEditableCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  if (self->_marginInsets.left != a3.left
    || self->_marginInsets.top != a3.top
    || self->_marginInsets.right != a3.right
    || self->_marginInsets.bottom != a3.bottom)
  {
    self->_marginInsets = a3;
    [(CKEditableCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)performInsertion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (void)performRemoval:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (void)performReload:(id)a3 completion:(id)a4
{
  double v6 = (void (**)(void))a3;
  CGFloat v5 = (void (**)(id, uint64_t))a4;
  if (v6) {
    v6[2](v6);
  }
  if (v5) {
    v5[2](v5, 1);
  }
}

- (void)performHide:(id)a3
{
}

- (void)performReveal:(id)a3
{
}

- (void)performRevealAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (v4)
  {
    [(CKEditableCollectionViewCell *)self performReveal:v7];
  }
  else
  {
    [(CKEditableCollectionViewCell *)self _updateVisibility:1];
    double v6 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    (*((void (**)(void))v7 + 2))();
  }
  double v6 = v7;
LABEL_6:
}

- (void)_animateVisibility:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F42FF0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__CKEditableCollectionViewCell__animateVisibility_completion___block_invoke;
  v11[3] = &unk_1E5622A18;
  v11[4] = self;
  BOOL v12 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__CKEditableCollectionViewCell__animateVisibility_completion___block_invoke_2;
  v9[3] = &unk_1E5622358;
  id v10 = v6;
  id v8 = v6;
  [v7 transitionWithView:self duration:5242880 options:v11 animations:v9 completion:0.3];
}

uint64_t __62__CKEditableCollectionViewCell__animateVisibility_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVisibility:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __62__CKEditableCollectionViewCell__animateVisibility_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateVisibility:(BOOL)a3
{
}

- (UIEdgeInsets)_horizontalSafeAreaInsets
{
  [(CKEditableCollectionViewCell *)self safeAreaInsets];
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (void)updateCheckmarkImage
{
  char v3 = [(CKEditableCollectionViewCell *)self isSelected];
  double v4 = +[CKUIBehavior sharedBehaviors];
  double v5 = v4;
  if (v3) {
    [v4 transcriptEditingSelectedImage];
  }
  else {
  id v7 = [v4 transcriptEditingUnselectedImage];
  }

  id v6 = [(CKEditableCollectionViewCell *)self checkmark];
  [v6 setImage:v7];
}

- (BOOL)wantsDrawerLayout
{
  return self->_wantsDrawerLayout;
}

- (void)setWantsDrawerLayout:(BOOL)a3
{
  self->_wantsDrawerLayout = a3;
}

- (char)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(char)a3
{
  self->_orientation = a3;
}

- (CGRect)contentAlignmentRect
{
  double x = self->_contentAlignmentRect.origin.x;
  double y = self->_contentAlignmentRect.origin.y;
  double width = self->_contentAlignmentRect.size.width;
  double height = self->_contentAlignmentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentAlignmentRect:(CGRect)a3
{
  self->_contentAlignmentRect = a3;
}

- (double)drawerPercentRevealed
{
  return self->_drawerPercentRevealed;
}

- (void)setDrawerPercentRevealed:(double)a3
{
  self->_drawerPercentRevealed = a3;
}

- (double)associatedItemOffset
{
  return self->_associatedItemOffset;
}

- (void)setAssociatedItemOffset:(double)a3
{
  self->_associatedItemOffset = a3;
}

- (BOOL)isAnimatingInDarkEffect
{
  return self->_isAnimatingInDarkEffect;
}

- (void)setIsAnimatingInDarkEffect:(BOOL)a3
{
  self->_isAnimatingInDarkEffect = a3;
}

- (BOOL)isInReplyContext
{
  return self->_isInReplyContext;
}

- (void)setIsInReplyContext:(BOOL)a3
{
  self->_isInReplyContext = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)marginInsets
{
  double top = self->_marginInsets.top;
  double left = self->_marginInsets.left;
  double bottom = self->_marginInsets.bottom;
  double right = self->_marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)_ck_isEditing
{
  return self->__ck_editing;
}

- (int64_t)editingStyle
{
  return self->_editingStyle;
}

- (UIImageView)checkmark
{
  return self->_checkmark;
}

- (void)setCheckmark:(id)a3
{
}

- (BOOL)shouldReturnActualVEV
{
  return self->_shouldReturnActualVEV;
}

- (void)setShouldReturnActualVEV:(BOOL)a3
{
  self->_BOOL shouldReturnActualVEV = a3;
}

- (void).cxx_destruct
{
}

@end