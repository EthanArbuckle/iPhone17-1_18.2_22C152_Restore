@interface HKLineSeries
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4;
- (BOOL)connectPoint:(id)a3 toPoint:(id)a4;
- (BOOL)extendFirstValue;
- (BOOL)extendLastValue;
- (BOOL)flatLastValue;
- (BOOL)supportsMultiTouchSelection;
- (HKLineSeries)init;
- (HKLineSeriesPointMarkerStyle)selectedPointMarkerStyle;
- (HKLineSeriesPresentationStyle)inactivePresentationStyle;
- (NSArray)highlightedPresentationStyles;
- (NSArray)selectedPresentationStyles;
- (NSArray)unhighlightedPresentationStyles;
- (NSNumber)maximumConnectionDistance;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)_attributedAnnotationWithString:(id)a3 labelStyle:(id)a4;
- (id)_currentPresentationStyles;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)pointMarkerImageForPointMarkerStyle:(id)a3;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)_enumerateCoordinateList:(id)a3 withTransform:(CGAffineTransform *)a4 presentationStyle:(id)a5 zoomLevelConfiguration:(id)a6 axisRect:(CGRect)a7 block:(id)a8;
- (void)_enumerateCoordinateListByRemovingOffscreenPoints:(id)a3 withTransform:(CGAffineTransform *)a4 presentationStyle:(id)a5 zoomLevelConfiguration:(id)a6 axisRect:(CGRect)a7 block:(id)a8;
- (void)_enumeratePathsFromBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 transform:(CGAffineTransform *)a6 presentationStyle:(id)a7 caresAboutSelection:(BOOL)a8 seriesRenderingDelegate:(id)a9 forceGapBetweenUntransformedPoints:(id)a10 handler:(id)a11;
- (void)_enumerateSawToothPathsFromBlockCoordinates:(id)a3 transform:(CGAffineTransform *)a4 zoomLevelConfiguration:(id)a5 presentationStyle:(id)a6 caresAboutSelection:(BOOL)a7 axisRect:(CGRect)a8 seriesRenderingDelegate:(id)a9 forceGapBetweenUntransformedPoints:(id)a10 handler:(id)a11;
- (void)_enumerateSinePathsFromBlockCoordinates:(id)a3 transfrom:(CGAffineTransform *)a4 zoomLevelConfiguration:(id)a5 presentationStyle:(id)a6 axisRect:(CGRect)a7 handler:(id)a8;
- (void)_renderLineEndCapsInContext:(CGContext *)a3 endCaps:(id)a4 endCapImage:(id)a5;
- (void)_renderPointLabelInContext:(CGContext *)a3 renderingData:(id *)a4 numberFormatter:(id)a5 labelAttributes:(id)a6 seriesRenderingDelegate:(id)a7;
- (void)_renderPointLabelsInContext:(CGContext *)a3 blockCoordinates:(id)a4 axisRect:(CGRect)a5 pointTransform:(CGAffineTransform *)a6 presentationStyle:(id)a7 zoomLevelConfiguration:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)_renderPointLegendLabelWithText:(id)a3 drawRect:(CGRect)a4 labelAttributes:(id)a5;
- (void)_renderPointMarkersInContext:(CGContext *)a3 blockCoordinates:(id)a4 pointTransform:(CGAffineTransform *)a5 presentationStyle:(id)a6;
- (void)_updateSecondaryRenderContextWithBlockCoordinates:(id)a3 secondaryRenderContext:(id)a4 pointTransform:(CGAffineTransform *)a5 zoomLevelConfiguration:(id)a6 axisRect:(CGRect)a7;
- (void)addAxisAnnotationForString:(id)a3 modelCoordinate:(double)a4 axisAnnotationDelegate:(id)a5;
- (void)addAxisAnnotationForValue:(double)a3 axisAnnotationDelegate:(id)a4;
- (void)drawLegendPointLabelInContext:(CGContext *)a3 point:(CGPoint)a4 untransformedPoint:(CGPoint)a5 axisRect:(CGRect)a6 presentationStyle:(id)a7 leftOfPoint:(BOOL)a8;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9 forceGapBetweenUntransformedPoints:(id)a10;
- (void)renderPointMarkersInContext:(CGContext *)a3 blockCoordinates:(id)a4 pointTransform:(CGAffineTransform *)a5 pointMarkerStyle:(id)a6 selectedBoundsMarkerStyle:(id)a7 selectedPointMarkerStyle:(id)a8;
- (void)setExtendFirstValue:(BOOL)a3;
- (void)setExtendLastValue:(BOOL)a3;
- (void)setFlatLastValue:(BOOL)a3;
- (void)setHighlightedPresentationStyles:(id)a3;
- (void)setInactivePresentationStyle:(id)a3;
- (void)setMaximumConnectionDistance:(id)a3;
- (void)setSelectedPointMarkerStyle:(id)a3;
- (void)setSelectedPresentationStyles:(id)a3;
- (void)setUnhighlightedPresentationStyles:(id)a3;
@end

@implementation HKLineSeries

- (HKLineSeries)init
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HKLineSeries;
  v2 = [(HKGraphSeries *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1618] blackColor];
    v4 = +[HKStrokeStyle strokeStyleWithColor:v3 lineWidth:1.0];

    v5 = objc_alloc_init(HKLineSeriesPresentationStyle);
    [(HKLineSeriesPresentationStyle *)v5 setStrokeStyle:v4];
    [(HKLineSeriesPresentationStyle *)v5 setWaveForm:0];
    v11[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v7 = (void *)*((void *)v2 + 27);
    *((void *)v2 + 27) = v6;

    v2[208] = 0;
    *(_WORD *)(v2 + 209) = 1;
    v8 = (void *)*((void *)v2 + 32);
    *((void *)v2 + 32) = 0;
  }
  return (HKLineSeries *)v2;
}

- (id)_currentPresentationStyles
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(HKGraphSeries *)self allowsSelection])
  {
    if ([(HKGraphSeries *)self isHighlighted])
    {
      highlightedPresentationStyles = self->_highlightedPresentationStyles;
      if (!highlightedPresentationStyles)
      {
        uint64_t v4 = 216;
LABEL_9:
        highlightedPresentationStyles = *(NSArray **)((char *)&self->super.super.isa + v4);
      }
    }
    else
    {
      highlightedPresentationStyles = self->_unhighlightedPresentationStyles;
      if (!highlightedPresentationStyles)
      {
        uint64_t v4 = 224;
        goto LABEL_9;
      }
    }
    v7 = highlightedPresentationStyles;
    goto LABEL_12;
  }
  v5 = [(HKLineSeries *)self inactivePresentationStyle];

  if (v5)
  {
    uint64_t v6 = [(HKLineSeries *)self inactivePresentationStyle];
    v9[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v7 = 0;
  }
LABEL_12:
  return v7;
}

- (void)_enumerateCoordinateList:(id)a3 withTransform:(CGAffineTransform *)a4 presentationStyle:(id)a5 zoomLevelConfiguration:(id)a6 axisRect:(CGRect)a7 block:(id)a8
{
  id v10 = a8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __111__HKLineSeries__enumerateCoordinateList_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke;
  v14[3] = &unk_1E6D52040;
  id v15 = v10;
  long long v11 = *(_OWORD *)&a4->c;
  v13[0] = *(_OWORD *)&a4->a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&a4->tx;
  id v12 = v10;
  [a3 enumerateCoordinatesWithTransform:v13 roundToViewScale:1 block:v14];
}

void __111__HKLineSeries__enumerateCoordinateList_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v12 = a4;
  [a2 coordinate];
  double v7 = v6;
  double v9 = v8;
  [v12 coordinate];
  (*(void (**)(uint64_t, id, double, double, double, double))(v5 + 16))(v5, v12, v7, v9, v10, v11);
}

