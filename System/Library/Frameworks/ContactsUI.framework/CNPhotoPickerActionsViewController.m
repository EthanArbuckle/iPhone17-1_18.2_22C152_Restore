@interface CNPhotoPickerActionsViewController
+ (id)log;
- (CAShapeLayer)clippingLayer;
- (CNPhotoPickerActionButton)deleteButton;
- (CNPhotoPickerActionButton)duplicateButton;
- (CNPhotoPickerActionButton)editButton;
- (CNPhotoPickerActionsModel)actionsModel;
- (CNPhotoPickerActionsViewController)initWithActionsModel:(id)a3;
- (CNPhotoPickerActionsViewControllerDelegate)delegate;
- (CNPhotoPickerActionsViewControllerLayout)currentLayout;
- (UIStackView)buttonsView;
- (UIView)imageContainerView;
- (UIView)transitionContainerView;
- (double)deleteMoveInDelay;
- (double)deleteMoveInDuration;
- (double)duplicateScaleDelay;
- (double)duplicateScaleDuration;
- (void)actionsModel:(id)a3 didAssignToContact:(id)a4 atIndexPath:(id)a5;
- (void)actionsModel:(id)a3 didDelete:(id)a4 atIndexPath:(id)a5 withSourceView:(id)a6;
- (void)actionsModel:(id)a3 didDuplicate:(id)a4 atIndexPath:(id)a5 completionBlock:(id)a6;
- (void)actionsModel:(id)a3 didEdit:(id)a4 atIndexPath:(id)a5;
- (void)applyLayout:(id)a3;
- (void)didTapDone;
- (void)layoutViewFromModel:(id)a3;
- (void)performDeleteTransitionToItem:(id)a3;
- (void)performDuplicateTransitionToItem:(id)a3 fromView:(id)a4 completionBlock:(id)a5;
- (void)presentDeleteConfirmationWithSourceView:(id)a3 withCompletion:(id)a4;
- (void)setActionsModel:(id)a3;
- (void)setButtonsView:(id)a3;
- (void)setClippingLayer:(id)a3;
- (void)setCurrentLayout:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setDuplicateButton:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setImageContainerView:(id)a3;
- (void)setTransitionContainerView:(id)a3;
- (void)updateActionsModelWithProviderItem:(id)a3;
- (void)updateButtonsFromModel:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CNPhotoPickerActionsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_duplicateButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_clippingLayer, 0);
  objc_storeStrong((id *)&self->_transitionContainerView, 0);
  objc_storeStrong((id *)&self->_imageContainerView, 0);
  objc_storeStrong((id *)&self->_buttonsView, 0);
  objc_storeStrong((id *)&self->_actionsModel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCurrentLayout:(id)a3
{
}

- (CNPhotoPickerActionsViewControllerLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setDeleteButton:(id)a3
{
}

- (CNPhotoPickerActionButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDuplicateButton:(id)a3
{
}

- (CNPhotoPickerActionButton)duplicateButton
{
  return self->_duplicateButton;
}

- (void)setEditButton:(id)a3
{
}

- (CNPhotoPickerActionButton)editButton
{
  return self->_editButton;
}

- (void)setClippingLayer:(id)a3
{
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setTransitionContainerView:(id)a3
{
}

- (UIView)transitionContainerView
{
  return self->_transitionContainerView;
}

- (void)setImageContainerView:(id)a3
{
}

- (UIView)imageContainerView
{
  return self->_imageContainerView;
}

- (void)setButtonsView:(id)a3
{
}

- (UIStackView)buttonsView
{
  return self->_buttonsView;
}

- (void)setActionsModel:(id)a3
{
}

- (CNPhotoPickerActionsModel)actionsModel
{
  return self->_actionsModel;
}

- (void)setDelegate:(id)a3
{
}

- (CNPhotoPickerActionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPhotoPickerActionsViewControllerDelegate *)WeakRetained;
}

- (void)actionsModel:(id)a3 didDelete:(id)a4 atIndexPath:(id)a5 withSourceView:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__CNPhotoPickerActionsViewController_actionsModel_didDelete_atIndexPath_withSourceView___block_invoke;
  v13[3] = &unk_1E549B738;
  v13[4] = self;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [(CNPhotoPickerActionsViewController *)self presentDeleteConfirmationWithSourceView:a6 withCompletion:v13];
}

void __88__CNPhotoPickerActionsViewController_actionsModel_didDelete_atIndexPath_withSourceView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 photoPickerActionsViewController:*(void *)(a1 + 32) didPerformAction:3 withProviderItem:*(void *)(a1 + 40) atIndexPath:*(void *)(a1 + 48)];
}

