@interface MRUFlippingArtworkLayer
- ($96BD43AC9783A3841D68D10A686FAFB5)nextState;
- ($96BD43AC9783A3841D68D10A686FAFB5)state;
- (BOOL)dimsWhenPaused;
- (BOOL)isLayerForStateGlowing:(id *)a3;
- (BOOL)playing;
- (CAFilter)backBlurFilter;
- (CAFilter)frontBlurFilter;
- (CALayer)backGlowLayer;
- (CALayer)backLayer;
- (CALayer)backLegibilityLayer;
- (CALayer)backPlaceholderLayer;
- (CALayer)frontGlowLayer;
- (CALayer)frontLayer;
- (CALayer)frontLegibilityLayer;
- (CALayer)frontPlaceholderLayer;
- (CATransformLayer)rotatorLayer;
- (CGColor)placeholderImageTintColor;
- (CGImage)placeholderImage;
- (MRUFlippingArtworkLayer)init;
- (double)artworkCornerRadius;
- (id)glowLayerForState:(id *)a3;
- (id)imageLayerForState:(id *)a3;
- (id)makeAnimation:(id)a3 fromValue:(id)a4 toValue:(id)a5 duration:(double)a6;
- (id)makeBlurFilter;
- (id)makeDynamicIslandLegibilityFilter;
- (id)makeLegibilityLayer;
- (id)makeSpringAnimation:(id)a3 fromValue:(id)a4 toValue:(id)a5;
- (id)placeholderLayerForState:(id *)a3;
- (int64_t)artworkStyle;
- (void)animateGlowForState:(id *)a3 reverse:(BOOL)a4;
- (void)setArtworkCornerRadius:(double)a3;
- (void)setArtworkStyle:(int64_t)a3;
- (void)setBackBlurFilter:(id)a3;
- (void)setBackGlowLayer:(id)a3;
- (void)setBackLayer:(id)a3;
- (void)setBackLegibilityLayer:(id)a3;
- (void)setBackPlaceholderLayer:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentsScale:(double)a3;
- (void)setDimsWhenPaused:(BOOL)a3;
- (void)setFrontBlurFilter:(id)a3;
- (void)setFrontGlowLayer:(id)a3;
- (void)setFrontLayer:(id)a3;
- (void)setFrontLegibilityLayer:(id)a3;
- (void)setFrontPlaceholderLayer:(id)a3;
- (void)setImage:(CGImage *)a3 toLayer:(id)a4;
- (void)setImageToCurrentLayer:(CGImage *)a3 animated:(BOOL)a4;
- (void)setPlaceholderImage:(CGImage *)a3;
- (void)setPlaceholderImageTintColor:(CGColor *)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setRotatorLayer:(id)a3;
- (void)setState:(id *)a3;
- (void)setState:(id *)a3 transitionDirection:(int64_t)a4;
- (void)transitionToImage:(CGImage *)a3;
- (void)transitionToImage:(CGImage *)a3 transitionDirection:(int64_t)a4;
- (void)updateArtworkStyle;
- (void)updateGlowForState:(id *)a3 reverse:(BOOL)a4 animated:(BOOL)a5;
- (void)updateOpacity;
- (void)updatePlaceholderFrame;
- (void)updateScale;
- (void)updateStateWithPreviousState:(id *)a3 transitionDirection:(int64_t)a4;
@end

@implementation MRUFlippingArtworkLayer

