@interface UIView(ISCommonUI)
- (id)addConstraintsToFillSuperview;
- (id)addConstraintsToSetSize:()ISCommonUI;
- (id)allSubviews;
- (id)debugHighlight;
- (id)generateImage;
- (uint64_t)centerHorizontallyInSuperview;
- (uint64_t)centerVerticallyInSuperview;
- (void)performOnAllSubviews:()ISCommonUI;
- (void)setDebugHighlight:()ISCommonUI;
- (void)setRandomDebugHighlight;
@end

@implementation UIView(ISCommonUI)

- (id)allSubviews
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] arrayWithObject:a1];
  v3 = [a1 subviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) allSubviews];
        [v2 addObjectsFromArray:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  v9 = (void *)[v2 copy];

  return v9;
}

- (void)performOnAllSubviews:()ISCommonUI
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  v4[2](v4, a1);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = objc_msgSend(a1, "subviews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) performOnAllSubviews:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (uint64_t)centerHorizontallyInSuperview
{
  [a1 frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [a1 superview];
  [v8 frame];
  double v10 = v9;
  [a1 frame];
  double v12 = floor((v10 - v11) * 0.5);

  return objc_msgSend(a1, "setFrame:", v12, v3, v5, v7);
}

- (uint64_t)centerVerticallyInSuperview
{
  [a1 frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [a1 superview];
  [v8 frame];
  double v10 = v9;
  [a1 frame];
  double v12 = floor((v10 - v11) * 0.5);

  return objc_msgSend(a1, "setFrame:", v3, v12, v5, v7);
}

- (id)debugHighlight
{
  return objc_getAssociatedObject(a1, CurrentDebugHighlightKey);
}

- (void)setRandomDebugHighlight
{
  double v2 = (float)((float)arc4random() * 0.0039062);
  float v3 = (double)(arc4random() & 0x7F) * 0.00390625;
  double v4 = (float)(v3 + 0.5);
  float v5 = (double)(arc4random() & 0x7F) * 0.00390625;
  id v6 = [MEMORY[0x263F1C550] colorWithHue:v2 saturation:v4 brightness:(float)(v5 + 0.5) alpha:1.0];
  [a1 setDebugHighlight:v6];
}

- (void)setDebugHighlight:()ISCommonUI
{
  id v4 = a3;
  if (v4)
  {
    double v27 = 1.0;
    float v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 scale];
    double v7 = v6;

    uint64_t v8 = [a1 backgroundColor];
    objc_setAssociatedObject(a1, PreviousBackgroundColorKey, v8, (void *)0x301);

    double v9 = (void *)MEMORY[0x263F1C550];
    double v10 = [a1 layer];
    double v11 = objc_msgSend(v9, "colorWithCGColor:", objc_msgSend(v10, "borderColor"));
    objc_setAssociatedObject(a1, PreviousBorderColorKey, v11, (void *)0x301);

    double v12 = NSNumber;
    long long v13 = [a1 layer];
    [v13 borderWidth];
    long long v14 = objc_msgSend(v12, "numberWithDouble:");
    objc_setAssociatedObject(a1, &PreviousBorderWidthKey, v14, (void *)0x301);

    objc_setAssociatedObject(a1, CurrentDebugHighlightKey, v4, (void *)0x301);
    if (([v4 getRed:0 green:0 blue:0 alpha:&v27] & 1) == 0
      && ([v4 getWhite:0 alpha:&v27] & 1) == 0)
    {
      [v4 getHue:0 saturation:0 brightness:0 alpha:&v27];
    }
    uint64_t v15 = [v4 colorWithAlphaComponent:v27 * 0.25];
    [a1 setBackgroundColor:v15];

    uint64_t v16 = [v4 CGColor];
    v17 = [a1 layer];
    [v17 setBorderColor:v16];

    v18 = [a1 layer];
    [v18 setBorderWidth:1.0 / v7];
  }
  else
  {
    v19 = objc_getAssociatedObject(a1, PreviousBackgroundColorKey);
    [a1 setBackgroundColor:v19];

    objc_getAssociatedObject(a1, PreviousBorderColorKey);
    id v20 = objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 CGColor];
    v22 = [a1 layer];
    [v22 setBorderColor:v21];

    v23 = objc_getAssociatedObject(a1, &PreviousBorderWidthKey);
    [v23 doubleValue];
    double v25 = v24;
    v26 = [a1 layer];
    [v26 setBorderWidth:v25];

    objc_setAssociatedObject(a1, PreviousBackgroundColorKey, 0, (void *)0x301);
    objc_setAssociatedObject(a1, PreviousBorderColorKey, 0, (void *)0x301);
    objc_setAssociatedObject(a1, &PreviousBorderWidthKey, 0, (void *)0x301);
    objc_setAssociatedObject(a1, CurrentDebugHighlightKey, 0, (void *)0x301);
  }
}

- (id)generateImage
{
  [a1 bounds];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  char v6 = [a1 isOpaque];
  v12.width = v3;
  v12.height = v5;
  UIGraphicsBeginImageContextWithOptions(v12, v6, 0.0);
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  uint64_t v8 = [a1 layer];
  [v8 renderInContext:CurrentContext];

  double v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v9;
}

- (id)addConstraintsToFillSuperview
{
  if (([a1 translatesAutoresizingMaskIntoConstraints] & 1) != 0
    || ([a1 superview], double v2 = objc_claimAutoreleasedReturnValue(), v2, !v2))
  {
    uint64_t v8 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    CGFloat v3 = _NSDictionaryOfVariableBindings(&cfstr_Self.isa, a1, 0);
    double v4 = [MEMORY[0x263EFF980] array];
    CGFloat v5 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[self]|" options:0 metrics:0 views:v3];
    [v4 addObjectsFromArray:v5];

    char v6 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[self]|" options:0 metrics:0 views:v3];
    [v4 addObjectsFromArray:v6];

    double v7 = [a1 superview];
    [v7 addConstraints:v4];

    uint64_t v8 = (void *)[v4 copy];
  }
  return v8;
}

- (id)addConstraintsToSetSize:()ISCommonUI
{
  v18[2] = *MEMORY[0x263EF8340];
  if (([a1 translatesAutoresizingMaskIntoConstraints] & 1) != 0
    || ([a1 superview], char v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    uint64_t v15 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    double v7 = _NSDictionaryOfVariableBindings(&cfstr_Self.isa, a1, 0);
    v17[0] = @"width";
    uint64_t v8 = [NSNumber numberWithDouble:a2];
    v17[1] = @"height";
    v18[0] = v8;
    double v9 = [NSNumber numberWithDouble:a3];
    v18[1] = v9;
    double v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    double v11 = [MEMORY[0x263EFF980] array];
    CGSize v12 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[self(height)]" options:0 metrics:v10 views:v7];
    [v11 addObjectsFromArray:v12];

    long long v13 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[self(width)]" options:0 metrics:v10 views:v7];
    [v11 addObjectsFromArray:v13];

    long long v14 = [a1 superview];
    [v14 addConstraints:v11];

    uint64_t v15 = (void *)[v11 copy];
  }
  return v15;
}

@end