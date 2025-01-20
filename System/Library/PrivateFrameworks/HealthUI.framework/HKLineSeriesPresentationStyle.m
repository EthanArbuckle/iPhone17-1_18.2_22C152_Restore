@interface HKLineSeriesPresentationStyle
- (BOOL)shouldNegateAnnotationValue;
- (HKAxisLabelStyle)annotationStyle;
- (HKAxisLabelStyle)axisAnnotationStyle;
- (HKFillStyle)fillStyle;
- (HKLegendPointAnnotationStyle)legendAnnotationStyle;
- (HKLineSeriesPointMarkerStyle)endCapStyle;
- (HKLineSeriesPointMarkerStyle)pointMarkerStyle;
- (HKStrokeStyle)strokeStyle;
- (double)sineWaveSmoothingFactor;
- (unint64_t)waveForm;
- (void)setAnnotationStyle:(id)a3;
- (void)setAxisAnnotationStyle:(id)a3;
- (void)setEndCapStyle:(id)a3;
- (void)setFillStyle:(id)a3;
- (void)setLegendAnnotationStyle:(id)a3;
- (void)setPointMarkerStyle:(id)a3;
- (void)setShouldNegateAnnotationValue:(BOOL)a3;
- (void)setSineWaveSmoothingFactor:(double)a3;
- (void)setStrokeStyle:(id)a3;
- (void)setWaveForm:(unint64_t)a3;
@end

@implementation HKLineSeriesPresentationStyle

- (void)setSineWaveSmoothingFactor:(double)a3
{
  if (a3 >= 0.5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HKLineSeries.m", 1157, @"Invalid parameter not satisfying: %@", @"sineWaveSmoothingFactor < 0.5" object file lineNumber description];
  }
  if (a3 < 0.0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HKLineSeries.m", 1158, @"Invalid parameter not satisfying: %@", @"sineWaveSmoothingFactor >= 0" object file lineNumber description];
  }
  self->_sineWaveSmoothingFactor = a3;
}

- (HKStrokeStyle)strokeStyle
{
  return self->_strokeStyle;
}

- (void)setStrokeStyle:(id)a3
{
}

- (HKFillStyle)fillStyle
{
  return self->_fillStyle;
}

- (void)setFillStyle:(id)a3
{
}

- (HKLineSeriesPointMarkerStyle)pointMarkerStyle
{
  return self->_pointMarkerStyle;
}

- (void)setPointMarkerStyle:(id)a3
{
}

- (HKLineSeriesPointMarkerStyle)endCapStyle
{
  return self->_endCapStyle;
}

- (void)setEndCapStyle:(id)a3
{
}

- (unint64_t)waveForm
{
  return self->_waveForm;
}

- (void)setWaveForm:(unint64_t)a3
{
  self->_waveForm = a3;
}

- (HKAxisLabelStyle)annotationStyle
{
  return self->_annotationStyle;
}

- (void)setAnnotationStyle:(id)a3
{
}

- (HKLegendPointAnnotationStyle)legendAnnotationStyle
{
  return self->_legendAnnotationStyle;
}

- (void)setLegendAnnotationStyle:(id)a3
{
}

- (HKAxisLabelStyle)axisAnnotationStyle
{
  return self->_axisAnnotationStyle;
}

- (void)setAxisAnnotationStyle:(id)a3
{
}

- (BOOL)shouldNegateAnnotationValue
{
  return self->_shouldNegateAnnotationValue;
}

- (void)setShouldNegateAnnotationValue:(BOOL)a3
{
  self->_shouldNegateAnnotationValue = a3;
}

- (double)sineWaveSmoothingFactor
{
  return self->_sineWaveSmoothingFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisAnnotationStyle, 0);
  objc_storeStrong((id *)&self->_legendAnnotationStyle, 0);
  objc_storeStrong((id *)&self->_annotationStyle, 0);
  objc_storeStrong((id *)&self->_endCapStyle, 0);
  objc_storeStrong((id *)&self->_pointMarkerStyle, 0);
  objc_storeStrong((id *)&self->_fillStyle, 0);
  objc_storeStrong((id *)&self->_strokeStyle, 0);
}

@end