- (void)_enumerateCoordinateListByRemovingOffscreenPoints:(id)a3 withTransform:(CGAffineTransform *)a4 presentationStyle:(id)a5 zoomLevelConfiguration:(id)a6 axisRect:(CGRect)a7 block:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v48.origin.double x = x;
  v48.origin.double y = y;
  v48.size.double width = width;
  v48.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v48);
  v49.origin.double x = x;
  v49.origin.double y = y;
  v49.size.double width = width;
  v49.size.double height = height;
  CGFloat MaxX = CGRectGetMaxX(v49);
  uint64_t v22 = [v16 numCoordinates];
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  char v45 = 0;
  v23 = (void **)HKCircularBufferCreate(2, 40);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__HKLineSeries__enumerateCoordinateListByRemovingOffscreenPoints_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke;
  aBlock[3] = &unk_1E6D52068;
  v42 = v44;
  v43 = v23;
  id v24 = v19;
  id v41 = v24;
  v25 = _Block_copy(aBlock);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __136__HKLineSeries__enumerateCoordinateListByRemovingOffscreenPoints_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke_2;
  v31[3] = &unk_1E6D52090;
  v34 = v47;
  CGFloat v36 = MinX;
  v37 = v23;
  CGFloat v38 = MaxX;
  v26 = v25;
  id v32 = v26;
  id v27 = v24;
  uint64_t v39 = v22;
  id v33 = v27;
  v35 = v46;
  long long v28 = *(_OWORD *)&a4->c;
  v30[0] = *(_OWORD *)&a4->a;
  v30[1] = v28;
  v30[2] = *(_OWORD *)&a4->tx;
  -[HKLineSeries _enumerateCoordinateList:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](self, "_enumerateCoordinateList:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v16, v30, v17, v18, v31, x, y, width, height);
  v26[2](v26);
  HKCircularBufferRelease(v23);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v47, 8);
}

BOOL __136__HKLineSeries__enumerateCoordinateListByRemovingOffscreenPoints_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke(BOOL result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    v1 = (void *)result;
    uint64_t v3 = HKCircularBufferIteratorMake();
    for (result = HKCircularBufferIteratorHasNext(v1[6], v3); result; result = HKCircularBufferIteratorHasNext(v1[6], v3))
    {
      uint64_t v2 = HKCircularBufferIteratorNext((uint64_t *)v1[6], &v3);
      (*(void (**)(void, void, void, double, double, double, double))(v1[4] + 16))(v1[4], 0, *(void *)(v2 + 32), *(double *)v2, *(double *)(v2 + 8), *(double *)(v2 + 16), *(double *)(v2 + 24));
    }
    *(unsigned char *)(*(void *)(v1[5] + 8) + 24) = 1;
  }
  return result;
}

void __136__HKLineSeries__enumerateCoordinateListByRemovingOffscreenPoints_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  id v12 = v11;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (a3 >= *(double *)(a1 + 64))
  {
    if (a3 <= *(double *)(a1 + 80))
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      (*(void (**)(void, BOOL, void *, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == *(void *)(a1 + 88), v12, a3, a4, a5, a6);
    }
    else if (*(uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) <= 2)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(a3, a4, a5, a6);
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
  }
  else
  {
    *(double *)__src = a3;
    *(double *)&__src[1] = a4;
    *(double *)&__src[2] = a5;
    *(double *)&__src[3] = a6;
    id v14 = v11;
    HKCircularBufferAddItem(*(uint64_t **)(a1 + 72), __src);
  }
}

- (void)_enumeratePathsFromBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 transform:(CGAffineTransform *)a6 presentationStyle:(id)a7 caresAboutSelection:(BOOL)a8 seriesRenderingDelegate:(id)a9 forceGapBetweenUntransformedPoints:(id)a10 handler:(id)a11
{
  BOOL v11 = a8;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a7;
  id v25 = a5;
  id v26 = a3;
  if ([v24 waveForm])
  {
    long long v27 = *(_OWORD *)&a6->c;
    long long v29 = *(_OWORD *)&a6->a;
    long long v30 = v27;
    long long v31 = *(_OWORD *)&a6->tx;
    -[HKLineSeries _enumerateSinePathsFromBlockCoordinates:transfrom:zoomLevelConfiguration:presentationStyle:axisRect:handler:](self, "_enumerateSinePathsFromBlockCoordinates:transfrom:zoomLevelConfiguration:presentationStyle:axisRect:handler:", v26, &v29, v25, v24, v23, x, y, width, height);
  }
  else
  {
    long long v28 = *(_OWORD *)&a6->c;
    long long v29 = *(_OWORD *)&a6->a;
    long long v30 = v28;
    long long v31 = *(_OWORD *)&a6->tx;
    -[HKLineSeries _enumerateSawToothPathsFromBlockCoordinates:transform:zoomLevelConfiguration:presentationStyle:caresAboutSelection:axisRect:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:handler:](self, "_enumerateSawToothPathsFromBlockCoordinates:transform:zoomLevelConfiguration:presentationStyle:caresAboutSelection:axisRect:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:handler:", v26, &v29, v25, v24, v11, v21, x, y, width, height, v22, v23);
  }
}

- (void)addAxisAnnotationForValue:(double)a3 axisAnnotationDelegate:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v28 = a4;
  if (v28)
  {
    double v6 = [NSNumber numberWithDouble:a3];
    double v7 = [(HKGraphSeries *)self yAxis];
    if (v7)
    {
      id v26 = v7;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id obj = [(HKLineSeries *)self _currentPresentationStyles];
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v13 = [v12 axisAnnotationStyle];
            id v14 = v13;
            if (v13)
            {
              id v15 = [v13 numberFormatter];
              id v16 = v15;
              if (v15)
              {
                id v17 = v15;
              }
              else
              {
                HKDecimalFormatter(0);
                id v17 = (id)objc_claimAutoreleasedReturnValue();
              }
              id v18 = v17;

              if ([v12 shouldNegateAnnotationValue])
              {
                id v19 = NSNumber;
                [v6 floatValue];
                *(float *)&double v21 = -v20;
                id v22 = [v19 numberWithFloat:v21];
              }
              else
              {
                id v22 = v6;
              }
              id v23 = v22;
              id v24 = [v18 stringFromNumber:v22 displayType:0 unitController:0];
              id v25 = [(HKLineSeries *)self _attributedAnnotationWithString:v24 labelStyle:v14];
              [v28 addAxisAnnotation:v25 forSeries:self modelCoordinate:v6];
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v9);
      }

      double v7 = v26;
    }
  }
}

- (void)addAxisAnnotationForString:(id)a3 modelCoordinate:(double)a4 axisAnnotationDelegate:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = [NSNumber numberWithDouble:a4];
    BOOL v11 = [(HKGraphSeries *)self yAxis];
    if (v11)
    {
      id v19 = v11;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = [(HKLineSeries *)self _currentPresentationStyles];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = [*(id *)(*((void *)&v20 + 1) + 8 * v16) axisAnnotationStyle];
            if (v17)
            {
              id v18 = [(HKLineSeries *)self _attributedAnnotationWithString:v8 labelStyle:v17];
              if (v18) {
                [v9 addAxisAnnotation:v18 forSeries:self modelCoordinate:v10];
              }
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }

      BOOL v11 = v19;
    }
  }
}

- (BOOL)connectPoint:(id)a3 toPoint:(id)a4
{
  return 1;
}

- (id)_attributedAnnotationWithString:(id)a3 labelStyle:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = *MEMORY[0x1E4FB0700];
  id v5 = a3;
  double v6 = [a4 textColor];
  v12[0] = v6;
  v11[1] = *MEMORY[0x1E4FB06F8];
  double v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
  v12[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v8];
  return v9;
}

- (void)_enumerateSawToothPathsFromBlockCoordinates:(id)a3 transform:(CGAffineTransform *)a4 zoomLevelConfiguration:(id)a5 presentationStyle:(id)a6 caresAboutSelection:(BOOL)a7 axisRect:(CGRect)a8 seriesRenderingDelegate:(id)a9 forceGapBetweenUntransformedPoints:(id)a10 handler:(id)a11
{
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  id v33 = a3;
  id v32 = a5;
  id v20 = a6;
  id v21 = a9;
  id v22 = a10;
  id v30 = a11;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3010000000;
  v70[3] = &unk_1E0F50A5E;
  long long v71 = *MEMORY[0x1E4F1DAD8];
  long long v29 = v71;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__4;
  v68[4] = __Block_byref_object_dispose__4;
  id v69 = (id)objc_opt_new();
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3010000000;
  v67[4] = 0;
  v67[5] = 0;
  v67[3] = &unk_1E0F50A5E;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  uint64_t v58 = 0;
  v59 = (double *)&v58;
  uint64_t v60 = 0x3010000000;
  v61 = &unk_1E0F50A5E;
  long long v62 = v29;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__4;
  v52[4] = __Block_byref_object_dispose__4;
  id v53 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __207__HKLineSeries__enumerateSawToothPathsFromBlockCoordinates_transform_zoomLevelConfiguration_presentationStyle_caresAboutSelection_axisRect_seriesRenderingDelegate_forceGapBetweenUntransformedPoints_handler___block_invoke;
  v35[3] = &unk_1E6D520B8;
  id v23 = v21;
  double v47 = x;
  double v48 = y;
  double v49 = width;
  double v50 = height;
  id v36 = v23;
  v37 = self;
  v40 = v68;
  id v41 = &v63;
  v42 = &v58;
  id v24 = v22;
  id v38 = v24;
  v43 = v52;
  v44 = v70;
  id v25 = v30;
  id v39 = v25;
  char v45 = v67;
  v46 = &v54;
  BOOL v51 = a7;
  long long v26 = *(_OWORD *)&a4->c;
  v34[0] = *(_OWORD *)&a4->a;
  v34[1] = v26;
  v34[2] = *(_OWORD *)&a4->tx;
  -[HKLineSeries _enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](self, "_enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v33, v34, v20, v32, v35, x, y, width, height);
  if (*((unsigned char *)v64 + 24))
  {
    long long v27 = [v23 axisAnnotationDelegateForSeries:self];
    id v28 = v27;
    if (self->_extendLastValue || *((unsigned char *)v55 + 24)) {
      -[HKLineSeries addAxisAnnotationForValue:axisAnnotationDelegate:](self, "addAxisAnnotationForValue:axisAnnotationDelegate:", v27, v59[5], v29);
    }
    else {
      [v27 clearAxisAnnotations];
    }
  }
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v68, 8);

  _Block_object_dispose(v70, 8);
}

