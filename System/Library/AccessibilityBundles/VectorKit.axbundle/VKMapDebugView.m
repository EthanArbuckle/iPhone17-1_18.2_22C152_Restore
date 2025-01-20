@interface VKMapDebugView
+ (id)sharedInstance;
- (AXVKExplorationVertexElement)currentExplorationElement;
- (CGPoint)currentPoint;
- (CGPoint)frontierPoint;
- (NSMutableArray)buildingPaths;
- (NSMutableArray)poiPaths;
- (NSMutableArray)roadPaths;
- (NSMutableArray)roadPoints;
- (NSMutableSet)intersectionPoints;
- (NSString)debugMessage;
- (VKMapDebugView)initWithFrame:(CGRect)a3;
- (void)_addValidPaths:(id)a3 array:(id)a4;
- (void)_orientationDidChange:(id)a3;
- (void)addBuildingPaths:(id)a3;
- (void)addIntersectionPoints:(id)a3;
- (void)addPOIPaths:(id)a3;
- (void)addRoadPaths:(id)a3;
- (void)addRoadPoints:(id)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)removeExplorationPointsAndPaths;
- (void)removePointsAndPaths;
- (void)setBuildingPaths:(id)a3;
- (void)setCurrentExplorationElement:(id)a3;
- (void)setCurrentExplorationVertex:(id)a3;
- (void)setCurrentPoint:(CGPoint)a3;
- (void)setCurrentPoint:(CGPoint)a3 frontierPoint:(CGPoint)a4;
- (void)setDebugMessage:(id)a3;
- (void)setFrontierPoint:(CGPoint)a3;
- (void)setIntersectionPoints:(id)a3;
- (void)setPoiPaths:(id)a3;
- (void)setRoadPaths:(id)a3;
- (void)setRoadPoints:(id)a3;
@end

@implementation VKMapDebugView

+ (id)sharedInstance
{
  return 0;
}

- (void)setDebugMessage:(id)a3
{
  v6 = (NSString *)a3;
  if (self->_debugMessage != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    debugMessage = self->_debugMessage;
    self->_debugMessage = v4;

    [(VKMapDebugView *)self setNeedsDisplay];
  }
}

- (void)_orientationDidChange:(id)a3
{
}

uint64_t __40__VKMapDebugView__orientationDidChange___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  v3 = *(void **)(a1 + 32);

  return [v3 setNeedsDisplay];
}

- (void)addBuildingPaths:(id)a3
{
  id v5 = a3;
  v4 = [(VKMapDebugView *)self buildingPaths];
  [(VKMapDebugView *)self _addValidPaths:v5 array:v4];
}

- (void)setCurrentPoint:(CGPoint)a3 frontierPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[VKMapDebugView setCurrentPoint:](self, "setCurrentPoint:", a3.x, a3.y);
  -[VKMapDebugView setFrontierPoint:](self, "setFrontierPoint:", x, y);

  [(VKMapDebugView *)self setNeedsDisplay];
}

- (void)addIntersectionPoints:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        v9 = [(VKMapDebugView *)self intersectionPoints];
        [v9 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(VKMapDebugView *)self setNeedsDisplay];
}

- (void)addPOIPaths:(id)a3
{
  id v5 = a3;
  id v4 = [(VKMapDebugView *)self poiPaths];
  [(VKMapDebugView *)self _addValidPaths:v5 array:v4];
}

- (void)addRoadPoints:(id)a3
{
  id v5 = a3;
  id v4 = [(VKMapDebugView *)self roadPoints];
  [v4 addObjectsFromArray:v5];
}

- (void)addRoadPaths:(id)a3
{
  id v5 = a3;
  id v4 = [(VKMapDebugView *)self roadPaths];
  [(VKMapDebugView *)self _addValidPaths:v5 array:v4];
}

- (void)setCurrentExplorationVertex:(id)a3
{
  objc_storeStrong((id *)&self->_currentExplorationElement, a3);

  [(VKMapDebugView *)self setNeedsDisplay];
}

