@interface HMAccessorySetting(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMAccessorySetting(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = a3;
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  v6 = [a1 localizedTitle];
  [v5 setObject:v6 forKeyedSubscript:@"title"];

  v7 = [a1 keyPath];
  [v5 appendObject:v7 withName:@"keyPath" options:2];

  v8 = [a1 value];
  [v5 setObject:v8 forKeyedSubscript:@"value"];

  uint64_t v9 = [v4 detailLevel];
  if (v9 == 2)
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v11 stringByReplacingOccurrencesOfString:@"HMAccessory" withString:&stru_26C081158];
    [v5 setObject:v12 forKeyedSubscript:@"type"];

    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isReflected"), @"reflected", 1);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isWritable"), @"writable", 0);
  }
  return v5;
}

@end