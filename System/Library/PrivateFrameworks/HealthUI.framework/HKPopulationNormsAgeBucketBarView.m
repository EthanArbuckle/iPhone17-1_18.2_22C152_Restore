@interface HKPopulationNormsAgeBucketBarView
- (BOOL)_bottomSegmentIsHighlighted;
- (BOOL)_topSegmentIsHighlighted;
- (CALayer)highlightedLayer;
- (CALayer)segmentsLayer;
- (CALayer)underlyingBarLayer;
- (CATextLayer)highlightedBottomLabelLayer;
- (CATextLayer)highlightedTopLabelLayer;
- (HKPopulationNormsAgeBucketBarView)initWithReferenceMinY:(double)a3 referenceMaxY:(double)a4 highlightColor:(id)a5;
- (NSArray)ascendingThresholds;
- (NSDictionary)highlightedTextLayerAttributes;
- (UIColor)highlightColor;
- (double)highlightedSectionMaxY;
- (double)highlightedSectionMinY;
- (double)referenceMaxY;
- (double)referenceMinY;
- (double)visibleBarMaxY;
- (double)visibleBarMinY;
- (unint64_t)highlightedSegmentIndex;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setAscendingThresholds:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightedBottomLabelLayer:(id)a3;
- (void)setHighlightedLayer:(id)a3;
- (void)setHighlightedSectionMaxY:(double)a3;
- (void)setHighlightedSectionMinY:(double)a3;
- (void)setHighlightedSegmentIndex:(unint64_t)a3;
- (void)setHighlightedTextLayerAttributes:(id)a3;
- (void)setHighlightedTopLabelLayer:(id)a3;
- (void)setReferenceMaxY:(double)a3;
- (void)setReferenceMinY:(double)a3;
- (void)setSegmentsLayer:(id)a3;
- (void)setUnderlyingBarLayer:(id)a3;
- (void)setVisibleBarMaxY:(double)a3;
- (void)setVisibleBarMinY:(double)a3;
- (void)updateWithAscendingThresholds:(id)a3 currentHighlightIndex:(unint64_t)a4;
@end

@implementation HKPopulationNormsAgeBucketBarView

