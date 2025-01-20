@interface FIUIChartBarSeries
- (BOOL)fadeZeroBars;
- (CGGradient)barGradient;
- (FIUIChartBarSeries)init;
- (NSArray)barColors;
- (NSArray)barLabels;
- (NSArray)labelAttributes;
- (NSArray)plotPoints;
- (UIColor)backgroundStrokeColor;
- (UIColor)barColor;
- (UIColor)fadedBarColor;
- (UIColor)strokeColor;
- (double)backgroundStrokeWidth;
- (double)barSpacing;
- (double)barWidth;
- (double)roundedCornerRadius;
- (double)strokeWidth;
- (id)_chartColorForChartYValue:(double)a3;
- (void)_strokeRect:(CGRect)a3 context:(CGContext *)a4 color:(CGColor *)a5 width:(double)a6;
- (void)_translateColorThresholds;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSubviews;
- (void)setBackgroundStrokeColor:(id)a3;
- (void)setBackgroundStrokeWidth:(double)a3;
- (void)setBarColor:(id)a3;
- (void)setBarColors:(id)a3;
- (void)setBarGradient:(CGGradient *)a3;
- (void)setBarLabels:(id)a3;
- (void)setBarSpacing:(double)a3;
- (void)setBarWidth:(double)a3;
- (void)setFadeZeroBars:(BOOL)a3;
- (void)setFadedBarColor:(id)a3;
- (void)setLabelAttributes:(id)a3;
- (void)setPlotPoints:(id)a3;
- (void)setRoundedCornerRadius:(double)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeWidth:(double)a3;
@end

@implementation FIUIChartBarSeries

- (FIUIChartBarSeries)init
{
  v11.receiver = self;
  v11.super_class = (Class)FIUIChartBarSeries;
  v2 = [(FIUIChartSeries *)&v11 init];
  v3 = v2;
  if (v2)
  {
    plotPoints = v2->_plotPoints;
    v2->_plotPoints = (NSArray *)MEMORY[0x263EFFA68];

    barLabels = v3->_barLabels;
    v3->_barLabels = 0;

    v3->_barWidth = 2.0;
    uint64_t v6 = [MEMORY[0x263F825C8] whiteColor];
    barColor = v3->_barColor;
    v3->_barColor = (UIColor *)v6;

    v3->_barGradient = 0;
    v3->_barSpacing = 1.0;
    v3->_roundedCornerRadius = 0.0;
    v3->_fadeZeroBars = 0;
    uint64_t v8 = [MEMORY[0x263F825C8] whiteColor];
    fadedBarColor = v3->_fadedBarColor;
    v3->_fadedBarColor = (UIColor *)v8;
  }
  return v3;
}

