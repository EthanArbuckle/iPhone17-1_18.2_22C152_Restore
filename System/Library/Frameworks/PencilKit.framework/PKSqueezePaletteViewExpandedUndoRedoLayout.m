@interface PKSqueezePaletteViewExpandedUndoRedoLayout
- (BOOL)isTicksFadedOutAtHead;
- (BOOL)isTicksFadedOutAtTail;
- (BOOL)isUpdateUIRunning;
- (CAShapeLayer)ornamentLayer;
- (NSLayoutConstraint)sliderButtonConstraintCenterX;
- (NSLayoutConstraint)sliderButtonConstraintCenterY;
- (NSMutableArray)tickLayers;
- (PKSqueezePaletteView)paletteView;
- (UIButtonConfiguration)originalSliderButtonConfiguration;
- (UIButtonConfiguration)sliderButtonConfiguration;
- (UINotificationFeedbackGenerator)feedbackGenerator;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (_UIHyperInteractor)hyperInteractor;
- (double)_innerRadius;
- (double)_outerRadius;
- (double)_viewCenter;
- (double)initialSliderButtonAngle;
- (double)sliderButtonAngle;
- (id)initWithContext:(void *)a3 sliderButtonConfiguration:;
- (int64_t)currentUndoIndex;
- (int64_t)initialUndoIndex;
- (int64_t)maxUndoIndex;
- (int64_t)modelUndoIndex;
- (unint64_t)senderIDForLastPanGesture;
- (void)_didTapSliderButton:(id)a3;
- (void)_fadeOutTickAtHead:(void *)a1;
- (void)_fadeOutTickAtTail:(void *)a1;
- (void)_hyperInteractorApplyPresentationPoint:(id)a3;
- (void)_panGestureHandler:(id)a3;
- (void)_resetUI;
- (void)handlePencilInteractionDidTap:(int64_t)a3;
- (void)setCurrentUndoIndex:(int64_t)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setHyperInteractor:(id)a3;
- (void)setInitialSliderButtonAngle:(double)a3;
- (void)setInitialUndoIndex:(int64_t)a3;
- (void)setIsTicksFadedOutAtHead:(BOOL)a3;
- (void)setIsTicksFadedOutAtTail:(BOOL)a3;
- (void)setIsUpdateUIRunning:(BOOL)a3;
- (void)setMaxUndoIndex:(int64_t)a3;
- (void)setModelUndoIndex:(int64_t)a3;
- (void)setOriginalSliderButtonConfiguration:(id)a3;
- (void)setOrnamentLayer:(id)a3;
- (void)setPaletteView:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setSenderIDForLastPanGesture:(unint64_t)a3;
- (void)setSliderButtonAngle:(double)a3;
- (void)setSliderButtonConfiguration:(id)a3;
- (void)setSliderButtonConstraintCenterX:(id)a3;
- (void)setSliderButtonConstraintCenterY:(id)a3;
- (void)setTickLayers:(id)a3;
- (void)updateUI;
- (void)willTransitionToLayout:(id)a3;
@end

@implementation PKSqueezePaletteViewExpandedUndoRedoLayout

- (id)initWithContext:(void *)a3 sliderButtonConfiguration:
{
  v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)PKSqueezePaletteViewExpandedUndoRedoLayout;
    v8 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 3, a2);
      objc_storeStrong(a1 + 11, a3);
      id v9 = objc_alloc(MEMORY[0x1E4FB1A00]);
      v10 = (void *)MEMORY[0x1E4FB2210];
      v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F200E1A8, &unk_1F200E1C0, 0);
      v12 = [v10 privateConfigurationForTypes:v11];
      uint64_t v13 = [v9 initWithConfiguration:v12];
      id v14 = a1[18];
      a1[18] = (id)v13;

      if (v6) {
        v15 = (void *)v6[2];
      }
      else {
        v15 = 0;
      }
      id v16 = v15;
      [v16 addTarget:a1 action:sel__panGestureHandler_];
    }
  }

  return a1;
}