- (void)actionsModel:(id)a3 didDuplicate:(id)a4 atIndexPath:(id)a5 completionBlock:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__CNPhotoPickerActionsViewController_actionsModel_didDuplicate_atIndexPath_completionBlock___block_invoke;
  v16[3] = &unk_1E549A940;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [(CNPhotoPickerActionsViewController *)self performDuplicateTransitionToItem:v15 fromView:v12 completionBlock:v16];
}

uint64_t __92__CNPhotoPickerActionsViewController_actionsModel_didDuplicate_atIndexPath_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 photoPickerActionsViewController:*(void *)(a1 + 32) didPerformAction:2 withProviderItem:*(void *)(a1 + 40) atIndexPath:*(void *)(a1 + 48)];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

- (void)actionsModel:(id)a3 didEdit:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CNPhotoPickerActionsViewController *)self delegate];
  [v9 photoPickerActionsViewController:self didPerformAction:1 withProviderItem:v8 atIndexPath:v7];
}

- (void)actionsModel:(id)a3 didAssignToContact:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CNPhotoPickerActionsViewController *)self delegate];
  [v9 photoPickerActionsViewController:self didPerformAction:0 withProviderItem:v8 atIndexPath:v7];
}

- (void)performDuplicateTransitionToItem:(id)a3 fromView:(id)a4 completionBlock:(id)a5
{
  id v7 = a5;
  id v8 = [a4 snapshotView];
  id v9 = [(CNPhotoPickerActionsViewController *)self transitionContainerView];

  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(CNPhotoPickerActionsViewController *)self setTransitionContainerView:v10];

    id v11 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
    [v11 frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v20 = [(CNPhotoPickerActionsViewController *)self transitionContainerView];
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
  }
  v21 = [(CNPhotoPickerActionsViewController *)self transitionContainerView];
  [v21 frame];
  CGRect v57 = CGRectInset(v56, 20.0, 20.0);
  CGFloat x = v57.origin.x;
  CGFloat y = v57.origin.y;
  CGFloat width = v57.size.width;
  CGFloat height = v57.size.height;

  v25 = [(CNPhotoPickerActionsViewController *)self view];
  [v25 bounds];
  uint64_t v27 = v26;

  memset(&v55, 0, sizeof(v55));
  CGAffineTransformMakeScale(&v55, 0.0, 0.0);
  [(CNPhotoPickerActionsViewController *)self setTransitionContainerView:v8];
  v28 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
  [v28 frame];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  v37 = [(CNPhotoPickerActionsViewController *)self transitionContainerView];
  objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

  v38 = [(CNPhotoPickerActionsViewController *)self view];
  v39 = [(CNPhotoPickerActionsViewController *)self transitionContainerView];
  [v38 addSubview:v39];

  CGAffineTransform v54 = v55;
  v40 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
  CGAffineTransform v53 = v54;
  [v40 setTransform:&v53];

  v41 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
  [v41 setAlpha:0.0];

  v42 = (void *)MEMORY[0x1E4FB1EB0];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke;
  v52[3] = &unk_1E549A0A8;
  v52[4] = self;
  *(CGFloat *)&v52[5] = x;
  *(CGFloat *)&v52[6] = y;
  *(CGFloat *)&v52[7] = width;
  *(CGFloat *)&v52[8] = height;
  v52[9] = v27;
  *(CGFloat *)&v52[10] = y;
  *(CGFloat *)&v52[11] = width;
  *(CGFloat *)&v52[12] = height;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_5;
  v50[3] = &unk_1E549B8C8;
  v50[4] = self;
  id v51 = v7;
  id v43 = v7;
  [v42 animateKeyframesWithDuration:0 delay:v52 options:v50 animations:0.84 completion:0.0];
  v44 = (void *)MEMORY[0x1E4FB1EB0];
  [(CNPhotoPickerActionsViewController *)self duplicateScaleDuration];
  double v46 = v45;
  [(CNPhotoPickerActionsViewController *)self duplicateScaleDelay];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_32;
  v49[3] = &unk_1E549B488;
  v49[4] = self;
  [v44 animateWithDuration:0 delay:v49 usingSpringWithDamping:0 initialSpringVelocity:v46 options:v47 animations:0.6 completion:0.0];
}