void __207__HKLineSeries__enumerateSawToothPathsFromBlockCoordinates_transform_zoomLevelConfiguration_presentationStyle_caresAboutSelection_axisRect_seriesRenderingDelegate_forceGapBetweenUntransformedPoints_handler___block_invoke(uint64_t a1, int a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v72 = a3;
  [*(id *)(a1 + 32) virtualMarginInsets];
  double v16 = v14;
  double v17 = *(double *)(a1 + 120);
  double v18 = v17 + *(double *)(a1 + 136) - v15;
  BOOL v19 = a4 <= v18 && a4 >= v17 + v14;
  if (*(unsigned char *)(*(void *)(a1 + 40) + 209)
    || (double v20 = v15, ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isEmpty] & 1) != 0))
  {
    int v21 = 0;
  }
  else
  {
    double v71 = a7;
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) currentPoint];
    double v33 = vabdd_f64(a4, v32);
    if (*(unsigned char *)(*(void *)(a1 + 40) + 208)) {
      double v34 = 1.0;
    }
    else {
      double v34 = 1.4;
    }
    objc_msgSend(*(id *)(a1 + 32), "screenRectForSeries:");
    double v36 = v34 * (v35 - v16 - v20);
    BOOL v37 = vabdd_f64(v33, v36) >= 0.01;
    int v21 = v33 > v36 && v37;
    id v38 = [*(id *)(a1 + 40) maximumConnectionDistance];
    if (v38 && (int v39 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), v38, v39))
    {
      v40 = [*(id *)(a1 + 40) maximumConnectionDistance];
      [v40 floatValue];
      double v42 = v41;

      BOOL v43 = vabdd_f64(*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 32), a6) <= v42;
      a7 = v71;
      if (!v43) {
        goto LABEL_10;
      }
    }
    else
    {
      a7 = v71;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) && (v21 & 1) == 0)
  {
    if ((*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 48) + 16))(*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a6, a7))
    {
LABEL_10:
      int v21 = 1;
      goto LABEL_12;
    }
    int v21 = [*(id *)(a1 + 40) connectPoint:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) toPoint:v72] ^ 1;
  }
LABEL_12:
  int v22 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 208);
  int v23 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isEmpty];
  if (v22)
  {
    if (v23)
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 96) + 8);
      *(double *)(v24 + 32) = a4;
      *(double *)(v24 + 40) = a5;
      if (*(unsigned char *)(*(void *)(a1 + 40) + 210) && v19)
      {
        double v25 = *(double *)(a1 + 120);
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "moveToPoint:", v25, a5);
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "addLineToPoint:", *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
        (*(void (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(v25, a5, *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
        uint64_t v26 = objc_opt_new();
        uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
        id v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;
      }
      long long v29 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    else
    {
      long long v29 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      if (!v21)
      {
        objc_msgSend(v29, "addLineToPoint:", a4, *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 40));
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "addLineToPoint:", a4, a5);
        goto LABEL_35;
      }
    }
    objc_msgSend(v29, "moveToPoint:", a4, a5);
LABEL_35:
    uint64_t v44 = *(void *)(*(void *)(a1 + 104) + 8);
    *(double *)(v44 + 32) = a4;
    *(double *)(v44 + 40) = a5;
    goto LABEL_36;
  }
  if (v23)
  {
    uint64_t v30 = *(void *)(*(void *)(a1 + 96) + 8);
    *(double *)(v30 + 32) = a4;
    *(double *)(v30 + 40) = a5;
    long long v31 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
LABEL_33:
    objc_msgSend(v31, "moveToPoint:", a4, a5);
    goto LABEL_36;
  }
  long long v31 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v21) {
    goto LABEL_33;
  }
  objc_msgSend(v31, "addLineToPoint:", a4, a5);
LABEL_36:
  if (a4 <= v18)
  {
    uint64_t v45 = *(void *)(*(void *)(a1 + 80) + 8);
    *(double *)(v45 + 32) = a6;
    *(double *)(v45 + 40) = a7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v19;
  }
  if (*(unsigned char *)(a1 + 152))
  {
    v46 = [*(id *)(a1 + 40) closestXCoordinateRange];

    if (v46)
    {
      double v47 = HKUIFloorCGPointToScreenScale(a4, a5);
      double v48 = [*(id *)(a1 + 40) closestXCoordinateRange];
      double v49 = [v48 minValue];
      [v49 floatValue];
      double v51 = HKUIFloorToScreenScale(v50);

      v52 = [*(id *)(a1 + 40) closestXCoordinateRange];
      id v53 = [v52 maxValue];
      [v53 floatValue];
      double v55 = HKUIFloorToScreenScale(v54);

      double v56 = vabdd_f64(v51, v47);
      double v57 = HKUIOnePixel();
      double v58 = HKUIOnePixel();
      if (v56 <= v57 || vabdd_f64(v55, v47) <= v58)
      {
        (*(void (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), a4, a5);
        uint64_t v59 = *(void *)(*(void *)(a1 + 96) + 8);
        *(double *)(v59 + 32) = a4;
        *(double *)(v59 + 40) = a5;
        uint64_t v60 = objc_opt_new();
        uint64_t v61 = *(void *)(*(void *)(a1 + 64) + 8);
        long long v62 = *(void **)(v61 + 40);
        *(void *)(v61 + 40) = v60;

        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "moveToPoint:", *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
      }
    }
  }
  if (a2)
  {
    uint64_t v63 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v63 + 208) && *(unsigned char *)(v63 + 209) && v19)
    {
      (*(void (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), a4, a5);
      uint64_t v64 = *(void *)(*(void *)(a1 + 96) + 8);
      *(double *)(v64 + 32) = a4;
      *(double *)(v64 + 40) = a5;
      a4 = *(double *)(a1 + 120) + *(double *)(a1 + 136);
      uint64_t v65 = objc_opt_new();
      uint64_t v66 = *(void *)(*(void *)(a1 + 64) + 8);
      v67 = *(void **)(v66 + 40);
      *(void *)(v66 + 40) = v65;

      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "moveToPoint:", *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "addLineToPoint:", a4, a5);
    }
    (*(void (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), a4, a5);
    *(_OWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 32) = *MEMORY[0x1E4F1DAD8];
    uint64_t v68 = objc_opt_new();
    uint64_t v69 = *(void *)(*(void *)(a1 + 64) + 8);
    v70 = *(void **)(v69 + 40);
    *(void *)(v69 + 40) = v68;
  }
}

