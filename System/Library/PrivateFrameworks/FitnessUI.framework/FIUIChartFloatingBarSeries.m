@interface FIUIChartFloatingBarSeries
- (NSDictionary)labelAttributes;
- (UIColor)barColor;
- (UIColor)outlineColor;
- (double)cornerRadius;
- (double)outlineWidth;
- (void)_loadFromDataSet;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSubviews;
- (void)setBarColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setLabelAttributes:(id)a3;
- (void)setOutlineColor:(id)a3;
- (void)setOutlineWidth:(double)a3;
@end

@implementation FIUIChartFloatingBarSeries

- (void)_loadFromDataSet
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  [(FIUIChartFloatingBarSeries *)self cornerRadius];
  double v4 = v3;
  v5 = [(FIUIChartSeries *)self maxYValue];
  [v5 doubleValue];
  double v7 = v6;
  v8 = [(FIUIChartSeries *)self minYValue];
  [v8 doubleValue];
  double v10 = v9;

  [(FIUIChartSeries *)self insetBounds];
  double v12 = 0.0;
  if (v11 > 2.22044605e-16) {
    double v12 = (v7 - v10) * (v4 * 3.0 / v11);
  }
  double v61 = v12;
  v13 = [MEMORY[0x263EFF980] array];
  barRects = self->_barRects;
  uint64_t v58 = 496;
  self->_barRects = v13;

  v15 = [MEMORY[0x263EFF980] array];
  barLabelTopPoints = self->_barLabelTopPoints;
  self->_barLabelTopPoints = v15;

  v17 = [MEMORY[0x263EFF980] array];
  barLabelBottomPoints = self->_barLabelBottomPoints;
  self->_barLabelBottomPoints = v17;

  v19 = [MEMORY[0x263EFF980] array];
  barLabels = self->_barLabels;
  self->_barLabels = v19;

  v60 = [(FIUIChartSeries *)self labelsFromDataSet];
  v65 = [MEMORY[0x263EFF980] array];
  v21 = [(FIUIChartSeries *)self dataSet];
  v22 = [v21 points];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    unint64_t v24 = 0;
    do
    {
      v25 = [(FIUIChartSeries *)self dataSet];
      v26 = [v25 points];
      v27 = [v26 objectAtIndexedSubscript:v24];

      [(FIUIChartSeries *)self xValueForPointFromChartPoint:v27];
      double v29 = v28;
      v30 = [v27 yValue];
      v31 = [MEMORY[0x263EFF980] array];
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __46__FIUIChartFloatingBarSeries__loadFromDataSet__block_invoke;
      v70[3] = &unk_2644A8B88;
      id v32 = v31;
      id v71 = v32;
      double v72 = v61;
      v64 = v30;
      [v30 enumerateRangesUsingBlock:v70];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v33 = v32;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v66 objects:v73 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        v62 = v27;
        unint64_t v63 = v24;
        v36 = 0;
        v37 = 0;
        uint64_t v38 = *(void *)v67;
        do
        {
          uint64_t v39 = 0;
          v40 = v37;
          do
          {
            if (*(void *)v67 != v38) {
              objc_enumerationMutation(v33);
            }
            uint64_t v41 = [*(id *)(*((void *)&v66 + 1) + 8 * v39) rangeValue];
            v43 = [NSNumber numberWithUnsignedInteger:v42 + v41 - 1];
            [(FIUIChartSeries *)self yValueForPointFromChartPointValue:v43];
            double v45 = v44;

            v46 = [NSNumber numberWithUnsignedInteger:v41];
            [(FIUIChartSeries *)self yValueForPointFromChartPointValue:v46];
            double v48 = v47 - v45;

            v49 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v29 - v4, v45 - v4, v4 + v4, v48 + v4 * 2.0);
            [v65 addObject:v49];

            v37 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v29, v45 - v4);

            if (!v36)
            {
              v36 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v29, v4 + v45);
            }
            ++v39;
            v40 = v37;
          }
          while (v35 != v39);
          uint64_t v35 = [v33 countByEnumeratingWithState:&v66 objects:v73 count:16];
        }
        while (v35);

        if (v37)
        {
          v27 = v62;
          unint64_t v24 = v63;
          if (v63 < [v60 count])
          {
            v50 = self->_barLabels;
            v51 = [v60 objectAtIndexedSubscript:v63];
            v52 = [v51 firstObject];
            [(NSMutableArray *)v50 addObject:v52];

            [(NSMutableArray *)self->_barLabelTopPoints addObject:v37];
            [(NSMutableArray *)self->_barLabelBottomPoints addObject:v36];
          }
        }
        else
        {
          v27 = v62;
          unint64_t v24 = v63;
        }
      }
      else
      {

        v37 = 0;
        v36 = 0;
      }

      ++v24;
      v53 = [(FIUIChartSeries *)self dataSet];
      v54 = [v53 points];
      unint64_t v55 = [v54 count];
    }
    while (v24 < v55);
  }
  objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v65, v58);
  v56 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v57 = *(Class *)((char *)&self->super.super.super.super.isa + v59);
  *(Class *)((char *)&self->super.super.super.super.isa + v59) = v56;
}