- (HKPopulationNormsAgeBucketBarView)initWithReferenceMinY:(double)a3 referenceMaxY:(double)a4 highlightColor:(id)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v38.receiver = self;
  v38.super_class = (Class)HKPopulationNormsAgeBucketBarView;
  v10 = -[HKPopulationNormsAgeBucketBarView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v11 = v10;
  if (v10)
  {
    v10->_referenceMinY = a3;
    v10->_referenceMaxY = a4;
    v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    underlyingBarLayer = v11->_underlyingBarLayer;
    v11->_underlyingBarLayer = v12;

    [(CALayer *)v11->_underlyingBarLayer setCornerRadius:5.0];
    [(CALayer *)v11->_underlyingBarLayer setMasksToBounds:1];
    id v14 = [MEMORY[0x1E4FB1618] clearColor];
    -[CALayer setBackgroundColor:](v11->_underlyingBarLayer, "setBackgroundColor:", [v14 CGColor]);

    v15 = [(HKPopulationNormsAgeBucketBarView *)v11 layer];
    [v15 addSublayer:v11->_underlyingBarLayer];

    v16 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    segmentsLayer = v11->_segmentsLayer;
    v11->_segmentsLayer = v16;

    [(CALayer *)v11->_underlyingBarLayer addSublayer:v11->_segmentsLayer];
    objc_storeStrong((id *)&v11->_highlightColor, a5);
    v18 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    highlightedLayer = v11->_highlightedLayer;
    v11->_highlightedLayer = v18;

    [(CALayer *)v11->_highlightedLayer setCornerRadius:2.0];
    [(CALayer *)v11->_highlightedLayer setMasksToBounds:1];
    [(CALayer *)v11->_highlightedLayer setBackgroundColor:[(UIColor *)v11->_highlightColor CGColor]];
    [(CALayer *)v11->_underlyingBarLayer addSublayer:v11->_highlightedLayer];
    v20 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v21 = *MEMORY[0x1E4FB28E0];
    uint64_t v22 = *MEMORY[0x1E4FB0938];
    uint64_t v23 = *MEMORY[0x1E4FB27C0];
    v24 = [(HKPopulationNormsAgeBucketBarView *)v11 traitCollection];
    v25 = [v20 _preferredFontForTextStyle:v21 design:v22 variant:1024 maximumContentSizeCategory:v23 compatibleWithTraitCollection:v24];

    uint64_t v39 = *MEMORY[0x1E4FB06F8];
    v40[0] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    highlightedTextLayerAttributes = v11->_highlightedTextLayerAttributes;
    v11->_highlightedTextLayerAttributes = (NSDictionary *)v26;

    v28 = (CATextLayer *)objc_alloc_init(MEMORY[0x1E4F39CE8]);
    highlightedTopLabelLayer = v11->_highlightedTopLabelLayer;
    v11->_highlightedTopLabelLayer = v28;

    [(CATextLayer *)v11->_highlightedTopLabelLayer setFont:v25];
    [(CATextLayer *)v11->_highlightedTopLabelLayer setFontSize:12.0];
    v30 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v30 scale];
    -[CATextLayer setContentsScale:](v11->_highlightedTopLabelLayer, "setContentsScale:");

    uint64_t v31 = *MEMORY[0x1E4F39D38];
    [(CATextLayer *)v11->_highlightedTopLabelLayer setAlignmentMode:*MEMORY[0x1E4F39D38]];
    v32 = [(HKPopulationNormsAgeBucketBarView *)v11 layer];
    [v32 addSublayer:v11->_highlightedTopLabelLayer];

    v33 = (CATextLayer *)objc_alloc_init(MEMORY[0x1E4F39CE8]);
    highlightedBottomLabelLayer = v11->_highlightedBottomLabelLayer;
    v11->_highlightedBottomLabelLayer = v33;

    [(CATextLayer *)v11->_highlightedBottomLabelLayer setFont:v25];
    [(CATextLayer *)v11->_highlightedBottomLabelLayer setFontSize:12.0];
    v35 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v35 scale];
    -[CATextLayer setContentsScale:](v11->_highlightedBottomLabelLayer, "setContentsScale:");

    [(CATextLayer *)v11->_highlightedBottomLabelLayer setAlignmentMode:v31];
    v36 = [(HKPopulationNormsAgeBucketBarView *)v11 layer];
    [v36 addSublayer:v11->_highlightedBottomLabelLayer];
  }
  return v11;
}

