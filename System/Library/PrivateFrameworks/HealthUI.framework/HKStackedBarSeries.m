@interface HKStackedBarSeries
- (BOOL)shouldRoundBottomCorners;
- (BOOL)shouldRoundBottomCornersStorage;
- (HKStackedBarSeries)init;
- (NSArray)inactiveFillStyles;
- (NSArray)inactiveFillStylesStorage;
- (NSArray)selectedFillStyles;
- (NSArray)selectedFillStylesStorage;
- (NSArray)unselectedFillStyles;
- (NSArray)unselectedFillStylesStorage;
- (NSIndexSet)unseparatedSegmentIndices;
- (NSIndexSet)unseparatedSegmentIndicesStorage;
- (NSLock)seriesMutableStateLock;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (void)_drawLevels:(id)a3 withFillStyles:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7;
- (void)_strokeSeparatorIfNecessaryAboveSegment:(id)a3 belowSegment:(id)a4 strokeStyle:(id)a5 context:(CGContext *)a6;
- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8;
- (void)setInactiveFillStyles:(id)a3;
- (void)setInactiveFillStylesStorage:(id)a3;
- (void)setSelectedFillStyles:(id)a3;
- (void)setSelectedFillStylesStorage:(id)a3;
- (void)setShouldRoundBottomCorners:(BOOL)a3;
- (void)setShouldRoundBottomCornersStorage:(BOOL)a3;
- (void)setUnselectedFillStyles:(id)a3;
- (void)setUnselectedFillStylesStorage:(id)a3;
- (void)setUnseparatedSegmentIndices:(id)a3;
- (void)setUnseparatedSegmentIndicesStorage:(id)a3;
@end

@implementation HKStackedBarSeries

- (HKStackedBarSeries)init
{
  v12.receiver = self;
  v12.super_class = (Class)HKStackedBarSeries;
  v2 = [(HKBarSeries *)&v12 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKStackedBarSeriesLock"];
    selectedFillStylesStorage = v2->_selectedFillStylesStorage;
    v6 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_selectedFillStylesStorage = (NSArray *)MEMORY[0x1E4F1CBF0];

    unselectedFillStylesStorage = v2->_unselectedFillStylesStorage;
    v2->_unselectedFillStylesStorage = v6;

    inactiveFillStylesStorage = v2->_inactiveFillStylesStorage;
    v2->_inactiveFillStylesStorage = v6;

    v2->_shouldRoundBottomCornersStorage = 0;
    v9 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28D60]);
    unseparatedSegmentIndicesStorage = v2->_unseparatedSegmentIndicesStorage;
    v2->_unseparatedSegmentIndicesStorage = v9;
  }
  return v2;
}