- (void)_resetUI
{
  v67[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v60 = [(id)a1 paletteView];
    if (v60)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      uint64_t v3 = -[PKSqueezePaletteView _undoCount]((uint64_t)WeakRetained);

      v55 = (id *)(a1 + 16);
      id v4 = objc_loadWeakRetained((id *)(a1 + 16));
      uint64_t v5 = -[PKSqueezePaletteView _redoCount]((uint64_t)v4);

      *(void *)(a1 + 32) = v5 + v3;
      *(void *)(a1 + 40) = v5;
      *(void *)(a1 + 48) = v5;
      *(void *)(a1 + 56) = v5;
      v57 = [(id)a1 ornamentLayer];
      if (!v57)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F39C88]);
        id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1618]), "initWithWhite:alpha:", 1.0, 1.0, v55, 0);
        v57 = v6;
        objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

        v8 = [v60 layer];
        [v8 addSublayer:v6];

        [v6 setZPosition:3.0];
        [(id)a1 setOrnamentLayer:v6];
      }
      uint64_t v9 = *(void *)(a1 + 24);
      if (!v9 || (id v10 = *(id *)(v9 + 8)) == 0) {
        PKCrash();
      }
      v61 = v10;
      v11 = [v10 layer];
      [v11 setZPosition:2.0];

      [v61 center];
      double v13 = v12;
      double v15 = v14;
      double v16 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _viewCenter]((void *)a1);
      long double v18 = atan2(v15 - v17, v13 - v16);
      double v19 = fmod(v18, 6.28318531);
      if (v18 <= 6.28318531 && v18 >= 0.0) {
        double v19 = v18;
      }
      if (v19 < 0.0) {
        double v19 = v19 + 6.28318531;
      }
      if (v19 == 0.0) {
        double v19 = 0.0;
      }
      *(double *)(a1 + 64) = v19;
      *(double *)(a1 + 72) = v19;
      long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v62[0] = *MEMORY[0x1E4F1DAB8];
      v62[1] = v21;
      v62[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      objc_msgSend(v61, "setTransform:", v62, v55);
      v22 = [v61 configuration];
      uint64_t v23 = [v22 copy];
      v24 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v23;

      v25 = [(id)a1 sliderButtonConfiguration];
      [v61 setConfiguration:v25];

      v26 = [(id)a1 sliderButtonConstraintCenterX];
      LODWORD(v25) = v26 == 0;

      if (v25)
      {
        v27 = [v61 centerXAnchor];
        v28 = [v60 centerXAnchor];
        v29 = [v27 constraintEqualToAnchor:v28];
        [(id)a1 setSliderButtonConstraintCenterX:v29];

        v30 = [v61 centerYAnchor];
        v31 = [v60 centerYAnchor];
        v32 = [v30 constraintEqualToAnchor:v31];
        [(id)a1 setSliderButtonConstraintCenterY:v32];

        v33 = (void *)MEMORY[0x1E4F28DC8];
        v34 = [(id)a1 sliderButtonConstraintCenterX];
        v67[0] = v34;
        v35 = [(id)a1 sliderButtonConstraintCenterY];
        v67[1] = v35;
        v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
        [v33 activateConstraints:v36];
      }
      v37 = [v61 targetForAction:sel__didTapSliderButton_ withSender:0];
      BOOL v38 = v37 == 0;

      if (v38) {
        [v61 addTarget:a1 action:sel__didTapSliderButton_ forControlEvents:64];
      }
      v39 = [(id)a1 panGestureRecognizer];
      BOOL v40 = v39 == 0;

      if (v40)
      {
        v41 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:a1 action:sel__panGestureHandler_];
        [v61 addGestureRecognizer:v41];
        [(id)a1 setPanGestureRecognizer:v41];
      }
      v42 = (void *)[objc_alloc(MEMORY[0x1E4FB2170]) initWithDimensions:1];
      [v42 _setDelegate:a1];
      [(id)a1 setHyperInteractor:v42];
      v59 = (void *)[objc_alloc(MEMORY[0x1E4FB2160]) initWithDimensions:1];
      [v59 _setMaximumDistance:0.13962634];
      [v42 _setExtender:v59];
      v58 = (void *)[objc_alloc(MEMORY[0x1E4FB2180]) initWithDimensions:1];
      v43 = objc_opt_new();
      if (([(id)a1 maxUndoIndex] & 0x8000000000000000) == 0)
      {
        uint64_t v44 = -1;
        uint64_t v45 = MEMORY[0x1E4F143A8];
        do
        {
          v46 = (void *)[objc_alloc(MEMORY[0x1E4FB2178]) initWithDimensions:1];
          v66[0] = v45;
          v66[1] = 3221225472;
          v66[2] = __69__PKSqueezePaletteViewExpandedUndoRedoLayout__installHyperInteractor__block_invoke;
          v66[3] = &unk_1E64C58E8;
          v66[4] = a1;
          v66[5] = v44 + 1;
          [v46 _mutateValue:v66];
          [v43 addObject:v46];

          ++v44;
        }
        while (v44 < [(id)a1 maxUndoIndex]);
      }
      [v58 _setRegions:v43];
      [v42 _setRegion:v58];
      v47 = (void *)[objc_alloc(MEMORY[0x1E4FB2168]) initWithDimensions:1];
      [v42 _setAnimator:v47];
      objc_initWeak(&location, (id)a1);
      newValue[0] = MEMORY[0x1E4F143A8];
      newValue[1] = 3221225472;
      newValue[2] = __69__PKSqueezePaletteViewExpandedUndoRedoLayout__installHyperInteractor__block_invoke_2;
      newValue[3] = &unk_1E64C5998;
      objc_copyWeak(&v64, &location);
      id v48 = objc_loadWeakRetained(v56);
      v50 = v48;
      if (v48) {
        objc_setProperty_nonatomic_copy(v48, v49, newValue, 592);
      }

      objc_destroyWeak(&v64);
      objc_destroyWeak(&location);

      uint64_t v51 = *(void *)(a1 + 24);
      if (v51)
      {
        id v52 = *(id *)(v51 + 16);
        v53 = v52;
        if (v52 && ([v52 state] == 1 || objc_msgSend(v53, "state") == 2))
        {
          v54 = [(id)a1 hyperInteractor];
          [v54 _interactionBegan];
        }
      }
      else
      {
        v53 = 0;
      }
      [(id)a1 updateUI];
    }
  }
}

