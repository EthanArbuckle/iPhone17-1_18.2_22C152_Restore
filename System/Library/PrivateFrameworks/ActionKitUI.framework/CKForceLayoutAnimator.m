@interface CKForceLayoutAnimator
- (CKForceLayoutAnimator)init;
- (CKForceLayoutAnimator)initWithReferenceView:(id)a3;
- (NSSet)links;
- (NSSet)nodes;
- (UIColor)lineColor;
- (UIView)referenceView;
- (double)alpha;
- (double)charge;
- (double)chargeDistance;
- (double)friction;
- (double)gravity;
- (double)lineWidth;
- (double)linkDistance;
- (double)linkStrength;
- (double)theta;
- (void)addNode:(id)a3;
- (void)fixNode:(id)a3 atPosition:(CGPoint)a4;
- (void)linkNode:(id)a3 toNode:(id)a4;
- (void)releaseNode:(id)a3;
- (void)removeAllNodes;
- (void)removeNode:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setCharge:(double)a3;
- (void)setChargeDistance:(double)a3;
- (void)setFriction:(double)a3;
- (void)setGravity:(double)a3;
- (void)setLineColor:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setLinkDistance:(double)a3;
- (void)setLinkStrength:(double)a3;
- (void)setTheta:(double)a3;
- (void)start;
- (void)stop;
- (void)tick;
- (void)unlinkNode:(id)a3 fromNode:(id)a4;
@end