- (void)updateWithAscendingThresholds:(id)a3 currentHighlightIndex:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ((unint64_t)[v8 count] <= 2)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"HKPopulationNormsAgeBucketBarView.m", 103, @"Invalid parameter not satisfying: %@", @"ascendingThresholds.count > 2" object file lineNumber description];
  }
  p_ascendingThresholds = &self->_ascendingThresholds;
  if ([(NSArray *)self->_ascendingThresholds count] - 1 <= a4)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"HKPopulationNormsAgeBucketBarView.m", 104, @"Invalid parameter not satisfying: %@", @"segmentIndex >= 0 && segmentIndex < _ascendingThresholds.count-1" object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_ascendingThresholds, a3);
  self->_highlightedSegmentIndex = a4;
  uint64_t v10 = [(NSArray *)*p_ascendingThresholds count];
  v11 = [(CALayer *)self->_segmentsLayer sublayers];
  uint64_t v12 = [v11 count];
  uint64_t v13 = v10 + ~v12;

  if (v13 < 1)
  {
    if (v13 < 0)
    {
      uint64_t v15 = v12 - v10 + 1;
      do
      {
        v16 = [(CALayer *)self->_segmentsLayer sublayers];
        v17 = [v16 lastObject];
        [v17 removeFromSuperlayer];

        --v15;
      }
      while (v15);
    }
  }
  else
  {
    do
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
      [v14 setCornerRadius:2.0];
      [(CALayer *)self->_segmentsLayer addSublayer:v14];

      --v13;
    }
    while (v13);
  }
  self->_visibleBarMinY = 1.79769313e308;
  self->_visibleBarMaxY = 2.22507386e-308;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * v22) floatValue];
        double v24 = v23;
        if (self->_visibleBarMinY > v24) {
          self->_visibleBarMinY = v24;
        }
        if (self->_visibleBarMaxY <= v24) {
          self->_visibleBarMaxY = v24;
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v20);
  }

  v25 = [(NSArray *)*p_ascendingThresholds objectAtIndexedSubscript:a4];
  [v25 floatValue];
  self->_highlightedSectionMinY = v26;

  v27 = [(NSArray *)*p_ascendingThresholds objectAtIndexedSubscript:a4 + 1];
  [v27 floatValue];
  self->_highlightedSectionMaxY = v28;

  v29 = [NSNumber numberWithDouble:self->_highlightedSectionMinY];
  v30 = HKLocalizedStringForNumberWithDecimalPrecision(v29, 1, 0);
  [(CATextLayer *)self->_highlightedBottomLabelLayer setString:v30];

  uint64_t v31 = [NSNumber numberWithDouble:self->_highlightedSectionMaxY];
  v32 = HKLocalizedStringForNumberWithDecimalPrecision(v31, 1, 0);
  [(CATextLayer *)self->_highlightedTopLabelLayer setString:v32];

  v33 = [(HKPopulationNormsAgeBucketBarView *)self layer];
  [v33 layoutSublayers];
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v67 = a3;
  v4 = [(HKPopulationNormsAgeBucketBarView *)self layer];
  int v5 = [v67 isEqual:v4];

  v6 = v67;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_populationChartSeriesColor");
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 CGColor];

    id v9 = [(UIColor *)self->_highlightColor CGColor];
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_populationChartTextColor");
    id v10 = objc_claimAutoreleasedReturnValue();
    -[CATextLayer setForegroundColor:](self->_highlightedTopLabelLayer, "setForegroundColor:", [v10 CGColor]);

    objc_msgSend(MEMORY[0x1E4FB1618], "hk_populationChartTextColor");
    id v11 = objc_claimAutoreleasedReturnValue();
    -[CATextLayer setForegroundColor:](self->_highlightedBottomLabelLayer, "setForegroundColor:", [v11 CGColor]);

    double referenceMaxY = self->_referenceMaxY;
    double v13 = referenceMaxY - self->_referenceMinY;
    double visibleBarMaxY = self->_visibleBarMaxY;
    double v15 = visibleBarMaxY - self->_visibleBarMinY;
    double v16 = v15 / v13;
    double v17 = (referenceMaxY - visibleBarMaxY) / v13;
    id v18 = [(HKPopulationNormsAgeBucketBarView *)self layer];
    [v18 frame];
    double v19 = CGRectGetWidth(v69) + -20.0;

    if (v19 > 30.0) {
      double v19 = 30.0;
    }
    uint64_t v20 = [(HKPopulationNormsAgeBucketBarView *)self window];

    uint64_t v21 = v8;
    if (v20)
    {
      uint64_t v22 = [(HKPopulationNormsAgeBucketBarView *)self window];
      float v23 = [v22 traitCollection];
      uint64_t v24 = [v23 horizontalSizeClass];

      if (v24 == 2)
      {
        v25 = [(HKPopulationNormsAgeBucketBarView *)self layer];
        [v25 frame];
        double v19 = CGRectGetWidth(v70) + -20.0;

        if (v19 > 60.0) {
          double v19 = 60.0;
        }
      }
    }
    float v26 = [(HKPopulationNormsAgeBucketBarView *)self layer];
    [v26 frame];
    CGFloat Width = CGRectGetWidth(v71);
    double v28 = HKUIFloorToScreenScale((Width - v19) * 0.5);

    v29 = [(HKPopulationNormsAgeBucketBarView *)self layer];
    [v29 frame];
    double v30 = v17 * CGRectGetHeight(v72);
    uint64_t v31 = [(HKPopulationNormsAgeBucketBarView *)self layer];
    [v31 frame];
    -[CALayer setFrame:](self->_underlyingBarLayer, "setFrame:", v28, v30, v19, v16 * CGRectGetHeight(v73));

    [(CALayer *)self->_underlyingBarLayer frame];
    double MinY = CGRectGetMinY(v74);
    double v33 = self->_visibleBarMaxY;
    double v34 = (v33 - self->_highlightedSectionMinY) / v15;
    double v35 = (v33 - self->_highlightedSectionMaxY) / v15;
    if ([(HKPopulationNormsAgeBucketBarView *)self _bottomSegmentIsHighlighted]) {
      double v36 = 0.0;
    }
    else {
      double v36 = 1.0;
    }
    if ([(HKPopulationNormsAgeBucketBarView *)self _topSegmentIsHighlighted]) {
      double v37 = 0.0;
    }
    else {
      double v37 = 1.0;
    }
    [(CALayer *)self->_underlyingBarLayer frame];
    double v38 = -(v36 - CGRectGetHeight(v75) * v34);
    [(CALayer *)self->_underlyingBarLayer frame];
    double v39 = v37 + CGRectGetHeight(v76) * v35;
    [(CALayer *)self->_highlightedLayer setBackgroundColor:v9];
    [(CALayer *)self->_underlyingBarLayer frame];
    -[CALayer setFrame:](self->_highlightedLayer, "setFrame:", 0.0, v38, CGRectGetWidth(v77), v39 - v38);
    v66 = [(CATextLayer *)self->_highlightedTopLabelLayer string];
    [v66 sizeWithAttributes:self->_highlightedTextLayerAttributes];
    double v41 = v40;
    double v42 = MinY + v39 - v40 + -4.0;
    v43 = [(HKPopulationNormsAgeBucketBarView *)self layer];
    [v43 frame];
    -[CATextLayer setFrame:](self->_highlightedTopLabelLayer, "setFrame:", 0.0, v42, CGRectGetWidth(v78), v41);

    [(CATextLayer *)self->_highlightedTopLabelLayer setHidden:[(HKPopulationNormsAgeBucketBarView *)self _topSegmentIsHighlighted]];
    v65 = [(CATextLayer *)self->_highlightedBottomLabelLayer string];
    [v65 sizeWithAttributes:self->_highlightedTextLayerAttributes];
    double v45 = v44;
    v46 = [(HKPopulationNormsAgeBucketBarView *)self layer];
    [v46 frame];
    -[CATextLayer setFrame:](self->_highlightedBottomLabelLayer, "setFrame:", 0.0, MinY + v38 + 4.0, CGRectGetWidth(v79), v45);

    [(CATextLayer *)self->_highlightedBottomLabelLayer setHidden:[(HKPopulationNormsAgeBucketBarView *)self _bottomSegmentIsHighlighted]];
    [(CALayer *)self->_underlyingBarLayer bounds];
    -[CALayer setFrame:](self->_segmentsLayer, "setFrame:");
    v47 = [(CALayer *)self->_segmentsLayer sublayers];
    uint64_t v48 = [v47 count];

    if (v48)
    {
      uint64_t v49 = 0;
      do
      {
        v50 = [(CALayer *)self->_segmentsLayer sublayers];
        v51 = [v50 objectAtIndexedSubscript:v49];

        [v51 setBackgroundColor:v21];
        v52 = [(NSArray *)self->_ascendingThresholds objectAtIndexedSubscript:v49];
        uint64_t v53 = v49 + 1;
        v54 = [(NSArray *)self->_ascendingThresholds objectAtIndexedSubscript:v49 + 1];
        if (v49) {
          double v55 = 1.0;
        }
        else {
          double v55 = 0.0;
        }
        if (v49 == v48 - 1) {
          double v56 = 0.0;
        }
        else {
          double v56 = 1.0;
        }
        double v57 = self->_visibleBarMaxY;
        [v52 floatValue];
        double v59 = (v57 - v58) / v15;
        double v60 = self->_visibleBarMaxY;
        [v54 floatValue];
        double v62 = (v60 - v61) / v15;
        [(CALayer *)self->_segmentsLayer frame];
        double v63 = -(v55 - CGRectGetHeight(v80) * v59);
        [(CALayer *)self->_segmentsLayer frame];
        double v64 = v56 + CGRectGetHeight(v81) * v62;
        [(CALayer *)self->_segmentsLayer frame];
        objc_msgSend(v51, "setFrame:", 0.0, v63, CGRectGetWidth(v82), v64 - v63);

        ++v49;
      }
      while (v53 != v48);
    }

    v6 = v67;
  }
}

