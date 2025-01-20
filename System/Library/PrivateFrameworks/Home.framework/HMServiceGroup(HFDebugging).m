@interface HMServiceGroup(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMServiceGroup(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = a3;
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  v6 = [a1 uniqueIdentifier];
  [v5 appendObject:v6 withName:@"UUID" options:2];

  v7 = [a1 name];
  [v5 setObject:v7 forKeyedSubscript:@"name"];

  if ([v4 detailLevel] == 2)
  {
    v8 = [a1 services];
    v9 = (void *)[v4 copyWithDetailLevel:0];
    [v5 appendObject:v8 withName:@"services" context:v9 options:0];

    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_isOnForContextType:", 0), @"isLegacyFavorite");
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_shouldBeOnForContextType:", 0), @"showInLegacyFavorite");
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_isFavorite"), @"isFavorite");
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_effectiveIsFavorite"), @"effectiveIsFavorite");
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_effectiveShowInHomeDashboard"), @"effectiveShowInHomeDashboard");
  }

  return v5;
}

@end