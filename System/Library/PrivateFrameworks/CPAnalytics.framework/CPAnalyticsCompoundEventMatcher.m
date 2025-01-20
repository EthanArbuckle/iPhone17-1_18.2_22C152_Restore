@interface CPAnalyticsCompoundEventMatcher
+ (id)andEventMatcherWithSubEventMatchers:(id)a3;
+ (id)notEventMatcherWithSubEventMatcher:(id)a3;
+ (id)orEventMatcherWithSubEventMatchers:(id)a3;
- (BOOL)doesMatch:(id)a3;
- (CPAnalyticsCompoundEventMatcher)init;
- (CPAnalyticsCompoundEventMatcher)initWithType:(unint64_t)a3 subEventMatchers:(id)a4;
- (NSArray)subEventMatchers;
- (unint64_t)type;
@end

@implementation CPAnalyticsCompoundEventMatcher

- (void).cxx_destruct
{
}

- (NSArray)subEventMatchers
{
  return self->_subEventMatchers;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)doesMatch:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(CPAnalyticsCompoundEventMatcher *)self type];
  switch(v5)
  {
    case 3uLL:
      v6 = [(CPAnalyticsCompoundEventMatcher *)self subEventMatchers];
      v12 = [v6 firstObject];
      LODWORD(v11) = [v12 doesMatch:v4] ^ 1;

      goto LABEL_25;
    case 2uLL:
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v6 = [(CPAnalyticsCompoundEventMatcher *)self subEventMatchers];
      uint64_t v11 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (!v11) {
        goto LABEL_25;
      }
      uint64_t v13 = *(void *)v17;
LABEL_16:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * v14) doesMatch:v4]) {
          goto LABEL_12;
        }
        if (v11 == ++v14)
        {
          uint64_t v11 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v11) {
            goto LABEL_16;
          }
          goto LABEL_25;
        }
      }
    case 1uLL:
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v6 = [(CPAnalyticsCompoundEventMatcher *)self subEventMatchers];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(v6);
            }
            if (![*(id *)(*((void *)&v20 + 1) + 8 * i) doesMatch:v4])
            {
              LOBYTE(v11) = 0;
              goto LABEL_25;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_12:
      LOBYTE(v11) = 1;
LABEL_25:

      goto LABEL_26;
  }
  LOBYTE(v11) = 0;
LABEL_26:

  return v11;
}

- (CPAnalyticsCompoundEventMatcher)initWithType:(unint64_t)a3 subEventMatchers:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPAnalyticsCompoundEventMatcher;
  uint64_t v7 = [(CPAnalyticsCompoundEventMatcher *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    subEventMatchers = v8->_subEventMatchers;
    v8->_subEventMatchers = (NSArray *)v9;
  }
  return v8;
}

- (CPAnalyticsCompoundEventMatcher)init
{
  return [(CPAnalyticsCompoundEventMatcher *)self initWithType:1 subEventMatchers:MEMORY[0x263EFFA68]];
}

+ (id)notEventMatcherWithSubEventMatcher:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v9[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  uint64_t v7 = (void *)[v5 initWithType:3 subEventMatchers:v6];
  return v7;
}

+ (id)orEventMatcherWithSubEventMatchers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithType:2 subEventMatchers:v4];

  return v5;
}

+ (id)andEventMatcherWithSubEventMatchers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithType:1 subEventMatchers:v4];

  return v5;
}

@end