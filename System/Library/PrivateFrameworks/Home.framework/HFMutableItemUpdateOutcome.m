@interface HFMutableItemUpdateOutcome
- (HFMutableItemUpdateOutcome)initWithResults:(id)a3 type:(unint64_t)a4;
- (NSMutableDictionary)mutableResults;
- (id)allKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addResultsFromDictionary:(id)a3;
- (void)addResultsFromOutcome:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)safeSetObject:(id)a3 forKey:(id)a4;
- (void)setMutableResults:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setResults:(id)a3;
@end

@implementation HFMutableItemUpdateOutcome

- (void).cxx_destruct
{
}

- (HFMutableItemUpdateOutcome)initWithResults:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFMutableItemUpdateOutcome;
  v7 = [(HFItemUpdateOutcome *)&v11 initWithResults:v6 type:a4];
  if (v7)
  {
    uint64_t v8 = [v6 mutableCopy];
    mutableResults = v7->_mutableResults;
    v7->_mutableResults = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFMutableItemUpdateOutcome *)self mutableResults];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (NSMutableDictionary)mutableResults
{
  return self->_mutableResults;
}

- (void)safeSetObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(HFMutableItemUpdateOutcome *)self mutableResults];
    [v8 setObject:v7 forKey:v6];
  }
}

- (void)setResults:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(HFMutableItemUpdateOutcome *)self setMutableResults:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HFItemUpdateOutcome alloc];
  v5 = [(HFMutableItemUpdateOutcome *)self results];
  id v6 = [(HFItemUpdateOutcome *)v4 initWithResults:v5 type:[(HFItemUpdateOutcome *)self outcomeType]];

  return v6;
}

- (id)allKeys
{
  v2 = [(HFMutableItemUpdateOutcome *)self mutableResults];
  v3 = [v2 allKeys];

  return v3;
}

- (void)addResultsFromOutcome:(id)a3
{
  id v4 = [a3 results];
  [(HFMutableItemUpdateOutcome *)self addResultsFromDictionary:v4];
}

- (void)addResultsFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMutableItemUpdateOutcome *)self mutableResults];
  [v5 addEntriesFromDictionary:v4];
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMutableItemUpdateOutcome *)self mutableResults];
  [v5 removeObjectsForKeys:v4];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMutableItemUpdateOutcome *)self mutableResults];
  [v5 removeObjectForKey:v4];
}

- (void)setMutableResults:(id)a3
{
}

@end