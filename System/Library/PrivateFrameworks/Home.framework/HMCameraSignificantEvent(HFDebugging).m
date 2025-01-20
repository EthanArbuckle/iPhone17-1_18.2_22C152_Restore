@interface HMCameraSignificantEvent(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMCameraSignificantEvent(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v4 = +[HFStateDumpBuilder builderWithObject:a1 context:a3];
  v5 = [a1 uniqueIdentifier];
  [v4 appendObject:v5 withName:@"UUID" options:2];

  v6 = objc_msgSend(a1, "hf_reasonKey");
  [v4 appendObject:v6 withName:@"reason"];

  v7 = objc_msgSend(a1, "hf_faceClassificationName");
  [v4 appendObject:v7 withName:@"faceName" options:1];

  v8 = [a1 dateOfOccurrence];
  v9 = +[HFCameraUtilities dayStringFromDate:v8];

  v10 = [a1 dateOfOccurrence];
  v11 = +[HFCameraUtilities fullTimeStringFromDate:v10];

  v12 = NSString;
  v13 = [a1 dateOfOccurrence];
  v14 = [v12 stringWithFormat:@"%@ %@ (%@)", v9, v11, v13];
  [v4 setObject:v14 forKeyedSubscript:@"date"];

  return v4;
}

@end