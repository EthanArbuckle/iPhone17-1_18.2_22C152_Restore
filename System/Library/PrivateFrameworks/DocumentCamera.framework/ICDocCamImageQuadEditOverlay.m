@interface ICDocCamImageQuadEditOverlay
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)containsPointOutsideOfOverlayBounds;
- (BOOL)isDisplayingValidQuad;
- (BOOL)isDraggingKnob;
- (BOOL)isQuadValid;
- (BOOL)isTempOverlay;
- (BOOL)tempOverlayQuadIsValid;
- (CALayer)knobLayer;
- (CALayer)loupeContentsLayer;
- (CALayer)loupeLayer;
- (CALayer)selectedKnob;
- (CAShapeLayer)outlineLayer;
- (CGPoint)lastGestureTranslation;
- (CGRect)rectFromApplyingOrientation:(int64_t)a3 toContentsRect:(CGRect)a4;
- (ICDocCamImageQuad)adjustedQuad;
- (ICDocCamImageQuad)quad;
- (ICDocCamImageQuadEditOverlay)initWithCoder:(id)a3;
- (ICDocCamImageQuadEditOverlay)initWithFrame:(CGRect)a3;
- (ICDocCamImageQuadEditOverlayDelegate)delegate;
- (ICDocCamImageQuadEditPanGestureRecognizer)panGR;
- (NSArray)knobAccessibilityElements;
- (NSArray)knobs;
- (NSMutableArray)panHistory;
- (UIBezierPath)outlinePath;
- (UIColor)invalidRectColor;
- (UIColor)knobColor;
- (UIColor)validRectColor;
- (UIImage)image;
- (double)knobHeight;
- (double)tempOverlayMagnification;
- (id)closestKnobToPoint:(CGPoint)a3;
- (int64_t)orientation;
- (unint64_t)panHistoryIdx;
- (void)commonInit;
- (void)didPan:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 orientation:(int64_t)a4;
- (void)setIsDisplayingValidQuad:(BOOL)a3;
- (void)setIsTempOverlay:(BOOL)a3;
- (void)setKnobAccessibilityElements:(id)a3;
- (void)setKnobColor:(id)a3;
- (void)setKnobHeight:(double)a3;
- (void)setKnobLayer:(id)a3;
- (void)setKnobs:(id)a3;
- (void)setLastGestureTranslation:(CGPoint)a3;
- (void)setLoupeContentsLayer:(id)a3;
- (void)setLoupeLayer:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOutlineLayer:(id)a3;
- (void)setPanGR:(id)a3;
- (void)setPanHistory:(id)a3;
- (void)setPanHistoryIdx:(unint64_t)a3;
- (void)setQuad:(id)a3;
- (void)setSelectedKnob:(id)a3;
- (void)setTempOverlayMagnification:(double)a3;
- (void)setTempOverlayMagnification:(double)a3 animationDuration:(double)a4;
- (void)setTempOverlayQuadIsValid:(BOOL)a3;
- (void)setUpKnobs;
- (void)setupLoupeLayerIfNeeded;
- (void)unselectAllKnobs;
- (void)updateKnobLocationsToRect:(id)a3;
- (void)updateOutlineAndKnobColorForCurrentValidityIfNecessary;
- (void)updateOutlineAndKnobColorForIsValid:(BOOL)a3;
- (void)updateOutlineLayer;
- (void)updateSelectedKnobContents;
@end

@implementation ICDocCamImageQuadEditOverlay

- (ICDocCamImageQuadEditOverlay)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamImageQuadEditOverlay;
  v3 = [(ICDocCamImageQuadEditOverlay *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICDocCamImageQuadEditOverlay *)v3 commonInit];
  }
  return v4;
}

- (ICDocCamImageQuadEditOverlay)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamImageQuadEditOverlay;
  v3 = -[ICDocCamImageQuadEditOverlay initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ICDocCamImageQuadEditOverlay *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = [MEMORY[0x263F1C550] whiteColor];
  validRectColor = self->_validRectColor;
  self->_validRectColor = v3;

  v5 = [MEMORY[0x263F1C550] whiteColor];
  invalidRectColor = self->_invalidRectColor;
  self->_invalidRectColor = v5;

  self->_knobHeight = 20.0;
  v7 = [MEMORY[0x263F1C550] whiteColor];
  knobColor = self->_knobColor;
  self->_knobColor = v7;

  [(ICDocCamImageQuadEditOverlay *)self setUpKnobs];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)ICDocCamImageQuadEditOverlay;
  [(ICDocCamImageQuadEditOverlay *)&v16 layoutSubviews];
  v3 = [(ICDocCamImageQuadEditOverlay *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(ICDocCamImageQuadEditOverlay *)self knobLayer];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(ICDocCamImageQuadEditOverlay *)self delegate];
  v14 = [v13 quadForOverlay:self];

  [(ICDocCamImageQuadEditOverlay *)self updateKnobLocationsToRect:v14];
  [(ICDocCamImageQuadEditOverlay *)self updateOutlineLayer];
  [(ICDocCamImageQuadEditOverlay *)self updateOutlineAndKnobColorForCurrentValidityIfNecessary];
  v15 = [(ICDocCamImageQuadEditOverlay *)self delegate];
  [v15 overlayDidLayout:self];
}

