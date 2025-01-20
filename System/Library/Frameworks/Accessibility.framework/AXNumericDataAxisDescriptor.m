@interface AXNumericDataAxisDescriptor
- (AXNumericDataAxisDescriptor)initWithAttributedTitle:(NSAttributedString *)attributedTitle lowerBound:(double)lowerbound upperBound:(double)upperBound gridlinePositions:(NSArray *)gridlinePositions valueDescriptionProvider:(void *)valueDescriptionProvider;
- (AXNumericDataAxisDescriptor)initWithDictionary:(id)a3;
- (AXNumericDataAxisDescriptor)initWithTitle:(NSString *)title lowerBound:(double)lowerbound upperBound:(double)upperBound gridlinePositions:(NSArray *)gridlinePositions valueDescriptionProvider:(void *)valueDescriptionProvider;
- (AXNumericDataAxisDescriptorScale)scaleType;
- (AXScale)scale;
- (NSArray)gridlinePositions;
- (NSAttributedString)attributedTitle;
- (NSString)description;
- (NSString)title;
- (double)lowerBound;
- (double)upperBound;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)_commonInitWithLowerBound:(double)a3 upperBound:(double)a4 gridlinePositions:(id)a5 valueDescriptionProvider:(id)a6;
- (void)setAttributedTitle:(id)a3;
- (void)setGridlinePositions:(NSArray *)gridlinePositions;
- (void)setLowerBound:(double)lowerBound;
- (void)setScale:(id)a3;
- (void)setScaleType:(AXNumericDataAxisDescriptorScale)scaleType;
- (void)setTitle:(id)a3;
- (void)setUpperBound:(double)upperBound;
- (void)setValueDescriptionProvider:(void *)valueDescriptionProvider;
- (void)valueDescriptionProvider;
@end

@implementation AXNumericDataAxisDescriptor

- (AXNumericDataAxisDescriptor)initWithTitle:(NSString *)title lowerBound:(double)lowerbound upperBound:(double)upperBound gridlinePositions:(NSArray *)gridlinePositions valueDescriptionProvider:(void *)valueDescriptionProvider
{
  v12 = title;
  v13 = gridlinePositions;
  v14 = valueDescriptionProvider;
  v19.receiver = self;
  v19.super_class = (Class)AXNumericDataAxisDescriptor;
  v15 = [(AXNumericDataAxisDescriptor *)&v19 init];
  v16 = v15;
  if (v15)
  {
    if (v12) {
      v17 = (__CFString *)v12;
    }
    else {
      v17 = &stru_26C49B9E8;
    }
    [(AXNumericDataAxisDescriptor *)v15 setTitle:v17];
    [(AXNumericDataAxisDescriptor *)v16 _commonInitWithLowerBound:v13 upperBound:v14 gridlinePositions:lowerbound valueDescriptionProvider:upperBound];
  }

  return v16;
}

- (AXNumericDataAxisDescriptor)initWithAttributedTitle:(NSAttributedString *)attributedTitle lowerBound:(double)lowerbound upperBound:(double)upperBound gridlinePositions:(NSArray *)gridlinePositions valueDescriptionProvider:(void *)valueDescriptionProvider
{
  v12 = attributedTitle;
  v13 = gridlinePositions;
  v14 = valueDescriptionProvider;
  v19.receiver = self;
  v19.super_class = (Class)AXNumericDataAxisDescriptor;
  v15 = [(AXNumericDataAxisDescriptor *)&v19 init];
  if (v15)
  {
    if (v12) {
      v16 = v12;
    }
    else {
      v16 = (NSAttributedString *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26C49B9E8];
    }
    v17 = v15->_attributedTitle;
    v15->_attributedTitle = v16;

    [(AXNumericDataAxisDescriptor *)v15 _commonInitWithLowerBound:v13 upperBound:v14 gridlinePositions:lowerbound valueDescriptionProvider:upperBound];
  }

  return v15;
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

- (AXNumericDataAxisDescriptor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = getkAXMChartAxisTitleKey();
  v6 = [v4 objectForKeyedSubscript:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = getkAXMChartAxisTitleKey();
    v8 = [v4 objectForKeyedSubscript:v7];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x263F086A0]);
    v7 = getkAXMChartAxisTitleKey();
    v10 = [v4 objectForKeyedSubscript:v7];
    v8 = (void *)[v9 initWithString:v10];
  }
  v11 = getkAXMChartNumericAxisScaleTypeKey();
  id v12 = [v4 objectForKeyedSubscript:v11];
  uint64_t v13 = [v12 integerValue];

  v14 = getkAXMChartNumericAxisLowerBoundKey();
  v15 = [v4 objectForKeyedSubscript:v14];
  [v15 doubleValue];
  double v17 = v16;

  v18 = getkAXMChartNumericAxisUpperBoundKey();
  objc_super v19 = [v4 objectForKeyedSubscript:v18];
  [v19 doubleValue];
  double v21 = v20;

  v22 = getkAXMChartNumericAxisGridlinePositionsKey();
  v23 = [v4 objectForKeyedSubscript:v22];

  v24 = [(AXNumericDataAxisDescriptor *)self initWithAttributedTitle:v8 lowerBound:v23 upperBound:&__block_literal_global_0 gridlinePositions:v17 valueDescriptionProvider:v21];
  [(AXNumericDataAxisDescriptor *)v24 setScaleType:v13];

  return v24;
}

