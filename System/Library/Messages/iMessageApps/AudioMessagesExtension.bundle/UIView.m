@interface UIView
+ (void)rc_beginDisablingAnimations;
+ (void)rc_endDisablingAnimations;
+ (void)rc_performAnimateableChangesWithAnimationDuration:(double)a3 setupBlock:(id)a4 animatablesBlock:(id)a5 completion:(id)a6;
- (BOOL)rc_canAnimate;
- (BOOL)rc_isProperDescendantOfView:(id)a3;
- (id)_rc_constraintsByNameDictionary:(BOOL)a3;
- (id)_rc_constraintsNamed:(id)a3;
- (id)rc_autolayoutView;
- (void)rc_addConstraint:(id)a3;
- (void)rc_addConstraints:(id)a3;
- (void)rc_layoutBelowIfNeeded;
- (void)rc_removeConstraint:(id)a3;
- (void)rc_removeConstraints:(id)a3;
- (void)rc_removeConstraintsNamed:(id)a3;
- (void)rc_removeNamedConstraints;
- (void)rc_setNamedConstraints:(id)a3 forName:(id)a4;
- (void)rc_showAllViewBoundsRecursively:(BOOL)a3;
- (void)rc_updateConstraintsAndLayoutSubtree;
@end

@implementation UIView

- (void)rc_showAllViewBoundsRecursively:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v6 = (double)arc4random_uniform(0xFFu) / 255.0;
  v7 = +[UIColor colorWithRed:v5 green:v6 blue:(double)arc4random_uniform(0xFFu) / 255.0 alpha:0.400000006];
  [(UIView *)self setBackgroundColor:v7];

  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = [(UIView *)self subviews];
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v12), "rc_showAllViewBoundsRecursively:", 1);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)rc_canAnimate
{
  if (!+[UIView areAnimationsEnabled]) {
    return 0;
  }
  BOOL v3 = [(UIView *)self window];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (void)rc_beginDisablingAnimations
{
  if (!qword_82EB8++) {
    +[UIView setAnimationsEnabled:0];
  }
}

+ (void)rc_endDisablingAnimations
{
  if (!--qword_82EB8) {
    +[UIView setAnimationsEnabled:1];
  }
}

+ (void)rc_performAnimateableChangesWithAnimationDuration:(double)a3 setupBlock:(id)a4 animatablesBlock:(id)a5 completion:(id)a6
{
  id v11 = a4;
  id v9 = (void (**)(void))a5;
  id v10 = (void (**)(id, uint64_t))a6;
  if (v11) {
    +[UIView performWithoutAnimation:v11];
  }
  if (+[UIView areAnimationsEnabled])
  {
    +[UIView animateWithDuration:v9 animations:v10 completion:a3];
  }
  else
  {
    if (v9) {
      v9[2](v9);
    }
    if (v10) {
      v10[2](v10, 1);
    }
  }
}

- (id)rc_autolayoutView
{
  return self;
}

- (void)rc_updateConstraintsAndLayoutSubtree
{
  [(UIView *)self setNeedsUpdateConstraints];
  [(UIView *)self setNeedsLayout];

  [(UIView *)self layoutBelowIfNeeded];
}

- (void)rc_layoutBelowIfNeeded
{
}

- (BOOL)rc_isProperDescendantOfView:(id)a3
{
  if (a3 == self) {
    return 0;
  }
  else {
    return -[UIView isDescendantOfView:](self, "isDescendantOfView:");
  }
}

- (void)rc_removeConstraint:(id)a3
{
  if (a3) {
    -[UIView removeConstraint:](self, "removeConstraint:");
  }
}

- (void)rc_removeConstraints:(id)a3
{
  if (a3) {
    -[UIView removeConstraints:](self, "removeConstraints:");
  }
}

- (void)rc_addConstraint:(id)a3
{
  if (a3) {
    -[UIView addConstraint:](self, "addConstraint:");
  }
}

- (void)rc_addConstraints:(id)a3
{
  if (a3) {
    -[UIView addConstraints:](self, "addConstraints:");
  }
}

- (id)_rc_constraintsByNameDictionary:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = objc_getAssociatedObject(self, "_rc_constraintsByNameStorageKey");
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    double v5 = +[NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, "_rc_constraintsByNameStorageKey", v5, &stru_2E8.segname[9]);
  }

  return v5;
}

- (id)_rc_constraintsNamed:(id)a3
{
  id v4 = a3;
  double v5 = [(UIView *)self _rc_constraintsByNameDictionary:0];
  BOOL v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)rc_setNamedConstraints:(id)a3 forName:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    v7 = [(UIView *)self _rc_constraintsNamed:v6];

    if (v7) {
      [(UIView *)self rc_removeConstraintsNamed:v6];
    }
    v8 = [(UIView *)self _rc_constraintsByNameDictionary:1];
    id v9 = [v11 constraints];

    if (v9)
    {
      id v10 = [v11 constraints];
      [(UIView *)self addConstraints:v10];
    }
    [v8 setObject:v11 forKey:v6];
  }
  else
  {
    [(UIView *)self rc_removeConstraintsNamed:v6];
  }
}

- (void)rc_removeConstraintsNamed:(id)a3
{
  id v9 = a3;
  id v4 = -[UIView _rc_constraintsNamed:](self, "_rc_constraintsNamed:");
  double v5 = v4;
  if (v4)
  {
    id v6 = [v4 constraints];

    if (v6)
    {
      v7 = [v5 constraints];
      [(UIView *)self removeConstraints:v7];
    }
    v8 = [(UIView *)self _rc_constraintsByNameDictionary:0];
    [v8 removeObjectForKey:v9];
  }
}

- (void)rc_removeNamedConstraints
{
  BOOL v3 = [(UIView *)self _rc_constraintsByNameDictionary:0];
  id v4 = [v3 allKeys];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[UIView rc_removeConstraintsNamed:](self, "rc_removeConstraintsNamed:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end