- (void)_enumerateSinePathsFromBlockCoordinates:(id)a3 transfrom:(CGAffineTransform *)a4 zoomLevelConfiguration:(id)a5 presentationStyle:(id)a6 axisRect:(CGRect)a7 handler:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v28 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  [v17 sineWaveSmoothingFactor];
  uint64_t v20 = v19;
  int v21 = [MEMORY[0x1E4FB14C0] bezierPath];
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  v56[3] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __124__HKLineSeries__enumerateSinePathsFromBlockCoordinates_transfrom_zoomLevelConfiguration_presentationStyle_axisRect_handler___block_invoke;
  aBlock[3] = &unk_1E6D520E0;
  float v54 = v56;
  id v22 = v21;
  id v53 = v22;
  uint64_t v55 = v20;
  int v23 = _Block_copy(aBlock);
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3010000000;
  v50[3] = &unk_1E0F50A5E;
  long long v51 = *MEMORY[0x1E4F1DAD8];
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3010000000;
  v48[3] = &unk_1E0F50A5E;
  long long v49 = v51;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3010000000;
  v46[3] = &unk_1E0F50A5E;
  long long v47 = v51;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3010000000;
  void v44[3] = &unk_1E0F50A5E;
  long long v45 = v51;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3010000000;
  v42[3] = &unk_1E0F50A5E;
  long long v43 = v51;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __124__HKLineSeries__enumerateSinePathsFromBlockCoordinates_transfrom_zoomLevelConfiguration_presentationStyle_axisRect_handler___block_invoke_2;
  v31[3] = &unk_1E6D52108;
  double v35 = v41;
  double v36 = v44;
  id v24 = v22;
  id v32 = v24;
  BOOL v37 = v50;
  id v38 = v48;
  int v39 = v46;
  id v25 = v23;
  id v33 = v25;
  v40 = v42;
  id v26 = v18;
  id v34 = v26;
  long long v27 = *(_OWORD *)&a4->c;
  v30[0] = *(_OWORD *)&a4->a;
  v30[1] = v27;
  v30[2] = *(_OWORD *)&a4->tx;
  -[HKLineSeries _enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](self, "_enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v28, v30, v17, v16, v31, x, y, width, height);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(v56, 8);
}

uint64_t __124__HKLineSeries__enumerateSinePathsFromBlockCoordinates_transfrom_zoomLevelConfiguration_presentationStyle_axisRect_handler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", a2, a3);
  }
  double v14 = a5 - a3;
  double v15 = a7 - a5;
  double v16 = vabdd_f64(a4, a2);
  double v17 = vabdd_f64(a6, a4);
  double v18 = 0.1;
  if (v16 >= 0.00000011920929 && v17 >= 0.00000011920929)
  {
    double v20 = fmax(fabs(v14 / v16), fabs(v15 / v17));
    if (v20 <= 5.0)
    {
      if (v20 <= 3.0)
      {
        double v18 = 0.5;
        if (v20 <= 1.5)
        {
          double v18 = 1.0;
          if (v20 < 0.5) {
            double v18 = 2.0;
          }
        }
      }
      else
      {
        double v18 = 0.2;
      }
    }
  }
  double v21 = *(double *)(a1 + 48) * v18;
  double v22 = a4 + (a6 - a4) * v21;
  double v23 = a5 + v15 * v21;
  objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", a4 - (a4 - a2) * v21, a5 - v14 * v21);
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "addQuadCurveToPoint:controlPoint:", v22, v23, a4, a5);
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