- (void)dealloc
{
  CGGradientRelease(self->_barGradient);
  v3.receiver = self;
  v3.super_class = (Class)FIUIChartBarSeries;
  [(FIUIChartBarSeries *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)FIUIChartBarSeries;
  [(FIUIChartSeries *)&v8 layoutSubviews];
  objc_super v3 = [(FIUIChartNumericSeries *)self CGPointsFromDataSet];
  plotPoints = self->_plotPoints;
  self->_plotPoints = v3;

  v5 = [(FIUIChartSeries *)self labelsFromDataSet];
  barLabels = self->_barLabels;
  self->_barLabels = v5;

  [(FIUIChartBarSeries *)self _translateColorThresholds];
  v7 = [(FIUIChartBarSeries *)self layer];
  [v7 setNeedsDisplay];
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  UIGraphicsPushContext(a4);
  [(FIUIChartBarSeries *)self bounds];
  CGRectGetHeight(v96);
  UIRoundToViewScale();
  double v7 = v6;
  [(FIUIChartBarSeries *)self bounds];
  CGRectGetWidth(v97);
  UIRoundToViewScale();
  double v9 = v8;
  if (self->_strokeColor) {
    BOOL v10 = self->_strokeWidth > 0.0;
  }
  else {
    BOOL v10 = 0;
  }
  if (self->_backgroundStrokeColor) {
    BOOL v66 = self->_backgroundStrokeWidth > 0.0;
  }
  else {
    BOOL v66 = 0;
  }
  CGContextRef c = a4;
  Mutable = CGPathCreateMutable();
  BOOL v63 = v10;
  if (self->_fadeZeroBars) {
    path = CGPathCreateMutable();
  }
  else {
    path = 0;
  }
  v70 = [MEMORY[0x263EFF980] array];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  objc_super v11 = self->_plotPoints;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v85 objects:v92 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v86 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v85 + 1) + 8 * i) CGSizeValue];
        UIRoundToViewScale();
        double v17 = v16;
        double v18 = v7 - v16;
        if (v18 == 0.0)
        {
          if (self->_fadeZeroBars)
          {
            CGPathAddArc(path, 0, v9 + self->_roundedCornerRadius, v7 - self->_roundedCornerRadius, self->_roundedCornerRadius, 6.28318531, 0.0, 1);
            CGPathCloseSubpath(path);
          }
          double barWidth = self->_barWidth;
          double v20 = 0.0;
        }
        else
        {
          double roundedCornerRadius = self->_roundedCornerRadius;
          if (v18 >= roundedCornerRadius + roundedCornerRadius) {
            double v20 = v18;
          }
          else {
            double v20 = roundedCornerRadius + roundedCornerRadius;
          }
          double barWidth = self->_barWidth;
          v98.origin.double x = v9;
          v98.origin.double y = v17;
          v98.size.double width = barWidth;
          v98.size.double height = v20;
          CGPathAddRoundedRect(Mutable, 0, v98, roundedCornerRadius, self->_roundedCornerRadius);
        }
        v22 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v9, v17, barWidth, v20);
        [v70 addObject:v22];

        double v9 = v9 + self->_barWidth + self->_barSpacing;
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v85 objects:v92 count:16];
    }
    while (v13);
  }

  if (self->_barGradient)
  {
    v23 = c;
    BOOL v24 = v63;
    if (!CGPathIsEmpty(path))
    {
      CGContextSaveGState(c);
      CGContextAddPath(c, path);
      CGContextSetFillColorWithColor(c, [(UIColor *)self->_fadedBarColor CGColor]);
      CGContextFillPath(c);
      CGContextRestoreGState(c);
    }
    if (!CGPathIsEmpty(Mutable))
    {
      CGContextSaveGState(c);
      CGContextAddPath(c, Mutable);
      CGContextClip(c);
      v94.double x = 1.0;
      v94.double y = 0.0;
      v95.double x = 1.0;
      v95.double y = v7;
      CGContextDrawLinearGradient(c, self->_barGradient, v94, v95, 0);
      CGContextRestoreGState(c);
    }
  }
  else
  {
    v23 = c;
    CGContextSetFillColorWithColor(c, [(UIColor *)self->_barColor CGColor]);
    BOOL v24 = v63;
  }
  CGContextSaveGState(v23);
  if (v66)
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v25 = v70;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v81 objects:v91 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v82 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v81 + 1) + 8 * j) CGRectValue];
          double v31 = v30;
          double v33 = v32;
          [(FIUIChartSeries *)self insetBounds];
          -[FIUIChartBarSeries _strokeRect:context:color:width:](self, "_strokeRect:context:color:width:", v23, [(UIColor *)self->_backgroundStrokeColor CGColor], v31, v34, v33 + 1.0, v35, self->_backgroundStrokeWidth);
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v81 objects:v91 count:16];
      }
      while (v27);
    }

    BOOL v24 = v63;
  }
  if (v24 || self->_barLabels && [(NSArray *)self->_labelAttributes count])
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v36 = v70;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v77 objects:v90 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = 0;
      uint64_t v40 = *(void *)v78;
      double v41 = -1.0;
      uint64_t v61 = *(void *)v78;
      id v62 = v36;
      do
      {
        uint64_t v42 = 0;
        uint64_t v67 = v38;
        do
        {
          if (*(void *)v78 != v40) {
            objc_enumerationMutation(v36);
          }
          uint64_t v71 = v42;
          [*(id *)(*((void *)&v77 + 1) + 8 * v42) CGRectValue];
          double x = v99.origin.x;
          double y = v99.origin.y;
          double width = v99.size.width;
          double height = v99.size.height;
          if (!CGRectIsEmpty(v99))
          {
            v100.origin.double x = x;
            v100.origin.double y = y;
            v100.size.double width = width;
            v100.size.double height = height;
            v47 = [(FIUIChartBarSeries *)self _chartColorForChartYValue:CGRectGetMinY(v100)];
            v48 = v47;
            if (v47) {
              objc_msgSend(v47, "drawInRect:inContext:", v23, x, y, width, height);
            }
            if (v24) {
              -[FIUIChartBarSeries _strokeRect:context:color:width:](self, "_strokeRect:context:color:width:", v23, [(UIColor *)self->_strokeColor CGColor], x + v41, y, width + 1.0, height, self->_strokeWidth);
            }
            if (self->_barLabels && [(NSArray *)self->_labelAttributes count])
            {
              v64 = v48;
              uint64_t v65 = v39;
              v49 = [(NSArray *)self->_barLabels objectAtIndexedSubscript:v39];
              long long v73 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              uint64_t v50 = [v49 countByEnumeratingWithState:&v73 objects:v89 count:16];
              if (v50)
              {
                uint64_t v51 = v50;
                uint64_t v52 = *(void *)v74;
                do
                {
                  for (uint64_t k = 0; k != v51; ++k)
                  {
                    if (*(void *)v74 != v52) {
                      objc_enumerationMutation(v49);
                    }
                    v54 = *(void **)(*((void *)&v73 + 1) + 8 * k);
                    if (([v54 isEqualToString:&stru_26CF5F1B8] & 1) == 0)
                    {
                      unint64_t v55 = [v49 indexOfObject:v54];
                      if ([(NSArray *)self->_labelAttributes count] <= v55) {
                        unint64_t v56 = 0;
                      }
                      else {
                        unint64_t v56 = v55;
                      }
                      v57 = [(NSArray *)self->_labelAttributes objectAtIndexedSubscript:v56];
                      objc_msgSend(v54, "boundingRectWithSize:options:attributes:context:", 0, v57, 0, x + v41, 1.79769313e308);
                      UIRoundToViewScale();
                      objc_msgSend(v54, "drawAtPoint:withAttributes:", v57);
                      UIRoundToViewScale();
                      double v59 = v58;
                      double v60 = x - v58;
                      [(FIUIChartBarSeries *)self bounds];
                      -[FIUIChartBarSeries _strokeRect:context:color:width:](self, "_strokeRect:context:color:width:", c, [(UIColor *)self->_barColor CGColor], v60, 3.0, v59, CGRectGetHeight(v101) + -3.0, v59);
                    }
                  }
                  uint64_t v51 = [v49 countByEnumeratingWithState:&v73 objects:v89 count:16];
                }
                while (v51);
              }

              BOOL v24 = v63;
              uint64_t v40 = v61;
              id v36 = v62;
              v48 = v64;
              uint64_t v39 = v65;
              double v41 = -1.0;
            }

            v23 = c;
            uint64_t v38 = v67;
          }
          ++v39;
          uint64_t v42 = v71 + 1;
        }
        while (v71 + 1 != v38);
        uint64_t v38 = [v36 countByEnumeratingWithState:&v77 objects:v90 count:16];
      }
      while (v38);
    }
  }
  CGContextRestoreGState(v23);
  CGPathRelease(Mutable);
  CGPathRelease(path);
  UIGraphicsPopContext();
}

