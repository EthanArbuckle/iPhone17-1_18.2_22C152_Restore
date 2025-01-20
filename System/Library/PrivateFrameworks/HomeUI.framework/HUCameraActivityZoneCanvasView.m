@interface HUCameraActivityZoneCanvasView
- (BOOL)canBecomeFirstResponder;
- (BOOL)canCreateActivityZone;
- (BOOL)currentZonesIntersectPoint:(CGPoint)a3;
- (BOOL)currentZonesIntersectSegmentFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
- (BOOL)displaysInclusionZones;
- (BOOL)isCreatingActivityZone;
- (BOOL)isEditingActivityZone;
- (BOOL)isValidPointInView:(CGPoint)a3;
- (CGPoint)_hmPointToCGPoint:(id)a3;
- (CGPoint)_normalizedPointForPoint:(CGPoint)a3;
- (HMPoint)startingTouchPoint;
- (HUCameraActivityZoneCanvasDelegate)delegate;
- (HUCameraActivityZoneCanvasView)initWithFrame:(CGRect)a3;
- (NSMutableArray)activityZones;
- (NSMutableArray)currentActivityZone;
- (UIImageView)canvasView;
- (id)_hmPointForTapPoint:(CGPoint)a3;
- (id)activityZoneContainingPoint:(CGPoint)a3;
- (id)selectedActivityZoneAtPoint:(CGPoint)a3;
- (int64_t)currentTouchPointIndex;
- (void)_addTouchpointAtPoint:(CGPoint)a3 inContext:(CGContext *)a4 withRed:(double)a5 green:(double)a6 blue:(double)a7;
- (void)_displayMenuForActivityZone:(id)a3;
- (void)_drawPolygonWithMaskPath:(id)a3;
- (void)_drawTouchPoints;
- (void)_editActivityZone:(id)a3;
- (void)_finishEditingCurrentActivityZone;
- (void)_handleBeginForGesture:(id)a3;
- (void)_handleChangeForGesture:(id)a3;
- (void)_handleEndForGesture:(id)a3;
- (void)_prepCurrentActivityZoneForDeselection;
- (void)_resetCanvasAndCurrentZone;
- (void)clearActivityZone;
- (void)createActivityZone;
- (void)didPan:(id)a3;
- (void)didTap:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)loadActivityZones:(id)a3;
- (void)preventAttemptToMovePoint;
- (void)setCanvasView:(id)a3;
- (void)setCurrentActivityZone:(id)a3;
- (void)setCurrentTouchPointIndex:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplaysInclusionZones:(BOOL)a3;
- (void)setEditingActivityZone:(BOOL)a3;
- (void)setStartingTouchPoint:(id)a3;
- (void)updateAfterVideoBoundsChange;
@end

@implementation HUCameraActivityZoneCanvasView

- (HUCameraActivityZoneCanvasView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HUCameraActivityZoneCanvasView;
  v3 = -[HUCameraActivityZoneCanvasView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activityZones = v3->_activityZones;
    v3->_activityZones = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    currentActivityZone = v3->_currentActivityZone;
    v3->_currentActivityZone = v6;

    [(HUCameraActivityZoneCanvasView *)v3 setClipsToBounds:0];
    v8 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUCameraActivityZoneCanvasView *)v3 setBackgroundColor:v8];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel_didTap_];
    [v9 setNumberOfTapsRequired:1];
    [(HUCameraActivityZoneCanvasView *)v3 addGestureRecognizer:v9];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:v3 action:sel_didPan_];
    [v10 setMaximumNumberOfTouches:1];
    [(HUCameraActivityZoneCanvasView *)v3 addGestureRecognizer:v10];
    [(HUCameraActivityZoneCanvasView *)v3 bounds];
    CGRect v17 = CGRectInset(v16, -20.0, -20.0);
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
    canvasView = v3->_canvasView;
    v3->_canvasView = (UIImageView *)v11;

    [(UIImageView *)v3->_canvasView setAutoresizingMask:18];
    v13 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIImageView *)v3->_canvasView setBackgroundColor:v13];

    [(HUCameraActivityZoneCanvasView *)v3 center];
    -[UIImageView setCenter:](v3->_canvasView, "setCenter:");
    [(UIImageView *)v3->_canvasView setUserInteractionEnabled:0];
    [(HUCameraActivityZoneCanvasView *)v3 addSubview:v3->_canvasView];
  }
  return v3;
}

- (void)updateAfterVideoBoundsChange
{
  [(HUCameraActivityZoneCanvasView *)self _drawTouchPoints];

  [(HUCameraActivityZoneCanvasView *)self setNeedsDisplay];
}

