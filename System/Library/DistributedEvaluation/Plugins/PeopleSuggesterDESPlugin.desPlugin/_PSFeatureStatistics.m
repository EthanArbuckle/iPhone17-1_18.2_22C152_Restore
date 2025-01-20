@interface _PSFeatureStatistics
- (NSDictionary)percentiles;
- (NSMutableArray)list;
- (_PSFeatureStatistics)initWithList:(id)a3;
- (double)avg;
- (double)max;
- (double)min;
- (double)mode;
- (double)stdev;
- (void)addValue:(id)a3;
- (void)calculateStats;
- (void)setAvg:(double)a3;
- (void)setList:(id)a3;
- (void)setMax:(double)a3;
- (void)setMin:(double)a3;
- (void)setMode:(double)a3;
- (void)setPercentiles:(id)a3;
- (void)setStdev:(double)a3;
@end

@implementation _PSFeatureStatistics

- (_PSFeatureStatistics)initWithList:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PSFeatureStatistics;
  v5 = [(_PSFeatureStatistics *)&v8 init];
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithArray:v4];
    [(_PSFeatureStatistics *)v5 setList:v6];

    [(_PSFeatureStatistics *)v5 calculateStats];
  }

  return v5;
}

- (void)calculateStats
{
  double v3 = 0.0;
  [(_PSFeatureStatistics *)self setMax:0.0];
  [(_PSFeatureStatistics *)self setMin:100.0];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = [(_PSFeatureStatistics *)self list];
  id v5 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  double v6 = 0.0;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v63;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v63 != v8) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v62 + 1) + 8 * i) doubleValue];
        double v11 = v10;
        [(_PSFeatureStatistics *)self max];
        if (v11 > v12) {
          [(_PSFeatureStatistics *)self setMax:v11];
        }
        [(_PSFeatureStatistics *)self min];
        if (v11 < v13) {
          [(_PSFeatureStatistics *)self setMin:v11];
        }
        v14 = +[NSString stringWithFormat:@"%.01f", *(void *)&v11];
        v15 = [v4 valueForKey:v14];

        if (v15)
        {
          v16 = [v4 objectForKeyedSubscript:v14];
          v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v16 intValue] + 1);
          [v4 setObject:v17 forKeyedSubscript:v14];
        }
        else
        {
          v16 = +[NSNumber numberWithInt:1];
          [v4 setValue:v16 forKey:v14];
        }
        double v6 = v6 + v11;
        double v3 = v3 + v11 * v11;
      }
      id v7 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v7);
  }

  [(_PSFeatureStatistics *)self setMode:0.0];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v18 = v4;
  id v19 = [v18 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v19)
  {
    id v20 = v19;
    signed int v21 = 0;
    uint64_t v22 = *(void *)v59;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v59 != v22) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
        v25 = [v18 valueForKey:v24];
        signed int v26 = [v25 intValue];

        if (v26 > v21)
        {
          [v24 doubleValue];
          -[_PSFeatureStatistics setMode:](self, "setMode:");
          signed int v21 = v26;
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v20);
  }

  v27 = [(_PSFeatureStatistics *)self list];
  id v28 = [v27 count];

  if (!v28)
  {
    [(_PSFeatureStatistics *)self setMax:0.0];
    [(_PSFeatureStatistics *)self setMin:0.0];
  }
  [(_PSFeatureStatistics *)self setAvg:0.0];
  [(_PSFeatureStatistics *)self setStdev:0.0];
  v29 = [(_PSFeatureStatistics *)self list];
  id v30 = [v29 count];

  if (v30)
  {
    v31 = [(_PSFeatureStatistics *)self list];
    -[_PSFeatureStatistics setAvg:](self, "setAvg:", v6 / (double)(unint64_t)[v31 count]);

    v32 = [(_PSFeatureStatistics *)self list];
    double v33 = v3 - v6 * v6 / (double)(unint64_t)[v32 count];
    v34 = [(_PSFeatureStatistics *)self list];
    double v35 = v33 / (double)((unint64_t)[v34 count] - 1);

    [(_PSFeatureStatistics *)self setStdev:sqrt(v35)];
  }
  v36 = [(_PSFeatureStatistics *)self list];
  v37 = [v36 sortedArrayUsingSelector:"compare:"];
  id v38 = [v37 mutableCopy];
  [(_PSFeatureStatistics *)self setList:v38];

  id v39 = objc_alloc_init((Class)NSMutableDictionary);
  v40 = [(_PSFeatureStatistics *)self list];
  id v41 = [v40 count];

  if (v41)
  {
    v42 = [(_PSFeatureStatistics *)self list];
    v43 = [(_PSFeatureStatistics *)self list];
    v44 = objc_msgSend(v42, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v43, "count") * 0.1) + -1.0));
    [v39 setObject:v44 forKeyedSubscript:@"10%"];

    v45 = [(_PSFeatureStatistics *)self list];
    v46 = [(_PSFeatureStatistics *)self list];
    v47 = objc_msgSend(v45, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v46, "count") * 0.25) + -1.0));
    [v39 setObject:v47 forKeyedSubscript:@"25%"];

    v48 = [(_PSFeatureStatistics *)self list];
    v49 = [(_PSFeatureStatistics *)self list];
    v50 = objc_msgSend(v48, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v49, "count") * 0.5) + -1.0));
    [v39 setObject:v50 forKeyedSubscript:@"50%"];

    v51 = [(_PSFeatureStatistics *)self list];
    v52 = [(_PSFeatureStatistics *)self list];
    v53 = objc_msgSend(v51, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v52, "count") * 0.75) + -1.0));
    [v39 setObject:v53 forKeyedSubscript:@"75%"];

    v54 = [(_PSFeatureStatistics *)self list];
    v55 = [(_PSFeatureStatistics *)self list];
    v56 = objc_msgSend(v54, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v55, "count") * 0.9) + -1.0));
    [v39 setObject:v56 forKeyedSubscript:@"90%"];
  }
  [(_PSFeatureStatistics *)self setPercentiles:v39];
}

- (void)addValue:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSFeatureStatistics *)self list];
  [v5 addObject:v4];

  [(_PSFeatureStatistics *)self calculateStats];
}

- (NSMutableArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (double)avg
{
  return self->_avg;
}

- (void)setAvg:(double)a3
{
  self->_avg = a3;
}

- (double)stdev
{
  return self->_stdev;
}

- (void)setStdev:(double)a3
{
  self->_stdev = a3;
}

- (double)mode
{
  return self->_mode;
}

- (void)setMode:(double)a3
{
  self->_mode = a3;
}

- (NSDictionary)percentiles
{
  return self->_percentiles;
}

- (void)setPercentiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentiles, 0);

  objc_storeStrong((id *)&self->_list, 0);
}

@end