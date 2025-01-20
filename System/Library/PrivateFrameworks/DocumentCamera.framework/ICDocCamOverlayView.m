@interface ICDocCamOverlayView
- (BOOL)rectangleIsActive;
- (BOOL)showGridAnimation;
- (CAAnimation)gridAnimation;
- (CAGradientLayer)gradientMaskLayer;
- (CAShapeLayer)llShapeLayer;
- (CAShapeLayer)lrShapeLayer;
- (CAShapeLayer)rectangleGridLayer;
- (CAShapeLayer)rectangleShapeLayer;
- (CAShapeLayer)ulShapeLayer;
- (CAShapeLayer)urShapeLayer;
- (CATransform3D)calculateRotationTransformForPoint:(SEL)a3 toPoint:(CGPoint)a4;
- (CGPath)newGridPathFromRect:(id)a3;
- (CGPath)newPathFromRect:(id)a3;
- (CGRect)frameForContentInView;
- (CGRect)previewBounds;
- (ICDocCamImageQuad)documentQuad;
- (ICDocCamOverlayView)initWithCoder:(id)a3;
- (ICDocCamOverlayView)initWithFrame:(CGRect)a3;
- (NSArray)debugRects;
- (NSDate)dateToStartGridAnimation;
- (NSString)displayString;
- (UIColor)rectColor;
- (UILabel)displayStringLabel;
- (double)crossProduct:(CGPoint)a3 v2:(CGPoint)a4;
- (id)calculateCurrentRectangleFromDocumentQuad:(id)a3;
- (id)extrudedRectFromRect:(id)a3;
- (id)tintColorWithAlpha:(double)a3;
- (unint64_t)numberOfMissedFrames;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)clearRectangles;
- (void)setDateToStartGridAnimation:(id)a3;
- (void)setDebugRects:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setDisplayStringLabel:(id)a3;
- (void)setDocumentQuad:(id)a3;
- (void)setGradientMaskLayer:(id)a3;
- (void)setGridAnimation:(id)a3;
- (void)setLlShapeLayer:(id)a3;
- (void)setLrShapeLayer:(id)a3;
- (void)setNumberOfMissedFrames:(unint64_t)a3;
- (void)setPreviewBounds:(CGRect)a3;
- (void)setRectColor:(id)a3;
- (void)setRectangleGridLayer:(id)a3;
- (void)setRectangleIsActive:(BOOL)a3;
- (void)setRectangleShapeLayer:(id)a3;
- (void)setShowGridAnimation:(BOOL)a3;
- (void)setUlShapeLayer:(id)a3;
- (void)setUrShapeLayer:(id)a3;
- (void)setupGridLayers;
- (void)setupRectangleLayer;
- (void)setupShapeLayersIfNeeded;
- (void)startGridAnimationFromRect:(id)a3;
- (void)stopGridAnimation;
- (void)updateGridLayerFromRect:(id)a3;
- (void)updateRectangleLayerFromRect:(id)a3;
- (void)updateShapeLayers;
@end

@implementation ICDocCamOverlayView

- (ICDocCamOverlayView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICDocCamOverlayView;
  v3 = -[ICDocCamOverlayView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(1);
    sem = v3->sem;
    v3->sem = (OS_dispatch_semaphore *)v4;

    v3->_showGridAnimation = 1;
  }
  return v3;
}

- (ICDocCamOverlayView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICDocCamOverlayView;
  v3 = [(ICDocCamOverlayView *)&v7 initWithCoder:a3];
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(1);
    sem = v3->sem;
    v3->sem = (OS_dispatch_semaphore *)v4;

    v3->_showGridAnimation = 1;
  }
  return v3;
}

- (double)crossProduct:(CGPoint)a3 v2:(CGPoint)a4
{
  return a3.x * a4.y - a3.y * a4.x;
}

- (NSString)displayString
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_displayString;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDisplayString:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_displayString, a3);
  objc_sync_exit(v6);

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__ICDocCamOverlayView_setDisplayString___block_invoke;
  v8[3] = &unk_2642A9360;
  id v9 = v5;
  v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __40__ICDocCamOverlayView_setDisplayString___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) length];
  v3 = [*(id *)(a1 + 40) displayStringLabel];
  dispatch_semaphore_t v4 = v3;
  if (v2)
  {

    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F1C768]);
      [*(id *)(a1 + 40) setDisplayStringLabel:v5];

      v6 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.0 blue:1.0 alpha:1.0];
      id v7 = [*(id *)(a1 + 40) displayStringLabel];
      [v7 setTextColor:v6];

      v8 = [*(id *)(a1 + 40) displayStringLabel];
      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v9 = *(void **)(a1 + 40);
      v10 = [v9 displayStringLabel];
      [v9 addSubview:v10];

      v11 = [*(id *)(a1 + 40) displayStringLabel];
      v12 = [v11 topAnchor];
      v13 = [*(id *)(a1 + 40) topAnchor];
      v14 = [v12 constraintEqualToAnchor:v13 constant:40.0];
      [v14 setActive:1];

      v15 = [*(id *)(a1 + 40) displayStringLabel];
      v16 = [v15 leadingAnchor];
      v17 = [*(id *)(a1 + 40) leadingAnchor];
      v18 = [v16 constraintEqualToAnchor:v17 constant:30.0];
      [v18 setActive:1];
    }
    uint64_t v19 = *(void *)(a1 + 32);
    id v21 = [*(id *)(a1 + 40) displayStringLabel];
    [v21 setText:v19];
  }
  else
  {
    [v3 removeFromSuperview];

    v20 = *(void **)(a1 + 40);
    [v20 setDisplayStringLabel:0];
  }
}