- (void)_drawPolygonWithMaskPath:(id)a3
{
  id v4 = a3;
  v5 = [(HUCameraActivityZoneCanvasView *)self activityZones];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HUCameraActivityZoneCanvasView__drawPolygonWithMaskPath___block_invoke;
  v7[3] = &unk_1E6392350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __59__HUCameraActivityZoneCanvasView__drawPolygonWithMaskPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F427D0] bezierPath];
  [v4 setLineWidth:4.0];
  [v4 setLineJoinStyle:1];
  [v4 setLineCapStyle:1];
  uint64_t v5 = [v3 count];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HUCameraActivityZoneCanvasView__drawPolygonWithMaskPath___block_invoke_2;
  v10[3] = &unk_1E6392328;
  id v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v14 = v5;
  id v12 = v3;
  id v13 = v6;
  id v7 = v3;
  id v8 = v4;
  [v7 enumerateObjectsUsingBlock:v10];
  v9 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  [v9 setStroke];

  [v8 stroke];
}

void __59__HUCameraActivityZoneCanvasView__drawPolygonWithMaskPath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _hmPointToCGPoint:a2];
  double v6 = v5;
  double v8 = v7;
  if (a3)
  {
    if (*(void *)(a1 + 64) - 1 == a3)
    {
      if ([*(id *)(a1 + 32) isEditingActivityZone]) {
        objc_msgSend(*(id *)(a1 + 40), "addLineToPoint:", v6, v8);
      }
      id v13 = [*(id *)(a1 + 48) objectAtIndex:0];
      objc_msgSend(*(id *)(a1 + 32), "_hmPointToCGPoint:");
      objc_msgSend(*(id *)(a1 + 40), "addLineToPoint:");
      if (*(void *)(a1 + 56))
      {
        int v9 = [*(id *)(a1 + 32) displaysInclusionZones];
        v10 = *(void **)(a1 + 56);
        if (v9)
        {
          [v10 closePath];
          [*(id *)(a1 + 56) appendPath:*(void *)(a1 + 40)];
LABEL_17:

          return;
        }
        if (v10) {
          goto LABEL_17;
        }
      }
      if (([*(id *)(a1 + 32) displaysInclusionZones] & 1) == 0) {
        [*(id *)(a1 + 40) fill];
      }
      goto LABEL_17;
    }
    id v12 = *(void **)(a1 + 40);
    objc_msgSend(v12, "addLineToPoint:");
  }
  else
  {
    id v11 = *(void **)(a1 + 40);
    objc_msgSend(v11, "moveToPoint:");
  }
}

- (void)drawRect:(CGRect)a3
{
  id v4 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
  [v4 setFill];

  double v5 = (void *)MEMORY[0x1E4F427D0];
  [(HUCameraActivityZoneCanvasView *)self bounds];
  objc_msgSend(v5, "bezierPathWithRect:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 setUsesEvenOddFillRule:1];
  [(HUCameraActivityZoneCanvasView *)self _drawPolygonWithMaskPath:v8];
  if ([(HUCameraActivityZoneCanvasView *)self displaysInclusionZones])
  {
    double v6 = [(HUCameraActivityZoneCanvasView *)self activityZones];
    uint64_t v7 = [v6 count];

    if (v7) {
      [v8 fill];
    }
  }
  [(HUCameraActivityZoneCanvasView *)self _drawPolygonWithMaskPath:0];
}

- (void)_drawTouchPoints
{
  CGFloat v28 = 0.0;
  CGFloat v29 = 0.0;
  CGFloat v27 = 0.0;
  id v3 = [MEMORY[0x1E4F428B8] systemYellowColor];
  [v3 getRed:&v29 green:&v28 blue:&v27 alpha:0];

  CGFloat v25 = 0.0;
  CGFloat v26 = 0.0;
  CGFloat blue = 0.0;
  id v4 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  [v4 getRed:&v26 green:&v25 blue:&blue alpha:0];

  double v5 = [(HUCameraActivityZoneCanvasView *)self canvasView];
  [v5 bounds];
  v30.width = v6;
  v30.height = v7;
  UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetRGBFillColor(CurrentContext, v29, v28, v27, 0.5);
  CGContextSetLineWidth(CurrentContext, 4.0);
  int v9 = [MEMORY[0x1E4F427D0] bezierPath];
  [v9 setLineJoinStyle:1];
  [v9 setLineCapStyle:1];
  v10 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  CGRect v16 = __50__HUCameraActivityZoneCanvasView__drawTouchPoints__block_invoke;
  CGRect v17 = &unk_1E6392378;
  id v18 = v9;
  v19 = self;
  v20 = CurrentContext;
  CGFloat v21 = v29;
  CGFloat v22 = v28;
  CGFloat v23 = v27;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:&v14];

  CGContextSetRGBStrokeColor(CurrentContext, v26, v25, blue, 1.0);
  objc_msgSend(v11, "stroke", v14, v15, v16, v17);
  id v12 = UIGraphicsGetImageFromCurrentImageContext();
  id v13 = [(HUCameraActivityZoneCanvasView *)self canvasView];
  [v13 setImage:v12];

  UIGraphicsEndImageContext();
}

uint64_t __50__HUCameraActivityZoneCanvasView__drawTouchPoints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setLineWidth:4.0];
  [*(id *)(a1 + 40) _hmPointToCGPoint:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8 + 20.0;
  double v12 = v10 + 20.0;
  id v13 = *(void **)(a1 + 32);
  if (a3) {
    objc_msgSend(v13, "addLineToPoint:", v11, v12);
  }
  else {
    objc_msgSend(v13, "moveToPoint:", v11, v12);
  }
  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  double v16 = *(double *)(a1 + 56);
  double v17 = *(double *)(a1 + 64);
  double v18 = *(double *)(a1 + 72);

  return objc_msgSend(v14, "_addTouchpointAtPoint:inContext:withRed:green:blue:", v15, v11, v12, v16, v17, v18);
}

