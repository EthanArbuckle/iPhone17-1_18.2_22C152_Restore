@interface ComponentUltraWideBand
- (BOOL)isPresent;
- (id)arrowChipId;
- (id)arrowChipUniqueId;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentUltraWideBand

- (BOOL)isPresent
{
  return MGGetBoolAnswer();
}

- (void)populateAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ComponentUltraWideBand;
  id v4 = a3;
  [(ComponentBase *)&v7 populateAttributes:v4];
  v5 = [(ComponentUltraWideBand *)self arrowChipUniqueId];
  [v4 setObject:v5 forKeyedSubscript:@"arrowUniqueChipID"];

  v6 = [(ComponentUltraWideBand *)self arrowChipId];
  [v4 setObject:v6 forKeyedSubscript:@"arrowChipID"];
}

- (id)arrowChipUniqueId
{
  v2 = (void *)MGCopyAnswer();
  v3 = stringOrNull(v2);

  return v3;
}

- (id)arrowChipId
{
  v2 = (void *)MGCopyAnswer();
  v3 = stringOrNull(v2);

  return v3;
}

@end