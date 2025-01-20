@interface TIAggdReporterMock
- (NSMutableDictionary)distributions;
- (NSMutableDictionary)scalars;
- (TIAggdReporterMock)init;
- (id)getDistributionObject:(id)a3;
- (id)toDictionary;
- (id)toJsonString;
- (int)commit;
- (int64_t)_getScalar:(id)a3;
- (int64_t)getScalar:(id)a3;
- (void)_setScalar:(id)a3 withValue:(int64_t)a4;
- (void)addValue:(int64_t)a3 forKey:(id)a4;
- (void)clear;
- (void)clearDistributionKey:(id)a3;
- (void)clearScalarKey:(id)a3;
- (void)decrementKey:(id)a3;
- (void)incrementKey:(id)a3;
- (void)pushValue:(double)a3 forKey:(id)a4;
- (void)setScalar:(id)a3 withValue:(int64_t)a4;
- (void)setValue:(double)a3 forDistributionKey:(id)a4;
- (void)setValue:(int64_t)a3 forScalarKey:(id)a4;
- (void)subtractValue:(int64_t)a3 forKey:(id)a4;
@end

@implementation TIAggdReporterMock

- (TIAggdReporterMock)init
{
  v8.receiver = self;
  v8.super_class = (Class)TIAggdReporterMock;
  v2 = [(TIAggdReporterMock *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    scalars = v2->_scalars;
    v2->_scalars = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    distributions = v2->_distributions;
    v2->_distributions = v5;
  }
  return v2;
}

- (void)clear
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(TIAggdReporterMock *)obj scalars];
  [v2 removeAllObjects];

  v3 = [(TIAggdReporterMock *)obj distributions];
  [v3 removeAllObjects];

  objc_sync_exit(obj);
}

- (id)toDictionary
{
  v2 = self;
  objc_sync_enter(v2);
  v7[0] = @"scalars";
  v3 = [(TIAggdReporterMock *)v2 scalars];
  v7[1] = @"distributions";
  v8[0] = v3;
  v4 = [(TIAggdReporterMock *)v2 distributions];
  v8[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  objc_sync_exit(v2);

  return v5;
}

- (id)toJsonString
{
  v2 = [(TIAggdReporterMock *)self toDictionary];
  uint64_t v6 = 0;
  v3 = +[NSJSONSerialization dataWithJSONObject:v2 options:1 error:&v6];

  id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];

  return v4;
}

- (int)commit
{
  return 0;
}

- (int64_t)getScalar:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  int64_t v6 = [(TIAggdReporterMock *)v5 _getScalar:v4];
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)_getScalar:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(TIAggdReporterMock *)self scalars],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:v4],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = [(TIAggdReporterMock *)self scalars];
    objc_super v8 = [v7 objectForKeyedSubscript:v4];
    id v9 = [v8 longLongValue];
  }
  else
  {
    id v9 = 0;
  }

  return (int64_t)v9;
}

- (void)setScalar:(id)a3 withValue:(int64_t)a4
{
  id v7 = a3;
  int64_t v6 = self;
  objc_sync_enter(v6);
  [(TIAggdReporterMock *)v6 _setScalar:v7 withValue:a4];
  objc_sync_exit(v6);
}

- (void)_setScalar:(id)a3 withValue:(int64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    id v8 = [(TIAggdReporterMock *)self scalars];
    id v7 = +[NSNumber numberWithInt:a4];
    [v8 setObject:v7 forKey:v6];
  }
}

- (void)clearScalarKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    id v6 = [(TIAggdReporterMock *)v5 scalars];
    [v6 removeObjectForKey:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)setValue:(int64_t)a3 forScalarKey:(id)a4
{
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  [(TIAggdReporterMock *)v6 _setScalar:v7 withValue:a3];
  objc_sync_exit(v6);
}

- (void)addValue:(int64_t)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  [(TIAggdReporterMock *)v6 _setScalar:v7 withValue:(char *)[(TIAggdReporterMock *)v6 getScalar:v7] + a3];
  objc_sync_exit(v6);
}

- (void)subtractValue:(int64_t)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  [(TIAggdReporterMock *)v6 _setScalar:v7 withValue:(char *)[(TIAggdReporterMock *)v6 getScalar:v7] - a3];
  objc_sync_exit(v6);
}

- (void)incrementKey:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(TIAggdReporterMock *)v4 _setScalar:v5 withValue:(char *)[(TIAggdReporterMock *)v4 getScalar:v5] + 1];
  objc_sync_exit(v4);
}

- (void)decrementKey:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(TIAggdReporterMock *)v4 _setScalar:v5 withValue:(char *)[(TIAggdReporterMock *)v4 getScalar:v5] - 1];
  objc_sync_exit(v4);
}

- (void)clearDistributionKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(TIAggdReporterMock *)v5 distributions];
    [v6 removeObjectForKey:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)setValue:(double)a3 forDistributionKey:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    id v8 = [(TIAggdReporterMock *)v7 distributions];
    id v9 = +[NSNumber numberWithDouble:a3];
    v12 = v9;
    v10 = +[NSArray arrayWithObjects:&v12 count:1];
    v11 = +[NSMutableArray arrayWithArray:v10];
    [v8 setObject:v11 forKey:v6];

    objc_sync_exit(v7);
  }
}

- (void)pushValue:(double)a3 forKey:(id)a4
{
  id v11 = a4;
  if (v11)
  {
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = [(TIAggdReporterMock *)v6 distributions];
    id v8 = [v7 objectForKeyedSubscript:v11];

    if (!v8)
    {
      id v8 = +[NSMutableArray arrayWithArray:&__NSArray0__struct];
      id v9 = [(TIAggdReporterMock *)v6 distributions];
      [v9 setObject:v8 forKey:v11];
    }
    v10 = +[NSNumber numberWithDouble:a3];
    [v8 addObject:v10];

    objc_sync_exit(v6);
  }
}

- (id)getDistributionObject:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(TIAggdReporterMock *)v5 distributions];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);

  return v7;
}

- (NSMutableDictionary)scalars
{
  return self->_scalars;
}

- (NSMutableDictionary)distributions
{
  return self->_distributions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributions, 0);

  objc_storeStrong((id *)&self->_scalars, 0);
}

@end