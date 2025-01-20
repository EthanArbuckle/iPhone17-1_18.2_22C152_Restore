@interface FIUIChartUniformBarSeries
- (CGGradient)barGradient;
- (FIUIChartUniformBarSeries)initWithFrame:(CGRect)a3;
- (NSArray)plotPoints;
- (NSDate)minDate;
- (double)barSpacing;
- (double)barWidth;
- (double)roundedCornerRadius;
- (double)xValueForPointFromChartPoint:(id)a3;
- (double)yValueForPointFromChartPointValue:(id)a3;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSubviews;
- (void)setBarGradient:(CGGradient *)a3;
- (void)setBarSpacing:(double)a3;
- (void)setBarWidth:(double)a3;
- (void)setMinDate:(id)a3;
- (void)setPlotPoints:(id)a3;
- (void)setRoundedCornerRadius:(double)a3;
@end

@implementation FIUIChartUniformBarSeries

- (FIUIChartUniformBarSeries)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FIUIChartUniformBarSeries;
  v3 = -[FIUIChartUniformBarSeries initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    plotPoints = v3->_plotPoints;
    v3->_plotPoints = (NSArray *)MEMORY[0x263EFFA68];

    v4->_barWidth = 2.0;
    v4->_barSpacing = 0.5;
    v4->_barGradient = 0;
    v4->_roundedCornerRadius = 0.0;
  }
  return v4;
}

- (void)dealloc
{
  CGGradientRelease(self->_barGradient);
  v3.receiver = self;
  v3.super_class = (Class)FIUIChartUniformBarSeries;
  [(FIUIChartUniformBarSeries *)&v3 dealloc];
}

- (void)setMinDate:(id)a3
{
  self->_minDate = (NSDate *)a3;
}

- (void)setBarWidth:(double)a3
{
  self->_barWidth = a3;
  [(FIUIChartUniformBarSeries *)self setNeedsDisplay];
}

- (void)setBarSpacing:(double)a3
{
  self->_barSpacing = a3;
  [(FIUIChartUniformBarSeries *)self setNeedsDisplay];
}

- (void)setRoundedCornerRadius:(double)a3
{
  self->_roundedCornerRadius = a3;
  [(FIUIChartUniformBarSeries *)self setNeedsDisplay];
}

- (void)setBarGradient:(CGGradient *)a3
{
  CGGradientRelease(self->_barGradient);
  self->_barGradient = CGGradientRetain(a3);
  [(FIUIChartUniformBarSeries *)self setNeedsDisplay];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)FIUIChartUniformBarSeries;
  [(FIUIChartSeries *)&v6 layoutSubviews];
  objc_super v3 = [(FIUIChartNumericSeries *)self CGPointsFromDataSet];
  plotPoints = self->_plotPoints;
  self->_plotPoints = v3;

  v5 = [(FIUIChartUniformBarSeries *)self layer];
  [v5 setNeedsDisplay];
}

- (double)xValueForPointFromChartPoint:(id)a3
{
  id v4 = a3;
  UIRoundToViewScale();
  double v6 = v5;
  double barWidth = self->_barWidth;
  v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  v9 = v8;
  if (self->_minDate)
  {
    v10 = objc_msgSend(v8, "startOfDayForDate:");
  }
  else
  {
    v11 = [MEMORY[0x263EFF910] date];
    v10 = [v9 startOfDayForDate:v11];
  }
  double v12 = v6 + barWidth;
  v13 = [v4 xValue];

  v14 = [v9 timeZone];
  [v14 daylightSavingTimeOffsetForDate:v13];
  double v16 = v15;

  v17 = [v9 timeZone];
  [v17 daylightSavingTimeOffsetForDate:v10];
  double v19 = v18;

  [v13 timeIntervalSinceDate:v10];
  double v21 = v6 + (v16 - v19 + v20) / 3600.0 * v12;

  return v21;
}

