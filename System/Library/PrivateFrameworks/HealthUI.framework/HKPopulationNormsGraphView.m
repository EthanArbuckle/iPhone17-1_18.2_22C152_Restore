@interface HKPopulationNormsGraphView
- (CGSize)intrinsicContentSize;
- (HKPopulationNormsChartGridView)gridView;
- (HKPopulationNormsGraphView)initWithMaxYValue:(double)a3 minYValue:(double)a4 YSeriesTitle:(id)a5 XSeriesTitle:(id)a6 highlightedSegmentColor:(id)a7;
- (NSMutableArray)ageBucketBarViews;
- (NSNumber)ageBucketIndex;
- (NSNumber)currentViewWidth;
- (NSNumber)latestSampleValue;
- (NSString)xSeriesTitle;
- (NSString)ySeriesTitle;
- (UIColor)highlightedSegmentColor;
- (UIFont)seriesTitleFont;
- (UILabel)xSeriesTitleLabel;
- (UILabel)ySeriesTitleLabel;
- (UIView)latestSampleHighlightView;
- (double)maxChartYValue;
- (double)minChartYValue;
- (unint64_t)_highlightIndexForClassificationIndex:(unint64_t)a3 numberOfSegments:(unint64_t)a4;
- (unint64_t)classificationIndex;
- (unint64_t)sexSegmentIndex;
- (void)_updateUserValueChartPointIfNecessary;
- (void)layoutSubviews;
- (void)setAgeBucketBarViews:(id)a3;
- (void)setAgeBucketIndex:(id)a3;
- (void)setClassificationIndex:(unint64_t)a3;
- (void)setCurrentViewWidth:(id)a3;
- (void)setGridView:(id)a3;
- (void)setLatestSampleHighlightView:(id)a3;
- (void)setLatestSampleValue:(id)a3;
- (void)setMaxChartYValue:(double)a3;
- (void)setMinChartYValue:(double)a3;
- (void)setSexSegmentIndex:(unint64_t)a3;
- (void)setXSeriesTitle:(id)a3;
- (void)setXSeriesTitleLabel:(id)a3;
- (void)setYSeriesTitle:(id)a3;
- (void)setYSeriesTitleLabel:(id)a3;
- (void)updateWithFlattenedLevelsByAgeBucket:(id)a3 currentClassificationIndex:(unint64_t)a4;
- (void)updateWithUserAgeBucketIndex:(id)a3 userLatestSampleValue:(id)a4;
@end

@implementation HKPopulationNormsGraphView

- (HKPopulationNormsGraphView)initWithMaxYValue:(double)a3 minYValue:(double)a4 YSeriesTitle:(id)a5 XSeriesTitle:(id)a6 highlightedSegmentColor:(id)a7
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HKPopulationNormsGraphView;
  v17 = -[HKPopulationNormsGraphView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v17)
  {
    if (a3 <= a4)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, v17, @"HKPopulationNormsGraphView.m", 56, @"Invalid parameter not satisfying: %@", @"maxChartYValue > minChartYValue" object file lineNumber description];
    }
    v17->_maxChartYValue = a3;
    v17->_minChartYValue = a4;
    objc_storeStrong((id *)&v17->_ySeriesTitle, a5);
    objc_storeStrong((id *)&v17->_xSeriesTitle, a6);
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
    seriesTitleFont = v17->_seriesTitleFont;
    v17->_seriesTitleFont = (UIFont *)v18;

    objc_storeStrong((id *)&v17->_highlightedSegmentColor, a7);
  }

  return v17;
}

- (unint64_t)_highlightIndexForClassificationIndex:(unint64_t)a3 numberOfSegments:(unint64_t)a4
{
  if (a3 >= a4) {
    return 0;
  }
  else {
    return ~a3 + a4;
  }
}

