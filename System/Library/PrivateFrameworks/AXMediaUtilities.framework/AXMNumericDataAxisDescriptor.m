@interface AXMNumericDataAxisDescriptor
- (AXMNumericDataAxisDescriptor)initWithAttributedTitle:(id)a3 lowerBound:(double)a4 upperBound:(double)a5 gridlinePositions:(id)a6 valueDescriptionProvider:(id)a7;
- (AXMNumericDataAxisDescriptor)initWithDictionary:(id)a3;
- (AXMNumericDataAxisDescriptor)initWithTitle:(id)a3 lowerBound:(double)a4 upperBound:(double)a5 gridlinePositions:(id)a6 valueDescriptionProvider:(id)a7;
- (AXMScale)scale;
- (BOOL)isCategoricalAxis;
- (NSArray)gridlinePositions;
- (NSAttributedString)attributedTitle;
- (NSString)description;
- (NSString)title;
- (double)lowerBound;
- (double)normalizedAxisValueForValue:(double)a3;
- (double)upperBound;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)valueDescriptionProvider;
- (int64_t)scaleType;
- (void)_commonInitWithLowerBound:(double)a3 upperBound:(double)a4 gridlinePositions:(id)a5 valueDescriptionProvider:(id)a6;
- (void)setAttributedTitle:(id)a3;
- (void)setGridlinePositions:(id)a3;
- (void)setLowerBound:(double)a3;
- (void)setScale:(id)a3;
- (void)setScaleType:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUpperBound:(double)a3;
- (void)setValueDescriptionProvider:(id)a3;
@end

@implementation AXMNumericDataAxisDescriptor

- (AXMNumericDataAxisDescriptor)initWithTitle:(id)a3 lowerBound:(double)a4 upperBound:(double)a5 gridlinePositions:(id)a6 valueDescriptionProvider:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)AXMNumericDataAxisDescriptor;
  v15 = [(AXMNumericDataAxisDescriptor *)&v18 init];
  v16 = v15;
  if (v15)
  {
    [(AXMNumericDataAxisDescriptor *)v15 setTitle:v12];
    [(AXMNumericDataAxisDescriptor *)v16 _commonInitWithLowerBound:v13 upperBound:v14 gridlinePositions:a4 valueDescriptionProvider:a5];
  }

  return v16;
}

- (AXMNumericDataAxisDescriptor)initWithAttributedTitle:(id)a3 lowerBound:(double)a4 upperBound:(double)a5 gridlinePositions:(id)a6 valueDescriptionProvider:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)AXMNumericDataAxisDescriptor;
  v16 = [(AXMNumericDataAxisDescriptor *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_attributedTitle, a3);
    [(AXMNumericDataAxisDescriptor *)v17 _commonInitWithLowerBound:v14 upperBound:v15 gridlinePositions:a4 valueDescriptionProvider:a5];
  }

  return v17;
}

- (void)_commonInitWithLowerBound:(double)a3 upperBound:(double)a4 gridlinePositions:(id)a5 valueDescriptionProvider:(id)a6
{
  self->_lowerBound = a3;
  self->_upperBound = a4;
  objc_storeStrong((id *)&self->_gridlinePositions, a5);
  id v12 = a5;
  id v9 = a6;
  v10 = (void *)[v9 copy];

  id valueDescriptionProvider = self->_valueDescriptionProvider;
  self->_id valueDescriptionProvider = v10;
}

- (AXMNumericDataAxisDescriptor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"kAXMChartAxisTitleKey"];
  v6 = objc_opt_new();
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v5;
    }
    else {
      id v7 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
    }
    id v8 = v7;

    v6 = v8;
  }
  id v9 = [v4 objectForKeyedSubscript:@"kAXMChartNumericAxisScaleTypeKey"];
  uint64_t v10 = [v9 integerValue];

  v11 = [v4 objectForKeyedSubscript:@"kAXMChartNumericAxisLowerBoundKey"];
  [v11 doubleValue];
  double v13 = v12;

  id v14 = [v4 objectForKeyedSubscript:@"kAXMChartNumericAxisUpperBoundKey"];
  [v14 doubleValue];
  double v16 = v15;

  v17 = [v4 objectForKeyedSubscript:@"kAXMChartNumericAxisGridlinePositionsKey"];

  objc_super v18 = [(AXMNumericDataAxisDescriptor *)self initWithAttributedTitle:v6 lowerBound:v17 upperBound:&__block_literal_global_26 gridlinePositions:v13 valueDescriptionProvider:v16];
  [(AXMNumericDataAxisDescriptor *)v18 setScaleType:v10];

  return v18;
}

