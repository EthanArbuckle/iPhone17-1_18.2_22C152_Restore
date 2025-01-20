@interface CPAnalyticsConditional
- (CPAnalyticsConditional)initWithConfig:(id)a3;
- (NSPredicate)predicate;
- (NSString)property;
- (id)_validateAndParseConfig:(id)a3 forKey:(id)a4;
@end

@implementation CPAnalyticsConditional

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSString)property
{
  return self->_property;
}

- (id)_validateAndParseConfig:(id)a3 forKey:(id)a4
{
  v4 = [a3 objectForKey:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (CPAnalyticsConditional)initWithConfig:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPAnalyticsConditional;
  id v5 = [(CPAnalyticsConditional *)&v14 init];
  if (!v5) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v6 = [(CPAnalyticsConditional *)v5 _validateAndParseConfig:v4 forKey:@"property"];
  uint64_t v7 = [(CPAnalyticsConditional *)v5 _validateAndParseConfig:v4 forKey:@"predicate"];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9
    || (objc_storeStrong((id *)&v5->_property, v6),
        [MEMORY[0x263F08A98] predicateWithFormat:v8],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_11;
  }
  predicate = v5->_predicate;
  v5->_predicate = (NSPredicate *)v10;

LABEL_9:
  v12 = v5;
LABEL_12:

  return v12;
}

@end