- (void)updateWithFlattenedLevelsByAgeBucket:(id)a3 currentClassificationIndex:(unint64_t)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 allKeys];
  v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_36];

  v9 = &OBJC_IVAR___HKDisplayTypeContextItem__analyticsIdentifier;
  if (!self->_gridView)
  {
    id v79 = v6;
    v80 = self;
    v82 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v78 = v8;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v83 objects:v88 count:16];
    v81 = v10;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v84;
      uint64_t v14 = *MEMORY[0x1E4F29758];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v84 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = [*(id *)(*((void *)&v83 + 1) + 8 * i) rangeValue];
          uint64_t v18 = v16 + v17;
          if (v16 + v17 == v14)
          {
            v19 = [HKPopulationNormsUnboundedEndAxisLabel alloc];
            v20 = [NSNumber numberWithInteger:v16];
            v21 = [(HKPopulationNormsUnboundedEndAxisLabel *)v19 initWithRangeStart:v20];
          }
          else
          {
            objc_super v22 = [HKPopulationNormsAxisLabel alloc];
            v20 = [NSNumber numberWithInteger:v16];
            v23 = [NSNumber numberWithInteger:v18];
            v21 = [(HKPopulationNormsAxisLabel *)v22 initWithRangeStart:v20 end:v23];

            id v10 = v81;
          }

          [v82 addObject:v21];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v83 objects:v88 count:16];
      }
      while (v12);
    }

    v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
    double minChartYValue = v80->_minChartYValue;
    float v26 = minChartYValue;
    double maxChartYValue = v80->_maxChartYValue;
    if (maxChartYValue >= v26)
    {
      float v28 = (maxChartYValue - minChartYValue) / 6.0;
      do
      {
        v29 = [HKPopulationNormsAxisLabel alloc];
        *(float *)&double v30 = v26;
        v31 = [NSNumber numberWithFloat:v30];
        v32 = [(HKPopulationNormsAxisLabel *)v29 initWithValue:v31];

        [v24 addObject:v32];
        float v26 = v26 + v28;
      }
      while (v80->_maxChartYValue >= v26);
    }
    v33 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    ySeriesTitleLabel = v80->_ySeriesTitleLabel;
    v80->_ySeriesTitleLabel = v33;

    [(UILabel *)v80->_ySeriesTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v80->_ySeriesTitleLabel setNumberOfLines:0];
    v35 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisLabelColor");
    [(UILabel *)v80->_ySeriesTitleLabel setTextColor:v35];

    [(UILabel *)v80->_ySeriesTitleLabel setText:v80->_ySeriesTitle];
    [(UILabel *)v80->_ySeriesTitleLabel setFont:v80->_seriesTitleFont];
    [(HKPopulationNormsGraphView *)v80 addSubview:v80->_ySeriesTitleLabel];
    v36 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    xSeriesTitleLabel = v80->_xSeriesTitleLabel;
    v80->_xSeriesTitleLabel = v36;

    [(UILabel *)v80->_xSeriesTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v80->_xSeriesTitleLabel setNumberOfLines:0];
    v38 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisLabelColor");
    [(UILabel *)v80->_xSeriesTitleLabel setTextColor:v38];

    [(UILabel *)v80->_xSeriesTitleLabel setText:v80->_xSeriesTitle];
    [(UILabel *)v80->_xSeriesTitleLabel setFont:v80->_seriesTitleFont];
    [(HKPopulationNormsGraphView *)v80 addSubview:v80->_xSeriesTitleLabel];
    v77 = v24;
    v39 = [[HKPopulationNormsChartGridView alloc] initWithXAxisLabels:v82 YAxisLabels:v24];
    gridView = v80->_gridView;
    v80->_gridView = v39;

    [(HKPopulationNormsChartGridView *)v80->_gridView setTranslatesAutoresizingMaskIntoConstraints:0];
    v41 = [MEMORY[0x1E4FB1618] clearColor];
    [(HKPopulationNormsChartGridView *)v80->_gridView setBackgroundColor:v41];

    [(HKPopulationNormsGraphView *)v80 addSubview:v80->_gridView];
    v69 = (void *)MEMORY[0x1E4F28DC8];
    v68 = [(UILabel *)v80->_ySeriesTitleLabel topAnchor];
    v66 = [(HKPopulationNormsGraphView *)v80 topAnchor];
    v76 = [v68 constraintEqualToAnchor:v66];
    v87[0] = v76;
    v75 = [(UILabel *)v80->_ySeriesTitleLabel rightAnchor];
    v74 = [(HKPopulationNormsGraphView *)v80 rightAnchor];
    v73 = [v75 constraintEqualToAnchor:v74];
    v87[1] = v73;
    v72 = [(HKPopulationNormsChartGridView *)v80->_gridView topAnchor];
    v71 = [(UILabel *)v80->_ySeriesTitleLabel bottomAnchor];
    v70 = [v72 constraintEqualToAnchor:v71 constant:10.0];
    v87[2] = v70;
    v67 = [(HKPopulationNormsChartGridView *)v80->_gridView leftAnchor];
    v65 = [(HKPopulationNormsGraphView *)v80 leftAnchor];
    v64 = [v67 constraintEqualToAnchor:v65];
    v87[3] = v64;
    v63 = [(HKPopulationNormsChartGridView *)v80->_gridView rightAnchor];
    v62 = [(HKPopulationNormsGraphView *)v80 rightAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v87[4] = v61;
    v60 = [(UILabel *)v80->_xSeriesTitleLabel topAnchor];
    v59 = [(HKPopulationNormsChartGridView *)v80->_gridView bottomAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:3.0];
    v87[5] = v58;
    v42 = [(UILabel *)v80->_xSeriesTitleLabel leftAnchor];
    v43 = [(HKPopulationNormsGraphView *)v80 leftAnchor];
    v44 = [v42 constraintEqualToAnchor:v43 constant:5.0];
    v87[6] = v44;
    v45 = [(UILabel *)v80->_xSeriesTitleLabel bottomAnchor];
    v46 = [(HKPopulationNormsGraphView *)v80 bottomAnchor];
    v47 = [v45 constraintEqualToAnchor:v46];
    v87[7] = v47;
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:8];
    [v69 activateConstraints:v48];

    self = v80;
    uint64_t v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v81, "count"));
    v9 = &OBJC_IVAR___HKDisplayTypeContextItem__analyticsIdentifier;
    ageBucketBarViews = v80->_ageBucketBarViews;
    v80->_ageBucketBarViews = (NSMutableArray *)v49;

    if ([v81 count])
    {
      unint64_t v51 = 0;
      do
      {
        v52 = [[HKPopulationNormsAgeBucketBarView alloc] initWithReferenceMinY:v80->_highlightedSegmentColor referenceMaxY:v80->_minChartYValue highlightColor:v80->_maxChartYValue];
        [(HKPopulationNormsChartGridView *)v80->_gridView addSubview:v52];
        [(NSMutableArray *)v80->_ageBucketBarViews addObject:v52];

        ++v51;
      }
      while ([v81 count] > v51);
    }

    id v6 = v79;
    v8 = v78;
  }
  if ([v8 count])
  {
    unint64_t v53 = 0;
    uint64_t v54 = v9[77];
    do
    {
      v55 = [*(id *)((char *)&self->super.super.super.isa + v54) objectAtIndexedSubscript:v53];
      v56 = [v8 objectAtIndexedSubscript:v53];
      v57 = [v6 objectForKeyedSubscript:v56];

      objc_msgSend(v55, "updateWithAscendingThresholds:currentHighlightIndex:", v57, -[HKPopulationNormsGraphView _highlightIndexForClassificationIndex:numberOfSegments:](self, "_highlightIndexForClassificationIndex:numberOfSegments:", a4, objc_msgSend(v57, "count") - 1));
      ++v53;
    }
    while ([v8 count] > v53);
  }
  [(HKPopulationNormsGraphView *)self setNeedsLayout];
  [(HKPopulationNormsChartGridView *)self->_gridView relocalizeAxisLabels];
}

