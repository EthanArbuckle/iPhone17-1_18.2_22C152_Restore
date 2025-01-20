@interface CKBackBarButtonItem
- (CKBackBarButtonItem)initWithTitle:(id)a3;
- (CKBackBarButtonItem)initWithUnreadCount:(int64_t)a3;
- (id)unnreadButtonImageWithString:(id)a3;
@end

@implementation CKBackBarButtonItem

- (CKBackBarButtonItem)initWithUnreadCount:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKBackBarButtonItem;
  v4 = [(CKBackBarButtonItem *)&v10 initWithTitle:0 style:0 target:0 action:0];
  v5 = v4;
  if (a3 >= 1 && v4)
  {
    v6 = [NSNumber numberWithInteger:a3];
    v7 = objc_msgSend(v6, "__ck_localizedString");

    v8 = [(CKBackBarButtonItem *)v5 unnreadButtonImageWithString:v7];
    [(CKBackBarButtonItem *)v5 setImage:v8];
  }
  return v5;
}

- (CKBackBarButtonItem)initWithTitle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKBackBarButtonItem;
  return [(CKBackBarButtonItem *)&v4 initWithTitle:a3 style:0 target:0 action:0];
}

- (id)unnreadButtonImageWithString:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = [v3 whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  id v7 = v6;
  v8 = _drawingAttributes();
  double v9 = 19.0;
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 33, v8, 0, 40.0, 19.0);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v39.origin.x = v11;
  v39.origin.y = v13;
  v39.size.width = v15;
  v39.size.height = v17;
  double Width = CGRectGetWidth(v39);
  if (UIAccessibilityIsBoldTextEnabled()) {
    double v9 = 21.0;
  }
  if (v9 - Width <= 10.0) {
    double v19 = Width + 12.0;
  }
  else {
    double v19 = v9;
  }
  v38.width = v19;
  v38.height = v9;
  UIGraphicsBeginImageContextWithOptions(v38, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v21 = [MEMORY[0x1E4F428B8] systemBlueColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v21 CGColor]);

  v40.origin.x = 0.0;
  v40.origin.y = 0.0;
  v40.size.width = v19;
  v40.size.height = v9;
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v19, v9, CGRectGetHeight(v40) * 0.5);
  id v22 = objc_claimAutoreleasedReturnValue();
  v23 = (const CGPath *)[v22 CGPath];

  CGContextAddPath(CurrentContext, v23);
  CGContextFillPath(CurrentContext);
  UIRectCenteredIntegralRectScale();
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  v32 = _drawingAttributes();
  objc_msgSend(v7, "drawWithRect:options:attributes:context:", 33, v32, 0, v25, v27, v29, v31, 0);

  v33 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v34 = [v33 _imageThatSuppressesAccessibilityHairlineThickening];

  v35 = [v34 imageWithRenderingMode:1];

  return v35;
}

@end