__CFString *__50__AXNumericDataAxisDescriptor_initWithDictionary___block_invoke()
{
  return &stru_26C49B9E8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(AXNumericDataAxisDescriptor *)self title];
  [(AXNumericDataAxisDescriptor *)self lowerBound];
  double v7 = v6;
  [(AXNumericDataAxisDescriptor *)self upperBound];
  double v9 = v8;
  v10 = [(AXNumericDataAxisDescriptor *)self gridlinePositions];
  v11 = [(AXNumericDataAxisDescriptor *)self valueDescriptionProvider];
  id v12 = (void *)[v11 copy];
  uint64_t v13 = (void *)[v4 initWithTitle:v5 lowerBound:v10 upperBound:v12 gridlinePositions:v7 valueDescriptionProvider:v9];

  v14 = [(AXNumericDataAxisDescriptor *)self attributedTitle];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    double v16 = [(AXNumericDataAxisDescriptor *)self attributedTitle];
    double v17 = (void *)[v16 copy];
    [v13 setAttributedTitle:v17];
  }
  return v13;
}

- (void)setTitle:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F086A0];
  id v5 = a3;
  double v6 = (NSAttributedString *)[[v4 alloc] initWithString:v5];

  attributedTitle = self->_attributedTitle;
  self->_attributedTitle = v6;
}

- (NSString)title
{
  v2 = [(AXNumericDataAxisDescriptor *)self attributedTitle];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(AXNumericDataAxisDescriptor *)self attributedTitle];
  id v5 = getkAXMChartAxisTitleKey();
  [v3 setObject:v4 forKeyedSubscript:v5];

  double v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXNumericDataAxisDescriptor scaleType](self, "scaleType"));
  double v7 = getkAXMChartNumericAxisScaleTypeKey();
  [v3 setObject:v6 forKeyedSubscript:v7];

  double v8 = NSNumber;
  [(AXNumericDataAxisDescriptor *)self lowerBound];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  v10 = getkAXMChartNumericAxisLowerBoundKey();
  [v3 setObject:v9 forKeyedSubscript:v10];

  v11 = NSNumber;
  [(AXNumericDataAxisDescriptor *)self upperBound];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  uint64_t v13 = getkAXMChartNumericAxisUpperBoundKey();
  [v3 setObject:v12 forKeyedSubscript:v13];

  v14 = getkAXMChartAxisTypeNumeric();
  uint64_t v15 = getkAXMChartAxisTypeKey();
  [v3 setObject:v14 forKeyedSubscript:v15];

  double v16 = [(AXNumericDataAxisDescriptor *)self gridlinePositions];
  double v17 = getkAXMChartNumericAxisGridlinePositionsKey();
  [v3 setObject:v16 forKeyedSubscript:v17];

  return v3;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(AXNumericDataAxisDescriptor *)self title];
  double v6 = NSNumber;
  [(AXNumericDataAxisDescriptor *)self lowerBound];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  double v8 = NSNumber;
  [(AXNumericDataAxisDescriptor *)self upperBound];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  v10 = [(AXNumericDataAxisDescriptor *)self gridlinePositions];
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

- (AXNumericDataAxisDescriptorScale)scaleType
{
  return self->_scaleType;
}

- (void)setScaleType:(AXNumericDataAxisDescriptorScale)scaleType
{
  self->_scaleType = scaleType;
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(double)lowerBound
{
  self->_lowerBound = lowerBound;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(double)upperBound
{
  self->_upperBound = upperBound;
}

- (void)valueDescriptionProvider
{
  return self->_valueDescriptionProvider;
}

- (void)setValueDescriptionProvider:(void *)valueDescriptionProvider
{
}

- (NSArray)gridlinePositions
{
  return self->_gridlinePositions;
}

- (void)setGridlinePositions:(NSArray *)gridlinePositions
{
}

- (AXScale)scale
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