- (void)_updateUserValueChartPointIfNecessary
{
  if (self->_ageBucketIndex && self->_latestSampleValue)
  {
    latestSampleHighlightView = self->_latestSampleHighlightView;
    if (!latestSampleHighlightView)
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v5 = self->_latestSampleHighlightView;
      self->_latestSampleHighlightView = v4;

      [(UIView *)self->_latestSampleHighlightView setUserInteractionEnabled:0];
      id v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopStickColor");
      [(UIView *)self->_latestSampleHighlightView setBackgroundColor:v6];

      objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
      id v7 = objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 CGColor];
      v9 = [(UIView *)self->_latestSampleHighlightView layer];
      [v9 setBorderColor:v8];

      id v10 = [(UIView *)self->_latestSampleHighlightView layer];
      [v10 setBorderWidth:1.25];

      uint64_t v11 = [(UIView *)self->_latestSampleHighlightView layer];
      [v11 setCornerRadius:5.0];

      uint64_t v12 = [(UIView *)self->_latestSampleHighlightView layer];
      [v12 setMasksToBounds:1];

      [(HKPopulationNormsChartGridView *)self->_gridView addSubview:self->_latestSampleHighlightView];
      latestSampleHighlightView = self->_latestSampleHighlightView;
    }
    [(UIView *)latestSampleHighlightView setHidden:0];
    [(HKPopulationNormsGraphView *)self setNeedsLayout];
  }
  else
  {
    uint64_t v13 = self->_latestSampleHighlightView;
    if (v13)
    {
      [(UIView *)v13 setHidden:1];
    }
  }
}