uint64_t __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_2;
  v7[3] = &unk_1E549A080;
  v7[4] = *(void *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 56);
  [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v7 relativeDuration:0.0 animations:0.1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_3;
  v4[3] = &unk_1E549A080;
  v4[4] = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 88);
  [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v4 relativeDuration:0.2 animations:0.6];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_4;
  v3[3] = &unk_1E549B488;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v3 relativeDuration:0.4 animations:0.5];
}

void __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_5(uint64_t a1, char a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = [v3 transitionContainerView];
    [v4 removeFromSuperview];

    long long v5 = [*(id *)(a1 + 32) transitionContainerView];
    [v5 setAlpha:1.0];

    [*(id *)(a1 + 32) setTransitionContainerView:0];
    long long v6 = [*(id *)(a1 + 32) imageContainerView];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [*(id *)(a1 + 32) transitionContainerView];
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    uint64_t v16 = *(void *)(a1 + 40);
    if (v16)
    {
      double v17 = *(void (**)(void))(v16 + 16);
      v17();
    }
  }
  else
  {
    double v18 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v19 = 0;
      _os_log_impl(&dword_18B625000, v18, OS_LOG_TYPE_DEFAULT, "[CNPhotoPickerActionsViewController] Duplicate transtion interrupted unexpectedly!", v19, 2u);
    }
  }
}

void __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_32(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) imageContainerView];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v3[0] = *MEMORY[0x1E4F1DAB8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v1 setTransform:v3];
}

void __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) transitionContainerView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

void __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_3(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) transitionContainerView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

void __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) imageContainerView];
  [v1 setAlpha:1.0];
}