@implementation CKForceLayoutAnimator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_linesLayer, 0);
  objc_storeStrong((id *)&self->_fixedNodes, 0);
  objc_storeStrong((id *)&self->_previousCenters, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setGravity:(double)a3
{
  self->_gravity = a3;
}

- (double)gravity
{
  return self->_gravity;
}

- (void)setTheta:(double)a3
{
  self->_theta = a3;
}

- (double)theta
{
  return self->_theta;
}

- (void)setChargeDistance:(double)a3
{
  self->_chargeDistance = a3;
}

- (double)chargeDistance
{
  return self->_chargeDistance;
}

- (void)setCharge:(double)a3
{
  self->_charge = a3;
}

- (double)charge
{
  return self->_charge;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setLinkStrength:(double)a3
{
  self->_linkStrength = a3;
}

- (double)linkStrength
{
  return self->_linkStrength;
}

- (void)setLinkDistance:(double)a3
{
  self->_linkDistance = a3;
}

- (double)linkDistance
{
  return self->_linkDistance;
}

- (NSSet)links
{
  return &self->_links->super;
}

- (NSSet)nodes
{
  return &self->_nodes->super;
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)tick
{
  double v3 = self->_alpha * 0.99000001;
  self->_alpha = v3;
  if (v3 >= 0.00499999989)
  {
    links = self->_links;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __29__CKForceLayoutAnimator_tick__block_invoke;
    v33[3] = &unk_2648FFC88;
    v33[4] = self;
    [(NSMutableSet *)links enumerateObjectsUsingBlock:v33];
    double v6 = self->_alpha * self->_gravity;
    if (v6 != 0.0)
    {
      [(UIView *)self->_referenceView bounds];
      CGFloat MidX = CGRectGetMidX(v35);
      [(UIView *)self->_referenceView bounds];
      CGFloat MidY = CGRectGetMidY(v36);
      nodes = self->_nodes;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __29__CKForceLayoutAnimator_tick__block_invoke_2;
      v32[3] = &__block_descriptor_56_e20_v24__0__UIView_8_B16l;
      *(CGFloat *)&v32[4] = MidX;
      *(CGFloat *)&v32[5] = MidY;
      *(double *)&v32[6] = v6;
      [(NSMutableSet *)nodes enumerateObjectsUsingBlock:v32];
    }
    v10 = [CKQuadTree alloc];
    v11 = [(NSMutableSet *)self->_nodes allObjects];
    v12 = [v11 valueForKey:@"center"];
    v13 = [(CKQuadTree *)v10 initWithPoints:v12];

    uint64_t v26 = 0;
    v27 = (id *)&v26;
    uint64_t v28 = 0x3042000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __29__CKForceLayoutAnimator_tick__block_invoke_47;
    v25[3] = &unk_2648FFCF8;
    v25[4] = self;
    v25[5] = &v26;
    v14 = (void (**)(void, void))[v25 copy];
    objc_storeWeak(v27 + 5, v14);
    v15 = [(CKQuadTree *)v13 rootNode];
    ((void (**)(void, void *))v14)[2](v14, v15);

    v16 = self->_nodes;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __29__CKForceLayoutAnimator_tick__block_invoke_2_49;
    v23[3] = &unk_2648FFD48;
    v23[4] = self;
    v17 = v13;
    v24 = v17;
    [(NSMutableSet *)v16 enumerateObjectsUsingBlock:v23];
    v18 = self->_nodes;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __29__CKForceLayoutAnimator_tick__block_invoke_4;
    v22[3] = &unk_2648FFCB0;
    v22[4] = self;
    [(NSMutableSet *)v18 enumerateObjectsUsingBlock:v22];
    Mutable = CGPathCreateMutable();
    v20 = self->_links;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __29__CKForceLayoutAnimator_tick__block_invoke_5;
    v21[3] = &__block_descriptor_40_e19_v24__0__NSSet_8_B16l;
    v21[4] = Mutable;
    [(NSMutableSet *)v20 enumerateObjectsUsingBlock:v21];
    [(CAShapeLayer *)self->_linesLayer setPath:Mutable];
    CGPathRelease(Mutable);

    _Block_object_dispose(&v26, 8);
    objc_destroyWeak(&v31);
  }
  else
  {
    self->_alpha = 0.0;
    displayLink = self->_displayLink;
    [(CADisplayLink *)displayLink setPaused:1];
  }
}

void __29__CKForceLayoutAnimator_tick__block_invoke(uint64_t a1, void *a2)
{
  id v31 = [a2 allObjects];
  double v3 = [v31 firstObject];
  v4 = [v31 lastObject];
  [v4 center];
  double v6 = v5;
  [v3 center];
  double v8 = v6 - v7;
  [v4 center];
  double v10 = v9;
  [v3 center];
  double v12 = v10 - v11;
  double v13 = sqrt(v12 * v12 + v8 * v8);
  if (v13 != 0.0)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    double v15 = *(double *)(v14 + 128) * *(double *)(v14 + 80) * (v13 - *(double *)(v14 + 72)) / v13;
    double v16 = v8 * v15;
    double v17 = v12 * v15;
    v18 = [*(id *)(v14 + 32) objectForKey:v4];
    [v18 doubleValue];
    double v20 = v19;

    v21 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v3];
    [v21 doubleValue];
    double v23 = v22;

    double v24 = v23 / (v20 + v23);
    [v4 center];
    double v26 = v25 - v16 * v24;
    [v4 center];
    objc_msgSend(v4, "setCenter:", v26, v27 - v17 * v24);
    [v3 center];
    double v29 = v28 + v16 * (1.0 - v24);
    [v3 center];
    objc_msgSend(v3, "setCenter:", v29, v30 + v17 * (1.0 - v24));
  }
}

void __29__CKForceLayoutAnimator_tick__block_invoke_2(double *a1, void *a2)
{
  id v12 = a2;
  [v12 center];
  double v4 = v3;
  double v5 = a1[4];
  [v12 center];
  double v7 = v4 + (v5 - v6) * a1[6];
  [v12 center];
  double v9 = v8;
  double v10 = a1[5];
  [v12 center];
  objc_msgSend(v12, "setCenter:", v7, v9 + (v10 - v11) * a1[6]);
}