- (double)_viewCenter
{
  v1 = [a1 paletteView];
  [v1 bounds];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  v12.origin.x = v3;
  v12.origin.y = v5;
  v12.size.width = v7;
  v12.size.height = v9;
  double MidX = CGRectGetMidX(v12);
  v13.origin.x = v3;
  v13.origin.y = v5;
  v13.size.width = v7;
  v13.size.height = v9;
  CGRectGetMidY(v13);
  return round(MidX);
}

uint64_t __69__PKSqueezePaletteViewExpandedUndoRedoLayout__installHyperInteractor__block_invoke(uint64_t result, double *a2)
{
  CGFloat v3 = *(void **)(result + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(result + 40);
    [*(id *)(result + 32) initialSliderButtonAngle];
    double v6 = v5;
    result = [v3 initialUndoIndex];
    double v7 = v6 + (double)(v4 - result) * -0.34906585;
  }
  else
  {
    double v7 = 0.0;
  }
  *a2 = v7;
  return result;
}

void __69__PKSqueezePaletteViewExpandedUndoRedoLayout__installHyperInteractor__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [WeakRetained hyperInteractor];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __61__PKSqueezePaletteViewExpandedUndoRedoLayout__layoutSubviews__block_invoke;
    v3[3] = &unk_1E64C5910;
    v3[4] = WeakRetained;
    [v1 _mutateUnconstrainedPoint:v3];
    objc_msgSend(WeakRetained, "setSliderButtonAngle:", *(double *)objc_msgSend(v1, "_presentationPoint"));
  }
}

uint64_t __61__PKSqueezePaletteViewExpandedUndoRedoLayout__layoutSubviews__block_invoke(uint64_t a1, double *a2)
{
  CGFloat v3 = *(void **)(a1 + 32);
  uint64_t result = [v3 modelUndoIndex];
  if (v3)
  {
    uint64_t v5 = result;
    [v3 initialSliderButtonAngle];
    double v7 = v6;
    uint64_t result = [v3 initialUndoIndex];
    double v8 = v7 + (double)(v5 - result) * -0.34906585;
  }
  else
  {
    double v8 = 0.0;
  }
  *a2 = v8;
  return result;
}

- (void)setSliderButtonAngle:(double)a3
{
  self->_sliderButtonAngle = a3;
  [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self updateUI];
  uint64_t v4 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self currentUndoIndex];
  [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self sliderButtonAngle];
  double v6 = v5;
  [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialSliderButtonAngle];
  double v8 = v7
     + (double)(v4 - [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialUndoIndex] + 1)
     * -0.34906585;
  [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialSliderButtonAngle];
  double v10 = v9;
  int64_t v11 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialUndoIndex];
  if (v6 <= v8 + 0.174532925)
  {
    int64_t v13 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self maxUndoIndex];
    CGRect v12 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self paletteView];
    if (v4 >= v13) {
      goto LABEL_11;
    }
    id v20 = v12;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
    -[PKSqueezePaletteView _didUndo]((uint64_t)WeakRetained);

    [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setCurrentUndoIndex:[(PKSqueezePaletteViewExpandedUndoRedoLayout *)self currentUndoIndex] + 1];
    [v20 setNeedsLayout];
    int64_t v15 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self currentUndoIndex];
    if (v15 != [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self maxUndoIndex]) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if (v6 < v10 + (double)(v4 + ~v11) * -0.34906585 + -0.174532925)
  {
    CGRect v12 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self paletteView];
    goto LABEL_11;
  }
  CGRect v12 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self paletteView];
  if (v4 > 0)
  {
    id v20 = v12;
    id v17 = objc_loadWeakRetained((id *)&self->_paletteView);
    -[PKSqueezePaletteView _didRedo]((uint64_t)v17);

    [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setCurrentUndoIndex:[(PKSqueezePaletteViewExpandedUndoRedoLayout *)self currentUndoIndex] - 1];
    [v20 setNeedsLayout];
    if ([(PKSqueezePaletteViewExpandedUndoRedoLayout *)self currentUndoIndex])
    {
LABEL_9:
      uint64_t v16 = 1025;
      goto LABEL_10;
    }
LABEL_6:
    uint64_t v16 = 1026;
LABEL_10:
    long double v18 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self feedbackGenerator];
    unint64_t v19 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self senderIDForLastPanGesture];
    objc_msgSend(v18, "_privateNotificationOccurred:atLocation:senderID:", v16, v19, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    CGRect v12 = v20;
  }