- (void)setDebugRects:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_debugRects, a3);
  objc_sync_exit(v6);

  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__ICDocCamOverlayView_setDebugRects___block_invoke;
    block[3] = &unk_2642A9250;
    block[4] = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __37__ICDocCamOverlayView_setDebugRects___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsDisplay];
}

- (NSArray)debugRects
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_debugRects;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDocumentQuad:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_documentQuad, a3);
  objc_sync_exit(v6);

  if (v5)
  {
    [(ICDocCamOverlayView *)v6 setNumberOfMissedFrames:0];
    id v7 = v9;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v8 = __39__ICDocCamOverlayView_setDocumentQuad___block_invoke_2;
LABEL_5:
    v7[2] = v8;
    v7[3] = &unk_2642A9250;
    v7[4] = v6;
    dispatch_async(MEMORY[0x263EF83A0], v7);
    goto LABEL_6;
  }
  [(ICDocCamOverlayView *)v6 setNumberOfMissedFrames:[(ICDocCamOverlayView *)v6 numberOfMissedFrames] + 1];
  if ([(ICDocCamOverlayView *)v6 numberOfMissedFrames] >= 3)
  {
    id v7 = block;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    v8 = __39__ICDocCamOverlayView_setDocumentQuad___block_invoke;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __39__ICDocCamOverlayView_setDocumentQuad___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateShapeLayers];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setNeedsDisplay];
}

uint64_t __39__ICDocCamOverlayView_setDocumentQuad___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateShapeLayers];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setNeedsDisplay];
}

- (ICDocCamImageQuad)documentQuad
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_documentQuad;
  objc_sync_exit(v2);

  return v3;
}

- (void)clearRectangles
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v3 = self;
    objc_sync_enter(v3);
    documentQuad = v3->_documentQuad;
    v3->_documentQuad = 0;

    v3->_numberOfMissedFrames = 0;
    debugRects = v3->_debugRects;
    v3->_debugRects = 0;

    objc_sync_exit(v3);
    [(ICDocCamOverlayView *)v3 setRectangleIsActive:0];
    [(ICDocCamOverlayView *)v3 stopGridAnimation];
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    v6 = [(ICDocCamOverlayView *)v3 rectangleShapeLayer];
    [v6 setPath:0];

    id v7 = [(ICDocCamOverlayView *)v3 rectangleShapeLayer];
    [v7 setStrokeColor:0];

    [MEMORY[0x263F158F8] commit];
    [(ICDocCamOverlayView *)v3 updateShapeLayers];
    [(ICDocCamOverlayView *)v3 setNeedsDisplay];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__ICDocCamOverlayView_clearRectangles__block_invoke;
    block[3] = &unk_2642A9250;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __38__ICDocCamOverlayView_clearRectangles__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearRectangles];
}

- (void)updateShapeLayers
{
  [(ICDocCamOverlayView *)self setupShapeLayersIfNeeded];
  v3 = [(ICDocCamOverlayView *)self documentQuad];
  if (v3)
  {
    dispatch_semaphore_t v4 = [(ICDocCamOverlayView *)self documentQuad];
    id v9 = [(ICDocCamOverlayView *)self calculateCurrentRectangleFromDocumentQuad:v4];
  }
  else
  {
    id v9 = 0;
  }

  [(ICDocCamOverlayView *)self updateRectangleLayerFromRect:v9];
  if ([(ICDocCamOverlayView *)self showGridAnimation])
  {
    id v5 = [(ICDocCamOverlayView *)self gridAnimation];

    if (v5)
    {
      [(ICDocCamOverlayView *)self updateGridLayerFromRect:v9];
    }
    else if ([(ICDocCamOverlayView *)self rectangleIsActive])
    {
      v6 = [(ICDocCamOverlayView *)self dateToStartGridAnimation];
      id v7 = [MEMORY[0x263EFF910] date];
      uint64_t v8 = [v6 compare:v7];

      if (v8 == -1) {
        [(ICDocCamOverlayView *)self startGridAnimationFromRect:v9];
      }
    }
  }
}

