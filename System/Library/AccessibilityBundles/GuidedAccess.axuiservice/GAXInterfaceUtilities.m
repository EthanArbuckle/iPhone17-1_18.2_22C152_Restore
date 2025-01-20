@interface GAXInterfaceUtilities
+ (CGSize)labelSizeThatFitsText:(id)a3 constrainedToSize:(CGSize)a4 font:(id)a5 styleProvider:(id)a6;
+ (id)imageWithImage:(id)a3 size:(CGSize)a4;
+ (id)labelWithText:(id)a3 font:(id)a4 allowMultipleLines:(BOOL)a5 styleProvider:(id)a6;
+ (id)labelWithText:(id)a3 font:(id)a4 allowMultipleLines:(BOOL)a5 textAlignment:(int64_t)a6 styleProvider:(id)a7;
+ (id)labelWithText:(id)a3 font:(id)a4 styleProvider:(id)a5;
+ (id)resizableOptionsButtonBackgroundImageWithStyleProvider:(id)a3;
+ (id)statusBarWithStyle:(int64_t)a3 containerViewBounds:(CGRect)a4;
@end

@implementation GAXInterfaceUtilities

+ (id)imageWithImage:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  v10.double width = width;
  v10.double height = height;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, width, height);

  v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v7;
}

+ (id)resizableOptionsButtonBackgroundImageWithStyleProvider:(id)a3
{
  id v3 = a3;
  [v3 featureViewOptionsButtonHeight];
  double v5 = v4;
  [v3 featureViewOptionsButtonLineWidth];
  CGFloat v7 = v6 * 0.5;
  [v3 featureViewOptionsButtonHeight];
  CGFloat v9 = v8 + 1.0;
  double v23 = v8 + 1.0;
  id v10 = [v3 featureViewOptionsButtonLineColor];
  v11 = (CGColor *)[v10 CGColor];

  [v3 featureViewOptionsButtonHeight];
  double v13 = v12;
  [v3 featureViewOptionsButtonLineWidth];
  CGFloat v15 = (v13 - v14) * 0.5;
  [v3 featureViewOptionsButtonLineWidth];
  CGFloat v17 = v16;

  v25.double width = v9;
  v25.double height = v5;
  UIGraphicsBeginImageContextWithOptions(v25, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, v17);
  CGContextSetStrokeColorWithColor(CurrentContext, v11);
  CGContextMoveToPoint(CurrentContext, v7 + v15, v7);
  CGFloat v19 = v9 - v7;
  CGContextAddLineToPoint(CurrentContext, v19 - v15, v7);
  CGContextAddArcToPoint(CurrentContext, v19, v7, v19, v5 * 0.5, v15);
  CGContextAddArcToPoint(CurrentContext, v19, v5 - v7, v19 - v15, v5 - v7, v15);
  CGContextAddLineToPoint(CurrentContext, v7 + v15, v5 - v7);
  CGContextAddArcToPoint(CurrentContext, v7, v5 - v7, v7, v5 * 0.5, v15);
  CGContextAddArcToPoint(CurrentContext, v7, v7, v7 + v15, v7, v15);
  CGContextStrokePath(CurrentContext);
  v20 = UIGraphicsGetImageFromCurrentImageContext();
  v21 = objc_msgSend(v20, "resizableImageWithCapInsets:", (v5 + -1.0) * 0.5, (v23 + -1.0) * 0.5, (v5 + -1.0) * 0.5, (v23 + -1.0) * 0.5);

  UIGraphicsEndImageContext();

  return v21;
}

+ (id)labelWithText:(id)a3 font:(id)a4 styleProvider:(id)a5
{
  return [a1 labelWithText:a3 font:a4 allowMultipleLines:0 textAlignment:1 styleProvider:a5];
}

+ (id)labelWithText:(id)a3 font:(id)a4 allowMultipleLines:(BOOL)a5 styleProvider:(id)a6
{
  return [a1 labelWithText:a3 font:a4 allowMultipleLines:a5 textAlignment:1 styleProvider:a6];
}

+ (id)labelWithText:(id)a3 font:(id)a4 allowMultipleLines:(BOOL)a5 textAlignment:(int64_t)a6 styleProvider:(id)a7
{
  BOOL v8 = a5;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  CGFloat v15 = [v11 defaultLabelTextColor];
  [v14 setTextColor:v15];

  double v16 = [v11 defaultLabelBackgroundColor];

  [v14 setBackgroundColor:v16];
  [v14 setFont:v12];

  [v14 setTextAlignment:a6];
  [v14 setText:v13];

  if (v8)
  {
    [v14 setLineBreakMode:0];
    [v14 setNumberOfLines:0];
  }
  [v14 sizeToFit];

  return v14;
}

+ (CGSize)labelSizeThatFitsText:(id)a3 constrainedToSize:(CGSize)a4 font:(id)a5 styleProvider:(id)a6
{
  objc_msgSend(a3, "_legacy_sizeWithFont:constrainedToSize:", a5, a4.width, a4.height);
  result.double height = v7;
  result.double width = v6;
  return result;
}

+ (id)statusBarWithStyle:(int64_t)a3 containerViewBounds:(CGRect)a4
{
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = objc_msgSend(objc_alloc((Class)UIStatusBar), "initWithFrame:showForegroundView:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v8 frame];
  objc_msgSend(v8, "setFrame:", x, y, width, CGRectGetHeight(v11));
  [v8 setAutoresizingMask:34];
  [v8 setUserInteractionEnabled:0];
  [v8 forceUpdateData:0];
  [v8 requestStyle:a3];
  [v8 setAccessibilityElementsHidden:1];

  return v8;
}

@end