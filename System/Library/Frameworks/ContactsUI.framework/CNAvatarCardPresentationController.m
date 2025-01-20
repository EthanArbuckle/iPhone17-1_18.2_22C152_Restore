@interface CNAvatarCardPresentationController
- (BOOL)shouldPresentInFullscreen;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGRect)sourceRect;
- (CGRect)sourceTargetRect;
- (CNAvatarCardPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (CNAvatarCardTransition)transition;
- (CNCardTransitioning)originalTransitioning;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)cardView;
- (UIView)contentView;
- (UIView)dimmingView;
- (UIView)sourceView;
- (UIViewController)sourceViewController;
- (UIVisualEffectView)backgroundView;
- (UIVisualEffectView)vibrancyView;
- (double)alignmentY;
- (id)presentedView;
- (unsigned)alignmentEdge;
- (void)_layoutViews;
- (void)containerViewWillLayoutSubviews;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setAlignmentEdge:(unsigned int)a3;
- (void)setAlignmentY:(double)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCardView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setOriginalTransitioning:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceTargetRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setSourceViewController:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTransition:(id)a3;
- (void)setVibrancyView:(id)a3;
- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3;
- (void)tapGestureRecognized:(id)a3;
@end

@implementation CNAvatarCardPresentationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_originalTransitioning, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_sourceView, 0);
}

- (void)setContentView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setCardView:(id)a3
{
}

- (UIView)cardView
{
  return self->_cardView;
}

