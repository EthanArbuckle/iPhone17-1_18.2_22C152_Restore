@interface HKGraphViewRenderer
- (BOOL)_lastSeriesInMultiSeriesRow:(id)a3 series:(id)a4;
- (BOOL)chartMeasuringStartupTime;
- (BOOL)disableXAxis;
- (BOOL)drawingDuringAutoscale;
- (BOOL)drawingDuringScrolling;
- (BOOL)drawingToTile;
- (BOOL)seriesDrawingAsTopOverlay:(id)a3;
- (CGAffineTransform)xAxisCoordinateTransform;
- (CGPoint)contentOffset;
- (CGRect)fullChartRect;
- (CGRect)insetChartRect;
- (CGRect)insetDataArea;
- (CGRect)screenRectForSeries:(id)a3;
- (CGRect)scrollingAreaRect;
- (HKAxis)xAxis;
- (HKGraphRenderer)renderingView;
- (HKGraphViewRendererSeriesConfiguration)seriesConfiguration;
- (HKGraphViewRendererVirtualMarginConfiguration)virtualMargins;
- (HKGraphViewSelectionStyle)selectionLineStyle;
- (HKValueRange)actualVisibleRange;
- (HKValueRange)effectiveVisibleRangeActive;
- (HKValueRange)effectiveVisibleRangeCadence;
- (NSArray)gridlineRanges;
- (NSMutableArray)postOverlayData;
- (NSMutableArray)postSelectionPoints;
- (UIColor)outlineColor;
- (UIColor)selectionLineColor;
- (UIColor)tileBackgroundColor;
- (UIEdgeInsets)virtualMarginInsets;
- (double)_renderXAxisLabelsInContext:(CGContext *)a3;
- (double)bottomBaselineY;
- (double)currentXAxisHeight;
- (double)postXAxisHeight;
- (double)rightHandInactiveArea;
- (double)topBaselineY;
- (double)zoomScale;
- (id)axisAnnotationDelegateForSeries:(id)a3;
- (id)initWithRendererSeries:(double)a3 renderingView:(double)a4 fullChartRect:(double)a5 insetChartRect:(double)a6 insetDataArea:(double)a7 rightHandInactiveArea:(double)a8 zoomScale:(double)a9 traitResolution:(uint64_t)a10 contentOffset:(void *)a11 xAxisDateZoom:(void *)a12 drawingToTile:(void *)a13 tileColumn:(void *)a14 drawingDuringScrolling:(char)a15 drawingDuringAutoscale:(void *)a16 xAxis:(void *)a17 xAxisCoordinateTransform:(void *)a18 virtualMargins:(void *)a19 outlineColor:(void *)a20 tileBackgroundColor:(void *)a21 topBaselineY:(void *)a22 bottomBaselineY:(void *)a23 selectionLineColor:(void *)a24 selectionLineStyle:(char)a25 disableXAxis:(char)a26 currentXAxisHeight:(void *)a27 gridlineRanges:(long long *)a28 effectiveVisibleRangeCadence:(void *)a29 effectiveVisibleRangeActive:(void *)a30 actualVisibleRange:(void *)a31 scrollingAreaRect:(void *)a32 chartMeasuringStartupTime:(void *)a33;
- (int64_t)postUpdates;
- (int64_t)tileColumn;
- (int64_t)traitResolution;
- (int64_t)xAxisDateZoom;
- (void)_clearBackgroundInContext:(CGContext *)a3;
- (void)_renderBaselineWithContext:(CGContext *)a3 chartRect:(CGRect)a4;
- (void)_renderDataAreaDividersWithContext:(CGContext *)a3;
- (void)_renderSelectionLineWithContext:(CGContext *)a3;
- (void)_renderSeriesWithContext:(CGContext *)a3 secondaryRenderContext:(id)a4 chartRect:(CGRect)a5;
- (void)_renderVirtualMarginGridLines:(CGRect)a3 context:(CGContext *)a4;
- (void)_renderVirtualMarginInRect:(CGRect)a3 context:(CGContext *)a4 marginStyle:(int64_t)a5;
- (void)_renderVirtualMarginsWithContext:(CGContext *)a3;
- (void)_renderXAxisGridlinesInContext:(CGContext *)a3 withBlendMode:(int)a4;
- (void)_renderXAxisLabelAndGridsNeedsNewRendererInContext:(CGContext *)a3;
- (void)_renderYAxisGridlinesInContext:(CGContext *)a3 renderingView:(id)a4 chartRect:(CGRect)a5 withBlendMode:(int)a6 zoomScale:(double)a7 contentOffset:(CGPoint)a8;
- (void)renderContentToContext:(CGContext *)a3;
@end

