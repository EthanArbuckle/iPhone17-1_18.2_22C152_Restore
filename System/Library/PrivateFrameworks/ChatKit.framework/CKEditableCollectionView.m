@interface CKEditableCollectionView
- (BOOL)_ck_isEditing;
- (CKEditableCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (UIEdgeInsets)initialSafeAreaInsets;
- (UIEdgeInsets)marginInsets;
- (UIEdgeInsets)safeAreaInsets;
- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4;
- (void)_ck_setEditing:(BOOL)a3;
- (void)_ck_setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setInitialSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
@end

@implementation CKEditableCollectionView

- (CKEditableCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKEditableCollectionView;
  return -[CKEditableCollectionView initWithFrame:collectionViewLayout:](&v5, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  v4 = self;
  v10.receiver = self;
  v10.super_class = (Class)CKEditableCollectionView;
  objc_super v5 = [(CKEditableCollectionView *)&v10 dequeueReusableCellWithReuseIdentifier:a3 forIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = +[CKUIBehavior sharedBehaviors];
    int v8 = [v7 forceMinTranscriptMarginInsets];
    if (v8)
    {
      v4 = +[CKUIBehavior sharedBehaviors];
      [v4 minTranscriptMarginInsets];
    }
    else
    {
      [v4 marginInsets];
    }
    objc_msgSend(v6, "setMarginInsets:");
    if (v8) {
  }
    }

  return v5;
}

- (void)_ck_setEditing:(BOOL)a3
{
}

- (void)_ck_setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__ck_editing != a3)
  {
    self->__ck_editing = a3;
    if (!a3)
    {
      v7 = [(CKEditableCollectionView *)self indexPathsForSelectedItems];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__CKEditableCollectionView__ck_setEditing_animated___block_invoke;
      v12[3] = &unk_1E5628DE0;
      v12[4] = self;
      [v7 enumerateObjectsUsingBlock:v12];
    }
    int v8 = [(CKEditableCollectionView *)self indexPathsForVisibleItems];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__CKEditableCollectionView__ck_setEditing_animated___block_invoke_2;
    v9[3] = &unk_1E5628E08;
    v9[4] = self;
    BOOL v10 = a3;
    BOOL v11 = a4;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

uint64_t __52__CKEditableCollectionView__ck_setEditing_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:a2 animated:0];
}

void __52__CKEditableCollectionView__ck_setEditing_animated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) cellForItemAtIndexPath:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v3, "_ck_setEditing:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
  }
}

- (UIEdgeInsets)safeAreaInsets
{
  v29.receiver = self;
  v29.super_class = (Class)CKEditableCollectionView;
  [(CKEditableCollectionView *)&v29 safeAreaInsets];
  double v6 = v3;
  double v8 = v7;
  double v9 = v4;
  double v10 = v5;
  if (v7 == *(double *)(MEMORY[0x1E4F437F8] + 8)
    && v3 == *MEMORY[0x1E4F437F8]
    && v5 == *(double *)(MEMORY[0x1E4F437F8] + 24)
    && v4 == *(double *)(MEMORY[0x1E4F437F8] + 16))
  {
    [(CKEditableCollectionView *)self initialSafeAreaInsets];
    double v6 = v14;
    double v8 = v15;
    double v9 = v16;
    double v10 = v17;
  }
  if (v8 > 0.0 || v10 > 0.0)
  {
    v18 = [(CKEditableCollectionView *)self window];
    v19 = [v18 windowScene];

    if (v19 && (unint64_t)([v19 interfaceOrientation] - 3) <= 1)
    {
      v20 = +[CKUIBehavior sharedBehaviors];
      [v20 landscapeKeyboardInsets];
      double v22 = v21;
      double v24 = v23;

      if (v8 > 0.0) {
        double v8 = v22;
      }
      if (v10 > 0.0) {
        double v10 = v24;
      }
    }
  }
  double v25 = v6;
  double v26 = v8;
  double v27 = v9;
  double v28 = v10;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
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

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

- (UIEdgeInsets)initialSafeAreaInsets
{
  double top = self->_initialSafeAreaInsets.top;
  double left = self->_initialSafeAreaInsets.left;
  double bottom = self->_initialSafeAreaInsets.bottom;
  double right = self->_initialSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInitialSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_initialSafeAreaInsets = a3;
}

- (BOOL)_ck_isEditing
{
  return self->__ck_editing;
}

@end