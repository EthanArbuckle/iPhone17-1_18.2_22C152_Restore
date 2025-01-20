@interface SSSAnimator
+ (id)animatorWithDragAnimating:(id)a3;
+ (id)animatorWithPropertyAnimator:(id)a3;
- (UIDragAnimating)dragAnimating;
- (UIViewPropertyAnimator)propertyAnimator;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)setDragAnimating:(id)a3;
- (void)setPropertyAnimator:(id)a3;
@end

@implementation SSSAnimator

+ (id)animatorWithPropertyAnimator:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setPropertyAnimator:v3];

  return v4;
}

+ (id)animatorWithDragAnimating:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setDragAnimating:v3];

  return v4;
}

- (void)addAnimations:(id)a3
{
  id v4 = a3;
  v5 = [(SSSAnimator *)self propertyAnimator];
  [v5 addAnimations:v4];

  id v6 = [(SSSAnimator *)self dragAnimating];
  [v6 addAnimations:v4];
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SSSAnimator *)self propertyAnimator];
  [v5 addCompletion:v4];

  id v6 = [(SSSAnimator *)self dragAnimating];
  [v6 addCompletion:v4];
}

- (UIViewPropertyAnimator)propertyAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);

  return (UIViewPropertyAnimator *)WeakRetained;
}

- (void)setPropertyAnimator:(id)a3
{
}

- (UIDragAnimating)dragAnimating
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragAnimating);

  return (UIDragAnimating *)WeakRetained;
}

- (void)setDragAnimating:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dragAnimating);

  objc_destroyWeak((id *)&self->_propertyAnimator);
}

@end