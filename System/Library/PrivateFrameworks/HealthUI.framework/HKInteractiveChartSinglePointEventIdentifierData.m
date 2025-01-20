@interface HKInteractiveChartSinglePointEventIdentifierData
- (NSArray)identifiers;
- (id)description;
- (void)setIdentifiers:(id)a3;
@end

@implementation HKInteractiveChartSinglePointEventIdentifierData

- (id)description
{
  v3 = [(HKInteractiveChartSinglePointEventIdentifierData *)self identifiers];

  if (v3)
  {
    v4 = NSString;
    v11.receiver = self;
    v11.super_class = (Class)HKInteractiveChartSinglePointEventIdentifierData;
    v5 = [(HKInteractiveChartSinglePointData *)&v11 description];
    v6 = [(HKInteractiveChartSinglePointEventIdentifierData *)self identifiers];
    v7 = [v6 description];
    v8 = [v4 stringWithFormat:@"%@, identifiers: %@", v5, v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HKInteractiveChartSinglePointEventIdentifierData;
    v8 = [(HKInteractiveChartSinglePointData *)&v10 description];
  }
  return v8;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end