- (CGRect)frameForContentInView
{
  [(ICDocCamOverlayView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(ICDocCamOverlayView *)self previewBounds];
  double v12 = v11;
  double v14 = v13;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  float v15 = CGRectGetWidth(v29) / v12;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  float v16 = CGRectGetHeight(v30) / v14;
  double v17 = fminf(v15, v16);
  double v18 = v12 * v17;
  double v19 = v14 * v17;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  float v20 = (CGRectGetWidth(v31) - v18) * 0.5;
  double v21 = roundf(v20);
  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  float v22 = (CGRectGetHeight(v32) - v19) * 0.5;
  double v23 = roundf(v22);
  float v24 = v18;
  double v25 = roundf(v24);
  float v26 = v19;
  double v27 = roundf(v26);
  double v28 = v21;
  result.size.height = v27;
  result.size.width = v25;
  result.origin.y = v23;
  result.origin.x = v28;
  return result;
}

- (id)calculateCurrentRectangleFromDocumentQuad:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = objc_alloc_init(ICDocCamImageQuad);
  [(ICDocCamOverlayView *)self previewBounds];
  uint64_t v38 = v6;
  uint64_t v39 = v7;
  double v36 = v9;
  double v37 = v8;
  [v4 bottomLeft];
  double v40 = v10;
  double v41 = v11;
  [v4 bottomRight];
  double v42 = v12;
  double v43 = v13;
  [v4 topRight];
  double v44 = v14;
  double v45 = v15;
  [v4 topLeft];
  uint64_t v16 = 0;
  double v46 = v17;
  double v47 = v18;
  float64x2_t v19 = (float64x2_t)vdupq_lane_s64(v38, 0);
  float64x2_t v20 = (float64x2_t)vdupq_lane_s64(v39, 0);
  __asm { FMOV            V2.2D, #1.0 }
  do
  {
    float v26 = (double *)((char *)&v40 + v16);
    float64x2x2_t v50 = vld2q_f64(v26);
    float64x2_t v27 = vmulq_n_f64(v50.val[0], v37);
    v50.val[0] = vmulq_n_f64(vsubq_f64(_Q2, v50.val[1]), v36);
    v50.val[1] = vaddq_f64(v19, v27);
    float64x2_t v28 = vaddq_f64(v20, v50.val[0]);
    vst2q_f64(v26, *(float64x2x2_t *)((char *)&v50 + 16));
    v16 += 32;
  }
  while (v16 != 64);
  double v29 = v42;
  double v30 = v43;
  double v31 = v44;
  double v32 = v45;
  double v33 = v46;
  double v34 = v47;
  -[ICDocCamImageQuad setBottomLeft:](v5, "setBottomLeft:", v40, v41);
  -[ICDocCamImageQuad setBottomRight:](v5, "setBottomRight:", v29, v30);
  -[ICDocCamImageQuad setTopRight:](v5, "setTopRight:", v31, v32);
  -[ICDocCamImageQuad setTopLeft:](v5, "setTopLeft:", v33, v34);

  return v5;
}

- (CGPath)newPathFromRect:(id)a3
{
  id v3 = a3;
  Mutable = CGPathCreateMutable();
  [v3 bottomLeft];
  CGFloat v6 = v5;
  [v3 bottomLeft];
  CGPathMoveToPoint(Mutable, 0, v6, v7);
  [v3 topLeft];
  CGFloat v9 = v8;
  [v3 topLeft];
  CGPathAddLineToPoint(Mutable, 0, v9, v10);
  [v3 topRight];
  CGFloat v12 = v11;
  [v3 topRight];
  CGPathAddLineToPoint(Mutable, 0, v12, v13);
  [v3 bottomRight];
  CGFloat v15 = v14;
  [v3 bottomRight];
  CGPathAddLineToPoint(Mutable, 0, v15, v16);
  [v3 bottomLeft];
  CGFloat v18 = v17;
  [v3 bottomLeft];
  CGFloat v20 = v19;

  CGPathAddLineToPoint(Mutable, 0, v18, v20);
  return Mutable;
}

- (CGPath)newGridPathFromRect:(id)a3
{
  id v3 = a3;
  Mutable = CGPathCreateMutable();
  [v3 bottomLeft];
  CGFloat v6 = v5;
  [v3 bottomLeft];
  CGPathMoveToPoint(Mutable, 0, v6, v7);
  [v3 topLeft];
  CGFloat v9 = v8;
  [v3 topLeft];
  CGPathAddLineToPoint(Mutable, 0, v9, v10);
  [v3 topRight];
  CGFloat v12 = v11;
  [v3 topRight];
  CGPathAddLineToPoint(Mutable, 0, v12, v13);
  [v3 bottomRight];
  CGFloat v15 = v14;
  [v3 bottomRight];
  CGPathAddLineToPoint(Mutable, 0, v15, v16);
  [v3 bottomLeft];
  CGFloat v18 = v17;
  [v3 bottomLeft];
  CGPathAddLineToPoint(Mutable, 0, v18, v19);
  [v3 bottomLeft];
  double v21 = v20;
  double v23 = v22;
  [v3 topLeft];
  double v25 = v24;
  double v27 = v26;
  [v3 bottomLeft];
  double v29 = DCTSDSubtractPoints(v25, v27, v28);
  double v31 = DCTSDMultiplyPointScalar(v29, v30, 0.33);
  double v32 = DCTSDAddPoints(v21, v23, v31);
  CGFloat v142 = v33;
  CGFloat v144 = v32;
  [v3 bottomLeft];
  double v35 = v34;
  double v37 = v36;
  [v3 topLeft];
  double v39 = v38;
  double v41 = v40;
  [v3 bottomLeft];
  double v43 = DCTSDSubtractPoints(v39, v41, v42);
  double v45 = DCTSDMultiplyPointScalar(v43, v44, 0.66);
  double v46 = DCTSDAddPoints(v35, v37, v45);
  CGFloat v138 = v47;
  CGFloat v140 = v46;
  [v3 bottomRight];
  double v49 = v48;
  double v51 = v50;
  [v3 topRight];
  double v53 = v52;
  double v55 = v54;
  [v3 bottomRight];
  double v57 = DCTSDSubtractPoints(v53, v55, v56);
  double v59 = DCTSDMultiplyPointScalar(v57, v58, 0.33);
  double v60 = DCTSDAddPoints(v49, v51, v59);
  CGFloat v62 = v61;
  [v3 bottomRight];
  double v64 = v63;
  double v66 = v65;
  [v3 topRight];
  double v68 = v67;
  double v70 = v69;
  [v3 bottomRight];
  double v72 = DCTSDSubtractPoints(v68, v70, v71);
  double v74 = DCTSDMultiplyPointScalar(v72, v73, 0.66);
  double v75 = DCTSDAddPoints(v64, v66, v74);
  CGFloat v77 = v76;
  CGPathMoveToPoint(Mutable, 0, v144, v142);
  CGPathAddLineToPoint(Mutable, 0, v60, v62);
  CGPathMoveToPoint(Mutable, 0, v140, v138);
  CGPathAddLineToPoint(Mutable, 0, v75, v77);
  [v3 topLeft];
  double v79 = v78;
  double v81 = v80;
  [v3 topRight];
  double v83 = v82;
  double v85 = v84;
  [v3 topLeft];
  double v87 = DCTSDSubtractPoints(v83, v85, v86);
  double v89 = DCTSDMultiplyPointScalar(v87, v88, 0.33);
  double v90 = DCTSDAddPoints(v79, v81, v89);
  CGFloat v143 = v91;
  CGFloat v145 = v90;
  [v3 topLeft];
  double v93 = v92;
  double v95 = v94;
  [v3 topRight];
  double v97 = v96;
  double v99 = v98;
  [v3 topLeft];
  double v101 = DCTSDSubtractPoints(v97, v99, v100);
  double v103 = DCTSDMultiplyPointScalar(v101, v102, 0.66);
  double v104 = DCTSDAddPoints(v93, v95, v103);
  CGFloat v139 = v105;
  CGFloat v141 = v104;
  [v3 bottomLeft];
  double v107 = v106;
  double v109 = v108;
  [v3 bottomRight];
  double v111 = v110;
  double v113 = v112;
  [v3 bottomLeft];
  double v115 = DCTSDSubtractPoints(v111, v113, v114);
  double v117 = DCTSDMultiplyPointScalar(v115, v116, 0.33);
  double v118 = DCTSDAddPoints(v107, v109, v117);
  CGFloat v120 = v119;
  [v3 bottomLeft];
  double v122 = v121;
  double v124 = v123;
  [v3 bottomRight];
  double v126 = v125;
  double v128 = v127;
  [v3 bottomLeft];
  double v130 = v129;

  double v131 = DCTSDSubtractPoints(v126, v128, v130);
  double v133 = DCTSDMultiplyPointScalar(v131, v132, 0.66);
  double v134 = DCTSDAddPoints(v122, v124, v133);
  CGFloat v136 = v135;
  CGPathMoveToPoint(Mutable, 0, v145, v143);
  CGPathAddLineToPoint(Mutable, 0, v118, v120);
  CGPathMoveToPoint(Mutable, 0, v141, v139);
  CGPathAddLineToPoint(Mutable, 0, v134, v136);
  return Mutable;
}

- (id)extrudedRectFromRect:(id)a3
{
  id v3 = a3;
  [v3 topLeft];
  double v5 = v4;
  double v7 = v6;
  [v3 bottomLeft];
  double v9 = DCTSDSubtractPoints(v5, v7, v8);
  double v11 = v10;
  [v3 bottomRight];
  double v13 = v12;
  double v15 = v14;
  [v3 bottomLeft];
  double v17 = DCTSDSubtractPoints(v13, v15, v16);
  double v18 = DCTSDAddPoints(v9, v11, v17);
  double v20 = DCTSDNormalizePoint(v18, v19);
  double v101 = v21;
  double v102 = v20;
  [v3 bottomLeft];
  double v23 = v22;
  double v25 = v24;
  [v3 bottomRight];
  double v27 = DCTSDSubtractPoints(v23, v25, v26);
  double v29 = v28;
  [v3 topRight];
  double v31 = v30;
  double v33 = v32;
  [v3 bottomRight];
  double v35 = DCTSDSubtractPoints(v31, v33, v34);
  double v36 = DCTSDAddPoints(v27, v29, v35);
  double v100 = DCTSDNormalizePoint(v36, v37);
  double v39 = v38;
  [v3 topLeft];
  double v41 = v40;
  double v43 = v42;
  [v3 topRight];
  double v45 = DCTSDSubtractPoints(v41, v43, v44);
  double v47 = v46;
  [v3 bottomRight];
  double v49 = v48;
  double v51 = v50;
  [v3 topRight];
  double v53 = DCTSDSubtractPoints(v49, v51, v52);
  double v54 = DCTSDAddPoints(v45, v47, v53);
  double v56 = DCTSDNormalizePoint(v54, v55);
  double v58 = v57;
  [v3 topRight];
  double v60 = v59;
  double v62 = v61;
  [v3 topLeft];
  double v64 = DCTSDSubtractPoints(v60, v62, v63);
  double v66 = v65;
  [v3 bottomLeft];
  double v68 = v67;
  double v70 = v69;
  [v3 topLeft];
  double v72 = DCTSDSubtractPoints(v68, v70, v71);
  double v73 = DCTSDAddPoints(v64, v66, v72);
  double v75 = DCTSDNormalizePoint(v73, v74);
  double v77 = v76;
  double v78 = objc_alloc_init(ICDocCamImageQuad);
  [v3 bottomLeft];
  double v80 = v79;
  double v82 = v81;
  double v83 = DCTSDMultiplyPointScalar(v102, v101, 50.0);
  [(ICDocCamImageQuad *)v78 setBottomLeft:DCTSDSubtractPoints(v80, v82, v83)];
  [v3 bottomRight];
  double v85 = v84;
  double v87 = v86;
  double v88 = DCTSDMultiplyPointScalar(v100, v39, 50.0);
  [(ICDocCamImageQuad *)v78 setBottomRight:DCTSDSubtractPoints(v85, v87, v88)];
  [v3 topRight];
  double v90 = v89;
  double v92 = v91;
  double v93 = DCTSDMultiplyPointScalar(v56, v58, 50.0);
  [(ICDocCamImageQuad *)v78 setTopRight:DCTSDSubtractPoints(v90, v92, v93)];
  [v3 topLeft];
  double v95 = v94;
  double v97 = v96;

  double v98 = DCTSDMultiplyPointScalar(v75, v77, 50.0);
  [(ICDocCamImageQuad *)v78 setTopLeft:DCTSDSubtractPoints(v95, v97, v98)];

  return v78;
}

- (id)tintColorWithAlpha:(double)a3
{
  double v4 = [(ICDocCamOverlayView *)self tintColor];
  double v5 = [v4 colorWithAlphaComponent:a3];

  return v5;
}

- (void)updateRectangleLayerFromRect:(id)a3
{
  v48[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(ICDocCamOverlayView *)self rectangleIsActive]) {
    double v5 = 0.1;
  }
  else {
    double v5 = 0.2;
  }
  double v6 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
  double v7 = [v6 presentationLayer];
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
  }
  double v10 = v9;

  if (v4)
  {
    double v11 = [(ICDocCamOverlayView *)self newPathFromRect:v4];
    if ([(ICDocCamOverlayView *)self rectangleIsActive])
    {
      if (v10)
      {
        double v12 = CGPathRetain((CGPathRef)[v10 path]);
LABEL_16:
        double v23 = (void *)MEMORY[0x263F15AA8];
        if (v12)
        {
          double v24 = [MEMORY[0x263F15760] animationWithKeyPath:@"path"];
          [v24 setDuration:v5];
          [v24 setFromValue:v12];
          [v24 setToValue:v11];
          [v24 setFillMode:*v23];
          double v25 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
          [v25 setPath:v11];

          double v26 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
          [v26 addAnimation:v24 forKey:@"path"];

          CGPathRelease(v12);
        }
        CGPathRelease(v11);
        if (![(ICDocCamOverlayView *)self rectangleIsActive])
        {
          [(ICDocCamOverlayView *)self setRectangleIsActive:1];
          double v27 = [(ICDocCamOverlayView *)self tintColorWithAlpha:0.3];
          double v28 = [(ICDocCamOverlayView *)self tintColorWithAlpha:1.0];
          id v47 = v27;
          uint64_t v29 = [v47 CGColor];
          double v30 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
          [v30 setFillColor:v29];

          [MEMORY[0x263F158F8] begin];
          [MEMORY[0x263F158F8] setDisableActions:1];
          double v31 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeColor"];
          double v32 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeColor"];
          [v31 setDuration:0.2];
          uint64_t v33 = *MEMORY[0x263F15EB8];
          [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
          v35 = double v34 = v23;
          [v31 setTimingFunction:v35];

          [v31 setFillMode:*v34];
          objc_msgSend(v31, "setFromValue:", objc_msgSend(v10, "strokeColor"));
          id v36 = v28;
          objc_msgSend(v31, "setToValue:", objc_msgSend(v36, "CGColor"));
          [v32 setBeginTime:0.4];
          [v32 setDuration:0.7];
          double v37 = [MEMORY[0x263F15808] functionWithName:v33];
          [v32 setTimingFunction:v37];

          [v32 setFillMode:*MEMORY[0x263F15AB0]];
          id v38 = v36;
          objc_msgSend(v32, "setFromValue:", objc_msgSend(v38, "CGColor"));
          id v39 = v47;
          objc_msgSend(v32, "setToValue:", objc_msgSend(v39, "CGColor"));
          double v40 = [MEMORY[0x263F15750] animation];
          [v40 setDuration:1.1];
          v48[0] = v31;
          v48[1] = v32;
          double v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
          [v40 setAnimations:v41];

          id v42 = v39;
          uint64_t v43 = [v42 CGColor];
          double v44 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
          [v44 setStrokeColor:v43];

          double v45 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
          [v45 addAnimation:v40 forKey:@"strokeColor"];

          [MEMORY[0x263F158F8] commit];
          [(ICDocCamOverlayView *)self stopGridAnimation];
          double v46 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.4];
          [(ICDocCamOverlayView *)self setDateToStartGridAnimation:v46];
        }
        goto LABEL_20;
      }
      double v21 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
      double v22 = CGPathRetain((CGPathRef)[v21 path]);
    }
    else
    {
      double v21 = [(ICDocCamOverlayView *)self extrudedRectFromRect:v4];
      double v22 = [(ICDocCamOverlayView *)self newPathFromRect:v21];
    }
    double v12 = v22;

    goto LABEL_16;
  }
  if ([(ICDocCamOverlayView *)self rectangleIsActive])
  {
    [(ICDocCamOverlayView *)self stopGridAnimation];
    [(ICDocCamOverlayView *)self setRectangleIsActive:0];
    id v13 = [MEMORY[0x263F1C550] clearColor];
    uint64_t v14 = [v13 CGColor];
    double v15 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
    [v15 setFillColor:v14];

    double v16 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
    [v16 removeAnimationForKey:@"strokeColor"];

    double v17 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
    [v17 removeAnimationForKey:@"path"];

    id v18 = [MEMORY[0x263F1C550] clearColor];
    uint64_t v19 = [v18 CGColor];
    double v20 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
    [v20 setStrokeColor:v19];
  }