__CFString *__51__AXMNumericDataAxisDescriptor_initWithDictionary___block_invoke()
{
  return &stru_1F0E72D10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(AXMNumericDataAxisDescriptor *)self title];
  [(AXMNumericDataAxisDescriptor *)self lowerBound];
  double v7 = v6;
  [(AXMNumericDataAxisDescriptor *)self upperBound];
  double v9 = v8;
  uint64_t v10 = [(AXMNumericDataAxisDescriptor *)self gridlinePositions];
  v11 = [(AXMNumericDataAxisDescriptor *)self valueDescriptionProvider];
  double v12 = (void *)[v11 copy];
  double v13 = (void *)[v4 initWithTitle:v5 lowerBound:v10 upperBound:v12 gridlinePositions:v7 valueDescriptionProvider:v9];

  id v14 = [(AXMNumericDataAxisDescriptor *)self attributedTitle];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    double v16 = [(AXMNumericDataAxisDescriptor *)self attributedTitle];
    v17 = (void *)[v16 copy];
    [v13 setAttributedTitle:v17];
  }
  return v13;
}

- (void)setTitle:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  double v6 = (NSAttributedString *)[[v4 alloc] initWithString:v5];

  attributedTitle = self->_attributedTitle;
  self->_attributedTitle = v6;
}

- (NSString)title
{
  v2 = [(AXMNumericDataAxisDescriptor *)self attributedTitle];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (BOOL)isCategoricalAxis
{
  return 0;
}

- (double)normalizedAxisValueForValue:(double)a3
{
  [(AXMNumericDataAxisDescriptor *)self upperBound];
  double v6 = v5;
  [(AXMNumericDataAxisDescriptor *)self lowerBound];
  double v8 = v6 - v7;
  [(AXMNumericDataAxisDescriptor *)self lowerBound];
  return (a3 - v9) / v8;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(AXMNumericDataAxisDescriptor *)self title];
  [v3 setObject:v4 forKeyedSubscript:@"kAXMChartAxisTitleKey"];

  double v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXMNumericDataAxisDescriptor scaleType](self, "scaleType"));
  [v3 setObject:v5 forKeyedSubscript:@"kAXMChartNumericAxisScaleTypeKey"];

  double v6 = NSNumber;
  [(AXMNumericDataAxisDescriptor *)self lowerBound];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:@"kAXMChartNumericAxisLowerBoundKey"];

  double v8 = NSNumber;
  [(AXMNumericDataAxisDescriptor *)self upperBound];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:@"kAXMChartNumericAxisUpperBoundKey"];

  [v3 setObject:@"numeric" forKeyedSubscript:@"kAXMChartAxisType"];

  return v3;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(AXMNumericDataAxisDescriptor *)self title];
  double v6 = NSNumber;
  [(AXMNumericDataAxisDescriptor *)self lowerBound];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  double v8 = NSNumber;
  [(AXMNumericDataAxisDescriptor *)self upperBound];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v10 = [(AXMNumericDataAxisDescriptor *)self gridlinePositions];
  v11 = [v3 stringWithFormat:@"<%@ %p title=%@ bounds=[%@, %@], gridlines=%@>", v4, self, v5, v7, v9, v10];

  return (NSString *)v11;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
}

- (int64_t)scaleType
{
  return self->_scaleType;
}

- (void)setScaleType:(int64_t)a3
{
  self->_scaleType = a3;
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(double)a3
{
  self->_lowerBound = a3;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(double)a3
{
  self->_upperBound = a3;
}

- (id)valueDescriptionProvider
{
  return self->_valueDescriptionProvider;
}

- (void)setValueDescriptionProvider:(id)a3
{
}

- (NSArray)gridlinePositions
{
  return self->_gridlinePositions;
}

- (void)setGridlinePositions:(id)a3
{
}

- (AXMScale)scale
{
  return self->_scale;
}

- (void)setScale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_gridlinePositions, 0);
  objc_storeStrong(&self->_valueDescriptionProvider, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end