- (id)_chartColorForChartYValue:(double)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(NSArray *)self->_barColors reverseObjectEnumerator];
  id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v8 chartYValue];
        if (v9 >= a3)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_strokeRect:(CGRect)a3 context:(CGContext *)a4 color:(CGColor *)a5 width:(double)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGContextSetStrokeColorWithColor(a4, a5);
  CGContextSetLineWidth(a4, a6);
  CGContextBeginPath(a4);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v22);
  CGContextMoveToPoint(a4, MinX, MaxY);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat v14 = CGRectGetMinX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v24);
  CGContextAddLineToPoint(a4, v14, MinY);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v17 = CGRectGetMinY(v26);
  CGContextAddLineToPoint(a4, MaxX, v17);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat v18 = CGRectGetMaxX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat v19 = CGRectGetMaxY(v28);
  CGContextAddLineToPoint(a4, v18, v19);
  CGContextClosePath(a4);
  CGContextStrokePath(a4);
}

- (void)_translateColorThresholds
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = self->_barColors;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        double v9 = NSNumber;
        objc_msgSend(v8, "threshold", (void)v11);
        BOOL v10 = objc_msgSend(v9, "numberWithDouble:");
        [(FIUIChartSeries *)self yValueForPointFromChartPointValue:v10];
        objc_msgSend(v8, "setChartYValue:");
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)setBarGradient:(CGGradient *)a3
{
  CGGradientRelease(self->_barGradient);
  self->_barGradient = CGGradientRetain(a3);
  [(FIUIChartBarSeries *)self setNeedsDisplay];
}