void __29__CKForceLayoutAnimator_tick__block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v30 = a2;
  double v3 = [v30 nodes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v3);
        }
        double v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        WeakRetained = (void (**)(id, void *))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40)
                                                                                                + 8)
                                                                                    + 40));
        WeakRetained[2](WeakRetained, v11);

        double v13 = [v11 objectForKey:@"charge"];
        [v13 doubleValue];
        double v15 = v14;

        double v9 = v9 + v15;
        double v16 = [v11 objectForKey:@"chargeX"];
        [v16 doubleValue];
        double v8 = v8 + v15 * v17;

        v18 = [v11 objectForKey:@"chargeY"];
        [v18 doubleValue];
        double v7 = v7 + v15 * v19;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }

  double v20 = [v30 point];

  if (v20)
  {
    v21 = [v30 point];
    [v21 CGPointValue];
    double v23 = v22;
    double v25 = v24;

    double v26 = *(double *)(*(void *)(a1 + 32) + 128) * *(double *)(*(void *)(a1 + 32) + 96);
    double v9 = v9 + v26;
    double v8 = v8 + v26 * v23;
    double v7 = v7 + v26 * v25;
  }
  double v27 = [NSNumber numberWithDouble:v9];
  [v30 setObject:v27 forKey:@"charge"];

  double v28 = [NSNumber numberWithDouble:v8 / v9];
  [v30 setObject:v28 forKey:@"chargeX"];

  double v29 = [NSNumber numberWithDouble:v7 / v9];
  [v30 setObject:v29 forKey:@"chargeY"];
}

void __29__CKForceLayoutAnimator_tick__block_invoke_2_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:v3];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __29__CKForceLayoutAnimator_tick__block_invoke_3;
    v9[3] = &unk_2648FFD20;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    [v6 visit:v9];
  }
}

void __29__CKForceLayoutAnimator_tick__block_invoke_4(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v17];
  [v3 CGPointValue];
  double v5 = v4;
  double v7 = v6;

  [v17 center];
  double v9 = v8;
  double v11 = v10;
  id v12 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:v17];
  char v13 = [v12 BOOLValue];

  if ((v13 & 1) == 0)
  {
    double v14 = *(double *)(*(void *)(a1 + 32) + 88);
    double v5 = v9 - (v5 - v9) * v14;
    double v7 = v11 - (v7 - v11) * v14;
  }
  objc_msgSend(v17, "setCenter:", v5, v7);
  double v15 = *(void **)(*(void *)(a1 + 32) + 40);
  double v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v5, v7);
  [v15 setObject:v16 forKey:v17];
}

void __29__CKForceLayoutAnimator_tick__block_invoke_5(uint64_t a1, void *a2)
{
  id v13 = [a2 allObjects];
  id v3 = [v13 firstObject];
  double v4 = [v13 lastObject];
  double v5 = *(CGPath **)(a1 + 32);
  [v3 center];
  CGFloat v7 = v6;
  [v3 center];
  CGPathMoveToPoint(v5, 0, v7, v8);
  double v9 = *(CGPath **)(a1 + 32);
  [v4 center];
  CGFloat v11 = v10;
  [v4 center];
  CGPathAddLineToPoint(v9, 0, v11, v12);
}

BOOL __29__CKForceLayoutAnimator_tick__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 objectForKey:@"charge"];
  [v4 doubleValue];
  double v6 = v5;

  CGFloat v7 = [v3 objectForKey:@"chargeX"];
  [v7 doubleValue];
  double v9 = v8;

  double v10 = [v3 objectForKey:@"chargeY"];
  [v10 doubleValue];
  double v12 = v11;

  uint64_t v13 = [v3 point];
  if (v13)
  {
    double v14 = (void *)v13;
    [*(id *)(a1 + 32) center];
    double v16 = v15;
    double v18 = v17;
    double v19 = [v3 point];
    [v19 CGPointValue];
    double v21 = v20;
    double v23 = v22;

    if (v16 == v21 && v18 == v23) {
      goto LABEL_12;
    }
  }
  [*(id *)(a1 + 32) center];
  double v25 = v9 - v24;
  [*(id *)(a1 + 32) center];
  double v27 = v12 - v26;
  [v3 bounds];
  CGFloat Width = CGRectGetWidth(v52);
  uint64_t v29 = *(void *)(a1 + 40);
  double v30 = *(double *)(v29 + 104) * *(double *)(v29 + 104);
  double v31 = v27 * v27 + v25 * v25;
  if (Width * Width / (*(double *)(v29 + 112) * *(double *)(v29 + 112)) >= v31)
  {
    long long v32 = [v3 point];
    long long v33 = v32;
    if (v31 != 0.0 && v32 != 0)
    {

      if (v31 >= v30)
      {
LABEL_12:
        BOOL v43 = v6 == 0.0;
        goto LABEL_16;
      }
      CGRect v35 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:*(void *)(a1 + 32)];
      [v35 CGPointValue];
      double v37 = v36;
      double v39 = v38;

      uint64_t v40 = *(void *)(a1 + 40);
      double v41 = *(double *)(v40 + 128) * *(double *)(v40 + 96) / v31;
      v42 = *(void **)(v40 + 40);
      long long v33 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v37 - v25 * v41, v39 - v27 * v41);
      [v42 setObject:v33 forKey:*(void *)(a1 + 32)];
    }

    goto LABEL_12;
  }
  if (v31 < v30)
  {
    v44 = [*(id *)(v29 + 40) objectForKey:*(void *)(a1 + 32)];
    [v44 CGPointValue];
    double v46 = v45;
    double v48 = v47;

    v49 = *(void **)(*(void *)(a1 + 40) + 40);
    v50 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v46 - v25 * (v6 / v31), v48 - v27 * (v6 / v31));
    [v49 setObject:v50 forKey:*(void *)(a1 + 32)];
  }
  BOOL v43 = 1;