- (void)setUpKnobs
{
  id v3 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(ICDocCamImageQuadEditOverlay *)self setKnobLayer:v3];

  double v4 = [(ICDocCamImageQuadEditOverlay *)self layer];
  double v5 = [(ICDocCamImageQuadEditOverlay *)self knobLayer];
  [v4 addSublayer:v5];

  id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = 4;
  do
  {
    id v8 = objc_alloc_init(MEMORY[0x263F157E8]);
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, 20.0, 20.0);
    [v8 frame];
    [v8 setCornerRadius:v9 * 0.5];
    id v10 = [MEMORY[0x263F1C550] whiteColor];
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    [v8 setBorderWidth:1.0];
    [v8 setMasksToBounds:1];
    [v23 addObject:v8];
    double v11 = [(ICDocCamImageQuadEditOverlay *)self knobLayer];
    [v11 addSublayer:v8];

    v12 = [[ICDocCamImageQuadEditKnobAccessibilityElement alloc] initWithKnobLayer:v8 overlayView:self];
    [v6 addObject:v12];

    --v7;
  }
  while (v7);
  [(ICDocCamImageQuadEditOverlay *)self setKnobs:v23];
  [(ICDocCamImageQuadEditOverlay *)self setKnobAccessibilityElements:v6];
  id v13 = objc_alloc_init(MEMORY[0x263F15880]);
  [(ICDocCamImageQuadEditOverlay *)self setOutlineLayer:v13];

  id v14 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v15 = [v14 CGColor];
  objc_super v16 = [(ICDocCamImageQuadEditOverlay *)self outlineLayer];
  [v16 setStrokeColor:v15];

  v17 = [(ICDocCamImageQuadEditOverlay *)self outlineLayer];
  [v17 setFillColor:0];

  v18 = [(ICDocCamImageQuadEditOverlay *)self outlineLayer];
  [v18 setLineWidth:1.0];

  v19 = [(ICDocCamImageQuadEditOverlay *)self layer];
  v20 = [(ICDocCamImageQuadEditOverlay *)self outlineLayer];
  [v19 addSublayer:v20];

  v21 = [[ICDocCamImageQuadEditPanGestureRecognizer alloc] initWithTarget:self action:sel_didPan_];
  [(ICDocCamImageQuadEditPanGestureRecognizer *)v21 setDelaysTouchesBegan:0];
  [(ICDocCamImageQuadEditPanGestureRecognizer *)v21 setMaximumNumberOfTouches:1];
  [(ICDocCamImageQuadEditOverlay *)self addGestureRecognizer:v21];
  [(ICDocCamImageQuadEditOverlay *)self setPanGR:v21];
  v22 = [(ICDocCamImageQuadEditOverlay *)self panGR];
  [v22 setQuadEditorDelegate:self];

  [(ICDocCamImageQuadEditOverlay *)self updateOutlineAndKnobColorForIsValid:[(ICDocCamImageQuadEditOverlay *)self isDisplayingValidQuad]];
}

- (void)setTempOverlayQuadIsValid:(BOOL)a3
{
  self->_tempOverlayQuadIsValid = a3;
  [(ICDocCamImageQuadEditOverlay *)self updateOutlineAndKnobColorForCurrentValidityIfNecessary];
}

- (void)updateOutlineAndKnobColorForCurrentValidityIfNecessary
{
  BOOL v3 = [(ICDocCamImageQuadEditOverlay *)self isDisplayingValidQuad];
  if ([(ICDocCamImageQuadEditOverlay *)self isTempOverlay]) {
    BOOL v4 = [(ICDocCamImageQuadEditOverlay *)self tempOverlayQuadIsValid];
  }
  else {
    BOOL v4 = [(ICDocCamImageQuadEditOverlay *)self isQuadValid];
  }
  if (v3 != v4)
  {
    [(ICDocCamImageQuadEditOverlay *)self updateOutlineAndKnobColorForIsValid:v4];
  }
}

