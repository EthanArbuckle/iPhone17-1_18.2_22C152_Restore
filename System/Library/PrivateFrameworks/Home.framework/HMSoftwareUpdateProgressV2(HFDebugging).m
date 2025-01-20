@interface HMSoftwareUpdateProgressV2(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMSoftwareUpdateProgressV2(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v4 = +[HFStateDumpBuilder builderWithObject:a1 context:a3];
  v5 = NSNumber;
  [a1 percentageComplete];
  v6 = objc_msgSend(v5, "numberWithFloat:");
  [v4 setObject:v6 forKeyedSubscript:@"percentageComplete"];

  v7 = NSNumber;
  [a1 estimatedTimeRemaining];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [v4 setObject:v8 forKeyedSubscript:@"estimatedTimeRemaining"];

  return v4;
}

@end