@interface HMCharacteristic(HFDebugging)
+ (id)hf_descriptionForProperties:()HFDebugging;
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMCharacteristic(HFDebugging)

+ (id)hf_descriptionForProperties:()HFDebugging
{
  id v3 = a3;
  if (_MergedGlobals_232 != -1) {
    dispatch_once(&_MergedGlobals_232, &__block_literal_global_268);
  }
  id v4 = (id)qword_26AB2EEA8;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__HMCharacteristic_HFDebugging__hf_descriptionForProperties___block_invoke_4;
  v10[3] = &unk_26408F2F8;
  id v11 = v4;
  id v5 = v4;
  v6 = objc_msgSend(v3, "na_map:", v10);

  v7 = [v6 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  v8 = [v7 componentsJoinedByString:@","];

  return v8;
}

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = (void *)[a3 copyWithOutputStyle:1];
  id v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  v6 = [a1 uniqueIdentifier];
  [v5 appendObject:v6 withName:@"UUID" options:2];

  v7 = objc_msgSend(a1, "hf_characteristicTypeDescription");
  [v5 setObject:v7 forKeyedSubscript:@"type"];

  if ([v4 includeVolatileObjects])
  {
    v8 = [a1 value];
    [v5 setObject:v8 forKeyedSubscript:@"value"];

    v9 = objc_msgSend(a1, "hf_formattedValueUpdatedTime");
    [v5 setObject:v9 forKeyedSubscript:@"time"];
  }
  if ([a1 isNotificationEnabled]) {
    v10 = @"on";
  }
  else {
    v10 = @"off";
  }
  [v5 setObject:v10 forKeyedSubscript:@"notifications"];
  if ([v4 detailLevel] == 2)
  {
    id v11 = [a1 service];
    v12 = (void *)[v4 copyWithDetailLevel:0];
    [v5 appendObject:v11 withName:@"service" context:v12];

    v13 = [a1 metadata];
    v14 = (void *)[v4 copyWithDetailLevel:0];
    [v5 appendObject:v13 withName:@"metadata" context:v14];

    v15 = objc_opt_class();
    v16 = [a1 properties];
    v17 = objc_msgSend(v15, "hf_descriptionForProperties:", v16);
    [v5 setObject:v17 forKeyedSubscript:@"properties"];

    v18 = [a1 properties];
    LODWORD(v16) = [v18 containsObject:*MEMORY[0x263F0BEE0]];

    if (v16) {
      objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hasAuthorizationData"), @"hasAuthorizationData");
    }
  }

  return v5;
}

@end