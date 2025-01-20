@interface HMCameraClip(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMCameraClip(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = a3;
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  v6 = [a1 uniqueIdentifier];
  [v5 appendObject:v6 withName:@"UUID" options:2];

  v7 = NSString;
  [a1 duration];
  v9 = [v7 stringWithFormat:@"%.2f", v8];
  [v5 setObject:v9 forKeyedSubscript:@"duration"];

  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isComplete"), @"isComplete", 0);
  [a1 quality];
  v10 = HMStringFromCameraClipQuality();
  [v5 appendObject:v10 withName:@"quality"];

  v11 = [a1 startDate];
  v12 = +[HFCameraUtilities dayStringFromDate:v11];

  v13 = [a1 startDate];
  v14 = +[HFCameraUtilities fullTimeStringFromDate:v13];

  v15 = [a1 startDate];
  [a1 duration];
  v16 = objc_msgSend(v15, "dateByAddingTimeInterval:");

  v17 = +[HFCameraUtilities dayStringFromDate:v16];
  v18 = +[HFCameraUtilities fullTimeStringFromDate:v16];
  v19 = [NSString stringWithFormat:@"%@ %@ - %@ %@", v12, v14, v17, v18];
  [v5 setObject:v19 forKeyedSubscript:@"dateRange"];

  v20 = [a1 significantEvents];
  v21 = objc_msgSend(v20, "na_map:", &__block_literal_global_686);

  v22 = [v21 allObjects];
  v23 = [v22 componentsJoinedByString:@","];
  [v5 appendObject:v23 withName:@"significantEvents" context:v4 options:1];

  return v5;
}

@end