- (void)loadActivityZones:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Load activity zones:%@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HUCameraActivityZoneCanvasView_loadActivityZones___block_invoke;
  v6[3] = &unk_1E63923A0;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6];
  [(HUCameraActivityZoneCanvasView *)self setNeedsDisplay];
}

void __52__HUCameraActivityZoneCanvasView_loadActivityZones___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v7 = objc_alloc_init(v3);
  double v5 = [v4 points];

  [v7 addObjectsFromArray:v5];
  id v6 = [*(id *)(a1 + 32) activityZones];
  [v6 addObject:v7];
}

- (BOOL)canCreateActivityZone
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__36;
  v12[4] = __Block_byref_object_dispose__36;
  id v13 = [MEMORY[0x1E4F427D0] bezierPath];
  id v3 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke;
  v11[3] = &unk_1E6386DF8;
  v11[4] = self;
  v11[5] = v12;
  [v3 enumerateObjectsUsingBlock:v11];

  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [(HUCameraActivityZoneCanvasView *)self activityZones];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke_2;
  v6[3] = &unk_1E63923F0;
  v6[4] = self;
  void v6[5] = v12;
  v6[6] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];

  LOBYTE(self) = *((unsigned char *)v8 + 24) == 0;
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v12, 8);

  return (char)self;
}

uint64_t __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _hmPointToCGPoint:a2];
  double v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (a3)
  {
    return objc_msgSend(v5, "addLineToPoint:");
  }
  else
  {
    return objc_msgSend(v5, "moveToPoint:");
  }
}

uint64_t __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke_3;
  v3[3] = &unk_1E63923C8;
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  return [a2 enumerateObjectsUsingBlock:v3];
}

uint64_t __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  [*(id *)(a1 + 32) _hmPointToCGPoint:a2];
  uint64_t result = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "containsPoint:");
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)createActivityZone
{
  BOOL v3 = [(HUCameraActivityZoneCanvasView *)self canCreateActivityZone];
  long long v4 = HFLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Create activity zone.", v14, 2u);
    }

    id v6 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    uint64_t v7 = [v6 firstObject];

    id v8 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    uint64_t v9 = (void *)[v7 copy];
    [v8 addObject:v9];

    char v10 = [(HUCameraActivityZoneCanvasView *)self activityZones];
    double v11 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    double v12 = (void *)[v11 mutableCopy];
    [v10 addObject:v12];

    [(HUCameraActivityZoneCanvasView *)self _resetCanvasAndCurrentZone];
    [(HUCameraActivityZoneCanvasView *)self setNeedsDisplay];
    id v13 = [(HUCameraActivityZoneCanvasView *)self delegate];
    [v13 didUpdateActivityZoneCanvas:self];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Unable to create activity zone.", buf, 2u);
    }

    uint64_t v7 = [(HUCameraActivityZoneCanvasView *)self delegate];
    [v7 didAttemptToCreateOverlappingZoneForCanvas:self];
  }
}

- (id)_hmPointForTapPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__36;
  uint64_t v14 = __Block_byref_object_dispose__36;
  id v15 = 0;
  id v6 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HUCameraActivityZoneCanvasView__hmPointForTapPoint___block_invoke;
  v9[3] = &unk_1E6392418;
  *(CGFloat *)&v9[6] = x;
  *(CGFloat *)&v9[7] = y;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __54__HUCameraActivityZoneCanvasView__hmPointForTapPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_hmPointToCGPoint:");
  *(float *)&double v7 = v7 - *(double *)(a1 + 48);
  *(float *)&double v8 = v8 - *(double *)(a1 + 56);
  if (hypotf(*(float *)&v7, *(float *)&v8) <= 34.0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    UIGraphicsEndImageContext();
    *a4 = 1;
  }
}

- (void)_resetCanvasAndCurrentZone
{
  [(HUCameraActivityZoneCanvasView *)self setEditingActivityZone:0];
  [(HUCameraActivityZoneCanvasView *)self setCurrentActivityZone:0];
  id v3 = [(HUCameraActivityZoneCanvasView *)self canvasView];
  [v3 setImage:0];
}

- (void)_prepCurrentActivityZoneForDeselection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  uint64_t v4 = [v3 firstObject];
  if (!v4)
  {
LABEL_5:

    goto LABEL_6;
  }
  BOOL v5 = (void *)v4;
  id v6 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  double v7 = [v6 firstObject];
  double v8 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  id v9 = [v8 lastObject];
  char v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    double v11 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    uint64_t v12 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    id v13 = [v12 firstObject];
    [v11 addObject:v13];

    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
      int v17 = 138412290;
      double v18 = v14;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Finished editing. Re-added the last HMPoint to the zone:%@", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_5;
  }