@implementation HKGraphViewRenderer

- (id)initWithRendererSeries:(double)a3 renderingView:(double)a4 fullChartRect:(double)a5 insetChartRect:(double)a6 insetDataArea:(double)a7 rightHandInactiveArea:(double)a8 zoomScale:(double)a9 traitResolution:(uint64_t)a10 contentOffset:(void *)a11 xAxisDateZoom:(void *)a12 drawingToTile:(void *)a13 tileColumn:(void *)a14 drawingDuringScrolling:(char)a15 drawingDuringAutoscale:(void *)a16 xAxis:(void *)a17 xAxisCoordinateTransform:(void *)a18 virtualMargins:(void *)a19 outlineColor:(void *)a20 tileBackgroundColor:(void *)a21 topBaselineY:(void *)a22 bottomBaselineY:(void *)a23 selectionLineColor:(void *)a24 selectionLineStyle:(char)a25 disableXAxis:(char)a26 currentXAxisHeight:(void *)a27 gridlineRanges:(long long *)a28 effectiveVisibleRangeCadence:(void *)a29 effectiveVisibleRangeActive:(void *)a30 actualVisibleRange:(void *)a31 scrollingAreaRect:(void *)a32 chartMeasuringStartupTime:(void *)a33
{
  id v77 = a11;
  id v71 = a12;
  id v85 = a12;
  id v84 = a27;
  id v83 = a29;
  id v82 = a30;
  id v81 = a31;
  id v80 = a34;
  id v79 = a35;
  id v78 = a38;
  id v55 = a39;
  id v56 = a40;
  id v57 = a41;
  v86.receiver = a1;
  v86.super_class = (Class)HKGraphViewRenderer;
  v58 = (id *)objc_msgSendSuper2(&v86, sel_init);
  v59 = v58;
  if (v58)
  {
    objc_storeStrong(v58 + 6, a11);
    objc_storeStrong(v59 + 7, v71);
    *((double *)v59 + 28) = a2;
    *((double *)v59 + 29) = a3;
    *((double *)v59 + 30) = a4;
    *((double *)v59 + 31) = a5;
    *((double *)v59 + 32) = a6;
    *((double *)v59 + 33) = a7;
    *((double *)v59 + 34) = a8;
    *((double *)v59 + 35) = a9;
    v59[36] = a17;
    v59[37] = a18;
    v59[38] = a19;
    v59[39] = a20;
    v59[8] = a21;
    v59[9] = a22;
    v59[26] = a23;
    v59[27] = a24;
    v59[10] = a13;
    v59[11] = a14;
    *((unsigned char *)v59 + 8) = a15;
    v59[12] = a16;
    *((unsigned char *)v59 + 9) = a25;
    *((unsigned char *)v59 + 10) = a26;
    objc_storeStrong(v59 + 13, a27);
    long long v60 = *a28;
    long long v61 = a28[2];
    *((_OWORD *)v59 + 23) = a28[1];
    *((_OWORD *)v59 + 24) = v61;
    *((_OWORD *)v59 + 22) = v60;
    objc_storeStrong(v59 + 14, a29);
    objc_storeStrong(v59 + 15, a30);
    objc_storeStrong(v59 + 16, a31);
    v59[17] = a32;
    v59[18] = a33;
    objc_storeStrong(v59 + 19, a34);
    objc_storeStrong(v59 + 20, a35);
    *((unsigned char *)v59 + 11) = a36;
    v59[21] = a37;
    objc_storeStrong(v59 + 22, a38);
    uint64_t v62 = [v55 copy];
    id v63 = v59[24];
    v59[24] = (id)v62;

    uint64_t v64 = [v56 copy];
    id v65 = v59[23];
    v59[23] = (id)v64;

    uint64_t v66 = [v57 copy];
    id v67 = v59[25];
    v59[25] = (id)v66;

    v59[40] = a42;
    v59[41] = a43;
    v59[42] = a44;
    v59[43] = a45;
    *((unsigned char *)v59 + 12) = a46;
    v59[2] = 0;
    v59[3] = 0;
    id v68 = v59[4];
    v59[4] = 0;
  }
  return v59;
}