- (void)removePointsAndPaths
{
  v3 = [(VKMapDebugView *)self buildingPaths];
  [v3 removeAllObjects];

  id v4 = (double *)MEMORY[0x263F00148];
  -[VKMapDebugView setCurrentPoint:](self, "setCurrentPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  -[VKMapDebugView setFrontierPoint:](self, "setFrontierPoint:", *v4, v4[1]);
  id v5 = [(VKMapDebugView *)self poiPaths];
  [v5 removeAllObjects];

  uint64_t v6 = [(VKMapDebugView *)self roadPaths];
  [v6 removeAllObjects];

  uint64_t v7 = [(VKMapDebugView *)self roadPoints];
  [v7 removeAllObjects];

  [(VKMapDebugView *)self setDebugMessage:0];

  [(VKMapDebugView *)self setNeedsDisplay];
}

- (void)removeExplorationPointsAndPaths
{
  [(VKMapDebugView *)self setCurrentExplorationElement:0];
  id v3 = [(VKMapDebugView *)self intersectionPoints];
  [v3 removeAllObjects];
}

- (void)_addValidPaths:(id)a3 array:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(const CGPath **)(*((void *)&v17 + 1) + 8 * i);
        BoundingBoCGFloat x = CGPathGetBoundingBox(v12);
        CGFloat x = BoundingBox.origin.x;
        CGFloat y = BoundingBox.origin.y;
        CGFloat width = BoundingBox.size.width;
        CGFloat height = BoundingBox.size.height;
        if (!CGRectIsEmpty(BoundingBox))
        {
          v24.origin.CGFloat x = x;
          v24.origin.CGFloat y = y;
          v24.size.CGFloat width = width;
          v24.size.CGFloat height = height;
          if (!CGRectIsInfinite(v24))
          {
            v25.origin.CGFloat x = x;
            v25.origin.CGFloat y = y;
            v25.size.CGFloat width = width;
            v25.size.CGFloat height = height;
            if (!CGRectIsNull(v25)) {
              objc_msgSend(v7, "addObject:", v12, (void)v17);
            }
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  [(VKMapDebugView *)self setNeedsDisplay];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D1B0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)VKMapDebugView;
  [(VKMapDebugView *)&v4 dealloc];
}

- (VKMapDebugView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)VKMapDebugView;
  id v3 = -[VKMapDebugView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    buildingPaths = v3->_buildingPaths;
    v3->_buildingPaths = v4;

    id v6 = (CGPoint *)MEMORY[0x263F00148];
    v3->_currentPoint = (CGPoint)*MEMORY[0x263F00148];
    v3->_frontierPoint = *v6;
    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    intersectionPoints = v3->_intersectionPoints;
    v3->_intersectionPoints = v7;

    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    poiPaths = v3->_poiPaths;
    v3->_poiPaths = v9;

    long long v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    roadPaths = v3->_roadPaths;
    v3->_roadPaths = v11;

    long long v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    roadPoints = v3->_roadPoints;
    v3->_roadPoints = v13;

    uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v3 selector:sel__orientationDidChange_ name:*MEMORY[0x263F1D1B0] object:0];
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v148 = *MEMORY[0x263EF8340];
  id v3 = [(VKMapDebugView *)self currentExplorationElement];

  if (v3)
  {
    objc_super v4 = [(VKMapDebugView *)self currentExplorationElement];
    [v4 getScreenPoint];
    double v6 = v5;
    double v8 = v7;

    v109 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v8, 26.0, 0.0, 6.28318531);
    uint64_t v9 = [MEMORY[0x263F1C550] redColor];
    uint64_t v10 = [v9 colorWithAlphaComponent:0.5];
    [v10 setStroke];

    [v109 setLineWidth:2.0];
    [v109 stroke];
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v11 = [(VKMapDebugView *)self currentExplorationElement];
    long long v12 = [v11 edges];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v135 objects:v147 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v136;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v136 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = *(void **)(*((void *)&v135 + 1) + 8 * i);
          objc_super v17 = [MEMORY[0x263F1C478] bezierPath];
          long long v18 = [v16 vertices];
          if ((unint64_t)[v18 count] >= 2)
          {
            long long v19 = [v18 firstObject];
            [v19 getScreenPoint];
            objc_msgSend(v17, "moveToPoint:");

            long long v20 = [v18 objectAtIndex:1];
            [v20 getScreenPoint];
            objc_msgSend(v17, "addLineToPoint:");

            v21 = [MEMORY[0x263F1C550] redColor];
            uint64_t v22 = [v21 colorWithAlphaComponent:0.5];
            [v22 setStroke];

            [v17 setLineWidth:2.0];
            [v17 stroke];
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v135 objects:v147 count:16];
      }
      while (v13);
    }

    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    v23 = [(VKMapDebugView *)self currentExplorationElement];
    CGRect v24 = [v23 neighbors];

    uint64_t v25 = [v24 countByEnumeratingWithState:&v131 objects:v146 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v132;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v132 != v26) {
            objc_enumerationMutation(v24);
          }
          v28 = *(void **)(*((void *)&v131 + 1) + 8 * j);
          [v28 getScreenPoint];
          v29 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
          if ([v28 isComputed])
          {
            v30 = [MEMORY[0x263F1C550] redColor];
            [v30 colorWithAlphaComponent:0.5];
          }
          else
          {
            v30 = [MEMORY[0x263F1C550] redColor];
            [v30 colorWithAlphaComponent:0.0];
          v31 = };
          [v31 setFill];

          [v29 fill];
          v32 = [MEMORY[0x263F1C550] redColor];
          v33 = [v32 colorWithAlphaComponent:0.5];
          [v33 setStroke];

          [v29 setLineWidth:2.0];
          [v29 stroke];
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v131 objects:v146 count:16];
      }
      while (v25);
    }
  }
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  v34 = [(VKMapDebugView *)self roadPaths];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v127 objects:v145 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v128;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v128 != v36) {
          objc_enumerationMutation(v34);
        }
        v38 = *(const CGPath **)(*((void *)&v127 + 1) + 8 * k);
        if (!CGPathIsEmpty(v38))
        {
          v39 = [MEMORY[0x263F1C478] bezierPathWithCGPath:v38];
          [v39 setLineWidth:1.0];
          v40 = [MEMORY[0x263F1C550] blueColor];
          v41 = [v40 colorWithAlphaComponent:0.125];
          [v41 setFill];

          v42 = [MEMORY[0x263F1C550] blueColor];
          [v42 setStroke];

          [v39 fill];
          [v39 stroke];
          v43 = [MEMORY[0x263F1C550] blueColor];
          v44 = [v43 colorWithAlphaComponent:0.800000012];
          [v44 setStroke];

          [v39 stroke];
        }
      }
      uint64_t v35 = [v34 countByEnumeratingWithState:&v127 objects:v145 count:16];
    }
    while (v35);
  }

  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  v45 = [(VKMapDebugView *)self poiPaths];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v123 objects:v144 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v124;
    do
    {
      for (uint64_t m = 0; m != v46; ++m)
      {
        if (*(void *)v124 != v47) {
          objc_enumerationMutation(v45);
        }
        v49 = *(const CGPath **)(*((void *)&v123 + 1) + 8 * m);
        if (!CGPathIsEmpty(v49))
        {
          v50 = [MEMORY[0x263F1C478] bezierPathWithCGPath:v49];
          [v50 setLineWidth:1.0];
          v51 = [MEMORY[0x263F1C550] greenColor];
          v52 = [v51 colorWithAlphaComponent:0.125];
          [v52 setFill];

          v53 = [MEMORY[0x263F1C550] greenColor];
          [v53 setStroke];

          [v50 fill];
          [v50 stroke];
          v54 = [MEMORY[0x263F1C550] greenColor];
          v55 = [v54 colorWithAlphaComponent:0.800000012];
          [v55 setStroke];

          [v50 stroke];
        }
      }
      uint64_t v46 = [v45 countByEnumeratingWithState:&v123 objects:v144 count:16];
    }
    while (v46);
  }

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  v56 = [(VKMapDebugView *)self intersectionPoints];
  uint64_t v57 = [v56 countByEnumeratingWithState:&v119 objects:v143 count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v120;
    do
    {
      for (uint64_t n = 0; n != v57; ++n)
      {
        if (*(void *)v120 != v58) {
          objc_enumerationMutation(v56);
        }
        [*(id *)(*((void *)&v119 + 1) + 8 * n) CGPointValue];
        v62 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", v60 + -6.0, v61 + -6.0, 12.0, 12.0, 3.0);
        [v62 setLineWidth:2.0];
        v63 = [MEMORY[0x263F1C550] redColor];
        v64 = [v63 colorWithAlphaComponent:0.125];
        [v64 setFill];

        v65 = [MEMORY[0x263F1C550] redColor];
        [v65 setStroke];

        [v62 fill];
        [v62 stroke];
      }
      uint64_t v57 = [v56 countByEnumeratingWithState:&v119 objects:v143 count:16];
    }
    while (v57);
  }

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  v66 = [(VKMapDebugView *)self roadPoints];
  uint64_t v67 = [v66 countByEnumeratingWithState:&v115 objects:v142 count:16];
  if (v67)
  {
    uint64_t v68 = *(void *)v116;
    do
    {
      for (iuint64_t i = 0; ii != v67; ++ii)
      {
        if (*(void *)v116 != v68) {
          objc_enumerationMutation(v66);
        }
        [*(id *)(*((void *)&v115 + 1) + 8 * ii) CGPointValue];
        v72 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", v70 + -2.0, v71 + -2.0, 4.0, 4.0, 3.0);
        [v72 setLineWidth:1.0];
        v73 = [MEMORY[0x263F1C550] blueColor];
        v74 = [v73 colorWithAlphaComponent:0.875];
        [v74 setFill];

        v75 = [MEMORY[0x263F1C550] blueColor];
        [v75 setStroke];

        [v72 fill];
        [v72 stroke];
      }
      uint64_t v67 = [v66 countByEnumeratingWithState:&v115 objects:v142 count:16];
    }
    while (v67);
  }

  [(VKMapDebugView *)self frontierPoint];
  v77 = (double *)MEMORY[0x263F00148];
  if (v78 != *MEMORY[0x263F00148] || v76 != *(double *)(MEMORY[0x263F00148] + 8))
  {
    v79 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
    [v79 setLineWidth:2.0];
    v80 = [MEMORY[0x263F1C550] orangeColor];
    v81 = [v80 colorWithAlphaComponent:0.125];
    [v81 setFill];

    v82 = [MEMORY[0x263F1C550] orangeColor];
    [v82 setStroke];

    [v79 fill];
    [v79 stroke];
  }
  [(VKMapDebugView *)self currentPoint];
  if (v84 != *v77 || v83 != v77[1])
  {
    v85 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
    [v85 setLineWidth:2.0];
    v86 = [MEMORY[0x263F1C550] orangeColor];
    v87 = [v86 colorWithAlphaComponent:0.125];
    [v87 setFill];

    v88 = [MEMORY[0x263F1C550] orangeColor];
    [v88 setStroke];

    [v85 fill];
    [v85 stroke];
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v89 = [(VKMapDebugView *)self buildingPaths];
  uint64_t v90 = [v89 countByEnumeratingWithState:&v111 objects:v141 count:16];
  if (v90)
  {
    uint64_t v91 = *(void *)v112;
    do
    {
      for (juint64_t j = 0; jj != v90; ++jj)
      {
        if (*(void *)v112 != v91) {
          objc_enumerationMutation(v89);
        }
        v93 = *(const CGPath **)(*((void *)&v111 + 1) + 8 * jj);
        if (!CGPathIsEmpty(v93))
        {
          v94 = [MEMORY[0x263F1C478] bezierPathWithCGPath:v93];
          [v94 setLineWidth:1.0];
          v95 = [MEMORY[0x263F1C550] purpleColor];
          v96 = [v95 colorWithAlphaComponent:0.125];
          [v96 setFill];

          v97 = [MEMORY[0x263F1C550] purpleColor];
          [v97 setStroke];

          [v94 fill];
          [v94 stroke];
        }
      }
      uint64_t v90 = [v89 countByEnumeratingWithState:&v111 objects:v141 count:16];
    }
    while (v90);
  }

  v98 = [(VKMapDebugView *)self debugMessage];
  [(VKMapDebugView *)self bounds];
  double v100 = v99;
  double v102 = v101;
  double v104 = v103;
  double v106 = v105;
  uint64_t v139 = *MEMORY[0x263F1C238];
  v107 = [MEMORY[0x263F1C658] boldSystemFontOfSize:24.0];
  v140 = v107;
  v108 = [NSDictionary dictionaryWithObjects:&v140 forKeys:&v139 count:1];
  objc_msgSend(v98, "drawInRect:withAttributes:", v108, v100, v102, v104, v106);
}