- (MRUFlippingArtworkLayer)init
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)MRUFlippingArtworkLayer;
  v2 = [(MRUFlippingArtworkLayer *)&v43 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F39D10]);
    v4 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v3;

    [*((id *)v2 + 9) setMasksToBounds:1];
    [v2 addSublayer:*((void *)v2 + 9)];
    id v5 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    v6 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v5;

    uint64_t v7 = *MEMORY[0x1E4F39EA8];
    [*((id *)v2 + 10) setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [*((id *)v2 + 10) setAllowsGroupOpacity:1];
    [*((id *)v2 + 10) setAllowsEdgeAntialiasing:1];
    [*((id *)v2 + 10) setMasksToBounds:1];
    [*((id *)v2 + 10) setDoubleSided:0];
    [*((id *)v2 + 9) addSublayer:*((void *)v2 + 10)];
    id v8 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    v9 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v8;

    id v10 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    [*((id *)v2 + 12) setMask:v10];

    v11 = [*((id *)v2 + 12) mask];
    LODWORD(v12) = 1061997773;
    [v11 setOpacity:v12];

    [*((id *)v2 + 10) addSublayer:*((void *)v2 + 12)];
    uint64_t v13 = [MEMORY[0x1E4F39BE8] layer];
    v14 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v13;

    id v15 = [MEMORY[0x1E4FB1618] whiteColor];
    objc_msgSend(*((id *)v2 + 14), "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

    [*((id *)v2 + 14) setOpacity:0.0];
    uint64_t v16 = *MEMORY[0x1E4F3A2E8];
    [*((id *)v2 + 14) setCompositingFilter:*MEMORY[0x1E4F3A2E8]];
    [*((id *)v2 + 10) addSublayer:*((void *)v2 + 14)];
    id v17 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    v18 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v17;

    [*((id *)v2 + 11) setCornerCurve:v7];
    [*((id *)v2 + 11) setAllowsGroupOpacity:1];
    [*((id *)v2 + 11) setAllowsEdgeAntialiasing:1];
    [*((id *)v2 + 11) setMasksToBounds:1];
    [*((id *)v2 + 11) setDoubleSided:0];
    [*((id *)v2 + 11) setZPosition:-0.5];
    CATransform3DMakeRotation(&v42, 3.14159265, 0.0, 1.0, 0.0);
    v19 = (void *)*((void *)v2 + 11);
    CATransform3D v41 = v42;
    [v19 setTransform:&v41];
    [*((id *)v2 + 9) addSublayer:*((void *)v2 + 11)];
    id v20 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    v21 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v20;

    id v22 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    [*((id *)v2 + 13) setMask:v22];

    v23 = [*((id *)v2 + 13) mask];
    LODWORD(v24) = 1061997773;
    [v23 setOpacity:v24];

    [*((id *)v2 + 11) addSublayer:*((void *)v2 + 13)];
    uint64_t v25 = [MEMORY[0x1E4F39BE8] layer];
    v26 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v25;

    id v27 = [MEMORY[0x1E4FB1618] whiteColor];
    objc_msgSend(*((id *)v2 + 15), "setBackgroundColor:", objc_msgSend(v27, "CGColor"));

    [*((id *)v2 + 15) setOpacity:0.0];
    [*((id *)v2 + 15) setCompositingFilter:v16];
    [*((id *)v2 + 11) addSublayer:*((void *)v2 + 15)];
    uint64_t v28 = [v2 makeBlurFilter];
    v29 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v28;

    uint64_t v30 = [v2 makeBlurFilter];
    v31 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v30;

    v45[0] = *((void *)v2 + 18);
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    [*((id *)v2 + 10) setFilters:v32];

    uint64_t v44 = *((void *)v2 + 19);
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    [*((id *)v2 + 11) setFilters:v33];

    v2[33] = 0;
    v34 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = @"Front";

    *((void *)v2 + 27) = 0;
    *(_OWORD *)(v2 + 168) = xmmword_1E5F0FB68;
    *(_OWORD *)(v2 + 184) = unk_1E5F0FB78;
    *(_OWORD *)(v2 + 200) = xmmword_1E5F0FB88;
    v36 = @"Front";
    long long v39 = xmmword_1E5F0FB88;
    long long v38 = unk_1E5F0FB78;
    long long v37 = xmmword_1E5F0FB68;
    uint64_t v40 = 0;
    [v2 updateStateWithPreviousState:&v36 transitionDirection:0];
    [v2 updateScale];
  }
  return (MRUFlippingArtworkLayer *)v2;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)MRUFlippingArtworkLayer;
  -[MRUFlippingArtworkLayer setBounds:](&v8, sel_setBounds_);
  -[CATransformLayer setFrame:](self->_rotatorLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_frontLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_backLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_frontGlowLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_backGlowLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_frontLegibilityLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_backLegibilityLayer, "setFrame:", x, y, width, height);
  [(MRUFlippingArtworkLayer *)self updatePlaceholderFrame];
}

- (void)setContentsScale:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRUFlippingArtworkLayer;
  -[MRUFlippingArtworkLayer setContentsScale:](&v5, sel_setContentsScale_);
  [(CALayer *)self->_frontLayer setContentsScale:a3];
  [(CALayer *)self->_backLayer setContentsScale:a3];
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    [(MRUFlippingArtworkLayer *)self updateScale];
    [(MRUFlippingArtworkLayer *)self updateOpacity];
  }
}