void __46__FIUIChartFloatingBarSeries__loadFromDataSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v6 = [*(id *)(a1 + 32) lastObject];

  double v7 = *(void **)(a1 + 32);
  if (v6)
  {
    v8 = [*(id *)(a1 + 32) lastObject];
    uint64_t v9 = [v8 rangeValue];
    uint64_t v11 = v10;

    if (*(double *)(a1 + 40) > (double)(unint64_t)(a2 - (v11 + v9) + 1))
    {
      uint64_t v12 = a2 + a3 - v9;
      v13 = *(void **)(a1 + 32);
      uint64_t v14 = [v13 count] - 1;
      objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v9, v12);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v14);
      goto LABEL_7;
    }
    v17 = *(void **)(a1 + 32);
    uint64_t v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a2, a3);
    v16 = v17;
  }
  else
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a2, a3);
    v16 = v7;
  }
  id v18 = (id)v15;
  objc_msgSend(v16, "addObject:");
LABEL_7:
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)FIUIChartFloatingBarSeries;
  [(FIUIChartSeries *)&v4 layoutSubviews];
  [(FIUIChartFloatingBarSeries *)self _loadFromDataSet];
  double v3 = [(FIUIChartFloatingBarSeries *)self layer];
  [v3 setNeedsDisplay];
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  UIGraphicsPushContext(a4);
  if (self->_cornerRadius <= 2.22044605e-16) {
    double cornerRadius = 1.0;
  }
  else {
    double cornerRadius = self->_cornerRadius;
  }
  if (self->_outlineWidth > 0.0 && self->_outlineColor)
  {
    CGContextSaveGState(a4);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    double v7 = self->_barRects;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v43 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * i) CGRectValue];
          CGRect v50 = CGRectInset(v49, -self->_outlineWidth, -self->_outlineWidth);
          uint64_t v12 = CGPathCreateWithRoundedRect(v50, cornerRadius + self->_outlineWidth, cornerRadius + self->_outlineWidth, 0);
          CGContextAddPath(a4, v12);
          CGPathRelease(v12);
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v9);
    }

    CGContextSetFillColorWithColor(a4, [(UIColor *)self->_outlineColor CGColor]);
    CGContextDrawPath(a4, kCGPathFill);
    CGContextRestoreGState(a4);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v13 = self->_barRects;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * j), "CGRectValue", (void)v38);
        id v18 = CGPathCreateWithRoundedRect(v51, cornerRadius, cornerRadius, 0);
        CGContextAddPath(a4, v18);
        CGPathRelease(v18);
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v15);
  }

  if ([(NSMutableArray *)self->_barLabels count])
  {
    unint64_t v19 = 0;
    do
    {
      v20 = -[NSMutableArray objectAtIndexedSubscript:](self->_barLabels, "objectAtIndexedSubscript:", v19, (void)v38);
      v21 = [(NSMutableArray *)self->_barLabelTopPoints objectAtIndexedSubscript:v19];
      [v21 CGPointValue];
      double v23 = v22;
      double v25 = v24;

      if ([v20 length])
      {
        objc_msgSend(v20, "boundingRectWithSize:options:attributes:context:", 0, self->_labelAttributes, 0, 1.79769313e308, 1.79769313e308);
        double v27 = v26;
        double v29 = v25 - v28;
        if (v29 < 0.0)
        {
          v30 = [(NSMutableArray *)self->_barLabelBottomPoints objectAtIndexedSubscript:v19];
          [v30 CGPointValue];
          double v29 = v31;
        }
        if (v23 + v27 * -0.5 >= 0.0) {
          double v32 = v23 + v27 * -0.5;
        }
        else {
          double v32 = 0.0;
        }
        [(FIUIChartFloatingBarSeries *)self bounds];
        double v34 = v33 - v27;
        if (v32 < v33 - v27) {
          double v34 = v32;
        }
        objc_msgSend(v20, "drawAtPoint:withAttributes:", self->_labelAttributes, v34, v29);
      }

      ++v19;
    }
    while (v19 < [(NSMutableArray *)self->_barLabels count]);
  }
  barColor = self->_barColor;
  if (barColor)
  {
    v36 = barColor;
  }
  else
  {
    v36 = [MEMORY[0x263F825C8] whiteColor];
  }
  v37 = v36;
  CGContextSetFillColorWithColor(a4, [(UIColor *)v37 CGColor]);
  CGContextDrawPath(a4, kCGPathFill);
  UIGraphicsPopContext();
}

- (UIColor)barColor
{
  return self->_barColor;
}

- (void)setBarColor:(id)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_double cornerRadius = a3;
}

- (NSDictionary)labelAttributes
{
  return self->_labelAttributes;
}

- (void)setLabelAttributes:(id)a3
{
}

- (double)outlineWidth
{
  return self->_outlineWidth;
}

- (void)setOutlineWidth:(double)a3
{
  self->_outlineWidth = a3;
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (void)setOutlineColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineColor, 0);
  objc_storeStrong((id *)&self->_labelAttributes, 0);
  objc_storeStrong((id *)&self->_barColor, 0);
  objc_storeStrong((id *)&self->_barLabels, 0);
  objc_storeStrong((id *)&self->_barLabelBottomPoints, 0);
  objc_storeStrong((id *)&self->_barLabelTopPoints, 0);
  objc_storeStrong((id *)&self->_barRects, 0);
}

@end