@interface PLHighlightableSegmentableSlider
- (BOOL)forceRemoveHighLight;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (NSDictionary)tickLocationMap;
- (PLHighlightableSegmentableSlider)initWithColors:(id)a3 tickColor:(id)a4 highlightColor:(id)a5;
- (PLSegmentedLabelSliderCellDelegate)delegate;
- (UIBezierPath)highlightPath;
- (UIColor)highlightColor;
- (UIColor)tickColor;
- (UIColor)trackColor;
- (double)tickWidth;
- (float)offsetBetweenTicksForNumberOfTicks:(unint64_t)a3;
- (float)rtlConsideredValue;
- (float)rtlConsideredValue:(float)a3;
- (float)valueAtTickNumber:(int)a3;
- (unint64_t)numberOfTicks;
- (void)changeTickColor:(id)a3;
- (void)drawHighLightForValue:(float)a3;
- (void)drawRect:(CGRect)a3;
- (void)drawTickAtX:(double)a3 withColor:(id)a4;
- (void)removeHighlight;
- (void)removeHighlight:(BOOL)a3;
- (void)removeHighlightShouldRedraw:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setForceRemoveHighLight:(BOOL)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightPath:(id)a3;
- (void)setTickColor:(id)a3;
- (void)setTickLocationMap:(id)a3;
- (void)setTrackColor:(id)a3;
@end

@implementation PLHighlightableSegmentableSlider

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(PLHighlightableSegmentableSlider *)self _minTrackView];
  objc_msgSend(v8, "setHidden:", -[PLHighlightableSegmentableSlider isSegmented](self, "isSegmented"));

  v9 = [(PLHighlightableSegmentableSlider *)self _maxTrackView];
  objc_msgSend(v9, "setHidden:", -[PLHighlightableSegmentableSlider isSegmented](self, "isSegmented"));

  if (![(PLHighlightableSegmentableSlider *)self isSegmented])
  {
    v36.receiver = self;
    v36.super_class = (Class)PLHighlightableSegmentableSlider;
    -[PLHighlightableSegmentableSlider drawRect:](&v36, "drawRect:", x, y, width, height);
    return;
  }
  [(PLHighlightableSegmentableSlider *)self bounds];
  -[PLHighlightableSegmentableSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(PLHighlightableSegmentableSlider *)self trackColor];
  [v18 setFill];

  v19 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v11, v13, v15, v17);
  [v19 fill];

  unint64_t v20 = [(PLHighlightableSegmentableSlider *)self numberOfTicks];
  [(PLHighlightableSegmentableSlider *)self offsetBetweenTicksForNumberOfTicks:v20];
  id v35 = (id)objc_opt_new();
  if (v20)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      [(PLHighlightableSegmentableSlider *)self minimumValue];
      [(PLHighlightableSegmentableSlider *)self minimumValue];
      [(PLHighlightableSegmentableSlider *)self maximumValue];
      [(PLHighlightableSegmentableSlider *)self minimumValue];
      PSRoundToPixel();
      double v23 = v22;
      [(PLHighlightableSegmentableSlider *)self valueAtTickNumber:i];
      int v25 = v24;
      v26 = +[NSNumber numberWithDouble:v23];
      LODWORD(v27) = v25;
      v28 = +[NSNumber numberWithFloat:v27];
      [v35 setObject:v26 forKeyedSubscript:v28];

      v29 = [(PLHighlightableSegmentableSlider *)self tickColor];
      [(PLHighlightableSegmentableSlider *)self drawTickAtX:v29 withColor:v23];
    }
  }
  id v30 = [v35 copy];
  [(PLHighlightableSegmentableSlider *)self setTickLocationMap:v30];

  uint64_t v31 = [(PLHighlightableSegmentableSlider *)self delegate];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(PLHighlightableSegmentableSlider *)self delegate];
    [(PLHighlightableSegmentableSlider *)self rtlConsideredValue];
    if ((objc_msgSend(v33, "shouldShowHighLight:") & 1) == 0)
    {

      goto LABEL_11;
    }
    unsigned __int8 v34 = [(PLHighlightableSegmentableSlider *)self forceRemoveHighLight];

    if ((v34 & 1) == 0)
    {
      v32 = [(PLHighlightableSegmentableSlider *)self delegate];
      [v32 getHighlightValue];
      -[PLHighlightableSegmentableSlider drawHighLightForValue:](self, "drawHighLightForValue:");
LABEL_11:
    }
  }
  [(PLHighlightableSegmentableSlider *)self setForceRemoveHighLight:0];
}

