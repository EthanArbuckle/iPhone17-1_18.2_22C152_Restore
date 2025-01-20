@interface CNAvatarCardControllerOrbTransition
- (BOOL)isDismissing;
- (CGAffineTransform)endActionListTransform;
- (CGAffineTransform)endHeaderTransform;
- (CGRect)_sourceRectInContainerView:(id)a3;
- (CGRect)sourceRect;
- (CNAvatarCardControllerOrbTransition)initWithCardViewController:(id)a3 headerView:(id)a4 sourceView:(id)a5 highlightedView:(id)a6 sourceRect:(CGRect)a7 backgroundVisualEffectView:(id)a8 isDismissing:(BOOL)a9;
- (CNAvatarCardControllerOrbTransitionDelegate)delegate;
- (CNAvatarCardViewController)cardViewController;
- (CNContactOrbHeaderView)headerView;
- (UIView)highlightedView;
- (UIView)sourceView;
- (UIVisualEffectView)visualEffectView;
- (double)highlightViewToAlpha;
- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)setCardViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndActionListTransform:(CGAffineTransform *)a3;
- (void)setEndHeaderTransform:(CGAffineTransform *)a3;
- (void)setHeaderView:(id)a3;
- (void)setHighlightViewToAlpha:(double)a3;
- (void)setHighlightedView:(id)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setupTransitionFromView:(id)a3 toView:(id)a4 withContainerView:(id)a5;
- (void)transitionDidEnd:(BOOL)a3;
@end

@implementation CNAvatarCardControllerOrbTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_highlightedView);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_cardViewController);

  objc_destroyWeak((id *)&self->_headerView);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setHighlightViewToAlpha:(double)a3
{
  self->_highlightViewToAlpha = a3;
}

- (double)highlightViewToAlpha
{
  return self->_highlightViewToAlpha;
}

- (void)setEndActionListTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_endActionListTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_endActionListTransform.c = v4;
  *(_OWORD *)&self->_endActionListTransform.a = v3;
}

- (CGAffineTransform)endActionListTransform
{
  long long v3 = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].ty;
  return self;
}

- (void)setEndHeaderTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_endHeaderTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_endHeaderTransform.c = v4;
  *(_OWORD *)&self->_endHeaderTransform.a = v3;
}

- (CGAffineTransform)endHeaderTransform
{
  long long v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setDelegate:(id)a3
{
}

- (CNAvatarCardControllerOrbTransitionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAvatarCardControllerOrbTransitionDelegate *)WeakRetained;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHighlightedView:(id)a3
{
}

- (UIView)highlightedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightedView);

  return (UIView *)WeakRetained;
}

- (void)setSourceView:(id)a3
{
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  return (UIView *)WeakRetained;
}

- (void)setCardViewController:(id)a3
{
}

- (CNAvatarCardViewController)cardViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardViewController);

  return (CNAvatarCardViewController *)WeakRetained;
}

- (void)setHeaderView:(id)a3
{
}