LABEL_20:
}

- (void)updateGridLayerFromRect:(id)a3
{
  id v16 = a3;
  if (![(ICDocCamOverlayView *)self rectangleIsActive])
  {
    [(ICDocCamOverlayView *)self stopGridAnimation];
    goto LABEL_10;
  }
  id v4 = [(ICDocCamOverlayView *)self rectangleGridLayer];
  double v5 = [v4 presentationLayer];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(ICDocCamOverlayView *)self rectangleGridLayer];
  }
  double v8 = v7;

  id v9 = (const CGPath *)[v8 path];
  if (!v9)
  {
    double v15 = [(ICDocCamOverlayView *)self rectangleGridLayer];
    double v10 = CGPathRetain((CGPathRef)[v15 path]);

    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  double v10 = CGPathRetain(v9);
  if (v10)
  {
LABEL_8:
    double v11 = [(ICDocCamOverlayView *)self newGridPathFromRect:v16];
    double v12 = [MEMORY[0x263F15760] animationWithKeyPath:@"path"];
    [v12 setDuration:0.1];
    [v12 setFromValue:v10];
    [v12 setToValue:v11];
    [v12 setFillMode:*MEMORY[0x263F15AA8]];
    id v13 = [(ICDocCamOverlayView *)self rectangleGridLayer];
    [v13 setPath:v11];

    uint64_t v14 = [(ICDocCamOverlayView *)self rectangleGridLayer];
    [v14 addAnimation:v12 forKey:@"path"];

    CGPathRelease(v11);
    CGPathRelease(v10);
  }
LABEL_9:

LABEL_10:
}