- (void)setDimmingView:(id)a3
{
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setVibrancyView:(id)a3
{
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setOriginalTransitioning:(id)a3
{
}

- (CNCardTransitioning)originalTransitioning
{
  return self->_originalTransitioning;
}

- (void)setTransition:(id)a3
{
}

- (CNAvatarCardTransition)transition
{
  return self->_transition;
}

- (void)setSourceViewController:(id)a3
{
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setAlignmentEdge:(unsigned int)a3
{
  self->_alignmentEdge = a3;
}

- (unsigned)alignmentEdge
{
  return self->_alignmentEdge;
}

- (void)setAlignmentY:(double)a3
{
  self->_alignmentY = a3;
}

- (double)alignmentY
{
  return self->_alignmentY;
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

- (void)setSourceView:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceTargetRect:(CGRect)a3
{
  self->_sourceTargetRect = a3;
}

- (CGRect)sourceTargetRect
{
  double x = self->_sourceTargetRect.origin.x;
  double y = self->_sourceTargetRect.origin.y;
  double width = self->_sourceTargetRect.size.width;
  double height = self->_sourceTargetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)tapGestureRecognized:(id)a3
{
  id v3 = [(CNAvatarCardPresentationController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  id v3 = [(CNAvatarCardPresentationController *)self containerView];
  [v3 setNeedsLayout];
}

- (CGRect)frameOfPresentedViewInContainerView
{
  id v3 = [(CNAvatarCardPresentationController *)self presentedViewController];
  [v3 preferredContentSize];
  double v5 = v4;
  double v7 = v6;

  v8 = [(CNAvatarCardPresentationController *)self containerView];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  if (v5 == 0.0)
  {
    v32.origin.double x = v10;
    v32.origin.double y = v12;
    v32.size.double width = v14;
    v32.size.double height = v16;
    double v5 = CGRectGetWidth(v32) + -14.0;
  }
  if (v7 == 0.0)
  {
    v33.origin.double x = v10;
    v33.origin.double y = v12;
    v33.size.double width = v14;
    v33.size.double height = v16;
    double v7 = CGRectGetHeight(v33) + -48.0;
  }
  v34.origin.double x = v10;
  v34.origin.double y = v12;
  v34.size.double width = v14;
  v34.size.double height = v16;
  double MidX = CGRectGetMidX(v34);
  v35.origin.double x = v10;
  v35.origin.double y = v12;
  v35.size.double width = v14;
  v35.size.double height = v16;
  double v18 = CGRectGetMidY(v35) + v7 * -0.5;
  [(CNAvatarCardPresentationController *)self alignmentY];
  if (v19 >= 0.0)
  {
    if ([(CNAvatarCardPresentationController *)self alignmentEdge] == 1)
    {
      [(CNAvatarCardPresentationController *)self alignmentY];
      double v18 = 48.0;
      if (v20 >= 48.0)
      {
        [(CNAvatarCardPresentationController *)self alignmentY];
        double v22 = v7 + v21;
        v36.origin.double x = v10;
        v36.origin.double y = v12;
        v36.size.double width = v14;
        v36.size.double height = v16;
        if (v22 <= CGRectGetMaxY(v36) + -48.0)
        {
          [(CNAvatarCardPresentationController *)self alignmentY];
          double v18 = v23;
        }
        else
        {
          v37.origin.double x = v10;
          v37.origin.double y = v12;
          v37.size.double width = v14;
          v37.size.double height = v16;
          double v18 = CGRectGetMaxY(v37) - v7 + -48.0;
        }
      }
    }
    if ([(CNAvatarCardPresentationController *)self alignmentEdge] == 3)
    {
      [(CNAvatarCardPresentationController *)self alignmentY];
      double v25 = v24;
      v38.origin.double x = v10;
      v38.origin.double y = v12;
      v38.size.double width = v14;
      v38.size.double height = v16;
      if (v25 <= CGRectGetMaxY(v38) + -48.0)
      {
        [(CNAvatarCardPresentationController *)self alignmentY];
        double v18 = 48.0;
        if (v26 - v7 >= 48.0)
        {
          [(CNAvatarCardPresentationController *)self alignmentY];
          double v18 = v27 - v7;
        }
      }
      else
      {
        v39.origin.double x = v10;
        v39.origin.double y = v12;
        v39.size.double width = v14;
        v39.size.double height = v16;
        double v18 = CGRectGetMaxY(v39) - v7 + -48.0;
      }
    }
  }
  double v28 = MidX + v5 * -0.5;
  double v29 = v18;
  double v30 = v5;
  double v31 = v7;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (id)presentedView
{
  return self->_backgroundView;
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
  {
    [(UIVisualEffectView *)self->_backgroundView removeGestureRecognizer:self->_tapGestureRecognizer];
    [(UIVisualEffectView *)self->_backgroundView removeFromSuperview];
    id v4 = [(CNAvatarCardPresentationController *)self originalTransitioning];
    [v4 setTransitioningImageVisible:1];
  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (a3) {
    [(UIVisualEffectView *)self->_backgroundView addGestureRecognizer:self->_tapGestureRecognizer];
  }
}

- (void)presentationTransitionWillBegin
{
  id v7 = [(CNAvatarCardPresentationController *)self containerView];
  [v7 addSubview:self->_backgroundView];
  id v3 = [(CNAvatarCardPresentationController *)self presentedViewController];
  id v4 = [v3 view];

  [v4 setBackgroundColor:0];
  double v5 = [(CNAvatarCardPresentationController *)self presentedViewController];
  [v5 viewWillAppear:0];

  [(UIView *)self->_contentView addSubview:v4];
  double v6 = [(CNAvatarCardPresentationController *)self cardView];
  [v6 setAlpha:0.0];

  [(CNAvatarCardPresentationController *)self _layoutViews];
}

- (void)_layoutViews
{
  id v7 = [(CNAvatarCardPresentationController *)self containerView];
  id v3 = [(CNAvatarCardPresentationController *)self presentedViewController];
  id v4 = [v3 view];

  [v7 bounds];
  -[UIVisualEffectView setFrame:](self->_backgroundView, "setFrame:");
  double v5 = [(UIVisualEffectView *)self->_backgroundView contentView];
  [v5 bounds];
  -[UIVisualEffectView setFrame:](self->_vibrancyView, "setFrame:");

  double v6 = [(UIVisualEffectView *)self->_vibrancyView contentView];
  [v6 bounds];
  -[UIView setFrame:](self->_dimmingView, "setFrame:");

  [(CNAvatarCardPresentationController *)self frameOfPresentedViewInContainerView];
  -[UIView setFrame:](self->_cardView, "setFrame:");
  [(UIView *)self->_cardView bounds];
  -[UIView setFrame:](self->_contentView, "setFrame:");
  [(UIView *)self->_contentView bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)containerViewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CNAvatarCardPresentationController;
  [(CNAvatarCardPresentationController *)&v3 containerViewWillLayoutSubviews];
  [(CNAvatarCardPresentationController *)self _layoutViews];
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (CNAvatarCardPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v34.receiver = self;
  v34.super_class = (Class)CNAvatarCardPresentationController;
  id v4 = [(CNAvatarCardPresentationController *)&v34 initWithPresentedViewController:a3 presentingViewController:a4];
  double v5 = objc_alloc_init(CNAvatarCardTransition);
  transition = v4->_transition;
  v4->_transition = v5;

  id v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:1];
  uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v7];
  backgroundView = v4->_backgroundView;
  v4->_backgroundView = (UIVisualEffectView *)v8;

  id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
  dimmingView = v4->_dimmingView;
  v4->_dimmingView = (UIView *)v15;

  v17 = +[CNUIColorRepository orbCardBackgroundDimmedColor];
  [(UIView *)v4->_dimmingView setBackgroundColor:v17];

  double v18 = [(UIVisualEffectView *)v4->_backgroundView contentView];
  [v18 addSubview:v4->_dimmingView];

  uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v7];
  vibrancyView = v4->_vibrancyView;
  v4->_vibrancyView = (UIVisualEffectView *)v19;

  double v21 = [(UIVisualEffectView *)v4->_backgroundView contentView];
  [v21 addSubview:v4->_vibrancyView];

  uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v11, v12, v13, v14);
  cardView = v4->_cardView;
  v4->_cardView = (UIView *)v22;

  [(UIView *)v4->_cardView setBackgroundColor:0];
  double v24 = [(UIVisualEffectView *)v4->_vibrancyView contentView];
  [v24 addSubview:v4->_cardView];

  uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v11, v12, v13, v14);
  contentView = v4->_contentView;
  v4->_contentView = (UIView *)v25;

  [(UIView *)v4->_cardView addSubview:v4->_contentView];
  double v27 = [(UIView *)v4->_cardView layer];
  id v28 = +[CNUIColorRepository orbCardBackgroundShadowColor];
  objc_msgSend(v27, "setShadowColor:", objc_msgSend(v28, "CGColor"));

  [v27 setShadowRadius:10.0];
  LODWORD(v29) = 1036831949;
  [v27 setShadowOpacity:v29];
  objc_msgSend(v27, "setShadowOffset:", 0.0, 4.0);
  double v30 = [(UIView *)v4->_contentView layer];
  [v30 setCornerRadius:23.0];
  uint64_t v31 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel_tapGestureRecognized_];
  tapGestureRecognizer = v4->_tapGestureRecognizer;
  v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v31;

  return v4;
}

@end