- (void)renderContentToContext:(CGContext *)a3
{
  UIGraphicsPushContext(a3);
  if ([(HKGraphViewRenderer *)self drawingToTile]) {
    [(HKGraphViewRenderer *)self _clearBackgroundInContext:a3];
  }
  [(HKGraphViewRenderer *)self _renderXAxisLabelAndGridsNeedsNewRendererInContext:a3];
  if (([(HKGraphViewRenderer *)self postUpdates] & 4) == 0)
  {
    v18 = objc_alloc_init(HKGraphSeriesSecondaryRenderContext);
    v5 = [(HKGraphViewRenderer *)self renderingView];
    [(HKGraphViewRenderer *)self insetChartRect];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(HKGraphViewRenderer *)self zoomScale];
    double v15 = v14;
    [(HKGraphViewRenderer *)self contentOffset];
    -[HKGraphViewRenderer _renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:](self, "_renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:", a3, v5, 0, v7, v9, v11, v13, v15, v16, v17);

    [(HKGraphViewRenderer *)self insetChartRect];
    -[HKGraphViewRenderer _renderSeriesWithContext:secondaryRenderContext:chartRect:](self, "_renderSeriesWithContext:secondaryRenderContext:chartRect:", a3, v18);
    [(HKGraphViewRenderer *)self _renderVirtualMarginsWithContext:a3];
    [(HKGraphViewRenderer *)self insetChartRect];
    -[HKGraphViewRenderer _renderBaselineWithContext:chartRect:](self, "_renderBaselineWithContext:chartRect:", a3);
    [(HKGraphViewRenderer *)self _renderDataAreaDividersWithContext:a3];
    UIGraphicsPopContext();
  }
}

- (void)_clearBackgroundInContext:(CGContext *)a3
{
  id v5 = [(HKGraphViewRenderer *)self tileBackgroundColor];
  double v6 = (CGColor *)[v5 CGColor];

  CGContextSetFillColorWithColor(a3, v6);
  [(HKGraphViewRenderer *)self fullChartRect];
  CGContextFillRect(a3, *(CGRect *)&v7);
}

- (void)_renderXAxisLabelAndGridsNeedsNewRendererInContext:(CGContext *)a3
{
  [(HKGraphViewRenderer *)self _renderXAxisGridlinesInContext:a3 withBlendMode:0];
  if (![(HKGraphViewRenderer *)self disableXAxis])
  {
    [(HKGraphViewRenderer *)self _renderXAxisLabelsInContext:a3];
    double v6 = v5;
    [(HKGraphViewRenderer *)self currentXAxisHeight];
    if (!HKUIEqualCGFloats(v6, v7) && ![(HKGraphViewRenderer *)self drawingToTile])
    {
      self->_postUpdates |= 4uLL;
      self->_postXAxisHeight = v6;
    }
  }
}

- (void)_renderXAxisGridlinesInContext:(CGContext *)a3 withBlendMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(HKGraphViewRenderer *)self zoomScale];
  double v7 = v6;
  [(HKGraphViewRenderer *)self contentOffset];
  double v9 = v8;
  double v11 = v10;
  [(HKGraphViewRenderer *)self insetDataArea];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(HKGraphViewRenderer *)self topBaselineY];
  double v21 = v19 - (v20 - v15);
  if (v20 > 0.00000011920929) {
    double v22 = v20;
  }
  else {
    double v22 = v15 + 4.0;
  }
  if (v20 > 0.00000011920929) {
    double v23 = v21;
  }
  else {
    double v23 = v19 + -4.0;
  }
  if (v20 <= 0.00000011920929) {
    double v13 = v13 + 0.0;
  }
  xAxis = self->_xAxis;
  id v27 = [(HKGraphViewRenderer *)self effectiveVisibleRangeCadence];
  v25 = [(HKGraphViewRenderer *)self gridlineRanges];
  v26 = [(HKGraphViewRenderer *)self renderingView];
  -[HKAxis drawGridlinesForModelRange:chartRect:gridlineRanges:zoomScale:contentOffset:renderView:blendMode:](xAxis, "drawGridlinesForModelRange:chartRect:gridlineRanges:zoomScale:contentOffset:renderView:blendMode:", v27, v25, v26, v4, v13, v22, v17, v23, v7, v9, v11);
}

- (double)_renderXAxisLabelsInContext:(CGContext *)a3
{
  [(HKGraphViewRenderer *)self zoomScale];
  double v5 = v4;
  [(HKGraphViewRenderer *)self contentOffset];
  double v7 = v6;
  double v9 = v8;
  [(HKGraphViewRenderer *)self insetDataArea];
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(HKGraphViewRenderer *)self drawingToTile] ^ 1;
  double v22 = 16.0;
  [(HKGraphViewRenderer *)self scrollingAreaRect];
  double MinY = CGRectGetMinY(v23);
  [(HKGraphViewRenderer *)self scrollingAreaRect];
  double Height = CGRectGetHeight(v24);
  xAxis = self->_xAxis;
  effectiveVisibleRangeCadence = self->_effectiveVisibleRangeCadence;
  double v19 = [(HKGraphViewRenderer *)self renderingView];
  -[HKAxis drawLabelsWithModelRange:chartRect:zoomScale:contentOffset:renderView:maximumLabelSize:omitOffscreenLabels:](xAxis, "drawLabelsWithModelRange:chartRect:zoomScale:contentOffset:renderView:maximumLabelSize:omitOffscreenLabels:", effectiveVisibleRangeCadence, v19, &v21, v14, v11, MinY, v13, Height, v5, v7, v9);

  return HKUICeilToScreenScale(v22);
}