- (void)updateOutlineAndKnobColorForIsValid:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  -[ICDocCamImageQuadEditOverlay setIsDisplayingValidQuad:](self, "setIsDisplayingValidQuad:");
  if (a3) {
    [(ICDocCamImageQuadEditOverlay *)self validRectColor];
  }
  else {
  double v5 = [(ICDocCamImageQuadEditOverlay *)self invalidRectColor];
  }
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v6 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "setBorderColor:", objc_msgSend(v5, "CGColor"));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v11 = v5;
  uint64_t v12 = [v11 CGColor];
  id v13 = [(ICDocCamImageQuadEditOverlay *)self outlineLayer];
  [v13 setStrokeColor:v12];

  [MEMORY[0x263F158F8] commit];
}

- (void)setTempOverlayMagnification:(double)a3 animationDuration:(double)a4
{
  double v6 = self;
  uint64_t v40 = *MEMORY[0x263EF8340];
  self->_tempOverlayMagnification = a3;
  if (![(ICDocCamImageQuadEditOverlay *)self isTempOverlay])
  {
    uint64_t v7 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamImageQuadEditOverlay setTempOverlayMagnification:animationDuration:](v7);
    }
  }
  if ([(ICDocCamImageQuadEditOverlay *)v6 isTempOverlay])
  {
    unint64_t v8 = 0x263F15000uLL;
    if (a4 <= 0.0)
    {
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v9 = [(ICDocCamImageQuadEditOverlay *)v6 knobs];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v30 = v6;
      uint64_t v12 = *(void *)v36;
      uint64_t v13 = *MEMORY[0x263F15AA8];
      double v14 = 1.0 / a3;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          memset(&v34, 0, sizeof(v34));
          if (v16) {
            [v16 transform];
          }
          memset(&v33, 0, sizeof(v33));
          CATransform3DMakeScale(&v33, v14, v14, 1.0);
          CATransform3D v32 = v33;
          [v16 setTransform:&v32];
          if (a4 > 0.0)
          {
            long long v17 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
            [v17 setDuration:a4];
            CATransform3D v31 = v34;
            v18 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v31];
            [v17 setFromValue:v18];

            CATransform3D v31 = v33;
            uint64_t v19 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v31];
            [v17 setToValue:v19];

            [v17 setFillMode:v13];
            [v16 addAnimation:v17 forKey:0];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v11);
      double v6 = v30;
      unint64_t v8 = 0x263F15000;
    }
    else
    {
      double v14 = 1.0 / a3;
    }

    v20 = [(ICDocCamImageQuadEditOverlay *)v6 outlineLayer];
    [v20 lineWidth];
    double v22 = v21;

    if (a4 <= 0.0)
    {
      v29 = [(ICDocCamImageQuadEditOverlay *)v6 outlineLayer];
      [v29 setLineWidth:v14];

      [*(id *)(v8 + 2296) commit];
    }
    else
    {
      id v23 = [MEMORY[0x263F15760] animationWithKeyPath:@"lineWidth"];
      [v23 setDuration:a4];
      v24 = [NSNumber numberWithDouble:v14];
      [v23 setToValue:v24];

      v25 = [NSNumber numberWithDouble:v22];
      [v23 setFromValue:v25];

      v26 = [(ICDocCamImageQuadEditOverlay *)v6 outlineLayer];
      [v26 removeAllAnimations];

      v27 = [(ICDocCamImageQuadEditOverlay *)v6 outlineLayer];
      [v27 addAnimation:v23 forKey:0];

      v28 = [(ICDocCamImageQuadEditOverlay *)v6 outlineLayer];
      [v28 setLineWidth:v14];
    }
  }
}

- (void)setImage:(id)a3 orientation:(int64_t)a4
{
  id v7 = a3;
  if (*(_OWORD *)&self->_image != __PAIR128__(a4, (unint64_t)v7))
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_image, a3);
    self->_orientation = a4;
    [(ICDocCamImageQuadEditOverlay *)self setupLoupeLayerIfNeeded];
    id v7 = v8;
  }
}

