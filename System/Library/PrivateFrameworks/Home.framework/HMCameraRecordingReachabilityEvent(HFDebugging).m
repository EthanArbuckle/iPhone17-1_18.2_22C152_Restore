@interface HMCameraRecordingReachabilityEvent(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMCameraRecordingReachabilityEvent(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v4 = +[HFStateDumpBuilder builderWithObject:a1 context:a3];
  v5 = [a1 uniqueIdentifier];
  [v4 appendObject:v5 withName:@"UUID" options:2];

  v6 = NSString;
  [a1 duration];
  v8 = [v6 stringWithFormat:@"%.2f", v7];
  [v4 setObject:v8 forKeyedSubscript:@"duration"];

  objc_msgSend(v4, "appendBool:withName:", objc_msgSend(a1, "isReachable"), @"reachable");
  v9 = [a1 dateOfOccurrence];
  v10 = +[HFCameraUtilities dayStringFromDate:v9];

  v11 = [a1 dateOfOccurrence];
  v12 = +[HFCameraUtilities fullTimeStringFromDate:v11];

  v13 = [a1 dateOfOccurrence];
  [a1 duration];
  v14 = objc_msgSend(v13, "dateByAddingTimeInterval:");

  v15 = +[HFCameraUtilities dayStringFromDate:v14];
  v16 = +[HFCameraUtilities fullTimeStringFromDate:v14];
  v17 = [NSString stringWithFormat:@"%@ %@ - %@ %@", v10, v12, v15, v16];
  [v4 setObject:v17 forKeyedSubscript:@"dateRange"];

  return v4;
}

@end