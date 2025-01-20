@interface HKPopulationNormsAxisView
- (HKPopulationNormsAxisView)initWithOrientation:(int64_t)a3 axisLabels:(id)a4;
- (NSArray)axisLabelValues;
- (NSDictionary)axisLabelAttributes;
- (NSMutableArray)axisLabelViews;
- (double)minorDimensionSize;
- (int64_t)orientation;
- (void)layoutSubviews;
- (void)setAxisLabelAttributes:(id)a3;
- (void)setAxisLabelValues:(id)a3;
- (void)setAxisLabelViews:(id)a3;
- (void)setOrientation:(int64_t)a3;
@end

@implementation HKPopulationNormsAxisView

- (HKPopulationNormsAxisView)initWithOrientation:(int64_t)a3 axisLabels:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HKPopulationNormsAxisView;
  v9 = -[HKPopulationNormsAxisView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (v9)
  {
    v9->_orientation = a3;
    p_axisLabelValues = (id *)&v9->_axisLabelValues;
    objc_storeStrong((id *)&v9->_axisLabelValues, a4);
    if (!v10->_orientation && (unint64_t)[*p_axisLabelValues count] <= 1)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v10, @"HKPopulationNormsAxisView.m", 153, @"Invalid parameter not satisfying: %@", @"_axisLabelValues.count > 1" object file lineNumber description];
    }
    v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
    uint64_t v25 = *MEMORY[0x1E4FB06F8];
    v26[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    axisLabelAttributes = v10->_axisLabelAttributes;
    v10->_axisLabelAttributes = (NSDictionary *)v13;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    axisLabelViews = v10->_axisLabelViews;
    v10->_axisLabelViews = (NSMutableArray *)v15;

    if ([v8 count])
    {
      unint64_t v17 = 0;
      do
      {
        v18 = [_HKPopulationNormsAxisLabelView alloc];
        v19 = [*p_axisLabelValues objectAtIndexedSubscript:v17];
        v20 = [(_HKPopulationNormsAxisLabelView *)v18 initWithLabel:v19];

        [(_HKPopulationNormsAxisLabelView *)v20 setFont:v12];
        v21 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisLabelColor");
        [(_HKPopulationNormsAxisLabelView *)v20 setTextColor:v21];

        [(HKPopulationNormsAxisView *)v10 addSubview:v20];
        [(NSMutableArray *)v10->_axisLabelViews addObject:v20];

        ++v17;
      }
      while ([v8 count] > v17);
    }
  }
  return v10;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)HKPopulationNormsAxisView;
  [(HKPopulationNormsAxisView *)&v21 layoutSubviews];
  int64_t orientation = self->_orientation;
  v4 = [(HKPopulationNormsAxisView *)self layer];
  [v4 frame];
  double Height = CGRectGetHeight(v22);

  v6 = [(HKPopulationNormsAxisView *)self layer];
  [v6 frame];
  double Width = CGRectGetWidth(v23);

  if (!orientation) {
    double Width = Height;
  }
  uint64_t v8 = [(NSMutableArray *)self->_axisLabelViews count];
  if ([(NSMutableArray *)self->_axisLabelViews count])
  {
    unint64_t v9 = 0;
    double v10 = Width / (double)((__PAIR128__(v8, orientation) - 1) >> 64);
    do
    {
      v11 = [(NSMutableArray *)self->_axisLabelViews objectAtIndexedSubscript:v9];
      double v12 = v10 * (double)(int)v9;
      uint64_t v13 = [v11 axisLabel];
      v14 = [v13 stringRepresentation];
      [v14 sizeWithAttributes:self->_axisLabelAttributes];
      double v16 = v15;
      double v18 = v17;

      double v19 = v12 + 5.0;
      if (!orientation) {
        double v19 = 5.0;
      }
      double v20 = Height - v12 + v18 * -0.5;
      if (orientation) {
        double v20 = 6.0;
      }
      objc_msgSend(v11, "setFrame:", v19, v20, v16, v18);
      [v11 setNeedsLayout];

      ++v9;
    }
    while ([(NSMutableArray *)self->_axisLabelViews count] > v9);
  }
}

- (double)minorDimensionSize
{
  int64_t orientation = self->_orientation;
  if (![(NSMutableArray *)self->_axisLabelViews count]) {
    return 0.0;
  }
  unint64_t v4 = 0;
  double v5 = 0.0;
  do
  {
    v6 = [(NSMutableArray *)self->_axisLabelViews objectAtIndexedSubscript:v4];
    v7 = [v6 axisLabel];
    uint64_t v8 = [v7 stringRepresentation];
    [v8 sizeWithAttributes:self->_axisLabelAttributes];
    double v10 = v9;
    double v12 = v11;

    double v13 = v10 + 5.0;
    if (orientation) {
      double v13 = v12 + 6.0;
    }
    double v5 = fmax(v5, v13);

    ++v4;
  }
  while ([(NSMutableArray *)self->_axisLabelViews count] > v4);
  return v5;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_int64_t orientation = a3;
}

- (NSArray)axisLabelValues
{
  return self->_axisLabelValues;
}

- (void)setAxisLabelValues:(id)a3
{
}

- (NSDictionary)axisLabelAttributes
{
  return self->_axisLabelAttributes;
}

- (void)setAxisLabelAttributes:(id)a3
{
}

- (NSMutableArray)axisLabelViews
{
  return self->_axisLabelViews;
}

- (void)setAxisLabelViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisLabelViews, 0);
  objc_storeStrong((id *)&self->_axisLabelAttributes, 0);
  objc_storeStrong((id *)&self->_axisLabelValues, 0);
}

@end