- (void)setArtworkCornerRadius:(double)a3
{
  self->_artworkCornerRadius = a3;
  -[CALayer setCornerRadius:](self->_frontLayer, "setCornerRadius:");
  backLayer = self->_backLayer;

  [(CALayer *)backLayer setCornerRadius:a3];
}

- (void)setImageToCurrentLayer:(CGImage *)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = MCLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    [(MRUFlippingArtworkLayer *)self state];
    *(_DWORD *)buf = 134218242;
    v14 = a3;
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].Layer setImageToCurrentLayer:<%p> currentState:%@", buf, 0x16u);
  }
  [(MRUFlippingArtworkLayer *)self state];
  if (self)
  {
    objc_super v8 = [(MRUFlippingArtworkLayer *)self imageLayerForState:v11];
  }
  else
  {

    objc_super v8 = 0;
  }
  [(MRUFlippingArtworkLayer *)self setImage:a3 toLayer:v8];
  [(MRUFlippingArtworkLayer *)self state];
  if (self)
  {
    if ([(MRUFlippingArtworkLayer *)self isLayerForStateGlowing:v10])
    {
      [(MRUFlippingArtworkLayer *)self state];
      [(MRUFlippingArtworkLayer *)self updateGlowForState:&v9 reverse:a3 == 0 animated:v4];
    }
  }
  else
  {
  }
}

- (void)transitionToImage:(CGImage *)a3 transitionDirection:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  memset(v28, 0, sizeof(v28));
  [(MRUFlippingArtworkLayer *)self nextState];
  uint64_t v7 = MCLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    [(MRUFlippingArtworkLayer *)self state];
    objc_super v8 = MRUFlippingArtworkTransitionDirectionDescription(a4);
    *(_DWORD *)buf = 134218754;
    uint64_t v30 = a3;
    __int16 v31 = 2112;
    id v32 = v27;
    __int16 v33 = 2112;
    uint64_t v34 = *(void *)&v28[0];
    __int16 v35 = 2112;
    v36 = v8;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].Layer transitionToImage:<%p> currentState:%@ nextState:%@ transitionDirection:%@", buf, 0x2Au);
  }
  id v9 = *(id *)&v28[0];
  long long v23 = *(_OWORD *)((char *)v28 + 8);
  long long v24 = *(_OWORD *)((char *)&v28[1] + 8);
  long long v25 = *(_OWORD *)((char *)&v28[2] + 8);
  id v22 = v9;
  uint64_t v26 = *((void *)&v28[3] + 1);
  if (self)
  {
    id v10 = [(MRUFlippingArtworkLayer *)self imageLayerForState:&v22];
  }
  else
  {

    id v10 = 0;
  }
  [(MRUFlippingArtworkLayer *)self setImage:a3 toLayer:v10];
  id v11 = *(id *)&v28[0];
  id v17 = v11;
  long long v18 = *(_OWORD *)((char *)v28 + 8);
  long long v19 = *(_OWORD *)((char *)&v28[1] + 8);
  long long v20 = *(_OWORD *)((char *)&v28[2] + 8);
  uint64_t v21 = *((void *)&v28[3] + 1);
  if (self)
  {
    [(MRUFlippingArtworkLayer *)self animateGlowForState:&v17 reverse:a3 == 0];
    id v12 = *(id *)&v28[0];
    long long v13 = *(_OWORD *)((char *)v28 + 8);
    long long v14 = *(_OWORD *)((char *)&v28[1] + 8);
    long long v15 = *(_OWORD *)((char *)&v28[2] + 8);
    uint64_t v16 = *((void *)&v28[3] + 1);
    [(MRUFlippingArtworkLayer *)self setState:&v12 transitionDirection:a4];
  }
  else
  {

    id v12 = *(id *)&v28[0];
    long long v13 = *(_OWORD *)((char *)v28 + 8);
    long long v14 = *(_OWORD *)((char *)&v28[1] + 8);
    long long v15 = *(_OWORD *)((char *)&v28[2] + 8);
    uint64_t v16 = *((void *)&v28[3] + 1);
  }
}

- (void)transitionToImage:(CGImage *)a3
{
}