- (void)setInactiveFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  inactiveFillStylesStorage = self->_inactiveFillStylesStorage;
  self->_inactiveFillStylesStorage = v6;

  id v8 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (void)setUnselectedFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  unselectedFillStylesStorage = self->_unselectedFillStylesStorage;
  self->_unselectedFillStylesStorage = v6;

  id v9 = [(NSArray *)self->_unselectedFillStylesStorage lastObject];
  id v8 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v8 unlock];

  [(HKBarSeries *)self setUnselectedFillStyle:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unseparatedSegmentIndicesStorage, 0);
  objc_storeStrong((id *)&self->_inactiveFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_unselectedFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_selectedFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

- (NSArray)selectedFillStyles
{
  v3 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_selectedFillStylesStorage;
  v5 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSelectedFillStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSArray *)[v4 copy];
  selectedFillStylesStorage = self->_selectedFillStylesStorage;
  self->_selectedFillStylesStorage = v6;

  id v8 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (NSArray)unselectedFillStyles
{
  v3 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_unselectedFillStylesStorage;
  v5 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (NSArray)inactiveFillStyles
{
  v3 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_inactiveFillStylesStorage;
  v5 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (BOOL)shouldRoundBottomCorners
{
  v3 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_shouldRoundBottomCornersStorage;
  id v4 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setShouldRoundBottomCorners:(BOOL)a3
{
  v5 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_shouldRoundBottomCornersStorage = a3;
  id v6 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (NSIndexSet)unseparatedSegmentIndices
{
  v3 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v3 lock];

  id v4 = self->_unseparatedSegmentIndicesStorage;
  v5 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setUnseparatedSegmentIndices:(id)a3
{
  id v4 = a3;
  v5 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v5 lock];

  id v6 = (NSIndexSet *)[v4 copy];
  unseparatedSegmentIndicesStorage = self->_unseparatedSegmentIndicesStorage;
  self->_unseparatedSegmentIndicesStorage = v6;

  id v8 = [(HKStackedBarSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  objc_super v12 = [a3 chartPoints];
  if (!v12)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"HKStackedBarSeries.m", 212, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  v39 = v10;
  v43 = [v10 transform];
  v38 = v11;
  v13 = [v11 transform];
  v42 = [MEMORY[0x1E4F1CA48] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v12;
  uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v44)
  {
    uint64_t v41 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v52 != v41) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v16 = [v15 xValueAsGenericType];
        [v43 coordinateForValue:v16];
        double v18 = v17;

        [v13 coordinateForValue:&unk_1F3C20980];
        double v20 = v19;
        v21 = [v15 allYValues];
        v22 = [MEMORY[0x1E4F1CA48] array];
        v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v18, v20);
        [v22 addObject:v23];

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v24 = v21;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v48 != v27) {
                objc_enumerationMutation(v24);
              }
              [v13 coordinateForValue:*(void *)(*((void *)&v47 + 1) + 8 * j)];
              v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v18, v29);
              [v22 addObject:v30];
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v26);
        }

        v31 = [HKStackedBarCoordinate alloc];
        v32 = [v15 userInfo];
        v33 = [(HKStackedBarCoordinate *)v31 initWithStackPoints:v22 userInfo:v32];

        [v42 addObject:v33];
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v44);
  }

  long long v45 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  v34 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v42 blockPath:&v45];

  return v34;
}

- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8
{
  double height = a7.size.height;
  double rect = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v16 = a8;
  id v17 = a3;
  if ([v16 seriesDrawingDuringTiling]
    && ([(HKBarSeries *)self tiledStrokeStyle], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v19 = (void *)v18;
    double v20 = [(HKBarSeries *)self tiledStrokeStyle];
  }
  else
  {
    double v20 = [(HKBarSeries *)self unselectedStrokeStyle];
  }
  v21 = [(HKBarSeries *)self unselectedStrokeStyle];
  [v21 lineWidth];
  double v23 = v22;

  id v24 = [(HKBarSeries *)self selectedStrokeStyle];
  [v24 lineWidth];
  double v26 = v25;

  if (v26 < v23) {
    double v26 = v23;
  }
  [v16 screenRectForSeries:self];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  -[HKBarSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4, v28, v30, v32, v34, v26);
  double v36 = v35;
  double v37 = v26 + v35;
  v69.origin.double x = x;
  v69.origin.double y = y;
  v69.size.width = rect;
  v69.size.double height = height;
  CGFloat MaxX = CGRectGetMaxX(v69);
  v70.origin.double x = x;
  v70.origin.double y = y;
  v70.size.width = rect;
  v70.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v70);
  v40 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v41 = [MEMORY[0x1E4F1CA48] array];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  [(HKGraphSeries *)self selectedPathRange];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __119__HKStackedBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke;
  v53[3] = &unk_1E6D535C8;
  CGFloat v57 = MinX;
  double v58 = v37;
  CGFloat v59 = MaxX;
  id v42 = v40;
  id v54 = v42;
  id v43 = v41;
  long long v60 = v65;
  long long v61 = v66;
  long long v62 = v67;
  long long v63 = v68;
  double v64 = v36;
  id v55 = v43;
  v56 = self;
  long long v44 = *(_OWORD *)&a5->c;
  v52[0] = *(_OWORD *)&a5->a;
  v52[1] = v44;
  v52[2] = *(_OWORD *)&a5->tx;
  [v17 enumerateCoordinatesWithTransform:v52 roundToViewScale:1 block:v53];

  if ([(HKGraphSeries *)self allowsSelection]) {
    [(HKStackedBarSeries *)self unselectedFillStyles];
  }
  else {
  long long v45 = [(HKStackedBarSeries *)self inactiveFillStyles];
  }
  -[HKStackedBarSeries _drawLevels:withFillStyles:strokeStyle:axisRect:context:](self, "_drawLevels:withFillStyles:strokeStyle:axisRect:context:", v42, v45, v20, a6, x, y, rect, height);
  v46 = [(HKStackedBarSeries *)self selectedFillStyles];
  long long v47 = v46;
  if (!v46)
  {
    long long v47 = [(HKStackedBarSeries *)self unselectedFillStyles];
  }
  uint64_t v48 = [(HKBarSeries *)self selectedStrokeStyle];
  long long v49 = (void *)v48;
  if (v48) {
    long long v50 = (void *)v48;
  }
  else {
    long long v50 = v20;
  }
  -[HKStackedBarSeries _drawLevels:withFillStyles:strokeStyle:axisRect:context:](self, "_drawLevels:withFillStyles:strokeStyle:axisRect:context:", v43, v47, v50, a6, x, y, rect, height);

  if (!v46) {
}
  }

