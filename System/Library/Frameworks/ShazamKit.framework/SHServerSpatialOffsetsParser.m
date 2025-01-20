@interface SHServerSpatialOffsetsParser
+ (id)offsetsFromResponse:(id)a3;
@end

@implementation SHServerSpatialOffsetsParser

+ (id)offsetsFromResponse:(id)a3
{
  id v3 = a3;
  v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Parsing spatial offsets from response %@", buf, 0xCu);
  }

  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"offsets"];
    v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        v11 = v7;
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v11);
          }
          v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v14 = [v13 objectForKeyedSubscript:@"timeStampInMilliseconds"];
          v15 = [v13 objectForKeyedSubscript:@"offsetInMilliseconds"];
          [v14 doubleValue];
          double v17 = v16 / 1000.0;
          [v15 doubleValue];
          id v19 = [objc_alloc((Class)SHHapticSpatialOffset) initWithTimestamp:v17 offset:v18 / 1000.0];
          [v6 addObject:v19];
        }
        v7 = v11;
        id v9 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    v20 = sh_log_object();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = [v6 count];
      *(_DWORD *)buf = 134217984;
      id v30 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Returning spatial offsets with count %ld", buf, 0xCu);
    }

    id v22 = [v6 copy];
  }
  else
  {
    v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No offset in response, returning empty spatial offsets", buf, 2u);
    }
    id v22 = &__NSArray0__struct;
  }

  return v22;
}

@end