- (void)setPlaceholderImage:(CGImage *)a3
{
  self->_placeholderImage = a3;
  BOOL v5 = a3 == 0;
  p_state = &self->_state;
  uint64_t v16 = self->_state.identifier;
  long long v17 = *(_OWORD *)&p_state->frontLayerAlpha;
  long long v18 = *(_OWORD *)&p_state->frontLayerBlurRadius;
  long long v19 = *(_OWORD *)&p_state->backLayerBlurRadius;
  double yRotation = p_state->yRotation;
  uint64_t v7 = [(MRUFlippingArtworkLayer *)self placeholderLayerForState:&v16];
  [v7 setHidden:v5];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  [(MRUFlippingArtworkLayer *)self updatePlaceholderFrame];
  [MEMORY[0x1E4F39CF8] commit];
  objc_super v8 = a3;
  id v9 = [v7 mask];
  [v9 setContents:v8];

  if (a3)
  {
    id v11 = p_state->identifier;
    long long v10 = *(_OWORD *)&p_state->frontLayerBlurRadius;
    long long v12 = *(_OWORD *)&p_state->frontLayerAlpha;
    long long v13 = v10;
    long long v14 = *(_OWORD *)&p_state->backLayerBlurRadius;
    double v15 = p_state->yRotation;
    [(MRUFlippingArtworkLayer *)self updateGlowForState:&v11 reverse:0 animated:1];
  }
}

- (void)updatePlaceholderFrame
{
  if (self->_placeholderImage)
  {
    p_state = &self->_state;
    long long v14 = self->_state.identifier;
    long long v15 = *(_OWORD *)&p_state->frontLayerAlpha;
    long long v16 = *(_OWORD *)&p_state->frontLayerBlurRadius;
    long long v17 = *(_OWORD *)&p_state->backLayerBlurRadius;
    double yRotation = p_state->yRotation;
    BOOL v4 = [(MRUFlippingArtworkLayer *)self placeholderLayerForState:&v14];
    CGImageGetSizeAfterOrientation();
    [(MRUFlippingArtworkLayer *)self bounds];
    CGRectGetWidth(v19);
    [(MRUFlippingArtworkLayer *)self bounds];
    UIRectCenteredRect();
    objc_msgSend(v4, "setFrame:");
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    long long v13 = [v4 mask];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  }
}

- (void)setPlaceholderImageTintColor:(CGColor *)a3
{
  self->_placeholderImageTintColor = a3;
  -[CALayer setBackgroundColor:](self->_frontPlaceholderLayer, "setBackgroundColor:");
  backPlaceholderLayer = self->_backPlaceholderLayer;

  [(CALayer *)backPlaceholderLayer setBackgroundColor:a3];
}

- (void)setArtworkStyle:(int64_t)a3
{
  if (self->_artworkStyle != a3)
  {
    self->_artworkStyle = a3;
    [(MRUFlippingArtworkLayer *)self updateArtworkStyle];
  }
}

- (void)updateArtworkStyle
{
  unint64_t v3 = self->_artworkStyle - 7;
  frontLegibilityLayer = self->_frontLegibilityLayer;
  if (v3 > 1)
  {
    if (frontLegibilityLayer || self->_backLegibilityLayer)
    {
      [(CALayer *)frontLegibilityLayer removeFromSuperlayer];
      [(CALayer *)self->_backLegibilityLayer removeFromSuperlayer];
      double v11 = self->_frontLegibilityLayer;
      self->_frontLegibilityLayer = 0;

      backLegibilityLayer = self->_backLegibilityLayer;
      self->_backLegibilityLayer = 0;
    }
  }
  else if (!frontLegibilityLayer)
  {
    double v5 = [(MRUFlippingArtworkLayer *)self makeLegibilityLayer];
    double v6 = self->_frontLegibilityLayer;
    self->_frontLegibilityLayer = v5;

    double v7 = [(MRUFlippingArtworkLayer *)self makeLegibilityLayer];
    double v8 = self->_backLegibilityLayer;
    self->_backLegibilityLayer = v7;

    [(CALayer *)self->_frontLayer addSublayer:self->_frontLegibilityLayer];
    backLayer = self->_backLayer;
    double v10 = self->_backLegibilityLayer;
    [(CALayer *)backLayer addSublayer:v10];
  }
}

- (void)setState:(id *)a3
{
  id v5 = a3->var0;
  id v6 = v5;
  long long v7 = *(_OWORD *)&a3->var1;
  long long v8 = *(_OWORD *)&a3->var3;
  long long v9 = *(_OWORD *)&a3->var5;
  double var7 = a3->var7;
  if (self) {
    [(MRUFlippingArtworkLayer *)self setState:&v6 transitionDirection:0];
  }
  else {
}
  }