- (BOOL)_bottomSegmentIsHighlighted
{
  return self->_highlightedSegmentIndex == 0;
}

- (BOOL)_topSegmentIsHighlighted
{
  unint64_t highlightedSegmentIndex = self->_highlightedSegmentIndex;
  return highlightedSegmentIndex == [(NSArray *)self->_ascendingThresholds count] - 2;
}

- (double)referenceMinY
{
  return self->_referenceMinY;
}

- (void)setReferenceMinY:(double)a3
{
  self->_referencedouble MinY = a3;
}

- (double)referenceMaxY
{
  return self->_referenceMaxY;
}

- (void)setReferenceMaxY:(double)a3
{
  self->_double referenceMaxY = a3;
}

- (NSArray)ascendingThresholds
{
  return self->_ascendingThresholds;
}

- (void)setAscendingThresholds:(id)a3
{
}

- (CALayer)underlyingBarLayer
{
  return self->_underlyingBarLayer;
}

- (void)setUnderlyingBarLayer:(id)a3
{
}

- (CALayer)segmentsLayer
{
  return self->_segmentsLayer;
}

- (void)setSegmentsLayer:(id)a3
{
}

- (double)visibleBarMinY
{
  return self->_visibleBarMinY;
}

- (void)setVisibleBarMinY:(double)a3
{
  self->_visibleBardouble MinY = a3;
}