LABEL_11:
}

- (void)_didTapSliderButton:(id)a3
{
  if (self)
  {
    context = self->_context;
    id v5 = a3;
    if (context)
    {
      previousLayout = context->_previousLayout;
      goto LABEL_4;
    }
  }
  else
  {
    id v9 = a3;
  }
  previousLayout = 0;
LABEL_4:
  double v7 = previousLayout;
  double v8 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self paletteView];
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v8, v7);

  [a3 removeTarget:self action:sel__didTapSliderButton_ forControlEvents:64];
}

- (double)_outerRadius
{
  v1 = [a1 paletteView];
  if (v1) {
    double v2 = v1[62];
  }
  else {
    double v2 = 0.0;
  }
  double v3 = *(double *)&PKSqueezePaletteViewContentHeight;

  return v2 + v3 * 0.5;
}

- (double)_innerRadius
{
  v1 = [a1 paletteView];
  if (v1) {
    double v2 = v1[62];
  }
  else {
    double v2 = 0.0;
  }
  double v3 = *(double *)&PKSqueezePaletteViewContentHeight;

  return v2 + v3 * -0.5;
}

- (void)updateUI
{
  if ([(PKSqueezePaletteViewExpandedUndoRedoLayout *)self isUpdateUIRunning]) {
    return;
  }
  if (!self)
  {
    [0 setIsUpdateUIRunning:1];
    goto LABEL_60;
  }
  double v3 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self paletteView];
  uint64_t v4 = -[PKSqueezePaletteView _undoCount]((uint64_t)v3);
  uint64_t v5 = -[PKSqueezePaletteView _redoCount]((uint64_t)v3);
  if ([(PKSqueezePaletteViewExpandedUndoRedoLayout *)self maxUndoIndex] == v5 + v4)
  {
    int64_t v6 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self currentUndoIndex];

    if (v6 == v5)
    {
      [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setIsUpdateUIRunning:1];
      [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialSliderButtonAngle];
      double v8 = v7
         + (double)-[(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialUndoIndex]
         * -0.34906585;
      int64_t v9 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self maxUndoIndex];
      [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialSliderButtonAngle];
      double v11 = v10
          + (double)(v9 - [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialUndoIndex])
          * -0.34906585;
      [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self sliderButtonAngle];
      double v13 = v12;
      int64_t v14 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self maxUndoIndex];
      if (v8 >= v13)
      {
        if (v11 <= v13)
        {
          int v15 = 1;
          double v13 = v8;
        }
        else
        {
          int v15 = 0;
          double v17 = v11 - v13;
          if (v14 != 17) {
            double v17 = 0.0;
          }
          double v11 = v13;
          double v13 = v8 - v17;
        }
      }
      else
      {
        int v15 = 0;
        double v16 = v13 - v8;
        if (v14 != 17) {
          double v16 = -0.0;
        }
        double v11 = v11 + v16;
      }
      double v18 = vabdd_f64(v11, v13);
      if (v18 >= 6.28318531) {
        double v19 = 0.0;
      }
      else {
        double v19 = v11;
      }
      if (v18 >= 6.28318531) {
        double v20 = 6.28318531;
      }
      else {
        double v20 = v13;
      }
      if (v18 >= 6.28318531
        || (int64_t v21 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self maxUndoIndex],
            v21 - [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialUndoIndex] >= 11))
      {
        int v15 = 0;
      }
      v22 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self paletteView];
      -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v22, 1, v15, v19, v20);

      uint64_t v23 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self ornamentLayer];
      if (v23)
      {
        double v24 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
        CGFloat v25 = v24 - -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self);
        objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, -[PKSqueezePaletteViewExpandedUndoRedoLayout _viewCenter](self));
        id v26 = objc_claimAutoreleasedReturnValue();
        v27 = (const CGPath *)[v26 CGPath];
        [v23 miterLimit];
        CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v27, 0, v25, (CGLineCap)(v18 < 6.28318531), kCGLineJoinMiter, v28);
        id v30 = v26;
        v31 = (const CGPath *)[v30 CGPath];
        [v23 miterLimit];
        v33 = CGPathCreateCopyByStrokingPath(v31, 0, v25 + v24 * -0.025, (CGLineCap)(v18 < 6.28318531), kCGLineJoinMiter, v32);
        CopyBySubtractingPath = CGPathCreateCopyBySubtractingPath(CopyByStrokingPath, v33, 1);
        CGPathRelease(CopyByStrokingPath);
        CGPathRelease(v33);
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        [v23 setPath:CopyBySubtractingPath];
        [MEMORY[0x1E4F39CF8] commit];
        CGPathRelease(CopyBySubtractingPath);
      }
      uint64_t v35 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self paletteView];
      v36 = (double *)MEMORY[0x1E4F1DAD8];
      if (v35)
      {
        v37 = (id *)v35;
        BOOL v38 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self tickLayers];
        uint64_t v39 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self maxUndoIndex];
        uint64_t v40 = 17;
        if (v39 < 17) {
          uint64_t v40 = v39;
        }
        uint64_t v41 = v40 + 1;
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        if ([v38 count] != v41)
        {
          [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setIsTicksFadedOutAtHead:0];
          [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setIsTicksFadedOutAtTail:0];
          if (!v38) {
            BOOL v38 = objc_opt_new();
          }
          [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setTickLayers:v38];
          [v38 makeObjectsPerformSelector:sel_removeFromSuperlayer];
          [v38 removeAllObjects];
          if (v41)
          {
            uint64_t v42 = v41;
            v43 = v37;
            uint64_t v101 = v42;
            uint64_t v44 = v42;
            do
            {
              uint64_t v45 = [MEMORY[0x1E4F39C88] layer];
              id v46 = [MEMORY[0x1E4FB1618] colorWithWhite:0.83 alpha:1.0];
              objc_msgSend(v45, "setFillColor:", objc_msgSend(v46, "CGColor"));

              objc_msgSend(v45, "setAnchorPoint:", 0.5, 0.5);
              [v45 setZPosition:1.0];
              id v47 = v43[69];
              id v48 = [v47 layer];
              [v48 addSublayer:v45];

              [v38 addObject:v45];
              --v44;
            }
            while (v44);
            v36 = (double *)MEMORY[0x1E4F1DAD8];
            v37 = v43;
            uint64_t v41 = v101;
          }
        }
        double v49 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _viewCenter](self);
        double v102 = v50;
        double v51 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
        double v52 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
        double v53 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self);
        if (v41)
        {
          double v100 = v51 + (v52 - v53) * -0.5;
          double v54 = DKDRoundedRectForScale(0.0, 0.0, v51 * 0.1156, v51 * 0.1156 * 0.18, 1.0);
          double v56 = v55;
          double v58 = v57;
          double v60 = v59;
          uint64_t v61 = 0;
          double v63 = *v36;
          double v62 = v36[1];
          do
          {
            id v64 = [v38 objectAtIndex:v61];
            objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v54, v56, v58, v60, 2.0);
            id v65 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setPath:", objc_msgSend(v65, "CGPath"));

            objc_msgSend(v64, "setPosition:", v49, v102);
            objc_msgSend(v64, "setBounds:", v54, v56, v58, v60);
            [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialSliderButtonAngle];
            double v66 = v49;
            double v68 = v67
                + (double)(v61 - [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialUndoIndex])* -0.34906585;
            double v69 = PKPointOnArc(v63, v62, v100, v68);
            memset(&v105, 0, sizeof(v105));
            CATransform3DMakeTranslation(&v105, v69, v70, 0.0);
            CATransform3D v103 = v105;
            CGFloat v71 = v68;
            double v49 = v66;
            CATransform3DRotate(&v104, &v103, v71, 0.0, 0.0, 1.0);
            CATransform3D v105 = v104;
            [v64 setTransform:&v104];

            ++v61;
          }
          while (v41 != v61);
        }
        objc_msgSend(MEMORY[0x1E4F39CF8], "commit", v53);
      }
      context = self->_context;
      if (context)
      {
        v73 = context->_sliderButton;
        if (v73)
        {
          double v74 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
          double v75 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self);
          double v76 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
          double v77 = (v74 - v75) * 0.5
              - (v76 - -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self)) * 0.88 * 0.5;
          double v78 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _outerRadius](self);
          double v79 = (v78 - -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self)) * 0.88 * 0.5;
          double v80 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _innerRadius](self) + v77 + v79;
          [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self sliderButtonAngle];
          double v82 = PKPointOnArc(*v36, v36[1], v80, v81);
          double v84 = v83;
          v85 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self sliderButtonConstraintCenterX];
          [v85 setConstant:v82];

          v86 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self sliderButtonConstraintCenterY];
          [v86 setConstant:v84];
        }
      }
      else
      {
        v73 = 0;
      }

      uint64_t v87 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self maxUndoIndex];
      if (v87 < 18) {
        goto LABEL_60;
      }
      uint64_t v88 = v87;
      [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self sliderButtonAngle];
      double v90 = v89;
      [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialSliderButtonAngle];
      double v92 = v91
          + (double)-[(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialUndoIndex]
          * -0.34906585;
      [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialSliderButtonAngle];
      double v94 = v93;
      int64_t v95 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialUndoIndex];
      double v96 = v92 + -3.14159265;
      if (v90 > v92
        || v90 <= v96
        || [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self isTicksFadedOutAtHead])
      {
        double v97 = v94 + (double)(v88 - v95) * -0.34906585 + 3.14159265;
        if (v90 > v96
          || v90 <= v97
          || ![(PKSqueezePaletteViewExpandedUndoRedoLayout *)self isTicksFadedOutAtHead]
          && ![(PKSqueezePaletteViewExpandedUndoRedoLayout *)self isTicksFadedOutAtTail])
        {
          if (v90 <= v97
            && ![(PKSqueezePaletteViewExpandedUndoRedoLayout *)self isTicksFadedOutAtTail])
          {
            -[PKSqueezePaletteViewExpandedUndoRedoLayout _fadeOutTickAtTail:](self, 1);
            -[PKSqueezePaletteViewExpandedUndoRedoLayout _fadeOutTickAtHead:](self, 0);
          }
          goto LABEL_60;
        }
        v98 = self;
        uint64_t v99 = 0;
      }
      else
      {
        v98 = self;
        uint64_t v99 = 1;
      }
      -[PKSqueezePaletteViewExpandedUndoRedoLayout _fadeOutTickAtHead:](v98, v99);
      -[PKSqueezePaletteViewExpandedUndoRedoLayout _fadeOutTickAtTail:](self, 0);