- (void)updateWithUserAgeBucketIndex:(id)a3 userLatestSampleValue:(id)a4
{
  id v6 = (NSNumber *)a3;
  id v7 = (NSNumber *)a4;
  ageBucketIndex = self->_ageBucketIndex;
  self->_ageBucketIndex = v6;
  id v10 = v6;

  latestSampleValue = self->_latestSampleValue;
  self->_latestSampleValue = v7;
}

- (void)layoutSubviews
{
  if (!self->_currentViewWidth
    || ([(HKPopulationNormsGraphView *)self frame],
        double Width = CGRectGetWidth(v20),
        [(NSNumber *)self->_currentViewWidth floatValue],
        Width != v4))
  {
    v5 = NSNumber;
    [(HKPopulationNormsGraphView *)self frame];
    id v6 = [v5 numberWithDouble:CGRectGetWidth(v21)];
    currentViewdouble Width = self->_currentViewWidth;
    self->_currentViewdouble Width = v6;

    [(HKPopulationNormsGraphView *)self invalidateIntrinsicContentSize];
  }
  v19.receiver = self;
  v19.super_class = (Class)HKPopulationNormsGraphView;
  [(HKPopulationNormsGraphView *)&v19 layoutSubviews];
  [(HKPopulationNormsChartGridView *)self->_gridView setNeedsDisplay];
  if ([(NSMutableArray *)self->_ageBucketBarViews count])
  {
    double minChartYValue = self->_minChartYValue;
    double maxChartYValue = self->_maxChartYValue;
    [(HKPopulationNormsChartGridView *)self->_gridView determineCanvasRect];
    double v11 = v10;
    double v13 = v12 / (double)(unint64_t)[(NSMutableArray *)self->_ageBucketBarViews count];
    ageBucketIndex = self->_ageBucketIndex;
    if (ageBucketIndex && self->_latestSampleValue)
    {
      unint64_t v15 = [(NSNumber *)ageBucketIndex unsignedIntegerValue];
      [(NSNumber *)self->_latestSampleValue floatValue];
      -[UIView setFrame:](self->_latestSampleHighlightView, "setFrame:", ((double)v15 + 0.5) * v13 + -5.0, (maxChartYValue - v16) / (maxChartYValue - minChartYValue) * v11 + -5.0, 10.0, 10.0);
    }
    if ([(NSMutableArray *)self->_ageBucketBarViews count])
    {
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = [(NSMutableArray *)self->_ageBucketBarViews objectAtIndexedSubscript:v17];
        objc_msgSend(v18, "setFrame:", v13 * (double)(int)v17, 0.0, v13, v11);
        [v18 setNeedsLayout];

        ++v17;
      }
      while ([(NSMutableArray *)self->_ageBucketBarViews count] > v17);
    }
  }
}

