@interface HMService(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMService(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = a3;
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  v6 = [a1 uniqueIdentifier];
  [v5 appendObject:v6 withName:@"UUID" options:2];

  v7 = [a1 name];
  [v5 setObject:v7 forKeyedSubscript:@"name"];

  v8 = (void *)MEMORY[0x263F0E708];
  v9 = [a1 serviceType];
  v10 = [v8 localizedDescriptionForServiceType:v9];
  [v5 setObject:v10 forKeyedSubscript:@"type"];

  v11 = [a1 serviceSubtype];

  if (v11)
  {
    v12 = (void *)MEMORY[0x263F0E708];
    v13 = [a1 serviceSubtype];
    v14 = objc_msgSend(v12, "hf_descriptionForServiceSubtype:", v13);
    [v5 setObject:v14 forKeyedSubscript:@"subtype"];
  }
  v15 = [a1 accessory];
  v16 = (void *)[v4 copyWithDetailLevel:0];
  [v5 appendObject:v15 withName:@"accessory" context:v16];

  if ([v4 detailLevel] == 2)
  {
    v17 = [a1 characteristics];
    [v5 setObject:v17 forKeyedSubscript:@"characteristics"];

    v18 = [a1 associatedServiceType];

    if (v18)
    {
      v19 = (void *)MEMORY[0x263F0E708];
      v20 = [a1 associatedServiceType];
      v21 = [v19 localizedDescriptionForServiceType:v20];
      [v5 setObject:v21 forKeyedSubscript:@"associatedServiceType"];
    }
    v22 = [a1 linkedServices];
    v23 = (void *)[v4 copyWithDetailLevel:0];
    [v5 appendObject:v22 withName:@"linkedServices" context:v23 options:1];

    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_isOnForContextType:", 0), @"isLegacyFavorite");
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_shouldBeOnForContextType:", 0), @"showInLegacyFavorite");
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_isFavorite"), @"isFavorite");
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_effectiveIsFavorite"), @"effectiveIsFavorite");
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_showInHomeDashboard"), @"showInHomeDashboard");
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_effectiveShowInHomeDashboard"), @"effectiveShowInHomeDashboard");
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "isPrimaryService"), @"primaryService");
  }

  return v5;
}

@end