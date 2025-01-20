@interface CNEnvironmentTestDouble(Autocomplete)
- (uint64_t)setCdPeopleSuggester:()Autocomplete;
- (uint64_t)setDataAccessConnection:()Autocomplete;
- (uint64_t)setPeopleSuggester:()Autocomplete;
- (uint64_t)setStewie:()Autocomplete;
- (uint64_t)setSuggestedResultPrioritization:()Autocomplete;
@end

@implementation CNEnvironmentTestDouble(Autocomplete)

- (uint64_t)setPeopleSuggester:()Autocomplete
{
  return [a1 setValue:a3 forKey:@"people-suggester-facade"];
}

- (uint64_t)setCdPeopleSuggester:()Autocomplete
{
  return [a1 setValue:a3 forKey:@"cd-people-suggester-facade"];
}

- (uint64_t)setSuggestedResultPrioritization:()Autocomplete
{
  return [a1 setValue:a3 forKey:@"suggested-result-prioritization"];
}

- (uint64_t)setStewie:()Autocomplete
{
  return [a1 setValue:a3 forKey:@"stewie"];
}

- (uint64_t)setDataAccessConnection:()Autocomplete
{
  return [a1 setValue:a3 forKey:@"data-access-connection"];
}

@end