- (CNContactOrbHeaderView)headerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);

  return (CNContactOrbHeaderView *)WeakRetained;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (CGRect)_sourceRectInContainerView:(id)a3
{
  id v4 = a3;
  [(CNAvatarCardControllerOrbTransition *)self sourceRect];
  if (CGRectIsEmpty(v65))
  {
    v5 = [(CNAvatarCardControllerOrbTransition *)self sourceView];
    [v5 bounds];
    double x = v6;
    double y = v8;
    double width = v10;
    double height = v12;
  }
  else
  {
    [(CNAvatarCardControllerOrbTransition *)self sourceRect];
    double x = v14;
    double y = v15;
    double width = v16;
    double height = v17;
  }
  uint64_t v18 = [(CNAvatarCardControllerOrbTransition *)self sourceView];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(CNAvatarCardControllerOrbTransition *)self sourceView];
    [v20 bounds];
    v71.origin.double x = v21;
    v71.origin.double y = v22;
    v71.size.double width = v23;
    v71.size.double height = v24;
    v66.origin.double x = x;
    v66.origin.double y = y;
    v66.size.double width = width;
    v66.size.double height = height;
    if (CGRectEqualToRect(v66, v71))
    {
      v25 = [(CNAvatarCardControllerOrbTransition *)self sourceView];
      v26 = [v25 window];

      if (v26)
      {
        v27 = [(CNAvatarCardControllerOrbTransition *)self sourceView];
        v28 = [(CNAvatarCardControllerOrbTransition *)self sourceView];
        v29 = [v28 window];
        v30 = [v29 safeAreaLayoutGuide];
        [v30 layoutFrame];
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        v39 = [(CNAvatarCardControllerOrbTransition *)self sourceView];
        v40 = [v39 window];
        objc_msgSend(v27, "convertRect:fromCoordinateSpace:", v40, v32, v34, v36, v38);
        CGFloat v42 = v41;
        CGFloat v44 = v43;
        CGFloat v46 = v45;
        CGFloat v48 = v47;

        v67.origin.double x = v42;
        v67.origin.double y = v44;
        v67.size.double width = v46;
        v67.size.double height = v48;
        v72.origin.double x = x;
        v72.origin.double y = y;
        v72.size.double width = width;
        v72.size.double height = height;
        if (CGRectIntersectsRect(v67, v72))
        {
          v68.origin.double x = v42;
          v68.origin.double y = v44;
          v68.size.double width = v46;
          v68.size.double height = v48;
          v73.origin.double x = x;
          v73.origin.double y = y;
          v73.size.double width = width;
          v73.size.double height = height;
          CGRect v69 = CGRectIntersection(v68, v73);
          double x = v69.origin.x;
          double y = v69.origin.y;
          double width = v69.size.width;
          double height = v69.size.height;
        }
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  v49 = [(CNAvatarCardControllerOrbTransition *)self sourceView];

  if (!v49)
  {
    [v4 bounds];
    UIRectGetCenter();
    double v52 = v59;
    double v54 = v60;
    double v56 = 0.0;
    double v58 = 0.0;
    goto LABEL_13;
  }
LABEL_11:
  v50 = [(CNAvatarCardControllerOrbTransition *)self sourceView];
  objc_msgSend(v4, "convertRect:fromView:", v50, x, y, width, height);
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;

LABEL_13:
  double v61 = v52;
  double v62 = v54;
  double v63 = v56;
  double v64 = v58;
  result.size.double height = v64;
  result.size.double width = v63;
  result.origin.double y = v62;
  result.origin.double x = v61;
  return result;
}

- (void)transitionDidEnd:(BOOL)a3
{
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  long long v6 = v9[0];
  v9[1] = v7;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v5 = v10;
  [(CNAvatarCardControllerOrbTransition *)self setEndHeaderTransform:v9];
  v8[0] = v6;
  v8[1] = v7;
  v8[2] = v5;
  [(CNAvatarCardControllerOrbTransition *)self setEndActionListTransform:v8];
  id v4 = [(CNAvatarCardControllerOrbTransition *)self delegate];
  [v4 orbTransitionDidEndTransition:self];
}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
  long long v10 = [v9 headerContainerView];
  [(CNAvatarCardControllerOrbTransition *)self endHeaderTransform];
  [v10 setTransform:v26];

  v11 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
  double v12 = [v11 actionsListView];
  [(CNAvatarCardControllerOrbTransition *)self endActionListTransform];
  [v12 setTransform:&v25];

  if ([(CNAvatarCardControllerOrbTransition *)self isDismissing]) {
    double v13 = 0.0;
  }
  else {
    double v13 = 1.0;
  }
  if ([(CNAvatarCardControllerOrbTransition *)self isDismissing]) {
    double v14 = v7;
  }
  else {
    double v14 = v8;
  }
  id v15 = v14;
  double v16 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
  double v17 = [v16 headerContainerView];
  [v17 setAlpha:v13];

  uint64_t v18 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
  v19 = [v18 actionsListView];
  [v19 setAlpha:v13];

  v20 = [(CNAvatarCardControllerOrbTransition *)self visualEffectView];
  [v20 setAlpha:v13];

  [(CNAvatarCardControllerOrbTransition *)self isDismissing];
  CGFloat v21 = _UIClickPresentationBackgroundEffects();
  CGFloat v22 = [(CNAvatarCardControllerOrbTransition *)self visualEffectView];
  [v22 setBackgroundEffects:v21];

  [(CNAvatarCardControllerOrbTransition *)self isDismissing];
  CGFloat v23 = _UIClickPresentationBackgroundColor();
  CGFloat v24 = [(CNAvatarCardControllerOrbTransition *)self visualEffectView];
  [v24 setBackgroundColor:v23];

  [(CNAvatarCardControllerOrbTransition *)self highlightViewToAlpha];
  objc_msgSend(v15, "setAlpha:");
}

