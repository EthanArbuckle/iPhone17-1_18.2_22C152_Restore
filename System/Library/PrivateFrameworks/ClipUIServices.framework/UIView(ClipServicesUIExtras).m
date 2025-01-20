@interface UIView(ClipServicesUIExtras)
+ (id)cps_vibrantSeparator;
+ (id)cps_viewWithBackgroundColor:()ClipServicesUIExtras cornerRadius:;
- (uint64_t)cps_configureForAnimatesAlphaWhenHighlighted:()ClipServicesUIExtras;
- (uint64_t)cps_sizeToFitWithinSize:()ClipServicesUIExtras;
- (void)cps_verticallyAlignTopView:()ClipServicesUIExtras bottomView:margin:;
@end

@implementation UIView(ClipServicesUIExtras)

+ (id)cps_viewWithBackgroundColor:()ClipServicesUIExtras cornerRadius:
{
  id v6 = a4;
  id v7 = objc_alloc_init(a1);
  [v7 _setContinuousCornerRadius:a2];
  [v7 setBackgroundColor:v6];

  [v7 setClipsToBounds:1];

  return v7;
}

- (uint64_t)cps_configureForAnimatesAlphaWhenHighlighted:()ClipServicesUIExtras
{
  double v3 = 0.16;
  v5[1] = 3221225472;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[2] = __77__UIView_ClipServicesUIExtras__cps_configureForAnimatesAlphaWhenHighlighted___block_invoke;
  v5[3] = &unk_1E6AE9020;
  if (!a3) {
    double v3 = 0.5;
  }
  v5[4] = a1;
  char v6 = a3;
  return [MEMORY[0x1E4F42FF0] animateWithDuration:50659328 delay:v5 options:0 animations:v3 completion:0.0];
}

- (uint64_t)cps_sizeToFitWithinSize:()ClipServicesUIExtras
{
  objc_msgSend(a1, "sizeThatFits:");
  [a1 transform];
  if (CGAffineTransformIsIdentity(&v3))
  {
    [a1 frame];
    return objc_msgSend(a1, "setFrame:");
  }
  else
  {
    [a1 bounds];
    return objc_msgSend(a1, "setBounds:");
  }
}

- (void)cps_verticallyAlignTopView:()ClipServicesUIExtras bottomView:margin:
{
  id v36 = a5;
  id v7 = a4;
  [a1 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat rect = v14;
  [v7 frame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  v38.origin.x = v9;
  v38.origin.y = v11;
  v38.size.width = v13;
  v38.size.height = v15;
  double Width = CGRectGetWidth(v38);
  v39.origin.x = v17;
  v39.origin.y = v19;
  v39.size.width = v21;
  double v24 = v21;
  double v25 = v23;
  v39.size.height = v23;
  CGFloat v26 = (Width - CGRectGetWidth(v39)) * 0.5;
  v40.origin.x = v9;
  v40.origin.y = v11;
  v40.size.width = v13;
  v40.size.height = rect;
  double Height = CGRectGetHeight(v40);
  [v7 bounds];
  CGFloat v28 = CGRectGetHeight(v41) + a2;
  [v36 bounds];
  CGFloat v29 = (Height - (v28 + CGRectGetHeight(v42))) * 0.5;
  objc_msgSend(v7, "setFrame:", v26, v29, v24, v25);

  [v36 frame];
  double v30 = v43.size.width;
  double v31 = v43.size.height;
  double v32 = (Width - CGRectGetWidth(v43)) * 0.5;
  v44.origin.x = v26;
  v44.origin.y = v29;
  v44.size.width = v24;
  v44.size.height = v25;
  objc_msgSend(v36, "setFrame:", v32, v29 + CGRectGetHeight(v44) + a2, v30, v31);
}

+ (id)cps_vibrantSeparator
{
  v0 = [MEMORY[0x1E4F427D8] effectWithStyle:8];
  v1 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v0 style:7];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v1];
  CGAffineTransform v3 = [MEMORY[0x1E4F428B8] whiteColor];
  v4 = [v2 contentView];
  [v4 setBackgroundColor:v3];

  v5 = [v2 heightAnchor];
  char v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  double v8 = [v5 constraintEqualToConstant:1.0 / v7];
  [v8 setActive:1];

  return v2;
}

@end