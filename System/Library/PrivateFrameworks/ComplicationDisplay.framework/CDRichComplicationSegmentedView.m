@interface CDRichComplicationSegmentedView
+ (BOOL)isXL;
- (NSMutableArray)segments;
- (double)_arcAngleWithOuterRadius:(double)a3 segmentGapAngle:(double)a4 numberOfSegments:(unint64_t)a5;
- (id)_colorForSegment:(id)a3;
- (id)_shapeStrokeColor;
- (int64_t)_segmentShapeStyleForIndex:(unint64_t)a3 angle:(double)a4;
- (void)_addSegmentsToLayer:(id)a3;
- (void)_updateSegmentsWithColors:(id)a3;
- (void)setProgress:(double)a3;
- (void)setSegments:(id)a3;
@end

@implementation CDRichComplicationSegmentedView

+ (BOOL)isXL
{
  return 0;
}

- (void)setProgress:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDRichComplicationSegmentedView;
  [(CDRichComplicationShapeView *)&v4 setProgress:a3];
  [(CDRichComplicationSegmentedView *)self _updateSegmentsWithColors:0];
}

- (void)_updateSegmentsWithColors:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (v4)
  {
    if (![v4 count]) {
      goto LABEL_6;
    }
    *((unsigned char *)v15 + 24) = 1;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    segments = self->_segments;
    self->_segments = v6;

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __61__CDRichComplicationSegmentedView__updateSegmentsWithColors___block_invoke;
    v13[3] = &unk_2644A5350;
    v13[4] = self;
    [v5 enumerateObjectsUsingBlock:v13];
  }
  [(CDRichComplicationShapeView *)self progress];
  float v9 = v8 * (double)(unint64_t)[(NSMutableArray *)self->_segments count];
  v10 = self->_segments;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__CDRichComplicationSegmentedView__updateSegmentsWithColors___block_invoke_2;
  v12[3] = &unk_2644A5378;
  v12[4] = &v14;
  v12[5] = vcvtas_u32_f32(v9);
  [(NSMutableArray *)v10 enumerateObjectsUsingBlock:v12];
  if (*((unsigned char *)v15 + 24))
  {
    v11 = [(CDRichComplicationShapeView *)self shapeLayer];
    [(CDRichComplicationSegmentedView *)self _addSegmentsToLayer:v11];
  }
LABEL_6:
  _Block_object_dispose(&v14, 8);
}

void __61__CDRichComplicationSegmentedView__updateSegmentsWithColors___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  if (a3 < 9)
  {
    v5 = (objc_class *)MEMORY[0x263EFD1C0];
    id v6 = a2;
    id v7 = (id)[[v5 alloc] initWithColor:v6 state:1];

    [*(id *)(*(void *)(a1 + 32) + 600) addObject:v7];
  }
  else
  {
    *a4 = 1;
  }
}

void __61__CDRichComplicationSegmentedView__updateSegmentsWithColors___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40) <= a3;
  id v7 = v5;
  if ([v5 state] != v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    [v7 setState:v6];
  }
}