void __124__HKLineSeries__enumerateSinePathsFromBlockCoordinates_transfrom_zoomLevelConfiguration_presentationStyle_axisRect_handler___block_invoke_2(uint64_t a1, int a2, void *a3, double a4, double a5)
{
  id v16 = a3;
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v9 != 2)
  {
    if (v9 == 1)
    {
      uint64_t v11 = *(void *)(a1 + 80);
      goto LABEL_6;
    }
    if (!v9)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
      *(double *)(v10 + 32) = a4;
      *(double *)(v10 + 40) = a5;
      objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", a4, a5);
      uint64_t v11 = *(void *)(a1 + 72);
LABEL_6:
      uint64_t v12 = *(void *)(v11 + 8);
      *(double *)(v12 + 32) = a4;
      *(double *)(v12 + 40) = a5;
      goto LABEL_9;
    }
    *(_OWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = *(_OWORD *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                            + 32);
    *(_OWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = *(_OWORD *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 32);
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
  *(double *)(v13 + 32) = a4;
  *(double *)(v13 + 40) = a5;
  (*(void (**)(double, double, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 40));
LABEL_9:
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v14 = *(void *)(*(void *)(a1 + 96) + 8);
  *(double *)(v14 + 32) = a4;
  *(double *)(v14 + 40) = a5;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
    (*(void (**)(double, double, double, double))(*(void *)(a1 + 48) + 16))(*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
    long long v15 = *MEMORY[0x1E4F1DAD8];
    *(_OWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = *MEMORY[0x1E4F1DAD8];
    *(_OWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = v15;
    *(_OWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 32) = v15;
    *(_OWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = v15;
    *(_OWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 32) = v15;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  long long v9 = *(_OWORD *)&a6->c;
  v10[0] = *(_OWORD *)&a6->a;
  v10[1] = v9;
  v10[2] = *(_OWORD *)&a6->tx;
  -[HKLineSeries drawSeriesWithBlockCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:](self, "drawSeriesWithBlockCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:", a3, a5, v10, a7, a8, a9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, &__block_literal_global_13);
}

uint64_t __155__HKLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke()
{
  return 0;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9 forceGapBetweenUntransformedPoints:(id)a10
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  id v19 = a5;
  double v20 = a7;
  id v72 = v19;
  id v64 = a8;
  id v69 = a9;
  id v67 = a10;
  CGContextSaveGState(a7);
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v80 = self;
  id obj = [(HKLineSeries *)self _currentPresentationStyles];
  uint64_t v68 = [obj countByEnumeratingWithState:&v111 objects:v115 count:16];
  if (v68)
  {
    uint64_t v66 = *(void *)v112;
    double v71 = a7;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v112 != v66)
        {
          uint64_t v22 = v21;
          objc_enumerationMutation(obj);
          uint64_t v21 = v22;
        }
        uint64_t v70 = v21;
        v81 = *(void **)(*((void *)&v111 + 1) + 8 * v21);
        double v23 = [v81 strokeStyle];
        id v24 = [v81 fillStyle];
        id v25 = [(NSArray *)v80->_selectedPresentationStyles firstObject];
        v74 = [v25 strokeStyle];

        id v26 = [(NSArray *)v80->_selectedPresentationStyles firstObject];
        v77 = [v26 fillStyle];

        if ([v24 isEqual:v77]) {
          uint64_t v27 = [v23 isEqual:v74];
        }
        else {
          uint64_t v27 = 0;
        }
        id v28 = [v81 endCapStyle];
        long long v29 = [(HKLineSeries *)v80 pointMarkerImageForPointMarkerStyle:v28];

        uint64_t v30 = objc_opt_new();
        long long v31 = objc_opt_new();
        id v32 = objc_opt_new();
        id v33 = objc_opt_new();
        id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __190__HKLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate_forceGapBetweenUntransformedPoints___block_invoke;
        v98[3] = &unk_1E6D52150;
        v98[4] = v80;
        id v76 = v23;
        id v99 = v76;
        id v35 = v32;
        id v100 = v35;
        id v75 = v30;
        id v101 = v75;
        id v36 = v24;
        id v102 = v36;
        double v107 = x;
        double v108 = y;
        double v109 = width;
        double v110 = height;
        id v73 = v33;
        id v103 = v73;
        id v37 = v31;
        id v104 = v37;
        id v38 = v29;
        id v105 = v38;
        id v39 = v34;
        id v106 = v39;
        long long v40 = *(_OWORD *)&a6->c;
        long long v95 = *(_OWORD *)&a6->a;
        long long v96 = v40;
        long long v97 = *(_OWORD *)&a6->tx;
        double v20 = v71;
        -[HKLineSeries _enumeratePathsFromBlockCoordinates:axisRect:zoomLevelConfiguration:transform:presentationStyle:caresAboutSelection:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:handler:](v80, "_enumeratePathsFromBlockCoordinates:axisRect:zoomLevelConfiguration:transform:presentationStyle:caresAboutSelection:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:handler:", v78, v72, &v95, v81, v27, v69, x, y, width, height, v67, v98);
        if (v76)
        {
          if (([v75 isEmpty] & 1) == 0)
          {
            [v76 applyToContext:v71];
            CGContextAddPath(v71, (CGPathRef)[v75 CGPath]);
            CGContextStrokePath(v71);
          }
          if (([v35 isEmpty] & 1) == 0)
          {
            [v74 applyToContext:v71];
            CGContextAddPath(v71, (CGPathRef)[v35 CGPath]);
            CGContextStrokePath(v71);
          }
        }
        if (v36)
        {
          if (([v37 isEmpty] & 1) == 0)
          {
            uint64_t v41 = [v37 CGPath];
            [(HKGraphSeries *)v80 alpha];
            objc_msgSend(v36, "renderPath:context:axisRect:alpha:", v41, v71, x, y, width, height, v42);
          }
          if (([v35 isEmpty] & 1) == 0)
          {
            uint64_t v43 = [v73 CGPath];
            [(HKGraphSeries *)v80 alpha];
            objc_msgSend(v77, "renderPath:context:axisRect:alpha:", v43, v71, x, y, width, height, v44);
          }
        }
        if (v38) {
          [(HKLineSeries *)v80 _renderLineEndCapsInContext:v71 endCaps:v39 endCapImage:v38];
        }
        long long v45 = *(_OWORD *)&a6->c;
        long long v95 = *(_OWORD *)&a6->a;
        long long v96 = v45;
        long long v97 = *(_OWORD *)&a6->tx;
        [(HKLineSeries *)v80 _renderPointMarkersInContext:v71 blockCoordinates:v78 pointTransform:&v95 presentationStyle:v81];
        v46 = [v81 annotationStyle];
        if (v46)
        {
          long long v47 = *(_OWORD *)&a6->c;
          long long v95 = *(_OWORD *)&a6->a;
          long long v96 = v47;
          long long v97 = *(_OWORD *)&a6->tx;
          -[HKLineSeries _renderPointLabelsInContext:blockCoordinates:axisRect:pointTransform:presentationStyle:zoomLevelConfiguration:seriesRenderingDelegate:](v80, "_renderPointLabelsInContext:blockCoordinates:axisRect:pointTransform:presentationStyle:zoomLevelConfiguration:seriesRenderingDelegate:", v71, v78, &v95, v81, v72, v69, x, y, width, height);
        }
        double v48 = [v81 legendAnnotationStyle];
        BOOL v49 = v48 == 0;

        if (!v49)
        {
          float v50 = [v81 legendAnnotationStyle];
          uint64_t v51 = [v50 leftOfSeries];

          *(void *)&long long v95 = 0;
          *((void *)&v95 + 1) = &v95;
          *(void *)&long long v96 = 0x3010000000;
          *((void *)&v96 + 1) = &unk_1E0F50A5E;
          long long v97 = 0uLL;
          uint64_t v89 = 0;
          v90 = (double *)&v89;
          uint64_t v91 = 0x3010000000;
          v92 = &unk_1E0F50A5E;
          uint64_t v93 = 0;
          uint64_t v94 = 0;
          long long v52 = *(_OWORD *)&a6->c;
          long long v86 = *(_OWORD *)&a6->a;
          long long v87 = v52;
          long long v88 = *(_OWORD *)&a6->tx;
          if (v51) {
            [v78 firstCoordinateWithTransform:&v86 roundToViewScale:1];
          }
          else {
          id v53 = [v78 lastCoordinateWithTransform:&v86 roundToViewScale:1];
          }
          [v53 coordinate];
          uint64_t v54 = *((void *)&v95 + 1);
          *(void *)(*((void *)&v95 + 1) + 32) = v55;
          *(void *)(v54 + 40) = v56;
          long long v57 = *(_OWORD *)&a6->c;
          long long v86 = *(_OWORD *)&a6->a;
          long long v87 = v57;
          long long v88 = *(_OWORD *)&a6->tx;
          double v58 = (void *)[v53 copyWithTransform:&v86 roundToViewScale:1];
          [v58 coordinate];
          uint64_t v59 = v90;
          *((void *)v90 + 4) = v60;
          *((void *)v59 + 5) = v61;

          v84[0] = 0;
          v84[1] = v84;
          v84[2] = 0x2020000000;
          char v85 = 1;
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __190__HKLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate_forceGapBetweenUntransformedPoints___block_invoke_2;
          v82[3] = &unk_1E6D52178;
          char v83 = v51;
          v82[4] = v84;
          v82[5] = &v89;
          v82[6] = &v95;
          long long v62 = *(_OWORD *)&a6->c;
          long long v86 = *(_OWORD *)&a6->a;
          long long v87 = v62;
          long long v88 = *(_OWORD *)&a6->tx;
          -[HKLineSeries _enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](v80, "_enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v78, &v86, v81, v72, v82, x, y, width, height);
          -[HKLineSeries drawLegendPointLabelInContext:point:untransformedPoint:axisRect:presentationStyle:leftOfPoint:](v80, "drawLegendPointLabelInContext:point:untransformedPoint:axisRect:presentationStyle:leftOfPoint:", v71, v81, v51, v90[4], v90[5], *(double *)(*((void *)&v95 + 1) + 32), *(double *)(*((void *)&v95 + 1) + 40), x, y, width, height);
          _Block_object_dispose(v84, 8);
          _Block_object_dispose(&v89, 8);
          _Block_object_dispose(&v95, 8);
          double v20 = v71;
        }

        uint64_t v21 = v70 + 1;
      }
      while (v68 != v70 + 1);
      uint64_t v68 = [obj countByEnumeratingWithState:&v111 objects:v115 count:16];
    }
    while (v68);
  }

  CGContextRestoreGState(v20);
  long long v63 = *(_OWORD *)&a6->c;
  long long v95 = *(_OWORD *)&a6->a;
  long long v96 = v63;
  long long v97 = *(_OWORD *)&a6->tx;
  -[HKLineSeries _updateSecondaryRenderContextWithBlockCoordinates:secondaryRenderContext:pointTransform:zoomLevelConfiguration:axisRect:](v80, "_updateSecondaryRenderContextWithBlockCoordinates:secondaryRenderContext:pointTransform:zoomLevelConfiguration:axisRect:", v78, v64, &v95, v72, x, y, width, height);
}

void __190__HKLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate_forceGapBetweenUntransformedPoints___block_invoke(uint64_t a1, void *a2, double a3, CGFloat a4, double a5, CGFloat MaxY)
{
  id v30 = a2;
  uint64_t v11 = [*(id *)(a1 + 32) closestXCoordinateRange];

  if (!v11) {
    goto LABEL_3;
  }
  uint64_t v12 = [*(id *)(a1 + 32) closestXCoordinateRange];
  uint64_t v13 = [v12 minValue];
  [v13 floatValue];
  double v15 = HKUIFloorToScreenScale(v14);

  id v16 = [*(id *)(a1 + 32) closestXCoordinateRange];
  double v17 = [v16 maxValue];
  [v17 floatValue];
  double v19 = HKUIFloorToScreenScale(v18);

  double v20 = vabdd_f64(v15, HKUIFloorToScreenScale(a3));
  if (v20 <= HKUIOnePixel())
  {
    double v22 = vabdd_f64(v19, HKUIFloorToScreenScale(a5));
    BOOL v21 = v22 <= HKUIOnePixel();
  }
  else
  {
LABEL_3:
    BOOL v21 = 0;
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v23 = 56;
    if (v21) {
      uint64_t v23 = 48;
    }
    [*(id *)(a1 + v23) appendPath:v30];
  }
  if (*(void *)(a1 + 64))
  {
    id v24 = (void *)[v30 copy];
    MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 104));
    a4 = CGRectGetMaxY(*(CGRect *)(a1 + 104));
    objc_msgSend(v24, "addLineToPoint:", a5, MaxY);
    objc_msgSend(v24, "addLineToPoint:", a3, a4);
    [v24 closePath];
    uint64_t v25 = 80;
    if (v21) {
      uint64_t v25 = 72;
    }
    [*(id *)(a1 + v25) appendPath:v24];
  }
  if (*(void *)(a1 + 88))
  {
    id v26 = *(void **)(a1 + 96);
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", a3, a4);
    [v26 addObject:v27];

    if (a3 != a5 || a4 != MaxY)
    {
      id v28 = *(void **)(a1 + 96);
      long long v29 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", a5, MaxY);
      [v28 addObject:v29];
    }
  }
}

uint64_t __190__HKLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate_forceGapBetweenUntransformedPoints___block_invoke_2(uint64_t result, int a2, double a3, double a4, double a5, double a6)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) && *(unsigned char *)(result + 56))
  {
    uint64_t v6 = *(void *)(*(void *)(result + 40) + 8);
    *(double *)(v6 + 32) = a3;
    *(double *)(v6 + 40) = a4;
    uint64_t v7 = *(void *)(*(void *)(result + 48) + 8);
    *(double *)(v7 + 32) = a5;
    *(double *)(v7 + 40) = a6;
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  }
  if (a2)
  {
    if (!*(unsigned char *)(result + 56))
    {
      uint64_t v8 = *(void *)(*(void *)(result + 40) + 8);
      *(double *)(v8 + 32) = a3;
      *(double *)(v8 + 40) = a4;
      uint64_t v9 = *(void *)(*(void *)(result + 48) + 8);
      *(double *)(v9 + 32) = a5;
      *(double *)(v9 + 40) = a6;
    }
  }
  return result;
}

