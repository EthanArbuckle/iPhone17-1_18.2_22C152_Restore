@interface SLSheetMasklayer
- (SLSheetMasklayer)initWithBackgroundColor:(id)a3 cornerRadius:(double)a4;
- (UIColor)clipBackgroundColor;
- (double)clipCornerRadius;
- (void)animateSheetMaskFromOldSheetFrame:(CGRect)a3 toSheetFrame:(CGRect)a4 duration:(double)a5;
- (void)removeAllAnimations;
- (void)removeSheetCutout;
- (void)restoreSheetCutout;
- (void)setClipBackgroundColor:(id)a3;
- (void)setClipCornerRadius:(double)a3;
- (void)updateMaskWithBounds:(CGRect)a3 maskRect:(CGRect)a4;
@end

@implementation SLSheetMasklayer

- (SLSheetMasklayer)initWithBackgroundColor:(id)a3 cornerRadius:(double)a4
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SLSheetMasklayer;
  v8 = [(SLSheetMasklayer *)&v31 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F39BE8] layer];
    topLayer = v8->_topLayer;
    v8->_topLayer = (CALayer *)v9;

    uint64_t v11 = [MEMORY[0x1E4F39BE8] layer];
    leftLayer = v8->_leftLayer;
    v8->_leftLayer = (CALayer *)v11;

    uint64_t v13 = [MEMORY[0x1E4F39BE8] layer];
    bottomLayer = v8->_bottomLayer;
    v8->_bottomLayer = (CALayer *)v13;

    uint64_t v15 = [MEMORY[0x1E4F39BE8] layer];
    rightLayer = v8->_rightLayer;
    v8->_rightLayer = (CALayer *)v15;

    uint64_t v17 = +[_SLSheetMaskLayer layer];
    sheetMaskLayer = v8->_sheetMaskLayer;
    v8->_sheetMaskLayer = (_SLSheetMaskLayer *)v17;

    objc_storeStrong((id *)&v8->_clipBackgroundColor, a3);
    v8->_clipCornerRadius = a4;
    objc_storeStrong((id *)&v8->_backgroundColor, a3);
    id v19 = [MEMORY[0x1E4F428B8] clearColor];
    -[SLSheetMasklayer setBackgroundColor:](v8, "setBackgroundColor:", [v19 CGColor]);

    v32[0] = v8->_topLayer;
    v32[1] = v8->_leftLayer;
    v32[2] = v8->_bottomLayer;
    v32[3] = v8->_rightLayer;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __57__SLSheetMasklayer_initWithBackgroundColor_cornerRadius___block_invoke;
    v28[3] = &unk_1E6467A70;
    id v21 = v7;
    id v29 = v21;
    v22 = v8;
    v30 = v22;
    [v20 enumerateObjectsUsingBlock:v28];

    uint64_t v23 = [MEMORY[0x1E4F39BE8] layer];
    id v24 = v22[9];
    v22[9] = (id)v23;

    [v22[9] removeAllAnimations];
    id v25 = v21;
    objc_msgSend(v22[9], "setBackgroundColor:", objc_msgSend(v25, "CGColor"));
    -[_SLSheetMaskLayer setBounds:](v8->_sheetMaskLayer, "setBounds:", 0.0, 0.0, 200.0, 200.0);
    v26 = [MEMORY[0x1E4F42D90] mainScreen];
    [v26 scale];
    -[_SLSheetMaskLayer setContentsScale:](v8->_sheetMaskLayer, "setContentsScale:");

    -[_SLSheetMaskLayer setContentsCenter:](v8->_sheetMaskLayer, "setContentsCenter:", 0.5, 0.5, 0.100000001, 0.100000001);
    [(_SLSheetMaskLayer *)v8->_sheetMaskLayer setClipBackgroundColor:v25];
    [(_SLSheetMaskLayer *)v8->_sheetMaskLayer setClipCornerRadius:a4];
    [(_SLSheetMaskLayer *)v8->_sheetMaskLayer removeAllAnimations];
    [v22 addSublayer:v8->_sheetMaskLayer];
    [v22 removeAllAnimations];
  }
  return v8;
}

void __57__SLSheetMasklayer_initWithBackgroundColor_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
  [v5 removeAllAnimations];
  [*(id *)(a1 + 40) addSublayer:v5];
}

- (void)removeAllAnimations
{
  v3.receiver = self;
  v3.super_class = (Class)SLSheetMasklayer;
  [(SLSheetMasklayer *)&v3 removeAllAnimations];
  [(CALayer *)self->_topLayer removeAllAnimations];
  [(CALayer *)self->_leftLayer removeAllAnimations];
  [(CALayer *)self->_bottomLayer removeAllAnimations];
  [(CALayer *)self->_rightLayer removeAllAnimations];
  [(_SLSheetMaskLayer *)self->_sheetMaskLayer removeAllAnimations];
}

