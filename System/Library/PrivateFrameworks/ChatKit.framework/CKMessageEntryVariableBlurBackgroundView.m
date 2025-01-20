@interface CKMessageEntryVariableBlurBackgroundView
+ (id)createVerticalGradientImageWithHeight:(double)a3 scale:(double)a4 bottomSolidAreaHeight:(double)a5 gradientLocationPoints:(id)a6 gradientAlphaValues:(id)a7 color:(id)a8;
- (CKMessageEntryVariableBlurBackgroundView)init;
- (NSString)backdropGroupName;
- (UIImageView)variableBlurColorOverlayView;
- (UITraitCollection)entryViewTraitCollection;
- (UIVisualEffectView)variableBlurEffectView;
- (id)inputAccessoryViewBackdropColor;
- (id)inputAccessoryViewBackdropEffects;
- (int64_t)style;
- (void)_updateVariableBlurImage;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setBackdropGroupName:(id)a3;
- (void)setEntryViewTraitCollection:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setVariableBlurColorOverlayView:(id)a3;
- (void)setVariableBlurEffectView:(id)a3;
@end

@implementation CKMessageEntryVariableBlurBackgroundView

- (CKMessageEntryVariableBlurBackgroundView)init
{
  v9.receiver = self;
  v9.super_class = (Class)CKMessageEntryVariableBlurBackgroundView;
  v2 = [(CKMessageEntryVariableBlurBackgroundView *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    variableBlurEffectView = v2->_variableBlurEffectView;
    v2->_variableBlurEffectView = (UIVisualEffectView *)v3;

    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    variableBlurColorOverlayView = v2->_variableBlurColorOverlayView;
    v2->_variableBlurColorOverlayView = v5;

    [(UIImageView *)v2->_variableBlurColorOverlayView setContentMode:0];
    v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIImageView *)v2->_variableBlurColorOverlayView setBackgroundColor:v7];

    [(CKMessageEntryVariableBlurBackgroundView *)v2 addSubview:v2->_variableBlurEffectView];
    [(CKMessageEntryVariableBlurBackgroundView *)v2 addSubview:v2->_variableBlurColorOverlayView];
  }
  return v2;
}

+ (id)createVerticalGradientImageWithHeight:(double)a3 scale:(double)a4 bottomSolidAreaHeight:(double)a5 gradientLocationPoints:(id)a6 gradientAlphaValues:(id)a7 color:(id)a8
{
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  v16 = [MEMORY[0x1E4F42A60] preferredFormat];
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v16, 1.0, a3 * a4);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __159__CKMessageEntryVariableBlurBackgroundView_createVerticalGradientImageWithHeight_scale_bottomSolidAreaHeight_gradientLocationPoints_gradientAlphaValues_color___block_invoke;
  v23[3] = &unk_1E5624CD8;
  double v27 = a3;
  double v28 = a5;
  double v29 = a4;
  id v24 = v14;
  id v25 = v15;
  id v26 = v13;
  id v18 = v13;
  id v19 = v15;
  id v20 = v14;
  v21 = [v17 imageWithActions:v23];

  return v21;
}

void __159__CKMessageEntryVariableBlurBackgroundView_createVerticalGradientImageWithHeight_scale_bottomSolidAreaHeight_gradientLocationPoints_gradientAlphaValues_color___block_invoke(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  CGFloat v7 = *MEMORY[0x1E4F1DAD8];
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  CFIndex v9 = [*(id *)(a1 + 32) count];
  Mutable = CFArrayCreateMutable(0, v9, MEMORY[0x1E4F1D510]);
  MEMORY[0x1F4188790](Mutable);
  v12 = (const CGFloat *)((char *)v23 - v11);
  bzero((char *)v23 - v11, v13);
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      id v15 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      [v15 doubleValue];
      double v17 = v16;

      id v18 = [*(id *)(a1 + 40) colorWithAlphaComponent:v17];
      CFArrayAppendValue(Mutable, (const void *)[v18 CGColor]);
      id v19 = [*(id *)(a1 + 48) objectAtIndexedSubscript:i];
      [v19 doubleValue];
      v12[i] = v20;
    }
  }
  v21 = CGGradientCreateWithColors(0, Mutable, v12);
  v22 = (CGContext *)[v3 CGContext];
  v24.x = 0.0;
  v24.y = (v4 - v5) * v6;
  v25.x = v7;
  v25.y = v8;
  CGContextDrawLinearGradient(v22, v21, v24, v25, 3u);
  CGGradientRelease(v21);
  CFRelease(Mutable);
}