- (id)pointMarkerImageForPointMarkerStyle:(id)a3
{
  return +[HKChartSeriesPointMarker chartPointWithLineSeriesPresentationStyle:a3];
}

- (void)drawLegendPointLabelInContext:(CGContext *)a3 point:(CGPoint)a4 untransformedPoint:(CGPoint)a5 axisRect:(CGRect)a6 presentationStyle:(id)a7 leftOfPoint:(BOOL)a8
{
  BOOL v8 = a8;
  double y = a4.y;
  double x = a4.x;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  uint64_t v12 = [v11 legendAnnotationStyle];
  uint64_t v13 = [v12 labelStyle];

  float v14 = [v13 textColor];
  double v15 = [v13 font];
  uint64_t v16 = *MEMORY[0x1E4FB0700];
  v32[0] = *MEMORY[0x1E4FB06F8];
  v32[1] = v16;
  v33[0] = v15;
  v33[1] = v14;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  float v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v19 = [v11 legendAnnotationStyle];
  double v20 = [v19 localizedLabelKey];
  BOOL v21 = [v18 localizedStringForKey:v20 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  [v21 sizeWithAttributes:v17];
  double v23 = v22;
  double v25 = v24;
  if (v8)
  {
    double v26 = x + v22 * -0.5 * 2.0 + -3.0;
    uint64_t v27 = [v11 pointMarkerStyle];

    [v27 radius];
    double v29 = v26 - v28;
  }
  else
  {
    uint64_t v27 = [v11 pointMarkerStyle];

    [v27 radius];
    double v29 = x + 3.0 + v30;
  }

  -[HKLineSeries _renderPointLegendLabelWithText:drawRect:labelAttributes:](self, "_renderPointLegendLabelWithText:drawRect:labelAttributes:", v21, v17, v29, y + v25 * -0.5, v23, v25);
}

- (void)_updateSecondaryRenderContextWithBlockCoordinates:(id)a3 secondaryRenderContext:(id)a4 pointTransform:(CGAffineTransform *)a5 zoomLevelConfiguration:(id)a6 axisRect:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3010000000;
  void v44[3] = &unk_1E0F50A5E;
  int64x2_t v45 = vdupq_n_s64(0x10000000000000uLL);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0x10000000000000;
  v46.origin.double x = x;
  v46.origin.double y = y;
  v46.size.double width = width;
  v46.size.double height = height;
  CGFloat MinY = CGRectGetMinY(v46);
  v47.origin.double x = x;
  v47.origin.double y = y;
  v47.size.double width = width;
  v47.size.double height = height;
  CGFloat MaxY = CGRectGetMaxY(v47);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__HKLineSeries__updateSecondaryRenderContextWithBlockCoordinates_secondaryRenderContext_pointTransform_zoomLevelConfiguration_axisRect___block_invoke_2;
  aBlock[3] = &unk_1E6D521C0;
  CGFloat v41 = MinY;
  CGFloat v42 = MaxY;
  id v38 = &__block_literal_global_317;
  id v39 = v43;
  long long v40 = v44;
  id v20 = v16;
  id v36 = v20;
  id v37 = self;
  BOOL v21 = _Block_copy(aBlock);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __136__HKLineSeries__updateSecondaryRenderContextWithBlockCoordinates_secondaryRenderContext_pointTransform_zoomLevelConfiguration_axisRect___block_invoke_3;
  v26[3] = &unk_1E6D521E8;
  CGFloat v33 = MinY;
  CGFloat v34 = MaxY;
  long long v31 = v44;
  id v32 = v43;
  id v22 = v21;
  id v29 = v22;
  id v30 = &__block_literal_global_317;
  id v23 = v20;
  id v27 = v23;
  double v28 = self;
  long long v24 = *(_OWORD *)&a5->c;
  v25[0] = *(_OWORD *)&a5->a;
  v25[1] = v24;
  v25[2] = *(_OWORD *)&a5->tx;
  -[HKLineSeries _enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](self, "_enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v15, v25, 0, v17, v26, x, y, width, height);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);
}

BOOL __136__HKLineSeries__updateSecondaryRenderContextWithBlockCoordinates_secondaryRenderContext_pointTransform_zoomLevelConfiguration_axisRect___block_invoke(double a1, double a2, double a3, double a4)
{
  return HKUIEqualCGFloats(a4, a2);
}

void __136__HKLineSeries__updateSecondaryRenderContextWithBlockCoordinates_secondaryRenderContext_pointTransform_zoomLevelConfiguration_axisRect___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, __n128 a5, __n128 a6)
{
  a6.n128_f64[0] = a4;
  a5.n128_f64[0] = a3;
  if (*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 2.22507386e-308)
  {
    uint64_t v8 = 80;
    if (a2) {
      uint64_t v8 = 72;
    }
    double v9 = (*(double (**)(double, double, __n128, __n128, double))(*(void *)(a1 + 48) + 16))(*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a5, a6, *(double *)(a1 + v8));
    double v10 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = [*(id *)(a1 + 40) offScreenIndicatorColor];
    [v11 addOffScreenRegionWithStartLocation:v12 endLocation:a2 color:v10 aboveScreen:v9];

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0x10000000000000;
  }
}

void __136__HKLineSeries__updateSecondaryRenderContextWithBlockCoordinates_secondaryRenderContext_pointTransform_zoomLevelConfiguration_axisRect___block_invoke_3(uint64_t a1, int a2, void *a3, double a4, double a5)
{
  id v9 = a3;
  double v12 = *(double *)(a1 + 80);
  v11.n128_u64[0] = *(void *)(a1 + 88);
  BOOL v13 = a5 < v12;
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  v15.n128_u64[0] = *(void *)(v14 + 32);
  if (a5 > v11.n128_f64[0]) {
    BOOL v13 = 1;
  }
  if (v13 && v15.n128_f64[0] == 2.22507386e-308)
  {
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a4;
    goto LABEL_19;
  }
  v10.n128_u64[0] = *(void *)(v14 + 40);
  if (a5 < v12 && v10.n128_f64[0] >= v12)
  {
    id v24 = v9;
    BOOL v18 = v10.n128_f64[0] <= v11.n128_f64[0];
    v11.n128_u64[0] = *(void *)(a1 + 80);
    if (!v18)
    {
      (*(void (**)(double, double))(*(void *)(a1 + 48) + 16))(a4, a5);
      uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
      v11.n128_u64[0] = *(void *)(a1 + 80);
LABEL_25:
      v15.n128_u64[0] = *(void *)(v19 + 32);
      v10.n128_u64[0] = *(void *)(v19 + 40);
      goto LABEL_26;
    }
    goto LABEL_26;
  }
  BOOL v18 = a5 > v11.n128_f64[0] && v10.n128_f64[0] <= v11.n128_f64[0];
  if (!v18)
  {
    if (!v13)
    {
      id v24 = v9;
      (*(void (**)(double, double))(*(void *)(a1 + 48) + 16))(a4, a5);
      goto LABEL_27;
    }
LABEL_19:
    if (!a2) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  id v24 = v9;
  if (v10.n128_f64[0] < v12)
  {
    (*(void (**)(double, double))(*(void *)(a1 + 48) + 16))(a4, a5);
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    v11.n128_u64[0] = *(void *)(a1 + 88);
    goto LABEL_25;
  }
LABEL_26:
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = (*(double (**)(__n128, __n128, double, double, __n128))(*(void *)(a1 + 56) + 16))(v15, v10, a4, a5, v11);
LABEL_27:
  id v9 = v24;
  if (!a2) {
    goto LABEL_30;
  }
LABEL_28:
  double v20 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v20 != 2.22507386e-308)
  {
    id v25 = v9;
    BOOL v21 = *(void **)(a1 + 32);
    id v22 = [*(id *)(a1 + 40) offScreenIndicatorColor];
    [v21 addOffScreenRegionWithStartLocation:v22 endLocation:a5 < v12 color:v20 aboveScreen:a4];

    id v9 = v25;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0x10000000000000;
  }
LABEL_30:
  uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
  *(double *)(v23 + 32) = a4;
  *(double *)(v23 + 40) = a5;
}

- (void)_renderLineEndCapsInContext:(CGContext *)a3 endCaps:(id)a4 endCapImage:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  CGContextSaveGState(a3);
  double v9 = HKChartSeriesPointMarkerBaseRect(v8);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  id v16 = v8;
  id v17 = (CGImage *)[v16 CGImage];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = v7;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v22), "CGPointValue", (void)v27);
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        v33.origin.double x = v9;
        v33.origin.double y = v11;
        v33.size.double width = v13;
        v33.size.double height = v15;
        CGRect v34 = CGRectOffset(v33, v24, v26);
        CGContextDrawImage(a3, v34, v17);
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v20);
  }

  CGContextRestoreGState(a3);
}