LABEL_6:
  id v15 = [(HUCameraActivityZoneCanvasView *)self delegate];
  double v16 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  [v15 didUpdateActivityZone:v16];
}

- (void)_finishEditingCurrentActivityZone
{
  [(HUCameraActivityZoneCanvasView *)self _prepCurrentActivityZoneForDeselection];
  [(HUCameraActivityZoneCanvasView *)self _resetCanvasAndCurrentZone];
  id v3 = [MEMORY[0x1E4F42B88] sharedMenuController];
  [v3 hideMenu];
}

- (void)_editActivityZone:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    double v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Stop editing the activity zone:%@", (uint8_t *)&v14, 0xCu);
    }

    [(HUCameraActivityZoneCanvasView *)self _finishEditingCurrentActivityZone];
  }
  else
  {
    double v8 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];

    if (v8) {
      [(HUCameraActivityZoneCanvasView *)self _prepCurrentActivityZoneForDeselection];
    }
    [(HUCameraActivityZoneCanvasView *)self setEditingActivityZone:1];
    id v9 = [v4 firstObject];
    char v10 = [v4 lastObject];
    int v11 = [v9 isEqual:v10];

    if (v11)
    {
      uint64_t v12 = HFLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v4;
        _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Removing the copied last object for the activity zone:%@", (uint8_t *)&v14, 0xCu);
      }

      [v4 removeLastObject];
    }
    id v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "Edit activity zone:%@", (uint8_t *)&v14, 0xCu);
    }

    [(HUCameraActivityZoneCanvasView *)self setCurrentActivityZone:v4];
    [(HUCameraActivityZoneCanvasView *)self _drawTouchPoints];
    [(HUCameraActivityZoneCanvasView *)self _displayMenuForActivityZone:v4];
  }
}

- (void)_displayMenuForActivityZone:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 firstObject];
  if (v4)
  {
    [(HUCameraActivityZoneCanvasView *)self _hmPointToCGPoint:v4];
    double v6 = v5;
    double v8 = v7 + -17.0;
  }
  else
  {
    double v6 = 0.0;
    double v8 = -17.0;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F42B98]);
  char v10 = _HULocalizedStringWithDefaultValue(@"HUClearTitle", @"HUClearTitle", 1);
  int v11 = (void *)[v9 initWithTitle:v10 action:sel_clearActivityZone];

  [(HUCameraActivityZoneCanvasView *)self becomeFirstResponder];
  uint64_t v12 = [MEMORY[0x1E4F42B88] sharedMenuController];
  v14[0] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v12 setMenuItems:v13];

  objc_msgSend(v12, "showMenuFromView:rect:", self, v6, v8, 17.0, 17.0);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)clearActivityZone
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    int v10 = 138412290;
    int v11 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Clear activity zone:%@", (uint8_t *)&v10, 0xCu);
  }
  [(HUCameraActivityZoneCanvasView *)self setEditingActivityZone:0];
  double v5 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  [v5 removeAllObjects];

  double v6 = [(HUCameraActivityZoneCanvasView *)self activityZones];
  double v7 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  [v6 removeObject:v7];

  double v8 = [(HUCameraActivityZoneCanvasView *)self canvasView];
  [v8 setImage:0];

  [(HUCameraActivityZoneCanvasView *)self setNeedsDisplay];
  id v9 = [(HUCameraActivityZoneCanvasView *)self delegate];
  [v9 didUpdateActivityZoneCanvas:self];
}

- (id)activityZoneContainingPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__36;
  int v14 = __Block_byref_object_dispose__36;
  id v15 = 0;
  double v6 = [(HUCameraActivityZoneCanvasView *)self activityZones];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__HUCameraActivityZoneCanvasView_activityZoneContainingPoint___block_invoke;
  v9[3] = &unk_1E6392468;
  *(CGFloat *)&v9[6] = x;
  *(CGFloat *)&v9[7] = y;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __62__HUCameraActivityZoneCanvasView_activityZoneContainingPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  double v8 = [MEMORY[0x1E4F427D0] bezierPath];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __62__HUCameraActivityZoneCanvasView_activityZoneContainingPoint___block_invoke_2;
  id v13 = &unk_1E6392440;
  uint64_t v14 = *(void *)(a1 + 32);
  id v9 = v8;
  id v15 = v9;
  [v7 enumerateObjectsUsingBlock:&v10];
  if (objc_msgSend(v9, "containsPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56), v10, v11, v12, v13, v14))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __62__HUCameraActivityZoneCanvasView_activityZoneContainingPoint___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _hmPointToCGPoint:a2];
  double v5 = *(void **)(a1 + 40);
  if (a3)
  {
    return objc_msgSend(v5, "addLineToPoint:");
  }
  else
  {
    return objc_msgSend(v5, "moveToPoint:");
  }
}

- (id)selectedActivityZoneAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(HUCameraActivityZoneCanvasView *)self isEditingActivityZone]
    || ([(HUCameraActivityZoneCanvasView *)self currentActivityZone],
        double v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        !v7))
  {
    double v8 = -[HUCameraActivityZoneCanvasView activityZoneContainingPoint:](self, "activityZoneContainingPoint:", x, y);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)setDisplaysInclusionZones:(BOOL)a3
{
  if (self->_displaysInclusionZones != a3)
  {
    self->_displaysInclusionZones = a3;
    [(HUCameraActivityZoneCanvasView *)self setNeedsDisplay];
  }
}

