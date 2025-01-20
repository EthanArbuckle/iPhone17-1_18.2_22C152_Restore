@interface ATXCandidateMinimalAction
- (id)description;
- (id)detailedDescription;
- (id)identifier;
- (id)type;
- (int64_t)suggestionExecutableType;
@end

@implementation ATXCandidateMinimalAction

- (id)identifier
{
  v3 = NSString;
  v4 = [(ATXCandidate *)self biomeStoreData];
  v5 = [v4 bundleId];
  v6 = [(ATXCandidate *)self biomeStoreData];
  v7 = [v6 actionType];
  v8 = NSNumber;
  v9 = [(ATXCandidate *)self biomeStoreData];
  v10 = objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v9, "paramHash"));
  v11 = [v3 stringWithFormat:@"%@:%@:%lld", v5, v7, objc_msgSend(v10, "longLongValue")];

  return v11;
}

- (id)type
{
  return @"MinimalAction";
}

- (int64_t)suggestionExecutableType
{
  return 2;
}

- (id)description
{
  v2 = [(ATXCandidate *)self biomeStoreData];
  v3 = [v2 actionFromDatastoreLookup];

  v4 = NSString;
  v5 = [v3 actionTitle];
  uint64_t v6 = [v3 actionSubtitle];
  v7 = (void *)v6;
  v8 = @"<no subtitle>";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = [v4 stringWithFormat:@"%@ | %@", v5, v8];

  return v9;
}

- (id)detailedDescription
{
  v2 = [(ATXCandidate *)self biomeStoreData];
  v3 = [v2 actionFromDatastoreLookup];
  v4 = [v3 actionDescription];

  return v4;
}

@end