- (void)performDeleteTransitionToItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
  long long v6 = [v5 snapshotView];

  [(CNPhotoPickerActionsViewController *)self updateActionsModelWithProviderItem:v4];
  double v7 = [(CNPhotoPickerActionsViewController *)self transitionContainerView];

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(CNPhotoPickerActionsViewController *)self setTransitionContainerView:v8];
  }
  double v9 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(CNPhotoPickerActionsViewController *)self transitionContainerView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  double v19 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
  [v19 frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  v28 = [(CNPhotoPickerActionsViewController *)self view];
  [v28 bounds];
  double v30 = v29;

  double v31 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
  objc_msgSend(v31, "setFrame:", v30, v23, v25, v27);

  v53.origin.CGFloat x = v21;
  v53.origin.CGFloat y = v23;
  v53.size.CGFloat width = v25;
  v53.size.CGFloat height = v27;
  CGRect v54 = CGRectInset(v53, -20.0, -20.0);
  CGFloat y = v54.origin.y;
  CGFloat x = v54.origin.x;
  CGFloat width = v54.size.width;
  CGFloat height = v54.size.height;
  [(CNPhotoPickerActionsViewController *)self setTransitionContainerView:v6];
  double v33 = [(CNPhotoPickerActionsViewController *)self transitionContainerView];
  objc_msgSend(v33, "setFrame:", v21, v23, v25, v27);

  double v34 = [(CNPhotoPickerActionsViewController *)self view];
  double v35 = [(CNPhotoPickerActionsViewController *)self transitionContainerView];
  [v34 addSubview:v35];

  double v36 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
  [v36 setAlpha:0.0];

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke;
  v51[3] = &unk_1E549A0A8;
  v51[4] = self;
  *(CGFloat *)&v51[5] = x;
  *(CGFloat *)&v51[6] = y;
  *(CGFloat *)&v51[7] = width;
  *(CGFloat *)&v51[8] = height;
  *(double *)&v51[9] = v21 + v25 * 0.5;
  *(double *)&v51[10] = v23 + v27 * 0.5;
  __asm { FMOV            V0.2D, #1.0 }
  long long v52 = _Q0;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_4;
  v50[3] = &unk_1E549B1C0;
  v50[4] = self;
  [MEMORY[0x1E4FB1EB0] animateKeyframesWithDuration:0 delay:v51 options:v50 animations:0.84 completion:0.0];
  v42 = (void *)MEMORY[0x1E4FB1EB0];
  [(CNPhotoPickerActionsViewController *)self deleteMoveInDuration];
  double v44 = v43;
  [(CNPhotoPickerActionsViewController *)self deleteMoveInDelay];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_31;
  v49[3] = &unk_1E549A080;
  v49[4] = self;
  *(double *)&void v49[5] = v21;
  *(double *)&v49[6] = v23;
  *(double *)&v49[7] = v25;
  *(double *)&v49[8] = v27;
  [v42 animateWithDuration:0 delay:v49 usingSpringWithDamping:0 initialSpringVelocity:v44 options:v45 animations:0.8 completion:0.0];
}

uint64_t __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_2;
  v7[3] = &unk_1E549A080;
  v7[4] = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 40);
  long long v9 = v2;
  [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v7 relativeDuration:0.0 animations:0.1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_3;
  v4[3] = &unk_1E549A080;
  v4[4] = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 88);
  return [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v4 relativeDuration:0.2 animations:0.3];
}

void __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_4(uint64_t a1, char a2)
{
  double v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = [v3 transitionContainerView];
    [v4 removeFromSuperview];

    long long v5 = [*(id *)(a1 + 32) transitionContainerView];
    [v5 setAlpha:1.0];

    [*(id *)(a1 + 32) setTransitionContainerView:0];
    id v16 = [*(id *)(a1 + 32) imageContainerView];
    [v16 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [*(id *)(a1 + 32) transitionContainerView];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
  }
  else
  {
    double v15 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B625000, v15, OS_LOG_TYPE_DEFAULT, "[CNPhotoPickerActionsViewController] Delete transition interrupted unexpectedly!", buf, 2u);
    }
  }
}

void __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_31(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) imageContainerView];
  [v2 setAlpha:1.0];

  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  id v7 = [*(id *)(a1 + 32) imageContainerView];
  objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);
}

void __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) transitionContainerView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

void __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_3(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = [*(id *)(a1 + 32) transitionContainerView];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  id v7 = [*(id *)(a1 + 32) transitionContainerView];
  [v7 setAlpha:0.0];
}

- (double)deleteMoveInDelay
{
  return 0.42;
}

- (double)deleteMoveInDuration
{
  return 0.42;
}

- (double)duplicateScaleDelay
{
  return 0.336;
}

- (double)duplicateScaleDuration
{
  return 0.504;
}

- (void)updateActionsModelWithProviderItem:(id)a3
{
  id v4 = a3;
  double v5 = [(CNPhotoPickerActionsViewController *)self actionsModel];
  [v5 updateProviderItem:v4];

  double v6 = [(CNPhotoPickerActionsViewController *)self actionsModel];
  id v7 = [v6 providerItem];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__CNPhotoPickerActionsViewController_updateActionsModelWithProviderItem___block_invoke;
  v8[3] = &unk_1E549A038;
  v8[4] = self;
  [v7 thumbnailViewWithCompletion:v8];
}

