@interface HKAnnotatedHorizontalLineSeries
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)supportsMultiTouchSelection;
- (CGRect)_boundsForString:(id)a3 coordinate:(id)a4 valueAttributes:(id)a5 rectsToAvoid:(id)a6;
- (HKAnnotatedHorizontalLineSeries)init;
- (NSDictionary)horizontalLineStyles;
- (NSDictionary)horizontalLineStylesStorage;
- (NSLock)seriesMutableStateLock;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)valueOutlineWidth;
- (double)valueOutlineWidthStorage;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)_defaultLabelStyle;
- (id)_defaultLineStyle;
- (id)_horizontalLineSeriesStyleForBlockCoordinate:(id)a3;
- (id)_stringValueForCoordinate:(id)a3 valueStyle:(id)a4;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)setHorizontalLineStyles:(id)a3;
- (void)setHorizontalLineStylesStorage:(id)a3;
- (void)setValueOutlineWidth:(double)a3;
- (void)setValueOutlineWidthStorage:(double)a3;
@end

@implementation HKAnnotatedHorizontalLineSeries

- (HKAnnotatedHorizontalLineSeries)init
{
  v7.receiver = self;
  v7.super_class = (Class)HKAnnotatedHorizontalLineSeries;
  v2 = [(HKGraphSeries *)&v7 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKAnnotatedHorizontalLineSeriesLock"];
    horizontalLineStylesStorage = v2->_horizontalLineStylesStorage;
    v2->_horizontalLineStylesStorage = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v2->_valueOutlineWidthStorage = 0.0;
  }
  return v2;
}

