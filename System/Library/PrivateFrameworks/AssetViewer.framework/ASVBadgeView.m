@interface ASVBadgeView
+ (id)badgeForThumbnail:(id)a3;
+ (id)badgeView;
+ (id)highlightedBlurViewEffects;
+ (id)normalBlurViewEffects;
+ (void)applyBlurWithBackground:(id)a3 offset:(CGPoint)a4;
- (ASVBadgeDescription)badgeDescription;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (CGSize)thumbnailSize;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_updateShadow;
- (void)setHighlighted:(BOOL)a3;
- (void)setThumbnailSize:(CGSize)a3;
- (void)setUpView;
@end

@implementation ASVBadgeView

+ (id)badgeView
{
  v2 = objc_opt_new();
  [v2 setUpView];
  return v2;
}

+ (id)normalBlurViewEffects
{
  if (normalBlurViewEffects_onceToken != -1) {
    dispatch_once(&normalBlurViewEffects_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)normalBlurViewEffects_blurViewEffects;
  return v2;
}

void __37__ASVBadgeView_normalBlurViewEffects__block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1620];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 colorEffectMonochromeTint:v1 blendingAmount:0.82 brightnessAdjustment:0.0];
  v3 = (void *)MEMORY[0x1E4FB14C8];
  v4 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", v2);
  UIRoundToScreenScale();
  v5 = objc_msgSend(v3, "effectWithBlurRadius:");
  v9[1] = v5;
  v6 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.8];
  v9[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  v8 = (void *)normalBlurViewEffects_blurViewEffects;
  normalBlurViewEffects_blurViewEffects = v7;
}

+ (id)highlightedBlurViewEffects
{
  if (highlightedBlurViewEffects_onceToken != -1) {
    dispatch_once(&highlightedBlurViewEffects_onceToken, &__block_literal_global_7_0);
  }
  v2 = (void *)highlightedBlurViewEffects_highlightedBlurViewEffects;
  return v2;
}

void __42__ASVBadgeView_highlightedBlurViewEffects__block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1620];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 colorEffectMonochromeTint:v1 blendingAmount:0.52 brightnessAdjustment:0.0];
  v3 = (void *)MEMORY[0x1E4FB14C8];
  v4 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", v2);
  UIRoundToScreenScale();
  v5 = objc_msgSend(v3, "effectWithBlurRadius:");
  v9[1] = v5;
  v6 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.8];
  v9[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  v8 = (void *)highlightedBlurViewEffects_highlightedBlurViewEffects;
  highlightedBlurViewEffects_highlightedBlurViewEffects = v7;
}

- (void)setUpView
{
  [(ASVBadgeView *)self setOpaque:0];
  v3 = (UIView *)objc_opt_new();
  shadowView = self->_shadowView;
  self->_shadowView = v3;

  v5 = [(UIView *)self->_shadowView layer];
  objc_msgSend(v5, "setShadowOffset:", 0.0, 0.0);

  id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.06];
  uint64_t v7 = [v6 CGColor];
  v8 = [(UIView *)self->_shadowView layer];
  [v8 setShadowColor:v7];

  v9 = [(UIView *)self->_shadowView layer];
  LODWORD(v10) = 1.0;
  [v9 setShadowOpacity:v10];

  [(UIView *)self->_shadowView setAutoresizingMask:18];
  [(ASVBadgeView *)self bounds];
  -[UIView setFrame:](self->_shadowView, "setFrame:");
  v11 = (UIVisualEffectView *)objc_opt_new();
  blurView = self->_blurView;
  self->_blurView = v11;

  v13 = +[ASVBadgeView normalBlurViewEffects];
  [(UIVisualEffectView *)self->_blurView setBackgroundEffects:v13];

  [(UIVisualEffectView *)self->_blurView setAutoresizingMask:18];
  [(ASVBadgeView *)self bounds];
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
  [(UIVisualEffectView *)self->_blurView setClipsToBounds:1];
  v14 = (UIImageView *)objc_opt_new();
  badgeImageView = self->_badgeImageView;
  self->_badgeImageView = v14;

  [(UIImageView *)self->_badgeImageView setAutoresizingMask:18];
  [(ASVBadgeView *)self bounds];
  -[UIImageView setFrame:](self->_badgeImageView, "setFrame:");
  [(ASVBadgeView *)self addSubview:self->_shadowView];
  [(ASVBadgeView *)self addSubview:self->_blurView];
  v16 = self->_badgeImageView;
  [(ASVBadgeView *)self addSubview:v16];
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
  +[ASVBadgeDescription descriptionForSize:](ASVBadgeDescription, "descriptionForSize:");
  v4 = (ASVBadgeDescription *)objc_claimAutoreleasedReturnValue();
  badgeDescription = self->_badgeDescription;
  self->_badgeDescription = v4;

  id v6 = [(ASVBadgeView *)self badgeDescription];
  uint64_t v7 = [v6 badgeImage];
  [(UIImageView *)self->_badgeImageView setImage:v7];

  v8 = [(ASVBadgeView *)self badgeDescription];
  [v8 badgeSize];
  double v10 = v9 * 0.5;
  v11 = [(UIVisualEffectView *)self->_blurView layer];
  [v11 setCornerRadius:v10];

  [(ASVBadgeView *)self _updateShadow];
  [(ASVBadgeView *)self invalidateIntrinsicContentSize];
}