- (void)setEntryViewTraitCollection:(id)a3
{
  id v5 = a3;
  if ((-[UITraitCollection isEqual:](self->_entryViewTraitCollection, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_entryViewTraitCollection, a3);
    [(CKMessageEntryVariableBlurBackgroundView *)self _updateVariableBlurImage];
  }
}

- (void)_updateVariableBlurImage
{
  v18[1] = *MEMORY[0x1E4F143B8];
  [(CKMessageEntryVariableBlurBackgroundView *)self bounds];
  if (v3 == 0.0)
  {
    [(UIImageView *)self->_variableBlurColorOverlayView setImage:0];
    variableBlurEffectView = self->_variableBlurEffectView;
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
    [(UIVisualEffectView *)variableBlurEffectView setBackgroundEffects:v5];
  }
  else
  {
    double v6 = v3;
    CGFloat v7 = [(CKMessageEntryVariableBlurBackgroundView *)self entryViewTraitCollection];
    CGFloat v8 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    CFIndex v9 = [v8 resolvedColorForTraitCollection:v7];

    [v7 displayScale];
    double v11 = v10;
    double v12 = 42.0;
    if (v6 <= 42.0) {
      double v12 = v6;
    }
    double v13 = v6 - v12;
    id v14 = [(id)objc_opt_class() createVerticalGradientImageWithHeight:&unk_1EDF15218 scale:&unk_1EDF15200 bottomSolidAreaHeight:v9 gradientLocationPoints:v6 gradientAlphaValues:v11 color:v6 - v12];
    [(UIImageView *)self->_variableBlurColorOverlayView setImage:v14];
    id v15 = [(id)objc_opt_class() createVerticalGradientImageWithHeight:&unk_1EDF15248 scale:&unk_1EDF15230 bottomSolidAreaHeight:v9 gradientLocationPoints:v6 gradientAlphaValues:v11 color:v13];
    double v16 = [MEMORY[0x1E4F427D8] effectWithVariableBlurRadius:v15 imageMask:0.833333333];
    v18[0] = v16;
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [(UIVisualEffectView *)self->_variableBlurEffectView setBackgroundEffects:v17];
  }
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryVariableBlurBackgroundView;
  [(CKMessageEntryVariableBlurBackgroundView *)&v3 safeAreaInsetsDidChange];
  [(CKMessageEntryVariableBlurBackgroundView *)self _updateVariableBlurImage];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CKMessageEntryVariableBlurBackgroundView;
  [(CKMessageEntryVariableBlurBackgroundView *)&v15 layoutSubviews];
  [(CKMessageEntryVariableBlurBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIVisualEffectView *)self->_variableBlurEffectView frame];
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  if (!CGRectEqualToRect(v16, v17))
  {
    -[UIVisualEffectView setFrame:](self->_variableBlurEffectView, "setFrame:", v4, v6, v8, v10);
    -[UIImageView setFrame:](self->_variableBlurColorOverlayView, "setFrame:", v4, v6, v8, v10);
    [(CKMessageEntryVariableBlurBackgroundView *)self _updateVariableBlurImage];
  }
}

- (void)setBackdropGroupName:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_backdropGroupName, "isEqualToString:"))
  {
    double v4 = (NSString *)[v6 copy];
    backdropGroupName = self->_backdropGroupName;
    self->_backdropGroupName = v4;

    [(UIVisualEffectView *)self->_variableBlurEffectView _setGroupName:v6];
  }
}

- (id)inputAccessoryViewBackdropColor
{
  return 0;
}

- (id)inputAccessoryViewBackdropEffects
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UITraitCollection)entryViewTraitCollection
{
  return self->_entryViewTraitCollection;
}

- (UIVisualEffectView)variableBlurEffectView
{
  return self->_variableBlurEffectView;
}

- (void)setVariableBlurEffectView:(id)a3
{
}

- (UIImageView)variableBlurColorOverlayView
{
  return self->_variableBlurColorOverlayView;
}

- (void)setVariableBlurColorOverlayView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableBlurColorOverlayView, 0);
  objc_storeStrong((id *)&self->_variableBlurEffectView, 0);
  objc_storeStrong((id *)&self->_entryViewTraitCollection, 0);

  objc_storeStrong((id *)&self->_backdropGroupName, 0);
}

@end