- (void)setupLoupeLayerIfNeeded
{
  BOOL v3 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
  if (!v3)
  {
    BOOL v4 = [(ICDocCamImageQuadEditOverlay *)self image];

    if (!v4) {
      return;
    }
    id v5 = objc_alloc_init(MEMORY[0x263F157E8]);
    [(ICDocCamImageQuadEditOverlay *)self setLoupeLayer:v5];

    double v6 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
    objc_msgSend(v6, "setFrame:", 0.0, 0.0, 20.0, 20.0);

    id v7 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v8 = [v7 CGColor];
    uint64_t v9 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
    [v9 setBackgroundColor:v8];

    id v10 = objc_alloc_init(MEMORY[0x263F157E8]);
    [(ICDocCamImageQuadEditOverlay *)self setLoupeContentsLayer:v10];

    id v11 = [(ICDocCamImageQuadEditOverlay *)self image];
    uint64_t v12 = [v11 CGImage];
    uint64_t v13 = [(ICDocCamImageQuadEditOverlay *)self loupeContentsLayer];
    [v13 setContents:v12];

    double v14 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    id v23 = [(ICDocCamImageQuadEditOverlay *)self loupeContentsLayer];
    objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

    v24 = [(ICDocCamImageQuadEditOverlay *)self loupeContentsLayer];
    [v24 setMasksToBounds:1];

    id v26 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
    v25 = [(ICDocCamImageQuadEditOverlay *)self loupeContentsLayer];
    [v26 addSublayer:v25];

    BOOL v3 = v26;
  }
}

- (BOOL)containsPointOutsideOfOverlayBounds
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v3 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) position];
        double v9 = v8;
        double v11 = v10;
        [(ICDocCamImageQuadEditOverlay *)self bounds];
        if (!DCTSDPointInRectInclusive(v9, v11, v12, v13, v14, v15))
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