- (double)barWidth
{
  return self->_barWidth;
}

- (void)setBarWidth:(double)a3
{
  self->_double barWidth = a3;
}

- (double)barSpacing
{
  return self->_barSpacing;
}

- (void)setBarSpacing:(double)a3
{
  self->_barSpacing = a3;
}

- (double)roundedCornerRadius
{
  return self->_roundedCornerRadius;
}

- (void)setRoundedCornerRadius:(double)a3
{
  self->_double roundedCornerRadius = a3;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (UIColor)backgroundStrokeColor
{
  return self->_backgroundStrokeColor;
}

- (void)setBackgroundStrokeColor:(id)a3
{
}

- (double)backgroundStrokeWidth
{
  return self->_backgroundStrokeWidth;
}

- (void)setBackgroundStrokeWidth:(double)a3
{
  self->_backgroundStrokeWidth = a3;
}

- (NSArray)barColors
{
  return self->_barColors;
}

- (void)setBarColors:(id)a3
{
}

- (CGGradient)barGradient
{
  return self->_barGradient;
}

- (UIColor)barColor
{
  return self->_barColor;
}

- (void)setBarColor:(id)a3
{
}

- (BOOL)fadeZeroBars
{
  return self->_fadeZeroBars;
}

- (void)setFadeZeroBars:(BOOL)a3
{
  self->_fadeZeroBars = a3;
}

- (UIColor)fadedBarColor
{
  return self->_fadedBarColor;
}

- (void)setFadedBarColor:(id)a3
{
}

- (NSArray)labelAttributes
{
  return self->_labelAttributes;
}

- (void)setLabelAttributes:(id)a3
{
}

- (NSArray)plotPoints
{
  return self->_plotPoints;
}

- (void)setPlotPoints:(id)a3
{
}

- (NSArray)barLabels
{
  return self->_barLabels;
}

- (void)setBarLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barLabels, 0);
  objc_storeStrong((id *)&self->_plotPoints, 0);
  objc_storeStrong((id *)&self->_labelAttributes, 0);
  objc_storeStrong((id *)&self->_fadedBarColor, 0);
  objc_storeStrong((id *)&self->_barColor, 0);
  objc_storeStrong((id *)&self->_barColors, 0);
  objc_storeStrong((id *)&self->_backgroundStrokeColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end