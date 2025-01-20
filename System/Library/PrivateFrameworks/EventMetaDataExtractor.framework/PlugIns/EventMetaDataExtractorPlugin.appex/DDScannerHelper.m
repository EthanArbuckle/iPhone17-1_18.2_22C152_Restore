@interface DDScannerHelper
- (DDScannerHelper)init;
- (id)runDataDetectorsOnBody:(id)a3 locale:(id)a4;
- (int64_t)getExtractionResultType:(__DDResult *)a3;
- (void)dealloc;
@end

@implementation DDScannerHelper

- (DDScannerHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)DDScannerHelper;
  v2 = [(DDScannerHelper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    scanners = v2->_scanners;
    v2->_scanners = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)dealloc
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_scanners allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      objc_super v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        CFRelease([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) pointerValue]);
        objc_super v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)DDScannerHelper;
  [(DDScannerHelper *)&v7 dealloc];
}

- (int64_t)getExtractionResultType:(__DDResult *)a3
{
  id v3 = [(id)DDResultGetType() copy];
  if ([v3 isEqualToString:@"Date"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Time"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"DateTime"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"DateDuration"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"TimeDuration"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"BeginDate"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"EndDate"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"FlightInformation"])
  {
    int64_t v4 = 8;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)runDataDetectorsOnBody:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = +[NSDate date];
  long long v9 = objc_opt_new();
  if (v6 && v7)
  {
    long long v10 = objc_opt_new();
    [v9 setObject:v10 forKeyedSubscript:@"extractions"];
    long long v11 = [(NSMutableDictionary *)self->_scanners objectForKeyedSubscript:v7];
    id v12 = [v11 pointerValue];

    if (v12
      || (uint64_t v21 = 0,
          id v12 = (id)DDScannerCreateWithLocale(),
          +[NSValue valueWithPointer:v12],
          v13 = objc_claimAutoreleasedReturnValue(),
          [(NSMutableDictionary *)self->_scanners setObject:v13 forKeyedSubscript:v7],
          v13,
          v12))
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100001FE8;
      v15[3] = &unk_1000AC938;
      id v16 = v6;
      id v17 = v8;
      id v18 = v7;
      v19 = self;
      id v20 = v10;
      DataDetectorsScan((uint64_t)v12, v16, 0, v15);
    }
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end