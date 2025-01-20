@interface HMDataSetting(HFDebugging)
- (__CFString)hf_debugValueForData:()HFDebugging;
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMDataSetting(HFDebugging)

- (__CFString)hf_debugValueForData:()HFDebugging
{
  v4 = [a1 value];
  v5 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:0 format:a3 error:0];
  uint64_t v6 = [v5 description];
  v7 = (void *)v6;
  v8 = &stru_26C081158;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = v8;

  return v9;
}

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v7.receiver = a1;
  v7.super_class = (Class)&off_26C1630B0;
  v2 = objc_msgSendSuper2(&v7, sel_hf_stateDumpBuilderWithContext_);
  uint64_t v6 = 0;
  v3 = objc_msgSend(a1, "hf_debugValueForData:", &v6);
  [v2 appendObject:v3 withName:@"decoded property list object"];

  v4 = NSStringFromNSPropertyListFormat(v6);
  [v2 appendObject:v4 withName:@"decoded property list format"];

  return v2;
}

@end