@interface MPUStackView
- (BOOL)forcesIntegralX;
- (BOOL)forcesIntegralY;
- (CGPoint)vanishingPoint;
- (CGSize)baseSize;
- (CGSize)sizeInsetStep;
- (CGSize)sizeOfItemAtIndex:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)itemClass;
- (MPUStackView)initWithFrame:(CGRect)a3;
- (MPUStackView)initWithFrame:(CGRect)a3 itemClass:(Class)a4 itemReuseIdentifier:(id)a5;
- (MPUStackViewDataSource)dataSource;
- (NSArray)items;
- (NSString)itemReuseIdentifier;
- (UIOffset)maximumRelativeOffsetStep;
- (UIOffset)relativeOffsetOfItemAtIndex:(double)a3 withCenter:(CGPoint)a4;
- (UIView)perspectiveTargetView;
- (id)_dequeueReusableItem;
- (id)itemAtIndex:(int64_t)a3;
- (int64_t)numberOfItems;
- (void)_updateGeometryFieldsInConfiguration;
- (void)beginIgnoringDistanceUpdates;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)endIgnoringDistanceUpdates;
- (void)layoutSubviews;
- (void)reloadData;
- (void)reloadDataWithTransition:(int64_t)a3;
- (void)setBaseSize:(CGSize)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setDataSource:(id)a3;
- (void)setForcesIntegralX:(BOOL)a3;
- (void)setForcesIntegralY:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMaximumRelativeOffsetStep:(UIOffset)a3;
- (void)setPerspectiveTargetView:(id)a3;
- (void)setSizeInsetStep:(CGSize)a3;
- (void)setVanishingPoint:(CGPoint)a3;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation MPUStackView

- (MPUStackView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (MPUStackView)initWithFrame:(CGRect)a3 itemClass:(Class)a4 itemReuseIdentifier:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPUStackView;
  v12 = -[MPUStackView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemClass, a4);
    uint64_t v14 = [v11 copy];
    itemReuseIdentifier = v13->_itemReuseIdentifier;
    v13->_itemReuseIdentifier = (NSString *)v14;

    v16 = [MEMORY[0x263F1C920] mainScreen];
    [v16 scale];
    v13->_configuration.scale = v17;

    +[_MPUStackItemReuseCache registerStackViewForReuseIdentifier:v13->_itemReuseIdentifier];
    [(MPUStackView *)v13 setClipsToBounds:0];
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  +[_MPUStackItemReuseCache unregisterStackViewForReuseIdentifier:self->_itemReuseIdentifier];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_items;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        +[_MPUStackItemReuseCache enqueueReusableStackItem:*(void *)(*((void *)&v9 + 1) + 8 * v7++) forReuseIdentifier:self->_itemReuseIdentifier];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MPUStackView;
  [(MPUStackView *)&v8 dealloc];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)MPUStackView;
  [(MPUStackView *)&v3 didMoveToSuperview];
  [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
}

- (void)didMoveToWindow
{
  v9.receiver = self;
  v9.super_class = (Class)MPUStackView;
  [(MPUStackView *)&v9 didMoveToWindow];
  objc_super v3 = [(MPUStackView *)self window];
  window = self->_window;
  self->_window = v3;

  uint64_t v5 = [(UIWindow *)self->_window screen];
  [v5 scale];
  self->_configuration.scale = v6;

  if (self->_configuration.scale < 0.00000011920929)
  {
    uint64_t v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 scale];
    self->_configuration.scale = v8;
  }
  [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MPUStackView;
  [(MPUStackView *)&v3 layoutSubviews];
  [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPUStackView;
  -[MPUStackView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MPUStackView *)self _updateGeometryFieldsInConfiguration];
}

