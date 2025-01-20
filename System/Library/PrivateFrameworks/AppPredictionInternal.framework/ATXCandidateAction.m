@interface ATXCandidateAction
- (id)identifier;
- (id)type;
- (int64_t)suggestionExecutableType;
@end

@implementation ATXCandidateAction

- (id)identifier
{
  v3 = NSString;
  v4 = [(ATXCandidate *)self biomeStoreData];
  v5 = [v4 actionKey];
  v6 = [(ATXCandidate *)self biomeStoreData];
  v7 = [v3 stringWithFormat:@"%@:%lu", v5, objc_msgSend(v6, "hash")];

  return v7;
}

- (id)type
{
  return @"Action";
}

- (int64_t)suggestionExecutableType
{
  return 2;
}

@end