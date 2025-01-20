@interface UIView
+ (BOOL)_maps_shouldAdoptImplicitAnimationParameters;
+ (void)_maps_animateForAndromeda:(BOOL)a3 animations:(id)a4;
+ (void)_maps_animateForAndromeda:(BOOL)a3 animations:(id)a4 completion:(id)a5;
- (BOOL)_maps_isVisible;
- (CGAffineTransform)_maps_transformScaledToLeadingAtScale:(SEL)a3;
- (CGAffineTransform)_maps_transformScaledToTopAndLeadingAtScale:(SEL)a3;
- (CGAffineTransform)_maps_transformScaledToTopAndTrailingAtScale:(SEL)a3;
- (CGAffineTransform)_maps_transformScaledToTopAtScale:(SEL)a3;
- (CGRect)_maps_centeringFrameForView:(id)a3 fit:(BOOL)a4 constrain:(BOOL)a5 inRect:(CGRect)a6;
- (CGRect)_maps_centeringFrameForView:(id)a3 inRect:(CGRect)a4 options:(int64_t)a5;
- (CGRect)_maps_centeringFrameForView:(id)a3 size:(CGSize)a4 inRect:(CGRect)a5;
- (CGSize)_maps_compressedSizeForWidth:(double)a3 withBlock:(id)a4;
- (MapsTheme)theme;
- (NSString)sceneIdentifierForLogging;
- (double)_maps_maxConstraintConstantForAxis:(int64_t)a3;
- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 insets:(UIEdgeInsets)a4 priority:(float)a5;
- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 priority:(float)a4;
- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 insets:(UIEdgeInsets)a4 priority:(float)a5;
- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 priority:(float)a4;
- (id)_maps_constraintsForCenteringInView:(id)a3;
- (id)_maps_constraintsForCenteringInView:(id)a3 edgeInsets:(UIEdgeInsets)a4;
- (id)_maps_constraintsForCenteringInView:(id)a3 edgeInsets:(UIEdgeInsets)a4 priorities:(id)a5;
- (id)_maps_constraintsForCenteringInView:(id)a3 priorities:(id)a4;
- (void)_maps_alignTopToView:(id)a3;
- (void)_maps_initializeWithAutolayoutCompressedSize;
- (void)_maps_recursivelySetAllowsGroupOpacity:(BOOL)a3;
- (void)_maps_setAllContentHuggingAndCompressionResistancePriorities:(float)a3;
@end

@implementation UIView