LABEL_16:

  return v43;
}

- (void)stop
{
  self->_alpha = 0.0;
  [(CAShapeLayer *)self->_linesLayer removeFromSuperlayer];
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)start
{
  [(NSMapTable *)self->_weights removeAllObjects];
  links = self->_links;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __30__CKForceLayoutAnimator_start__block_invoke;
  v11[3] = &unk_2648FFC88;
  v11[4] = self;
  [(NSMutableSet *)links enumerateObjectsUsingBlock:v11];
  [(NSMapTable *)self->_previousCenters removeAllObjects];
  nodes = self->_nodes;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __30__CKForceLayoutAnimator_start__block_invoke_2;
  v10[3] = &unk_2648FFCB0;
  v10[4] = self;
  [(NSMutableSet *)nodes enumerateObjectsUsingBlock:v10];
  self->_alpha = fmax(self->_alpha, 0.100000001);
  double v5 = [(UIView *)self->_referenceView layer];
  [v5 insertSublayer:self->_linesLayer atIndex:0];

  displayLink = self->_displayLink;
  if (!displayLink)
  {
    CGFloat v7 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_tick];
    double v8 = self->_displayLink;
    self->_displayLink = v7;

    displayLink = self->_displayLink;
  }
  double v9 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [(CADisplayLink *)displayLink addToRunLoop:v9 forMode:*MEMORY[0x263EFF588]];
}

void __30__CKForceLayoutAnimator_start__block_invoke(uint64_t a1, void *a2)
{
  id v13 = [a2 allObjects];
  id v3 = [v13 firstObject];
  double v4 = [v13 lastObject];
  double v5 = *(void **)(*(void *)(a1 + 32) + 32);
  double v6 = NSNumber;
  CGFloat v7 = [v5 objectForKey:v3];
  double v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "integerValue") + 1);
  [v5 setObject:v8 forKey:v3];

  double v9 = *(void **)(*(void *)(a1 + 32) + 32);
  double v10 = NSNumber;
  double v11 = [v9 objectForKey:v4];
  double v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue") + 1);
  [v9 setObject:v12 forKey:v4];
}

void __30__CKForceLayoutAnimator_start__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = (void *)MEMORY[0x263F08D40];
  id v4 = a2;
  [v4 center];
  objc_msgSend(v3, "valueWithCGPoint:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v5 forKey:v4];
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha == 0.0)
  {
    if (a3 > 0.0)
    {
      self->_alpha = a3;
      [(CADisplayLink *)self->_displayLink setPaused:0];
    }
  }
  else
  {
    self->_alpha = fmax(a3, 0.0);
  }
}

- (void)releaseNode:(id)a3
{
}

- (void)fixNode:(id)a3 atPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  fixedNodes = self->_fixedNodes;
  id v8 = a3;
  [(NSMapTable *)fixedNodes setObject:MEMORY[0x263EFFA88] forKey:v8];
  previousCenters = self->_previousCenters;
  objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMapTable *)previousCenters setObject:v10 forKey:v8];
}

- (void)unlinkNode:(id)a3 fromNode:(id)a4
{
  links = self->_links;
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", a3, a4, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableSet *)links removeObject:v5];
}