- (BOOL)isCreatingActivityZone
{
  if ([(HUCameraActivityZoneCanvasView *)self isEditingActivityZone]) {
    return 0;
  }
  id v4 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  BOOL v3 = (unint64_t)[v4 count] > 2;

  return v3;
}

- (BOOL)isValidPointInView:(CGPoint)a3
{
  BOOL v3 = -[HUCameraActivityZoneCanvasView activityZoneContainingPoint:](self, "activityZoneContainingPoint:", a3.x, a3.y);
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)currentZonesIntersectSegmentFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v9 = [(HUCameraActivityZoneCanvasView *)self activityZones];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __80__HUCameraActivityZoneCanvasView_currentZonesIntersectSegmentFromPoint_toPoint___block_invoke;
  v14[3] = &unk_1E63924B8;
  *(CGFloat *)&v14[6] = v7;
  *(CGFloat *)&v14[7] = v6;
  *(CGFloat *)&v14[8] = x;
  *(CGFloat *)&v14[9] = y;
  v14[4] = self;
  v14[5] = &v15;
  [v9 enumerateObjectsUsingBlock:v14];

  uint64_t v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *((unsigned __int8 *)v16 + 24);
    *(_DWORD *)buf = 67110144;
    int v20 = v11;
    __int16 v21 = 2048;
    CGFloat v22 = v7;
    __int16 v23 = 2048;
    CGFloat v24 = v6;
    __int16 v25 = 2048;
    CGFloat v26 = x;
    __int16 v27 = 2048;
    CGFloat v28 = y;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Intersection:%{BOOL}d for Line segment = %.2f,%.2f to %.2f,%.2f", buf, 0x30u);
  }

  char v12 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v12;
}

void __80__HUCameraActivityZoneCanvasView_currentZonesIntersectSegmentFromPoint_toPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) currentActivityZone];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    CGFloat v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Skipping check against current activity zone.", buf, 2u);
    }
  }
  else
  {
    *(void *)buf = 0;
    id v13 = buf;
    uint64_t v14 = 0x3010000000;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v15 = &unk_1BEACB3BA;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    long long v7 = *(_OWORD *)(a1 + 64);
    long long v10 = *(_OWORD *)(a1 + 48);
    long long v11 = v7;
    v9[2] = __80__HUCameraActivityZoneCanvasView_currentZonesIntersectSegmentFromPoint_toPoint___block_invoke_2;
    v9[3] = &unk_1E6392490;
    uint64_t v8 = *(void *)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    v9[5] = buf;
    v9[6] = v8;
    [v3 enumerateObjectsUsingBlock:v9];
    _Block_object_dispose(buf, 8);
  }
}

uint64_t __80__HUCameraActivityZoneCanvasView_currentZonesIntersectSegmentFromPoint_toPoint___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) _hmPointToCGPoint:a2];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  if (a3)
  {
    double v11 = *(double *)(v10 + 32);
    double v12 = *(double *)(v10 + 40);
    double v13 = v11 - v8;
    double v14 = v12 - v9;
    double v15 = *(double *)(a1 + 56);
    double v16 = *(double *)(a1 + 64);
    double v17 = v15 - *(double *)(a1 + 72);
    double v18 = v16 - *(double *)(a1 + 80);
    double v19 = (v11 - v8) * v18 - v17 * (v12 - v9);
    if (v19 > 0.00000011920929)
    {
      double v20 = v16 - v12;
      double v21 = v15 - v11;
      double v22 = (v20 * v17 - v21 * v18) / v19;
      if (v22 > 0.0 && v22 < 1.0)
      {
        double v24 = (v14 * -v21 + v20 * v13) / v19;
        if (v24 > 0.0 && v24 < 1.0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          *a4 = 1;
          uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        }
      }
    }
  }
  *(double *)(v10 + 32) = v8;
  *(double *)(v10 + 40) = v9;
  return result;
}