- (CGSize)intrinsicContentSize
{
  currentViewdouble Width = self->_currentViewWidth;
  if (currentViewWidth)
  {
    [(NSNumber *)currentViewWidth floatValue];
    double v4 = v3 * 1.1;
  }
  else
  {
    double v4 = 2.22507386e-308;
  }
  double v5 = 0.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (double)maxChartYValue
{
  return self->_maxChartYValue;
}

- (void)setMaxChartYValue:(double)a3
{
  self->_double maxChartYValue = a3;
}

- (double)minChartYValue
{
  return self->_minChartYValue;
}

- (void)setMinChartYValue:(double)a3
{
  self->_double minChartYValue = a3;
}

- (NSString)ySeriesTitle
{
  return self->_ySeriesTitle;
}

- (void)setYSeriesTitle:(id)a3
{
}

- (NSString)xSeriesTitle
{
  return self->_xSeriesTitle;
}

- (void)setXSeriesTitle:(id)a3
{
}

- (UIFont)seriesTitleFont
{
  return self->_seriesTitleFont;
}

- (UIColor)highlightedSegmentColor
{
  return self->_highlightedSegmentColor;
}

- (UILabel)ySeriesTitleLabel
{
  return self->_ySeriesTitleLabel;
}

- (void)setYSeriesTitleLabel:(id)a3
{
}

- (UILabel)xSeriesTitleLabel
{
  return self->_xSeriesTitleLabel;
}

- (void)setXSeriesTitleLabel:(id)a3
{
}

- (NSMutableArray)ageBucketBarViews
{
  return self->_ageBucketBarViews;
}

- (void)setAgeBucketBarViews:(id)a3
{
}

- (HKPopulationNormsChartGridView)gridView
{
  return self->_gridView;
}

- (void)setGridView:(id)a3
{
}

- (NSNumber)currentViewWidth
{
  return self->_currentViewWidth;
}

- (void)setCurrentViewWidth:(id)a3
{
}

- (unint64_t)sexSegmentIndex
{
  return self->_sexSegmentIndex;
}

- (void)setSexSegmentIndex:(unint64_t)a3
{
  self->_sexSegmentIndex = a3;
}

- (unint64_t)classificationIndex
{
  return self->_classificationIndex;
}

- (void)setClassificationIndex:(unint64_t)a3
{
  self->_classificationIndex = a3;
}

- (UIView)latestSampleHighlightView
{
  return self->_latestSampleHighlightView;
}

- (void)setLatestSampleHighlightView:(id)a3
{
}

- (NSNumber)ageBucketIndex
{
  return self->_ageBucketIndex;
}

- (void)setAgeBucketIndex:(id)a3
{
}

- (NSNumber)latestSampleValue
{
  return self->_latestSampleValue;
}

- (void)setLatestSampleValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSampleValue, 0);
  objc_storeStrong((id *)&self->_ageBucketIndex, 0);
  objc_storeStrong((id *)&self->_latestSampleHighlightView, 0);
  objc_storeStrong((id *)&self->_currentViewWidth, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_ageBucketBarViews, 0);
  objc_storeStrong((id *)&self->_xSeriesTitleLabel, 0);
  objc_storeStrong((id *)&self->_ySeriesTitleLabel, 0);
  objc_storeStrong((id *)&self->_highlightedSegmentColor, 0);
  objc_storeStrong((id *)&self->_seriesTitleFont, 0);
  objc_storeStrong((id *)&self->_xSeriesTitle, 0);
  objc_storeStrong((id *)&self->_ySeriesTitle, 0);
}

@end