- (BOOL)isQuadValid
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICDocCamImageQuadEditOverlay *)self delegate];
  [v3 imageFrameInOverlayCoordinates];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v12 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * i) position];
        v14 += DCTSDPointInRectInclusive(v17, v18, v5, v7, v9, v11);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
    LODWORD(v13) = v14 == 4;
  }

  long long v19 = [(ICDocCamImageQuadEditOverlay *)self adjustedQuad];
  long long v20 = v19;
  if (v13 && [v19 isConvex]) {
    int v21 = [v20 containsAngleOutOfValidThreshold] ^ 1;
  }
  else {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (BOOL)isDraggingKnob
{
  v2 = [(ICDocCamImageQuadEditOverlay *)self panGR];
  uint64_t v3 = [v2 state];

  return ((v3 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (ICDocCamImageQuad)adjustedQuad
{
  uint64_t v3 = objc_alloc_init(ICDocCamImageQuad);
  double v4 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  double v5 = [v4 objectAtIndexedSubscript:0];
  [v5 position];
  -[ICDocCamImageQuad setTopLeft:](v3, "setTopLeft:");

  double v6 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  double v7 = [v6 objectAtIndexedSubscript:1];
  [v7 position];
  -[ICDocCamImageQuad setTopRight:](v3, "setTopRight:");

  double v8 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  double v9 = [v8 objectAtIndexedSubscript:2];
  [v9 position];
  -[ICDocCamImageQuad setBottomRight:](v3, "setBottomRight:");

  double v10 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  double v11 = [v10 objectAtIndexedSubscript:3];
  [v11 position];
  -[ICDocCamImageQuad setBottomLeft:](v3, "setBottomLeft:");

  return v3;
}

- (void)updateKnobLocationsToRect:(id)a3
{
  id v4 = a3;
  [v4 topLeft];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  double v10 = [v9 objectAtIndexedSubscript:0];
  objc_msgSend(v10, "setPosition:", v6, v8);

  [v4 topRight];
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  BOOL v16 = [v15 objectAtIndexedSubscript:1];
  objc_msgSend(v16, "setPosition:", v12, v14);

  [v4 bottomRight];
  double v18 = v17;
  double v20 = v19;
  int v21 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  double v22 = [v21 objectAtIndexedSubscript:2];
  objc_msgSend(v22, "setPosition:", v18, v20);

  [v4 bottomLeft];
  double v24 = v23;
  double v26 = v25;

  id v28 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  v27 = [v28 objectAtIndexedSubscript:3];
  objc_msgSend(v27, "setPosition:", v24, v26);
}

- (void)didPan:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 state];
  if (v9 == 1)
  {
    double v10 = -[ICDocCamImageQuadEditOverlay closestKnobToPoint:](self, "closestKnobToPoint:", v6, v8);
    [(ICDocCamImageQuadEditOverlay *)self setSelectedKnob:v10];

    [(ICDocCamImageQuadEditOverlay *)self updateSelectedKnobContents];
    double v11 = *MEMORY[0x263F00148];
    double v12 = *(double *)(MEMORY[0x263F00148] + 8);
    objc_msgSend(v4, "setTranslation:inView:", self, *MEMORY[0x263F00148], v12);
    double v13 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
    [(ICDocCamImageQuadEditOverlay *)self setPanHistory:v13];

    [(ICDocCamImageQuadEditOverlay *)self setPanHistoryIdx:0];
  }
  else
  {
    double v11 = *MEMORY[0x263F00148];
    double v12 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  double v14 = v12;
  double v15 = v11;
  [(ICDocCamImageQuadEditOverlay *)self lastGestureTranslation];
  double v17 = v16;
  double v19 = v18;
  [v4 translationInView:self];
  double v21 = v20;
  double v23 = v22;
  objc_msgSend(v4, "setTranslation:inView:", self, v11, v12);
  -[ICDocCamImageQuadEditOverlay setLastGestureTranslation:](self, "setLastGestureTranslation:", v21, v23);
  if (v9 == 3)
  {
    double v62 = v19;
    double v26 = CACurrentMediaTime();
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v27 = [(ICDocCamImageQuadEditOverlay *)self panHistory];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v66 objects:v70 count:16];
    double v29 = v12;
    double v30 = v11;
    if (v28)
    {
      uint64_t v31 = v28;
      uint64_t v32 = *(void *)v67;
      double v29 = v12;
      double v30 = v11;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v67 != v32) {
            objc_enumerationMutation(v27);
          }
          CATransform3D v34 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          double v63 = 0.0;
          double v64 = 0.0;
          double v65 = 0.0;
          objc_msgSend(v34, "getValue:", &v63, *(void *)&v62);
          if (v26 - v63 <= 0.1)
          {
            double v30 = DCTSDSubtractPoints(v30, v29, v64);
            double v29 = v35;
          }
        }
        uint64_t v31 = [v27 countByEnumeratingWithState:&v66 objects:v70 count:16];
      }
      while (v31);
      double v11 = v30;
      double v12 = v29;
    }

    double v36 = DCTSDPointLength(v11, v12);
    if (v36 <= 20.0) {
      double v23 = v29;
    }
    else {
      double v23 = v14;
    }
    if (v36 <= 20.0) {
      double v21 = v30;
    }
    else {
      double v21 = v15;
    }
    double v19 = v62;
  }
  else
  {
    double v64 = v21;
    double v65 = v23;
    double v63 = CACurrentMediaTime();
    double v24 = [MEMORY[0x263F08D40] valueWithBytes:&v63 objCType:"{?=d{CGPoint=dd}}"];
    double v25 = [(ICDocCamImageQuadEditOverlay *)self panHistory];
    objc_msgSend(v25, "setObject:atIndexedSubscript:", v24, -[ICDocCamImageQuadEditOverlay panHistoryIdx](self, "panHistoryIdx"));

    [(ICDocCamImageQuadEditOverlay *)self setPanHistoryIdx:([(ICDocCamImageQuadEditOverlay *)self panHistoryIdx] + 1) % 0xA];
  }
  BOOL v37 = v15 == v17;
  if (v14 != v19) {
    BOOL v37 = 0;
  }
  if (v9 != 2) {
    BOOL v37 = 1;
  }
  if (v9 == 3 || !v37)
  {
    long long v38 = [(ICDocCamImageQuadEditOverlay *)self selectedKnob];
    [v38 position];
    double v40 = v39;
    double v42 = v41;

    v43 = [(ICDocCamImageQuadEditOverlay *)self selectedKnob];
    [v43 position];
    double v45 = DCTSDAddPoints(v21, v23, v44);
    double v47 = v46;

    v48 = [(ICDocCamImageQuadEditOverlay *)self knobLayer];
    [v48 bounds];
    double v53 = DCTSDClampPointInRect(v45, v47, v49, v50, v51, v52);
    double v55 = v54;

    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    v56 = [(ICDocCamImageQuadEditOverlay *)self selectedKnob];
    objc_msgSend(v56, "setPosition:", v53, v55);

    v57 = [(ICDocCamImageQuadEditOverlay *)self adjustedQuad];
    v58 = [(ICDocCamImageQuadEditOverlay *)self delegate];
    [v58 imageFrameInOverlayCoordinates];
    objc_msgSend(v57, "setBoundingBox:");

    if (([v57 isValid] & 1) == 0)
    {
      v59 = [(ICDocCamImageQuadEditOverlay *)self selectedKnob];
      objc_msgSend(v59, "setPosition:", v40, v42);
    }
    [(ICDocCamImageQuadEditOverlay *)self updateOutlineLayer];
    [MEMORY[0x263F158F8] commit];
    [(ICDocCamImageQuadEditOverlay *)self updateSelectedKnobContents];

    if (v9 == 3)
    {
      [(ICDocCamImageQuadEditOverlay *)self setSelectedKnob:0];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    }
  }
  v60 = [(ICDocCamImageQuadEditOverlay *)self delegate];
  v61 = [(ICDocCamImageQuadEditOverlay *)self selectedKnob];
  [v61 frame];
  objc_msgSend(v60, "selectedKnobDidPanToRect:");

  [(ICDocCamImageQuadEditOverlay *)self updateOutlineAndKnobColorForCurrentValidityIfNecessary];
}

