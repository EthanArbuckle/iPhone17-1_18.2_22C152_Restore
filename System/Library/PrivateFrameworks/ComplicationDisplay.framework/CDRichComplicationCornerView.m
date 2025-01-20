@interface CDRichComplicationCornerView
+ (CGSize)viewSizeForDevice:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CDRichComplicationCornerView)init;
- (CDRichComplicationCornerView)initWithFamily:(int64_t)a3;
- (CDRichComplicationCornerView)initWithFontFallback:(int64_t)a3;
- (double)innerComponentRotationInDegree;
- (double)outerComponentRotationInDegree;
- (id)_createAndAddColoringLabelWithFontSize:(double)a3;
- (id)_fontWithSize:(double)a3 fontWeight:(double)a4;
- (id)_fontWithSize:(double)a3 withFontDescriptor:(id)a4;
- (int64_t)cornerComplicationPosition;
- (void)_createHitTestPathIfNecessary;
- (void)_layoutCurvedLabel:(id)a3 centerAngleInDegree:(double)a4 editingRotationInDegree:(double)a5;
- (void)_layoutView:(id)a3 origin:(CGPoint)a4 editingTranslation:(CGPoint)a5 editingRotationInDegree:(double)a6;
- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4;
- (void)_updateColoringLabel:(id)a3 withFontWeight:(double)a4;
- (void)setCornerComplicationPosition:(int64_t)a3;
- (void)setInnerComponentRotationInDegree:(double)a3;
- (void)setOuterComponentRotationInDegree:(double)a3;
@end

@implementation CDRichComplicationCornerView

- (CDRichComplicationCornerView)init
{
  return [(CDRichComplicationCornerView *)self initWithFontFallback:0];
}

- (CDRichComplicationCornerView)initWithFontFallback:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationCornerView;
  result = [(CDRichComplicationView *)&v5 initWithFamily:8];
  if (result) {
    result->_fontFallback = a3;
  }
  return result;
}

- (CDRichComplicationCornerView)initWithFamily:(int64_t)a3
{
  if (a3 == 8)
  {
    self = [(CDRichComplicationCornerView *)self init];
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  [(CDRichComplicationCornerView *)self _createHitTestPathIfNecessary];
  [(CDRichComplicationCornerView *)self bounds];
  v11.double x = x;
  v11.double y = y;
  BOOL v7 = CGRectContainsPoint(v12, v11);
  if (v7)
  {
    hitTestPath = self->_hitTestPath;
    LOBYTE(v7) = -[UIBezierPath containsPoint:](hitTestPath, "containsPoint:", x, y);
  }
  return v7;
}

- (void)_createHitTestPathIfNecessary
{
  if (!self->_hitTestPath
    || ([(CDRichComplicationCornerView *)self bounds], !CGRectEqualToRect(v19, self->_hitTestBounds)))
  {
    [(CDRichComplicationCornerView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    int64_t cornerComplicationPosition = self->_cornerComplicationPosition;
    CGRect v12 = [(CDRichComplicationView *)self device];
    +[CDRichComplicationCornerUtilities hitTestPathWithViewBounds:position:forDevice:](CDRichComplicationCornerUtilities, "hitTestPathWithViewBounds:position:forDevice:", cornerComplicationPosition, v12, v4, v6, v8, v10);
    v13 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    hitTestPath = self->_hitTestPath;
    self->_hitTestPath = v13;

    [(CDRichComplicationCornerView *)self bounds];
    self->_hitTestBounds.origin.double x = v15;
    self->_hitTestBounds.origin.double y = v16;
    self->_hitTestBounds.size.width = v17;
    self->_hitTestBounds.size.height = v18;
  }
}

- (id)_createAndAddColoringLabelWithFontSize:(double)a3
{
  double v5 = objc_opt_new();
  double v6 = [(CDRichComplicationCornerView *)self _fontWithSize:a3 fontWeight:*MEMORY[0x263F81840]];
  [v5 setFont:v6];
  [v5 setUsesLegibility:0];
  [v5 setUppercase:1];
  [v5 setAlpha:1.0];
  double v7 = [MEMORY[0x263F825C8] whiteColor];
  [v5 setColor:v7];

  [v5 setUsesTextProviderTintColoring:1];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__CDRichComplicationCornerView__createAndAddColoringLabelWithFontSize___block_invoke;
  v11[3] = &unk_2644A53C8;
  objc_copyWeak(&v12, &location);
  [v5 setNowProvider:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__CDRichComplicationCornerView__createAndAddColoringLabelWithFontSize___block_invoke_2;
  v9[3] = &unk_2644A53F0;
  objc_copyWeak(&v10, &location);
  [v5 setNeedsResizeHandler:v9];
  [v5 setFilterProvider:self];
  [(CDRichComplicationCornerView *)self addSubview:v5];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v5;
}

id __71__CDRichComplicationCornerView__createAndAddColoringLabelWithFontSize___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = (id)MEMORY[0x263EFD170];
  }
  double v3 = [WeakRetained complicationDate];

  return v3;
}

void __71__CDRichComplicationCornerView__createAndAddColoringLabelWithFontSize___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
  v1 = [WeakRetained displayObserver];
  [v1 complicationDisplayNeedsResize:WeakRetained];
}

- (void)_updateColoringLabel:(id)a3 withFontWeight:(double)a4
{
  id v5 = a3;
  double v6 = [v5 font];
  [v6 pointSize];
  double v7 = -[CDRichComplicationCornerView _fontWithSize:fontWeight:](self, "_fontWithSize:fontWeight:");
  [v5 setFont:v7];

  [(CDRichComplicationCornerView *)self setNeedsLayout];
}

- (id)_fontWithSize:(double)a3 fontWeight:(double)a4
{
  id v5 = [MEMORY[0x263EFD198] systemFontOfSize:*MEMORY[0x263EFCF58] weight:a3 design:a4];
  double v6 = [v5 CLKFontWithAlternativePunctuation];

  if (self->_fontFallback == 1)
  {
    uint64_t v7 = [v6 CLKFontWithLooplessThaiFallback];

    double v6 = (void *)v7;
  }
  return v6;
}

- (id)_fontWithSize:(double)a3 withFontDescriptor:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CDRichComplicationCornerView;
  id v5 = [(CDRichComplicationView *)&v9 _fontWithSize:a4 withFontDescriptor:a3];
  double v6 = v5;
  if (self->_fontFallback == 1)
  {
    uint64_t v7 = [v5 CLKFontWithLooplessThaiFallback];

    double v6 = (void *)v7;
  }
  return v6;
}