- (void)startGridAnimationFromRect:(id)a3
{
  id v4 = [(ICDocCamOverlayView *)self newGridPathFromRect:a3];
  double v5 = [(ICDocCamOverlayView *)self rectangleGridLayer];
  [v5 setPath:v4];

  CGPathRelease(v4);
  id v6 = [(ICDocCamOverlayView *)self tintColorWithAlpha:1.0];
  uint64_t v7 = [v6 CGColor];
  double v8 = [(ICDocCamOverlayView *)self rectangleGridLayer];
  [v8 setStrokeColor:v7];

  id v9 = [MEMORY[0x263F157D0] layer];
  [(ICDocCamOverlayView *)self bounds];
  double v12 = v10;
  double v13 = v11;
  double v14 = sqrt(v11 * v11 + v10 * v10);
  if (v10 >= v11) {
    double v15 = v10;
  }
  else {
    double v15 = v11;
  }
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v15 * v14, v15 * 0.25);
  CGAffineTransformMakeRotation(&v30, -0.785398163);
  CGAffineTransform v29 = v30;
  [v9 setAffineTransform:&v29];
  id v16 = [MEMORY[0x263EFF980] arrayWithCapacity:30];
  for (unint64_t i = 0; i != 30; ++i)
  {
    id v18 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:(double)sin((double)i * 3.14159265 / 29.0)];
    objc_msgSend(v16, "addObject:", objc_msgSend(v18, "CGColor"));
  }
  [v9 setColors:v16];
  uint64_t v19 = [(ICDocCamOverlayView *)self rectangleGridLayer];
  [v19 setMask:v9];

  [(ICDocCamOverlayView *)self setGradientMaskLayer:v9];
  double v20 = [MEMORY[0x263F15760] animationWithKeyPath:@"position"];
  [v20 setDelegate:self];
  [v20 setDuration:2.7];
  LODWORD(v21) = 1051361018;
  LODWORD(v22) = 1045220557;
  LODWORD(v23) = 1.0;
  double v24 = [MEMORY[0x263F15808] functionWithControlPoints:v21 :0.0 :v22 :v23];
  [v20 setTimingFunction:v24];

  double v25 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [v20 setFromValue:v25];

  double v26 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v12, v13);
  [v20 setToValue:v26];

  [v20 setFillMode:*MEMORY[0x263F15AA8]];
  double v27 = [(ICDocCamOverlayView *)self gradientMaskLayer];
  [v27 addAnimation:v20 forKey:@"position"];

  [(ICDocCamOverlayView *)self setGridAnimation:v20];
  double v28 = [(ICDocCamOverlayView *)self gridAnimation];
  [v28 setDelegate:self];
}

