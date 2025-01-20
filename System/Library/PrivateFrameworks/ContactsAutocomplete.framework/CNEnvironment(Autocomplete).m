@interface CNEnvironment(Autocomplete)
- (uint64_t)cdPeopleSuggester;
- (uint64_t)dataAccessConnection;
- (uint64_t)peopleSuggester;
- (uint64_t)stewie;
- (uint64_t)suggestedResultPrioritization;
@end

@implementation CNEnvironment(Autocomplete)

- (uint64_t)peopleSuggester
{
  return [a1 valueForKey:@"people-suggester-facade" onCacheMiss:&__block_literal_global_6];
}

- (uint64_t)cdPeopleSuggester
{
  return [a1 valueForKey:@"cd-people-suggester-facade" onCacheMiss:&__block_literal_global_16];
}

- (uint64_t)suggestedResultPrioritization
{
  return [a1 valueForKey:@"suggested-result-prioritization" onCacheMiss:&__block_literal_global_20];
}

- (uint64_t)stewie
{
  return [a1 valueForKey:@"stewie" onCacheMiss:&__block_literal_global_24];
}

- (uint64_t)dataAccessConnection
{
  return [a1 valueForKey:@"data-access-connection" onCacheMiss:&__block_literal_global_28];
}

@end