- (void)setState:(id *)a3 transitionDirection:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v7 = MCLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id var0 = a3->var0;
    long long v9 = MRUFlippingArtworkTransitionDirectionDescription(a4);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = var0;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].Layer setState:%@ transitionDirection:%@", buf, 0x16u);
  }
  if (![(NSString *)self->_state.identifier isEqualToString:a3->var0])
  {
    double v10 = self->_state.identifier;
    long long v11 = *(_OWORD *)&self->_state.frontLayerBlurRadius;
    *(_OWORD *)buf = *(_OWORD *)&self->_state.frontLayerAlpha;
    *(_OWORD *)&buf[16] = v11;
    long long v21 = *(_OWORD *)&self->_state.backLayerBlurRadius;
    double yRotation = self->_state.yRotation;
    objc_storeStrong((id *)&self->_state.identifier, a3->var0);
    long long v12 = *(_OWORD *)&a3->var1;
    long long v13 = *(_OWORD *)&a3->var3;
    long long v14 = *(_OWORD *)&a3->var5;
    self->_state.double yRotation = a3->var7;
    *(_OWORD *)&self->_state.frontLayerBlurRadius = v13;
    *(_OWORD *)&self->_state.backLayerBlurRadius = v14;
    *(_OWORD *)&self->_state.frontLayerAlpha = v12;
    long long v15 = v10;
    long long v16 = *(_OWORD *)buf;
    long long v17 = *(_OWORD *)&buf[16];
    long long v18 = v21;
    double v19 = yRotation;
    [(MRUFlippingArtworkLayer *)self updateStateWithPreviousState:&v15 transitionDirection:a4];
  }
}

- (void)setImage:(CGImage *)a3 toLayer:(id)a4
{
  id v5 = a4;
  [v5 setContents:a3];
  if (a3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  id v6 = [MEMORY[0x1E4FB1618] grayColor];
  }
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));
}

- (void)animateGlowForState:(id *)a3 reverse:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3->var0;
  id v8 = v7;
  long long v9 = *(_OWORD *)&a3->var1;
  long long v10 = *(_OWORD *)&a3->var3;
  long long v11 = *(_OWORD *)&a3->var5;
  double var7 = a3->var7;
  if (self) {
    [(MRUFlippingArtworkLayer *)self updateGlowForState:&v8 reverse:v4 animated:1];
  }
  else {
}
  }

- (void)updateGlowForState:(id *)a3 reverse:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v9 = MCLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id var0 = a3->var0;
    *(_DWORD *)buf = 138412802;
    id v25 = var0;
    __int16 v26 = 1024;
    BOOL v27 = v6;
    __int16 v28 = 1024;
    BOOL v29 = v5;
    _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].Layer updateGlowForState %@ reverse:%{BOOL}u animated:%{BOOL}u", buf, 0x18u);
  }

  id v11 = a3->var0;
  id v19 = v11;
  long long v20 = *(_OWORD *)&a3->var1;
  long long v21 = *(_OWORD *)&a3->var3;
  long long v22 = *(_OWORD *)&a3->var5;
  double var7 = a3->var7;
  if (self)
  {
    long long v12 = [(MRUFlippingArtworkLayer *)self glowLayerForState:&v19];
  }
  else
  {

    long long v12 = 0;
  }
  HIDWORD(v13) = 0;
  if (v6) {
    double v14 = 0.5;
  }
  else {
    double v14 = 0.0;
  }
  *(float *)&double v13 = v14;
  objc_msgSend(v12, "setOpacity:", v13, v19, v20, v21, v22, *(void *)&var7);
  if (v5)
  {
    double v15 = 0.5;
    if (v6) {
      double v15 = 0.0;
    }
    long long v16 = [NSNumber numberWithDouble:v15];
    long long v17 = [NSNumber numberWithDouble:v14];
    long long v18 = [(MRUFlippingArtworkLayer *)self makeAnimation:@"opacity" fromValue:v16 toValue:v17 duration:0.55];

    [v12 addAnimation:v18 forKey:0];
  }
}

- (BOOL)isLayerForStateGlowing:(id *)a3
{
  id v5 = a3->var0;
  id v9 = v5;
  long long v10 = *(_OWORD *)&a3->var1;
  long long v11 = *(_OWORD *)&a3->var3;
  long long v12 = *(_OWORD *)&a3->var5;
  double var7 = a3->var7;
  if (self)
  {
    self = [(MRUFlippingArtworkLayer *)self glowLayerForState:&v9];
  }
  else
  {
  }
  [(MRUFlippingArtworkLayer *)self opacity];
  BOOL v7 = v6 > 0.0;

  return v7;
}