- (void)stopGridAnimation
{
  [(ICDocCamOverlayView *)self setDateToStartGridAnimation:0];
  id v3 = [(ICDocCamOverlayView *)self gridAnimation];
  [v3 setDelegate:0];

  id v4 = [MEMORY[0x263F1C550] clearColor];
  uint64_t v5 = [v4 CGColor];
  id v6 = [(ICDocCamOverlayView *)self rectangleGridLayer];
  [v6 setStrokeColor:v5];

  uint64_t v7 = [(ICDocCamOverlayView *)self gradientMaskLayer];
  [v7 removeAnimationForKey:@"position"];

  [(ICDocCamOverlayView *)self setGridAnimation:0];

  [(ICDocCamOverlayView *)self setGradientMaskLayer:0];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(ICDocCamOverlayView *)self gridAnimation];

  if (v6 == v5)
  {
    [(ICDocCamOverlayView *)self stopGridAnimation];
  }
}

- (void)setupShapeLayersIfNeeded
{
  [(ICDocCamOverlayView *)self setupRectangleLayer];

  [(ICDocCamOverlayView *)self setupGridLayers];
}

- (void)setupRectangleLayer
{
  id v3 = [(ICDocCamOverlayView *)self rectangleShapeLayer];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F15880]);
    [(ICDocCamOverlayView *)self setRectangleShapeLayer:v4];

    id v5 = [MEMORY[0x263F1C550] clearColor];
    uint64_t v6 = [v5 CGColor];
    uint64_t v7 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
    [v7 setStrokeColor:v6];

    id v8 = [MEMORY[0x263F1C550] clearColor];
    uint64_t v9 = [v8 CGColor];
    double v10 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
    [v10 setFillColor:v9];

    double v11 = [MEMORY[0x263F1C920] mainScreen];
    [v11 scale];
    double v13 = v12 * 0.5;
    double v14 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
    [v14 setLineWidth:v13];

    id v16 = [(ICDocCamOverlayView *)self layer];
    double v15 = [(ICDocCamOverlayView *)self rectangleShapeLayer];
    [v16 addSublayer:v15];
  }
}