LABEL_60:
      [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setIsUpdateUIRunning:0];
      return;
    }
  }
  else
  {
  }

  -[PKSqueezePaletteViewExpandedUndoRedoLayout _resetUI]((uint64_t)self);
}

- (void)willTransitionToLayout:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self ornamentLayer];
  [v4 removeFromSuperlayer];

  [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setOrnamentLayer:0];
  uint64_t v5 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self tickLayers];
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_1];

  [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setTickLayers:0];
  int64_t v6 = (void *)MEMORY[0x1E4F28DC8];
  double v7 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self sliderButtonConstraintCenterX];
  v13[0] = v7;
  double v8 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self sliderButtonConstraintCenterY];
  v13[1] = v8;
  int64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v6 deactivateConstraints:v9];

  [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setSliderButtonConstraintCenterX:0];
  [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setSliderButtonConstraintCenterY:0];
  double v10 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self originalSliderButtonConfiguration];
  if (self)
  {
    context = self->_context;
    if (context) {
      context = (PKSqueezePaletteViewExpandedUndoRedoLayoutContext *)context->_sliderButton;
    }
  }
  else
  {
    context = 0;
  }
  double v12 = context;
  [(PKSqueezePaletteViewExpandedUndoRedoLayoutContext *)v12 setConfiguration:v10];

  [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setHyperInteractor:0];
}

