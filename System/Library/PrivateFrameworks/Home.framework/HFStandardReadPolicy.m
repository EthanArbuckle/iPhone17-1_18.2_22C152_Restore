@interface HFStandardReadPolicy
- (HFStandardReadPolicy)init;
- (HFStandardReadPolicy)initWithPolicies:(id)a3;
@end

@implementation HFStandardReadPolicy

- (HFStandardReadPolicy)init
{
  v9[2] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v9[0] = v3;
  v4 = objc_opt_new();
  v9[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  v8.receiver = self;
  v8.super_class = (Class)HFStandardReadPolicy;
  v6 = [(HFAggregatedCharacteristicReadPolicy *)&v8 initWithPolicies:v5];

  return v6;
}

- (HFStandardReadPolicy)initWithPolicies:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_init);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCharacteristicReadPolicy.m", 179, @"%s is unavailable; use %@ instead",
    "-[HFStandardReadPolicy initWithPolicies:]",
    v6);

  return 0;
}

@end