- (void)_renderPointMarkersInContext:(CGContext *)a3 blockCoordinates:(id)a4 pointTransform:(CGAffineTransform *)a5 presentationStyle:(id)a6
{
  id v10 = a4;
  CGFloat v11 = [a6 pointMarkerStyle];
  selectedPointMarkerStyle = self->_selectedPointMarkerStyle;
  CGFloat v13 = [(NSArray *)self->_selectedPresentationStyles firstObject];
  double v14 = [v13 pointMarkerStyle];
  long long v15 = *(_OWORD *)&a5->c;
  v16[0] = *(_OWORD *)&a5->a;
  v16[1] = v15;
  v16[2] = *(_OWORD *)&a5->tx;
  [(HKLineSeries *)self renderPointMarkersInContext:a3 blockCoordinates:v10 pointTransform:v16 pointMarkerStyle:v11 selectedBoundsMarkerStyle:selectedPointMarkerStyle selectedPointMarkerStyle:v14];
}

- (void)renderPointMarkersInContext:(CGContext *)a3 blockCoordinates:(id)a4 pointTransform:(CGAffineTransform *)a5 pointMarkerStyle:(id)a6 selectedBoundsMarkerStyle:(id)a7 selectedPointMarkerStyle:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = [(HKLineSeries *)self pointMarkerImageForPointMarkerStyle:a6];
  if (v17)
  {
    CGContextSaveGState(a3);
    double v18 = HKChartSeriesPointMarkerBaseRect(v17);
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v39 = [v17 CGImage];
    double v25 = [(HKLineSeries *)self pointMarkerImageForPointMarkerStyle:v15];
    double v26 = HKChartSeriesPointMarkerBaseRect(v25);
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    id v33 = v25;
    CGRect v34 = v14;
    uint64_t v35 = [v33 CGImage];
    [(HKLineSeries *)self pointMarkerImageForPointMarkerStyle:v16];
    id v40 = v16;
    id v36 = objc_claimAutoreleasedReturnValue();
    uint64_t v37 = [v36 CGImage];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    [(HKGraphSeries *)self selectedPathRange];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __144__HKLineSeries_renderPointMarkersInContext_blockCoordinates_pointTransform_pointMarkerStyle_selectedBoundsMarkerStyle_selectedPointMarkerStyle___block_invoke;
    v42[3] = &__block_descriptor_192_e114_v64__0___HKLineSeriesBlockCoordinate_8____HKGraphSeriesDataBlockPath_qqq_q_16___HKLineSeriesBlockCoordinate_48_B56l;
    void v42[4] = v39;
    *(double *)&v42[5] = v18;
    v42[6] = v20;
    v42[7] = v22;
    v42[8] = v24;
    long long v43 = v54;
    long long v44 = v55;
    long long v45 = v56;
    long long v46 = v57;
    uint64_t v47 = v35;
    id v14 = v34;
    double v48 = v26;
    uint64_t v49 = v28;
    uint64_t v50 = v30;
    uint64_t v51 = v32;
    uint64_t v52 = v37;
    id v53 = a3;
    long long v38 = *(_OWORD *)&a5->c;
    v41[0] = *(_OWORD *)&a5->a;
    v41[1] = v38;
    v41[2] = *(_OWORD *)&a5->tx;
    [v34 enumerateCoordinatesWithTransform:v41 roundToViewScale:1 block:v42];
    CGContextRestoreGState(a3);

    id v16 = v40;
  }
}

void __144__HKLineSeries_renderPointMarkersInContext_blockCoordinates_pointTransform_pointMarkerStyle_selectedBoundsMarkerStyle_selectedPointMarkerStyle___block_invoke(uint64_t a1, void *a2, long long *a3)
{
  [a2 coordinate];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v9 = *(CGImage **)(a1 + 32);
  CGFloat v10 = *(double *)(a1 + 40);
  CGFloat v11 = *(double *)(a1 + 48);
  CGFloat v12 = *(double *)(a1 + 56);
  CGFloat v13 = *(double *)(a1 + 64);
  long long v14 = a3[1];
  long long v22 = *a3;
  long long v23 = v14;
  long long v15 = *(_OWORD *)(a1 + 88);
  long long v26 = *(_OWORD *)(a1 + 72);
  long long v27 = v15;
  if (HKGraphSeriesDataPointPathEqualToPath(&v22, &v26)
    || (long long v16 = a3[1],
        long long v22 = *a3,
        long long v23 = v16,
        long long v17 = *(_OWORD *)(a1 + 120),
        long long v26 = *(_OWORD *)(a1 + 104),
        long long v27 = v17,
        HKGraphSeriesDataPointPathEqualToPath(&v22, &v26)))
  {
    double v9 = *(CGImage **)(a1 + 136);
    CGFloat v10 = *(double *)(a1 + 144);
    CGFloat v11 = *(double *)(a1 + 152);
    CGFloat v12 = *(double *)(a1 + 160);
    CGFloat v13 = *(double *)(a1 + 168);
  }
  long long v18 = a3[1];
  long long v26 = *a3;
  long long v27 = v18;
  long long v19 = *(_OWORD *)(a1 + 88);
  long long v22 = *(_OWORD *)(a1 + 72);
  long long v23 = v19;
  long long v20 = *(_OWORD *)(a1 + 120);
  long long v24 = *(_OWORD *)(a1 + 104);
  long long v25 = v20;
  if (HKGraphSeriesDataPointPathInRange((uint64_t *)&v26, (uint64_t *)&v22))
  {
    double v9 = *(CGImage **)(a1 + 176);
    CGFloat v10 = *(double *)(a1 + 40);
    CGFloat v11 = *(double *)(a1 + 48);
    CGFloat v12 = *(double *)(a1 + 56);
    CGFloat v13 = *(double *)(a1 + 64);
  }
  uint64_t v21 = *(CGContext **)(a1 + 184);
  v28.origin.double x = v10;
  v28.origin.double y = v11;
  v28.size.double width = v12;
  v28.size.double height = v13;
  CGRect v29 = CGRectOffset(v28, v6, v8);
  CGContextDrawImage(v21, v29, v9);
}

- (void)_renderPointLabelsInContext:(CGContext *)a3 blockCoordinates:(id)a4 axisRect:(CGRect)a5 pointTransform:(CGAffineTransform *)a6 presentationStyle:(id)a7 zoomLevelConfiguration:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v61[2] = *MEMORY[0x1E4F143B8];
  id v18 = a9;
  id v42 = a8;
  id v19 = a7;
  id v41 = a4;
  long long v20 = [v19 annotationStyle];
  uint64_t v21 = [v20 textColor];
  uint64_t v22 = [v20 font];
  uint64_t v23 = *MEMORY[0x1E4FB0700];
  v60[0] = *MEMORY[0x1E4FB06F8];
  v60[1] = v23;
  long long v44 = (void *)v22;
  long long v45 = (void *)v21;
  v61[0] = v22;
  v61[1] = v21;
  long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
  long long v25 = [v20 numberFormatter];
  long long v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    HKIntegerFormatter();
    id v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  CGRect v28 = v27;

  CGRect v29 = [HKPointLabelEngine alloc];
  uint64_t v30 = [v18 seriesDrawingDuringTiling] ^ 1;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __150__HKLineSeries__renderPointLabelsInContext_blockCoordinates_axisRect_pointTransform_presentationStyle_zoomLevelConfiguration_seriesRenderingDelegate___block_invoke;
  v57[3] = &unk_1E6D52230;
  id v31 = v28;
  id v58 = v31;
  id v32 = v24;
  id v59 = v32;
  id v33 = -[HKPointLabelEngine initWithBoundingRegion:isLabelShiftingEnabled:labelSizeBlock:](v29, "initWithBoundingRegion:isLabelShiftingEnabled:labelSizeBlock:", v30, v57, x, y, width, height);
  CGContextSaveGState(a3);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __150__HKLineSeries__renderPointLabelsInContext_blockCoordinates_axisRect_pointTransform_presentationStyle_zoomLevelConfiguration_seriesRenderingDelegate___block_invoke_2;
  v50[3] = &unk_1E6D52258;
  CGRect v34 = v33;
  uint64_t v51 = v34;
  uint64_t v52 = self;
  uint64_t v35 = self;
  long long v56 = a3;
  id v36 = v31;
  id v53 = v36;
  id v37 = v32;
  id v54 = v37;
  id v38 = v18;
  id v55 = v38;
  long long v39 = *(_OWORD *)&a6->c;
  long long v47 = *(_OWORD *)&a6->a;
  long long v48 = v39;
  long long v49 = *(_OWORD *)&a6->tx;
  -[HKLineSeries _enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](v35, "_enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v41, &v47, v19, v42, v50, x, y, width, height);

  if ([(HKPointLabelEngine *)v34 processLastPoint])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v47 = 0u;
    if (v34)
    {
      [(HKPointLabelEngine *)v34 renderingData];
      uint64_t v40 = *((void *)&v49 + 1) | 2;
    }
    else
    {
      *(void *)&long long v49 = 0;
      uint64_t v40 = 2;
      long long v47 = 0uLL;
      long long v48 = 0uLL;
    }
    *((void *)&v49 + 1) = v40;
    v46[0] = v47;
    v46[1] = v48;
    v46[2] = v49;
    [(HKLineSeries *)v35 _renderPointLabelInContext:a3 renderingData:v46 numberFormatter:v36 labelAttributes:v37 seriesRenderingDelegate:v38];
  }
  CGContextRestoreGState(a3);
}