void __73__CNPhotoPickerActionsViewController_updateActionsModelWithProviderItem___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 imageContainerView];
  double v6 = [v5 subviews];
  objc_msgSend(v6, "_cn_each:", &__block_literal_global_29_47657);

  [v4 setAutoresizingMask:18];
  id v7 = [*(id *)(a1 + 32) imageContainerView];
  [v7 bounds];
  double v9 = v8;
  double v10 = [*(id *)(a1 + 32) imageContainerView];
  [v10 bounds];
  objc_msgSend(v4, "setFrame:", 0.0, 0.0, v9);

  double v11 = [*(id *)(a1 + 32) imageContainerView];
  [v11 addSubview:v4];

  double v12 = *(void **)(a1 + 32);
  id v13 = [v12 actionsModel];
  [v12 updateButtonsFromModel:v13];
}

uint64_t __73__CNPhotoPickerActionsViewController_updateActionsModelWithProviderItem___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (void)presentDeleteConfirmationWithSourceView:(id)a3 withCompletion:(id)a4
{
  id v28 = a3;
  double v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = a4;
  double v8 = [v6 alertControllerWithTitle:0 message:0 preferredStyle:0];
  double v9 = (void *)MEMORY[0x1E4FB1410];
  double v10 = CNContactsUIBundle();
  double v11 = [v10 localizedStringForKey:@"PHOTO_ACTION_DELETE" value:&stru_1ED8AC728 table:@"Localized"];
  double v12 = [v9 actionWithTitle:v11 style:2 handler:v7];

  [v8 addAction:v12];
  id v13 = (void *)MEMORY[0x1E4FB1410];
  double v14 = CNContactsUIBundle();
  double v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  id v16 = [v13 actionWithTitle:v15 style:1 handler:0];

  [v8 addAction:v16];
  if (v28)
  {
    double v17 = [v8 popoverPresentationController];
    [v17 setSourceView:v28];

    [v28 bounds];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v26 = [v8 popoverPresentationController];
    objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

    double v27 = [v8 popoverPresentationController];
    [v27 setPermittedArrowDirections:15];
  }
  [(CNPhotoPickerActionsViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)didTapDone
{
  id v3 = [(CNPhotoPickerActionsViewController *)self delegate];
  [v3 photoPickerActionsViewControllerDidFinish:self];
}

- (void)applyLayout:(id)a3
{
  if (a3)
  {
    id v27 = a3;
    [v27 imageContainerViewFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    id v13 = (void *)MEMORY[0x1E4FB14C0];
    double v14 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
    [v14 bounds];
    objc_msgSend(v13, "bezierPathWithOvalInRect:");
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 CGPath];
    double v17 = [(CNPhotoPickerActionsViewController *)self clippingLayer];
    [v17 setPath:v16];

    [v27 actionButtonsViewFrame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v26 = [(CNPhotoPickerActionsViewController *)self buttonsView];
    objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

    [(CNPhotoPickerActionsViewController *)self setCurrentLayout:v27];
  }
}

- (void)updateButtonsFromModel:(id)a3
{
  id v8 = [a3 inlineActionButtons];
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v8];
  [v4 setAxis:1];
  [v4 setDistribution:1];
  [v4 setSpacing:10.0];
  double v5 = [(CNPhotoPickerActionsViewController *)self view];
  [v5 addSubview:v4];

  double v6 = [(CNPhotoPickerActionsViewController *)self buttonsView];

  if (v6)
  {
    double v7 = [(CNPhotoPickerActionsViewController *)self buttonsView];
    [v7 removeFromSuperview];
  }
  [(CNPhotoPickerActionsViewController *)self setButtonsView:v4];
}

- (void)layoutViewFromModel:(id)a3
{
  id v4 = a3;
  double v5 = [(CNPhotoPickerActionsViewController *)self imageContainerView];

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v7 = [(CNPhotoPickerActionsViewController *)self view];
    [v7 bounds];
    id v8 = objc_msgSend(v6, "initWithFrame:");
    [(CNPhotoPickerActionsViewController *)self setImageContainerView:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F39C88]);
    [(CNPhotoPickerActionsViewController *)self setClippingLayer:v9];

    double v10 = [(CNPhotoPickerActionsViewController *)self clippingLayer];
    double v11 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
    double v12 = [v11 layer];
    [v12 setMask:v10];

    id v13 = [(CNPhotoPickerActionsViewController *)self view];
    double v14 = [(CNPhotoPickerActionsViewController *)self imageContainerView];
    [v13 addSubview:v14];
  }
  id v15 = [(CNPhotoPickerActionsViewController *)self actionsModel];
  uint64_t v16 = [v15 providerItem];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__CNPhotoPickerActionsViewController_layoutViewFromModel___block_invoke;
  v24[3] = &unk_1E549A038;
  v24[4] = self;
  [v16 thumbnailViewWithCompletion:v24];

  [(CNPhotoPickerActionsViewController *)self updateButtonsFromModel:v4];
  double v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_didTapDone];
  double v18 = [(CNPhotoPickerActionsViewController *)self navigationItem];
  [v18 setRightBarButtonItem:v17];

  double v19 = [(CNPhotoPickerActionsViewController *)self navigationItem];
  [v19 _setBackgroundHidden:1];

  double v20 = [(CNPhotoPickerActionsViewController *)self navigationController];
  double v21 = [v20 navigationBar];
  char v22 = [v21 isTranslucent];

  if ((v22 & 1) == 0) {
    [(CNPhotoPickerActionsViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  }
  double v23 = [(CNPhotoPickerActionsViewController *)self currentLayout];
  [(CNPhotoPickerActionsViewController *)self applyLayout:v23];
}

void __58__CNPhotoPickerActionsViewController_layoutViewFromModel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAutoresizingMask:18];
  id v4 = [*(id *)(a1 + 32) imageContainerView];
  [v4 frame];
  objc_msgSend(v3, "setFrame:");

  id v5 = [*(id *)(a1 + 32) imageContainerView];
  [v5 addSubview:v3];
}

