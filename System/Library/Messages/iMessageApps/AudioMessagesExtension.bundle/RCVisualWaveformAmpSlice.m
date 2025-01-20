@interface RCVisualWaveformAmpSlice
+ (UIColor)primaryColor;
+ (UIColor)secondaryColor;
+ (id)colorForSliceColor:(unint64_t)a3 dimmed:(BOOL)a4;
+ (void)setPrimaryColor:(id)a3;
+ (void)setSecondaryColor:(id)a3;
- (BOOL)hasProcessedSegments;
- (BOOL)hasVisualAmplitudeInterpolatingFramesLeft;
- (BOOL)hidden;
- (CALayer)sliceLayer;
- (RCVisualWaveformAmpSlice)init;
- (RCVisualWaveformAmpSlice)initWithIndex:(double)a3 amplitude:(double)a4;
- (UIColor)uiColor;
- (UIColor)uiColorDimmed;
- (double)amplitude;
- (double)visualAmplitudeHeight;
- (int64_t)sliceIndex;
- (int64_t)visualAmplitudeHeightInterpolatingFrames;
- (unint64_t)color;
- (void)setAmplitude:(double)a3;
- (void)setColor:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasProcessedSegments:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setSliceIndex:(int64_t)a3;
- (void)setSliceLayer:(id)a3;
- (void)setVisualAmplitudeHeight:(double)a3;
- (void)setVisualAmplitudeHeightInterpolatingFrames:(int64_t)a3;
@end

@implementation RCVisualWaveformAmpSlice

+ (UIColor)primaryColor
{
  return (UIColor *)(id)qword_82DB0;
}

+ (void)setPrimaryColor:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&qword_82DB0, a3);
  uint64_t v4 = [(id)qword_82DB0 colorWithAlphaComponent:0.15];
  v5 = (void *)qword_82DB8;
  qword_82DB8 = v4;
}

+ (UIColor)secondaryColor
{
  return (UIColor *)(id)qword_82DC0;
}

+ (void)setSecondaryColor:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&qword_82DC0, a3);
  uint64_t v4 = [(id)qword_82DC0 colorWithAlphaComponent:0.15];
  v5 = (void *)qword_82DC8;
  qword_82DC8 = v4;
}

+ (id)colorForSliceColor:(unint64_t)a3 dimmed:(BOOL)a4
{
  if (a3 == 1)
  {
    v5 = &qword_82DB0;
    id v6 = &qword_82DB8;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v5 = &qword_82DC0;
    id v6 = &qword_82DC8;
LABEL_5:
    if (a4) {
      v5 = v6;
    }
    id v7 = (id)*v5;
    return v7;
  }
  id v7 = 0;
  return v7;
}

- (RCVisualWaveformAmpSlice)initWithIndex:(double)a3 amplitude:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RCVisualWaveformAmpSlice;
  result = [(RCVisualWaveformAmpSlice *)&v7 init];
  if (result)
  {
    result->_hasProcessedSegments = 0;
    result->_sliceIndex = (uint64_t)a3;
    result->_amplitude = a4;
    result->_visualAmplitudeHeight = 0.0;
    result->_visualAmplitudeHeightInterpolatingFrames = 0;
  }
  return result;
}

- (RCVisualWaveformAmpSlice)init
{
  return [(RCVisualWaveformAmpSlice *)self initWithIndex:0.0 amplitude:0.0];
}

- (BOOL)hasVisualAmplitudeInterpolatingFramesLeft
{
  return self->_interpolatingVisualAmplitudeHeightFrameCount != 0;
}

- (UIColor)uiColor
{
  return (UIColor *)+[RCVisualWaveformAmpSlice colorForSliceColor:self->_color dimmed:0];
}

- (UIColor)uiColorDimmed
{
  return (UIColor *)+[RCVisualWaveformAmpSlice colorForSliceColor:self->_color dimmed:1];
}

- (void)setColor:(unint64_t)a3
{
  v5 = +[RCVisualWaveformAmpSlice colorForSliceColor:a3 dimmed:0];
  if (self->_lastColor != v5)
  {
    v10 = v5;
    self->_color = a3;
    id v6 = [(RCVisualWaveformAmpSlice *)self uiColor];
    lastColor = self->_lastColor;
    self->_lastColor = v6;

    v8 = [(UIColor *)self->_lastColor CGColor];
    v9 = [(RCVisualWaveformAmpSlice *)self sliceLayer];
    [v9 setBackgroundColor:v8];

    v5 = v10;
  }
}