- (double)visibleBarMaxY
{
  return self->_visibleBarMaxY;
}

- (void)setVisibleBarMaxY:(double)a3
{
  self->_double visibleBarMaxY = a3;
}

- (CALayer)highlightedLayer
{
  return self->_highlightedLayer;
}

- (void)setHighlightedLayer:(id)a3
{
}

- (CATextLayer)highlightedTopLabelLayer
{
  return self->_highlightedTopLabelLayer;
}

- (void)setHighlightedTopLabelLayer:(id)a3
{
}

- (CATextLayer)highlightedBottomLabelLayer
{
  return self->_highlightedBottomLabelLayer;
}

- (void)setHighlightedBottomLabelLayer:(id)a3
{
}

- (NSDictionary)highlightedTextLayerAttributes
{
  return self->_highlightedTextLayerAttributes;
}

- (void)setHighlightedTextLayerAttributes:(id)a3
{
}

- (unint64_t)highlightedSegmentIndex
{
  return self->_highlightedSegmentIndex;
}

- (void)setHighlightedSegmentIndex:(unint64_t)a3
{
  self->_unint64_t highlightedSegmentIndex = a3;
}

- (double)highlightedSectionMinY
{
  return self->_highlightedSectionMinY;
}

- (void)setHighlightedSectionMinY:(double)a3
{
  self->_highlightedSectiondouble MinY = a3;
}

- (double)highlightedSectionMaxY
{
  return self->_highlightedSectionMaxY;
}

- (void)setHighlightedSectionMaxY:(double)a3
{
  self->_highlightedSectionMaxY = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextLayerAttributes, 0);
  objc_storeStrong((id *)&self->_highlightedBottomLabelLayer, 0);
  objc_storeStrong((id *)&self->_highlightedTopLabelLayer, 0);
  objc_storeStrong((id *)&self->_highlightedLayer, 0);
  objc_storeStrong((id *)&self->_segmentsLayer, 0);
  objc_storeStrong((id *)&self->_underlyingBarLayer, 0);
  objc_storeStrong((id *)&self->_ascendingThresholds, 0);
}

@end