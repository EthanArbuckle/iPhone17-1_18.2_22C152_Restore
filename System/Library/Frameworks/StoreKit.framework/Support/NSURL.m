@interface NSURL
- (NSString)lib_sanitizedFilePath;
- (id)lib_URLByAppendingPathComponents:(id)a3;
- (id)lib_URLByAppendingQueryDictionary:(id)a3;
- (id)lib_URLByStrippingQuery;
- (id)lib_queryDictionary;
@end

@implementation NSURL

- (NSString)lib_sanitizedFilePath
{
  if ([(NSURL *)self isFileURL])
  {
    v3 = [(NSURL *)self path];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (id)lib_queryDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [objc_alloc((Class)NSURLComponents) initWithURL:self resolvingAgainstBaseURL:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(v4, "queryItems", 0);
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 name];
        v12 = [v10 value];
        if (v11) {
          [v3 setObject:v12 forKeyedSubscript:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v3 copy];

  return v13;
}

- (id)lib_URLByAppendingPathComponents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 count];
    id v6 = [v4 firstObject];
    if (v5 == (id)1)
    {
      id v7 = [(NSURL *)self URLByAppendingPathComponent:v6 isDirectory:0];
    }
    else
    {
      uint64_t v8 = [(NSURL *)self URLByAppendingPathComponent:v6 isDirectory:1];

      v9 = objc_msgSend(v4, "subarrayWithRange:", 1, (char *)objc_msgSend(v4, "count") - 1);
      objc_msgSend(v8, "lib_URLByAppendingPathComponents:", v9);
      id v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v7 = self;
  }

  return v7;
}

- (id)lib_URLByAppendingQueryDictionary:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v27 = v4;
  if ([v4 count])
  {
    id v6 = +[NSMutableString string];
    v25 = v5;
    id v7 = [(NSURL *)v5 absoluteString];
    uint64_t v8 = [v7 componentsSeparatedByString:@"?"];

    v24 = [v8 objectAtIndexedSubscript:0];
    if ((unint64_t)[v8 count] >= 2)
    {
      v9 = [v8 objectAtIndexedSubscript:1];
      [v6 appendString:v9];
    }
    v10 = +[NSCharacterSet URLQueryAllowedCharacterSet];
    id v11 = [v10 mutableCopy];

    [v11 removeCharactersInString:@"?&%+=;"];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [v27 allKeys];
    id v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(obj);
          }
          long long v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v17 = [v16 stringByAddingPercentEncodingWithAllowedCharacters:v11];
          long long v18 = [v27 objectForKeyedSubscript:v16];
          v19 = [v18 stringByAddingPercentEncodingWithAllowedCharacters:v11];

          if ([v6 length]) {
            CFStringRef v20 = @"&%@=%@";
          }
          else {
            CFStringRef v20 = @"%@=%@";
          }
          objc_msgSend(v6, "appendFormat:", v20, v17, v19);
        }
        id v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    if (v6)
    {
      v21 = v24;
      if ([v6 length])
      {
        uint64_t v22 = [v24 stringByAppendingFormat:@"?%@", v6];

        v21 = (void *)v22;
      }
    }
    else
    {
      v21 = v24;
    }
    id v5 = +[NSURL URLWithString:v21];
  }

  return v5;
}

- (id)lib_URLByStrippingQuery
{
  id v2 = [objc_alloc((Class)NSURLComponents) initWithURL:self resolvingAgainstBaseURL:0];
  [v2 setQueryItems:0];
  v3 = [v2 URL];

  return v3;
}

@end