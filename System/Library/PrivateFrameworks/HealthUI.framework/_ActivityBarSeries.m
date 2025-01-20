@interface _ActivityBarSeries
- (BOOL)supportsMultiTouchSelection;
- (HKActivityBarSeriesDelegate)activityBarDelegate;
- (HKDisplayTypeController)displayTypeController;
- (HKFillStyle)missedGoalUnselectedFillStyle;
- (HKFillStyle)pausedUnselectedFillStyle;
- (HKUnitPreferenceController)unitPreferenceController;
- (_ActivityBarSeries)initWithUnitPreferenceController:(id)a3 activityBarDelegate:(id)a4 displayTypeController:(id)a5;
- (double)lastLegendUpdateTime;
- (int64_t)activityDisplayTypeIdentifier;
- (void)_drawPath:(id)a3 withFillStyle:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7;
- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8;
- (void)setActivityBarDelegate:(id)a3;
- (void)setActivityDisplayTypeIdentifier:(int64_t)a3;
- (void)setLastLegendUpdateTime:(double)a3;
- (void)setMissedGoalUnselectedFillStyle:(id)a3;
- (void)setPausedUnselectedFillStyle:(id)a3;
- (void)updateLegendsForTimeScope:(int64_t)a3 range:(id)a4 drawingDuringScrolling:(BOOL)a5;
@end

@implementation _ActivityBarSeries

- (_ActivityBarSeries)initWithUnitPreferenceController:(id)a3 activityBarDelegate:(id)a4 displayTypeController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ActivityBarSeries;
  v12 = [(HKBarSeries *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_unitPreferenceController, a3);
    objc_storeWeak((id *)&v13->_activityBarDelegate, v10);
    objc_storeStrong((id *)&v13->_displayTypeController, a5);
    v13->_lastLegendUpdateTime = 0.0;
  }

  return v13;
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (void)updateLegendsForTimeScope:(int64_t)a3 range:(id)a4 drawingDuringScrolling:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  double v9 = CACurrentMediaTime();
  if (!v5 || ([(_ActivityBarSeries *)self lastLegendUpdateTime], v9 - v10 >= 0.2))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77___ActivityBarSeries_updateLegendsForTimeScope_range_drawingDuringScrolling___block_invoke;
    v11[3] = &unk_1E6D55AC8;
    v11[4] = self;
    v11[5] = a3;
    *(double *)&v11[6] = v9;
    [(HKGraphSeries *)self untransformedChartPointsForTimeScope:a3 resolution:0 range:v8 completion:v11];
  }
}

- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8
{
  double height = a7.size.height;
  CGFloat rect = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v16 = a8;
  id v17 = a3;
  v64 = a6;
  if ([v16 seriesDrawingDuringTiling]
    && ([(HKBarSeries *)self tiledStrokeStyle], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = (void *)v18;
    v20 = [(HKBarSeries *)self unselectedStrokeStyle];
  }
  else
  {
    v20 = [(HKBarSeries *)self tiledStrokeStyle];
  }
  objc_msgSend(v20, "lineWidth", *(void *)&rect);
  double v22 = v21;
  v23 = [(HKBarSeries *)self selectedStrokeStyle];
  [v23 lineWidth];
  double v25 = v24;

  if (v25 < v22) {
    double v25 = v22;
  }
  [v16 screenRectForSeries:self];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  -[HKBarSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4, v27, v29, v31, v33, v25);
  double v35 = v34;
  double v36 = v25 + v34;
  v85.origin.double x = x;
  v85.origin.double y = y;
  v85.size.width = recta;
  v85.size.double height = height;
  CGFloat MaxX = CGRectGetMaxX(v85);
  v86.origin.double x = x;
  v86.origin.double y = y;
  v86.size.width = recta;
  v86.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v86);
  id v39 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  id v40 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  id v41 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  id v42 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  [(HKGraphSeries *)self selectedPathRange];
  v43 = [(HKBarSeries *)self selectedFillStyle];
  if (v43)
  {
    BOOL v44 = 1;
  }
  else
  {
    v45 = [(HKBarSeries *)self selectedStrokeStyle];
    BOOL v44 = v45 != 0;
  }
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __119___ActivityBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke;
  v66[3] = &unk_1E6D55AF0;
  CGFloat v72 = MinX;
  double v73 = v36;
  CGFloat v74 = MaxX;
  id v46 = v39;
  id v67 = v46;
  id v47 = v40;
  id v68 = v47;
  id v48 = v42;
  id v69 = v48;
  BOOL v80 = v44;
  long long v75 = v81;
  long long v76 = v82;
  long long v77 = v83;
  long long v78 = v84;
  id v49 = v41;
  double v79 = v35;
  id v70 = v49;
  v71 = self;
  long long v50 = *(_OWORD *)&a5->c;
  v65[0] = *(_OWORD *)&a5->a;
  v65[1] = v50;
  v65[2] = *(_OWORD *)&a5->tx;
  [v17 enumerateCoordinatesWithTransform:v65 roundToViewScale:1 block:v66];

  v51 = [(_ActivityBarSeries *)self missedGoalUnselectedFillStyle];
  if (v51)
  {
    v52 = v64;
    -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v47, v51, v20, v64, x, y, recta, height);
  }
  else
  {
    v53 = [(HKBarSeries *)self unselectedFillStyle];
    v52 = v64;
    -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v47, v53, v20, v64, x, y, recta, height);
  }
  v54 = [(HKBarSeries *)self unselectedFillStyle];
  -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v46, v54, v20, v52, x, y, recta, height);

  v55 = [(HKBarSeries *)self selectedFillStyle];
  v56 = v55;
  if (!v55)
  {
    v56 = [(HKBarSeries *)self unselectedFillStyle];
  }
  uint64_t v57 = [(HKBarSeries *)self selectedStrokeStyle];
  v58 = (void *)v57;
  if (v57) {
    v59 = (void *)v57;
  }
  else {
    v59 = v20;
  }
  -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v49, v56, v59, v52, x, y, recta, height);

  if (!v55) {
  v60 = [(_ActivityBarSeries *)self pausedUnselectedFillStyle];
  }
  if (v60)
  {
    -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v48, v60, v20, v52, x, y, recta, height);
  }
  else
  {
    v61 = [(HKBarSeries *)self unselectedFillStyle];
    -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v48, v61, v20, v52, x, y, recta, height);
  }
}

- (void)_drawPath:(id)a3 withFillStyle:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v19 = a3;
  id v15 = a4;
  id v16 = a5;
  if (([v19 isEmpty] & 1) == 0)
  {
    if (v16)
    {
      CGContextSaveGState(a7);
      [v16 applyToContext:a7];
      CGContextAddPath(a7, (CGPathRef)[v19 CGPath]);
      CGContextStrokePath(a7);
      CGContextRestoreGState(a7);
    }
    if (v15)
    {
      uint64_t v17 = [v19 CGPath];
      [(HKGraphSeries *)self alpha];
      objc_msgSend(v15, "renderPath:context:axisRect:alpha:", v17, a7, x, y, width, height, v18);
    }
  }
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (HKFillStyle)missedGoalUnselectedFillStyle
{
  return self->_missedGoalUnselectedFillStyle;
}

- (void)setMissedGoalUnselectedFillStyle:(id)a3
{
}

- (HKFillStyle)pausedUnselectedFillStyle
{
  return self->_pausedUnselectedFillStyle;
}

- (void)setPausedUnselectedFillStyle:(id)a3
{
}

- (HKActivityBarSeriesDelegate)activityBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityBarDelegate);
  return (HKActivityBarSeriesDelegate *)WeakRetained;
}

- (void)setActivityBarDelegate:(id)a3
{
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (int64_t)activityDisplayTypeIdentifier
{
  return self->_activityDisplayTypeIdentifier;
}

- (void)setActivityDisplayTypeIdentifier:(int64_t)a3
{
  self->_activityDisplayTypeIdentifier = a3;
}

- (double)lastLegendUpdateTime
{
  return self->_lastLegendUpdateTime;
}

- (void)setLastLegendUpdateTime:(double)a3
{
  self->_lastLegendUpdateTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_destroyWeak((id *)&self->_activityBarDelegate);
  objc_storeStrong((id *)&self->_pausedUnselectedFillStyle, 0);
  objc_storeStrong((id *)&self->_missedGoalUnselectedFillStyle, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
}

@end