- (void)setHasProcessedSegments:(BOOL)a3
{
  if (self->_hasProcessedSegments != a3) {
    self->_hasProcessedSegments = a3;
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hidden = a3;
  id v4 = [(RCVisualWaveformAmpSlice *)self sliceLayer];
  [v4 setHidden:v3];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = +[UIScreen mainScreen];
  [v18 scale];
  double v9 = v8;

  id v19 = [(RCVisualWaveformAmpSlice *)self sliceLayer];
  [v19 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  if (COERCE__INT64(v9 * v11) != COERCE__INT64(x * v9)
    || COERCE__INT64(v9 * v13) != COERCE__INT64(y * v9)
    || COERCE__INT64(v9 * v15) != COERCE__INT64(height * v9))
  {
    id v20 = [(RCVisualWaveformAmpSlice *)self sliceLayer];
    objc_msgSend(v20, "setFrame:", x, y, width, height);
  }
}

- (void)setVisualAmplitudeHeightInterpolatingFrames:(int64_t)a3
{
  self->_visualAmplitudeHeightInterpolatingFrames = a3;
  if (!a3)
  {
    self->_interpolatingvisualAmplitudeHeight = self->_visualAmplitudeHeight;
    self->_interpolatingvisualAmplitudeHeightDiff = 0.0;
    self->_interpolatingVisualAmplitudeHeightFrameCount = 0;
  }
}

- (void)setVisualAmplitudeHeight:(double)a3
{
  double visualAmplitudeHeight = self->_visualAmplitudeHeight;
  if (vabdd_f64(visualAmplitudeHeight, a3) > 2.22044605e-16)
  {
    uint64_t visualAmplitudeHeightInterpolatingFrames = self->_visualAmplitudeHeightInterpolatingFrames;
    if (visualAmplitudeHeightInterpolatingFrames < 1)
    {
      self->_interpolatingVisualAmplitudeHeightFrameCount = 0;
      self->_interpolatingdouble visualAmplitudeHeight = a3;
    }
    else
    {
      self->_interpolatingdouble visualAmplitudeHeight = visualAmplitudeHeight;
      self->_interpolatingvisualAmplitudeHeightDiff = (a3 - visualAmplitudeHeight)
                                                    / (double)visualAmplitudeHeightInterpolatingFrames;
      self->_interpolatingVisualAmplitudeHeightFrameCount = visualAmplitudeHeightInterpolatingFrames;
    }
  }
  self->_double visualAmplitudeHeight = a3;
}

- (double)visualAmplitudeHeight
{
  int64_t interpolatingVisualAmplitudeHeightFrameCount = self->_interpolatingVisualAmplitudeHeightFrameCount;
  BOOL v3 = interpolatingVisualAmplitudeHeightFrameCount < 1;
  int64_t v4 = interpolatingVisualAmplitudeHeightFrameCount - 1;
  if (v3) {
    return self->_visualAmplitudeHeight;
  }
  double result = self->_interpolatingvisualAmplitudeHeight + self->_interpolatingvisualAmplitudeHeightDiff;
  self->_interpolatingdouble visualAmplitudeHeight = result;
  self->_int64_t interpolatingVisualAmplitudeHeightFrameCount = v4;
  return result;
}

- (int64_t)sliceIndex
{
  return self->_sliceIndex;
}

- (void)setSliceIndex:(int64_t)a3
{
  self->_sliceIndedouble x = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (int64_t)visualAmplitudeHeightInterpolatingFrames
{
  return self->_visualAmplitudeHeightInterpolatingFrames;
}

- (CALayer)sliceLayer
{
  return self->_sliceLayer;
}

- (void)setSliceLayer:(id)a3
{
}

- (BOOL)hasProcessedSegments
{
  return self->_hasProcessedSegments;
}

- (unint64_t)color
{
  return self->_color;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliceLayer, 0);

  objc_storeStrong((id *)&self->_lastColor, 0);
}

@end