- (void)_renderYAxisGridlinesInContext:(CGContext *)a3 renderingView:(id)a4 chartRect:(CGRect)a5 withBlendMode:(int)a6 zoomScale:(double)a7 contentOffset:(CGPoint)a8
{
  double y = a8.y;
  double x = a8.x;
  uint64_t v11 = *(void *)&a6;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v14 = [(HKGraphViewRenderer *)self seriesConfiguration];
  double v15 = [v14 seriesRows];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        double v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v21 = [v20 mainSeriesForRow];
        [v20 yAxisRect];
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        v30 = [v21 visibleValueRange];
        v31 = [v21 yAxis];
        objc_msgSend(v31, "drawGridlinesForModelRange:chartRect:gridlineRanges:zoomScale:contentOffset:renderView:blendMode:", v30, 0, v13, v11, v23, v25, v27, v29, a7, x, y);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v17);
  }
}

- (void)_renderSeriesWithContext:(CGContext *)a3 secondaryRenderContext:(id)a4 chartRect:(CGRect)a5
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v61 = a4;
  long long v60 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:[(HKGraphViewRenderer *)self xAxisDateZoom]];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  double v6 = [(HKGraphViewRenderer *)self seriesConfiguration];
  double v7 = [v6 seriesRows];

  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v84 objects:v91 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v85 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        uint64_t v14 = [v13 selectedSeriesForRow];
        if ([v14 drawSelectionLineBehindAllSeries])
        {
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          double v15 = [v13 overlaidSeries];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v80 objects:v90 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v81;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v81 != v18) {
                  objc_enumerationMutation(v15);
                }
                if (!((*(void *)(*((void *)&v80 + 1) + 8 * j) != (void)v14) | v10 & 1))
                {
                  [(HKGraphViewRenderer *)self _renderSelectionLineWithContext:a3];
                  char v10 = 1;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v80 objects:v90 count:16];
            }
            while (v17);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
    }
    while (v9);
  }
  else
  {
    char v10 = 0;
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  double v20 = [(HKGraphViewRenderer *)self seriesConfiguration];
  uint64_t v21 = [v20 seriesRows];

  id v53 = v21;
  uint64_t v55 = [v21 countByEnumeratingWithState:&v76 objects:v89 count:16];
  double v22 = 0;
  if (v55)
  {
    uint64_t v54 = *(void *)v77;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v77 != v54) {
          objc_enumerationMutation(v53);
        }
        double v24 = *(void **)(*((void *)&v76 + 1) + 8 * v23);
        double v25 = [v24 selectedSeriesForRow];
        [v24 yAxisRect];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        long long v34 = [v24 axisAnnotationHandler];
        [v34 startAnnotationSequence];

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v56 = v24;
        id obja = [v24 overlaidSeries];
        uint64_t v35 = [obja countByEnumeratingWithState:&v72 objects:v88 count:16];
        uint64_t v57 = v23;
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v73;
          do
          {
            for (uint64_t k = 0; k != v36; ++k)
            {
              if (*(void *)v73 != v37) {
                objc_enumerationMutation(obja);
              }
              v39 = *(void **)(*((void *)&v72 + 1) + 8 * k);
              if (!((v39 != v25) | v10 & 1))
              {
                [(HKGraphViewRenderer *)self _renderSelectionLineWithContext:a3];
                char v10 = 1;
              }
              uint64_t v40 = objc_msgSend(v39, "resolutionForTimeScope:traitResolution:", -[HKGraphViewRenderer xAxisDateZoom](self, "xAxisDateZoom"), -[HKGraphViewRenderer traitResolution](self, "traitResolution"));
              v41 = [(HKGraphViewRenderer *)self xAxis];
              [(HKGraphViewRenderer *)self zoomScale];
              double v43 = v42;
              [(HKGraphViewRenderer *)self contentOffset];
              v46 = objc_msgSend(v39, "seriesCoordinatesWithXAxis:chartRect:zoomScale:contentOffset:resolution:", v41, v40, v27, v29, v31, v33, v43, v44, v45);

              long long v70 = 0u;
              long long v71 = 0u;
              long long v69 = 0u;
              [(HKGraphViewRenderer *)self xAxisCoordinateTransform];
              long long v67 = 0u;
              long long v68 = 0u;
              long long v66 = 0u;
              if (v39)
              {
                long long v63 = v69;
                long long v64 = v70;
                long long v65 = v71;
                objc_msgSend(v39, "coordinateTransformFromXAxisTransform:chartRect:", &v63, v27, v29, v31, v33);
              }
              long long v63 = v66;
              long long v64 = v67;
              long long v65 = v68;
              objc_msgSend(v39, "drawWithChartRect:seriesCoordinates:zoomLevelConfiguration:coordinateTransform:inContext:secondaryRenderContext:seriesRenderingDelegate:", v46, v60, &v63, a3, v61, self, v27, v29, v31, v33);
              if ([v39 overlayType])
              {
                if (!v22) {
                  double v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                v47 = [HKGraphSeriesOverlayData alloc];
                long long v63 = v66;
                long long v64 = v67;
                long long v65 = v68;
                v48 = -[HKGraphSeriesOverlayData initWithGraphSeries:graphSeriesScreenRect:graphSeriesCoordinates:graphSeriesPointTransform:](v47, "initWithGraphSeries:graphSeriesScreenRect:graphSeriesCoordinates:graphSeriesPointTransform:", v39, v46, &v63, v27, v29, v31, v33);
                [(NSMutableArray *)v22 addObject:v48];
              }
            }
            uint64_t v36 = [obja countByEnumeratingWithState:&v72 objects:v88 count:16];
          }
          while (v36);
        }

        v49 = [v56 axisAnnotationHandler];
        v50 = [v56 overlaidSeries];
        uint64_t v51 = [v49 applyAnnotationForSeries:v50];

        if ((unint64_t)(v51 - 1) <= 1) {
          self->_postUpdates |= v51;
        }

        uint64_t v23 = v57 + 1;
      }
      while (v57 + 1 != v55);
      uint64_t v55 = [v53 countByEnumeratingWithState:&v76 objects:v89 count:16];
    }
    while (v55);
  }

  if ((v10 & 1) == 0) {
    [(HKGraphViewRenderer *)self _renderSelectionLineWithContext:a3];
  }
  postOverlayData = self->_postOverlayData;
  self->_postOverlayData = v22;
}