- (void)updateStateWithPreviousState:(id *)a3 transitionDirection:(int64_t)a4
{
  BOOL v7 = [(CATransformLayer *)self->_rotatorLayer valueForKeyPath:@"transform.rotation.y"];
  double yRotation = self->_state.yRotation;
  id v9 = [NSNumber numberWithDouble:yRotation];
  char v10 = [v7 isEqualToNumber:v9];

  if ((v10 & 1) == 0)
  {
    double v11 = self->_state.yRotation;
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v32.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v32.m23 = v12;
    *(_OWORD *)&v32.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    CGFloat v13 = *(double *)(MEMORY[0x1E4F39B10] + 80);
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v32.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v32.m13 = v14;
    v32.CGFloat m33 = v13;
    v32.CGFloat m34 = -0.000666666667;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v32.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v32.m43 = v15;
    CATransform3DRotate(&v33, &v32, v11, 0.0, 1.0, 0.0);
    long long v38 = *(_OWORD *)&v33.m21;
    long long v39 = *(_OWORD *)&v33.m23;
    long long v40 = *(_OWORD *)&v33.m31;
    CGFloat m33 = v33.m33;
    long long v36 = *(_OWORD *)&v33.m11;
    long long v37 = *(_OWORD *)&v33.m13;
    long long v34 = *(_OWORD *)&v33.m41;
    long long v35 = *(_OWORD *)&v33.m43;
    CGFloat v28 = v33.m33;
    v27[3] = *(_OWORD *)&v33.m23;
    v27[4] = *(_OWORD *)&v33.m31;
    v27[1] = *(_OWORD *)&v33.m13;
    v27[2] = *(_OWORD *)&v33.m21;
    v27[0] = *(_OWORD *)&v33.m11;
    long long v30 = *(_OWORD *)&v33.m41;
    long long v31 = *(_OWORD *)&v33.m43;
    rotatorLayer = self->_rotatorLayer;
    CGFloat m34 = v33.m34;
    [(CATransformLayer *)rotatorLayer setTransform:v27];
    long long v17 = objc_msgSend(NSNumber, "numberWithDouble:", MRUFlippingArtworkTransitionDirectionFromValue(a4, yRotation));
    long long v18 = [NSNumber numberWithDouble:yRotation];
    id v19 = [(MRUFlippingArtworkLayer *)self makeSpringAnimation:@"transform.rotation.y" fromValue:v17 toValue:v18];

    LODWORD(v20) = 0.5;
    [v19 setSpeed:v20];
    [(CATransformLayer *)self->_rotatorLayer addAnimation:v19 forKey:0];
  }
  long long v21 = [NSNumber numberWithDouble:a3->var3];
  long long v22 = [NSNumber numberWithDouble:self->_state.frontLayerBlurRadius];
  uint64_t v23 = [(MRUFlippingArtworkLayer *)self makeAnimation:@"filters.gaussianBlur.inputRadius" fromValue:v21 toValue:v22 duration:0.5];

  long long v24 = [NSNumber numberWithDouble:a3->var5];
  id v25 = [NSNumber numberWithDouble:self->_state.backLayerBlurRadius];
  __int16 v26 = [(MRUFlippingArtworkLayer *)self makeAnimation:@"filters.gaussianBlur.inputRadius" fromValue:v24 toValue:v25 duration:0.5];

  [v23 setBeginTime:CACurrentMediaTime() + self->_state.frontLayerBlurAnimationDelay];
  [v26 setBeginTime:CACurrentMediaTime() + self->_state.backLayerBlurAnimationDelay];
  [(CALayer *)self->_frontLayer addAnimation:v23 forKey:0];
  [(CALayer *)self->_backLayer addAnimation:v26 forKey:0];
}

- (void)updateScale
{
  double v3 = MRUFlippingArtworkScale(!self->_playing);
  double v4 = MRUFlippingArtworkScale(self->_playing);
  if (vabdd_f64(v3, v4) > 2.22044605e-16)
  {
    [(MRUFlippingArtworkLayer *)self removeAnimationForKey:@"MRUFlippingArtworkPlaybackStateScaleAnimationKey"];
    id v5 = [NSNumber numberWithDouble:v3];
    float v6 = [NSNumber numberWithDouble:v4];
    id v7 = [(MRUFlippingArtworkLayer *)self makeSpringAnimation:@"transform.scale.xy" fromValue:v5 toValue:v6];

    [(MRUFlippingArtworkLayer *)self addAnimation:v7 forKey:0];
  }
}

