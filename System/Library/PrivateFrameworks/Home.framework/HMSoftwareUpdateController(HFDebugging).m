@interface HMSoftwareUpdateController(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMSoftwareUpdateController(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = a3;
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  v6 = [a1 uniqueIdentifier];
  [v5 appendObject:v6 withName:@"UUID" options:2];

  v7 = [a1 availableUpdate];
  [v5 setObject:v7 forKeyedSubscript:@"availableUpdate"];

  uint64_t v8 = [v4 detailLevel];
  if (v8 == 2)
  {
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isControllable"), @"controllable", 0);
    v9 = NSString;
    v10 = [a1 delegate];
    v11 = objc_msgSend(v9, "stringWithFormat:", @"%p", v10);
    [v5 setObject:v11 forKeyedSubscript:@"delegate"];
  }
  return v5;
}

@end