- (void)_renderVirtualMarginsWithContext:(CGContext *)a3
{
  [(HKGraphViewRenderer *)self insetDataArea];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(HKGraphViewRenderer *)self virtualMargins];
  [v13 virtualLeftMarginWidth];
  if (v14 <= 0.0) {
    goto LABEL_4;
  }
  double v15 = [(HKGraphViewRenderer *)self virtualMargins];
  uint64_t v16 = [v15 virtualLeftMarginStyle];

  if (v16)
  {
    [(HKGraphViewRenderer *)self insetDataArea];
    double v18 = v17;
    [(HKGraphViewRenderer *)self insetDataArea];
    double v20 = v19;
    uint64_t v21 = [(HKGraphViewRenderer *)self virtualMargins];
    [v21 virtualLeftMarginWidth];
    double v23 = v22 - HKUIOnePixel();

    id v13 = [(HKGraphViewRenderer *)self virtualMargins];
    -[HKGraphViewRenderer _renderVirtualMarginInRect:context:marginStyle:](self, "_renderVirtualMarginInRect:context:marginStyle:", a3, [v13 virtualLeftMarginStyle], v18, v20, v23, v12);
LABEL_4:
  }
  double v24 = [(HKGraphViewRenderer *)self virtualMargins];
  [v24 virtualRightMarginWidth];
  double v26 = v25;
  [(HKGraphViewRenderer *)self rightHandInactiveArea];
  double v28 = v26 + v27;

  if (v28 > 0.0)
  {
    double v29 = [(HKGraphViewRenderer *)self virtualMargins];
    uint64_t v30 = [v29 virtualRightMarginStyle];

    if (v30)
    {
      id v31 = [(HKGraphViewRenderer *)self virtualMargins];
      -[HKGraphViewRenderer _renderVirtualMarginInRect:context:marginStyle:](self, "_renderVirtualMarginInRect:context:marginStyle:", a3, [v31 virtualRightMarginStyle], v6 + v10 - v28, v8, v28, v12);
    }
  }
}

- (void)_renderBaselineWithContext:(CGContext *)a3 chartRect:(CGRect)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(HKGraphViewRenderer *)self zoomScale];
  double v6 = v5;
  [(HKGraphViewRenderer *)self contentOffset];
  double v8 = v7;
  double v10 = v9;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v11 = [(HKGraphViewRenderer *)self seriesConfiguration];
  double v12 = [v11 seriesRows];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        double v18 = [v17 mainSeriesForRow];
        [v17 yAxisRect];
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v27 = [v18 visibleValueRange];
        if (v27)
        {
          double v28 = [v18 yAxis];
          double v29 = [(HKGraphViewRenderer *)self renderingView];
          objc_msgSend(v28, "drawBaselineForModelRange:chartRect:zoomScale:contentOffset:renderView:", v27, v29, v20, v22, v24, v26, v6, v8, v10);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }
}

- (void)_renderDataAreaDividersWithContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  [(HKGraphViewRenderer *)self insetDataArea];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(HKGraphViewRenderer *)self topBaselineY];
  if (v13 <= 0.00000011920929)
  {
    double v14 = HKUIOnePixel();
    uint64_t v15 = [(HKGraphViewRenderer *)self outlineColor];
    +[HKBorderLineView drawBorderLinesInContext:bounds:verticalDrawRanges:borderEdges:borderLineWidth:borderLineColor:borderInsets:](HKBorderLineView, "drawBorderLinesInContext:bounds:verticalDrawRanges:borderEdges:borderLineWidth:borderLineColor:borderInsets:", a3, 0, 1, v15, v6, v8, v10, v12, v14, 0x4010000000000000, 0, 0, 0);
  }
  CGContextRestoreGState(a3);
}

- (void)_renderSelectionLineWithContext:(CGContext *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (![(HKGraphViewRenderer *)self drawingToTile])
  {
    [(HKGraphViewRenderer *)self insetDataArea];
    uint64_t v5 = v4;
    double v7 = v6;
    uint64_t v9 = v8;
    double v11 = v10;
    [(HKGraphViewRenderer *)self bottomBaselineY];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__HKGraphViewRenderer__renderSelectionLineWithContext___block_invoke;
    aBlock[3] = &__block_descriptor_64_e40___UIBezierPath_24__0d8__HKStrokeStyle_16l;
    if (v12 <= v7) {
      double v13 = v11;
    }
    else {
      double v13 = v12 - v7;
    }
    aBlock[4] = v5;
    *(double *)&aBlock[5] = v7;
    aBlock[6] = v9;
    *(double *)&aBlock[7] = v13;
    double v14 = (void (**)(void *, void *, double))_Block_copy(aBlock);
    uint64_t v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v38 = self;
    uint64_t v15 = [(HKGraphViewRenderer *)self seriesConfiguration];
    uint64_t v16 = [v15 seriesRows];

    obuint64_t j = v16;
    uint64_t v39 = [v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v39)
    {
      uint64_t v37 = *(void *)v43;
      double v17 = (char *)(v14 + 2);
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = v18;
          double v19 = *(void **)(*((void *)&v42 + 1) + 8 * v18);
          double v20 = [v19 selectedRangeBoundariesXValue];
          double v21 = v20;
          if (v20)
          {
            if ([v20 count])
            {
              [(NSMutableArray *)v35 addObjectsFromArray:v21];
              if ([v19 selectedTouchPointCount] >= 1)
              {
                uint64_t v22 = 0;
                v41 = v21;
                do
                {
                  double v23 = [v21 objectAtIndexedSubscript:v22];
                  [v23 doubleValue];
                  double v25 = HKUIFloorToScreenScale(v24);

                  double v26 = [(HKGraphViewRenderer *)v38 renderingView];
                  double v27 = [(HKGraphViewRenderer *)v38 selectionLineStyle];
                  [v27 selectedPointLineStrokeStyle];
                  v29 = double v28 = v19;
                  v14[2](v14, v29, v25);
                  v31 = long long v30 = v17;
                  long long v32 = [(HKGraphViewRenderer *)v38 selectionLineColor];
                  LOBYTE(v34) = 1;
                  [v26 drawPath:v31 strokeColor:v32 fillColor:0 markerImage:0 useGradientFill:0 blendMode:0 clipToAxes:v34];

                  double v17 = v30;
                  double v19 = v28;
                  double v21 = v41;

                  ++v22;
                }
                while (v22 < [v19 selectedTouchPointCount]);
              }
            }
          }

          uint64_t v18 = v40 + 1;
        }
        while (v40 + 1 != v39);
        uint64_t v39 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v39);
    }

    postSelectionPoints = v38->_postSelectionPoints;
    v38->_postSelectionPoints = v35;
  }
}

id __55__HKGraphViewRenderer__renderSelectionLineWithContext___block_invoke(CGRect *a1, void *a2, double a3)
{
  id v5 = a2;
  double v6 = objc_opt_new();
  objc_msgSend(v6, "moveToPoint:", a3, CGRectGetMinY(a1[1]));
  objc_msgSend(v6, "addLineToPoint:", a3, CGRectGetMaxY(a1[1]));
  [v5 lineWidth];
  double v8 = v7;

  [v6 setLineWidth:v8];
  return v6;
}