- (void)setupGridLayers
{
  id v3 = [(ICDocCamOverlayView *)self rectangleGridLayer];

  if (!v3)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F15880]);
    id v4 = [MEMORY[0x263F1C550] clearColor];
    objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

    id v5 = [MEMORY[0x263F1C550] clearColor];
    objc_msgSend(v9, "setFillColor:", objc_msgSend(v5, "CGColor"));

    uint64_t v6 = [MEMORY[0x263F1C920] mainScreen];
    [v6 scale];
    [v9 setLineWidth:v7 * 0.5];

    id v8 = [(ICDocCamOverlayView *)self layer];
    [v8 addSublayer:v9];

    [(ICDocCamOverlayView *)self setRectangleGridLayer:v9];
  }
}

- (CATransform3D)calculateRotationTransformForPoint:(SEL)a3 toPoint:(CGPoint)a4
{
  double v6 = DCTSDNiceAngleFromDelta(a5.x - a4.x, a5.y - a4.y);

  return CATransform3DMakeRotation(retstr, v6, 0.0, 0.0, 1.0);
}

- (CGRect)previewBounds
{
  objc_copyStruct(v6, &self->_previewBounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPreviewBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_previewBounds, &v3, 32, 1, 0);
}

- (BOOL)showGridAnimation
{
  return self->_showGridAnimation;
}

