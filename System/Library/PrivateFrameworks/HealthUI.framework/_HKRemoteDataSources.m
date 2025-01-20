@interface _HKRemoteDataSources
- (BOOL)supportsChartQueryDataGeneration;
- (_HKRemoteDataSources)init;
- (id)allDataSources;
- (id)dataSourceForTimeScope:(int64_t)a3;
- (id)initSupportsChartQueryDataGeneration:(BOOL)a3;
- (void)setDataSource:(id)a3 forTimeScope:(int64_t)a4;
- (void)setSupportsChartQueryDataGeneration:(BOOL)a3;
@end

@implementation _HKRemoteDataSources

- (_HKRemoteDataSources)init
{
  v6.receiver = self;
  v6.super_class = (Class)_HKRemoteDataSources;
  v2 = [(_HKRemoteDataSources *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dataSources = v2->_dataSources;
    v2->_dataSources = v3;

    v2->_supportsChartQueryDataGeneration = 0;
  }
  return v2;
}

- (id)initSupportsChartQueryDataGeneration:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_HKRemoteDataSources;
  v4 = [(_HKRemoteDataSources *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dataSources = v4->_dataSources;
    v4->_dataSources = v5;

    v4->_supportsChartQueryDataGeneration = a3;
  }
  return v4;
}

- (id)dataSourceForTimeScope:(int64_t)a3
{
  dataSources = self->_dataSources;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)dataSources objectForKey:v4];

  return v5;
}

- (void)setDataSource:(id)a3 forTimeScope:(int64_t)a4
{
  dataSources = self->_dataSources;
  objc_super v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  [(NSMutableDictionary *)dataSources setObject:v7 forKeyedSubscript:v8];
}

- (id)allDataSources
{
  return (id)[(NSMutableDictionary *)self->_dataSources allValues];
}

- (BOOL)supportsChartQueryDataGeneration
{
  return self->_supportsChartQueryDataGeneration;
}

- (void)setSupportsChartQueryDataGeneration:(BOOL)a3
{
  self->_supportsChartQueryDataGeneration = a3;
}

- (void).cxx_destruct
{
}

@end