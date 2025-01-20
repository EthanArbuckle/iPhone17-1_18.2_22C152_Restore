@interface BNTransitionContext
+ (id)transitionContextForTransitionFromViewController:(id)a3 toViewController:(id)a4 inContainerView:(id)a5;
+ (id)transitionContextForTransitionOfViewController:(id)a3 fromFrame:(CGRect)a4 toFrame:(CGRect)a5 inContainerView:(id)a6;
- (BNTransitionContext)init;
- (BOOL)isAnimated;
- (BOOL)isComplete;
- (BOOL)isExplicitCompletionRequired;
- (BOOL)isInteractive;
- (BOOL)transitionWasCancelled;
- (CGAffineTransform)targetTransform;
- (CGRect)finalFrameForViewController:(id)a3;
- (CGRect)fromEndFrame;
- (CGRect)fromStartFrame;
- (CGRect)initialFrameForViewController:(id)a3;
- (CGRect)toEndFrame;
- (CGRect)toStartFrame;
- (NSString)revocationReason;
- (UIView)containerView;
- (UIViewControllerTransitionCoordinator)transitionCoordinator;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)presentationStyle;
- (void)__runAlongsideAnimations;
- (void)cancelInteractiveTransition;
- (void)completeTransition:(BOOL)a3;
- (void)explictlyCompleteTransition:(BOOL)a3;
- (void)finishInteractiveTransition;
- (void)pauseInteractiveTransition;
- (void)performTransitionWithAnimator:(id)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setExplicitCompletionRequired:(BOOL)a3;
- (void)setFromEndFrame:(CGRect)a3;
- (void)setFromStartFrame:(CGRect)a3;
- (void)setRevocationReason:(id)a3;
- (void)setToEndFrame:(CGRect)a3;
- (void)setToStartFrame:(CGRect)a3;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation BNTransitionContext

+ (id)transitionContextForTransitionFromViewController:(id)a3 toViewController:(id)a4 inContainerView:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (id *)objc_alloc_init((Class)a1);
  id v12 = v11[1];
  [v12 _setContainerView:v8];

  [v12 _setFromViewController:v10];
  [v12 _setToViewController:v9];

  return v11;
}

+ (id)transitionContextForTransitionOfViewController:(id)a3 fromFrame:(CGRect)a4 toFrame:(CGRect)a5 inContainerView:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v10 = a4.size.height;
  double v11 = a4.size.width;
  double v12 = a4.origin.y;
  double v13 = a4.origin.x;
  id v16 = a6;
  id v17 = a3;
  v18 = (id *)objc_alloc_init((Class)a1);
  id v19 = v18[1];
  [v19 _setContainerView:v16];

  [v19 _setToViewController:v17];
  objc_msgSend(v19, "_setToStartFrame:", v13, v12, v11, v10);
  objc_msgSend(v19, "_setToEndFrame:", x, y, width, height);

  return v18;
}

- (BNTransitionContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)BNTransitionContext;
  v2 = [(BNTransitionContext *)&v6 init];
  if (v2)
  {
    v3 = (_UIViewControllerOneToOneTransitionContext *)objc_alloc_init(MEMORY[0x1E4F43390]);
    transitionContext = v2->_transitionContext;
    v2->_transitionContext = v3;
  }
  return v2;
}

- (void)setAnimated:(BOOL)a3
{
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  return (UIViewControllerTransitionCoordinator *)[(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext _transitionCoordinator];
}

- (CGRect)fromStartFrame
{
  transitionContext = self->_transitionContext;
  v3 = [(_UIViewControllerOneToOneTransitionContext *)transitionContext fromViewController];
  [(_UIViewControllerOneToOneTransitionContext *)transitionContext initialFrameForViewController:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)setFromStartFrame:(CGRect)a3
{
}

- (CGRect)fromEndFrame
{
  transitionContext = self->_transitionContext;
  v3 = [(_UIViewControllerOneToOneTransitionContext *)transitionContext fromViewController];
  [(_UIViewControllerOneToOneTransitionContext *)transitionContext finalFrameForViewController:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)setFromEndFrame:(CGRect)a3
{
}

- (CGRect)toEndFrame
{
  transitionContext = self->_transitionContext;
  v3 = [(_UIViewControllerOneToOneTransitionContext *)transitionContext toViewController];
  [(_UIViewControllerOneToOneTransitionContext *)transitionContext finalFrameForViewController:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)setToEndFrame:(CGRect)a3
{
}

- (CGRect)toStartFrame
{
  transitionContext = self->_transitionContext;
  v3 = [(_UIViewControllerOneToOneTransitionContext *)transitionContext toViewController];
  [(_UIViewControllerOneToOneTransitionContext *)transitionContext initialFrameForViewController:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)setToStartFrame:(CGRect)a3
{
}

- (void)performTransitionWithAnimator:(id)a3
{
  id v4 = a3;
  transitionContext = self->_transitionContext;
  id v6 = v4;
  if (v4)
  {
    [(_UIViewControllerOneToOneTransitionContext *)transitionContext _setAnimator:v4];
    [v6 animateTransition:self];
  }
  else
  {
    [(_UIViewControllerOneToOneTransitionContext *)transitionContext __runAlongsideAnimations];
    [(BNTransitionContext *)self completeTransition:1];
  }
}

- (void)explictlyCompleteTransition:(BOOL)a3
{
  self->_complete = 1;
  [(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext completeTransition:a3];
}

- (BOOL)isAnimated
{
  return [(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext isAnimated];
}

- (UIView)containerView
{
  return (UIView *)[(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext containerView];
}

- (BOOL)isInteractive
{
  return [(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext isInteractive];
}

- (BOOL)transitionWasCancelled
{
  return [(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext transitionWasCancelled];
}

- (int64_t)presentationStyle
{
  return [(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext presentationStyle];
}

- (void)updateInteractiveTransition:(double)a3
{
}

- (void)finishInteractiveTransition
{
}

- (void)cancelInteractiveTransition
{
}

- (void)pauseInteractiveTransition
{
}

- (void)completeTransition:(BOOL)a3
{
  if (!self->_explicitCompletionRequired) {
    [(BNTransitionContext *)self explictlyCompleteTransition:a3];
  }
}

- (id)viewControllerForKey:(id)a3
{
  return (id)[(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext viewControllerForKey:a3];
}

- (id)viewForKey:(id)a3
{
  return (id)[(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext viewForKey:a3];
}

- (CGAffineTransform)targetTransform
{
  CGRect result = (CGAffineTransform *)self->_transitionContext;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result targetTransform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (CGRect)initialFrameForViewController:(id)a3
{
  [(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext initialFrameForViewController:a3];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)finalFrameForViewController:(id)a3
{
  [(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext finalFrameForViewController:a3];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)__runAlongsideAnimations
{
}

- (NSString)revocationReason
{
  return self->_revocationReason;
}

- (void)setRevocationReason:(id)a3
{
}

- (BOOL)isExplicitCompletionRequired
{
  return self->_explicitCompletionRequired;
}

- (void)setExplicitCompletionRequired:(BOOL)a3
{
  self->_explicitCompletionRequired = a3;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revocationReason, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end