void __119__HKStackedBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3)
{
  id v5 = a2;
  id v6 = [v5 stackPoints];
  v7 = [v6 firstObject];
  [v7 CGPointValue];
  double v9 = v8;
  double v64 = v10;

  id v11 = [v5 stackPoints];
  objc_super v12 = [v11 lastObject];
  [v12 CGPointValue];
  double v62 = v14;
  double v63 = v13;

  double v15 = *(double *)(a1 + 64);
  double v65 = v9;
  if (*(double *)(a1 + 56) - v9 <= v15 && v9 - *(double *)(a1 + 72) <= v15)
  {
    id v16 = [v5 stackPoints];
    uint64_t v17 = [v16 count];

    if (v17 != 1)
    {
      unint64_t v18 = 0;
      do
      {
        if (objc_msgSend(*(id *)(a1 + 32), "count", *(void *)&v62) <= v18)
        {
          double v19 = *(void **)(a1 + 32);
          double v20 = objc_alloc_init(_HKStackedBarLevel);
          [v19 addObject:v20];

          v21 = *(void **)(a1 + 40);
          double v22 = objc_alloc_init(_HKStackedBarLevel);
          [v21 addObject:v22];
        }
        double v23 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v18];
        long long v24 = a3[1];
        v67[0] = *a3;
        v67[1] = v24;
        long long v25 = *(_OWORD *)(a1 + 96);
        v66[0] = *(_OWORD *)(a1 + 80);
        v66[1] = v25;
        long long v26 = *(_OWORD *)(a1 + 128);
        v66[2] = *(_OWORD *)(a1 + 112);
        v66[3] = v26;
        if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v67, (uint64_t *)v66))
        {
          uint64_t v27 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v18];

          double v23 = (void *)v27;
        }
        double v28 = [v5 stackPoints];
        double v29 = [v28 objectAtIndexedSubscript:v18];
        [v29 CGPointValue];
        double v31 = v30;
        double v33 = v32;

        double v34 = [v5 stackPoints];
        unint64_t v35 = v18 + 1;
        double v36 = [v34 objectAtIndexedSubscript:v18 + 1];
        [v36 CGPointValue];
        double v38 = v37;
        double v40 = v39;

        if (v38 != v65 || v40 != v64)
        {
          if (v31 - v38 >= 0.0) {
            double v41 = v31 - v38;
          }
          else {
            double v41 = -(v31 - v38);
          }
          if (v33 - v40 >= 0.0) {
            double v42 = v33 - v40;
          }
          else {
            double v42 = -(v33 - v40);
          }
          double v43 = v38;
          double v44 = v40;
          CGRect v68 = CGRectStandardize(*(CGRect *)(&v41 - 2));
          CGRect v69 = CGRectOffset(v68, *(double *)(a1 + 144) * -0.5, 0.0);
          double x = v69.origin.x;
          double y = v69.origin.y;
          double height = v69.size.height;
          double v48 = *(double *)(a1 + 144) + v69.size.width;
          double v49 = v38 - v63;
          if (v38 - v63 < 0.0) {
            double v49 = -(v38 - v63);
          }
          double v50 = v40 - v62;
          if (v40 - v62 < 0.0) {
            double v50 = -(v40 - v62);
          }
          uint64_t v51 = 3;
          if (v50 > 0.00000011920929) {
            uint64_t v51 = 0;
          }
          if (v49 <= 0.00000011920929) {
            uint64_t v52 = v51;
          }
          else {
            uint64_t v52 = 0;
          }
          int v53 = [*(id *)(a1 + 48) shouldRoundBottomCorners];
          double v54 = v31 - v65;
          if (v31 - v65 < 0.0) {
            double v54 = -(v31 - v65);
          }
          double v55 = v33 - v64;
          if (v33 - v64 < 0.0) {
            double v55 = -(v33 - v64);
          }
          uint64_t v56 = v52 | 0xC;
          if (v55 > 0.00000011920929) {
            uint64_t v56 = v52;
          }
          if (v54 > 0.00000011920929) {
            uint64_t v56 = v52;
          }
          if (v53) {
            uint64_t v52 = v56;
          }
          CGFloat v57 = objc_alloc_init(_HKStackedBarSegment);
          -[_HKStackedBarSegment setRect:](v57, "setRect:", x, y, v48, height);
          [(_HKStackedBarSegment *)v57 setRoundedCorners:v52];
          double v58 = [*(id *)(a1 + 48) unseparatedSegmentIndices];
          -[_HKStackedBarSegment setShouldSeparateFromAdjacentSegments:](v57, "setShouldSeparateFromAdjacentSegments:", [v58 containsIndex:v18] ^ 1);

          CGFloat v59 = [v23 segments];
          [v59 addObject:v57];
        }
        long long v60 = [v5 stackPoints];
        unint64_t v61 = [v60 count] - 1;

        unint64_t v18 = v35;
      }
      while (v35 < v61);
    }
  }
}