- (NSString)debugMessage
{
  return self->_debugMessage;
}

- (NSMutableArray)buildingPaths
{
  return self->_buildingPaths;
}

- (void)setBuildingPaths:(id)a3
{
}

- (CGPoint)currentPoint
{
  double x = self->_currentPoint.x;
  double y = self->_currentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentPoint:(CGPoint)a3
{
  self->_currentPoint = a3;
}

- (CGPoint)frontierPoint
{
  double x = self->_frontierPoint.x;
  double y = self->_frontierPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFrontierPoint:(CGPoint)a3
{
  self->_frontierPoint = a3;
}

- (NSMutableSet)intersectionPoints
{
  return self->_intersectionPoints;
}

- (void)setIntersectionPoints:(id)a3
{
}

- (NSMutableArray)poiPaths
{
  return self->_poiPaths;
}

- (void)setPoiPaths:(id)a3
{
}

- (NSMutableArray)roadPaths
{
  return self->_roadPaths;
}

- (void)setRoadPaths:(id)a3
{
}

- (NSMutableArray)roadPoints
{
  return self->_roadPoints;
}

- (void)setRoadPoints:(id)a3
{
}

- (AXVKExplorationVertexElement)currentExplorationElement
{
  return self->_currentExplorationElement;
}

- (void)setCurrentExplorationElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentExplorationElement, 0);
  objc_storeStrong((id *)&self->_roadPoints, 0);
  objc_storeStrong((id *)&self->_roadPaths, 0);
  objc_storeStrong((id *)&self->_poiPaths, 0);
  objc_storeStrong((id *)&self->_intersectionPoints, 0);
  objc_storeStrong((id *)&self->_buildingPaths, 0);

  objc_storeStrong((id *)&self->_debugMessage, 0);
}

@end