- (float)valueAtTickNumber:(int)a3
{
  unsigned int v5 = +[PLBatteryUIUtilities isDeviceLayoutRTL];
  [(PLHighlightableSegmentableSlider *)self maximumValue];
  float v7 = v6;
  [(PLHighlightableSegmentableSlider *)self minimumValue];
  float v9 = v8;
  id v10 = [(PLHighlightableSegmentableSlider *)self segmentCount];
  if (v5) {
    float v11 = (float)([(PLHighlightableSegmentableSlider *)self numberOfTicks] + ~a3);
  }
  else {
    float v11 = (float)a3;
  }
  [(PLHighlightableSegmentableSlider *)self minimumValue];
  return v12 + (float)((float)((float)(v7 - v9) / (float)(unint64_t)v10) * v11);
}

- (float)rtlConsideredValue
{
  [(PLHighlightableSegmentableSlider *)self value];

  -[PLHighlightableSegmentableSlider rtlConsideredValue:](self, "rtlConsideredValue:");
  return result;
}

- (float)rtlConsideredValue:(float)a3
{
  if (+[PLBatteryUIUtilities isDeviceLayoutRTL])
  {
    [(PLHighlightableSegmentableSlider *)self maximumValue];
    float v6 = v5 - a3;
    [(PLHighlightableSegmentableSlider *)self minimumValue];
    return v6 + v7;
  }
  return a3;
}

- (void)changeTickColor:(id)a3
{
  [(PLHighlightableSegmentableSlider *)self setTickColor:a3];

  [(PLHighlightableSegmentableSlider *)self setNeedsDisplay];
}

- (double)tickWidth
{
  [(PLHighlightableSegmentableSlider *)self bounds];
  -[PLHighlightableSegmentableSlider trackRectForBounds:](self, "trackRectForBounds:");
  return v3 / 1.5;
}

- (void)drawTickAtX:(double)a3 withColor:(id)a4
{
  id v6 = a4;
  [(PLHighlightableSegmentableSlider *)self bounds];
  -[PLHighlightableSegmentableSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v8 = v7;
  id v17 = objc_alloc_init((Class)UIBezierPath);
  double v9 = v8 / 1.5;
  [v17 setLineWidth:v8 / 1.5];
  [v6 set];

  PSRoundToPixel();
  objc_msgSend(v17, "moveToPoint:", a3, v10);
  PSRoundToPixel();
  objc_msgSend(v17, "addLineToPoint:", a3, v11);
  [v17 stroke];
  double v12 = a3 - v8 / 1.5 * 0.5;
  PSRoundToPixel();
  double v14 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v12, v13 - v9 * 0.5, v9, v9);
  PSRoundToPixel();
  double v16 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v12, v15 - v9 * 0.5, v9, v9);
  [v17 appendPath:v14];
  [v17 appendPath:v16];
  [v17 fill];
}

- (void)drawHighLightForValue:(float)a3
{
  [(PLHighlightableSegmentableSlider *)self removeHighlightShouldRedraw:0];
  float v5 = [(PLHighlightableSegmentableSlider *)self tickLocationMap];
  *(float *)&double v6 = a3;
  double v7 = +[NSNumber numberWithFloat:v6];
  id v30 = [v5 objectForKeyedSubscript:v7];

  if (v30)
  {
    [v30 floatValue];
    float v9 = v8;
    [(PLHighlightableSegmentableSlider *)self bounds];
    -[PLHighlightableSegmentableSlider trackRectForBounds:](self, "trackRectForBounds:");
    double v11 = v10;
    id v12 = objc_alloc_init((Class)UIBezierPath);
    [(PLHighlightableSegmentableSlider *)self setHighlightPath:v12];

    double v13 = v11 / 1.5;
    double v14 = [(PLHighlightableSegmentableSlider *)self highlightPath];
    [v14 setLineWidth:v11 / 1.5];

    double v15 = [(PLHighlightableSegmentableSlider *)self highlightColor];
    [v15 set];

    double v16 = [(PLHighlightableSegmentableSlider *)self highlightPath];
    double v17 = v9;
    PSRoundToPixel();
    objc_msgSend(v16, "moveToPoint:", v17, v18);

    v19 = [(PLHighlightableSegmentableSlider *)self highlightPath];
    PSRoundToPixel();
    objc_msgSend(v19, "addLineToPoint:", v17, v20);

    v21 = [(PLHighlightableSegmentableSlider *)self highlightPath];
    [v21 stroke];

    double v22 = v17 - v11 / 1.5 * 0.5;
    PSRoundToPixel();
    int v24 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v22, v23 - v13 * 0.5, v13, v13);
    PSRoundToPixel();
    v26 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v22, v25 - v13 * 0.5, v13, v13);
    double v27 = [(PLHighlightableSegmentableSlider *)self highlightPath];
    [v27 appendPath:v24];

    v28 = [(PLHighlightableSegmentableSlider *)self highlightPath];
    [v28 appendPath:v26];

    v29 = [(PLHighlightableSegmentableSlider *)self highlightPath];
    [v29 fill];

    [(PLHighlightableSegmentableSlider *)self setNeedsDisplay];
  }
  else
  {
    [(PLHighlightableSegmentableSlider *)self setNeedsDisplay];
  }
}