- (void)_drawLevels:(id)a3 withFillStyles:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v53 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = [v53 count];
  unint64_t v18 = v17 - 1;
  if (v17 - 1 >= 0)
  {
    double v19 = &off_1E6D4F000;
    id v49 = v15;
    uint64_t v51 = self;
    do
    {
      unint64_t v52 = v17;
      double v20 = objc_msgSend(v53, "objectAtIndexedSubscript:", v18, v49);
      uint64_t v50 = v18;
      if (v18 >= [v15 count])
      {
        double v54 = 0;
      }
      else
      {
        double v54 = [v15 objectAtIndexedSubscript:v18];
      }
      v21 = [v20 segments];
      uint64_t v22 = [v21 count];

      if (v22)
      {
        unint64_t v23 = 0;
        do
        {
          long long v24 = [v20 segments];
          long long v25 = [v24 objectAtIndexedSubscript:v23];

          long long v26 = v19[64];
          [v25 rect];
          double v28 = v27;
          double v30 = v29;
          double v32 = v31;
          double v34 = v33;
          uint64_t v35 = [v25 roundedCorners];
          [(HKBarSeries *)self cornerRadii];
          double v38 = objc_msgSend(v26, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", v35, v28, v30, v32, v34, v36, v37);
          if (([v38 isEmpty] & 1) == 0)
          {
            if (v16)
            {
              if (v52 >= [v53 count])
              {
                double v44 = 0;
              }
              else
              {
                double v39 = objc_msgSend(v53, "objectAtIndexedSubscript:");
                [v39 segments];
                double v40 = v19;
                id v41 = v16;
                v43 = double v42 = a7;
                double v44 = [v43 objectAtIndexedSubscript:v23];

                a7 = v42;
                id v16 = v41;
                double v19 = v40;
                self = v51;
              }
              [(HKStackedBarSeries *)self _strokeSeparatorIfNecessaryAboveSegment:v25 belowSegment:v44 strokeStyle:v16 context:a7];
            }
            if (v54)
            {
              uint64_t v45 = [v38 CGPath];
              [(HKGraphSeries *)self alpha];
              objc_msgSend(v54, "renderPath:context:axisRect:alpha:", v45, a7, x, y, width, height, v46);
            }
          }

          ++v23;
          long long v47 = [v20 segments];
          unint64_t v48 = [v47 count];
        }
        while (v23 < v48);
      }

      id v15 = v49;
      unint64_t v18 = v50 - 1;
      uint64_t v17 = v50;
    }
    while (v50 > 0);
  }
}