- (MapsTheme)theme
{
  v3 = [(UIView *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4)
  {
    v5 = [(UIView *)self traitCollection];
    BOOL v6 = [v5 userInterfaceStyle] != (char *)&dword_0 + 1;

    v7 = +[MapsTheme sharedTheme];
    [v7 setMapsThemeStyle:v6];
  }

  return (MapsTheme *)+[MapsTheme sharedTheme];
}

- (void)_maps_recursivelySetAllowsGroupOpacity:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UIView *)self layer];
  [v5 setAllowsGroupOpacity:v3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v6 = [(UIView *)self subviews];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "_maps_recursivelySetAllowsGroupOpacity:", v3);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_maps_initializeWithAutolayoutCompressedSize
{
  double y = CGRectZero.origin.y;
  -[UIView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  -[UIView setBounds:](self, "setBounds:", CGRectZero.origin.x, y, v4, v5);

  [(UIView *)self layoutIfNeeded];
}

- (CGRect)_maps_centeringFrameForView:(id)a3 fit:(BOOL)a4 constrain:(BOOL)a5 inRect:(CGRect)a6
{
  if (a5) {
    -[UIView _maps_centeringFrameForView:inRect:options:](self, "_maps_centeringFrameForView:inRect:options:", a3, a4 | 4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  }
  else {
    -[UIView _maps_centeringFrameForView:inRect:options:](self, "_maps_centeringFrameForView:inRect:options:", a3, a4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.double y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_maps_centeringFrameForView:(id)a3 inRect:(CGRect)a4 options:(int64_t)a5
{
  char v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  long long v12 = v11;
  if ((v5 & 8) != 0)
  {
    [v11 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v12 layoutMargins];
    v46.origin.double x = v14 + v21;
    v46.origin.double y = v16 + v22;
    v46.size.double width = v18 - (v21 + v23);
    v46.size.double height = v20 - (v22 + v24);
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    CGRect v44 = CGRectIntersection(v43, v46);
    double x = v44.origin.x;
    double y = v44.origin.y;
    double width = v44.size.width;
    double height = v44.size.height;
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(v12, "systemLayoutSizeFittingSize:", width, height);
  }
  else if (v5)
  {
    objc_msgSend(v12, "sizeThatFits:", width, height);
  }
  else
  {
    [v12 frame];
    double v26 = v25;
    double v28 = v27;
  }
  BOOL v29 = (v5 & 4) == 0;
  if (v28 >= height && (v5 & 4) != 0) {
    double v28 = height;
  }
  if (v26 < width) {
    BOOL v29 = 1;
  }
  if (!v29) {
    double v26 = width;
  }
  -[UIView _maps_centeringFrameForView:size:inRect:](self, "_maps_centeringFrameForView:size:inRect:", v12, v26, v28, x, y, width, height);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  double v39 = v32;
  double v40 = v34;
  double v41 = v36;
  double v42 = v38;
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.double y = v40;
  result.origin.double x = v39;
  return result;
}

- (CGRect)_maps_centeringFrameForView:(id)a3 size:(CGSize)a4 inRect:(CGRect)a5
{
  double height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v9 = a4.height;
  CGFloat v10 = a4.width;
  CGFloat v11 = (a5.size.width - a4.width) * 0.5 + CGRectGetMinX(a5);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.double height = height;
  double v12 = (height - v9) * 0.5 + CGRectGetMinY(v17);
  CGFloat v13 = v11;
  CGFloat v14 = v10;
  double v15 = v9;

  return CGRectIntegral(*(CGRect *)&v13);
}

- (CGSize)_maps_compressedSizeForWidth:(double)a3 withBlock:(id)a4
{
  if (a4) {
    (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  }
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1112014848;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v4, v5);
  double v9 = a3;
  result.double height = v8;
  result.CGFloat width = v9;
  return result;
}

+ (BOOL)_maps_shouldAdoptImplicitAnimationParameters
{
  unsigned int v2 = +[UIView _isInAnimationBlock];
  if (v2)
  {
    LOBYTE(v2) = +[UIView areAnimationsEnabled];
  }
  return v2;
}

- (BOOL)_maps_isVisible
{
  if ([(UIView *)self isHidden]) {
    return 0;
  }
  double v4 = [(UIView *)self window];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)_maps_alignTopToView:(id)a3
{
  id v4 = a3;
  [(UIView *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v4 frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v21.origin.CGFloat x = v12;
  v21.origin.CGFloat y = v14;
  v21.size.CGFloat width = v16;
  v21.size.double height = v18;
  double MinY = CGRectGetMinY(v21);

  -[UIView setFrame:](self, "setFrame:", v6, MinY, v8, v10);
}

- (id)_maps_constraintsForCenteringInView:(id)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1148846080;
  return -[UIView _maps_constraintsForCenteringInView:edgeInsets:priorities:](self, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", a3, 0.0, 0.0, 0.0, 0.0, v3, v4, v5, v6);
}

- (id)_maps_constraintsForCenteringInView:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1148846080;
  return -[UIView _maps_constraintsForCenteringInView:edgeInsets:priorities:](self, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", a3, a4.top, a4.left, a4.bottom, a4.right, v4, v5, v6, v7);
}

- (id)_maps_constraintsForCenteringInView:(id)a3 priorities:(id)a4
{
  *(float *)&double v7 = a4.var3;
  *(float *)&double v6 = a4.var2;
  *(float *)&double v5 = a4.var1;
  *(float *)&double v4 = a4.var0;
  return -[UIView _maps_constraintsForCenteringInView:edgeInsets:priorities:](self, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", a3, 0.0, 0.0, 0.0, 0.0, v4, v5, v6, v7);
}

- (id)_maps_constraintsForCenteringInView:(id)a3 edgeInsets:(UIEdgeInsets)a4 priorities:(id)a5
{
  float var3 = a5.var3;
  float var2 = a5.var2;
  float var1 = a5.var1;
  float var0 = a5.var0;
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v14 = a3;
  double v32 = [(UIView *)self topAnchor];
  double v31 = [v14 topAnchor];
  *(float *)&double v15 = var0;
  v30 = [v32 constraintEqualToAnchor:v31 constant:top priority:v15];
  v33[0] = v30;
  CGFloat v16 = [(UIView *)self leftAnchor];
  double v17 = [v14 leftAnchor];
  *(float *)&double v18 = var2;
  double v19 = [v16 constraintEqualToAnchor:v17 constant:left priority:v18];
  v33[1] = v19;
  double v20 = [v14 bottomAnchor];
  CGRect v21 = [(UIView *)self bottomAnchor];
  *(float *)&double v22 = var1;
  double v23 = [v20 constraintEqualToAnchor:v21 constant:bottom priority:v22];
  v33[2] = v23;
  double v24 = [v14 rightAnchor];

  double v25 = [(UIView *)self rightAnchor];
  *(float *)&double v26 = var3;
  double v27 = [v24 constraintEqualToAnchor:v25 constant:right priority:v26];
  v33[3] = v27;
  double v28 = +[NSArray arrayWithObjects:v33 count:4];

  return v28;
}

- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 priority:(float)a4
{
  *(float *)&double v4 = a4;
  return -[UIView _maps_constraintsEqualToEdgesOfView:insets:priority:](self, "_maps_constraintsEqualToEdgesOfView:insets:priority:", a3, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v4);
}

- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 insets:(UIEdgeInsets)a4 priority:(float)a5
{
  if (a3)
  {
    double right = a4.right;
    double bottom = a4.bottom;
    double left = a4.left;
    double top = a4.top;
    id v11 = a3;
    BOOL v29 = [(UIView *)self topAnchor];
    double v28 = [v11 topAnchor];
    *(float *)&double v12 = a5;
    double v13 = [v29 constraintEqualToAnchor:v28 constant:top priority:v12];
    double v27 = [(UIView *)self leadingAnchor];
    id v14 = [v11 leadingAnchor];
    *(float *)&double v15 = a5;
    CGFloat v16 = [v27 constraintEqualToAnchor:v14 constant:left priority:v15];
    double v17 = [v11 bottomAnchor];
    double v18 = [(UIView *)self bottomAnchor];
    *(float *)&double v19 = a5;
    double v20 = [v17 constraintEqualToAnchor:v18 constant:bottom priority:v19];
    CGRect v21 = [v11 trailingAnchor];

    double v22 = [(UIView *)self trailingAnchor];
    *(float *)&double v23 = a5;
    double v24 = [v21 constraintEqualToAnchor:v22 constant:right priority:v23];
    double v25 = +[MapsEdgeConstraints edgeConstraintsWithTop:v13 leading:v16 bottom:v20 trailing:v24];
  }
  else
  {
    double v25 = 0;
  }

  return v25;
}

- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 priority:(float)a4
{
  *(float *)&double v4 = a4;
  return -[UIView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](self, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", a3, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v4);
}

- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 insets:(UIEdgeInsets)a4 priority:(float)a5
{
  if (a3)
  {
    double right = a4.right;
    double bottom = a4.bottom;
    double left = a4.left;
    double top = a4.top;
    id v11 = a3;
    BOOL v29 = [(UIView *)self topAnchor];
    double v28 = [v11 topAnchor];
    *(float *)&double v12 = a5;
    double v13 = [v29 constraintEqualToAnchor:v28 constant:top priority:v12];
    double v27 = [(UIView *)self leadingAnchor];
    id v14 = [v11 leadingAnchor];
    *(float *)&double v15 = a5;
    CGFloat v16 = [v27 constraintEqualToAnchor:v14 constant:left priority:v15];
    double v17 = [v11 bottomAnchor];
    double v18 = [(UIView *)self bottomAnchor];
    *(float *)&double v19 = a5;
    double v20 = [v17 constraintEqualToAnchor:v18 constant:bottom priority:v19];
    CGRect v21 = [v11 trailingAnchor];

    double v22 = [(UIView *)self trailingAnchor];
    *(float *)&double v23 = a5;
    double v24 = [v21 constraintEqualToAnchor:v22 constant:right priority:v23];
    double v25 = +[MapsEdgeConstraints edgeConstraintsWithTop:v13 leading:v16 bottom:v20 trailing:v24];
  }
  else
  {
    double v25 = 0;
  }

  return v25;
}

- (CGAffineTransform)_maps_transformScaledToLeadingAtScale:(SEL)a3
{
  if (a4 == 1.0 || a4 == 0.0)
  {
    long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    [(CGAffineTransform *)self bounds];
    double v7 = v6;
    double v8 = +[UIApplication sharedApplication];
    double v9 = (char *)[v8 userInterfaceLayoutDirection];

    double v10 = v7 - v7 * a4;
    if (v9 == (unsigned char *)&dword_0 + 1)
    {
      CGAffineTransformMakeScale(&v15, a4, a4);
      double v11 = v10 * 0.5 / a4;
      double v12 = &v15;
    }
    else
    {
      CGAffineTransformMakeScale(&v14, a4, a4);
      double v11 = v10 * -0.5 / a4;
      double v12 = &v14;
    }
    return CGAffineTransformTranslate(retstr, v12, v11, 0.0);
  }
  return self;
}

- (CGAffineTransform)_maps_transformScaledToTopAtScale:(SEL)a3
{
  if (a4 == 1.0 || a4 == 0.0)
  {
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    [(CGAffineTransform *)self bounds];
    double v7 = v6;
    CGAffineTransformMakeScale(&v9, a4, a4);
    return CGAffineTransformTranslate(retstr, &v9, 0.0, (v7 - v7 * a4) * -0.5 / a4);
  }
  return self;
}

- (CGAffineTransform)_maps_transformScaledToTopAndLeadingAtScale:(SEL)a3
{
  if (a4 == 1.0 || a4 == 0.0)
  {
    long long v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    [(CGAffineTransform *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v10 = +[UIApplication sharedApplication];
    double v11 = (char *)[v10 userInterfaceLayoutDirection];

    double v12 = v7 - v7 * a4;
    if (v11 == (unsigned char *)&dword_0 + 1)
    {
      CGAffineTransformMakeScale(&v17, a4, a4);
      double v13 = v12 * 0.5 / a4;
      CGAffineTransform v14 = &v17;
    }
    else
    {
      CGAffineTransformMakeScale(&v16, a4, a4);
      double v13 = v12 * -0.5 / a4;
      CGAffineTransform v14 = &v16;
    }
    return CGAffineTransformTranslate(retstr, v14, v13, (v9 - v9 * a4) * -0.5 / a4);
  }
  return self;
}

- (CGAffineTransform)_maps_transformScaledToTopAndTrailingAtScale:(SEL)a3
{
  if (a4 == 1.0 || a4 == 0.0)
  {
    long long v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    [(CGAffineTransform *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v10 = +[UIApplication sharedApplication];
    double v11 = (char *)[v10 userInterfaceLayoutDirection];

    double v12 = v7 - v7 * a4;
    if (v11 == (unsigned char *)&dword_0 + 1)
    {
      CGAffineTransformMakeScale(&v17, a4, a4);
      double v13 = v12 * -0.5 / a4;
      CGAffineTransform v14 = &v17;
    }
    else
    {
      CGAffineTransformMakeScale(&v16, a4, a4);
      double v13 = v12 * 0.5 / a4;
      CGAffineTransform v14 = &v16;
    }
    return CGAffineTransformTranslate(retstr, v14, v13, (v9 - v9 * a4) * -0.5 / a4);
  }
  return self;
}

- (double)_maps_maxConstraintConstantForAxis:(int64_t)a3
{
  double v5 = [(UIView *)self window];
  if (v5) {
    [(UIView *)self window];
  }
  else {
  double v6 = +[UIScreen mainScreen];
  }
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  if (a3 == 1) {
    return v10;
  }
  else {
    return v8;
  }
}

- (void)_maps_setAllContentHuggingAndCompressionResistancePriorities:(float)a3
{
  -[UIView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0);
  *(float *)&double v5 = a3;
  [(UIView *)self setContentHuggingPriority:1 forAxis:v5];
  *(float *)&double v6 = a3;
  [(UIView *)self setContentCompressionResistancePriority:0 forAxis:v6];
  *(float *)&double v7 = a3;

  [(UIView *)self setContentCompressionResistancePriority:1 forAxis:v7];
}

+ (void)_maps_animateForAndromeda:(BOOL)a3 animations:(id)a4
{
}

+ (void)_maps_animateForAndromeda:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!a3 && !+[UIView areAnimationsEnabled])
  {
    double v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"BacklightLuminanceDidChangeNotification" object:a1];
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_16460;
  v12[3] = &unk_725E0;
  BOOL v15 = a3;
  id v13 = v9;
  id v14 = a1;
  id v11 = v9;
  +[UIView animateWithDuration:0x10000 delay:v8 options:v12 animations:0.25 completion:0.0];
}

- (NSString)sceneIdentifierForLogging
{
  unsigned int v2 = [(UIView *)self window];
  double v3 = [v2 windowScene];
  double v4 = [v3 delegate];

  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___SceneIdentifierProviding])
  {
    double v5 = [v4 sceneIdentifier];
  }
  else if (v4)
  {
    double v5 = @"iOS";
  }
  else
  {
    double v5 = @"Unknown";
  }

  return (NSString *)v5;
}

@end