- (void)removeHighlight
{
}

- (void)removeHighlight:(BOOL)a3
{
  [(PLHighlightableSegmentableSlider *)self setForceRemoveHighLight:a3];

  [(PLHighlightableSegmentableSlider *)self removeHighlightShouldRedraw:1];
}

- (void)removeHighlightShouldRedraw:(BOOL)a3
{
  BOOL v3 = a3;
  float v5 = [(PLHighlightableSegmentableSlider *)self highlightPath];

  if (v5)
  {
    [(PLHighlightableSegmentableSlider *)self setHighlightPath:0];
    if (v3)
    {
      [(PLHighlightableSegmentableSlider *)self setNeedsDisplay];
    }
  }
}

- (float)offsetBetweenTicksForNumberOfTicks:(unint64_t)a3
{
  [(PLHighlightableSegmentableSlider *)self maximumValue];
  float v6 = v5;
  [(PLHighlightableSegmentableSlider *)self minimumValue];
  return (float)(v6 - v7) / (float)(a3 - 1);
}

- (unint64_t)numberOfTicks
{
  if ([(PLHighlightableSegmentableSlider *)self segmentCount])
  {
    return (unint64_t)(float)((unint64_t)[(PLHighlightableSegmentableSlider *)self segmentCount]+ 1);
  }
  else
  {
    [(PLHighlightableSegmentableSlider *)self maximumValue];
    float v5 = v4;
    [(PLHighlightableSegmentableSlider *)self minimumValue];
    return (unint64_t)(float)((float)(v5 - v6) + 1.0);
  }
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  v22.receiver = self;
  v22.super_class = (Class)PLHighlightableSegmentableSlider;
  -[PLHighlightableSegmentableSlider thumbRectForBounds:trackRect:value:](&v22, "thumbRectForBounds:trackRect:value:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, LODWORD(a5));
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(PLHighlightableSegmentableSlider *)self minimumValue];
  if (v14 == a5 || ([(PLHighlightableSegmentableSlider *)self maximumValue], v15 == a5))
  {
    [(PLHighlightableSegmentableSlider *)self minimumValue];
    [(PLHighlightableSegmentableSlider *)self maximumValue];
    [(PLHighlightableSegmentableSlider *)self minimumValue];
    PSRoundToPixel();
    double v7 = v16;
  }
  double v17 = v7;
  double v18 = v9;
  double v19 = v11;
  double v20 = v13;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (PLHighlightableSegmentableSlider)initWithColors:(id)a3 tickColor:(id)a4 highlightColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLHighlightableSegmentableSlider;
  double v11 = [(PLHighlightableSegmentableSlider *)&v15 init];
  double v12 = v11;
  if (v11)
  {
    [(PLHighlightableSegmentableSlider *)v11 setContentMode:3];
    [(PLHighlightableSegmentableSlider *)v12 setSemanticContentAttribute:2];
    double v13 = +[UIColor clearColor];
    [(PLHighlightableSegmentableSlider *)v12 setTintColor:v13];

    [(PLHighlightableSegmentableSlider *)v12 setTrackColor:v8];
    [(PLHighlightableSegmentableSlider *)v12 setTickColor:v9];
    [(PLHighlightableSegmentableSlider *)v12 setHighlightColor:v10];
  }

  return v12;
}

- (NSDictionary)tickLocationMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTickLocationMap:(id)a3
{
}

- (PLSegmentedLabelSliderCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PLSegmentedLabelSliderCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)trackColor
{
  return (UIColor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTrackColor:(id)a3
{
}

- (UIColor)tickColor
{
  return (UIColor *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTickColor:(id)a3
{
}

- (UIColor)highlightColor
{
  return (UIColor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHighlightColor:(id)a3
{
}

- (UIBezierPath)highlightPath
{
  return (UIBezierPath *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHighlightPath:(id)a3
{
}

- (BOOL)forceRemoveHighLight
{
  return self->_forceRemoveHighLight;
}

- (void)setForceRemoveHighLight:(BOOL)a3
{
  self->_forceRemoveHighLight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightPath, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_tickColor, 0);
  objc_storeStrong((id *)&self->_trackColor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_tickLocationMap, 0);
}

@end