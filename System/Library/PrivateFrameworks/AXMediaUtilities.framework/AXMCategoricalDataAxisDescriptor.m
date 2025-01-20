@interface AXMCategoricalDataAxisDescriptor
- (AXMCategoricalDataAxisDescriptor)initWithAttributedTitle:(id)a3 categoryOrder:(id)a4;
- (AXMCategoricalDataAxisDescriptor)initWithDictionary:(id)a3;
- (AXMCategoricalDataAxisDescriptor)initWithTitle:(id)a3 categoryOrder:(id)a4;
- (BOOL)isCategoricalAxis;
- (NSArray)categoryOrder;
- (NSAttributedString)attributedTitle;
- (NSString)description;
- (NSString)title;
- (double)lowerBound;
- (double)normalizedAxisValueForValue:(id)a3;
- (double)upperBound;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)setAttributedTitle:(id)a3;
- (void)setCategoryOrder:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AXMCategoricalDataAxisDescriptor

- (AXMCategoricalDataAxisDescriptor)initWithTitle:(id)a3 categoryOrder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXMCategoricalDataAxisDescriptor;
  v8 = [(AXMCategoricalDataAxisDescriptor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AXMCategoricalDataAxisDescriptor *)v8 setTitle:v6];
    objc_storeStrong((id *)&v9->_categoryOrder, a4);
  }

  return v9;
}

- (AXMCategoricalDataAxisDescriptor)initWithAttributedTitle:(id)a3 categoryOrder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMCategoricalDataAxisDescriptor;
  v9 = [(AXMCategoricalDataAxisDescriptor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributedTitle, a3);
    objc_storeStrong((id *)&v10->_categoryOrder, a4);
  }

  return v10;
}

- (AXMCategoricalDataAxisDescriptor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"kAXMChartAxisTitleKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 objectForKeyedSubscript:@"kAXMChartAxisTitleKey"];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v8 = [v4 objectForKeyedSubscript:@"kAXMChartAxisTitleKey"];
    id v6 = (void *)[v7 initWithString:v8];
  }
  v9 = [v4 objectForKeyedSubscript:@"kAXMChartCategoryAxisCategoriesKey"];
  v10 = [(AXMCategoricalDataAxisDescriptor *)self initWithAttributedTitle:v6 categoryOrder:v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(AXMCategoricalDataAxisDescriptor *)self title];
  id v6 = [(AXMCategoricalDataAxisDescriptor *)self categoryOrder];
  id v7 = (void *)[v4 initWithTitle:v5 categoryOrder:v6];

  id v8 = [(AXMCategoricalDataAxisDescriptor *)self attributedTitle];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    v10 = [(AXMCategoricalDataAxisDescriptor *)self attributedTitle];
    objc_super v11 = (void *)[v10 copy];
    [v7 setAttributedTitle:v11];
  }
  return v7;
}

- (void)setTitle:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  id v6 = (NSAttributedString *)[[v4 alloc] initWithString:v5];

  attributedTitle = self->_attributedTitle;
  self->_attributedTitle = v6;
}

- (NSString)title
{
  v2 = [(AXMCategoricalDataAxisDescriptor *)self attributedTitle];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (BOOL)isCategoricalAxis
{
  return 1;
}

- (double)lowerBound
{
  return 0.0;
}

- (double)upperBound
{
  v2 = [(AXMCategoricalDataAxisDescriptor *)self categoryOrder];
  double v3 = (double)(unint64_t)[v2 count];

  return v3;
}

- (double)normalizedAxisValueForValue:(id)a3
{
  id v4 = a3;
  id v5 = [(AXMCategoricalDataAxisDescriptor *)self categoryOrder];
  uint64_t v6 = [v5 indexOfObject:v4];

  double v7 = 0.0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(AXMCategoricalDataAxisDescriptor *)self categoryOrder];
    double v7 = (double)v6 / (double)(unint64_t)[v8 count];
  }
  return v7;
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(AXMCategoricalDataAxisDescriptor *)self title];
  [v3 setObject:v4 forKeyedSubscript:@"kAXMChartAxisTitleKey"];

  id v5 = [(AXMCategoricalDataAxisDescriptor *)self categoryOrder];
  [v3 setObject:v5 forKeyedSubscript:@"kAXMChartCategoryAxisCategoriesKey"];

  [v3 setObject:@"categorical" forKeyedSubscript:@"kAXMChartAxisType"];

  return v3;
}

- (NSString)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(AXMCategoricalDataAxisDescriptor *)self title];
  uint64_t v6 = [(AXMCategoricalDataAxisDescriptor *)self categoryOrder];
  double v7 = [v3 stringWithFormat:@"<%@ %p title=%@ order=%@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
}

- (NSArray)categoryOrder
{
  return self->_categoryOrder;
}

- (void)setCategoryOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryOrder, 0);

  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

@end