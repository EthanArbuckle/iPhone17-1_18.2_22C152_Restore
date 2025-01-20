@interface GAXOptionsScrollView
- (BOOL)_targetView:(id)a3 hasGrandparentViewOfType:(Class)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation GAXOptionsScrollView

- (BOOL)_targetView:(id)a3 hasGrandparentViewOfType:(Class)a4
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    do
    {
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        break;
      }
      uint64_t v8 = [v6 superview];

      v6 = (void *)v8;
    }
    while (v8);
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GAXOptionsScrollView;
  v5 = -[GAXOptionsScrollView hitTest:withEvent:](&v8, "hitTest:withEvent:", a4, a3.x, a3.y);
  if ([(GAXOptionsScrollView *)self _targetView:v5 hasGrandparentViewOfType:objc_opt_class()])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(GAXOptionsScrollView *)self _targetView:v5 hasGrandparentViewOfType:NSClassFromString(@"TimeRestrictionFeatureView")] ^ 1;
  }
  [(GAXOptionsScrollView *)self setScrollEnabled:v6];

  return v5;
}

@end