- (void)viewDidLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)CNPhotoPickerActionsViewController;
  [(CNPhotoPickerActionsViewController *)&v21 viewDidLayoutSubviews];
  id v3 = [CNPhotoPickerActionsViewControllerLayout alloc];
  id v4 = [(CNPhotoPickerActionsViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(CNPhotoPickerActionsViewController *)self view];
  [v9 safeAreaInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(CNPhotoPickerActionsViewController *)self buttonsView];
  double v19 = [v18 arrangedSubviews];
  double v20 = -[CNPhotoPickerActionsViewControllerLayout initWithContainerSize:insets:buttonCount:](v3, "initWithContainerSize:insets:buttonCount:", [v19 count], v6, v8, v11, v13, v15, v17);

  [(CNPhotoPickerActionsViewController *)self applyLayout:v20];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CNPhotoPickerActionsViewController;
  [(CNPhotoPickerActionsViewController *)&v8 viewDidLoad];
  id v3 = [(CNPhotoPickerActionsViewController *)self actionsModel];
  [(CNPhotoPickerActionsViewController *)self layoutViewFromModel:v3];

  id v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  double v5 = [(CNPhotoPickerActionsViewController *)self view];
  [v5 setBackgroundColor:v4];

  double v6 = [(CNPhotoPickerActionsViewController *)self navigationController];
  double v7 = [v6 presentationController];
  [v7 setDelegate:self];
}

- (CNPhotoPickerActionsViewController)initWithActionsModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPhotoPickerActionsViewController;
  double v6 = [(CNPhotoPickerActionsViewController *)&v10 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionsModel, a3);
    [(CNPhotoPickerActionsModel *)v7->_actionsModel setDelegate:v7];
    objc_super v8 = v7;
  }

  return v7;
}

+ (id)log
{
  if (log_cn_once_token_1_47689 != -1) {
    dispatch_once(&log_cn_once_token_1_47689, &__block_literal_global_47690);
  }
  double v2 = (void *)log_cn_once_object_1_47691;

  return v2;
}

void __41__CNPhotoPickerActionsViewController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNPhotoPickerActions");
  double v1 = (void *)log_cn_once_object_1_47691;
  log_cn_once_object_1_47691 = (uint64_t)v0;
}

@end