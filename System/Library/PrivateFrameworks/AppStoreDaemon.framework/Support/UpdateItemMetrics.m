@interface UpdateItemMetrics
- (UpdateItemMetrics)init;
- (UpdateItemMetrics)initWithData:(id)a3;
- (id)description;
@end

@implementation UpdateItemMetrics

- (UpdateItemMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)UpdateItemMetrics;
  v2 = [(UpdateItemMetrics *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    metricsData = v2->_metricsData;
    v2->_metricsData = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (UpdateItemMetrics)initWithData:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UpdateItemMetrics;
  v5 = [(UpdateItemMetrics *)&v13 init];
  if (!v5) {
    goto LABEL_4;
  }
  if (v4)
  {
    objc_super v6 = (NSMutableDictionary *)[v4 mutableCopy];
    metricsData = v5->_metricsData;
    v5->_metricsData = v6;

LABEL_4:
    v8 = v5;
    goto LABEL_8;
  }
  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v15 = v11;
    id v12 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Unable to initialze with data", buf, 0xCu);
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (id)description
{
  uint64_t v3 = [(NSMutableDictionary *)self->_metricsData keyEnumerator];
  id v4 = [objc_alloc((Class)NSMutableString) initWithString:@"{"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_metricsData valueForKey:v9];
        v11 = +[NSString stringWithFormat:@" %@: %@", v9, v10];
        [v4 appendString:v11];
      }
      id v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [v4 appendString:@" }"];
  return v4;
}

- (void).cxx_destruct
{
}

@end