- (void)setCenter:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPUStackView;
  -[MPUStackView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  [(MPUStackView *)self _updateGeometryFieldsInConfiguration];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPUStackView;
  -[MPUStackView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MPUStackView *)self _updateGeometryFieldsInConfiguration];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_configuration.baseSize.width;
  double height = self->_configuration.baseSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)baseSize
{
  double width = self->_configuration.baseSize.width;
  double height = self->_configuration.baseSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBaseSize:(CGSize)a3
{
  if (self->_configuration.baseSize.width != a3.width || self->_configuration.baseSize.height != a3.height)
  {
    self->_configuration.baseSize = a3;
    [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
  }
}

- (BOOL)forcesIntegralX
{
  return self->_configuration.forcesIntegralX;
}

- (BOOL)forcesIntegralY
{
  return self->_configuration.forcesIntegralY;
}

- (UIOffset)maximumRelativeOffsetStep
{
  double horizontal = self->_configuration.maximumRelativeOffsetStep.horizontal;
  double vertical = self->_configuration.maximumRelativeOffsetStep.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(MPUStackView *)self reloadData];
    uint64_t v5 = obj;
  }
}

- (void)setForcesIntegralX:(BOOL)a3
{
  if (self->_configuration.forcesIntegralX != a3)
  {
    self->_configuration.forcesIntegralX = a3;
    [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
  }
}

- (void)setForcesIntegralY:(BOOL)a3
{
  if (self->_configuration.forcesIntegralY != a3)
  {
    self->_configuration.forcesIntegralY = a3;
    [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
  }
}

- (void)setMaximumRelativeOffsetStep:(UIOffset)a3
{
  if (self->_configuration.maximumRelativeOffsetStep.horizontal != a3.horizontal
    || self->_configuration.maximumRelativeOffsetStep.vertical != a3.vertical)
  {
    self->_configuration.maximumRelativeOffsetStep = a3;
    [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
  }
}

- (void)setPerspectiveTargetView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_perspectiveTargetView);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_perspectiveTargetView, obj);
    [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
    uint64_t v5 = obj;
  }
}

- (void)setSizeInsetStep:(CGSize)a3
{
  if (self->_configuration.sizeInsetStep.width != a3.width || self->_configuration.sizeInsetStep.height != a3.height)
  {
    self->_configuration.sizeInsetStep = a3;
    [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
  }
}

- (void)setVanishingPoint:(CGPoint)a3
{
  if (self->_configuration.vanishingPoint.x != a3.x || self->_configuration.vanishingPoint.y != a3.y)
  {
    self->_configuration.vanishingPoint = a3;
    [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
  }
}

- (CGSize)sizeInsetStep
{
  double width = self->_configuration.sizeInsetStep.width;
  double height = self->_configuration.sizeInsetStep.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)vanishingPoint
{
  double x = self->_configuration.vanishingPoint.x;
  double y = self->_configuration.vanishingPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)beginIgnoringDistanceUpdates
{
}

- (void)endIgnoringDistanceUpdates
{
  int64_t distanceIgnoreCount = self->_distanceIgnoreCount;
  BOOL v3 = distanceIgnoreCount == 1;
  BOOL v4 = distanceIgnoreCount < 1;
  int64_t v5 = distanceIgnoreCount - 1;
  if (!v4)
  {
    self->_int64_t distanceIgnoreCount = v5;
    if (v3) {
      [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
    }
  }
}

- (id)itemAtIndex:(int64_t)a3
{
  return (id)[(NSMutableArray *)self->_items objectAtIndex:a3];
}

- (UIOffset)relativeOffsetOfItemAtIndex:(double)a3 withCenter:(CGPoint)a4
{
  CGFloat y = a4.y;
  id WeakRetained = (UIWindow *)objc_loadWeakRetained((id *)&self->_perspectiveTargetView);
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    p_configuration = &self->_configuration;
LABEL_5:
    [(UIWindow *)v7 bounds];
    float64x2_t vanishingPoint = (float64x2_t)p_configuration->vanishingPoint;
    v12.f64[1] = v11;
    float64x2_t v13 = vsubq_f64(v12, vanishingPoint);
    v14.f64[0] = v32;
    v14.f64[1] = y;
    float64x2_t v34 = vdivq_f64(vsubq_f64(vanishingPoint, v14), (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(vanishingPoint, v13), (int8x16_t)vanishingPoint, (int8x16_t)v13));

    float64x2_t v15 = v34;
    goto LABEL_6;
  }
  objc_super v9 = self->_window;
  p_configuration = &self->_configuration;
  if (v9)
  {
    uint64_t v7 = v9;
    goto LABEL_5;
  }
  float64x2_t v15 = *(float64x2_t *)MEMORY[0x263F001B0];
LABEL_6:
  double v16 = -a3;
  if (a3 >= 0.0) {
    double v16 = a3;
  }
  __asm { FMOV            V1.2D, #0.5 }
  float64x2_t v22 = vmulq_n_f64(vaddq_f64((float64x2_t)p_configuration->sizeInsetStep, (float64x2_t)p_configuration->sizeInsetStep), v16);
  float64x2_t v23 = vmulq_n_f64((float64x2_t)p_configuration->maximumRelativeOffsetStep, v16);
  float64x2_t v24 = vmulq_f64(v22, _Q1);
  float64x2_t v25 = vsubq_f64(vnegq_f64(v23), v24);
  float64x2_t v26 = vaddq_f64(v23, v24);
  float64x2_t v27 = vmlaq_f64(v25, vaddq_f64(vmulq_f64(v15, _Q1), _Q1), vaddq_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v25), (int8x16_t)vnegq_f64(v25), (int8x16_t)v25), (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v26), (int8x16_t)vnegq_f64(v26), (int8x16_t)v26)));
  *(int32x2_t *)&_Q1.f64[0] = vdup_n_s32(a3 < 0.0);
  v28.i64[0] = LODWORD(_Q1.f64[0]);
  v28.i64[1] = HIDWORD(_Q1.f64[0]);
  int8x16_t v29 = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v28, 0x3FuLL)), (int8x16_t)vnegq_f64(v27), (int8x16_t)v27);
  double v30 = *(double *)&v29.i64[1];
  result.double horizontal = *(double *)v29.i64;
  result.double vertical = v30;
  return result;
}