uint64_t __69__PKSqueezePaletteViewExpandedUndoRedoLayout_willTransitionToLayout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperlayer];
}

- (void)handlePencilInteractionDidTap:(int64_t)a3
{
  context = self->_context;
  if (context) {
    context = (PKSqueezePaletteViewExpandedUndoRedoLayoutContext *)context->_previousLayout;
  }
  int64_t v6 = context;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)WeakRetained, v6);
}

- (void)_panGestureHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self paletteView];
  if (v5)
  {
    uint64_t v6 = [v4 state];
    double v7 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self hyperInteractor];
    double v8 = v7;
    if ((unint64_t)(v6 - 3) < 2)
    {
      CGFloat v32 = (double *)[v7 _projectedPoint];
      if (self)
      {
        double v33 = *v32;
        [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialSliderButtonAngle];
        uint64_t v35 = (uint64_t)((v34
                       + (double)-[(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialUndoIndex]* -0.34906585- v33+ 0.174532925)/ 0.34906585);
        int64_t v36 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self maxUndoIndex];
        if (v36 >= v35) {
          uint64_t v37 = v35;
        }
        else {
          uint64_t v37 = v36;
        }
        uint64_t v38 = v37 & ~(v37 >> 63);
      }
      else
      {
        uint64_t v38 = 0;
      }
      [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setModelUndoIndex:v38];
      [v8 _interactionEnded];
    }
    else
    {
      if (v6 == 2)
      {
LABEL_6:
        [v4 locationInView:v5];
        if (self)
        {
          double v11 = v9;
          double v12 = v10;
          double v13 = -[PKSqueezePaletteViewExpandedUndoRedoLayout _viewCenter](self);
          long double v15 = atan2(v12 - v14, v11 - v13);
          double v16 = fmod(v15, 6.28318531);
          if (v15 <= 6.28318531 && v15 >= 0.0) {
            double v16 = v15;
          }
          if (v16 < 0.0) {
            double v16 = v16 + 6.28318531;
          }
          if (v16 == 0.0) {
            double v18 = 0.0;
          }
          else {
            double v18 = v16;
          }
          [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self sliderButtonAngle];
          uint64_t v20 = (uint64_t)(v19 / 6.28318531);
          double v21 = v18 + (double)(v20 + 1) * 6.28318531;
          double v22 = v18 + (double)v20 * 6.28318531;
          double v23 = vabdd_f64(v21, v19);
          double v24 = vabdd_f64(v22, v19);
          double v25 = vabdd_f64(v18 + (double)(v20 - 1) * 6.28318531, v19);
          if (v23 >= v25) {
            double v21 = v18 + (double)(v20 - 1) * 6.28318531;
          }
          if (v24 >= v25) {
            double v22 = v18 + (double)(v20 - 1) * 6.28318531;
          }
          if (v23 < v24) {
            double v22 = v21;
          }
          if (vabdd_f64(v22, v19) <= 3.14159265) {
            double v26 = v22;
          }
          else {
            double v26 = v19;
          }
          int64_t v27 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self modelUndoIndex];
          [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialSliderButtonAngle];
          double v29 = v26
              - (v28
               + (double)(v27 - [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self initialUndoIndex])
               * -0.34906585);
        }
        else
        {
          [0 modelUndoIndex];
          double v29 = 0.0;
        }
        id v30 = [v4 _activeEvents];
        v31 = [v30 anyObject];

        [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setSenderIDForLastPanGesture:0];
        if ([v31 _hidEvent])
        {
          [v31 _hidEvent];
          [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self setSenderIDForLastPanGesture:IOHIDEventGetSenderID()];
        }
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __65__PKSqueezePaletteViewExpandedUndoRedoLayout__panGestureHandler___block_invoke;
        v39[3] = &__block_descriptor_40_e9_v16__0_d8l;
        *(double *)&v39[4] = v29;
        [v8 _interactionChangedMutatingTranslation:v39 velocity:&__block_literal_global_28];

        goto LABEL_36;
      }
      if (v6 == 1)
      {
        [v7 _interactionBegan];
        goto LABEL_6;
      }
    }