- (id)closestKnobToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v26 = *MEMORY[0x263EF8340];
  double v6 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  double v7 = [v6 firstObject];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v8 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    double v12 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v14 position];
        double v17 = DCTSDDistance(v15, v16, x, y);
        if (v17 < v12)
        {
          double v18 = v17;
          id v19 = v14;

          double v7 = v19;
          double v12 = v18;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)unselectAllKnobs
{
}

- (void)setSelectedKnob:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  double v5 = (CALayer *)a3;
  p_selectedKnob = &self->_selectedKnob;
  if (self->_selectedKnob != v5)
  {
    objc_storeStrong((id *)&self->_selectedKnob, a3);
    if (*p_selectedKnob)
    {
      double v7 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
      double v8 = [v7 superlayer];
      uint64_t v9 = *p_selectedKnob;

      if (v8 != v9)
      {
        [MEMORY[0x263F158F8] begin];
        [MEMORY[0x263F158F8] setDisableActions:1];
        uint64_t v10 = *p_selectedKnob;
        long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
        v41[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
        v41[5] = v11;
        long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
        v41[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
        v41[7] = v12;
        long long v13 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
        v41[0] = *MEMORY[0x263F15740];
        v41[1] = v13;
        long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
        v41[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
        v41[3] = v14;
        [(CALayer *)v10 setSublayerTransform:v41];
        double v15 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
        [v15 setHidden:0];

        double v16 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
        [v16 setOpacity:0.0];

        double v17 = *p_selectedKnob;
        double v18 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
        [(CALayer *)v17 addSublayer:v18];

        [MEMORY[0x263F158F8] commit];
      }
    }
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setAnimationDuration:0.15];
    id v19 = (void *)MEMORY[0x263F158F8];
    double v20 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
    [v19 setAnimationTimingFunction:v20];

    long long v21 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
    LODWORD(v22) = 1.0;
    [v21 setOpacity:v22];

    if (!*p_selectedKnob)
    {
      long long v23 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
      long long v24 = [v23 superlayer];

      if (v24)
      {
        double v25 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
        [v25 setOpacity:0.0];

        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __48__ICDocCamImageQuadEditOverlay_setSelectedKnob___block_invoke;
        v40[3] = &unk_2642A9250;
        v40[4] = self;
        [MEMORY[0x263F158F8] setCompletionBlock:v40];
      }
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v26 = [(ICDocCamImageQuadEditOverlay *)self knobs];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v37;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(CALayer **)(*((void *)&v36 + 1) + 8 * v30);
          if (v31 == v5) {
            double v32 = 4.0;
          }
          else {
            double v32 = 1.0;
          }
          CATransform3DMakeScale(&v35, v32, v32, 1.0);
          CATransform3D v34 = v35;
          [(CALayer *)v31 setTransform:&v34];
          [(CALayer *)v31 setBorderWidth:1.0 / v32];
          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v28);
    }

    [MEMORY[0x263F158F8] commit];
    CATransform3D v33 = [(ICDocCamImageQuadEditOverlay *)self delegate];
    [v33 selectedKnobDidChange:*p_selectedKnob];
  }
}

void __48__ICDocCamImageQuadEditOverlay_setSelectedKnob___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[62])
  {
    uint64_t v3 = [v2 loupeLayer];
    id v4 = [v3 superlayer];

    if (v4)
    {
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      double v5 = [*(id *)(a1 + 32) loupeLayer];
      [v5 setHidden:1];

      double v6 = [*(id *)(a1 + 32) loupeLayer];
      [v6 removeFromSuperlayer];

      double v7 = (void *)MEMORY[0x263F158F8];
      [v7 commit];
    }
  }
}

