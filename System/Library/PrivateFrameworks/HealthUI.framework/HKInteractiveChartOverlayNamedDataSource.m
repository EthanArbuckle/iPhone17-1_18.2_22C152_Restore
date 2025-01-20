@interface HKInteractiveChartOverlayNamedDataSource
- (HKChartCacheDataSource)dataSource;
- (HKInteractiveChartOverlayNamedDataSource)initWithDataSource:(id)a3 named:(id)a4 withContextTitleForTimeScope:(id)a5;
- (NSString)name;
- (id)contextTitleForTimeScope;
- (void)setContextTitleForTimeScope:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setName:(id)a3;
@end

@implementation HKInteractiveChartOverlayNamedDataSource

- (HKInteractiveChartOverlayNamedDataSource)initWithDataSource:(id)a3 named:(id)a4 withContextTitleForTimeScope:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKInteractiveChartOverlayNamedDataSource;
  v11 = [(HKInteractiveChartOverlayNamedDataSource *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(HKInteractiveChartOverlayNamedDataSource *)v11 setContextTitleForTimeScope:v10];
    [(HKInteractiveChartOverlayNamedDataSource *)v12 setName:v9];
    [(HKInteractiveChartOverlayNamedDataSource *)v12 setDataSource:v8];
  }

  return v12;
}

- (HKChartCacheDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (id)contextTitleForTimeScope
{
  return self->_contextTitleForTimeScope;
}

- (void)setContextTitleForTimeScope:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contextTitleForTimeScope, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end