- (void)_layoutCurvedLabel:(id)a3 centerAngleInDegree:(double)a4 editingRotationInDegree:(double)a5
{
  id v6 = a3;
  uint64_t v7 = [v6 textProvider];
  if (v7)
  {
  }
  else
  {
    double v8 = [v6 imageView];

    if (!v8) {
      goto LABEL_12;
    }
  }
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v59[0] = *MEMORY[0x263F000D0];
  v59[1] = v9;
  v59[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v6 setTransform:v59];
  [v6 frame];
  objc_msgSend(v6, "sizeThatFits:", v10, v11);
  objc_msgSend(v6, "setFrame:");
  long long v58 = *MEMORY[0x263F00148];
  [v6 getTextCenter:&v58 startAngle:0 endAngle:0];
  id v12 = [(CDRichComplicationView *)self device];
  [v12 screenBounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v60.origin.double x = v14;
  v60.origin.double y = v16;
  v60.size.width = v18;
  v60.size.height = v20;
  double MidX = CGRectGetMidX(v60);
  v61.origin.double x = v14;
  v61.origin.double y = v16;
  v61.size.width = v18;
  v61.size.height = v20;
  double MidY = CGRectGetMidY(v61);
  v22 = [(CDRichComplicationView *)self device];
  double v50 = CDCornerComplicationSize(v22);
  double v52 = v23;

  double v24 = 0.0;
  double v25 = 0.0;
  double v26 = 0.0;
  CGFloat v27 = 0.0;
  switch(self->_cornerComplicationPosition)
  {
    case 0:
      long long v28 = v58;
      double v29 = MidX - *(double *)&v58;
      double v26 = MidY - *((double *)&v58 + 1);
      [v6 frame];
      double v25 = *(double *)&v28 - v30 * 0.5;
      double v31 = *((double *)&v58 + 1);
      [v6 frame];
      double v24 = v31 - v32 * 0.5;
      goto LABEL_10;
    case 1:
      double v44 = MidX - *(double *)&v58;
      v65.origin.double x = v14;
      v65.origin.double y = v16;
      v65.size.width = v18;
      v65.size.height = v20;
      double v29 = v44 - (CGRectGetWidth(v65) - v50);
      long long v45 = v58;
      double v26 = MidY - *((double *)&v58 + 1);
      [v6 frame];
      double v25 = *(double *)&v45 - v46 * 0.5;
      double v47 = *((double *)&v58 + 1);
      [v6 frame];
      double v24 = v47 - v48 * 0.5;
LABEL_10:
      CGFloat v27 = v29;
      break;
    case 2:
      double v51 = MidX - *(double *)&v58;
      double v33 = MidY - *((double *)&v58 + 1);
      v62.origin.double x = v14;
      v62.origin.double y = v16;
      v62.size.width = v18;
      v62.size.height = v20;
      double v26 = v33 - (CGRectGetHeight(v62) - v52);
      double v34 = *(double *)&v58;
      [v6 frame];
      double v25 = v34 - v35 * 0.5;
      double v36 = *((double *)&v58 + 1);
      [v6 frame];
      double v24 = v36 - v37 * 0.5;
      goto LABEL_8;
    case 3:
      double v38 = MidX - *(double *)&v58;
      v63.origin.double x = v14;
      v63.origin.double y = v16;
      v63.size.width = v18;
      v63.size.height = v20;
      double v51 = v38 - (CGRectGetWidth(v63) - v50);
      double v39 = MidY - *((double *)&v58 + 1);
      v64.origin.double x = v14;
      v64.origin.double y = v16;
      v64.size.width = v18;
      v64.size.height = v20;
      double v26 = v39 - (CGRectGetHeight(v64) - v52);
      double v40 = *(double *)&v58;
      [v6 frame];
      double v25 = v40 - v41 * 0.5;
      double v42 = *((double *)&v58 + 1);
      [v6 frame];
      double v24 = v42 - v43 * 0.5;
LABEL_8:
      CGFloat v27 = v51;
      break;
    default:
      break;
  }
  memset(&v57, 0, sizeof(v57));
  CGAffineTransformMakeTranslation(&v57, v27, v26);
  CGAffineTransform v55 = v57;
  CGAffineTransformTranslate(&v56, &v55, v25, v24);
  CGAffineTransform v57 = v56;
  CLKDegreesToRadians();
  CGAffineTransform v55 = v57;
  CGAffineTransformRotate(&v56, &v55, v49);
  CGAffineTransform v57 = v56;
  CGAffineTransform v55 = v56;
  CGAffineTransformTranslate(&v56, &v55, -v25, -v24);
  CGAffineTransform v57 = v56;
  CGAffineTransform v54 = v56;
  [v6 setTransform:&v54];
LABEL_12:
}

- (void)_layoutView:(id)a3 origin:(CGPoint)a4 editingTranslation:(CGPoint)a5 editingRotationInDegree:(double)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double v8 = a5.y;
  double v9 = a5.x;
  switch(self->_cornerComplicationPosition)
  {
    case 0:
      break;
    case 1:
      double v9 = -a5.x;
      break;
    case 2:
      goto LABEL_5;
    case 3:
      double v9 = -a5.x;
LABEL_5:
      double v8 = -a5.y;
      break;
    default:
      double v9 = *MEMORY[0x263F00148];
      double v8 = *(double *)(MEMORY[0x263F00148] + 8);
      break;
  }
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v17.c = v10;
  *(_OWORD *)&v17.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v16.a = *(_OWORD *)&v17.a;
  *(_OWORD *)&v16.c = v10;
  *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)&v17.tx;
  id v11 = a3;
  CGAffineTransformTranslate(&v17, &v16, x, y);
  CGAffineTransform v15 = v17;
  CGAffineTransformTranslate(&v16, &v15, v9, v8);
  CGAffineTransform v17 = v16;
  CLKDegreesToRadians();
  CGAffineTransform v15 = v17;
  CGAffineTransformRotate(&v16, &v15, v12);
  CGAffineTransform v17 = v16;
  CGAffineTransform v15 = v16;
  CGAffineTransformTranslate(&v16, &v15, -v9, -v8);
  CGAffineTransform v17 = v16;
  CLKDegreesToRadians();
  CGAffineTransform v15 = v17;
  CGAffineTransformRotate(&v16, &v15, -v13);
  CGAffineTransform v17 = v16;
  CGAffineTransform v14 = v16;
  [v11 setTransform:&v14];
}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  CLKInterpolateBetweenFloatsClipped();
  CGAffineTransformMakeScale(&v7, v5, v5);
  CGAffineTransform v6 = v7;
  [(CDRichComplicationCornerView *)self setTransform:&v6];
}

+ (CGSize)viewSizeForDevice:(id)a3
{
  double v3 = CDCornerComplicationSize(a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)cornerComplicationPosition
{
  return self->_cornerComplicationPosition;
}

- (void)setCornerComplicationPosition:(int64_t)a3
{
  self->_int64_t cornerComplicationPosition = a3;
}

- (double)innerComponentRotationInDegree
{
  return self->_innerComponentRotationInDegree;
}

- (void)setInnerComponentRotationInDegree:(double)a3
{
  self->_innerComponentRotationInDegree = a3;
}

- (double)outerComponentRotationInDegree
{
  return self->_outerComponentRotationInDegree;
}

- (void)setOuterComponentRotationInDegree:(double)a3
{
  self->_outerComponentRotationInDegree = a3;
}

- (void).cxx_destruct
{
}

@end