- (void)updateSelectedKnobContents
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(ICDocCamImageQuadEditOverlay *)self setupLoupeLayerIfNeeded];
  uint64_t v3 = [(ICDocCamImageQuadEditOverlay *)self loupeContentsLayer];
  [v3 bounds];
  double v51 = v4;
  double v52 = v5;

  [(CALayer *)self->_selectedKnob position];
  double v7 = v6 + -10.0;
  [(CALayer *)self->_selectedKnob position];
  double v9 = v8 + -10.0;
  uint64_t v10 = [(ICDocCamImageQuadEditOverlay *)self delegate];
  objc_msgSend(v10, "unitImageRectForOverlayRect:", v7, v9, 20.0, 20.0);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  v58.origin.double x = v12;
  v58.origin.double y = v14;
  v58.size.width = v16;
  v58.size.height = v18;
  double MinX = CGRectGetMinX(v58);
  v59.origin.double x = v12;
  v59.origin.double y = v14;
  v59.size.width = v16;
  v59.size.height = v18;
  double MinY = CGRectGetMinY(v59);
  v60.origin.double x = v12;
  v60.origin.double y = v14;
  v60.size.width = v16;
  v60.size.height = v18;
  double MaxX = CGRectGetMaxX(v60);
  v61.origin.double x = v12;
  v61.origin.double y = v14;
  v61.size.width = v16;
  v61.size.height = v18;
  double MaxY = CGRectGetMaxY(v61);
  long long v21 = [(ICDocCamImageQuadEditOverlay *)self loupeLayer];
  [v21 bounds];
  double v23 = v22;
  double v25 = v24;
  double v53 = v27;
  double v54 = v26;

  double v28 = v12 - (MaxX + -1.0);
  double v29 = v23 - v51 * ((MaxX + -1.0) / v16);
  if (MaxX <= 1.0)
  {
    double v28 = v12;
    double v29 = v23;
  }
  if (MinX < 0.0) {
    double v30 = v12 + 0.0 - MinX;
  }
  else {
    double v30 = v28;
  }
  if (MinX < 0.0) {
    double v31 = v51 * ((0.0 - MinX) / v16) + v23;
  }
  else {
    double v31 = v29;
  }
  double v32 = v14 - (MaxY + -1.0);
  double v33 = v25 - v52 * ((MaxY + -1.0) / v18);
  if (MaxY <= 1.0)
  {
    double v32 = v14;
    double v33 = v25;
  }
  double v34 = v52 * ((0.0 - MinY) / v18) + v25;
  if (MinY < 0.0) {
    double v35 = v14 + 0.0 - MinY;
  }
  else {
    double v35 = v32;
  }
  if (MinY < 0.0) {
    double v36 = v34;
  }
  else {
    double v36 = v33;
  }
  uint64_t matched = dc_clockwiseRotationsFromUpToMatchOrientation([(ICDocCamImageQuadEditOverlay *)self orientation]);
  memset(&v57, 0, sizeof(v57));
  CGAffineTransformMakeRotation(&v57, (double)(unint64_t)matched * 1.57079633);
  CGAffineTransform v56 = v57;
  long long v38 = [(ICDocCamImageQuadEditOverlay *)self loupeContentsLayer];
  CGAffineTransform v55 = v56;
  [v38 setAffineTransform:&v55];

  -[ICDocCamImageQuadEditOverlay rectFromApplyingOrientation:toContentsRect:](self, "rectFromApplyingOrientation:toContentsRect:", [(ICDocCamImageQuadEditOverlay *)self orientation], v30, v35, v16, v18);
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v47 = [(ICDocCamImageQuadEditOverlay *)self loupeContentsLayer];
  objc_msgSend(v47, "setContentsRect:", v40, v42, v44, v46);

  v48 = [(ICDocCamImageQuadEditOverlay *)self loupeContentsLayer];
  objc_msgSend(v48, "setFrame:", v31, v36, v54, v53);

  [MEMORY[0x263F158F8] commit];
}

- (void)updateOutlineLayer
{
  id v5 = [(ICDocCamImageQuadEditOverlay *)self outlinePath];
  uint64_t v3 = [v5 CGPath];
  double v4 = [(ICDocCamImageQuadEditOverlay *)self outlineLayer];
  [v4 setPath:v3];
}

- (UIBezierPath)outlinePath
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C478]);
  double v4 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 position];
  objc_msgSend(v3, "moveToPoint:");

  double v6 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  double v7 = [v6 objectAtIndexedSubscript:1];
  [v7 position];
  objc_msgSend(v3, "addLineToPoint:");

  double v8 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  double v9 = [v8 objectAtIndexedSubscript:2];
  [v9 position];
  objc_msgSend(v3, "addLineToPoint:");

  uint64_t v10 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  double v11 = [v10 objectAtIndexedSubscript:3];
  [v11 position];
  objc_msgSend(v3, "addLineToPoint:");

  double v12 = [(ICDocCamImageQuadEditOverlay *)self knobs];
  double v13 = [v12 objectAtIndexedSubscript:0];
  [v13 position];
  objc_msgSend(v3, "addLineToPoint:");

  return (UIBezierPath *)v3;
}