- (void)_updateShadow
{
  v3 = [(ASVBadgeView *)self badgeDescription];
  [v3 shadowSize];
  double v5 = v4;
  id v6 = [(UIView *)self->_shadowView layer];
  [v6 setShadowRadius:v5];

  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v9 = [(ASVBadgeView *)self badgeDescription];
  [v9 badgeSize];
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v7, v8, v11, v13);
  id v14 = objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 CGPath];
  v16 = [(UIView *)self->_shadowView layer];
  [v16 setShadowPath:v15];

  v17 = [(ASVBadgeView *)self badgeDescription];
  [v17 shadowSize];
  CGFloat v19 = v18 * -2.0;
  v20 = [(ASVBadgeView *)self badgeDescription];
  [v20 shadowSize];
  CGFloat v22 = v21 * -2.0;
  v44.origin.double x = v7;
  v44.origin.double y = v8;
  v44.size.double width = v11;
  v44.size.double height = v13;
  CGRect v45 = CGRectInset(v44, v19, v22);
  double y = v45.origin.y;
  double x = v45.origin.x;
  double width = v45.size.width;
  double height = v45.size.height;

  v25 = [(ASVBadgeView *)self badgeDescription];
  [v25 shadowSize];
  CGFloat v27 = v26 + v26;
  v28 = [(ASVBadgeView *)self badgeDescription];
  [v28 shadowSize];
  CGFloat v30 = v29 + v29;
  v46.origin.double x = v7;
  v46.origin.double y = v8;
  v46.size.double width = v11;
  v46.size.double height = v13;
  CGRect v47 = CGRectOffset(v46, v27, v30);
  double v31 = v47.origin.x;
  double v32 = v47.origin.y;
  double v33 = v47.size.width;
  double v34 = v47.size.height;

  v35 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v7, v8, width, height);
  v36 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v31, v32, v33, v34);
  v37 = [v36 bezierPathByReversingPath];
  [v35 appendPath:v37];

  v38 = objc_opt_new();
  id v40 = v35;
  objc_msgSend(v38, "setPath:", objc_msgSend(v40, "CGPath"));
  objc_msgSend(v38, "setFrame:", x, y, width, height);
  v39 = [(UIView *)self->_shadowView layer];
  [v39 setMask:v38];
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  if (a3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  [(UIImageView *)self->_badgeImageView setDrawMode:v5];
  if (a3) {
    +[ASVBadgeView highlightedBlurViewEffects];
  }
  else {
  id v6 = +[ASVBadgeView normalBlurViewEffects];
  }
  [(UIVisualEffectView *)self->_blurView setBackgroundEffects:v6];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(ASVBadgeView *)self badgeDescription];
  [v2 badgeSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

+ (id)badgeForThumbnail:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  double v7 = +[ASVBadgeDescription descriptionForSize:](ASVBadgeDescription, "descriptionForSize:");
  [v7 badgeSize];
  double v9 = v8;
  double v11 = v10;
  [v7 shadowSize];
  double v13 = v12;
  [v7 badgeOffset];
  double v15 = v6 - (v9 + v13 * 2.0) - v14;
  [v7 badgeOffset];
  uint64_t v17 = v16;
  double v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v9 + v13 * 2.0, v11 + v13 * 2.0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __34__ASVBadgeView_badgeForThumbnail___block_invoke;
  v23[3] = &unk_1E6DD7A68;
  id v25 = v7;
  id v26 = a1;
  double v27 = v15;
  uint64_t v28 = v17;
  id v24 = v4;
  double v29 = v13;
  double v30 = v9;
  double v31 = v11;
  id v19 = v7;
  id v20 = v4;
  double v21 = [v18 imageWithActions:v23];

  return v21;
}