- (double)yValueForPointFromChartPointValue:(id)a3
{
  [a3 doubleValue];
  return result;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  UIGraphicsPushContext(a4);
  UIRoundToViewScale();
  CGContextSetLineWidth(a4, v6);
  CGContextRef c = a4;
  CGContextSetLineCap(a4, kCGLineCapButt);
  [(FIUIChartSeries *)self insetBounds];
  uint64_t v8 = v7;
  path = CGPathCreateMutable();
  Mutable = CGPathCreateMutable();
  [(FIUIChartUniformBarSeries *)self bounds];
  v10 = +[FIUIChartMultiDashedBackgroundView calculateRoundedLinePositionsForTotalWidth:25 lineWidth:self numberOfLines:v9 roundedInView:self->_barSpacing];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v11 = self->_plotPoints;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v55;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v54 + 1) + 8 * v15);
        [v16 CGPointValue];
        if (v17 >= 0.0)
        {
          double v18 = v17;
          [(FIUIChartUniformBarSeries *)self bounds];
          float v20 = v18 / v19 * 24.0;
          unint64_t v21 = vcvtms_u32_f32(v20);
          if (v21 + 1 >= [v10 count])
          {
            _HKInitializeLogging();
            v36 = (void *)*MEMORY[0x263F098C8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
            {
              v37 = v36;
              v38 = (objc_class *)objc_opt_class();
              v39 = NSStringFromClass(v38);
              [v16 CGPointValue];
              v40 = NSStringFromCGPoint(v66);
              *(_DWORD *)buf = 138543618;
              v59 = v39;
              __int16 v60 = 2112;
              unint64_t v61 = (unint64_t)v40;
              _os_log_impl(&dword_21E433000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered a plot point out of chart bounds: %@", buf, 0x16u);
            }
          }
          else
          {
            v22 = [v10 objectAtIndexedSubscript:v21];
            [v22 floatValue];
            double v24 = v23;

            v25 = [v10 objectAtIndexedSubscript:v21 + 1];
            [v25 floatValue];
            double v27 = v26;

            double barSpacing = self->_barSpacing;
            double v29 = v27 - v24 - barSpacing;
            if (v29 <= 0.0)
            {
              _HKInitializeLogging();
              v41 = (void *)*MEMORY[0x263F098C8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR))
              {
                v42 = v41;
                v43 = (objc_class *)objc_opt_class();
                v44 = NSStringFromClass(v43);
                *(_DWORD *)buf = 138543874;
                v59 = v44;
                __int16 v60 = 2048;
                unint64_t v61 = v21;
                __int16 v62 = 2112;
                v63 = v10;
                _os_log_error_impl(&dword_21E433000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Encountered a negative barWidth for hourBucket value: %lu, computed from roundedLinePositions array: %@", buf, 0x20u);
              }
            }
            else
            {
              double v30 = barSpacing + v24;
              [v16 CGPointValue];
              UIRoundToViewScale();
              double v32 = v31;
              if (self->_roundedCornerRadius >= v29 * 0.5) {
                double roundedCornerRadius = v29 * 0.5;
              }
              else {
                double roundedCornerRadius = self->_roundedCornerRadius;
              }
              [(FIUIChartSeries *)self insetBounds];
              if (v32 == 0.0) {
                v35 = Mutable;
              }
              else {
                v35 = path;
              }
              double v45 = v30;
              double v46 = v29;
              uint64_t v47 = v8;
              CGPathAddRoundedRect(v35, 0, *(CGRect *)(&v34 - 1), roundedCornerRadius, roundedCornerRadius);
            }
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v48 = [(NSArray *)v11 countByEnumeratingWithState:&v54 objects:v64 count:16];
      uint64_t v13 = v48;
    }
    while (v48);
  }

  if (!CGPathIsEmpty(Mutable))
  {
    CGContextSaveGState(c);
    CGContextSetAlpha(c, 0.3);
    CGContextAddPath(c, Mutable);
    CGContextClip(c);
    barGradient = self->_barGradient;
    [(FIUIChartUniformBarSeries *)self bounds];
    v67.x = 1.0;
    v67.y = 0.0;
    v69.x = 1.0;
    CGContextDrawLinearGradient(c, barGradient, v67, v69, 0);
    CGContextRestoreGState(c);
  }
  if (!CGPathIsEmpty(path))
  {
    CGContextSaveGState(c);
    CGContextAddPath(c, path);
    CGContextClip(c);
    v50 = self->_barGradient;
    [(FIUIChartUniformBarSeries *)self bounds];
    v68.x = 1.0;
    v68.y = 0.0;
    v70.x = 1.0;
    CGContextDrawLinearGradient(c, v50, v68, v70, 0);
    CGContextRestoreGState(c);
  }
  CGPathRelease(path);
  CGPathRelease(Mutable);
  UIGraphicsPopContext();
}

- (NSDate)minDate
{
  return self->_minDate;
}

- (double)barWidth
{
  return self->_barWidth;
}

- (double)barSpacing
{
  return self->_barSpacing;
}

- (double)roundedCornerRadius
{
  return self->_roundedCornerRadius;
}

- (CGGradient)barGradient
{
  return self->_barGradient;
}

- (NSArray)plotPoints
{
  return self->_plotPoints;
}

- (void)setPlotPoints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end