double __150__HKLineSeries__renderPointLabelsInContext_blockCoordinates_axisRect_pointTransform_presentationStyle_zoomLevelConfiguration_seriesRenderingDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v4 = [v2 stringFromNumber:v3 displayType:0 unitController:0];

  [v4 sizeWithAttributes:*(void *)(a1 + 40)];
  double v6 = v5;

  return v6;
}

uint64_t __150__HKLineSeries__renderPointLabelsInContext_blockCoordinates_axisRect_pointTransform_presentationStyle_zoomLevelConfiguration_seriesRenderingDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "processTransformedPoint:untransformedPoint:");
  if (result)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3)
    {
      [v3 renderingData];
      uint64_t v4 = *((void *)&v13 + 1) | 2;
    }
    else
    {
      *(void *)&long long v13 = 0;
      uint64_t v4 = 2;
      long long v11 = 0uLL;
      long long v12 = 0uLL;
    }
    *((void *)&v13 + 1) = v4;
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 72);
    double v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    return [v7 _renderPointLabelInContext:v5 renderingData:v10 numberFormatter:v8 labelAttributes:v9 seriesRenderingDelegate:v6];
  }
  return result;
}

- (void)_renderPointLabelInContext:(CGContext *)a3 renderingData:(id *)a4 numberFormatter:(id)a5 labelAttributes:(id)a6 seriesRenderingDelegate:(id)a7
{
  id v19 = a6;
  id v11 = a7;
  long long v12 = NSNumber;
  double var1 = a4->var1;
  id v14 = a5;
  long long v15 = [v12 numberWithDouble:var1];
  long long v16 = [v14 stringFromNumber:v15 displayType:0 unitController:0];

  if ((a4->var2 & 2) != 0)
  {
    if (([v11 seriesDrawingDuringTiling] & 1) != 0
      || [v11 seriesDrawingDuringScrolling])
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4FB1618] clearColor];
    }
    id v18 = (void *)v17;
    objc_msgSend(v16, "hk_drawInRect:withAttributes:outlineWidth:outlineColor:context:", v19, v17, a3, a4->var0.origin.x, a4->var0.origin.y, a4->var0.size.width, a4->var0.size.height, 8.0);
  }
  else
  {
    objc_msgSend(v16, "drawInRect:withAttributes:", v19, a4->var0.origin.x, a4->var0.origin.y, a4->var0.size.width, a4->var0.size.height);
  }
}

- (void)_renderPointLegendLabelWithText:(id)a3 drawRect:(CGRect)a4 labelAttributes:(id)a5
{
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  long long v13 = [a3 chartPoints];
  if (!v13)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKLineSeries.m", 1018, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  id v14 = [v11 transform];
  long long v15 = [v12 transform];

  long long v16 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__HKLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  _OWORD v25[3] = &unk_1E6D52280;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [v13 enumerateObjectsUsingBlock:v25];
  long long v23 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  long long v20 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v17 blockPath:&v23];

  return v20;
}

void __58__HKLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(void *a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [v15 yValue];

  if (v3)
  {
    uint64_t v4 = (void *)a1[4];
    uint64_t v5 = [v15 xValueAsGenericType];
    [v4 coordinateForValue:v5];
    double v7 = v6;

    uint64_t v8 = (void *)a1[5];
    uint64_t v9 = [v15 yValue];
    [v8 coordinateForValue:v9];
    double v11 = v10;

    id v12 = [v15 userInfo];
    long long v13 = (void *)a1[6];
    id v14 = -[_HKLineSeriesBlockCoordinate initWithCoordinate:userInfo:]([_HKLineSeriesBlockCoordinate alloc], "initWithCoordinate:userInfo:", v12, v7, v11);
    [v13 addObject:v14];
  }
}

- (BOOL)supportsMultiTouchSelection
{
  return 1;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v6 = [(HKLineSeries *)self unhighlightedPresentationStyles];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unsigned __int8 v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) annotationStyle];
        BOOL v13 = v12 != 0;

        v9 |= v13;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  if (a4 == 1) {
    return (a3 == 5) & v9;
  }
  else {
    return 0;
  }
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HKLineSeries.m" lineNumber:1063 description:@"distanceFromPoint type class failure"];
  }
  [v7 coordinate];
  UIDistanceBetweenPoints();
  double v9 = v8;

  return v9;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HKLineSeries.m" lineNumber:1071 description:@"xAxisDistanceFromPoint type class failure"];
  }
  [v8 coordinate];
  double v10 = vabdd_f64(v9, x);

  return v10;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HKLineSeries.m" lineNumber:1080 description:@"yAxisDiffToPoint type class failure"];
  }
  [v8 coordinate];
  double v10 = v9 - y;

  return v10;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [a4 coordinate];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  CGFloat v12 = x;
  CGFloat v13 = y;
  CGFloat v14 = width;
  CGFloat v15 = height;
  return CGRectContainsPoint(*(CGRect *)&v12, *(CGPoint *)&v9);
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v5 = a4;
  [a3 coordinate];
  double v7 = v6;
  [v5 coordinate];
  double v9 = v8;

  return v7 < v9;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v5 = a4;
  [a3 coordinate];
  double v7 = v6;
  [v5 coordinate];
  double v9 = v8;

  return v7 > v9;
}

- (NSArray)unhighlightedPresentationStyles
{
  return self->_unhighlightedPresentationStyles;
}

- (void)setUnhighlightedPresentationStyles:(id)a3
{
}

- (NSArray)highlightedPresentationStyles
{
  return self->_highlightedPresentationStyles;
}

- (void)setHighlightedPresentationStyles:(id)a3
{
}

- (NSArray)selectedPresentationStyles
{
  return self->_selectedPresentationStyles;
}

- (void)setSelectedPresentationStyles:(id)a3
{
}

- (HKLineSeriesPointMarkerStyle)selectedPointMarkerStyle
{
  return self->_selectedPointMarkerStyle;
}

- (void)setSelectedPointMarkerStyle:(id)a3
{
}

- (HKLineSeriesPresentationStyle)inactivePresentationStyle
{
  return self->_inactivePresentationStyle;
}

- (void)setInactivePresentationStyle:(id)a3
{
}

- (BOOL)flatLastValue
{
  return self->_flatLastValue;
}

- (void)setFlatLastValue:(BOOL)a3
{
  self->_flatLastValue = a3;
}

- (BOOL)extendLastValue
{
  return self->_extendLastValue;
}

- (void)setExtendLastValue:(BOOL)a3
{
  self->_extendLastValue = a3;
}

- (BOOL)extendFirstValue
{
  return self->_extendFirstValue;
}

- (void)setExtendFirstValue:(BOOL)a3
{
  self->_extendFirstValue = a3;
}

- (NSNumber)maximumConnectionDistance
{
  return self->_maximumConnectionDistance;
}

- (void)setMaximumConnectionDistance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumConnectionDistance, 0);
  objc_storeStrong((id *)&self->_inactivePresentationStyle, 0);
  objc_storeStrong((id *)&self->_selectedPointMarkerStyle, 0);
  objc_storeStrong((id *)&self->_selectedPresentationStyles, 0);
  objc_storeStrong((id *)&self->_highlightedPresentationStyles, 0);
  objc_storeStrong((id *)&self->_unhighlightedPresentationStyles, 0);
}

@end