- (void)updateOpacity
{
  double v3 = MRUFlippingArtworkOpacity(!self->_playing, self->_dimsWhenPaused);
  double v4 = MRUFlippingArtworkOpacity(self->_playing, self->_dimsWhenPaused);
  if (vabdd_f64(v3, v4) > 2.22044605e-16)
  {
    [(MRUFlippingArtworkLayer *)self removeAnimationForKey:@"MRUFlippingArtworkPlaybackStateOpacityAnimationKey"];
    id v5 = [NSNumber numberWithDouble:v3];
    float v6 = [NSNumber numberWithDouble:v4];
    id v8 = [(MRUFlippingArtworkLayer *)self makeAnimation:@"opacity" fromValue:v5 toValue:v6 duration:0.2];

    id v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [v8 setTimingFunction:v7];

    [v8 setRemovedOnCompletion:0];
    [(MRUFlippingArtworkLayer *)self addAnimation:v8 forKey:@"MRUFlippingArtworkPlaybackStateOpacityAnimationKey"];
  }
}

- (id)imageLayerForState:(id *)a3
{
  if ([a3->var0 isEqualToString:@"Front"]) {
    [(MRUFlippingArtworkLayer *)self frontLayer];
  }
  else {
  id v5 = [(MRUFlippingArtworkLayer *)self backLayer];
  }

  return v5;
}

- (id)placeholderLayerForState:(id *)a3
{
  if ([a3->var0 isEqualToString:@"Front"]) {
    [(MRUFlippingArtworkLayer *)self frontPlaceholderLayer];
  }
  else {
  id v5 = [(MRUFlippingArtworkLayer *)self backPlaceholderLayer];
  }

  return v5;
}

- (id)glowLayerForState:(id *)a3
{
  if ([a3->var0 isEqualToString:@"Front"]) {
    [(MRUFlippingArtworkLayer *)self frontGlowLayer];
  }
  else {
  id v5 = [(MRUFlippingArtworkLayer *)self backGlowLayer];
  }

  return v5;
}

- ($96BD43AC9783A3841D68D10A686FAFB5)nextState
{
  [(MRUFlippingArtworkLayer *)self state];
  int v4 = [v8 isEqualToString:@"Front"];
  p_var1 = &retstr->var1;
  if (v4)
  {
    *(_OWORD *)p_var1 = xmmword_1E5F0FBA8;
    *(_OWORD *)&retstr->var3 = unk_1E5F0FBB8;
    *(_OWORD *)&retstr->var5 = xmmword_1E5F0FBC8;
    retstr->double var7 = -3.14159265;
    float v6 = @"Back";
  }
  else
  {
    retstr->double var7 = 0.0;
    *(_OWORD *)p_var1 = xmmword_1E5F0FB68;
    *(_OWORD *)&retstr->var3 = unk_1E5F0FB78;
    *(_OWORD *)&retstr->var5 = xmmword_1E5F0FB88;
    float v6 = @"Front";
  }
  retstr->id var0 = v6;

  return result;
}

- (id)makeBlurFilter
{
  id v2 = objc_alloc(MEMORY[0x1E4F39BC0]);
  double v3 = (void *)[v2 initWithType:*MEMORY[0x1E4F3A0D0]];
  [v3 setValue:&unk_1F069F218 forKeyPath:*MEMORY[0x1E4F3A1D8]];
  [v3 setValue:MEMORY[0x1E4F1CC38] forKeyPath:*MEMORY[0x1E4F3A1B8]];

  return v3;
}

- (id)makeLegibilityLayer
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  id v4 = [MEMORY[0x1E4FB1618] redColor];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  id v5 = [(MRUFlippingArtworkLayer *)self makeDynamicIslandLegibilityFilter];
  v8[0] = v5;
  float v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v3 setFilters:v6];

  [(MRUFlippingArtworkLayer *)self bounds];
  objc_msgSend(v3, "setFrame:");

  return v3;
}

- (id)makeDynamicIslandLegibilityFilter
{
  id v2 = objc_alloc(MEMORY[0x1E4F39BC0]);
  id v3 = (void *)[v2 initWithType:*MEMORY[0x1E4F3A350]];
  v6[0] = 0;
  v6[1] = 0;
  int v7 = 1053676274;
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  int v10 = 1053676274;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  long long v13 = xmmword_1AE964120;
  uint64_t v14 = 1045086339;
  id v4 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v6];
  [v3 setValue:v4 forKey:@"inputColorMatrix"];

  return v3;
}