- (void)_addSegmentsToLayer:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSMutableArray *)self->_segments count])
  {
    v11 = _CDLoggingObjectForDomain(1, (uint64_t)"CDLoggingDomainView");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v12 = "Cannot add segments to gauge shape layer when there are no segments.";
LABEL_9:
    _os_log_impl(&dword_21E3E1000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
    goto LABEL_19;
  }
  if (!v4)
  {
    v11 = _CDLoggingObjectForDomain(1, (uint64_t)"CDLoggingDomainView");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v12 = "Cannot add segments to gauge shape layer when the layer is nil.";
    goto LABEL_9;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [MEMORY[0x263EFD180] currentDevice];
  int v7 = [(id)objc_opt_class() isXL];
  _LayoutConstants___constants_0_3 = 0x3FFC000000000000;
  _LayoutConstants___constants_1_3 = 0x3FF4000000000000;
  if (v7)
  {
    CLKComplicationGraphicExtraLargeCircularScalingFactor();
    double v9 = v8 * *(double *)&_LayoutConstants___constants_0_3;
    *(double *)&_LayoutConstants___constants_0_3 = v8 * *(double *)&_LayoutConstants___constants_0_3;
    double v10 = v8 * *(double *)&_LayoutConstants___constants_1_3;
    *(double *)&_LayoutConstants___constants_1_3 = v8 * *(double *)&_LayoutConstants___constants_1_3;
  }
  else
  {
    double v9 = 1.75;
    double v10 = 1.25;
  }
  [(CDRichComplicationCurveView *)self _outerRadius];
  long double v14 = v13;
  [(CDRichComplicationCurveView *)self _shapeLineWidth];
  double v16 = v14 - v15;
  double v17 = atan2(v9, v14);
  [(CDRichComplicationSegmentedView *)self _arcAngleWithOuterRadius:[(NSMutableArray *)self->_segments count] segmentGapAngle:(double)v14 numberOfSegments:v17];
  segments = self->_segments;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __55__CDRichComplicationSegmentedView__addSegmentsToLayer___block_invoke;
  v29[3] = &unk_2644A53A0;
  v29[4] = self;
  uint64_t v31 = v19;
  double v32 = v16;
  long double v33 = v14;
  double v34 = v9;
  double v35 = v10;
  double v36 = v17;
  id v20 = v5;
  id v30 = v20;
  [(NSMutableArray *)segments enumerateObjectsUsingBlock:v29];
  [v4 setSublayers:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v11 = v20;
  uint64_t v21 = [v11 countByEnumeratingWithState:&v25 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v4, "addSublayer:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
      }
      uint64_t v22 = [v11 countByEnumeratingWithState:&v25 objects:v38 count:16];
    }
    while (v22);
  }

LABEL_19:
}

void __55__CDRichComplicationSegmentedView__addSegmentsToLayer___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5 = (double)a3 + 1.0;
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 600);
  id v7 = a2;
  double v8 = v5 / (double)(unint64_t)[v6 count];
  double v9 = v8 + 1.0 / (double)(unint64_t)[*(id *)(*(void *)(a1 + 32) + 600) count] * -0.5;
  *(float *)&double v9 = v9;
  [*(id *)(a1 + 32) _angleAtProgress:v9];
  CGFloat v11 = v10;
  v12 = -[CDCurvedRoundedRectShapeLayer initWithAngularWidth:innerRadius:outerRadius:cornerRadius:style:gapAngle:]([CDCurvedRoundedRectShapeLayer alloc], "initWithAngularWidth:innerRadius:outerRadius:cornerRadius:style:gapAngle:", objc_msgSend(*(id *)(a1 + 32), "_segmentShapeStyleForIndex:angle:", a3), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 88));
  [*(id *)(a1 + 32) _centerPoint];
  -[CDCurvedRoundedRectShapeLayer setPosition:](v12, "setPosition:");
  CGAffineTransformMakeRotation(&v15, v11);
  [(CDCurvedRoundedRectShapeLayer *)v12 setAffineTransform:&v15];
  double v13 = [*(id *)(a1 + 32) _colorForSegment:v7];

  id v14 = v13;
  -[CDCurvedRoundedRectShapeLayer setFillColor:](v12, "setFillColor:", [v14 CGColor]);

  [*(id *)(a1 + 40) addObject:v12];
}

- (id)_colorForSegment:(id)a3
{
  id v3 = a3;
  id v4 = [v3 color];
  uint64_t v5 = [v3 state];

  if (v5 == 1)
  {
    uint64_t v6 = [v4 colorWithAlphaComponent:0.3];

    id v4 = (void *)v6;
  }
  return v4;
}

- (int64_t)_segmentShapeStyleForIndex:(unint64_t)a3 angle:(double)a4
{
  if ([(NSMutableArray *)self->_segments count] == 1) {
    return 3;
  }
  if (a3) {
    return 2 * ([(NSMutableArray *)self->_segments count] - 1 == a3);
  }
  return 1;
}

- (double)_arcAngleWithOuterRadius:(double)a3 segmentGapAngle:(double)a4 numberOfSegments:(unint64_t)a5
{
  double v6 = (double)(a5 - 1) * a4;
  [(CDRichComplicationCurveView *)self _totalDrawableAngle];
  return (fabs(v7) - v6) / (double)a5;
}

- (id)_shapeStrokeColor
{
  return 0;
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end