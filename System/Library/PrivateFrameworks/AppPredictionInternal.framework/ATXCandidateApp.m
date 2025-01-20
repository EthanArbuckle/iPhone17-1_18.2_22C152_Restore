@interface ATXCandidateApp
- (id)identifier;
- (id)type;
- (int64_t)suggestionExecutableType;
@end

@implementation ATXCandidateApp

- (id)identifier
{
  v2 = [(ATXCandidate *)self biomeStoreData];
  v3 = [v2 bundleID];

  return v3;
}

- (id)type
{
  return @"App";
}

- (int64_t)suggestionExecutableType
{
  return 1;
}

@end