- (void)_renderVirtualMarginInRect:(CGRect)a3 context:(CGContext *)a4 marginStyle:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a5 == 2)
  {
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    double v11 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisMajorGridColor");
    double v12 = [(HKGraphViewRenderer *)self renderingView];
    double v13 = v12;
    LOBYTE(v17) = 0;
    id v14 = v18;
    uint64_t v15 = v11;
    uint64_t v16 = 18;
  }
  else
  {
    if (a5 != 1) {
      return;
    }
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    double v11 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisMajorGridColor");
    double v12 = [(HKGraphViewRenderer *)self renderingView];
    double v13 = v12;
    LOBYTE(v17) = 0;
    id v14 = v18;
    uint64_t v15 = v11;
    uint64_t v16 = 0;
  }
  [v12 drawPath:v14 strokeColor:0 fillColor:v15 markerImage:0 useGradientFill:0 blendMode:v16 clipToAxes:v17];

  -[HKGraphViewRenderer _renderVirtualMarginGridLines:context:](self, "_renderVirtualMarginGridLines:context:", a4, x, y, width, height);
}

- (void)_renderVirtualMarginGridLines:(CGRect)a3 context:(CGContext *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(HKGraphViewRenderer *)self insetDataArea];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  CGContextSaveGState(a4);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGContextAddRect(a4, v29);
  CGContextClip(a4);
  id v18 = [(HKGraphViewRenderer *)self renderingView];
  [(HKGraphViewRenderer *)self zoomScale];
  double v20 = v19;
  [(HKGraphViewRenderer *)self contentOffset];
  -[HKGraphViewRenderer _renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:](self, "_renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:", a4, v18, 17, v11, v13, v15, v17, v20, v21, v22);

  double v23 = [(HKGraphViewRenderer *)self renderingView];
  [(HKGraphViewRenderer *)self zoomScale];
  double v25 = v24;
  [(HKGraphViewRenderer *)self contentOffset];
  -[HKGraphViewRenderer _renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:](self, "_renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:", a4, v23, 17, v11, v13, v15, v17, v25, v26, v27);

  [(HKGraphViewRenderer *)self _renderXAxisGridlinesInContext:a4 withBlendMode:17];
  CGContextRestoreGState(a4);
}

- (UIEdgeInsets)virtualMarginInsets
{
  v3 = [(HKGraphViewRenderer *)self virtualMargins];
  [v3 virtualLeftMarginWidth];
  double v5 = v4;
  double v6 = [(HKGraphViewRenderer *)self virtualMargins];
  [v6 virtualRightMarginWidth];
  double v8 = v7;
  [(HKGraphViewRenderer *)self rightHandInactiveArea];
  double v10 = v8 + v9;

  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = v5;
  double v14 = v10;
  result.right = v14;
  result.bottom = v12;
  result.left = v13;
  result.top = v11;
  return result;
}

- (CGRect)screenRectForSeries:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v9 = [(HKGraphViewRenderer *)self seriesConfiguration];
  double v10 = [v9 seriesRows];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        double v16 = objc_msgSend(v15, "overlaidSeries", 0);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v30;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v30 != v19) {
                objc_enumerationMutation(v16);
              }
              if (*(id *)(*((void *)&v29 + 1) + 8 * j) == v4)
              {
                [v15 yAxisRect];
                double v5 = v21;
                double v6 = v22;
                double v7 = v23;
                double v8 = v24;

                goto LABEL_18;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v12);
  }
LABEL_18:

  double v25 = v5;
  double v26 = v6;
  double v27 = v7;
  double v28 = v8;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (id)axisAnnotationDelegateForSeries:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v5 = [(HKGraphViewRenderer *)self seriesConfiguration];
  double v6 = [v5 seriesRows];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v12 = objc_msgSend(v11, "overlaidSeries", 0);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              if (*(id *)(*((void *)&v19 + 1) + 8 * j) == v4)
              {
                uint64_t v17 = [v11 axisAnnotationHandler];

                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      uint64_t v17 = 0;
    }
    while (v8);
  }
  else
  {
    uint64_t v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)seriesDrawingAsTopOverlay:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(HKGraphViewRenderer *)self seriesConfiguration];
  double v6 = [v5 seriesRows];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([(HKGraphViewRenderer *)self _lastSeriesInMultiSeriesRow:*(void *)(*((void *)&v13 + 1) + 8 * i) series:v4])
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)_lastSeriesInMultiSeriesRow:(id)a3 series:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 overlaidSeries];
  if ((unint64_t)[v7 count] < 2)
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v8 = [v5 overlaidSeries];
    id v9 = [v8 lastObject];
    BOOL v10 = v9 == v6;
  }
  return v10;
}

