@interface CPAnalyticsEventCounter
+ (id)_validateAndParseEventName:(id)a3;
- (CPAnalyticsEventCounter)initWithConfig:(id)a3;
- (CPAnalyticsEventCounter)initWithEventName:(id)a3;
- (CPAnalyticsEventCounter)initWithName:(id)a3 matcher:(id)a4;
- (CPAnalyticsEventMatcher)matcher;
- (NSString)countKey;
- (NSString)name;
- (id)description;
- (unint64_t)count;
- (void)countEvent:(id)a3;
- (void)resetCount;
- (void)setCount:(unint64_t)a3;
@end

@implementation CPAnalyticsEventCounter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countKey, 0);
  objc_storeStrong((id *)&self->_matcher, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)countKey
{
  return self->_countKey;
}

- (CPAnalyticsEventMatcher)matcher
{
  return self->_matcher;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v2 = NSString;
  v3 = [(CPAnalyticsEventCounter *)self name];
  v4 = [v2 stringWithFormat:@"Name: %@", v3];

  return v4;
}

- (void)resetCount
{
}

- (void)countEvent:(id)a3
{
  id v10 = a3;
  v4 = [(CPAnalyticsEventCounter *)self matcher];
  int v5 = [v4 doesMatch:v10];

  if (v5)
  {
    v6 = [(CPAnalyticsEventCounter *)self countKey];
    if (!v6)
    {
      uint64_t v9 = 1;
LABEL_11:
      [(CPAnalyticsEventCounter *)self setCount:[(CPAnalyticsEventCounter *)self count] + v9];

      goto LABEL_12;
    }
    v7 = [v10 propertyForKey:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 integerValue];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v9 = 1;
        goto LABEL_10;
      }
      uint64_t v8 = [v7 count];
    }
    uint64_t v9 = v8;
LABEL_10:

    goto LABEL_11;
  }
LABEL_12:
}

- (CPAnalyticsEventCounter)initWithName:(id)a3 matcher:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(CPAnalyticsEventCounter *)self init];
  if (v9)
  {
    uint64_t v10 = [v7 length];
    if (v8 && v10)
    {
      objc_storeStrong((id *)&v9->_matcher, a4);
      objc_storeStrong((id *)&v9->_name, a3);
    }
    else
    {
      v11 = CPAnalyticsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412546;
        id v14 = v7;
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_error_impl(&dword_215355000, v11, OS_LOG_TYPE_ERROR, "Error creating event counter, name: %@, matcher: %@", (uint8_t *)&v13, 0x16u);
      }

      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (CPAnalyticsEventCounter)initWithEventName:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(CPAnalyticsEventCounter *)self init];
  if (v6)
  {
    id v7 = +[CPAnalyticsEventMatcher eventMatcherWithEventName:v5];
    if ([v5 length] && v7)
    {
      objc_storeStrong((id *)&v6->_matcher, v7);
      objc_storeStrong((id *)&v6->_name, a3);
    }
    else
    {
      id v8 = CPAnalyticsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412546;
        id v11 = v5;
        __int16 v12 = 2112;
        int v13 = v7;
        _os_log_error_impl(&dword_215355000, v8, OS_LOG_TYPE_ERROR, "Error creating event counter, eventName: %@, matcher: %@", (uint8_t *)&v10, 0x16u);
      }

      v6 = 0;
    }
  }
  return v6;
}

- (CPAnalyticsEventCounter)initWithConfig:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPAnalyticsEventCounter;
  id v5 = [(CPAnalyticsEventCounter *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"matchCriteria"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = +[CPAnalyticsEventMatcher eventMatcherWithConfiguration:v6];
    }
    else
    {
      id v7 = 0;
    }
    id v8 = [v4 objectForKey:@"name"];
    uint64_t v9 = +[CPAnalyticsEventCounter _validateAndParseEventName:v8];

    if (!v9)
    {
      uint64_t v9 = [v6 objectForKeyedSubscript:@"key"];
    }
    if ([v9 length] && v7)
    {
      objc_storeStrong((id *)&v5->_matcher, v7);
      objc_storeStrong((id *)&v5->_name, v9);
      uint64_t v10 = [v4 objectForKeyedSubscript:@"countKey"];
      countKey = (CPAnalyticsEventCounter *)v5->_countKey;
      v5->_countKey = (NSString *)v10;
    }
    else
    {
      __int16 v12 = CPAnalyticsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v16 = v4;
        __int16 v17 = 2112;
        v18 = v9;
        __int16 v19 = 2112;
        v20 = v7;
        _os_log_error_impl(&dword_215355000, v12, OS_LOG_TYPE_ERROR, "Error creating event counter from config: %@, name: %@, matcher: %@", buf, 0x20u);
      }

      countKey = v5;
      id v5 = 0;
    }
  }
  return v5;
}

+ (id)_validateAndParseEventName:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end