- (CGRect)rectFromApplyingOrientation:(int64_t)a3 toContentsRect:(CGRect)a4
{
  id v5 = +[ICDocCamImageQuad quadFromCGRect:](ICDocCamImageQuad, "quadFromCGRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  objc_msgSend(v5, "applyOrientation:boundingBox:", a3, 0.0, 0.0, 1.0, 1.0);
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (BOOL)isTempOverlay
{
  return self->_isTempOverlay;
}

- (void)setIsTempOverlay:(BOOL)a3
{
  self->_isTempOverladouble y = a3;
}

- (BOOL)tempOverlayQuadIsValid
{
  return self->_tempOverlayQuadIsValid;
}

- (ICDocCamImageQuadEditOverlayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDocCamImageQuadEditOverlayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICDocCamImageQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (double)knobHeight
{
  return self->_knobHeight;
}

- (void)setKnobHeight:(double)a3
{
  self->_knobHeight = a3;
}

- (UIColor)knobColor
{
  return self->_knobColor;
}

- (void)setKnobColor:(id)a3
{
}

- (NSArray)knobs
{
  return self->_knobs;
}

- (void)setKnobs:(id)a3
{
}

- (NSArray)knobAccessibilityElements
{
  return self->_knobAccessibilityElements;
}

- (void)setKnobAccessibilityElements:(id)a3
{
}

- (UIColor)validRectColor
{
  return self->_validRectColor;
}

- (UIColor)invalidRectColor
{
  return self->_invalidRectColor;
}

- (BOOL)isDisplayingValidQuad
{
  return self->_isDisplayingValidQuad;
}

- (void)setIsDisplayingValidQuad:(BOOL)a3
{
  self->_isDisplayingValidQuad = a3;
}

- (CALayer)selectedKnob
{
  return self->_selectedKnob;
}

- (ICDocCamImageQuadEditPanGestureRecognizer)panGR
{
  return self->_panGR;
}

- (void)setPanGR:(id)a3
{
}

- (CALayer)knobLayer
{
  return self->_knobLayer;
}

- (void)setKnobLayer:(id)a3
{
}

- (CAShapeLayer)outlineLayer
{
  return self->_outlineLayer;
}

- (void)setOutlineLayer:(id)a3
{
}

- (CALayer)loupeLayer
{
  return self->_loupeLayer;
}

- (void)setLoupeLayer:(id)a3
{
}

- (CALayer)loupeContentsLayer
{
  return self->_loupeContentsLayer;
}

- (void)setLoupeContentsLayer:(id)a3
{
}

- (double)tempOverlayMagnification
{
  return self->_tempOverlayMagnification;
}

- (void)setTempOverlayMagnification:(double)a3
{
  self->_tempOverlayMagnification = a3;
}

- (CGPoint)lastGestureTranslation
{
  double x = self->_lastGestureTranslation.x;
  double y = self->_lastGestureTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastGestureTranslation:(CGPoint)a3
{
  self->_lastGestureTranslation = a3;
}

- (NSMutableArray)panHistory
{
  return self->_panHistory;
}

- (void)setPanHistory:(id)a3
{
}

- (unint64_t)panHistoryIdx
{
  return self->_panHistoryIdx;
}

- (void)setPanHistoryIdx:(unint64_t)a3
{
  self->_panHistoryIddouble x = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panHistory, 0);
  objc_storeStrong((id *)&self->_loupeContentsLayer, 0);
  objc_storeStrong((id *)&self->_loupeLayer, 0);
  objc_storeStrong((id *)&self->_outlineLayer, 0);
  objc_storeStrong((id *)&self->_knobLayer, 0);
  objc_storeStrong((id *)&self->_panGR, 0);
  objc_storeStrong((id *)&self->_selectedKnob, 0);
  objc_storeStrong((id *)&self->_invalidRectColor, 0);
  objc_storeStrong((id *)&self->_validRectColor, 0);
  objc_storeStrong((id *)&self->_knobAccessibilityElements, 0);
  objc_storeStrong((id *)&self->_knobs, 0);
  objc_storeStrong((id *)&self->_knobColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_quad, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTempOverlayMagnification:(os_log_t)log animationDuration:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Trying to set temp overlay magnifiation on a not temp overlay", v1, 2u);
}

@end