- (int64_t)postUpdates
{
  return self->_postUpdates;
}

- (double)postXAxisHeight
{
  return self->_postXAxisHeight;
}

- (NSMutableArray)postOverlayData
{
  return self->_postOverlayData;
}

- (NSMutableArray)postSelectionPoints
{
  return self->_postSelectionPoints;
}

- (HKGraphViewRendererSeriesConfiguration)seriesConfiguration
{
  return self->_seriesConfiguration;
}

- (HKGraphRenderer)renderingView
{
  return self->_renderingView;
}

- (CGRect)fullChartRect
{
  double x = self->_fullChartRect.origin.x;
  double y = self->_fullChartRect.origin.y;
  double width = self->_fullChartRect.size.width;
  double height = self->_fullChartRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)insetChartRect
{
  double x = self->_insetChartRect.origin.x;
  double y = self->_insetChartRect.origin.y;
  double width = self->_insetChartRect.size.width;
  double height = self->_insetChartRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)insetDataArea
{
  double x = self->_insetDataArea.origin.x;
  double y = self->_insetDataArea.origin.y;
  double width = self->_insetDataArea.size.width;
  double height = self->_insetDataArea.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)rightHandInactiveArea
{
  return self->_rightHandInactiveArea;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (int64_t)traitResolution
{
  return self->_traitResolution;
}

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)xAxisDateZoom
{
  return self->_xAxisDateZoom;
}

- (BOOL)drawingToTile
{
  return self->_drawingToTile;
}

- (int64_t)tileColumn
{
  return self->_tileColumn;
}

- (BOOL)drawingDuringScrolling
{
  return self->_drawingDuringScrolling;
}

- (BOOL)drawingDuringAutoscale
{
  return self->_drawingDuringAutoscale;
}

- (HKAxis)xAxis
{
  return self->_xAxis;
}

- (CGAffineTransform)xAxisCoordinateTransform
{
  long long v3 = *(_OWORD *)&self[7].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[8].a;
  return self;
}

- (HKGraphViewRendererVirtualMarginConfiguration)virtualMargins
{
  return self->_virtualMargins;
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (UIColor)tileBackgroundColor
{
  return self->_tileBackgroundColor;
}

- (double)topBaselineY
{
  return self->_topBaselineY;
}

- (double)bottomBaselineY
{
  return self->_bottomBaselineY;
}

- (UIColor)selectionLineColor
{
  return self->_selectionLineColor;
}

- (HKGraphViewSelectionStyle)selectionLineStyle
{
  return self->_selectionLineStyle;
}

- (BOOL)disableXAxis
{
  return self->_disableXAxis;
}

- (double)currentXAxisHeight
{
  return self->_currentXAxisHeight;
}

- (NSArray)gridlineRanges
{
  return self->_gridlineRanges;
}

- (HKValueRange)effectiveVisibleRangeActive
{
  return self->_effectiveVisibleRangeActive;
}

- (HKValueRange)effectiveVisibleRangeCadence
{
  return self->_effectiveVisibleRangeCadence;
}

- (HKValueRange)actualVisibleRange
{
  return self->_actualVisibleRange;
}

- (CGRect)scrollingAreaRect
{
  double x = self->_scrollingAreaRect.origin.x;
  double y = self->_scrollingAreaRect.origin.y;
  double width = self->_scrollingAreaRect.size.width;
  double height = self->_scrollingAreaRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)chartMeasuringStartupTime
{
  return self->_chartMeasuringStartupTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualVisibleRange, 0);
  objc_storeStrong((id *)&self->_effectiveVisibleRangeCadence, 0);
  objc_storeStrong((id *)&self->_effectiveVisibleRangeActive, 0);
  objc_storeStrong((id *)&self->_gridlineRanges, 0);
  objc_storeStrong((id *)&self->_selectionLineStyle, 0);
  objc_storeStrong((id *)&self->_selectionLineColor, 0);
  objc_storeStrong((id *)&self->_tileBackgroundColor, 0);
  objc_storeStrong((id *)&self->_outlineColor, 0);
  objc_storeStrong((id *)&self->_virtualMargins, 0);
  objc_storeStrong((id *)&self->_xAxis, 0);
  objc_storeStrong((id *)&self->_renderingView, 0);
  objc_storeStrong((id *)&self->_seriesConfiguration, 0);
  objc_storeStrong((id *)&self->_postSelectionPoints, 0);
  objc_storeStrong((id *)&self->_postOverlayData, 0);
}

@end