- (void)setupTransitionFromView:(id)a3 toView:(id)a4 withContainerView:(id)a5
{
  long long v6 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
  if ([v6 headerOnTop]) {
    double v7 = -180.0;
  }
  else {
    double v7 = 180.0;
  }

  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeTranslation(&t1, 0.0, v7);
  CGAffineTransformMakeScale(&t2, 0.5, 0.5);
  CGAffineTransformConcat(&v47, &t1, &t2);
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeScale(&v44, 0.5, 0.5);
  BOOL v8 = [(CNAvatarCardControllerOrbTransition *)self isDismissing];
  v9 = (CGAffineTransform *)MEMORY[0x1E4F1DAB8];
  if (v8) {
    long long v10 = (CGAffineTransform *)MEMORY[0x1E4F1DAB8];
  }
  else {
    long long v10 = &v44;
  }
  long long v11 = *(_OWORD *)&v10->c;
  long long v41 = *(_OWORD *)&v10->a;
  long long v42 = v11;
  long long v43 = *(_OWORD *)&v10->tx;
  double v12 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
  double v13 = [v12 headerContainerView];
  v40[0] = v41;
  v40[1] = v42;
  v40[2] = v43;
  [v13 setTransform:v40];

  if ([(CNAvatarCardControllerOrbTransition *)self isDismissing]) {
    double v14 = 1.0;
  }
  else {
    double v14 = 0.0;
  }
  id v15 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
  double v16 = [v15 headerContainerView];
  [v16 setAlpha:v14];

  if ([(CNAvatarCardControllerOrbTransition *)self isDismissing]) {
    double v17 = v9;
  }
  else {
    double v17 = &v47;
  }
  long long v18 = *(_OWORD *)&v17->c;
  long long v37 = *(_OWORD *)&v17->a;
  long long v38 = v18;
  long long v39 = *(_OWORD *)&v17->tx;
  v19 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
  v20 = [v19 actionsListView];
  v36[0] = v37;
  v36[1] = v38;
  v36[2] = v39;
  [v20 setTransform:v36];

  if ([(CNAvatarCardControllerOrbTransition *)self isDismissing]) {
    double v21 = 1.0;
  }
  else {
    double v21 = 0.0;
  }
  CGFloat v22 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
  CGFloat v23 = [v22 actionsListView];
  [v23 setAlpha:v21];

  if ([(CNAvatarCardControllerOrbTransition *)self isDismissing])
  {
    long long v33 = *(_OWORD *)&v44.a;
    long long v34 = *(_OWORD *)&v44.c;
    long long v24 = *(_OWORD *)&v44.tx;
  }
  else
  {
    long long v25 = *(_OWORD *)&v9->c;
    long long v33 = *(_OWORD *)&v9->a;
    long long v34 = v25;
    long long v24 = *(_OWORD *)&v9->tx;
  }
  long long v35 = v24;
  v32[0] = v33;
  v32[1] = v34;
  v32[2] = v24;
  [(CNAvatarCardControllerOrbTransition *)self setEndHeaderTransform:v32];
  BOOL v26 = [(CNAvatarCardControllerOrbTransition *)self isDismissing];
  v27 = &v47;
  if (!v26) {
    v27 = v9;
  }
  long long v28 = *(_OWORD *)&v27->c;
  v31[0] = *(_OWORD *)&v27->a;
  v31[1] = v28;
  v31[2] = *(_OWORD *)&v27->tx;
  [(CNAvatarCardControllerOrbTransition *)self setEndActionListTransform:v31];
  BOOL v29 = [(CNAvatarCardControllerOrbTransition *)self isDismissing];
  double v30 = 0.0;
  if (v29) {
    double v30 = 1.0;
  }
  [(CNAvatarCardControllerOrbTransition *)self setHighlightViewToAlpha:v30];
}

- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v64 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![(CNAvatarCardControllerOrbTransition *)self isDismissing])
  {
    long long v10 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
    long long v11 = [v10 view];
    [v11 layoutIfNeeded];

    double v12 = [(CNAvatarCardControllerOrbTransition *)self visualEffectView];
    [v12 setAutoresizingMask:18];

    [v9 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = [(CNAvatarCardControllerOrbTransition *)self visualEffectView];
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    CGFloat v22 = [(CNAvatarCardControllerOrbTransition *)self visualEffectView];
    [v9 addSubview:v22];

    CGFloat v23 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
    long long v24 = [v23 view];
    [v9 addSubview:v24];

    long long v25 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
    BOOL v26 = [v25 view];
    [v26 frame];
    uint64_t v58 = v27;
    uint64_t v60 = v28;
    uint64_t v62 = v29;

    double v30 = [(CNAvatarCardControllerOrbTransition *)self headerView];
    [v30 bounds];
    double v32 = v31 * 0.5;

    [(CNAvatarCardControllerOrbTransition *)self _sourceRectInContainerView:v9];
    double v34 = v33;
    double v36 = v35;
    long long v37 = [(CNAvatarCardControllerOrbTransition *)self headerView];
    [v37 bounds];
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    CGFloat v46 = [(CNAvatarCardControllerOrbTransition *)self headerView];
    objc_msgSend(v9, "convertRect:fromView:", v46, v39, v41, v43, v45);
    double v48 = v47;

    v49 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
    LODWORD(v46) = [v49 headerOnTop];

    double v50 = v34 + v36 * 0.5;
    double v51 = v50 - (v32 + v48);
    double v52 = v50 - v32;
    if (!v46) {
      double v52 = v51;
    }
    float v53 = v52;
    double v54 = floorf(v53);
    double v55 = [(CNAvatarCardControllerOrbTransition *)self cardViewController];
    double v56 = [v55 view];
    objc_msgSend(v56, "setFrame:", v59, v54, v63, v61);
  }
  [(CNAvatarCardControllerOrbTransition *)self setupTransitionFromView:v64 toView:v8 withContainerView:v9];
  double v57 = [(CNAvatarCardControllerOrbTransition *)self delegate];
  [v57 orbTransitionDidPrepareTransition:self withContainerView:v9];
}

- (CNAvatarCardControllerOrbTransition)initWithCardViewController:(id)a3 headerView:(id)a4 sourceView:(id)a5 highlightedView:(id)a6 sourceRect:(CGRect)a7 backgroundVisualEffectView:(id)a8 isDismissing:(BOOL)a9
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a8;
  v28.receiver = self;
  v28.super_class = (Class)CNAvatarCardControllerOrbTransition;
  long long v24 = [(CNAvatarCardControllerOrbTransition *)&v28 init];
  long long v25 = v24;
  if (v24)
  {
    objc_storeWeak((id *)&v24->_cardViewController, v19);
    objc_storeWeak((id *)&v25->_headerView, v20);
    objc_storeWeak((id *)&v25->_sourceView, v21);
    objc_storeWeak((id *)&v25->_highlightedView, v22);
    v25->_sourceRect.origin.CGFloat x = x;
    v25->_sourceRect.origin.CGFloat y = y;
    v25->_sourceRect.size.CGFloat width = width;
    v25->_sourceRect.size.CGFloat height = height;
    v25->_isDismissing = a9;
    objc_storeStrong((id *)&v25->_visualEffectView, a8);
    BOOL v26 = v25;
  }

  return v25;
}

@end