- (NSDictionary)horizontalLineStyles
{
  v3 = [(HKAnnotatedHorizontalLineSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_horizontalLineStylesStorage;
  v5 = [(HKAnnotatedHorizontalLineSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setHorizontalLineStyles:(id)a3
{
  id v4 = a3;
  v5 = [(HKAnnotatedHorizontalLineSeries *)self seriesMutableStateLock];
  [v5 lock];

  v6 = (NSDictionary *)[v4 copy];
  horizontalLineStylesStorage = self->_horizontalLineStylesStorage;
  self->_horizontalLineStylesStorage = v6;

  id v8 = [(HKAnnotatedHorizontalLineSeries *)self seriesMutableStateLock];
  [v8 unlock];
}

- (double)valueOutlineWidth
{
  v3 = [(HKAnnotatedHorizontalLineSeries *)self seriesMutableStateLock];
  [v3 lock];

  double valueOutlineWidthStorage = self->_valueOutlineWidthStorage;
  v5 = [(HKAnnotatedHorizontalLineSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return valueOutlineWidthStorage;
}

- (void)setValueOutlineWidth:(double)a3
{
  v5 = [(HKAnnotatedHorizontalLineSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_double valueOutlineWidthStorage = a3;
  id v6 = [(HKAnnotatedHorizontalLineSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v64 = a9;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __174__HKAnnotatedHorizontalLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v82[3] = &unk_1E6D55990;
  id v16 = v15;
  id v83 = v16;
  long long v17 = *(_OWORD *)&a6->c;
  v81[0] = *(_OWORD *)&a6->a;
  v81[1] = v17;
  v81[2] = *(_OWORD *)&a6->tx;
  v65 = v13;
  [v13 enumerateCoordinatesWithTransform:v81 roundToViewScale:1 block:v82];
  [v16 sortUsingComparator:&__block_literal_global_74];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v16;
  uint64_t v18 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v78;
    uint64_t v67 = *MEMORY[0x1E4FB06F8];
    uint64_t v66 = *MEMORY[0x1E4FB0700];
    uint64_t v68 = *(void *)v78;
    id v69 = v14;
    do
    {
      uint64_t v21 = 0;
      uint64_t v72 = v19;
      do
      {
        if (*(void *)v78 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v77 + 1) + 8 * v21);
        v23 = [v22 coordinate];
        v24 = [v22 originalCoordinate];
        if (([v14 containsObject:v23] & 1) == 0)
        {
          [v14 addObject:v23];
          CGContextSaveGState(a7);
          v25 = [(HKAnnotatedHorizontalLineSeries *)self _horizontalLineSeriesStyleForBlockCoordinate:v23];
          v76 = v25;
          if (v25)
          {
            v26 = v25;
            v27 = [v25 lineStrokeStyle];
            [v26 valueStyle];
          }
          else
          {
            v27 = [(HKAnnotatedHorizontalLineSeries *)self _defaultLineStyle];
            [(HKAnnotatedHorizontalLineSeries *)self _defaultLabelStyle];
          v28 = };
          v74 = v28;
          v75 = v27;
          [v27 applyToContext:a7];
          [v27 lineWidth];
          double v30 = v29 * 0.5;
          [v23 startPoint];
          double v32 = v31;
          [v23 endPoint];
          double v34 = v32 + (v33 - v32) * 0.5;
          if (v34 >= v30 + v32) {
            double v35 = v30 + v32;
          }
          else {
            double v35 = v32 + (v33 - v32) * 0.5;
          }
          double v36 = v33 - v30;
          if (v34 >= v36) {
            CGFloat v37 = v34;
          }
          else {
            CGFloat v37 = v36;
          }
          [v23 startPoint];
          CGContextMoveToPoint(a7, v35, v38);
          [v23 endPoint];
          CGContextAddLineToPoint(a7, v37, v39);
          CGContextStrokePath(a7);
          CGContextRestoreGState(a7);
          [v23 startPoint];
          double v41 = v40;
          [v23 endPoint];
          if (v41 >= v42) {
            double v41 = v42;
          }
          if (v35 >= v37) {
            double v43 = v37;
          }
          else {
            double v43 = v35;
          }
          if (v35 >= v37) {
            double v44 = v35;
          }
          else {
            double v44 = v37;
          }
          double v45 = v44 - v43;
          [v23 startPoint];
          double v47 = v46;
          [v23 endPoint];
          if (v47 >= v48) {
            double v49 = v47;
          }
          else {
            double v49 = v48;
          }
          [v23 startPoint];
          double v51 = v50;
          [v23 endPoint];
          if (v51 >= v52) {
            double v53 = v52;
          }
          else {
            double v53 = v51;
          }
          v54 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v43, v41, v45, v49 - v53);
          [v70 addObject:v54];

          v55 = [(HKAnnotatedHorizontalLineSeries *)self _stringValueForCoordinate:v24 valueStyle:v28];
          v84[0] = v67;
          v56 = [v28 font];
          v84[1] = v66;
          v85[0] = v56;
          [v28 textColor];
          v58 = v57 = self;
          v85[1] = v58;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
          v60 = v59 = a7;

          self = v57;
          [(HKAnnotatedHorizontalLineSeries *)v57 _boundsForString:v55 coordinate:v23 valueAttributes:v60 rectsToAvoid:v70];
          v61 = +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", v55, v60);
          [v71 addObject:v61];

          a7 = v59;
          uint64_t v20 = v68;
          id v14 = v69;
          uint64_t v19 = v72;
        }

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
    }
    while (v19);
  }

  if (([v64 seriesDrawingDuringTiling] & 1) != 0
    || [v64 seriesDrawingDuringScrolling])
  {
    uint64_t v62 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
  }
  else
  {
    uint64_t v62 = [MEMORY[0x1E4FB1618] clearColor];
  }
  v63 = (void *)v62;
  [(HKAnnotatedHorizontalLineSeries *)self valueOutlineWidth];
  +[HKStringDrawing drawStrings:outlineWidth:outlineColor:context:](HKStringDrawing, "drawStrings:outlineWidth:outlineColor:context:", v71, v63, a7);
}

void __174__HKAnnotatedHorizontalLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v8 = objc_alloc_init(CoordinateTuple);
  [(CoordinateTuple *)v8 setCoordinate:v7];

  [(CoordinateTuple *)v8 setOriginalCoordinate:v6];
  [*(id *)(a1 + 32) addObject:v8];
}

uint64_t __174__HKAnnotatedHorizontalLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 coordinate];
  id v6 = [v4 coordinate];

  [v5 endPoint];
  double v8 = v7;
  [v6 endPoint];
  if (v8 == v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    [v5 endPoint];
    double v12 = v11;
    [v6 endPoint];
    if (v12 >= v13) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = -1;
    }
  }

  return v10;
}

- (id)_horizontalLineSeriesStyleForBlockCoordinate:(id)a3
{
  id v4 = a3;
  v5 = [(HKAnnotatedHorizontalLineSeries *)self horizontalLineStyles];
  id v6 = NSNumber;
  uint64_t v7 = [v4 styleIdentifier];

  double v8 = [v6 numberWithInteger:v7];
  double v9 = [v5 objectForKeyedSubscript:v8];

  return v9;
}

- (id)_defaultLineStyle
{
  v2 = [MEMORY[0x1E4FB1618] blackColor];
  v3 = +[HKStrokeStyle strokeStyleWithColor:v2 lineWidth:2.0];

  return v3;
}

- (id)_defaultLabelStyle
{
  v2 = [MEMORY[0x1E4FB1618] blackColor];
  v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  id v4 = +[HKAxisLabelStyle labelStyleWithColor:v2 font:v3 horizontalAlignment:2 verticalAlignment:2];

  return v4;
}

- (id)_stringValueForCoordinate:(id)a3 valueStyle:(id)a4
{
  id v5 = a3;
  id v6 = [a4 numberFormatter];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    HKDecimalFormatter(0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v9 = v8;

  uint64_t v10 = NSNumber;
  [v5 startPoint];
  double v12 = v11;

  double v13 = [v10 numberWithDouble:v12];
  id v14 = [v9 stringFromNumber:v13 displayType:0 unitController:0];

  return v14;
}

- (CGRect)_boundsForString:(id)a3 coordinate:(id)a4 valueAttributes:(id)a5 rectsToAvoid:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  [a3 sizeWithAttributes:a5];
  double v12 = v11;
  double v14 = v13;
  [v9 endPoint];
  double v16 = v15 + -4.0 - v14;
  if (v16 < 0.0)
  {
    [v9 endPoint];
    double v16 = v17 + 4.0;
  }
  if ([v9 styleIdentifier] == 2)
  {
    [v9 startPoint];
    double v19 = v18;
  }
  else
  {
    [v9 endPoint];
    double v19 = v20 - v12;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = v10;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "CGRectValue", (void)v35);
        v43.origin.x = v26;
        v43.origin.y = v27;
        v43.size.width = v28;
        v43.size.height = v29;
        v41.origin.x = v19;
        v41.origin.y = v16;
        v41.size.width = v12;
        v41.size.height = v14;
        if (CGRectIntersectsRect(v41, v43))
        {
          [v9 endPoint];
          double v16 = v30 + 4.0;
          goto LABEL_16;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  double v31 = v19;
  double v32 = v16;
  double v33 = v12;
  double v34 = v14;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  double v13 = [a3 chartPoints];
  if (!v13)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKAnnotatedHorizontalLineSeries.m", 268, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  double v14 = [v11 transform];
  double v15 = [v12 transform];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__HKAnnotatedHorizontalLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E6D559D8;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [v13 enumerateObjectsUsingBlock:v25];
  long long v23 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  double v20 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v17 blockPath:&v23];

  return v20;
}

void __77__HKAnnotatedHorizontalLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  v3 = [v19 yValue];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v19 minXValueAsGenericType];
    [v4 coordinateForValue:v5];
    double v7 = v6;

    id v8 = *(void **)(a1 + 32);
    id v9 = [v19 maxXValueAsGenericType];
    [v8 coordinateForValue:v9];
    double v11 = v10;

    id v12 = *(void **)(a1 + 40);
    double v13 = [v19 yValue];
    [v12 coordinateForValue:v13];
    double v15 = v14;

    uint64_t v16 = [v19 styleIdentifier];
    id v17 = [v19 userInfo];
    id v18 = -[_HKAnnotatedHorizontalLineBlockCoordinate initWithStartPoint:endPoint:styleIdentifier:userInfo:]([_HKAnnotatedHorizontalLineBlockCoordinate alloc], "initWithStartPoint:endPoint:styleIdentifier:userInfo:", v16, v17, v7, v15, v11, v15);
    [*(id *)(a1 + 48) addObject:v18];
  }
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a3.y;
  double v10 = a3.x;
  id v12 = a4;
  -[HKAnnotatedHorizontalLineSeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](self, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  double v14 = v13;
  -[HKAnnotatedHorizontalLineSeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](self, "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  double v16 = v15;

  return sqrt(v16 * v16 + v14 * v14);
}

- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"HKAnnotatedHorizontalLineSeries.m" lineNumber:319 description:@"xAxisSelectedCoordinate type class failure"];
  }
  id v9 = v8;
  double v10 = [(HKGraphSeries *)self delegate];

  if (v10)
  {
    double v11 = [(HKGraphSeries *)self delegate];
    [v11 snapScreenCoordinateToXAxisResolution:a3];
    a3 = v12;
  }
  [v9 startXValue];
  if (a3 >= v13) {
    double v14 = a3;
  }
  else {
    double v14 = v13;
  }
  [v9 endXValue];
  double v16 = v15;

  if (v14 < v16) {
    double v16 = v14;
  }

  return v16;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"HKAnnotatedHorizontalLineSeries.m" lineNumber:333 description:@"xAxisDistanceFromPoint type class failure"];
  }
  id v9 = v8;
  [v9 startXValue];
  double v11 = v10 - x;
  [v9 endXValue];
  double v13 = v12;

  double v14 = fmax(v11, 0.0);
  if (x - v13 <= 0.0) {
    double v15 = v14;
  }
  else {
    double v15 = x - v13;
  }

  return v15;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HKAnnotatedHorizontalLineSeries.m" lineNumber:348 description:@"xAxisDistanceFromPoint type class failure"];
  }
  [v8 startPoint];
  double v10 = v9 - y;

  return v10;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"HKAnnotatedHorizontalLineSeries.m" lineNumber:356 description:@"blockCoordinate:lessThan: class type failure"];
  }
  id v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"HKAnnotatedHorizontalLineSeries.m" lineNumber:359 description:@"blockCoordinate:lessThan: class type failure"];
  }
  id v10 = v8;
  [v9 startPoint];
  double v12 = v11;
  [v10 startPoint];
  double v14 = v13;

  return v12 < v14;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"HKAnnotatedHorizontalLineSeries.m" lineNumber:368 description:@"blockCoordinate:lessThan: class type failure"];
  }
  id v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"HKAnnotatedHorizontalLineSeries.m" lineNumber:371 description:@"blockCoordinate:lessThan: class type failure"];
  }
  id v10 = v8;
  [v9 startPoint];
  double v12 = v11;
  [v10 startPoint];
  double v14 = v13;

  return v12 > v14;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (NSDictionary)horizontalLineStylesStorage
{
  return self->_horizontalLineStylesStorage;
}

- (void)setHorizontalLineStylesStorage:(id)a3
{
}

- (double)valueOutlineWidthStorage
{
  return self->_valueOutlineWidthStorage;
}

- (void)setValueOutlineWidthStorage:(double)a3
{
  self->_double valueOutlineWidthStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalLineStylesStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end