- (void)reloadData
{
}

- (void)reloadDataWithTransition:(int64_t)a3
{
  int64_t numberOfItems = self->_numberOfItems;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int64_t v7 = [WeakRetained numberOfItemsInStackView:self];
  self->_int64_t numberOfItems = v7;
  if (numberOfItems) {
    BOOL v8 = a3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && v7 == numberOfItems)
  {
    if (a3 == 1)
    {
      float64x2_t v22 = [(NSMutableArray *)self->_items objectAtIndex:0];
      [(NSMutableArray *)self->_items removeObjectAtIndex:0];
      uint64_t v86 = 0;
      v87 = &v86;
      uint64_t v88 = 0x3032000000;
      v89 = __Block_byref_object_copy_;
      v90 = __Block_byref_object_dispose_;
      id v91 = [(MPUStackView *)self _dequeueReusableItem];
      uint64_t v82 = 0;
      v83 = &v82;
      uint64_t v84 = 0x2020000000;
      char v85 = 0;
      float64x2_t v23 = (void *)v87[5];
      if (!v23)
      {
        float64x2_t v24 = (void *)MEMORY[0x263F1CB60];
        v73[0] = MEMORY[0x263EF8330];
        v73[1] = 3221225472;
        v73[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_2;
        v73[3] = &unk_2647D0C98;
        v75 = &v86;
        v73[4] = self;
        id v74 = WeakRetained;
        v76 = &v82;
        [v24 performWithoutAnimation:v73];

        float64x2_t v23 = (void *)v87[5];
      }
      float64x2_t v25 = [v23 superview];

      uint64_t v26 = v87[5];
      if (v25 == self) {
        [(MPUStackView *)self sendSubviewToBack:v26];
      }
      else {
        [(MPUStackView *)self insertSubview:v26 atIndex:0];
      }
      [(NSMutableArray *)self->_items addObject:v87[5]];
      int64x2_t v28 = (UIWindow *)objc_loadWeakRetained((id *)&self->_perspectiveTargetView);
      if (!v28) {
        int64x2_t v28 = self->_window;
      }
      -[MPUStackView convertPoint:toView:](self, "convertPoint:toView:", v28, self->_configuration.centerInLocalCoordinates.x, self->_configuration.centerInLocalCoordinates.y);
      if (v28)
      {
        double v31 = v29;
        double v32 = v30;
        [(UIWindow *)v28 bounds];
        double x = self->_configuration.vanishingPoint.x;
        double y = self->_configuration.vanishingPoint.y;
        double v37 = v36 - x;
        if (x > v37) {
          double v37 = self->_configuration.vanishingPoint.x;
        }
        double v38 = v33 - y;
        if (y > v38) {
          double v38 = self->_configuration.vanishingPoint.y;
        }
        double v39 = (x - v31) / v37;
        double v40 = (y - v32) / v38;
      }
      else
      {
        double v39 = *MEMORY[0x263F001B0];
        double v40 = *(double *)(MEMORY[0x263F001B0] + 8);
      }
      v41 = (void *)MEMORY[0x263F1CB60];
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_3;
      v67[3] = &unk_2647D0CC0;
      v67[4] = self;
      v69 = &v86;
      double v71 = v39;
      double v72 = v40;
      v70 = &v82;
      id v42 = WeakRetained;
      id v68 = v42;
      [v41 performWithoutAnimation:v67];
      v65[0] = 0;
      v65[1] = v65;
      v65[2] = 0x2020000000;
      char v66 = 0;
      v63[0] = 0;
      v63[1] = v63;
      v63[2] = 0x2020000000;
      char v64 = 0;
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_4;
      v62[3] = &unk_2647D0CE8;
      v62[5] = v65;
      v62[6] = v63;
      v62[4] = self;
      v43 = (void *)MEMORY[0x22A663DA0](v62);
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_5;
      v57[3] = &unk_2647D0D10;
      id v44 = v22;
      id v58 = v44;
      v59 = self;
      v61 = v65;
      id v45 = v43;
      id v60 = v45;
      +[MPUFallAnimator animateFallForView:v44 withCompletionHandler:v57];
      v46 = (void *)MEMORY[0x263F1CB60];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_6;
      v52[3] = &unk_2647D0D38;
      v52[4] = self;
      double v55 = v39;
      double v56 = v40;
      id v53 = v42;
      v54 = &v86;
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_7;
      v49[3] = &unk_2647D0D60;
      v51 = v63;
      id v47 = v45;
      id v50 = v47;
      [v46 animateWithDuration:1 delay:v52 options:v49 animations:0.3 completion:0.05];

      _Block_object_dispose(v63, 8);
      _Block_object_dispose(v65, 8);

      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(&v86, 8);
    }
  }
  else
  {
    if (v7 <= 0)
    {
      unint64_t v10 = 0;
    }
    else
    {
      unint64_t v10 = 0;
      v48 = v78;
      do
      {
        uint64_t v86 = 0;
        v87 = &v86;
        uint64_t v88 = 0x3032000000;
        v89 = __Block_byref_object_copy_;
        v90 = __Block_byref_object_dispose_;
        unint64_t v11 = [(NSMutableArray *)self->_items count];
        float64x2_t v12 = 0;
        if (v10 < v11)
        {
          float64x2_t v12 = [(NSMutableArray *)self->_items objectAtIndex:v10];
        }
        id v91 = v12;
        uint64_t v82 = 0;
        v83 = &v82;
        uint64_t v84 = 0x2020000000;
        char v85 = 0;
        float64x2_t v13 = v87;
        if (!v87[5])
        {
          uint64_t v14 = [(MPUStackView *)self _dequeueReusableItem];
          float64x2_t v15 = (void *)v87[5];
          v87[5] = v14;

          float64x2_t v13 = v87;
          if (!v87[5])
          {
            double v16 = (void *)MEMORY[0x263F1CB60];
            v77[0] = MEMORY[0x263EF8330];
            v77[1] = 3221225472;
            v78[0] = __41__MPUStackView_reloadDataWithTransition___block_invoke;
            v78[1] = &unk_2647D0C98;
            v80 = &v86;
            v78[2] = self;
            id v79 = WeakRetained;
            v81 = &v82;
            [v16 performWithoutAnimation:v77];

            float64x2_t v13 = v87;
          }
        }
        if (!*((unsigned char *)v83 + 24))
        {
          [(id)v13[5] willBeginItemViewConfiguration];
          float64x2_t v13 = v87;
        }
        [WeakRetained stackView:self applyAttributesToItem:v13[5] atIndex:v10];
        [(id)v87[5] didCompleteItemViewConfiguration];
        double v17 = [(id)v87[5] superview];

        uint64_t v18 = v87[5];
        if (v17 == self) {
          [(MPUStackView *)self sendSubviewToBack:v18];
        }
        else {
          [(MPUStackView *)self insertSubview:v18 atIndex:0];
        }
        items = self->_items;
        if (!items)
        {
          v20 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_numberOfItems];
          v21 = self->_items;
          self->_items = v20;

          items = self->_items;
        }
        if (([(NSMutableArray *)items containsObject:v87[5]] & 1) == 0) {
          [(NSMutableArray *)self->_items addObject:v87[5]];
        }
        _Block_object_dispose(&v82, 8);
        _Block_object_dispose(&v86, 8);

        ++v10;
      }
      while ((int64_t)v10 < self->_numberOfItems);
    }
    while (v10 < [(NSMutableArray *)self->_items count])
    {
      float64x2_t v27 = [(NSMutableArray *)self->_items objectAtIndex:v10];
      [(NSMutableArray *)self->_items removeObjectIdenticalTo:v27];
      [v27 removeFromSuperview];
      +[_MPUStackItemReuseCache enqueueReusableStackItem:v27 forReuseIdentifier:self->_itemReuseIdentifier];
    }
    [(MPUStackView *)self updateForChangedDistanceFromVanishingPoint];
  }
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(objc_alloc(*(Class *)(*(void *)(a1 + 32) + 568)), "initWithFrame:", 0.0, 0.0, *(double *)(*(void *)(a1 + 32) + 408), *(double *)(*(void *)(a1 + 32) + 416));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) willBeginItemViewConfiguration];
  uint64_t result = [*(id *)(a1 + 40) stackView:*(void *)(a1 + 32) didCreateItem:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(objc_alloc(*(Class *)(*(void *)(a1 + 32) + 568)), "initWithFrame:", 0.0, 0.0, *(double *)(*(void *)(a1 + 32) + 408), *(double *)(*(void *)(a1 + 32) + 416));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) willBeginItemViewConfiguration];
  uint64_t result = [*(id *)(a1 + 40) stackView:*(void *)(a1 + 32) didCreateItem:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_3(uint64_t a1, float64x2_t a2)
{
  a2.f64[0] = *(float64_t *)(a1 + 64);
  _MPUStackViewApplyLayoutToItem(*(void *)(a1 + 32) + 408, *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(*(void *)(a1 + 32) + 584) - 1, a2, *(float64_t *)(a1 + 72));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) willBeginItemViewConfiguration];
  }
  objc_msgSend(*(id *)(a1 + 40), "stackView:applyAttributesToItem:atIndex:");
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) didCompleteItemViewConfiguration];
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v3 setAlpha:0.0];
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_4(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24)) {
      return [*(id *)(result + 32) updateForChangedDistanceFromVanishingPoint];
    }
  }
  return result;
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  +[_MPUStackItemReuseCache enqueueReusableStackItem:*(void *)(a1 + 32) forReuseIdentifier:*(void *)(*(void *)(a1 + 40) + 576)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_6(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 544);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v2);
        }
        objc_super v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v4.f64[0] = *(float64_t *)(a1 + 56);
        _MPUStackViewApplyLayoutToItem(*(void *)(a1 + 32) + 408, v9, v6 + i, v4, *(float64_t *)(a1 + 64));
        objc_msgSend(v9, "willBeginItemViewConfiguration", (void)v11);
        [*(id *)(a1 + 40) stackView:*(void *)(a1 + 32) applyAttributesToItem:v9 atIndex:v6 + i];
        [v9 didCompleteItemViewConfiguration];
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      v6 += i;
    }
    while (v5);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAlpha:1.0];
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_7(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGSize)sizeOfItemAtIndex:(double)a3
{
  float64x2_t v3 = vsubq_f64((float64x2_t)self->_configuration.baseSize, vmulq_n_f64(vaddq_f64((float64x2_t)self->_configuration.sizeInsetStep, (float64x2_t)self->_configuration.sizeInsetStep), a3));
  double v4 = v3.f64[1];
  result.double width = v3.f64[0];
  result.double height = v4;
  return result;
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (self->_distanceIgnoreCount <= 0)
  {
    char v3 = [MEMORY[0x263F1CB60] _isInAnimationBlock];
    if ((v3 & 1) == 0)
    {
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
    }
    id WeakRetained = (UIWindow *)objc_loadWeakRetained((id *)&self->_perspectiveTargetView);
    if (!WeakRetained) {
      id WeakRetained = self->_window;
    }
    p_configuration = &self->_configuration;
    -[MPUStackView convertPoint:toView:](self, "convertPoint:toView:", WeakRetained, self->_configuration.centerInLocalCoordinates.x, self->_configuration.centerInLocalCoordinates.y);
    if (WeakRetained)
    {
      double v8 = v6;
      double v9 = v7;
      [(UIWindow *)WeakRetained bounds];
      double x = self->_configuration.vanishingPoint.x;
      double y = self->_configuration.vanishingPoint.y;
      double v14 = v13 - x;
      if (x > v14) {
        double v14 = self->_configuration.vanishingPoint.x;
      }
      double v15 = v10 - y;
      if (y > v15) {
        double v15 = self->_configuration.vanishingPoint.y;
      }
      double v16 = (x - v8) / v14;
      double v17 = (y - v9) / v15;
    }
    else
    {
      double v16 = *MEMORY[0x263F001B0];
      double v17 = *(double *)(MEMORY[0x263F001B0] + 8);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v18 = self->_items;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v19)
    {
      uint64_t v21 = v19;
      uint64_t v22 = 0;
      uint64_t v23 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v18);
          }
          v20.f64[0] = v16;
          _MPUStackViewApplyLayoutToItem((uint64_t)p_configuration, *(void **)(*((void *)&v25 + 1) + 8 * i), v22 + i, v20, v17);
        }
        uint64_t v21 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
        v22 += i;
      }
      while (v21);
    }

    if ((v3 & 1) == 0) {
      objc_msgSend(MEMORY[0x263F158F8], "commit", (void)v25);
    }
  }
}

- (id)_dequeueReusableItem
{
  return +[_MPUStackItemReuseCache dequeueReusableStackItemWithIdentifier:self->_itemReuseIdentifier];
}

- (void)_updateGeometryFieldsInConfiguration
{
  [(MPUStackView *)self bounds];
  self->_configuration.bounds.origin.double x = v3;
  self->_configuration.bounds.origin.double y = v4;
  self->_configuration.bounds.size.double width = v5;
  self->_configuration.bounds.size.double height = v6;
  self->_configuration.centerInLocalCoordinates.double x = v3 + v5 * 0.5;
  self->_configuration.centerInLocalCoordinates.double y = v4 + v6 * 0.5;
}

- (MPUStackViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MPUStackViewDataSource *)WeakRetained;
}

- (Class)itemClass
{
  return self->_itemClass;
}

- (NSString)itemReuseIdentifier
{
  return self->_itemReuseIdentifier;
}

- (NSArray)items
{
  return &self->_items->super;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (UIView)perspectiveTargetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_perspectiveTargetView);

  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_perspectiveTargetView);
  objc_storeStrong((id *)&self->_itemReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_itemClass, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end