- (BOOL)currentZonesIntersectPoint:(CGPoint)a3
{
  BOOL v4 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  char v5 = [v4 lastObject];

  if (v5)
  {
    [(HUCameraActivityZoneCanvasView *)self _hmPointToCGPoint:v5];
    BOOL v6 = -[HUCameraActivityZoneCanvasView currentZonesIntersectSegmentFromPoint:toPoint:](self, "currentZonesIntersectSegmentFromPoint:toPoint:");
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)preventAttemptToMovePoint
{
  id v3 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  int64_t v4 = [(HUCameraActivityZoneCanvasView *)self currentTouchPointIndex];
  char v5 = [(HUCameraActivityZoneCanvasView *)self startingTouchPoint];
  [v3 replaceObjectAtIndex:v4 withObject:v5];

  [(HUCameraActivityZoneCanvasView *)self _drawTouchPoints];
  [(HUCameraActivityZoneCanvasView *)self setNeedsDisplay];
  [(HUCameraActivityZoneCanvasView *)self setCurrentTouchPointIndex:-1];
  [(HUCameraActivityZoneCanvasView *)self setStartingTouchPoint:0];
  id v6 = [(HUCameraActivityZoneCanvasView *)self delegate];
  [v6 didAttemptToMovePointToOverlapZoneForCanvas:self];
}

- (void)didTap:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [v4 locationInView:self];
    double v6 = v5;
    double v8 = v7;
    if ([(HUCameraActivityZoneCanvasView *)self isEditingActivityZone])
    {
      double v9 = -[HUCameraActivityZoneCanvasView selectedActivityZoneAtPoint:](self, "selectedActivityZoneAtPoint:", v6, v8);
      if (!v9)
      {
        [(HUCameraActivityZoneCanvasView *)self _finishEditingCurrentActivityZone];
        [(HUCameraActivityZoneCanvasView *)self setNeedsDisplay];
LABEL_22:

        goto LABEL_23;
      }
      [(HUCameraActivityZoneCanvasView *)self _editActivityZone:v9];
      [(HUCameraActivityZoneCanvasView *)self setNeedsDisplay];
      goto LABEL_20;
    }
    double v9 = -[HUCameraActivityZoneCanvasView _hmPointForTapPoint:](self, "_hmPointForTapPoint:", v6, v8);
    if (!v9)
    {
      uint64_t v24 = -[HUCameraActivityZoneCanvasView selectedActivityZoneAtPoint:](self, "selectedActivityZoneAtPoint:", v6, v8);
      if (v24)
      {
        __int16 v25 = (void *)v24;
        [(HUCameraActivityZoneCanvasView *)self _editActivityZone:v24];
        [(HUCameraActivityZoneCanvasView *)self setNeedsDisplay];
      }
      else
      {
        if (-[HUCameraActivityZoneCanvasView currentZonesIntersectPoint:](self, "currentZonesIntersectPoint:", v6, v8)
          || !-[HUCameraActivityZoneCanvasView isValidPointInView:](self, "isValidPointInView:", v6, v8))
        {
          v43 = HFLogForCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v44 = 134218240;
            *(double *)&v44[4] = v6;
            *(_WORD *)&v44[12] = 2048;
            *(double *)&v44[14] = v8;
            _os_log_impl(&dword_1BE345000, v43, OS_LOG_TYPE_DEFAULT, "Invalid location. Not creating touchpoint at:%.2f,%.2f.", v44, 0x16u);
          }

          v36 = [(HUCameraActivityZoneCanvasView *)self delegate];
          [v36 didAttemptToAddOverlappingLineForCanvas:self];
        }
        else
        {
          -[HUCameraActivityZoneCanvasView _normalizedPointForPoint:](self, "_normalizedPointForPoint:", v6, v8);
          v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2EA20]), "initWithPoint:", v34, v35);
          v37 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];

          if (!v37)
          {
            id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [(HUCameraActivityZoneCanvasView *)self setCurrentActivityZone:v38];
          }
          v39 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
          [v39 addObject:v36];

          [(HUCameraActivityZoneCanvasView *)self _drawTouchPoints];
          v40 = HFLogForCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v44 = 138412290;
            *(void *)&v44[4] = v36;
            _os_log_impl(&dword_1BE345000, v40, OS_LOG_TYPE_DEFAULT, "Add touch point:%@", v44, 0xCu);
          }

          v41 = [(HUCameraActivityZoneCanvasView *)self delegate];
          v42 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
          [v41 didUpdateActivityZone:v42];
        }
        __int16 v25 = 0;
      }
      goto LABEL_21;
    }
    uint64_t v10 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    double v11 = [v10 firstObject];
    int v12 = [v9 isEqual:v11];

    double v13 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    double v14 = v13;
    if (v12)
    {
      uint64_t v15 = [v13 count];

      if (v15 == 1)
      {
        double v16 = HFLogForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v44 = 0;
          _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "Delete the first touchpoint.", v44, 2u);
        }

        double v17 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
        [v17 removeObjectAtIndex:0];

        [(HUCameraActivityZoneCanvasView *)self _drawTouchPoints];
        double v18 = HFLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          double v19 = [(HUCameraActivityZoneCanvasView *)self activityZones];
          uint64_t v20 = [v19 count];
          *(_DWORD *)v44 = 134217984;
          *(void *)&v44[4] = v20;
          _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "Remove the activity. Zone count:%lu", v44, 0xCu);
        }
        double v21 = [(HUCameraActivityZoneCanvasView *)self delegate];
        double v22 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
        [v21 didUpdateActivityZone:v22];

        __int16 v23 = [(HUCameraActivityZoneCanvasView *)self delegate];
        [v23 didUpdateActivityZoneCanvas:self];
        goto LABEL_19;
      }
      v32 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
      unint64_t v33 = [v32 count];

      if (v33 > 2)
      {
        [(HUCameraActivityZoneCanvasView *)self createActivityZone];
        goto LABEL_20;
      }
      __int16 v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        CGFloat v28 = "Ignore taps on the target since there are less than 3 points";
        uint64_t v29 = v23;
        uint32_t v30 = 2;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v26 = [v13 indexOfObject:v9];

      __int16 v27 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
      [v27 removeObjectAtIndex:v26];

      [(HUCameraActivityZoneCanvasView *)self _drawTouchPoints];
      __int16 v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v44 = 138412290;
        *(void *)&v44[4] = v9;
        CGFloat v28 = "Deleted touchpoint:%@.";
        uint64_t v29 = v23;
        uint32_t v30 = 12;