- (void)removeSheetCutout
{
  [(_SLSheetMaskLayer *)self->_sheetMaskLayer removeFromSuperlayer];
  [(_SLSheetMaskLayer *)self->_sheetMaskLayer frame];
  -[CALayer setFrame:](self->_solidSheetMaskLayer, "setFrame:");
  solidSheetMaskLayer = self->_solidSheetMaskLayer;

  [(SLSheetMasklayer *)self addSublayer:solidSheetMaskLayer];
}

- (void)restoreSheetCutout
{
  [(CALayer *)self->_solidSheetMaskLayer frame];
  -[_SLSheetMaskLayer setFrame:](self->_sheetMaskLayer, "setFrame:");
  [(CALayer *)self->_solidSheetMaskLayer removeFromSuperlayer];
  sheetMaskLayer = self->_sheetMaskLayer;

  [(SLSheetMasklayer *)self addSublayer:sheetMaskLayer];
}

- (void)animateSheetMaskFromOldSheetFrame:(CGRect)a3 toSheetFrame:(CGRect)a4 duration:(double)a5
{
  v69[5] = *MEMORY[0x1E4F143B8];
  [(SLSheetMasklayer *)self frame];
  -[SLSheetMasklayer updateMaskWithBounds:maskRect:](self, "updateMaskWithBounds:maskRect:");
  v6 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_topLayer position];
  id v7 = objc_msgSend(v6, "valueWithCGPoint:");
  v69[0] = v7;
  v8 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_leftLayer position];
  uint64_t v9 = objc_msgSend(v8, "valueWithCGPoint:");
  v69[1] = v9;
  v10 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_bottomLayer position];
  uint64_t v11 = objc_msgSend(v10, "valueWithCGPoint:");
  v69[2] = v11;
  v12 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_rightLayer position];
  uint64_t v13 = objc_msgSend(v12, "valueWithCGPoint:");
  v69[3] = v13;
  v14 = (void *)MEMORY[0x1E4F29238];
  [(_SLSheetMaskLayer *)self->_sheetMaskLayer position];
  uint64_t v15 = objc_msgSend(v14, "valueWithCGPoint:");
  v69[4] = v15;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:5];

  v16 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_topLayer bounds];
  uint64_t v17 = objc_msgSend(v16, "valueWithCGRect:");
  v68[0] = v17;
  v18 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_leftLayer bounds];
  id v19 = objc_msgSend(v18, "valueWithCGRect:");
  v68[1] = v19;
  v20 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_bottomLayer bounds];
  id v21 = objc_msgSend(v20, "valueWithCGRect:");
  v68[2] = v21;
  v22 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_rightLayer bounds];
  uint64_t v23 = objc_msgSend(v22, "valueWithCGRect:");
  v68[3] = v23;
  id v24 = (void *)MEMORY[0x1E4F29238];
  [(_SLSheetMaskLayer *)self->_sheetMaskLayer bounds];
  id v25 = objc_msgSend(v24, "valueWithCGRect:");
  v68[4] = v25;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:5];

  [(SLSheetMasklayer *)self frame];
  -[SLSheetMasklayer updateMaskWithBounds:maskRect:](self, "updateMaskWithBounds:maskRect:");
  v26 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_topLayer position];
  v27 = objc_msgSend(v26, "valueWithCGPoint:");
  v67[0] = v27;
  v28 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_leftLayer position];
  id v29 = objc_msgSend(v28, "valueWithCGPoint:");
  v67[1] = v29;
  v30 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_bottomLayer position];
  objc_super v31 = objc_msgSend(v30, "valueWithCGPoint:");
  v67[2] = v31;
  v32 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_rightLayer position];
  v33 = objc_msgSend(v32, "valueWithCGPoint:");
  v67[3] = v33;
  v34 = (void *)MEMORY[0x1E4F29238];
  [(_SLSheetMaskLayer *)self->_sheetMaskLayer position];
  v35 = objc_msgSend(v34, "valueWithCGPoint:");
  v67[4] = v35;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:5];

  v36 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_topLayer bounds];
  v37 = objc_msgSend(v36, "valueWithCGRect:");
  v66[0] = v37;
  v38 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_leftLayer bounds];
  v39 = objc_msgSend(v38, "valueWithCGRect:");
  v66[1] = v39;
  v40 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_bottomLayer bounds];
  v41 = objc_msgSend(v40, "valueWithCGRect:");
  v66[2] = v41;
  v42 = (void *)MEMORY[0x1E4F29238];
  [(CALayer *)self->_rightLayer bounds];
  v43 = objc_msgSend(v42, "valueWithCGRect:");
  v66[3] = v43;
  v44 = (void *)MEMORY[0x1E4F29238];
  [(_SLSheetMaskLayer *)self->_sheetMaskLayer bounds];
  v45 = objc_msgSend(v44, "valueWithCGRect:");
  v66[4] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:5];

  UIAnimationDragCoefficient();
  double v48 = v47 * a5;
  leftLayer = self->_leftLayer;
  v65[0] = self->_topLayer;
  v65[1] = leftLayer;
  rightLayer = self->_rightLayer;
  v65[2] = self->_bottomLayer;
  v65[3] = rightLayer;
  v65[4] = self->_sheetMaskLayer;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:5];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __76__SLSheetMasklayer_animateSheetMaskFromOldSheetFrame_toSheetFrame_duration___block_invoke;
  v59[3] = &unk_1E6467A98;
  double v64 = v48;
  id v60 = v58;
  id v61 = v56;
  id v62 = v57;
  id v63 = v46;
  id v52 = v46;
  id v53 = v57;
  id v54 = v56;
  id v55 = v58;
  [v51 enumerateObjectsUsingBlock:v59];
}

