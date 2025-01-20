@interface HMAudioControl(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMAudioControl(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = a3;
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "isMuted"), @"muted");
  v6 = NSString;
  [a1 volume];
  v8 = [v6 stringWithFormat:@"%.2f", v7];
  [v5 setObject:v8 forKeyedSubscript:@"volume"];

  v9 = [a1 mediaSession];
  v10 = (void *)[v4 copyWithDetailLevel:0];

  [v5 appendObject:v9 withName:@"mediaSession" context:v10];
  return v5;
}

@end