- (void)setShowGridAnimation:(BOOL)a3
{
  self->_showGridAnimation = a3;
}

- (UIColor)rectColor
{
  return (UIColor *)objc_getProperty(self, a2, 448, 1);
}

- (void)setRectColor:(id)a3
{
}

- (BOOL)rectangleIsActive
{
  return self->_rectangleIsActive;
}

- (void)setRectangleIsActive:(BOOL)a3
{
  self->_rectangleIsActive = a3;
}

- (CAShapeLayer)llShapeLayer
{
  return self->_llShapeLayer;
}

- (void)setLlShapeLayer:(id)a3
{
}

- (CAShapeLayer)lrShapeLayer
{
  return self->_lrShapeLayer;
}

- (void)setLrShapeLayer:(id)a3
{
}

- (CAShapeLayer)ulShapeLayer
{
  return self->_ulShapeLayer;
}

- (void)setUlShapeLayer:(id)a3
{
}

- (CAShapeLayer)urShapeLayer
{
  return self->_urShapeLayer;
}

- (void)setUrShapeLayer:(id)a3
{
}

- (CAShapeLayer)rectangleShapeLayer
{
  return self->_rectangleShapeLayer;
}

- (void)setRectangleShapeLayer:(id)a3
{
}

- (unint64_t)numberOfMissedFrames
{
  return self->_numberOfMissedFrames;
}

- (void)setNumberOfMissedFrames:(unint64_t)a3
{
  self->_numberOfMissedFrames = a3;
}

- (UILabel)displayStringLabel
{
  return self->_displayStringLabel;
}

- (void)setDisplayStringLabel:(id)a3
{
}

- (CAShapeLayer)rectangleGridLayer
{
  return self->_rectangleGridLayer;
}

- (void)setRectangleGridLayer:(id)a3
{
}

- (NSDate)dateToStartGridAnimation
{
  return self->_dateToStartGridAnimation;
}

- (void)setDateToStartGridAnimation:(id)a3
{
}

- (CAAnimation)gridAnimation
{
  return self->_gridAnimation;
}

- (void)setGridAnimation:(id)a3
{
}

- (CAGradientLayer)gradientMaskLayer
{
  return self->_gradientMaskLayer;
}

- (void)setGradientMaskLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientMaskLayer, 0);
  objc_storeStrong((id *)&self->_gridAnimation, 0);
  objc_storeStrong((id *)&self->_dateToStartGridAnimation, 0);
  objc_storeStrong((id *)&self->_rectangleGridLayer, 0);
  objc_storeStrong((id *)&self->_displayStringLabel, 0);
  objc_storeStrong((id *)&self->_rectangleShapeLayer, 0);
  objc_storeStrong((id *)&self->_urShapeLayer, 0);
  objc_storeStrong((id *)&self->_ulShapeLayer, 0);
  objc_storeStrong((id *)&self->_lrShapeLayer, 0);
  objc_storeStrong((id *)&self->_llShapeLayer, 0);
  objc_storeStrong((id *)&self->_rectColor, 0);
  objc_storeStrong((id *)&self->_debugRects, 0);
  objc_storeStrong((id *)&self->_documentQuad, 0);
  objc_storeStrong((id *)&self->_displayString, 0);

  objc_storeStrong((id *)&self->sem, 0);
}

@end