@interface ATXNotificationDeliverySuggestion(Internal)
- (id)feedbackKey;
@end

@implementation ATXNotificationDeliverySuggestion(Internal)

- (id)feedbackKey
{
  uint64_t v2 = [a1 subObject];
  if (v2
    && (v3 = (void *)v2,
        [a1 subObject],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 conformsToProtocol:&unk_1F28AC2E0],
        v4,
        v3,
        v5))
  {
    v6 = [a1 subObject];
    v7 = [v6 feedbackKeyComponent];
  }
  else
  {
    v7 = &stru_1F2740B58;
  }
  v8 = NSString;
  [a1 subtype];
  v9 = ATXSuggestionTypeToString();
  v10 = [a1 entityIdentifier];
  [a1 scope];
  v11 = ATXNotificationSuggestionScopeToString();
  v12 = [v8 stringWithFormat:@"subtype:%@_entityIdentifier:%@_scope:%@", v9, v10, v11];

  v13 = [NSString stringWithFormat:@"primary:%@__subobject:%@", v12, v7];

  return v13;
}

@end