LABEL_36:
  }
}

double __65__PKSqueezePaletteViewExpandedUndoRedoLayout__panGestureHandler___block_invoke(uint64_t a1, double *a2)
{
  double result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

void __65__PKSqueezePaletteViewExpandedUndoRedoLayout__panGestureHandler___block_invoke_2(uint64_t a1, void *a2)
{
  *a2 = 0;
}

- (void)_fadeOutTickAtHead:(void *)a1
{
  if ([a1 isTicksFadedOutAtHead] != a2)
  {
    [a1 setIsTicksFadedOutAtHead:a2];
    unint64_t v4 = 1;
    for (uint64_t i = 17; i != 13; --i)
    {
      if (a2) {
        double v6 = (double)v4 * 0.1;
      }
      else {
        double v6 = 1.0;
      }
      double v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.83 alpha:v6];
      double v8 = [a1 tickLayers];
      double v9 = [v8 objectAtIndex:i];
      id v10 = v7;
      objc_msgSend(v9, "setFillColor:", objc_msgSend(v10, "CGColor"));

      ++v4;
    }
  }
}

- (void)_fadeOutTickAtTail:(void *)a1
{
  if ([a1 isTicksFadedOutAtTail] != a2)
  {
    [a1 setIsTicksFadedOutAtTail:a2];
    uint64_t v4 = [a1 maxUndoIndex];
    unint64_t v5 = v4 + 1;
    for (unint64_t i = 1; i != 5; ++i)
    {
      if (a2) {
        double v7 = (double)i * 0.1;
      }
      else {
        double v7 = 1.0;
      }
      double v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.83 alpha:v7];
      double v9 = [a1 tickLayers];
      id v10 = [v9 objectAtIndex:i + v4 - 18 * (v5 / 0x12)];
      id v11 = v8;
      objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

      ++v5;
    }
  }
}

