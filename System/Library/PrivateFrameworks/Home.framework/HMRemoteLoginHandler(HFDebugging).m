@interface HMRemoteLoginHandler(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMRemoteLoginHandler(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = a3;
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isControllable"), @"controllable", 0);
  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isSessionInProgress"), @"sessionInProgress", 1);
  uint64_t v6 = [v4 detailLevel];

  if (v6 == 2)
  {
    v7 = [a1 loggedInAccount];
    [v5 setObject:v7 forKeyedSubscript:@"loggedInAccount"];

    v8 = [a1 anisetteDataProvider];
    [v5 setObject:v8 forKeyedSubscript:@"anisetteDataProvider"];
  }
  return v5;
}

@end