LABEL_18:
        _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_DEFAULT, v28, v44, v30);
      }
    }
LABEL_19:

LABEL_20:
    __int16 v25 = [(HUCameraActivityZoneCanvasView *)self delegate];
    v31 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    [v25 didUpdateActivityZone:v31];

LABEL_21:
    goto LABEL_22;
  }
LABEL_23:
}

- (void)didPan:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 state];
  if (v4 == 3)
  {
    [(HUCameraActivityZoneCanvasView *)self _handleEndForGesture:v7];
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    [(HUCameraActivityZoneCanvasView *)self _handleChangeForGesture:v7];
    goto LABEL_8;
  }
  BOOL v5 = v4 == 1;
  double v6 = v7;
  if (v5)
  {
    [(HUCameraActivityZoneCanvasView *)self _handleBeginForGesture:v7];
LABEL_8:
    double v6 = v7;
  }
}

- (void)_handleBeginForGesture:(id)a3
{
  [a3 locationInView:self];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  [(HUCameraActivityZoneCanvasView *)self setCurrentTouchPointIndex:-1];
  double v8 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HUCameraActivityZoneCanvasView__handleBeginForGesture___block_invoke;
  v9[3] = &unk_1E63924E0;
  v9[4] = self;
  v9[5] = v5;
  v9[6] = v7;
  [v8 enumerateObjectsUsingBlock:v9];
}

void __57__HUCameraActivityZoneCanvasView__handleBeginForGesture___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  [*(id *)(a1 + 32) _hmPointToCGPoint:v7];
  *(float *)&double v8 = v8 - *(double *)(a1 + 40);
  *(float *)&double v9 = v9 - *(double *)(a1 + 48);
  if (hypotf(*(float *)&v8, *(float *)&v9) <= 34.0)
  {
    uint64_t v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = 134218496;
      uint64_t v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      __int16 v17 = 2048;
      uint64_t v18 = a3;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Begin dragging at point:%.0f, %.0f for index %lu", (uint8_t *)&v13, 0x20u);
    }

    [*(id *)(a1 + 32) setCurrentTouchPointIndex:a3];
    [*(id *)(a1 + 32) setStartingTouchPoint:v7];
    *a4 = 1;
  }
}

- (void)_handleChangeForGesture:(id)a3
{
  id v16 = a3;
  if (([(HUCameraActivityZoneCanvasView *)self currentTouchPointIndex] & 0x8000000000000000) == 0)
  {
    [v16 locationInView:self];
    double v5 = v4;
    double v7 = fmax(v6, 0.0);
    [(HUCameraActivityZoneCanvasView *)self bounds];
    if (v7 >= v8) {
      double v7 = v8;
    }
    double v9 = fmax(v5, 0.0);
    [(HUCameraActivityZoneCanvasView *)self bounds];
    if (v9 >= v10) {
      double v11 = v10;
    }
    else {
      double v11 = v9;
    }
    -[HUCameraActivityZoneCanvasView _normalizedPointForPoint:](self, "_normalizedPointForPoint:", v7, v11);
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2EA20]), "initWithPoint:", v12, v13);
    __int16 v15 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    objc_msgSend(v15, "replaceObjectAtIndex:withObject:", -[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex"), v14);

    [(HUCameraActivityZoneCanvasView *)self _drawTouchPoints];
    [(HUCameraActivityZoneCanvasView *)self setNeedsDisplay];
  }
}