- (void)_hyperInteractorApplyPresentationPoint:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self hyperInteractor];

  if (v5 == v4)
  {
    double v6 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self paletteView];
    [v6 setNeedsLayout];

    id v7 = [(PKSqueezePaletteViewExpandedUndoRedoLayout *)self paletteView];
    [v7 layoutIfNeeded];
  }
}

- (PKSqueezePaletteView)paletteView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  return (PKSqueezePaletteView *)WeakRetained;
}

- (void)setPaletteView:(id)a3
{
}

- (int64_t)maxUndoIndex
{
  return self->_maxUndoIndex;
}

- (void)setMaxUndoIndex:(int64_t)a3
{
  self->_maxUndoIndex = a3;
}

- (int64_t)currentUndoIndex
{
  return self->_currentUndoIndex;
}

- (void)setCurrentUndoIndex:(int64_t)a3
{
  self->_currentUndoIndex = a3;
}

- (int64_t)modelUndoIndex
{
  return self->_modelUndoIndex;
}

- (void)setModelUndoIndex:(int64_t)a3
{
  self->_modelUndoIndex = a3;
}

- (int64_t)initialUndoIndex
{
  return self->_initialUndoIndex;
}

- (void)setInitialUndoIndex:(int64_t)a3
{
  self->_initialUndoIndex = a3;
}

- (double)sliderButtonAngle
{
  return self->_sliderButtonAngle;
}

- (double)initialSliderButtonAngle
{
  return self->_initialSliderButtonAngle;
}

- (void)setInitialSliderButtonAngle:(double)a3
{
  self->_initialSliderButtonAngle = a3;
}

- (UIButtonConfiguration)originalSliderButtonConfiguration
{
  return self->_originalSliderButtonConfiguration;
}

- (void)setOriginalSliderButtonConfiguration:(id)a3
{
}

- (UIButtonConfiguration)sliderButtonConfiguration
{
  return self->_sliderButtonConfiguration;
}

- (void)setSliderButtonConfiguration:(id)a3
{
}

- (CAShapeLayer)ornamentLayer
{
  return self->_ornamentLayer;
}

- (void)setOrnamentLayer:(id)a3
{
}

- (NSMutableArray)tickLayers
{
  return self->_tickLayers;
}

- (void)setTickLayers:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (BOOL)isTicksFadedOutAtHead
{
  return self->_isTicksFadedOutAtHead;
}

- (void)setIsTicksFadedOutAtHead:(BOOL)a3
{
  self->_isTicksFadedOutAtHead = a3;
}

- (BOOL)isTicksFadedOutAtTail
{
  return self->_isTicksFadedOutAtTail;
}

- (void)setIsTicksFadedOutAtTail:(BOOL)a3
{
  self->_isTicksFadedOutAtTail = a3;
}

- (BOOL)isUpdateUIRunning
{
  return self->_isUpdateUIRunning;
}

- (void)setIsUpdateUIRunning:(BOOL)a3
{
  self->_isUpdateUIRunning = a3;
}

- (NSLayoutConstraint)sliderButtonConstraintCenterX
{
  return self->_sliderButtonConstraintCenterX;
}

- (void)setSliderButtonConstraintCenterX:(id)a3
{
}

- (NSLayoutConstraint)sliderButtonConstraintCenterY
{
  return self->_sliderButtonConstraintCenterY;
}

- (void)setSliderButtonConstraintCenterY:(id)a3
{
}

- (_UIHyperInteractor)hyperInteractor
{
  return self->_hyperInteractor;
}

- (void)setHyperInteractor:(id)a3
{
}

- (UINotificationFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (unint64_t)senderIDForLastPanGesture
{
  return self->_senderIDForLastPanGesture;
}

- (void)setSenderIDForLastPanGesture:(unint64_t)a3
{
  self->_senderIDForLastPanGesture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_hyperInteractor, 0);
  objc_storeStrong((id *)&self->_sliderButtonConstraintCenterY, 0);
  objc_storeStrong((id *)&self->_sliderButtonConstraintCenterX, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tickLayers, 0);
  objc_storeStrong((id *)&self->_ornamentLayer, 0);
  objc_storeStrong((id *)&self->_sliderButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_originalSliderButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_paletteView);
}

@end