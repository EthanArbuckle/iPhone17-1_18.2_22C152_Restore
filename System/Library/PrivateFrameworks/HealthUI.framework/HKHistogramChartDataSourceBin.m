@interface HKHistogramChartDataSourceBin
- (HKHistogramChartDataSourceBin)init;
- (HKHistogramChartDataSourceBin)initWithValues:(id)a3;
- (NSArray)sortedValues;
- (NSArray)values;
- (NSNumber)averageValue;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)sumValue;
- (unint64_t)count;
- (void)addValue:(id)a3;
@end

@implementation HKHistogramChartDataSourceBin

- (NSArray)values
{
  v2 = (void *)[(NSMutableArray *)self->_backingValues copy];
  return (NSArray *)v2;
}

- (NSArray)sortedValues
{
  return (NSArray *)[(NSMutableArray *)self->_backingValues sortedArrayUsingComparator:&__block_literal_global_581];
}

uint64_t __45__HKHistogramChartDataSourceBin_sortedValues__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_backingValues count];
}

- (NSNumber)sumValue
{
  v2 = [(NSMutableArray *)self->_backingValues valueForKeyPath:@"@sum.doubleValue"];
  v3 = v2;
  if (!v2) {
    v2 = &unk_1F3C20158;
  }
  v4 = v2;

  return v4;
}

- (NSNumber)averageValue
{
  v2 = [(NSMutableArray *)self->_backingValues valueForKeyPath:@"@avg.doubleValue"];
  v3 = v2;
  if (!v2) {
    v2 = &unk_1F3C20158;
  }
  v4 = v2;

  return v4;
}

- (NSNumber)minimumValue
{
  v2 = [(NSMutableArray *)self->_backingValues valueForKeyPath:@"@min.doubleValue"];
  v3 = v2;
  if (!v2) {
    v2 = &unk_1F3C20158;
  }
  v4 = v2;

  return v4;
}

- (NSNumber)maximumValue
{
  v2 = [(NSMutableArray *)self->_backingValues valueForKeyPath:@"@max.doubleValue"];
  v3 = v2;
  if (!v2) {
    v2 = &unk_1F3C20158;
  }
  v4 = v2;

  return v4;
}

- (HKHistogramChartDataSourceBin)init
{
  return [(HKHistogramChartDataSourceBin *)self initWithValues:MEMORY[0x1E4F1CBF0]];
}

- (HKHistogramChartDataSourceBin)initWithValues:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHistogramChartDataSourceBin;
  v5 = [(HKHistogramChartDataSourceBin *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
    backingValues = v5->_backingValues;
    v5->_backingValues = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)addValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end