void __76__SLSheetMasklayer_animateSheetMaskFromOldSheetFrame_toSheetFrame_duration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x1E4F39B48];
  id v6 = a2;
  id v17 = [v5 animationWithKeyPath:@"position"];
  [v17 setDuration:*(double *)(a1 + 64)];
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v17 setFromValue:v7];

  v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  [v17 setToValue:v8];

  uint64_t v9 = *MEMORY[0x1E4F3A490];
  v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v17 setTimingFunction:v10];

  [v6 addAnimation:v17 forKey:0];
  uint64_t v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  [v11 CGPointValue];
  objc_msgSend(v6, "setPosition:");

  v12 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
  [v12 setDuration:*(double *)(a1 + 64)];
  uint64_t v13 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3];
  [v12 setFromValue:v13];

  v14 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3];
  [v12 setToValue:v14];

  uint64_t v15 = [MEMORY[0x1E4F39C10] functionWithName:v9];
  [v12 setTimingFunction:v15];

  [v6 addAnimation:v12 forKey:0];
  v16 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3];
  [v16 CGRectValue];
  objc_msgSend(v6, "setBounds:");
}

- (void)updateMaskWithBounds:(CGRect)a3 maskRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  if (!CGRectIsNull(a4))
  {
    v21.origin.double x = v11;
    v21.origin.double y = v10;
    v21.size.double width = v9;
    v21.size.double height = v8;
    if (!CGRectEqualToRect(self->_lastBounds, v21)
      || (v22.origin.double x = x,
          v22.origin.double y = y,
          v22.size.double width = width,
          v22.size.double height = height,
          !CGRectEqualToRect(self->_lastMaskRect, v22)))
    {
      self->_lastMaskRect.origin.double x = x;
      self->_lastMaskRect.origin.double y = y;
      self->_lastMaskRect.size.double width = width;
      self->_lastMaskRect.size.double height = height;
      self->_lastBounds.origin.double x = v11;
      self->_lastBounds.origin.double y = v10;
      self->_lastBounds.size.double width = v9;
      self->_lastBounds.size.double height = v8;
      -[SLSheetMasklayer setFrame:](self, "setFrame:", v11, v10, v9, v8);
      -[CALayer setFrame:](self->_leftLayer, "setFrame:", 0.0, 0.0, x, v8);
      v17.origin.double x = x;
      v17.origin.double y = y;
      v17.size.double width = width;
      v17.size.double height = height;
      double MaxX = CGRectGetMaxX(v17);
      v18.origin.double x = x;
      v18.origin.double y = y;
      v18.size.double width = width;
      v18.size.double height = height;
      -[CALayer setFrame:](self->_rightLayer, "setFrame:", MaxX, 0.0, v9 - CGRectGetMaxX(v18), v8);
      -[CALayer setFrame:](self->_topLayer, "setFrame:", x, 0.0, width, y);
      v19.origin.double x = x;
      v19.origin.double y = y;
      v19.size.double width = width;
      v19.size.double height = height;
      double MaxY = CGRectGetMaxY(v19);
      v20.origin.double x = x;
      v20.origin.double y = y;
      v20.size.double width = width;
      v20.size.double height = height;
      -[CALayer setFrame:](self->_bottomLayer, "setFrame:", x, MaxY, width, v8 - CGRectGetMaxY(v20));
      -[_SLSheetMaskLayer setFrame:](self->_sheetMaskLayer, "setFrame:", x, y, width, height);
      sheetMaskLayer = self->_sheetMaskLayer;
      [(_SLSheetMaskLayer *)sheetMaskLayer setNeedsDisplay];
    }
  }
}

- (double)clipCornerRadius
{
  return self->_clipCornerRadius;
}

- (void)setClipCornerRadius:(double)a3
{
  self->_clipCornerRadius = a3;
}

- (UIColor)clipBackgroundColor
{
  return self->_clipBackgroundColor;
}

- (void)setClipBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_solidSheetMaskLayer, 0);
  objc_storeStrong((id *)&self->_sheetMaskLayer, 0);
  objc_storeStrong((id *)&self->_rightLayer, 0);
  objc_storeStrong((id *)&self->_bottomLayer, 0);
  objc_storeStrong((id *)&self->_leftLayer, 0);

  objc_storeStrong((id *)&self->_topLayer, 0);
}

@end