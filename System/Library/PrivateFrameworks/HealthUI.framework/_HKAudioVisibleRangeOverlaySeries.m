@interface _HKAudioVisibleRangeOverlaySeries
- (id)_leqDataFromBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 screenRect:(CGRect)a5;
- (int64_t)overlayType;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)drawOverlayInContext:(CGContext *)a3 seriesOverlayData:(id)a4;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
@end

@implementation _HKAudioVisibleRangeOverlaySeries

- (int64_t)overlayType
{
  return 2;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v16 = a3;
  id v17 = a9;
  v18 = [v17 axisAnnotationDelegateForSeries:self];
  if (([v17 seriesDrawingDuringScrolling] & 1) != 0
    || ([v17 seriesDrawingDuringTiling] & 1) != 0
    || [v17 seriesDrawingDuringAutoscale])
  {
    [v18 clearAxisAnnotations];
  }
  else
  {
    v19 = [v16 coordinates];
    long long v20 = *(_OWORD *)&a6->c;
    v22[0] = *(_OWORD *)&a6->a;
    v22[1] = v20;
    v22[2] = *(_OWORD *)&a6->tx;
    v21 = -[_HKAudioVisibleRangeOverlaySeries _leqDataFromBlockCoordinates:pointTransform:screenRect:](self, "_leqDataFromBlockCoordinates:pointTransform:screenRect:", v19, v22, x, y, width, height);

    if (v21)
    {
      [v21 averageLEQ];
      -[HKLineSeries addAxisAnnotationForValue:axisAnnotationDelegate:](self, "addAxisAnnotationForValue:axisAnnotationDelegate:", v18);
    }
  }
}

- (void)drawOverlayInContext:(CGContext *)a3 seriesOverlayData:(id)a4
{
  id v6 = a4;
  if ([v6 count] == 1)
  {
    v7 = [v6 firstObject];
    v8 = [v7 graphSeriesCoordinates];
    v9 = [v8 coordinates];
    if (v7)
    {
      [v7 graphSeriesPointTransform];
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
    }
    [v7 graphSeriesScreenRect];
    v10 = -[_HKAudioVisibleRangeOverlaySeries _leqDataFromBlockCoordinates:pointTransform:screenRect:](self, "_leqDataFromBlockCoordinates:pointTransform:screenRect:", v9, &v32);

    v11 = [v7 graphSeries];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && v10)
    {
      [v10 averageLEQ];
      double v14 = v13;
      if (v7)
      {
        [v7 graphSeriesPointTransform];
        double v15 = *((double *)&v29 + 1);
        double v16 = *((double *)&v30 + 1);
        double v17 = *((double *)&v31 + 1);
      }
      else
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v29 = 0u;
        double v17 = 0.0;
        double v16 = 0.0;
        double v15 = 0.0;
      }
      double v18 = v17 + v14 * v16 + v15 * 0.0;
      objc_msgSend(v7, "graphSeriesScreenRect", v29, v30, v31, v32, v33, v34);
      CGFloat v20 = v18 + v19;
      v21 = [v7 graphSeries];
      v22 = [v21 unhighlightedPresentationStyles];
      v23 = [v22 firstObject];

      v24 = [v23 strokeStyle];
      [v24 applyToContext:a3];
      [v7 graphSeriesScreenRect];
      CGContextMoveToPoint(a3, v25, v20);
      [v7 graphSeriesScreenRect];
      double v27 = v26;
      [v7 graphSeriesScreenRect];
      CGContextAddLineToPoint(a3, v27 + v28, v20);
      CGContextStrokePath(a3);
    }
  }
}

- (id)_leqDataFromBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 screenRect:(CGRect)a5
{
  double width = a5.size.width;
  double x = a5.origin.x;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v47;
    double v13 = x + width;
    double v14 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v9);
        }
        double v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        objc_msgSend(v16, "startXValue", v40);
        double v18 = a4->tx + a4->c * 0.0 + a4->a * v17;
        if (v18 >= x && v18 <= v13)
        {
          CGFloat v20 = [v16 userInfo];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v22 = [v16 userInfo];
            [v40 addObject:v22];
            id v23 = objc_alloc(MEMORY[0x1E4F2AC30]);
            [v22 averageLEQ];
            double v25 = v24;
            [v22 duration];
            double v27 = (void *)[v23 initWithValue:v25 duration:v26];
            [v41 addObject:v27];
            [v22 duration];
            double v14 = v14 + v28;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v11);
  }
  else
  {
    double v14 = 0.0;
  }

  long long v29 = [MEMORY[0x1E4F2AC28] computeLEQFromAudioExposureValues:v41];
  if (v29)
  {
    long long v30 = [MEMORY[0x1E4F2B618] decibelAWeightedSoundPressureLevelUnit];
    [v29 doubleValueForUnit:v30];
    double v32 = v31;
    long long v33 = objc_alloc_init(HKInteractiveChartAudioData);
    [(HKInteractiveChartAudioData *)v33 setAverageLEQ:v32];
    [(HKInteractiveChartAudioData *)v33 setDuration:v14];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v34 = v40;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(v34);
          }
          objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * j), "setOverviewData:", v33, v40);
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v36);
    }
  }
  else
  {
    long long v33 = 0;
  }

  return v33;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return a3 == 5 && a4 == 1;
}

@end