void __34__ASVBadgeView_badgeForThumbnail___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = -*(double *)(a1 + 56);
  double v6 = -*(double *)(a1 + 64);
  id v7 = a2;
  objc_msgSend(v3, "applyBlurWithBackground:offset:", v4, v5, v6);
  double v8 = [*(id *)(a1 + 40) badgeImage];
  objc_msgSend(v8, "drawInRect:", *(double *)(a1 + 72), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));

  double v9 = [v7 currentImage];
  double v10 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", *(double *)(a1 + 72), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  [v7 CGContext];
  CGContextClear();
  [v10 addClip];
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(v9, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], v12);
  CGContextResetClip((CGContextRef)[v7 CGContext]);
  double v13 = [v7 currentImage];

  double v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.06];
  double v15 = (CGContext *)[v7 CGContext];
  CGFloat v16 = *(double *)(a1 + 72);
  id v17 = v14;
  double v18 = (CGColor *)[v17 CGColor];
  CGContextSetShadowWithColor(v15, *MEMORY[0x1E4F1DB30], v16, v18);
  id v20 = [v7 currentImage];

  id v19 = [v7 currentImage];

  objc_msgSend(v19, "drawAtPoint:", v11, v12);
}

+ (void)applyBlurWithBackground:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  double v9 = v8;

  double v33 = [MEMORY[0x1E4F1E018] contextWithOptions:0];
  double v10 = v6;
  if ([v6 ioSurface]) {
    objc_msgSend(MEMORY[0x1E4F1E050], "imageWithIOSurface:", objc_msgSend(v6, "ioSurface"));
  }
  else {
  double v11 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCGImage:", objc_msgSend(v6, "CGImage"));
  }
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v34[0] = *MEMORY[0x1E4F1DAB8];
  v34[1] = v12;
  v34[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  double v13 = (void *)MEMORY[0x1E4F1E040];
  id v14 = v11;
  double v15 = [v13 filterWithName:@"CIAffineClamp"];
  uint64_t v16 = *MEMORY[0x1E4F1E480];
  [v15 setValue:v14 forKey:*MEMORY[0x1E4F1E480]];

  id v17 = [MEMORY[0x1E4F29238] valueWithBytes:v34 objCType:"{CGAffineTransform=dddddd}"];
  double v32 = v15;
  [v15 setValue:v17 forKey:*MEMORY[0x1E4F1E508]];

  double v18 = [v15 outputImage];
  id v19 = [MEMORY[0x1E4F1E040] filterWithName:@"CIGaussianBlur"];
  [v19 setDefaults];
  id v20 = [NSNumber numberWithDouble:v9 * 10.0];
  [v19 setValue:v20 forKey:*MEMORY[0x1E4F1E4E0]];

  [v19 setValue:v18 forKey:v16];
  double v21 = [v19 outputImage];

  CGFloat v22 = [MEMORY[0x1E4F1E040] filterWithName:@"CIColorControls"];
  [v22 setValue:v21 forKey:v16];
  [v22 setValue:&unk_1F3DEEC80 forKey:*MEMORY[0x1E4F1E4E8]];
  v23 = [v22 outputImage];

  id v24 = [MEMORY[0x1E4F1E040] filterWithName:@"CIConstantColorGenerator"];
  double v31 = [MEMORY[0x1E4F1E008] colorWithString:@"1.0 1.0 1.0 0.405"];
  [v24 setValue:v31 forKey:*MEMORY[0x1E4F1E448]];
  id v25 = [v24 outputImage];
  id v26 = [MEMORY[0x1E4F1E040] filterWithName:@"CIAdditionCompositing"];
  [v26 setValue:v25 forKey:v16];
  [v26 setValue:v23 forKey:*MEMORY[0x1E4F1E418]];
  double v27 = [v26 outputImage];

  [v14 extent];
  uint64_t v28 = (CGImage *)objc_msgSend(v33, "createCGImage:fromRect:", v27);
  double v29 = (void *)MEMORY[0x1E4FB1818];
  [v10 scale];
  double v30 = objc_msgSend(v29, "imageWithCGImage:scale:orientation:", v28, 0);
  CGImageRelease(v28);
  objc_msgSend(v30, "drawAtPoint:", x, y);
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (ASVBadgeDescription)badgeDescription
{
  return self->_badgeDescription;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeDescription, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end