- (void)linkNode:(id)a3 toNode:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CKForceLayoutAnimator.m", 98, @"Invalid parameter not satisfying: %@", @"firstNode" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  double v11 = [MEMORY[0x263F08690] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"CKForceLayoutAnimator.m", 99, @"Invalid parameter not satisfying: %@", @"secondNode" object file lineNumber description];

LABEL_3:
  links = self->_links;
  double v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v12, v7, 0);
  [(NSMutableSet *)links addObject:v9];
}

- (void)removeAllNodes
{
  [(NSMutableSet *)self->_links removeAllObjects];
  nodes = self->_nodes;
  [(NSMutableSet *)nodes removeAllObjects];
}

- (void)removeNode:(id)a3
{
  id v4 = a3;
  links = self->_links;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__CKForceLayoutAnimator_removeNode___block_invoke;
  v8[3] = &unk_2648FFC60;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(NSMutableSet *)links objectsPassingTest:v8];
  [(NSMutableSet *)links minusSet:v7];

  [(NSMutableSet *)self->_nodes removeObject:v6];
}

uint64_t __36__CKForceLayoutAnimator_removeNode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsObject:*(void *)(a1 + 32)];
}

- (void)addNode:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CKForceLayoutAnimator.m", 80, @"Invalid parameter not satisfying: %@", @"node" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = [v5 superview];
  char v7 = [v6 isEqual:self->_referenceView];

  if ((v7 & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CKForceLayoutAnimator.m" lineNumber:81 description:@"Nodes must be direct children of the reference view"];
  }
  [(NSMutableSet *)self->_nodes addObject:v10];
}

- (void)setLineWidth:(double)a3
{
}

- (double)lineWidth
{
  [(CAShapeLayer *)self->_linesLayer lineWidth];
  return result;
}

- (UIColor)lineColor
{
  v2 = (void *)MEMORY[0x263F825C8];
  id v3 = [(CAShapeLayer *)self->_linesLayer strokeColor];
  return (UIColor *)[v2 colorWithCGColor:v3];
}

- (void)setLineColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];
  linesLayer = self->_linesLayer;
  [(CAShapeLayer *)linesLayer setStrokeColor:v4];
}

- (CKForceLayoutAnimator)initWithReferenceView:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    double v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"CKForceLayoutAnimator.m", 36, @"Invalid parameter not satisfying: %@", @"referenceView" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)CKForceLayoutAnimator;
  char v7 = [(CKForceLayoutAnimator *)&v28 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_referenceView, a3);
    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    nodes = v8->_nodes;
    v8->_nodes = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    links = v8->_links;
    v8->_links = (NSMutableSet *)v11;

    uint64_t v13 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    weights = v8->_weights;
    v8->_weights = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    previousCenters = v8->_previousCenters;
    v8->_previousCenters = (NSMapTable *)v15;

    uint64_t v17 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    fixedNodes = v8->_fixedNodes;
    v8->_fixedNodes = (NSMapTable *)v17;

    *(_OWORD *)&v8->_linkDistance = xmmword_22BF63790;
    *(_OWORD *)&v8->_friction = xmmword_22BF637A0;
    *(_OWORD *)&v8->_chargeDistance = xmmword_22BF637B0;
    v8->_gravitdouble y = 0.100000001;
    uint64_t v19 = [MEMORY[0x263F15880] layer];
    linesLayer = v8->_linesLayer;
    v8->_linesLayer = (CAShapeLayer *)v19;

    double v21 = [MEMORY[0x263F825C8] systemBlueColor];
    double v22 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:1];
    double v23 = [v21 resolvedColorWithTraitCollection:v22];
    id v24 = [v23 colorWithAlphaComponent:0.4];
    -[CAShapeLayer setStrokeColor:](v8->_linesLayer, "setStrokeColor:", [v24 CGColor]);

    id v25 = [MEMORY[0x263F825C8] clearColor];
    -[CAShapeLayer setFillColor:](v8->_linesLayer, "setFillColor:", [v25 CGColor]);
  }
  return v8;
}

- (CKForceLayoutAnimator)init
{
  return [(CKForceLayoutAnimator *)self initWithReferenceView:0];
}

@end