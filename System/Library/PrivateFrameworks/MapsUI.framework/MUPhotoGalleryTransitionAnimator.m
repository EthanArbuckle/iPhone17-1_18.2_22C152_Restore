@interface MUPhotoGalleryTransitionAnimator
- (MUPhotoGalleryTransitionAnimator)delegate;
- (MUPhotoGalleryTransitionAnimator)initWithView:(id)a3 transitionView:(id)a4;
- (UIView)transitionView;
- (UIView)view;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTransitionView:(id)a3;
- (void)setView:(id)a3;
@end

@implementation MUPhotoGalleryTransitionAnimator

- (MUPhotoGalleryTransitionAnimator)initWithView:(id)a3 transitionView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUPhotoGalleryTransitionAnimator;
  v9 = [(MUPhotoGalleryTransitionAnimator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_view, a3);
    objc_storeStrong((id *)&v10->_transitionView, a4);
  }

  return v10;
}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v6 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  int v7 = [v6 isBeingPresented];
  if (v7) {
    id v8 = v6;
  }
  else {
    id v8 = v5;
  }
  id v9 = v8;
  v10 = [v9 viewControllers];
  v11 = [v10 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v12 = [v11 photoViewForTransition];
    [v12 setAlpha:0.0];
    v13 = [(MUPhotoGalleryTransitionAnimator *)self view];
    [v13 setAlpha:0.0];

    v14 = [v4 containerView];
    v15 = [v6 view];
    if (v7) {
      [v14 addSubview:v15];
    }
    else {
      [v14 sendSubviewToBack:v15];
    }

    v16 = [(MUPhotoGalleryTransitionAnimator *)self transitionView];
    [v16 setClipsToBounds:1];

    v17 = [v4 containerView];
    v18 = [(MUPhotoGalleryTransitionAnimator *)self transitionView];
    [v17 addSubview:v18];

    if (v7)
    {
      [v4 finalFrameForViewController:v6];
      double v20 = v19;
      double v22 = v21;
      double Width = v23;
      double Height = v25;
    }
    else
    {
      [v11 scrollViewContentOffset];
      double v28 = v27;
      double v30 = v29;
      [v12 frame];
      double v20 = CGRectGetMinX(v92) - v28;
      [v12 frame];
      double v22 = CGRectGetMinY(v93) - v30;
      [v12 frame];
      double Width = CGRectGetWidth(v94);
      [v12 frame];
      double Height = CGRectGetHeight(v95);
    }
    v79 = v5;
    v31 = [(MUPhotoGalleryTransitionAnimator *)self view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v33 = [(MUPhotoGalleryTransitionAnimator *)self view];
    v34 = v33;
    if (isKindOfClass)
    {
      v35 = [v33 image];
      [v35 size];
      double v37 = v36;
    }
    else
    {
      [v33 frame];
      double v37 = v38;
    }

    v39 = [(MUPhotoGalleryTransitionAnimator *)self view];
    objc_opt_class();
    char v40 = objc_opt_isKindOfClass();
    v41 = [(MUPhotoGalleryTransitionAnimator *)self view];
    v42 = v41;
    if (v40)
    {
      v43 = [v41 image];
      [v43 size];
      double v45 = v44;
    }
    else
    {
      [v41 frame];
      double v45 = v46;
    }

    double v47 = Width / v37;
    double v48 = 0.0;
    if (v37 <= 0.0) {
      double v47 = 0.0;
    }
    double v49 = Height / v45;
    if (v45 <= 0.0) {
      double v49 = 0.0;
    }
    if (v47 >= v49) {
      double v47 = v49;
    }
    double v50 = v37 * v47;
    double v51 = v45 * v47;
    v96.origin.x = v20;
    v96.origin.y = v22;
    v96.size.width = Width;
    v96.size.height = Height;
    double v80 = CGRectGetMidX(v96) - v50 * 0.5;
    v97.origin.x = v20;
    v97.origin.y = v22;
    v97.size.width = Width;
    v97.size.height = Height;
    double v52 = CGRectGetMidY(v97) - v51 * 0.5;
    v53 = [v4 containerView];
    v54 = [(MUPhotoGalleryTransitionAnimator *)self view];
    [v54 bounds];
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;
    v63 = [(MUPhotoGalleryTransitionAnimator *)self view];
    objc_msgSend(v53, "convertRect:fromView:", v63, v56, v58, v60, v62);
    double v65 = v64;
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;

    v72 = [(MUPhotoGalleryTransitionAnimator *)self transitionView];
    v73 = v72;
    if (v7)
    {
      objc_msgSend(v72, "setFrame:", v65, v67, v69, v71);

      v73 = [v6 view];
      [v73 setAlpha:0.0];
      double v48 = 1.0;
      double v65 = v80;
    }
    else
    {
      objc_msgSend(v72, "setFrame:", v80, v52, v50, v51);
      double v52 = v67;
      double v50 = v69;
      double v51 = v71;
    }

    v74 = [(MUPhotoGalleryTransitionAnimator *)self transitionView];
    [v74 layoutIfNeeded];

    v75 = (void *)MEMORY[0x1E4FB1EB0];
    [(MUPhotoGalleryTransitionAnimator *)self transitionDuration:v4];
    double v77 = v76;
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __54__MUPhotoGalleryTransitionAnimator_animateTransition___block_invoke;
    v84[3] = &unk_1E574FD08;
    id v85 = v9;
    v86 = self;
    double v87 = v48;
    double v88 = v65;
    double v89 = v52;
    double v90 = v50;
    double v91 = v51;
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __54__MUPhotoGalleryTransitionAnimator_animateTransition___block_invoke_2;
    v81[3] = &unk_1E574FD30;
    v81[4] = self;
    id v82 = v12;
    id v83 = v4;
    id v78 = v12;
    [v75 animateWithDuration:0x20000 delay:v84 options:v81 animations:v77 completion:0.0];

    v5 = v79;
  }
  else
  {
    [v4 completeTransition:0];
  }
}

void __54__MUPhotoGalleryTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  v3 = [*(id *)(a1 + 32) view];
  [v3 setAlpha:v2];

  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  double v7 = *(double *)(a1 + 80);
  id v8 = [*(id *)(a1 + 40) transitionView];
  objc_msgSend(v8, "setFrame:", v4, v5, v6, v7);

  id v9 = [*(id *)(a1 + 40) transitionView];
  [v9 layoutIfNeeded];
}

void __54__MUPhotoGalleryTransitionAnimator_animateTransition___block_invoke_2(id *a1)
{
  double v2 = [a1[4] view];
  [v2 setAlpha:1.0];

  [a1[5] setAlpha:1.0];
  v3 = [a1[4] transitionView];
  [v3 removeFromSuperview];

  objc_msgSend(a1[6], "completeTransition:", objc_msgSend(a1[6], "transitionWasCancelled") ^ 1);
  id v4 = [a1[4] delegate];
  [v4 photoGalleryTransitionAnimatorDidFinishAnimation];
}

- (MUPhotoGalleryTransitionAnimator)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPhotoGalleryTransitionAnimator *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (UIView)transitionView
{
  return self->_transitionView;
}

- (void)setTransitionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end