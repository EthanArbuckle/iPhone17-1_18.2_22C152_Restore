@interface IMMapURLLocationInfo
+ (id)locationInfoFromURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CLLocation)location;
- (NSString)address;
- (NSString)query;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAddress:(id)a3;
- (void)setLocation:(id)a3;
- (void)setQuery:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation IMMapURLLocationInfo

+ (id)locationInfoFromURL:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_opt_new();
    v5 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    v6 = [v5 host];
    v7 = v6;
    if (v6 && [v6 isEqualToIgnoringCase:@"maps.apple.com"])
    {
      v32 = v7;
      id v34 = v3;
      [v4 setUrl:v3];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v33 = v5;
      v8 = [v5 queryItems];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (!v9) {
        goto LABEL_20;
      }
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v36;
      while (1)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v14 = [v13 name];
          int v15 = [v14 isEqualToIgnoringCase:@"ll"];

          if (v15)
          {
            v16 = [v13 value];
            v17 = [v16 componentsSeparatedByString:@","];

            if ([v17 count] == 2)
            {
              v18 = (objc_class *)MEMORY[0x1A6227910](@"CLLocation", @"CoreLocation");
              if (v18)
              {
                id v19 = [v18 alloc];
                v20 = [v17 objectAtIndexedSubscript:0];
                [v20 doubleValue];
                double v22 = v21;
                v23 = [v17 objectAtIndexedSubscript:1];
                [v23 doubleValue];
                v25 = (void *)[v19 initWithLatitude:v22 longitude:v24];
                [v4 setLocation:v25];
              }
            }
          }
          else
          {
            v26 = [v13 name];
            int v27 = [v26 isEqualToIgnoringCase:@"q"];

            if (v27)
            {
              v17 = [v13 value];
              [v4 setQuery:v17];
            }
            else
            {
              v28 = [v13 name];
              int v29 = [v28 isEqualToString:@"address"];

              if (!v29) {
                continue;
              }
              v17 = [v13 value];
              [v4 setAddress:v17];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (!v10)
        {
LABEL_20:

          id v30 = v4;
          v5 = v33;
          id v3 = v34;
          v7 = v32;
          goto LABEL_22;
        }
      }
    }
    id v30 = 0;
LABEL_22:
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IMMapURLLocationInfo *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4)
    {
      char v10 = 1;
    }
    else
    {
      v5 = [(IMMapURLLocationInfo *)self url];
      v6 = [(IMMapURLLocationInfo *)v4 url];
      id v7 = v5;
      id v8 = v6;
      uint64_t v9 = v8;
      if (v7 == v8)
      {
        char v10 = 1;
      }
      else
      {
        char v10 = 0;
        if (v7 && v8) {
          char v10 = [v7 isEqual:v8];
        }
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(IMMapURLLocationInfo *)self url];
  v4 = +[IMMapURLLocationInfo locationInfoFromURL:v3];

  return v4;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end