- (void)_strokeSeparatorIfNecessaryAboveSegment:(id)a3 belowSegment:(id)a4 strokeStyle:(id)a5 context:(CGContext *)a6
{
  id v26 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v26 shouldSeparateFromAdjacentSegments];
  if (v9 && v11 && [v9 shouldSeparateFromAdjacentSegments])
  {
    objc_super v12 = [MEMORY[0x1E4FB14C0] bezierPath];
    [v26 rect];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [v10 lineWidth];
    double v22 = v21;
    v28.origin.double x = v14;
    v28.origin.double y = v16;
    v28.size.double width = v18;
    v28.size.double height = v20;
    double v23 = v22 * 0.5;
    CGFloat v24 = CGRectGetMinX(v28) - v22 * 0.5;
    v29.origin.double x = v14;
    v29.origin.double y = v16;
    v29.size.double width = v18;
    v29.size.double height = v20;
    objc_msgSend(v12, "moveToPoint:", v24, CGRectGetMinY(v29));
    v30.origin.double x = v14;
    v30.origin.double y = v16;
    v30.size.double width = v18;
    v30.size.double height = v20;
    double v25 = v23 + CGRectGetMaxX(v30);
    v31.origin.double x = v14;
    v31.origin.double y = v16;
    v31.size.double width = v18;
    v31.size.double height = v20;
    objc_msgSend(v12, "addLineToPoint:", v25, CGRectGetMinY(v31));
    if (([v12 isEmpty] & 1) == 0)
    {
      CGContextSaveGState(a6);
      [v10 applyToContext:a6];
      CGContextAddPath(a6, (CGPathRef)[v12 CGPath]);
      CGContextStrokePath(a6);
      CGContextRestoreGState(a6);
    }
  }
}

- (NSArray)selectedFillStylesStorage
{
  return self->_selectedFillStylesStorage;
}

- (void)setSelectedFillStylesStorage:(id)a3
{
}

- (NSArray)unselectedFillStylesStorage
{
  return self->_unselectedFillStylesStorage;
}

- (void)setUnselectedFillStylesStorage:(id)a3
{
}

- (NSArray)inactiveFillStylesStorage
{
  return self->_inactiveFillStylesStorage;
}

- (void)setInactiveFillStylesStorage:(id)a3
{
}

- (BOOL)shouldRoundBottomCornersStorage
{
  return self->_shouldRoundBottomCornersStorage;
}

- (void)setShouldRoundBottomCornersStorage:(BOOL)a3
{
  self->_shouldRoundBottomCornersStorage = a3;
}

- (NSIndexSet)unseparatedSegmentIndicesStorage
{
  return self->_unseparatedSegmentIndicesStorage;
}

- (void)setUnseparatedSegmentIndicesStorage:(id)a3
{
}

@end