- (id)makeSpringAnimation:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  int v7 = (void *)MEMORY[0x1E4F39C90];
  id v8 = a5;
  id v9 = a4;
  int v10 = [v7 animationWithKeyPath:a3];
  [v10 setMass:1.25];
  [v10 setDamping:25.0];
  [v10 setStiffness:300.0];
  [v10 setInitialVelocity:0.0];
  [v10 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v10 setFromValue:v9];

  [v10 setToValue:v8];
  [v10 settlingDuration];
  objc_msgSend(v10, "setDuration:");
  [v10 setRemovedOnCompletion:0];

  return v10;
}

- (id)makeAnimation:(id)a3 fromValue:(id)a4 toValue:(id)a5 duration:(double)a6
{
  id v9 = (void *)MEMORY[0x1E4F39B48];
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = [v9 animationWithKeyPath:a3];
  [v12 setDuration:a6];
  [v12 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v12 setFromValue:v11];

  [v12 setToValue:v10];

  return v12;
}

- (double)artworkCornerRadius
{
  return self->_artworkCornerRadius;
}

- (BOOL)playing
{
  return self->_playing;
}

- (BOOL)dimsWhenPaused
{
  return self->_dimsWhenPaused;
}

- (void)setDimsWhenPaused:(BOOL)a3
{
  self->_dimsWhenPaused = a3;
}

- (CGImage)placeholderImage
{
  return self->_placeholderImage;
}

- (CGColor)placeholderImageTintColor
{
  return self->_placeholderImageTintColor;
}

- (int64_t)artworkStyle
{
  return self->_artworkStyle;
}

- (CATransformLayer)rotatorLayer
{
  return self->_rotatorLayer;
}

- (void)setRotatorLayer:(id)a3
{
}

- (CALayer)frontLayer
{
  return self->_frontLayer;
}

- (void)setFrontLayer:(id)a3
{
}

- (CALayer)backLayer
{
  return self->_backLayer;
}

- (void)setBackLayer:(id)a3
{
}

- (CALayer)frontPlaceholderLayer
{
  return self->_frontPlaceholderLayer;
}

- (void)setFrontPlaceholderLayer:(id)a3
{
}

- (CALayer)backPlaceholderLayer
{
  return self->_backPlaceholderLayer;
}

- (void)setBackPlaceholderLayer:(id)a3
{
}

- (CALayer)frontGlowLayer
{
  return self->_frontGlowLayer;
}

- (void)setFrontGlowLayer:(id)a3
{
}

- (CALayer)backGlowLayer
{
  return self->_backGlowLayer;
}

- (void)setBackGlowLayer:(id)a3
{
}

- (CALayer)frontLegibilityLayer
{
  return self->_frontLegibilityLayer;
}

- (void)setFrontLegibilityLayer:(id)a3
{
}

- (CALayer)backLegibilityLayer
{
  return self->_backLegibilityLayer;
}

- (void)setBackLegibilityLayer:(id)a3
{
}

- (CAFilter)frontBlurFilter
{
  return self->_frontBlurFilter;
}

- (void)setFrontBlurFilter:(id)a3
{
}

- (CAFilter)backBlurFilter
{
  return self->_backBlurFilter;
}

- (void)setBackBlurFilter:(id)a3
{
}

- ($96BD43AC9783A3841D68D10A686FAFB5)state
{
  p_state = &self->_state;
  result = self->_state.identifier;
  retstr->id var0 = result;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&p_state->frontLayerAlpha;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&p_state->frontLayerBlurRadius;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&p_state->backLayerBlurRadius;
  retstr->double var7 = p_state->yRotation;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backBlurFilter, 0);
  objc_storeStrong((id *)&self->_frontBlurFilter, 0);
  objc_storeStrong((id *)&self->_backLegibilityLayer, 0);
  objc_storeStrong((id *)&self->_frontLegibilityLayer, 0);
  objc_storeStrong((id *)&self->_backGlowLayer, 0);
  objc_storeStrong((id *)&self->_frontGlowLayer, 0);
  objc_storeStrong((id *)&self->_backPlaceholderLayer, 0);
  objc_storeStrong((id *)&self->_frontPlaceholderLayer, 0);
  objc_storeStrong((id *)&self->_backLayer, 0);
  objc_storeStrong((id *)&self->_frontLayer, 0);

  objc_storeStrong((id *)&self->_rotatorLayer, 0);
}

@end