@interface HRETemplate
- (Class)recommendationClass;
- (HRETemplate)init;
- (NSSet)involvedAccessoryTypes;
- (NSSet)rules;
- (NSString)identifier;
- (NSString)title;
- (double)sortingPriority;
- (double)starterRank;
- (id)createStarterRecommendationInHome:(id)a3;
- (unint64_t)splitStrategy;
- (void)setIdentifier:(id)a3;
- (void)setRules:(id)a3;
- (void)setSortingPriority:(double)a3;
- (void)setSplitStrategy:(unint64_t)a3;
- (void)setStarterRank:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation HRETemplate

- (HRETemplate)init
{
  v8.receiver = self;
  v8.super_class = (Class)HRETemplate;
  v2 = [(HRETemplate *)&v8 init];
  v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = 0;

    rules = v3->_rules;
    v3->_rules = 0;

    identifier = v3->_identifier;
    v3->_identifier = 0;

    v3->_splitStrategy = 0;
    *(_OWORD *)&v3->_sortingPriority = xmmword_237B96B50;
  }
  return v3;
}

- (id)createStarterRecommendationInHome:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = objc_alloc([(HRETemplate *)self recommendationClass]);
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  objc_super v8 = (void *)[v7 initWithHome:v4];
  v9 = NSString;
  v10 = [(HRETemplate *)self identifier];
  v11 = [v9 stringWithFormat:@"(template:%@)", v10];

  v12 = [[HREIdentifierBuilder alloc] initWithBaseIdentifier:v11];
  [v8 setIdentifierBuilder:v12];

  v13 = [v8 identifierBuilder];
  v14 = [v4 uniqueIdentifier];

  v15 = [v14 UUIDString];
  [v13 setObject:v15 forKey:@"home"];

  [(HRETemplate *)self sortingPriority];
  objc_msgSend(v8, "setSortingPriority:");
  [v8 setSourceTemplate:self];
  v16 = NSString;
  v17 = [(HRETemplate *)self identifier];
  v18 = [v16 stringWithFormat:@"template-%@", v17];
  v19 = [v8 defaultAnalyticsData];
  [v19 setObject:v18 forKeyedSubscript:*MEMORY[0x263F478B0]];

  return v8;
}

- (Class)recommendationClass
{
  return 0;
}

- (NSSet)involvedAccessoryTypes
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSSet)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)splitStrategy
{
  return self->_splitStrategy;
}

- (void)setSplitStrategy:(unint64_t)a3
{
  self->_splitStrategy = a3;
}

- (double)sortingPriority
{
  return self->_sortingPriority;
}

- (void)setSortingPriority:(double)a3
{
  self->_sortingPriority = a3;
}

- (double)starterRank
{
  return self->_starterRank;
}

- (void)setStarterRank:(double)a3
{
  self->_starterRank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rules, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end