- (void)_handleEndForGesture:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412290;
    id v34 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Finished pan:%@", (uint8_t *)&v33, 0xCu);
  }

  if (([(HUCameraActivityZoneCanvasView *)self currentTouchPointIndex] & 0x8000000000000000) == 0)
  {
    [v4 locationInView:self];
    double v7 = v6;
    uint64_t v9 = v8;
    double v10 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    double v11 = objc_msgSend(v10, "objectAtIndex:", -[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex"));

    unint64_t v12 = [(HUCameraActivityZoneCanvasView *)self currentTouchPointIndex];
    double v13 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
    unint64_t v14 = [v13 count] - 1;

    if (v12 < v14)
    {
      __int16 v15 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
      id v16 = objc_msgSend(v15, "objectAtIndex:", -[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex") + 1);

      [(HUCameraActivityZoneCanvasView *)self _hmPointToCGPoint:v11];
      double v18 = v17;
      double v20 = v19;
      [(HUCameraActivityZoneCanvasView *)self _hmPointToCGPoint:v16];
      if (-[HUCameraActivityZoneCanvasView currentZonesIntersectSegmentFromPoint:toPoint:](self, "currentZonesIntersectSegmentFromPoint:toPoint:", v18, v20, v21, v22))
      {
        __int16 v23 = HFLogForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 134218240;
          id v34 = v7;
          __int16 v35 = 2048;
          uint64_t v36 = v9;
          uint64_t v24 = "Overlapped activity zones are not allowed for next point:%.2f,%.2f.";
LABEL_16:
          _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v33, 0x16u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    if ([(HUCameraActivityZoneCanvasView *)self currentTouchPointIndex] >= 1)
    {
      uint64_t v26 = [(HUCameraActivityZoneCanvasView *)self currentActivityZone];
      id v16 = objc_msgSend(v26, "objectAtIndex:", -[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex") - 1);

      [(HUCameraActivityZoneCanvasView *)self _hmPointToCGPoint:v11];
      double v28 = v27;
      double v30 = v29;
      [(HUCameraActivityZoneCanvasView *)self _hmPointToCGPoint:v16];
      if (-[HUCameraActivityZoneCanvasView currentZonesIntersectSegmentFromPoint:toPoint:](self, "currentZonesIntersectSegmentFromPoint:toPoint:", v28, v30, v31, v32))
      {
        __int16 v23 = HFLogForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 134218240;
          id v34 = v7;
          __int16 v35 = 2048;
          uint64_t v36 = v9;
          uint64_t v24 = "Overlapped activity zones are not allowed for previous point:%.2f,%.2f.";
          goto LABEL_16;
        }
LABEL_17:

        [(HUCameraActivityZoneCanvasView *)self preventAttemptToMovePoint];
LABEL_20:

        goto LABEL_21;
      }
    }
    id v16 = [(HUCameraActivityZoneCanvasView *)self delegate];
    [v16 didUpdateActivityZoneCanvas:self];
    goto LABEL_20;
  }
  __int16 v25 = HFLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v33) = 0;
    _os_log_error_impl(&dword_1BE345000, v25, OS_LOG_TYPE_ERROR, "Invalid touchPointIndex. Bailing.", (uint8_t *)&v33, 2u);
  }

  double v11 = [(HUCameraActivityZoneCanvasView *)self delegate];
  [v11 didUpdateActivityZoneCanvas:self];
LABEL_21:
}

- (CGPoint)_normalizedPointForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(HUCameraActivityZoneCanvasView *)self bounds];
  double v7 = x / fmax(v6, 1.0);
  [(HUCameraActivityZoneCanvasView *)self bounds];
  double v9 = y / fmax(v8, 1.0);
  double v10 = v7;
  result.double y = v9;
  result.double x = v10;
  return result;
}

- (CGPoint)_hmPointToCGPoint:(id)a3
{
  [a3 point];
  double v5 = v4;
  double v7 = v6;
  [(HUCameraActivityZoneCanvasView *)self bounds];
  double v9 = v5 * v8;
  [(HUCameraActivityZoneCanvasView *)self bounds];
  double v11 = v7 * v10;
  double v12 = v9;
  result.double y = v11;
  result.double x = v12;
  return result;
}

- (void)_addTouchpointAtPoint:(CGPoint)a3 inContext:(CGContext *)a4 withRed:(double)a5 green:(double)a6 blue:(double)a7
{
  double y = a3.y;
  double x = a3.x;
  double v13 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", a3.x + -3.0, a3.y + -3.0, 6.0, 6.0);
  CGFloat v17 = 0.0;
  CGFloat v18 = 0.0;
  CGFloat blue = 0.0;
  unint64_t v14 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  [v14 getRed:&v18 green:&v17 blue:&blue alpha:0];

  CGContextSetRGBFillColor(a4, v18, v17, blue, 1.0);
  [v13 fill];
  __int16 v15 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", x + -17.0, y + -17.0, 34.0, 34.0);
  CGContextSetRGBFillColor(a4, a5, a6, a7, 0.5);
  CGContextSetRGBStrokeColor(a4, a5, a6, a7, 1.0);
  [v15 fill];
  [v15 stroke];
}

- (HUCameraActivityZoneCanvasDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCameraActivityZoneCanvasDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)activityZones
{
  return self->_activityZones;
}

- (BOOL)displaysInclusionZones
{
  return self->_displaysInclusionZones;
}

- (BOOL)isEditingActivityZone
{
  return self->_editingActivityZone;
}

- (void)setEditingActivityZone:(BOOL)a3
{
  self->_editingActivityZone = a3;
}

- (NSMutableArray)currentActivityZone
{
  return self->_currentActivityZone;
}

- (void)setCurrentActivityZone:(id)a3
{
}

- (UIImageView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
}

- (int64_t)currentTouchPointIndex
{
  return self->_currentTouchPointIndex;
}

- (void)setCurrentTouchPointIndex:(int64_t)a3
{
  self->_currentTouchPointIndedouble x = a3;
}

- (HMPoint)startingTouchPoint
{
  return self->_startingTouchPoint;
}

- (void)setStartingTouchPoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingTouchPoint, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_currentActivityZone, 0);
  objc_storeStrong((id *)&self->_activityZones, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end