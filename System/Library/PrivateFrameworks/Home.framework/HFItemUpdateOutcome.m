@interface HFItemUpdateOutcome
+ (id)outcomeWithResults:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HFItemUpdateOutcome)init;
- (HFItemUpdateOutcome)initWithResults:(id)a3;
- (HFItemUpdateOutcome)initWithResults:(id)a3 type:(unint64_t)a4;
- (NSArray)allKeys;
- (NSDictionary)results;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)hash;
- (unint64_t)outcomeType;
- (void)setOutcomeType:(unint64_t)a3;
@end

@implementation HFItemUpdateOutcome

- (void).cxx_destruct
{
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  v5 = [(HFItemUpdateOutcome *)self results];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HFMutableItemUpdateOutcome alloc];
  v5 = [(HFItemUpdateOutcome *)self results];
  v6 = [(HFMutableItemUpdateOutcome *)v4 initWithResults:v5 type:[(HFItemUpdateOutcome *)self outcomeType]];

  return v6;
}

- (unint64_t)outcomeType
{
  return self->_outcomeType;
}

- (HFItemUpdateOutcome)initWithResults:(id)a3 type:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HFItemUpdateOutcome.m", 34, @"Invalid parameter not satisfying: %@", @"results != nil" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HFItemUpdateOutcome.m", 35, @"Invalid parameter not satisfying: %@", @"[results isKindOfClass:[NSDictionary class]]" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HFItemUpdateOutcome;
  v9 = [(HFItemUpdateOutcome *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_results, a3);
    v10->_outcomeType = a4;
  }

  return v10;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setOutcomeType:(unint64_t)a3
{
  self->_outcomeType = a3;
}

- (HFItemUpdateOutcome)init
{
  v3 = [NSDictionary dictionary];
  id v4 = [(HFItemUpdateOutcome *)self initWithResults:v3];

  return v4;
}

+ (id)outcomeWithResults:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResults:v3];

  return v4;
}

- (HFItemUpdateOutcome)initWithResults:(id)a3
{
  return [(HFItemUpdateOutcome *)self initWithResults:a3 type:0];
}

- (unint64_t)hash
{
  v2 = [(HFItemUpdateOutcome *)self results];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HFItemUpdateOutcome *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HFItemUpdateOutcome *)v5 results];
      v7 = [(HFItemUpdateOutcome *)self results];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        id v8 = [(HFItemUpdateOutcome *)v5 results];
        v9 = [(HFItemUpdateOutcome *)self results];
        char v10 = [v8 isEqualToDictionary:v9];
      }
      uint64_t v12 = [(HFItemUpdateOutcome *)v5 outcomeType];
      if (v12 == [(HFItemUpdateOutcome *)self outcomeType]) {
        BOOL v11 = v10;
      }
      else {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (NSArray)allKeys
{
  v2 = [(HFItemUpdateOutcome *)self results];
  unint64_t v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (id)description
{
  unint64_t v3 = [(HFItemUpdateOutcome *)self outcomeType];
  id v4 = @"Not set";
  if (v3 == 1) {
    id v4 = @"No new data";
  }
  if (v3 == 2) {
    v5 = @"New data";
  }
  else {
    v5 = v4;
  }
  v6 = NSString;
  uint64_t v7 = objc_opt_class();
  id v8 = [(HFItemUpdateOutcome *)self results];
  v9 = [v6 stringWithFormat:@"<%@: %p> type: %@, results: %@>", v7, self, v5, v8];

  return v9;
}

@end